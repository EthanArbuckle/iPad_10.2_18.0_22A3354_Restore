@implementation PIParallaxStyleModeParameter

- (PIParallaxStyleModeParameter)init
{
  return -[PIParallaxStyleModeParameter initWithMode:](self, "initWithMode:", &stru_1E501A310);
}

- (PIParallaxStyleModeParameter)initWithMode:(id)a3
{
  id v3;
  PIParallaxStyleModeParameter *v4;
  uint64_t v5;
  NSString *modeValue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PIParallaxStyleModeParameter;
  v3 = a3;
  v4 = -[PIParallaxStyleModeParameter init](&v8, sel_init);
  v5 = objc_msgSend(v3, "copy", v8.receiver, v8.super_class);

  modeValue = v4->_modeValue;
  v4->_modeValue = (NSString *)v5;

  return v4;
}

- (id)type
{
  return CFSTR("mode");
}

- (BOOL)isEqualToParallaxStyleParameter:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_msgSend(v4, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("mode"));

  if (v6)
  {
    v7 = v4;
    -[PIParallaxStyleModeParameter modeValue](self, "modeValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "modeValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v8, "isEqualToString:", v9);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[PIParallaxStyleModeParameter modeValue](self, "modeValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("(>%@)"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)modeValue
{
  return self->_modeValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeValue, 0);
}

@end
