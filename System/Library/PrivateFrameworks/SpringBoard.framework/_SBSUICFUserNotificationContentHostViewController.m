@implementation _SBSUICFUserNotificationContentHostViewController

- (void)configureWithCompletion:(id)a3
{
  id v4;
  id WeakRetained;
  NSObject *v6;
  id v7;
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_userNotification);
  SBLogCFUserNotifications();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v19 = WeakRetained;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "<%p> Configuring user notification content extension view controller.", buf, 0xCu);
  }

  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __77___SBSUICFUserNotificationContentHostViewController_configureWithCompletion___block_invoke;
  v15 = &unk_1E8EA02D8;
  v16 = WeakRetained;
  v17 = v4;
  v7 = v4;
  v8 = WeakRetained;
  v9 = (void (**)(_QWORD))MEMORY[0x1D17E5550](&v12);
  -[_UIRemoteViewController serviceViewControllerProxy](self, "serviceViewControllerProxy", v12, v13, v14, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
    objc_msgSend(v10, "configureWithCompletion:", v9);
  else
    v9[2](v9);

}

- (void)invalidateWithCompletion:(id)a3
{
  SBUserNotificationAlert **p_userNotification;
  id v5;
  id WeakRetained;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  p_userNotification = &self->_userNotification;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_userNotification);
  SBLogCFUserNotifications();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134217984;
    v10 = WeakRetained;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "<%p> Invalidating user notification content extension view controller.", (uint8_t *)&v9, 0xCu);
  }

  -[_UIRemoteViewController serviceViewControllerProxy](self, "serviceViewControllerProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "invalidateWithCompletion:", v5);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFDFAFF0);
}

+ (id)serviceViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFEB5160);
}

- (SBUserNotificationAlert)userNotification
{
  return (SBUserNotificationAlert *)objc_loadWeakRetained((id *)&self->_userNotification);
}

- (void)setUserNotification:(id)a3
{
  objc_storeWeak((id *)&self->_userNotification, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_userNotification);
}

@end
