@implementation SHSheetPresenter

- (SHSheetPresenter)initWithRouter:(id)a3 interactor:(id)a4
{
  id v7;
  id v8;
  SHSheetPresenter *v9;
  NSObject *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SHSheetPresenter;
  v9 = -[SHSheetPresenter init](&v12, sel_init);
  if (v9)
  {
    share_sheet_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[SHSheetPresenter initWithRouter:interactor:].cold.1((uint64_t)v7, (uint64_t)v8, v10);

    objc_storeStrong((id *)&v9->_router, a3);
    objc_storeStrong((id *)&v9->_interactor, a4);
    -[SHSheetInteractor setDelegate:](v9->_interactor, "setDelegate:", v9);
    -[SHSheetInteractor startSession](v9->_interactor, "startSession");
  }

  return v9;
}

- (void)_startSessionIfNeeded
{
  void *v3;
  char v4;

  -[SHSheetPresenter interactor](self, "interactor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasSessionStarted");

  if ((v4 & 1) == 0)
    -[SHSheetInteractor startSession](self->_interactor, "startSession");
}

- (id)session
{
  void *v2;
  void *v3;

  -[SHSheetPresenter interactor](self, "interactor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)useRemoteUIService
{
  void *v2;
  void *v3;
  char v4;

  -[SHSheetPresenter interactor](self, "interactor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "useRemoteUIService");

  return v4;
}

- (_UIRemoteSheet)remoteSheet
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[SHSheetPresenter interactor](self, "interactor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EE539150))
    v5 = v4;
  else
    v5 = 0;

  return (_UIRemoteSheet *)v5;
}

- (UIActivity)currentActivity
{
  void *v2;
  void *v3;
  void *v4;

  -[SHSheetPresenter interactor](self, "interactor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activityPerformer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIActivity *)v4;
}

- (void)updateCustomView
{
  -[SHSheetPresenter _updateContentView:](self, "_updateContentView:", 0);
}

- (void)setSelectedAssetIdentifiers:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SHSheetPresenter session](self, "session");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSelectedAssetIdentifiers:", v4);

}

- (NSArray)selectedAssetIdentifiers
{
  void *v2;
  void *v3;

  -[SHSheetPresenter session](self, "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectedAssetIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setIsContentManaged:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SHSheetPresenter session](self, "session");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsContentManaged:", v3);

}

- (BOOL)isContentManaged
{
  void *v2;
  char v3;

  -[SHSheetPresenter session](self, "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isContentManaged");

  return v3;
}

- (NSString)sessionIdentifier
{
  void *v2;
  void *v3;

  -[SHSheetPresenter session](self, "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)updateWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v4 = a3;
  -[SHSheetPresenter interactor](self, "interactor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activityPerformer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    share_sheet_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SHSheetPresenter updateWithContext:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);

  }
  else
  {
    -[SHSheetPresenter interactor](self, "interactor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "updateSessionWithContext:", v4);

    -[SHSheetPresenter interactor](self, "interactor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "invalidateRemoteSession");

    -[SHSheetPresenter _updateContentView:](self, "_updateContentView:", 0);
    -[SHSheetPresenter _updateConfiguration](self, "_updateConfiguration");
  }

}

- (void)reloadActivity:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SHSheetPresenter mainViewController](self, "mainViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadActivity:", v4);

}

- (void)_updateConfiguration
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  os_signpost_id_t v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  os_signpost_id_t v13;
  uint8_t v14[16];
  uint8_t buf[16];

  share_sheet_log();
  v3 = objc_claimAutoreleasedReturnValue();
  share_sheet_log();
  v4 = objc_claimAutoreleasedReturnValue();
  -[SHSheetPresenter session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activityViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = os_signpost_id_make_with_pointer(v4, v6);

  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19E419000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v7, "UpdateConfiguration", (const char *)&unk_19E4D535F, buf, 2u);
  }

  -[SHSheetPresenter _startSessionIfNeeded](self, "_startSessionIfNeeded");
  -[SHSheetPresenter interactor](self, "interactor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "requestServiceUpdate");

  share_sheet_log();
  v9 = objc_claimAutoreleasedReturnValue();
  share_sheet_log();
  v10 = objc_claimAutoreleasedReturnValue();
  -[SHSheetPresenter session](self, "session");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "activityViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = os_signpost_id_make_with_pointer(v10, v12);

  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)v14 = 0;
    _os_signpost_emit_with_name_impl(&dword_19E419000, v9, OS_SIGNPOST_INTERVAL_END, v13, "UpdateConfiguration", (const char *)&unk_19E4D535F, v14, 2u);
  }

}

- (BOOL)isCollaborationSelected
{
  void *v2;
  void *v3;
  char v4;

  -[SHSheetPresenter interactor](self, "interactor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCollaborative");

  return v4;
}

- (id)createActivityItemsConfiguration
{
  void *v2;
  void *v3;

  -[SHSheetPresenter interactor](self, "interactor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createActivityItemsConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)performActivityWithType:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[SHSheetPresenter interactor](self, "interactor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "performActivityWithType:completionHandler:", v7, v6);

}

- (void)_findSupportedActivitiesWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SHSheetPresenter interactor](self, "interactor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "findSupportedActivitiesWithCompletionHandler:", v4);

}

- (void)activityViewControllerWillBePresented:(id)a3
{
  id v4;

  v4 = a3;
  -[SHSheetPresenter _startSessionIfNeeded](self, "_startSessionIfNeeded");
  -[SHSheetPresenter setActivityViewControllerIsPresenting:](self, "setActivityViewControllerIsPresenting:", 1);
  -[SHSheetPresenter _activityViewControllerPresentationDidBegin:](self, "_activityViewControllerPresentationDidBegin:", v4);

}

- (void)activityViewControllerWillBeEmbedded:(id)a3
{
  id v4;

  v4 = a3;
  -[SHSheetPresenter _startSessionIfNeeded](self, "_startSessionIfNeeded");
  -[SHSheetPresenter setActivityViewControllerIsEmbedded:](self, "setActivityViewControllerIsEmbedded:", 1);
  -[SHSheetPresenter _activityViewControllerPresentationDidBegin:](self, "_activityViewControllerPresentationDidBegin:", v4);

}

- (void)_activityViewControllerPresentationDidBegin:(id)a3
{
  NSObject *v4;
  _BOOL4 v5;
  const __CFString *v6;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (-[SHSheetPresenter activityViewControllerIsPresenting](self, "activityViewControllerIsPresenting", a3)
    && !-[SHSheetPresenter activityViewControllerPresentationDidBegin](self, "activityViewControllerPresentationDidBegin"))
  {
    -[SHSheetPresenter setActivityViewControllerPresentationDidBegin:](self, "setActivityViewControllerPresentationDidBegin:", 1);
    if (-[SHSheetPresenter useRemoteUIService](self, "useRemoteUIService"))
      -[SHSheetPresenter present](self, "present");
    share_sheet_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = -[SHSheetPresenter activityViewControllerIsEmbedded](self, "activityViewControllerIsEmbedded");
      v6 = CFSTR("presented");
      if (v5)
        v6 = CFSTR("embedded");
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_19E419000, v4, OS_LOG_TYPE_DEFAULT, "Share sheet is being %{public}@", (uint8_t *)&v7, 0xCu);
    }

  }
}

- (void)activityViewControllerWillAppear:(id)a3
{
  id v4;
  int v5;

  v4 = a3;
  -[SHSheetPresenter _registerForApplicationStateChangeNotification](self, "_registerForApplicationStateChangeNotification");
  -[SHSheetPresenter _startSessionIfNeeded](self, "_startSessionIfNeeded");
  v5 = objc_msgSend(v4, "allowsEmbedding");

  if (v5)
  {
    if (!-[SHSheetPresenter activityViewControllerPresentationDidBegin](self, "activityViewControllerPresentationDidBegin"))-[SHSheetPresenter setActivityViewControllerIsPresenting:](self, "setActivityViewControllerIsPresenting:", 1);
  }
}

