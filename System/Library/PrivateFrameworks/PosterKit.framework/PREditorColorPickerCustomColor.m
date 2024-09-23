@implementation PREditorColorPickerCustomColor

- (PREditorColorPickerCustomColor)initWithInitialVariation:(double)a3 colorProvider:(id)a4
{
  return -[PREditorColorPickerCustomColor initWithInitialVariation:colorProvider:localizedName:](self, "initWithInitialVariation:colorProvider:localizedName:", a4, 0, a3);
}

- (PREditorColorPickerCustomColor)initWithInitialVariation:(double)a3 colorProvider:(id)a4 localizedName:(id)a5
{
  id v7;
  void *v8;
  id colorProvider;
  NSString *v10;
  NSString *localizedName;

  if (self)
  {
    self->_initialVariation = a3;
    v7 = a5;
    v8 = (void *)objc_msgSend(a4, "copy");
    colorProvider = self->_colorProvider;
    self->_colorProvider = v8;

    v10 = (NSString *)objc_msgSend(v7, "copy");
    localizedName = self->_localizedName;
    self->_localizedName = v10;

  }
  return self;
}

- (PRPosterColor)baseColor
{
  return (PRPosterColor *)-[PREditorColorPickerCustomColor colorWithVariation:](self, "colorWithVariation:", 0.0);
}

- (PRPosterColor)leftSliderColor
{
  return (PRPosterColor *)-[PREditorColorPickerCustomColor colorWithVariation:](self, "colorWithVariation:", -1.0);
}

- (PRPosterColor)rightSliderColor
{
  return (PRPosterColor *)-[PREditorColorPickerCustomColor colorWithVariation:](self, "colorWithVariation:", 1.0);
}

- (PREditorColorPickerCustomColor)colorWithVariation:(double)a3
{
  void (**v4)(double);
  void *v5;
  PRPosterColor *v6;

  -[PREditorColorPickerCustomColor colorProvider](self, "colorProvider");
  v4 = (void (**)(double))objc_claimAutoreleasedReturnValue();
  v4[2](a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PRPosterColor initWithColor:preferredStyle:]([PRPosterColor alloc], "initWithColor:preferredStyle:", v5, 1);

  return (PREditorColorPickerCustomColor *)v6;
}

- (BOOL)isCustomColor
{
  return 1;
}

- (BOOL)isVibrantColor
{
  return 0;
}

- (double)initialVariation
{
  return self->_initialVariation;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (id)colorProvider
{
  return self->_colorProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_colorProvider, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
}

@end
