@implementation NCNotificationViewController

+ (double)prominentIconDimension
{
  return 38.0;
}

- (id)_initWithNotificationRequest:(id)a3 revealingAdditionalContentOnPresentation:(BOOL)a4
{
  id v7;
  NCNotificationViewController *v8;
  NCNotificationViewController *v9;
  NCNotificationRequest **p_notificationRequest;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NCNotificationViewController;
  v8 = -[NCNotificationViewController initWithNibName:bundle:](&v12, sel_initWithNibName_bundle_, 0, 0);
  v9 = v8;
  if (v8)
  {
    p_notificationRequest = &v8->_notificationRequest;
    objc_storeStrong((id *)&v8->_notificationRequest, a3);
    v9->_didQueryCanPan = 0;
    v9->_interactionEnabled = 1;
    v9->_revealAdditionalContentOnPresentation = a4;
    v9->_backgroundAlpha = 1.0;
    v9->_disableDimming = 0;
    if (*p_notificationRequest)
      -[NCNotificationViewController _setupStaticContentProvider](v9, "_setupStaticContentProvider");
  }

  return v9;
}

- (NCNotificationViewController)initWithNotificationRequest:(id)a3 revealingAdditionalContentOnPresentation:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NCNotificationLongLookViewController *v7;
  id v8;
  uint64_t v9;
  NCNotificationViewController *v10;

  v4 = a4;
  v6 = a3;
  if (-[NCNotificationViewController isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()))
  {
    if (v4)
    {
      v7 = [NCNotificationLongLookViewController alloc];
      v8 = v6;
      v9 = 1;
    }
    else
    {
      v7 = [NCNotificationShortLookViewController alloc];
      v8 = v6;
      v9 = 0;
    }
    v10 = -[NCNotificationLongLookViewController _initWithNotificationRequest:revealingAdditionalContentOnPresentation:](v7, "_initWithNotificationRequest:revealingAdditionalContentOnPresentation:", v8, v9);

  }
  else
  {
    v10 = -[NCNotificationViewController _initWithNotificationRequest:revealingAdditionalContentOnPresentation:](self, "_initWithNotificationRequest:revealingAdditionalContentOnPresentation:", v6, v4);
  }

  return v10;
}

- (NCNotificationViewController)initWithNotificationRequest:(id)a3
{
  return -[NCNotificationViewController initWithNotificationRequest:revealingAdditionalContentOnPresentation:](self, "initWithNotificationRequest:revealingAdditionalContentOnPresentation:", a3, 0);
}

- (BOOL)_setDelegate:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != v4)
  {
    objc_storeWeak((id *)&self->_delegate, v4);
    -[NCNotificationViewController setStaticContentProvider:](self, "setStaticContentProvider:", 0);
    -[NCNotificationViewController setAuxiliaryOptionsContentProvider:](self, "setAuxiliaryOptionsContentProvider:", 0);
    -[NCNotificationViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNeedsLayout");

  }
  return WeakRetained != v4;
}

- (void)setBackgroundAlpha:(double)a3
{
  if (self->_backgroundAlpha != a3)
  {
    self->_backgroundAlpha = a3;
    -[NCNotificationLookView setBackgroundAlpha:](self->_lookView, "setBackgroundAlpha:");
  }
}

- (void)setDisableDimming:(BOOL)a3
{
  if (self->_disableDimming != a3)
  {
    self->_disableDimming = a3;
    -[NCNotificationLookView setDisableDimming:](self->_lookView, "setDisableDimming:");
  }
}

- (void)setHideDate:(BOOL)a3
{
  if (self->_hideDate != a3)
  {
    self->_hideDate = a3;
    -[NCNotificationLookView setHideDate:](self->_lookView, "setHideDate:");
  }
}

- (BOOL)_setNotificationRequest:(id)a3
{
  NCNotificationRequest *v5;
  NCNotificationRequest *v6;
  NCNotificationRequest *notificationRequest;
  int v8;
  void *v9;
  void *v10;

  v5 = (NCNotificationRequest *)a3;
  v6 = v5;
  notificationRequest = self->_notificationRequest;
  if (notificationRequest != v5)
  {
    v8 = -[NCNotificationRequest matchesRequest:](v5, "matchesRequest:", self->_notificationRequest);
    objc_storeStrong((id *)&self->_notificationRequest, a3);
    if (!v8
      || !-[NCNotificationViewController _isPresentingCustomContentProvidingViewController](self, "_isPresentingCustomContentProvidingViewController"))
    {
      -[NCNotificationViewController _lookViewIfLoaded](self, "_lookViewIfLoaded");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setHidden:", 0);

    }
    -[NCNotificationViewController setStaticContentProvider:](self, "setStaticContentProvider:", 0);
    -[NCNotificationViewController setAuxiliaryOptionsContentProvider:](self, "setAuxiliaryOptionsContentProvider:", 0);
    -[NCNotificationViewController _updateScreenCaptureProhibited](self, "_updateScreenCaptureProhibited");
    -[NCNotificationViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setNeedsLayout");

  }
  return notificationRequest != v6;
}

- (BOOL)isShortLook
{
  return 0;
}

- (BOOL)_isPresentingCustomContentProvidingViewController
{
  return 0;
}

- (BOOL)hasCommittedToPresentingCustomContentProvidingViewController
{
  return 0;
}

- (BOOL)isNotPresentingOrHasCommittedToDismissingCustomContentProvidingViewController
{
  return 0;
}

- (void)invalidateContentProviders
{
  id v3;

  -[NCNotificationViewController setStaticContentProvider:](self, "setStaticContentProvider:", 0);
  -[NCNotificationViewController setAuxiliaryOptionsContentProvider:](self, "setAuxiliaryOptionsContentProvider:", 0);
  -[NCNotificationViewController view](self, "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

}

- (void)setStaticContentProvider:(id)a3
{
  NCNotificationStaticContentProviding **p_staticContentProvider;
  NCNotificationStaticContentProviding *v6;

  p_staticContentProvider = &self->_staticContentProvider;
  v6 = (NCNotificationStaticContentProviding *)a3;
  if (*p_staticContentProvider != v6)
  {
    objc_storeStrong((id *)&self->_staticContentProvider, a3);
    if (*p_staticContentProvider)
    {
      -[NCNotificationViewController _updateWithProvidedStaticContent](self, "_updateWithProvidedStaticContent");
      -[NCNotificationViewController _updateWithProvidedAuxiliaryOptionsContent](self, "_updateWithProvidedAuxiliaryOptionsContent");
      -[NCNotificationViewController _updatePreferredContentSize](self, "_updatePreferredContentSize");
    }
  }

}

- (void)_setupStaticContentProvider
{
  id WeakRetained;
  void *v4;
  NCNotificationRequestContentProvider *v5;
  void *v6;
  NCNotificationRequestContentProvider *v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (-[NCNotificationViewController notificationRequest](self, "notificationRequest"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(WeakRetained, "notificationRequestPresenter:staticContentProviderForNotificationRequest:", self, v4), v7 = (NCNotificationRequestContentProvider *)objc_claimAutoreleasedReturnValue(), v4, !v7))
  {
    v5 = [NCNotificationRequestContentProvider alloc];
    -[NCNotificationViewController notificationRequest](self, "notificationRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NCNotificationRequestContentProvider initWithNotificationRequest:](v5, "initWithNotificationRequest:", v6);

    -[NCNotificationRequestContentProvider setDelegate:](v7, "setDelegate:", self);
  }
  -[NCNotificationViewController setStaticContentProvider:](self, "setStaticContentProvider:", v7);

}

- (id)_staticContentProviderLoadingIfNecessary
{
  NCNotificationStaticContentProviding *staticContentProvider;

  staticContentProvider = self->_staticContentProvider;
  if (!staticContentProvider)
  {
    -[NCNotificationViewController _setupStaticContentProvider](self, "_setupStaticContentProvider");
    staticContentProvider = self->_staticContentProvider;
  }
  return staticContentProvider;
}

- (void)_setupCustomContentProvider
{
  NCNotificationRequestCustomContentProvider *v3;

  v3 = objc_alloc_init(NCNotificationRequestCustomContentProvider);
  -[NCNotificationViewController setCustomContentProvider:](self, "setCustomContentProvider:", v3);

}

- (void)setAuxiliaryOptionsContentProvider:(id)a3
{
  id v5;
  id v6;

  v6 = a3;
  -[NCNotificationViewController auxiliaryOptionsContentProvider](self, "auxiliaryOptionsContentProvider");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v6)
  {
    objc_storeStrong((id *)&self->_auxiliaryOptionsContentProvider, a3);
    if (self->_auxiliaryOptionsContentProvider)
      -[NCNotificationViewController _updateWithProvidedAuxiliaryOptionsContent](self, "_updateWithProvidedAuxiliaryOptionsContent");
  }

}

- (void)_setupAuxiliaryOptionsContentProvider
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1CFC3D000, a2, OS_LOG_TYPE_ERROR, "Ignoring delegate's auxiliary options provider %{public}@, because inline actions provider takes precedence.", (uint8_t *)&v2, 0xCu);
}

