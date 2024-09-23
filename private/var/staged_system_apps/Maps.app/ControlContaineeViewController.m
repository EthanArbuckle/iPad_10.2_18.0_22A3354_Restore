@implementation ControlContaineeViewController

+ (BOOL)wantsDefaultHeaderContentViews
{
  return 1;
}

- (int64_t)floatingControlsOptions
{
  return 251;
}

- (ActionCoordination)delegate
{
  return (ActionCoordination *)objc_loadWeakRetained((id *)&self->_delegate);
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
