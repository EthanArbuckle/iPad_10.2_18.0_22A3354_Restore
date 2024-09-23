@implementation NCNotificationContentContainerViewController

+ (id)extensionForNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CEC8B8], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sectionIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "categoryIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "extensionForNotificationSourceIdentifier:categoryIdentifier:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      objc_msgSend(a1, "_defaultUIExtensionForNotificationRequest:visibleAttachment:", v4, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NCNotificationContentContainerViewController)initWithNotificationRequest:(id)a3
{
  id v5;
  NCNotificationContentContainerViewController *v6;
  NCNotificationContentContainerViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NCNotificationContentContainerViewController;
  v6 = -[NCNotificationContentContainerViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_notificationRequest, a3);
    -[NCNotificationContentContainerViewController _loadExtensionContainerViewControllerForNotificationRequest:](v7, "_loadExtensionContainerViewControllerForNotificationRequest:", v5);
  }

  return v7;
}

- (BOOL)canBecomeFirstResponder
{
  void *v2;
  char v3;

  -[NCNotificationContentContainerViewController extensionContainerViewController](self, "extensionContainerViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canBecomeFirstResponder") ^ 1;

  return v3;
}

- (BOOL)becomeFirstResponder
{
  _BOOL4 v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NCNotificationContentContainerViewController;
  v3 = -[NCNotificationContentContainerViewController becomeFirstResponder](&v9, sel_becomeFirstResponder);
  if (v3)
  {
    -[NCNotificationContentContainerViewController notificationRequest](self, "notificationRequest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "showsTextInputOnAppearance");

    if (v5)
    {
      -[NCNotificationContentContainerViewController notificationRequest](self, "notificationRequest");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationContentContainerViewController _setupQuickReplyForNotificationRequest:](self, "_setupQuickReplyForNotificationRequest:", v6);

      -[NCNotificationContentContainerViewController inputAccessoryView](self, "inputAccessoryView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "becomeFirstResponder");

    }
  }
  return v3;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NCNotificationContentContainerViewController;
  -[NCNotificationContentContainerViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[NCNotificationContentContainerViewController extensionContainerViewController](self, "extensionContainerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationContentContainerViewController _setupExtensionContainerViewControllerController:](self, "_setupExtensionContainerViewControllerController:", v3);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0DC5F80];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F80], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v8 = "-[NCNotificationContentContainerViewController viewWillAppear:]";
    _os_log_impl(&dword_1CFC3D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  v6.receiver = self;
  v6.super_class = (Class)NCNotificationContentContainerViewController;
  -[NCNotificationContentContainerViewController viewWillAppear:](&v6, sel_viewWillAppear_, v3);
  -[NCNotificationContentContainerViewController becomeFirstResponder](self, "becomeFirstResponder");
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0DC5F80];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F80], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v9 = "-[NCNotificationContentContainerViewController viewWillDisappear:]";
    _os_log_impl(&dword_1CFC3D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  v7.receiver = self;
  v7.super_class = (Class)NCNotificationContentContainerViewController;
  -[NCNotificationContentContainerViewController viewWillDisappear:](&v7, sel_viewWillDisappear_, v3);
  -[NCNotificationContentContainerViewController firstResponder](self, "firstResponder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resignFirstResponder");

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0DC5F80];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F80], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v8 = "-[NCNotificationContentContainerViewController viewDidAppear:]";
    _os_log_impl(&dword_1CFC3D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  v6.receiver = self;
  v6.super_class = (Class)NCNotificationContentContainerViewController;
  -[NCNotificationContentContainerViewController viewDidAppear:](&v6, sel_viewDidAppear_, v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0DC5F80];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F80], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v8 = "-[NCNotificationContentContainerViewController viewDidDisappear:]";
    _os_log_impl(&dword_1CFC3D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  v6.receiver = self;
  v6.super_class = (Class)NCNotificationContentContainerViewController;
  -[NCNotificationContentContainerViewController viewDidDisappear:](&v6, sel_viewDidDisappear_, v3);
}

- (NSString)title
{
  void *v2;
  void *v3;

  -[NCNotificationContentContainerViewController extensionContainerViewController](self, "extensionContainerViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NCNotificationContentContainerViewController;
  -[NCNotificationContentContainerViewController preferredContentSizeDidChangeForChildContentContainer:](&v12, sel_preferredContentSizeDidChangeForChildContentContainer_, v4);
  -[NCNotificationContentContainerViewController preferredContentSize](self, "preferredContentSize");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "preferredContentSize");
  if (v6 != v10 || v8 != v9)
  {
    objc_msgSend(v4, "preferredContentSize");
    -[NCNotificationContentContainerViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  }

}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  double height;
  double width;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  height = a4.height;
  width = a4.width;
  -[NCNotificationContentContainerViewController extensionContainerViewController](self, "extensionContainerViewController", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[NCNotificationContentContainerViewController extensionContainerViewController](self, "extensionContainerViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationContentContainerViewController extensionContainerViewController](self, "extensionContainerViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sizeForChildContentContainer:withParentContainerSize:", v9, width, height);
    width = v10;
    v12 = v11;

  }
  else
  {
    v12 = 0.0;
  }
  v13 = width;
  v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)NCNotificationContentContainerViewController;
  v7 = a4;
  -[NCNotificationContentContainerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[NCNotificationContentContainerViewController extensionContainerViewController](self, "extensionContainerViewController", v9.receiver, v9.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);

}

- (void)extensionViewControllerDidLoadExtension:(id)a3
{
  id v4;

  -[NCNotificationContentContainerViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "customContentDidLoadExtension:", self);

}

- (void)extensionViewControllerDidUpdateTitle:(id)a3
{
  id v4;

  -[NCNotificationContentContainerViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "customContentDidUpdateTitle:", self);

}

- (void)extensionViewControllerDidUpdateActions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSMutableArray *updatedActions;
  id v9;
  NSMutableArray *v10;
  NSMutableArray *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v4 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__6;
  v23 = __Block_byref_object_dispose__6;
  v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[NCNotificationContentContainerViewController notificationRequest](self, "notificationRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __88__NCNotificationContentContainerViewController_extensionViewControllerDidUpdateActions___block_invoke;
  v16 = &unk_1E8D1D908;
  v7 = v5;
  v17 = v7;
  v18 = &v19;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", &v13);
  updatedActions = self->_updatedActions;
  if (updatedActions)
  {
    -[NSMutableArray addObjectsFromArray:](updatedActions, "addObjectsFromArray:", v20[5], v13, v14, v15, v16);
  }
  else
  {
    v9 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v10 = (NSMutableArray *)objc_msgSend(v9, "initWithArray:", v20[5], v13, v14, v15, v16);
    v11 = self->_updatedActions;
    self->_updatedActions = v10;

  }
  -[NCNotificationContentContainerViewController delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v12, "customContent:didUpdateUserNotificationActions:", self, v20[5]);

  _Block_object_dispose(&v19, 8);
}

void __88__NCNotificationContentContainerViewController_extensionViewControllerDidUpdateActions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x1E0DC5FF0];
  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "bulletin");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "observer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "notificationActionForUNNotificationAction:bulletin:observer:", v5, v6, v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v8);
}