- (void)activityViewControllerDidAppear:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  const char *v19;
  uint8_t *v20;
  void (**v21)(_QWORD);
  void *v22;
  void *v23;
  void *v24;
  char v25;
  uint64_t v26;
  __int16 v27;

  v4 = a3;
  -[SHSheetPresenter router](self, "router");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rootViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentingViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SHSheetPresenter router](self, "router");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isPresentedWithinPopover");

  -[SHSheetPresenter session](self, "session");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "allowsEmbedding") & 1) != 0 || v7 || (v9 & 1) != 0)
    goto LABEL_8;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.facetime")))
  {
LABEL_7:

LABEL_8:
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.Maps")) & 1) != 0)
  {

    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "bundleIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("com.apple.mobilecal"));

  if ((v25 & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("UIActivityViewController can only be used modally or as contentViewController in popover on iPad."));
LABEL_9:
  if (!-[SHSheetPresenter activityViewControllerIsPresenting](self, "activityViewControllerIsPresenting"))
    goto LABEL_19;
  v15 = objc_msgSend(v4, "allowsEmbedding");
  share_sheet_log();
  v16 = objc_claimAutoreleasedReturnValue();
  share_sheet_log();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = os_signpost_id_make_with_pointer(v17, v4);

  if (v15)
  {
    if (v18 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v16))
      goto LABEL_18;
    v27 = 0;
    v19 = "PresentShareSheetEmbedded";
    v20 = (uint8_t *)&v27;
  }
  else
  {
    if (v18 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v16))
      goto LABEL_18;
    LOWORD(v26) = 0;
    v19 = " enableTelemetry=YES ";
    v20 = (uint8_t *)&v26;
  }
  _os_signpost_emit_with_name_impl(&dword_19E419000, v16, OS_SIGNPOST_INTERVAL_END, v18, "PresentShareSheet", v19, v20, 2u);
LABEL_18:

LABEL_19:
  -[SHSheetPresenter setActivityViewControllerIsPresenting:](self, "setActivityViewControllerIsPresenting:", 0, v26);
  -[SHSheetPresenter presentationDelayedTestingBlock](self, "presentationDelayedTestingBlock");
  v21 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
  -[SHSheetPresenter setPresentationDelayedTestingBlock:](self, "setPresentationDelayedTestingBlock:", 0);
  if (v21)
    v21[2](v21);
  -[SHSheetPresenter interactor](self, "interactor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "activityViewControllerDidAppear");

}

- (void)activityViewControllerWillDisappear:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int IsCamera;
  int IsSupportedPrintActivity;
  void *v13;
  id v14;

  -[SHSheetPresenter router](self, "router", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rootViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isBeingDismissed");

  if (v6)
  {
    -[SHSheetPresenter interactor](self, "interactor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "activityPerformer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "activity");
    v14 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "userInterfaceIdiom");

    IsCamera = _ShareSheetIsCamera();
    IsSupportedPrintActivity = _ShareSheetIsSupportedPrintActivity(v14);
    if (!v10 && IsCamera)
    {
      if (IsSupportedPrintActivity)
      {
        objc_msgSend(MEMORY[0x1E0D80C28], "sharedPrintController");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "dismissAnimated:", 0);

      }
    }

  }
}

- (void)activityViewControllerDidDisappear:(id)a3
{
  id v4;

  -[SHSheetPresenter _unregisterForApplicationStateChangeNotification](self, "_unregisterForApplicationStateChangeNotification", a3);
  -[SHSheetPresenter setDidRequestDismissal:](self, "setDidRequestDismissal:", 0);
  -[SHSheetPresenter setDidReceiveInitialConfiguration:](self, "setDidReceiveInitialConfiguration:", 0);
  -[SHSheetPresenter interactor](self, "interactor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activityViewControllerDidDisappear");

}

- (void)activityViewControllerSizeWillChange:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  id v12;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  -[SHSheetPresenter interactor](self, "interactor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activityViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "customViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && v5 != 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "orientation") - 1;

    if (v11 <= 1)
    {
      -[SHSheetPresenter router](self, "router");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dismissSecondaryViewControllerAnimated:", 0);

    }
  }
}

- (void)activityViewController:(id)a3 traitCollectionDidChange:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a4;
  if (-[SHSheetPresenter didRequestInitialConfiguration](self, "didRequestInitialConfiguration")
    || -[SHSheetPresenter didReceiveInitialConfiguration](self, "didReceiveInitialConfiguration"))
  {
    -[SHSheetPresenter router](self, "router");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "rootViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v9, "userInterfaceStyle");
    if (v8 != objc_msgSend(v7, "userInterfaceStyle"))
      -[SHSheetPresenter _updateConfiguration](self, "_updateConfiguration");

  }
}

- (void)activityViewControllerDidResignContentViewControllerOfPopover:(id)a3
{
  void *v4;
  BOOL v5;
  void *v6;
  id v7;

  -[SHSheetPresenter interactor](self, "interactor", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activityPerformer");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (!v7 || (v5 = objc_msgSend(v7, "state") == 1, v6 = v7, v5))
  {
    -[SHSheetPresenter dismiss](self, "dismiss");
    v6 = v7;
  }

}

- (void)prepareViewIfNeeded
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  NSStringFromBOOL();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_19E419000, a2, OS_LOG_TYPE_DEBUG, "Prepare view with Airdrop only:%@", (uint8_t *)&v4, 0xCu);

}

- (void)present
{
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  os_signpost_id_t v11;
  uint8_t v12[16];
  uint8_t v13[16];
  uint8_t buf[16];

  -[SHSheetPresenter session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4
    || -[SHSheetPresenter didRequestInitialConfiguration](self, "didRequestInitialConfiguration")
    || -[SHSheetPresenter didReceiveInitialConfiguration](self, "didReceiveInitialConfiguration"))
  {
    share_sheet_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19E419000, v5, OS_LOG_TYPE_DEFAULT, "Initial configuration was already requested for presentation", buf, 2u);
    }
  }
  else
  {
    share_sheet_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_19E419000, v6, OS_LOG_TYPE_DEFAULT, "Request initial configuration for presentation", v13, 2u);
    }

    -[SHSheetPresenter setDidRequestInitialConfiguration:](self, "setDidRequestInitialConfiguration:", 1);
    share_sheet_log();
    v7 = objc_claimAutoreleasedReturnValue();
    share_sheet_log();
    v8 = objc_claimAutoreleasedReturnValue();
    -[SHSheetPresenter session](self, "session");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "activityViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = os_signpost_id_make_with_pointer(v8, v10);

    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      *(_WORD *)v12 = 0;
      _os_signpost_emit_with_name_impl(&dword_19E419000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v11, "SendInitialConfiguration", (const char *)&unk_19E4D535F, v12, 2u);
    }

    -[SHSheetPresenter interactor](self, "interactor");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject requestServiceUpdate](v5, "requestServiceUpdate");
  }

}

- (void)prepareNonUIShareSheet
{
  -[SHSheetPresenter setIsPresentingNonUIShareSheet:](self, "setIsPresentingNonUIShareSheet:", 1);
  -[SHSheetPresenter prepareViewIfNeeded](self, "prepareViewIfNeeded");
  -[SHSheetPresenter present](self, "present");
}

- (void)performActivity:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SHSheetPresenter interactor](self, "interactor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performActivity:", v4);

}

- (void)dismiss
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  void *v13;
  uint8_t v14[16];
  uint8_t buf[16];

  share_sheet_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19E419000, v3, OS_LOG_TYPE_DEFAULT, "Request to dismiss Share Sheet", buf, 2u);
  }

  -[SHSheetPresenter mainViewController](self, "mainViewController");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_11;
  v5 = (void *)v4;
  -[SHSheetPresenter mainViewController](self, "mainViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "window");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[SHSheetPresenter mainViewController](self, "mainViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isBeingDismissed");

    if ((v11 & 1) == 0)
    {
LABEL_11:
      -[SHSheetPresenter setDidRequestDismissal:](self, "setDidRequestDismissal:", 1);
      -[SHSheetPresenter interactor](self, "interactor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "activityPerformer");
      v12 = objc_claimAutoreleasedReturnValue();

      if (-[NSObject isRunning](v12, "isRunning"))
        -[NSObject cancel](v12, "cancel");
      else
        -[SHSheetPresenter _dismiss](self, "_dismiss");
      goto LABEL_14;
    }
  }
  else
  {

  }
  if (!-[SHSheetPresenter isReportingActivityResult](self, "isReportingActivityResult"))
    goto LABEL_11;
  share_sheet_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_19E419000, v12, OS_LOG_TYPE_DEFAULT, "Share Sheet is already dismissed or is currently dismissing, AND it is currently reporting its activity result.", v14, 2u);
  }
LABEL_14:

}

