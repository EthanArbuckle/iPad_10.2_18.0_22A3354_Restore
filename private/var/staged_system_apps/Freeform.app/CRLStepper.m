@implementation CRLStepper

- (CRLStepper)init
{
  CRLStepper *v2;
  CRLStepper *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  UIButton *upButton;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  UIButton *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  UIButton *downButton;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  UIButton *v28;
  id v29;
  NSDictionary *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v38;
  uint64_t v39;
  objc_super v40;
  const __CFString *v41;
  void *v42;

  v40.receiver = self;
  v40.super_class = (Class)CRLStepper;
  v2 = -[CRLStepper initWithFrame:](&v40, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v3 = v2;
  if (v2)
  {
    v2->_currentValue = 0.0;
    v2->_increment = 1.0;
    v2->_minValue = 2.22507386e-308;
    v2->_maxValue = 1.79769313e308;
    v2->_continuousDifference = 1;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStepper layer](v2, "layer"));
    objc_msgSend(v4, "setCornerRadius:", 6.0);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStepper layer](v3, "layer"));
    objc_msgSend(v5, "setMasksToBounds:", 1);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStepper layer](v3, "layer"));
    objc_msgSend(v6, "setCornerCurve:", kCACornerCurveContinuous);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[CRLStepper setBackgroundColor:](v3, "setBackgroundColor:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("plus")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    LOBYTE(v38) = 0;
    v11 = objc_claimAutoreleasedReturnValue(+[CRLiOSMiniFormatterBuilder makeSmallButtonWith:title:action:backgroundColor:pressedBackgroundColor:foregroundColor:pressedForegroundColor:cornerRadius:italicTitle:](_TtC8Freeform26CRLiOSMiniFormatterBuilder, "makeSmallButtonWith:title:action:backgroundColor:pressedBackgroundColor:foregroundColor:pressedForegroundColor:cornerRadius:italicTitle:", v8, 0, 0, 0, 0, v9, 0.0, v10, v38));
    upButton = v3->_upButton;
    v3->_upButton = (UIButton *)v11;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v3->_upButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton setExclusiveTouch:](v3->_upButton, "setExclusiveTouch:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Increment"), 0, 0));
    -[UIButton setAccessibilityLabel:](v3->_upButton, "setAccessibilityLabel:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Increment"), 0, 0));
    -[UIButton setLargeContentTitle:](v3->_upButton, "setLargeContentTitle:", v16);

    v17 = v3->_upButton;
    v18 = objc_msgSend(objc_alloc((Class)UILargeContentViewerInteraction), "initWithDelegate:", v3);
    -[UIButton addInteraction:](v17, "addInteraction:", v18);

    -[CRLStepper addSubview:](v3, "addSubview:", v3->_upButton);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("minus")));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    LOBYTE(v39) = 0;
    v22 = objc_claimAutoreleasedReturnValue(+[CRLiOSMiniFormatterBuilder makeSmallButtonWith:title:action:backgroundColor:pressedBackgroundColor:foregroundColor:pressedForegroundColor:cornerRadius:italicTitle:](_TtC8Freeform26CRLiOSMiniFormatterBuilder, "makeSmallButtonWith:title:action:backgroundColor:pressedBackgroundColor:foregroundColor:pressedForegroundColor:cornerRadius:italicTitle:", v19, 0, 0, 0, 0, v20, 0.0, v21, v39));
    downButton = v3->_downButton;
    v3->_downButton = (UIButton *)v22;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v3->_downButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton setExclusiveTouch:](v3->_downButton, "setExclusiveTouch:", 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("Decrement"), 0, 0));
    -[UIButton setAccessibilityLabel:](v3->_downButton, "setAccessibilityLabel:", v25);

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("Decrement"), 0, 0));
    -[UIButton setLargeContentTitle:](v3->_downButton, "setLargeContentTitle:", v27);

    v28 = v3->_downButton;
    v29 = objc_msgSend(objc_alloc((Class)UILargeContentViewerInteraction), "initWithDelegate:", v3);
    -[UIButton addInteraction:](v28, "addInteraction:", v29);

    -[CRLStepper addSubview:](v3, "addSubview:", v3->_downButton);
    -[UIButton addTarget:action:forControlEvents:](v3->_upButton, "addTarget:action:forControlEvents:", v3, "handleUpButtonTouchDownEvent:", 1);
    -[UIButton addTarget:action:forControlEvents:](v3->_upButton, "addTarget:action:forControlEvents:", v3, "handleUpButtonTouchUpInsideEvent:", 448);
    -[UIButton addTarget:action:forControlEvents:](v3->_downButton, "addTarget:action:forControlEvents:", v3, "handleDownButtonTouchDownEvent:", 1);
    -[UIButton addTarget:action:forControlEvents:](v3->_downButton, "addTarget:action:forControlEvents:", v3, "handleDownButtonTouchUpInsideEvent:", 448);
    v30 = _NSDictionaryOfVariableBindings(CFSTR("_upButton, _downButton"), v3->_upButton, v3->_downButton, 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    v41 = CFSTR("buttonHeight");
    +[CRLiOSMiniFormatterBuilder defaultRowHeight](_TtC8Freeform26CRLiOSMiniFormatterBuilder, "defaultRowHeight");
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v42 = v32;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1));

    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[_downButton]-1-[_upButton(==_downButton)]|"), 0, v33, v31));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v34);

    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[_upButton(>=buttonHeight)]|"), 0, v33, v31));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v35);

    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[_downButton(>=buttonHeight)]|"), 0, v33, v31));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v36);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStepper timer](self, "timer"));
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)CRLStepper;
  -[CRLStepper dealloc](&v4, "dealloc");
}

