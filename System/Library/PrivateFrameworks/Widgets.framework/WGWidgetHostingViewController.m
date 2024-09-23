@implementation WGWidgetHostingViewController

+ (void)setWidgetSnapshotTimestampsEnabled:(BOOL)a3
{
  NSObject *v3;
  const __CFString *v4;
  int v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  __WGWidgetSnapshotDebugLabelsEnabled = a3;
  v3 = WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    if (__WGWidgetSnapshotDebugLabelsEnabled)
      v4 = CFSTR("enabled");
    else
      v4 = CFSTR("disabled");
    v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_2172E1000, v3, OS_LOG_TYPE_DEFAULT, "Widget snapshot timestamps %{public}@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)_purgeLegacySnapshotsIfNecessary
{
  int v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = CFSTR("_host && _widgetInfo");
  OUTLINED_FUNCTION_1_0(&dword_2172E1000, a1, a3, "Invalid parameter not satisfying: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

- (WGWidgetHostingViewController)initWithWidgetInfo:(id)a3 delegate:(id)a4 host:(id)a5
{
  id v9;
  id v10;
  id v11;
  WGWidgetHostingViewController *v12;
  WGWidgetHostingViewController *v13;
  id *p_widgetInfo;
  void *v15;
  char *v16;
  uint64_t v17;
  OS_dispatch_queue *proxyConnectionQueue;
  char *v19;
  uint64_t v20;
  OS_dispatch_queue *proxyRequestQueue;
  char *v22;
  uint64_t v23;
  OS_dispatch_queue *diskWriteQueue;
  void *v25;
  uint64_t v26;
  NSMapTable *openAppearanceTransactions;
  double v28;
  double v29;
  void *v30;
  objc_super v32;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v32.receiver = self;
  v32.super_class = (Class)WGWidgetHostingViewController;
  v12 = -[WGWidgetHostingViewController initWithNibName:bundle:](&v32, sel_initWithNibName_bundle_, 0, 0);
  v13 = v12;
  if (v12)
  {
    p_widgetInfo = (id *)&v12->_widgetInfo;
    objc_storeStrong((id *)&v12->_widgetInfo, a3);
    objc_storeWeak((id *)&v13->_delegate, v10);
    objc_storeWeak((id *)&v13->_host, v11);
    -[WGWidgetHostingViewController widgetIdentifier](v13, "widgetIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (char *)QueueName(CFSTR("com.apple.widgets.proxyconnectionqueue"), v15);
    NewSerialQueue(v16);
    v17 = objc_claimAutoreleasedReturnValue();
    proxyConnectionQueue = v13->_proxyConnectionQueue;
    v13->_proxyConnectionQueue = (OS_dispatch_queue *)v17;

    v19 = (char *)QueueName(CFSTR("com.apple.widgets.proxyrequestqueue"), v15);
    NewSerialQueue(v19);
    v20 = objc_claimAutoreleasedReturnValue();
    proxyRequestQueue = v13->_proxyRequestQueue;
    v13->_proxyRequestQueue = (OS_dispatch_queue *)v20;

    InvalidateQueue(v13->_proxyRequestQueue);
    v22 = (char *)QueueName(CFSTR("com.apple.widgets.diskqueue"), v15);
    NewSerialQueue(v22);
    v23 = objc_claimAutoreleasedReturnValue();
    diskWriteQueue = v13->_diskWriteQueue;
    v13->_diskWriteQueue = (OS_dispatch_queue *)v23;

    WGContainingBundleIdentifierForWidgetWithBundleIdentifier(v15);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[WGWidgetHostingViewController setAppBundleID:](v13, "setAppBundleID:", v25);

    objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    v26 = objc_claimAutoreleasedReturnValue();
    openAppearanceTransactions = v13->_openAppearanceTransactions;
    v13->_openAppearanceTransactions = (NSMapTable *)v26;

    v13->_implementsPerformUpdate = 1;
    objc_msgSend(*p_widgetInfo, "registerWidgetHost:", v13);
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend(v11, "shouldPurgeArchivedSnapshotsForWidget:", v13))
    {
      -[WGWidgetHostingViewController _removeAllSnapshotFilesDueToIssue:](v13, "_removeAllSnapshotFilesDueToIssue:", 1);
      -[WGWidgetHostingViewController preferredContentSize](v13, "preferredContentSize");
      if (fabs(v28) < 2.22044605e-16)
      {
        objc_msgSend(*p_widgetInfo, "initialHeight");
        -[WGWidgetHostingViewController _updatePreferredContentSizeWithHeight:](v13, "_updatePreferredContentSizeWithHeight:");
      }
    }
    else
    {
      -[WGWidgetHostingViewController _purgeLegacySnapshotsIfNecessary](v13, "_purgeLegacySnapshotsIfNecessary");
      -[WGWidgetHostingViewController _loadSnapshotViewFromDiskIfNecessary:](v13, "_loadSnapshotViewFromDiskIfNecessary:", &__block_literal_global_23);
    }
    if ((objc_msgSend(*p_widgetInfo, "isLinkedOnOrAfterSystemVersion:", CFSTR("10.0")) & 1) == 0)
      v13->_activeDisplayMode = 1;
    if (!objc_msgSend(*p_widgetInfo, "largestAllowedDisplayMode"))
    {
      -[WGWidgetHostingViewController _maxSizeForDisplayMode:](v13, "_maxSizeForDisplayMode:", 0);
      -[WGWidgetHostingViewController _updatePreferredContentSizeWithHeight:](v13, "_updatePreferredContentSizeWithHeight:", v29);
    }
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addObserver:selector:name:object:", v13, sel__rowHeightDidChange_, CFSTR("WGWidgetRowHeightDidChangeNotification"), 0);

  }
  return v13;
}

void __66__WGWidgetHostingViewController_initWithWidgetInfo_delegate_host___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  char v5;
  void *v6;
  char v7;
  id v8;

  v8 = a2;
  v4 = a3;
  v5 = objc_msgSend(v8, "_shouldRemoveSnapshotWhenNotVisible");
  if ((v5 & 1) == 0
    && (!v4
     || objc_msgSend(v8, "_isActiveSequence:", v4)
     && objc_msgSend(v4, "isCurrentStateNotYet:", 4)))
  {
    objc_msgSend(v8, "_insertSnapshotWithCompletionHandler:", 0);
  }
  objc_msgSend(v8, "_snapshotView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v5 ^ 1;
  if (!v6)
    v7 = 1;
  if ((v7 & 1) == 0)
    objc_msgSend(v8, "_synchronizeGeometryWithSnapshot");

}

- (void)dealloc
{
  OUTLINED_FUNCTION_12(&dword_2172E1000, MEMORY[0x24BDACB70], a3, "Remote view controller is still valid – this likely means viewWill/DidDisappear weren't called. Severing connection, but no snapshot will be taken. Please file a bug.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

- (NSString)widgetIdentifier
{
  return -[WGWidgetInfo widgetIdentifier](self->_widgetInfo, "widgetIdentifier");
}

- (NSString)displayName
{
  return -[WGWidgetInfo displayName](self->_widgetInfo, "displayName");
}

- (void)requestIconWithHandler:(id)a3
{
  if (a3)
    -[WGWidgetInfo requestIconWithHandler:](self->_widgetInfo, "requestIconWithHandler:");
}

- (void)requestSettingsIconWithHandler:(id)a3
{
  if (a3)
    -[WGWidgetInfo requestSettingsIconWithHandler:](self->_widgetInfo, "requestSettingsIconWithHandler:");
}

- (void)setActiveDisplayMode:(int64_t)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  void *v12;
  __int16 v13;
  WGWidgetHostingViewController *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (self->_activeDisplayMode != a3)
  {
    self->_activeDisplayMode = a3;
    v4 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      v5 = v4;
      -[WGWidgetHostingViewController widgetIdentifier](self, "widgetIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[WGWidgetHostingViewController _containerIdentifier](self, "_containerIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      NCStringFromWidgetDisplayMode();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138544130;
      v12 = v6;
      v13 = 2050;
      v14 = self;
      v15 = 2114;
      v16 = v7;
      v17 = 2114;
      v18 = v8;
      _os_log_impl(&dword_2172E1000, v5, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Updated active display mode: %{public}@",
        (uint8_t *)&v11,
        0x2Au);

    }
    -[WGWidgetHostingViewController _activeLifeCycleSequence](self, "_activeLifeCycleSequence");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isCurrentStateNotYet:", 5);

    if (v10)
      -[WGWidgetHostingViewController _enqueueRemoteServiceRequest:withDescription:](self, "_enqueueRemoteServiceRequest:withDescription:", &__block_literal_global_32, CFSTR("Setting active display mode"));
  }
}

void __54__WGWidgetHostingViewController_setActiveDisplayMode___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;

  v14 = a2;
  v4 = a3;
  if (objc_msgSend(v14, "_isActiveSequence:", v4))
  {
    if (objc_msgSend(v4, "isCurrentStateNotYet:", 5))
    {
      objc_msgSend(v14, "_remoteViewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_setActiveDisplayMode:", objc_msgSend(v14, "activeDisplayMode"));

      objc_msgSend(v14, "parentViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "superview");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bounds");
      objc_msgSend(v6, "sizeForChildContentContainer:withParentContainerSize:", v14, v9, v10);
      v12 = v11;

      objc_msgSend(v14, "preferredContentSize");
      if (v13 != v12)
        objc_msgSend(v14, "_updatePreferredContentSizeWithHeight:", v12);
    }
  }

}

- (int64_t)userSpecifiedDisplayMode
{
  id WeakRetained;
  int64_t v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_host);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(WeakRetained, "userSpecifiedDisplayModeForWidget:", self);
  else
    v4 = 0;

  return v4;
}

- (void)setUserSpecifiedDisplayMode:(int64_t)a3
{
  int64_t v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_host);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "widget:didChangeUserSpecifiedDisplayMode:", self, a3);
  v5 = -[WGWidgetHostingViewController userSpecifiedDisplayMode](self, "userSpecifiedDisplayMode");
  if (v5 <= -[WGWidgetHostingViewController largestAvailableDisplayMode](self, "largestAvailableDisplayMode"))
    -[WGWidgetHostingViewController setActiveDisplayMode:](self, "setActiveDisplayMode:", v5);

}

- (BOOL)isLinkedOnOrAfterSystemVersion:(id)a3
{
  return -[WGWidgetInfo isLinkedOnOrAfterSystemVersion:](self->_widgetInfo, "isLinkedOnOrAfterSystemVersion:", a3);
}

- (BOOL)isRemoteViewVisible
{
  UIView *v3;
  UIView *v4;
  _BOOL4 v5;

  if (-[_WGWidgetRemoteViewController isViewLoaded](self->_remoteViewController, "isViewLoaded"))
  {
    -[_WGWidgetRemoteViewController view](self->_remoteViewController, "view");
    v3 = (UIView *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3 == self->_contentProvidingView)
      v5 = !-[UIView isHidden](v3, "isHidden");
    else
      LOBYTE(v5) = 0;

  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)isSnapshotLoaded
{
  return self->_snapshotView != 0;
}

- (BOOL)isBrokenViewVisible
{
  _WGBrokenWidgetView *brokenView;

  brokenView = self->_brokenView;
  if (brokenView)
  {
    if (brokenView == (_WGBrokenWidgetView *)self->_contentProvidingView)
      LOBYTE(brokenView) = -[_WGBrokenWidgetView isHidden](brokenView, "isHidden") ^ 1;
    else
      LOBYTE(brokenView) = 0;
  }
  return (char)brokenView;
}

- (void)invalidateCachedSnapshotWithCompletionHandler:(id)a3
{
  -[WGWidgetHostingViewController _invalidateSnapshotWithForce:removingSnapshotFilesForActiveDisplayMode:completionHandler:](self, "_invalidateSnapshotWithForce:removingSnapshotFilesForActiveDisplayMode:completionHandler:", 0, 1, a3);
}

- (void)invalidateCachedSnapshotWithURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  _WGCAPackageView *snapshotView;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  snapshotView = self->_snapshotView;
  if (snapshotView)
  {
    -[_WGCAPackageView snapshotIdentifier](snapshotView, "snapshotIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WGWidgetHostingViewController _widgetSnapshotURLForSnapshotIdentifier:ensuringDirectoryExists:](self, "_widgetSnapshotURLForSnapshotIdentifier:ensuringDirectoryExists:", v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && objc_msgSend(v10, "isEqual:", v9))
      -[WGWidgetHostingViewController _invalidateSnapshotWithForce:removingSnapshotFilesForActiveDisplayMode:completionHandler:](self, "_invalidateSnapshotWithForce:removingSnapshotFilesForActiveDisplayMode:completionHandler:", 1, 0, v6);

  }
}

- (BSAuditToken)auditToken
{
  void *v2;
  _WGWidgetRemoteViewController *remoteViewController;
  _OWORD v5[2];

  v2 = (void *)MEMORY[0x24BE0BDB8];
  remoteViewController = self->_remoteViewController;
  if (remoteViewController)
    -[_UIRemoteViewController serviceAuditToken](remoteViewController, "serviceAuditToken");
  else
    memset(v5, 0, sizeof(v5));
  objc_msgSend(v2, "tokenFromAuditToken:", v5);
  return (BSAuditToken *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)maximumSizeDidChangeForDisplayMode:(int64_t)a3
{
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  -[WGWidgetHostingViewController _activeLifeCycleSequence](self, "_activeLifeCycleSequence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isCurrentState:", 4);

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Updating max size for display mode '%ld'"), a3, MEMORY[0x24BDAC760], 3221225472, __68__WGWidgetHostingViewController_maximumSizeDidChangeForDisplayMode___block_invoke, &__block_descriptor_40_e72_v28__0__WGWidgetHostingViewController_8__WGWidgetLifeCycleSequence_16B24l, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WGWidgetHostingViewController _enqueueRemoteServiceRequest:withDescription:](self, "_enqueueRemoteServiceRequest:withDescription:", &v8, v7);

  }
}

void __68__WGWidgetHostingViewController_maximumSizeDidChangeForDisplayMode___block_invoke(uint64_t a1, void *a2, uint64_t a3, int a4)
{
  uint64_t v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  if (a4)
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = a2;
    objc_msgSend(v6, "_maxSizeForDisplayMode:", v5);
    v8 = v7;
    v10 = v9;
    objc_msgSend(v6, "_remoteViewController");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "_setMaximumSize:forDisplayMode:", *(_QWORD *)(a1 + 32), v8, v10);
  }
}

- (int64_t)largestAvailableDisplayMode
{
  id WeakRetained;
  int64_t v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_host);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(WeakRetained, "largestAvailableDisplayModeForWidget:", self);
  else
    v4 = 0;

  return v4;
}

- (void)setLockedOut:(BOOL)a3 withExplanation:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  _QWORD v8[5];

  v4 = a3;
  v6 = a4;
  if (self->_lockedOut != v4)
  {
    self->_lockedOut = v4;
    if (v4)
    {
      -[WGWidgetHostingViewController _insertLockedOutViewWithExplanation:](self, "_insertLockedOutViewWithExplanation:", v6);
      -[WGWidgetHostingViewController _activeLifeCycleSequence](self, "_activeLifeCycleSequence");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __62__WGWidgetHostingViewController_setLockedOut_withExplanation___block_invoke;
      v8[3] = &unk_24D732660;
      v8[4] = self;
      -[WGWidgetHostingViewController _endSequence:withReason:completion:](self, "_endSequence:withReason:completion:", v7, CFSTR("lock out began"), v8);

    }
    else if (-[UIViewController wg_isAppearingOrAppeared](self, "wg_isAppearingOrAppeared"))
    {
      -[WGWidgetHostingViewController _beginSequenceWithReason:completion:updateHandler:](self, "_beginSequenceWithReason:completion:updateHandler:", CFSTR("lock out ended"), &__block_literal_global_49, 0);
    }
  }

}

void __62__WGWidgetHostingViewController_setLockedOut_withExplanation___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v3 = a2;
  objc_msgSend(v3, "_endRemoteViewControllerAppearanceTransitionIfNecessary");
  if ((objc_msgSend(v3, "isLockedOut") & 1) == 0)
  {
    objc_msgSend(v3, "_lockedOutView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeFromSuperview");

    objc_msgSend(v3, "_setLockedOutView:", 0);
  }

}

- (void)_beginRemoteViewControllerAppearanceTransitionIfNecessary:(BOOL)a3 semaphore:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v7;
  void (**v9)(id, id, void *);
  UIView *contentProvidingView;
  UIView *v11;
  _BOOL4 v12;
  _BOOL4 v13;
  id WeakRetained;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  _WGWidgetRemoteViewController *remoteViewController;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  const __CFString *v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  NSObject *v32;
  NSObject *log;
  void *v34;
  NSObject *dsema;
  _QWORD v37[4];
  id v38;
  BOOL v39;
  BOOL v40;
  _QWORD v41[4];
  NSObject *v42;
  void (**v43)(id, id, void *);
  BOOL v44;
  BOOL v45;
  _BYTE location[12];
  __int16 v47;
  WGWidgetHostingViewController *v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  const __CFString *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v7 = a3;
  v59 = *MEMORY[0x24BDAC8D0];
  dsema = a4;
  v9 = (void (**)(id, id, void *))a6;
  if (v7)
  {
    if ((self->_ignoringParentAppearState
       || -[UIViewController wg_isAppearingOrAppeared](self, "wg_isAppearingOrAppeared"))
      && -[_WGWidgetRemoteViewController _isValid](self->_remoteViewController, "_isValid"))
    {
      contentProvidingView = self->_contentProvidingView;
      -[_WGWidgetRemoteViewController view](self->_remoteViewController, "view");
      v11 = (UIView *)objc_claimAutoreleasedReturnValue();
      v12 = contentProvidingView == v11
         && -[UIViewController wg_isDisappearingOrDisappeared](self->_remoteViewController, "wg_isDisappearingOrDisappeared");

LABEL_14:
      v13 = 0;
      if (v12)
        goto LABEL_21;
      goto LABEL_15;
    }
LABEL_11:
    v12 = 0;
    goto LABEL_14;
  }
  if (!self->_ignoringParentAppearState
    && -[WGWidgetHostingViewController _appearState](self, "_appearState") == 1
    || !-[_WGWidgetRemoteViewController _isValid](self->_remoteViewController, "_isValid"))
  {
    goto LABEL_11;
  }
  v13 = -[UIViewController wg_isAppearingOrAppeared](self->_remoteViewController, "wg_isAppearingOrAppeared");
  v12 = 0;
LABEL_15:
  if (!v13)
  {
    if (dsema)
      dispatch_semaphore_signal(dsema);
    objc_initWeak((id *)location, self);
    if (v9)
    {
      WeakRetained = objc_loadWeakRetained((id *)location);
      -[WGWidgetHostingViewController _activeLifeCycleSequence](self, "_activeLifeCycleSequence");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v9[2](v9, WeakRetained, v15);

    }
    objc_destroyWeak((id *)location);
    goto LABEL_43;
  }
