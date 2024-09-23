@implementation NCNotificationLongLookViewController

+ (void)initialize
{
  uint64_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = objc_msgSend(&__block_literal_global_38, "copy");
    v3 = (void *)__willInteractWithLinkSentinelBlock;
    __willInteractWithLinkSentinelBlock = v2;

  }
}

- (id)_initWithNotificationRequest:(id)a3 andPresentingNotificationViewController:(id)a4 revealingAdditionalContentOnPresentation:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id *v9;
  id *v10;
  NCLongLookTransitioningDelegate *v11;
  id v12;
  void *v13;
  objc_super v15;

  v5 = a5;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)NCNotificationLongLookViewController;
  v9 = -[NCNotificationViewController _initWithNotificationRequest:revealingAdditionalContentOnPresentation:](&v15, sel__initWithNotificationRequest_revealingAdditionalContentOnPresentation_, a3, v5);
  v10 = v9;
  if (v9)
  {
    objc_storeWeak(v9 + 143, v8);
    v11 = objc_alloc_init(NCLongLookTransitioningDelegate);
    v12 = v10[141];
    v10[141] = v11;

    objc_msgSend(v10, "setTransitioningDelegate:", v10[141]);
    objc_msgSend(v10, "setModalPresentationStyle:", 4);
    objc_msgSend(v10, "_setupCustomContentProvider");
    objc_msgSend(v10, "_customContentProvidingViewControllerCreateIfNecessary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setCustomContentProvidingViewController:", v13);

    objc_msgSend(v10, "_setShouldRestorePresentingShortLookOnDismiss:", 1);
  }

  return v10;
}

- (id)_initWithNotificationRequest:(id)a3 revealingAdditionalContentOnPresentation:(BOOL)a4
{
  return -[NCNotificationLongLookViewController _initWithNotificationRequest:andPresentingNotificationViewController:revealingAdditionalContentOnPresentation:](self, "_initWithNotificationRequest:andPresentingNotificationViewController:revealingAdditionalContentOnPresentation:", a3, 0, a4);
}

- (void)setNotificationRequest:(id)a3
{
  PLClickPresentationInteractionPresenting **p_presenter;
  id v5;
  id WeakRetained;
  objc_super v7;

  p_presenter = &self->_presenter;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_presenter);
  v7.receiver = self;
  v7.super_class = (Class)NCNotificationLongLookViewController;
  -[NCNotificationViewController setNotificationRequest:](&v7, sel_setNotificationRequest_, v5);

}

- (BOOL)isContentExtensionVisible:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[NCNotificationLongLookViewController _extensionIdentifier](self, "_extensionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", v4);

  return v6;
}

- (void)preserveInputViews
{
  id v2;

  -[NCNotificationViewController _customContentProvidingViewController](self, "_customContentProvidingViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "preserveInputViews");

}

- (BOOL)restoreInputViews
{
  void *v2;
  char v3;

  -[NCNotificationViewController _customContentProvidingViewController](self, "_customContentProvidingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "restoreInputViews");
  else
    v3 = 0;

  return v3;
}

- (void)setCustomContentHomeAffordanceVisible:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)NCNotificationLongLookViewController;
  -[NCNotificationViewController setCustomContentHomeAffordanceVisible:](&v6, sel_setCustomContentHomeAffordanceVisible_);
  -[NCNotificationLongLookViewController expandedPlatterPresentationController](self, "expandedPlatterPresentationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHomeAffordanceVisible:", v3);

}

- (void)setCustomContentHomeAffordanceGestureRecognizer:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NCNotificationLongLookViewController;
  v4 = a3;
  -[NCNotificationViewController setCustomContentHomeAffordanceGestureRecognizer:](&v6, sel_setCustomContentHomeAffordanceGestureRecognizer_, v4);
  -[NCNotificationLongLookViewController expandedPlatterPresentationController](self, "expandedPlatterPresentationController", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHomeAffordancePanGesture:", v4);

}

