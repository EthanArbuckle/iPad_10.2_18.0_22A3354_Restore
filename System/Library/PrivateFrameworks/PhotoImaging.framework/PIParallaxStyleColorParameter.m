@implementation PIParallaxStyleColorParameter

- (PIParallaxStyleColorParameter)init
{
  return -[PIParallaxStyleColorParameter initWithRed:green:blue:alpha:](self, "initWithRed:green:blue:alpha:", &unk_1E5051460, &unk_1E5051460, &unk_1E5051460, &unk_1E5051478);
}

- (PIParallaxStyleColorParameter)initWithRed:(id)a3 green:(id)a4 blue:(id)a5 alpha:(id)a6
{
  NSNumber *v10;
  NSNumber *v11;
  NSNumber *v12;
  NSNumber *v13;
  PIParallaxStyleColorParameter *v14;
  NSNumber *redValue;
  NSNumber *v16;
  NSNumber *greenValue;
  NSNumber *v18;
  NSNumber *blueValue;
  NSNumber *v20;
  NSNumber *alphaValue;
  objc_super v23;

  v10 = (NSNumber *)a3;
  v11 = (NSNumber *)a4;
  v12 = (NSNumber *)a5;
  v13 = (NSNumber *)a6;
  v23.receiver = self;
  v23.super_class = (Class)PIParallaxStyleColorParameter;
  v14 = -[PIParallaxStyleColorParameter init](&v23, sel_init);
  redValue = v14->_redValue;
  v14->_redValue = v10;
  v16 = v10;

  greenValue = v14->_greenValue;
  v14->_greenValue = v11;
  v18 = v11;

  blueValue = v14->_blueValue;
  v14->_blueValue = v12;
  v20 = v12;

  alphaValue = v14->_alphaValue;
  v14->_alphaValue = v13;

  return v14;
}

- (id)type
{
  return CFSTR("color");
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
  int v16;
  void *v17;
  void *v18;
  char v19;

  v4 = a3;
  objc_msgSend(v4, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("color"));

  if (v6)
  {
    v7 = v4;
    -[PIParallaxStyleColorParameter redValue](self, "redValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "redValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToNumber:", v9);

    if (!v10)
      goto LABEL_7;
    -[PIParallaxStyleColorParameter greenValue](self, "greenValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "greenValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqualToNumber:", v12);

    if (!v13)
      goto LABEL_7;
    -[PIParallaxStyleColorParameter blueValue](self, "blueValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "blueValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqualToNumber:", v15);

    if (v16)
    {
      -[PIParallaxStyleColorParameter alphaValue](self, "alphaValue");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "alphaValue");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "isEqualToNumber:", v18);

    }
    else
    {
LABEL_7:
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)evaluateWithContext:(id)a3 error:(id *)a4
{
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  CGColorSpace *v17;
  void *v18;

  -[PIParallaxStyleColorParameter redValue](self, "redValue", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  -[PIParallaxStyleColorParameter greenValue](self, "greenValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  -[PIParallaxStyleColorParameter blueValue](self, "blueValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v13 = v12;

  -[PIParallaxStyleColorParameter alphaValue](self, "alphaValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValue");
  v16 = v15;

  v17 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D960]);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DD80]), "initWithRed:green:blue:alpha:colorSpace:", v17, v7, v10, v13, v16);
  CGColorSpaceRelease(v17);
  return v18;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PIParallaxStyleColorParameter redValue](self, "redValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIParallaxStyleColorParameter greenValue](self, "greenValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIParallaxStyleColorParameter blueValue](self, "blueValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIParallaxStyleColorParameter alphaValue](self, "alphaValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("(R:%@, G:%@, B:%@, A:%@)"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSNumber)redValue
{
  return self->_redValue;
}

- (NSNumber)greenValue
{
  return self->_greenValue;
}

- (NSNumber)blueValue
{
  return self->_blueValue;
}

- (NSNumber)alphaValue
{
  return self->_alphaValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alphaValue, 0);
  objc_storeStrong((id *)&self->_blueValue, 0);
  objc_storeStrong((id *)&self->_greenValue, 0);
  objc_storeStrong((id *)&self->_redValue, 0);
}

@end