- (void)p_updateContinuousDifference:(BOOL)a3
{
  int64_t v3;
  int64_t continuousDifference;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v3 = self->_continuousCounter + 1;
  self->_continuousCounter = v3;
  if (__ROR8__(0xCCCCCCCCCCCCCCCDLL * v3 + 0x1999999999999998, 1) <= 0x1999999999999998uLL)
  {
    continuousDifference = self->_continuousDifference;
    switch(continuousDifference)
    {
      case 1:
        v6 = 2;
        break;
      case 5:
        v6 = 10;
        break;
      case 2:
        v6 = 5;
        break;
      default:
        if (10 * continuousDifference <= continuousDifference)
          v6 = self->_continuousDifference;
        else
          v6 = 10 * continuousDifference;
        break;
    }
    if (a3)
    {
      -[CRLStepper maxValue](self, "maxValue");
      v8 = v7;
      -[CRLStepper currentValue](self, "currentValue");
    }
    else
    {
      -[CRLStepper currentValue](self, "currentValue");
      v8 = v10;
      -[CRLStepper minValue](self, "minValue");
    }
    v11 = v8 - v9;
    -[CRLStepper increment](self, "increment");
    if (v11 / (v12 * (double)v6) > 1.0)
      self->_continuousDifference = v6;
    self->_continuousCounter = 0;
  }
}

- (void)p_handleUpButtonTimer:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double continuousDifference;
  double v10;
  double v11;
  id v12;

  v12 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLStepper timer](self, "timer"));

  if (v4 == v12)
  {
    -[CRLStepper currentValue](self, "currentValue");
    v6 = v5;
    -[CRLStepper currentValue](self, "currentValue");
    v8 = v7;
    continuousDifference = (double)self->_continuousDifference;
    -[CRLStepper increment](self, "increment");
    -[CRLStepper setCurrentValue:](self, "setCurrentValue:", v8 + continuousDifference * v10);
    -[CRLStepper p_updateContinuousDifference:](self, "p_updateContinuousDifference:", 1);
    -[CRLStepper currentValue](self, "currentValue");
    if (v6 != v11)
      -[CRLStepper sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
  }
  else
  {
    objc_msgSend(v12, "invalidate");
  }

}