- (void)_updateLookView:(id)a3 withTitleFromProvidedStaticContent:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  -[NCNotificationViewController _customContentProvidingViewController](self, "_customContentProvidingViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationLongLookViewController _longLookViewIfLoaded](self, "_longLookViewIfLoaded");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "overridesDefaultTitle") & 1) != 0)
  {
    objc_msgSend(v5, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTitle:", v7);

  }
  else
  {
    objc_msgSend(v6, "setTitle:", v8);
  }

}

- (void)playMedia
{
  id v2;

  -[NCNotificationViewController _customContentProvidingViewControllerCreateIfNecessary](self, "_customContentProvidingViewControllerCreateIfNecessary");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "playMedia");

}

- (void)loadView
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0D7D3B8]);
  -[NCNotificationLongLookViewController setView:](self, "setView:", v3);
  objc_msgSend(v3, "setPresentableViewController:", self);
  objc_msgSend(v3, "setDelegate:", self);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NCNotificationLongLookViewController;
  -[NCNotificationViewController viewWillLayoutSubviews](&v5, sel_viewWillLayoutSubviews);
  -[NCNotificationLongLookViewController _longLookViewIfLoaded](self, "_longLookViewIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[NCNotificationLongLookViewController _expandedPlatterPresentationViewScrollView](self, "_expandedPlatterPresentationViewScrollView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    objc_msgSend(v3, "setFrame:");

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NCNotificationLongLookViewController;
  -[NCNotificationViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  -[NCNotificationLongLookViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "makeKeyAndVisible");

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NCNotificationLongLookViewController;
  -[NCNotificationViewController viewDidDisappear:](&v6, sel_viewDidDisappear_, a3);
  -[NCNotificationLongLookViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resignKeyWindow");

}

- (void)dismissViewControllerWithTransition:(int)a3 completion:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  -[NCNotificationLongLookViewController presenter](self, "presenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clickPresentationInteractionManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v8, "dismissIfPossible:", v6) & 1) == 0)
  {
    v9.receiver = self;
    v9.super_class = (Class)NCNotificationLongLookViewController;
    -[NCNotificationViewController dismissViewControllerWithTransition:completion:](&v9, sel_dismissViewControllerWithTransition_completion_, v4, v6);
  }

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[7];
  objc_super v26;
  CGRect v27;
  CGRect v28;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)NCNotificationLongLookViewController;
  -[NCNotificationLongLookViewController viewWillTransitionToSize:withTransitionCoordinator:](&v26, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[UIViewController nc_presentationControllerIfPresented](self, "nc_presentationControllerIfPresented");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = NCRectWithSize();
    v11 = v10;
    v13 = v12;
    v15 = v14;
  }
  else
  {
    objc_msgSend(v7, "containerView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bounds");
    v9 = v17;
    v11 = v18;
    v13 = v19;
    v15 = v20;

  }
  -[NCNotificationLongLookViewController _longLookViewIfLoaded](self, "_longLookViewIfLoaded");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27.origin.x = v9;
  v27.origin.y = v11;
  v27.size.width = v13;
  v27.size.height = v15;
  v22 = CGRectGetWidth(v27);
  v28.origin.x = v9;
  v28.origin.y = v11;
  v28.size.width = v13;
  v28.size.height = v15;
  objc_msgSend(v21, "setDismissControlPosition:", v22 > CGRectGetHeight(v28));

  -[NCNotificationLongLookViewController _preferredCustomContentSizeForSize:parentContentContainerBounds:](self, "_preferredCustomContentSizeForSize:parentContentContainerBounds:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8), v9, v11, v13, v15);
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __91__NCNotificationLongLookViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v25[3] = &unk_1E8D1DAC0;
  v25[4] = self;
  v25[5] = v23;
  v25[6] = v24;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v25, 0);

}

uint64_t __91__NCNotificationLongLookViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setPreferredCustomContentSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  objc_super v15;
  CGSize result;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  -[NCNotificationViewController _customContentProvidingViewController](self, "_customContentProvidingViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 == v7)
  {
    objc_msgSend(v7, "sizeForChildContentContainer:withParentContainerSize:", v7, width, height);
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)NCNotificationLongLookViewController;
    -[NCNotificationLongLookViewController sizeForChildContentContainer:withParentContainerSize:](&v15, sel_sizeForChildContentContainer_withParentContainerSize_, v7, width, height);
  }
  v11 = v9;
  v12 = v10;

  v13 = v11;
  v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)contentProviderDismissCustomContent:(id)a3 animated:(BOOL)a4
{
  -[NCNotificationViewController _executeNilAction:](self, "_executeNilAction:", a4);
}

