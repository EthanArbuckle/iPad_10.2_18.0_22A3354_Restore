@implementation _UIAnimatingLabel

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  v5 = v4;
  if (self->_shouldAnimateVariantWeight && (objc_msgSend(v4, "isEqualToString:", CFSTR("variantWeight")) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)_UIAnimatingLabel;
    v6 = -[UIView _shouldAnimatePropertyWithKey:](&v8, sel__shouldAnimatePropertyWithKey_, v5);
  }

  return v6;
}

- (void)setFont:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;
  uint64_t v12;
  void *v13;
  char isKindOfClass;
  void *v15;
  void *v16;
  uint64_t v17;
  objc_super v18;

  v4 = a3;
  -[UILabel font](self, "font");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "familyName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "familyName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", v7))
  {
    objc_msgSend(v5, "pointSize");
    v9 = v8;
    objc_msgSend(v4, "pointSize");
    v11 = v9 == v10;
  }
  else
  {
    v11 = 0;
  }
  self->_shouldAnimateVariantWeight = v11;

  v12 = objc_msgSend(v4, "_variantWeight");
  -[UIView layer](self, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[UIView layer](self, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
      v17 = 400;
    else
      v17 = v12;
    objc_msgSend(v15, "setVariantWeight:", v17);

  }
  v18.receiver = self;
  v18.super_class = (Class)_UIAnimatingLabel;
  -[UILabel setFont:](&v18, sel_setFont_, v4);

}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;
  objc_super v13;
  objc_super v14;
  objc_super v15;

  v6 = a3;
  -[UIView layer](self, "layer");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6)
  {
    v12.receiver = self;
    v12.super_class = (Class)_UIAnimatingLabel;
    -[UIView drawLayer:inContext:](&v12, sel_drawLayer_inContext_, v6, a4);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = objc_msgSend(v6, "variantWeight");
      -[UILabel font](self, "font");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_fontWithVariantWeight:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15.receiver = self;
      v15.super_class = (Class)_UIAnimatingLabel;
      -[UILabel setFont:](&v15, sel_setFont_, v10);

      -[UIView layer](self, "layer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14.receiver = self;
      v14.super_class = (Class)_UIAnimatingLabel;
      -[UIView drawLayer:inContext:](&v14, sel_drawLayer_inContext_, v11, a4);

      v13.receiver = self;
      v13.super_class = (Class)_UIAnimatingLabel;
      -[UILabel setFont:](&v13, sel_setFont_, v9);

    }
  }

}

@end