- (void)_dismiss
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[SHSheetPresenter setIsReportingActivityResult:](self, "setIsReportingActivityResult:", 1);
  -[SHSheetPresenter activityResult](self, "activityResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetPresenter setActivityResult:](self, "setActivityResult:", 0);
  share_sheet_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v3;
    _os_log_impl(&dword_19E419000, v4, OS_LOG_TYPE_DEFAULT, "Report Activity for result:%@", buf, 0xCu);
  }

  -[SHSheetPresenter delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mainPresenter:willCompleteActivity:withSuccess:", self, v6, objc_msgSend(v3, "completedState") == 5);

  -[SHSheetPresenter router](self, "router");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SHSheetPresenter isPresentingNonUIShareSheet](self, "isPresentingNonUIShareSheet") ^ 1;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __28__SHSheetPresenter__dismiss__block_invoke;
  v10[3] = &unk_1E4002C78;
  v10[4] = self;
  v11 = v3;
  v9 = v3;
  objc_msgSend(v7, "dismissForActivityPerformerResult:didPresentFromShareSheet:completionHandler:", v9, v8, v10);

}

void __28__SHSheetPresenter__dismiss__block_invoke(uint64_t a1, int a2)
{
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_didCompleteActivityWithResult:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setIsReportingActivityResult:", 0);
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "interactor");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stopSession");

  }
}

- (void)_completeInitialConfigurationUpdate
{
  NSObject *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  uint8_t buf[16];

  share_sheet_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19E419000, v3, OS_LOG_TYPE_DEFAULT, "Initial configuration update received", buf, 2u);
  }

  -[SHSheetPresenter setDidReceiveInitialConfiguration:](self, "setDidReceiveInitialConfiguration:", 1);
  if (!-[SHSheetPresenter useRemoteUIService](self, "useRemoteUIService"))
  {
    -[SHSheetPresenter delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mainPresenterIsReadyToInteract:", self);

  }
  if (-[SHSheetPresenter activityViewControllerPresentationDidBegin](self, "activityViewControllerPresentationDidBegin"))
  {
    v5 = (void *)*MEMORY[0x1E0DC4730];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __55__SHSheetPresenter__completeInitialConfigurationUpdate__block_invoke;
    v6[3] = &unk_1E4001608;
    v6[4] = self;
    objc_msgSend(v5, "_performBlockAfterCATransactionCommits:", v6);
  }
}

void __55__SHSheetPresenter__completeInitialConfigurationUpdate__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "interactor");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "preheatActivitiesIfNeeded");

}

- (void)_didCompleteActivityWithResult:(id)a3
{
  id v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "completedState") == 5;
  -[SHSheetPresenter delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "returnedItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mainPresenter:didCompleteActivity:withSuccess:returnedItems:error:", self, v7, v5, v8, v9);

  -[SHSheetPresenter interactor](self, "interactor");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "clearActivityForResult:", v4);

}

- (void)_registerForApplicationStateChangeNotification
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__didEnterBackground_, *MEMORY[0x1E0DC4768], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__willEnterForeground_, *MEMORY[0x1E0DC4860], 0);

}

- (void)_unregisterForApplicationStateChangeNotification
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4768], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4860], 0);

}

- (void)_didEnterBackground:(id)a3
{
  id v3;

  -[SHSheetPresenter interactor](self, "interactor", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applicationDidEnterBackground");

}

- (void)_willEnterForeground:(id)a3
{
  void *v4;
  id v5;

  -[SHSheetPresenter interactor](self, "interactor", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicationWillEnterForeground");

  -[SHSheetPresenter mainViewController](self, "mainViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadContent");

}

- (void)interactorDidUpdateSessionConfiguration:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  share_sheet_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_19E419000, v4, OS_LOG_TYPE_DEFAULT, "received configuration update", v5, 2u);
  }

  -[SHSheetPresenter _updateContentView:](self, "_updateContentView:", 0);
  if (-[SHSheetPresenter didRequestInitialConfiguration](self, "didRequestInitialConfiguration"))
  {
    -[SHSheetPresenter setDidRequestInitialConfiguration:](self, "setDidRequestInitialConfiguration:", 0);
    -[SHSheetPresenter _completeInitialConfigurationUpdate](self, "_completeInitialConfigurationUpdate");
  }
}

- (void)interactorDidUpdateObjectManipulationSupport:(id)a3
{
  -[SHSheetPresenter _updateContentView:](self, "_updateContentView:", 0);
}

- (void)interactorDidUpdateHeaderMetadata:(id)a3
{
  -[SHSheetPresenter _updateContentView:](self, "_updateContentView:", 0);
}

- (void)interactorDidUpdateCollaborationDetails:(id)a3
{
  -[SHSheetPresenter _updateContentView:](self, "_updateContentView:", 0);
}

- (void)_updateContentView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  SHSheetViewModel *v10;
  SHSheetViewModel *v11;
  NSObject *v12;
  SHSheetViewModel *v13;
  void *v14;
  id v15;
  NSObject *v16;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (v4
    || (-[SHSheetPresenter secondaryViewController](self, "secondaryViewController"),
        (v4 = (id)objc_claimAutoreleasedReturnValue()) != 0)
    || (-[SHSheetPresenter mainViewController](self, "mainViewController"),
        (v4 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    if (-[SHSheetPresenter useRemoteUIService](self, "useRemoteUIService")
      || (-[SHSheetPresenter session](self, "session"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v5, "configuration"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v6,
          v5,
          v6))
    {
      -[SHSheetPresenter session](self, "session");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "configuration");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "shouldBlockPresentation");

      -[SHSheetPresenter router](self, "router");
      v10 = (SHSheetViewModel *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v9)
      {
        -[SHSheetViewModel presentPresentationBlockingViewController](v10, "presentPresentationBlockingViewController");
      }
      else
      {
        -[SHSheetViewModel dismissPresentationBlockingViewControllerIfNeeded](v10, "dismissPresentationBlockingViewControllerIfNeeded");

        share_sheet_log();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v17 = 138412290;
          v18 = v4;
          _os_log_impl(&dword_19E419000, v12, OS_LOG_TYPE_DEFAULT, "Update content view:%@", (uint8_t *)&v17, 0xCu);
        }

        v13 = [SHSheetViewModel alloc];
        -[SHSheetPresenter session](self, "session");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[SHSheetViewModel initWithSession:](v13, "initWithSession:", v14);

        -[SHSheetPresenter secondaryViewController](self, "secondaryViewController");
        v15 = (id)objc_claimAutoreleasedReturnValue();

        if (v4 == v15)
          -[SHSheetViewModel setCustomViewController:](v11, "setCustomViewController:", 0);
        objc_msgSend(v4, "updateWithViewModel:", v11);
      }

    }
  }
  else
  {
    share_sheet_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_19E419000, v16, OS_LOG_TYPE_DEFAULT, "No content view to update", (uint8_t *)&v17, 2u);
    }

    v4 = 0;
  }

}

- (void)_presentAirDropCollaborationUnsupportedAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  SFLocalizedStringForKey();
  v9 = (id)objc_claimAutoreleasedReturnValue();
  SFLocalizedStringForKey();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v9, v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0DC3448];
  SFLocalizedStringForKey();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionWithTitle:style:handler:", v6, 1, &__block_literal_global_24);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addAction:", v7);

  -[SHSheetPresenter router](self, "router");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "presentAlertController:", v4);

}

- (void)interactor:(id)a3 willPerformActivity:(id)a4
{
  id v4;

  -[SHSheetPresenter router](self, "router", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissUserDefaultsViewControllerAnimated:", 1);

}

- (void)interactor:(id)a3 didPerformActivityWithResult:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  _BOOL4 v10;
  _BOOL4 v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  share_sheet_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v5;
    _os_log_impl(&dword_19E419000, v6, OS_LOG_TYPE_DEFAULT, "did perform activity with result:%@", (uint8_t *)&v12, 0xCu);
  }

  -[SHSheetPresenter setActivityResult:](self, "setActivityResult:", v5);
  objc_msgSend(v5, "activity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activityType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.UIKit.activity.AirDrop"));

  v10 = -[SHSheetPresenter _shouldCompleteAirdropActivity](self, "_shouldCompleteAirdropActivity");
  if (v9 && (v11 = v10, !-[SHSheetPresenter didRequestDismissal](self, "didRequestDismissal")))
  {
    if (v11)
      -[SHSheetPresenter _didCompleteActivityWithResult:](self, "_didCompleteActivityWithResult:", v5);
  }
  else
  {
    -[SHSheetPresenter _dismiss](self, "_dismiss");
  }

}