- (void)customContent:(id)a3 didUpdateUserNotificationActions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  _QWORD v20[5];
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)*MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    -[NCNotificationViewController notificationRequest](self, "notificationRequest");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "notificationIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "un_logDigest");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v22 = v12;
    _os_log_impl(&dword_1CFC3D000, v9, OS_LOG_TYPE_DEFAULT, "Custom content extension is updating long look actions for notification request %{public}@", buf, 0xCu);

  }
  -[NCNotificationViewController staticContentProvider](self, "staticContentProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setOverriddenActions:", v7);

  -[NCNotificationLongLookViewController _updateWithProvidedStaticContent](self, "_updateWithProvidedStaticContent");
  -[NCNotificationLongLookViewController preferredContentSize](self, "preferredContentSize");
  v15 = v14;
  v17 = v16;
  -[NCNotificationViewController _updatePreferredContentSize](self, "_updatePreferredContentSize");
  -[NCNotificationLongLookViewController preferredContentSize](self, "preferredContentSize");
  if (v15 == v19 && v17 == v18)
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __87__NCNotificationLongLookViewController_customContent_didUpdateUserNotificationActions___block_invoke;
    v20[3] = &unk_1E8D1B568;
    v20[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 4, v20, 0, 0.25, 0.0);
  }

}

void __87__NCNotificationLongLookViewController_customContent_didUpdateUserNotificationActions___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_longLookViewIfLoaded");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layoutIfNeeded");

}

- (void)expandedPlatterPresentable:(id)a3 requestsDismissalWithTrigger:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v6 = a3;
  v19 = v6;
  switch(a4)
  {
    case 1:
      +[NCNotificationEventTracker sharedInstance](NCNotificationEventTracker, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationViewController notificationRequest](self, "notificationRequest");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationViewController notificationUsageTrackingState](self, "notificationUsageTrackingState");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "longLookDismissInvokedWithTrigger:forNotificationRequest:withState:", 0, v8, v9);

      -[NCNotificationViewController _executeClearAction:](self, "_executeClearAction:", 1);
      -[NCNotificationViewController _customContentProvidingViewController](self, "_customContentProvidingViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "beginAppearanceTransition:animated:", 0, 1);
      objc_msgSend(v10, "endAppearanceTransition");

      goto LABEL_7;
    case 2:
      +[NCNotificationEventTracker sharedInstance](NCNotificationEventTracker, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationViewController notificationRequest](self, "notificationRequest");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationViewController notificationUsageTrackingState](self, "notificationUsageTrackingState");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v11;
      v15 = 0;
      goto LABEL_5;
    case 3:
      +[NCNotificationEventTracker sharedInstance](NCNotificationEventTracker, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationViewController notificationRequest](self, "notificationRequest");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationViewController notificationUsageTrackingState](self, "notificationUsageTrackingState");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v11;
      v15 = 1;
LABEL_5:
      objc_msgSend(v14, "longLookReparkInvokedWithTrigger:forNotificationRequest:withState:", v15, v12, v13);

      -[NCNotificationViewController _executeCancelAction:](self, "_executeCancelAction:", 1);
      goto LABEL_7;
    case 4:
      +[NCNotificationEventTracker sharedInstance](NCNotificationEventTracker, "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationViewController notificationRequest](self, "notificationRequest");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationViewController notificationUsageTrackingState](self, "notificationUsageTrackingState");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "longLookDismissInvokedWithTrigger:forNotificationRequest:withState:", 1, v17, v18);

      -[NCNotificationViewController _executeCloseAction:](self, "_executeCloseAction:", 1);
LABEL_7:
      v6 = v19;
      break;
    default:
      break;
  }

}

- (void)_updateWithProvidedStaticContent
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)NCNotificationLongLookViewController;
  -[NCNotificationViewController _updateWithProvidedStaticContent](&v16, sel__updateWithProvidedStaticContent);
  -[NCNotificationLongLookViewController _longLookViewIfLoaded](self, "_longLookViewIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lookViewTapGestureRecognizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addTarget:action:", self, sel__handleNotificationTap_);

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(v3, "iconButtons", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "addTarget:action:forControlEvents:", self, sel__handleIconButton_, 64);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v7);
  }

  -[NCNotificationViewController staticContentProvider](self, "staticContentProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "interfaceActions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterfaceActions:", v11);

}

