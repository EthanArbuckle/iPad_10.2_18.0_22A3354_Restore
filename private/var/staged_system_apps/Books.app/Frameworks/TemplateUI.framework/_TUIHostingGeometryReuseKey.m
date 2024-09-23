@implementation _TUIHostingGeometryReuseKey

- (_TUIHostingGeometryReuseKey)initWithType:(id)a3 identifier:(id)a4 requestedSize:(CGSize)a5
{
  CGFloat height;
  CGFloat width;
  id v9;
  id v10;
  _TUIHostingGeometryReuseKey *v11;
  NSString *v12;
  NSString *type;
  NSString *v14;
  NSString *identifier;
  objc_super v17;

  height = a5.height;
  width = a5.width;
  v9 = a3;
  v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_TUIHostingGeometryReuseKey;
  v11 = -[_TUIHostingGeometryReuseKey init](&v17, "init");
  if (v11)
  {
    v12 = (NSString *)objc_msgSend(v9, "copy");
    type = v11->_type;
    v11->_type = v12;

    v14 = (NSString *)objc_msgSend(v10, "copy");
    identifier = v11->_identifier;
    v11->_identifier = v14;

    v11->_requestedSize.width = width;
    v11->_requestedSize.height = height;
  }

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_type, "hash");
  return -[NSString hash](self->_identifier, "hash") ^ v3 ^ (unint64_t)fmax(self->_requestedSize.width, 0.0) ^ (unint64_t)fmax(self->_requestedSize.height, 0.0);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;
  _QWORD *v8;
  BOOL v9;
  NSString *type;
  NSString *identifier;
  unsigned __int8 v12;

  v4 = a3;
  v5 = objc_opt_class(v4);
  if (v5 == objc_opt_class(_TUIHostingGeometryReuseKey))
    v6 = v4;
  else
    v6 = 0;
  v7 = v6;
  v8 = v7;
  if (v7
    && (self->_requestedSize.width == *((double *)v7 + 3)
      ? (v9 = self->_requestedSize.height == *((double *)v7 + 4))
      : (v9 = 0),
        v9
     && ((type = self->_type, type == (NSString *)v8[1]) || -[NSString isEqualToString:](type, "isEqualToString:"))))
  {
    identifier = self->_identifier;
    if (identifier == (NSString *)v8[2])
      v12 = 1;
    else
      v12 = -[NSString isEqualToString:](identifier, "isEqualToString:");
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (CGSize)requestedSize
{
  double width;
  double height;
  CGSize result;

  width = self->_requestedSize.width;
  height = self->_requestedSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end