- (void)extensionViewControllerRequestsDefaultAction:(id)a3
{
  id v4;

  -[NCNotificationContentContainerViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "customContentRequestsDefaultAction:", self);

}

- (void)extensionViewControllerRequestsDismiss:(id)a3
{
  id v4;

  -[NCNotificationContentContainerViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "customContentRequestsDismiss:", self);

}

- (BOOL)didReceiveNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)*MEMORY[0x1E0DC5F80];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F80], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    objc_msgSend(v4, "notificationIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "un_logDigest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "threadIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "un_logDigest");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v8;
    v16 = 2114;
    v17 = v10;
    _os_log_impl(&dword_1CFC3D000, v6, OS_LOG_TYPE_DEFAULT, "Content container received additional notification %{public}@ for thread %{public}@", (uint8_t *)&v14, 0x16u);

  }
  -[NCNotificationContentContainerViewController extensionContainerViewController](self, "extensionContainerViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userNotification");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "didReceiveNotification:", v12);

  return v11 != 0;
}

- (BOOL)performAction:(id)a3 forNotification:(id)a4 withUserInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  int v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqual:", *MEMORY[0x1E0CEC808]);

  if ((v12 & 1) != 0
    || (-[NCNotificationContentContainerViewController extensionContainerViewController](self, "extensionContainerViewController"), v13 = (void *)objc_claimAutoreleasedReturnValue(), v14 = objc_msgSend(v13, "extensionWantsToReceiveActionResponses"), v13, !v14))
  {
    v21 = 0;
  }
  else
  {
    v15 = (void *)*MEMORY[0x1E0DC5F80];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F80], OS_LOG_TYPE_DEFAULT))
    {
      v16 = v15;
      objc_msgSend(v8, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "notificationIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "un_logDigest");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v17;
      v29 = 2114;
      v30 = v19;
      _os_log_impl(&dword_1CFC3D000, v16, OS_LOG_TYPE_DEFAULT, "Sending action %{public}@ for notification %{public}@ to extension container", buf, 0x16u);

    }
    if (objc_msgSend(v8, "requiresAuthentication"))
    {
      -[NCNotificationContentContainerViewController delegate](self, "delegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __91__NCNotificationContentContainerViewController_performAction_forNotification_withUserInfo___block_invoke;
      v23[3] = &unk_1E8D1D930;
      v23[4] = self;
      v24 = v8;
      v25 = v9;
      v26 = v10;
      objc_msgSend(v20, "customContent:requestPermissionToExecuteAction:forNotification:withUserInfo:completionHandler:", self, v24, v25, v26, v23);

    }
    else
    {
      -[NCNotificationContentContainerViewController _forwardActionToExtension:forNotification:withUserInfo:](self, "_forwardActionToExtension:forNotification:withUserInfo:", v8, v9, v10);
    }
    v21 = 1;
  }

  return v21;
}

