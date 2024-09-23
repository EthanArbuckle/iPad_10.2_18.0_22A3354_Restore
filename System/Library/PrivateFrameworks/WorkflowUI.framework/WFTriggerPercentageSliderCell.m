@implementation WFTriggerPercentageSliderCell

- (WFTriggerPercentageSliderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  WFTriggerPercentageSliderCell *v4;
  uint64_t v5;
  UISlider *slider;
  void *v7;
  UISlider *v8;
  void *v9;
  id v10;
  WFTriggerPercentageSliderCell *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)WFTriggerPercentageSliderCell;
  v4 = -[WFTriggerPercentageSliderCell initWithStyle:reuseIdentifier:](&v13, sel_initWithStyle_reuseIdentifier_, 0, a4);
  if (v4)
  {
    v5 = objc_opt_new();
    slider = v4->_slider;
    v4->_slider = (UISlider *)v5;

    -[UISlider setTranslatesAutoresizingMaskIntoConstraints:](v4->_slider, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v4->_stepValue = 1.0;
    -[WFTriggerPercentageSliderCell contentView](v4, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v4->_slider);

    v8 = v4->_slider;
    -[WFTriggerPercentageSliderCell contentView](v4, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)-[UISlider wf_addConstraintsToFillSuperview:insets:](v8, "wf_addConstraintsToFillSuperview:insets:", v9, 8.0, 8.0, 8.0, 8.0);

    -[UISlider addTarget:action:forControlEvents:](v4->_slider, "addTarget:action:forControlEvents:", v4, sel_sliderValueChanged_, 4096);
    v11 = v4;
  }

  return v4;
}

- (void)configureWithInitialValue:(double)a3 maximumValue:(double)a4 minimumValue:(double)a5 stepValue:(double)a6
{
  float v10;
  void *v11;
  double v12;
  void *v13;
  double v14;

  v10 = a4;
  -[WFTriggerPercentageSliderCell slider](self, "slider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v12 = v10;
  objc_msgSend(v11, "setMaximumValue:", v12);

  -[WFTriggerPercentageSliderCell slider](self, "slider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&a5 = a5;
  LODWORD(v14) = LODWORD(a5);
  objc_msgSend(v13, "setMinimumValue:", v14);

  -[WFTriggerPercentageSliderCell setSliderValue:](self, "setSliderValue:", a3);
  -[WFTriggerPercentageSliderCell setStepValue:](self, "setStepValue:", a6);
}

- (void)sliderValueChanged:(id)a3
{
  void *v4;
  double v5;
  id v6;

  -[WFTriggerPercentageSliderCell slider](self, "slider", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTriggerPercentageSliderCell sliderValue](self, "sliderValue");
  *(float *)&v5 = v5;
  objc_msgSend(v4, "setValue:animated:", 0, v5);

  -[WFTriggerPercentageSliderCell delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[WFTriggerPercentageSliderCell sliderValue](self, "sliderValue");
  objc_msgSend(v6, "sliderValueChangedToValue:");

}

- (double)sliderValue
{
  void *v3;
  float v4;
  double v5;
  double v6;
  double v7;
  double v8;

  -[WFTriggerPercentageSliderCell slider](self, "slider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v5 = v4;
  -[WFTriggerPercentageSliderCell stepValue](self, "stepValue");
  -[WFTriggerPercentageSliderCell roundValue:toNearestStep:](self, "roundValue:toNearestStep:", v5, v6);
  v8 = v7;

  return v8;
}

- (void)setSliderValue:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;

  -[WFTriggerPercentageSliderCell stepValue](self, "stepValue");
  -[WFTriggerPercentageSliderCell roundValue:toNearestStep:](self, "roundValue:toNearestStep:", a3, v5);
  v7 = v6;
  -[WFTriggerPercentageSliderCell slider](self, "slider");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v8 = v7;
  objc_msgSend(v9, "setValue:animated:", 0, v8);

}

- (double)roundValue:(double)a3 toNearestStep:(double)a4
{
  float v4;

  v4 = a3 / a4;
  return roundf(v4) * a4;
}

- (WFTriggerPercentageSliderCellDelegate)delegate
{
  return (WFTriggerPercentageSliderCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UISlider)slider
{
  return self->_slider;
}

- (UILabel)label
{
  return self->_label;
}

- (double)stepValue
{
  return self->_stepValue;
}

- (void)setStepValue:(double)a3
{
  self->_stepValue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_slider, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