- (unint64_t)_maximumNumberOfPrimaryTextLinesForProvidedStaticContent
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NCNotificationLongLookViewController;
  return -[NCNotificationLongLookViewController _maximumNumberOfTextLinesForProvidedStaticContentWithDefaultNumber:isPrimary:isLarge:](self, "_maximumNumberOfTextLinesForProvidedStaticContentWithDefaultNumber:isPrimary:isLarge:", -[NCNotificationViewController _maximumNumberOfPrimaryTextLinesForProvidedStaticContent](&v3, sel__maximumNumberOfPrimaryTextLinesForProvidedStaticContent), 1, 0);
}

- (unint64_t)_maximumNumberOfSecondaryTextLinesForProvidedStaticContent
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NCNotificationLongLookViewController;
  return -[NCNotificationLongLookViewController _maximumNumberOfTextLinesForProvidedStaticContentWithDefaultNumber:isPrimary:isLarge:](self, "_maximumNumberOfTextLinesForProvidedStaticContentWithDefaultNumber:isPrimary:isLarge:", -[NCNotificationViewController _maximumNumberOfSecondaryTextLinesForProvidedStaticContent](&v3, sel__maximumNumberOfSecondaryTextLinesForProvidedStaticContent), 0, 0);
}

- (unint64_t)_maximumNumberOfTextLinesForProvidedStaticContentWithDefaultNumber:(unint64_t)a3 isPrimary:(BOOL)a4 isLarge:(BOOL)a5
{
  _BOOL4 v5;
  void *v7;
  int v8;

  v5 = a4;
  -[NCNotificationViewController staticContentProvider](self, "staticContentProvider", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isNumberOfLinesInfinite");

  if (!v5 | v8)
    return 0;
  else
    return a3;
}

- (void)_updateWithProvidedCustomContent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[NCNotificationLongLookViewController _longLookViewIfLoaded](self, "_longLookViewIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v9 = v3;
    -[NCNotificationViewController _customContentProvidingViewController](self, "_customContentProvidingViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "customContentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCustomContentLocation:", objc_msgSend(v4, "customContentLocation"));
    objc_msgSend(v9, "setHidesNotificationContent:", objc_msgSend(v4, "defaultContentHidden"));
    objc_msgSend(v5, "superview");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 != v6)
    {
      objc_msgSend(v6, "addSubview:", v5);
      objc_msgSend(v6, "bounds");
      objc_msgSend(v5, "setFrame:");
      objc_msgSend(v5, "setAutoresizingMask:", 18);
    }
    -[NCNotificationLongLookViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNeedsLayout");

    v3 = v9;
  }

}

- (void)_updateTitleWithProvidedCustomContent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  -[NCNotificationLongLookViewController _longLookViewIfLoaded](self, "_longLookViewIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[NCNotificationViewController _customContentProvidingViewController](self, "_customContentProvidingViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0DC3F10];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __77__NCNotificationLongLookViewController__updateTitleWithProvidedCustomContent__block_invoke;
    v8[3] = &unk_1E8D1B3A0;
    v9 = v3;
    v10 = v5;
    v7 = v5;
    objc_msgSend(v6, "animateWithDuration:animations:", v8, 0.3);

  }
}

uint64_t __77__NCNotificationLongLookViewController__updateTitleWithProvidedCustomContent__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTitle:", *(_QWORD *)(a1 + 40));
}

- (BOOL)_shouldPadScrollViewContentSizeHeight
{
  return 0;
}

- (void)_loadLookView
{
  NCNotificationLongLookView *v3;
  NCNotificationLookView *lookView;

  if (!self->super._lookView)
  {
    v3 = objc_alloc_init(NCNotificationLongLookView);
    -[PLExpandedPlatterView setDelegate:](v3, "setDelegate:", self);
    lookView = self->super._lookView;
    self->super._lookView = (NCNotificationLookView *)v3;

  }
}

