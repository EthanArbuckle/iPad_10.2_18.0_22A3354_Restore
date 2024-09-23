@implementation PRUISPosterTitleStyleAttributes

- (PRUISPosterTitleStyleAttributes)initWithPRPosterTitleStyleConfiguration:(id)a3 extensionBundleURL:(id)a4 role:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  PRUISPosterTitleStyleAttributes *v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "effectiveTitleColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "color");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE74E30], "defaultTitleColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "color");
    v14 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v8, "effectiveTimeFontWithExtensionBundleURL:forRole:", v9, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    v18 = v16;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE74E30], "defaultTitleFontForRole:", v10);
    v18 = (id)objc_claimAutoreleasedReturnValue();
  }
  v19 = v18;

  objc_msgSend(v8, "vibrancyConfigurationWithExtensionBundleURL:", v9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[PRUISPosterTitleStyleAttributes initWithTitleColor:titleFont:preferredTitleAlignment:preferredTitleLayout:vibrancyConfiguration:](self, "initWithTitleColor:titleFont:preferredTitleAlignment:preferredTitleLayout:vibrancyConfiguration:", v14, v19, objc_msgSend(v8, "preferredTitleAlignment"), objc_msgSend(v8, "preferredTitleLayout"), v20);

  return v21;
}

- (PRUISPosterTitleStyleAttributes)initWithTitleColor:(id)a3 titleFont:(id)a4 preferredTitleAlignment:(unint64_t)a5 preferredTitleLayout:(unint64_t)a6 vibrancyConfiguration:(id)a7
{
  id v13;
  id v14;
  id v15;
  PRUISPosterTitleStyleAttributes *v16;
  PRUISPosterTitleStyleAttributes *v17;
  objc_super v19;

  v13 = a3;
  v14 = a4;
  v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)PRUISPosterTitleStyleAttributes;
  v16 = -[PRUISPosterTitleStyleAttributes init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_titleColor, a3);
    objc_storeStrong((id *)&v17->_titleFont, a4);
    v17->_preferredTitleAlignment = a5;
    v17->_preferredTitleLayout = a6;
    objc_storeStrong((id *)&v17->_vibrancyConfiguration, a7);
  }

  return v17;
}

- (UIColor)titleColor
{
  return self->_titleColor;
}

- (void)setTitleColor:(id)a3
{
  objc_storeStrong((id *)&self->_titleColor, a3);
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (void)setTitleFont:(id)a3
{
  objc_storeStrong((id *)&self->_titleFont, a3);
}

- (unint64_t)preferredTitleAlignment
{
  return self->_preferredTitleAlignment;
}

- (void)setPreferredTitleAlignment:(unint64_t)a3
{
  self->_preferredTitleAlignment = a3;
}

- (unint64_t)preferredTitleLayout
{
  return self->_preferredTitleLayout;
}

- (void)setPreferredTitleLayout:(unint64_t)a3
{
  self->_preferredTitleLayout = a3;
}

- (BSUIVibrancyConfiguration)vibrancyConfiguration
{
  return self->_vibrancyConfiguration;
}

- (void)setVibrancyConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_vibrancyConfiguration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vibrancyConfiguration, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_titleColor, 0);
}

@end
