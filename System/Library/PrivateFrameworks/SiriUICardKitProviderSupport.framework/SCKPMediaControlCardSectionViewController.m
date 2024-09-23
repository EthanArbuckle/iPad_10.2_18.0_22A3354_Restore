@implementation SCKPMediaControlCardSectionViewController

+ (void)initialize
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___SCKPMediaControlCardSectionViewController;
  objc_msgSendSuper2(&v2, sel_initialize);
  CRLogInitIfNeeded();
}

- (SCKPMediaControlCardSectionViewController)initWithMediaRemoteControlCardSection:(id)a3
{
  id v5;
  SCKPMediaControlCardSectionViewController *v6;
  SCKPMediaControlCardSectionViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SCKPMediaControlCardSectionViewController;
  v6 = -[SCKPMediaControlCardSectionViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_cardSection, a3);

  return v7;
}

- (void)loadView
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  SCKPMediaControlCardSectionView *v7;

  v7 = objc_alloc_init(SCKPMediaControlCardSectionView);
  -[SCKPMediaControlCardSectionViewController setView:](self, "setView:");
  -[SCKPMediaControlCardSectionViewController cardSection](self, "cardSection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "playbackRouteUniqueIdentifierIsEncrypted");

  -[SCKPMediaControlCardSectionViewController cardSection](self, "cardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "playbackRouteUniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    -[SCKPMediaControlCardSectionViewController _updatePlatterForHashedRouteUID:](self, "_updatePlatterForHashedRouteUID:", v6);
  else
    -[SCKPMediaControlCardSectionViewController _updatePlatterForRouteUID:](self, "_updatePlatterForRouteUID:", v6);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_updatePlatterForHashedRouteUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  AFSecurityConnection *v7;
  AFSecurityConnection *v8;
  AFSecurityConnection *assistantSecurityConnection;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v4 = a3;
  v5 = v4;
  if (!self->_assistantSecurityConnection)
  {
    v8 = (AFSecurityConnection *)objc_alloc_init(MEMORY[0x24BE09298]);
    assistantSecurityConnection = self->_assistantSecurityConnection;
    self->_assistantSecurityConnection = v8;

    if (v5)
      goto LABEL_3;
LABEL_5:
    -[SCKPMediaControlCardSectionViewController _updatePlatterForRouteUID:](self, "_updatePlatterForRouteUID:", 0);
    goto LABEL_6;
  }
  if (!v4)
    goto LABEL_5;
LABEL_3:
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v5, 0);
  objc_initWeak(&location, self);
  v7 = self->_assistantSecurityConnection;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __77__SCKPMediaControlCardSectionViewController__updatePlatterForHashedRouteUID___block_invoke;
  v10[3] = &unk_24E049018;
  v11 = v5;
  objc_copyWeak(&v12, &location);
  -[AFSecurityConnection processData:usingProcedure:completion:](v7, "processData:usingProcedure:completion:", v6, 2, v10);
  objc_destroyWeak(&v12);

  objc_destroyWeak(&location);
LABEL_6:

}

void __77__SCKPMediaControlCardSectionViewController__updatePlatterForHashedRouteUID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  os_log_t *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  id v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v5, 4);
    v8 = (os_log_t *)MEMORY[0x24BE15490];
    v9 = *MEMORY[0x24BE15490];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v29 = v10;
      v30 = 2112;
      v31 = v7;
      _os_log_impl(&dword_21C485000, v9, OS_LOG_TYPE_DEFAULT, "Decoded routeUID: %@ => %@", buf, 0x16u);
    }
    if (v7)
    {
      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = __77__SCKPMediaControlCardSectionViewController__updatePlatterForHashedRouteUID___block_invoke_7;
      v25[3] = &unk_24E048FF0;
      objc_copyWeak(&v27, (id *)(a1 + 40));
      v26 = v7;
      dispatch_async(MEMORY[0x24BDAC9B8], v25);

      objc_destroyWeak(&v27);
    }
    else
    {
      v18 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
        __77__SCKPMediaControlCardSectionViewController__updatePlatterForHashedRouteUID___block_invoke_cold_2((uint64_t)v5, v18, v19, v20, v21, v22, v23, v24);
    }

  }
  else
  {
    v11 = *MEMORY[0x24BE15490];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_ERROR))
      __77__SCKPMediaControlCardSectionViewController__updatePlatterForHashedRouteUID___block_invoke_cold_1((uint64_t)v6, v11, v12, v13, v14, v15, v16, v17);
  }

}

