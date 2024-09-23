@implementation PIParallaxStyleNumberParameter

- (PIParallaxStyleNumberParameter)init
{
  return -[PIParallaxStyleNumberParameter initWithNumber:](self, "initWithNumber:", &unk_1E5051460);
}

- (PIParallaxStyleNumberParameter)initWithNumber:(id)a3
{
  return -[PIParallaxStyleNumberParameter initWithNumber:unit:](self, "initWithNumber:unit:", a3, CFSTR("none"));
}

- (PIParallaxStyleNumberParameter)initWithNumber:(id)a3 unit:(id)a4
{
  NSNumber *v6;
  NSString *v7;
  PIParallaxStyleNumberParameter *v8;
  NSNumber *numberValue;
  NSNumber *v10;
  NSString *unit;
  objc_super v13;

  v6 = (NSNumber *)a3;
  v7 = (NSString *)a4;
  v13.receiver = self;
  v13.super_class = (Class)PIParallaxStyleNumberParameter;
  v8 = -[PIParallaxStyleNumberParameter init](&v13, sel_init);
  numberValue = v8->_numberValue;
  v8->_numberValue = v6;
  v10 = v6;

  unit = v8->_unit;
  v8->_unit = v7;

  return v8;
}

- (id)type
{
  return CFSTR("number");
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
  char v13;

  v4 = a3;
  objc_msgSend(v4, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("number"));

  if (v6)
  {
    v7 = v4;
    -[PIParallaxStyleNumberParameter unit](self, "unit");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "unit");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToString:", v9);

    if (v10)
    {
      -[PIParallaxStyleNumberParameter numberValue](self, "numberValue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "numberValue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqualToNumber:", v12);

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)evaluateWithContext:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  double v18;
  double v19;

  v5 = a3;
  -[PIParallaxStyleNumberParameter unit](self, "unit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("pixels"));

  if (v7)
  {
    -[PIParallaxStyleNumberParameter numberValue](self, "numberValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    v10 = v9;

    objc_msgSend(v5, "renderScale");
    v11 = (void *)MEMORY[0x1E0CB37E8];
    v13 = v10 * v12;
LABEL_5:
    objc_msgSend(v11, "numberWithDouble:", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  -[PIParallaxStyleNumberParameter unit](self, "unit");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("degrees"));

  -[PIParallaxStyleNumberParameter numberValue](self, "numberValue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v15)
  {
    objc_msgSend(v16, "doubleValue");
    v19 = v18;

    v13 = v19 / 180.0 * 3.14159265;
    v11 = (void *)MEMORY[0x1E0CB37E8];
    goto LABEL_5;
  }
LABEL_6:

  return v17;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PIParallaxStyleNumberParameter numberValue](self, "numberValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIParallaxStyleNumberParameter unit](self, "unit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("(%@, unit: %@) "), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSNumber)numberValue
{
  return self->_numberValue;
}

- (NSString)unit
{
  return self->_unit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unit, 0);
  objc_storeStrong((id *)&self->_numberValue, 0);
}

@end
