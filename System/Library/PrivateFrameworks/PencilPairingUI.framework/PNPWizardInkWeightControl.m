@implementation PNPWizardInkWeightControl

- (PNPWizardInkWeightControl)initWithFrame:(CGRect)a3
{
  PNPWizardInkWeightControl *v3;
  PNPGradientView *v4;
  PNPGradientView *gradient;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  UIView *v12;
  UIView *knob;
  void *v14;
  id v15;
  void *v16;
  objc_super v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  v18.receiver = self;
  v18.super_class = (Class)PNPWizardInkWeightControl;
  v3 = -[PNPWizardInkWeightControl initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = objc_alloc_init(PNPGradientView);
  gradient = v3->_gradient;
  v3->_gradient = v4;

  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.91, 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.67, 1.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPGradientView gradientLayer](v3->_gradient, "gradientLayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_retainAutorelease(v6);
  v19[0] = objc_msgSend(v9, "CGColor");
  v10 = objc_retainAutorelease(v7);
  v19[1] = objc_msgSend(v10, "CGColor");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setColors:", v11);

  objc_msgSend(v8, "setStartPoint:", 0.0, 0.5);
  objc_msgSend(v8, "setEndPoint:", 1.0, 0.5);
  objc_msgSend(v8, "setLocations:", &unk_24F4F6478);
  -[PNPWizardInkWeightControl addSubview:](v3, "addSubview:", v3->_gradient);
  v12 = (UIView *)objc_alloc_init(MEMORY[0x24BDF6F90]);
  knob = v3->_knob;
  v3->_knob = v12;

  -[UIView layer](v3->_knob, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.976, 1.0);
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v14, "setBorderColor:", objc_msgSend(v15, "CGColor"));

  -[UIView layer](v3->_knob, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBorderWidth:", 4.0);

  -[PNPWizardInkWeightControl addSubview:](v3, "addSubview:", v3->_knob);
  return v3;
}

- (id)_knobColor
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", self->_value * -0.24 + 0.91, 1.0);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIView *knob;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  -[PNPWizardInkWeightControl bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[PNPGradientView setFrame:](self->_gradient, "setFrame:");
  -[PNPGradientView _setContinuousCornerRadius:](self->_gradient, "_setContinuousCornerRadius:", v6 * 0.5);
  knob = self->_knob;
  -[PNPWizardInkWeightControl _knobColor](self, "_knobColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](knob, "setBackgroundColor:", v8);

  -[PNPWizardInkWeightControl intrinsicContentSize](self, "intrinsicContentSize");
  v10 = v9 * 2.6;
  UIRectCenteredYInRect();
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[PNPWizardInkWeightControl value](self, "value");
  -[UIView setFrame:](self->_knob, "setFrame:", (v4 - v6) * v17, v12, v14, v16);
  -[UIView _setCornerRadius:](self->_knob, "_setCornerRadius:", v10 * 0.5);
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 100.0;
  v3 = 10.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)value
{
  return self->_value;
}

- (void)setValue:(double)a3
{
  self->_value = fmin(fmax(a3, 0.0), 1.0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knob, 0);
  objc_storeStrong((id *)&self->_gradient, 0);
}

@end
