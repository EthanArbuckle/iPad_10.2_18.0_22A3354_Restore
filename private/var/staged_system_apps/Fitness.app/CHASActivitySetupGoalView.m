@implementation CHASActivitySetupGoalView

- (CHASActivitySetupGoalView)initWithFrame:(CGRect)a3 configuration:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  CHASActivitySetupGoalView *v11;
  CHASActivitySetupGoalView *v12;
  UILabel *v13;
  UILabel *goalLabel;
  void *v15;
  UILabel *v16;
  void *v17;
  void *v18;
  UILabel *v19;
  UILabel *unitLabel;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  UIButton *minusButton;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  UIButton *plusButton;
  UILabel *v33;
  void *v34;
  FIUIValueAdjustmentButtonController *v35;
  FIUIValueAdjustmentButtonController *buttonController;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[4];
  id v42;
  id location;
  objc_super v44;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v44.receiver = self;
  v44.super_class = (Class)CHASActivitySetupGoalView;
  v11 = -[CHASActivitySetupGoalView initWithFrame:](&v44, "initWithFrame:", x, y, width, height);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_configuration, a4);
    v13 = (UILabel *)objc_alloc_init((Class)UILabel);
    goalLabel = v12->_goalLabel;
    v12->_goalLabel = v13;

    -[UILabel setTextAlignment:](v12->_goalLabel, "setTextAlignment:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[UILabel setTextColor:](v12->_goalLabel, "setTextColor:", v15);

    v16 = v12->_goalLabel;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:design:](UIFont, "systemFontOfSize:weight:design:", UIFontSystemFontDesignRounded, 72.0, UIFontWeightSemibold));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "fu_monospacedFont"));
    -[UILabel setFont:](v16, "setFont:", v18);

    -[UILabel setAdjustsFontSizeToFitWidth:](v12->_goalLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setText:](v12->_goalLabel, "setText:", CFSTR("300"));
    v19 = (UILabel *)objc_alloc_init((Class)UILabel);
    unitLabel = v12->_unitLabel;
    v12->_unitLabel = v19;

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "goalColor"));
    -[UILabel setTextColor:](v12->_unitLabel, "setTextColor:", v21);

    -[UILabel setTextAlignment:](v12->_unitLabel, "setTextAlignment:", 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", UIFontTextStyleTitle2, 2, 1));
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", 0.0));
    -[UILabel setFont:](v12->_unitLabel, "setFont:");
    v22 = objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 48.0));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:withConfiguration:](UIImage, "_systemImageNamed:withConfiguration:", CFSTR("minus.circle.fill"), v22));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "goalColor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "imageWithTintColor:renderingMode:", v24, 1));

    v26 = objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
    minusButton = v12->_minusButton;
    v12->_minusButton = (UIButton *)v26;

    -[UIButton setImage:forState:](v12->_minusButton, "setImage:forState:", v25, 0);
    v38 = (void *)v22;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:withConfiguration:](UIImage, "_systemImageNamed:withConfiguration:", CFSTR("plus.circle.fill"), v22));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "goalColor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "imageWithTintColor:renderingMode:", v29, 1));

    v31 = objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
    plusButton = v12->_plusButton;
    v12->_plusButton = (UIButton *)v31;

    -[UIButton setImage:forState:](v12->_plusButton, "setImage:forState:", v30, 0);
    -[CHASActivitySetupGoalView addSubview:](v12, "addSubview:", v12->_minusButton);
    -[CHASActivitySetupGoalView addSubview:](v12, "addSubview:", v12->_goalLabel);
    v33 = v12->_unitLabel;
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[UILabel setTextColor:](v33, "setTextColor:", v34);

    -[CHASActivitySetupGoalView addSubview:](v12, "addSubview:", v12->_unitLabel);
    -[CHASActivitySetupGoalView addSubview:](v12, "addSubview:", v12->_plusButton);
    v35 = (FIUIValueAdjustmentButtonController *)objc_alloc_init((Class)FIUIValueAdjustmentButtonController);
    buttonController = v12->_buttonController;
    v12->_buttonController = v35;

    -[FIUIValueAdjustmentButtonController setIncrementButton:decrementButton:](v12->_buttonController, "setIncrementButton:decrementButton:", v12->_plusButton, v12->_minusButton);
    objc_msgSend(v10, "minimumValue");
    -[FIUIValueAdjustmentButtonController setMinValue:](v12->_buttonController, "setMinValue:");
    objc_msgSend(v10, "maximumValue");
    -[FIUIValueAdjustmentButtonController setMaxValue:](v12->_buttonController, "setMaxValue:");
    objc_msgSend(v10, "valueIncrement");
    -[FIUIValueAdjustmentButtonController setMinumumStepValueIncrement:](v12->_buttonController, "setMinumumStepValueIncrement:");
    objc_msgSend(v10, "valueIncrement");
    -[FIUIValueAdjustmentButtonController setValueStepIncremement:](v12->_buttonController, "setValueStepIncremement:");
    objc_initWeak(&location, v12);
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_10008BA90;
    v41[3] = &unk_100777C80;
    objc_copyWeak(&v42, &location);
    -[FIUIValueAdjustmentButtonController setValueUpdateHandler:](v12->_buttonController, "setValueUpdateHandler:", v41);
    objc_destroyWeak(&v42);
    objc_destroyWeak(&location);

  }
  return v12;
}

