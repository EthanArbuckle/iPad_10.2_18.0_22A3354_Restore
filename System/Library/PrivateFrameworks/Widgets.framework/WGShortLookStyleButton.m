@implementation WGShortLookStyleButton

- (void)setBackgroundBlurred:(BOOL)a3
{
  if (self->_backgroundBlurred != a3)
  {
    self->_backgroundBlurred = a3;
    -[MTMaterialView setBlurEnabled:](self->_backgroundView, "setBlurEnabled:");
    -[WGShortLookStyleButton setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[WGShortLookStyleButton isHighlighted](self, "isHighlighted") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)WGShortLookStyleButton;
    -[WGShortLookStyleButton setHighlighted:](&v5, sel_setHighlighted_, v3);
    if (v3)
      -[WGShortLookStyleButton _updateHighlight](self, "_updateHighlight");
    else
      BSRunLoopPerformAfterCACommit();
  }
}

uint64_t __41__WGShortLookStyleButton_setHighlighted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateHighlight");
}

- (void)_updateHighlight
{
  _QWORD v3[5];

  if (-[WGShortLookStyleButton isHighlighted](self, "isHighlighted"))
  {
    -[MTMaterialView setHighlighted:](self->_backgroundView, "setHighlighted:", 1);
  }
  else
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __42__WGShortLookStyleButton__updateHighlight__block_invoke;
    v3[3] = &unk_24D7314D8;
    v3[4] = self;
    objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:options:animations:completion:", 6, v3, 0, 0.3, 0.0);
  }
}

uint64_t __42__WGShortLookStyleButton__updateHighlight__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setHighlighted:", 0);
}

- (id)_fontProvider
{
  BSUIFontProvider *fontProvider;
  BSUIFontProvider *v4;
  BSUIFontProvider *v5;

  fontProvider = self->_fontProvider;
  if (!fontProvider)
  {
    objc_msgSend(MEMORY[0x24BE0BF20], "preferredFontProvider");
    v4 = (BSUIFontProvider *)objc_claimAutoreleasedReturnValue();
    v5 = self->_fontProvider;
    self->_fontProvider = v4;

    fontProvider = self->_fontProvider;
  }
  return fontProvider;
}

- (id)fontForTitle:(id)a3
{
  id v3;
  void *v4;
  double v5;
  uint64_t v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = 0;
  v5 = *MEMORY[0x24BDF7868];
  v6 = *MEMORY[0x24BDF65F8];
  v7 = 15.0;
  do
  {
    v8 = v4;
    objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", v7, v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = v6;
    v15[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sizeWithAttributes:", v9);
    v11 = v10;

    v7 = v7 + -1.0;
  }
  while (v11 > 42.6666667 && v7 >= 10.0);

  return v4;
}

- (void)_configureBackgroundViewIfNecessary
{
  MTMaterialView *v3;
  MTMaterialView *backgroundView;

  if (!self->_backgroundView)
  {
    objc_msgSend(MEMORY[0x24BE64060], "materialViewWithRecipe:", 2);
    v3 = (MTMaterialView *)objc_claimAutoreleasedReturnValue();
    backgroundView = self->_backgroundView;
    self->_backgroundView = v3;

    -[MTMaterialView setBlurEnabled:](self->_backgroundView, "setBlurEnabled:", self->_backgroundBlurred);
    -[WGShortLookStyleButton addSubview:](self, "addSubview:", self->_backgroundView);
    -[WGShortLookStyleButton sendSubviewToBack:](self, "sendSubviewToBack:", self->_backgroundView);
  }
}

- (void)_updateTitleLabelFont
{
  void *v3;
  id v4;

  -[WGShortLookStyleButton title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WGShortLookStyleButton fontForTitle:](self, "fontForTitle:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  -[UILabel setFont:](self->_titleLabel, "setFont:", v4);
}

- (void)_configureTitleLabelIfNecessary
{
  UILabel *v3;
  UILabel *titleLabel;
  id v5;

  if (!self->_titleLabel)
  {
    v3 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
    titleLabel = self->_titleLabel;
    self->_titleLabel = v3;

    -[WGShortLookStyleButton _updateTitleLabelFont](self, "_updateTitleLabelFont");
    -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 1);
    -[WGShortLookStyleButton addSubview:](self, "addSubview:", self->_titleLabel);
    -[WGShortLookStyleButton _configureBackgroundViewIfNecessary](self, "_configureBackgroundViewIfNecessary");
    -[MTMaterialView visualStylingProviderForCategory:](self->_backgroundView, "visualStylingProviderForCategory:", 1);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "automaticallyUpdateView:withStyle:", self->_titleLabel, 1);

  }
}