- (id)_customContentProvidingViewControllerCreateIfNecessary
{
  void *v3;
  void *v4;
  void *v5;

  -[NCNotificationViewController _customContentProvidingViewController](self, "_customContentProvidingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[NCNotificationViewController customContentProvider](self, "customContentProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationViewController notificationRequest](self, "notificationRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "customContentViewControllerForNotificationRequest:", v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    -[NCNotificationViewController _setCustomContentProvidingViewController:](self, "_setCustomContentProvidingViewController:", v3);
  }
  return v3;
}

- (void)_setCustomContentProvidingViewController:(id)a3
{
  NCNotificationCustomContent *v5;
  NCNotificationCustomContent **p_customContentProvidingViewController;
  NCNotificationCustomContent *customContentProvidingViewController;
  NCNotificationCustomContent *v8;

  v5 = (NCNotificationCustomContent *)a3;
  p_customContentProvidingViewController = &self->_customContentProvidingViewController;
  customContentProvidingViewController = self->_customContentProvidingViewController;
  v8 = v5;
  if (customContentProvidingViewController != v5)
  {
    -[NCNotificationCustomContent willMoveToParentViewController:](customContentProvidingViewController, "willMoveToParentViewController:", 0);
    -[NCNotificationCustomContent removeFromParentViewController](*p_customContentProvidingViewController, "removeFromParentViewController");
    objc_storeStrong((id *)&self->_customContentProvidingViewController, a3);
    if (*p_customContentProvidingViewController)
    {
      -[NCNotificationCustomContent setDelegate:](*p_customContentProvidingViewController, "setDelegate:", self);
      -[NCNotificationViewController addChildViewController:](self, "addChildViewController:", *p_customContentProvidingViewController);
      -[NCNotificationCustomContent didMoveToParentViewController:](*p_customContentProvidingViewController, "didMoveToParentViewController:", self);
    }
  }

}

- (void)addObserver:(id)a3
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

- (void)removeObserver:(id)a3
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
  void (**v4)(id, NCNotificationViewController *, _QWORD);
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
  v4 = (void (**)(id, NCNotificationViewController *, _QWORD))a3;
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

- (BOOL)didForwardNotificationRequestToCustomContent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[NCNotificationViewController _customContentProvidingViewController](self, "_customContentProvidingViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NCNotificationViewController _customContentProvidingViewController](self, "_customContentProvidingViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "didReceiveNotificationRequest:", v4);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)setHasUpdatedContent
{
  -[NCNotificationViewController _updateWithProvidedStaticContent](self, "_updateWithProvidedStaticContent");
  -[NCNotificationViewController _updateWithProvidedCustomContent](self, "_updateWithProvidedCustomContent");
  -[NCNotificationViewController _updateWithProvidedAuxiliaryOptionsContent](self, "_updateWithProvidedAuxiliaryOptionsContent");
  -[NCNotificationViewController _updatePreferredContentSize](self, "_updatePreferredContentSize");
}

- (void)updateContent
{
  id v2;

  -[NCNotificationViewController view](self, "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutIfNeeded");

}

- (BOOL)dismissPresentedViewControllerAnimated:(BOOL)a3
{
  return 0;
}

- (BOOL)isContentExtensionVisible:(id)a3
{
  return 0;
}

- (void)preserveInputViews
{
  id v2;

  -[NCNotificationViewController _presentedLongLookViewController](self, "_presentedLongLookViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preserveInputViews");

}

- (BOOL)restoreInputViews
{
  void *v2;
  char v3;

  -[NCNotificationViewController _presentedLongLookViewController](self, "_presentedLongLookViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "restoreInputViews");

  return v3;
}

- (BOOL)_canPan
{
  id WeakRetained;
  char v4;

  if (!self->_didQueryCanPan)
  {
    self->_didQueryCanPan = 1;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v4 = objc_msgSend(WeakRetained, "notificationViewControllerShouldPan:", self);
    else
      v4 = 0;
    self->_canPan = v4;

  }
  return self->_canPan;
}

- (void)setInteractionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;

  v3 = a3;
  v5 = *MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEBUG))
    -[NCNotificationViewController setInteractionEnabled:].cold.1(v3, (uint64_t)self, v5);
  self->_interactionEnabled = v3;
  -[NCNotificationViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInteractionEnabled:", v3);

}