- (id)_longLookViewScrollView
{
  void *v2;
  void *v3;

  -[NCNotificationLongLookViewController _longLookViewLoadingIfNecessary](self, "_longLookViewLoadingIfNecessary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_expandedPlatterPresentationViewScrollView
{
  void *v2;
  void *v3;

  -[NCNotificationLongLookViewController _expandedPlatterPresentationViewLoadingIfNecessary:](self, "_expandedPlatterPresentationViewLoadingIfNecessary:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_notificationViewControllerViewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NCNotificationLongLookViewController;
  -[NCNotificationViewController _notificationViewControllerViewDidLoad](&v4, sel__notificationViewControllerViewDidLoad);
  -[NCNotificationLongLookViewController _expandedPlatterPresentationViewScrollView](self, "_expandedPlatterPresentationViewScrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", self->super._lookView);

}

- (CGSize)_preferredCustomContentSizeForSize:(CGSize)a3 parentContentContainerBounds:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGSize result;
  CGRect v25;
  CGRect v26;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  -[NCNotificationLongLookViewController _longLookViewIfLoaded](self, "_longLookViewIfLoaded", a3.width, a3.height);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  v10 = CGRectGetWidth(v25);
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  objc_msgSend(v9, "setDismissControlPosition:", v10 > CGRectGetHeight(v26));

  v11 = (void *)objc_opt_class();
  -[NCNotificationLongLookViewController _longLookViewIfLoaded](self, "_longLookViewIfLoaded");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "useableContainerViewBoundsForExpandedPlatter:inContainerViewWithBounds:", v12, x, y, width, height);
  v14 = v13;
  v16 = v15;

  -[NCNotificationViewController _customContentProvidingViewController](self, "_customContentProvidingViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationLongLookViewController sizeForChildContentContainer:withParentContainerSize:](self, "sizeForChildContentContainer:withParentContainerSize:", v17, fmin(v14, 556.0), v16);
  v19 = v18;
  v21 = v20;

  v22 = v19;
  v23 = v21;
  result.height = v23;
  result.width = v22;
  return result;
}

- (void)_setPreferredCustomContentSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  objc_super v7;

  height = a3.height;
  width = a3.width;
  -[NCNotificationLongLookViewController _longLookViewIfLoaded](self, "_longLookViewIfLoaded");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCustomContentSize:", width, height);

  v7.receiver = self;
  v7.super_class = (Class)NCNotificationLongLookViewController;
  -[NCNotificationViewController _setPreferredCustomContentSize:](&v7, sel__setPreferredCustomContentSize_, width, height);
}

- (id)_extensionIdentifier
{
  void *v2;
  void *v3;

  -[NCNotificationViewController _customContentProvidingViewController](self, "_customContentProvidingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "contentExtensionIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)_dismissPresentedViewControllerAnimated:(BOOL)a3
{
  -[NCNotificationLongLookViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", a3, 0);
}

- (void)_handleIconButton:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  +[NCNotificationEventTracker sharedInstance](NCNotificationEventTracker, "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationViewController notificationRequest](self, "notificationRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationViewController notificationUsageTrackingState](self, "notificationUsageTrackingState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "longLookDefaultActionInvokedWithTrigger:forNotificationRequest:withState:", 0, v5, v6);

  -[NCNotificationViewController _executeDefaultAction:](self, "_executeDefaultAction:", 1);
}

- (void)_handleNotificationTap:(id)a3
{
  id v4;
  id notificationTapBlock;
  uint64_t v6;
  _QWORD block[4];
  id v8;
  _QWORD v9[4];
  id v10;
  id location;

  v4 = a3;
  if (objc_msgSend(v4, "state") == 3)
  {
    notificationTapBlock = self->_notificationTapBlock;
    if (notificationTapBlock == (id)__willInteractWithLinkSentinelBlock)
    {
      self->_notificationTapBlock = 0;

    }
    else
    {
      objc_initWeak(&location, self);
      v6 = MEMORY[0x1E0C809B0];
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __63__NCNotificationLongLookViewController__handleNotificationTap___block_invoke;
      v9[3] = &unk_1E8D1B278;
      objc_copyWeak(&v10, &location);
      -[NCNotificationLongLookViewController _setNotificationTapBlock:](self, "_setNotificationTapBlock:", v9);
      block[0] = v6;
      block[1] = 3221225472;
      block[2] = __63__NCNotificationLongLookViewController__handleNotificationTap___block_invoke_2;
      block[3] = &unk_1E8D1B278;
      objc_copyWeak(&v8, &location);
      dispatch_async(MEMORY[0x1E0C80D38], block);
      objc_destroyWeak(&v8);
      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }

}

void __63__NCNotificationLongLookViewController__handleNotificationTap___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  +[NCNotificationEventTracker sharedInstance](NCNotificationEventTracker, "sharedInstance");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "notificationRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "notificationUsageTrackingState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "longLookDefaultActionInvokedWithTrigger:forNotificationRequest:withState:", 1, v2, v3);

  objc_msgSend(WeakRetained, "_executeDefaultAction:", 1);
}

void __63__NCNotificationLongLookViewController__handleNotificationTap___block_invoke_2(uint64_t a1)
{
  void (**v1)(_QWORD);
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_notificationTapBlock");
  v1 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_setNotificationTapBlock:", 0);
  if (v1 && v1 != (void (**)(_QWORD))__willInteractWithLinkSentinelBlock)
    v1[2](v1);

}

- (int64_t)viewControllerTransitionTypeForTransitionDelegate:(id)a3
{
  return -[NCNotificationViewController _shouldRestorePresentingShortLookOnDismiss](self, "_shouldRestorePresentingShortLookOnDismiss", a3) ^ 1;
}

- (BOOL)expandedPlatterPresentationControllerShouldAllowKeyboardOnAppearance:(id)a3
{
  void *v3;
  char v4;

  -[NCNotificationViewController staticContentProvider](self, "staticContentProvider", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "showsTextInputOnAppearance");

  return v4;
}

- (id)expandedPlatterPresentationController:(id)a3 keyboardAssertionForGestureWindow:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v6 = a4;
  v7 = a3;
  -[NCNotificationLongLookViewController _presentingNotificationViewController](self, "_presentingNotificationViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "expandedPlatterPresentationController:keyboardAssertionForGestureWindow:", v7, v6);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)NCNotificationLongLookViewController;
    -[NCNotificationViewController expandedPlatterPresentationController:keyboardAssertionForGestureWindow:](&v12, sel_expandedPlatterPresentationController_keyboardAssertionForGestureWindow_, v7, v6);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;

  return v10;
}

- (id)hideHomeAffordanceAnimationSettingsForExpandedPlatterPresentationController:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  -[NCNotificationLongLookViewController _presentingNotificationViewController](self, "_presentingNotificationViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "hideHomeAffordanceAnimationSettingsForExpandedPlatterPresentationController:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)NCNotificationLongLookViewController;
    -[NCNotificationViewController hideHomeAffordanceAnimationSettingsForExpandedPlatterPresentationController:](&v9, sel_hideHomeAffordanceAnimationSettingsForExpandedPlatterPresentationController_, v4);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;

  return v7;
}

- (id)unhideHomeAffordanceAnimationSettingsForExpandedPlatterPresentationController:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  -[NCNotificationLongLookViewController _presentingNotificationViewController](self, "_presentingNotificationViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "unhideHomeAffordanceAnimationSettingsForExpandedPlatterPresentationController:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)NCNotificationLongLookViewController;
    -[NCNotificationViewController unhideHomeAffordanceAnimationSettingsForExpandedPlatterPresentationController:](&v9, sel_unhideHomeAffordanceAnimationSettingsForExpandedPlatterPresentationController_, v4);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;

  return v7;
}

