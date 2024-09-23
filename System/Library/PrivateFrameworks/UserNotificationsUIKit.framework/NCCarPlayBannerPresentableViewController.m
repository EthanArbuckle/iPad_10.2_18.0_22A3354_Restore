@implementation NCCarPlayBannerPresentableViewController

+ (NSString)requesterIdentifier
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0DC6008], "requesterIdentifier");
}

- (NCCarPlayBannerPresentableViewController)initWithNotificationRequest:(id)a3
{
  id v5;
  NCCarPlayBannerPresentableViewController *v6;
  NCCarPlayBannerPresentableViewController *v7;
  uint64_t v8;
  NCNotificationStaticContentProviding *staticContentProvider;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NCCarPlayBannerPresentableViewController;
  v6 = -[NCCarPlayBannerPresentableViewController init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_notificationRequest, a3);
    -[NCCarPlayBannerPresentableViewController _staticContentProviderFromRequest:](v7, "_staticContentProviderFromRequest:", v5);
    v8 = objc_claimAutoreleasedReturnValue();
    staticContentProvider = v7->_staticContentProvider;
    v7->_staticContentProvider = (NCNotificationStaticContentProviding *)v8;

  }
  return v7;
}

- (void)updateRequestToInstance:(id)a3
{
  id v5;
  NCNotificationStaticContentProviding *v6;
  NCNotificationStaticContentProviding *staticContentProvider;

  objc_storeStrong((id *)&self->_notificationRequest, a3);
  v5 = a3;
  -[NCCarPlayBannerPresentableViewController _staticContentProviderFromRequest:](self, "_staticContentProviderFromRequest:", v5);
  v6 = (NCNotificationStaticContentProviding *)objc_claimAutoreleasedReturnValue();
  staticContentProvider = self->_staticContentProvider;
  self->_staticContentProvider = v6;

  -[NCCarPlayBannerPresentableViewController _updateStaticContentProvider](self, "_updateStaticContentProvider");
}

- (void)invalidateDisplayProperties
{
  -[NCCarPlayBannerContentView invalidateDisplayProperties](self->_bannerContentView, "invalidateDisplayProperties");
}

- (void)loadView
{
  id v3;

  objc_msgSend(MEMORY[0x1E0D7D3F0], "platterViewWithStyle:", *MEMORY[0x1E0D7D400]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[NCCarPlayBannerPresentableViewController setView:](self, "setView:", v3);

}

- (void)viewDidLoad
{
  NCCarPlayBannerContentView *v3;
  NCCarPlayBannerContentView *bannerContentView;
  void *v5;
  objc_class *v6;
  void *v7;
  NCCarPlayBannerContentView *v8;
  void *v9;
  void (**v10)(void *, char *, _QWORD);
  void *v11;
  UITapGestureRecognizer *v12;
  UITapGestureRecognizer *contentSelectPressGesture;
  void *v14;
  void *v15;
  _QWORD aBlock[5];
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)NCCarPlayBannerPresentableViewController;
  -[NCCarPlayBannerPresentableViewController viewDidLoad](&v17, sel_viewDidLoad);
  v3 = objc_alloc_init(NCCarPlayBannerContentView);
  bannerContentView = self->_bannerContentView;
  self->_bannerContentView = v3;

  -[NCCarPlayBannerContentView setDelegate:](self->_bannerContentView, "setDelegate:", self);
  -[NCCarPlayBannerPresentableViewController _platterView](self, "_platterView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMaterialGroupNameBase:", v7);

  v8 = self->_bannerContentView;
  objc_msgSend(v5, "bounds");
  -[NCCarPlayBannerContentView setFrame:](v8, "setFrame:");
  objc_msgSend(v5, "customContentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", self->_bannerContentView);

  -[NCCarPlayBannerContentView setAutoresizingMask:](self->_bannerContentView, "setAutoresizingMask:", 18);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__NCCarPlayBannerPresentableViewController_viewDidLoad__block_invoke;
  aBlock[3] = &unk_1E8D1F0A8;
  aBlock[4] = self;
  v10 = (void (**)(void *, char *, _QWORD))_Block_copy(aBlock);
  v10[2](v10, sel__handleTapOnContent_, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAllowedTouchTypes:", &unk_1E8D5FDC0);
  -[NCCarPlayBannerContentView addGestureRecognizer:](self->_bannerContentView, "addGestureRecognizer:", v11);
  ((void (**)(void *, char *, void *))v10)[2](v10, sel__handleTapOnContent_, &unk_1E8D5FAD0);
  v12 = (UITapGestureRecognizer *)objc_claimAutoreleasedReturnValue();
  contentSelectPressGesture = self->_contentSelectPressGesture;
  self->_contentSelectPressGesture = v12;

  ((void (**)(void *, char *, void *))v10)[2](v10, sel__handleBackGesture_, &unk_1E8D5FAE8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCCarPlayBannerContentView addGestureRecognizer:](self->_bannerContentView, "addGestureRecognizer:", v14);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D10]), "initWithTarget:action:", self, sel__handleSwipeGesture_);
  objc_msgSend(v15, "setAllowedTouchTypes:", &unk_1E8D5FDD8);
  objc_msgSend(v15, "setDirection:", 4);
  -[NCCarPlayBannerContentView addGestureRecognizer:](self->_bannerContentView, "addGestureRecognizer:", v15);
  -[NCCarPlayBannerPresentableViewController _updateStaticContentProvider](self, "_updateStaticContentProvider");

}

