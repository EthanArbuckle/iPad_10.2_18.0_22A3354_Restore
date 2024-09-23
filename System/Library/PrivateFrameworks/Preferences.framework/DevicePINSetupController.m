@implementation DevicePINSetupController

- (DevicePINSetupController)init
{
  DevicePINSetupController *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DevicePINSetupController;
  v2 = -[PSSetupController init](&v4, sel_init);
  if (v2 && (PSUsePadStylePIN() & 1) == 0)
    -[DevicePINSetupController setModalPresentationStyle:](v2, "setModalPresentationStyle:", 0);
  return v2;
}

- (BOOL)success
{
  void *v2;
  char v3;

  -[DevicePINSetupController topViewController](self, "topViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "success");

  return v3;
}

- (BOOL)popupStyleIsModal
{
  return 1;
}

- (BOOL)canBeShownFromSuspendedState
{
  return 0;
}

- (CGSize)preferredContentSize
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[PSSetupController controller](self, "controller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PSSetupController controller](self, "controller");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSize");
    v6 = v5;
    v8 = v7;

  }
  else
  {
    v6 = *MEMORY[0x1E0C9D820];
    v8 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)showController:(id)a3 animate:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  objc_super v7;

  v4 = a4;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setAllowOptionsButton:", self->_allowOptionsButton);
  v7.receiver = self;
  v7.super_class = (Class)DevicePINSetupController;
  -[PSSetupController showController:animate:](&v7, sel_showController_animate_, v6, v4);

}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (BOOL)allowOptionsButton
{
  return self->_allowOptionsButton;
}

- (void)setAllowOptionsButton:(BOOL)a3
{
  self->_allowOptionsButton = a3;
}

@end