- (id)containerViewForExpandedContent
{
  void *v2;
  void *v3;
  void *v4;

  -[UIViewController nc_presentationContextDefiningViewController](self, "nc_presentationContextDefiningViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)presentedExpandedPlatterViewController
{
  return 0;
}

- (BOOL)shouldCommitToExpandedPlatterPresentationWithFeedback
{
  return 0;
}

- (id)_lookViewLoadingIfNecessary:(BOOL)a3
{
  _BOOL4 v3;
  NCNotificationLookView *v5;

  v3 = a3;
  if ((-[NCNotificationViewController isViewLoaded](self, "isViewLoaded") & 1) != 0 || v3)
  {
    -[NCNotificationViewController loadViewIfNeeded](self, "loadViewIfNeeded");
    v5 = self->_lookView;
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)_lookViewIfLoaded
{
  return -[NCNotificationViewController _lookViewLoadingIfNecessary:](self, "_lookViewLoadingIfNecessary:", 0);
}

- (id)_lookView
{
  return -[NCNotificationViewController _lookViewLoadingIfNecessary:](self, "_lookViewLoadingIfNecessary:", 1);
}

- (id)_preferredFont:(BOOL)a3 textStyle:(id)a4 weight:(double)a5 additionalTraits:(unsigned int)a6
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  if (a3)
    objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", a4, *(_QWORD *)&a6, 0);
  else
    objc_msgSend(MEMORY[0x1E0DC1358], "defaultFontDescriptorWithTextStyle:addingSymbolicTraits:options:", a4, *(_QWORD *)&a6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *MEMORY[0x1E0DC13C0];
  v14 = *MEMORY[0x1E0DC1458];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fontDescriptorByAddingAttributes:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v11, 0.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)_updateWithProvidedStaticContent
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NCNotificationStaticContentProviding *staticContentProvider;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  id location;

  -[NCNotificationViewController _lookViewIfLoaded](self, "_lookViewIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_41;
  -[NCNotificationStaticContentProviding title](self->_staticContentProvider, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationViewController _updateLookView:withTitleFromProvidedStaticContent:](self, "_updateLookView:withTitleFromProvidedStaticContent:", v3, v4);

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[NCNotificationStaticContentProviding badgedIconView](self->_staticContentProvider, "badgedIconView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setBadgedIconView:", v5);

  }
  _NCIsNotificationHighlightsAllowed();
  if (_NCIsNotificationHighlightsAllowed())
    v6 = -[NCNotificationStaticContentProviding isHighlighted](self->_staticContentProvider, "isHighlighted");
  else
    v6 = 0;
  -[NCNotificationStaticContentProviding date](self->_staticContentProvider, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDate:", v7);

  objc_msgSend(v3, "setDateAllDay:", -[NCNotificationStaticContentProviding isDateAllDay](self->_staticContentProvider, "isDateAllDay"));
  -[NCNotificationStaticContentProviding timeZone](self->_staticContentProvider, "timeZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTimeZone:", v8);

  objc_msgSend(v3, "setDateFormatStyle:", -[NCNotificationViewController _dateFormatStyle](self, "_dateFormatStyle"));
  -[NCNotificationStaticContentProviding contentSummaryText](self->_staticContentProvider, "contentSummaryText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationStaticContentProviding primaryText](self->_staticContentProvider, "primaryText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationViewController _preferredFont:textStyle:weight:additionalTraits:](self, "_preferredFont:textStyle:weight:additionalTraits:", 1, *MEMORY[0x1E0DC4B10], 0, *MEMORY[0x1E0DC1448]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v11;
  _NCContentSummaryText(v9, v10, v11, (uint64_t)v12, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (objc_msgSend(v13, "length"))
      v14 = v13;
    else
      v14 = 0;
    objc_msgSend(v3, "setContentSummaryText:", v14);
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    objc_msgSend(v3, "setPrimaryText:", v10);
LABEL_19:
    -[NCNotificationStaticContentProviding primarySubtitleText](self->_staticContentProvider, "primarySubtitleText");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setPrimarySubtitleText:", v18);

    -[NCNotificationStaticContentProviding secondaryText](self->_staticContentProvider, "secondaryText");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSecondaryText:", v19);

    goto LABEL_20;
  }
  objc_msgSend(v3, "contentSummaryText");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "length");

  if (((v16 != 0) & v6) != 0)
    v17 = 0;
  else
    v17 = v10;
  objc_msgSend(v3, "setPrimaryText:", v17);
  if (!v16)
    goto LABEL_19;
  objc_msgSend(v3, "setPrimarySubtitleText:", 0);
  objc_msgSend(v3, "setSecondaryText:", 0);
LABEL_20:
  -[NCNotificationStaticContentProviding inlineAction](self->_staticContentProvider, "inlineAction");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "title");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (objc_msgSend(v21, "length"))
    {
      v22 = (void *)MEMORY[0x1E0DC3428];
      -[NCNotificationStaticContentProviding inlineAction](self->_staticContentProvider, "inlineAction");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __64__NCNotificationViewController__updateWithProvidedStaticContent__block_invoke;
      v38[3] = &unk_1E8D1B1C8;
      objc_copyWeak(&v39, &location);
      objc_msgSend(v22, "actionWithTitle:image:identifier:handler:", v21, 0, v24, v38);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_destroyWeak(&v39);
    }
    else
    {
      v25 = 0;
    }
    objc_msgSend(v3, "setInlineAction:", v25);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[NCNotificationStaticContentProviding footerText](self->_staticContentProvider, "footerText");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setFooterText:", v26);

  }
  -[NCNotificationViewController delegate](self, "delegate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27 && (objc_opt_respondsToSelector() & 1) != 0)
    v28 = objc_msgSend(v27, "importantAdornmentEligibleOptionsForNotificationViewController:", self);
  else
    v28 = -1;
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    staticContentProvider = self->_staticContentProvider;
    objc_msgSend(v3, "importantTextImageConfiguration");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationStaticContentProviding importantAttributedTextWithImageConfiguration:importantAdornmentEligibleOptions:](staticContentProvider, "importantAttributedTextWithImageConfiguration:importantAdornmentEligibleOptions:", v30, v28);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "setImportantAttributedText:", v31);
    -[NCNotificationStaticContentProviding importantTextVisualStylingProvider](self->_staticContentProvider, "importantTextVisualStylingProvider");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setImportantTextVisualStylingProvider:", v32);

  }
  else
  {
    v31 = 0;
  }
  if (!objc_msgSend(v31, "length") && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[NCNotificationStaticContentProviding importantText](self->_staticContentProvider, "importantText");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setImportantText:", v33);

    -[NCNotificationStaticContentProviding importantTextVisualStylingProvider](self->_staticContentProvider, "importantTextVisualStylingProvider");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setImportantTextVisualStylingProvider:", v34);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[NCNotificationStaticContentProviding thumbnail](self->_staticContentProvider, "thumbnail");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setThumbnail:", v35);

  }
  objc_msgSend(v3, "setMaximumNumberOfPrimaryTextLines:", -[NCNotificationViewController _maximumNumberOfPrimaryTextLinesForProvidedStaticContent](self, "_maximumNumberOfPrimaryTextLinesForProvidedStaticContent"));
  objc_msgSend(v3, "setMaximumNumberOfSecondaryTextLines:", -[NCNotificationViewController _maximumNumberOfSecondaryTextLinesForProvidedStaticContent](self, "_maximumNumberOfSecondaryTextLinesForProvidedStaticContent"));
  -[NCNotificationViewController view](self, "view");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setNeedsLayout");

  objc_destroyWeak(&location);
LABEL_41:

}

void __64__NCNotificationViewController__updateWithProvidedStaticContent__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[134], "inlineAction");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_askDelegateToExecuteAction:withParameters:animated:", v2, MEMORY[0x1E0C9AA70], 1);

    WeakRetained = v3;
  }

}

