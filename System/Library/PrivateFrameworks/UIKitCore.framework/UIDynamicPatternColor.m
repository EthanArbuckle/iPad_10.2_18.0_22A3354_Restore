@implementation UIDynamicPatternColor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
}

- (id)_resolvedColorWithTraitCollection:(id)a3
{
  UIImage *image;
  void *v5;
  id v6;
  void *v7;
  CGColor *v8;
  UIColor *v9;

  image = self->_image;
  if (a3)
    v5 = (void *)objc_msgSend(a3, "imageConfiguration");
  else
    v5 = 0;
  v6 = v5;
  -[UIImage imageWithConfiguration:](image, "imageWithConfiguration:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (CGColor *)objc_msgSend(v7, "_tiledPatternColor");
  if (!v8)
    v8 = -[UIImage _tiledPatternColor](self->_image, "_tiledPatternColor");
  v9 = -[UIColor initWithCGColor:]([UIColor alloc], "initWithCGColor:", v8);

  return v9;
}

- (UIDynamicPatternColor)initWithPatternImage:(id)a3
{
  id v5;
  void *v6;
  UIDynamicPatternColor *v7;
  UIDynamicPatternColor *v8;
  UIDynamicPatternColor *v9;
  objc_super v11;

  v5 = a3;
  v6 = v5;
  if (v5 && objc_msgSend(v5, "_tiledPatternColor"))
  {
    v11.receiver = self;
    v11.super_class = (Class)UIDynamicPatternColor;
    v7 = -[UIDynamicPatternColor init](&v11, sel_init);
    v8 = v7;
    if (v7)
      objc_storeStrong((id *)&v7->_image, a3);
    self = v8;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  UIDynamicPatternColor *v4;
  BOOL v5;

  v4 = (UIDynamicPatternColor *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[UIImage isEqual:](self->_image, "isEqual:", v4->_image);
  }

  return v5;
}

- (unint64_t)hash
{
  return -[UIImage hash](self->_image, "hash");
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; image = %@>"), v5, self, self->_image);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
