@implementation PXUIInteractiveBadgeTheme

- (PXUIInteractiveBadgeTheme)initWithIsToggledOn:(BOOL)a3 isActionable:(BOOL)a4 isDisabled:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  _BOOL4 v7;
  PXUIInteractiveBadgeTheme *v8;
  void *v9;
  void *v10;
  double v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  UIImageSymbolConfiguration *imageConfiguration;
  double v17;
  double v18;
  CAFilter *imageCompositingFilter;
  CAFilter *labelCompositingFilter;
  uint64_t v21;
  Class backgroundViewClass;
  UIColor *backgroundColor;
  UIColor *backgroundBorderColor;
  uint64_t v25;
  UIBlurEffect *backgroundBlurEffect;
  objc_super v28;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v28.receiver = self;
  v28.super_class = (Class)PXUIInteractiveBadgeTheme;
  v8 = -[PXUIInteractiveBadgeTheme init](&v28, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 14.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 11.0;
      v12 = 9;
    }
    else
    {
      if (v7)
        objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
      else
        objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "resolvedColorWithTraitCollection:", v14);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = 3.0;
      v12 = 13;
    }
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithFont:", v9);
    v15 = objc_claimAutoreleasedReturnValue();
    imageConfiguration = v8->_imageConfiguration;
    v8->_imageConfiguration = (UIImageSymbolConfiguration *)v15;

    if (v5)
      v17 = 0.600000024;
    else
      v17 = 1.0;
    v8->_imageAlpha = v17;
    if (v5)
      v18 = 0.800000012;
    else
      v18 = 1.0;
    objc_storeStrong((id *)&v8->_imageTintColor, v10);
    objc_storeStrong((id *)&v8->_afterLabelImageTintColor, v10);
    imageCompositingFilter = v8->_imageCompositingFilter;
    v8->_imageCompositingFilter = 0;

    objc_storeStrong((id *)&v8->_labelFont, v9);
    v8->_labelAlpha = v17;
    objc_storeStrong((id *)&v8->_labelTextColor, v10);
    labelCompositingFilter = v8->_labelCompositingFilter;
    v8->_labelCompositingFilter = 0;

    objc_opt_class();
    v21 = objc_claimAutoreleasedReturnValue();
    backgroundViewClass = v8->_backgroundViewClass;
    v8->_backgroundViewClass = (Class)v21;

    v8->_backgroundCornerRadius = v11;
    v8->_backgroundBorderWidth = 0.0;
    v8->_backgroundAlpha = v18;
    backgroundColor = v8->_backgroundColor;
    v8->_backgroundColor = 0;

    backgroundBorderColor = v8->_backgroundBorderColor;
    v8->_backgroundBorderColor = 0;

    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", v12);
    v25 = objc_claimAutoreleasedReturnValue();
    backgroundBlurEffect = v8->_backgroundBlurEffect;
    v8->_backgroundBlurEffect = (UIBlurEffect *)v25;

  }
  return v8;
}

- (PXUIInteractiveBadgeTheme)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUIBadgeTheme.m"), 319, CFSTR("%s is not available as initializer"), "-[PXUIInteractiveBadgeTheme init]");

  abort();
}

- (UIImageSymbolConfiguration)imageConfiguration
{
  return self->_imageConfiguration;
}

- (double)imageAlpha
{
  return self->_imageAlpha;
}

- (UIColor)imageTintColor
{
  return self->_imageTintColor;
}

- (UIColor)afterLabelImageTintColor
{
  return self->_afterLabelImageTintColor;
}

- (CAFilter)imageCompositingFilter
{
  return self->_imageCompositingFilter;
}

- (UIFont)labelFont
{
  return self->_labelFont;
}

- (double)labelAlpha
{
  return self->_labelAlpha;
}

- (UIColor)labelTextColor
{
  return self->_labelTextColor;
}

- (CAFilter)labelCompositingFilter
{
  return self->_labelCompositingFilter;
}

- (Class)backgroundViewClass
{
  return self->_backgroundViewClass;
}

- (double)backgroundCornerRadius
{
  return self->_backgroundCornerRadius;
}

- (double)backgroundBorderWidth
{
  return self->_backgroundBorderWidth;
}

