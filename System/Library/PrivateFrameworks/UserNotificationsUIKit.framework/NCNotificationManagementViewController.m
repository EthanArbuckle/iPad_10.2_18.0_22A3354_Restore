@implementation NCNotificationManagementViewController

+ (id)notificationManagementAlertControllerForNotificationRequest:(id)a3 withPresentingView:(id)a4 settingsDelegate:(id)a5
{
  id v6;
  id v7;
  void *v8;
  NCNotificationManagementViewController *v9;
  NCNotificationManagementAlertController *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NCNotificationManagementViewController *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t);
  void *v25;
  NCNotificationManagementViewController *v26;
  id v27;

  v6 = a5;
  v7 = a3;
  objc_msgSend(v7, "topLevelSectionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[NCNotificationManagementViewController initWithRequest:]([NCNotificationManagementViewController alloc], "initWithRequest:", v7);

  -[NCNotificationManagementViewController setSettingsDelegate:](v9, "setSettingsDelegate:", v6);
  v10 = objc_alloc_init(NCNotificationManagementAlertController);
  -[NCNotificationManagementAlertController setContentViewController:](v10, "setContentViewController:", v9);
  v11 = (void *)MEMORY[0x1E0DC3448];
  NCUserNotificationsUIKitFrameworkBundle();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_MANAGEMENT_SETTINGS"), &stru_1E8D21F60, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __138__NCNotificationManagementViewController_notificationManagementAlertControllerForNotificationRequest_withPresentingView_settingsDelegate___block_invoke;
  v25 = &unk_1E8D1EF28;
  v26 = v9;
  v27 = v8;
  v14 = v8;
  v15 = v9;
  objc_msgSend(v11, "_actionWithTitle:image:style:handler:shouldDismissHandler:", v13, 0, 0, 0, &v22);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[NCNotificationManagementAlertController addAction:](v10, "addAction:", v16, v22, v23, v24, v25);
  v17 = (void *)MEMORY[0x1E0DC3448];
  NCUserNotificationsUIKitFrameworkBundle();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_MANAGEMENT_CANCEL"), &stru_1E8D21F60, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "actionWithTitle:style:handler:", v19, 1, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationManagementAlertController addAction:](v10, "addAction:", v20);

  return v10;
}

uint64_t __138__NCNotificationManagementViewController_notificationManagementAlertControllerForNotificationRequest_withPresentingView_settingsDelegate___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD v4[4];
  id v5;
  id v6;

  dispatch_get_global_queue(25, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __138__NCNotificationManagementViewController_notificationManagementAlertControllerForNotificationRequest_withPresentingView_settingsDelegate___block_invoke_2;
  v4[3] = &unk_1E8D1B3A0;
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  dispatch_async(v2, v4);

  return 1;
}

void __138__NCNotificationManagementViewController_notificationManagementAlertControllerForNotificationRequest_withPresentingView_settingsDelegate___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "settingsURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0D22D88];
  v20[0] = *MEMORY[0x1E0D22DA8];
  v20[1] = v4;
  v21[0] = MEMORY[0x1E0C9AAB0];
  v21[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v2, "openSensitiveURL:withOptions:error:", v3, v5, &v13);
  v6 = v13;

  if (v6)
  {
    v7 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_ERROR))
    {
      v10 = a1 + 32;
      v8 = *(void **)(a1 + 32);
      v9 = *(_QWORD *)(v10 + 8);
      v11 = v7;
      objc_msgSend(v8, "settingsURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v15 = v9;
      v16 = 2114;
      v17 = v12;
      v18 = 2114;
      v19 = v6;
      _os_log_error_impl(&dword_1CFC3D000, v11, OS_LOG_TYPE_ERROR, "Error opening Settings for %{public}@, %{public}@, %{public}@", buf, 0x20u);

    }
  }

}

- (NCNotificationManagementViewController)initWithRequest:(id)a3
{
  id v5;
  NCNotificationManagementViewController *v6;
  NCNotificationManagementViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NCNotificationManagementViewController;
  v6 = -[NCNotificationManagementViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_request, a3);

  return v7;
}