void __91__NCNotificationContentContainerViewController_performAction_forNotification_withUserInfo___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_forwardActionToExtension:forNotification:withUserInfo:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
  else
  {
    v3 = (void *)*MEMORY[0x1E0DC5F80];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F80], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(void **)(a1 + 40);
      v5 = v3;
      objc_msgSend(v4, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "notificationIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "un_logDigest");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v6;
      v14 = 2114;
      v15 = v8;
      _os_log_impl(&dword_1CFC3D000, v5, OS_LOG_TYPE_DEFAULT, "Not allowing action %{public}@ for notification %{public}@ to extension container due to passcode failure or cancellation", (uint8_t *)&v12, 0x16u);

    }
    if (objc_msgSend(*(id *)(a1 + 40), "behavior") == 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "extensionContainerViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "canBecomeFirstResponder");

      if ((v10 & 1) == 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "_setupQuickReplyForNotificationAction:", *(_QWORD *)(a1 + 40));
        objc_msgSend(*(id *)(a1 + 32), "becomeFirstResponder");
        objc_msgSend(*(id *)(a1 + 32), "inputAccessoryView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "becomeFirstResponder");

      }
    }
  }
}

- (BOOL)performAction:(id)a3 forNotification:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  BOOL v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "behavior") == 1
    && (-[NCNotificationContentContainerViewController extensionContainerViewController](self, "extensionContainerViewController"), v8 = (void *)objc_claimAutoreleasedReturnValue(), v9 = objc_msgSend(v8, "canBecomeFirstResponder"), v8, (v9 & 1) == 0))
  {
    -[NCNotificationContentContainerViewController _setupQuickReplyForNotificationAction:](self, "_setupQuickReplyForNotificationAction:", v6);
    -[NCNotificationContentContainerViewController becomeFirstResponder](self, "becomeFirstResponder");
    -[NCNotificationContentContainerViewController inputAccessoryView](self, "inputAccessoryView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "becomeFirstResponder");

    v10 = 1;
  }
  else
  {
    v10 = -[NCNotificationContentContainerViewController performAction:forNotification:withUserInfo:](self, "performAction:forNotification:withUserInfo:", v6, v7, MEMORY[0x1E0C9AA70]);
  }

  return v10;
}

