@implementation NCExpandedPlatterViewController

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    NCRegisterUserNotificationsUILogging();
}

- (NCExpandedPlatterViewController)initWithNotificationRequest:(id)a3 customContentViewController:(id)a4
{
  id v6;
  id v7;
  NCExpandedPlatterViewController *v8;
  NCExpandedPlatterViewController *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)NCExpandedPlatterViewController;
  v8 = -[NCExpandedPlatterViewController init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[NCExpandedPlatterViewController setNotificationRequest:](v8, "setNotificationRequest:", v6);
    -[NCExpandedPlatterViewController _setCustomContentViewController:](v9, "_setCustomContentViewController:", v7);
  }

  return v9;
}

- (void)setNotificationRequest:(id)a3
{
  NCNotificationStaticContentProviding *staticContentProvider;
  void *v6;
  id v7;

  v7 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_notificationRequest, a3);
    staticContentProvider = self->_staticContentProvider;
    self->_staticContentProvider = 0;

    -[NCExpandedPlatterViewController viewIfLoaded](self, "viewIfLoaded");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNeedsLayout");

    -[NCExpandedPlatterViewController _updateScreenCaptureProhibited](self, "_updateScreenCaptureProhibited");
  }

}

- (void)playMedia
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[NCNotificationCustomContent playMedia](self->_customContentViewController, "playMedia");
}

- (BOOL)canBecomeFirstResponder
{
  objc_super v3;

  if (self->_customContentViewController)
    return -[NCNotificationCustomContent canBecomeFirstResponder](self->_customContentViewController, "canBecomeFirstResponder");
  v3.receiver = self;
  v3.super_class = (Class)NCExpandedPlatterViewController;
  return -[NCExpandedPlatterViewController canBecomeFirstResponder](&v3, sel_canBecomeFirstResponder);
}

- (BOOL)becomeFirstResponder
{
  char v3;
  NCNotificationCustomContent *customContentViewController;
  objc_super v6;

  if (self->_customContentViewController)
  {
    v3 = objc_opt_respondsToSelector();
    customContentViewController = self->_customContentViewController;
    if ((v3 & 1) != 0)
      return -[NCNotificationCustomContent restoreInputViews](customContentViewController, "restoreInputViews");
    else
      return -[NCNotificationCustomContent becomeFirstResponder](customContentViewController, "becomeFirstResponder");
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)NCExpandedPlatterViewController;
    return -[NCExpandedPlatterViewController becomeFirstResponder](&v6, sel_becomeFirstResponder);
  }
}

- (BOOL)canResignFirstResponder
{
  objc_super v3;

  if (self->_customContentViewController)
    return -[NCNotificationCustomContent canResignFirstResponder](self->_customContentViewController, "canResignFirstResponder");
  v3.receiver = self;
  v3.super_class = (Class)NCExpandedPlatterViewController;
  return -[NCExpandedPlatterViewController canResignFirstResponder](&v3, sel_canResignFirstResponder);
}

- (BOOL)resignFirstResponder
{
  objc_super v4;

  if (self->_customContentViewController)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[NCNotificationCustomContent preserveInputViews](self->_customContentViewController, "preserveInputViews");
    return -[NCNotificationCustomContent resignFirstResponder](self->_customContentViewController, "resignFirstResponder");
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)NCExpandedPlatterViewController;
    return -[NCExpandedPlatterViewController resignFirstResponder](&v4, sel_resignFirstResponder);
  }
}

- (void)keyboardWillShow:(id)a3
{
  id v4;

  if (-[NCExpandedPlatterViewController bs_isAppearingOrAppeared](self, "bs_isAppearingOrAppeared", a3))
  {
    if (-[NCNotificationCustomContent _containsFirstResponder](self->_customContentViewController, "_containsFirstResponder"))
    {
      -[NCExpandedPlatterViewController _expandedPlatterViewIfLoaded](self, "_expandedPlatterViewIfLoaded");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setScrollViewPinnedToBottom:", 1);

    }
  }
}

