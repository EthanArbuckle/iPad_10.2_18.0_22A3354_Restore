@implementation UICIColor

- (UICIColor)initWithCIColor:(id)a3
{
  id v5;
  UICIColor *v6;
  UICIColor *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UICIColor;
  v6 = -[UICIColor init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    if (v5)
    {
      objc_storeStrong((id *)&v6->_ciColor, a3);
    }
    else
    {

      v7 = 0;
    }
  }

  return v7;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[CIColor red](self->_ciColor, "red");
  v5 = v4;
  -[CIColor green](self->_ciColor, "green");
  v7 = v6;
  -[CIColor blue](self->_ciColor, "blue");
  v9 = v8;
  -[CIColor alpha](self->_ciColor, "alpha");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("CIColor %g %g %g %g"), v5, v7, v9, v10);
}

- (id)_rgbColor
{
  id *v1;
  CGColorSpace *v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGColor *v7;
  UICGColor *v8;
  id v9;
  UIDeviceRGBColor *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  id v19;
  CGFloat components[5];

  components[4] = *(CGFloat *)MEMORY[0x1E0C80C00];
  if (a1)
  {
    v1 = a1;
    if (!a1[4])
    {
      v2 = (CGColorSpace *)objc_msgSend(a1[3], "colorSpace");
      if (qword_1ECD7C4C0 != -1)
        dispatch_once(&qword_1ECD7C4C0, &__block_literal_global_1675);
      if (v2 == (CGColorSpace *)qword_1ECD7C4B8)
      {
        v10 = [UIDeviceRGBColor alloc];
        objc_msgSend(v1[3], "red");
        v12 = v11;
        objc_msgSend(v1[3], "green");
        v14 = v13;
        objc_msgSend(v1[3], "blue");
        v16 = v15;
        objc_msgSend(v1[3], "alpha");
        v18 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:](v10, "initWithRed:green:blue:alpha:", v12, v14, v16, v17);
        v19 = v1[4];
        v1[4] = (id)v18;

      }
      else
      {
        objc_msgSend(v1[3], "red");
        components[0] = v3;
        objc_msgSend(v1[3], "green");
        components[1] = v4;
        objc_msgSend(v1[3], "blue");
        components[2] = v5;
        objc_msgSend(v1[3], "alpha");
        components[3] = v6;
        v7 = CGColorCreate(v2, components);
        v8 = -[UICGColor initWithCGColor:]([UICGColor alloc], "initWithCGColor:", v7);
        v9 = v1[4];
        v1[4] = v8;

        CGColorRelease(v7);
      }
    }
    a1 = (id *)v1[4];
  }
  return a1;
}

- (void)set
{
  id v2;

  -[UICIColor _rgbColor]((id *)&self->super.super.isa);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "set");

}

- (void)setFill
{
  id v2;

  -[UICIColor _rgbColor]((id *)&self->super.super.isa);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFill");

}

- (void)setStroke
{
  id v2;

  -[UICIColor _rgbColor]((id *)&self->super.super.isa);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setStroke");

}

- (UICIColor)colorWithAlphaComponent:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  -[CIColor red](self->_ciColor, "red");
  v6 = v5;
  -[CIColor green](self->_ciColor, "green");
  v8 = v7;
  -[CIColor blue](self->_ciColor, "blue");
  return (UICIColor *)+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", v6, v8, v9, a3);
}

- (CGColor)CGColor
{
  id v2;
  CGColor *v3;

  -[UICIColor _rgbColor]((id *)&self->super.super.isa);
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = (CGColor *)objc_msgSend(v2, "CGColor");

  return v3;
}

- (id)CIColor
{
  return self->_ciColor;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = -[CIColor isEqual:](self->_ciColor, "isEqual:", v4);
  else
    v5 = 0;

  return v5;
}

- (unint64_t)hash
{
  return -[CIColor hash](self->_ciColor, "hash");
}

- (BOOL)getRed:(double *)a3 green:(double *)a4 blue:(double *)a5 alpha:(double *)a6
{
  void *v10;

  -[UICIColor _rgbColor]((id *)&self->super.super.isa);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = objc_msgSend(v10, "getRed:green:blue:alpha:", a3, a4, a5, a6);

  return (char)a6;
}

- (BOOL)getWhite:(double *)a3 alpha:(double *)a4
{
  void *v6;

  -[UICIColor _rgbColor]((id *)&self->super.super.isa);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v6, "getWhite:alpha:", a3, a4);

  return (char)a4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rgbColor, 0);
  objc_storeStrong((id *)&self->_ciColor, 0);
}

@end
