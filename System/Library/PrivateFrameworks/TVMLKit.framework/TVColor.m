@implementation TVColor

- (TVColor)initWithColor:(id)a3
{
  id v4;
  TVColor *v5;
  TVColor *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TVColor;
  v5 = -[TVColor init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_ikColor, v4);

  return v6;
}

- (UIColor)color
{
  void *v3;
  void *v4;

  if (-[TVColor colorType](self, "colorType") == 1)
  {
    -[TVColor ikColor](self, "ikColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "color");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (UIColor *)v4;
}

- (int64_t)colorType
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v11;
  uint64_t v12;

  -[TVColor ikColor](self, "ikColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "colorType");

  if (!v4)
    return 1;
  -[TVColor ikColor](self, "ikColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "colorType") != 3)
  {

    return 0;
  }
  -[TVColor ikColor](self, "ikColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "gradientType");

  if (v7 != 1)
    return 0;
  -[TVColor ikColor](self, "ikColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "gradientDirectionType");

  if (v9 == 1)
    return 2;
  -[TVColor ikColor](self, "ikColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "gradientDirectionType");

  if (v12 == 2)
    return 3;
  else
    return 0;
}

- (NSArray)gradientColors
{
  void *v3;
  void *v4;

  if ((-[TVColor colorType](self, "colorType") & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    -[TVColor ikColor](self, "ikColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "gradientColors");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (NSArray *)v4;
}

- (NSArray)gradientPoints
{
  void *v3;
  void *v4;

  if ((-[TVColor colorType](self, "colorType") & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    -[TVColor ikColor](self, "ikColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "gradientPoints");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (NSArray *)v4;
}

- (IKColor)ikColor
{
  return (IKColor *)objc_loadWeakRetained((id *)&self->_ikColor);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_ikColor);
}

@end
