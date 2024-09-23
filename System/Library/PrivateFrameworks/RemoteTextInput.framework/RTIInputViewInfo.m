@implementation RTIInputViewInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t contextId;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if ((objc_msgSend(v8, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The coder must allow keyed coding."));
  contextId = self->_contextId;
  if ((_DWORD)contextId)
    objc_msgSend(v8, "encodeInt32:forKey:", contextId, CFSTR("cid"));
  if (self->_size.width != *MEMORY[0x1E0C9D820] || self->_size.height != *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithSize:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("size"));

  }
  if (!NSEdgeInsetsEqual(self->_insets, *MEMORY[0x1E0CB2990]))
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithEdgeInsets:", self->_insets.top, self->_insets.left, self->_insets.bottom, self->_insets.right);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("insets"));

  }
  objc_msgSend(v8, "encodeBool:forKey:", self->_shouldShowDockView, CFSTR("dockView"));

}

- (RTIInputViewInfo)initWithCoder:(id)a3
{
  id v4;
  RTIInputViewInfo *v5;
  void *v6;
  void *v7;
  CGFloat v8;
  CGFloat v9;
  void *v10;
  void *v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  objc_super v17;

  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The decoder must allow keyed coding."));
  v17.receiver = self;
  v17.super_class = (Class)RTIInputViewInfo;
  v5 = -[RTIInputViewInfo init](&v17, sel_init);
  if (v5)
  {
    v5->_contextId = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("cid"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("size"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "sizeValue");
      v5->_size.width = v8;
      v5->_size.height = v9;
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("insets"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "edgeInsetsValue");
      v5->_insets.top = v12;
      v5->_insets.left = v13;
      v5->_insets.bottom = v14;
      v5->_insets.right = v15;
    }
    v5->_shouldShowDockView = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("dockView"));

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int128 v5;

  result = -[RTIInputViewInfo init](+[RTIInputViewInfo allocWithZone:](RTIInputViewInfo, "allocWithZone:", a3), "init");
  *((_DWORD *)result + 3) = self->_contextId;
  *((_OWORD *)result + 1) = self->_size;
  v5 = *(_OWORD *)&self->_insets.bottom;
  *((_OWORD *)result + 2) = *(_OWORD *)&self->_insets.top;
  *((_OWORD *)result + 3) = v5;
  *((_BYTE *)result + 8) = self->_shouldShowDockView;
  return result;
}

- (id)description
{
  void *v3;
  double v4;
  double v5;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSSize v16;
  NSEdgeInsets v17;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@: %p"), objc_opt_class(), self);
  if (-[RTIInputViewInfo contextId](self, "contextId"))
    objc_msgSend(v3, "appendFormat:", CFSTR("; contextId = %u"), -[RTIInputViewInfo contextId](self, "contextId"));
  -[RTIInputViewInfo size](self, "size");
  if (v5 != *MEMORY[0x1E0C9D820] || v4 != *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    -[RTIInputViewInfo size](self, "size");
    NSStringFromSize(v16);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; size = %@"), v7);

  }
  -[RTIInputViewInfo insets](self, "insets");
  if (!NSEdgeInsetsEqual(v17, *MEMORY[0x1E0CB2990]))
  {
    -[RTIInputViewInfo insets](self, "insets");
    v9 = v8;
    -[RTIInputViewInfo insets](self, "insets");
    v11 = v10;
    -[RTIInputViewInfo insets](self, "insets");
    v13 = v12;
    -[RTIInputViewInfo insets](self, "insets");
    objc_msgSend(v3, "appendFormat:", CFSTR("; insets = {%f, %f, %f, %f}"), v9, v11, v13, v14);
  }
  if (-[RTIInputViewInfo shouldShowDockView](self, "shouldShowDockView"))
    objc_msgSend(v3, "appendFormat:", CFSTR("; shouldShowDockView = YES"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  RTIInputViewInfo *v4;
  RTIInputViewInfo *v5;
  unsigned int v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _BOOL4 v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  _BOOL4 v26;
  NSEdgeInsets v28;
  NSEdgeInsets v29;

  v4 = (RTIInputViewInfo *)a3;
  if (v4 == self)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[RTIInputViewInfo contextId](self, "contextId");
      if (v6 != -[RTIInputViewInfo contextId](v5, "contextId"))
        goto LABEL_10;
      -[RTIInputViewInfo size](self, "size");
      v8 = v7;
      v10 = v9;
      -[RTIInputViewInfo size](v5, "size");
      LOBYTE(v12) = 0;
      if (v8 != v13 || v10 != v11)
        goto LABEL_11;
      -[RTIInputViewInfo insets](self, "insets");
      v15 = v14;
      v17 = v16;
      v19 = v18;
      v21 = v20;
      -[RTIInputViewInfo insets](v5, "insets");
      v29.top = v22;
      v29.left = v23;
      v29.bottom = v24;
      v29.right = v25;
      v28.top = v15;
      v28.left = v17;
      v28.bottom = v19;
      v28.right = v21;
      if (NSEdgeInsetsEqual(v28, v29))
      {
        v26 = -[RTIInputViewInfo shouldShowDockView](self, "shouldShowDockView");
        v12 = v26 ^ -[RTIInputViewInfo shouldShowDockView](v5, "shouldShowDockView") ^ 1;
      }
      else
      {
LABEL_10:
        LOBYTE(v12) = 0;
      }
LABEL_11:

      goto LABEL_12;
    }
    LOBYTE(v12) = 0;
  }
LABEL_12:

  return v12;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (NSEdgeInsets)insets
{
  double top;
  double left;
  double bottom;
  double right;
  NSEdgeInsets result;

  top = self->_insets.top;
  left = self->_insets.left;
  bottom = self->_insets.bottom;
  right = self->_insets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setInsets:(NSEdgeInsets)a3
{
  self->_insets = a3;
}

- (unsigned)contextId
{
  return self->_contextId;
}

- (void)setContextId:(unsigned int)a3
{
  self->_contextId = a3;
}

- (BOOL)shouldShowDockView
{
  return self->_shouldShowDockView;
}

- (void)setShouldShowDockView:(BOOL)a3
{
  self->_shouldShowDockView = a3;
}

@end