- (void)keyboardWillHide:(id)a3
{
  id v3;

  -[NCExpandedPlatterViewController _expandedPlatterViewIfLoaded](self, "_expandedPlatterViewIfLoaded", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setScrollViewPinnedToBottom:", 0);

}

- (void)loadView
{
  NCExpandedPlatterView *v3;

  v3 = objc_alloc_init(NCExpandedPlatterView);
  -[PLExpandedPlatterView setDelegate:](v3, "setDelegate:", self);
  -[PLExpandedPlatterView setHeaderEnabled:](v3, "setHeaderEnabled:", 0);
  -[PLExpandedPlatterView setDismissControlEnabled:](v3, "setDismissControlEnabled:", 0);
  -[NCExpandedPlatterViewController setView:](self, "setView:", v3);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NCExpandedPlatterViewController;
  -[NCExpandedPlatterViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[NCExpandedPlatterViewController _updateWithProvidedStaticContent](self, "_updateWithProvidedStaticContent");
  -[NCExpandedPlatterViewController _updateWithProvidedCustomContent](self, "_updateWithProvidedCustomContent");
  -[NCExpandedPlatterViewController _updatePreferredContentSize](self, "_updatePreferredContentSize");
  -[NCExpandedPlatterViewController _updateScreenCaptureProhibited](self, "_updateScreenCaptureProhibited");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NCExpandedPlatterViewController;
  -[NCExpandedPlatterViewController viewWillAppear:](&v8, sel_viewWillAppear_, a3);
  -[NCExpandedPlatterViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "makeKeyAndVisible");

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_keyboardWillShow_, *MEMORY[0x1E0DC4FE8], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_keyboardWillHide_, *MEMORY[0x1E0DC4FE0], 0);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NCExpandedPlatterViewController;
  -[NCExpandedPlatterViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, a3);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4FE8], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4FE0], 0);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NCExpandedPlatterViewController;
  -[NCExpandedPlatterViewController viewDidDisappear:](&v6, sel_viewDidDisappear_, a3);
  -[NCExpandedPlatterViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resignKeyWindow");

}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NCExpandedPlatterViewController;
  -[NCExpandedPlatterViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  -[NCExpandedPlatterViewController _setupStaticContentProviderIfNecessary](self, "_setupStaticContentProviderIfNecessary");
  -[NCExpandedPlatterViewController _updatePreferredContentSize](self, "_updatePreferredContentSize");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NCExpandedPlatterViewController;
  -[NCExpandedPlatterViewController preferredContentSizeDidChangeForChildContentContainer:](&v4, sel_preferredContentSizeDidChangeForChildContentContainer_, a3);
  -[NCExpandedPlatterViewController _updatePreferredContentSize](self, "_updatePreferredContentSize");
}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  double height;
  double width;
  double v8;
  double v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  objc_super v16;
  CGSize result;

  height = a4.height;
  width = a4.width;
  if (self->_customContentViewController == a3)
  {
    v10 = a3;
    -[NCExpandedPlatterViewController _maximumPlatterSize](self, "_maximumPlatterSize");
    if (width < v11)
      v11 = width;
    objc_msgSend(v10, "sizeForChildContentContainer:withParentContainerSize:", v10, v11, height);
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)NCExpandedPlatterViewController;
    -[NCExpandedPlatterViewController sizeForChildContentContainer:withParentContainerSize:](&v16, sel_sizeForChildContentContainer_withParentContainerSize_, a3, a4.width, a4.height);
  }
  v12 = v8;
  v13 = v9;

  v14 = v12;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (PLExpandedPlatterDismissing)dismisser
{
  void *WeakRetained;
  void *v4;
  PLExpandedPlatterDismissing *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dismisser);
  v4 = WeakRetained;
  if (!WeakRetained)
    WeakRetained = self;
  v5 = WeakRetained;

  return v5;
}

- (void)expandedPlatterPresentable:(id)a3 requestsDismissalWithTrigger:(int64_t)a4
{
  id v6;
  __CFString *v7;
  __CFString *v8;
  NSString *dismissalReason;
  id WeakRetained;
  id v11;

  v6 = a3;
  if (!self->_dismissalReason)
  {
    v11 = v6;
    if (a4 == 2)
      v7 = CFSTR("dismissalReasonHomeAction");
    else
      v7 = 0;
    v8 = v7;
    if (a4 == 2)
    {
      dismissalReason = self->_dismissalReason;
      self->_dismissalReason = (NSString *)CFSTR("dismissalReasonHomeAction");

      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(WeakRetained, "expandedPlatterViewController:requestsDismissalWithReason:userInfo:", self, self->_dismissalReason, 0);

    }
    v6 = v11;
  }

}

- (void)addExpandedPlatterObserver:(id)a3
{
  id v4;
  NSHashTable *observers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    observers = self->_observers;
    v8 = v4;
    if (!observers)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
      v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      v7 = self->_observers;
      self->_observers = v6;

      observers = self->_observers;
    }
    -[NSHashTable addObject:](observers, "addObject:", v8);
    v4 = v8;
  }

}

