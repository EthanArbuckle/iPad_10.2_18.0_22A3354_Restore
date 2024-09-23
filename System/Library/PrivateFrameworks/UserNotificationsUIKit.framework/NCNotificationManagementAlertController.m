@implementation NCNotificationManagementAlertController

- (NCNotificationManagementAlertController)initWithRequest:(id)a3 withPresentingView:(id)a4 settingsDelegate:(id)a5
{
  id v7;
  id v8;
  NCNotificationManagementAlertController *v9;
  NCNotificationManagementAlertController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)NCNotificationManagementAlertController;
  v9 = -[NCNotificationManagementAlertController init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    -[NCNotificationManagementAlertController setPreferredStyle:](v9, "setPreferredStyle:", 0);
    -[NCNotificationManagementAlertController setRequest:](v10, "setRequest:", v7);
    -[NCNotificationManagementAlertController setSettingsDelegate:](v10, "setSettingsDelegate:", v8);
  }

  return v10;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NCNotificationManagementAlertController;
  -[NCNotificationManagementAlertController viewDidLoad](&v3, sel_viewDidLoad);
  -[NCNotificationManagementAlertController _configureView](self, "_configureView");
}

- (BOOL)shouldAutorotate
{
  void *v3;
  void *v4;
  char v5;

  -[NCNotificationManagementAlertController presentingViewController](self, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[NCNotificationManagementAlertController presentingViewController](self, "presentingViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "shouldAutorotate");

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (NCNotificationManagementControllerSettingsDelegate)settingsDelegate
{
  return (NCNotificationManagementControllerSettingsDelegate *)objc_loadWeakRetained((id *)&self->_settingsDelegate);
}

- (void)setSettingsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_settingsDelegate, a3);
}

- (NCNotificationRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_destroyWeak((id *)&self->_settingsDelegate);
}

@end