- (void)layoutSubviews
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v7;
  double v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  id v38;
  double v39;
  double v40;
  double v41;
  UILabel *unitLabel;
  double MidX;
  objc_super v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;

  v44.receiver = self;
  v44.super_class = (Class)CHASActivitySetupGoalView;
  -[CHASActivitySetupGoalView layoutSubviews](&v44, "layoutSubviews");
  -[CHASActivitySetupGoalView bounds](self, "bounds");
  x = v45.origin.x;
  y = v45.origin.y;
  width = v45.size.width;
  height = v45.size.height;
  if (!CGRectIsEmpty(v45))
  {
    -[CHASActivitySetupGoalViewConfiguration unitTextYOffset](self->_configuration, "unitTextYOffset");
    v8 = v7;
    -[UIButton sizeToFit](self->_minusButton, "sizeToFit");
    -[UIButton sizeToFit](self->_plusButton, "sizeToFit");
    -[CHASActivitySetupGoalView _fitGoalLabel](self, "_fitGoalLabel");
    v46.origin.x = x;
    v46.origin.y = y;
    v46.size.width = width;
    v46.size.height = height;
    v9 = CGRectGetMaxX(v46) + -32.0;
    -[UIButton frame](self->_plusButton, "frame");
    v10 = v9 - CGRectGetWidth(v47) * 0.5;
    -[UILabel center](self->_goalLabel, "center");
    -[UIButton setCenter:](self->_plusButton, "setCenter:", v10);
    -[UIButton frame](self->_minusButton, "frame");
    v11 = CGRectGetWidth(v48) * 0.5 + 32.0;
    -[UILabel center](self->_goalLabel, "center");
    -[UIButton setCenter:](self->_minusButton, "setCenter:", v11);
    v12 = -[UIButton frame](self->_plusButton, "frame");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v21 = FIUIDeviceScale(v12);
    UIRectIntegralWithScale(v14, v16, v18, v20, v21);
    -[UIButton setFrame:](self->_plusButton, "setFrame:");
    v22 = -[UIButton frame](self->_minusButton, "frame");
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v30 = v29;
    v31 = FIUIDeviceScale(v22);
    UIRectIntegralWithScale(v24, v26, v28, v30, v31);
    -[UIButton setFrame:](self->_minusButton, "setFrame:");
    -[UILabel sizeToFit](self->_unitLabel, "sizeToFit");
    -[UILabel frame](self->_unitLabel, "frame");
    v33 = v32;
    v35 = v34;
    v37 = v36;
    v38 = -[CHASActivitySetupGoalView frame](self, "frame");
    v40 = v39;
    v41 = FIUIDeviceScale(v38);
    UIRectIntegralWithScale(v33, v35, v40, v37, v41);
    -[UILabel setFrame:](self->_unitLabel, "setFrame:");
    unitLabel = self->_unitLabel;
    -[UILabel frame](self->_goalLabel, "frame");
    MidX = CGRectGetMidX(v49);
    -[UILabel frame](self->_goalLabel, "frame");
    -[UILabel setCenter:](unitLabel, "setCenter:", MidX, v8 + CGRectGetMaxY(v50));
  }
}

