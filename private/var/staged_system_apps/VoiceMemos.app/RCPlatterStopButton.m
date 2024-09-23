@implementation RCPlatterStopButton

- (RCPlatterStopButton)initWithFrame:(CGRect)a3
{
  RCPlatterStopButton *v3;
  RCPlatterStopButton *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RCPlatterStopButton;
  v3 = -[RCPlatterStopButton initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[RCPlatterStopButton _setupCAPackageManager](v3, "_setupCAPackageManager");
    -[RCPlatterStopButton _setupLongPressGestureRecognizer](v4, "_setupLongPressGestureRecognizer");
  }
  return v4;
}

- (void)setState:(unint64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  if (self->_state != a3 || !-[RCPlatterStopButton didSetInitialMicaState](self, "didSetInitialMicaState"))
  {
    self->_state = a3;
    v5 = 3;
    if (a3 != 2)
      v5 = 0;
    if (a3 == 1)
      v6 = 1;
    else
      v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterStopButton packageManager](self, "packageManager"));
    objc_msgSend(v7, "setMicaState:", v6);

    -[RCPlatterStopButton setDidSetInitialMicaState:](self, "setDidSetInitialMicaState:", 1);
    -[RCPlatterStopButton setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)transitionToState:(unint64_t)a3 viaState:(unint64_t)a4 transitionDuration:(double)a5
{
  dispatch_time_t v8;
  _QWORD v9[6];

  -[RCPlatterStopButton setState:](self, "setState:", a4);
  v8 = dispatch_time(0, (uint64_t)(a5 * 1000000000.0));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000406F0;
  v9[3] = &unk_1001ABE10;
  v9[4] = self;
  v9[5] = a3;
  dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, v9);
}

- (void)didTapOnStopButton:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[RCPlatterStopButton delegate](self, "delegate", a3));
  objc_msgSend(v4, "didTapOnStopButton:", self);

}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  RCPlatterStopButton *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  __int128 v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  double MidX;
  double MidY;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  CGAffineTransform v26;
  CGAffineTransform v27;
  _OWORD v28[3];
  objc_super v29;
  CGRect v30;
  CGRect v31;

  v29.receiver = self;
  v29.super_class = (Class)RCPlatterStopButton;
  -[RCPlatterStopButton layoutSubviews](&v29, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterStopButton packageManager](self, "packageManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));
  v5 = (RCPlatterStopButton *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "superview"));

  if (v5 != self)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterStopButton packageManager](self, "packageManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
    -[RCPlatterStopButton addSubview:](self, "addSubview:", v7);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  objc_msgSend(v8, "platterStopButtonHeight");
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterStopButton packageManager](self, "packageManager"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "view"));
  v13 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v28[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v28[1] = v13;
  v28[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  objc_msgSend(v12, "setTransform:", v28);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterStopButton packageManager](self, "packageManager"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "view"));
  objc_msgSend(v15, "setFrame:", 0.0, 0.0, v10, v10);

  -[RCPlatterStopButton bounds](self, "bounds");
  CGAffineTransformMakeScale(&v27, v16 / v10, v16 / v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterStopButton packageManager](self, "packageManager"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "view"));
  v26 = v27;
  objc_msgSend(v18, "setTransform:", &v26);

  -[RCPlatterStopButton bounds](self, "bounds");
  MidX = CGRectGetMidX(v30);
  -[RCPlatterStopButton bounds](self, "bounds");
  MidY = CGRectGetMidY(v31);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterStopButton packageManager](self, "packageManager"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "view"));
  objc_msgSend(v22, "setCenter:", MidX, MidY);

  if (-[RCPlatterStopButton didSetInitialMicaState](self, "didSetInitialMicaState"))
  {
    -[RCPlatterStopButton bounds](self, "bounds");
    if (v23 == 0.0 || (-[RCPlatterStopButton bounds](self, "bounds"), v24 == 0.0))
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterStopButton packageManager](self, "packageManager"));
      objc_msgSend(v25, "pauseAnimations");
    }
    else
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterStopButton packageManager](self, "packageManager"));
      objc_msgSend(v25, "resumeAnimations");
    }

  }
}

- (void)_setupCAPackageManager
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[RCPlatterStopButtonCAPackageManager stopButtonPackageManager](RCPlatterStopButtonCAPackageManager, "stopButtonPackageManager"));
  -[RCPlatterStopButton setPackageManager:](self, "setPackageManager:", v3);

}

