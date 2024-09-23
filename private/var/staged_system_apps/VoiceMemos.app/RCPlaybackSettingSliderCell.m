@implementation RCPlaybackSettingSliderCell

- (RCPlaybackSettingSliderCell)initWithFrame:(CGRect)a3
{
  RCPlaybackSettingSliderCell *v3;
  void *v4;
  RCPlaybackSettingsSlider *v5;
  RCPlaybackSettingsSlider *slider;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSLayoutConstraint *sliderLeadingConstraint;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSLayoutConstraint *sliderTrailingConstraint;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)RCPlaybackSettingSliderCell;
  v3 = -[RCPlaybackSettingSliderCell initWithFrame:](&v29, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIListContentConfiguration cellConfiguration](UIListContentConfiguration, "cellConfiguration"));
    -[RCPlaybackSettingSliderCell setContentConfiguration:](v3, "setContentConfiguration:", v4);
    v5 = objc_alloc_init(RCPlaybackSettingsSlider);
    slider = v3->_slider;
    v3->_slider = v5;

    -[RCPlaybackSettingsSlider addTarget:action:forControlEvents:](v3->_slider, "addTarget:action:forControlEvents:", v3, "_updateSliderValue", 4096);
    -[RCPlaybackSettingSliderCell addSubview:](v3, "addSubview:", v3->_slider);
    -[RCPlaybackSettingsSlider setTranslatesAutoresizingMaskIntoConstraints:](v3->_slider, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingSliderCell contentView](v3, "contentView"));
    objc_msgSend(v7, "directionalLayoutMargins");
    v9 = v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingsSlider leadingAnchor](v3->_slider, "leadingAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingSliderCell safeAreaLayoutGuide](v3, "safeAreaLayoutGuide"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "leadingAnchor"));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:constant:", v12, v9));
    sliderLeadingConstraint = v3->_sliderLeadingConstraint;
    v3->_sliderLeadingConstraint = (NSLayoutConstraint *)v13;

    -[NSLayoutConstraint setActive:](v3->_sliderLeadingConstraint, "setActive:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingsSlider trailingAnchor](v3->_slider, "trailingAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingSliderCell safeAreaLayoutGuide](v3, "safeAreaLayoutGuide"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "trailingAnchor"));
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:constant:", v17, -v9));
    sliderTrailingConstraint = v3->_sliderTrailingConstraint;
    v3->_sliderTrailingConstraint = (NSLayoutConstraint *)v18;

    -[NSLayoutConstraint setActive:](v3->_sliderTrailingConstraint, "setActive:", 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingsSlider topAnchor](v3->_slider, "topAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingSliderCell safeAreaLayoutGuide](v3, "safeAreaLayoutGuide"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "topAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v22));
    objc_msgSend(v23, "setActive:", 1);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingsSlider bottomAnchor](v3->_slider, "bottomAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingSliderCell safeAreaLayoutGuide](v3, "safeAreaLayoutGuide"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "bottomAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v26));
    objc_msgSend(v27, "setActive:", 1);

  }
  return v3;
}

- (void)layoutMarginsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RCPlaybackSettingSliderCell;
  -[RCPlaybackSettingSliderCell layoutMarginsDidChange](&v3, "layoutMarginsDidChange");
  -[RCPlaybackSettingSliderCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)updateConstraints
{
  void *v3;
  double v4;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RCPlaybackSettingSliderCell;
  -[RCPlaybackSettingSliderCell updateConstraints](&v6, "updateConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingSliderCell contentView](self, "contentView"));
  objc_msgSend(v3, "directionalLayoutMargins");
  v5 = v4;

  -[NSLayoutConstraint setConstant:](self->_sliderLeadingConstraint, "setConstant:", v5);
  -[NSLayoutConstraint setConstant:](self->_sliderTrailingConstraint, "setConstant:", -v5);
}

- (void)setSliderValue:(double)a3
{
  float v4;

  v4 = a3;
  *(float *)&a3 = v4;
  -[RCPlaybackSettingsSlider setValue:](self->_slider, "setValue:", a3);
  self->_currentSliderValue = v4;
}

- (double)sliderValue
{
  float v2;

  -[RCPlaybackSettingsSlider value](self->_slider, "value");
  return v2;
}

- (void)_updateSliderValue
{
  float v3;
  float v4;
  void *v5;

  -[RCPlaybackSettingsSlider value](self->_slider, "value");
  v4 = v3;
  if (self->_currentSliderValue != v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingCell cellActionsDelegate](self, "cellActionsDelegate"));
    objc_msgSend(v5, "didUpdateSlider:toValue:", self, v4);

    self->_currentSliderValue = v4;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sliderTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_sliderLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_slider, 0);
}

@end