- (void)p_handleDownButtonTimer:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double continuousDifference;
  double v10;
  double v11;
  id v12;

  v12 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLStepper timer](self, "timer"));

  if (v4 == v12)
  {
    -[CRLStepper currentValue](self, "currentValue");
    v6 = v5;
    -[CRLStepper currentValue](self, "currentValue");
    v8 = v7;
    continuousDifference = (double)self->_continuousDifference;
    -[CRLStepper increment](self, "increment");
    -[CRLStepper setCurrentValue:](self, "setCurrentValue:", v8 - continuousDifference * v10);
    -[CRLStepper p_updateContinuousDifference:](self, "p_updateContinuousDifference:", 0);
    -[CRLStepper currentValue](self, "currentValue");
    if (v6 != v11)
      -[CRLStepper sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
  }
  else
  {
    objc_msgSend(v12, "invalidate");
  }

}

- (void)handleUpButtonTouchDownEvent:(id)a3
{
  void *v4;
  void *v5;
  dispatch_time_t v6;
  _QWORD block[5];

  if (-[CRLStepper continuous](self, "continuous", a3) && -[CRLStepper isEnabled](self, "isEnabled"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStepper timer](self, "timer"));

    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStepper timer](self, "timer"));
      objc_msgSend(v5, "invalidate");

    }
    self->_upButtonDepressed = 1;
    v6 = dispatch_time(0, 200000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1003E6F84;
    block[3] = &unk_10122D110;
    block[4] = self;
    dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, block);
    -[CRLStepper setCurrentValue:](self, "setCurrentValue:", self->_currentValue + self->_increment);
    -[CRLStepper sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 1);
    -[CRLStepper sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
  }
}

- (void)handleUpButtonTouchUpInsideEvent:(id)a3
{
  void *v4;

  if (-[CRLStepper continuous](self, "continuous", a3) && -[CRLStepper isEnabled](self, "isEnabled"))
  {
    self->_upButtonDepressed = 0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStepper timer](self, "timer"));
    objc_msgSend(v4, "invalidate");

    -[CRLStepper setTimer:](self, "setTimer:", 0);
    self->_continuousDifference = 1;
    self->_continuousCounter = 0;
  }
  else
  {
    if (!-[CRLStepper isEnabled](self, "isEnabled"))
      return;
    -[CRLStepper setCurrentValue:](self, "setCurrentValue:", self->_currentValue + self->_increment);
    -[CRLStepper sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
  }
  -[CRLStepper sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 64);
}

- (void)handleDownButtonTouchDownEvent:(id)a3
{
  void *v4;
  void *v5;
  dispatch_time_t v6;
  _QWORD block[5];

  if (-[CRLStepper continuous](self, "continuous", a3) && -[CRLStepper isEnabled](self, "isEnabled"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStepper timer](self, "timer"));

    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStepper timer](self, "timer"));
      objc_msgSend(v5, "invalidate");

    }
    self->_downButtonDepressed = 1;
    v6 = dispatch_time(0, 200000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1003E71DC;
    block[3] = &unk_10122D110;
    block[4] = self;
    dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, block);
    -[CRLStepper setCurrentValue:](self, "setCurrentValue:", self->_currentValue - self->_increment);
    -[CRLStepper sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 1);
    -[CRLStepper sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
  }
}

- (void)handleDownButtonTouchUpInsideEvent:(id)a3
{
  void *v4;

  if (-[CRLStepper continuous](self, "continuous", a3) && -[CRLStepper isEnabled](self, "isEnabled"))
  {
    self->_downButtonDepressed = 0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStepper timer](self, "timer"));
    objc_msgSend(v4, "invalidate");

    -[CRLStepper setTimer:](self, "setTimer:", 0);
    self->_continuousDifference = 1;
    self->_continuousCounter = 0;
  }
  else
  {
    if (!-[CRLStepper isEnabled](self, "isEnabled"))
      return;
    -[CRLStepper setCurrentValue:](self, "setCurrentValue:", self->_currentValue - self->_increment);
    -[CRLStepper sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
  }
  -[CRLStepper sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 64);
}