void __77__SCKPMediaControlCardSectionViewController__updatePlatterForHashedRouteUID___block_invoke_7(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_updatePlatterForRouteUID:", *(_QWORD *)(a1 + 32));

}

- (void)_updatePlatterForRouteUID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  UIViewController **p_mediaPlatterViewController;
  UIViewController *mediaPlatterViewController;
  UIViewController *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE15490];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v4;
    _os_log_impl(&dword_21C485000, v5, OS_LOG_TYPE_DEFAULT, "update platter for routeUID: %@", (uint8_t *)&v12, 0xCu);
  }
  -[SCKPMediaControlCardSectionViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  p_mediaPlatterViewController = &self->_mediaPlatterViewController;
  mediaPlatterViewController = self->_mediaPlatterViewController;
  if (mediaPlatterViewController)
  {
    -[UIViewController willMoveToParentViewController:](mediaPlatterViewController, "willMoveToParentViewController:", 0);
    objc_msgSend(v6, "setContentView:", 0);
    -[UIViewController removeFromParentViewController](*p_mediaPlatterViewController, "removeFromParentViewController");
    v9 = *p_mediaPlatterViewController;
    *p_mediaPlatterViewController = 0;

  }
  -[SCKPMediaControlCardSectionViewController _nowPlayingViewControllerWithRouteUID:](self, "_nowPlayingViewControllerWithRouteUID:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[SCKPMediaControlCardSectionViewController addChildViewController:](self, "addChildViewController:", v10);
    objc_msgSend(v10, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setContentView:", v11);

    objc_msgSend(v10, "didMoveToParentViewController:", self);
    objc_storeStrong((id *)&self->_mediaPlatterViewController, v10);
    -[SCKPMediaControlCardSectionViewController _updateActiveSystemEndpointForRouteUID:](self, "_updateActiveSystemEndpointForRouteUID:", v4);
  }

}

- (id)_nowPlayingViewControllerWithRouteUID:(id)a3
{
  id v4;
  objc_class *MRUNowPlayingViewControllerClass;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v4 = a3;
  if (_os_feature_enabled_impl())
  {
    MRUNowPlayingViewControllerClass = (objc_class *)getMRUNowPlayingViewControllerClass();
    if (MRUNowPlayingViewControllerClass)
    {
      v6 = (void *)objc_msgSend([MRUNowPlayingViewControllerClass alloc], "initWithRouteUID:", v4);
      v7 = objc_alloc((Class)getMRUVisualStylingProviderClass());
      -[SCKPMediaControlCardSectionViewController _nowPlayingVisualStylingProvider](self, "_nowPlayingVisualStylingProvider");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v7, "initWithVisualStylingProvider:", v8);
      objc_msgSend(v6, "setStylingProvider:", v9);

      objc_msgSend(v6, "setLayout:", 4);
      objc_msgSend(v6, "setContext:", 5);
      goto LABEL_11;
    }
    v10 = *MEMORY[0x24BE15490];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_ERROR))
      -[SCKPMediaControlCardSectionViewController _nowPlayingViewControllerWithRouteUID:].cold.2(v10, v11, v12, v13, v14, v15, v16, v17);
  }
  if (getMRPlatterViewControllerClass())
  {
    v6 = (void *)objc_msgSend(objc_alloc((Class)getMRPlatterViewControllerClass()), "initWithRouteUID:", v4);
    objc_msgSend(v6, "setStyle:", 4);
    objc_msgSend(v6, "setAllowsNowPlayingAppLaunch:", 1);
  }
  else
  {
    v18 = *MEMORY[0x24BE15490];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_ERROR))
      -[SCKPMediaControlCardSectionViewController _nowPlayingViewControllerWithRouteUID:].cold.1(v18, v19, v20, v21, v22, v23, v24, v25);
    v6 = 0;
  }
LABEL_11:

  return v6;
}