- (double)_backgroundViewCornerRadius
{
  double result;

  -[MTMaterialView _continuousCornerRadius](self->_backgroundView, "_continuousCornerRadius");
  return result;
}

- (void)_setBackgroundViewCornerRadius:(double)a3
{
  -[MTMaterialView _setContinuousCornerRadius:](self->_backgroundView, "_setContinuousCornerRadius:", a3);
}

- (void)_configureMaskIfNecessary
{
  double v3;
  double v4;
  double v5;

  -[WGShortLookStyleButton _backgroundViewCornerRadius](self, "_backgroundViewCornerRadius");
  if (fabs(v3) < 2.22044605e-16)
  {
    -[WGShortLookStyleButton _size](self, "_size");
    if (v4 >= v5)
      v4 = v5;
    -[WGShortLookStyleButton _setBackgroundViewCornerRadius:](self, "_setBackgroundViewCornerRadius:", v4 * 0.5);
  }
}

- (NSString)title
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void)setTitle:(id)a3
{
  id v4;

  v4 = a3;
  -[WGShortLookStyleButton _configureTitleLabelIfNecessary](self, "_configureTitleLabelIfNecessary");
  -[UILabel setText:](self->_titleLabel, "setText:", v4);

  -[WGShortLookStyleButton _updateTitleLabelFont](self, "_updateTitleLabelFont");
  -[WGShortLookStyleButton invalidateCachedGeometry](self, "invalidateCachedGeometry");
}