LABEL_21:
  v16 = (void *)WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    log = v16;
    -[WGWidgetHostingViewController widgetIdentifier](self, "widgetIdentifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[WGWidgetHostingViewController _containerIdentifier](self, "_containerIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v18 = CFSTR("appearing");
    else
      v18 = CFSTR("disappearing");
    remoteViewController = self->_remoteViewController;
    WGStringForAppearState(-[WGWidgetHostingViewController _appearState](self, "_appearState"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    WGStringForAppearState(-[_WGWidgetRemoteViewController _appearState](self->_remoteViewController, "_appearState"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)location = 138544898;
    *(_QWORD *)&location[4] = v34;
    v47 = 2050;
    v48 = self;
    v49 = 2114;
    v50 = (uint64_t)v17;
    v51 = 2114;
    v52 = v18;
    v53 = 2114;
    v54 = remoteViewController;
    v55 = 2114;
    v56 = v20;
    v57 = 2114;
    v58 = v21;
    _os_log_impl(&dword_2172E1000, log, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Begin appearance transition (%{public}@): _remoteViewController=%{"
      "public}@, [self _appearState]=%{public}@, [_remoteViewController _appearState]=%{public}@",
      location,
      0x48u);

  }
  if (v12
    && -[_WGWidgetRemoteViewController _appearState](self->_remoteViewController, "_appearState") == 3
    || v13
    && -[_WGWidgetRemoteViewController _appearState](self->_remoteViewController, "_appearState") == 1)
  {
    v22 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      v23 = v22;
      -[WGWidgetHostingViewController widgetIdentifier](self, "widgetIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[WGWidgetHostingViewController _containerIdentifier](self, "_containerIdentifier");
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = (void *)v25;
      v27 = CFSTR("Disappearing");
      *(_DWORD *)location = 138544386;
      *(_QWORD *)&location[4] = v24;
      if (v7)
        v27 = CFSTR("Appearing");
      v28 = CFSTR("appearing");
      v47 = 2050;
      v48 = self;
      if (v7)
        v28 = CFSTR("disappearing");
      v49 = 2114;
      v50 = v25;
      v51 = 2114;
      v52 = v27;
      v53 = 2114;
      v54 = (void *)v28;
      _os_log_impl(&dword_2172E1000, v23, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> %{public}@, but remote view controller is still %{public}@ - end"
        "ing previous transition.",
        location,
        0x34u);

    }
    -[_WGWidgetRemoteViewController endAppearanceTransition](self->_remoteViewController, "endAppearanceTransition");
  }
  v29 = MEMORY[0x24BDAC760];
  v41[0] = MEMORY[0x24BDAC760];
  v41[1] = 3221225472;
  v41[2] = __121__WGWidgetHostingViewController__beginRemoteViewControllerAppearanceTransitionIfNecessary_semaphore_animated_completion___block_invoke;
  v41[3] = &unk_24D7326A8;
  v44 = v12;
  v45 = v13;
  v42 = dsema;
  v43 = v9;
  v37[0] = v29;
  v37[1] = 3221225472;
  v37[2] = __121__WGWidgetHostingViewController__beginRemoteViewControllerAppearanceTransitionIfNecessary_semaphore_animated_completion___block_invoke_62;
  v37[3] = &unk_24D7326F8;
  v30 = (id)MEMORY[0x219A0A970](v41);
  v38 = v30;
  v39 = v7;
  v40 = a5;
  -[WGWidgetHostingViewController _enqueueRemoteServiceRequest:withDescription:](self, "_enqueueRemoteServiceRequest:withDescription:", v37, CFSTR("Opening begin appearance transaction"));
  if (v7)
    v31 = 1120;
  else
    v31 = 1112;
  v32 = *(NSObject **)((char *)&self->super.super.super.isa + v31);
  if (v32)
    dispatch_semaphore_signal(v32);

LABEL_43:
}

void __121__WGWidgetHostingViewController__beginRemoteViewControllerAppearanceTransitionIfNecessary_semaphore_animated_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  int v13;
  const __CFString *v14;
  uint64_t v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  const __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if ((*(_BYTE *)(a1 + 48) || *(_BYTE *)(a1 + 49)) && *(_QWORD *)(a1 + 32))
  {
    v7 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      objc_msgSend(v5, "widgetIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_containerIdentifier");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      v12 = *(_QWORD *)(a1 + 32);
      v13 = *(unsigned __int8 *)(a1 + 48);
      v16 = 138544386;
      if (v13)
        v14 = CFSTR("appearance");
      else
        v14 = CFSTR("disappearance");
      v17 = v9;
      v18 = 2050;
      v19 = v5;
      v20 = 2114;
      v21 = v10;
      v22 = 2114;
      v23 = v12;
      v24 = 2114;
      v25 = v14;
      _os_log_impl(&dword_2172E1000, v8, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Signaling semaphore '%{public}@' for %{public}@ transition",
        (uint8_t *)&v16,
        0x34u);

    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
  v15 = *(_QWORD *)(a1 + 40);
  if (v15)
    (*(void (**)(uint64_t, id, id))(v15 + 16))(v15, v5, v6);

}

void __121__WGWidgetHostingViewController__beginRemoteViewControllerAppearanceTransitionIfNecessary_semaphore_animated_completion___block_invoke_62(uint64_t a1, void *a2, uint64_t a3, int a4)
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v6 = a2;
  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_openAppearanceTransactions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __121__WGWidgetHostingViewController__beginRemoteViewControllerAppearanceTransitionIfNecessary_semaphore_animated_completion___block_invoke_2;
    v17[3] = &unk_24D7326D0;
    v9 = v6;
    v18 = v9;
    v10 = *(id *)(a1 + 32);
    v19 = v7;
    v20 = v10;
    v11 = v7;
    v12 = (void *)objc_msgSend(v17, "copy");
    objc_msgSend(v8, "setObject:forKey:", v12, v11);

    objc_msgSend(v9, "_remoteViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (*(_BYTE *)(a1 + 40))
      v15 = 1;
    else
      v15 = 3;
    objc_msgSend(v13, "_openTransactionForAppearanceCallWithState:withIdentifier:", v15, v11);

    objc_msgSend(v9, "_remoteViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "beginAppearanceTransition:animated:", *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41));

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __121__WGWidgetHostingViewController__beginRemoteViewControllerAppearanceTransitionIfNecessary_semaphore_animated_completion___block_invoke_2(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = a1[6];
  v2 = (void *)a1[4];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Appearance completion for transactionID %@"), a1[5]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_enqueueRemoteServiceRequest:withDescription:", v1, v3);

}

- (void)_endRemoteViewControllerAppearanceTransitionIfNecessaryWithCompletion:(id)a3
{
  void (**v4)(id, id, void *);
  BOOL v5;
  _BOOL4 v6;
  id WeakRetained;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  _WGWidgetRemoteViewController *remoteViewController;
  void *v16;
  void *v17;
  uint64_t v18;
  void (**v19)(id, id, void *);
  id v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  void (**v24)(id, id, void *);
  BOOL v25;
  _QWORD v26[4];
  void (**v27)(id, id, void *);
  _BYTE location[12];
  __int16 v29;
  WGWidgetHostingViewController *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  _WGWidgetRemoteViewController *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, id, void *))a3;
  if (self->_ignoringParentAppearState
    || -[WGWidgetHostingViewController _appearState](self, "_appearState") == 2)
  {
    if (-[_WGWidgetRemoteViewController _isValid](self->_remoteViewController, "_isValid"))
      v5 = -[_WGWidgetRemoteViewController _appearState](self->_remoteViewController, "_appearState") == 1
        || -[_WGWidgetRemoteViewController _appearState](self->_remoteViewController, "_appearState") == 3;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  if (-[_WGWidgetRemoteViewController _isValid](self->_remoteViewController, "_isValid"))
  {
    v6 = -[_WGWidgetRemoteViewController _appearState](self->_remoteViewController, "_appearState") == 3;
    if (v5)
      goto LABEL_17;
  }
  else
  {
    v6 = 0;
    if (v5)
      goto LABEL_17;
  }
  if (!v6)
  {
    objc_initWeak((id *)location, self);
    if (v4)
    {
      WeakRetained = objc_loadWeakRetained((id *)location);
      -[WGWidgetHostingViewController _activeLifeCycleSequence](self, "_activeLifeCycleSequence");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, WeakRetained, v8);

    }
    goto LABEL_24;
  }
LABEL_17:
  if (self->_viewWillAppearSemaphore && v5)
    goto LABEL_22;
  if (!self->_viewWillDisappearSemaphore)
    LOBYTE(v6) = 0;
  if (v6)
  {
LABEL_22:
    objc_initWeak((id *)location, self);
    if (v4)
    {
      v9 = objc_loadWeakRetained((id *)location);
      -[WGWidgetHostingViewController _activeLifeCycleSequence](self, "_activeLifeCycleSequence");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v9, v10);

    }
LABEL_24:
    objc_destroyWeak((id *)location);
    goto LABEL_25;
  }
  v11 = (void *)WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    -[WGWidgetHostingViewController widgetIdentifier](self, "widgetIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WGWidgetHostingViewController _containerIdentifier](self, "_containerIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    remoteViewController = self->_remoteViewController;
    WGStringForAppearState(-[WGWidgetHostingViewController _appearState](self, "_appearState"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    WGStringForAppearState(-[_WGWidgetRemoteViewController _appearState](self->_remoteViewController, "_appearState"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)location = 138544642;
    *(_QWORD *)&location[4] = v13;
    v29 = 2050;
    v30 = self;
    v31 = 2114;
    v32 = v14;
    v33 = 2114;
    v34 = remoteViewController;
    v35 = 2114;
    v36 = v16;
    v37 = 2114;
    v38 = v17;
    _os_log_impl(&dword_2172E1000, v12, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> End appearance transition: _remoteViewController=%{public}@, [self"
      " _appearState]=%{public}@, [_remoteViewController _appearState]=%{public}@",
      location,
      0x3Eu);

  }
  if (v4)
  {
    v18 = MEMORY[0x24BDAC760];
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __103__WGWidgetHostingViewController__endRemoteViewControllerAppearanceTransitionIfNecessaryWithCompletion___block_invoke;
    v26[3] = &unk_24D732720;
    v19 = v4;
    v27 = v19;
    v22[0] = v18;
    v22[1] = 3221225472;
    v22[2] = __103__WGWidgetHostingViewController__endRemoteViewControllerAppearanceTransitionIfNecessaryWithCompletion___block_invoke_2;
    v22[3] = &unk_24D732748;
    v23 = (id)MEMORY[0x219A0A970](v26);
    v25 = v5;
    v24 = v19;
    v20 = v23;
    -[WGWidgetHostingViewController _enqueueRemoteServiceRequest:withDescription:](self, "_enqueueRemoteServiceRequest:withDescription:", v22, CFSTR("Opening end appearance transaction"));

  }
  else
  {
    -[WGWidgetHostingViewController _remoteViewController](self, "_remoteViewController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "endAppearanceTransition");

  }
LABEL_25:

}

uint64_t __103__WGWidgetHostingViewController__endRemoteViewControllerAppearanceTransitionIfNecessaryWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __103__WGWidgetHostingViewController__endRemoteViewControllerAppearanceTransitionIfNecessaryWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3, int a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v7 = a2;
  v8 = a3;
  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_openAppearanceTransactions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __103__WGWidgetHostingViewController__endRemoteViewControllerAppearanceTransitionIfNecessaryWithCompletion___block_invoke_3;
    v18[3] = &unk_24D7326D0;
    v11 = v7;
    v19 = v11;
    v12 = *(id *)(a1 + 32);
    v20 = v9;
    v21 = v12;
    v13 = v9;
    v14 = (void *)objc_msgSend(v18, "copy");
    objc_msgSend(v10, "setObject:forKey:", v14, v13);

    objc_msgSend(v11, "_remoteViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_openTransactionForAppearanceCallWithState:withIdentifier:", 2 * *(unsigned __int8 *)(a1 + 48), v13);

    objc_msgSend(v11, "_remoteViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "endAppearanceTransition");

  }
  else
  {
    v17 = *(_QWORD *)(a1 + 40);
    if (v17)
      (*(void (**)(uint64_t, id, id))(v17 + 16))(v17, v7, v8);
  }

}

void __103__WGWidgetHostingViewController__endRemoteViewControllerAppearanceTransitionIfNecessaryWithCompletion___block_invoke_3(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = a1[6];
  v2 = (void *)a1[4];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Appearance completion for transactionID %@"), a1[5]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_enqueueRemoteServiceRequest:withDescription:", v1, v3);

}

- (void)_endRemoteViewControllerAppearanceTransitionIfNecessary
{
  void *v3;
  id v4;

  -[WGWidgetHostingViewController delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (-[_WGWidgetRemoteViewController _appearState](self->_remoteViewController, "_appearState") == 1)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = &__block_literal_global_73;
    else
      v3 = 0;
  }
  else
  {
    v3 = 0;
  }
  -[WGWidgetHostingViewController _endRemoteViewControllerAppearanceTransitionIfNecessaryWithCompletion:](self, "_endRemoteViewControllerAppearanceTransitionIfNecessaryWithCompletion:", v3);

}

void __88__WGWidgetHostingViewController__endRemoteViewControllerAppearanceTransitionIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  int v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "_remoteViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_appearState");

  if (v3 == 2)
  {
    objc_msgSend(v5, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "remoteViewControllerViewDidAppearForWidget:", v5);

  }
}

- (void)managingContainerWillAppear:(id)a3
{
  if (-[UIViewController wg_isDisappearingOrDisappeared](self, "wg_isDisappearingOrDisappeared", a3))
  {
    if (-[WGWidgetHostingViewController _shouldRemoveSnapshotWhenNotVisible](self, "_shouldRemoveSnapshotWhenNotVisible"))
    {
      -[WGWidgetHostingViewController _validateSnapshotViewForActiveLayoutMode](self, "_validateSnapshotViewForActiveLayoutMode");
      -[WGWidgetHostingViewController _insertSnapshotViewIfAppropriate](self, "_insertSnapshotViewIfAppropriate");
    }
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  UIView *contentProvidingView;
  UIView *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WGWidgetHostingViewController;
  -[WGWidgetHostingViewController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  -[WGWidgetHostingViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerWidgetForRefreshEvents:", self);

  -[WGWidgetHostingViewController _validateSnapshotViewForActiveLayoutMode](self, "_validateSnapshotViewForActiveLayoutMode");
  -[WGWidgetHostingViewController _insertSnapshotViewIfAppropriate](self, "_insertSnapshotViewIfAppropriate");
  -[WGWidgetHostingViewController _requestVisibilityStateUpdateForPossiblyAppearing:sequence:](self, "_requestVisibilityStateUpdateForPossiblyAppearing:sequence:", 1, self->_activeLifeCycleSequence);
  if (-[WGWidgetLifeCycleSequence isCurrentStateAtLeast:](self->_activeLifeCycleSequence, "isCurrentStateAtLeast:", 4)&& -[WGWidgetLifeCycleSequence isCurrentStateAtMost:](self->_activeLifeCycleSequence, "isCurrentStateAtMost:", 6)&& -[_WGWidgetRemoteViewController _isValid](self->_remoteViewController, "_isValid"))
  {
    contentProvidingView = self->_contentProvidingView;
    -[_WGWidgetRemoteViewController view](self->_remoteViewController, "view");
    v6 = (UIView *)objc_claimAutoreleasedReturnValue();

    if (contentProvidingView == v6)
      -[WGWidgetHostingViewController _beginSequenceWithReason:completion:updateHandler:](self, "_beginSequenceWithReason:completion:updateHandler:", CFSTR("appearance transition"), &__block_literal_global_78, 0);
  }
}

uint64_t __48__WGWidgetHostingViewController_viewWillAppear___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_endRemoteViewControllerAppearanceTransitionIfNecessary");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WGWidgetHostingViewController;
  -[WGWidgetHostingViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[WGWidgetHostingViewController _beginSequenceWithReason:completion:updateHandler:](self, "_beginSequenceWithReason:completion:updateHandler:", CFSTR("appearance transition"), &__block_literal_global_81, 0);
}

uint64_t __47__WGWidgetHostingViewController_viewDidAppear___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_endRemoteViewControllerAppearanceTransitionIfNecessary");
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  _QWORD v5[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WGWidgetHostingViewController;
  -[WGWidgetHostingViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, a3);
  -[WGWidgetHostingViewController _activeLifeCycleSequence](self, "_activeLifeCycleSequence");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __51__WGWidgetHostingViewController_viewWillDisappear___block_invoke;
  v5[3] = &unk_24D732660;
  v5[4] = self;
  -[WGWidgetHostingViewController _endSequence:withReason:completion:](self, "_endSequence:withReason:completion:", v4, CFSTR("disappearance transition"), v5);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WGWidgetHostingViewController;
  -[WGWidgetHostingViewController viewDidDisappear:](&v6, sel_viewDidDisappear_, a3);
  -[WGWidgetHostingViewController _activeLifeCycleSequence](self, "_activeLifeCycleSequence");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WGWidgetHostingViewController _requestVisibilityStateUpdateForPossiblyAppearing:sequence:](self, "_requestVisibilityStateUpdateForPossiblyAppearing:sequence:", 0, v4);

  -[WGWidgetHostingViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unregisterWidgetForRefreshEvents:", self);

}

- (void)managingContainerDidDisappear:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  id v8;

  -[WGWidgetHostingViewController _snapshotView](self, "_snapshotView", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v8 = (id)v4;
    -[WGWidgetHostingViewController _contentProvidingView](self, "_contentProvidingView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WGWidgetHostingViewController _snapshotView](self, "_snapshotView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 == v6)
    {
      v7 = -[WGWidgetHostingViewController _shouldRemoveSnapshotWhenNotVisible](self, "_shouldRemoveSnapshotWhenNotVisible");

      if (!v7)
        return;
      -[WGWidgetHostingViewController _activeLifeCycleSequence](self, "_activeLifeCycleSequence");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      -[WGWidgetHostingViewController _insertContentProvidingSubview:sequence:completion:](self, "_insertContentProvidingSubview:sequence:completion:", 0);
    }
    else
    {

    }
  }
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WGWidgetHostingViewController;
  -[WGWidgetHostingViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[WGWidgetHostingViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAutoresizesSubviews:", 1);

  -[WGWidgetHostingViewController _insertAppropriateContentView](self, "_insertAppropriateContentView");
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setPreferredContentSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  WGWidgetHostingViewController *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;
  CGSize v21;

  height = a3.height;
  width = a3.width;
  v20 = *MEMORY[0x24BDAC8D0];
  v6 = (void *)WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    -[WGWidgetHostingViewController widgetIdentifier](self, "widgetIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WGWidgetHostingViewController _containerIdentifier](self, "_containerIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v21.width = width;
    v21.height = height;
    NSStringFromCGSize(v21);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v13 = v8;
    v14 = 2050;
    v15 = self;
    v16 = 2114;
    v17 = v9;
    v18 = 2114;
    v19 = v10;
    _os_log_impl(&dword_2172E1000, v7, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Requested preferred content size: %{public}@",
      buf,
      0x2Au);

  }
  v11.receiver = self;
  v11.super_class = (Class)WGWidgetHostingViewController;
  -[WGWidgetHostingViewController setPreferredContentSize:](&v11, sel_setPreferredContentSize_, width, height);
  -[WGWidgetInfo updatePreferredContentSize:forWidgetHost:](self->_widgetInfo, "updatePreferredContentSize:forWidgetHost:", self, width, height);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WGWidgetHostingViewController;
  -[WGWidgetHostingViewController traitCollectionDidChange:](&v12, sel_traitCollectionDidChange_, v4);
  objc_msgSend(v4, "preferredContentSizeCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5
    || (-[WGWidgetHostingViewController traitCollection](self, "traitCollection"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "preferredContentSizeCategory"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7 == v5))
  {
    v9 = objc_msgSend(v4, "userInterfaceStyle");
    -[WGWidgetHostingViewController traitCollection](self, "traitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "userInterfaceStyle");

    if (v9 != v11)
      -[WGWidgetHostingViewController _removeAllSnapshotFilesInActiveDisplayModeForAllButActiveUserInterfaceStyle](self, "_removeAllSnapshotFilesInActiveDisplayModeForAllButActiveUserInterfaceStyle");
  }
  else
  {
    -[WGWidgetHostingViewController _removeAllSnapshotFilesInActiveDisplayModeForContentSizeCategory:](self, "_removeAllSnapshotFilesInActiveDisplayModeForContentSizeCategory:", v5);
    -[WGWidgetHostingViewController maximumSizeDidChangeForDisplayMode:](self, "maximumSizeDidChangeForDisplayMode:", 0);
    -[WGWidgetHostingViewController maximumSizeDidChangeForDisplayMode:](self, "maximumSizeDidChangeForDisplayMode:", 1);
    if (!-[WGWidgetHostingViewController activeDisplayMode](self, "activeDisplayMode"))
    {
      -[WGWidgetHostingViewController preferredContentSize](self, "preferredContentSize");
      -[WGWidgetHostingViewController _updatePreferredContentSizeWithHeight:](self, "_updatePreferredContentSizeWithHeight:", v8);
    }
    -[WGWidgetHostingViewController _layoutMarginsDidChange](self, "_layoutMarginsDidChange");
  }

}

- (BOOL)_isActiveSequence:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WGWidgetHostingViewController _activeLifeCycleSequence](self, "_activeLifeCycleSequence");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  return v5 == v4;
}

- (void)_initiateNewSequenceIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  WGWidgetLifeCycleSequence *activeLifeCycleSequence;
  WGWidgetLifeCycleSequence *v11;
  WGWidgetLifeCycleSequence *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  WGWidgetLifeCycleSequence *v17;
  const char *v18;
  WGWidgetLifeCycleSequence *v19;
  WGWidgetLifeCycleSequence *v20;
  void *v21;
  WGWidgetLifeCycleSequence *v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  WGWidgetHostingViewController *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  WGWidgetLifeCycleSequence *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD17C8];
  -[WGWidgetHostingViewController widgetIdentifier](self, "widgetIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WGWidgetHostingViewController _containerIdentifier](self, "_containerIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD1500];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringFromDate:dateStyle:timeStyle:", v7, 1, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@.%@.%@"), v4, v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  activeLifeCycleSequence = self->_activeLifeCycleSequence;
  if (activeLifeCycleSequence)
  {
    if (-[WGWidgetLifeCycleSequence isCurrentStateAtLeast:](activeLifeCycleSequence, "isCurrentStateAtLeast:", 5))
    {
      -[WGWidgetLifeCycleSequence sequenceWithIdentifier:](self->_activeLifeCycleSequence, "sequenceWithIdentifier:", v9);
      v11 = (WGWidgetLifeCycleSequence *)objc_claimAutoreleasedReturnValue();
      v12 = self->_activeLifeCycleSequence;
      self->_activeLifeCycleSequence = v11;

      v13 = (void *)WGLogWidgets;
      if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
      {
        v14 = v13;
        -[WGWidgetHostingViewController widgetIdentifier](self, "widgetIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[WGWidgetHostingViewController _containerIdentifier](self, "_containerIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = self->_activeLifeCycleSequence;
        *(_DWORD *)buf = 138544130;
        v24 = v15;
        v25 = 2050;
        v26 = self;
        v27 = 2114;
        v28 = v16;
        v29 = 2114;
        v30 = v17;
        v18 = "<%{public}@: %{public}p; container: %{public}@> Initiating new life cycle sequence: %{public}@";
LABEL_7:
        _os_log_impl(&dword_2172E1000, v14, OS_LOG_TYPE_DEFAULT, v18, buf, 0x2Au);

      }
    }
  }
  else
  {
    v19 = -[WGWidgetLifeCycleSequence initWithSequenceIdentifier:]([WGWidgetLifeCycleSequence alloc], "initWithSequenceIdentifier:", v9);
    v20 = self->_activeLifeCycleSequence;
    self->_activeLifeCycleSequence = v19;

    v21 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v21;
      -[WGWidgetHostingViewController widgetIdentifier](self, "widgetIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[WGWidgetHostingViewController _containerIdentifier](self, "_containerIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = self->_activeLifeCycleSequence;
      *(_DWORD *)buf = 138544130;
      v24 = v15;
      v25 = 2050;
      v26 = self;
      v27 = 2114;
      v28 = v16;
      v29 = 2114;
      v30 = v22;
      v18 = "<%{public}@: %{public}p; container: %{public}@> Initiating new life cycle sequence: '%{public}@'";
      goto LABEL_7;
    }
  }

}

- (void)_abortActiveSequence
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  WGWidgetLifeCycleSequence *activeLifeCycleSequence;
  WGWidgetLifeCycleSequence *v8;
  int v9;
  void *v10;
  __int16 v11;
  WGWidgetHostingViewController *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  WGWidgetLifeCycleSequence *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    -[WGWidgetHostingViewController widgetIdentifier](self, "widgetIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WGWidgetHostingViewController _containerIdentifier](self, "_containerIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    activeLifeCycleSequence = self->_activeLifeCycleSequence;
    v9 = 138544130;
    v10 = v5;
    v11 = 2050;
    v12 = self;
    v13 = 2114;
    v14 = v6;
    v15 = 2114;
    v16 = activeLifeCycleSequence;
    _os_log_impl(&dword_2172E1000, v4, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Aborting active life cycle sequence: %{public}@",
      (uint8_t *)&v9,
      0x2Au);

  }
  v8 = self->_activeLifeCycleSequence;
  self->_activeLifeCycleSequence = 0;

}

- (void)_setupRequestQueue
{
  void *v3;
  char *v4;
  OS_dispatch_queue *v5;
  OS_dispatch_queue *proxyRequestQueue;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  WGWidgetHostingViewController *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (!self->_proxyRequestQueue)
  {
    -[WGWidgetHostingViewController widgetIdentifier](self, "widgetIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (char *)QueueName(CFSTR("com.apple.widgets.proxyrequestqueue"), v3);

    NewSerialQueue(v4);
    v5 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
    proxyRequestQueue = self->_proxyRequestQueue;
    self->_proxyRequestQueue = v5;

    v7 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      -[WGWidgetHostingViewController widgetIdentifier](self, "widgetIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[WGWidgetHostingViewController _containerIdentifier](self, "_containerIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138544130;
      v12 = v9;
      v13 = 2050;
      v14 = self;
      v15 = 2114;
      v16 = v10;
      v17 = 2082;
      v18 = v4;
      _os_log_impl(&dword_2172E1000, v8, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Setup request queue (%{public}s)",
        (uint8_t *)&v11,
        0x2Au);

    }
  }
}

- (void)_enqueueRequest:(id)a3 inQueue:(id)a4 trampolinedToMainQueue:(BOOL)a5 withDescription:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  BOOL v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  id v28;
  id location;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  NSObject *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id from;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  NSObject *v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v7 = a5;
  v45 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (v11)
  {
    v13 = objc_initWeak(&location, self);
    -[WGWidgetHostingViewController _activeLifeCycleSequence](self, "_activeLifeCycleSequence");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&from, self);
    v15 = v14;
    v16 = v10;
    v17 = v11;
    v28 = v12;
    v18 = objc_loadWeakRetained(&from);
    if (v16)
      v19 = v18 == 0;
    else
      v19 = 1;
    v20 = !v19;

    if (!v20)
      goto LABEL_13;
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __DispatchBlockForRequest_block_invoke;
    v32[3] = &unk_24D732EE0;
    v33 = v17;
    objc_copyWeak(&v37, &from);
    v36 = v16;
    v34 = v28;
    v35 = v15;
    v21 = (void *)MEMORY[0x219A0A970](v32);
    v22 = v21;
    if (v7)
    {
      v30[0] = MEMORY[0x24BDAC760];
      v30[1] = 3221225472;
      v30[2] = __DispatchBlockForRequest_block_invoke_688;
      v30[3] = &unk_24D7318B8;
      v31 = v21;
      v23 = (void *)objc_msgSend(v30, "copy");

    }
    else
    {
      v23 = (void *)objc_msgSend(v21, "copy");
    }

    objc_destroyWeak(&v37);
    if (!v23)
    {
LABEL_13:
      v24 = (void *)WGLogWidgets;
      if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_ERROR))
      {
        v26 = v24;
        v27 = (void *)MEMORY[0x219A0A970](v16);
        *(_DWORD *)buf = 138543874;
        v40 = v27;
        v41 = 2114;
        v42 = v17;
        v43 = 2114;
        v44 = v28;
        _os_log_error_impl(&dword_2172E1000, v26, OS_LOG_TYPE_ERROR, "Wrapped request is 'nil' (request:%{public}@, queue:%{public}@, description:%{public}@)", buf, 0x20u);

      }
      v23 = 0;
    }
    v25 = (void *)MEMORY[0x219A0A970](v23);

    objc_destroyWeak(&from);
    dispatch_async(v17, v25);

    objc_destroyWeak(&location);
  }

}

- (void)_enqueueRemoteServiceRequest:(id)a3 withDescription:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[WGWidgetHostingViewController _proxyRequestQueue](self, "_proxyRequestQueue");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[WGWidgetHostingViewController _enqueueRequest:inQueue:trampolinedToMainQueue:withDescription:](self, "_enqueueRequest:inQueue:trampolinedToMainQueue:withDescription:", v7, v8, 1, v6);

}

- (void)_beginSequenceWithReason:(id)a3 completion:(id)a4 updateHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  WGWidgetHostingViewController *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    -[WGWidgetHostingViewController widgetIdentifier](self, "widgetIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WGWidgetHostingViewController _containerIdentifier](self, "_containerIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v22 = v13;
    v23 = 2050;
    v24 = self;
    v25 = 2114;
    v26 = v14;
    v27 = 2114;
    v28 = v8;
    _os_log_impl(&dword_2172E1000, v12, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Begin sequence with reason: %{public}@",
      buf,
      0x2Au);

  }
  -[WGWidgetHostingViewController _initiateNewSequenceIfNecessary](self, "_initiateNewSequenceIfNecessary");
  -[WGWidgetHostingViewController _validateSnapshotViewForActiveLayoutMode](self, "_validateSnapshotViewForActiveLayoutMode");
  -[WGWidgetHostingViewController _activeLifeCycleSequence](self, "_activeLifeCycleSequence");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __83__WGWidgetHostingViewController__beginSequenceWithReason_completion_updateHandler___block_invoke;
  v18[3] = &unk_24D7327F8;
  v19 = v10;
  v20 = v9;
  v18[4] = self;
  v16 = v9;
  v17 = v10;
  -[WGWidgetHostingViewController _connectRemoteViewControllerForReason:sequence:completionHandler:](self, "_connectRemoteViewControllerForReason:sequence:completionHandler:", v8, v15, v18);

}

void __83__WGWidgetHostingViewController__beginSequenceWithReason_completion_updateHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  __CFString *v6;
  int v7;
  int v8;
  char v9;
  id v10;
  __CFString *v11;
  int v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  __CFString *v24;
  uint64_t v25;
  id WeakRetained;
  _QWORD v27[4];
  id v28;
  __CFString *v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  const __CFString *v38;
  __int16 v39;
  __CFString *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v5, "_isActiveSequence:", v6);
  if (-[__CFString isCurrentStateAtLeast:](v6, "isCurrentStateAtLeast:", 2))
  {
    v8 = -[__CFString isCurrentStateAtMost:](v6, "isCurrentStateAtMost:", 4);
    v9 = v8;
    if ((v7 & v8) == 1)
    {
      objc_msgSend(v5, "_noteOutstandingUpdateRequestForSequence:", v6);
      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = __83__WGWidgetHostingViewController__beginSequenceWithReason_completion_updateHandler___block_invoke_2;
      v27[3] = &unk_24D7327D0;
      v10 = v5;
      v28 = v10;
      v11 = v6;
      v29 = v11;
      v30 = *(id *)(a1 + 40);
      objc_msgSend(v10, "_performUpdateForSequence:withCompletionHandler:", v11, v27);
      objc_msgSend(v10, "_requestInsertionOfRemoteViewAfterViewWillAppearForSequence:completionHandler:", v11, *(_QWORD *)(a1 + 48));

      goto LABEL_22;
    }
  }
  else
  {
    v9 = 0;
  }
  v12 = 0;
  if (v7 && (v9 & 1) == 0)
    v12 = -[__CFString isCurrentStateNotYet:](v6, "isCurrentStateNotYet:", 4);
  if ((v7 & 1) != 0)
  {
    if ((v9 & 1) == 0)
    {
      v13 = (void *)WGLogWidgets;
      if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
      {
        v14 = v13;
        objc_msgSend(v5, "widgetIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "_containerIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          v17 = CFSTR("Aborting");
        else
          v17 = CFSTR("Can't continue");
        WGStringFromWidgetLifeCycleSequenceState(2uLL);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        WGStringFromWidgetLifeCycleSequenceState(4uLL);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544898;
        v32 = v15;
        v33 = 2050;
        v34 = v5;
        v35 = 2114;
        v36 = v16;
        v37 = 2114;
        v38 = v17;
        v39 = 2114;
        v40 = v6;
        v41 = 2114;
        v42 = v18;
        v43 = 2114;
        v44 = v19;
        _os_log_impl(&dword_2172E1000, v14, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> %{public}@ sequence as argument sequence (%{public}@) isn't in"
          " expected range (%{public}@ – %{public}@)",
          buf,
          0x48u);

      }
    }
  }
  else
  {
    v20 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      v21 = v20;
      objc_msgSend(v5, "widgetIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_containerIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_activeLifeCycleSequence");
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v32 = v22;
      v33 = 2050;
      v34 = v5;
      v35 = 2114;
      v36 = v23;
      v37 = 2114;
      v38 = v6;
      v39 = 2114;
      v40 = v24;
      _os_log_impl(&dword_2172E1000, v21, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Can't continue sequence as argument sequence (%{public}@) doesn'"
        "t match active sequence (%{public}@)",
        buf,
        0x34u);

    }
  }
  if (v12)
    objc_msgSend(v5, "_abortActiveSequence");
  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  v25 = *(_QWORD *)(a1 + 48);
  if (v25)
  {
    WeakRetained = objc_loadWeakRetained((id *)buf);
    (*(void (**)(uint64_t, id, __CFString *))(v25 + 16))(v25, WeakRetained, v6);

  }
  objc_destroyWeak((id *)buf);
LABEL_22:

}

uint64_t __83__WGWidgetHostingViewController__beginSequenceWithReason_completion_updateHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  uint64_t v8;

  if (objc_msgSend(*(id *)(a1 + 32), "_isActiveSequence:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(*(id *)(a1 + 32), "_updateRequestForSequence:", *(_QWORD *)(a1 + 40));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v6 + 16))(v6, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    v8 = *(_QWORD *)(a1 + 48);
    if (v8)
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v8, a2, a3);

  }
  return objc_msgSend(*(id *)(a1 + 32), "_registerUpdateRequestCompletionHandler:forSequence:", 0, *(_QWORD *)(a1 + 40));
}

- (void)_connectRemoteViewControllerForReason:(id)a3 sequence:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, id, id);
  _BOOL4 v11;
  void *v12;
  _BOOL4 v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id WeakRetained;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  _QWORD v43[4];
  void (**v44)(id, id, id);
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  WGWidgetHostingViewController *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  id v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, id, id))a5;
  v11 = -[WGWidgetHostingViewController _isActiveSequence:](self, "_isActiveSequence:", v9);
  v12 = (void *)WGLogWidgets;
  v13 = os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      v14 = v12;
      -[WGWidgetHostingViewController widgetIdentifier](self, "widgetIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[WGWidgetHostingViewController _containerIdentifier](self, "_containerIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v46 = v15;
      v47 = 2050;
      v48 = self;
      v49 = 2114;
      v50 = v16;
      v51 = 2114;
      v52 = v8;
      _os_log_impl(&dword_2172E1000, v14, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Connection requested with reason: '%{public}@'",
        buf,
        0x2Au);

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_disconnectionTimer);
    if (objc_msgSend((id)objc_opt_class(), "_canWidgetHostConnectRemoteViewControllerByRequestingForSequence:disconnectionTimer:connectionState:", v9, WeakRetained, self->_connectionState))
    {
      v18 = (void *)WGLogWidgets;
      if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
      {
        v19 = v18;
        -[WGWidgetHostingViewController widgetIdentifier](self, "widgetIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[WGWidgetHostingViewController _containerIdentifier](self, "_containerIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v46 = v20;
        v47 = 2050;
        v48 = self;
        v49 = 2114;
        v50 = v21;
        _os_log_impl(&dword_2172E1000, v19, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Will request remote view controller",
          buf,
          0x20u);

      }
      objc_msgSend(v9, "transitionToState:", 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        v23 = (void *)WGLogWidgets;
        if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_ERROR))
          -[WGWidgetHostingViewController _connectRemoteViewControllerForReason:sequence:completionHandler:].cold.1(v23);
        objc_initWeak((id *)buf, self);
        if (v10)
        {
          v24 = objc_loadWeakRetained((id *)buf);
          v10[2](v10, v24, v9);

        }
        objc_destroyWeak((id *)buf);
      }
      else
      {
        v43[0] = MEMORY[0x24BDAC760];
        v43[1] = 3221225472;
        v43[2] = __98__WGWidgetHostingViewController__connectRemoteViewControllerForReason_sequence_completionHandler___block_invoke;
        v43[3] = &unk_24D732820;
        v44 = v10;
        -[WGWidgetHostingViewController _requestRemoteViewControllerForSequence:completionHander:](self, "_requestRemoteViewControllerForSequence:completionHander:", v9, v43);

      }
    }
    else if (objc_msgSend((id)objc_opt_class(), "_canWidgetHostConnectRemoteViewControllerByCancellingDisappearanceForSequence:", v9))
    {
      if (WeakRetained)
      {
        v30 = (void *)WGLogWidgets;
        if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
        {
          v31 = v30;
          -[WGWidgetHostingViewController widgetIdentifier](self, "widgetIdentifier");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[WGWidgetHostingViewController _containerIdentifier](self, "_containerIdentifier");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v46 = v32;
          v47 = 2050;
          v48 = self;
          v49 = 2114;
          v50 = v33;
          _os_log_impl(&dword_2172E1000, v31, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Connection requested with pending disconnection - invalidati"
            "ng disconnection timer",
            buf,
            0x20u);

        }
        -[WGWidgetHostingViewController _invalidateDisconnectionTimer](self, "_invalidateDisconnectionTimer");
      }
      objc_msgSend(v9, "transitionToState:", 2);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (v34)
      {
        v35 = (void *)WGLogWidgets;
        if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_ERROR))
          -[WGWidgetHostingViewController _connectRemoteViewControllerForReason:sequence:completionHandler:].cold.2(v35);
        objc_initWeak((id *)buf, self);
        if (v10)
        {
          v36 = objc_loadWeakRetained((id *)buf);
          v10[2](v10, v36, v9);

        }
      }
      else
      {
        ValidateQueue(self->_proxyRequestQueue);
        objc_initWeak((id *)buf, self);
        if (v10)
        {
          v42 = objc_loadWeakRetained((id *)buf);
          v10[2](v10, v42, v9);

        }
      }
      objc_destroyWeak((id *)buf);

    }
    else
    {
      v37 = (void *)WGLogWidgets;
      if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
      {
        v38 = v37;
        -[WGWidgetHostingViewController widgetIdentifier](self, "widgetIdentifier");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[WGWidgetHostingViewController _containerIdentifier](self, "_containerIdentifier");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v46 = v39;
        v47 = 2050;
        v48 = self;
        v49 = 2114;
        v50 = v40;
        v51 = 2114;
        v52 = v9;
        _os_log_impl(&dword_2172E1000, v38, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Sequence already at satisfactory state: %{public}@",
          buf,
          0x2Au);

      }
      objc_initWeak((id *)buf, self);
      if (v10)
      {
        v41 = objc_loadWeakRetained((id *)buf);
        v10[2](v10, v41, v9);

      }
      objc_destroyWeak((id *)buf);
    }

  }
  else
  {
    if (v13)
    {
      v25 = v12;
      -[WGWidgetHostingViewController widgetIdentifier](self, "widgetIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[WGWidgetHostingViewController _containerIdentifier](self, "_containerIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[WGWidgetHostingViewController _activeLifeCycleSequence](self, "_activeLifeCycleSequence");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v46 = v26;
      v47 = 2050;
      v48 = self;
      v49 = 2114;
      v50 = v27;
      v51 = 2114;
      v52 = v9;
      v53 = 2114;
      v54 = v28;
      _os_log_impl(&dword_2172E1000, v25, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Can't request remote view controller as argument sequence (%{pub"
        "lic}@) doesn't match active sequence (%{public}@)",
        buf,
        0x34u);

    }
    objc_initWeak((id *)buf, self);
    if (v10)
    {
      v29 = objc_loadWeakRetained((id *)buf);
      v10[2](v10, v29, v9);

    }
    objc_destroyWeak((id *)buf);
  }

}

void __98__WGWidgetHostingViewController__connectRemoteViewControllerForReason_sequence_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_msgSend(v10, "_remoteViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_isValid");

  if (v7)
  {
    objc_msgSend(v10, "_proxyRequestQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    ValidateQueue(v8);

  }
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v10, v5);

}

