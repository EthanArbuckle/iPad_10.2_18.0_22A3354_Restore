@implementation TKVibrationRecorderViewController

- (TKVibrationRecorderViewController)initWithVibratorController:(id)a3
{
  id v4;
  TKVibrationRecorderContentViewController *v5;
  TKVibrationRecorderViewController *v6;
  TKVibrationRecorderViewController *v7;

  v4 = a3;
  v5 = -[TKVibrationRecorderContentViewController initWithVibratorController:]([TKVibrationRecorderContentViewController alloc], "initWithVibratorController:", v4);

  v6 = -[TKVibrationRecorderViewController initWithRootViewController:](self, "initWithRootViewController:", v5);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_vibrationRecorderContentViewController, v5);
    -[TKVibrationRecorderContentViewController setParentVibrationRecorderViewController:](v7->_vibrationRecorderContentViewController, "setParentVibrationRecorderViewController:", v7);
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[TKVibrationRecorderContentViewController setParentVibrationRecorderViewController:](self->_vibrationRecorderContentViewController, "setParentVibrationRecorderViewController:", 0);
  v3.receiver = self;
  v3.super_class = (Class)TKVibrationRecorderViewController;
  -[TKVibrationRecorderViewController dealloc](&v3, sel_dealloc);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (TKVibrationRecorderViewControllerDelegate)vibrationRecorderViewControllerDelegate
{
  return -[TKVibrationRecorderContentViewController delegate](self->_vibrationRecorderContentViewController, "delegate");
}

- (void)setVibrationRecorderViewControllerDelegate:(id)a3
{
  -[TKVibrationRecorderContentViewController setDelegate:](self->_vibrationRecorderContentViewController, "setDelegate:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vibrationRecorderContentViewController, 0);
}

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

@end