- (id)settleHomeAffordanceAnimationBehaviorDescriptionForExpandedPlatterPresentationController:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  -[NCNotificationLongLookViewController _presentingNotificationViewController](self, "_presentingNotificationViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "settleHomeAffordanceAnimationBehaviorDescriptionForExpandedPlatterPresentationController:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)NCNotificationLongLookViewController;
    -[NCNotificationViewController settleHomeAffordanceAnimationBehaviorDescriptionForExpandedPlatterPresentationController:](&v9, sel_settleHomeAffordanceAnimationBehaviorDescriptionForExpandedPlatterPresentationController_, v4);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;

  return v7;
}

- (CGRect)expandedPlatterPresentationController:(id)a3 frameForTransitionViewInPresentationSuperview:(id)a4
{
  id v6;
  id v7;
  void *v8;
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
  double v20;
  CGRect result;

  v6 = a3;
  v7 = a4;
  -[NCNotificationLongLookViewController _presentingNotificationViewController](self, "_presentingNotificationViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "expandedPlatterPresentationController:frameForTransitionViewInPresentationSuperview:", v6, v7);
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
  }
  else
  {
    v10 = *MEMORY[0x1E0C9D648];
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v14 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v16 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }

  v17 = v10;
  v18 = v12;
  v19 = v14;
  v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (BOOL)expandedPlatterPresentationControllerShouldProvideBackground:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[NCNotificationLongLookViewController _presentingNotificationViewController](self, "_presentingNotificationViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = objc_msgSend(v5, "expandedPlatterPresentationControllerShouldProvideBackground:", v4);
  else
    v6 = 1;

  return v6;
}

- (id)customBackgroundContainerViewForExpandedPlatterPresentationController:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NCNotificationLongLookViewController _presentingNotificationViewController](self, "_presentingNotificationViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "customBackgroundContainerViewForExpandedPlatterPresentationController:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id cancelTouchesToken;
  id v8;

  v4 = a3;
  -[NCNotificationLongLookViewController _longLookViewScrollView](self, "_longLookViewScrollView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[NCNotificationViewController _customContentProvidingViewController](self, "_customContentProvidingViewController");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v8, "cancelTouches");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      cancelTouchesToken = self->_cancelTouchesToken;
      self->_cancelTouchesToken = v6;

    }
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v6;
  id cancelTouchesToken;
  id v8;

  v8 = a3;
  -[NCNotificationLongLookViewController _longLookViewScrollView](self, "_longLookViewScrollView");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v8 && !a4 && (objc_msgSend(v8, "isDecelerating") & 1) == 0)
  {
    cancelTouchesToken = self->_cancelTouchesToken;
    self->_cancelTouchesToken = 0;

  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4;
  id v5;
  id cancelTouchesToken;

  v4 = a3;
  -[NCNotificationLongLookViewController _longLookViewScrollView](self, "_longLookViewScrollView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    cancelTouchesToken = self->_cancelTouchesToken;
    self->_cancelTouchesToken = 0;

  }
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  id v4;
  id v5;
  id cancelTouchesToken;

  v4 = a3;
  -[NCNotificationLongLookViewController _longLookViewScrollView](self, "_longLookViewScrollView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    cancelTouchesToken = self->_cancelTouchesToken;
    self->_cancelTouchesToken = 0;

  }
}

