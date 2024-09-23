@implementation PIParallaxStylePointParameter

- (PIParallaxStylePointParameter)init
{
  return -[PIParallaxStylePointParameter initWithX:Y:](self, "initWithX:Y:", &unk_1E5051D68, &unk_1E5051D68);
}

- (PIParallaxStylePointParameter)initWithX:(id)a3 Y:(id)a4
{
  return -[PIParallaxStylePointParameter initWithX:Y:unit:](self, "initWithX:Y:unit:", a3, a4, CFSTR("none"));
}

- (PIParallaxStylePointParameter)initWithX:(id)a3 Y:(id)a4 unit:(id)a5
{
  NSNumber *v8;
  NSNumber *v9;
  NSString *v10;
  PIParallaxStylePointParameter *v11;
  NSNumber *xValue;
  NSNumber *v13;
  NSNumber *yValue;
  NSNumber *v15;
  NSString *unit;
  objc_super v18;

  v8 = (NSNumber *)a3;
  v9 = (NSNumber *)a4;
  v10 = (NSString *)a5;
  v18.receiver = self;
  v18.super_class = (Class)PIParallaxStylePointParameter;
  v11 = -[PIParallaxStylePointParameter init](&v18, sel_init);
  xValue = v11->_xValue;
  v11->_xValue = v8;
  v13 = v8;

  yValue = v11->_yValue;
  v11->_yValue = v9;
  v15 = v9;

  unit = v11->_unit;
  v11->_unit = v10;

  return v11;
}

- (id)type
{
  return CFSTR("point");
}

- (BOOL)isEqualToParallaxStyleParameter:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  char v16;

  v4 = a3;
  objc_msgSend(v4, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("point"));

  if (v6)
  {
    v7 = v4;
    -[PIParallaxStylePointParameter unit](self, "unit");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "unit");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToString:", v9);

    if (v10
      && (-[PIParallaxStylePointParameter xValue](self, "xValue"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v7, "xValue"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = objc_msgSend(v11, "isEqualToNumber:", v12),
          v12,
          v11,
          v13))
    {
      -[PIParallaxStylePointParameter yValue](self, "yValue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "yValue");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "isEqualToNumber:", v15);

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)evaluateWithContext:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;

  v5 = a3;
  -[PIParallaxStylePointParameter xValue](self, "xValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  -[PIParallaxStylePointParameter yValue](self, "yValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v11 = v10;

  -[PIParallaxStylePointParameter unit](self, "unit");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v12, "isEqualToString:", CFSTR("pixels"));

  if ((_DWORD)v9)
  {
    objc_msgSend(v5, "visibleRect");
    NUAbsolutePointInRect();
    v8 = v13;
    v11 = v14;
  }
  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:", v8, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PIParallaxStylePointParameter xValue](self, "xValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIParallaxStylePointParameter yValue](self, "yValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIParallaxStylePointParameter unit](self, "unit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("(X:%@, Y:%@, unit: %@)"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)xValue
{
  return self->_xValue;
}

- (NSNumber)yValue
{
  return self->_yValue;
}

- (NSString)unit
{
  return self->_unit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unit, 0);
  objc_storeStrong((id *)&self->_yValue, 0);
  objc_storeStrong((id *)&self->_xValue, 0);
}

@end