- (BOOL)defaultContentHidden
{
  void *v3;
  void *v4;
  char v5;

  -[NCNotificationContentContainerViewController extensionContainerViewController](self, "extensionContainerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[NCNotificationContentContainerViewController extensionContainerViewController](self, "extensionContainerViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isDefaultContentHidden");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)overridesDefaultTitle
{
  void *v3;
  void *v4;
  char v5;

  -[NCNotificationContentContainerViewController extensionContainerViewController](self, "extensionContainerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[NCNotificationContentContainerViewController extensionContainerViewController](self, "extensionContainerViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isDefaultTitleOverridden");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)preserveInputViews
{
  void *v3;
  void *v4;
  id v5;

  -[NCNotificationContentContainerViewController extensionContainerViewController](self, "extensionContainerViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "canBecomeFirstResponder") && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "preserveInputViews");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3AD8], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_preserveInputViewsWithId:animated:", v4, 1);

  }
}

- (BOOL)restoreInputViews
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[NCNotificationContentContainerViewController extensionContainerViewController](self, "extensionContainerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "canBecomeFirstResponder") && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = objc_msgSend(v3, "restoreInputViews");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3AD8], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "_restoreInputViewsWithId:animated:", v6, 1);

  }
  return v4;
}

- (BOOL)allowManualDismiss
{
  return 1;
}

- (BOOL)userInteractionEnabled
{
  void *v2;
  char v3;

  -[NCNotificationContentContainerViewController extensionContainerViewController](self, "extensionContainerViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUserInteractionEnabled");

  return v3;
}

- (unint64_t)customContentLocation
{
  return self->_customContentLocation;
}

- (NSString)contentExtensionIdentifier
{
  void *v2;
  void *v3;

  -[NCNotificationContentContainerViewController extensionContainerViewController](self, "extensionContainerViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "extensionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)playMedia
{
  id v2;

  -[NCNotificationContentContainerViewController extensionContainerViewController](self, "extensionContainerViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playMedia");

}

- (id)cancelTouches
{
  void *v2;
  void *v3;

  -[NCNotificationContentContainerViewController extensionContainerViewController](self, "extensionContainerViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelTouchesForCurrentEventInExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)notificationTextInputView:(id)a3 didConfirmText:(id)a4 forAction:(id)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v14 = *MEMORY[0x1E0D036F0];
  v15[0] = a4;
  v8 = (void *)MEMORY[0x1E0C99D80];
  v9 = a4;
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[NCNotificationContentContainerViewController notificationRequest](self, "notificationRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = -[NCNotificationContentContainerViewController performAction:forNotification:withUserInfo:](self, "performAction:forNotification:withUserInfo:", v7, v11, v10);

  if ((v9 & 1) == 0)
  {
    -[NCNotificationContentContainerViewController delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationContentContainerViewController notificationRequest](self, "notificationRequest");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "customContent:forwardAction:forNotification:withUserInfo:", self, v7, v13, v10);

  }
}

- (void)_setupExtensionContainerViewControllerController:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[NCNotificationContentContainerViewController isViewLoaded](self, "isViewLoaded");
  if (v4)
  {
    if (v5)
    {
      objc_msgSend(v4, "parentViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        v7 = (void *)*MEMORY[0x1E0DC5F80];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F80], OS_LOG_TYPE_DEFAULT))
        {
          v8 = v7;
          v9 = (objc_class *)objc_opt_class();
          NSStringFromClass(v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[NCNotificationContentContainerViewController notificationRequest](self, "notificationRequest");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "notificationIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "un_logDigest");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v22 = v10;
          v23 = 2114;
          v24 = v13;
          _os_log_impl(&dword_1CFC3D000, v8, OS_LOG_TYPE_DEFAULT, "Setting up content container view controller %{public}@ for notification %{public}@", buf, 0x16u);

        }
        -[NCNotificationContentContainerViewController addChildViewController:](self, "addChildViewController:", v4);
        objc_msgSend(v4, "view");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NCNotificationContentContainerViewController view](self, "view");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "bounds");
        objc_msgSend(v14, "setFrame:");

        objc_msgSend(v14, "setAutoresizingMask:", 18);
        -[NCNotificationContentContainerViewController view](self, "view");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addSubview:", v14);

        objc_msgSend(v4, "didMoveToParentViewController:", self);
        objc_msgSend(v14, "setAlpha:", 0.0);
        v17 = (void *)MEMORY[0x1E0DC3F10];
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __97__NCNotificationContentContainerViewController__setupExtensionContainerViewControllerController___block_invoke;
        v19[3] = &unk_1E8D1B568;
        v20 = v14;
        v18 = v14;
        objc_msgSend(v17, "animateWithDuration:animations:", v19, 0.25);

      }
    }
  }

}

uint64_t __97__NCNotificationContentContainerViewController__setupExtensionContainerViewControllerController___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

+ (id)_visibleAttachmentForNotificationRequest:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "userNotification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "content");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attachments");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "bs_firstObjectPassingTest:", &__block_literal_global_15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

BOOL __89__NCNotificationContentContainerViewController__visibleAttachmentForNotificationRequest___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "options");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "displayLocation") != 1;

  return v3;
}

