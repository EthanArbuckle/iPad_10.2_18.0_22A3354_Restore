@implementation PXButtonSpec

- (PXButtonSpec)init
{
  PXButtonSpec *v2;
  PXButtonSpec *v3;
  uint64_t v4;
  UIColor *highlightedTextColor;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXButtonSpec;
  v2 = -[PXLabelSpec init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    -[PXLabelSpec setTextAlignment:](v2, "setTextAlignment:", 1);
    PXEdgeInsetsMake();
    -[PXLabelSpec setContentInsets:](v3, "setContentInsets:");
    -[PXLabelSpec textColor](v3, "textColor");
    v4 = objc_claimAutoreleasedReturnValue();
    highlightedTextColor = v3->_highlightedTextColor;
    v3->_highlightedTextColor = (UIColor *)v4;

  }
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXButtonSpec;
  v3 = -[PXLabelSpec hash](&v7, sel_hash);
  -[PXButtonSpec highlightedTextColor](self, "highlightedTextColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXButtonSpec;
  if (-[PXLabelSpec isEqual:](&v9, sel_isEqual_, v4))
  {
    objc_msgSend(v4, "highlightedTextColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXButtonSpec highlightedTextColor](self, "highlightedTextColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 == v6)
      v7 = 1;
    else
      v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXButtonSpec;
  v4 = -[PXLabelSpec copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 28, self->_highlightedTextColor);
  return v4;
}

- (UIColor)highlightedTextColor
{
  return self->_highlightedTextColor;
}

- (void)setHighlightedTextColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightedTextColor, 0);
}

@end
