@implementation RCLockScreenRecordingViewController

- (Class)_viewClass
{
  return (Class)objc_opt_class(RCLockScreenRecordingView, a2);
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RCLockScreenRecordingViewController;
  -[RCRecordingViewController viewDidLoad](&v4, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCLockScreenRecordingViewController view](self, "view"));
  objc_msgSend(v3, "setControlInteractionDelegate:", self);

}

- (void)actionActivated:(int64_t)a3
{
  void *v5;
  objc_super v6;

  if (a3 == 2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCLockScreenRecordingViewController delegate](self, "delegate"));
    objc_msgSend(v5, "lockScreenRecordingViewWillPauseRecording");

  }
  v6.receiver = self;
  v6.super_class = (Class)RCLockScreenRecordingViewController;
  -[RCRecordingViewController actionActivated:](&v6, "actionActivated:", a3);
}

- (void)lockScreenRecordingViewDidTapDone
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[RCLockScreenRecordingViewController delegate](self, "delegate"));
  objc_msgSend(v2, "lockScreenRecordingViewControllerWantsUnlockFromControl:", 1);

}

- (void)lockScreenRecordingViewDidTapControl
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[RCLockScreenRecordingViewController delegate](self, "delegate"));
  objc_msgSend(v2, "lockScreenRecordingViewControllerWantsUnlockFromControl:", 0);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (RCLockScreenRecordingViewControllerDelegate)delegate
{
  return (RCLockScreenRecordingViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