- (unint64_t)_maximumNumberOfPrimaryTextLinesForProvidedStaticContent
{
  void *v2;
  NSString *v3;
  unint64_t v4;

  -[NCNotificationViewController traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSizeCategory");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (UIContentSizeCategoryIsAccessibilityCategory(v3))
    v4 = 2;
  else
    v4 = 1;

  return v4;
}

- (unint64_t)_maximumNumberOfSecondaryTextLinesForProvidedStaticContent
{
  void *v2;
  NSString *v3;

  -[NCNotificationViewController traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSizeCategory");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  UIContentSizeCategoryIsAccessibilityCategory(v3);

  return 2;
}

- (int64_t)_dateFormatStyle
{
  id WeakRetained;
  int64_t v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(WeakRetained, "notificationViewControllerDateFormatStyle:", self);
  else
    v4 = 1;

  return v4;
}

- (void)_updateWithProvidedAuxiliaryOptionsContent
{
  -[NCNotificationViewController _setupAuxiliaryOptionsContentProvider](self, "_setupAuxiliaryOptionsContentProvider");
  -[NCAuxiliaryOptionsProviding setAuxiliaryOptionsVisible:](self->_auxiliaryOptionsContentProvider, "setAuxiliaryOptionsVisible:", -[NCNotificationStaticContentProviding isHidingContent](self->_staticContentProvider, "isHidingContent") ^ 1);
}

- (NCDimmableView)_notificationViewControllerView
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[NCNotificationViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  UNSafeCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NCDimmableView *)v4;
}

- (id)_contentSizeManagingView
{
  PLContentSizeManaging **p_contentSizeManagingView;
  id WeakRetained;
  void *v5;

  p_contentSizeManagingView = &self->_contentSizeManagingView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_contentSizeManagingView);
  if (!WeakRetained)
  {
    -[NCNotificationViewController viewIfLoaded](self, "viewIfLoaded");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      WeakRetained = v5;
      objc_storeWeak((id *)p_contentSizeManagingView, WeakRetained);
    }
    else
    {
      WeakRetained = 0;
    }

  }
  return WeakRetained;
}

- (void)_notificationViewControllerViewDidLoad
{
  void *v3;
  id v4;

  -[NCNotificationViewController view](self, "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAutoresizesSubviews:", 1);
  -[NCNotificationViewController _loadLookView](self, "_loadLookView");
  -[NCNotificationLookView setAdjustsFontForContentSizeCategory:](self->_lookView, "setAdjustsFontForContentSizeCategory:", 1);
  -[NCNotificationViewController _notificationViewControllerView](self, "_notificationViewControllerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContentView:", self->_lookView);

}

- (CGSize)_preferredCustomContentSizeForSize:(CGSize)a3 parentContentContainerBounds:(CGRect)a4
{
  double height;
  double width;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[NCNotificationViewController _lookViewIfLoaded](self, "_lookViewIfLoaded", a3.width, a3.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "contentSizeForSize:", width, height);
    width = v8;
    height = v9;
  }

  v10 = width;
  v11 = height;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)_setPreferredCustomContentSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id WeakRetained;

  height = a3.height;
  width = a3.width;
  -[NCNotificationViewController _contentSizeManagingView](self, "_contentSizeManagingView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sizeThatFitsContentWithSize:", width, height);
  v8 = v7;
  v10 = v9;

  -[NCNotificationViewController setPreferredContentSize:](self, "setPreferredContentSize:", v8, v10);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "notificationViewController:didUpdatePreferredContentSize:", self, v8, v10);

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
  id v24;

  if (-[NCNotificationViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[UIViewController nc_presentationControllerIfPresented](self, "nc_presentationControllerIfPresented");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "containerView");
    v24 = (id)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v24, "bounds");
      v5 = v4;
      v7 = v6;
      v9 = v8;
      v11 = v10;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "nc_bounds");
      v5 = v13;
      v7 = v14;
      v9 = v15;
      v11 = v16;

    }
    -[NCNotificationViewController view](self, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bounds");
    -[NCNotificationViewController _preferredCustomContentSizeForSize:parentContentContainerBounds:](self, "_preferredCustomContentSizeForSize:parentContentContainerBounds:", v18, v19, v5, v7, v9, v11);
    v21 = v20;
    v23 = v22;

    -[NCNotificationViewController _setPreferredCustomContentSize:](self, "_setPreferredCustomContentSize:", v21, v23);
  }
}

- (void)_updateScreenCaptureProhibited
{
  NCNotificationLookView *lookView;
  void *v3;
  id v4;

  lookView = self->_lookView;
  -[NCNotificationViewController notificationRequest](self, "notificationRequest");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "options");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationLookView setScreenCaptureProhibited:](lookView, "setScreenCaptureProhibited:", objc_msgSend(v3, "screenCaptureProhibited"));

}

- (NSDictionary)notificationUsageTrackingState
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "notificationRequestPresenterNotificationUsageTrackingState:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSDictionary *)v4;
}