- (BOOL)associatedViewControllerDidAppearForExpandedPlatterView:(id)a3
{
  return -[NCNotificationLongLookViewController _appearState](self, "_appearState", a3) == 2;
}

- (void)notificationLongLookView:(id)a3 willInteractWithURL:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id notificationTapBlock;

  v5 = a3;
  -[NCNotificationViewController _lookView](self, "_lookView");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v5)
  {
    v7 = _Block_copy((const void *)__willInteractWithLinkSentinelBlock);
    notificationTapBlock = self->_notificationTapBlock;
    self->_notificationTapBlock = v7;

  }
}

- (BOOL)notificationLongLookView:(id)a3 tapGestureRecognizerShouldReceiveTouch:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;

  v5 = a4;
  -[NCNotificationViewController _customContentProvidingViewController](self, "_customContentProvidingViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "userInteractionEnabled"))
  {
    objc_msgSend(v5, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationViewController _lookViewIfLoaded](self, "_lookViewIfLoaded");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "customContentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "isDescendantOfView:", v9) ^ 1;

  }
  else
  {
    LOBYTE(v10) = 1;
  }

  return v10;
}

- (BOOL)canBecomeFirstResponder
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  objc_super v7;

  -[NCNotificationViewController _customContentProvidingViewController](self, "_customContentProvidingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[NCNotificationViewController _customContentProvidingViewController](self, "_customContentProvidingViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "canBecomeFirstResponder");

  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)NCNotificationLongLookViewController;
    v5 = -[NCNotificationLongLookViewController canBecomeFirstResponder](&v7, sel_canBecomeFirstResponder);
  }

  return v5;
}