+ (id)_defaultUIExtensionForNotificationRequest:(id)a3 visibleAttachment:(id *)a4
{
  void *v5;
  void *v6;

  if (a3)
  {
    objc_msgSend(a1, "_visibleAttachmentForNotificationRequest:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB35D8], "extensionWithIdentifier:error:", CFSTR("com.apple.UserNotificationsUIKit.DefaultUIExtension"), 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (a4)
        *a4 = objc_retainAutorelease(v5);
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)_loadExtensionContainerViewControllerForNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  self->_customContentLocation = 0;
  objc_msgSend(MEMORY[0x1E0CEC8B8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "categoryIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extensionForNotificationSourceIdentifier:categoryIdentifier:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v8;
  v10 = v9;
  if (!v9)
  {
    v23 = 0;
    objc_msgSend((id)objc_opt_class(), "_defaultUIExtensionForNotificationRequest:visibleAttachment:", v4, &v23);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      -[NCNotificationContentContainerViewController setExtensionContainerViewController:](self, "setExtensionContainerViewController:", 0);
      v16 = 0;
LABEL_11:
      -[NCNotificationContentContainerViewController notificationRequest](self, "notificationRequest");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "showsTextInputOnAppearance");

      if (v22)
        -[NCNotificationContentContainerViewController _setupQuickReplyForNotificationRequest:](self, "_setupQuickReplyForNotificationRequest:", v4);
      goto LABEL_13;
    }
    if (objc_msgSend(v23, "family") == 1)
      self->_customContentLocation = 1;
  }
  -[NCNotificationContentContainerViewController notificationRequest](self, "notificationRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "defaultEnvironmentActions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "bs_map:", &__block_literal_global_43);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc(MEMORY[0x1E0CEC8B0]);
  objc_msgSend(v4, "userNotification");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithExtension:notification:actions:", v10, v15, v13);

  objc_msgSend(v16, "setDelegate:", self);
  -[NCNotificationContentContainerViewController setExtensionContainerViewController:](self, "setExtensionContainerViewController:", v16);
  if (v16)
  {
    v17 = (void *)*MEMORY[0x1E0DC5F80];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F80], OS_LOG_TYPE_DEFAULT))
    {
      v18 = v17;
      objc_msgSend(v4, "notificationIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "un_logDigest");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v20;
      _os_log_impl(&dword_1CFC3D000, v18, OS_LOG_TYPE_DEFAULT, "Created extension container view controller for notification %{public}@", buf, 0xCu);

    }
  }
  if (!v9)
    goto LABEL_11;
LABEL_13:

}

uint64_t __108__NCNotificationContentContainerViewController__loadExtensionContainerViewControllerForNotificationRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0DC5FF0], "userNotificationActionForNCNotificationAction:", a2);
}