- (id)interactor:(id)a3 activityPresentationControllerForActivity:(id)a4
{
  void *v4;
  void *v5;

  -[SHSheetPresenter router](self, "router", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activityPresentationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)interactor:(id)a3 didPerformUserDefaultsActivityWithContext:(id)a4
{
  void *v5;
  id v6;

  +[SHSheetFactory createUserDefaultsViewControllerWithContext:delegate:](SHSheetFactory, "createUserDefaultsViewControllerWithContext:delegate:", a4, self);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SHSheetPresenter setUserDefaultsViewController:](self, "setUserDefaultsViewController:", v6);
  -[SHSheetPresenter router](self, "router");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentUserDefaultsViewController:", v6);

}

- (void)interactor:(id)a3 didPerformAirdropViewActivityWithNoContentView:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  id v8;

  v4 = a4;
  -[SHSheetPresenter router](self, "router", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dismissUserDefaultsViewControllerAnimated:", 1);

  +[SHSheetFactory createAirdropViewControllerWithNoContentView:delegate:](SHSheetFactory, "createAirdropViewControllerWithNoContentView:delegate:", v4, self);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[SHSheetPresenter setAirdropViewController:](self, "setAirdropViewController:", v8);
  -[SHSheetPresenter router](self, "router");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentAirdropViewController:", v8);

}

- (void)interactorDidFailPerformActivityNotCollaborationEligible:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(a3, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collaborationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "type"))
  {
    share_sheet_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SHSheetPresenter interactorDidFailPerformActivityNotCollaborationEligible:].cold.1((uint64_t)v5, v6);

    v7 = &stru_1E4004990;
  }
  else
  {
    objc_msgSend(v5, "fileURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLByDeletingPathExtension");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastPathComponent");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  -[SHSheetPresenter router](self, "router");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  SHSheetCollaborativeItemNotSupportedAlertController(v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "presentAlertController:", v11);

}

- (void)interactor:(id)a3 didUpdateAirDropTransferWithChange:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  char v14;
  void *v15;
  uint8_t v16[16];

  v5 = a4;
  -[SHSheetPresenter interactor](self, "interactor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activityPerformer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "activity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "activityType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.UIKit.activity.AirDrop"));

  v11 = objc_msgSend(v5, "state");
  objc_msgSend(v5, "proxyIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12 && v11 == 7)
  {
    share_sheet_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_19E419000, v13, OS_LOG_TYPE_DEFAULT, "Collaborate via AirDrop is unsupported on iOS, using the Boop to Collaborate path instead", v16, 2u);
    }
    goto LABEL_19;
  }
  if (v7)
    v14 = v10;
  else
    v14 = 0;
  if ((v14 & 1) == 0)
  {
    share_sheet_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[SHSheetPresenter interactor:didUpdateAirDropTransferWithChange:].cold.1(v11, v7, v13);
    goto LABEL_19;
  }
  if ((unint64_t)(v11 - 4) >= 3)
  {
    if (v11 != 2)
      goto LABEL_17;
    -[SHSheetPresenter airdropViewController](self, "airdropViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSheetPresenter airDropViewControllerDidStartTransfer:](self, "airDropViewControllerDidStartTransfer:", v15);
  }
  else
  {
    -[SHSheetPresenter _finishAirdropActivityPerformer:withSuccess:](self, "_finishAirdropActivityPerformer:withSuccess:", v7, 1);
    if (v11 != 4)
      goto LABEL_17;
    -[SHSheetPresenter airdropViewController](self, "airdropViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSheetPresenter airDropViewController:didFinishTransferWithSuccess:](self, "airDropViewController:didFinishTransferWithSuccess:", v15, 1);
  }

LABEL_17:
  if (v12)
  {
    -[SHSheetPresenter mainViewController](self, "mainViewController");
    v13 = objc_claimAutoreleasedReturnValue();
    -[NSObject didUpdateAirDropTransferWithChange:](v13, "didUpdateAirDropTransferWithChange:", v5);
LABEL_19:

  }
}

- (id)interactor:(id)a3 linkMetadataForActivity:(id)a4
{
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[SHSheetPresenter session](self, "session", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activityItemsManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "linkMetadataValuesNeedsUpdate");

  if ((v7 & 1) != 0
    || (-[SHSheetPresenter mainViewController](self, "mainViewController"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "headerMetadata"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        !v9))
  {
    -[SHSheetPresenter session](self, "session");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "metadataCollection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "metadatas");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (void)interactor:(id)a3 airDropViewServiceWillStartTransferToRecipient:(id)a4
{
  SFAirDropViewController **p_airdropViewController;
  id v6;
  id WeakRetained;

  p_airdropViewController = &self->_airdropViewController;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_airdropViewController);
  -[SHSheetPresenter airDropViewServiceWillStartTransfer:toRecipient:](self, "airDropViewServiceWillStartTransfer:toRecipient:", WeakRetained, v6);

}

- (void)interactor:(id)a3 didChangeMetadata:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  -[SHSheetPresenter mainViewController](self, "mainViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reloadMetadata:", v5);

  -[SHSheetPresenter secondaryViewController](self, "secondaryViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reloadMetadata:", v5);

}

- (void)interactor:(id)a3 showingModeRestriction:(id)a4 continueHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v7 = a5;
  v8 = a4;
  -[SHSheetPresenter router](self, "router");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[SHSheetPresenter interactor](self, "interactor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "session");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "activityViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  SHSheetModeRestrictionAlertController(v8, v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "presentAlertController:", v12);
}

- (void)addParticipantsViewController:(id)a3 failedToSaveShareWithError:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v5 = (objc_class *)MEMORY[0x1E0D97408];
  v6 = a4;
  v7 = [v5 alloc];
  -[SHSheetPresenter collaborationItemIdentifier](self, "collaborationItemIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v7, "initWithCollaborationItemIdentifier:sharingURL:share:error:mailResult:", v8, 0, 0, v6, 0);

  -[SHSheetPresenter _didCompleteCollaborationSharingURLCreationWithResult:](self, "_didCompleteCollaborationSharingURLCreationWithResult:", v9);
}

- (void)addParticipantsViewController:(id)a3 completedSharingWithShareURL:(id)a4 ckShare:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v7 = (objc_class *)MEMORY[0x1E0D97408];
  v8 = a5;
  v9 = a4;
  v10 = [v7 alloc];
  -[SHSheetPresenter collaborationItemIdentifier](self, "collaborationItemIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v10, "initWithCollaborationItemIdentifier:sharingURL:share:error:mailResult:", v11, v9, v8, 0, 0);

  -[SHSheetPresenter _didCompleteCollaborationSharingURLCreationWithResult:](self, "_didCompleteCollaborationSharingURLCreationWithResult:", v12);
}

- (void)collaborationParticipantsViewController:(id)a3 didCreateURL:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v7 = a5;
  v8 = a4;
  -[SHSheetPresenter router](self, "router");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dismissCollaborationParticipantsViewController");

  v10 = objc_alloc(MEMORY[0x1E0D973F8]);
  objc_msgSend(v8, "absoluteString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v10, "initWithSubject:body:containerID:canEdit:allowOthersToInvite:error:", 0, v11, 0, 0, 0, v7);

  v12 = objc_alloc(MEMORY[0x1E0D97408]);
  -[SHSheetPresenter collaborationItemIdentifier](self, "collaborationItemIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithCollaborationItemIdentifier:sharingURL:share:error:mailResult:", v13, v8, 0, v7, v15);

  -[SHSheetPresenter _didCompleteCollaborationSharingURLCreationWithResult:](self, "_didCompleteCollaborationSharingURLCreationWithResult:", v14);
}

- (void)presentCollaborationParticipantsViewControllerForCloudSharingRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  id v25;
  id location;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  -[SHSheetPresenter session](self, "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "activityViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "collaborationDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "activityViewController:collaborationParticipantsViewControllerWithDelegate:", v9, self);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
    v14 = 0;
  }
  else
  {
    +[SHSheetCollaborationParticipantsContext defaultContext](SHSheetCollaborationParticipantsContext, "defaultContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[SHSheetFactory createCollaborationParticipantsViewControllerWithContext:request:delegate:](SHSheetFactory, "createCollaborationParticipantsViewControllerWithContext:request:delegate:", v14, v6, self);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.sharesheet.addParticipantViewController"), 42, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_alloc(MEMORY[0x1E0D97408]);
      objc_msgSend(v6, "collaborationItemIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v18, "initWithCollaborationItemIdentifier:sharingURL:share:error:mailResult:", v19, 0, 0, v17, 0);

      v7[2](v7, v20);
      goto LABEL_6;
    }
    v13 = (id)v15;
  }
  location = 0;
  objc_initWeak(&location, self);
  -[SHSheetPresenter router](self, "router");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __107__SHSheetPresenter_presentCollaborationParticipantsViewControllerForCloudSharingRequest_completionHandler___block_invoke;
  v24 = &unk_1E40016A0;
  objc_copyWeak(&v25, &location);
  objc_msgSend(v16, "presentCollaborationParticipantsViewController:dismissalHandler:", v13, &v21);

  -[SHSheetPresenter setCollaborationParticipantsViewController:](self, "setCollaborationParticipantsViewController:", v13, v21, v22, v23, v24);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

LABEL_6:
}

void __107__SHSheetPresenter_presentCollaborationParticipantsViewControllerForCloudSharingRequest_completionHandler___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "collaborationItemIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
  {
    v2 = objc_alloc(MEMORY[0x1E0D97408]);
    objc_msgSend(WeakRetained, "collaborationItemIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v2, "initWithCollaborationItemIdentifier:sharingURL:share:error:mailResult:", v3, 0, 0, 0, 0);

    objc_msgSend(WeakRetained, "_didCompleteCollaborationSharingURLCreationWithResult:", v4);
  }

}

- (id)collaborationParticipantsPresenter
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  SHSheetPresenter *v12;

  -[SHSheetPresenter session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activityViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "collaborationDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activityViewController:collaborationParticipantsViewControllerWithDelegate:", v4, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetPresenter session](self, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "useRemoteUIService") || (_ShareSheetPlatformWantsRemoteOptions() & 1) == 0)
  {

LABEL_7:
    v12 = self;
    goto LABEL_8;
  }
  -[SHSheetPresenter session](self, "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteScene");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "conformsToProtocol:", &unk_1EE52A9F0);

  if (!v10 || v6)
    goto LABEL_7;
  -[SHSheetPresenter session](self, "session");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "remoteScene");
  v12 = (SHSheetPresenter *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v12;
}