- (void)_requestRemoteViewControllerForSequence:(id)a3 completionHander:(id)a4
{
  id v7;
  void (**v8)(id, id, id);
  _BOOL4 v9;
  int v10;
  _BOOL4 v11;
  _BOOL4 v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  id v22;
  void *v23;
  NSObject *v24;
  void *v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void *v32;
  NSObject *v33;
  void *v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void *v36;
  id v37;
  void *v38;
  NSObject *v39;
  void *v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  id v42;
  uint64_t v43;
  void *v44;
  NSObject *v45;
  id v46;
  NSObject *v47;
  _BOOL4 v48;
  id v49;
  void *v50;
  void (**v51)(id, id, id);
  uint64_t v52;
  void *v53;
  uint64_t v54;
  unint64_t v55;
  void *v56;
  NSObject *v57;
  id v58;
  id v59;
  id v60;
  void *v61;
  id WeakRetained;
  void *v63;
  void *v64;
  void *v65;
  dispatch_semaphore_t v66;
  uint64_t v67;
  NSObject *v68;
  NSObject *v69;
  id v70;
  id v71;
  void (**v72)(void);
  id v73;
  _QWORD v74[4];
  NSObject *v75;
  _QWORD v76[4];
  id v77;
  NSObject *v78;
  WGWidgetHostingViewController *v79;
  void (**v80)(void);
  uint64_t *v81;
  SEL v82;
  id v83;
  _QWORD v84[4];
  void (**v85)(id, id, id);
  id location;
  id v87;
  _QWORD v88[4];
  id v89;
  id v90;
  _BYTE *v91;
  uint64_t *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t *v95;
  uint64_t v96;
  uint64_t (*v97)(uint64_t, uint64_t);
  void (*v98)(uint64_t);
  id v99;
  _BYTE v100[24];
  uint64_t (*v101)(uint64_t, uint64_t);
  _BYTE v102[20];
  uint8_t buf[4];
  id v104;
  __int16 v105;
  WGWidgetHostingViewController *v106;
  __int16 v107;
  id v108;
  __int16 v109;
  void *v110;
  uint64_t v111;

  v111 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (void (**)(id, id, id))a4;
  v9 = -[WGWidgetHostingViewController _isActiveSequence:](self, "_isActiveSequence:", v7);
  v10 = objc_msgSend((id)objc_opt_class(), "_canWidgetHostRequestRemoteViewControllerForSequence:", v7);
  if (v9 && v10)
  {
    v11 = -[WGWidgetHostingViewController _isBlacklisted](self, "_isBlacklisted");
    v12 = -[WGWidgetHostingViewController isLockedOut](self, "isLockedOut");
    if (!v11 && !v12)
    {
      *(_QWORD *)v100 = 0;
      *(_QWORD *)&v100[8] = v100;
      *(_QWORD *)&v100[16] = 0x3032000000;
      v101 = __Block_byref_object_copy__5;
      *(_QWORD *)v102 = __Block_byref_object_dispose__5;
      *(_QWORD *)&v102[8] = 0;
      v94 = 0;
      v95 = &v94;
      v96 = 0x3032000000;
      v97 = __Block_byref_object_copy__5;
      v98 = __Block_byref_object_dispose__5;
      v99 = (id)MEMORY[0x219A0A970](v8);
      -[WGWidgetHostingViewController _remoteViewControllerConnectionHandler](self, "_remoteViewControllerConnectionHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v88[0] = MEMORY[0x24BDAC760];
      v88[1] = 3221225472;
      v88[2] = __90__WGWidgetHostingViewController__requestRemoteViewControllerForSequence_completionHander___block_invoke;
      v88[3] = &unk_24D732848;
      v71 = v13;
      v90 = v71;
      v14 = v7;
      v89 = v14;
      v91 = v100;
      v92 = &v94;
      v93 = 2;
      v72 = (void (**)(void))MEMORY[0x219A0A970](v88);
      if (-[WGWidgetHostingViewController _connectionState](self, "_connectionState") == 1)
      {
        v15 = (id)WGLogWidgets;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          -[WGWidgetHostingViewController widgetIdentifier](self, "widgetIdentifier");
          v16 = (id)objc_claimAutoreleasedReturnValue();
          -[WGWidgetHostingViewController _containerIdentifier](self, "_containerIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v104 = v16;
          v105 = 2050;
          v106 = self;
          v107 = 2114;
          v108 = v17;
          _os_log_impl(&dword_2172E1000, v15, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Already have an outstanding request, so updating connection handler",
            buf,
            0x20u);

        }
        v73 = 0;
        objc_msgSend(v14, "beginTransitionToState:error:", 2, &v73);
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = (uint64_t)v73;
        v20 = *(void **)(*(_QWORD *)&v100[8] + 40);
        *(_QWORD *)(*(_QWORD *)&v100[8] + 40) = v18;

        if (*(_QWORD *)(*(_QWORD *)&v100[8] + 40) | v19)
        {
          if (v19)
          {
            v21 = (id)WGLogWidgets;
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              WGStringFromWidgetLifeCycleSequenceState(2uLL);
              objc_claimAutoreleasedReturnValue();
              -[WGWidgetHostingViewController _requestRemoteViewControllerForSequence:completionHander:].cold.1();
            }

            objc_initWeak(&location, self);
            if (v8)
            {
              v22 = objc_loadWeakRetained(&location);
              v8[2](v8, v22, v14);

            }
            objc_destroyWeak(&location);
            goto LABEL_64;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WGWidgetHostingViewController.m"), 982, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("endTransitionBlock || error"));

        }
        -[WGWidgetHostingViewController _setRemoteViewControllerConnectionHandler:](self, "_setRemoteViewControllerConnectionHandler:", v72);
LABEL_64:

        _Block_object_dispose(&v94, 8);
        _Block_object_dispose(v100, 8);

        goto LABEL_65;
      }
      if (-[_WGWidgetRemoteViewController _isValid](self->_remoteViewController, "_isValid"))
      {
        v87 = 0;
        objc_msgSend(v14, "beginTransitionToState:error:", 2, &v87);
        v43 = objc_claimAutoreleasedReturnValue();
        v19 = (uint64_t)v87;
        v44 = *(void **)(*(_QWORD *)&v100[8] + 40);
        *(_QWORD *)(*(_QWORD *)&v100[8] + 40) = v43;

        if (*(_QWORD *)(*(_QWORD *)&v100[8] + 40) | v19)
        {
          if (v19)
          {
            v45 = (id)WGLogWidgets;
            if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
            {
              WGStringFromWidgetLifeCycleSequenceState(2uLL);
              objc_claimAutoreleasedReturnValue();
              -[WGWidgetHostingViewController _requestRemoteViewControllerForSequence:completionHander:].cold.1();
            }

            objc_initWeak(&location, self);
            if (v8)
            {
              v46 = objc_loadWeakRetained(&location);
              v8[2](v8, v46, v14);

            }
            objc_destroyWeak(&location);
            goto LABEL_64;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WGWidgetHostingViewController.m"), 849, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("endTransitionBlock || error"));

        }
        -[WGWidgetHostingViewController _setRemoteViewControllerConnectionHandler:](self, "_setRemoteViewControllerConnectionHandler:", 0);
        if (v72)
          v72[2]();
        goto LABEL_64;
      }
      -[WGWidgetInfo extension](self->_widgetInfo, "extension");
      v19 = objc_claimAutoreleasedReturnValue();
      v47 = (id)WGLogWidgets;
      v48 = os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT);
      if (!v19)
      {
        if (v48)
        {
          -[WGWidgetHostingViewController widgetIdentifier](self, "widgetIdentifier");
          v59 = (id)objc_claimAutoreleasedReturnValue();
          -[WGWidgetHostingViewController _containerIdentifier](self, "_containerIdentifier");
          v60 = (id)objc_claimAutoreleasedReturnValue();
          -[WGWidgetHostingViewController widgetIdentifier](self, "widgetIdentifier");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v104 = v59;
          v105 = 2050;
          v106 = self;
          v107 = 2114;
          v108 = v60;
          v109 = 2114;
          v110 = v61;
          _os_log_impl(&dword_2172E1000, v47, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> No extension found for identifier (%{public}@)",
            buf,
            0x2Au);

        }
        objc_initWeak((id *)buf, self);
        if (v8)
        {
          WeakRetained = objc_loadWeakRetained((id *)buf);
          v8[2](v8, WeakRetained, v14);

        }
        objc_destroyWeak((id *)buf);
        goto LABEL_64;
      }
      if (v48)
      {
        -[WGWidgetHostingViewController widgetIdentifier](self, "widgetIdentifier");
        v70 = (id)objc_claimAutoreleasedReturnValue();
        -[WGWidgetHostingViewController _containerIdentifier](self, "_containerIdentifier");
        v49 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v19, "wg_description");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v104 = v70;
        v105 = 2050;
        v106 = self;
        v107 = 2114;
        v108 = v49;
        v109 = 2114;
        v110 = v50;
        _os_log_impl(&dword_2172E1000, v47, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Will request remote view controller from extension %{public}@",
          buf,
          0x2Au);

      }
      SuspendQueueIfNecessary(self->_proxyRequestQueue);
      v84[0] = MEMORY[0x24BDAC760];
      v84[1] = 3221225472;
      v84[2] = __90__WGWidgetHostingViewController__requestRemoteViewControllerForSequence_completionHander___block_invoke_112;
      v84[3] = &unk_24D732820;
      v51 = v8;
      v85 = v51;
      v52 = MEMORY[0x219A0A970](v84);
      v53 = (void *)v95[5];
      v95[5] = v52;

      v83 = 0;
      objc_msgSend(v14, "beginTransitionToState:error:", 2, &v83);
      v54 = objc_claimAutoreleasedReturnValue();
      v55 = (unint64_t)v83;
      v56 = *(void **)(*(_QWORD *)&v100[8] + 40);
      *(_QWORD *)(*(_QWORD *)&v100[8] + 40) = v54;

      if (*(_QWORD *)(*(_QWORD *)&v100[8] + 40) | v55)
      {
        if (v55)
        {
          v57 = (id)WGLogWidgets;
          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
          {
            WGStringFromWidgetLifeCycleSequenceState(2uLL);
            objc_claimAutoreleasedReturnValue();
            -[WGWidgetHostingViewController _requestRemoteViewControllerForSequence:completionHander:].cold.1();
          }

          objc_initWeak(&location, self);
          if (v51)
          {
            v58 = objc_loadWeakRetained(&location);
            v51[2](v51, v58, v14);

          }
          objc_destroyWeak(&location);
          goto LABEL_63;
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WGWidgetHostingViewController.m"), 871, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("endTransitionBlock || error"));

      }
      v66 = dispatch_semaphore_create(0);
      v67 = MEMORY[0x24BDAC760];
      v76[0] = MEMORY[0x24BDAC760];
      v76[1] = 3221225472;
      v76[2] = __90__WGWidgetHostingViewController__requestRemoteViewControllerForSequence_completionHander___block_invoke_113;
      v76[3] = &unk_24D7328E8;
      v80 = v72;
      v77 = (id)v19;
      v68 = v66;
      v81 = &v94;
      v82 = a2;
      v78 = v68;
      v79 = self;
      -[WGWidgetHostingViewController _enqueueRequest:inQueue:trampolinedToMainQueue:withDescription:](self, "_enqueueRequest:inQueue:trampolinedToMainQueue:withDescription:", v76, self->_proxyConnectionQueue, 1, CFSTR("Requesting remote view controller"));
      v74[0] = v67;
      v74[1] = 3221225472;
      v74[2] = __90__WGWidgetHostingViewController__requestRemoteViewControllerForSequence_completionHander___block_invoke_137;
      v74[3] = &unk_24D732910;
      v69 = v68;
      v75 = v69;
      -[WGWidgetHostingViewController _enqueueRequest:inQueue:trampolinedToMainQueue:withDescription:](self, "_enqueueRequest:inQueue:trampolinedToMainQueue:withDescription:", v74, self->_proxyConnectionQueue, 0, CFSTR("Blocking proxy connetion queue on connection semaphore"));

LABEL_63:
      goto LABEL_64;
    }
    if (v11)
    {
      v28 = (void *)WGLogWidgets;
      if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
      {
        v29 = v28;
        -[WGWidgetHostingViewController widgetIdentifier](self, "widgetIdentifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[WGWidgetHostingViewController _containerIdentifier](self, "_containerIdentifier");
        v31 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v100 = 138543874;
        *(_QWORD *)&v100[4] = v30;
        *(_WORD *)&v100[12] = 2050;
        *(_QWORD *)&v100[14] = self;
        *(_WORD *)&v100[22] = 2114;
        v101 = v31;
        _os_log_impl(&dword_2172E1000, v29, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Can't request remote view controller that is blacklisted",
          v100,
          0x20u);

      }
    }
    else if (v12)
    {
      v38 = (void *)WGLogWidgets;
      if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
      {
        v39 = v38;
        -[WGWidgetHostingViewController widgetIdentifier](self, "widgetIdentifier");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[WGWidgetHostingViewController _containerIdentifier](self, "_containerIdentifier");
        v41 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v100 = 138543874;
        *(_QWORD *)&v100[4] = v40;
        *(_WORD *)&v100[12] = 2050;
        *(_QWORD *)&v100[14] = self;
        *(_WORD *)&v100[22] = 2114;
        v101 = v41;
        _os_log_impl(&dword_2172E1000, v39, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Can't request remote view controller that is locked out",
          v100,
          0x20u);

      }
    }
    objc_initWeak((id *)v100, self);
    if (v8)
    {
      v42 = objc_loadWeakRetained((id *)v100);
      v8[2](v8, v42, v7);

    }
  }
  else
  {
    if (v9)
    {
      if ((v10 & 1) == 0)
      {
        v23 = (void *)WGLogWidgets;
        if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
        {
          v24 = v23;
          -[WGWidgetHostingViewController widgetIdentifier](self, "widgetIdentifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[WGWidgetHostingViewController _containerIdentifier](self, "_containerIdentifier");
          v26 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
          WGStringFromWidgetLifeCycleSequenceState(1uLL);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v100 = 138544386;
          *(_QWORD *)&v100[4] = v25;
          *(_WORD *)&v100[12] = 2050;
          *(_QWORD *)&v100[14] = self;
          *(_WORD *)&v100[22] = 2114;
          v101 = v26;
          *(_WORD *)v102 = 2114;
          *(_QWORD *)&v102[2] = v7;
          *(_WORD *)&v102[10] = 2114;
          *(_QWORD *)&v102[12] = v27;
          _os_log_impl(&dword_2172E1000, v24, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Can't request remote view controller as argument sequence (%"
            "{public}@) isn't in expected state (%{public}@)",
            v100,
            0x34u);

        }
      }
    }
    else
    {
      v32 = (void *)WGLogWidgets;
      if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
      {
        v33 = v32;
        -[WGWidgetHostingViewController widgetIdentifier](self, "widgetIdentifier");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[WGWidgetHostingViewController _containerIdentifier](self, "_containerIdentifier");
        v35 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
        -[WGWidgetHostingViewController _activeLifeCycleSequence](self, "_activeLifeCycleSequence");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v100 = 138544386;
        *(_QWORD *)&v100[4] = v34;
        *(_WORD *)&v100[12] = 2050;
        *(_QWORD *)&v100[14] = self;
        *(_WORD *)&v100[22] = 2114;
        v101 = v35;
        *(_WORD *)v102 = 2114;
        *(_QWORD *)&v102[2] = v7;
        *(_WORD *)&v102[10] = 2114;
        *(_QWORD *)&v102[12] = v36;
        _os_log_impl(&dword_2172E1000, v33, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Can't request remote view controller as argument sequence (%{p"
          "ublic}@) doesn't match active sequence (%{public}@)",
          v100,
          0x34u);

      }
    }
    objc_initWeak((id *)v100, self);
    if (v8)
    {
      v37 = objc_loadWeakRetained((id *)v100);
      v8[2](v8, v37, v7);

    }
  }
  objc_destroyWeak((id *)v100);
LABEL_65:

}

void __90__WGWidgetHostingViewController__requestRemoteViewControllerForSequence_completionHander___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  int v13;
  int v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  const char *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  int v27;
  NSObject *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  NSObject *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  NSObject *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  v8 = (void *)WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    objc_msgSend(v5, "widgetIdentifier");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_containerIdentifier");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(void **)(a1 + 32);
    v27 = 138544130;
    v28 = v10;
    v29 = 2050;
    v30 = v5;
    v31 = 2114;
    v32 = v11;
    v33 = 2114;
    v34 = v12;
    _os_log_impl(&dword_2172E1000, v9, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Handling connection for sequence '%{public}@'",
      (uint8_t *)&v27,
      0x2Au);

  }
  if (!v6)
  {
    v13 = objc_msgSend(v5, "_isActiveSequence:", *(_QWORD *)(a1 + 32));
    v14 = objc_msgSend(*(id *)(a1 + 32), "isCurrentStateAtLeast:", 1);
    if (v13 && v14)
    {
      (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) + 16))();
      v15 = objc_claimAutoreleasedReturnValue();
      if (!v15)
        goto LABEL_19;
      v16 = (void *)WGLogWidgets;
      if (!os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
        goto LABEL_19;
      v17 = v16;
      objc_msgSend(v5, "widgetIdentifier");
      v18 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_containerIdentifier");
      v19 = objc_claimAutoreleasedReturnValue();
      WGStringFromWidgetLifeCycleSequenceState(*(_QWORD *)(a1 + 64));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138544386;
      v28 = v18;
      v29 = 2050;
      v30 = v5;
      v31 = 2114;
      v32 = v19;
      v33 = 2114;
      v34 = v20;
      v35 = 2114;
      v36 = v15;
      _os_log_impl(&dword_2172E1000, v17, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Encountered error transitioning to target state '%{public}@': %{public}@",
        (uint8_t *)&v27,
        0x34u);

    }
    else
    {
      if ((v13 & 1) != 0)
      {
        if ((v14 & 1) != 0
          || (v21 = (void *)WGLogWidgets, !os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT)))
        {
LABEL_20:
          v26 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
          if (v26)
            (*(void (**)(uint64_t, id, _QWORD))(v26 + 16))(v26, v5, *(_QWORD *)(a1 + 32));
          goto LABEL_22;
        }
        v15 = v21;
        objc_msgSend(v5, "widgetIdentifier");
        v17 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "_containerIdentifier");
        v18 = objc_claimAutoreleasedReturnValue();
        v22 = *(void **)(a1 + 32);
        WGStringFromWidgetLifeCycleSequenceState(1uLL);
        v19 = objc_claimAutoreleasedReturnValue();
        v27 = 138544386;
        v28 = v17;
        v29 = 2050;
        v30 = v5;
        v31 = 2114;
        v32 = v18;
        v33 = 2114;
        v34 = v22;
        v35 = 2114;
        v36 = v19;
        v23 = "<%{public}@: %{public}p; container: %{public}@> Argument sequence (%{public}@) isn't in expected state (%{public}@)";
      }
      else
      {
        v24 = (void *)WGLogWidgets;
        if (!os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
          goto LABEL_20;
        v15 = v24;
        objc_msgSend(v5, "widgetIdentifier");
        v17 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "_containerIdentifier");
        v18 = objc_claimAutoreleasedReturnValue();
        v25 = *(void **)(a1 + 32);
        objc_msgSend(v5, "_activeLifeCycleSequence");
        v19 = objc_claimAutoreleasedReturnValue();
        v27 = 138544386;
        v28 = v17;
        v29 = 2050;
        v30 = v5;
        v31 = 2114;
        v32 = v18;
        v33 = 2114;
        v34 = v25;
        v35 = 2114;
        v36 = v19;
        v23 = "<%{public}@: %{public}p; container: %{public}@> Argument sequence (%{public}@) doesn't match active sequence (%{public}@)";
      }
      _os_log_impl(&dword_2172E1000, v15, OS_LOG_TYPE_DEFAULT, v23, (uint8_t *)&v27, 0x34u);
    }

LABEL_19:
    goto LABEL_20;
  }
LABEL_22:

}

void __90__WGWidgetHostingViewController__requestRemoteViewControllerForSequence_completionHander___block_invoke_112(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend(v8, "_proxyRequestQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ResumeQueueIfNecessary(v6);

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v8, v5);

}

void __90__WGWidgetHostingViewController__requestRemoteViewControllerForSequence_completionHander___block_invoke_113(uint64_t a1, void *a2, void *a3, int a4)
{
  id v7;
  id v8;
  int v9;
  int v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _BOOL8 v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  const char *v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  _QWORD v56[4];
  id v57;
  id v58;
  id v59;
  uint64_t v60;
  __int128 v61;
  uint8_t buf[4];
  void *v63;
  __int16 v64;
  id v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  id v69;
  __int16 v70;
  void *v71;
  _QWORD v72[3];
  CGSize v73;
  CGSize v74;
  UIEdgeInsets v75;
  CGRect v76;
  UIEdgeInsets v77;

  v72[1] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = objc_msgSend(v7, "_isActiveSequence:", v8);
  v10 = objc_msgSend(v8, "isCurrentState:", 1);
  if (a4 && v9 && v10)
  {
    v11 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      objc_msgSend(v7, "widgetIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_containerIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v63 = v13;
      v64 = 2050;
      v65 = v7;
      v66 = 2114;
      v67 = v14;
      _os_log_impl(&dword_2172E1000, v12, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Establishing remote view controller connection...",
        buf,
        0x20u);

    }
    objc_msgSend(v7, "_setRemoteViewControllerConnectionHandler:", *(_QWORD *)(a1 + 56));
    objc_msgSend(v7, "_setConnectionState:", 1);
    v15 = objc_alloc_init(MEMORY[0x24BDD1560]);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "widgetIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      v18 = WGLogWidgets;
      if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_ERROR))
        __90__WGWidgetHostingViewController__requestRemoteViewControllerForSequence_completionHander___block_invoke_113_cold_1(v18, v19, v20);
    }
    if (objc_msgSend(v17, "length"))
      objc_msgSend(v16, "setObject:forKey:", v17, *MEMORY[0x24BDE27C8]);
    objc_msgSend(v7, "_containerIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v21, "length"))
    {
      v22 = (void *)WGLogWidgets;
      if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
      {
        v23 = v22;
        objc_msgSend(v7, "widgetIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "_containerIdentifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v63 = v24;
        v64 = 2050;
        v65 = v7;
        v66 = 2114;
        v67 = v25;
        _os_log_impl(&dword_2172E1000, v23, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> No container identifier",
          buf,
          0x20u);

      }
    }
    if (objc_msgSend(v21, "length"))
      objc_msgSend(v16, "setObject:forKey:", v21, *MEMORY[0x24BDE2780]);
    objc_msgSend(v7, "widgetInfo");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "isLinkedOnOrAfterSystemVersion:", CFSTR("10.0"));

    if ((v27 & 1) == 0)
    {
      objc_msgSend(v7, "_marginInsets");
      NSStringFromUIEdgeInsets(v75);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKey:", v28, *MEMORY[0x24BDE2788]);

    }
    objc_msgSend(v7, "_maxSizeForDisplayMode:", 0);
    NSStringFromCGSize(v73);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v29, *MEMORY[0x24BDE27A8]);

    objc_msgSend(v7, "_maxSizeForDisplayMode:", 1);
    NSStringFromCGSize(v74);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v30, *MEMORY[0x24BDE27B0]);

    objc_msgSend(v7, "view");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "bounds");
    NSStringFromCGRect(v76);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v32, *MEMORY[0x24BDE2798]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v7, "userSpecifiedDisplayMode"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v33, *MEMORY[0x24BDE2790]);

    v34 = objc_msgSend(v7, "_appearState") != 0;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v35, *MEMORY[0x24BDE27B8]);

    objc_msgSend(v7, "_layoutMargins");
    NSStringFromUIEdgeInsets(v77);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v36, *MEMORY[0x24BDE27A0]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", __WGWidgetSnapshotDebugLabelsEnabled);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v37, *MEMORY[0x24BDE27C0]);

    objc_msgSend(v15, "setUserInfo:", v16);
    v72[0] = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v72, 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = *(void **)(a1 + 32);
    v56[0] = MEMORY[0x24BDAC760];
    v56[1] = 3221225472;
    v56[2] = __90__WGWidgetHostingViewController__requestRemoteViewControllerForSequence_completionHander___block_invoke_120;
    v56[3] = &unk_24D7328C0;
    v57 = v7;
    v58 = *(id *)(a1 + 40);
    v40 = *(id *)(a1 + 32);
    v61 = *(_OWORD *)(a1 + 64);
    v41 = *(_QWORD *)(a1 + 48);
    v59 = v40;
    v60 = v41;
    objc_msgSend(v39, "instantiateViewControllerWithInputItems:connectionHandler:", v38, v56);

    goto LABEL_34;
  }
  if ((a4 & 1) != 0)
  {
    if ((v9 & 1) != 0)
    {
      if ((v10 & 1) != 0)
        goto LABEL_30;
      v42 = (void *)WGLogWidgets;
      if (!os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
        goto LABEL_30;
      v43 = v42;
      objc_msgSend(v7, "widgetIdentifier");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_containerIdentifier");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      WGStringFromWidgetLifeCycleSequenceState(1uLL);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v63 = v44;
      v64 = 2050;
      v65 = v7;
      v66 = 2114;
      v67 = v45;
      v68 = 2114;
      v69 = v8;
      v70 = 2114;
      v71 = v46;
      v47 = "<%{public}@: %{public}p; container: %{public}@> Can't request remote view controller as argument sequence (%"
            "{public}@) isn't in expected state (%{public}@)";
      goto LABEL_28;
    }
    v49 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      v43 = v49;
      objc_msgSend(v7, "widgetIdentifier");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_containerIdentifier");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_activeLifeCycleSequence");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v63 = v44;
      v64 = 2050;
      v65 = v7;
      v66 = 2114;
      v67 = v45;
      v68 = 2114;
      v69 = v8;
      v70 = 2114;
      v71 = v46;
      v47 = "<%{public}@: %{public}p; container: %{public}@> Can't request remote view controller as argument sequence (%"
            "{public}@) doesn't match active sequence (%{public}@)";
LABEL_28:
      _os_log_impl(&dword_2172E1000, v43, OS_LOG_TYPE_DEFAULT, v47, buf, 0x34u);

      goto LABEL_29;
    }
  }
  else
  {
    v48 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      v43 = v48;
      objc_msgSend(v7, "widgetIdentifier");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_containerIdentifier");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v63 = v44;
      v64 = 2050;
      v65 = v7;
      v66 = 2114;
      v67 = v45;
      _os_log_impl(&dword_2172E1000, v43, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Can't request remote view controller as queue is no longer valid",
        buf,
        0x20u);
LABEL_29:

    }
  }
LABEL_30:
  v50 = (void *)WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    v51 = v50;
    objc_msgSend(v7, "widgetIdentifier");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_containerIdentifier");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138544130;
    v63 = v52;
    v64 = 2050;
    v65 = v7;
    v66 = 2114;
    v67 = v53;
    v68 = 2114;
    v69 = v54;
    _os_log_impl(&dword_2172E1000, v51, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Signaling connection semaphore (%{public}@)",
      buf,
      0x2Au);

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  v55 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  if (v55)
    (*(void (**)(uint64_t, id, id))(v55 + 16))(v55, v7, v8);
LABEL_34:

}

void __90__WGWidgetHostingViewController__requestRemoteViewControllerForSequence_completionHander___block_invoke_120(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  _QWORD block[4];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  id v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = (void *)WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(void **)(a1 + 32);
    v12 = v10;
    objc_msgSend(v11, "widgetIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(void **)(a1 + 32);
    objc_msgSend(v14, "_containerIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v31 = v13;
    v32 = 2050;
    v33 = v14;
    v34 = 2114;
    v35 = v15;
    _os_log_impl(&dword_2172E1000, v12, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Extension called handler",
      buf,
      0x20u);

  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __90__WGWidgetHostingViewController__requestRemoteViewControllerForSequence_completionHander___block_invoke_121;
  block[3] = &unk_24D732898;
  v22 = *(id *)(a1 + 32);
  v23 = *(id *)(a1 + 40);
  v24 = v7;
  v25 = v9;
  v16 = *(id *)(a1 + 48);
  v29 = *(_OWORD *)(a1 + 64);
  v17 = *(_QWORD *)(a1 + 56);
  v26 = v16;
  v27 = v17;
  v28 = v8;
  v18 = v8;
  v19 = v9;
  v20 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __90__WGWidgetHostingViewController__requestRemoteViewControllerForSequence_completionHander___block_invoke_121(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id *v24;
  id v25;
  uint64_t v26;
  void *v27;
  void (**v28)(_QWORD, _QWORD, _QWORD);
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(uint64_t);
  void *v45;
  id v46;
  _QWORD v47[4];
  id v48;
  void (**v49)(_QWORD, _QWORD, _QWORD);
  uint64_t v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "widgetIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v6, "_containerIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v52 = v5;
    v53 = 2050;
    v54 = v6;
    v55 = 2114;
    v56 = v7;
    _os_log_impl(&dword_2172E1000, v4, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Handling new connection",
      buf,
      0x20u);

  }
  v8 = (void *)WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(void **)(a1 + 32);
    v10 = v8;
    objc_msgSend(v9, "widgetIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(void **)(a1 + 32);
    objc_msgSend(v12, "_containerIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138544130;
    v52 = v11;
    v53 = 2050;
    v54 = v12;
    v55 = 2114;
    v56 = v13;
    v57 = 2114;
    v58 = v14;
    _os_log_impl(&dword_2172E1000, v10, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Signaling connection semaphore (%{public}@)",
      buf,
      0x2Au);

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_setExtensionRequest:", *(_QWORD *)(a1 + 48));
  if (*(_QWORD *)(a1 + 56))
  {
    v15 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      v16 = *(void **)(a1 + 32);
      v17 = v15;
      objc_msgSend(v16, "widgetIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *(void **)(a1 + 32);
      objc_msgSend(v19, "_containerIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 64), "identifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "localizedDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v52 = v18;
      v53 = 2050;
      v54 = v19;
      v55 = 2114;
      v56 = v20;
      v57 = 2114;
      v58 = v21;
      v59 = 2114;
      v60 = v22;
      _os_log_impl(&dword_2172E1000, v17, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Unable to load widget view controller with service (%{public}@): %{public}@",
        buf,
        0x34u);

    }
    v23 = *(void **)(a1 + 32);
    v47[0] = MEMORY[0x24BDAC760];
    v47[1] = 3221225472;
    v47[2] = __90__WGWidgetHostingViewController__requestRemoteViewControllerForSequence_completionHander___block_invoke_122;
    v47[3] = &unk_24D732870;
    v24 = &v48;
    v48 = *(id *)(a1 + 64);
    v25 = *(id *)(a1 + 56);
    v26 = *(_QWORD *)(a1 + 88);
    v49 = (void (**)(_QWORD, _QWORD, _QWORD))v25;
    v50 = v26;
    objc_msgSend(*(id *)(a1 + 32), "_proxyConnectionQueue");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "_enqueueRequest:inQueue:trampolinedToMainQueue:withDescription:", v47, v27, 1, CFSTR("Finishing disconnection for failed connection"));

    v28 = v49;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_extensionRequest");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v29)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 72), CFSTR("WGWidgetHostingViewController.m"), 926, CFSTR("Extension request is nil"));

    }
    v30 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      v31 = *(void **)(a1 + 32);
      v32 = v30;
      objc_msgSend(v31, "widgetIdentifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = *(void **)(a1 + 32);
      objc_msgSend(v34, "_containerIdentifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v52 = v33;
      v53 = 2050;
      v54 = v34;
      v55 = 2114;
      v56 = v35;
      _os_log_impl(&dword_2172E1000, v32, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Established remote view controller connection",
        buf,
        0x20u);

    }
    objc_msgSend(*(id *)(a1 + 32), "_setConnectionState:", 0);
    objc_msgSend(*(id *)(a1 + 32), "_setRemoteViewController:", *(_QWORD *)(a1 + 80));
    objc_msgSend(*(id *)(a1 + 32), "_remoteViewController");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setInheritsSecurity:", 1);

    objc_msgSend(*(id *)(a1 + 32), "_remoteViewController");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "_setValid:", 1);

    objc_msgSend(*(id *)(a1 + 32), "_remoteViewController");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setManagingHost:", *(_QWORD *)(a1 + 32));

    objc_msgSend(*(id *)(a1 + 32), "_remoteViewController");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setServiceViewShouldShareTouchesWithHost:", 1);

    objc_msgSend(*(id *)(a1 + 32), "_remoteViewController");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "_setShouldUpdateRemoteTextEffectsWindow:", 0);

    v42 = MEMORY[0x24BDAC760];
    v43 = 3221225472;
    v44 = __90__WGWidgetHostingViewController__requestRemoteViewControllerForSequence_completionHander___block_invoke_131;
    v45 = &unk_24D7314D8;
    v24 = &v46;
    v46 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x24BDAC9B8], &v42);
    objc_msgSend(*(id *)(a1 + 32), "_remoteViewControllerConnectionHandler", v42, v43, v44, v45);
    v28 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_setRemoteViewControllerConnectionHandler:", 0);
    if (v28)
      v28[2](v28, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
  }

}

void __90__WGWidgetHostingViewController__requestRemoteViewControllerForSequence_completionHander___block_invoke_122(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = *(void **)(a1 + 32);
  v7 = a3;
  v8 = a2;
  objc_msgSend(v6, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "localizedDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("Unable to load widget view controller with service (%@): %@"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x24BDD1540];
  v13 = *MEMORY[0x24BDD1398];
  v17[0] = *MEMORY[0x24BDD0FC8];
  v17[1] = v13;
  v14 = *(_QWORD *)(a1 + 40);
  v18[0] = v11;
  v18[1] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("WGWidgetHostingViewControllerErrorDomain"), 0, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "_finishDisconnectingRemoteViewControllerForSequence:error:completion:", v7, v16, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
}

void __90__WGWidgetHostingViewController__requestRemoteViewControllerForSequence_completionHander___block_invoke_131(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "remoteViewControllerDidConnectForWidget:", *(_QWORD *)(a1 + 32));

}

void __90__WGWidgetHostingViewController__requestRemoteViewControllerForSequence_completionHander___block_invoke_137(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    objc_msgSend(v5, "widgetIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_containerIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 32);
    v17 = 138544130;
    v18 = v9;
    v19 = 2050;
    v20 = v5;
    v21 = 2114;
    v22 = v10;
    v23 = 2114;
    v24 = v11;
    _os_log_impl(&dword_2172E1000, v8, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Waiting on connection semaphore (%{public}@)",
      (uint8_t *)&v17,
      0x2Au);

  }
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL);
  v12 = (void *)WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    v13 = v12;
    objc_msgSend(v5, "widgetIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_containerIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(a1 + 32);
    v17 = 138544130;
    v18 = v14;
    v19 = 2050;
    v20 = v5;
    v21 = 2114;
    v22 = v15;
    v23 = 2114;
    v24 = v16;
    _os_log_impl(&dword_2172E1000, v13, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> No longer waiting on connection semaphore (%{public}@)",
      (uint8_t *)&v17,
      0x2Au);

  }
}