- (void)_setupLongPressGestureRecognizer
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = objc_msgSend(objc_alloc((Class)UILongPressGestureRecognizer), "initWithTarget:action:", self, "_handleUserTouch:");
  -[RCPlatterStopButton setLongPressRecognizer:](self, "setLongPressRecognizer:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterStopButton longPressRecognizer](self, "longPressRecognizer"));
  -[RCPlatterStopButton addGestureRecognizer:](self, "addGestureRecognizer:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterStopButton longPressRecognizer](self, "longPressRecognizer"));
  objc_msgSend(v5, "setMinimumPressDuration:", 0.0);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[RCPlatterStopButton longPressRecognizer](self, "longPressRecognizer"));
  objc_msgSend(v6, "setDelegate:", self);

}

- (void)_handleUserTouch:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;

  v4 = a3;
  objc_msgSend(v4, "locationInView:", self);
  v6 = v5;
  v8 = v7;
  v9 = objc_msgSend(v4, "state");

  switch((unint64_t)v9)
  {
    case 1uLL:
      goto LABEL_3;
    case 2uLL:
      if (!-[RCPlatterStopButton _stopButtonContainsPoint:](self, "_stopButtonContainsPoint:", v6, v8))
        return;
LABEL_3:
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterStopButton packageManager](self, "packageManager"));
      v12 = v10;
      v11 = 2;
      goto LABEL_8;
    case 3uLL:
      if (!-[RCPlatterStopButton _stopButtonContainsPoint:](self, "_stopButtonContainsPoint:", v6, v8))
        goto LABEL_7;
      v12 = (id)objc_claimAutoreleasedReturnValue(-[RCPlatterStopButton delegate](self, "delegate"));
      objc_msgSend(v12, "didTapOnStopButton:", self);
      goto LABEL_9;
    case 4uLL:
LABEL_7:
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterStopButton packageManager](self, "packageManager"));
      v12 = v10;
      v11 = 1;
LABEL_8:
      objc_msgSend(v10, "setMicaState:", v11);
LABEL_9:

      break;
    default:
      return;
  }
}

- (BOOL)_stopButtonContainsPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  CGPoint v6;
  CGRect v7;

  y = a3.y;
  x = a3.x;
  -[RCPlatterStopButton bounds](self, "bounds");
  v6.x = x;
  v6.y = y;
  return CGRectContainsPoint(v7, v6);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[RCPlatterStopButton longPressRecognizer](self, "longPressRecognizer"));

  return v6 != v5 || (id)-[RCPlatterStopButton state](self, "state") == (id)1;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  if ((id)-[RCPlatterStopButton state](self, "state") == (id)1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    v5 = CFSTR("STOP");
  }
  else
  {
    if ((id)-[RCPlatterStopButton state](self, "state") != (id)2)
    {
      v6 = 0;
      return v6;
    }
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    v5 = CFSTR("AX_RECORDING_STOPPED");
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1001B2BC0, 0));

  return v6;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  UIAccessibilityTraits *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RCPlatterStopButton;
  v3 = -[RCPlatterStopButton accessibilityTraits](&v6, "accessibilityTraits");
  if ((id)-[RCPlatterStopButton state](self, "state") == (id)1)
  {
    v4 = &UIAccessibilityTraitButton;
LABEL_5:
    v3 |= *v4;
    return v3;
  }
  if ((id)-[RCPlatterStopButton state](self, "state") == (id)2)
  {
    v4 = &UIAccessibilityTraitImage;
    goto LABEL_5;
  }
  return v3;
}

- (RCPlatterStopButtonDelegate)delegate
{
  return (RCPlatterStopButtonDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)state
{
  return self->_state;
}

- (RCPlatterStopButtonCAPackageManager)packageManager
{
  return self->_packageManager;
}

- (void)setPackageManager:(id)a3
{
  objc_storeStrong((id *)&self->_packageManager, a3);
}

- (BOOL)didSetInitialMicaState
{
  return self->_didSetInitialMicaState;
}

- (void)setDidSetInitialMicaState:(BOOL)a3
{
  self->_didSetInitialMicaState = a3;
}

- (UILongPressGestureRecognizer)longPressRecognizer
{
  return self->_longPressRecognizer;
}

- (void)setLongPressRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_longPressRecognizer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_longPressRecognizer, 0);
  objc_storeStrong((id *)&self->_packageManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