- (void)setCurrentValue:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  long double v10;
  double v11;

  -[CRLStepper minValue](self, "minValue");
  v6 = v5;
  -[CRLStepper maxValue](self, "maxValue");
  v8 = v7;
  -[CRLStepper increment](self, "increment");
  v10 = v9;
  -[CRLStepper maxValue](self, "maxValue");
  sub_1003E7404(a3, v6, v8, v10);
  self->_currentValue = v11;
  -[UIButton setEnabled:](self->_upButton, "setEnabled:", v11 < self->_maxValue);
  -[UIButton setEnabled:](self->_downButton, "setEnabled:", self->_currentValue > self->_minValue);
}

- (void)setIncrement:(double)a3
{
  if (a3 > 0.0)
    self->_increment = a3;
}

- (void)setMaxValue:(double)a3
{
  double v5;

  self->_maxValue = a3;
  -[CRLStepper currentValue](self, "currentValue");
  -[UIButton setEnabled:](self->_upButton, "setEnabled:", v5 < a3);
}

- (void)setMinValue:(double)a3
{
  double v5;

  self->_minValue = a3;
  -[CRLStepper currentValue](self, "currentValue");
  -[UIButton setEnabled:](self->_downButton, "setEnabled:", v5 > a3);
}

- (id)i_upButton
{
  return self->_upButton;
}

- (id)i_downButton
{
  return self->_downButton;
}

- (id)viewControllerForLargeContentViewerInteraction:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStepper crlaxPreferredViewControllerForLargeContent](self, "crlaxPreferredViewControllerForLargeContent", a3));
  if (v4)
    v5 = objc_claimAutoreleasedReturnValue(-[CRLStepper crlaxPreferredViewControllerForLargeContent](self, "crlaxPreferredViewControllerForLargeContent"));
  else
    v5 = objc_claimAutoreleasedReturnValue(-[CRLStepper crlaxDefaultViewControllerForLargeContent](self, "crlaxDefaultViewControllerForLargeContent"));
  v6 = (void *)v5;

  return v6;
}

- (double)currentValue
{
  return self->_currentValue;
}

- (double)increment
{
  return self->_increment;
}

- (double)minValue
{
  return self->_minValue;
}

- (double)maxValue
{
  return self->_maxValue;
}

- (BOOL)continuous
{
  return self->_continuous;
}

- (void)setContinuous:(BOOL)a3
{
  self->_continuous = a3;
}

- (UIViewController)crlaxDefaultViewControllerForLargeContent
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_crlaxDefaultViewControllerForLargeContent);
}

- (void)setCrlaxDefaultViewControllerForLargeContent:(id)a3
{
  objc_storeWeak((id *)&self->_crlaxDefaultViewControllerForLargeContent, a3);
}

- (UIViewController)crlaxPreferredViewControllerForLargeContent
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_crlaxPreferredViewControllerForLargeContent);
}

- (void)setCrlaxPreferredViewControllerForLargeContent:(id)a3
{
  objc_storeWeak((id *)&self->_crlaxPreferredViewControllerForLargeContent, a3);
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (UIButton)downButton
{
  return self->_downButton;
}

- (UIButton)upButton
{
  return self->_upButton;
}

- (int64_t)continuousCounter
{
  return self->_continuousCounter;
}

- (void)setContinuousCounter:(int64_t)a3
{
  self->_continuousCounter = a3;
}

- (int64_t)continuousDifference
{
  return self->_continuousDifference;
}

- (void)setContinuousDifference:(int64_t)a3
{
  self->_continuousDifference = a3;
}

- (BOOL)upButtonDepressed
{
  return self->_upButtonDepressed;
}

- (void)setUpButtonDepressed:(BOOL)a3
{
  self->_upButtonDepressed = a3;
}

- (BOOL)downButtonDepressed
{
  return self->_downButtonDepressed;
}

- (void)setDownButtonDepressed:(BOOL)a3
{
  self->_downButtonDepressed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_upButton, 0);
  objc_storeStrong((id *)&self->_downButton, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_destroyWeak((id *)&self->_crlaxPreferredViewControllerForLargeContent);
  objc_destroyWeak((id *)&self->_crlaxDefaultViewControllerForLargeContent);
}

@end