id __55__NCCarPlayBannerPresentableViewController_viewDidLoad__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", *(_QWORD *)(a1 + 32), a2);
  objc_msgSend(v6, "setNumberOfTapsRequired:", 1);
  objc_msgSend(v6, "setNumberOfTouchesRequired:", 1);
  if (v5)
  {
    v9[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAllowedPressTypes:", v7);

  }
  return v6;
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NCCarPlayBannerPresentableViewController;
  -[NCCarPlayBannerPresentableViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  -[NCCarPlayBannerPresentableViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addGestureRecognizer:", self->_contentSelectPressGesture);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NCCarPlayBannerPresentableViewController;
  -[NCCarPlayBannerPresentableViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[UITapGestureRecognizer view](self->_contentSelectPressGesture, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeGestureRecognizer:", self->_contentSelectPressGesture);

}

- (UIEdgeInsets)bannerContentOutsets
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
  UIEdgeInsets result;

  -[NCCarPlayBannerPresentableViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[NCCarPlayBannerPresentableViewController _platterView](self, "_platterView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shadowOutsets");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (CGSize)preferredContentSizeWithPresentationSize:(CGSize)a3 containerSize:(CGSize)a4
{
  double width;
  double height;
  double v6;
  double v7;
  CGSize result;

  if (self->_fillsContainer)
    width = a4.width;
  else
    width = a3.width;
  if (self->_fillsContainer)
    height = a4.height;
  else
    height = a3.height;
  -[NCCarPlayBannerPresentableViewController setPreferredContentSize:](self, "setPreferredContentSize:", width, height, a4.width, a4.height);
  v6 = width;
  v7 = height;
  result.height = v7;
  result.width = v6;
  return result;
}

- (BOOL)bn_shouldAnimateViewTransitionToSize:(CGSize)a3
{
  return 0;
}

- (NSString)requesterIdentifier
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "requesterIdentifier");
}

- (NSString)requestIdentifier
{
  void *v2;
  void *v3;

  -[NCCarPlayBannerPresentableViewController notificationRequest](self, "notificationRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notificationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)presentableDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("logDigest");
  -[NCCarPlayBannerPresentableViewController requestIdentifier](self, "requestIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "un_logDigest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BNPresentableDescription();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)presentableWillAppearAsBanner:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __74__NCCarPlayBannerPresentableViewController_presentableWillAppearAsBanner___block_invoke;
  v6[3] = &unk_1E8D1F0D0;
  v7 = v4;
  v5 = v4;
  -[NCCarPlayBannerPresentableViewController _notifyObserversWithBlock:](self, "_notifyObserversWithBlock:", v6);

}

void __74__NCCarPlayBannerPresentableViewController_presentableWillAppearAsBanner___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "presentableWillAppearAsBanner:", *(_QWORD *)(a1 + 32));

}

- (void)presentableDidAppearAsBanner:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __73__NCCarPlayBannerPresentableViewController_presentableDidAppearAsBanner___block_invoke;
  v6[3] = &unk_1E8D1F0D0;
  v7 = v4;
  v5 = v4;
  -[NCCarPlayBannerPresentableViewController _notifyObserversWithBlock:](self, "_notifyObserversWithBlock:", v6);

}

void __73__NCCarPlayBannerPresentableViewController_presentableDidAppearAsBanner___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "presentableDidAppearAsBanner:", *(_QWORD *)(a1 + 32));

}

- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __88__NCCarPlayBannerPresentableViewController_presentableWillDisappearAsBanner_withReason___block_invoke;
  v10[3] = &unk_1E8D1F0F8;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[NCCarPlayBannerPresentableViewController _notifyObserversWithBlock:](self, "_notifyObserversWithBlock:", v10);

}

void __88__NCCarPlayBannerPresentableViewController_presentableWillDisappearAsBanner_withReason___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "presentableWillDisappearAsBanner:withReason:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __87__NCCarPlayBannerPresentableViewController_presentableDidDisappearAsBanner_withReason___block_invoke;
  v10[3] = &unk_1E8D1F0F8;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[NCCarPlayBannerPresentableViewController _notifyObserversWithBlock:](self, "_notifyObserversWithBlock:", v10);

}

void __87__NCCarPlayBannerPresentableViewController_presentableDidDisappearAsBanner_withReason___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "presentableDidDisappearAsBanner:withReason:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)userInteractionWillBeginForBannerForPresentable:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __92__NCCarPlayBannerPresentableViewController_userInteractionWillBeginForBannerForPresentable___block_invoke;
  v6[3] = &unk_1E8D1F0D0;
  v7 = v4;
  v5 = v4;
  -[NCCarPlayBannerPresentableViewController _notifyObserversWithBlock:](self, "_notifyObserversWithBlock:", v6);

}

void __92__NCCarPlayBannerPresentableViewController_userInteractionWillBeginForBannerForPresentable___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "userInteractionWillBeginForBannerForPresentable:", *(_QWORD *)(a1 + 32));

}

- (void)userInteractionDidEndForBannerForPresentable:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __89__NCCarPlayBannerPresentableViewController_userInteractionDidEndForBannerForPresentable___block_invoke;
  v6[3] = &unk_1E8D1F0D0;
  v7 = v4;
  v5 = v4;
  -[NCCarPlayBannerPresentableViewController _notifyObserversWithBlock:](self, "_notifyObserversWithBlock:", v6);

}

void __89__NCCarPlayBannerPresentableViewController_userInteractionDidEndForBannerForPresentable___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "userInteractionDidEndForBannerForPresentable:", *(_QWORD *)(a1 + 32));

}

- (void)addPresentableObserver:(id)a3
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

- (void)removePresentableObserver:(id)a3
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
  void (**v4)(id, NCCarPlayBannerPresentableViewController *, _QWORD);
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
  v4 = (void (**)(id, NCCarPlayBannerPresentableViewController *, _QWORD))a3;
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

- (BOOL)bannerContentViewShouldShowOKButton:(id)a3
{
  id WeakRetained;
  char v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = objc_msgSend(WeakRetained, "presentableViewControllerClosesByDefault:", self);
  else
    v5 = 1;

  return v5;
}