- (void)removeExpandedPlatterObserver:(id)a3
{
  NSHashTable *observers;

  if (a3)
  {
    observers = self->_observers;
    if (observers)
      -[NSHashTable removeObject:](observers, "removeObject:");
  }
}

- (void)_notifyObserversWithBlock:(id)a3
{
  void (**v4)(id, NCExpandedPlatterViewController *, _QWORD);
  NSHashTable *observers;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  id v11;
  id location;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, NCExpandedPlatterViewController *, _QWORD))a3;
  if (v4)
  {
    observers = self->_observers;
    if (observers)
    {
      v13 = 0u;
      v14 = 0u;
      v15 = 0u;
      v16 = 0u;
      v6 = (id)-[NSHashTable copy](observers, "copy");
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
      {
        v8 = *(_QWORD *)v14;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v14 != v8)
              objc_enumerationMutation(v6);
            v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
            v11 = objc_initWeak(&location, self);
            v4[2](v4, self, v10);

            objc_destroyWeak(&location);
          }
          v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        }
        while (v7);
      }

    }
  }

}

- (void)expandedPlatterWillPresent:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  NCNotificationRequest *notificationRequest;
  NSObject *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[NCExpandedPlatterViewController _canTransitionToPlatterPresentationState:](self, "_canTransitionToPlatterPresentationState:", 1);
  v6 = (void *)*MEMORY[0x1E0DC5F70];
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
    {
      notificationRequest = self->_notificationRequest;
      v8 = v6;
      -[NCNotificationRequest notificationIdentifier](notificationRequest, "notificationIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "un_logDigest");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v14 = v10;
      _os_log_impl(&dword_1CFC3D000, v8, OS_LOG_TYPE_DEFAULT, "Expanded platter will present for request %{public}@", buf, 0xCu);

    }
    self->_expandedPlatterPresentationState = 1;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __62__NCExpandedPlatterViewController_expandedPlatterWillPresent___block_invoke;
    v11[3] = &unk_1E8D1DA70;
    v12 = v4;
    -[NCExpandedPlatterViewController _notifyObserversWithBlock:](self, "_notifyObserversWithBlock:", v11);

  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_ERROR))
  {
    -[NCExpandedPlatterViewController expandedPlatterWillPresent:].cold.1((uint64_t)self, v6);
  }

}

void __62__NCExpandedPlatterViewController_expandedPlatterWillPresent___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "expandedPlatterWillPresent:", *(_QWORD *)(a1 + 32));

}

- (void)expandedPlatterDidPresent:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  NCNotificationRequest *notificationRequest;
  NSObject *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[NCExpandedPlatterViewController _canTransitionToPlatterPresentationState:](self, "_canTransitionToPlatterPresentationState:", 2);
  v6 = (void *)*MEMORY[0x1E0DC5F70];
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
    {
      notificationRequest = self->_notificationRequest;
      v8 = v6;
      -[NCNotificationRequest notificationIdentifier](notificationRequest, "notificationIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "un_logDigest");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v14 = v10;
      _os_log_impl(&dword_1CFC3D000, v8, OS_LOG_TYPE_DEFAULT, "Expanded platter did present for request %{public}@", buf, 0xCu);

    }
    self->_expandedPlatterPresentationState = 2;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __61__NCExpandedPlatterViewController_expandedPlatterDidPresent___block_invoke;
    v11[3] = &unk_1E8D1DA70;
    v12 = v4;
    -[NCExpandedPlatterViewController _notifyObserversWithBlock:](self, "_notifyObserversWithBlock:", v11);

  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_ERROR))
  {
    -[NCExpandedPlatterViewController expandedPlatterDidPresent:].cold.1((uint64_t)self, v6);
  }

}

void __61__NCExpandedPlatterViewController_expandedPlatterDidPresent___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "expandedPlatterDidPresent:", *(_QWORD *)(a1 + 32));

}

- (void)expandedPlatter:(id)a3 willDismissWithReason:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  void *v9;
  NCNotificationRequest *notificationRequest;
  NSObject *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = -[NCExpandedPlatterViewController _canTransitionToPlatterPresentationState:](self, "_canTransitionToPlatterPresentationState:", 3);
  v9 = (void *)*MEMORY[0x1E0DC5F70];
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
    {
      notificationRequest = self->_notificationRequest;
      v11 = v9;
      -[NCNotificationRequest notificationIdentifier](notificationRequest, "notificationIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "un_logDigest");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v13;
      v19 = 2114;
      v20 = v7;
      _os_log_impl(&dword_1CFC3D000, v11, OS_LOG_TYPE_DEFAULT, "Expanded platter will dismiss for request %{public}@ (reason: %{public}@)", buf, 0x16u);

    }
    self->_expandedPlatterPresentationState = 3;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __73__NCExpandedPlatterViewController_expandedPlatter_willDismissWithReason___block_invoke;
    v14[3] = &unk_1E8D1DA98;
    v15 = v6;
    v16 = v7;
    -[NCExpandedPlatterViewController _notifyObserversWithBlock:](self, "_notifyObserversWithBlock:", v14);

  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_ERROR))
  {
    -[NCExpandedPlatterViewController expandedPlatter:willDismissWithReason:].cold.1((uint64_t)self, v9);
  }

}