- (void)_didCompleteCollaborationSharingURLCreationWithResult:(id)a3
{
  id v4;
  void (**v5)(id, id);

  v4 = a3;
  -[SHSheetPresenter collaborationCreateSharingURLCompletionHandler](self, "collaborationCreateSharingURLCompletionHandler");
  v5 = (void (**)(id, id))objc_claimAutoreleasedReturnValue();
  -[SHSheetPresenter setCollaborationCreateSharingURLCompletionHandler:](self, "setCollaborationCreateSharingURLCompletionHandler:", 0);
  -[SHSheetPresenter setCollaborationItemIdentifier:](self, "setCollaborationItemIdentifier:", 0);
  -[SHSheetPresenter setCollaborationParticipantsViewController:](self, "setCollaborationParticipantsViewController:", 0);
  v5[2](v5, v4);

}

- (void)interactor:(id)a3 createSharingURLWithParticipantsForCollaborationRequest:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SHSheetPresenter collaborationParticipantsPresenter](self, "collaborationParticipantsPresenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  location = 0;
  objc_initWeak(&location, self);
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __105__SHSheetPresenter_interactor_createSharingURLWithParticipantsForCollaborationRequest_completionHandler___block_invoke;
  v16 = &unk_1E4002CA0;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v11, "presentCollaborationParticipantsViewControllerForCloudSharingRequest:completionHandler:", v9, &v13);
  -[SHSheetPresenter setCollaborationCreateSharingURLCompletionHandler:](self, "setCollaborationCreateSharingURLCompletionHandler:", v10, v13, v14, v15, v16);
  objc_msgSend(v9, "collaborationItemIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetPresenter setCollaborationItemIdentifier:](self, "setCollaborationItemIdentifier:", v12);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __105__SHSheetPresenter_interactor_createSharingURLWithParticipantsForCollaborationRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_didCompleteCollaborationSharingURLCreationWithResult:", v3);

}

- (void)interactor:(id)a3 creatingCollaborationForActivity:(id)a4
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  objc_msgSend(v11, "activityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", CFSTR("com.apple.UIKit.activity.Mail")))
  {

LABEL_4:
    _ShareSheetBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("WAITING_TEXT"), CFSTR("Waiting…"), CFSTR("Localizable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[SHSheetPresenter mainViewController](self, "mainViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "startPulsingActivity:localizedTitle:", v11, v9);

    goto LABEL_5;
  }
  objc_msgSend(v11, "activityType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", CFSTR("com.apple.UIKit.activity.CollaborationInviteWithLink"));

  if (v7)
    goto LABEL_4;
LABEL_5:

}

- (void)interactor:(id)a3 didCreateCollaborationForActivity:(id)a4
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;

  v9 = a4;
  objc_msgSend(v9, "activityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", CFSTR("com.apple.UIKit.activity.Mail")))
  {

LABEL_4:
    -[SHSheetPresenter mainViewController](self, "mainViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stopPulsingActivity:", v9);

    goto LABEL_5;
  }
  objc_msgSend(v9, "activityType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", CFSTR("com.apple.UIKit.activity.CollaborationInviteWithLink"));

  if (v7)
    goto LABEL_4;
LABEL_5:

}

- (void)interactor:(id)a3 didFailCreatingCollaborationForActivity:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id location;
  id v23;
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v23 = 0;
  v24 = 0;
  objc_msgSend(MEMORY[0x1E0D97420], "getFailureTitle:message:error:", &v24, &v23, v10);
  v11 = v24;
  v12 = v23;
  location = 0;
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v11, v12, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0DC3448];
  SFLocalizedStringForKey();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __77__SHSheetPresenter_interactor_didFailCreatingCollaborationForActivity_error___block_invoke;
  v19[3] = &unk_1E4002CC8;
  v16 = v10;
  v20 = v16;
  objc_copyWeak(&v21, &location);
  objc_msgSend(v14, "actionWithTitle:style:handler:", v15, 1, v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAction:", v17);

  -[SHSheetPresenter router](self, "router");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "presentAlertController:", v13);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

void __77__SHSheetPresenter_interactor_didFailCreatingCollaborationForActivity_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  BOOL v3;
  id WeakRetained;
  uint64_t v5;

  v2 = *(_QWORD *)(a1 + 32);
  v5 = 0;
  if (objc_msgSend(MEMORY[0x1E0D97420], "isOplockError:updatedShare:", v2, &v5))
    v3 = v5 == 0;
  else
    v3 = 0;
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "dismiss");

  }
}

- (void)interactor:(id)a3 didCancelCollaborationForActivity:(id)a4
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;

  v9 = a4;
  objc_msgSend(v9, "activityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", CFSTR("com.apple.UIKit.activity.Mail")))
  {

LABEL_4:
    -[SHSheetPresenter mainViewController](self, "mainViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stopPulsingActivity:", v9);

    goto LABEL_5;
  }
  objc_msgSend(v9, "activityType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", CFSTR("com.apple.UIKit.activity.CollaborationInviteWithLink"));

  if (v7)
    goto LABEL_4;
LABEL_5:

}

- (void)interactor:(id)a3 canShareFolderContainingExistingSharedItemsWithCompletionHandler:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;

  v4 = a4;
  _ShareSheetBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("FOLDER_SHARED_SUBITEMS_TITLE"), CFSTR("Are you sure you want to share this folder?"), CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  _ShareSheetBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("FOLDER_SHARED_SUBITEMS_MESSAGE"), CFSTR("This folder includes items that are already shared. If you share this folder, only people you add to it will be able to access items inside it."), CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  _ShareSheetBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("FOLDER_SHARED_SUBITEMS_SHARE_ANYWAY"), CFSTR("Share Anyway"), CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  _ShareSheetBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Cancel"), CFSTR("Cancel"), CFSTR("Localizable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v6, v8, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0DC3448];
  v15 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __96__SHSheetPresenter_interactor_canShareFolderContainingExistingSharedItemsWithCompletionHandler___block_invoke;
  v25[3] = &unk_1E40012D0;
  v16 = v4;
  v26 = v16;
  objc_msgSend(v14, "actionWithTitle:style:handler:", v10, 0, v25);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAction:", v17);

  v18 = (void *)MEMORY[0x1E0DC3448];
  v23[0] = v15;
  v23[1] = 3221225472;
  v23[2] = __96__SHSheetPresenter_interactor_canShareFolderContainingExistingSharedItemsWithCompletionHandler___block_invoke_2;
  v23[3] = &unk_1E40012D0;
  v24 = v16;
  v19 = v16;
  objc_msgSend(v18, "actionWithTitle:style:handler:", v12, 1, v23);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAction:", v20);

  -[SHSheetPresenter mainViewController](self, "mainViewController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "presentViewController:animated:completion:", v13, 1, 0);

}