- (void)_setImplementsPerformUpdate:(BOOL)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _BOOL4 implementsPerformUpdate;
  const __CFString *v10;
  int v11;
  void *v12;
  __int16 v13;
  WGWidgetHostingViewController *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (self->_implementsPerformUpdate != a3)
  {
    self->_implementsPerformUpdate = a3;
    v4 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      v5 = v4;
      -[WGWidgetHostingViewController widgetIdentifier](self, "widgetIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[WGWidgetHostingViewController _containerIdentifier](self, "_containerIdentifier");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v7;
      implementsPerformUpdate = self->_implementsPerformUpdate;
      v11 = 138544130;
      v12 = v6;
      v13 = 2050;
      if (implementsPerformUpdate)
        v10 = CFSTR("does");
      else
        v10 = CFSTR("does not");
      v14 = self;
      v15 = 2114;
      v16 = v7;
      v17 = 2114;
      v18 = v10;
      _os_log_impl(&dword_2172E1000, v5, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Recording that widget %{public}@ implement 'performUpdate...'",
        (uint8_t *)&v11,
        0x2Au);

    }
  }
}

- (void)_performUpdateForSequence:(id)a3 withCompletionHandler:(id)a4
{
  id v5;
  BOOL v6;
  _BOOL4 v7;
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  dispatch_semaphore_t v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  void *v19;
  NSObject *v20;
  id v21;
  _QWORD block[4];
  NSObject *v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  NSObject *v28;
  id v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  WGWidgetHostingViewController *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  if (-[WGWidgetHostingViewController implementsPerformUpdate](self, "implementsPerformUpdate"))
  {
    v6 = -[WGWidgetHostingViewController _didUpdate](self, "_didUpdate");
    v7 = 1;
    if (v5)
    {
      if (!v6)
      {
        -[WGWidgetHostingViewController _remoteViewController](self, "_remoteViewController");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "_isValid");

        if (v9)
        {
          -[WGWidgetHostingViewController _setDidUpdate:](self, "_setDidUpdate:", 1);
          v10 = (void *)WGLogWidgets;
          if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
          {
            v11 = v10;
            -[WGWidgetHostingViewController widgetIdentifier](self, "widgetIdentifier");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            -[WGWidgetHostingViewController _containerIdentifier](self, "_containerIdentifier");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v32 = v12;
            v33 = 2050;
            v34 = self;
            v35 = 2114;
            v36 = v13;
            _os_log_impl(&dword_2172E1000, v11, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Performing update",
              buf,
              0x20u);

          }
          objc_initWeak((id *)buf, self);
          dispatch_get_global_queue(25, 0);
          v14 = objc_claimAutoreleasedReturnValue();
          v7 = v14 == 0;
          if (v14)
          {
            v15 = dispatch_semaphore_create(0);
            v16 = MEMORY[0x24BDAC760];
            v27[0] = MEMORY[0x24BDAC760];
            v27[1] = 3221225472;
            v27[2] = __81__WGWidgetHostingViewController__performUpdateForSequence_withCompletionHandler___block_invoke;
            v27[3] = &unk_24D732960;
            objc_copyWeak(&v30, (id *)buf);
            v17 = v15;
            v28 = v17;
            v18 = v5;
            v29 = v18;
            v19 = (void *)MEMORY[0x219A0A970](v27);
            block[0] = v16;
            block[1] = 3221225472;
            block[2] = __81__WGWidgetHostingViewController__performUpdateForSequence_withCompletionHandler___block_invoke_2;
            block[3] = &unk_24D7329B0;
            objc_copyWeak(&v26, (id *)buf);
            v23 = v17;
            v24 = v19;
            v25 = v18;
            v20 = v17;
            v21 = v19;
            dispatch_async(v14, block);

            objc_destroyWeak(&v26);
            objc_destroyWeak(&v30);
          }

          objc_destroyWeak((id *)buf);
        }
      }
    }
  }
  else
  {
    v7 = 1;
  }
  if (v5 && v7)
    (*((void (**)(id, uint64_t, BOOL))v5 + 2))(v5, 2, -[WGWidgetHostingViewController implementsPerformUpdate](self, "implementsPerformUpdate"));

}

void __81__WGWidgetHostingViewController__performUpdateForSequence_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;
  intptr_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  _QWORD block[5];
  id v15;
  uint64_t v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  const __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v7 = dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  v8 = (void *)WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    objc_msgSend(WeakRetained, "widgetIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_containerIdentifier");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    v13 = CFSTR("did wake");
    *(_DWORD *)buf = 138544130;
    v19 = 2050;
    v18 = v10;
    if (!v7)
      v13 = CFSTR("didn't wake");
    v20 = WeakRetained;
    v21 = 2114;
    v22 = v11;
    v23 = 2114;
    v24 = v13;
    _os_log_impl(&dword_2172E1000, v9, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Signaled update semaphore - %{public}@",
      buf,
      0x2Au);

  }
  if (v7)
  {
    objc_msgSend(WeakRetained, "_setImplementsPerformUpdate:", a3);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __81__WGWidgetHostingViewController__performUpdateForSequence_withCompletionHandler___block_invoke_148;
    block[3] = &unk_24D732938;
    v15 = *(id *)(a1 + 40);
    v16 = a2;
    block[4] = WeakRetained;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

uint64_t __81__WGWidgetHostingViewController__performUpdateForSequence_withCompletionHandler___block_invoke_148(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 32), "implementsPerformUpdate"));
}

void __81__WGWidgetHostingViewController__performUpdateForSequence_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  NSObject *v4;
  dispatch_time_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;

  v2 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __81__WGWidgetHostingViewController__performUpdateForSequence_withCompletionHandler___block_invoke_3;
  block[3] = &unk_24D731A98;
  v3 = (id *)(a1 + 56);
  objc_copyWeak(&v12, (id *)(a1 + 56));
  v11 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  v4 = *(NSObject **)(a1 + 32);
  v5 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v4, v5))
  {
    v7[0] = v2;
    v7[1] = 3221225472;
    v7[2] = __81__WGWidgetHostingViewController__performUpdateForSequence_withCompletionHandler___block_invoke_6;
    v7[3] = &unk_24D731A98;
    objc_copyWeak(&v9, v3);
    v8 = *(id *)(a1 + 48);
    v6 = (void *)MEMORY[0x24BDAC9B8];
    dispatch_async(MEMORY[0x24BDAC9B8], v7);

    objc_destroyWeak(&v9);
  }

  objc_destroyWeak(&v12);
}

void __81__WGWidgetHostingViewController__performUpdateForSequence_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  _QWORD v3[4];
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __81__WGWidgetHostingViewController__performUpdateForSequence_withCompletionHandler___block_invoke_4;
  v3[3] = &unk_24D732720;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(WeakRetained, "_enqueueRemoteServiceRequest:withDescription:", v3, CFSTR("Performing update"));

}

void __81__WGWidgetHostingViewController__performUpdateForSequence_withCompletionHandler___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, int a4)
{
  void *v5;
  _QWORD v6[4];
  id v7;

  if (a4)
  {
    objc_msgSend(a2, "_remoteViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __81__WGWidgetHostingViewController__performUpdateForSequence_withCompletionHandler___block_invoke_5;
    v6[3] = &unk_24D732988;
    v7 = *(id *)(a1 + 32);
    objc_msgSend(v5, "_performUpdateWithReplyHandler:", v6);

  }
  else
  {
    (*(void (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 2, objc_msgSend(a2, "implementsPerformUpdate"));
  }
}

uint64_t __81__WGWidgetHostingViewController__performUpdateForSequence_withCompletionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __81__WGWidgetHostingViewController__performUpdateForSequence_withCompletionHandler___block_invoke_6(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = (void *)WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    objc_msgSend(WeakRetained, "widgetIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_containerIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x219A0A970](*(_QWORD *)(a1 + 32));
    v8 = 138544130;
    v9 = v5;
    v10 = 2050;
    v11 = WeakRetained;
    v12 = 2114;
    v13 = v6;
    v14 = 2114;
    v15 = v7;
    _os_log_impl(&dword_2172E1000, v4, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Update semaphore timed out - calling completion (%{public}@)",
      (uint8_t *)&v8,
      0x2Au);

  }
  (*(void (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 2, objc_msgSend(WeakRetained, "implementsPerformUpdate"));

}

- (void)_updateWidgetWithCompletionHandler:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  _BOOL8 v8;
  void *v9;
  char v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  _QWORD v15[4];
  NSObject *v16;
  NSObject *v17;
  void (**v18)(_QWORD, _QWORD, _QWORD);
  _QWORD v19[4];
  NSObject *v20;
  NSObject *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id location;

  v4 = a3;
  -[WGWidgetHostingViewController _setIgnoringParentAppearState:](self, "_setIgnoringParentAppearState:", 1);
  objc_initWeak(&location, self);
  v5 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __68__WGWidgetHostingViewController__updateWidgetWithCompletionHandler___block_invoke;
  v22[3] = &unk_24D7329D8;
  objc_copyWeak(&v24, &location);
  v6 = v4;
  v23 = v6;
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x219A0A970](v22);
  v8 = -[WGWidgetHostingViewController implementsPerformUpdate](self, "implementsPerformUpdate");
  if (v8
    && (-[WGWidgetHostingViewController _remoteViewController](self, "_remoteViewController"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "_isValid"),
        v9,
        (v10 & 1) == 0))
  {
    v11 = dispatch_group_create();
    dispatch_group_enter(v11);
    dispatch_group_enter(v11);
    v12 = dispatch_group_create();
    dispatch_group_enter(v12);
    v19[0] = v5;
    v19[1] = 3221225472;
    v19[2] = __68__WGWidgetHostingViewController__updateWidgetWithCompletionHandler___block_invoke_2;
    v19[3] = &unk_24D732A00;
    v20 = v12;
    v21 = v11;
    v15[0] = v5;
    v15[1] = 3221225472;
    v15[2] = __68__WGWidgetHostingViewController__updateWidgetWithCompletionHandler___block_invoke_5;
    v15[3] = &unk_24D7327D0;
    v13 = v20;
    v16 = v13;
    v14 = v21;
    v17 = v14;
    v18 = v7;
    -[WGWidgetHostingViewController _beginSequenceWithReason:completion:updateHandler:](self, "_beginSequenceWithReason:completion:updateHandler:", CFSTR("requested update"), v19, v15);

  }
  else
  {
    v7[2](v7, 2, v8);
  }

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

}

uint64_t __68__WGWidgetHostingViewController__updateWidgetWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;
  uint64_t result;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_setIgnoringParentAppearState:", 0);

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a3);
  return result;
}

void __68__WGWidgetHostingViewController__updateWidgetWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__WGWidgetHostingViewController__updateWidgetWithCompletionHandler___block_invoke_3;
  block[3] = &unk_24D731788;
  v11 = v5;
  v12 = v6;
  v7 = *(NSObject **)(a1 + 32);
  v13 = *(id *)(a1 + 40);
  v8 = v6;
  v9 = v5;
  dispatch_group_notify(v7, MEMORY[0x24BDAC9B8], block);

}

void __68__WGWidgetHostingViewController__updateWidgetWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  if ((objc_msgSend(*(id *)(a1 + 32), "wg_isAppearingOrAppeared") & 1) != 0)
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }
  else
  {
    v2 = *(void **)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __68__WGWidgetHostingViewController__updateWidgetWithCompletionHandler___block_invoke_4;
    v4[3] = &unk_24D732660;
    v5 = *(id *)(a1 + 48);
    objc_msgSend(v2, "_endSequence:withReason:completion:", v3, CFSTR("requested update"), v4);

  }
}

void __68__WGWidgetHostingViewController__updateWidgetWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __68__WGWidgetHostingViewController__updateWidgetWithCompletionHandler___block_invoke_5(uint64_t a1, uint64_t a2, char a3)
{
  NSObject *v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  char v10;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__WGWidgetHostingViewController__updateWidgetWithCompletionHandler___block_invoke_6;
  block[3] = &unk_24D732A28;
  v6 = *(NSObject **)(a1 + 40);
  v8 = *(id *)(a1 + 48);
  v9 = a2;
  v10 = a3;
  dispatch_group_notify(v6, MEMORY[0x24BDAC9B8], block);

}

uint64_t __68__WGWidgetHostingViewController__updateWidgetWithCompletionHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (BOOL)_shouldRemoveSnapshotWhenNotVisible
{
  id WeakRetained;
  char v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_host);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(WeakRetained, "shouldRemoveSnapshotWhenNotVisibleForWidget:", self);
  else
    v4 = 0;

  return v4;
}

- (void)_captureSnapshotAndBeginDisappearanceTransitionForSequence:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, id, id);
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id WeakRetained;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void (**v23)(id, id, id);
  id v24;
  _QWORD v25[4];
  id v26;
  void (**v27)(id, id, id);
  uint64_t v28;
  _QWORD v29[4];
  void (**v30)(id, id, id);
  _BYTE location[12];
  __int16 v32;
  WGWidgetHostingViewController *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, id, id))a4;
  if (!-[WGWidgetHostingViewController _isActiveSequence:](self, "_isActiveSequence:", v6))
  {
    v11 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      -[WGWidgetHostingViewController widgetIdentifier](self, "widgetIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[WGWidgetHostingViewController _containerIdentifier](self, "_containerIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[WGWidgetHostingViewController _activeLifeCycleSequence](self, "_activeLifeCycleSequence");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138544386;
      *(_QWORD *)&location[4] = v13;
      v32 = 2050;
      v33 = self;
      v34 = 2114;
      v35 = v14;
      v36 = 2114;
      v37 = v6;
      v38 = 2114;
      v39 = v15;
      _os_log_impl(&dword_2172E1000, v12, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Can't begin disappearance transition as argument sequence (%{pub"
        "lic}@) doesn't match active sequence (%{public}@)",
        location,
        0x34u);

    }
    objc_initWeak((id *)location, self);
    if (v7)
    {
      WeakRetained = objc_loadWeakRetained((id *)location);
      v7[2](v7, WeakRetained, v6);

    }
    goto LABEL_13;
  }
  if (!objc_msgSend((id)objc_opt_class(), "_canWidgetHostCaptureSnapshotForSequence:", v6))
  {
    v17 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      v18 = v17;
      -[WGWidgetHostingViewController widgetIdentifier](self, "widgetIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[WGWidgetHostingViewController _containerIdentifier](self, "_containerIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138544130;
      *(_QWORD *)&location[4] = v19;
      v32 = 2050;
      v33 = self;
      v34 = 2114;
      v35 = v20;
      v36 = 2114;
      v37 = v6;
      _os_log_impl(&dword_2172E1000, v18, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Sequence already at satisfactory state: %{public}@",
        location,
        0x2Au);

    }
    objc_initWeak((id *)location, self);
    if (v7)
    {
      v21 = objc_loadWeakRetained((id *)location);
      v7[2](v7, v21, v6);

    }
LABEL_13:
    objc_destroyWeak((id *)location);
    goto LABEL_21;
  }
  objc_msgSend(v6, "transitionToState:", 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_ERROR))
      -[WGWidgetHostingViewController _captureSnapshotAndBeginDisappearanceTransitionForSequence:completionHandler:].cold.1(v9);
    objc_initWeak((id *)location, self);
    if (v7)
    {
      v10 = objc_loadWeakRetained((id *)location);
      v7[2](v7, v10, v6);

    }
    objc_destroyWeak((id *)location);
  }
  else
  {
    v22 = MEMORY[0x24BDAC760];
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __110__WGWidgetHostingViewController__captureSnapshotAndBeginDisappearanceTransitionForSequence_completionHandler___block_invoke;
    v29[3] = &unk_24D732720;
    v23 = v7;
    v30 = v23;
    v25[0] = v22;
    v25[1] = 3221225472;
    v25[2] = __110__WGWidgetHostingViewController__captureSnapshotAndBeginDisappearanceTransitionForSequence_completionHandler___block_invoke_5;
    v25[3] = &unk_24D732AF0;
    v28 = 5;
    v26 = (id)MEMORY[0x219A0A970](v29);
    v27 = v23;
    v24 = v26;
    -[WGWidgetHostingViewController _enqueueRemoteServiceRequest:withDescription:](self, "_enqueueRemoteServiceRequest:withDescription:", v25, CFSTR("Requesting snapshot"));

  }
LABEL_21:

}

void __110__WGWidgetHostingViewController__captureSnapshotAndBeginDisappearanceTransitionForSequence_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, int a4)
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = (void *)WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    objc_msgSend(v7, "widgetIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_containerIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_viewWillDisappearSemaphore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v20 = v11;
    v21 = 2050;
    v22 = v7;
    v23 = 2114;
    v24 = v12;
    v25 = 2114;
    v26 = v13;
    _os_log_impl(&dword_2172E1000, v10, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Releasing '_viewWillDisappearSemaphore' (%{public}@)",
      buf,
      0x2Au);

  }
  objc_msgSend(v7, "_setViewWillDisappearSemaphore:", 0);
  if (a4)
  {
    objc_msgSend(v7, "_removeAllSnapshotFilesForActiveDisplayMode");
    objc_msgSend(v7, "_diskWriteQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __110__WGWidgetHostingViewController__captureSnapshotAndBeginDisappearanceTransitionForSequence_completionHandler___block_invoke_155;
    v16[3] = &unk_24D732138;
    v17 = v7;
    v18 = *(id *)(a1 + 32);
    dispatch_async(v14, v16);

  }
  else
  {
    v15 = *(_QWORD *)(a1 + 32);
    if (v15)
      (*(void (**)(uint64_t, id, id))(v15 + 16))(v15, v7, v8);
  }

}

void __110__WGWidgetHostingViewController__captureSnapshotAndBeginDisappearanceTransitionForSequence_completionHandler___block_invoke_155(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __110__WGWidgetHostingViewController__captureSnapshotAndBeginDisappearanceTransitionForSequence_completionHandler___block_invoke_2;
  v3[3] = &unk_24D732AA0;
  v4 = v2;
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v4, "_captureLayerTree:", v3);

}

void __110__WGWidgetHostingViewController__captureSnapshotAndBeginDisappearanceTransitionForSequence_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v6 = a2;
  v7 = a4;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __110__WGWidgetHostingViewController__captureSnapshotAndBeginDisappearanceTransitionForSequence_completionHandler___block_invoke_3;
  v11[3] = &unk_24D732A78;
  v12 = v6;
  v13 = v7;
  v8 = *(void **)(a1 + 32);
  v14 = *(id *)(a1 + 40);
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "_enqueueRemoteServiceRequest:withDescription:", v11, CFSTR("Snapshot completion"));

}

void __110__WGWidgetHostingViewController__captureSnapshotAndBeginDisappearanceTransitionForSequence_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3, int a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v7 = a2;
  v8 = a3;
  if (a4 && (v9 = *(_QWORD *)(a1 + 32)) != 0 && !*(_QWORD *)(a1 + 40))
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __110__WGWidgetHostingViewController__captureSnapshotAndBeginDisappearanceTransitionForSequence_completionHandler___block_invoke_4;
    v11[3] = &unk_24D732A50;
    v12 = v7;
    v14 = *(id *)(a1 + 48);
    v13 = v8;
    objc_msgSend(v12, "_packageViewFromURL:reply:", v9, v11);

  }
  else
  {
    v10 = *(_QWORD *)(a1 + 48);
    if (v10)
      (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v7, v8);
  }

}

void __110__WGWidgetHostingViewController__captureSnapshotAndBeginDisappearanceTransitionForSequence_completionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (v7 && !v5)
    objc_msgSend(*(id *)(a1 + 32), "_setSnapshotView:", v7);
  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v6 + 16))(v6, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __110__WGWidgetHostingViewController__captureSnapshotAndBeginDisappearanceTransitionForSequence_completionHandler___block_invoke_5(uint64_t a1, void *a2, void *a3, int a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  int v11;
  int v12;
  dispatch_semaphore_t v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  const char *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  _QWORD v27[4];
  id v28;
  NSObject *v29;
  id v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  if (!a4
    || (objc_msgSend(v7, "_viewWillDisappearSemaphore"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
LABEL_3:
    v10 = *(_QWORD *)(a1 + 40);
    if (v10)
      (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v7, v8);
    goto LABEL_5;
  }
  v11 = objc_msgSend(v7, "_isActiveSequence:", v8);
  v12 = objc_msgSend(v8, "isCurrentState:", *(_QWORD *)(a1 + 48));
  if (!v11 || !v12)
  {
    if ((v11 & 1) != 0)
    {
      if ((v12 & 1) != 0)
        goto LABEL_3;
      v15 = (void *)WGLogWidgets;
      if (!os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
        goto LABEL_3;
      v16 = v15;
      objc_msgSend(v7, "widgetIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_containerIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      WGStringFromWidgetLifeCycleSequenceState(*(_QWORD *)(a1 + 48));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v33 = v17;
      v34 = 2050;
      v35 = v7;
      v36 = 2114;
      v37 = v18;
      v38 = 2114;
      v39 = v8;
      v40 = 2114;
      v41 = v19;
      v20 = "<%{public}@: %{public}p; container: %{public}@> Can't continue disappearance transition as argument sequence"
            " (%{public}@) isn't in expected state (%{public}@)";
    }
    else
    {
      v21 = (void *)WGLogWidgets;
      if (!os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
        goto LABEL_3;
      v16 = v21;
      objc_msgSend(v7, "widgetIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_containerIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_activeLifeCycleSequence");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v33 = v17;
      v34 = 2050;
      v35 = v7;
      v36 = 2114;
      v37 = v18;
      v38 = 2114;
      v39 = v8;
      v40 = 2114;
      v41 = v19;
      v20 = "<%{public}@: %{public}p; container: %{public}@> Can't continue disappearance transition as argument sequence"
            " (%{public}@) doesn't match active sequence (%{public}@)";
    }
    _os_log_impl(&dword_2172E1000, v16, OS_LOG_TYPE_DEFAULT, v20, buf, 0x34u);

    goto LABEL_3;
  }
  v13 = dispatch_semaphore_create(0);
  objc_msgSend(v7, "_setViewWillDisappearSemaphore:", v13);
  dispatch_get_global_queue(25, 0);
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __110__WGWidgetHostingViewController__captureSnapshotAndBeginDisappearanceTransitionForSequence_completionHandler___block_invoke_6;
    v27[3] = &unk_24D732AC8;
    v28 = v7;
    v29 = v13;
    v31 = *(id *)(a1 + 32);
    v30 = v8;
    dispatch_async(v14, v27);

  }
  else
  {
    v22 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      v23 = v22;
      objc_msgSend(v7, "widgetIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_containerIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v33 = v24;
      v34 = 2050;
      v35 = v7;
      v36 = 2114;
      v37 = v25;
      _os_log_impl(&dword_2172E1000, v23, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Failed to obtain a queue",
        buf,
        0x20u);

    }
    v26 = *(_QWORD *)(a1 + 32);
    if (v26)
      (*(void (**)(uint64_t, id, id, _QWORD))(v26 + 16))(v26, v7, v8, 0);
  }

LABEL_5:
}

void __110__WGWidgetHostingViewController__captureSnapshotAndBeginDisappearanceTransitionForSequence_completionHandler___block_invoke_6(id *a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  dispatch_time_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  _QWORD block[4];
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v2 = MEMORY[0x24BDAC760];
  v35 = *MEMORY[0x24BDAC8D0];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __110__WGWidgetHostingViewController__captureSnapshotAndBeginDisappearanceTransitionForSequence_completionHandler___block_invoke_7;
  block[3] = &unk_24D731670;
  v25 = a1[4];
  v26 = a1[5];
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  v3 = (void *)WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    v4 = a1[4];
    v5 = v3;
    objc_msgSend(v4, "widgetIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = a1[4];
    objc_msgSend(v7, "_containerIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = a1[5];
    *(_DWORD *)buf = 138544130;
    v28 = v6;
    v29 = 2050;
    v30 = v7;
    v31 = 2114;
    v32 = v8;
    v33 = 2114;
    v34 = v9;
    _os_log_impl(&dword_2172E1000, v5, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> About to wait on '_viewWillDisappearSemaphore' (%{public}@)",
      buf,
      0x2Au);

  }
  v10 = a1[5];
  v11 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v10, v11))
  {
    v12 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      v13 = a1[4];
      v14 = v12;
      objc_msgSend(v13, "widgetIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = a1[4];
      objc_msgSend(v16, "_containerIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = a1[5];
      *(_DWORD *)buf = 138544130;
      v28 = v15;
      v29 = 2050;
      v30 = v16;
      v31 = 2114;
      v32 = v17;
      v33 = 2114;
      v34 = v18;
      _os_log_impl(&dword_2172E1000, v14, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> _viewWillDisappearSemaphore (%{public}@) timed out!",
        buf,
        0x2Au);

    }
  }
  v20[0] = v2;
  v20[1] = 3221225472;
  v20[2] = __110__WGWidgetHostingViewController__captureSnapshotAndBeginDisappearanceTransitionForSequence_completionHandler___block_invoke_160;
  v20[3] = &unk_24D7326D0;
  v21 = a1[4];
  v23 = a1[7];
  v22 = a1[6];
  v19 = (void *)MEMORY[0x24BDAC9B8];
  dispatch_async(MEMORY[0x24BDAC9B8], v20);

}

uint64_t __110__WGWidgetHostingViewController__captureSnapshotAndBeginDisappearanceTransitionForSequence_completionHandler___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_beginRemoteViewControllerAppearanceTransitionIfNecessary:semaphore:animated:completion:", 0, *(_QWORD *)(a1 + 40), 0, 0);
}

uint64_t __110__WGWidgetHostingViewController__captureSnapshotAndBeginDisappearanceTransitionForSequence_completionHandler___block_invoke_160(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t result;
  BOOL v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  result = *(_QWORD *)(a1 + 48);
  if (result)
  {
    if (v2)
      v6 = v4 == 0;
    else
      v6 = 1;
    v7 = !v6;
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, uint64_t))(result + 16))(result, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v7);
  }
  return result;
}

- (id)_snapshotIdentifierForLayoutMode:(int64_t)a3
{
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  -[WGWidgetHostingViewController _maxSizeForDisplayMode:](self, "_maxSizeForDisplayMode:", -[WGWidgetHostingViewController activeDisplayMode](self, "activeDisplayMode"));
  v6 = v5;
  v7 = (void *)MEMORY[0x24BDD17C8];
  -[WGWidgetHostingViewController widgetIdentifier](self, "widgetIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  WGShortStringFromLayoutMode(a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), (uint64_t)v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localeIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x24BDF74F8], "preferredContentSizeCategory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NCStringFromWidgetDisplayMode();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WGWidgetHostingViewController traitCollection](self, "traitCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  WGStringFromUserInterfaceStyle(objc_msgSend(v15, "userInterfaceStyle"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@-%@-%@-%@-%@-%@-%@"), v8, v9, v10, v12, v13, v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)_widgetSnapshotURLForSnapshotIdentifier:(id)a3 ensuringDirectoryExists:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a4;
  objc_msgSend(a3, "stringByAppendingPathExtension:", CFSTR("ca"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDBCF48];
  -[WGWidgetHostingViewController widgetIdentifier](self, "widgetIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  WGWidgetCachePathForWidgetWithBundleIdentifier((uint64_t)v8, CFSTR("Snapshots"), v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fileURLWithPath:isDirectory:", v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "URLByAppendingPathComponent:isDirectory:", v6, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_widgetSnapshotURLForSnapshotIdentifier:(id)a3
{
  return -[WGWidgetHostingViewController _widgetSnapshotURLForSnapshotIdentifier:ensuringDirectoryExists:](self, "_widgetSnapshotURLForSnapshotIdentifier:ensuringDirectoryExists:", a3, 0);
}

- (id)_widgetSnapshotURLForLayoutMode:(int64_t)a3 ensuringDirectoryExists:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;

  v4 = a4;
  -[WGWidgetHostingViewController _snapshotIdentifierForLayoutMode:](self, "_snapshotIdentifierForLayoutMode:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WGWidgetHostingViewController _widgetSnapshotURLForSnapshotIdentifier:ensuringDirectoryExists:](self, "_widgetSnapshotURLForSnapshotIdentifier:ensuringDirectoryExists:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_removeItemAtURL:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  void *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  WGWidgetHostingViewController *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v6 = objc_msgSend(v5, "removeItemAtURL:error:", v4, &v16);
    v7 = v16;

    v8 = (void *)WGLogWidgets;
    v9 = os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v9)
      {
        v10 = v8;
        -[WGWidgetHostingViewController widgetIdentifier](self, "widgetIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[WGWidgetHostingViewController _containerIdentifier](self, "_containerIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v18 = v11;
        v19 = 2050;
        v20 = self;
        v21 = 2114;
        v22 = v12;
        v23 = 2114;
        v24 = v4;
        v13 = "<%{public}@: %{public}p; container: %{public}@> Removed item at %{public}@";
        v14 = v10;
        v15 = 42;
LABEL_7:
        _os_log_impl(&dword_2172E1000, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);

      }
    }
    else if (v9)
    {
      v10 = v8;
      -[WGWidgetHostingViewController widgetIdentifier](self, "widgetIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[WGWidgetHostingViewController _containerIdentifier](self, "_containerIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v18 = v11;
      v19 = 2050;
      v20 = self;
      v21 = 2114;
      v22 = v12;
      v23 = 2114;
      v24 = v4;
      v25 = 2114;
      v26 = v7;
      v13 = "<%{public}@: %{public}p; container: %{public}@> Failed to remove item at %{public}@: %{public}@";
      v14 = v10;
      v15 = 52;
      goto LABEL_7;
    }

  }
}

- (void)_removeItemAsynchronouslyAtURL:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    -[WGWidgetHostingViewController _diskWriteQueue](self, "_diskWriteQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __64__WGWidgetHostingViewController__removeItemAsynchronouslyAtURL___block_invoke;
    block[3] = &unk_24D731620;
    objc_copyWeak(&v8, &location);
    v7 = v4;
    dispatch_async(v5, block);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

}

void __64__WGWidgetHostingViewController__removeItemAsynchronouslyAtURL___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_removeItemAtURL:", *(_QWORD *)(a1 + 32));

}

- (void)_removeAllSnapshotFilesMatchingPredicate:(id)a3 dueToIssue:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  _QWORD block[4];
  id v23;
  id v24;
  id v25;
  id v26;
  BOOL v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  WGWidgetHostingViewController *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  const __CFString *v35;
  uint64_t v36;

  v4 = a4;
  v36 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    -[WGWidgetHostingViewController widgetIdentifier](self, "widgetIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WGWidgetHostingViewController _containerIdentifier](self, "_containerIdentifier");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    v12 = &stru_24D733868;
    *(_DWORD *)buf = 138544130;
    v30 = 2050;
    v29 = v9;
    if (v4)
      v12 = CFSTR(" due to issue");
    v31 = self;
    v32 = 2114;
    v33 = v10;
    v34 = 2114;
    v35 = v12;
    _os_log_impl(&dword_2172E1000, v8, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Removing snapshots matching predicate%{public}@",
      buf,
      0x2Au);

  }
  v13 = (void *)MEMORY[0x24BDBCF48];
  -[WGWidgetHostingViewController widgetIdentifier](self, "widgetIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  WGWidgetCachePathForWidgetWithBundleIdentifier((uint64_t)v14, CFSTR("Snapshots"), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fileURLWithPath:isDirectory:", v15, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak((id *)buf, self);
  -[WGWidgetHostingViewController _diskWriteQueue](self, "_diskWriteQueue");
  v18 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __85__WGWidgetHostingViewController__removeAllSnapshotFilesMatchingPredicate_dueToIssue___block_invoke;
  block[3] = &unk_24D732B18;
  objc_copyWeak(&v26, (id *)buf);
  v23 = v17;
  v24 = v16;
  v25 = v6;
  v27 = v4;
  v19 = v6;
  v20 = v16;
  v21 = v17;
  dispatch_async(v18, block);

  objc_destroyWeak(&v26);
  objc_destroyWeak((id *)buf);
}

void __85__WGWidgetHostingViewController__removeAllSnapshotFilesMatchingPredicate_dueToIssue___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id obj;
  _QWORD v27[4];
  id v28;
  id v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  void *v34;
  _QWORD block[5];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  id v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  id v50;
  _BYTE v51[128];
  uint64_t v52;

  v1 = a1;
  v52 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = *(void **)(v1 + 32);
  v4 = *(_QWORD *)(v1 + 40);
  v40 = 0;
  objc_msgSend(v3, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v4, MEMORY[0x24BDBD1A8], 0, &v40);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v40;
  if (v6)
  {
    v7 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      objc_msgSend(WeakRetained, "widgetIdentifier");
      v9 = v1;
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "_containerIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(v9 + 40);
      *(_DWORD *)buf = 138544386;
      v42 = v10;
      v43 = 2050;
      v44 = WeakRetained;
      v45 = 2114;
      v46 = v11;
      v47 = 2114;
      v48 = v12;
      v49 = 2114;
      v50 = v6;
      _os_log_impl(&dword_2172E1000, v8, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Encountered error obtaining contents of directory at URL '%{publ"
        "ic}@': %{public}@",
        buf,
        0x34u);

    }
  }
  else
  {
    v25 = 0;
    if (*(_QWORD *)(v1 + 48))
    {
      objc_msgSend(v5, "filteredArrayUsingPredicate:");
      v13 = objc_claimAutoreleasedReturnValue();

      v5 = (id)v13;
    }
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v5 = v5;
    v14 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v36, v51, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v37;
      obj = v5;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v37 != v16)
            objc_enumerationMutation(obj);
          v18 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          objc_msgSend(WeakRetained, "_snapshotView", v25);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v19;
          if (v19)
          {
            v21 = v1;
            objc_msgSend(v19, "snapshotIdentifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(WeakRetained, "_widgetSnapshotURLForSnapshotIdentifier:ensuringDirectoryExists:", v22, 0);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (v23 && objc_msgSend(v18, "isEqual:", v23))
            {
              block[0] = MEMORY[0x24BDAC760];
              block[1] = 3221225472;
              block[2] = __85__WGWidgetHostingViewController__removeAllSnapshotFilesMatchingPredicate_dueToIssue___block_invoke_2;
              block[3] = &unk_24D7314D8;
              block[4] = WeakRetained;
              dispatch_async(MEMORY[0x24BDAC9B8], block);
            }

            v1 = v21;
          }
          objc_msgSend(WeakRetained, "host");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (*(_BYTE *)(v1 + 64) && (objc_opt_respondsToSelector() & 1) != 0)
          {
            v31[0] = MEMORY[0x24BDAC760];
            v31[1] = 3221225472;
            v31[2] = __85__WGWidgetHostingViewController__removeAllSnapshotFilesMatchingPredicate_dueToIssue___block_invoke_3;
            v31[3] = &unk_24D731788;
            v32 = v24;
            v33 = WeakRetained;
            v34 = v18;
            dispatch_async(MEMORY[0x24BDAC9B8], v31);

          }
          objc_msgSend(WeakRetained, "_removeItemAtURL:", v18);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v27[0] = MEMORY[0x24BDAC760];
            v27[1] = 3221225472;
            v27[2] = __85__WGWidgetHostingViewController__removeAllSnapshotFilesMatchingPredicate_dueToIssue___block_invoke_4;
            v27[3] = &unk_24D731788;
            v28 = v24;
            v29 = WeakRetained;
            v30 = v18;
            dispatch_async(MEMORY[0x24BDAC9B8], v27);

          }
        }
        v5 = obj;
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v51, 16);
      }
      while (v15);
    }

    v6 = v25;
  }

}

