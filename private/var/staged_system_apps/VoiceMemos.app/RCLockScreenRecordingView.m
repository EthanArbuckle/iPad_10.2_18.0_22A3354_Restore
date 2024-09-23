@implementation RCLockScreenRecordingView

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  return 1;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  id v8;
  RCLockScreenRecordingView *v9;
  RCLockScreenRecordingView *v10;
  RCLockScreenRecordingView *v11;
  uint64_t v12;
  void *v13;
  RCLockScreenRecordingView *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  double v20;
  RCLockScreenRecordingView *v21;
  objc_super v23;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)RCLockScreenRecordingView;
  v8 = -[RCLockScreenRecordingView hitTest:withEvent:](&v23, "hitTest:withEvent:", v7, x, y);
  v9 = (RCLockScreenRecordingView *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (RCLockScreenRecordingView *)objc_claimAutoreleasedReturnValue(-[RCRecordingView recordingControl](self, "recordingControl"));

  v11 = v9;
  if (v9 != v10)
  {
    v12 = objc_claimAutoreleasedReturnValue(-[RCRecordingView doneButton](self, "doneButton"));
    if (v9 == (RCLockScreenRecordingView *)v12)
    {

    }
    else
    {
      v13 = (void *)v12;
      v14 = (RCLockScreenRecordingView *)objc_claimAutoreleasedReturnValue(-[RCRecordingView doneEditingButton](self, "doneEditingButton"));

      if (v9 != v14)
      {
        v16 = objc_opt_class(UIControl, v15);
        if ((objc_opt_isKindOfClass(v9, v16) & 1) == 0)
          goto LABEL_10;
        v18 = objc_opt_class(UITextField, v17);
        if ((objc_opt_isKindOfClass(v9, v18) & 1) != 0)
          goto LABEL_10;
        v19 = 0;
LABEL_9:
        objc_msgSend(v7, "timestamp");
        self->_lastInterceptedEventTimeStamp = v20;
        self->_didTapDone = v19;
LABEL_10:
        v11 = self;
        goto LABEL_11;
      }
    }
    v19 = 1;
    goto LABEL_9;
  }
LABEL_11:
  v21 = v11;

  return v21;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  double v5;
  _BOOL4 didTapDone;
  void *v7;
  id v8;

  objc_msgSend(a4, "timestamp", a3);
  if (vabdd_f64(v5, self->_lastInterceptedEventTimeStamp) < 0.5)
  {
    didTapDone = self->_didTapDone;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCLockScreenRecordingView controlInteractionDelegate](self, "controlInteractionDelegate"));
    v8 = v7;
    if (didTapDone)
      objc_msgSend(v7, "lockScreenRecordingViewDidTapDone");
    else
      objc_msgSend(v7, "lockScreenRecordingViewDidTapControl");

  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  return 0;
}

- (void)setDisplayStyle:(int64_t)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RCLockScreenRecordingView;
  -[RCRecordingView setDisplayStyle:](&v3, "setDisplayStyle:", 3);
}

- (BOOL)shouldEnableDoneButtonWhileRecording
{
  return 0;
}

- (RCLockScreenRecordingViewControlInteractionDelegate)controlInteractionDelegate
{
  return (RCLockScreenRecordingViewControlInteractionDelegate *)objc_loadWeakRetained((id *)&self->_controlInteractionDelegate);
}

- (void)setControlInteractionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_controlInteractionDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_controlInteractionDelegate);
}

@end