- (void)_fitGoalLabel
{
  double MaxX;
  double v4;
  double v5;
  UILabel *goalLabel;
  void *v7;
  CGRect v8;
  CGRect v9;
  CGRect v10;
  CGRect v11;

  -[CHASActivitySetupGoalView _formatGoalLabel](self, "_formatGoalLabel");
  if (self->_shouldUpdateValueLabel)
  {
    -[UIButton frame](self->_minusButton, "frame");
    MaxX = CGRectGetMaxX(v8);
    -[UILabel frame](self->_goalLabel, "frame");
    if (MaxX <= CGRectGetMinX(v9)
      && (-[UILabel frame](self->_goalLabel, "frame"),
          v4 = CGRectGetMaxX(v10),
          -[UIButton frame](self->_plusButton, "frame"),
          v4 <= CGRectGetMinX(v11)))
    {
      v5 = 72.0;
    }
    else
    {
      v5 = 54.0;
    }
    goalLabel = self->_goalLabel;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:design:](UIFont, "systemFontOfSize:weight:design:", UIFontSystemFontDesignRounded, v5, UIFontWeightSemibold));
    -[UILabel setFont:](goalLabel, "setFont:", v7);

    -[CHASActivitySetupGoalView _formatGoalLabel](self, "_formatGoalLabel");
  }
}

- (void)_formatGoalLabel
{
  UILabel *goalLabel;
  double MidX;
  double MinX;
  double Width;
  double Height;
  uint64_t v8;
  double v9;
  CGRect v10;
  CGRect v11;
  CGRect v12;
  CGRect v13;
  CGRect v14;

  -[UILabel sizeToFit](self->_goalLabel, "sizeToFit");
  goalLabel = self->_goalLabel;
  -[CHASActivitySetupGoalView bounds](self, "bounds");
  MidX = CGRectGetMidX(v10);
  -[CHASActivitySetupGoalView bounds](self, "bounds");
  -[UILabel setCenter:](goalLabel, "setCenter:", MidX, CGRectGetMidY(v11));
  -[UILabel frame](self->_goalLabel, "frame");
  MinX = CGRectGetMinX(v12);
  -[UILabel frame](self->_goalLabel, "frame");
  Width = CGRectGetWidth(v13);
  -[UILabel frame](self->_goalLabel, "frame");
  Height = CGRectGetHeight(v14);
  v9 = FIUIDeviceScale(v8);
  UIRectIntegralWithScale(MinX, 0.0, Width, Height, v9);
  -[UILabel setFrame:](self->_goalLabel, "setFrame:");
}

- (void)buttonControllerDidUpdate
{
  void *v3;
  HKQuantity *v4;
  HKQuantity *dailyGoal;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupGoalViewConfiguration unit](self->_configuration, "unit"));
  -[FIUIValueAdjustmentButtonController value](self->_buttonController, "value");
  v4 = (HKQuantity *)objc_claimAutoreleasedReturnValue(+[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v3));
  dailyGoal = self->_dailyGoal;
  self->_dailyGoal = v4;

  -[CHASActivitySetupGoalView _updateGoalLabelWithGoal:](self, "_updateGoalLabelWithGoal:", self->_dailyGoal);
  v6 = (id)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupGoalView delegate](self, "delegate"));
  objc_msgSend(v6, "setupGoalViewValueChanged:value:", self, self->_dailyGoal);

}

