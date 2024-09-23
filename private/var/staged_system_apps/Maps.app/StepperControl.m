@implementation StepperControl

- (StepperControl)initWithFrame:(CGRect)a3
{
  StepperControl *v3;
  UILabel *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSString *singularValueTitleFormat;
  NSString *pluralValueTitleFormat;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)StepperControl;
  v3 = -[StepperControl initWithFrame:](&v21, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_opt_new(UILabel);
    -[StepperControl setTitleLabel:](v3, "setTitleLabel:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 15.0));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[StepperControl titleLabel](v3, "titleLabel"));
    objc_msgSend(v6, "setFont:", v5);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[StepperControl titleLabel](v3, "titleLabel"));
    objc_msgSend(v8, "setTextColor:", v7);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
    -[StepperControl setMinusButton:](v3, "setMinusButton:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
    -[StepperControl setPlusButton:](v3, "setPlusButton:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[StepperControl minusButton](v3, "minusButton"));
    objc_msgSend(v11, "setTitle:forState:", CFSTR("−"), 0);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[StepperControl plusButton](v3, "plusButton"));
    objc_msgSend(v12, "setTitle:forState:", CFSTR("+"), 0);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[StepperControl minusButton](v3, "minusButton"));
    objc_msgSend(v13, "addTarget:action:forControlEvents:", v3, "minusButtonTapped:", 64);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[StepperControl plusButton](v3, "plusButton"));
    objc_msgSend(v14, "addTarget:action:forControlEvents:", v3, "plusButtonTapped:", 64);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[StepperControl titleLabel](v3, "titleLabel"));
    -[StepperControl addSubview:](v3, "addSubview:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[StepperControl minusButton](v3, "minusButton"));
    -[StepperControl addSubview:](v3, "addSubview:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[StepperControl plusButton](v3, "plusButton"));
    -[StepperControl addSubview:](v3, "addSubview:", v17);

    v3->_minValue = 0;
    v3->_maxValue = -1;
    v3->_value = 0;
    singularValueTitleFormat = v3->_singularValueTitleFormat;
    v3->_singularValueTitleFormat = (NSString *)CFSTR("%ld");

    pluralValueTitleFormat = v3->_pluralValueTitleFormat;
    v3->_pluralValueTitleFormat = (NSString *)CFSTR("%ld");

    -[StepperControl setupConstraints](v3, "setupConstraints");
  }
  return v3;
}

- (void)setupConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[StepperControl plusButton](self, "plusButton"));
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[StepperControl minusButton](self, "minusButton"));
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[StepperControl titleLabel](self, "titleLabel"));
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[StepperControl setTranslatesAutoresizingMaskIntoConstraints:](self, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[StepperControl trailingAnchor](self, "trailingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[StepperControl plusButton](self, "plusButton"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "trailingAnchor"));
  v37 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:", v8));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[StepperControl titleLabel](self, "titleLabel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "trailingAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[StepperControl plusButton](self, "plusButton"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "leadingAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:constant:", v12, -8.0));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[StepperControl plusButton](self, "plusButton"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v13, 10, 0, self, 10, 1.0, 0.0));

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[StepperControl titleLabel](self, "titleLabel"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "leadingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[StepperControl minusButton](self, "minusButton"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "trailingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:constant:", v18, 8.0));

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[StepperControl titleLabel](self, "titleLabel"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v20, 10, 0, self, 10, 1.0, 0.0));

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[StepperControl minusButton](self, "minusButton"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "leadingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[StepperControl leadingAnchor](self, "leadingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v24));

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[StepperControl minusButton](self, "minusButton"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v26, 10, 0, self, 10, 1.0, 0.0));

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[StepperControl topAnchor](self, "topAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[StepperControl plusButton](self, "plusButton"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "topAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v30));

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[StepperControl bottomAnchor](self, "bottomAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[StepperControl plusButton](self, "plusButton"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "bottomAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v34));

  objc_msgSend(v37, "setActive:", 1);
  objc_msgSend(v36, "setActive:", 1);
  objc_msgSend(v14, "setActive:", 1);
  objc_msgSend(v19, "setActive:", 1);
  objc_msgSend(v21, "setActive:", 1);
  objc_msgSend(v25, "setActive:", 1);
  objc_msgSend(v27, "setActive:", 1);
  objc_msgSend(v31, "setActive:", 1);
  objc_msgSend(v35, "setActive:", 1);

}