uint64_t __96__SHSheetPresenter_interactor_canShareFolderContainingExistingSharedItemsWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __96__SHSheetPresenter_interactor_canShareFolderContainingExistingSharedItemsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)interactor:(id)a3 canManageShareForDocumentInSharedFolderWithCompletionHandler:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;

  v4 = a4;
  _ShareSheetBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("DOCUMENT_IN_SHARED_FOLDER_TITLE"), CFSTR("Add People to Shared Folder"), CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  _ShareSheetBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("DOCUMENT_IN_SHARED_FOLDER_MESSAGE"), CFSTR("Add new participants to the shared folder to collaborate on this document."), CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  _ShareSheetBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Manage Shared Folder"), CFSTR("Manage Shared Folder"), CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  _ShareSheetBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Cancel"), CFSTR("Cancel"), CFSTR("Localizable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v6, v8, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0DC3448];
  v15 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __92__SHSheetPresenter_interactor_canManageShareForDocumentInSharedFolderWithCompletionHandler___block_invoke;
  v25[3] = &unk_1E40012D0;
  v16 = v4;
  v26 = v16;
  objc_msgSend(v14, "actionWithTitle:style:handler:", v10, 0, v25);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAction:", v17);

  v18 = (void *)MEMORY[0x1E0DC3448];
  v23[0] = v15;
  v23[1] = 3221225472;
  v23[2] = __92__SHSheetPresenter_interactor_canManageShareForDocumentInSharedFolderWithCompletionHandler___block_invoke_2;
  v23[3] = &unk_1E40012D0;
  v24 = v16;
  v19 = v16;
  objc_msgSend(v18, "actionWithTitle:style:handler:", v12, 1, v23);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAction:", v20);

  -[SHSheetPresenter mainViewController](self, "mainViewController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "presentViewController:animated:completion:", v13, 1, 0);

}

uint64_t __92__SHSheetPresenter_interactor_canManageShareForDocumentInSharedFolderWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __92__SHSheetPresenter_interactor_canManageShareForDocumentInSharedFolderWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)performPeopleSuggestionProxy:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  share_sheet_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412290;
    v13 = v6;
    _os_log_impl(&dword_19E419000, v5, OS_LOG_TYPE_DEFAULT, "Perform people suggestion:%@", (uint8_t *)&v12, 0xCu);

  }
  if (objc_msgSend(v4, "isDisabled"))
  {
    -[SHSheetPresenter _showScreenTimeRestrictedAlert](self, "_showScreenTimeRestrictedAlert");
  }
  else
  {
    objc_msgSend(v4, "peopleSuggestion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSheetPresenter interactor](self, "interactor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "session");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCurrentPeopleSuggestion:", v7);

    -[SHSheetPresenter interactor](self, "interactor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "performPersonSuggestionWithIdentifier:", v11);

  }
}

- (void)removePeopleSuggestionProxy:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  share_sheet_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_19E419000, v5, OS_LOG_TYPE_DEFAULT, "Remove people suggestion:%@", (uint8_t *)&v9, 0xCu);

  }
  -[SHSheetPresenter interactor](self, "interactor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removePersonSuggestionWithIdentifier:", v8);

}

- (void)performShareActivityProxy:(id)a3
{
  -[SHSheetPresenter performShareActivityProxy:activityIdentifier:](self, "performShareActivityProxy:activityIdentifier:", a3, 0);
}

- (void)performShareActivityProxy:(id)a3 activityIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  share_sheet_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412546;
    v17 = v9;
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_19E419000, v8, OS_LOG_TYPE_DEFAULT, "Perform share activity:%@ activityIdentifier:%@", (uint8_t *)&v16, 0x16u);

  }
  if (objc_msgSend(v6, "isDisabled"))
  {
    -[SHSheetPresenter _showScreenTimeRestrictedAlert](self, "_showScreenTimeRestrictedAlert");
  }
  else
  {
    if (!v7)
    {
      objc_msgSend(v6, "identifier");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    -[SHSheetPresenter interactor](self, "interactor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "performShareActivityWithIdentifier:", v7);

    -[SHSheetPresenter interactor](self, "interactor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "session");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "activitiesManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "activityForIdentifier:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "activityType");
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v15 == CFSTR("com.apple.UIKit.activity.Share"))
      -[SHSheetPresenter _expandSharingContentView](self, "_expandSharingContentView");

  }
}

- (void)performActionActivityProxy:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  share_sheet_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412290;
    v16 = v6;
    _os_log_impl(&dword_19E419000, v5, OS_LOG_TYPE_DEFAULT, "Perform action activity:%@", (uint8_t *)&v15, 0xCu);

  }
  if (objc_msgSend(v4, "isDisabled"))
  {
    -[SHSheetPresenter _showScreenTimeRestrictedAlert](self, "_showScreenTimeRestrictedAlert");
  }
  else
  {
    -[SHSheetPresenter interactor](self, "interactor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "performActionActivityWithIdentifier:", v8);

    -[SHSheetPresenter interactor](self, "interactor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "session");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "activitiesManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "activityForIdentifier:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "activityType");
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v14 == CFSTR("com.apple.UIKit.activity.Share"))
      -[SHSheetPresenter _expandSharingContentView](self, "_expandSharingContentView");

  }
}

- (void)didLongPressShareActivityWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = a3;
  share_sheet_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_19E419000, v5, OS_LOG_TYPE_DEFAULT, "Long press activity", v7, 2u);
  }

  -[SHSheetPresenter interactor](self, "interactor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "longPressShareActivityWithIdentifier:", v4);

}

- (void)handlePeopleSuggestion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  share_sheet_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_19E419000, v5, OS_LOG_TYPE_DEFAULT, "Handle people suggestion:%@", (uint8_t *)&v7, 0xCu);
  }

  if (objc_msgSend(v4, "isRestricted"))
  {
    -[SHSheetPresenter _showScreenTimeRestrictedAlert](self, "_showScreenTimeRestrictedAlert");
  }
  else
  {
    -[SHSheetPresenter interactor](self, "interactor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "performPeopleSuggestion:", v4);

  }
}

- (void)handleInfoSuggestionPress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v4 = a3;
  _ShareSheetBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("RESTRICTED_ALERT_SCREEN_TIME_DISMISS_BUTTON_TITLE"), CFSTR("Dismiss"), CFSTR("Localizable"));
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v4, 0, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v10, 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v7);

  v8 = v6;
  -[SHSheetPresenter router](self, "router");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "presentAlertController:", v8);

}

- (void)handleActivity:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  share_sheet_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412290;
    v17 = v4;
    _os_log_impl(&dword_19E419000, v5, OS_LOG_TYPE_DEFAULT, "Handle activity:%@", (uint8_t *)&v16, 0xCu);
  }

  -[SHSheetPresenter session](self, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "restrictedActivityTypes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "activityType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v8, "containsObject:", v9);

  if ((_DWORD)v7)
  {
    -[SHSheetPresenter _showScreenTimeRestrictedAlert](self, "_showScreenTimeRestrictedAlert");
  }
  else
  {
    objc_msgSend(v4, "activityType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqual:", CFSTR("com.apple.UIKit.activity.AirDrop"));

    -[SHSheetPresenter interactor](self, "interactor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v11)
    {
      -[SHSheetPresenter interactor:didPerformAirdropViewActivityWithNoContentView:](self, "interactor:didPerformAirdropViewActivityWithNoContentView:", v12, 0);
    }
    else
    {
      objc_msgSend(v12, "session");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "activityViewController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "_performActivity:", v4);

    }
  }

}

- (void)handleOptions
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  SHSheetOptionsViewContext *v8;
  void *v9;
  void *v10;
  SHSheetOptionsViewContext *v11;
  void *v12;
  uint8_t v13[16];

  -[SHSheetPresenter session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsCollaboration");

  if (v4)
  {
    -[SHSheetPresenter handleCollaborationOptions](self, "handleCollaborationOptions");
  }
  else
  {
    share_sheet_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_19E419000, v5, OS_LOG_TYPE_DEFAULT, "Handle options", v13, 2u);
    }

    -[SHSheetPresenter session](self, "session");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "customOptionsViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v8 = [SHSheetOptionsViewContext alloc];
      -[SHSheetPresenter session](self, "session");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "customizationGroups");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[SHSheetOptionsViewContext initWithCustomizationGroups:](v8, "initWithCustomizationGroups:", v10);

      +[SHSheetFactory createOptionsViewControllerWithContext:delegate:](SHSheetFactory, "createOptionsViewControllerWithContext:delegate:", v11, self);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[SHSheetPresenter setOptionsViewController:](self, "setOptionsViewController:", v7);
    -[SHSheetPresenter router](self, "router");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "presentOptionsViewController:dismissalHandler:", v7, 0);

  }
}

