@implementation SVAdPrivacyButton

+ (id)title
{
  void *v2;
  void *v3;

  SVBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Ad"), &stru_24DBC27F8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)font
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDF6A80], "metricsForTextStyle:", *MEMORY[0x24BDF77D0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", 13.0, *MEMORY[0x24BDF7890]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledFontForFont:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (double)height
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(a1, "font");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "capHeight");
  v4 = round(v3) + 12.0;

  return v4;
}

+ (CGSize)size
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  _QWORD v11[2];
  CGSize result;

  v11[1] = *MEMORY[0x24BDAC8D0];
  +[SVAdPrivacyButton title](SVAdPrivacyButton, "title");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x24BDF65F8];
  +[SVAdPrivacyButton font](SVAdPrivacyButton, "font");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sizeWithAttributes:", v4);
  v6 = v5;

  +[SVAdPrivacyButton height](SVAdPrivacyButton, "height");
  v8 = v7;
  v9 = v6 + 12.0;
  result.height = v8;
  result.width = v9;
  return result;
}

- (SVAdPrivacyButton)initWithFrame:(CGRect)a3
{
  SVAdPrivacyButton *v3;
  SVAdPrivacyButton *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SVAdPrivacyButton;
  v3 = -[SVButton initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SVAdPrivacyButton titleLabel](v3, "titleLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAdjustsFontForContentSizeCategory:", 1);

    +[SVAdPrivacyButton title](SVAdPrivacyButton, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SVAdPrivacyButton setTitle:forState:](v4, "setTitle:forState:", v6, 0);

    +[SVAdPrivacyButton font](SVAdPrivacyButton, "font");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SVAdPrivacyButton titleLabel](v4, "titleLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFont:", v7);

    -[SVAdPrivacyButton titleLabel](v4, "titleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTextAlignment:", 1);

    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SVAdPrivacyButton setTitleColor:forState:](v4, "setTitleColor:forState:", v10, 0);

    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 0.2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SVAdPrivacyButton setTitleColor:forState:](v4, "setTitleColor:forState:", v11, 1);

    objc_msgSend(MEMORY[0x24BDF6950], "systemTealColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SVAdPrivacyButton setBackgroundColor:](v4, "setBackgroundColor:", v12);

    -[SVAdPrivacyButton _setContinuousCornerRadius:](v4, "_setContinuousCornerRadius:", 6.0);
    -[SVButton setTouchInsets:](v4, "setTouchInsets:", -10.0, -10.0, -10.0, -10.0);

  }
  return v4;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  +[SVAdPrivacyButton height](SVAdPrivacyButton, "height");
  v4 = v3;
  -[SVAdPrivacyButton titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "intrinsicContentSize");
  v7 = v6 + 14.0;

  v8 = v7;
  v9 = v4;
  result.height = v9;
  result.width = v8;
  return result;
}

- (BOOL)isAccessibilityElement
{
  return !-[NSObject svax_shouldBeOccluded](self, "svax_shouldBeOccluded");
}

- (id)accessibilityElements
{
  return 0;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[SVAdPrivacyButton titleLabel](self, "titleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
