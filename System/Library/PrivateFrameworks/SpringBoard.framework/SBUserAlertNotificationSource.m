@implementation SBUserAlertNotificationSource

- (SBUserAlertNotificationSource)initWithDispatcher:(id)a3
{
  id v5;
  SBUserAlertNotificationSource *v6;
  SBUserAlertNotificationSource *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBUserAlertNotificationSource;
  v6 = -[SBUserAlertNotificationSource init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dispatcher, a3);
    +[SBAlertItemsController sharedInstance](SBAlertItemsController, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:", v7);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[SBAlertItemsController sharedInstance](SBAlertItemsController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SBUserAlertNotificationSource;
  -[SBUserAlertNotificationSource dealloc](&v4, sel_dealloc);
}

- (BOOL)presentsAlertItemsModally
{
  return 0;
}

- (BOOL)canPresentMultipleAlertItemsSimultaneously
{
  return 1;
}

- (void)presentAlertItem:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  void *v7;
  void *v8;
  void (**v9)(void);

  v9 = (void (**)(void))a5;
  objc_msgSend(MEMORY[0x1E0DC6008], "notificationRequestForLockScreenWithAlertItem:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUserAlertNotificationSource dispatcher](self, "dispatcher");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationWithRequest:", v7);

  if (v9)
    v9[2]();

}

- (void)dismissAlertItem:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  void *v7;
  void *v8;
  void (**v9)(void);

  v9 = (void (**)(void))a5;
  objc_msgSend(MEMORY[0x1E0DC6008], "notificationRequestForLockScreenWithAlertItem:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUserAlertNotificationSource dispatcher](self, "dispatcher");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "withdrawNotificationWithRequest:", v7);

  if (v9)
    v9[2]();

}

- (void)alertItemsController:(id)a3 willActivateAlertItem:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = a4;
  if (objc_msgSend(v7, "allowInCar"))
  {
    objc_msgSend(MEMORY[0x1E0DC6008], "notificationRequestForCarPlayWithAlertItem:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUserAlertNotificationSource dispatcher](self, "dispatcher");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationWithRequest:", v5);

  }
}

- (void)alertItemsController:(id)a3 didDeactivateAlertItem:(id)a4 forReason:(int)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = v8;
  if (a5 != 1 && objc_msgSend(v8, "allowInCar"))
  {
    objc_msgSend(MEMORY[0x1E0DC6008], "notificationRequestForCarPlayWithAlertItem:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUserAlertNotificationSource dispatcher](self, "dispatcher");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "withdrawNotificationWithRequest:", v10);

  }
}

- (NCNotificationDispatcher)dispatcher
{
  return self->_dispatcher;
}

- (void)setDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_dispatcher, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatcher, 0);
}

@end