- (void)handleCollaborationOptions
{
  OUTLINED_FUNCTION_0_1(&dword_19E419000, a1, a3, "Collaboration Options View Controller is already presented.", a5, a6, a7, a8, 0);
}

uint64_t __46__SHSheetPresenter_handleCollaborationOptions__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setShareOptions:", a2);
}

- (void)didSelectCollaborativeAction
{
  id v2;

  -[SHSheetPresenter interactor](self, "interactor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWantsCollaborativeSession:", 1);

}

- (void)didSelectSendCopyAction
{
  id v2;

  -[SHSheetPresenter interactor](self, "interactor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWantsCollaborativeSession:", 0);

}

- (void)handleCustomHeaderButton
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  UISharePlayActivity *v8;
  uint8_t v9[16];

  share_sheet_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_19E419000, v3, OS_LOG_TYPE_DEFAULT, "Custom header button tapped", v9, 2u);
  }

  -[SHSheetPresenter interactor](self, "interactor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "showSharePlayProminently");

  if (v6)
  {
    -[SHSheetPresenter interactor](self, "interactor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc_init(UISharePlayActivity);
    objc_msgSend(v7, "performActivity:", v8);

  }
}

- (void)handleClose
{
  NSObject *v3;
  uint8_t v4[16];

  share_sheet_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19E419000, v3, OS_LOG_TYPE_DEFAULT, "Handle close", v4, 2u);
  }

  -[SHSheetPresenter dismiss](self, "dismiss");
}

- (void)handleNext
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  share_sheet_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_19E419000, v3, OS_LOG_TYPE_DEFAULT, "Present secondary view", v7, 2u);
  }

  -[SHSheetPresenter session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SHSheetFactory createContentViewControllerWithSession:presenter:](SHSheetFactory, "createContentViewControllerWithSession:presenter:", v4, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SHSheetPresenter setSecondaryViewController:](self, "setSecondaryViewController:", v5);
  -[SHSheetPresenter router](self, "router");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentSecondaryViewController:", v5);

  -[SHSheetPresenter _updateContentView:](self, "_updateContentView:", v5);
}

- (void)handleActionsEdit
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  share_sheet_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_19E419000, v3, OS_LOG_TYPE_DEFAULT, "Handle actions edit", v5, 2u);
  }

  -[SHSheetPresenter interactor](self, "interactor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performEditAction");

}

- (id)customTitleForActivityType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[SHSheetPresenter interactor](self, "interactor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activityViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "_titleForActivity:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_expandSharingContentView
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[SHSheetPresenter session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDidExpand:", 1);

  -[SHSheetPresenter session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activityViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("UIActivityViewControllerSharingExpandedNotification"), v6, 0);

  -[SHSheetPresenter _updateContentView:](self, "_updateContentView:", 0);
}

- (void)_showScreenTimeRestrictedAlert
{
  void *v3;
  id v4;

  +[SHSheetFactory createScreenTimeAlertViewController](SHSheetFactory, "createScreenTimeAlertViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SHSheetPresenter router](self, "router");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentAlertController:", v4);

}

- (void)userDefaultsViewController:(id)a3 didToggleActivityWithIdentifier:(id)a4 activityCategory:(int64_t)a5
{
  id v7;
  id v8;

  v7 = a4;
  -[SHSheetPresenter interactor](self, "interactor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "toggleUserDefaultsActivityWithIdentifier:activityCategory:", v7, a5);

}

- (void)userDefaultsViewController:(id)a3 didFavoriteActivity:(BOOL)a4 withIdentifier:(id)a5 activityCategory:(int64_t)a6
{
  _BOOL8 v7;
  id v9;
  id v10;

  v7 = a4;
  v9 = a5;
  -[SHSheetPresenter interactor](self, "interactor");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "favoriteUserDefaultsActivity:withIdentifier:activityCategory:", v7, v9, a6);

}

- (void)userDefaultsViewController:(id)a3 didUpdateFavoritesProxies:(id)a4 activityCategory:(int64_t)a5
{
  id v7;
  id v8;

  v7 = a4;
  -[SHSheetPresenter interactor](self, "interactor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateUserDefaultsFavorites:activityCategory:", v7, a5);

}

- (void)userDefaultsViewController:(id)a3 didSelectActivityWithIdentifier:(id)a4 activityCategory:(int64_t)a5 disabled:(BOOL)a6
{
  _BOOL4 v6;
  void *v9;
  id v10;

  v6 = a6;
  v10 = a4;
  if (v6)
  {
    -[SHSheetPresenter _showScreenTimeRestrictedAlert](self, "_showScreenTimeRestrictedAlert");
  }
  else
  {
    -[SHSheetPresenter interactor](self, "interactor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "performUserDefaultsActivityWithIdentifier:activityCategory:", v10, a5);

  }
}

- (void)airDropViewControllerDidDismiss:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  SHSheetActivityPerformerResult *v7;
  void *v8;
  void *v9;
  id v10;

  -[SHSheetPresenter interactor](self, "interactor", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activityPerformer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isRunning");

  if (v6)
  {
    -[SHSheetPresenter interactor](self, "interactor");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "activityPerformer");
    v7 = (SHSheetActivityPerformerResult *)objc_claimAutoreleasedReturnValue();
    -[SHSheetPresenter _finishAirdropActivityPerformer:withSuccess:](self, "_finishAirdropActivityPerformer:withSuccess:", v7, 1);
  }
  else
  {
    -[SHSheetPresenter session](self, "session");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "activitiesManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "activityForActivityType:", CFSTR("com.apple.UIKit.activity.AirDrop"));
    v10 = (id)objc_claimAutoreleasedReturnValue();

    v7 = -[SHSheetActivityPerformerResult initWithActivity:completedState:returnedItems:error:]([SHSheetActivityPerformerResult alloc], "initWithActivity:completedState:returnedItems:error:", v10, 5, 0, 0);
    -[SHSheetPresenter setActivityResult:](self, "setActivityResult:", v7);
    if (-[SHSheetPresenter _shouldCompleteAirdropActivity](self, "_shouldCompleteAirdropActivity"))
      -[SHSheetPresenter _didCompleteActivityWithResult:](self, "_didCompleteActivityWithResult:", v7);
  }

}

- (void)airDropViewServiceWillStartTransfer:(id)a3 toRecipient:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char IsSuspicious;
  id v12;

  v12 = a4;
  -[SHSheetPresenter session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activityViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "airDropDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
      goto LABEL_7;
    objc_msgSend(v12, "displayName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "contactIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "activityViewController:willStartAirdropTransferToRecipient:contactIdentifier:", v6, v8, v9);

LABEL_6:
    goto LABEL_7;
  }
  objc_msgSend(v12, "contactIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8
    || (objc_msgSend(v12, "displayName"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        IsSuspicious = SFAirDropDeviceNameIsSuspicious(),
        v10,
        (IsSuspicious & 1) == 0)
    && (objc_msgSend(v12, "displayName"), (v8 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(v7, "activityViewController:willStartAirdropTransferToRecipient:", v6, v8);
    goto LABEL_6;
  }
LABEL_7:

}

- (void)airDropViewControllerDidStartTransfer:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[SHSheetPresenter session](self, "session", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activityViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "airDropDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "activityViewControllerWillStartAirdropTransfer:", v5);

}

- (void)airDropViewController:(id)a3 didFinishTransferWithSuccess:(BOOL)a4
{
  void *v4;
  void *v5;
  id v6;

  if (a4)
  {
    -[SHSheetPresenter session](self, "session", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activityViewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "airDropDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v5, "activityViewControllerDidFinishAirdropTransfer:", v6);

  }
}

- (void)airDropViewController:(id)a3 requestSharedItemsWithDataRequest:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[SHSheetPresenter interactor](self, "interactor");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "extension");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "performActivityWithRequest:forExtension:completion:", v9, v11, v8);
}

- (void)airDropViewController:(id)a3 requestSendingAppBundleIdentifierWithCompletionHandler:(id)a4
{
  void (**v4)(id, void *);
  void *v5;
  _OWORD v6[2];

  memset(v6, 0, sizeof(v6));
  v4 = (void (**)(id, void *))a4;
  _SharingUIAuditTokenForCurrentProcess((uint64_t)v6);
  _ShareSheetBundleIDFromAuditToken();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v5);

}

