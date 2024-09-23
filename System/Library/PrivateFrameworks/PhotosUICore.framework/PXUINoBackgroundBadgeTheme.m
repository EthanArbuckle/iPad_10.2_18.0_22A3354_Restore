@implementation PXUINoBackgroundBadgeTheme

- (PXUINoBackgroundBadgeTheme)init
{
  char *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)PXUINoBackgroundBadgeTheme;
  v2 = -[PXUINoBackgroundBadgeTheme init](&v20, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 14.0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithFont:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v4;

    *((_QWORD *)v2 + 2) = 0x3FF0000000000000;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v6;

    objc_storeStrong((id *)v2 + 4, *((id *)v2 + 3));
    v8 = (void *)*((_QWORD *)v2 + 5);
    *((_QWORD *)v2 + 5) = 0;

    v9 = (void *)*((_QWORD *)v2 + 6);
    *((_QWORD *)v2 + 6) = v3;
    v10 = v3;

    *((_QWORD *)v2 + 7) = 0x3FF0000000000000;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)*((_QWORD *)v2 + 8);
    *((_QWORD *)v2 + 8) = v11;

    v13 = (void *)*((_QWORD *)v2 + 9);
    *((_QWORD *)v2 + 9) = 0;

    objc_opt_class();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)*((_QWORD *)v2 + 10);
    *((_QWORD *)v2 + 10) = v14;

    *(_OWORD *)(v2 + 88) = 0u;
    v16 = (void *)*((_QWORD *)v2 + 14);
    *(_OWORD *)(v2 + 104) = 0u;

    v17 = (void *)*((_QWORD *)v2 + 15);
    *((_QWORD *)v2 + 15) = 0;

    v18 = (void *)*((_QWORD *)v2 + 16);
    *((_QWORD *)v2 + 16) = 0;

  }
  return (PXUINoBackgroundBadgeTheme *)v2;
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

+ (id)sharedBadgeTheme
{
  if (sharedBadgeTheme_onceToken_137 != -1)
    dispatch_once(&sharedBadgeTheme_onceToken_137, &__block_literal_global_138_288572);
  return (id)sharedBadgeTheme_badgeTheme_136;
}

void __46__PXUINoBackgroundBadgeTheme_sharedBadgeTheme__block_invoke()
{
  PXUINoBackgroundBadgeTheme *v0;
  void *v1;

  v0 = objc_alloc_init(PXUINoBackgroundBadgeTheme);
  v1 = (void *)sharedBadgeTheme_badgeTheme_136;
  sharedBadgeTheme_badgeTheme_136 = (uint64_t)v0;

}

@end