void __73__NCExpandedPlatterViewController_expandedPlatter_willDismissWithReason___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "expandedPlatter:willDismissWithReason:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)expandedPlatter:(id)a3 didDismissWithReason:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  void *v9;
  NCNotificationRequest *notificationRequest;
  NSObject *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = -[NCExpandedPlatterViewController _canTransitionToPlatterPresentationState:](self, "_canTransitionToPlatterPresentationState:", 0);
  v9 = (void *)*MEMORY[0x1E0DC5F70];
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
    {
      notificationRequest = self->_notificationRequest;
      v11 = v9;
      -[NCNotificationRequest notificationIdentifier](notificationRequest, "notificationIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "un_logDigest");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v13;
      v19 = 2114;
      v20 = v7;
      _os_log_impl(&dword_1CFC3D000, v11, OS_LOG_TYPE_DEFAULT, "Expanded platter did dismiss for request %{public}@ (reason: %{public}@)", buf, 0x16u);

    }
    self->_expandedPlatterPresentationState = 0;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __72__NCExpandedPlatterViewController_expandedPlatter_didDismissWithReason___block_invoke;
    v14[3] = &unk_1E8D1DA98;
    v15 = v6;
    v16 = v7;
    -[NCExpandedPlatterViewController _notifyObserversWithBlock:](self, "_notifyObserversWithBlock:", v14);

  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_ERROR))
  {
    -[NCExpandedPlatterViewController expandedPlatter:didDismissWithReason:].cold.1((uint64_t)self, v9);
  }

}

void __72__NCExpandedPlatterViewController_expandedPlatter_didDismissWithReason___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "expandedPlatter:didDismissWithReason:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)userInteractionWillBeginForExpandedPlatter:(id)a3
{
  id v4;
  void *v5;
  NCNotificationRequest *notificationRequest;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)*MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    notificationRequest = self->_notificationRequest;
    v7 = v5;
    -[NCNotificationRequest notificationIdentifier](notificationRequest, "notificationIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "un_logDigest");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v14 = v9;
    _os_log_impl(&dword_1CFC3D000, v7, OS_LOG_TYPE_DEFAULT, "User interaction will begin for expanded platter for request %{public}@", buf, 0xCu);

  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __78__NCExpandedPlatterViewController_userInteractionWillBeginForExpandedPlatter___block_invoke;
  v11[3] = &unk_1E8D1DA70;
  v12 = v4;
  v10 = v4;
  -[NCExpandedPlatterViewController _notifyObserversWithBlock:](self, "_notifyObserversWithBlock:", v11);

}

void __78__NCExpandedPlatterViewController_userInteractionWillBeginForExpandedPlatter___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "userInteractionWillBeginForExpandedPlatter:", *(_QWORD *)(a1 + 32));

}

- (void)userInteractionDidEndForExpandedPlatter:(id)a3
{
  id v4;
  void *v5;
  NCNotificationRequest *notificationRequest;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)*MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    notificationRequest = self->_notificationRequest;
    v7 = v5;
    -[NCNotificationRequest notificationIdentifier](notificationRequest, "notificationIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "un_logDigest");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v14 = v9;
    _os_log_impl(&dword_1CFC3D000, v7, OS_LOG_TYPE_DEFAULT, "User interaction did end for expanded platter for request %{public}@", buf, 0xCu);

  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __75__NCExpandedPlatterViewController_userInteractionDidEndForExpandedPlatter___block_invoke;
  v11[3] = &unk_1E8D1DA70;
  v12 = v4;
  v10 = v4;
  -[NCExpandedPlatterViewController _notifyObserversWithBlock:](self, "_notifyObserversWithBlock:", v11);

}

void __75__NCExpandedPlatterViewController_userInteractionDidEndForExpandedPlatter___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "userInteractionDidEndForExpandedPlatter:", *(_QWORD *)(a1 + 32));

}