- (NSSet)activeTransitionBlockingAssertions
{
  NCNotificationViewController *v2;
  id v3;
  NSMapTable *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = v2->_reasonsToTransitionBlockingAssertions;
  v5 = -[NSMapTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        -[NSMapTable objectForKey:](v2->_reasonsToTransitionBlockingAssertions, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7), (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "isValid"))
          objc_msgSend(v3, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMapTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  objc_sync_exit(v2);
  return (NSSet *)v3;
}

- (id)requestTransitionBlockingAssertionWithReason:(id)a3
{
  id v4;
  NCNotificationViewController *v5;
  NCAssertion *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSMapTable *reasonsToTransitionBlockingAssertions;
  id WeakRetained;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = self;
    objc_sync_enter(v5);
    -[NCNotificationViewController activeTransitionBlockingAssertionForReason:](v5, "activeTransitionBlockingAssertionForReason:", v4);
    v6 = (NCAssertion *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v7 = (id)*MEMORY[0x1E0DC5F70];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        -[NCNotificationRequest notificationIdentifier](v5->_notificationRequest, "notificationIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "un_logDigest");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v17 = v9;
        v18 = 2114;
        v19 = v4;
        _os_log_impl(&dword_1CFC3D000, v7, OS_LOG_TYPE_DEFAULT, "New transition blocking assertion requested for notification view controller for request '%{public}@' with reason '%{public}@'", buf, 0x16u);

      }
      if (!v5->_reasonsToTransitionBlockingAssertions)
      {
        objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
        v10 = objc_claimAutoreleasedReturnValue();
        reasonsToTransitionBlockingAssertions = v5->_reasonsToTransitionBlockingAssertions;
        v5->_reasonsToTransitionBlockingAssertions = (NSMapTable *)v10;

      }
      v6 = -[NCAssertion initWithInstantiationReason:]([NCAssertion alloc], "initWithInstantiationReason:", v4);
      objc_initWeak((id *)buf, v5);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __77__NCNotificationViewController_requestTransitionBlockingAssertionWithReason___block_invoke;
      v14[3] = &unk_1E8D1B1F0;
      objc_copyWeak(&v15, (id *)buf);
      -[NCAssertion addInvalidationBlock:](v6, "addInvalidationBlock:", v14);
      -[NSMapTable setObject:forKey:](v5->_reasonsToTransitionBlockingAssertions, "setObject:forKey:", v6, v4);
      WeakRetained = objc_loadWeakRetained((id *)&v5->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(WeakRetained, "notificationRequestPresenter:didVendTransitionBlockingAssertion:", v5, v6);

      objc_destroyWeak(&v15);
      objc_destroyWeak((id *)buf);
    }
    objc_sync_exit(v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __77__NCNotificationViewController_requestTransitionBlockingAssertionWithReason___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = (void *)*MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    objc_msgSend(WeakRetained, "notificationRequest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "notificationIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "un_logDigest");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v10;
    v13 = 2114;
    v14 = v4;
    _os_log_impl(&dword_1CFC3D000, v7, OS_LOG_TYPE_DEFAULT, "Transition blocking assertion for notification view controller for request '%{public}@' invalidated with reason '%{public}@'", (uint8_t *)&v11, 0x16u);

  }
}

- (id)activeTransitionBlockingAssertionForReason:(id)a3
{
  id v4;
  NCNotificationViewController *v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = self;
    objc_sync_enter(v5);
    -[NSMapTable objectForKey:](v5->_reasonsToTransitionBlockingAssertions, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)loadView
{
  NCDimmableView *v3;

  v3 = objc_alloc_init(NCDimmableView);
  -[NCNotificationViewController setView:](self, "setView:", v3);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NCNotificationViewController;
  -[NCNotificationViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[NCNotificationViewController _notificationViewControllerViewDidLoad](self, "_notificationViewControllerViewDidLoad");
  -[NCNotificationViewController setHasUpdatedContent](self, "setHasUpdatedContent");
}

- (void)viewWillAppear:(BOOL)a3
{
  _QWORD v4[4];
  id v5;
  id location;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NCNotificationViewController;
  -[NCNotificationViewController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  if (-[NCNotificationViewController isBeingPresented](self, "isBeingPresented"))
  {
    -[NCNotificationViewController _notifyObserversWithBlock:](self, "_notifyObserversWithBlock:", &__block_literal_global);
    objc_initWeak(&location, self);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __47__NCNotificationViewController_viewWillAppear___block_invoke_2;
    v4[3] = &unk_1E8D1B278;
    objc_copyWeak(&v5, &location);
    -[NCNotificationViewController _setPendingPresentationTransitionDidEndBlock:](self, "_setPendingPresentationTransitionDidEndBlock:", v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __47__NCNotificationViewController_viewWillAppear___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "notificationViewControllerWillPresent:", v5);

}

void __47__NCNotificationViewController_viewWillAppear___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_notifyObserversWithBlock:", &__block_literal_global_67);

}

void __47__NCNotificationViewController_viewWillAppear___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "notificationViewControllerDidPresent:", v5);

}

- (void)viewDidAppear:(BOOL)a3
{
  id pendingPresentationTransitionDidEndBlock;
  void (**v5)(_QWORD);
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NCNotificationViewController;
  -[NCNotificationViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  pendingPresentationTransitionDidEndBlock = self->_pendingPresentationTransitionDidEndBlock;
  if (pendingPresentationTransitionDidEndBlock)
  {
    v5 = (void (**)(_QWORD))_Block_copy(pendingPresentationTransitionDidEndBlock);
    -[NCNotificationViewController _setPendingPresentationTransitionDidEndBlock:](self, "_setPendingPresentationTransitionDidEndBlock:", 0);
    v5[2](v5);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  _QWORD v4[4];
  id v5;
  id location;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NCNotificationViewController;
  -[NCNotificationViewController viewWillDisappear:](&v7, sel_viewWillDisappear_, a3);
  if (-[NCNotificationViewController isBeingDismissed](self, "isBeingDismissed"))
  {
    -[NCNotificationViewController _notifyObserversWithBlock:](self, "_notifyObserversWithBlock:", &__block_literal_global_75);
    objc_initWeak(&location, self);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __50__NCNotificationViewController_viewWillDisappear___block_invoke_2;
    v4[3] = &unk_1E8D1B278;
    objc_copyWeak(&v5, &location);
    -[NCNotificationViewController _setPendingPresentationTransitionDidEndBlock:](self, "_setPendingPresentationTransitionDidEndBlock:", v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __50__NCNotificationViewController_viewWillDisappear___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "notificationViewControllerWillDismiss:", v5);

}

void __50__NCNotificationViewController_viewWillDisappear___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_notifyObserversWithBlock:", &__block_literal_global_78);

}

void __50__NCNotificationViewController_viewWillDisappear___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "notificationViewControllerDidDismiss:", v5);

}

- (void)viewDidDisappear:(BOOL)a3
{
  NCNotificationViewController *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id pendingPresentationTransitionDidEndBlock;
  void (**v10)(_QWORD);
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)NCNotificationViewController;
  -[NCNotificationViewController viewDidDisappear:](&v15, sel_viewDidDisappear_, a3);
  v4 = self;
  objc_sync_enter(v4);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NCNotificationViewController activeTransitionBlockingAssertions](v4, "activeTransitionBlockingAssertions", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8++), "invalidateWithReason:", CFSTR("notificationViewController.invalidationReason.dismissed"));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v6);
  }

  objc_sync_exit(v4);
  pendingPresentationTransitionDidEndBlock = v4->_pendingPresentationTransitionDidEndBlock;
  if (pendingPresentationTransitionDidEndBlock)
  {
    v10 = (void (**)(_QWORD))_Block_copy(pendingPresentationTransitionDidEndBlock);
    -[NCNotificationViewController _setPendingPresentationTransitionDidEndBlock:](v4, "_setPendingPresentationTransitionDidEndBlock:", 0);
    v10[2](v10);

  }
}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NCNotificationViewController;
  -[NCNotificationViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  if (self->_notificationRequest)
  {
    if (!self->_staticContentProvider)
      -[NCNotificationViewController _setupStaticContentProvider](self, "_setupStaticContentProvider");
    if (!self->_auxiliaryOptionsContentProvider)
      -[NCNotificationViewController _setupAuxiliaryOptionsContentProvider](self, "_setupAuxiliaryOptionsContentProvider");
  }
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NCNotificationViewController;
  -[NCNotificationViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v5, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, a3, a4);
  -[NCNotificationViewController _notifyObserversWithBlock:](self, "_notifyObserversWithBlock:", &__block_literal_global_87);
}

void __76__NCNotificationViewController_viewDidMoveToWindow_shouldAppearOrDisappear___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "notificationViewControllerViewDidMoveToWindow:", v5);

}