- (void)_finishAirdropActivityPerformer:(id)a3 withSuccess:(BOOL)a4
{
  _BOOL8 v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a4;
  v8 = a3;
  objc_msgSend(v8, "activity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "activityType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.UIKit.activity.AirDrop"));

    objc_msgSend(v8, "finishWithSuccess:", v4);
  }

}

- (BOOL)_shouldCompleteAirdropActivity
{
  void *v2;
  char v3;

  -[SHSheetPresenter session](self, "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAirdropOnly");

  return v3;
}

- (void)requestRefreshedCustomizationGroupForObjectManipulationViewController:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SHSheetPresenter session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "customizationGroups");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "updateWithCustomizationGroups:", v6);
}

- (void)runScrollingTestWithName:(id)a3 type:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16[2];
  id location;

  v8 = a3;
  v9 = a5;
  if (-[SHSheetPresenter activityViewControllerIsPresenting](self, "activityViewControllerIsPresenting"))
  {
    location = 0;
    objc_initWeak(&location, self);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __68__SHSheetPresenter_runScrollingTestWithName_type_completionHandler___block_invoke;
    v13[3] = &unk_1E4002D18;
    objc_copyWeak(v16, &location);
    v14 = v8;
    v16[1] = (id)a4;
    v15 = v9;
    -[SHSheetPresenter setPresentationDelayedTestingBlock:](self, "setPresentationDelayedTestingBlock:", v13);

    objc_destroyWeak(v16);
    objc_destroyWeak(&location);
  }
  else
  {
    -[SHSheetPresenter mainViewController](self, "mainViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      -[SHSheetPresenter mainViewController](self, "mainViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "runScrollingTestWithName:type:completionHandler:", v8, a4, v9);

    }
  }

}

void __68__SHSheetPresenter_runScrollingTestWithName_type_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "runScrollingTestWithName:type:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));

}

- (SHSheetPresenterDelegate)delegate
{
  return (SHSheetPresenterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SHSheetRouter)router
{
  return self->_router;
}

- (SHSheetInteractor)interactor
{
  return self->_interactor;
}

- (BOOL)didRequestInitialConfiguration
{
  return self->_didRequestInitialConfiguration;
}

- (void)setDidRequestInitialConfiguration:(BOOL)a3
{
  self->_didRequestInitialConfiguration = a3;
}

- (BOOL)didReceiveInitialConfiguration
{
  return self->_didReceiveInitialConfiguration;
}

- (void)setDidReceiveInitialConfiguration:(BOOL)a3
{
  self->_didReceiveInitialConfiguration = a3;
}

- (BOOL)didRequestDismissal
{
  return self->_didRequestDismissal;
}

- (void)setDidRequestDismissal:(BOOL)a3
{
  self->_didRequestDismissal = a3;
}

- (BOOL)isReportingActivityResult
{
  return self->_isReportingActivityResult;
}

- (void)setIsReportingActivityResult:(BOOL)a3
{
  self->_isReportingActivityResult = a3;
}

- (BOOL)isPresentingNonUIShareSheet
{
  return self->_isPresentingNonUIShareSheet;
}

- (void)setIsPresentingNonUIShareSheet:(BOOL)a3
{
  self->_isPresentingNonUIShareSheet = a3;
}

- (SHSheetActivityPerformerResult)activityResult
{
  return self->_activityResult;
}

- (void)setActivityResult:(id)a3
{
  objc_storeStrong((id *)&self->_activityResult, a3);
}

- (BOOL)activityViewControllerIsPresenting
{
  return self->_activityViewControllerIsPresenting;
}

- (void)setActivityViewControllerIsPresenting:(BOOL)a3
{
  self->_activityViewControllerIsPresenting = a3;
}

- (BOOL)activityViewControllerPresentationDidBegin
{
  return self->_activityViewControllerPresentationDidBegin;
}

- (void)setActivityViewControllerPresentationDidBegin:(BOOL)a3
{
  self->_activityViewControllerPresentationDidBegin = a3;
}

- (BOOL)activityViewControllerIsEmbedded
{
  return self->_activityViewControllerIsEmbedded;
}

- (void)setActivityViewControllerIsEmbedded:(BOOL)a3
{
  self->_activityViewControllerIsEmbedded = a3;
}

- (SHSheetContentView)mainViewController
{
  return (SHSheetContentView *)objc_loadWeakRetained((id *)&self->_mainViewController);
}

- (void)setMainViewController:(id)a3
{
  objc_storeWeak((id *)&self->_mainViewController, a3);
}

- (SHSheetContentView)secondaryViewController
{
  return (SHSheetContentView *)objc_loadWeakRetained((id *)&self->_secondaryViewController);
}

- (void)setSecondaryViewController:(id)a3
{
  objc_storeWeak((id *)&self->_secondaryViewController, a3);
}

- (SFAirDropViewController)airdropViewController
{
  return (SFAirDropViewController *)objc_loadWeakRetained((id *)&self->_airdropViewController);
}

- (void)setAirdropViewController:(id)a3
{
  objc_storeWeak((id *)&self->_airdropViewController, a3);
}

- (_UIActivityUserDefaultsViewController)userDefaultsViewController
{
  return (_UIActivityUserDefaultsViewController *)objc_loadWeakRetained((id *)&self->_userDefaultsViewController);
}

- (void)setUserDefaultsViewController:(id)a3
{
  objc_storeWeak((id *)&self->_userDefaultsViewController, a3);
}

- (UIViewController)optionsViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_optionsViewController);
}

- (void)setOptionsViewController:(id)a3
{
  objc_storeWeak((id *)&self->_optionsViewController, a3);
}

- (UIViewController)collaborationOptionsViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_collaborationOptionsViewController);
}

- (void)setCollaborationOptionsViewController:(id)a3
{
  objc_storeWeak((id *)&self->_collaborationOptionsViewController, a3);
}

- (UIViewController)collaborationParticipantsViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_collaborationParticipantsViewController);
}

- (void)setCollaborationParticipantsViewController:(id)a3
{
  objc_storeWeak((id *)&self->_collaborationParticipantsViewController, a3);
}

- (NSUUID)collaborationItemIdentifier
{
  return self->_collaborationItemIdentifier;
}

- (void)setCollaborationItemIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_collaborationItemIdentifier, a3);
}

- (id)collaborationCreateSharingURLCompletionHandler
{
  return self->_collaborationCreateSharingURLCompletionHandler;
}

- (void)setCollaborationCreateSharingURLCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (id)presentationDelayedTestingBlock
{
  return self->_presentationDelayedTestingBlock;
}

- (void)setPresentationDelayedTestingBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_presentationDelayedTestingBlock, 0);
  objc_storeStrong(&self->_collaborationCreateSharingURLCompletionHandler, 0);
  objc_storeStrong((id *)&self->_collaborationItemIdentifier, 0);
  objc_destroyWeak((id *)&self->_collaborationParticipantsViewController);
  objc_destroyWeak((id *)&self->_collaborationOptionsViewController);
  objc_destroyWeak((id *)&self->_optionsViewController);
  objc_destroyWeak((id *)&self->_userDefaultsViewController);
  objc_destroyWeak((id *)&self->_airdropViewController);
  objc_destroyWeak((id *)&self->_secondaryViewController);
  objc_destroyWeak((id *)&self->_mainViewController);
  objc_storeStrong((id *)&self->_activityResult, 0);
  objc_storeStrong((id *)&self->_interactor, 0);
  objc_storeStrong((id *)&self->_router, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithRouter:(os_log_t)log interactor:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_debug_impl(&dword_19E419000, log, OS_LOG_TYPE_DEBUG, "New presenter with router:%@ interactor:%@", (uint8_t *)&v3, 0x16u);
}

- (void)updateWithContext:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_19E419000, a1, a3, "update requested after selecting an activity. skipping.", a5, a6, a7, a8, 0);
}

- (void)interactorDidFailPerformActivityNotCollaborationEligible:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_19E419000, a2, OS_LOG_TYPE_ERROR, "Current collaboration item is not file URL: %@", (uint8_t *)&v2, 0xCu);
}

- (void)interactor:(NSObject *)a3 didUpdateAirDropTransferWithChange:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  SFAirDropTransferChangeStateDescription();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "activity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = v6;
  _os_log_error_impl(&dword_19E419000, a3, OS_LOG_TYPE_ERROR, "did receive airdrop transfer update:%@ for no active airdrop activity:%@", (uint8_t *)&v7, 0x16u);

}

@end