uint64_t __85__WGWidgetHostingViewController__removeAllSnapshotFilesMatchingPredicate_dueToIssue___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateSnapshotWithForce:removingSnapshotFilesForActiveDisplayMode:completionHandler:", 1, 0, 0);
}

uint64_t __85__WGWidgetHostingViewController__removeAllSnapshotFilesMatchingPredicate_dueToIssue___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "widget:didEncounterProblematicSnapshotAtURL:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __85__WGWidgetHostingViewController__removeAllSnapshotFilesMatchingPredicate_dueToIssue___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "widget:didRemoveSnapshotAtURL:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_removeAllSnapshotFilesDueToIssue:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  -[WGWidgetHostingViewController widgetIdentifier](self, "widgetIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD1758];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __67__WGWidgetHostingViewController__removeAllSnapshotFilesDueToIssue___block_invoke;
  v9[3] = &unk_24D732B40;
  v10 = v5;
  v7 = v5;
  objc_msgSend(v6, "predicateWithBlock:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WGWidgetHostingViewController _removeAllSnapshotFilesMatchingPredicate:dueToIssue:](self, "_removeAllSnapshotFilesMatchingPredicate:dueToIssue:", v8, v3);

}

uint64_t __67__WGWidgetHostingViewController__removeAllSnapshotFilesDueToIssue___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPrefix:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)_removeAllSnapshotFilesForActiveDisplayMode
{
  void *v3;
  int64_t v4;
  _BOOL8 v5;
  double v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _BOOL8 v15;

  -[WGWidgetHostingViewController widgetIdentifier](self, "widgetIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[WGWidgetHostingViewController activeDisplayMode](self, "activeDisplayMode");
  v5 = v4 == 0;
  -[WGWidgetHostingViewController _maxSizeForDisplayMode:](self, "_maxSizeForDisplayMode:", v4);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), (uint64_t)v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDD1758];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __76__WGWidgetHostingViewController__removeAllSnapshotFilesForActiveDisplayMode__block_invoke;
  v12[3] = &unk_24D732B68;
  v13 = v3;
  v14 = v7;
  v15 = v5;
  v9 = v7;
  v10 = v3;
  objc_msgSend(v8, "predicateWithBlock:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WGWidgetHostingViewController _removeAllSnapshotFilesMatchingPredicate:dueToIssue:](self, "_removeAllSnapshotFilesMatchingPredicate:dueToIssue:", v11, 0);

}

uint64_t __76__WGWidgetHostingViewController__removeAllSnapshotFilesForActiveDisplayMode__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasPrefix:", *(_QWORD *)(a1 + 32))
    && objc_msgSend(v3, "containsString:", *(_QWORD *)(a1 + 40)))
  {
    NCStringFromWidgetDisplayMode();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "containsString:", v4) ^ 1;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_removeAllSnapshotFilesInActiveDisplayModeForContentSizeCategory:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  int64_t v14;

  v4 = a3;
  -[WGWidgetHostingViewController widgetIdentifier](self, "widgetIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WGWidgetHostingViewController activeDisplayMode](self, "activeDisplayMode");
  v7 = (void *)MEMORY[0x24BDD1758];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __98__WGWidgetHostingViewController__removeAllSnapshotFilesInActiveDisplayModeForContentSizeCategory___block_invoke;
  v11[3] = &unk_24D732B68;
  v13 = v4;
  v14 = v6;
  v12 = v5;
  v8 = v4;
  v9 = v5;
  objc_msgSend(v7, "predicateWithBlock:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WGWidgetHostingViewController _removeAllSnapshotFilesMatchingPredicate:dueToIssue:](self, "_removeAllSnapshotFilesMatchingPredicate:dueToIssue:", v10, 0);

}

uint64_t __98__WGWidgetHostingViewController__removeAllSnapshotFilesInActiveDisplayModeForContentSizeCategory___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasPrefix:", *(_QWORD *)(a1 + 32)))
  {
    NCStringFromWidgetDisplayMode();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "containsString:", v4))
      v5 = objc_msgSend(v3, "containsString:", *(_QWORD *)(a1 + 40));
    else
      v5 = 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_removeAllSnapshotFilesInActiveDisplayModeForAllButActiveUserInterfaceStyle
{
  void *v3;
  int64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  int64_t v12;
  uint64_t v13;

  -[WGWidgetHostingViewController widgetIdentifier](self, "widgetIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[WGWidgetHostingViewController activeDisplayMode](self, "activeDisplayMode");
  -[WGWidgetHostingViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");

  v7 = (void *)MEMORY[0x24BDD1758];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __108__WGWidgetHostingViewController__removeAllSnapshotFilesInActiveDisplayModeForAllButActiveUserInterfaceStyle__block_invoke;
  v10[3] = &unk_24D732B90;
  v11 = v3;
  v12 = v4;
  v13 = v6;
  v8 = v3;
  objc_msgSend(v7, "predicateWithBlock:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WGWidgetHostingViewController _removeAllSnapshotFilesMatchingPredicate:dueToIssue:](self, "_removeAllSnapshotFilesMatchingPredicate:dueToIssue:", v9, 0);

}

uint64_t __108__WGWidgetHostingViewController__removeAllSnapshotFilesInActiveDisplayModeForAllButActiveUserInterfaceStyle__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasPrefix:", *(_QWORD *)(a1 + 32)))
  {
    NCStringFromWidgetDisplayMode();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "containsString:", v4))
    {
      WGStringFromUserInterfaceStyle(*(_QWORD *)(a1 + 48));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v3, "containsString:", v5) ^ 1;

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

- (void)_setSnapshotView:(id)a3
{
  _WGCAPackageView *v5;
  _WGCAPackageView **p_snapshotView;
  CGRect *p_snapshotViewBounds;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGSize v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  _WGCAPackageView *v17;
  int v18;
  void *v19;
  __int16 v20;
  WGWidgetHostingViewController *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  _WGCAPackageView *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = (_WGCAPackageView *)a3;
  p_snapshotView = &self->_snapshotView;
  if (self->_snapshotView != v5)
  {
    objc_storeStrong((id *)&self->_snapshotView, a3);
    p_snapshotViewBounds = &self->_snapshotViewBounds;
    if (*p_snapshotView)
    {
      -[_WGCAPackageView bounds](*p_snapshotView, "bounds");
      p_snapshotViewBounds->origin.x = v8;
      self->_snapshotViewBounds.origin.y = v9;
      self->_snapshotViewBounds.size.width = v10;
      self->_snapshotViewBounds.size.height = v11;
    }
    else
    {
      v12 = *(CGSize *)(MEMORY[0x24BDBF090] + 16);
      p_snapshotViewBounds->origin = (CGPoint)*MEMORY[0x24BDBF090];
      self->_snapshotViewBounds.size = v12;
    }
    v13 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v13;
      -[WGWidgetHostingViewController widgetIdentifier](self, "widgetIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[WGWidgetHostingViewController _containerIdentifier](self, "_containerIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *p_snapshotView;
      v18 = 138544130;
      v19 = v15;
      v20 = 2050;
      v21 = self;
      v22 = 2114;
      v23 = v16;
      v24 = 2114;
      v25 = v17;
      _os_log_impl(&dword_2172E1000, v14, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Set snapshot view: %{public}@",
        (uint8_t *)&v18,
        0x2Au);

    }
  }

}

- (void)_invalidateSnapshotWithForce:(BOOL)a3 removingSnapshotFilesForActiveDisplayMode:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  void *v9;
  _WGCAPackageView *snapshotView;
  _WGCAPackageView *v11;
  UIView *v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  id v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  UIView *v19;
  id v20;
  BOOL v21;
  BOOL v22;

  v8 = a5;
  v9 = v8;
  snapshotView = self->_snapshotView;
  if (!a3 && snapshotView && snapshotView == (_WGCAPackageView *)self->_contentProvidingView)
  {
    if (v8)
      (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
  }
  else
  {
    v11 = snapshotView;
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __122__WGWidgetHostingViewController__invalidateSnapshotWithForce_removingSnapshotFilesForActiveDisplayMode_completionHandler___block_invoke;
    v18[3] = &unk_24D732BB8;
    v12 = v11;
    v19 = v12;
    v21 = a3;
    v22 = a4;
    v20 = v9;
    v13 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x219A0A970](v18);
    if (v12 == self->_contentProvidingView)
    {
      -[WGWidgetHostingViewController _activeLifeCycleSequence](self, "_activeLifeCycleSequence");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[WGWidgetHostingViewController _insertContentProvidingSubview:sequence:completion:](self, "_insertContentProvidingSubview:sequence:completion:", 0, v16, v13);

    }
    else
    {
      objc_initWeak(&v17, self);
      if (v13)
      {
        v14 = objc_loadWeakRetained(&v17);
        -[WGWidgetHostingViewController _activeLifeCycleSequence](self, "_activeLifeCycleSequence");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, id, void *))v13)[2](v13, v14, v15);

      }
      objc_destroyWeak(&v17);
    }

  }
}

void __122__WGWidgetHostingViewController__invalidateSnapshotWithForce_removingSnapshotFilesForActiveDisplayMode_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "_contentProvidingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 != v5 || *(_BYTE *)(a1 + 48))
  {
    v6 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      objc_msgSend(v3, "widgetIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "_containerIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromBOOL();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 32);
      v13 = 138544386;
      v14 = v8;
      v15 = 2050;
      v16 = v3;
      v17 = 2114;
      v18 = v9;
      v19 = 2114;
      v20 = v10;
      v21 = 2114;
      v22 = v11;
      _os_log_impl(&dword_2172E1000, v7, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Invalidating snapshot (force=%{public}@): %{public}@",
        (uint8_t *)&v13,
        0x34u);

    }
    objc_removeAssociatedObjects(*(id *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
    objc_msgSend(v3, "_setSnapshotView:", 0);
    if (*(_BYTE *)(a1 + 49))
      objc_msgSend(v3, "_removeAllSnapshotFilesForActiveDisplayMode");
  }
  v12 = *(_QWORD *)(a1 + 40);
  if (v12)
    (*(void (**)(uint64_t, BOOL))(v12 + 16))(v12, v4 != v5);

}

- (void)_captureLayerTree:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[WGWidgetHostingViewController isRemoteViewVisible](self, "isRemoteViewVisible"))
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __51__WGWidgetHostingViewController__captureLayerTree___block_invoke;
    v8[3] = &unk_24D732720;
    v9 = v4;
    -[WGWidgetHostingViewController _enqueueRemoteServiceRequest:withDescription:](self, "_enqueueRemoteServiceRequest:withDescription:", v8, CFSTR("Encoding layer tree"));
    v5 = v9;
LABEL_5:

    goto LABEL_6;
  }
  if (v4)
  {
    v6 = (void *)MEMORY[0x24BDD1540];
    v10 = *MEMORY[0x24BDD0FC8];
    v11[0] = CFSTR("No visible remote view");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("WGWidgetHostingViewControllerErrorDomain"), 1, v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, _QWORD, uint64_t, void *))v4 + 2))(v4, 0, -1, v5);
    goto LABEL_5;
  }
LABEL_6:

}

void __51__WGWidgetHostingViewController__captureLayerTree___block_invoke(uint64_t a1, void *a2, void *a3, int a4)
{
  id v7;
  id v8;
  __CFString *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  __CFString *v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  if (!a4 || (objc_msgSend(v7, "_isEncodingLayerTree") & 1) != 0)
  {
    if (!*(_QWORD *)(a1 + 32))
    {
LABEL_8:
      objc_msgSend(v7, "_setEncodingLayerTree:", 0);
      goto LABEL_9;
    }
    v9 = CFSTR("Encoding request no longer valid");
    if (a4)
      v9 = CFSTR("Already encoding snapshot");
    v10 = (void *)MEMORY[0x24BDD1540];
    v29 = *MEMORY[0x24BDD0FC8];
    v30 = v9;
    v11 = (void *)MEMORY[0x24BDBCE70];
    v12 = v9;
    objc_msgSend(v11, "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("WGWidgetHostingViewControllerErrorDomain"), 1, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
LABEL_7:

    goto LABEL_8;
  }
  objc_msgSend(v7, "_setEncodingLayerTree:", 1);
  if (!objc_msgSend(v7, "isRemoteViewVisible"))
  {
    if (!*(_QWORD *)(a1 + 32))
      goto LABEL_8;
    v17 = (void *)MEMORY[0x24BDD1540];
    v31 = *MEMORY[0x24BDD0FC8];
    v32[0] = CFSTR("No visible remote view");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("WGWidgetHostingViewControllerErrorDomain"), 1, v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    goto LABEL_7;
  }
  ADClientAddValueForScalarKey();
  objc_msgSend(v7, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v16 = objc_msgSend(v15, "activeLayoutModeForWidget:", v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "userInterfaceIdiom");

    v16 = 2 * ((v20 & 0xFFFFFFFFFFFFFFFBLL) == 1);
  }
  objc_msgSend(v7, "_widgetSnapshotURLForLayoutMode:ensuringDirectoryExists:", v16, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_remoteViewController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __51__WGWidgetHostingViewController__captureLayerTree___block_invoke_2;
  v24[3] = &unk_24D732C08;
  v25 = v7;
  v26 = v21;
  v27 = *(id *)(a1 + 32);
  v28 = v16;
  v23 = v21;
  objc_msgSend(v22, "_requestEncodedLayerTreeAtURL:withReplyHandler:", v23, v24);

LABEL_9:
}

void __51__WGWidgetHostingViewController__captureLayerTree___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  uint64_t v12;

  v3 = a2;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __51__WGWidgetHostingViewController__captureLayerTree___block_invoke_3;
  v8[3] = &unk_24D732BE0;
  v9 = v3;
  v4 = *(void **)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  v11 = v5;
  v12 = v6;
  v7 = v3;
  objc_msgSend(v4, "_enqueueRemoteServiceRequest:withDescription:", v8, CFSTR("Handling layer tree encoding reply"));

}

void __51__WGWidgetHostingViewController__captureLayerTree___block_invoke_3(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = a1[4];
  v8 = (void *)WGLogWidgets;
  v9 = os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      v10 = v8;
      objc_msgSend(v5, "widgetIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_containerIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543874;
      v24 = v11;
      v25 = 2050;
      v26 = v5;
      v27 = 2114;
      v28 = v12;
      _os_log_impl(&dword_2172E1000, v10, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Failed to capture a snapshot",
        (uint8_t *)&v23,
        0x20u);

    }
    ADClientAddValueForScalarKey();
  }
  else if (v9)
  {
    v13 = v8;
    objc_msgSend(v5, "widgetIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_containerIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = a1[5];
    v23 = 138544130;
    v24 = v14;
    v25 = 2050;
    v26 = v5;
    v27 = 2114;
    v28 = v15;
    v29 = 2114;
    v30 = v16;
    _os_log_impl(&dword_2172E1000, v13, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Saved snapshot to %{public}@",
      (uint8_t *)&v23,
      0x2Au);

  }
  if (a1[4])
  {
    v17 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      v18 = v17;
      objc_msgSend(v5, "widgetIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_containerIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = a1[4];
      v23 = 138544130;
      v24 = v19;
      v25 = 2050;
      v26 = v5;
      v27 = 2114;
      v28 = v20;
      v29 = 2114;
      v30 = v21;
      _os_log_impl(&dword_2172E1000, v18, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Encountered an error while attempting to encode layer tree: %{public}@",
        (uint8_t *)&v23,
        0x2Au);

    }
  }
  v22 = a1[6];
  if (v22)
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v22 + 16))(v22, a1[5], a1[7], a1[4]);
  objc_msgSend(v5, "_setEncodingLayerTree:", 0);

}

- (void)_packageViewWithBlock:(id)a3 reply:(id)a4
{
  _QWORD *v7;
  id v8;
  void *v9;
  void (*v10)(_QWORD *, _QWORD *);
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7 || !v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WGWidgetHostingViewController.m"), 1429, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("loadPackageViewBlock && reply"));

  }
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __61__WGWidgetHostingViewController__packageViewWithBlock_reply___block_invoke;
  v13[3] = &unk_24D732C30;
  v14 = v9;
  v10 = (void (*)(_QWORD *, _QWORD *))v7[2];
  v11 = v9;
  v10(v7, v13);

}

void __61__WGWidgetHostingViewController__packageViewWithBlock_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (!v5)
    objc_msgSend(v6, "setClipsToBounds:", 1);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)_packageViewFromURL:(id)a3 reply:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD, void *);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (void (**)(id, _QWORD, void *))a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WGWidgetHostingViewController.m"), 1439, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reply"));

    if (v7)
      goto LABEL_3;
LABEL_5:
    v11 = (void *)MEMORY[0x24BDD1540];
    v15 = *MEMORY[0x24BDD0FC8];
    v16[0] = CFSTR("No URL");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("WGWidgetHostingViewControllerErrorDomain"), 2, v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v8[2](v8, 0, v9);
    goto LABEL_6;
  }
  if (!v7)
    goto LABEL_5;
LABEL_3:
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __59__WGWidgetHostingViewController__packageViewFromURL_reply___block_invoke;
  v13[3] = &unk_24D732C58;
  v14 = v7;
  -[WGWidgetHostingViewController _packageViewWithBlock:reply:](self, "_packageViewWithBlock:reply:", v13, v8);
  v9 = v14;
LABEL_6:

}

uint64_t __59__WGWidgetHostingViewController__packageViewFromURL_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[_WGCAPackageView loadPackageViewWithContentsOfURL:publishedObjectViewClassMap:completion:](_WGCAPackageView, "loadPackageViewWithContentsOfURL:publishedObjectViewClassMap:completion:", *(_QWORD *)(a1 + 32), 0, a2);
}

- (void)_loadSnapshotViewFromDiskIfNecessary:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id location;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  WGWidgetHostingViewController *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_initWeak(&location, self);
  if (!self->_snapshotView)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v7 = objc_msgSend(WeakRetained, "activeLayoutModeForWidget:", self);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "userInterfaceIdiom");

      v7 = 2 * ((v9 & 0xFFFFFFFFFFFFFFFBLL) == 1);
    }
    -[WGWidgetHostingViewController _widgetSnapshotURLForLayoutMode:ensuringDirectoryExists:](self, "_widgetSnapshotURLForLayoutMode:ensuringDirectoryExists:", v7, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)WGLogWidgets;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[WGWidgetHostingViewController widgetIdentifier](self, "widgetIdentifier");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      -[WGWidgetHostingViewController _containerIdentifier](self, "_containerIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v20 = v12;
      v21 = 2050;
      v22 = self;
      v23 = 2114;
      v24 = v13;
      v25 = 2114;
      v26 = v10;
      _os_log_impl(&dword_2172E1000, v11, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Attempting to load snapshot at URL: %{public}@",
        buf,
        0x2Au);

    }
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __70__WGWidgetHostingViewController__loadSnapshotViewFromDiskIfNecessary___block_invoke;
    v14[3] = &unk_24D732C80;
    objc_copyWeak(&v17, &location);
    v16 = v4;
    v6 = v10;
    v15 = v6;
    -[WGWidgetHostingViewController _packageViewFromURL:reply:](self, "_packageViewFromURL:reply:", v6, v14);

    objc_destroyWeak(&v17);
    goto LABEL_10;
  }
  if (v4)
  {
    WeakRetained = objc_loadWeakRetained(&location);
    -[WGWidgetHostingViewController _activeLifeCycleSequence](self, "_activeLifeCycleSequence");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id, id))v4 + 2))(v4, WeakRetained, v6);
LABEL_10:

  }
  objc_destroyWeak(&location);

}

void __70__WGWidgetHostingViewController__loadSnapshotViewFromDiskIfNecessary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v8 = WeakRetained;
  if (v6)
  {
    v9 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      objc_msgSend(v8, "widgetIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_containerIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(void **)(a1 + 32);
      v20 = 138544386;
      v21 = v11;
      v22 = 2050;
      v23 = v8;
      v24 = 2114;
      v25 = v12;
      v26 = 2114;
      v27 = v13;
      v28 = 2114;
      v29 = v6;
      _os_log_impl(&dword_2172E1000, v10, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Remove snapshots at %{public}@ due to error: %{public}@",
        (uint8_t *)&v20,
        0x34u);

    }
    objc_msgSend(v8, "_removeItemAsynchronouslyAtURL:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    objc_msgSend(WeakRetained, "_setSnapshotView:", v5);
    v14 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      v15 = v14;
      objc_msgSend(v8, "widgetIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_containerIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138544130;
      v21 = v16;
      v22 = 2050;
      v23 = v8;
      v24 = 2114;
      v25 = v17;
      v26 = 2114;
      v27 = v5;
      _os_log_impl(&dword_2172E1000, v15, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Loaded snapshot from disk: %{public}@",
        (uint8_t *)&v20,
        0x2Au);

    }
  }
  v18 = *(_QWORD *)(a1 + 40);
  if (v18)
  {
    objc_msgSend(v8, "_activeLifeCycleSequence");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *))(v18 + 16))(v18, v8, v19);

  }
}

- (void)_validateSnapshotViewForActiveLayoutMode
{
  _WGCAPackageView *snapshotView;
  void *v4;
  id WeakRetained;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  snapshotView = self->_snapshotView;
  if (snapshotView)
  {
    -[_WGCAPackageView snapshotIdentifier](snapshotView, "snapshotIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v10 = v4;
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v6 = objc_msgSend(WeakRetained, "activeLayoutModeForWidget:", self);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "userInterfaceIdiom");

        v6 = 2 * ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1);
      }
      -[WGWidgetHostingViewController _snapshotIdentifierForLayoutMode:](self, "_snapshotIdentifierForLayoutMode:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v10, "isEqual:", v9) & 1) == 0)
        -[WGWidgetHostingViewController _invalidateSnapshotWithForce:removingSnapshotFilesForActiveDisplayMode:completionHandler:](self, "_invalidateSnapshotWithForce:removingSnapshotFilesForActiveDisplayMode:completionHandler:", 1, 1, 0);

      v4 = v10;
    }

  }
}

- (void)_requestVisibilityStateUpdateForPossiblyAppearing:(BOOL)a3 sequence:(id)a4
{
  _BOOL4 v4;
  id v6;
  _BOOL4 v7;
  uint64_t v9;
  UIView *contentProvidingView;
  UIView *v11;
  _QWORD v12[5];
  BOOL v13;

  v4 = a3;
  v6 = a4;
  v7 = -[_WGWidgetRemoteViewController _isValid](self->_remoteViewController, "_isValid");
  if (!v7 || !v4)
  {
    if (v7)
    {
LABEL_7:
      v9 = objc_msgSend(v6, "currentState");
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __92__WGWidgetHostingViewController__requestVisibilityStateUpdateForPossiblyAppearing_sequence___block_invoke;
      v12[3] = &__block_descriptor_41_e72_v28__0__WGWidgetHostingViewController_8__WGWidgetLifeCycleSequence_16B24l;
      v12[4] = v9;
      v13 = v4;
      -[WGWidgetHostingViewController _enqueueRemoteServiceRequest:withDescription:](self, "_enqueueRemoteServiceRequest:withDescription:", v12, CFSTR("Updating visibility state"));
    }
  }
  else
  {
    contentProvidingView = self->_contentProvidingView;
    -[_WGWidgetRemoteViewController view](self->_remoteViewController, "view");
    v11 = (UIView *)objc_claimAutoreleasedReturnValue();

    if (contentProvidingView == v11)
      goto LABEL_7;
  }

}

void __92__WGWidgetHostingViewController__requestVisibilityStateUpdateForPossiblyAppearing_sequence___block_invoke(uint64_t a1, void *a2, void *a3, int a4)
{
  id v7;
  int v8;
  char v9;
  BOOL v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a2;
  v7 = a3;
  if (a4)
  {
    v8 = objc_msgSend(v14, "_isActiveSequence:", v7);
    if ((objc_msgSend(v7, "isCurrentStateAtLeast:", *(_QWORD *)(a1 + 32)) & 1) != 0)
    {
      v9 = 0;
      if (!v8)
        goto LABEL_14;
    }
    else
    {
      if (*(_BYTE *)(a1 + 40))
        goto LABEL_14;
      v9 = objc_msgSend(v7, "isCurrentState:", 0) ^ 1;
      if (!v8)
        goto LABEL_14;
    }
    if ((v9 & 1) == 0)
    {
      if (*(_BYTE *)(a1 + 40))
      {
        v10 = objc_msgSend(v14, "_appearState") == 0;
        v11 = v14;
        v12 = !v10;
      }
      else
      {
        v12 = 0;
        v11 = v14;
      }
      objc_msgSend(v11, "_remoteViewController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_updateVisibilityState:", v12);

    }
  }
LABEL_14:

}

