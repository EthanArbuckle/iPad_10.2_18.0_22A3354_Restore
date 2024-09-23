@implementation UIStatusBarStyleRequest

- (unint64_t)hash
{
  int64_t v3;
  unint64_t v4;

  v3 = 1000 * self->_legibilityStyle + 31000 * self->_style;
  v4 = -[UIColor hash](self->_foregroundColor, "hash") - v3 + 32 * v3;
  return -[NSNumber hash](self->_overrideHeight, "hash") - v4 + 32 * v4 + 923521;
}

- (UIStatusBarStyleRequest)initWithStyle:(int64_t)a3 legibilityStyle:(int64_t)a4 foregroundColor:(id)a5
{
  return -[UIStatusBarStyleRequest initWithStyle:legibilityStyle:foregroundColor:foregroundAlpha:overrideHeight:](self, "initWithStyle:legibilityStyle:foregroundColor:foregroundAlpha:overrideHeight:", a3, a4, a5, 0, 1.0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideHeight, 0);
  objc_storeStrong((id *)&self->_foregroundColor, 0);
}

- (UIStatusBarStyleRequest)initWithStyle:(int64_t)a3 legibilityStyle:(int64_t)a4 foregroundColor:(id)a5 foregroundAlpha:(double)a6 overrideHeight:(id)a7
{
  id v13;
  id v14;
  UIStatusBarStyleRequest *v15;
  UIStatusBarStyleRequest *v16;
  objc_super v18;

  v13 = a5;
  v14 = a7;
  v18.receiver = self;
  v18.super_class = (Class)UIStatusBarStyleRequest;
  v15 = -[UIStatusBarStyleRequest init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_style = a3;
    v15->_legibilityStyle = a4;
    objc_storeStrong((id *)&v15->_foregroundColor, a5);
    objc_storeStrong((id *)&v16->_overrideHeight, a7);
    v16->_foregroundAlpha = a6;
  }

  return v16;
}

- (UIStatusBarStyleRequest)initWithStyle:(int64_t)a3 legibilityStyle:(int64_t)a4 foregroundColor:(id)a5 overrideHeight:(id)a6
{
  return -[UIStatusBarStyleRequest initWithStyle:legibilityStyle:foregroundColor:foregroundAlpha:overrideHeight:](self, "initWithStyle:legibilityStyle:foregroundColor:foregroundAlpha:overrideHeight:", a3, a4, a5, a6, 1.0);
}