- (BOOL)shouldAutorotate
{
  void *v3;
  void *v4;
  char v5;

  -[NCNotificationViewController presentingViewController](self, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[NCNotificationViewController presentingViewController](self, "presentingViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "shouldAutorotate");

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  int64_t v10;
  id v11;
  objc_super v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = 1;
  if (!v6)
    v10 = 2;
  self->_ncTransitionAnimationState = v10;
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __74__NCNotificationViewController_presentViewController_animated_completion___block_invoke;
  v13[3] = &unk_1E8D1B300;
  objc_copyWeak(&v15, &location);
  v11 = v9;
  v14 = v11;
  v12.receiver = self;
  v12.super_class = (Class)NCNotificationViewController;
  -[NCNotificationViewController presentViewController:animated:completion:](&v12, sel_presentViewController_animated_completion_, v8, 1, v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __74__NCNotificationViewController_presentViewController_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setNCTransitionAnimationState:", 0);
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();

}

- (void)dismissViewControllerWithTransition:(int)a3 completion:(id)a4
{
  id v6;
  int64_t v7;
  id v8;
  objc_super v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v6 = a4;
  v7 = 1;
  if (!a3)
    v7 = 2;
  self->_ncTransitionAnimationState = v7;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __79__NCNotificationViewController_dismissViewControllerWithTransition_completion___block_invoke;
  v10[3] = &unk_1E8D1B300;
  objc_copyWeak(&v12, &location);
  v8 = v6;
  v11 = v8;
  v9.receiver = self;
  v9.super_class = (Class)NCNotificationViewController;
  -[NCNotificationViewController dismissViewControllerWithTransition:completion:](&v9, sel_dismissViewControllerWithTransition_completion_, 9, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __79__NCNotificationViewController_dismissViewControllerWithTransition_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setNCTransitionAnimationState:", 0);
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();

}

- (int64_t)ncTransitionAnimationState
{
  return self->_ncTransitionAnimationState;
}

- (void)setNCTransitionAnimationState:(int64_t)a3
{
  self->_ncTransitionAnimationState = a3;
}

- (CGSize)preferredContentSizeWithPresentationSize:(CGSize)a3 containerSize:(CGSize)a4
{
  double height;
  double width;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGSize result;

  height = a3.height;
  width = a3.width;
  BSRectWithSize();
  -[NCNotificationViewController _preferredCustomContentSizeForSize:parentContentContainerBounds:](self, "_preferredCustomContentSizeForSize:parentContentContainerBounds:", width, height, v7, v8, v9, v10);
  v12 = v11;
  v14 = v13;
  -[NCNotificationViewController _contentSizeManagingView](self, "_contentSizeManagingView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sizeThatFitsContentWithSize:", v12, v14);
  v17 = v16;
  v19 = v18;

  v20 = v17;
  v21 = v19;
  result.height = v21;
  result.width = v20;
  return result;
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  NCAnimationCoordinator *v8;
  _QWORD v9[4];
  id v10;
  id location;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NCNotificationViewController;
  -[NCNotificationViewController preferredContentSizeDidChangeForChildContentContainer:](&v12, sel_preferredContentSizeDidChangeForChildContentContainer_, v4);
  -[NCNotificationViewController _customContentProvidingViewController](self, "_customContentProvidingViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    objc_msgSend(v4, "transitionCoordinator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      if (objc_msgSend(v6, "presentationStyle") == -1)
      {
LABEL_7:

        goto LABEL_8;
      }
      -[NCNotificationViewController _updatePreferredContentSize](self, "_updatePreferredContentSize");
      v8 = objc_alloc_init(NCAnimationCoordinator);
      -[NCAnimationCoordinator setDurationInherited:](v8, "setDurationInherited:", 1);
    }
    else
    {
      -[NCNotificationViewController _updatePreferredContentSize](self, "_updatePreferredContentSize");
      +[NCAnimationCoordinator animationCoordinatorWithDuration:](NCAnimationCoordinator, "animationCoordinatorWithDuration:", 0.25);
      v8 = (NCAnimationCoordinator *)objc_claimAutoreleasedReturnValue();
    }
    -[NCAnimationCoordinator setAnimationOptions:](v8, "setAnimationOptions:", 4);
    -[NCNotificationViewController preferredContentSize](self, "preferredContentSize");
    -[NCNotificationViewController sizeForChildContentContainer:withParentContainerSize:](self, "sizeForChildContentContainer:withParentContainerSize:", v4);
    -[NCAnimationCoordinator viewOfChildContainer:willChangeToSize:](v8, "viewOfChildContainer:willChangeToSize:", v4);
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __86__NCNotificationViewController_preferredContentSizeDidChangeForChildContentContainer___block_invoke;
    v9[3] = &unk_1E8D1B328;
    objc_copyWeak(&v10, &location);
    -[NCAnimationCoordinator animate:completion:](v8, "animate:completion:", v9, 0);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);

    goto LABEL_7;
  }
LABEL_8:

}

void __86__NCNotificationViewController_preferredContentSizeDidChangeForChildContentContainer___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "view");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setNeedsLayout");

  objc_msgSend(WeakRetained, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutIfNeeded");

}

- (int64_t)materialRecipe
{
  return 1;
}

- (void)_executeDefaultAction:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  -[NCNotificationViewController _staticContentProviderLoadingIfNecessary](self, "_staticContentProviderLoadingIfNecessary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultAction");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v6)
  {
    (*((void (**)(id, _BOOL8))v6 + 2))(v6, v3);
    v5 = v6;
  }

}

- (void)_executeClearAction:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  -[NCNotificationViewController _staticContentProviderLoadingIfNecessary](self, "_staticContentProviderLoadingIfNecessary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearAction");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v6)
  {
    (*((void (**)(id, _BOOL8))v6 + 2))(v6, v3);
    v5 = v6;
  }

}

- (void)_executeCloseAction:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void (**v6)(id, _BOOL8);

  v3 = a3;
  -[NCNotificationViewController _staticContentProviderLoadingIfNecessary](self, "_staticContentProviderLoadingIfNecessary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "closeAction");
  v6 = (void (**)(id, _BOOL8))objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NCNotificationViewController _setShouldRestorePresentingShortLookOnDismiss:](self, "_setShouldRestorePresentingShortLookOnDismiss:", 1);
    v6[2](v6, v3);
  }

}

- (void)_executeCancelAction:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void (**v6)(id, _BOOL8);

  v3 = a3;
  -[NCNotificationViewController _staticContentProviderLoadingIfNecessary](self, "_staticContentProviderLoadingIfNecessary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelAction");
  v6 = (void (**)(id, _BOOL8))objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NCNotificationViewController _setShouldRestorePresentingShortLookOnDismiss:](self, "_setShouldRestorePresentingShortLookOnDismiss:", 1);
    v6[2](v6, v3);
  }

}

- (void)_executeNilAction:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void (**v6)(id, _BOOL8);

  v3 = a3;
  -[NCNotificationViewController _staticContentProviderLoadingIfNecessary](self, "_staticContentProviderLoadingIfNecessary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nilAction");
  v6 = (void (**)(id, _BOOL8))objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NCNotificationViewController _setShouldRestorePresentingShortLookOnDismiss:](self, "_setShouldRestorePresentingShortLookOnDismiss:", 1);
    v6[2](v6, v3);
  }

}