- (double)backgroundAlpha
{
  return self->_backgroundAlpha;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (UIColor)backgroundBorderColor
{
  return self->_backgroundBorderColor;
}

- (UIBlurEffect)backgroundBlurEffect
{
  return self->_backgroundBlurEffect;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundBlurEffect, 0);
  objc_storeStrong((id *)&self->_backgroundBorderColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundViewClass, 0);
  objc_storeStrong((id *)&self->_labelCompositingFilter, 0);
  objc_storeStrong((id *)&self->_labelTextColor, 0);
  objc_storeStrong((id *)&self->_labelFont, 0);
  objc_storeStrong((id *)&self->_imageCompositingFilter, 0);
  objc_storeStrong((id *)&self->_afterLabelImageTintColor, 0);
  objc_storeStrong((id *)&self->_imageTintColor, 0);
  objc_storeStrong((id *)&self->_imageConfiguration, 0);
}

+ (id)actionableBadgeTheme
{
  if (actionableBadgeTheme_onceToken != -1)
    dispatch_once(&actionableBadgeTheme_onceToken, &__block_literal_global_161_288606);
  return (id)actionableBadgeTheme_badgeTheme;
}

+ (id)disabledActionableBadgeTheme
{
  if (disabledActionableBadgeTheme_onceToken != -1)
    dispatch_once(&disabledActionableBadgeTheme_onceToken, &__block_literal_global_163_288605);
  return (id)disabledActionableBadgeTheme_badgeTheme;
}

+ (id)sharedToggledOnBadgeTheme
{
  if (sharedToggledOnBadgeTheme_onceToken_165 != -1)
    dispatch_once(&sharedToggledOnBadgeTheme_onceToken_165, &__block_literal_global_166_288604);
  return (id)sharedToggledOnBadgeTheme_badgeTheme_164;
}

+ (id)sharedToggledOffBadgeTheme
{
  if (sharedToggledOffBadgeTheme_onceToken_168 != -1)
    dispatch_once(&sharedToggledOffBadgeTheme_onceToken_168, &__block_literal_global_169_288602);
  return (id)sharedToggledOffBadgeTheme_badgeTheme_167;
}

void __55__PXUIInteractiveBadgeTheme_sharedToggledOffBadgeTheme__block_invoke()
{
  PXUIInteractiveBadgeTheme *v0;
  void *v1;

  v0 = -[PXUIInteractiveBadgeTheme initWithIsToggledOn:isActionable:isDisabled:]([PXUIInteractiveBadgeTheme alloc], "initWithIsToggledOn:isActionable:isDisabled:", 0, 0, 0);
  v1 = (void *)sharedToggledOffBadgeTheme_badgeTheme_167;
  sharedToggledOffBadgeTheme_badgeTheme_167 = (uint64_t)v0;

}

void __54__PXUIInteractiveBadgeTheme_sharedToggledOnBadgeTheme__block_invoke()
{
  PXUIInteractiveBadgeTheme *v0;
  void *v1;

  v0 = -[PXUIInteractiveBadgeTheme initWithIsToggledOn:isActionable:isDisabled:]([PXUIInteractiveBadgeTheme alloc], "initWithIsToggledOn:isActionable:isDisabled:", 1, 0, 0);
  v1 = (void *)sharedToggledOnBadgeTheme_badgeTheme_164;
  sharedToggledOnBadgeTheme_badgeTheme_164 = (uint64_t)v0;

}

void __57__PXUIInteractiveBadgeTheme_disabledActionableBadgeTheme__block_invoke()
{
  PXUIInteractiveBadgeTheme *v0;
  void *v1;

  v0 = -[PXUIInteractiveBadgeTheme initWithIsToggledOn:isActionable:isDisabled:]([PXUIInteractiveBadgeTheme alloc], "initWithIsToggledOn:isActionable:isDisabled:", 0, 1, 1);
  v1 = (void *)disabledActionableBadgeTheme_badgeTheme;
  disabledActionableBadgeTheme_badgeTheme = (uint64_t)v0;

}

void __49__PXUIInteractiveBadgeTheme_actionableBadgeTheme__block_invoke()
{
  PXUIInteractiveBadgeTheme *v0;
  void *v1;

  v0 = -[PXUIInteractiveBadgeTheme initWithIsToggledOn:isActionable:isDisabled:]([PXUIInteractiveBadgeTheme alloc], "initWithIsToggledOn:isActionable:isDisabled:", 0, 1, 0);
  v1 = (void *)actionableBadgeTheme_badgeTheme;
  actionableBadgeTheme_badgeTheme = (uint64_t)v0;

}

@end