- (id)_nowPlayingVisualStylingProvider
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2050000000;
  v3 = (void *)getMTVisualStylingProviderClass_softClass;
  v12 = getMTVisualStylingProviderClass_softClass;
  if (!getMTVisualStylingProviderClass_softClass)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __getMTVisualStylingProviderClass_block_invoke;
    v8[3] = &unk_24E048F90;
    v8[4] = &v9;
    __getMTVisualStylingProviderClass_block_invoke((uint64_t)v8);
    v3 = (void *)v10[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v9, 8);
  -[SCKPMediaControlCardSectionViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_visualStylingProviderForRecipe:category:andUserInterfaceStyle:", 1, 1, objc_msgSend(v5, "userInterfaceStyle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  int v6;
  UIViewController *v7;
  id v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SCKPMediaControlCardSectionViewController;
  v4 = a3;
  -[SCKPMediaControlCardSectionViewController traitCollectionDidChange:](&v11, sel_traitCollectionDidChange_, v4);
  -[SCKPMediaControlCardSectionViewController traitCollection](self, "traitCollection", v11.receiver, v11.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "hasDifferentColorAppearanceComparedToTraitCollection:", v5);

  if (v6)
  {
    getMRUNowPlayingViewControllerClass();
    v7 = self->_mediaPlatterViewController;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = objc_alloc((Class)getMRUVisualStylingProviderClass());
      -[SCKPMediaControlCardSectionViewController _nowPlayingVisualStylingProvider](self, "_nowPlayingVisualStylingProvider");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v8, "initWithVisualStylingProvider:", v9);
      -[UIViewController setStylingProvider:](v7, "setStylingProvider:", v10);

    }
  }
}

- (void)_updateActiveSystemEndpointForRouteUID:(id)a3
{
  id v3;
  void *v4;
  _Unwind_Exception *v5;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v4 = getMRAVEndpointUpdateActiveSystemEndpointForOutputDeviceUIDWithReasonSymbolLoc_ptr;
  v10 = getMRAVEndpointUpdateActiveSystemEndpointForOutputDeviceUIDWithReasonSymbolLoc_ptr;
  if (!getMRAVEndpointUpdateActiveSystemEndpointForOutputDeviceUIDWithReasonSymbolLoc_ptr)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __getMRAVEndpointUpdateActiveSystemEndpointForOutputDeviceUIDWithReasonSymbolLoc_block_invoke;
    v6[3] = &unk_24E048F90;
    v6[4] = &v7;
    __getMRAVEndpointUpdateActiveSystemEndpointForOutputDeviceUIDWithReasonSymbolLoc_block_invoke((uint64_t)v6);
    v4 = (void *)v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v4)
  {
    v5 = (_Unwind_Exception *)-[SCKPMediaControlCardSectionViewController _updateActiveSystemEndpointForRouteUID:].cold.1();
    _Block_object_dispose(&v7, 8);
    _Unwind_Resume(v5);
  }
  ((void (*)(id, _QWORD, const __CFString *, _QWORD, void *))v4)(v3, 0, CFSTR("SCKPMediaControlCardSectionViewController"), 0, &__block_literal_global_1);

}

void __84__SCKPMediaControlCardSectionViewController__updateActiveSystemEndpointForRouteUID___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (a2)
  {
    v3 = *MEMORY[0x24BE15490];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_ERROR))
      __84__SCKPMediaControlCardSectionViewController__updateActiveSystemEndpointForRouteUID___block_invoke_cold_1(a2, v3, v4, v5, v6, v7, v8, v9);
  }
}

- (CRKCardSectionViewControllingDelegate)cardSectionViewControllingDelegate
{
  return (CRKCardSectionViewControllingDelegate *)objc_loadWeakRetained((id *)&self->cardSectionViewControllingDelegate);
}

- (void)setCardSectionViewControllingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->cardSectionViewControllingDelegate, a3);
}

- (SFMediaRemoteControlCardSection)cardSection
{
  return (SFMediaRemoteControlCardSection *)objc_getProperty(self, a2, 992, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardSection, 0);
  objc_destroyWeak((id *)&self->cardSectionViewControllingDelegate);
  objc_storeStrong((id *)&self->_mediaPlatterViewController, 0);
  objc_storeStrong((id *)&self->_assistantSecurityConnection, 0);
}

void __77__SCKPMediaControlCardSectionViewController__updatePlatterForHashedRouteUID___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21C485000, a2, a3, "Error decoding routeUID: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __77__SCKPMediaControlCardSectionViewController__updatePlatterForHashedRouteUID___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21C485000, a2, a3, "Error creating routeUID string from data: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_nowPlayingViewControllerWithRouteUID:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_21C485000, a1, a3, "MRPlatterViewControllerClass is unexpectedly Nil", a5, a6, a7, a8, 0);
}

- (void)_nowPlayingViewControllerWithRouteUID:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_21C485000, a1, a3, "MRUNowPlayingViewController is unexpectedly Nil", a5, a6, a7, a8, 0);
}

- (uint64_t)_updateActiveSystemEndpointForRouteUID:.cold.1()
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return __84__SCKPMediaControlCardSectionViewController__updateActiveSystemEndpointForRouteUID___block_invoke_cold_1(v0);
}

void __84__SCKPMediaControlCardSectionViewController__updateActiveSystemEndpointForRouteUID___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21C485000, a2, a3, "Could not update active system endpoint, error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