- (void)_askDelegateToExecuteAction:(id)a3 withParameters:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  id WeakRetained;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  BOOL v26;
  _QWORD aBlock[4];
  id v28;
  id location;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  objc_initWeak(&location, self);
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__NCNotificationViewController__askDelegateToExecuteAction_withParameters_animated___block_invoke;
  aBlock[3] = &unk_1E8D1B350;
  objc_copyWeak(&v28, &location);
  v11 = _Block_copy(aBlock);
  if (v8)
  {
    -[NCNotificationRequest userNotification](self->_notificationRequest, "userNotification");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)objc_msgSend(v9, "mutableCopy");
      v14 = v13;
      if (v13)
      {
        v15 = v5;
        v5 = v10;
        v16 = v13;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v16 = (id)objc_claimAutoreleasedReturnValue();
        v15 = v5;
        v5 = v10;
      }

      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v12, 1, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setValue:forKey:", v17, *MEMORY[0x1E0CEC8A8]);
      v18 = objc_msgSend(v16, "copy");

      v9 = (id)v18;
      v10 = v5;
      LOBYTE(v5) = v15;
    }
    -[NCNotificationViewController _setShouldRestorePresentingShortLookOnDismiss:](self, "_setShouldRestorePresentingShortLookOnDismiss:", objc_msgSend(v8, "shouldDismissNotification") ^ 1);
    v22[0] = v10;
    v22[1] = 3221225472;
    v22[2] = __84__NCNotificationViewController__askDelegateToExecuteAction_withParameters_animated___block_invoke_2;
    v22[3] = &unk_1E8D1B378;
    objc_copyWeak(&v25, &location);
    v19 = v8;
    v23 = v19;
    v24 = v11;
    v26 = v5;
    v20 = _Block_copy(v22);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "notificationRequestPresenter:executeAction:withParameters:completion:", self, v19, v9, v20);

    objc_destroyWeak(&v25);
  }
  else
  {
    -[NCNotificationViewController _setShouldRestorePresentingShortLookOnDismiss:](self, "_setShouldRestorePresentingShortLookOnDismiss:", 1);
    v12 = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v12, "notificationViewControllerWillDismissForCancelAction:", self);
    (*((void (**)(void *, _BOOL8))v11 + 2))(v11, v5);
  }

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);

}

void __84__NCNotificationViewController__askDelegateToExecuteAction_withParameters_animated___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_dismissPresentedViewControllerAnimated:", a2);

}

void __84__NCNotificationViewController__askDelegateToExecuteAction_withParameters_animated___block_invoke_2(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  BOOL v9;
  id v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (a2)
  {
    v10 = WeakRetained;
    if ((objc_msgSend(*(id *)(a1 + 32), "isSystemAction") & 1) == 0 && (objc_msgSend(v10, "isShortLook") & 1) == 0)
    {
      +[NCNotificationEventTracker sharedInstance](NCNotificationEventTracker, "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v10, "notificationRequest");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "notificationUsageTrackingState");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "longLookCustomAction:forNotificationRequest:withState:", v6, v7, v8);

    }
    v9 = objc_msgSend(*(id *)(a1 + 32), "activationMode") == 1;
    WeakRetained = v10;
    if (!v9)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      WeakRetained = v10;
    }
  }

}

- (void)contentProvider:(id)a3 performAction:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  char v11;
  char v12;
  void *v13;
  int v14;
  id v15;

  v5 = a5;
  v15 = a3;
  v8 = a4;
  if (v8)
  {
    -[NCNotificationViewController _customContentProvidingViewController](self, "_customContentProvidingViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationViewController notificationRequest](self, "notificationRequest");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "performAction:forNotification:", v8, v10);

    v12 = v11 ^ 1;
  }
  else
  {
    v12 = 1;
  }
  objc_msgSend(v8, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqual:", *MEMORY[0x1E0CEC818]);

  if ((v12 & 1) != 0 || v14)
    -[NCNotificationViewController _askDelegateToExecuteAction:withParameters:animated:](self, "_askDelegateToExecuteAction:withParameters:animated:", v8, MEMORY[0x1E0C9AA70], v5);

}

- (void)customContent:(id)a3 requestPermissionToExecuteAction:(id)a4 forNotification:(id)a5 withUserInfo:(id)a6 completionHandler:(id)a7
{
  id v10;
  id v11;
  id v12;
  id v13;

  v10 = a7;
  v11 = a6;
  v12 = a4;
  -[NCNotificationViewController delegate](self, "delegate");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "notificationViewController:requestPermissionToExecuteAction:withParameters:completion:", self, v12, v11, v10);

}

- (void)customContent:(id)a3 forwardAction:(id)a4 forNotification:(id)a5 withUserInfo:(id)a6
{
  -[NCNotificationViewController _askDelegateToExecuteAction:withParameters:animated:](self, "_askDelegateToExecuteAction:withParameters:animated:", a4, a6, 1);
}

- (void)customContentRequestsDefaultAction:(id)a3
{
  -[NCNotificationViewController _executeDefaultAction:](self, "_executeDefaultAction:", 1);
}

- (void)customContentRequestsDismiss:(id)a3
{
  -[NCNotificationViewController _executeNilAction:](self, "_executeNilAction:", 1);
}