- (id)_newManagementView
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  NSURL *v15;
  NSURL *settingsURL;
  void *v17;
  void *v18;
  NCNotificationManagementView *v19;

  -[NCNotificationRequest parentSectionIdentifier](self->_request, "parentSectionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[NCNotificationRequest sectionIdentifier](self->_request, "sectionIdentifier");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  -[NCNotificationManagementViewController settingsDelegate](self, "settingsDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "notificationManagementController:sectionSettingsForSectionIdentifier:", self, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "displayName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[NCNotificationRequest isCriticalAlert](self->_request, "isCriticalAlert");
  NCUserNotificationsUIKitFrameworkBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
    v13 = CFSTR("NOTIFICATION_MANAGEMENT_SUBTITLE_CRITICAL_ALERTS");
  else
    v13 = CFSTR("NOTIFICATION_MANAGEMENT_SUBTITLE_DEFAULT");
  objc_msgSend(v11, "localizedStringForKey:value:table:", v13, &stru_1E8D21F60, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  self->_isDeliveredQuietly = objc_msgSend(v8, "isDeliveredQuietly");
  objc_msgSend(MEMORY[0x1E0C99E98], "nc_notificationSettingsURLForSectionIdentifier:isAppClip:", v6, objc_msgSend(v8, "isAppClip"));
  v15 = (NSURL *)objc_claimAutoreleasedReturnValue();
  settingsURL = self->_settingsURL;
  self->_settingsURL = v15;

  objc_msgSend(v8, "settingsIcon");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    -[NCNotificationManagementViewController traitCollection](self, "traitCollection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    NCIconImageForApplicationIdentifierWithFormat(v6, 17, objc_msgSend(v18, "userInterfaceStyle"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v19 = -[NCNotificationManagementView initWithIcon:title:subtitle:sectionSettings:criticalAlert:]([NCNotificationManagementView alloc], "initWithIcon:title:subtitle:sectionSettings:criticalAlert:", v17, v9, v14, v8, -[NCNotificationRequest isCriticalAlert](self->_request, "isCriticalAlert"));

  return v19;
}

- (void)loadView
{
  NCNotificationManagementView *v3;
  NCNotificationManagementView *platterView;

  v3 = -[NCNotificationManagementViewController _newManagementView](self, "_newManagementView");
  platterView = self->_platterView;
  self->_platterView = v3;

  -[NCNotificationManagementViewController setView:](self, "setView:", self->_platterView);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NCNotificationManagementViewController;
  -[NCNotificationManagementViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[NCNotificationManagementView deliveryButton](self->_platterView, "deliveryButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTarget:action:forControlEvents:", self, sel__deliveryButtonTapped_, 64);

  -[NCNotificationManagementView onOffToggleButton](self->_platterView, "onOffToggleButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addTarget:action:forControlEvents:", self, sel__onOffToggleButtonTapped_, 64);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NCNotificationManagementViewController;
  -[NCNotificationManagementViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[NCNotificationManagementViewController becomeFirstResponder](self, "becomeFirstResponder");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NCNotificationManagementViewController;
  -[NCNotificationManagementViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[NCNotificationManagementViewController resignFirstResponder](self, "resignFirstResponder");
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NCNotificationManagementViewController;
  -[NCNotificationManagementViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[NCNotificationManagementViewController settingsDelegate](self, "settingsDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "notificationManagementControllerDidDismissManagementView:", self);

}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)canResignFirstResponder
{
  return 1;
}

- (CGSize)preferredContentSize
{
  double v3;
  double v4;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  objc_super v16;
  objc_super v17;
  objc_super v18;
  CGSize result;

  v18.receiver = self;
  v18.super_class = (Class)NCNotificationManagementViewController;
  -[NCNotificationManagementViewController preferredContentSize](&v18, sel_preferredContentSize);
  if (v4 == *MEMORY[0x1E0C9D820] && v3 == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_referenceBounds");
    v8 = v7;

    if (v8 > 355.0)
      v8 = 355.0;
    -[NCNotificationManagementViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sizeThatFits:", v8, 1.79769313e308);
    v11 = v10;
    v13 = v12;

    v17.receiver = self;
    v17.super_class = (Class)NCNotificationManagementViewController;
    -[NCNotificationManagementViewController setPreferredContentSize:](&v17, sel_setPreferredContentSize_, v11, v13);
  }
  v16.receiver = self;
  v16.super_class = (Class)NCNotificationManagementViewController;
  -[NCNotificationManagementViewController preferredContentSize](&v16, sel_preferredContentSize);
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)_deliveryButtonTapped:(id)a3
{
  BOOL isDeliveredQuietly;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  NCNotificationManagementViewController *v9;
  BOOL v10;

  isDeliveredQuietly = self->_isDeliveredQuietly;
  -[NCNotificationManagementViewController settingsDelegate](self, "settingsDelegate", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__NCNotificationManagementViewController__deliveryButtonTapped___block_invoke;
  v7[3] = &unk_1E8D1E360;
  v8 = v5;
  v9 = self;
  v10 = isDeliveredQuietly;
  v6 = v5;
  -[NCNotificationManagementViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v7);

}

void __64__NCNotificationManagementViewController__deliveryButtonTapped___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _BOOL8 v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(_BYTE *)(a1 + 48) == 0;
  objc_msgSend(v3, "request");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sectionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notificationManagementController:setDeliverQuietly:forNotificationRequest:withSectionIdentifier:", v3, v4, v7, v6);

}

- (void)_onOffToggleButtonTapped:(id)a3
{
  id v4;
  NCNotificationManagementViewPresenter *v5;
  NCNotificationManagementViewPresenter *viewPresenter;
  NCNotificationManagementViewPresenter *v7;
  id v8;

  v4 = a3;
  v5 = objc_alloc_init(NCNotificationManagementViewPresenter);
  viewPresenter = self->_viewPresenter;
  self->_viewPresenter = v5;

  -[NCNotificationManagementViewPresenter setDelegate:](self->_viewPresenter, "setDelegate:", self);
  v7 = self->_viewPresenter;
  -[NCNotificationManagementViewController request](self, "request");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NCNotificationManagementViewPresenter presentNotificationManagementViewType:forNotificationRequest:withPresentingViewController:withPresentingView:](v7, "presentNotificationManagementViewType:forNotificationRequest:withPresentingViewController:withPresentingView:", 3, v8, self, v4);

}

- (id)notificationManagementController:(id)a3 sectionSettingsForSectionIdentifier:(id)a4
{
  return -[NCNotificationManagementViewController _sectionSettingsForSectionIdentifier:](self, "_sectionSettingsForSectionIdentifier:", a4);
}

- (void)notificationManagementController:(id)a3 setAllowsNotifications:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6
{
  -[NCNotificationManagementViewController _setAllowsNotifications:forNotificationRequest:withSectionIdentifier:](self, "_setAllowsNotifications:forNotificationRequest:withSectionIdentifier:", a4, a5, a6);
}

- (void)notificationManagementController:(id)a3 setDeliverQuietly:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6
{
  -[NCNotificationManagementViewController _setDeliverQuietly:forNotificationRequest:withSectionIdentifier:](self, "_setDeliverQuietly:forNotificationRequest:withSectionIdentifier:", a4, a5, a6);
}

- (void)notificationManagementController:(id)a3 setAllowsCriticalAlerts:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6
{
  -[NCNotificationManagementViewController _setAllowsCriticalAlerts:forNotificationRequest:withSectionIdentifier:](self, "_setAllowsCriticalAlerts:forNotificationRequest:withSectionIdentifier:", a4, a5, a6);
}

- (void)notificationManagementController:(id)a3 setAllowsTimeSensitive:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6
{
  -[NCNotificationManagementViewController _setAllowsTimeSensitive:forNotificationRequest:withSectionIdentifier:](self, "_setAllowsTimeSensitive:forNotificationRequest:withSectionIdentifier:", a4, a5, a6);
}

- (void)notificationManagementController:(id)a3 setMuted:(BOOL)a4 untilDate:(id)a5 forNotificationRequest:(id)a6 withSectionIdentifier:(id)a7 threadIdentifier:(id)a8
{
  -[NCNotificationManagementViewController _setMuted:untilDate:forNotificationRequest:withSectionIdentifier:threadIdentifier:](self, "_setMuted:untilDate:forNotificationRequest:withSectionIdentifier:threadIdentifier:", a4, a5, a6, a7, a8);
}

- (void)notificationManagementController:(id)a3 setScheduledDelivery:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6
{
  -[NCNotificationManagementViewController _setScheduledDelivery:forNotificationRequest:withSectionIdentifier:](self, "_setScheduledDelivery:forNotificationRequest:withSectionIdentifier:", a4, a5, a6);
}

- (id)notificationManagementViewPresenter:(id)a3 sectionSettingsForSectionIdentifier:(id)a4
{
  return -[NCNotificationManagementViewController _sectionSettingsForSectionIdentifier:](self, "_sectionSettingsForSectionIdentifier:", a4);
}

- (void)notificationManagementViewPresenter:(id)a3 setAllowsNotifications:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6
{
  -[NCNotificationManagementViewController _setAllowsNotifications:forNotificationRequest:withSectionIdentifier:](self, "_setAllowsNotifications:forNotificationRequest:withSectionIdentifier:", a4, a5, a6);
}

- (void)notificationManagementViewPresenter:(id)a3 setDeliverQuietly:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6
{
  -[NCNotificationManagementViewController _setDeliverQuietly:forNotificationRequest:withSectionIdentifier:](self, "_setDeliverQuietly:forNotificationRequest:withSectionIdentifier:", a4, a5, a6);
}

- (void)notificationManagementViewPresenter:(id)a3 setAllowsCriticalAlerts:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6
{
  -[NCNotificationManagementViewController _setAllowsCriticalAlerts:forNotificationRequest:withSectionIdentifier:](self, "_setAllowsCriticalAlerts:forNotificationRequest:withSectionIdentifier:", a4, a5, a6);
}

- (void)notificationManagementViewPresenter:(id)a3 setAllowsTimeSensitive:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6
{
  -[NCNotificationManagementViewController _setAllowsTimeSensitive:forNotificationRequest:withSectionIdentifier:](self, "_setAllowsTimeSensitive:forNotificationRequest:withSectionIdentifier:", a4, a5, a6);
}

- (void)notificationManagementViewPresenter:(id)a3 setMuted:(BOOL)a4 untilDate:(id)a5 forNotificationRequest:(id)a6 withSectionIdentifier:(id)a7 threadIdentifier:(id)a8
{
  -[NCNotificationManagementViewController _setMuted:untilDate:forNotificationRequest:withSectionIdentifier:threadIdentifier:](self, "_setMuted:untilDate:forNotificationRequest:withSectionIdentifier:threadIdentifier:", a4, a5, a6, a7, a8);
}

- (void)notificationManagementViewPresenter:(id)a3 setScheduledDelivery:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6
{
  -[NCNotificationManagementViewController _setScheduledDelivery:forNotificationRequest:withSectionIdentifier:](self, "_setScheduledDelivery:forNotificationRequest:withSectionIdentifier:", a4, a5, a6);
}

- (id)_sectionSettingsForSectionIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NCNotificationManagementViewController settingsDelegate](self, "settingsDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notificationManagementController:sectionSettingsForSectionIdentifier:", self, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_systemSettings
{
  void *v3;
  void *v4;

  -[NCNotificationManagementViewController settingsDelegate](self, "settingsDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "notificationManagementControllerRequestsSystemSettings:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_setAllowsNotifications:(BOOL)a3 forNotificationRequest:(id)a4 withSectionIdentifier:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  NCNotificationManagementViewController *v16;
  id v17;
  id v18;
  BOOL v19;

  v8 = a4;
  v9 = a5;
  -[NCNotificationManagementViewController settingsDelegate](self, "settingsDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __111__NCNotificationManagementViewController__setAllowsNotifications_forNotificationRequest_withSectionIdentifier___block_invoke;
  v14[3] = &unk_1E8D1EF50;
  v15 = v10;
  v16 = self;
  v19 = a3;
  v17 = v8;
  v18 = v9;
  v11 = v9;
  v12 = v8;
  v13 = v10;
  -[NCNotificationManagementViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v14);

}

uint64_t __111__NCNotificationManagementViewController__setAllowsNotifications_forNotificationRequest_withSectionIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "notificationManagementController:setAllowsNotifications:forNotificationRequest:withSectionIdentifier:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_setDeliverQuietly:(BOOL)a3 forNotificationRequest:(id)a4 withSectionIdentifier:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  NCNotificationManagementViewController *v16;
  id v17;
  id v18;
  BOOL v19;

  v8 = a4;
  v9 = a5;
  -[NCNotificationManagementViewController settingsDelegate](self, "settingsDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __106__NCNotificationManagementViewController__setDeliverQuietly_forNotificationRequest_withSectionIdentifier___block_invoke;
  v14[3] = &unk_1E8D1EF50;
  v15 = v10;
  v16 = self;
  v19 = a3;
  v17 = v8;
  v18 = v9;
  v11 = v9;
  v12 = v8;
  v13 = v10;
  -[NCNotificationManagementViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v14);

}

uint64_t __106__NCNotificationManagementViewController__setDeliverQuietly_forNotificationRequest_withSectionIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "notificationManagementController:setDeliverQuietly:forNotificationRequest:withSectionIdentifier:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_setAllowsCriticalAlerts:(BOOL)a3 forNotificationRequest:(id)a4 withSectionIdentifier:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  NCNotificationManagementViewController *v16;
  id v17;
  id v18;
  BOOL v19;

  v8 = a4;
  v9 = a5;
  -[NCNotificationManagementViewController settingsDelegate](self, "settingsDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __112__NCNotificationManagementViewController__setAllowsCriticalAlerts_forNotificationRequest_withSectionIdentifier___block_invoke;
  v14[3] = &unk_1E8D1EF50;
  v15 = v10;
  v16 = self;
  v19 = a3;
  v17 = v8;
  v18 = v9;
  v11 = v9;
  v12 = v8;
  v13 = v10;
  -[NCNotificationManagementViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v14);

}

uint64_t __112__NCNotificationManagementViewController__setAllowsCriticalAlerts_forNotificationRequest_withSectionIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "notificationManagementController:setAllowsCriticalAlerts:forNotificationRequest:withSectionIdentifier:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_setAllowsTimeSensitive:(BOOL)a3 forNotificationRequest:(id)a4 withSectionIdentifier:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  NCNotificationManagementViewController *v16;
  id v17;
  id v18;
  BOOL v19;

  v8 = a4;
  v9 = a5;
  -[NCNotificationManagementViewController settingsDelegate](self, "settingsDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __111__NCNotificationManagementViewController__setAllowsTimeSensitive_forNotificationRequest_withSectionIdentifier___block_invoke;
  v14[3] = &unk_1E8D1EF50;
  v15 = v10;
  v16 = self;
  v19 = a3;
  v17 = v8;
  v18 = v9;
  v11 = v9;
  v12 = v8;
  v13 = v10;
  -[NCNotificationManagementViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v14);

}

uint64_t __111__NCNotificationManagementViewController__setAllowsTimeSensitive_forNotificationRequest_withSectionIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "notificationManagementController:setAllowsTimeSensitive:forNotificationRequest:withSectionIdentifier:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_setMuted:(BOOL)a3 untilDate:(id)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6 threadIdentifier:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  NCNotificationManagementViewController *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  BOOL v29;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  -[NCNotificationManagementViewController settingsDelegate](self, "settingsDelegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __124__NCNotificationManagementViewController__setMuted_untilDate_forNotificationRequest_withSectionIdentifier_threadIdentifier___block_invoke;
  v22[3] = &unk_1E8D1EF78;
  v23 = v16;
  v24 = self;
  v29 = a3;
  v25 = v12;
  v26 = v13;
  v27 = v14;
  v28 = v15;
  v17 = v15;
  v18 = v14;
  v19 = v13;
  v20 = v12;
  v21 = v16;
  -[NCNotificationManagementViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v22);

}

uint64_t __124__NCNotificationManagementViewController__setMuted_untilDate_forNotificationRequest_withSectionIdentifier_threadIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "notificationManagementController:setMuted:untilDate:forNotificationRequest:withSectionIdentifier:threadIdentifier:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 80), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

- (void)_setScheduledDelivery:(BOOL)a3 forNotificationRequest:(id)a4 withSectionIdentifier:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  NCNotificationManagementViewController *v16;
  id v17;
  id v18;
  BOOL v19;

  v8 = a4;
  v9 = a5;
  -[NCNotificationManagementViewController settingsDelegate](self, "settingsDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __109__NCNotificationManagementViewController__setScheduledDelivery_forNotificationRequest_withSectionIdentifier___block_invoke;
  v14[3] = &unk_1E8D1EF50;
  v15 = v10;
  v16 = self;
  v19 = a3;
  v17 = v8;
  v18 = v9;
  v11 = v9;
  v12 = v8;
  v13 = v10;
  -[NCNotificationManagementViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v14);

}

uint64_t __109__NCNotificationManagementViewController__setScheduledDelivery_forNotificationRequest_withSectionIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "notificationManagementController:setScheduledDelivery:forNotificationRequest:withSectionIdentifier:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (NCNotificationManagementControllerSettingsDelegate)settingsDelegate
{
  return (NCNotificationManagementControllerSettingsDelegate *)objc_loadWeakRetained((id *)&self->_settingsDelegate);
}

- (void)setSettingsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_settingsDelegate, a3);
}

- (NSURL)settingsURL
{
  return self->_settingsURL;
}

- (void)setSettingsURL:(id)a3
{
  objc_storeStrong((id *)&self->_settingsURL, a3);
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
  objc_destroyWeak((id *)&self->_settingsDelegate);
  objc_storeStrong((id *)&self->_viewPresenter, 0);
  objc_storeStrong((id *)&self->_settingsURL, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_platterView, 0);
}

@end
