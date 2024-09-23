@implementation _UIPrototypingMenuNumberCell

- (_UIPrototypingMenuNumberCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  _UIPrototypingMenuNumberCell *v4;
  UIStackView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  UIStackView *floatValueStackView;
  void *v12;
  UILabel *v13;
  UILabel *minLabel;
  double v15;
  void *v16;
  _UIPrototypingMenuSlider *v17;
  _UIPrototypingMenuSlider *slider;
  UILabel *v19;
  UILabel *maxLabel;
  void *v21;
  UITapGestureRecognizer *v22;
  UITapGestureRecognizer *tapRecognizer;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)_UIPrototypingMenuNumberCell;
  v4 = -[_UIPrototypingMenuCell initWithStyle:reuseIdentifier:](&v25, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = [UIStackView alloc];
    v6 = *MEMORY[0x1E0C9D648];
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v10 = -[UIStackView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], v7, v8, v9);
    floatValueStackView = v4->_floatValueStackView;
    v4->_floatValueStackView = (UIStackView *)v10;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v4->_floatValueStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAxis:](v4->_floatValueStackView, "setAxis:", 0);
    -[UIStackView setDistribution:](v4->_floatValueStackView, "setDistribution:", 0);
    -[UIStackView setSpacing:](v4->_floatValueStackView, "setSpacing:", 1.17549435e-38);
    -[UIStackView setLayoutMarginsRelativeArrangement:](v4->_floatValueStackView, "setLayoutMarginsRelativeArrangement:", 1);
    -[UIView setLayoutMargins:](v4->_floatValueStackView, "setLayoutMargins:", 10.0, 0.0, 10.0, 0.0);
    -[_UIPrototypingMenuCell stackView](v4, "stackView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addArrangedSubview:", v4->_floatValueStackView);

    v13 = -[UILabel initWithFrame:]([UILabel alloc], "initWithFrame:", v6, v7, v8, v9);
    minLabel = v4->_minLabel;
    v4->_minLabel = v13;

    v15 = *(double *)off_1E167DC70;
    objc_msgSend(off_1E167A828, "monospacedDigitSystemFontOfSize:weight:", 17.0, *(double *)off_1E167DC70);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_minLabel, "setFont:", v16);

    -[UIStackView addArrangedSubview:](v4->_floatValueStackView, "addArrangedSubview:", v4->_minLabel);
    v17 = -[_UIPrototypingMenuSlider initWithFrame:]([_UIPrototypingMenuSlider alloc], "initWithFrame:", v6, v7, v8, v9);
    slider = v4->_slider;
    v4->_slider = v17;

    -[UIControl addTarget:action:forControlEvents:](v4->_slider, "addTarget:action:forControlEvents:", v4, sel__sliderDidChangeValue_, 4096);
    -[UIStackView addArrangedSubview:](v4->_floatValueStackView, "addArrangedSubview:", v4->_slider);
    v19 = -[UILabel initWithFrame:]([UILabel alloc], "initWithFrame:", v6, v7, v8, v9);
    maxLabel = v4->_maxLabel;
    v4->_maxLabel = v19;

    objc_msgSend(off_1E167A828, "monospacedDigitSystemFontOfSize:weight:", 17.0, v15);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_maxLabel, "setFont:", v21);

    -[UILabel setTextAlignment:](v4->_maxLabel, "setTextAlignment:", 2);
    -[UIStackView addArrangedSubview:](v4->_floatValueStackView, "addArrangedSubview:", v4->_maxLabel);
    v22 = -[UITapGestureRecognizer initWithTarget:action:]([UITapGestureRecognizer alloc], "initWithTarget:action:", v4, sel__tapRecognizerDidRecognizer_);
    tapRecognizer = v4->_tapRecognizer;
    v4->_tapRecognizer = v22;

    -[UIView addGestureRecognizer:](v4, "addGestureRecognizer:", v4->_tapRecognizer);
    -[UITableViewCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
  }
  return v4;
}