- (CGSize)_size
{
  CGSize *p_size;
  double width;
  double height;
  void *v6;
  void *v7;
  uint64_t v8;
  UILabel *titleLabel;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  int v18;
  double v19;
  void *v20;
  void *v21;
  CGFloat v22;
  CGFloat v23;
  CGSize result;
  CGRect v25;

  p_size = &self->_size;
  width = self->_size.width;
  height = self->_size.height;
  if (width == 0.0 && height == 0.0)
  {
    -[WGShortLookStyleButton _configureTitleLabelIfNecessary](self, "_configureTitleLabelIfNecessary");
    -[WGShortLookStyleButton title](self, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WGShortLookStyleButton fontForTitle:](self, "fontForTitle:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = 472;
    -[UILabel setFont:](self->_titleLabel, "setFont:", v7);
    -[UILabel sizeToFit](self->_titleLabel, "sizeToFit");
    titleLabel = self->_titleLabel;
    -[UILabel bounds](titleLabel, "bounds");
    -[UILabel textRectForBounds:limitedToNumberOfLines:](titleLabel, "textRectForBounds:limitedToNumberOfLines:", -[UILabel numberOfLines](self->_titleLabel, "numberOfLines"), v10, v11, v12, v13);
    v15 = ceil(v14 + 10.0 + 10.0);
    if (v15 >= 60.0)
      v16 = v15;
    else
      v16 = 60.0;
    objc_msgSend(MEMORY[0x24BE0BE68], "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "deviceClass");
    if (v18)
    {
      objc_msgSend(MEMORY[0x24BE0BE68], "sharedInstance");
      v8 = objc_claimAutoreleasedReturnValue();
      v19 = 26.0;
      if (objc_msgSend((id)v8, "deviceClass") != 1)
        goto LABEL_14;
    }
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_referenceBounds");
    v19 = 26.0;
    if (CGRectGetHeight(v25) > 812.0)
    {
      objc_msgSend(MEMORY[0x24BE0BE68], "sharedInstance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v21, "homeButtonType") == 2)
        v19 = 28.0;
      else
        v19 = 26.0;

    }
    if (v18)
LABEL_14:

    p_size->width = v16;
    p_size->height = v19;
    UISizeRoundToScale();
    p_size->width = v22;
    p_size->height = v23;

    width = p_size->width;
    height = p_size->height;
  }
  result.height = height;
  result.width = width;
  return result;
}

- (void)invalidateCachedGeometry
{
  self->_size = (CGSize)*MEMORY[0x24BDBF148];
  -[WGShortLookStyleButton _setBackgroundViewCornerRadius:](self, "_setBackgroundViewCornerRadius:", 0.0);
  -[WGShortLookStyleButton setNeedsLayout](self, "setNeedsLayout");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  CGSize result;

  -[WGShortLookStyleButton _configureTitleLabelIfNecessary](self, "_configureTitleLabelIfNecessary", a3.width, a3.height);
  -[WGShortLookStyleButton _size](self, "_size");
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)_layoutTitleLabel
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  UILabel *titleLabel;
  double MidX;
  CGRect v9;
  CGRect v10;

  -[UILabel sizeToFit](self->_titleLabel, "sizeToFit");
  -[WGShortLookStyleButton bounds](self, "bounds");
  x = v9.origin.x;
  y = v9.origin.y;
  width = v9.size.width;
  height = v9.size.height;
  titleLabel = self->_titleLabel;
  MidX = CGRectGetMidX(v9);
  v10.origin.x = x;
  v10.origin.y = y;
  v10.size.width = width;
  v10.size.height = height;
  -[UILabel setCenter:](titleLabel, "setCenter:", MidX, CGRectGetMidY(v10) + -0.5);
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WGShortLookStyleButton;
  -[WGShortLookStyleButton layoutSubviews](&v3, sel_layoutSubviews);
  -[WGShortLookStyleButton _configureBackgroundViewIfNecessary](self, "_configureBackgroundViewIfNecessary");
  -[WGShortLookStyleButton bounds](self, "bounds");
  -[MTMaterialView setFrame:](self->_backgroundView, "setFrame:");
  -[WGShortLookStyleButton _layoutTitleLabel](self, "_layoutTitleLabel");
  -[WGShortLookStyleButton _configureMaskIfNecessary](self, "_configureMaskIfNecessary");
  -[WGShortLookStyleButton _updateTouchInsetsIfNecessary](self, "_updateTouchInsetsIfNecessary");
}

- (void)_updateTouchInsetsIfNecessary
{
  double v3;
  double v4;

  -[WGShortLookStyleButton bounds](self, "bounds");
  if (v3 < 44.0)
  {
    v4 = fmin((44.0 - v3) * -0.5, 0.0);
    -[WGShortLookStyleButton _setTouchInsets:](self, "_setTouchInsets:", v4, 0.0, v4, 0.0);
  }
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WGShortLookStyleButton;
  return -[WGShortLookStyleButton pointInside:withEvent:](&v5, sel_pointInside_withEvent_, a4, a3.x, a3.y);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WGShortLookStyleButton;
  v4 = a3;
  -[WGShortLookStyleButton traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  -[WGShortLookStyleButton traitCollection](self, "traitCollection", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", v6);

    if ((v8 & 1) == 0)
    {
      -[WGShortLookStyleButton _updateTitleLabelFont](self, "_updateTitleLabelFont");
      -[WGShortLookStyleButton invalidateCachedGeometry](self, "invalidateCachedGeometry");
    }
  }

}

- (NSString)materialGroupNameBase
{
  return (NSString *)-[MTMaterialView groupNameBase](self->_backgroundView, "groupNameBase");
}

- (void)setMaterialGroupNameBase:(id)a3
{
  id v4;

  v4 = a3;
  -[WGShortLookStyleButton _configureBackgroundViewIfNecessary](self, "_configureBackgroundViewIfNecessary");
  -[MTMaterialView setGroupNameBase:](self->_backgroundView, "setGroupNameBase:", v4);

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  WGShortLookStyleButton *v5;
  uint64_t v6;
  BOOL v7;

  v4 = a3;
  objc_msgSend(v4, "view");
  v5 = (WGShortLookStyleButton *)objc_claimAutoreleasedReturnValue();
  if (v5 == self
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || objc_msgSend(v4, "numberOfTouchesRequired") != 1)
  {

    goto LABEL_7;
  }
  v6 = objc_msgSend(v4, "numberOfTapsRequired");

  if (v6 != 1)
  {
LABEL_7:
    v7 = 1;
    goto LABEL_8;
  }
  v7 = 0;
LABEL_8:

  return v7;
}

- (BOOL)isBackgroundBlurred
{
  return self->_backgroundBlurred;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontProvider, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