- (void)_setupQuickReplyForNotificationRequest:(id)a3
{
  void *v4;
  void *v5;

  -[NCNotificationContentContainerViewController _textInputActionInNotification:](self, "_textInputActionInNotification:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[NCNotificationContentContainerViewController _setupQuickReplyForNotificationAction:](self, "_setupQuickReplyForNotificationAction:", v4);
    v4 = v5;
  }

}

- (void)_setupQuickReplyForNotificationAction:(id)a3
{
  id v4;
  void *v5;
  NCNotificationTextInputView *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NCNotificationTextInputView *v15;

  v4 = a3;
  -[NCNotificationContentContainerViewController inputAccessoryView](self, "inputAccessoryView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NCNotificationContentContainerViewController inputAccessoryView](self, "inputAccessoryView");
    v15 = (NCNotificationTextInputView *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationTextInputView setAction:](v15, "setAction:", v4);
  }
  else
  {
    v6 = [NCNotificationTextInputView alloc];
    v15 = -[NCNotificationTextInputView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[NCNotificationTextInputView setDelegate:](v15, "setDelegate:", self);
    -[NCNotificationTextInputView setAction:](v15, "setAction:", v4);

    -[NCNotificationTextInputView sizeToFit](v15, "sizeToFit");
    -[NCNotificationContentContainerViewController notificationRequest](self, "notificationRequest");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "content");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "communicationContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0DC38A8]);
      objc_msgSend(v7, "message");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "timestamp");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "sender");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addTextEntry:timestamp:senderIdentifier:", v10, v11, v13);

      -[NCNotificationTextInputView setInputContextHistory:](v15, "setInputContextHistory:", v9);
    }
    -[NCNotificationContentContainerViewController setInputAccessoryView:](self, "setInputAccessoryView:", v15);
    -[NCNotificationContentContainerViewController reloadInputViews](self, "reloadInputViews");
    if ((objc_msgSend(v4, "showsTextInputOnAppearance") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObserver:selector:name:object:", self, sel__removeInputAccessoryView_, *MEMORY[0x1E0DC4E68], 0);

    }
  }

}

- (id)_textInputActionInNotification:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "defaultEnvironmentActions");
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v7, "behavior", (_QWORD)v9) == 1)
        {
          v4 = v7;
          goto LABEL_11;
        }
      }
      v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (void)_removeInputAccessoryView:(id)a3
{
  void *v4;
  char v5;
  void *v6;

  -[NCNotificationContentContainerViewController notificationRequest](self, "notificationRequest", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "showsTextInputOnAppearance");

  if ((v5 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4E68], 0);

    -[NCNotificationContentContainerViewController setInputAccessoryView:](self, "setInputAccessoryView:", 0);
    -[NCNotificationContentContainerViewController reloadInputViews](self, "reloadInputViews");
  }
}

- (void)_forwardActionToExtension:(id)a3 forNotification:(id)a4 withUserInfo:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  NCNotificationContentContainerViewController *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a5;
  -[NCNotificationContentContainerViewController _responseForAction:notification:userInfo:](self, "_responseForAction:notification:userInfo:", v8, a4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationContentContainerViewController extensionContainerViewController](self, "extensionContainerViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __103__NCNotificationContentContainerViewController__forwardActionToExtension_forNotification_withUserInfo___block_invoke;
  v15[3] = &unk_1E8D1DA00;
  v16 = v10;
  v17 = self;
  v18 = v8;
  v19 = v9;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  objc_msgSend(v11, "didReceiveNotificationResponse:completionHandler:", v14, v15);

}