- (void)_updateGoalLabelWithGoal:(id)a3
{
  uint64_t (**v4)(_QWORD, _QWORD);
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  unint64_t v9;
  void *v10;
  id v11;
  uint64_t (**v12)(_QWORD, _QWORD);
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a3;
  v4 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[CHASActivitySetupGoalViewConfiguration goalValueStringFormatter](self->_configuration, "goalValueStringFormatter"));
  v5 = ((uint64_t (**)(_QWORD, id))v4)[2](v4, v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  -[UILabel setText:](self->_goalLabel, "setText:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupGoalViewConfiguration unit](self->_configuration, "unit"));
  objc_msgSend(v15, "doubleValueForUnit:", v7);
  v9 = (unint64_t)v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), v9));
  v11 = objc_msgSend(v10, "length");

  if (v11 == (id)self->_valueLabelSizeLength)
  {
    self->_shouldUpdateValueLabel = 0;
  }
  else
  {
    self->_valueLabelSizeLength = (unint64_t)v11;
    self->_shouldUpdateValueLabel = 1;
    -[CHASActivitySetupGoalView setNeedsLayout](self, "setNeedsLayout");
  }
  v12 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[CHASActivitySetupGoalViewConfiguration goalUnitStringFormatter](self->_configuration, "goalUnitStringFormatter"));
  v13 = ((uint64_t (**)(_QWORD, id))v12)[2](v12, v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  -[UILabel setText:](self->_unitLabel, "setText:", v14);

}

- (void)setGoal:(id)a3
{
  FIUIValueAdjustmentButtonController *buttonController;
  void *v6;
  double v7;
  id v8;

  objc_storeStrong((id *)&self->_dailyGoal, a3);
  v8 = a3;
  buttonController = self->_buttonController;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupGoalViewConfiguration unit](self->_configuration, "unit"));
  objc_msgSend(v8, "doubleValueForUnit:", v6);
  -[FIUIValueAdjustmentButtonController setValue:](buttonController, "setValue:", round(v7));

  -[CHASActivitySetupGoalView _updateGoalLabelWithGoal:](self, "_updateGoalLabelWithGoal:", v8);
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v3, "bounds");
  v5 = v4;

  LODWORD(v6) = 1148846080;
  LODWORD(v7) = 1112014848;
  -[UILabel _systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self->_goalLabel, "_systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v5, 1.79769313e308, v6, v7);
  v9 = v8 + 0.0;
  LODWORD(v10) = 1148846080;
  LODWORD(v11) = 1112014848;
  -[UILabel _systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self->_unitLabel, "_systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v5, 1.79769313e308, v10, v11);
  v13 = v9 + v12;
  -[CHASActivitySetupGoalViewConfiguration unitTextYOffset](self->_configuration, "unitTextYOffset");
  v15 = v13 + v14;
  v16 = UIViewNoIntrinsicMetric;
  result.height = v15;
  result.width = v16;
  return result;
}

- (CHASActivitySetupGoalViewDelegate)delegate
{
  return (CHASActivitySetupGoalViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HKQuantity)dailyGoal
{
  return self->_dailyGoal;
}

- (void)setDailyGoal:(id)a3
{
  objc_storeStrong((id *)&self->_dailyGoal, a3);
}

- (CHASActivitySetupGoalViewConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (FIUIValueAdjustmentButtonController)buttonController
{
  return self->_buttonController;
}

- (void)setButtonController:(id)a3
{
  objc_storeStrong((id *)&self->_buttonController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonController, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_dailyGoal, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_plusButton, 0);
  objc_storeStrong((id *)&self->_minusButton, 0);
  objc_storeStrong((id *)&self->_unitLabel, 0);
  objc_storeStrong((id *)&self->_goalLabel, 0);
}

@end