- (void)updateLabel
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if ((id)-[StepperControl value](self, "value") == (id)1)
    v3 = objc_claimAutoreleasedReturnValue(-[StepperControl singularValueTitleFormat](self, "singularValueTitleFormat"));
  else
    v3 = objc_claimAutoreleasedReturnValue(-[StepperControl pluralValueTitleFormat](self, "pluralValueTitleFormat"));
  v8 = (id)v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[StepperControl value](self, "value")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("%ld"), v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[StepperControl titleLabel](self, "titleLabel"));
  objc_msgSend(v7, "setText:", v6);

}

- (void)minusButtonTapped:(id)a3
{
  -[StepperControl setValue:](self, "setValue:", (char *)-[StepperControl value](self, "value", a3) - 1);
}

- (void)plusButtonTapped:(id)a3
{
  -[StepperControl setValue:](self, "setValue:", (char *)-[StepperControl value](self, "value", a3) + 1);
}

- (void)setPluralValueTitleFormat:(id)a3
{
  NSString *v4;
  NSString *pluralValueTitleFormat;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqualToString:", self->_pluralValueTitleFormat) & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    pluralValueTitleFormat = self->_pluralValueTitleFormat;
    self->_pluralValueTitleFormat = v4;

    -[StepperControl updateLabel](self, "updateLabel");
  }

}

- (void)setSingularValueTitleFormat:(id)a3
{
  NSString *v4;
  NSString *singularValueTitleFormat;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqualToString:", self->_singularValueTitleFormat) & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    singularValueTitleFormat = self->_singularValueTitleFormat;
    self->_singularValueTitleFormat = v4;

    -[StepperControl updateLabel](self, "updateLabel");
  }

}

- (void)setValue:(unint64_t)a3
{
  if (self->_value != a3
    && -[StepperControl maxValue](self, "maxValue") >= a3
    && -[StepperControl minValue](self, "minValue") <= a3)
  {
    self->_value = a3;
    -[StepperControl updateLabel](self, "updateLabel");
    -[StepperControl sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
  }
}

- (void)setMinValue:(unint64_t)a3
{
  if (self->_minValue != a3 && self->_maxValue >= a3)
  {
    self->_minValue = a3;
    if (self->_value < a3)
      -[StepperControl setValue:](self, "setValue:");
  }
}

- (void)setMaxValue:(unint64_t)a3
{
  if (self->_maxValue != a3 && self->_minValue <= a3)
    self->_maxValue = a3;
}

- (unint64_t)minValue
{
  return self->_minValue;
}

- (unint64_t)maxValue
{
  return self->_maxValue;
}

- (NSString)singularValueTitleFormat
{
  return self->_singularValueTitleFormat;
}

- (NSString)pluralValueTitleFormat
{
  return self->_pluralValueTitleFormat;
}

- (unint64_t)value
{
  return self->_value;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UIButton)plusButton
{
  return self->_plusButton;
}

- (void)setPlusButton:(id)a3
{
  objc_storeStrong((id *)&self->_plusButton, a3);
}

- (UIButton)minusButton
{
  return self->_minusButton;
}

- (void)setMinusButton:(id)a3
{
  objc_storeStrong((id *)&self->_minusButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minusButton, 0);
  objc_storeStrong((id *)&self->_plusButton, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_pluralValueTitleFormat, 0);
  objc_storeStrong((id *)&self->_singularValueTitleFormat, 0);
}

@end
