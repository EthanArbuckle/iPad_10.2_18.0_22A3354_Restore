@implementation TFAppLockupViewSpecification

- (TFAppLockupViewSpecification)initWithTraitCollection:(id)a3
{
  id v4;
  TFAppLockupViewSpecification *v5;
  TFAppLockupViewSpecification *v6;
  uint64_t v7;
  UIFont *titleLabelFont;
  uint64_t v9;
  UIFont *subtitleLabelFont;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)TFAppLockupViewSpecification;
  v5 = -[TFAppLockupViewSpecification init](&v20, sel_init);
  v6 = v5;
  if (v5)
  {
    -[TFAppLockupViewSpecification _createTitleLabelFontWithTraitCollection:](v5, "_createTitleLabelFontWithTraitCollection:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
    titleLabelFont = v6->_titleLabelFont;
    v6->_titleLabelFont = (UIFont *)v7;

    -[TFAppLockupViewSpecification _createSubtitleLabelFontWithTraitCollection:](v6, "_createSubtitleLabelFontWithTraitCollection:", v4);
    v9 = objc_claimAutoreleasedReturnValue();
    subtitleLabelFont = v6->_subtitleLabelFont;
    v6->_subtitleLabelFont = (UIFont *)v9;

    v11 = (void *)MEMORY[0x24BDF6A80];
    -[TFAppLockupViewSpecification _titleFontStyle](v6, "_titleFontStyle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "metricsForTextStyle:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "scaledValueForValue:", 24.0);
    v6->_titleLabelBaselineToFirstSubtitleLabelBaseline = v14;

    v15 = (void *)MEMORY[0x24BDF6A80];
    -[TFAppLockupViewSpecification _subtitleFontStyle](v6, "_subtitleFontStyle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "metricsForTextStyle:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "scaledValueForValue:", 20.0);
    v6->_firstSubtitleLabelBaselineToSecondSubtitleLabelBaseline = v18;

  }
  return v6;
}

- (UIColor)titleTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
}

- (UIColor)subtitleTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
}

- (UIColor)iconPlaceholderColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BDF6950], "secondarySystemBackgroundColor");
}

- (CGSize)iconSize
{
  __n128 v2;
  __n128 v3;
  double v4;
  double v5;
  CGSize result;

  v2.n128_u64[0] = 0x4054000000000000;
  v3.n128_u64[0] = 0x4054000000000000;
  PPMScaledFloatValue(self, a2, v2, v3);
  result.height = v5;
  result.width = v4;
  return result;
}

- (double)paddingBetweenIconAndText
{
  return 14.0;
}

- (id)_createTitleLabelFontWithTraitCollection:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x24BDF6A78];
  v5 = a3;
  -[TFAppLockupViewSpecification _titleFontStyle](self, "_titleFontStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tf_systemFontWithTextStyle:weight:forTraitCollection:", v6, v5, *MEMORY[0x24BDF7890]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_titleFontStyle
{
  return (id)*MEMORY[0x24BDF77B0];
}

- (id)_createSubtitleLabelFontWithTraitCollection:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x24BDF6A78];
  v5 = a3;
  -[TFAppLockupViewSpecification _subtitleFontStyle](self, "_subtitleFontStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tf_systemFontWithTextStyle:weight:forTraitCollection:", v6, v5, *MEMORY[0x24BDF7888]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_subtitleFontStyle
{
  return (id)*MEMORY[0x24BDF7810];
}

- (double)titleLabelBaselineToFirstSubtitleLabelBaseline
{
  return self->_titleLabelBaselineToFirstSubtitleLabelBaseline;
}

- (double)firstSubtitleLabelBaselineToSecondSubtitleLabelBaseline
{
  return self->_firstSubtitleLabelBaselineToSecondSubtitleLabelBaseline;
}

- (UIFont)titleLabelFont
{
  return self->_titleLabelFont;
}

- (UIFont)subtitleLabelFont
{
  return self->_subtitleLabelFont;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabelFont, 0);
  objc_storeStrong((id *)&self->_titleLabelFont, 0);
}

@end
