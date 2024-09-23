@implementation BKFlowingBookPlistConfigurationEnvironment

- (void)setLargeSizeFactor:(double)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[BKFlowingBookPlistConfigurationEnvironment fontSizeConfiguration](self, "fontSizeConfiguration"));
  objc_msgSend(v4, "setLargeSizeFactor:", a3);

}

- (int64_t)_semanticFontSize
{
  double v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;

  -[BKFlowingBookPlistConfigurationEnvironment fontSize](self, "fontSize");
  if (v3 == 0.0)
    return 0;
  -[BKFlowingBookPlistConfigurationEnvironment fontSize](self, "fontSize");
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKFlowingBookPlistConfigurationEnvironment fontSizeConfiguration](self, "fontSizeConfiguration"));
  objc_msgSend(v6, "smallSize");
  v8 = v7;

  if (v5 < v8)
    return 0;
  -[BKFlowingBookPlistConfigurationEnvironment fontSize](self, "fontSize");
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKFlowingBookPlistConfigurationEnvironment fontSizeConfiguration](self, "fontSizeConfiguration"));
  objc_msgSend(v12, "mediumSize");
  v14 = v13;

  if (v11 < v14)
    return 1;
  -[BKFlowingBookPlistConfigurationEnvironment fontSize](self, "fontSize");
  v16 = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKFlowingBookPlistConfigurationEnvironment fontSizeConfiguration](self, "fontSizeConfiguration"));
  objc_msgSend(v17, "largeSize");
  v19 = v18;

  if (v16 >= v19)
    return 3;
  else
    return 2;
}

- (id)valueForKey:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  __CFString *v7;
  id v8;
  objc_super v10;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("scroll")))
  {
    v5 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[BKFlowingBookPlistConfigurationEnvironment scroll](self, "scroll")));
LABEL_7:
    v7 = (__CFString *)v5;
    goto LABEL_8;
  }
  if (!objc_msgSend(v4, "isEqualToString:", CFSTR("fontsize")))
  {
    v10.receiver = self;
    v10.super_class = (Class)BKFlowingBookPlistConfigurationEnvironment;
    v8 = -[BKFlowingBookPlistConfigurationEnvironment valueForKey:](&v10, "valueForKey:", v4);
    v5 = objc_claimAutoreleasedReturnValue(v8);
    goto LABEL_7;
  }
  v6 = -[BKFlowingBookPlistConfigurationEnvironment _semanticFontSize](self, "_semanticFontSize");
  if (v6 > 3)
    v7 = 0;
  else
    v7 = off_1BF9D8[v6];
LABEL_8:

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKFlowingBookPlistConfigurationEnvironment;
  v4 = -[BKFlowingBookPlistConfigurationEnvironment copyWithZone:](&v6, "copyWithZone:", a3);
  objc_msgSend(v4, "setScroll:", -[BKFlowingBookPlistConfigurationEnvironment scroll](self, "scroll"));
  -[BKFlowingBookPlistConfigurationEnvironment fontSize](self, "fontSize");
  objc_msgSend(v4, "setFontSize:");
  return v4;
}

- (BOOL)isEqualToFlowingBookPlistConfigurationEnvironment:(id)a3
{
  id *v4;
  unsigned int v5;
  double v6;
  double v7;
  double v8;
  BKFlowingBookFontSizeConfiguration **p_fontSizeConfiguration;
  id WeakRetained;
  id v11;
  id v12;
  id v13;
  unsigned __int8 v14;

  v4 = (id *)a3;
  v5 = -[BKFlowingBookPlistConfigurationEnvironment scroll](self, "scroll");
  if (v5 == objc_msgSend(v4, "scroll")
    && (-[BKFlowingBookPlistConfigurationEnvironment fontSize](self, "fontSize"),
        v7 = v6,
        objc_msgSend(v4, "fontSize"),
        v7 == v8))
  {
    p_fontSizeConfiguration = &self->_fontSizeConfiguration;
    WeakRetained = objc_loadWeakRetained((id *)&self->_fontSizeConfiguration);
    v11 = objc_loadWeakRetained(v4 + 3);
    if (WeakRetained == v11)
    {
      v14 = 1;
    }
    else
    {
      v12 = objc_loadWeakRetained((id *)p_fontSizeConfiguration);
      v13 = objc_loadWeakRetained(v4 + 3);
      v14 = objc_msgSend(v12, "isEqual:", v13);

    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  BKFlowingBookPlistConfigurationEnvironment *v4;
  uint64_t v5;
  BOOL v6;
  objc_super v8;

  v4 = (BKFlowingBookPlistConfigurationEnvironment *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class(BKFlowingBookPlistConfigurationEnvironment);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0
      && (v8.receiver = self,
          v8.super_class = (Class)BKFlowingBookPlistConfigurationEnvironment,
          -[BKFlowingBookPlistConfigurationEnvironment isEqual:](&v8, "isEqual:", v4)))
    {
      v6 = -[BKFlowingBookPlistConfigurationEnvironment isEqualToFlowingBookPlistConfigurationEnvironment:](self, "isEqualToFlowingBookPlistConfigurationEnvironment:", v4);
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (BOOL)scroll
{
  return self->_scroll;
}

- (void)setScroll:(BOOL)a3
{
  self->_scroll = a3;
}

- (double)fontSize
{
  return self->_fontSize;
}

- (void)setFontSize:(double)a3
{
  self->_fontSize = a3;
}

- (BKFlowingBookFontSizeConfiguration)fontSizeConfiguration
{
  return (BKFlowingBookFontSizeConfiguration *)objc_loadWeakRetained((id *)&self->_fontSizeConfiguration);
}

- (void)setFontSizeConfiguration:(id)a3
{
  objc_storeWeak((id *)&self->_fontSizeConfiguration, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_fontSizeConfiguration);
}

@end