- (void)expandedPlatterView:(id)a3 requestsInteractionWithURL:(id)a4
{
  id v6;
  id v7;
  id v8;
  char v9;
  NSString *dismissalReason;
  id WeakRetained;
  NSString *v12;
  void *v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[NCExpandedPlatterViewController _expandedPlatterViewIfLoaded](self, "_expandedPlatterViewIfLoaded");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 == v6)
  {
    if (self->_dismissalReason)
    {
      v9 = BSEqualStrings();

      if ((v9 & 1) == 0)
        goto LABEL_10;
    }
    else
    {

    }
    dismissalReason = self->_dismissalReason;
    self->_dismissalReason = (NSString *)CFSTR("dismissalReasonURL");

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v12 = self->_dismissalReason;
      v14 = CFSTR("NCExpandedPlatterObservableDismissalReasonUserInfoKeyURL");
      v15[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "expandedPlatterViewController:requestsDismissalWithReason:userInfo:", self, v12, v13);

    }
  }
  else
  {

  }
LABEL_10:

}

- (BOOL)expandedPlatterView:(id)a3 tapGestureRecognizerShouldReceiveTouch:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;

  v5 = a4;
  if (-[NCNotificationCustomContent userInteractionEnabled](self->_customContentViewController, "userInteractionEnabled"))
  {
    objc_msgSend(v5, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCExpandedPlatterViewController _expandedPlatterViewIfLoaded](self, "_expandedPlatterViewIfLoaded");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "customContentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "isDescendantOfView:", v8) ^ 1;

  }
  else
  {
    LOBYTE(v9) = 1;
  }

  return v9;
}

- (void)customContent:(id)a3 requestPermissionToExecuteAction:(id)a4 forNotification:(id)a5 withUserInfo:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id WeakRetained;
  id v17;

  v17 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "customContent:requestPermissionToExecuteAction:forNotification:withUserInfo:completionHandler:", v17, v12, v13, v14, v15);

}

- (void)customContent:(id)a3 forwardAction:(id)a4 forNotification:(id)a5 withUserInfo:(id)a6
{
  id v10;
  id v11;
  id v12;
  id WeakRetained;
  id v14;

  v14 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "customContent:forwardAction:forNotification:withUserInfo:", v14, v10, v11, v12);

}

- (void)customContentRequestsDefaultAction:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "customContentRequestsDefaultAction:", v5);

}

- (void)customContentRequestsDismiss:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "customContentRequestsDismiss:", v5);

}

- (void)customContentDidLoadExtension:(id)a3
{
  void *v4;
  id v5;

  if (-[NCExpandedPlatterViewController bs_isAppearingOrAppeared](self, "bs_isAppearingOrAppeared", a3))
  {
    -[NCExpandedPlatterViewController view](self, "view");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "makeKeyAndVisible");

  }
}

- (void)customContentDidUpdateTitle:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "customContentDidUpdateTitle:", v5);

}

- (void)customContent:(id)a3 didUpdateUserNotificationActions:(id)a4
{
  id v6;
  id WeakRetained;
  id v8;

  v8 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "customContent:didUpdateUserNotificationActions:", v8, v6);

}

- (CGSize)_maximumPlatterSize
{
  void *v2;
  uint64_t v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  CGSize result;
  CGRect v19;
  CGRect v20;

  -[NCExpandedPlatterViewController traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3 == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_referenceBounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;

    v19.origin.x = v6;
    v19.origin.y = v8;
    v19.size.width = v10;
    v19.size.height = v12;
    CGRectGetWidth(v19);
    UICeilToScale();
    v14 = v13;
    v20.origin.x = v6;
    v20.origin.y = v8;
    v20.size.width = v10;
    v20.size.height = v12;
    CGRectGetHeight(v20);
    UICeilToScale();
    v16 = v15;
  }
  else
  {
    v16 = 1.79769313e308;
    *(double *)&v14 = 556.0;
  }
  v17 = *(double *)&v14;
  result.height = v16;
  result.width = v17;
  return result;
}