- (BOOL)becomeFirstResponder
{
  void *v3;
  unsigned __int8 v4;
  BOOL v5;
  objc_super v7;

  -[NCNotificationViewController _customContentProvidingViewController](self, "_customContentProvidingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v4 = objc_msgSend(v3, "restoreInputViews");
    else
      v4 = objc_msgSend(v3, "becomeFirstResponder");
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)NCNotificationLongLookViewController;
    v4 = -[NCNotificationLongLookViewController becomeFirstResponder](&v7, sel_becomeFirstResponder);
  }
  v5 = v4;

  return v5;
}

- (BOOL)canResignFirstResponder
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  objc_super v7;

  -[NCNotificationViewController _customContentProvidingViewController](self, "_customContentProvidingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[NCNotificationViewController _customContentProvidingViewController](self, "_customContentProvidingViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "canResignFirstResponder");

  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)NCNotificationLongLookViewController;
    v5 = -[NCNotificationLongLookViewController canResignFirstResponder](&v7, sel_canResignFirstResponder);
  }

  return v5;
}

- (BOOL)resignFirstResponder
{
  void *v3;
  unsigned __int8 v4;
  BOOL v5;
  objc_super v7;

  -[NCNotificationViewController _customContentProvidingViewController](self, "_customContentProvidingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v3, "preserveInputViews");
    v4 = objc_msgSend(v3, "resignFirstResponder");
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)NCNotificationLongLookViewController;
    v4 = -[NCNotificationLongLookViewController resignFirstResponder](&v7, sel_resignFirstResponder);
  }
  v5 = v4;

  return v5;
}

- (void)customContentDidLoadExtension:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  if (-[NCNotificationLongLookViewController bs_isAppearingOrAppeared](self, "bs_isAppearingOrAppeared"))
  {
    -[NCNotificationLongLookViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "makeKeyAndVisible");

  }
  if (objc_msgSend((id)+[NCNotificationLongLookViewController superclass](NCNotificationLongLookViewController, "superclass"), "instancesRespondToSelector:", sel_customContentDidLoadExtension_))
  {
    v7.receiver = self;
    v7.super_class = (Class)NCNotificationLongLookViewController;
    -[NCNotificationLongLookViewController customContentDidLoadExtension:](&v7, sel_customContentDidLoadExtension_, v4);
  }

}

- (BOOL)isLookStyleLongLook
{
  return 1;
}

- (id)_presentedLongLookViewController
{
  return 0;
}

- (void)presentLongLookAnimated:(BOOL)a3 trigger:(int64_t)a4 completion:(id)a5
{
  if (a5)
    (*((void (**)(id, _QWORD))a5 + 2))(a5, 0);
}

- (id)_presentingNotificationViewController
{
  id WeakRetained;
  void *v4;

  objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  UNSafeCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_expandedPlatterPresentationViewLoadingIfNecessary:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;

  v3 = a3;
  if ((-[NCNotificationLongLookViewController isViewLoaded](self, "isViewLoaded") & 1) != 0 || v3)
  {
    objc_opt_class();
    -[NCNotificationLongLookViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    UNSafeCast();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)_longLookViewIfLoaded
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[NCNotificationViewController _lookViewIfLoaded](self, "_lookViewIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  UNSafeCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_longLookViewLoadingIfNecessary
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[NCNotificationViewController _lookViewLoadingIfNecessary:](self, "_lookViewLoadingIfNecessary:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  UNSafeCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (PLClickPresentationInteractionPresenting)presenter
{
  return (PLClickPresentationInteractionPresenting *)objc_loadWeakRetained((id *)&self->_presenter);
}

- (void)setPresenter:(id)a3
{
  objc_storeWeak((id *)&self->_presenter, a3);
}

- (PLExpandedPlatterDismissing)dismisser
{
  return (PLExpandedPlatterDismissing *)objc_loadWeakRetained((id *)&self->_dismisser);
}

- (void)setDismisser:(id)a3
{
  objc_storeWeak((id *)&self->_dismisser, a3);
}

- (id)_notificationTapBlock
{
  return self->_notificationTapBlock;
}

- (void)_setNotificationTapBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1160);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_notificationTapBlock, 0);
  objc_destroyWeak((id *)&self->_dismisser);
  objc_destroyWeak((id *)&self->_presenter);
  objc_storeStrong(&self->_cancelTouchesToken, 0);
  objc_storeStrong((id *)&self->_longLookTransitionDelegate, 0);
}

@end