- (id)_staticContentProviderFromRequest:(id)a3
{
  NCNotificationRequestCarPlayContentProvider *v4;
  void *v5;
  NCNotificationRequestCarPlayContentProvider *v6;

  v4 = [NCNotificationRequestCarPlayContentProvider alloc];
  -[NCCarPlayBannerPresentableViewController notificationRequest](self, "notificationRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NCNotificationRequestCoalescingContentProvider initWithNotificationRequest:](v4, "initWithNotificationRequest:", v5);

  return v6;
}

- (void)_updateStaticContentProvider
{
  NCCarPlayBannerContentView *bannerContentView;
  void *v4;
  NCCarPlayBannerContentView *v5;
  void *v6;
  NCCarPlayBannerContentView *v7;
  void *v8;
  NCCarPlayBannerContentView *v9;
  void *v10;
  NCCarPlayBannerContentView *v11;
  void *v12;
  NCCarPlayBannerContentView *v13;
  void *v14;
  NCCarPlayBannerContentView *v15;
  void *v16;
  uint64_t v17;

  bannerContentView = self->_bannerContentView;
  if (bannerContentView)
  {
    -[NCNotificationStaticContentProviding badgedIconView](self->_staticContentProvider, "badgedIconView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCCarPlayBannerContentView setBadgedIconView:](bannerContentView, "setBadgedIconView:", v4);

    v5 = self->_bannerContentView;
    -[NCNotificationStaticContentProviding date](self->_staticContentProvider, "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCCarPlayBannerContentView setDate:](v5, "setDate:", v6);

    -[NCCarPlayBannerContentView setDateAllDay:](self->_bannerContentView, "setDateAllDay:", -[NCNotificationStaticContentProviding isDateAllDay](self->_staticContentProvider, "isDateAllDay"));
    v7 = self->_bannerContentView;
    -[NCNotificationStaticContentProviding timeZone](self->_staticContentProvider, "timeZone");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCCarPlayBannerContentView setTimeZone:](v7, "setTimeZone:", v8);

    -[NCCarPlayBannerContentView setDateFormatStyle:](self->_bannerContentView, "setDateFormatStyle:", 1);
    v9 = self->_bannerContentView;
    -[NCNotificationStaticContentProviding primaryText](self->_staticContentProvider, "primaryText");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCCarPlayBannerContentView setPrimaryText:](v9, "setPrimaryText:", v10);

    v11 = self->_bannerContentView;
    -[NCNotificationStaticContentProviding primarySubtitleText](self->_staticContentProvider, "primarySubtitleText");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCCarPlayBannerContentView setPrimarySubtitleText:](v11, "setPrimarySubtitleText:", v12);

    v13 = self->_bannerContentView;
    -[NCNotificationStaticContentProviding primaryText](self->_staticContentProvider, "primaryText");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCCarPlayBannerContentView setPrimaryText:](v13, "setPrimaryText:", v14);

    v15 = self->_bannerContentView;
    -[NCNotificationStaticContentProviding primarySubtitleText](self->_staticContentProvider, "primarySubtitleText");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "length"))
      v17 = 1;
    else
      v17 = 2;
    -[NCCarPlayBannerContentView setPrimaryTextMaximumNumberOfLines:](v15, "setPrimaryTextMaximumNumberOfLines:", v17);

    -[NCCarPlayBannerContentView setPrimarySubtitleTextMaximumNumberOfLines:](self->_bannerContentView, "setPrimarySubtitleTextMaximumNumberOfLines:", 1);
  }
}

- (id)_platterView
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  -[NCCarPlayBannerPresentableViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  v4 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  return v6;
}

- (void)_handleTapOnContent:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "didSelectBannerOfPresentableViewController:", self);

}

- (void)_handleBackGesture:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "didCancelBannerOfPresentableViewController:reason:", self, CFSTR("NCCarPlayBannerRevocationReasonBackGesture"));

}

- (void)_handleSwipeGesture:(id)a3
{
  id WeakRetained;

  if (objc_msgSend(a3, "direction") == 4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "didCancelBannerOfPresentableViewController:reason:", self, CFSTR("NCCarPlayBannerRevocationReasonTouchPadSwipeGesture"));

  }
}

- (void)_wheelChangedWithEvent:(id)a3
{
  id v4;
  id WeakRetained;
  objc_super v6;

  v4 = a3;
  if (objc_msgSend(v4, "type") != 7
    || objc_msgSend(v4, "subtype") != 202 && objc_msgSend(v4, "subtype") != 200 && objc_msgSend(v4, "subtype") != 201)
  {
    goto LABEL_8;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

LABEL_8:
    v6.receiver = self;
    v6.super_class = (Class)NCCarPlayBannerPresentableViewController;
    -[NCCarPlayBannerPresentableViewController _wheelChangedWithEvent:](&v6, sel__wheelChangedWithEvent_, v4);
    goto LABEL_9;
  }
  objc_msgSend(WeakRetained, "didCancelBannerOfPresentableViewController:reason:", self, CFSTR("NCCarPlayBannerRevocationReasonWheelEvent"));

LABEL_9:
}

- (NCNotificationRequest)notificationRequest
{
  return self->_notificationRequest;
}

- (NCCarPlayBannerPresentableViewControllerDelegate)delegate
{
  return (NCCarPlayBannerPresentableViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)fillsContainer
{
  return self->_fillsContainer;
}

- (void)setFillsContainer:(BOOL)a3
{
  self->_fillsContainer = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_notificationRequest, 0);
  objc_storeStrong((id *)&self->_contentSelectPressGesture, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_staticContentProvider, 0);
  objc_storeStrong((id *)&self->_bannerContentView, 0);
}

@end