- (void)_tapRecognizerDidRecognizer:(id)a3
{
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  id v11;

  objc_msgSend(a3, "locationInView:", self);
  v5 = v4;
  -[_UIPrototypingMenuNumberCell slider](self, "slider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPrototypingMenuNumberCell slider](self, "slider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "knobCenter");
  objc_msgSend(v6, "convertPoint:toView:", self);
  v9 = v8;

  -[_UIPrototypingMenuNumberCell slider](self, "slider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v5 >= v9)
    objc_msgSend(v10, "increment");
  else
    objc_msgSend(v10, "decrement");

}

- (void)_prototypingSettingDidChange
{
  void *v3;
  double v4;
  double v5;
  uint64_t v6;
  void *v7;
  float v8;
  float v9;
  float v10;
  uint64_t v11;
  void *v12;
  void *v13;
  float v14;
  float v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  int v20;
  void *v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)_UIPrototypingMenuNumberCell;
  -[_UIPrototypingMenuCell _prototypingSettingDidChange](&v28, sel__prototypingSettingDidChange);
  -[_UIPrototypingMenuCell prototypingSetting](self, "prototypingSetting");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stepSize");
  v5 = v4;
  if (v4 == 0.0)
  {
    v6 = objc_msgSend(v3, "type");
    if (v6 == 1)
    {
      v5 = 0.01;
    }
    else if (!v6)
    {
      v5 = 1.0;
    }
  }
  objc_msgSend(v3, "minimumValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "floatValue");
  v9 = v8;

  v10 = v5;
  if (v10 <= 0.0)
    goto LABEL_12;
  if (fmod(v10, 1.0) == 0.0)
  {
    v11 = 0;
    goto LABEL_13;
  }
  if (fmod(v10, 0.1) == 0.0)
    v11 = 1;
  else
LABEL_12:
    v11 = 2;
LABEL_13:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.*f"), v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_minLabel, "setText:", v12);

  objc_msgSend(v3, "maximumValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "floatValue");
  v15 = v14;

  if (v10 <= 0.0)
    goto LABEL_18;
  if (fmod(v10, 1.0) != 0.0)
  {
    if (fmod(v10, 0.1) == 0.0)
    {
      v16 = 1;
      goto LABEL_19;
    }
LABEL_18:
    v16 = 2;
    goto LABEL_19;
  }
  v16 = 0;
LABEL_19:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.*f"), v16, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_maxLabel, "setText:", v17);

  objc_msgSend(v3, "currentValue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "floatValue");
  v20 = v19;

  -[_UIPrototypingMenuNumberCell slider](self, "slider");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v22 = v9;
  objc_msgSend(v21, "setMinimumValue:", v22);

  -[_UIPrototypingMenuNumberCell slider](self, "slider");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v24 = v15;
  objc_msgSend(v23, "setMaximumValue:", v24);

  -[_UIPrototypingMenuNumberCell slider](self, "slider");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setStepSize:", v5);

  -[_UIPrototypingMenuNumberCell slider](self, "slider");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v27) = v20;
  objc_msgSend(v26, "setValue:", v27);

}

- (void)_sliderDidChangeValue:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a3, "value");
  objc_msgSend(v4, "numberWithFloat:");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIPrototypingMenuCell prototypingSetting](self, "prototypingSetting");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCurrentValue:", v6);

}

- (double)min
{
  return self->_min;
}

- (void)setMin:(double)a3
{
  self->_min = a3;
}

- (double)max
{
  return self->_max;
}

- (void)setMax:(double)a3
{
  self->_max = a3;
}

- (double)current
{
  return self->_current;
}

- (void)setCurrent:(double)a3
{
  self->_current = a3;
}

- (UIStackView)floatValueStackView
{
  return self->_floatValueStackView;
}

- (void)setFloatValueStackView:(id)a3
{
  objc_storeStrong((id *)&self->_floatValueStackView, a3);
}

- (UILabel)minLabel
{
  return self->_minLabel;
}

- (void)setMinLabel:(id)a3
{
  objc_storeStrong((id *)&self->_minLabel, a3);
}

- (UILabel)maxLabel
{
  return self->_maxLabel;
}

- (void)setMaxLabel:(id)a3
{
  objc_storeStrong((id *)&self->_maxLabel, a3);
}

- (_UIPrototypingMenuSlider)slider
{
  return self->_slider;
}

- (void)setSlider:(id)a3
{
  objc_storeStrong((id *)&self->_slider, a3);
}

- (UITapGestureRecognizer)tapRecognizer
{
  return self->_tapRecognizer;
}

- (void)setTapRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tapRecognizer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_slider, 0);
  objc_storeStrong((id *)&self->_maxLabel, 0);
  objc_storeStrong((id *)&self->_minLabel, 0);
  objc_storeStrong((id *)&self->_floatValueStackView, 0);
}

@end