- (void)_insertContentProvidingSubview:(id)a3 sequence:(id)a4 completion:(id)a5
{
  UIView *v8;
  id v9;
  void (**v10)(id, id, id);
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  BOOL v29;
  char v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  dispatch_semaphore_t v54;
  uint64_t v55;
  NSObject *v56;
  void *v57;
  id v58;
  NSObject *v59;
  id WeakRetained;
  id v61;
  void *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  id v66;
  UIView *v67;
  UIView *v68;
  _QWORD block[4];
  NSObject *v70;
  id v71;
  id v72;
  id v73;
  _QWORD v74[4];
  NSObject *v75;
  UIView *v76;
  UIView *v77;
  void (**v78)(id, id, id);
  uint64_t v79;
  uint8_t buf[4];
  void *v81;
  __int16 v82;
  WGWidgetHostingViewController *v83;
  __int16 v84;
  void *v85;
  __int16 v86;
  UIView *v87;
  __int16 v88;
  id v89;
  __int16 v90;
  void *v91;
  uint64_t v92;

  v92 = *MEMORY[0x24BDAC8D0];
  v8 = (UIView *)a3;
  v9 = a4;
  v10 = (void (**)(id, id, id))a5;
  if (-[WGWidgetHostingViewController _isActiveSequence:](self, "_isActiveSequence:", v9))
  {
    if (-[_WGWidgetRemoteViewController isViewLoaded](self->_remoteViewController, "isViewLoaded"))
    {
      -[_WGWidgetRemoteViewController view](self->_remoteViewController, "view");
      v68 = (UIView *)objc_claimAutoreleasedReturnValue();
      if (!v8)
        goto LABEL_16;
    }
    else
    {
      v68 = 0;
      if (!v8)
      {
LABEL_16:
        if (self->_contentProvidingView == v8)
        {
          v67 = 0;
        }
        else
        {
          -[WGWidgetHostingViewController _contentProvidingView](self, "_contentProvidingView");
          v67 = (UIView *)objc_claimAutoreleasedReturnValue();
        }
        v29 = self->_contentProvidingView == v8;
        -[WGWidgetHostingViewController _setContentProvidingView:](self, "_setContentProvidingView:", v8);
        v30 = v68 != v8 || v29;
        if ((v30 & 1) == 0)
          -[UIView setHidden:](v8, "setHidden:", 1);
        if (v8)
        {
          -[WGWidgetHostingViewController view](self, "view");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "addSubview:", v8);

        }
        v32 = (void *)WGLogWidgets;
        if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
        {
          v33 = v32;
          -[WGWidgetHostingViewController widgetIdentifier](self, "widgetIdentifier");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[WGWidgetHostingViewController _containerIdentifier](self, "_containerIdentifier");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[WGWidgetHostingViewController view](self, "view");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "subviews");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544386;
          v81 = v34;
          v82 = 2050;
          v83 = self;
          v84 = 2114;
          v85 = v35;
          v86 = 2114;
          v87 = v8;
          v88 = 2114;
          v89 = v37;
          _os_log_impl(&dword_2172E1000, v33, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Inserted content providing subview: %{public}@ (subviews=%{public}@)",
            buf,
            0x34u);

        }
        -[WGWidgetHostingViewController view](self, "view");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "bounds");
        v40 = v39;
        v42 = v41;
        v44 = v43;
        v46 = v45;

        -[UIView setFrame:](v8, "setFrame:", v40, v42, v44, v46);
        -[UIView setAutoresizingMask:](v8, "setAutoresizingMask:", 18);
        v47 = objc_msgSend(v9, "currentState");
        if (v8 == 0 || v68 != v8)
        {
          if (v67 == v68)
          {
            -[UIView setHidden:](v68, "setHidden:", 1);
            -[WGWidgetHostingViewController _requestVisibilityStateUpdateForPossiblyAppearing:sequence:](self, "_requestVisibilityStateUpdateForPossiblyAppearing:sequence:", 0, v9);
            WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(WeakRetained, "remoteViewControllerViewDidHideForWidget:", self);

          }
          else
          {
            -[UIView removeFromSuperview](v67, "removeFromSuperview");
          }
          objc_initWeak((id *)buf, self);
          if (v10)
          {
            v61 = objc_loadWeakRetained((id *)buf);
            v10[2](v10, v61, v9);

          }
          objc_destroyWeak((id *)buf);
        }
        else
        {
          v48 = v47;
          dispatch_get_global_queue(25, 0);
          v49 = objc_claimAutoreleasedReturnValue();
          if (v49)
          {
            if (self->_viewWillAppearSemaphore)
            {
              v50 = (void *)WGLogWidgets;
              if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
              {
                v51 = v50;
                -[WGWidgetHostingViewController widgetIdentifier](self, "widgetIdentifier");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                -[WGWidgetHostingViewController _containerIdentifier](self, "_containerIdentifier");
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v81 = v52;
                v82 = 2050;
                v83 = self;
                v84 = 2114;
                v85 = v53;
                _os_log_impl(&dword_2172E1000, v51, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> '_viewWillAppearSemaphore' already exists",
                  buf,
                  0x20u);

              }
            }
            v54 = dispatch_semaphore_create(0);
            -[WGWidgetHostingViewController _setViewWillAppearSemaphore:](self, "_setViewWillAppearSemaphore:", v54);
            v55 = MEMORY[0x24BDAC760];
            v74[0] = MEMORY[0x24BDAC760];
            v74[1] = 3221225472;
            v74[2] = __84__WGWidgetHostingViewController__insertContentProvidingSubview_sequence_completion___block_invoke;
            v74[3] = &unk_24D732CC8;
            v56 = v54;
            v75 = v56;
            v79 = v48;
            v76 = v8;
            v77 = v67;
            v78 = v10;
            v57 = (void *)MEMORY[0x219A0A970](v74);
            objc_initWeak((id *)buf, self);
            block[0] = v55;
            block[1] = 3221225472;
            block[2] = __84__WGWidgetHostingViewController__insertContentProvidingSubview_sequence_completion___block_invoke_211;
            block[3] = &unk_24D732CF0;
            objc_copyWeak(&v73, (id *)buf);
            v70 = v56;
            v72 = v57;
            v71 = v9;
            v58 = v57;
            v59 = v56;
            dispatch_async(v49, block);

            objc_destroyWeak(&v73);
            objc_destroyWeak((id *)buf);

          }
          else
          {
            v62 = (void *)WGLogWidgets;
            if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
            {
              v63 = v62;
              -[WGWidgetHostingViewController widgetIdentifier](self, "widgetIdentifier");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              -[WGWidgetHostingViewController _containerIdentifier](self, "_containerIdentifier");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v81 = v64;
              v82 = 2050;
              v83 = self;
              v84 = 2114;
              v85 = v65;
              _os_log_impl(&dword_2172E1000, v63, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Failed to obtain a queue",
                buf,
                0x20u);

            }
            objc_initWeak((id *)buf, self);
            if (v10)
            {
              v66 = objc_loadWeakRetained((id *)buf);
              v10[2](v10, v66, v9);

            }
            objc_destroyWeak((id *)buf);
          }

        }
        goto LABEL_49;
      }
    }
    -[WGWidgetHostingViewController view](self, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "subviews");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v18, "count") > 1)
    {
      -[UIView superview](v8, "superview");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[WGWidgetHostingViewController view](self, "view");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19 != v20)
      {
        v21 = WGLogWidgets;
        if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_ERROR))
          -[WGWidgetHostingViewController _insertContentProvidingSubview:sequence:completion:].cold.1(v21, v22, v23, v24, v25, v26, v27, v28);
      }
    }
    else
    {

    }
    goto LABEL_16;
  }
  v11 = (void *)WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    -[WGWidgetHostingViewController widgetIdentifier](self, "widgetIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WGWidgetHostingViewController _containerIdentifier](self, "_containerIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WGWidgetHostingViewController _activeLifeCycleSequence](self, "_activeLifeCycleSequence");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v81 = v13;
    v82 = 2050;
    v83 = self;
    v84 = 2114;
    v85 = v14;
    v86 = 2114;
    v87 = v8;
    v88 = 2114;
    v89 = v9;
    v90 = 2114;
    v91 = v15;
    _os_log_impl(&dword_2172E1000, v12, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Can't insert view '%{public}@' as argument sequence (%{public}@) d"
      "oesn't match active sequence (%{public}@)",
      buf,
      0x3Eu);

  }
  objc_initWeak((id *)buf, self);
  if (v10)
  {
    v16 = objc_loadWeakRetained((id *)buf);
    v10[2](v10, v16, v9);

  }
  objc_destroyWeak((id *)buf);
LABEL_49:

}

void __84__WGWidgetHostingViewController__insertContentProvidingSubview_sequence_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  id v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "_viewWillAppearSemaphore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 32);

  if (v7 == v8)
    objc_msgSend(v5, "_setViewWillAppearSemaphore:", 0);
  v9 = objc_msgSend(v5, "_isActiveSequence:", v6);
  v10 = objc_msgSend(v6, "isCurrentState:", *(_QWORD *)(a1 + 64));
  if (v9 && v10)
  {
    objc_msgSend(*(id *)(a1 + 40), "setHidden:", 0);
    v11 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      objc_msgSend(v5, "widgetIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_containerIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v34 = v13;
      v35 = 2050;
      v36 = v5;
      v37 = 2114;
      v38 = v14;
      _os_log_impl(&dword_2172E1000, v12, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Unhid remote view",
        buf,
        0x20u);

    }
    objc_msgSend(v5, "_endRemoteViewControllerAppearanceTransitionIfNecessary");
    objc_msgSend(*(id *)(a1 + 48), "removeFromSuperview");
    objc_msgSend(v5, "_requestVisibilityStateUpdateForPossiblyAppearing:sequence:", 1, v6);
  }
  else
  {
    v15 = (void *)MEMORY[0x24BDD17C8];
    if (v9)
    {
      WGStringFromWidgetLifeCycleSequenceState(*(_QWORD *)(a1 + 64));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", CFSTR("isn't in expected state (%@)"), v16);
    }
    else
    {
      objc_msgSend(v5, "_activeLifeCycleSequence");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", CFSTR("doesn't match active sequence (%@)"), v16);
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      v19 = v18;
      objc_msgSend(v5, "widgetIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_containerIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138544642;
      v34 = v20;
      v35 = 2050;
      v36 = v5;
      v37 = 2114;
      v38 = v21;
      v39 = 2114;
      v40 = v22;
      v41 = 2114;
      v42 = v6;
      v43 = 2114;
      v44 = v17;
      _os_log_impl(&dword_2172E1000, v19, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Can't insert view '%{public}@' as argument sequence (%{public}@) %{public}@",
        buf,
        0x3Eu);

    }
    v23 = *(void **)(a1 + 40);
    objc_msgSend(v5, "_contentProvidingView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23 == v24)
    {
      objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");
      objc_msgSend(v5, "_setContentProvidingView:", *(_QWORD *)(a1 + 48));
      v25 = (void *)WGLogWidgets;
      if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
      {
        v26 = v25;
        objc_msgSend(v5, "widgetIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "_containerIdentifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = *(_QWORD *)(a1 + 40);
        objc_msgSend(v5, "view");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "subviews");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v34 = v27;
        v35 = 2050;
        v36 = v5;
        v37 = 2114;
        v38 = v28;
        v39 = 2114;
        v40 = v29;
        v41 = 2114;
        v42 = v31;
        _os_log_impl(&dword_2172E1000, v26, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Aborted insertion of view: %{public}@ (subviews=%{public}@)",
          buf,
          0x34u);

      }
    }

  }
  v32 = *(_QWORD *)(a1 + 56);
  if (v32)
    (*(void (**)(uint64_t, id, id))(v32 + 16))(v32, v5, v6);

}

void __84__WGWidgetHostingViewController__insertContentProvidingSubview_sequence_completion___block_invoke_211(id *a1)
{
  uint64_t v2;
  id *v3;
  id WeakRetained;
  NSObject *v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  dispatch_time_t v10;
  NSObject *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  _QWORD block[4];
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v2 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __84__WGWidgetHostingViewController__insertContentProvidingSubview_sequence_completion___block_invoke_2;
  block[3] = &unk_24D731620;
  v3 = a1 + 7;
  objc_copyWeak(&v22, a1 + 7);
  v21 = a1[4];
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  WeakRetained = objc_loadWeakRetained(v3);
  v5 = (id)WGLogWidgets;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "widgetIdentifier");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_containerIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = a1[4];
    *(_DWORD *)buf = 138544130;
    v24 = v6;
    v25 = 2050;
    v26 = WeakRetained;
    v27 = 2114;
    v28 = v7;
    v29 = 2114;
    v30 = v8;
    _os_log_impl(&dword_2172E1000, v5, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> About to wait on '_viewWillAppearSemaphore' (%{public}@)",
      buf,
      0x2Au);

  }
  v9 = a1[4];
  v10 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v9, v10))
  {
    v11 = (id)WGLogWidgets;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(WeakRetained, "widgetIdentifier");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "_containerIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = a1[4];
      *(_DWORD *)buf = 138544130;
      v24 = v12;
      v25 = 2050;
      v26 = WeakRetained;
      v27 = 2114;
      v28 = v13;
      v29 = 2114;
      v30 = v14;
      _os_log_impl(&dword_2172E1000, v11, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> _viewWillAppearSemaphore (%{public}@) timed out!",
        buf,
        0x2Au);

    }
  }
  v16[0] = v2;
  v16[1] = 3221225472;
  v16[2] = __84__WGWidgetHostingViewController__insertContentProvidingSubview_sequence_completion___block_invoke_212;
  v16[3] = &unk_24D732568;
  v18 = a1[6];
  objc_copyWeak(&v19, v3);
  v17 = a1[5];
  v15 = (void *)MEMORY[0x24BDAC9B8];
  dispatch_async(MEMORY[0x24BDAC9B8], v16);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v22);
}

void __84__WGWidgetHostingViewController__insertContentProvidingSubview_sequence_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_beginRemoteViewControllerAppearanceTransitionIfNecessary:semaphore:animated:completion:", 1, *(_QWORD *)(a1 + 32), 0, 0);

}

void __84__WGWidgetHostingViewController__insertContentProvidingSubview_sequence_completion___block_invoke_212(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;

  v2 = *(_QWORD *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  (*(void (**)(uint64_t, id, _QWORD))(v2 + 16))(v2, WeakRetained, *(_QWORD *)(a1 + 32));

}

- (BOOL)_canInsertRemoteView:(id *)a3
{
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;

  if (-[WGWidgetHostingViewController isViewLoaded](self, "isViewLoaded"))
  {
    v5 = -[_WGWidgetRemoteViewController _isValid](self->_remoteViewController, "_isValid");
    if (!a3)
      return v5;
  }
  else
  {
    v5 = 0;
    if (!a3)
      return v5;
  }
  if (!v5)
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    -[WGWidgetHostingViewController isViewLoaded](self, "isViewLoaded");
    NSStringFromBOOL();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_WGWidgetRemoteViewController _isValid](self->_remoteViewController, "_isValid");
    NSStringFromBOOL();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("Can't insert remote view: isViewLoaded: %@; _remoteViewController isValid: %@"),
      v7,
      v8);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void)_insertAppropriateContentView
{
  id v3;

  if (-[_WGWidgetRemoteViewController _isValid](self->_remoteViewController, "_isValid"))
  {
    -[WGWidgetHostingViewController _activeLifeCycleSequence](self, "_activeLifeCycleSequence");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[WGWidgetHostingViewController _requestInsertionOfRemoteViewAfterViewWillAppearForSequence:completionHandler:](self, "_requestInsertionOfRemoteViewAfterViewWillAppearForSequence:completionHandler:", v3, 0);

  }
  else if (self->_snapshotView)
  {
    -[WGWidgetHostingViewController _insertSnapshotWithCompletionHandler:](self, "_insertSnapshotWithCompletionHandler:", 0);
  }
}

- (void)_insertSnapshotViewIfAppropriate
{
  WGWidgetLifeCycleSequence *activeLifeCycleSequence;

  if (!-[WGWidgetHostingViewController _isBlacklisted](self, "_isBlacklisted")
    && !-[WGWidgetHostingViewController isLockedOut](self, "isLockedOut"))
  {
    activeLifeCycleSequence = self->_activeLifeCycleSequence;
    if (!activeLifeCycleSequence
      || -[WGWidgetLifeCycleSequence isCurrentStateNotYet:](activeLifeCycleSequence, "isCurrentStateNotYet:", 4))
    {
      -[WGWidgetHostingViewController _loadSnapshotViewFromDiskIfNecessary:](self, "_loadSnapshotViewFromDiskIfNecessary:", &__block_literal_global_217);
    }
  }
}

void __65__WGWidgetHostingViewController__insertSnapshotViewIfAppropriate__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  id v10;

  v10 = a2;
  v4 = a3;
  objc_msgSend(v10, "_contentProvidingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

  }
  else
  {
    objc_msgSend(v10, "_activeLifeCycleSequence");
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6)
      goto LABEL_6;
    v7 = (void *)v6;
    if (!objc_msgSend(v10, "_isActiveSequence:", v4))
    {

      goto LABEL_8;
    }
    objc_msgSend(v10, "_activeLifeCycleSequence");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isCurrentStateNotYet:", 4);

    if ((v9 & 1) != 0)
LABEL_6:
      objc_msgSend(v10, "_insertSnapshotWithCompletionHandler:", 0);
  }
LABEL_8:

}

- (void)_requestInsertionOfRemoteViewAfterViewWillAppearForSequence:(id)a3 completionHandler:(id)a4
{
  id v7;
  void (**v8)(id, id, id);
  _BOOL4 v9;
  id v10;
  void *v11;
  void *v12;
  id WeakRetained;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  unint64_t v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  _QWORD v41[5];
  id v42;
  void (**v43)(id, id, id);
  uint64_t v44;
  id v45;
  id v46;
  _BYTE location[12];
  __int16 v48;
  WGWidgetHostingViewController *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  id v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (void (**)(id, id, id))a4;
  if (-[WGWidgetHostingViewController _isActiveSequence:](self, "_isActiveSequence:", v7))
  {
    v46 = 0;
    v9 = -[WGWidgetHostingViewController _canInsertRemoteView:](self, "_canInsertRemoteView:", &v46);
    v10 = v46;
    if (v9)
    {
      if (objc_msgSend((id)objc_opt_class(), "_canWidgetHostInsertRemoteViewForSequence:", v7))
      {
        if ((objc_msgSend(v7, "isCurrentStateNotYet:", 3) & 1) != 0
          || objc_msgSend(v7, "isCurrentStateAtLeast:", 5))
        {
          objc_msgSend(v7, "transitionToState:", 3);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            v12 = (void *)WGLogWidgets;
            if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_ERROR))
              -[WGWidgetHostingViewController _requestInsertionOfRemoteViewAfterViewWillAppearForSequence:completionHandler:].cold.2(v12);
            objc_initWeak((id *)location, self);
            if (v8)
            {
              WeakRetained = objc_loadWeakRetained((id *)location);
              v8[2](v8, WeakRetained, v7);

            }
            objc_destroyWeak((id *)location);
            goto LABEL_42;
          }
          v45 = 0;
          objc_msgSend(v7, "beginTransitionToState:error:", 4, &v45);
          v30 = objc_claimAutoreleasedReturnValue();
          v31 = (unint64_t)v45;
          v32 = (void *)v31;
          if (v30 | v31)
          {
            if (v31)
            {
              v33 = (void *)WGLogWidgets;
              if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_ERROR))
                -[WGWidgetHostingViewController _requestInsertionOfRemoteViewAfterViewWillAppearForSequence:completionHandler:].cold.1(v33);
              objc_initWeak((id *)location, self);
              if (v8)
              {
                v34 = objc_loadWeakRetained((id *)location);
                v8[2](v8, v34, v7);

              }
              objc_destroyWeak((id *)location);
              goto LABEL_41;
            }
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WGWidgetHostingViewController.m"), 1638, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("endTransitionBlock || error"));

          }
          v41[0] = MEMORY[0x24BDAC760];
          v41[1] = 3221225472;
          v41[2] = __111__WGWidgetHostingViewController__requestInsertionOfRemoteViewAfterViewWillAppearForSequence_completionHandler___block_invoke;
          v41[3] = &unk_24D732D60;
          v41[4] = self;
          v42 = (id)v30;
          v44 = 4;
          v43 = v8;
          -[WGWidgetHostingViewController _enqueueRemoteServiceRequest:withDescription:](self, "_enqueueRemoteServiceRequest:withDescription:", v41, CFSTR("Inserting remote view"));

LABEL_41:
LABEL_42:

          goto LABEL_43;
        }
        v35 = (void *)WGLogWidgets;
        if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
        {
          v36 = v35;
          -[WGWidgetHostingViewController widgetIdentifier](self, "widgetIdentifier");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[WGWidgetHostingViewController _containerIdentifier](self, "_containerIdentifier");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)location = 138544130;
          *(_QWORD *)&location[4] = v37;
          v48 = 2050;
          v49 = self;
          v50 = 2114;
          v51 = v38;
          v52 = 2114;
          v53 = v7;
          _os_log_impl(&dword_2172E1000, v36, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Sequence already at satisfactory state: %{public}@",
            location,
            0x2Au);

        }
        objc_initWeak((id *)location, self);
        if (v8)
        {
          v39 = objc_loadWeakRetained((id *)location);
          v8[2](v8, v39, v7);

        }
      }
      else
      {
        v25 = (void *)WGLogWidgets;
        if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
        {
          v26 = v25;
          -[WGWidgetHostingViewController widgetIdentifier](self, "widgetIdentifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[WGWidgetHostingViewController _containerIdentifier](self, "_containerIdentifier");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)location = 138544130;
          *(_QWORD *)&location[4] = v27;
          v48 = 2050;
          v49 = self;
          v50 = 2114;
          v51 = v28;
          v52 = 2114;
          v53 = v7;
          _os_log_impl(&dword_2172E1000, v26, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Sequence state where insertion of remote view isn't possible: %{public}@",
            location,
            0x2Au);

        }
        objc_initWeak((id *)location, self);
        if (v8)
        {
          v29 = objc_loadWeakRetained((id *)location);
          v8[2](v8, v29, v7);

        }
      }
    }
    else
    {
      v20 = (void *)WGLogWidgets;
      if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
      {
        v21 = v20;
        -[WGWidgetHostingViewController widgetIdentifier](self, "widgetIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[WGWidgetHostingViewController _containerIdentifier](self, "_containerIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)location = 138544130;
        *(_QWORD *)&location[4] = v22;
        v48 = 2050;
        v49 = self;
        v50 = 2114;
        v51 = v23;
        v52 = 2114;
        v53 = v10;
        _os_log_impl(&dword_2172E1000, v21, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> %{public}@",
          location,
          0x2Au);

      }
      objc_initWeak((id *)location, self);
      if (v8)
      {
        v24 = objc_loadWeakRetained((id *)location);
        v8[2](v8, v24, v7);

      }
    }
    objc_destroyWeak((id *)location);
LABEL_43:

    goto LABEL_44;
  }
  v14 = (void *)WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    v15 = v14;
    -[WGWidgetHostingViewController widgetIdentifier](self, "widgetIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[WGWidgetHostingViewController _containerIdentifier](self, "_containerIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[WGWidgetHostingViewController _activeLifeCycleSequence](self, "_activeLifeCycleSequence");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)location = 138544386;
    *(_QWORD *)&location[4] = v16;
    v48 = 2050;
    v49 = self;
    v50 = 2114;
    v51 = v17;
    v52 = 2114;
    v53 = v7;
    v54 = 2114;
    v55 = v18;
    _os_log_impl(&dword_2172E1000, v15, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Can't insert remote view as argument sequence (%{public}@) doesn't"
      " match active sequence (%{public}@)",
      location,
      0x34u);

  }
  objc_initWeak((id *)location, self);
  if (v8)
  {
    v19 = objc_loadWeakRetained((id *)location);
    v8[2](v8, v19, v7);

  }
  objc_destroyWeak((id *)location);
LABEL_44:

}

void __111__WGWidgetHostingViewController__requestInsertionOfRemoteViewAfterViewWillAppearForSequence_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, int a4)
{
  id v7;
  id v8;
  int v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  const char *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  id v28;
  uint64_t v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = objc_msgSend(v7, "_isActiveSequence:", v8);
  v10 = objc_msgSend(v8, "isCurrentState:", 3);
  if (a4 && v9 && v10)
  {
    v11 = *(void **)(a1 + 32);
    objc_msgSend(v7, "_remoteViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __111__WGWidgetHostingViewController__requestInsertionOfRemoteViewAfterViewWillAppearForSequence_completionHandler___block_invoke_2;
    v26[3] = &unk_24D732D38;
    v14 = *(id *)(a1 + 40);
    v16 = *(void **)(a1 + 48);
    v15 = *(_QWORD *)(a1 + 56);
    v27 = v14;
    v29 = v15;
    v28 = v16;
    objc_msgSend(v11, "_insertContentProvidingSubview:sequence:completion:", v13, v8, v26);

    goto LABEL_18;
  }
  if ((a4 & 1) == 0)
  {
    v23 = (void *)WGLogWidgets;
    if (!os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
      goto LABEL_16;
    v18 = v23;
    objc_msgSend(v7, "widgetIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_containerIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v31 = v19;
    v32 = 2050;
    v33 = v7;
    v34 = 2114;
    v35 = v20;
    _os_log_impl(&dword_2172E1000, v18, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Can't insert remote view as queue is no longer valid",
      buf,
      0x20u);
    goto LABEL_15;
  }
  if ((v9 & 1) == 0)
  {
    v24 = (void *)WGLogWidgets;
    if (!os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
      goto LABEL_16;
    v18 = v24;
    objc_msgSend(v7, "widgetIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_containerIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_activeLifeCycleSequence");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v31 = v19;
    v32 = 2050;
    v33 = v7;
    v34 = 2114;
    v35 = v20;
    v36 = 2114;
    v37 = v8;
    v38 = 2114;
    v39 = v21;
    v22 = "<%{public}@: %{public}p; container: %{public}@> Can't insert remote view as argument sequence (%{public}@) doe"
          "sn't match active sequence (%{public}@)";
    goto LABEL_14;
  }
  if ((v10 & 1) == 0)
  {
    v17 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      v18 = v17;
      objc_msgSend(v7, "widgetIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_containerIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      WGStringFromWidgetLifeCycleSequenceState(3uLL);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v31 = v19;
      v32 = 2050;
      v33 = v7;
      v34 = 2114;
      v35 = v20;
      v36 = 2114;
      v37 = v8;
      v38 = 2114;
      v39 = v21;
      v22 = "<%{public}@: %{public}p; container: %{public}@> Can't insert remote view as argument sequence (%{public}@) i"
            "sn't in expected state (%{public}@)";
LABEL_14:
      _os_log_impl(&dword_2172E1000, v18, OS_LOG_TYPE_DEFAULT, v22, buf, 0x34u);

LABEL_15:
    }
  }
LABEL_16:
  v25 = *(_QWORD *)(a1 + 48);
  if (v25)
    (*(void (**)(uint64_t, id, id))(v25 + 16))(v25, v7, v8);
LABEL_18:

}

void __111__WGWidgetHostingViewController__requestInsertionOfRemoteViewAfterViewWillAppearForSequence_completionHandler___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  (*(void (**)(void))(a1[4] + 16))();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      objc_msgSend(v5, "widgetIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_containerIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      WGStringFromWidgetLifeCycleSequenceState(a1[6]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138544386;
      v15 = v10;
      v16 = 2050;
      v17 = v5;
      v18 = 2114;
      v19 = v11;
      v20 = 2114;
      v21 = v12;
      v22 = 2114;
      v23 = v7;
      _os_log_impl(&dword_2172E1000, v9, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Encountered error transitioning to target state '%{public}@': %{public}@",
        (uint8_t *)&v14,
        0x34u);

    }
  }
  v13 = a1[5];
  if (v13)
    (*(void (**)(uint64_t, id, id))(v13 + 16))(v13, v5, v6);

}

- (void)_synchronizeGeometryWithSnapshot
{
  uint64_t v3;
  void *v4;
  BOOL v5;
  CGRect v6;

  -[WGWidgetHostingViewController _snapshotView](self, "_snapshotView");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = -[WGWidgetHostingViewController isRemoteViewVisible](self, "isRemoteViewVisible");

    if (!v5)
    {
      -[WGWidgetHostingViewController _snapshotViewBounds](self, "_snapshotViewBounds");
      -[WGWidgetHostingViewController _updatePreferredContentSizeWithHeight:](self, "_updatePreferredContentSizeWithHeight:", CGRectGetHeight(v6));
    }
  }
}

- (void)_insertSnapshotWithCompletionHandler:(id)a3
{
  id v4;
  _WGCAPackageView *snapshotView;
  _WGCAPackageView *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  if (-[WGWidgetHostingViewController isViewLoaded](self, "isViewLoaded")
    && (snapshotView = self->_snapshotView) != 0
    && (-[WGWidgetHostingViewController _contentProvidingView](self, "_contentProvidingView"),
        v6 = (_WGCAPackageView *)objc_claimAutoreleasedReturnValue(),
        v6,
        snapshotView != v6))
  {
    -[WGWidgetHostingViewController _beginRemoteViewControllerAppearanceTransitionIfNecessary:semaphore:animated:completion:](self, "_beginRemoteViewControllerAppearanceTransitionIfNecessary:semaphore:animated:completion:", 0, 0, 0, 0);
    -[_WGCAPackageView layer](self->_snapshotView, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSecurityMode:", *MEMORY[0x24BDE5CD8]);

    -[WGWidgetHostingViewController _snapshotView](self, "_snapshotView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WGWidgetHostingViewController _activeLifeCycleSequence](self, "_activeLifeCycleSequence");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __70__WGWidgetHostingViewController__insertSnapshotWithCompletionHandler___block_invoke;
    v13[3] = &unk_24D732820;
    v14 = v4;
    -[WGWidgetHostingViewController _insertContentProvidingSubview:sequence:completion:](self, "_insertContentProvidingSubview:sequence:completion:", v8, v9, v13);

  }
  else
  {
    objc_initWeak(&v12, self);
    if (v4)
    {
      v10 = objc_loadWeakRetained(&v12);
      -[WGWidgetHostingViewController _activeLifeCycleSequence](self, "_activeLifeCycleSequence");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, id, void *))v4 + 2))(v4, v10, v11);

    }
    objc_destroyWeak(&v12);
  }

}

void __70__WGWidgetHostingViewController__insertSnapshotWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_msgSend(v9, "_snapshotView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_contentProvidingView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v7)
  {
    objc_msgSend(v9, "_endRemoteViewControllerAppearanceTransitionIfNecessary");
    objc_msgSend(v9, "_synchronizeGeometryWithSnapshot");
  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v9, v5);

}

- (BOOL)_managingContainerIsVisible
{
  id WeakRetained;
  char v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = objc_msgSend(WeakRetained, "managingContainerIsVisibleForWidget:", self);
  }
  else
  {
    -[WGWidgetHostingViewController parentViewController](self, "parentViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "wg_isAppearingOrAppeared");

  }
  return v4;
}

- (void)_endSequence:(id)a3 withReason:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, id, id);
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void (**v16)(_QWORD, _QWORD, _QWORD);
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id WeakRetained;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD v28[5];
  id v29;
  void (**v30)(id, id, id);
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  WGWidgetHostingViewController *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, id, id))a5;
  v11 = (void *)WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    -[WGWidgetHostingViewController widgetIdentifier](self, "widgetIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WGWidgetHostingViewController _containerIdentifier](self, "_containerIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v32 = v13;
    v33 = 2050;
    v34 = self;
    v35 = 2114;
    v36 = v14;
    v37 = 2114;
    v38 = v8;
    v39 = 2114;
    v40 = v9;
    _os_log_impl(&dword_2172E1000, v12, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> End sequence '%{public}@' with reason: %{public}@",
      buf,
      0x34u);

  }
  v15 = !-[WGWidgetHostingViewController _isActiveSequence:](self, "_isActiveSequence:", v8);
  if (!v8)
    LOBYTE(v15) = 1;
  if ((v15 & 1) != 0)
  {
    v17 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      v18 = v17;
      -[WGWidgetHostingViewController widgetIdentifier](self, "widgetIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[WGWidgetHostingViewController _containerIdentifier](self, "_containerIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[WGWidgetHostingViewController _activeLifeCycleSequence](self, "_activeLifeCycleSequence");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v32 = v19;
      v33 = 2050;
      v34 = self;
      v35 = 2114;
      v36 = v20;
      v37 = 2114;
      v38 = v8;
      v39 = 2114;
      v40 = v21;
      _os_log_impl(&dword_2172E1000, v18, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Can't end sequence as argument sequence (%{public}@) doesn't mat"
        "ch active sequence (%{public}@), or there's no active sequence",
        buf,
        0x34u);

    }
    objc_initWeak((id *)buf, self);
    if (v10)
    {
      WeakRetained = objc_loadWeakRetained((id *)buf);
      v10[2](v10, WeakRetained, v8);

    }
    goto LABEL_13;
  }
  if (!objc_msgSend((id)objc_opt_class(), "_canWidgetHostEndSequenceByDisconnectingRemoteViewControllerForSequence:", v8))
  {
    v23 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      v24 = v23;
      -[WGWidgetHostingViewController widgetIdentifier](self, "widgetIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[WGWidgetHostingViewController _containerIdentifier](self, "_containerIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v32 = v25;
      v33 = 2050;
      v34 = self;
      v35 = 2114;
      v36 = v26;
      v37 = 2114;
      v38 = v8;
      _os_log_impl(&dword_2172E1000, v24, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Sequence already at satisfactory state: %{public}@",
        buf,
        0x2Au);

    }
    objc_initWeak((id *)buf, self);
    if (v10)
    {
      v27 = objc_loadWeakRetained((id *)buf);
      v10[2](v10, v27, v8);

    }
LABEL_13:
    objc_destroyWeak((id *)buf);
    goto LABEL_21;
  }
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __68__WGWidgetHostingViewController__endSequence_withReason_completion___block_invoke;
  v28[3] = &unk_24D732DB0;
  v28[4] = self;
  v29 = v9;
  v30 = v10;
  v16 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x219A0A970](v28);
  if (-[WGWidgetHostingViewController _hasOutstandingUpdateRequestForSequence:](self, "_hasOutstandingUpdateRequestForSequence:", v8))
  {
    -[WGWidgetHostingViewController _registerUpdateRequestCompletionHandler:forSequence:](self, "_registerUpdateRequestCompletionHandler:forSequence:", v16, v8);
  }
  else
  {
    ((void (**)(_QWORD, WGWidgetHostingViewController *, id))v16)[2](v16, self, v8);
  }

LABEL_21:
}

void __68__WGWidgetHostingViewController__endSequence_withReason_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __68__WGWidgetHostingViewController__endSequence_withReason_completion___block_invoke_2;
  v6[3] = &unk_24D732D88;
  v5 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v5, "_captureSnapshotAndBeginDisappearanceTransitionForSequence:completionHandler:", a3, v6);

}

