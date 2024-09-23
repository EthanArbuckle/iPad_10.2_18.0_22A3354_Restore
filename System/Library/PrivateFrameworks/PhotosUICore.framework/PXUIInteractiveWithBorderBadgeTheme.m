@implementation PXUIInteractiveWithBorderBadgeTheme

- (PXUIInteractiveWithBorderBadgeTheme)initWithIsToggledOn:(BOOL)a3 isOverContent:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  PXUIInteractiveWithBorderBadgeTheme *v6;
  void *v7;
  uint64_t v8;
  UIImageSymbolConfiguration *imageConfiguration;
  uint64_t v10;
  UIColor *imageTintColor;
  uint64_t v12;
  uint64_t v13;
  CAFilter *imageCompositingFilter;
  uint64_t v15;
  double v16;
  UIColor *labelTextColor;
  uint64_t v18;
  CAFilter *labelCompositingFilter;
  uint64_t v20;
  Class backgroundViewClass;
  double v22;
  uint64_t v23;
  UIColor *backgroundColor;
  uint64_t v25;
  UIColor *backgroundBorderColor;
  UIBlurEffect *backgroundBlurEffect;
  objc_super v29;

  v4 = a4;
  v5 = a3;
  v29.receiver = self;
  v29.super_class = (Class)PXUIInteractiveWithBorderBadgeTheme;
  v6 = -[PXUIInteractiveWithBorderBadgeTheme init](&v29, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 14.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithFont:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    imageConfiguration = v6->_imageConfiguration;
    v6->_imageConfiguration = (UIImageSymbolConfiguration *)v8;

    v6->_imageAlpha = 1.0;
    if (v5)
      objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v10 = objc_claimAutoreleasedReturnValue();
    imageTintColor = v6->_imageTintColor;
    v6->_imageTintColor = (UIColor *)v10;

    objc_storeStrong((id *)&v6->_afterLabelImageTintColor, v6->_imageTintColor);
    v12 = *MEMORY[0x1E0CD2E70];
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2E70]);
    v13 = objc_claimAutoreleasedReturnValue();
    imageCompositingFilter = v6->_imageCompositingFilter;
    v6->_imageCompositingFilter = (CAFilter *)v13;

    objc_storeStrong((id *)&v6->_labelFont, v7);
    v6->_labelAlpha = 1.0;
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = 1.0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = 0.800000012;
    }
    labelTextColor = v6->_labelTextColor;
    v6->_labelTextColor = (UIColor *)v15;

    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", v12);
    v18 = objc_claimAutoreleasedReturnValue();
    labelCompositingFilter = v6->_labelCompositingFilter;
    v6->_labelCompositingFilter = (CAFilter *)v18;

    objc_opt_class();
    v20 = objc_claimAutoreleasedReturnValue();
    backgroundViewClass = v6->_backgroundViewClass;
    v6->_backgroundViewClass = (Class)v20;

    v6->_backgroundCornerRadius = 3.0;
    v22 = 1.0;
    if (v5 || v4)
      v22 = 0.0;
    v6->_backgroundBorderWidth = v22;
    v6->_backgroundAlpha = v16;
    if (v5)
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v23 = objc_claimAutoreleasedReturnValue();
    backgroundColor = v6->_backgroundColor;
    v6->_backgroundColor = (UIColor *)v23;

    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v25 = objc_claimAutoreleasedReturnValue();
    backgroundBorderColor = v6->_backgroundBorderColor;
    v6->_backgroundBorderColor = (UIColor *)v25;

    backgroundBlurEffect = v6->_backgroundBlurEffect;
    v6->_backgroundBlurEffect = 0;

  }
  return v6;
}

- (PXUIInteractiveWithBorderBadgeTheme)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUIBadgeTheme.m"), 219, CFSTR("%s is not available as initializer"), "-[PXUIInteractiveWithBorderBadgeTheme init]");

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