- (BOOL)_canTransitionToPlatterPresentationState:(int)a3
{
  BOOL v3;
  BOOL result;

  switch(self->_expandedPlatterPresentationState)
  {
    case 0:
      v3 = a3 == 1;
      goto LABEL_5;
    case 1:
      v3 = (a3 & 0xFFFFFFFE) == 2;
LABEL_5:
      result = v3;
      break;
    case 2:
      result = 1;
      break;
    case 3:
      result = a3 < 2;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (id)_expandedPlatterViewLoadingIfNecessary:(BOOL)a3
{
  if (a3)
    -[NCExpandedPlatterViewController view](self, "view");
  else
    -[NCExpandedPlatterViewController viewIfLoaded](self, "viewIfLoaded");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_expandedPlatterViewIfLoaded
{
  return -[NCExpandedPlatterViewController _expandedPlatterViewLoadingIfNecessary:](self, "_expandedPlatterViewLoadingIfNecessary:", 0);
}

- (id)_expandedPlatterView
{
  return -[NCExpandedPlatterViewController _expandedPlatterViewLoadingIfNecessary:](self, "_expandedPlatterViewLoadingIfNecessary:", 1);
}

- (CGSize)_preferredCustomContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[NCExpandedPlatterViewController _expandedPlatterViewIfLoaded](self, "_expandedPlatterViewIfLoaded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "customContentSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)_setPreferredCustomContentSize:(CGSize)a3
{
  double height;
  double width;
  id v5;

  height = a3.height;
  width = a3.width;
  -[NCExpandedPlatterViewController _expandedPlatterViewIfLoaded](self, "_expandedPlatterViewIfLoaded");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCustomContentSize:", width, height);

}

- (void)_updatePreferredCustomContentSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  id v11;

  -[UIViewController nc_presentationControllerIfPresented](self, "nc_presentationControllerIfPresented");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "containerView");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "bounds");
    v5 = v4;
    v7 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    v5 = v9;
    v7 = v10;

  }
  -[NCExpandedPlatterViewController sizeForChildContentContainer:withParentContainerSize:](self, "sizeForChildContentContainer:withParentContainerSize:", self->_customContentViewController, v5, v7);
  -[NCExpandedPlatterViewController _setPreferredCustomContentSize:](self, "_setPreferredCustomContentSize:");

}

- (void)_updatePreferredContentSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  _BOOL4 v20;
  _BOOL4 v21;
  void (**v22)(void *, _QWORD);
  _NCExpandedPlatterViewControllerAnimator *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD aBlock[7];

  -[NCExpandedPlatterViewController _expandedPlatterViewIfLoaded](self, "_expandedPlatterViewIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[NCExpandedPlatterViewController _preferredCustomContentSize](self, "_preferredCustomContentSize");
    v5 = v4;
    v7 = v6;
    -[NCExpandedPlatterViewController _updatePreferredCustomContentSize](self, "_updatePreferredCustomContentSize");
    objc_msgSend(v3, "customContentSize");
    v9 = v8;
    v11 = v10;
    objc_msgSend(v3, "sizeThatFitsContentWithSize:");
    v13 = v12;
    v15 = v14;
    -[NCExpandedPlatterViewController _maximumPlatterSize](self, "_maximumPlatterSize");
    if (v13 > v16)
      v13 = v16;
    if (v15 > v17)
      v15 = v17;
    -[NCExpandedPlatterViewController preferredContentSize](self, "preferredContentSize");
    v20 = v19 != v15 || v18 != v13;
    v21 = v7 != v11 || v5 != v9;
    if (v20 || v21)
    {
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __62__NCExpandedPlatterViewController__updatePreferredContentSize__block_invoke;
      aBlock[3] = &unk_1E8D1DAC0;
      aBlock[4] = self;
      *(double *)&aBlock[5] = v13;
      *(double *)&aBlock[6] = v15;
      v22 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
      if (-[NCExpandedPlatterViewController _appearState](self, "_appearState") == 2)
      {
        v23 = objc_alloc_init(_NCExpandedPlatterViewControllerAnimator);
        v24 = objc_alloc_init(MEMORY[0x1E0DC4490]);
        objc_msgSend(v3, "customContentView");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "_setContainerView:", v25);

        objc_msgSend(v24, "_setAnimator:", v23);
        objc_msgSend(v24, "_transitionCoordinator");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v26;
        if (v20)
          objc_msgSend(v26, "animateAlongsideTransition:completion:", v22, 0);
        if (v21)
          -[NCNotificationCustomContent viewWillTransitionToSize:withTransitionCoordinator:](self->_customContentViewController, "viewWillTransitionToSize:withTransitionCoordinator:", v27, v9, v11);
        -[_NCExpandedPlatterViewControllerAnimator animateTransition:](v23, "animateTransition:", v24);

      }
      else
      {
        v22[2](v22, 0);
      }

    }
  }

}

uint64_t __62__NCExpandedPlatterViewController__updatePreferredContentSize__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPreferredContentSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (void)_updateScreenCaptureProhibited
{
  void *v3;
  id v4;

  -[NCExpandedPlatterViewController _expandedPlatterViewIfLoaded](self, "_expandedPlatterViewIfLoaded");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NCNotificationRequest options](self->_notificationRequest, "options");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setScreenCaptureProhibited:", objc_msgSend(v3, "screenCaptureProhibited"));

}