void __103__NCNotificationContentContainerViewController__forwardActionToExtension_forNotification_withUserInfo___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD block[4];
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __103__NCNotificationContentContainerViewController__forwardActionToExtension_forNotification_withUserInfo___block_invoke_2;
  block[3] = &unk_1E8D1D9D8;
  v11 = a2;
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(a1 + 48);
  v7 = v3;
  v8 = v4;
  v9 = v5;
  v10 = *(id *)(a1 + 56);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __103__NCNotificationContentContainerViewController__forwardActionToExtension_forNotification_withUserInfo___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  unint64_t v4;
  const char *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _BYTE v17[22];
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 64);
  v3 = (void *)*MEMORY[0x1E0DC5F80];
  v4 = v2 - 1;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F80], OS_LOG_TYPE_DEFAULT))
  {
    if (v2 == 2)
      v5 = "forwarded";
    else
      v5 = "completed";
    v6 = *(void **)(a1 + 32);
    v7 = v3;
    objc_msgSend(v6, "actionIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = "did not dismiss";
    *(_DWORD *)v17 = 136446722;
    *(_QWORD *)&v17[4] = v5;
    if (v4 < 2)
      v10 = "dismissed";
    *(_WORD *)&v17[12] = 2114;
    *(_QWORD *)&v17[14] = v8;
    v18 = 2082;
    v19 = v10;
    _os_log_impl(&dword_1CFC3D000, v7, OS_LOG_TYPE_DEFAULT, "Extension container %{public}s handling of action <%{public}@> and %{public}s the notification", v17, 0x20u);

  }
  v11 = v2 == 2;
  objc_msgSend(*(id *)(a1 + 40), "delegate", *(_OWORD *)v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "actionRunner");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setShouldForwardAction:", v11);

  if (v4 <= 1)
  {
    v14 = *(void **)(a1 + 40);
    v15 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v14, "notificationRequest");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "customContent:forwardAction:forNotification:withUserInfo:", v14, v15, v16, *(_QWORD *)(a1 + 56));

  }
}

- (id)_responseForAction:(id)a3 notification:(id)a4 userInfo:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v7, "behavior"))
  {
    if (objc_msgSend(v7, "behavior") == 1)
    {
      objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0D036F0]);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      v12 = &stru_1E8D21F60;
      if (v10)
        v12 = (__CFString *)v10;
      v13 = v12;

      v14 = (void *)MEMORY[0x1E0CEC788];
      objc_msgSend(v8, "userNotification");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "responseWithNotification:actionIdentifier:userText:", v15, v16, v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v21 = (void *)*MEMORY[0x1E0DC5F80];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F80], OS_LOG_TYPE_ERROR))
        -[NCNotificationContentContainerViewController _responseForAction:notification:userInfo:].cold.1(v21, v7, v8);
      v17 = 0;
    }
  }
  else
  {
    v18 = (void *)MEMORY[0x1E0CEC750];
    objc_msgSend(v8, "userNotification");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "responseWithNotification:actionIdentifier:", v19, v20);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v17;
}

- (NCNotificationCustomContentDelegate)delegate
{
  return (NCNotificationCustomContentDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NCNotificationRequest)notificationRequest
{
  return self->_notificationRequest;
}

- (_UNNotificationContentExtensionHostContainerViewController)extensionContainerViewController
{
  return self->_extensionContainerViewController;
}

- (void)setExtensionContainerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_extensionContainerViewController, a3);
}

- (NCNotificationTextInputView)inputAccessoryView
{
  return self->_inputAccessoryView;
}

- (void)setInputAccessoryView:(id)a3
{
  objc_storeStrong((id *)&self->_inputAccessoryView, a3);
}

- (void)setCustomContentLocation:(unint64_t)a3
{
  self->_customContentLocation = a3;
}

- (NSMutableArray)updatedActions
{
  return self->_updatedActions;
}

- (void)setUpdatedActions:(id)a3
{
  objc_storeStrong((id *)&self->_updatedActions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedActions, 0);
  objc_storeStrong((id *)&self->_inputAccessoryView, 0);
  objc_storeStrong((id *)&self->_extensionContainerViewController, 0);
  objc_storeStrong((id *)&self->_notificationRequest, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_responseForAction:(void *)a1 notification:(void *)a2 userInfo:(void *)a3 .cold.1(void *a1, void *a2, void *a3)
{
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = objc_msgSend(a2, "behavior");
  objc_msgSend(a3, "notificationIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "un_logDigest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 134218242;
  v10 = v6;
  v11 = 2114;
  v12 = v8;
  _os_log_error_impl(&dword_1CFC3D000, v5, OS_LOG_TYPE_ERROR, "Unknown action behavior %lu for notification %{public}@", (uint8_t *)&v9, 0x16u);

}

@end