- (BOOL)isDoubleHeight
{
  void *v2;
  char v3;

  +[UIStatusBar _styleAttributesForRequest:](UIStatusBar, "_styleAttributesForRequest:", self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDoubleHeight");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  id v6;
  int64_t style;
  int64_t legibilityStyle;
  UIColor *foregroundColor;
  UIColor *v10;
  UIColor *v11;
  BOOL v12;
  NSNumber *overrideHeight;
  uint64_t v14;
  void *v15;
  NSNumber *v16;
  void *v17;
  double v18;
  double v19;
  double foregroundAlpha;
  double v21;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    style = self->_style;
    if (style != objc_msgSend(v6, "style")
      || (legibilityStyle = self->_legibilityStyle, legibilityStyle != objc_msgSend(v6, "legibilityStyle")))
    {
      v12 = 0;
LABEL_17:

      goto LABEL_18;
    }
    foregroundColor = self->_foregroundColor;
    objc_msgSend(v6, "foregroundColor");
    v10 = (UIColor *)objc_claimAutoreleasedReturnValue();
    if (foregroundColor == v10
      || (v11 = self->_foregroundColor,
          objc_msgSend(v6, "foregroundColor"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          -[UIColor isEqual:](v11, "isEqual:", v3)))
    {
      overrideHeight = self->_overrideHeight;
      objc_msgSend(v6, "overrideHeight");
      v14 = objc_claimAutoreleasedReturnValue();
      if (overrideHeight == (NSNumber *)v14)
      {
        foregroundAlpha = self->_foregroundAlpha;
        objc_msgSend(v6, "foregroundAlpha");
        v12 = foregroundAlpha == v21;

      }
      else
      {
        v15 = (void *)v14;
        v16 = self->_overrideHeight;
        objc_msgSend(v6, "overrideHeight");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if ((-[NSNumber isEqual:](v16, "isEqual:", v17) & 1) != 0)
        {
          v18 = self->_foregroundAlpha;
          objc_msgSend(v6, "foregroundAlpha");
          v12 = v18 == v19;

        }
        else
        {

          v12 = 0;
        }
      }
      if (foregroundColor == v10)
        goto LABEL_16;
    }
    else
    {
      v12 = 0;
    }

LABEL_16:
    goto LABEL_17;
  }
  v12 = 0;
LABEL_18:

  return v12;
}

- (int64_t)legibilityStyle
{
  return self->_legibilityStyle;
}

- (UIColor)foregroundColor
{
  return self->_foregroundColor;
}

- (int64_t)style
{
  return self->_style;
}

- (NSNumber)overrideHeight
{
  return self->_overrideHeight;
}

- (double)foregroundAlpha
{
  return self->_foregroundAlpha;
}

- (UIStatusBarStyleRequest)initWithStyle:(int64_t)a3 legibilityStyle:(int64_t)a4 foregroundColor:(id)a5 foregroundAlpha:(double)a6
{
  return -[UIStatusBarStyleRequest initWithStyle:legibilityStyle:foregroundColor:foregroundAlpha:overrideHeight:](self, "initWithStyle:legibilityStyle:foregroundColor:foregroundAlpha:overrideHeight:", a3, a4, a5, 0, a6);
}

- (UIStatusBarStyleRequest)initWithStyle:(int64_t)a3 legacy:(BOOL)a4 legibilityStyle:(int64_t)a5 foregroundColor:(id)a6
{
  return -[UIStatusBarStyleRequest initWithStyle:legibilityStyle:foregroundColor:](self, "initWithStyle:legibilityStyle:foregroundColor:", a3, a5, a6);
}

- (UIStatusBarStyleRequest)initWithStyle:(int64_t)a3 legacy:(BOOL)a4 legibilityStyle:(int64_t)a5 foregroundColor:(id)a6 foregroundAlpha:(double)a7
{
  return -[UIStatusBarStyleRequest initWithStyle:legibilityStyle:foregroundColor:foregroundAlpha:](self, "initWithStyle:legibilityStyle:foregroundColor:foregroundAlpha:", a3, a5, a6, a7);
}

- (UIStatusBarStyleRequest)init
{
  return -[UIStatusBarStyleRequest initWithStyle:legibilityStyle:foregroundColor:](self, "initWithStyle:legibilityStyle:foregroundColor:", 0, 0, 0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[UIStatusBarStyleRequest _copyWithZone:class:](self, "_copyWithZone:class:", a3, objc_opt_class());
}

- (id)_copyWithZone:(_NSZone *)a3 class:(Class)a4
{
  objc_class *v5;
  int64_t v6;
  int64_t v7;
  void *v8;
  void *v9;
  double *v10;

  v5 = -[objc_class allocWithZone:](a4, "allocWithZone:", a3);
  v6 = -[UIStatusBarStyleRequest style](self, "style");
  v7 = -[UIStatusBarStyleRequest legibilityStyle](self, "legibilityStyle");
  -[UIStatusBarStyleRequest foregroundColor](self, "foregroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStatusBarStyleRequest overrideHeight](self, "overrideHeight");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[objc_class initWithStyle:legibilityStyle:foregroundColor:overrideHeight:](v5, "initWithStyle:legibilityStyle:foregroundColor:overrideHeight:", v6, v7, v8, v9);

  v10[5] = self->_foregroundAlpha;
  return v10;
}

- (BOOL)isTranslucent
{
  void *v2;
  char v3;

  +[UIStatusBar _styleAttributesForRequest:](UIStatusBar, "_styleAttributesForRequest:", self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isTranslucent");

  return v3;
}

- (BOOL)isLegacy
{
  return 0;
}

@end