- (void)_updateWithProvidedStaticContent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NCNotificationStaticContentProviding *staticContentProvider;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  -[NCExpandedPlatterViewController _expandedPlatterViewIfLoaded](self, "_expandedPlatterViewIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v21 = v3;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[NCNotificationStaticContentProviding badgedIconView](self->_staticContentProvider, "badgedIconView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setShadowEnabled:", 1);
      objc_msgSend(v21, "setBadgedIconView:", v4);

    }
    -[NCNotificationStaticContentProviding date](self->_staticContentProvider, "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setDate:", v5);

    objc_msgSend(v21, "setDateAllDay:", -[NCNotificationStaticContentProviding isDateAllDay](self->_staticContentProvider, "isDateAllDay"));
    -[NCNotificationStaticContentProviding timeZone](self->_staticContentProvider, "timeZone");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setTimeZone:", v6);

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = objc_msgSend(WeakRetained, "expandedPlatterViewController:dateFormatStyleForNotificationRequest:", self, self->_notificationRequest);
    else
      v8 = 1;
    objc_msgSend(v21, "setDateFormatStyle:", v8);
    -[NCNotificationStaticContentProviding primaryText](self->_staticContentProvider, "primaryText");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setPrimaryText:", v9);

    -[NCNotificationStaticContentProviding primarySubtitleText](self->_staticContentProvider, "primarySubtitleText");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setPrimarySubtitleText:", v10);

    -[NCNotificationStaticContentProviding secondaryText](self->_staticContentProvider, "secondaryText");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setSecondaryText:", v11);

    if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
      v12 = objc_msgSend(WeakRetained, "importantAdornmentEligibleOptionsForNotificationViewController:", self);
    else
      v12 = -1;
    staticContentProvider = self->_staticContentProvider;
    objc_msgSend(v21, "importantTextImageConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationStaticContentProviding importantAttributedTextWithImageConfiguration:importantAdornmentEligibleOptions:](staticContentProvider, "importantAttributedTextWithImageConfiguration:importantAdornmentEligibleOptions:", v14, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v15, "length"))
    {
      objc_msgSend(v21, "setImportantAttributedText:", v15);
    }
    else
    {
      -[NCNotificationStaticContentProviding importantText](self->_staticContentProvider, "importantText");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setImportantText:", v16);

    }
    -[NCNotificationStaticContentProviding importantTextVisualStylingProvider](self->_staticContentProvider, "importantTextVisualStylingProvider");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setImportantTextVisualStylingProvider:", v17);

    -[NCNotificationStaticContentProviding footerText](self->_staticContentProvider, "footerText");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setFooterText:", v18);

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[NCNotificationStaticContentProviding thumbnail](self->_staticContentProvider, "thumbnail");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setThumbnail:", v19);

    }
    objc_msgSend(v21, "defaultTapGestureRecognizer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addTarget:action:", self, sel__handleDefaultTap_);

    v3 = v21;
  }

}

- (void)_setupStaticContentProviderIfNecessary
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 1008);
  v3 = a2;
  objc_msgSend(v2, "notificationIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "un_logDigest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543362;
  v7 = v5;
  _os_log_debug_impl(&dword_1CFC3D000, v3, OS_LOG_TYPE_DEBUG, "Delegate failed to provide static content provider for expanded platter with notification request %{public}@ – instantiating default", (uint8_t *)&v6, 0xCu);

}

- (void)_setCustomContentViewController:(id)a3
{
  NCNotificationCustomContent *v5;
  NCNotificationCustomContent **p_customContentViewController;
  NCNotificationCustomContent *customContentViewController;
  NCNotificationCustomContent *v8;

  v5 = (NCNotificationCustomContent *)a3;
  p_customContentViewController = &self->_customContentViewController;
  customContentViewController = self->_customContentViewController;
  v8 = v5;
  if (customContentViewController != v5)
  {
    -[NCNotificationCustomContent willMoveToParentViewController:](customContentViewController, "willMoveToParentViewController:", 0);
    -[NCNotificationCustomContent removeFromParentViewController](*p_customContentViewController, "removeFromParentViewController");
    objc_storeStrong((id *)&self->_customContentViewController, a3);
    if (*p_customContentViewController)
    {
      -[NCNotificationCustomContent setDelegate:](*p_customContentViewController, "setDelegate:", self);
      -[NCExpandedPlatterViewController addChildViewController:](self, "addChildViewController:", *p_customContentViewController);
      -[NCNotificationCustomContent didMoveToParentViewController:](*p_customContentViewController, "didMoveToParentViewController:", self);
    }
  }

}