void __68__WGWidgetHostingViewController__endSequence_withReason_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  int v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  const char *v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v5, "_isActiveSequence:", v6);
  v8 = objc_msgSend(v6, "isCurrentState:", 5);
  if (v7 && v8)
  {
    objc_msgSend(v5, "_endRemoteViewControllerAppearanceTransitionIfNecessary");
    if ((objc_msgSend(v5, "_managingContainerIsVisible") & 1) != 0
      || (objc_msgSend(v5, "_shouldRemoveSnapshotWhenNotVisible") & 1) == 0)
    {
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __68__WGWidgetHostingViewController__endSequence_withReason_completion___block_invoke_3;
      v17[3] = &unk_24D732D88;
      v18 = *(id *)(a1 + 32);
      v19 = *(id *)(a1 + 40);
      objc_msgSend(v5, "_insertSnapshotWithCompletionHandler:", v17);

    }
    else
    {
      objc_msgSend(v5, "_disconnectRemoteViewControllerForReason:sequence:coalesce:completionHandler:", *(_QWORD *)(a1 + 32), v6, objc_msgSend(v5, "disconnectsImmediately") ^ 1, *(_QWORD *)(a1 + 40));
    }
    goto LABEL_16;
  }
  if ((v7 & 1) == 0)
  {
    v15 = (void *)WGLogWidgets;
    if (!os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    v10 = v15;
    objc_msgSend(v5, "widgetIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_containerIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_activeLifeCycleSequence");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v21 = v11;
    v22 = 2050;
    v23 = v5;
    v24 = 2114;
    v25 = v12;
    v26 = 2114;
    v27 = v6;
    v28 = 2114;
    v29 = v13;
    v14 = "<%{public}@: %{public}p; container: %{public}@> Can't disconnect remote view controller as argument sequence ("
          "%{public}@) doesn't match active sequence (%{public}@)";
    goto LABEL_13;
  }
  if ((v8 & 1) == 0)
  {
    v9 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      objc_msgSend(v5, "widgetIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_containerIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      WGStringFromWidgetLifeCycleSequenceState(5uLL);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v21 = v11;
      v22 = 2050;
      v23 = v5;
      v24 = 2114;
      v25 = v12;
      v26 = 2114;
      v27 = v6;
      v28 = 2114;
      v29 = v13;
      v14 = "<%{public}@: %{public}p; container: %{public}@> Can't disconnect remote view controller as argument sequence"
            " (%{public}@) isn't in expected state (%{public}@)";
LABEL_13:
      _os_log_impl(&dword_2172E1000, v10, OS_LOG_TYPE_DEFAULT, v14, buf, 0x34u);

    }
  }
LABEL_14:
  v16 = *(_QWORD *)(a1 + 40);
  if (v16)
    (*(void (**)(uint64_t, id, id))(v16 + 16))(v16, v5, v6);
LABEL_16:

}

void __68__WGWidgetHostingViewController__endSequence_withReason_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  int v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  const char *v14;
  void *v15;
  uint64_t v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v5, "_isActiveSequence:", v6);
  v8 = objc_msgSend(v6, "isCurrentState:", 5);
  if (v7 && v8)
  {
    objc_msgSend(v5, "_disconnectRemoteViewControllerForReason:sequence:coalesce:completionHandler:", *(_QWORD *)(a1 + 32), v6, objc_msgSend(v5, "disconnectsImmediately") ^ 1, *(_QWORD *)(a1 + 40));
    goto LABEL_13;
  }
  if ((v7 & 1) == 0)
  {
    v15 = (void *)WGLogWidgets;
    if (!os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    v10 = v15;
    objc_msgSend(v5, "widgetIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_containerIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_activeLifeCycleSequence");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138544386;
    v18 = v11;
    v19 = 2050;
    v20 = v5;
    v21 = 2114;
    v22 = v12;
    v23 = 2114;
    v24 = v6;
    v25 = 2114;
    v26 = v13;
    v14 = "<%{public}@: %{public}p; container: %{public}@> Can't disconnect remote view controller as argument sequence ("
          "%{public}@) doesn't match active sequence (%{public}@)";
    goto LABEL_10;
  }
  if ((v8 & 1) == 0)
  {
    v9 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      objc_msgSend(v5, "widgetIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_containerIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      WGStringFromWidgetLifeCycleSequenceState(5uLL);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138544386;
      v18 = v11;
      v19 = 2050;
      v20 = v5;
      v21 = 2114;
      v22 = v12;
      v23 = 2114;
      v24 = v6;
      v25 = 2114;
      v26 = v13;
      v14 = "<%{public}@: %{public}p; container: %{public}@> Can't disconnect remote view controller as argument sequence"
            " (%{public}@) isn't in expected state (%{public}@)";
LABEL_10:
      _os_log_impl(&dword_2172E1000, v10, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v17, 0x34u);

    }
  }
LABEL_11:
  v16 = *(_QWORD *)(a1 + 40);
  if (v16)
    (*(void (**)(uint64_t, id, id))(v16 + 16))(v16, v5, v6);
LABEL_13:

}

- (void)_disconnectRemoteViewControllerForReason:(id)a3 sequence:(id)a4 coalesce:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v7;
  id v11;
  void (**v12)(id, id, id);
  _BOOL4 v13;
  void *v14;
  _BOOL4 v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id WeakRetained;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  id v38;
  unint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  NSObject *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  id v57;
  id v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  WGWidgetHostingViewController *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  id v66;
  __int16 v67;
  void *v68;
  uint64_t v69;

  v7 = a5;
  v69 = *MEMORY[0x24BDAC8D0];
  v57 = a3;
  v11 = a4;
  v12 = (void (**)(id, id, id))a6;
  v13 = -[WGWidgetHostingViewController _isActiveSequence:](self, "_isActiveSequence:", v11);
  v14 = (void *)WGLogWidgets;
  v15 = os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (v15)
    {
      v16 = v14;
      -[WGWidgetHostingViewController widgetIdentifier](self, "widgetIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[WGWidgetHostingViewController _containerIdentifier](self, "_containerIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromBOOL();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v60 = v17;
      v61 = 2050;
      v62 = self;
      v63 = 2114;
      v64 = v18;
      v65 = 2114;
      v66 = v57;
      v67 = 2114;
      v68 = v19;
      _os_log_impl(&dword_2172E1000, v16, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Disconnection requested with reason: '%{public}@'; shouldCoalesce: %{public}@",
        buf,
        0x34u);

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_disconnectionTimer);
    if (!objc_msgSend((id)objc_opt_class(), "_canWidgetHostDisconnectRemoteViewControllerForSequence:disconnectionTimer:coalesce:", v11, WeakRetained, v7))
    {
      v34 = (void *)WGLogWidgets;
      if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
      {
        v35 = v34;
        -[WGWidgetHostingViewController widgetIdentifier](self, "widgetIdentifier");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[WGWidgetHostingViewController _containerIdentifier](self, "_containerIdentifier");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v60 = v36;
        v61 = 2050;
        v62 = self;
        v63 = 2114;
        v64 = v37;
        v65 = 2114;
        v66 = v11;
        _os_log_impl(&dword_2172E1000, v35, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Sequence already at satisfactory state: %{public}@",
          buf,
          0x2Au);

      }
      objc_initWeak((id *)buf, self);
      if (v12)
      {
        v38 = objc_loadWeakRetained((id *)buf);
        v12[2](v12, v38, v11);

      }
      objc_destroyWeak((id *)buf);
      goto LABEL_43;
    }
    objc_msgSend(v11, "transitionToState:", 6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v22 = (void *)WGLogWidgets;
      if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_ERROR))
        -[WGWidgetHostingViewController _disconnectRemoteViewControllerForReason:sequence:coalesce:completionHandler:].cold.3(v22);
      v23 = (void *)WGLogWidgets;
      if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
      {
        v24 = v23;
        -[WGWidgetHostingViewController widgetIdentifier](self, "widgetIdentifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[WGWidgetHostingViewController _containerIdentifier](self, "_containerIdentifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        WGStringFromWidgetLifeCycleSequenceState(6uLL);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v60 = v25;
        v61 = 2050;
        v62 = self;
        v63 = 2114;
        v64 = v26;
        v65 = 2112;
        v66 = v27;
        v67 = 2112;
        v68 = v21;
        _os_log_impl(&dword_2172E1000, v24, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Encountered error transitioning to target state '%@': %@",
          buf,
          0x34u);

      }
      objc_initWeak((id *)buf, self);
      if (v12)
      {
        v28 = objc_loadWeakRetained((id *)buf);
        v12[2](v12, v28, v11);

      }
      objc_destroyWeak((id *)buf);
      goto LABEL_42;
    }
    v58 = 0;
    objc_msgSend(v11, "beginTransitionToState:error:", 0, &v58);
    v56 = objc_claimAutoreleasedReturnValue();
    v39 = (unint64_t)v58;
    v40 = (void *)v39;
    if (v56 | v39)
    {
      if (v39)
      {
        v41 = (void *)WGLogWidgets;
        if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_ERROR))
          -[WGWidgetHostingViewController _disconnectRemoteViewControllerForReason:sequence:coalesce:completionHandler:].cold.2(v41);
        v42 = (void *)WGLogWidgets;
        if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
        {
          v43 = v42;
          -[WGWidgetHostingViewController widgetIdentifier](self, "widgetIdentifier");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          -[WGWidgetHostingViewController _containerIdentifier](self, "_containerIdentifier");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          WGStringFromWidgetLifeCycleSequenceState(0);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544386;
          v60 = v44;
          v61 = 2050;
          v62 = self;
          v63 = 2114;
          v64 = v45;
          v65 = 2112;
          v66 = v46;
          v67 = 2112;
          v68 = v40;
          _os_log_impl(&dword_2172E1000, v43, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Encountered error transitioning to target state '%@': %@",
            buf,
            0x34u);

        }
        objc_initWeak((id *)buf, self);
        if (v12)
        {
          v47 = objc_loadWeakRetained((id *)buf);
          v12[2](v12, v47, v11);

        }
        objc_destroyWeak((id *)buf);
LABEL_41:

LABEL_42:
LABEL_43:

        goto LABEL_44;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WGWidgetHostingViewController.m"), 1797, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("endTransitionBlock || error"));

    }
    if (v7)
    {
      if (WeakRetained)
      {
        v49 = WGLogWidgets;
        if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_ERROR))
          -[WGWidgetHostingViewController _disconnectRemoteViewControllerForReason:sequence:coalesce:completionHandler:].cold.1(v49, v50, v51);
      }
      v52 = (void *)WGLogWidgets;
      if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
      {
        v53 = v52;
        -[WGWidgetHostingViewController widgetIdentifier](self, "widgetIdentifier");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        -[WGWidgetHostingViewController _containerIdentifier](self, "_containerIdentifier");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v60 = v54;
        v61 = 2050;
        v62 = self;
        v63 = 2114;
        v64 = v55;
        _os_log_impl(&dword_2172E1000, v53, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Disconnection requested - scheduling disconnection timer",
          buf,
          0x20u);

      }
      -[WGWidgetHostingViewController _scheduleDisconnectionTimerForSequence:endTransitionBlock:completion:](self, "_scheduleDisconnectionTimerForSequence:endTransitionBlock:completion:", v11, v56, v12);
    }
    else
    {
      -[WGWidgetHostingViewController _invalidateDisconnectionTimer](self, "_invalidateDisconnectionTimer");
      -[WGWidgetHostingViewController _enqueueDisconnectionRequestForSequence:endTransitionBlock:completion:](self, "_enqueueDisconnectionRequestForSequence:endTransitionBlock:completion:", v11, v56, v12);
    }
    goto LABEL_41;
  }
  if (v15)
  {
    v29 = v14;
    -[WGWidgetHostingViewController widgetIdentifier](self, "widgetIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[WGWidgetHostingViewController _containerIdentifier](self, "_containerIdentifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[WGWidgetHostingViewController _activeLifeCycleSequence](self, "_activeLifeCycleSequence");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v60 = v30;
    v61 = 2050;
    v62 = self;
    v63 = 2114;
    v64 = v31;
    v65 = 2114;
    v66 = v11;
    v67 = 2114;
    v68 = v32;
    _os_log_impl(&dword_2172E1000, v29, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Can't disconnect remote view controller as argument sequence (%{pu"
      "blic}@) doesn't match active sequence (%{public}@)",
      buf,
      0x34u);

  }
  objc_initWeak((id *)buf, self);
  if (v12)
  {
    v33 = objc_loadWeakRetained((id *)buf);
    v12[2](v12, v33, v11);

  }
  objc_destroyWeak((id *)buf);
LABEL_44:

}

- (void)_enqueueDisconnectionRequestForSequence:(id)a3 endTransitionBlock:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;

  v7 = a4;
  v8 = a5;
  v12 = MEMORY[0x24BDAC760];
  v13 = v7;
  v14 = v8;
  v9 = v8;
  v10 = v7;
  -[WGWidgetHostingViewController _proxyConnectionQueue](self, "_proxyConnectionQueue", v12, 3221225472, __103__WGWidgetHostingViewController__enqueueDisconnectionRequestForSequence_endTransitionBlock_completion___block_invoke, &unk_24D732DD8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WGWidgetHostingViewController _enqueueRequest:inQueue:trampolinedToMainQueue:withDescription:](self, "_enqueueRequest:inQueue:trampolinedToMainQueue:withDescription:", &v12, v11, 1, CFSTR("Disconnecting remote view controller"));

}

void __103__WGWidgetHostingViewController__enqueueDisconnectionRequestForSequence_endTransitionBlock_completion___block_invoke(uint64_t a1, void *a2, void *a3, int a4)
{
  id v7;
  id v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  const char *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  int v29;
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = objc_msgSend(v7, "_isActiveSequence:", v8);
  v10 = objc_msgSend(v8, "isCurrentState:", 6);
  if (a4 && v9 && v10)
  {
    v11 = *(_QWORD *)(a1 + 32);
    if (v11
      && ((*(void (**)(uint64_t, _QWORD))(v11 + 16))(v11, 0),
          (v12 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v13 = (void *)v12;
      v14 = (void *)WGLogWidgets;
      if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
      {
        v15 = v14;
        objc_msgSend(v7, "widgetIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "_containerIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        WGStringFromWidgetLifeCycleSequenceState(0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 138544386;
        v30 = v16;
        v31 = 2050;
        v32 = v7;
        v33 = 2114;
        v34 = v17;
        v35 = 2112;
        v36 = v18;
        v37 = 2112;
        v38 = v13;
        _os_log_impl(&dword_2172E1000, v15, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Encountered error transitioning to target state '%@': %@",
          (uint8_t *)&v29,
          0x34u);

      }
      v19 = *(_QWORD *)(a1 + 40);
      if (v19)
        (*(void (**)(uint64_t, id, id))(v19 + 16))(v19, v7, v8);
    }
    else
    {
      objc_msgSend(v7, "_disconnectRemoteViewControllerForSequence:completion:", v8, *(_QWORD *)(a1 + 40));
      v13 = 0;
    }

    goto LABEL_25;
  }
  if ((a4 & 1) == 0)
  {
    v26 = (void *)WGLogWidgets;
    if (!os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
      goto LABEL_23;
    v21 = v26;
    objc_msgSend(v7, "widgetIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_containerIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 138543874;
    v30 = v22;
    v31 = 2050;
    v32 = v7;
    v33 = 2114;
    v34 = v23;
    _os_log_impl(&dword_2172E1000, v21, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Remote view controller instantiation request no longer valid",
      (uint8_t *)&v29,
      0x20u);
    goto LABEL_22;
  }
  if ((v9 & 1) == 0)
  {
    v27 = (void *)WGLogWidgets;
    if (!os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
      goto LABEL_23;
    v21 = v27;
    objc_msgSend(v7, "widgetIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_containerIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_activeLifeCycleSequence");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 138544386;
    v30 = v22;
    v31 = 2050;
    v32 = v7;
    v33 = 2114;
    v34 = v23;
    v35 = 2112;
    v36 = v8;
    v37 = 2112;
    v38 = v24;
    v25 = "<%{public}@: %{public}p; container: %{public}@> Disconnecting remote view controller as argument sequence (%@)"
          " doesn't match active sequence (%@)";
    goto LABEL_21;
  }
  if ((v10 & 1) == 0)
  {
    v20 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      v21 = v20;
      objc_msgSend(v7, "widgetIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_containerIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      WGStringFromWidgetLifeCycleSequenceState(1uLL);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138544386;
      v30 = v22;
      v31 = 2050;
      v32 = v7;
      v33 = 2114;
      v34 = v23;
      v35 = 2112;
      v36 = v8;
      v37 = 2112;
      v38 = v24;
      v25 = "<%{public}@: %{public}p; container: %{public}@> Disconnecting remote view controller as argument sequence (%"
            "@) isn't in expected state (%@)";
LABEL_21:
      _os_log_impl(&dword_2172E1000, v21, OS_LOG_TYPE_DEFAULT, v25, (uint8_t *)&v29, 0x34u);

LABEL_22:
    }
  }
LABEL_23:
  v28 = *(_QWORD *)(a1 + 40);
  if (v28)
    (*(void (**)(uint64_t, id, id))(v28 + 16))(v28, v7, v8);
LABEL_25:

}

- (void)_disconnectRemoteViewControllerForSequence:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void (**remoteViewControllerDisconnectionHandler)(id, id, id, void *);
  id WeakRetained;
  dispatch_semaphore_t v21;
  _WGWidgetRemoteViewController *v22;
  uint64_t v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  id v27;
  _QWORD v28[4];
  NSObject *v29;
  _QWORD v30[4];
  NSObject *v31;
  id v32;
  uint64_t v33;
  const __CFString *v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  WGWidgetHostingViewController *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    -[WGWidgetHostingViewController widgetIdentifier](self, "widgetIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WGWidgetHostingViewController _containerIdentifier](self, "_containerIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v36 = v10;
    v37 = 2050;
    v38 = self;
    v39 = 2114;
    v40 = v11;
    _os_log_impl(&dword_2172E1000, v9, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Severing remote view controller connection...",
      buf,
      0x20u);

  }
  if (self->_remoteViewControllerDisconnectionHandler)
  {
    v12 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v12;
      -[WGWidgetHostingViewController widgetIdentifier](self, "widgetIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[WGWidgetHostingViewController _containerIdentifier](self, "_containerIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v36 = v14;
      v37 = 2050;
      v38 = self;
      v39 = 2114;
      v40 = v15;
      _os_log_impl(&dword_2172E1000, v13, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Already had a remote view controller disconnection handler",
        buf,
        0x20u);

    }
    objc_initWeak((id *)buf, self);
    v16 = (void *)MEMORY[0x24BDD1540];
    v33 = *MEMORY[0x24BDD0FC8];
    v34 = CFSTR("Already had a remote view controller disconnection handler");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("WGWidgetHostingViewControllerErrorDomain"), 0, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    remoteViewControllerDisconnectionHandler = (void (**)(id, id, id, void *))self->_remoteViewControllerDisconnectionHandler;
    WeakRetained = objc_loadWeakRetained((id *)buf);
    remoteViewControllerDisconnectionHandler[2](remoteViewControllerDisconnectionHandler, WeakRetained, v6, v18);

    objc_destroyWeak((id *)buf);
  }
  v21 = dispatch_semaphore_create(0);
  v22 = self->_remoteViewController;
  -[_WGWidgetRemoteViewController _setValid:](v22, "_setValid:", 0);
  v23 = MEMORY[0x24BDAC760];
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __87__WGWidgetHostingViewController__disconnectRemoteViewControllerForSequence_completion___block_invoke;
  v30[3] = &unk_24D732E00;
  v24 = v21;
  v31 = v24;
  v25 = v7;
  v32 = v25;
  -[WGWidgetHostingViewController _setRemoteViewControllerDisconnectionHandler:](self, "_setRemoteViewControllerDisconnectionHandler:", v30);
  v28[0] = v23;
  v28[1] = 3221225472;
  v28[2] = __87__WGWidgetHostingViewController__disconnectRemoteViewControllerForSequence_completion___block_invoke_229;
  v28[3] = &unk_24D732910;
  v26 = v24;
  v29 = v26;
  -[WGWidgetHostingViewController _enqueueRequest:inQueue:trampolinedToMainQueue:withDescription:](self, "_enqueueRequest:inQueue:trampolinedToMainQueue:withDescription:", v28, self->_proxyConnectionQueue, 0, CFSTR("Blocking proxy connection queue on connection semaphore"));
  -[WGWidgetHostingViewController _setConnectionState:](self, "_setConnectionState:", 2);
  if (v22)
    v27 = -[_WGWidgetRemoteViewController disconnect](v22, "disconnect");
  else
    -[WGWidgetHostingViewController widget:didTerminateWithError:](self, "widget:didTerminateWithError:", 0, 0);

}

void __87__WGWidgetHostingViewController__disconnectRemoteViewControllerForSequence_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  _QWORD v8[4];
  id v9;
  id v10;

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __87__WGWidgetHostingViewController__disconnectRemoteViewControllerForSequence_completion___block_invoke_2;
  v8[3] = &unk_24D732D88;
  v9 = *(id *)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  objc_msgSend(a2, "_finishDisconnectingRemoteViewControllerForSequence:error:completion:", a3, a4, v8);

}

void __87__WGWidgetHostingViewController__disconnectRemoteViewControllerForSequence_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    objc_msgSend(v5, "widgetIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_containerIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 32);
    v13 = 138544130;
    v14 = v9;
    v15 = 2050;
    v16 = v5;
    v17 = 2114;
    v18 = v10;
    v19 = 2114;
    v20 = v11;
    _os_log_impl(&dword_2172E1000, v8, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Signaling disconnection semaphore (%{public}@)",
      (uint8_t *)&v13,
      0x2Au);

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  v12 = *(_QWORD *)(a1 + 40);
  if (v12)
    (*(void (**)(uint64_t, id, id))(v12 + 16))(v12, v5, v6);

}

void __87__WGWidgetHostingViewController__disconnectRemoteViewControllerForSequence_completion___block_invoke_229(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    objc_msgSend(v5, "widgetIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_containerIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 32);
    v17 = 138544130;
    v18 = v9;
    v19 = 2050;
    v20 = v5;
    v21 = 2114;
    v22 = v10;
    v23 = 2114;
    v24 = v11;
    _os_log_impl(&dword_2172E1000, v8, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Waiting on disconnection semaphore (%{public}@)",
      (uint8_t *)&v17,
      0x2Au);

  }
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL);
  v12 = (void *)WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    v13 = v12;
    objc_msgSend(v5, "widgetIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_containerIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(a1 + 32);
    v17 = 138544130;
    v18 = v14;
    v19 = 2050;
    v20 = v5;
    v21 = 2114;
    v22 = v15;
    v23 = 2114;
    v24 = v16;
    _os_log_impl(&dword_2172E1000, v13, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> No longer waiting on disconnection semaphore (%{public}@)",
      (uint8_t *)&v17,
      0x2Au);

  }
}

- (void)_finishDisconnectingRemoteViewControllerForSequence:(id)a3 error:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, WGWidgetHostingViewController *, id);
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  WGWidgetHostingViewController *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, WGWidgetHostingViewController *, id))a5;
  v11 = (void *)WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    -[WGWidgetHostingViewController widgetIdentifier](self, "widgetIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WGWidgetHostingViewController _containerIdentifier](self, "_containerIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138543874;
    v26 = v13;
    v27 = 2050;
    v28 = self;
    v29 = 2114;
    v30 = v14;
    _os_log_impl(&dword_2172E1000, v12, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Severed remote view controller connection",
      (uint8_t *)&v25,
      0x20u);

  }
  -[WGWidgetHostingViewController _setConnectionState:](self, "_setConnectionState:", 0);
  -[WGWidgetHostingViewController _viewWillAppearSemaphore](self, "_viewWillAppearSemaphore");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[WGWidgetHostingViewController _viewWillAppearSemaphore](self, "_viewWillAppearSemaphore");
    v16 = objc_claimAutoreleasedReturnValue();
    dispatch_semaphore_signal(v16);

  }
  -[WGWidgetHostingViewController _setRemoteViewController:](self, "_setRemoteViewController:", 0);
  -[WGWidgetHostingViewController _setDidUpdate:](self, "_setDidUpdate:", 0);
  if ((objc_msgSend(v8, "isCurrentState:", 0) & 1) == 0)
  {
    v17 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      v18 = v17;
      -[WGWidgetHostingViewController widgetIdentifier](self, "widgetIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[WGWidgetHostingViewController _containerIdentifier](self, "_containerIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543874;
      v26 = v19;
      v27 = 2050;
      v28 = self;
      v29 = 2114;
      v30 = v20;
      _os_log_impl(&dword_2172E1000, v18, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Widget disconnected unexpectedly",
        (uint8_t *)&v25,
        0x20u);

    }
    -[WGWidgetHostingViewController _invalidateDisconnectionTimer](self, "_invalidateDisconnectionTimer");
    -[WGWidgetHostingViewController _abortActiveSequence](self, "_abortActiveSequence");
    if (-[UIViewController wg_isAppearingOrAppeared](self, "wg_isAppearingOrAppeared"))
      -[WGWidgetHostingViewController _attemptReconnectionAfterUnanticipatedDisconnection](self, "_attemptReconnectionAfterUnanticipatedDisconnection");
  }
  -[WGWidgetHostingViewController _extensionRequest](self, "_extensionRequest");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[WGWidgetHostingViewController _setExtensionRequest:](self, "_setExtensionRequest:", 0);
  if (v21)
  {
    -[WGWidgetHostingViewController widgetInfo](self, "widgetInfo");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "extension");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "cancelExtensionRequestWithIdentifier:", v21);
  }
  if (v10)
    v10[2](v10, self, v8);
  -[WGWidgetHostingViewController delegate](self, "delegate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v24, "remoteViewControllerDidDisconnectForWidget:", self);

}

- (void)_scheduleDisconnectionTimerForSequence:(id)a3 endTransitionBlock:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x24BDD17F0];
  v12 = a3;
  if ((objc_msgSend(v11, "isMainThread") & 1) == 0
    && (v13 = (void *)WGLogWidgets, os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_ERROR)))
  {
    -[WGWidgetHostingViewController _scheduleDisconnectionTimerForSequence:endTransitionBlock:completion:].cold.1(v13, self);
    if (v12)
      goto LABEL_4;
  }
  else if (v12)
  {
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WGWidgetHostingViewController.m"), 1924, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sequence"));

LABEL_4:
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithObjectsAndKeys:", v12, CFSTR("WGWidgetHostingViewControllerDisconnectionTimerSequenceKey"), 0);

  if (v9)
  {
    v15 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v14, "setObject:forKey:", v15, CFSTR("WGWidgetHostingViewControllerDisconnectionTimerEndTransitionBlockKey"));

  }
  if (v10)
  {
    v16 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v14, "setObject:forKey:", v16, CFSTR("WGWidgetHostingViewControllerDisconnectionTimerCompletionKey"));

  }
  objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__disconnectionTimerDidFire_, v14, 0, 1.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&self->_disconnectionTimer, v17);

}

- (void)_disconnectionTimerDidFire:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  WGWidgetHostingViewController *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    v5 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_ERROR))
      -[WGWidgetHostingViewController _disconnectionTimerDidFire:].cold.1(v5, self);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_disconnectionTimer);

  if (WeakRetained == v4)
  {
    v7 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      -[WGWidgetHostingViewController widgetIdentifier](self, "widgetIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[WGWidgetHostingViewController _containerIdentifier](self, "_containerIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v9;
      v19 = 2050;
      v20 = self;
      v21 = 2114;
      v22 = v10;
      _os_log_impl(&dword_2172E1000, v8, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Disconnection timer fired",
        (uint8_t *)&v17,
        0x20u);

    }
    v11 = objc_opt_class();
    objc_msgSend(v4, "userInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    WGSafeCast(v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "objectForKey:", CFSTR("WGWidgetHostingViewControllerDisconnectionTimerSequenceKey"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", CFSTR("WGWidgetHostingViewControllerDisconnectionTimerEndTransitionBlockKey"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", CFSTR("WGWidgetHostingViewControllerDisconnectionTimerCompletionKey"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[WGWidgetHostingViewController _enqueueDisconnectionRequestForSequence:endTransitionBlock:completion:](self, "_enqueueDisconnectionRequestForSequence:endTransitionBlock:completion:", v14, v15, v16);

  }
}

- (void)_invalidateDisconnectionTimer
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = OUTLINED_FUNCTION_5_0(a1);
  objc_msgSend(a2, "widgetIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_2172E1000, v3, v5, "%{public}@: Attempting to invalidate disconnection timer on non-main thread!", v6);

  OUTLINED_FUNCTION_3();
}

- (void)_attemptReconnectionAfterUnanticipatedDisconnection
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  WGWidgetHostingViewController *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    -[WGWidgetHostingViewController widgetIdentifier](self, "widgetIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WGWidgetHostingViewController _containerIdentifier](self, "_containerIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543874;
    v20 = v5;
    v21 = 2050;
    v22 = self;
    v23 = 2114;
    v24 = v6;
    _os_log_impl(&dword_2172E1000, v4, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Remote view controller disconnected unexpectedly",
      (uint8_t *)&v19,
      0x20u);

  }
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_lastUnanticipatedDisconnectionDate
    && (objc_msgSend(MEMORY[0x24BDBCE60], "date"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "timeIntervalSinceDate:", self->_lastUnanticipatedDisconnectionDate),
        v10 = v9,
        v8,
        v10 < 8.0))
  {
    v11 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      -[WGWidgetHostingViewController widgetIdentifier](self, "widgetIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[WGWidgetHostingViewController _containerIdentifier](self, "_containerIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138544130;
      v20 = v13;
      v21 = 2050;
      v22 = self;
      v23 = 2114;
      v24 = v14;
      v25 = 2050;
      v26 = 8;
      _os_log_impl(&dword_2172E1000, v12, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Two crashes within interval (%{public}ld) - we're done",
        (uint8_t *)&v19,
        0x2Au);

    }
    -[WGWidgetHostingViewController _setBlacklisted:](self, "_setBlacklisted:", 1);
    -[WGWidgetHostingViewController invalidateCachedSnapshotWithCompletionHandler:](self, "invalidateCachedSnapshotWithCompletionHandler:", 0);
    -[WGWidgetHostingViewController _setLargestAvailableDisplayMode:](self, "_setLargestAvailableDisplayMode:", -[WGWidgetInfo isLinkedOnOrAfterSystemVersion:](self->_widgetInfo, "isLinkedOnOrAfterSystemVersion:", CFSTR("10.0")) ^ 1);
    -[WGWidgetHostingViewController _insertBrokenView](self, "_insertBrokenView");
  }
  else
  {
    v15 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v15;
      -[WGWidgetHostingViewController widgetIdentifier](self, "widgetIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[WGWidgetHostingViewController _containerIdentifier](self, "_containerIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543874;
      v20 = v17;
      v21 = 2050;
      v22 = self;
      v23 = 2114;
      v24 = v18;
      _os_log_impl(&dword_2172E1000, v16, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Attempting to reconnect to remote view controller",
        (uint8_t *)&v19,
        0x20u);

    }
    -[WGWidgetHostingViewController _beginSequenceWithReason:completion:updateHandler:](self, "_beginSequenceWithReason:completion:updateHandler:", CFSTR("reconnection attempt"), 0, 0);
  }
  -[WGWidgetHostingViewController _setLastUnanticipatedDisconnectionDate:](self, "_setLastUnanticipatedDisconnectionDate:", v7);

}

