@implementation MTColorTheme

- (BOOL)isEqual:(id)a3
{
  MTColorTheme *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;

  v4 = (MTColorTheme *)a3;
  if (self == v4)
  {
    v20 = 1;
  }
  else
  {
    v5 = -[MTColorTheme isBackgroundLight](self, "isBackgroundLight");
    if (v5 != -[MTColorTheme isBackgroundLight](v4, "isBackgroundLight"))
      goto LABEL_6;
    -[MTColorTheme backgroundColor](self, "backgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "description");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTColorTheme backgroundColor](v4, "backgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "isEqual:", v9);

    if (!v10)
      goto LABEL_6;
    -[MTColorTheme primaryTextColor](self, "primaryTextColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "description");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTColorTheme primaryTextColor](v4, "primaryTextColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "description");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v12, "isEqual:", v14);

    if (v15)
    {
      -[MTColorTheme secondaryTextColor](self, "secondaryTextColor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "description");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[MTColorTheme secondaryTextColor](v4, "secondaryTextColor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "description");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v17, "isEqual:", v19);

    }
    else
    {
LABEL_6:
      v20 = 0;
    }
  }

  return v20;
}

- (BOOL)isBackgroundDark
{
  return !-[MTColorTheme isBackgroundLight](self, "isBackgroundLight");
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (UIColor)primaryTextColor
{
  return self->_primaryTextColor;
}

- (void)setPrimaryTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_primaryTextColor, a3);
}

- (UIColor)secondaryTextColor
{
  return self->_secondaryTextColor;
}

- (void)setSecondaryTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryTextColor, a3);
}

- (BOOL)isBackgroundLight
{
  return self->_isBackgroundLight;
}

- (void)setIsBackgroundLight:(BOOL)a3
{
  self->_isBackgroundLight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryTextColor, 0);
  objc_storeStrong((id *)&self->_primaryTextColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end