- (void)_updateWithProvidedCustomContent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[NCExpandedPlatterViewController _expandedPlatterViewIfLoaded](self, "_expandedPlatterViewIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v7 = v3;
    -[NCExpandedPlatterViewController _updatePreferredCustomContentSize](self, "_updatePreferredCustomContentSize");
    -[NCNotificationCustomContent view](self->_customContentViewController, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "customContentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidesNotificationContent:", -[NCNotificationCustomContent defaultContentHidden](self->_customContentViewController, "defaultContentHidden"));
    objc_msgSend(v4, "superview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 != v5)
    {
      objc_msgSend(v5, "addSubview:", v4);
      objc_msgSend(v5, "bounds");
      objc_msgSend(v4, "setFrame:");
      objc_msgSend(v4, "setAutoresizingMask:", 18);
    }

    v3 = v7;
  }

}

- (void)_handleDefaultTap:(id)a3
{
  _QWORD v4[4];
  id v5;
  id location;

  if (objc_msgSend(a3, "state") == 3 && !self->_dismissalReason)
  {
    self->_dismissalReason = (NSString *)CFSTR("dismissalReasonDefaultTap");

    objc_initWeak(&location, self);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __53__NCExpandedPlatterViewController__handleDefaultTap___block_invoke;
    v4[3] = &unk_1E8D1B278;
    objc_copyWeak(&v5, &location);
    dispatch_async(MEMORY[0x1E0C80D38], v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __53__NCExpandedPlatterViewController__handleDefaultTap___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  int v2;
  void *v3;
  _QWORD *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v2 = BSEqualStrings();
    WeakRetained = v4;
    if (v2)
    {
      objc_msgSend(v4, "delegate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v3, "expandedPlatterViewController:requestsDismissalWithReason:userInfo:", v4, v4[123], 0);

      WeakRetained = v4;
    }
  }

}

- (void)setDismisser:(id)a3
{
  objc_storeWeak((id *)&self->_dismisser, a3);
}

- (NCNotificationRequest)notificationRequest
{
  return self->_notificationRequest;
}

- (NCNotificationCustomContent)customContentViewController
{
  return self->_customContentViewController;
}

- (NCExpandedPlatterViewControllerDelegate)delegate
{
  return (NCExpandedPlatterViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)_pendingPresentationTransitionDidEndBlock
{
  return self->_pendingPresentationTransitionDidEndBlock;
}

- (void)_setPendingPresentationTransitionDidEndBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1032);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pendingPresentationTransitionDidEndBlock, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_customContentViewController, 0);
  objc_storeStrong((id *)&self->_notificationRequest, 0);
  objc_destroyWeak((id *)&self->_dismisser);
  objc_storeStrong((id *)&self->_dismissalReason, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_staticContentProvider, 0);
}

- (void)expandedPlatterWillPresent:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  void *v2;
  unsigned int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  OUTLINED_FUNCTION_3_1(a1, a2);
  v3 = OUTLINED_FUNCTION_4();
  NCStringForAppearState(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NCStringForAppearState(1u);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_1CFC3D000, v6, v7, "%{public}@: Illegal transition attempted from '%{public}@' to '%{public}@' – aborting", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_2_3();
}

- (void)expandedPlatterDidPresent:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  void *v2;
  unsigned int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  OUTLINED_FUNCTION_3_1(a1, a2);
  v3 = OUTLINED_FUNCTION_4();
  NCStringForAppearState(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NCStringForAppearState(2u);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_1CFC3D000, v6, v7, "%{public}@: Illegal transition attempted from '%{public}@' to '%{public}@' – aborting", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_2_3();
}

- (void)expandedPlatter:(uint64_t)a1 willDismissWithReason:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  void *v2;
  unsigned int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  OUTLINED_FUNCTION_3_1(a1, a2);
  v3 = OUTLINED_FUNCTION_4();
  NCStringForAppearState(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NCStringForAppearState(3u);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_1CFC3D000, v6, v7, "%{public}@: Illegal transition attempted from '%{public}@' to '%{public}@' – aborting", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_2_3();
}

- (void)expandedPlatter:(uint64_t)a1 didDismissWithReason:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  void *v2;
  unsigned int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  OUTLINED_FUNCTION_3_1(a1, a2);
  v3 = OUTLINED_FUNCTION_4();
  NCStringForAppearState(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NCStringForAppearState(0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_1CFC3D000, v6, v7, "%{public}@: Illegal transition attempted from '%{public}@' to '%{public}@' – aborting", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_2_3();
}

@end