- (void)_insertBrokenView
{
  void *v3;
  void *v4;
  _WGBrokenWidgetView *v5;
  void *v6;
  _WGBrokenWidgetView *v7;

  -[WGWidgetHostingViewController _brokenView](self, "_brokenView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = objc_alloc_init(_WGBrokenWidgetView);
  v7 = v5;

  -[WGWidgetHostingViewController _setBrokenView:](self, "_setBrokenView:", v7);
  -[WGWidgetHostingViewController _brokenView](self, "_brokenView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WGWidgetHostingViewController _insertContentProvidingSubview:sequence:completion:](self, "_insertContentProvidingSubview:sequence:completion:", v6, self->_activeLifeCycleSequence, &__block_literal_global_249);

}

void __50__WGWidgetHostingViewController__insertBrokenView__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "_brokenView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_contentProvidingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = v7;
  if (v2 == v3)
  {
    objc_msgSend(v7, "_brokenView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addTarget:action:", v7, sel_handleReconnectionRequest_);

    objc_msgSend(v7, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v6, "brokenViewDidAppearForWidget:", v7);

    v4 = v7;
  }

}

- (void)handleReconnectionRequest:(id)a3
{
  -[WGWidgetHostingViewController _setBlacklisted:](self, "_setBlacklisted:", 0);
  -[WGWidgetHostingViewController _beginSequenceWithReason:completion:updateHandler:](self, "_beginSequenceWithReason:completion:updateHandler:", CFSTR("reconnection attempt"), 0, 0);
}

- (CGSize)_maxSizeForDisplayMode:(int64_t)a3
{
  double v5;
  double v6;
  id WeakRetained;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  +[WGWidgetInfo maximumContentHeightForCompactDisplayMode](WGWidgetInfo, "maximumContentHeightForCompactDisplayMode");
  v6 = v5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    -[WGWidgetHostingViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "maxSizeForWidget:forDisplayMode:", self, a3);
    v10 = v9;
    v6 = v11;

  }
  else
  {
    v10 = 0.0;
  }

  v12 = v10;
  v13 = v6;
  result.height = v13;
  result.width = v12;
  return result;
}

- (UIEdgeInsets)_marginInsets
{
  id WeakRetained;
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
  UIEdgeInsets result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "marginInsetsForWidget:", self);
    v5 = v4;
    v7 = v6;
    v9 = v8;
  }
  else
  {
    v5 = *MEMORY[0x24BDF7718];
    v7 = *(double *)(MEMORY[0x24BDF7718] + 8);
    v9 = *(double *)(MEMORY[0x24BDF7718] + 24);
  }

  v10 = 39.0;
  v11 = v5;
  v12 = v7;
  v13 = v9;
  result.right = v13;
  result.bottom = v10;
  result.left = v12;
  result.top = v11;
  return result;
}

- (UIEdgeInsets)_layoutMargins
{
  id WeakRetained;
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

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "layoutMarginForWidget:", self);
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
  }
  else
  {
    v5 = *MEMORY[0x24BDE27F8];
    v7 = *(double *)(MEMORY[0x24BDE27F8] + 8);
    v9 = *(double *)(MEMORY[0x24BDE27F8] + 16);
    v11 = *(double *)(MEMORY[0x24BDE27F8] + 24);
  }

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

- (void)_layoutMarginsDidChange
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  UIEdgeInsets v9;
  UIEdgeInsets v10;

  -[WGWidgetHostingViewController _activeLifeCycleSequence](self, "_activeLifeCycleSequence");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCurrentState:", 4);

  if (v4)
  {
    -[WGWidgetHostingViewController _layoutMargins](self, "_layoutMargins");
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __56__WGWidgetHostingViewController__layoutMarginsDidChange__block_invoke;
    v8[3] = &__block_descriptor_64_e72_v28__0__WGWidgetHostingViewController_8__WGWidgetLifeCycleSequence_16B24l;
    v9 = v10;
    v5 = (void *)MEMORY[0x24BDD17C8];
    NSStringFromUIEdgeInsets(v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("Updating layout margins: '%@'"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WGWidgetHostingViewController _enqueueRemoteServiceRequest:withDescription:](self, "_enqueueRemoteServiceRequest:withDescription:", v8, v7);

  }
}

void __56__WGWidgetHostingViewController__layoutMarginsDidChange__block_invoke(double *a1, void *a2, uint64_t a3, int a4)
{
  id v5;

  if (a4)
  {
    objc_msgSend(a2, "_remoteViewController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_updateLayoutMargins:", a1[4], a1[5], a1[6], a1[7]);

  }
}

- (void)_updatePreferredContentSizeWithHeight:(double)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  WGWidgetHostingViewController *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    -[WGWidgetHostingViewController widgetIdentifier](self, "widgetIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WGWidgetHostingViewController _containerIdentifier](self, "_containerIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544130;
    v10 = v7;
    v11 = 2050;
    v12 = self;
    v13 = 2114;
    v14 = v8;
    v15 = 2050;
    v16 = (uint64_t)a3;
    _os_log_impl(&dword_2172E1000, v6, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Requested preferred height: %{public}ld",
      (uint8_t *)&v9,
      0x2Au);

  }
  -[WGWidgetHostingViewController preferredContentSize](self, "preferredContentSize");
  -[WGWidgetHostingViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (void)_setLargestAvailableDisplayMode:(int64_t)a3
{
  id WeakRetained;
  id v6;

  if (-[WGWidgetHostingViewController largestAvailableDisplayMode](self, "largestAvailableDisplayMode") != a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_host);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "widget:didChangeLargestAvailableDisplayMode:", self, a3);
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v6, "widget:didChangeLargestSupportedDisplayMode:", self, a3);

  }
  if (-[WGWidgetHostingViewController userSpecifiedDisplayMode](self, "userSpecifiedDisplayMode") >= a3)
    -[WGWidgetHostingViewController setActiveDisplayMode:](self, "setActiveDisplayMode:", a3);
}

- (void)_noteOutstandingUpdateRequestForSequence:(id)a3
{
  id v4;
  NSMutableDictionary *sequenceIDsToOutstandingWidgetUpdateCompletionHandlers;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  void *v8;
  void *v9;
  NSMutableDictionary *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v4 = a3;
  if (v4)
  {
    sequenceIDsToOutstandingWidgetUpdateCompletionHandlers = self->_sequenceIDsToOutstandingWidgetUpdateCompletionHandlers;
    if (!sequenceIDsToOutstandingWidgetUpdateCompletionHandlers)
    {
      v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      v7 = self->_sequenceIDsToOutstandingWidgetUpdateCompletionHandlers;
      self->_sequenceIDsToOutstandingWidgetUpdateCompletionHandlers = v6;

      sequenceIDsToOutstandingWidgetUpdateCompletionHandlers = self->_sequenceIDsToOutstandingWidgetUpdateCompletionHandlers;
    }
    objc_msgSend(v4, "sequenceIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](sequenceIDsToOutstandingWidgetUpdateCompletionHandlers, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 && os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEBUG))
      -[WGWidgetHostingViewController _noteOutstandingUpdateRequestForSequence:].cold.2();
    v10 = self->_sequenceIDsToOutstandingWidgetUpdateCompletionHandlers;
    objc_msgSend(v4, "sequenceIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", &__block_literal_global_10, v11);

  }
  else
  {
    v12 = WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEBUG))
      -[WGWidgetHostingViewController _noteOutstandingUpdateRequestForSequence:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);
  }

}

- (BOOL)_hasOutstandingUpdateRequestForSequence:(id)a3
{
  NSMutableDictionary *sequenceIDsToOutstandingWidgetUpdateCompletionHandlers;
  void *v4;
  void *v5;

  sequenceIDsToOutstandingWidgetUpdateCompletionHandlers = self->_sequenceIDsToOutstandingWidgetUpdateCompletionHandlers;
  objc_msgSend(a3, "sequenceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](sequenceIDsToOutstandingWidgetUpdateCompletionHandlers, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(sequenceIDsToOutstandingWidgetUpdateCompletionHandlers) = v5 == &__block_literal_global_10;

  return (char)sequenceIDsToOutstandingWidgetUpdateCompletionHandlers;
}

- (void)_registerUpdateRequestCompletionHandler:(id)a3 forSequence:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *sequenceIDsToOutstandingWidgetUpdateCompletionHandlers;
  NSMutableDictionary *v10;
  void *v11;
  void *v12;
  BOOL v13;
  NSMutableDictionary *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (!self->_sequenceIDsToOutstandingWidgetUpdateCompletionHandlers)
    {
      v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      sequenceIDsToOutstandingWidgetUpdateCompletionHandlers = self->_sequenceIDsToOutstandingWidgetUpdateCompletionHandlers;
      self->_sequenceIDsToOutstandingWidgetUpdateCompletionHandlers = v8;

    }
    v10 = self->_sequenceIDsToOutstandingWidgetUpdateCompletionHandlers;
    objc_msgSend(v7, "sequenceIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[NSMutableDictionary objectForKey:](v10, "objectForKey:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
        v13 = v12 == &__block_literal_global_10;
      else
        v13 = 1;
      if (!v13 && os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEBUG))
        -[WGWidgetHostingViewController _noteOutstandingUpdateRequestForSequence:].cold.2();
      v14 = self->_sequenceIDsToOutstandingWidgetUpdateCompletionHandlers;
      v15 = (void *)MEMORY[0x219A0A970](v6);
      objc_msgSend(v7, "sequenceIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v15, v16);

    }
    else
    {
      -[NSMutableDictionary removeObjectForKey:](v10, "removeObjectForKey:", v11);

    }
  }
  else
  {
    v17 = WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEBUG))
      -[WGWidgetHostingViewController _noteOutstandingUpdateRequestForSequence:].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);
  }

}

- (id)_updateRequestForSequence:(id)a3
{
  NSMutableDictionary *sequenceIDsToOutstandingWidgetUpdateCompletionHandlers;
  void *v4;
  void *v5;
  void *v6;

  if (a3)
  {
    sequenceIDsToOutstandingWidgetUpdateCompletionHandlers = self->_sequenceIDsToOutstandingWidgetUpdateCompletionHandlers;
    objc_msgSend(a3, "sequenceIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](sequenceIDsToOutstandingWidgetUpdateCompletionHandlers, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x219A0A970]();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)_setRemoteViewController:(id)a3
{
  _WGWidgetRemoteViewController *v5;
  _WGWidgetRemoteViewController **p_remoteViewController;
  _WGWidgetRemoteViewController *remoteViewController;
  _BOOL4 v8;
  void *v9;
  _WGWidgetRemoteViewController *v10;

  v5 = (_WGWidgetRemoteViewController *)a3;
  p_remoteViewController = &self->_remoteViewController;
  remoteViewController = self->_remoteViewController;
  v10 = v5;
  if (remoteViewController != v5)
  {
    -[_WGWidgetRemoteViewController willMoveToParentViewController:](remoteViewController, "willMoveToParentViewController:", 0);
    v8 = -[WGWidgetHostingViewController isRemoteViewVisible](self, "isRemoteViewVisible");
    -[WGWidgetHostingViewController _beginRemoteViewControllerAppearanceTransitionIfNecessary:semaphore:animated:completion:](self, "_beginRemoteViewControllerAppearanceTransitionIfNecessary:semaphore:animated:completion:", 0, 0, 0, 0);
    -[_WGWidgetRemoteViewController view](*p_remoteViewController, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeFromSuperview");

    if (v8)
      -[WGWidgetHostingViewController _setContentProvidingView:](self, "_setContentProvidingView:", 0);
    -[WGWidgetHostingViewController _endRemoteViewControllerAppearanceTransitionIfNecessary](self, "_endRemoteViewControllerAppearanceTransitionIfNecessary");
    -[_WGWidgetRemoteViewController removeFromParentViewController](*p_remoteViewController, "removeFromParentViewController");
    objc_storeStrong((id *)&self->_remoteViewController, a3);
    if (*p_remoteViewController)
    {
      -[WGWidgetHostingViewController addChildViewController:](self, "addChildViewController:");
      -[_UIRemoteViewController didMoveToParentViewController:](*p_remoteViewController, "didMoveToParentViewController:", self);
    }
  }

}

- (void)widget:(id)a3 didTerminateWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  void (**v13)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  WGWidgetHostingViewController *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    -[WGWidgetHostingViewController widgetIdentifier](self, "widgetIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WGWidgetHostingViewController _containerIdentifier](self, "_containerIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138544130;
    v16 = v10;
    v17 = 2050;
    v18 = self;
    v19 = 2114;
    v20 = v11;
    v21 = 2114;
    v22 = v7;
    _os_log_impl(&dword_2172E1000, v9, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Remote view controller did terminate with error: %{public}@",
      (uint8_t *)&v15,
      0x2Au);

  }
  -[WGWidgetHostingViewController _remoteViewController](self, "_remoteViewController");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12 == v6)
  {
    -[WGWidgetHostingViewController _remoteViewControllerDisconnectionHandler](self, "_remoteViewControllerDisconnectionHandler");
    v13 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      -[WGWidgetHostingViewController _setRemoteViewControllerDisconnectionHandler:](self, "_setRemoteViewControllerDisconnectionHandler:", 0);
      -[WGWidgetHostingViewController _activeLifeCycleSequence](self, "_activeLifeCycleSequence");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, WGWidgetHostingViewController *, void *, id))v13)[2](v13, self, v14, v7);
    }
    else
    {
      -[WGWidgetHostingViewController _activeLifeCycleSequence](self, "_activeLifeCycleSequence");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[WGWidgetHostingViewController _finishDisconnectingRemoteViewControllerForSequence:error:completion:](self, "_finishDisconnectingRemoteViewControllerForSequence:error:completion:", v14, v7, 0);
    }

  }
}

- (id)_cancelTouches
{
  return -[_UIRemoteViewController _cancelTouchesForCurrentEventInHostedContent](self->_remoteViewController, "_cancelTouchesForCurrentEventInHostedContent");
}

- (void)_rowHeightDidChange:(id)a3
{
  double v4;

  -[WGWidgetHostingViewController preferredContentSize](self, "preferredContentSize", a3);
  -[WGWidgetHostingViewController _updatePreferredContentSizeWithHeight:](self, "_updatePreferredContentSizeWithHeight:", v4);
}

- (NSString)_containerIdentifier
{
  void *v2;
  objc_class *v3;
  void *v4;

  -[WGWidgetHostingViewController parentViewController](self, "parentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (void)_invalidateVisibleFrame
{
  id WeakRetained;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[8];

  if (-[WGWidgetInfo wantsVisibleFrame](self->_widgetInfo, "wantsVisibleFrame")
    && -[UIViewController wg_isAppearingOrAppeared](self->_remoteViewController, "wg_isAppearingOrAppeared"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(WeakRetained, "visibleFrameForWidget:", self);
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __56__WGWidgetHostingViewController__invalidateVisibleFrame__block_invoke;
      v8[3] = &__block_descriptor_64_e72_v28__0__WGWidgetHostingViewController_8__WGWidgetLifeCycleSequence_16B24l;
      v8[4] = v4;
      v8[5] = v5;
      v8[6] = v6;
      v8[7] = v7;
      -[WGWidgetHostingViewController _enqueueRemoteServiceRequest:withDescription:](self, "_enqueueRemoteServiceRequest:withDescription:", v8, CFSTR("Requesting visible frame"));
    }

  }
}

void __56__WGWidgetHostingViewController__invalidateVisibleFrame__block_invoke(double *a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  objc_msgSend(v3, "_remoteViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __56__WGWidgetHostingViewController__invalidateVisibleFrame__block_invoke_2;
  v10[3] = &unk_24D732450;
  v11 = v3;
  v5 = a1[4];
  v6 = a1[5];
  v7 = a1[6];
  v8 = a1[7];
  v9 = v3;
  objc_msgSend(v4, "_updateVisibleFrame:withReplyHandler:", v10, v5, v6, v7, v8);

}

void __56__WGWidgetHostingViewController__invalidateVisibleFrame__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "widgetInfo");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setWantsVisibleFrame:", a2);

}

- (void)_insertLockedOutViewWithExplanation:(id)a3
{
  void *v4;
  void *v5;
  _WGLockedOutWidgetView *v6;
  _WGLockedOutWidgetView *v7;
  id v8;

  v8 = a3;
  -[WGWidgetHostingViewController _lockedOutView](self, "_lockedOutView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = v4;
  else
    v6 = -[_WGLockedOutWidgetView initWithExplanation:]([_WGLockedOutWidgetView alloc], "initWithExplanation:", v8);
  v7 = v6;

  -[WGWidgetHostingViewController _setLockedOutView:](self, "_setLockedOutView:", v7);
  -[WGWidgetHostingViewController _insertContentProvidingSubview:sequence:completion:](self, "_insertContentProvidingSubview:sequence:completion:", v7, self->_activeLifeCycleSequence, 0);

}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[WGWidgetHostingViewController widgetIdentifier](self, "widgetIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WGWidgetHostingViewController _remoteViewController](self, "_remoteViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WGWidgetHostingViewController _contentProvidingView](self, "_contentProvidingView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; widgetIdentifier = %@; _remoteViewController = %@; _contentProvidingView = %@>"),
    v4,
    self,
    v5,
    v6,
    v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (WGWidgetInfo)widgetInfo
{
  return self->_widgetInfo;
}

- (WGWidgetHostingViewControllerDelegate)delegate
{
  return (WGWidgetHostingViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (WGWidgetHostingViewControllerHost)host
{
  return (WGWidgetHostingViewControllerHost *)objc_loadWeakRetained((id *)&self->_host);
}

- (void)setHost:(id)a3
{
  objc_storeWeak((id *)&self->_host, a3);
}

- (int64_t)activeDisplayMode
{
  return self->_activeDisplayMode;
}

- (BOOL)implementsPerformUpdate
{
  return self->_implementsPerformUpdate;
}

- (BOOL)isLockedOut
{
  return self->_lockedOut;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (unint64_t)maskedCorners
{
  return self->_maskedCorners;
}

- (void)setMaskedCorners:(unint64_t)a3
{
  self->_maskedCorners = a3;
}

- (BOOL)disconnectsImmediately
{
  return self->_disconnectsImmediately;
}

- (void)setDisconnectsImmediately:(BOOL)a3
{
  self->_disconnectsImmediately = a3;
}

- (NSString)appBundleID
{
  return self->_appBundleID;
}

- (void)setAppBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1024);
}

- (WGWidgetLifeCycleSequence)_activeLifeCycleSequence
{
  return self->_activeLifeCycleSequence;
}

- (int64_t)_connectionState
{
  return self->_connectionState;
}

- (void)_setConnectionState:(int64_t)a3
{
  self->_connectionState = a3;
}

- (OS_dispatch_queue)_proxyConnectionQueue
{
  return self->_proxyConnectionQueue;
}

- (OS_dispatch_queue)_proxyRequestQueue
{
  return self->_proxyRequestQueue;
}

- (OS_dispatch_queue)_diskWriteQueue
{
  return self->_diskWriteQueue;
}

- (_WGWidgetRemoteViewController)_remoteViewController
{
  return self->_remoteViewController;
}

- (NSCopying)_extensionRequest
{
  return self->_extensionRequest;
}

- (void)_setExtensionRequest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1080);
}

- (UIView)_contentProvidingView
{
  return self->_contentProvidingView;
}

- (void)_setContentProvidingView:(id)a3
{
  objc_storeStrong((id *)&self->_contentProvidingView, a3);
}

- (_WGCAPackageView)_snapshotView
{
  return self->_snapshotView;
}

- (CGRect)_snapshotViewBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_snapshotViewBounds.origin.x;
  y = self->_snapshotViewBounds.origin.y;
  width = self->_snapshotViewBounds.size.width;
  height = self->_snapshotViewBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)_setSnapshotBounds:(CGRect)a3
{
  self->_snapshotViewBounds = a3;
}

- (BOOL)_isEncodingLayerTree
{
  return self->_encodingLayerTree;
}

- (void)_setEncodingLayerTree:(BOOL)a3
{
  self->_encodingLayerTree = a3;
}

- (BOOL)_didRequestViewInset
{
  return self->_didRequestViewInset;
}

- (void)_setDidRequestViewInset:(BOOL)a3
{
  self->_didRequestViewInset = a3;
}

- (NSTimer)_disconnectionTimer
{
  return (NSTimer *)objc_loadWeakRetained((id *)&self->_disconnectionTimer);
}

- (void)_setDisconnectionTimer:(id)a3
{
  objc_storeWeak((id *)&self->_disconnectionTimer, a3);
}

- (OS_dispatch_semaphore)_viewWillAppearSemaphore
{
  return self->_viewWillAppearSemaphore;
}

- (void)_setViewWillAppearSemaphore:(id)a3
{
  objc_storeStrong((id *)&self->_viewWillAppearSemaphore, a3);
}

- (OS_dispatch_semaphore)_viewWillDisappearSemaphore
{
  return self->_viewWillDisappearSemaphore;
}

- (void)_setViewWillDisappearSemaphore:(id)a3
{
  objc_storeStrong((id *)&self->_viewWillDisappearSemaphore, a3);
}

- (id)_remoteViewControllerConnectionHandler
{
  return self->_remoteViewControllerConnectionHandler;
}

- (void)_setRemoteViewControllerConnectionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1128);
}

- (id)_remoteViewControllerDisconnectionHandler
{
  return self->_remoteViewControllerDisconnectionHandler;
}

- (void)_setRemoteViewControllerDisconnectionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1136);
}

- (NSDate)_lastUnanticipatedDisconnectionDate
{
  return self->_lastUnanticipatedDisconnectionDate;
}

- (void)_setLastUnanticipatedDisconnectionDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastUnanticipatedDisconnectionDate, a3);
}

- (NSMapTable)_openAppearanceTransactions
{
  return self->_openAppearanceTransactions;
}

- (BOOL)_didUpdate
{
  return self->_didUpdate;
}

- (void)_setDidUpdate:(BOOL)a3
{
  self->_didUpdate = a3;
}

- (BOOL)_isBlacklisted
{
  return self->_blacklisted;
}

- (void)_setBlacklisted:(BOOL)a3
{
  self->_blacklisted = a3;
}

- (_WGBrokenWidgetView)_brokenView
{
  return self->_brokenView;
}

- (void)_setBrokenView:(id)a3
{
  objc_storeStrong((id *)&self->_brokenView, a3);
}

- (_WGLockedOutWidgetView)_lockedOutView
{
  return self->_lockedOutView;
}

- (void)_setLockedOutView:(id)a3
{
  objc_storeStrong((id *)&self->_lockedOutView, a3);
}

- (NSMutableDictionary)_sequenceIDsToOutstandingWidgetUpdateCompletionHandlers
{
  return self->_sequenceIDsToOutstandingWidgetUpdateCompletionHandlers;
}

- (void)_setSequenceIDsToOutstandingWidgetUpdateCompletionHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_sequenceIDsToOutstandingWidgetUpdateCompletionHandlers, a3);
}

- (BOOL)_isIgnoringParentAppearState
{
  return self->_ignoringParentAppearState;
}

- (void)_setIgnoringParentAppearState:(BOOL)a3
{
  self->_ignoringParentAppearState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sequenceIDsToOutstandingWidgetUpdateCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_lockedOutView, 0);
  objc_storeStrong((id *)&self->_brokenView, 0);
  objc_storeStrong((id *)&self->_openAppearanceTransactions, 0);
  objc_storeStrong((id *)&self->_lastUnanticipatedDisconnectionDate, 0);
  objc_storeStrong(&self->_remoteViewControllerDisconnectionHandler, 0);
  objc_storeStrong(&self->_remoteViewControllerConnectionHandler, 0);
  objc_storeStrong((id *)&self->_viewWillDisappearSemaphore, 0);
  objc_storeStrong((id *)&self->_viewWillAppearSemaphore, 0);
  objc_destroyWeak((id *)&self->_disconnectionTimer);
  objc_storeStrong((id *)&self->_snapshotView, 0);
  objc_storeStrong((id *)&self->_contentProvidingView, 0);
  objc_storeStrong((id *)&self->_extensionRequest, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong((id *)&self->_diskWriteQueue, 0);
  objc_storeStrong((id *)&self->_proxyRequestQueue, 0);
  objc_storeStrong((id *)&self->_proxyConnectionQueue, 0);
  objc_storeStrong((id *)&self->_activeLifeCycleSequence, 0);
  objc_storeStrong((id *)&self->_appBundleID, 0);
  objc_destroyWeak((id *)&self->_host);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_widgetInfo, 0);
}

+ (BOOL)_canWidgetHostConnectRemoteViewControllerByRequestingForSequence:(id)a3 disconnectionTimer:(id)a4 connectionState:(int64_t)a5
{
  id v9;
  id v10;
  BOOL v11;
  char v12;
  BOOL v13;
  void *v15;

  v9 = a3;
  v10 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WGWidgetHostingViewController.m"), 2177, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sequence"));

  }
  v11 = 1;
  if ((objc_msgSend(v9, "isCurrentStateNotYet:", 1) & 1) == 0)
  {
    v12 = objc_msgSend(v9, "isCurrentState:", 6);
    if (v10)
      v13 = 0;
    else
      v13 = v12;
    v11 = a5 == 1 || v13;
  }

  return v11;
}

+ (BOOL)_canWidgetHostConnectRemoteViewControllerByCancellingDisappearanceForSequence:(id)a3
{
  id v5;
  char v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WGWidgetHostingViewController.m"), 2182, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sequence"));

  }
  v6 = objc_msgSend(v5, "isCurrentStateAtLeast:", 5);

  return v6;
}

+ (BOOL)_canWidgetHostRequestRemoteViewControllerForSequence:(id)a3
{
  id v5;
  char v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WGWidgetHostingViewController.m"), 2187, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sequence"));

  }
  v6 = objc_msgSend(v5, "isCurrentState:", 1);

  return v6;
}

+ (BOOL)_canWidgetHostCaptureSnapshotForSequence:(id)a3
{
  id v5;
  char v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WGWidgetHostingViewController.m"), 2192, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sequence"));

  }
  v6 = objc_msgSend(v5, "isCurrentStateNotYet:", 5);

  return v6;
}

+ (BOOL)_canWidgetHostInsertRemoteViewForSequence:(id)a3
{
  id v5;
  char v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WGWidgetHostingViewController.m"), 2197, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sequence"));

  }
  if (objc_msgSend(v5, "isCurrentStateAtLeast:", 2))
    v6 = objc_msgSend(v5, "isCurrentStateNotYet:", 6);
  else
    v6 = 0;

  return v6;
}

+ (BOOL)_canWidgetHostEndSequenceByDisconnectingRemoteViewControllerForSequence:(id)a3
{
  id v5;
  char v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WGWidgetHostingViewController.m"), 2202, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sequence"));

  }
  if ((objc_msgSend(v5, "isCurrentState:", 0) & 1) != 0)
    v6 = 0;
  else
    v6 = objc_msgSend(v5, "isCurrentStateNotYet:", 6);

  return v6;
}

+ (BOOL)_canWidgetHostDisconnectRemoteViewControllerForSequence:(id)a3 disconnectionTimer:(id)a4 coalesce:(BOOL)a5
{
  id v9;
  id v10;
  char v11;
  BOOL v12;
  BOOL v13;
  void *v15;

  v9 = a3;
  v10 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WGWidgetHostingViewController.m"), 2207, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sequence"));

  }
  v11 = objc_msgSend(v9, "isCurrentStateNotYet:", 6);
  v12 = !a5;
  if (!v10)
    v12 = 0;
  v13 = (v11 & 1) != 0 || v12;

  return v13;
}

- (void)_connectRemoteViewControllerForReason:(void *)a1 sequence:completionHandler:.cold.1(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = OUTLINED_FUNCTION_5_0(a1);
  WGStringFromWidgetLifeCycleSequenceState(1uLL);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_1(&dword_2172E1000, v3, v4, "Encountered error transitioning to target state '%{public}@': %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3_1();
}

- (void)_connectRemoteViewControllerForReason:(void *)a1 sequence:completionHandler:.cold.2(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = OUTLINED_FUNCTION_5_0(a1);
  WGStringFromWidgetLifeCycleSequenceState(2uLL);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_1(&dword_2172E1000, v3, v4, "Encountered error transitioning to target state '%{public}@': %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3_1();
}

- (void)_requestRemoteViewControllerForSequence:completionHander:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6_0(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_2_1(&dword_2172E1000, v6, v4, "Encountered error transitioning to target state '%{public}@': %{public}@", v5);

  OUTLINED_FUNCTION_15();
}

void __90__WGWidgetHostingViewController__requestRemoteViewControllerForSequence_completionHander___block_invoke_113_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = CFSTR("widgetID");
  OUTLINED_FUNCTION_1_0(&dword_2172E1000, a1, a3, "Invalid parameter not satisfying: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

- (void)_captureSnapshotAndBeginDisappearanceTransitionForSequence:(void *)a1 completionHandler:.cold.1(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = OUTLINED_FUNCTION_5_0(a1);
  WGStringFromWidgetLifeCycleSequenceState(5uLL);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_1(&dword_2172E1000, v3, v4, "Encountered error transitioning to target state '%{public}@': %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3_1();
}

- (void)_insertContentProvidingSubview:(uint64_t)a3 sequence:(uint64_t)a4 completion:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_12(&dword_2172E1000, a1, a3, "Attempt to add too many content providing subviews", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

- (void)_requestInsertionOfRemoteViewAfterViewWillAppearForSequence:(void *)a1 completionHandler:.cold.1(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = OUTLINED_FUNCTION_5_0(a1);
  WGStringFromWidgetLifeCycleSequenceState(4uLL);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_1(&dword_2172E1000, v3, v4, "Encountered error transitioning to target state '%{public}@': %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3_1();
}

- (void)_requestInsertionOfRemoteViewAfterViewWillAppearForSequence:(void *)a1 completionHandler:.cold.2(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = OUTLINED_FUNCTION_5_0(a1);
  WGStringFromWidgetLifeCycleSequenceState(3uLL);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_1(&dword_2172E1000, v3, v4, "Encountered error transitioning to target state '%{public}@': %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3_1();
}

- (void)_disconnectRemoteViewControllerForReason:(uint64_t)a3 sequence:coalesce:completionHandler:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = CFSTR("!disconnectionTimer");
  OUTLINED_FUNCTION_1_0(&dword_2172E1000, a1, a3, "Invalid parameter not satisfying: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

- (void)_disconnectRemoteViewControllerForReason:(void *)a1 sequence:coalesce:completionHandler:.cold.2(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = OUTLINED_FUNCTION_5_0(a1);
  WGStringFromWidgetLifeCycleSequenceState(0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_1(&dword_2172E1000, v3, v4, "Encountered error transitioning to target state '%{public}@': %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3_1();
}

- (void)_disconnectRemoteViewControllerForReason:(void *)a1 sequence:coalesce:completionHandler:.cold.3(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = OUTLINED_FUNCTION_5_0(a1);
  WGStringFromWidgetLifeCycleSequenceState(6uLL);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_1(&dword_2172E1000, v3, v4, "Encountered error transitioning to target state '%{public}@': %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3_1();
}

- (void)_scheduleDisconnectionTimerForSequence:(void *)a1 endTransitionBlock:(void *)a2 completion:.cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = OUTLINED_FUNCTION_5_0(a1);
  objc_msgSend(a2, "widgetIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_2172E1000, v3, v5, "%{public}@: Attempting to schedule disconnection timer on non-main thread!", v6);

  OUTLINED_FUNCTION_3();
}

- (void)_disconnectionTimerDidFire:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = OUTLINED_FUNCTION_5_0(a1);
  objc_msgSend(a2, "widgetIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_2172E1000, v3, v5, "%{public}@: Timer fired on non-main thread!", v6);

  OUTLINED_FUNCTION_3();
}

- (void)_noteOutstandingUpdateRequestForSequence:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_3(&dword_2172E1000, a1, a3, "No sequence", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

- (void)_noteOutstandingUpdateRequestForSequence:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_2(&dword_2172E1000, v0, v1, "Overwriting existing update request completion handler for sequence %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
