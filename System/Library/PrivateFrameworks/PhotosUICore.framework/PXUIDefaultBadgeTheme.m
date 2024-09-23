@implementation PXUIDefaultBadgeTheme

- (PXUIDefaultBadgeTheme)init
{
  char *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)PXUIDefaultBadgeTheme;
  v2 = -[PXUIDefaultBadgeTheme init](&v26, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 14.0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithFont:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v4;

    *((_QWORD *)v2 + 2) = 0x3FE3333340000000;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v6;

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)*((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 4) = v8;

    v10 = *MEMORY[0x1E0CD2E70];
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2E70]);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)*((_QWORD *)v2 + 5);
    *((_QWORD *)v2 + 5) = v11;

    v13 = (void *)*((_QWORD *)v2 + 6);
    *((_QWORD *)v2 + 6) = v3;
    v14 = v3;

    *((_QWORD *)v2 + 7) = 0x3FE3333340000000;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)*((_QWORD *)v2 + 8);
    *((_QWORD *)v2 + 8) = v15;

    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", v10);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)*((_QWORD *)v2 + 9);
    *((_QWORD *)v2 + 9) = v17;

    objc_opt_class();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)*((_QWORD *)v2 + 10);
    *((_QWORD *)v2 + 10) = v19;

    *(_OWORD *)(v2 + 88) = xmmword_1A7BBD460;
    *((_QWORD *)v2 + 13) = 0x3FE99999A0000000;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)*((_QWORD *)v2 + 14);
    *((_QWORD *)v2 + 14) = v21;

    v23 = (void *)*((_QWORD *)v2 + 15);
    *((_QWORD *)v2 + 15) = 0;

    v24 = (void *)*((_QWORD *)v2 + 16);
    *((_QWORD *)v2 + 16) = 0;

  }
  return (PXUIDefaultBadgeTheme *)v2;
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
  if (sharedBadgeTheme_onceToken != -1)
    dispatch_once(&sharedBadgeTheme_onceToken, &__block_literal_global_288567);
  return (id)sharedBadgeTheme_badgeTheme;
}

void __41__PXUIDefaultBadgeTheme_sharedBadgeTheme__block_invoke()
{
  PXUIDefaultBadgeTheme *v0;
  void *v1;

  v0 = objc_alloc_init(PXUIDefaultBadgeTheme);
  v1 = (void *)sharedBadgeTheme_badgeTheme;
  sharedBadgeTheme_badgeTheme = (uint64_t)v0;

}

@end
