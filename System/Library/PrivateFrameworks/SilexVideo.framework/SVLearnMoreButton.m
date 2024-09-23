@implementation SVLearnMoreButton

- (SVLearnMoreButton)initWithFrame:(CGRect)a3
{
  SVLearnMoreButton *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)SVLearnMoreButton;
  v3 = -[SVButton initWithFrame:](&v22, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDF6A80], "metricsForTextStyle:", *MEMORY[0x24BDF77D0]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", 13.0, *MEMORY[0x24BDF7890]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "scaledFontForFont:", v4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    SVBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Learn More"), &stru_24DBC27F8, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", v6);
    objc_msgSend(v7, "addAttribute:value:range:", *MEMORY[0x24BDF65F8], v20, 0, objc_msgSend(v6, "length"));
    v8 = *MEMORY[0x24BDF6600];
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addAttribute:value:range:", v8, v9, 0, objc_msgSend(v6, "length"));

    v10 = objc_alloc_init(MEMORY[0x24BDF6768]);
    objc_msgSend(v10, "setBounds:", 0.0, 0.0, 3.0, 0.0);
    objc_msgSend(MEMORY[0x24BDD1458], "attributedStringWithAttachment:", v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendAttributedString:", v19);
    objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithPointSize:weight:", 6, 13.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:withConfiguration:", CFSTR("chevron.right"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.921568627, 0.921568627, 0.960784314, 0.6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "imageWithTintColor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_alloc_init(MEMORY[0x24BDF6768]);
    objc_msgSend(v15, "setImage:", v14);
    objc_msgSend(MEMORY[0x24BDD1458], "attributedStringWithAttachment:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendAttributedString:", v16);
    v17 = objc_alloc_init(MEMORY[0x24BDF6748]);
    objc_msgSend(v17, "setAlignment:", 1);
    objc_msgSend(v7, "addAttribute:value:range:", *MEMORY[0x24BDF6628], v17, 0, objc_msgSend(v7, "length"));
    -[SVLearnMoreButton setAttributedTitle:forState:](v3, "setAttributedTitle:forState:", v7, 0);
    -[SVButton setTouchInsets:](v3, "setTouchInsets:", -10.0, -10.0, -10.0, -10.0);

  }
  return v3;
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SVLearnMoreButton;
  -[SVLearnMoreButton setHighlighted:](&v7, sel_setHighlighted_);
  if (v3)
    v5 = 0.2;
  else
    v5 = 1.0;
  -[SVLearnMoreButton titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", v5);

}

- (CGSize)intrinsicContentSize
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  -[SVLearnMoreButton titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "font");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "capHeight");
  v6 = round(v5) + 12.0;

  -[SVLearnMoreButton titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "intrinsicContentSize");
  v9 = v8 + 20.0;

  v10 = v9;
  v11 = v6;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[SVLearnMoreButton traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!SVContentSizeCategoryIsEqualToContentSizeCategory(v11, v6))
  {
    objc_msgSend(MEMORY[0x24BDF6A80], "metricsForTextStyle:", *MEMORY[0x24BDF77D0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", 13.0, *MEMORY[0x24BDF7890]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scaledFontForFont:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[SVLearnMoreButton titleLabel](self, "titleLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFont:", v9);

    -[SVLearnMoreButton invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }

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

  SVBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Learn More"), &stru_24DBC27F8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
