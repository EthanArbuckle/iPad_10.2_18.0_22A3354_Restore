@implementation SVVideoPlayButton

- (SVVideoPlayButton)initWithFrame:(CGRect)a3
{
  SVVideoPlayButton *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SVVideoPlayButton;
  v3 = -[SVButton initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SVVideoPlayButton setTintColor:](v3, "setTintColor:", v4);

    v5 = (void *)MEMORY[0x24BDF6950];
    if (UIAccessibilityIsReduceTransparencyEnabled())
      v6 = 1.0;
    else
      v6 = 0.9;
    objc_msgSend(v5, "colorWithRed:green:blue:alpha:", 0.282352941, 0.282352941, 0.290196078, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SVVideoPlayButton setBackgroundColor:](v3, "setBackgroundColor:", v7);
    -[SVVideoPlayButton imageView](v3, "imageView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setContentMode:", 4);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v3, sel_updateBackgroundColor, *MEMORY[0x24BDF7318], 0);

    -[SVVideoPlayButton displayAsPaused](v3, "displayAsPaused");
  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF7318], 0);

  v4.receiver = self;
  v4.super_class = (Class)SVVideoPlayButton;
  -[SVVideoPlayButton dealloc](&v4, sel_dealloc);
}

- (void)updateBackgroundColor
{
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;

  -[SVVideoPlayButton backgroundColor](self, "backgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "colorWithAlphaComponent:", 0.9);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (UIAccessibilityIsReduceTransparencyEnabled())
  {
    objc_msgSend(v6, "colorWithAlphaComponent:", 1.0);
    v4 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v4;
  }
  else
  {
    v5 = v6;
  }
  v7 = v5;
  -[SVVideoPlayButton setBackgroundColor:](self, "setBackgroundColor:", v5);

}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  double MidX;
  objc_super v7;
  CGRect v8;
  CGRect v9;
  CGRect v10;

  v7.receiver = self;
  v7.super_class = (Class)SVVideoPlayButton;
  -[SVVideoPlayButton layoutSubviews](&v7, sel_layoutSubviews);
  -[SVVideoPlayButton layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SVVideoPlayButton bounds](self, "bounds");
  objc_msgSend(v3, "setCornerRadius:", CGRectGetHeight(v8) * 0.5);

  -[SVVideoPlayButton imageView](self, "imageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFrame:", 0.0, 0.0, 40.0, 40.0);

  -[SVVideoPlayButton imageView](self, "imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SVVideoPlayButton bounds](self, "bounds");
  MidX = CGRectGetMidX(v9);
  -[SVVideoPlayButton bounds](self, "bounds");
  objc_msgSend(v5, "setCenter:", MidX, CGRectGetMidY(v10));

}

- (BOOL)isAccessibilityElement
{
  return !-[NSObject svax_shouldBeOccluded](self, "svax_shouldBeOccluded");
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  SVBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Play"), &stru_24DBC27F8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityHint
{
  void *v2;
  void *v3;

  SVBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Double tap to begin video playback"), &stru_24DBC27F8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)enabledPlayImage
{
  if (enabledPlayImage_onceToken != -1)
    dispatch_once(&enabledPlayImage_onceToken, &__block_literal_global);
  return (id)enabledPlayImage_image;
}

void __37__SVVideoPlayButton_enabledPlayImage__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithPointSize:", 40.0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:withConfiguration:", CFSTR("play.fill"), v4);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageWithTintColor:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)enabledPlayImage_image;
  enabledPlayImage_image = v2;

}

+ (id)disabledPlayImage
{
  if (disabledPlayImage_onceToken != -1)
    dispatch_once(&disabledPlayImage_onceToken, &__block_literal_global_17);
  return (id)disabledPlayImage_image;
}

void __38__SVVideoPlayButton_disabledPlayImage__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithPointSize:", 40.0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:withConfiguration:", CFSTR("play.slash.fill"), v4);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageWithTintColor:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)disabledPlayImage_image;
  disabledPlayImage_image = v2;

}

- (void)displayAsPaused
{
  void *v3;
  id v4;

  +[SVVideoPlayButton enabledPlayImage](SVVideoPlayButton, "enabledPlayImage");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[SVVideoPlayButton disabledPlayImage](SVVideoPlayButton, "disabledPlayImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SVVideoPlayButton setImage:forState:](self, "setImage:forState:", v4, 0);
  -[SVVideoPlayButton setImage:forState:](self, "setImage:forState:", v3, 2);

}

@end