+ (id)sharedToggledOnOverContentBadgeTheme
{
  if (sharedToggledOnOverContentBadgeTheme_onceToken != -1)
    dispatch_once(&sharedToggledOnOverContentBadgeTheme_onceToken, &__block_literal_global_143_288591);
  return (id)sharedToggledOnOverContentBadgeTheme_badgeTheme;
}

+ (id)sharedToggledOffOverContentBadgeTheme
{
  if (sharedToggledOffOverContentBadgeTheme_onceToken != -1)
    dispatch_once(&sharedToggledOffOverContentBadgeTheme_onceToken, &__block_literal_global_145_288590);
  return (id)sharedToggledOffOverContentBadgeTheme_badgeTheme;
}

+ (id)sharedToggledOnBadgeTheme
{
  if (sharedToggledOnBadgeTheme_onceToken != -1)
    dispatch_once(&sharedToggledOnBadgeTheme_onceToken, &__block_literal_global_146_288589);
  return (id)sharedToggledOnBadgeTheme_badgeTheme;
}

+ (id)sharedToggledOffBadgeTheme
{
  if (sharedToggledOffBadgeTheme_onceToken != -1)
    dispatch_once(&sharedToggledOffBadgeTheme_onceToken, &__block_literal_global_147);
  return (id)sharedToggledOffBadgeTheme_badgeTheme;
}

void __65__PXUIInteractiveWithBorderBadgeTheme_sharedToggledOffBadgeTheme__block_invoke()
{
  PXUIInteractiveWithBorderBadgeTheme *v0;
  void *v1;

  v0 = -[PXUIInteractiveWithBorderBadgeTheme initWithIsToggledOn:isOverContent:]([PXUIInteractiveWithBorderBadgeTheme alloc], "initWithIsToggledOn:isOverContent:", 0, 0);
  v1 = (void *)sharedToggledOffBadgeTheme_badgeTheme;
  sharedToggledOffBadgeTheme_badgeTheme = (uint64_t)v0;

}

void __64__PXUIInteractiveWithBorderBadgeTheme_sharedToggledOnBadgeTheme__block_invoke()
{
  PXUIInteractiveWithBorderBadgeTheme *v0;
  void *v1;

  v0 = -[PXUIInteractiveWithBorderBadgeTheme initWithIsToggledOn:isOverContent:]([PXUIInteractiveWithBorderBadgeTheme alloc], "initWithIsToggledOn:isOverContent:", 1, 0);
  v1 = (void *)sharedToggledOnBadgeTheme_badgeTheme;
  sharedToggledOnBadgeTheme_badgeTheme = (uint64_t)v0;

}

void __76__PXUIInteractiveWithBorderBadgeTheme_sharedToggledOffOverContentBadgeTheme__block_invoke()
{
  PXUIInteractiveWithBorderBadgeTheme *v0;
  void *v1;

  v0 = -[PXUIInteractiveWithBorderBadgeTheme initWithIsToggledOn:isOverContent:]([PXUIInteractiveWithBorderBadgeTheme alloc], "initWithIsToggledOn:isOverContent:", 0, 1);
  v1 = (void *)sharedToggledOffOverContentBadgeTheme_badgeTheme;
  sharedToggledOffOverContentBadgeTheme_badgeTheme = (uint64_t)v0;

}

void __75__PXUIInteractiveWithBorderBadgeTheme_sharedToggledOnOverContentBadgeTheme__block_invoke()
{
  PXUIInteractiveWithBorderBadgeTheme *v0;
  void *v1;

  v0 = -[PXUIInteractiveWithBorderBadgeTheme initWithIsToggledOn:isOverContent:]([PXUIInteractiveWithBorderBadgeTheme alloc], "initWithIsToggledOn:isOverContent:", 1, 1);
  v1 = (void *)sharedToggledOnOverContentBadgeTheme_badgeTheme;
  sharedToggledOnOverContentBadgeTheme_badgeTheme = (uint64_t)v0;

}

@end