- (id)expandedPlatterPresentationController:(id)a3 keyboardAssertionForGestureWindow:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[NCNotificationViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "notificationViewController:keyboardAssertionForGestureWindow:", self, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)hideHomeAffordanceAnimationSettingsForExpandedPlatterPresentationController:(id)a3
{
  void *v4;
  void *v5;

  -[NCNotificationViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "hideHomeAffordanceAnimationSettingsForNotificationViewController:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)unhideHomeAffordanceAnimationSettingsForExpandedPlatterPresentationController:(id)a3
{
  void *v4;
  void *v5;

  -[NCNotificationViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "unhideHomeAffordanceAnimationSettingsForNotificationViewController:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)settleHomeAffordanceAnimationBehaviorDescriptionForExpandedPlatterPresentationController:(id)a3
{
  void *v4;
  void *v5;

  -[NCNotificationViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "settleHomeAffordanceAnimationBehaviorDescriptionForNotificationViewController:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return -[NCNotificationLookView adjustsFontForContentSizeCategory](self->_lookView, "adjustsFontForContentSizeCategory");
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  -[NCNotificationLookView setAdjustsFontForContentSizeCategory:](self->_lookView, "setAdjustsFontForContentSizeCategory:", a3);
}

- (BOOL)adjustForContentSizeCategoryChange
{
  void *v3;
  void *v4;
  void *v5;

  -[NCNotificationViewController _lookViewIfLoaded](self, "_lookViewIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "adjustForContentSizeCategoryChange");
    -[NCNotificationViewController setHasUpdatedContent](self, "setHasUpdatedContent");
    -[NCNotificationViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNeedsLayout");

  }
  return 1;
}

- (void)configureStackDimmingForTransform:(CGAffineTransform *)a3
{
  void *v4;
  __int128 v5;
  _OWORD v6[3];

  -[NCNotificationViewController _notificationViewControllerView](self, "_notificationViewControllerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_OWORD *)&a3->c;
  v6[0] = *(_OWORD *)&a3->a;
  v6[1] = v5;
  v6[2] = *(_OWORD *)&a3->tx;
  objc_msgSend(v4, "configureStackDimmingForTransform:", v6);

}

- (NSString)debugDescription
{
  return (NSString *)-[NCNotificationViewController descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[NCNotificationViewController descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  NCNotificationViewController *v12;

  v4 = (void *)MEMORY[0x1E0D01748];
  v5 = a3;
  objc_msgSend(v4, "builderWithObject:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__NCNotificationViewController_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E8D1B3A0;
  v7 = v6;
  v11 = v7;
  v12 = self;
  objc_msgSend(v7, "appendBodySectionWithName:multilinePrefix:block:", 0, v5, v10);

  v8 = v7;
  return v8;
}

void __70__NCNotificationViewController_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v20;

  v2 = *(void **)(a1 + 32);
  if ((objc_msgSend(*(id *)(a1 + 40), "isViewLoaded") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("view"));

  }
  else
  {
    v5 = (id)objc_msgSend(v2, "appendObject:withName:", CFSTR("(view not loaded)"), CFSTR("view"));
  }
  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v6, "appendObject:withName:skipIfNil:", v7, CFSTR("delegate"), 1);

  objc_msgSend(*(id *)(a1 + 40), "notificationRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = *(void **)(a1 + 32);
  v10 = *(void **)(a1 + 40);
  if (v9)
  {
    objc_msgSend(v10, "notificationRequest");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "description");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appendString:withName:", v13, CFSTR("notificationRequest"));

  }
  else
  {
    objc_msgSend(v10, "staticContentProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)objc_msgSend(v11, "appendObject:withName:skipIfNil:", v12, CFSTR("staticContentProvider"), 1);
  }

  v15 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "customContentProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v15, "appendObject:withName:skipIfNil:", v16, CFSTR("customContentProvider"), 1);

  if (objc_msgSend(*(id *)(a1 + 40), "_isPresentingCustomContentProvidingViewController"))
  {
    v18 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "_presentedLongLookViewController");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    v19 = (id)objc_msgSend(v18, "appendObject:withName:", v20, CFSTR("presentedLongLookViewController"));

  }
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[NCNotificationViewController succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationViewController notificationRequest](self, "notificationRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notificationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "un_logDigest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", v6, CFSTR("notificationID"), 1);

  if ((-[NCNotificationViewController isViewLoaded](self, "isViewLoaded") & 1) != 0)
  {
    -[NCNotificationViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v3, "appendObject:withName:", v7, CFSTR("view"));

  }
  else
  {
    v9 = (id)objc_msgSend(v3, "appendObject:withName:", CFSTR("(view not loaded)"), CFSTR("view"));
  }
  return v3;
}

- (NCNotificationRequest)notificationRequest
{
  return self->_notificationRequest;
}

- (NSString)materialGroupNameBase
{
  return self->_materialGroupNameBase;
}

- (void)setMaterialGroupNameBase:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1040);
}

- (NCNotificationViewControllerDelegate)delegate
{
  return (NCNotificationViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)revealAdditionalContentOnPresentation
{
  return self->_revealAdditionalContentOnPresentation;
}

- (void)setRevealAdditionalContentOnPresentation:(BOOL)a3
{
  self->_revealAdditionalContentOnPresentation = a3;
}

- (BOOL)isCustomContentHomeAffordanceVisible
{
  return self->_customContentHomeAffordanceVisible;
}

- (void)setCustomContentHomeAffordanceVisible:(BOOL)a3
{
  self->_customContentHomeAffordanceVisible = a3;
}

- (UIPanGestureRecognizer)customContentHomeAffordanceGestureRecognizer
{
  return (UIPanGestureRecognizer *)objc_loadWeakRetained((id *)&self->_customContentHomeAffordanceGestureRecognizer);
}

- (void)setCustomContentHomeAffordanceGestureRecognizer:(id)a3
{
  objc_storeWeak((id *)&self->_customContentHomeAffordanceGestureRecognizer, a3);
}

- (BOOL)isNotificationContentViewHidden
{
  return self->_notificationContentViewHidden;
}

- (void)setNotificationContentViewHidden:(BOOL)a3
{
  self->_notificationContentViewHidden = a3;
}

- (BOOL)hasShadow
{
  return self->_hasShadow;
}

- (void)setHasShadow:(BOOL)a3
{
  self->_hasShadow = a3;
}

- (BOOL)isContentReplacedWithSnapshot
{
  return self->_contentReplacedWithSnapshot;
}

- (void)setContentReplacedWithSnapshot:(BOOL)a3
{
  self->_contentReplacedWithSnapshot = a3;
}

- (double)backgroundAlpha
{
  return self->_backgroundAlpha;
}

- (BOOL)disableDimming
{
  return self->_disableDimming;
}

- (BOOL)hideDate
{
  return self->_hideDate;
}

- (NCNotificationStaticContentProviding)staticContentProvider
{
  return self->_staticContentProvider;
}

- (NCNotificationCustomContentProviding)customContentProvider
{
  return self->_customContentProvider;
}

- (void)setCustomContentProvider:(id)a3
{
  objc_storeStrong((id *)&self->_customContentProvider, a3);
}

- (NCAuxiliaryOptionsProviding)auxiliaryOptionsContentProvider
{
  return self->_auxiliaryOptionsContentProvider;
}

- (UIViewControllerTransitionCoordinator)_activeTransitionCoordinator
{
  return self->_activeTransitionCoordinator;
}

- (void)_setActiveTransitionCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_activeTransitionCoordinator, a3);
}

- (BOOL)isInteractionEnabled
{
  return self->_interactionEnabled;
}

- (UIView)associatedView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_associatedView);
}

- (void)setAssociatedView:(id)a3
{
  objc_storeWeak((id *)&self->_associatedView, a3);
}

- (id)_pendingPresentationTransitionDidEndBlock
{
  return self->_pendingPresentationTransitionDidEndBlock;
}

- (void)_setPendingPresentationTransitionDidEndBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1112);
}

- (NCNotificationCustomContent)_customContentProvidingViewController
{
  return self->_customContentProvidingViewController;
}

- (BOOL)_shouldRestorePresentingShortLookOnDismiss
{
  return self->_shouldRestorePresentingShortLookOnDismiss;
}

- (void)_setShouldRestorePresentingShortLookOnDismiss:(BOOL)a3
{
  self->_shouldRestorePresentingShortLookOnDismiss = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customContentProvidingViewController, 0);
  objc_storeStrong(&self->_pendingPresentationTransitionDidEndBlock, 0);
  objc_destroyWeak((id *)&self->_associatedView);
  objc_storeStrong((id *)&self->_activeTransitionCoordinator, 0);
  objc_storeStrong((id *)&self->_auxiliaryOptionsContentProvider, 0);
  objc_storeStrong((id *)&self->_customContentProvider, 0);
  objc_storeStrong((id *)&self->_staticContentProvider, 0);
  objc_destroyWeak((id *)&self->_customContentHomeAffordanceGestureRecognizer);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_materialGroupNameBase, 0);
  objc_storeStrong((id *)&self->_notificationRequest, 0);
  objc_storeStrong((id *)&self->_lookView, 0);
  objc_destroyWeak((id *)&self->_contentSizeManagingView);
  objc_storeStrong((id *)&self->_reasonsToTransitionBlockingAssertions, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (NCNotificationViewController)_presentedLongLookViewController
{
  return 0;
}

- (void)presentLongLookAnimated:(BOOL)a3 trigger:(int64_t)a4 completion:(id)a5
{
  if (a5)
    (*((void (**)(id, _QWORD))a5 + 2))(a5, 0);
}

- (BOOL)isLookStyleLongLook
{
  return 0;
}

- (void)setInteractionEnabled:(os_log_t)log .cold.1(char a1, uint64_t a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109378;
  v3[1] = a1 & 1;
  v4 = 2114;
  v5 = a2;
  _os_log_debug_impl(&dword_1CFC3D000, log, OS_LOG_TYPE_DEBUG, "Setting interactionEnabled=%d for view controller %{public}@", (uint8_t *)v3, 0x12u);
}

@end
