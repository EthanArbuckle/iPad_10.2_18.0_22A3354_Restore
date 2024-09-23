@implementation _UIOHypogeanViewHandle

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIOHypogeanViewHandle)initWithCoder:(id)a3
{
  id v4;
  _UIOHypogeanViewHandle *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSString *uniqueIdentifier;
  void *v10;
  void *v11;
  void *v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;

  v4 = a3;
  v5 = -[_UIOHypogeanViewHandle init](self, "init");
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_uniqueIdentifier);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSString *)v8;

    NSStringFromSelector(sel_renderId);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_renderId = objc_msgSend(v4, "decodeInt64ForKey:", v10);

    NSStringFromSelector(sel_contextId);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_contextId = objc_msgSend(v4, "decodeInt32ForKey:", v11);

    NSStringFromSelector(sel_bounds);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeCGRectForKey:", v12);
    v5->_bounds.origin.x = v13;
    v5->_bounds.origin.y = v14;
    v5->_bounds.size.width = v15;
    v5->_bounds.size.height = v16;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *uniqueIdentifier;
  id v5;
  void *v6;
  unint64_t renderId;
  void *v8;
  uint64_t contextId;
  void *v10;
  id v11;

  uniqueIdentifier = self->_uniqueIdentifier;
  v5 = a3;
  NSStringFromSelector(sel_uniqueIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", uniqueIdentifier, v6);

  renderId = self->_renderId;
  NSStringFromSelector(sel_renderId);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeInt64:forKey:", renderId, v8);

  contextId = self->_contextId;
  NSStringFromSelector(sel_contextId);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeInt32:forKey:", contextId, v10);

  NSStringFromSelector(sel_bounds);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeCGRect:forKey:", v11, self->_bounds.origin.x, self->_bounds.origin.y, self->_bounds.size.width, self->_bounds.size.height);

}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)renderId
{
  return self->_renderId;
}

- (void)setRenderId:(unint64_t)a3
{
  self->_renderId = a3;
}

- (unsigned)contextId
{
  return self->_contextId;
}

- (void)setContextId:(unsigned int)a3
{
  self->_contextId = a3;
}

- (CGRect)bounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_bounds.origin.x;
  y = self->_bounds.origin.y;
  width = self->_bounds.size.width;
  height = self->_bounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  self->_bounds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end
