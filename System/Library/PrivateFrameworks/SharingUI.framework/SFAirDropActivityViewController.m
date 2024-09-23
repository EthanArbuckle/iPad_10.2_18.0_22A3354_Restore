@implementation SFAirDropActivityViewController

- (SFAirDropActivityViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  SFAirDropActivityViewController *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSString *sendingAppBundleID;
  uint64_t v9;
  NSMutableDictionary *personToProgress;
  uint64_t v11;
  NSMutableDictionary *personToStoredTransferFinalState;
  uint64_t v13;
  NSMutableDictionary *personToSharedItemsRequestID;
  uint64_t v15;
  NSMutableDictionary *sharedItemsRequestIDToPreviewPhoto;
  NSMutableOrderedSet *v17;
  NSMutableOrderedSet *cachedSharedItems;
  NSOperationQueue *v19;
  NSOperationQueue *operationQueue;
  void *v21;
  void *v22;
  uint64_t v23;
  NSString *sessionID;
  uint64_t v25;
  NSMapTable *realNameToFirstSeenTimestamp;
  uint64_t v27;
  NSMutableDictionary *sharedItemsMap;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)SFAirDropActivityViewController;
  v4 = -[SFAirDropActivityViewController initWithNibName:bundle:](&v30, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    SFLocalizedStringForKey();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAirDropActivityViewController setTitle:](v4, "setTitle:", v5);

    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();
    sendingAppBundleID = v4->_sendingAppBundleID;
    v4->_sendingAppBundleID = (NSString *)v7;

    v4->_attachmentCount = 0;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    personToProgress = v4->_personToProgress;
    v4->_personToProgress = (NSMutableDictionary *)v9;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    personToStoredTransferFinalState = v4->_personToStoredTransferFinalState;
    v4->_personToStoredTransferFinalState = (NSMutableDictionary *)v11;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    personToSharedItemsRequestID = v4->_personToSharedItemsRequestID;
    v4->_personToSharedItemsRequestID = (NSMutableDictionary *)v13;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v15 = objc_claimAutoreleasedReturnValue();
    sharedItemsRequestIDToPreviewPhoto = v4->_sharedItemsRequestIDToPreviewPhoto;
    v4->_sharedItemsRequestIDToPreviewPhoto = (NSMutableDictionary *)v15;

    v17 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x24BDBCEE0]);
    cachedSharedItems = v4->_cachedSharedItems;
    v4->_cachedSharedItems = v17;

    v19 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    operationQueue = v4->_operationQueue;
    v4->_operationQueue = v19;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v4->_operationQueue, "setMaxConcurrentOperationCount:", 1);
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "UUIDString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "substringWithRange:", 24, 12);
    v23 = objc_claimAutoreleasedReturnValue();
    sessionID = v4->_sessionID;
    v4->_sessionID = (NSString *)v23;

    v4->_sharedItemsAvailable = 1;
    v4->_logger = 0;
    objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
    v25 = objc_claimAutoreleasedReturnValue();
    realNameToFirstSeenTimestamp = v4->_realNameToFirstSeenTimestamp;
    v4->_realNameToFirstSeenTimestamp = (NSMapTable *)v25;

    v4->_sharedItemsCount = 0;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v27 = objc_claimAutoreleasedReturnValue();
    sharedItemsMap = v4->_sharedItemsMap;
    v4->_sharedItemsMap = (NSMutableDictionary *)v27;

  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[SFAirDropActivityViewController invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SFAirDropActivityViewController;
  -[SFAirDropActivityViewController dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[UICollectionView visibleCells](self->_collectionView, "visibleCells", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "setDelegate:", 0);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[UICollectionView setDataSource:](self->_collectionView, "setDataSource:", 0);
  -[UICollectionView setDelegate:](self->_collectionView, "setDelegate:", 0);
  -[SFWirelessSettingsController setDelegate:](self->_wirelessSettings, "setDelegate:", 0);
  -[SFWirelessSettingsController invalidate](self->_wirelessSettings, "invalidate");
  -[SFAirDropBrowser setDelegate:](self->_browser, "setDelegate:", 0);
  -[SFAirDropBrowser stop](self->_browser, "stop");
  if (self->_logger)
  {
    SFOperationCancel();
    CFRelease(self->_logger);
    self->_logger = 0;
  }
}

- (void)startBrowsing
{
  SFAirDropBrowser *v3;
  SFAirDropBrowser *browser;
  SFWirelessSettingsController *v5;
  SFWirelessSettingsController *wirelessSettings;

  if (!self->_browserPaused)
  {
    if (self->_browser)
    {
      if (!-[SFAirDropActivityViewController manuallyManageBrowsing](self, "manuallyManageBrowsing"))
        -[SFAirDropActivityViewController stopBrowsing](self, "stopBrowsing");
    }
    -[SFAirDropActivityViewController _startTelemetry](self, "_startTelemetry");
    -[SFAirDropActivityViewController subscribeToProgresses](self, "subscribeToProgresses");
    v3 = (SFAirDropBrowser *)objc_alloc_init(MEMORY[0x24BE900A8]);
    browser = self->_browser;
    self->_browser = v3;

    -[SFAirDropBrowser setSessionID:](self->_browser, "setSessionID:", self->_sessionID);
    -[SFAirDropBrowser setBatchDelegate:](self->_browser, "setBatchDelegate:", self);
    -[SFAirDropBrowser setSendingAppBundleID:](self->_browser, "setSendingAppBundleID:", self->_sendingAppBundleID);
    -[SFAirDropBrowser setUrlsBeingShared:](self->_browser, "setUrlsBeingShared:", self->_urlsBeingShared);
    -[SFAirDropBrowser setPhotosAssetIDs:](self->_browser, "setPhotosAssetIDs:", self->_photosAssetIDs);
    -[SFAirDropBrowser start](self->_browser, "start");
    v5 = (SFWirelessSettingsController *)objc_alloc_init(MEMORY[0x24BE901E0]);
    wirelessSettings = self->_wirelessSettings;
    self->_wirelessSettings = v5;

    -[SFWirelessSettingsController setDelegate:](self->_wirelessSettings, "setDelegate:", self);
  }
}

- (void)stopBrowsing
{
  SFWirelessSettingsController *wirelessSettings;
  NSUInteger v4;
  SFAirDropBrowser *browser;
  NSArray *people;
  UICollectionView *collectionView;
  _QWORD v8[6];

  self->_browserPaused = 0;
  -[SFAirDropActivityViewController unsubscribeToProgresses](self, "unsubscribeToProgresses");
  -[SFWirelessSettingsController setDelegate:](self->_wirelessSettings, "setDelegate:", 0);
  -[SFWirelessSettingsController invalidate](self->_wirelessSettings, "invalidate");
  wirelessSettings = self->_wirelessSettings;
  self->_wirelessSettings = 0;

  v4 = -[NSArray count](self->_people, "count");
  -[SFAirDropBrowser stop](self->_browser, "stop");
  -[SFAirDropBrowser setDelegate:](self->_browser, "setDelegate:", 0);
  browser = self->_browser;
  self->_browser = 0;

  people = self->_people;
  self->_people = 0;

  collectionView = self->_collectionView;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __47__SFAirDropActivityViewController_stopBrowsing__block_invoke;
  v8[3] = &unk_24CE0ED10;
  v8[4] = self;
  v8[5] = v4;
  -[UICollectionView performBatchUpdates:completion:](collectionView, "performBatchUpdates:completion:", v8, 0);
  -[SFAirDropActivityViewController _stopTelemetry](self, "_stopTelemetry");
}

void __47__SFAirDropActivityViewController_stopBrowsing__block_invoke(uint64_t a1)
{
  unint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 40))
  {
    v2 = 0;
    do
    {
      v3 = *(void **)(*(_QWORD *)(a1 + 32) + 1168);
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", v2, 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v6[0] = v4;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "deleteItemsAtIndexPaths:", v5);

      ++v2;
    }
    while (*(_QWORD *)(a1 + 40) > v2);
  }
}

- (void)_setIsLoadingActivityItemProviders:(BOOL)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (!self->_didSelectNode && self->_browserPaused != a3)
  {
    if (a3)
    {
      self->_browserPaused = 1;
      -[SFAirDropBrowser pause](self->_browser, "pause");
      if (!-[SFAirDropActivityViewController isDebugMode](self, "isDebugMode"))
        return;
      objc_msgSend(MEMORY[0x24BEBD4B8], "redColor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      self->_browserPaused = 0;
      -[SFAirDropBrowser resume](self->_browser, "resume");
      if (!-[SFAirDropActivityViewController isDebugMode](self, "isDebugMode"))
        return;
      objc_msgSend(MEMORY[0x24BEBD4B8], "greenColor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v5 = objc_retainAutorelease(v4);
    v6 = objc_msgSend(v5, "CGColor");
    -[SFAirDropActivityViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBorderColor:", v6);

    -[SFAirDropActivityViewController view](self, "view");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBorderWidth:", 5.0);

  }
}

- (void)didEnterBackground:(id)a3
{
  if (!-[SFAirDropActivityViewController manuallyManageBrowsing](self, "manuallyManageBrowsing", a3))
    -[SFAirDropActivityViewController stopBrowsing](self, "stopBrowsing");
}

- (void)willEnterForeground:(id)a3
{
  if (!-[SFAirDropActivityViewController manuallyManageBrowsing](self, "manuallyManageBrowsing", a3))
    -[SFAirDropActivityViewController startBrowsing](self, "startBrowsing");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  UILabel *titleLabel;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SFAirDropActivityViewController;
  -[SFAirDropActivityViewController viewWillAppear:](&v9, sel_viewWillAppear_, a3);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_didEnterBackground_, *MEMORY[0x24BEBDF98], 0);
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_willEnterForeground_, *MEMORY[0x24BEBE008], 0);
  if (!self->_browser && !-[SFAirDropActivityViewController manuallyManageBrowsing](self, "manuallyManageBrowsing"))
    -[SFAirDropActivityViewController startBrowsing](self, "startBrowsing");
  -[SFAirDropActivityViewController updateContentAreaAnimated:](self, "updateContentAreaAnimated:", 0);
  titleLabel = self->_titleLabel;
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", dbl_2127A2AE0[!self->_darkStyleOnLegacyApp], 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setColor:](titleLabel, "setColor:", v6);

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", dbl_2127A2AF0[!self->_darkStyleOnLegacyApp], 1.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setTextColor:](self->_noWifiTextView, "setTextColor:", v7);
  -[UITextView setTextColor:](self->_instructionsTextView, "setTextColor:", v7);
  -[UITextView setTextColor:](self->_noAWDLTextView, "setTextColor:", v7);
  -[SFAirDropActivityViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNeedsLayout");

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x24BEBDF98], 0);
  objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x24BEBE008], 0);
  -[NSOperationQueue cancelAllOperations](self->_operationQueue, "cancelAllOperations");
  if (!-[SFAirDropActivityViewController manuallyManageBrowsing](self, "manuallyManageBrowsing"))
    -[SFAirDropActivityViewController stopBrowsing](self, "stopBrowsing");
  v6.receiver = self;
  v6.super_class = (Class)SFAirDropActivityViewController;
  -[SFAirDropActivityViewController viewDidDisappear:](&v6, sel_viewDidDisappear_, v3);

}

- (id)wifiBtHelpTextLocalizedStringKey
{
  if (-[SFWirelessSettingsController deviceSupportsWAPI](self->_wirelessSettings, "deviceSupportsWAPI"))
    return CFSTR("SENDER_WLAN_BLUETOOTH_HELP_TEXT");
  else
    return CFSTR("SENDER_WIFI_BLUETOOTH_HELP_TEXT");
}

- (id)noWiFiBTText
{
  NSString *overriddenNoWiFIBTText;
  NSString *v3;
  void *v4;

  overriddenNoWiFIBTText = self->_overriddenNoWiFIBTText;
  if (overriddenNoWiFIBTText)
  {
    v3 = overriddenNoWiFIBTText;
  }
  else
  {
    -[SFAirDropActivityViewController wifiBtHelpTextLocalizedStringKey](self, "wifiBtHelpTextLocalizedStringKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    SFLocalizedStringForKey();
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)noAWDLText
{
  NSString *overriddenNoAWDLText;

  overriddenNoAWDLText = self->_overriddenNoAWDLText;
  if (overriddenNoAWDLText)
    return overriddenNoAWDLText;
  -[SFWirelessSettingsController isWirelessCarPlayEnabled](self->_wirelessSettings, "isWirelessCarPlayEnabled");
  SFLocalizedStringForKey();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)instructionsText
{
  NSString *overriddenInstructionsText;

  overriddenInstructionsText = self->_overriddenInstructionsText;
  if (overriddenInstructionsText)
    return overriddenInstructionsText;
  SFLocalizedStringForKey();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)titleText
{
  NSString *overriddenTitleText;

  overriddenTitleText = self->_overriddenTitleText;
  if (overriddenTitleText)
    return overriddenTitleText;
  SFLocalizedStringForKey();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)viewDidLoad
{
  void *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  UILabel *v9;
  UILabel *titleLabel;
  void *v11;
  void *v12;
  SFCollectionViewLayout *v13;
  SFCollectionViewLayout *collectionViewLayout;
  UICollectionView *v15;
  UICollectionView *collectionView;
  void *v17;
  SFAirDropIconView *v18;
  SFAirDropIconView *airDropIconView;
  UITextView *v20;
  UITextView *noWifiTextView;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  SFAirDropActiveIconView *v33;
  SFAirDropActiveIconView *airDropActiveIconView;
  void *v35;
  UITextView *v36;
  UITextView *instructionsTextView;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  SFAirDropActiveIconView *v42;
  SFAirDropActiveIconView *airDropInactiveIconView;
  UITextView *v44;
  UITextView *noAWDLTextView;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  UIButton *v53;
  UIButton *showMoreButton;
  UIButton *v55;
  void *v56;
  UIButton *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  objc_super v70;

  v70.receiver = self;
  v70.super_class = (Class)SFAirDropActivityViewController;
  -[SFAirDropActivityViewController viewDidLoad](&v70, sel_viewDidLoad);
  if (!-[SFAirDropActivityViewController manuallyManageBrowsing](self, "manuallyManageBrowsing"))
    -[SFAirDropActivityViewController startBrowsing](self, "startBrowsing");
  -[SFAirDropActivityViewController view](self, "view");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "setBackgroundColor:", v3);

  objc_msgSend(v69, "setOpaque:", 0);
  v4 = objc_alloc(MEMORY[0x24BEBD708]);
  v5 = *MEMORY[0x24BDBF090];
  v6 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v7 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v8 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v9 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], v6, v7, v8);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v9;

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setBackgroundColor:](self->_titleLabel, "setBackgroundColor:", v11);

  -[SFAirDropActivityViewController titleText](self, "titleText");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_titleLabel, "setText:", v12);

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setAlpha:](self->_titleLabel, "setAlpha:", 1.0);
  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 2);
  -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
  v13 = objc_alloc_init(SFCollectionViewLayout);
  collectionViewLayout = self->_collectionViewLayout;
  self->_collectionViewLayout = v13;

  v15 = (UICollectionView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD450]), "initWithFrame:collectionViewLayout:", self->_collectionViewLayout, v5, v6, v7, v8);
  collectionView = self->_collectionView;
  self->_collectionView = v15;

  -[UICollectionView setClipsToBounds:](self->_collectionView, "setClipsToBounds:", 0);
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView setBackgroundColor:](self->_collectionView, "setBackgroundColor:", v17);

  -[UICollectionView setShowsHorizontalScrollIndicator:](self->_collectionView, "setShowsHorizontalScrollIndicator:", 0);
  -[UICollectionView setShowsVerticalScrollIndicator:](self->_collectionView, "setShowsVerticalScrollIndicator:", 0);
  -[UICollectionView setAlwaysBounceHorizontal:](self->_collectionView, "setAlwaysBounceHorizontal:", 1);
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](self->_collectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("PersonCellID"));
  -[UICollectionView setAllowsMultipleSelection:](self->_collectionView, "setAllowsMultipleSelection:", 1);
  -[UICollectionView setDataSource:](self->_collectionView, "setDataSource:", self);
  -[UICollectionView setDelegate:](self->_collectionView, "setDelegate:", self);
  -[UICollectionView setTranslatesAutoresizingMaskIntoConstraints:](self->_collectionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v18 = -[SFAirDropIconView initWithFrame:]([SFAirDropIconView alloc], "initWithFrame:", v5, v6, v7, v8);
  airDropIconView = self->_airDropIconView;
  self->_airDropIconView = v18;

  -[SFAirDropIconView addTarget:action:forControlEvents:](self->_airDropIconView, "addTarget:action:forControlEvents:", self, sel_enableAirDropRequiredFeatures, 64);
  -[SFAirDropIconView setAlpha:](self->_airDropIconView, "setAlpha:", 0.0);
  -[SFAirDropIconView setTranslatesAutoresizingMaskIntoConstraints:](self->_airDropIconView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v68 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", self, sel_enableAirDropRequiredFeatures);
  objc_msgSend(v68, "setNumberOfTapsRequired:", 1);
  v20 = (UITextView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA88]), "initReadonlyAndUnselectableWithFrame:textContainer:", 0, v5, v6, v7, v8);
  noWifiTextView = self->_noWifiTextView;
  self->_noWifiTextView = v20;

  -[UITextView setScrollingEnabled:](self->_noWifiTextView, "setScrollingEnabled:", 0);
  -[UITextView textContainer](self->_noWifiTextView, "textContainer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setLineFragmentPadding:", 0.0);

  -[UITextView textContainer](self->_noWifiTextView, "textContainer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setMaximumNumberOfLines:", 0);

  -[UITextView textContainer](self->_noWifiTextView, "textContainer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setLineBreakMode:", 4);

  v25 = *MEMORY[0x24BEBE158];
  v26 = *(double *)(MEMORY[0x24BEBE158] + 8);
  v27 = *(double *)(MEMORY[0x24BEBE158] + 16);
  v28 = *(double *)(MEMORY[0x24BEBE158] + 24);
  -[UITextView setTextContainerInset:](self->_noWifiTextView, "setTextContainerInset:", *MEMORY[0x24BEBE158], v26, v27, v28);
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setBackgroundColor:](self->_noWifiTextView, "setBackgroundColor:", v29);

  -[UITextView setAlpha:](self->_noWifiTextView, "setAlpha:", 0.0);
  -[UITextView setTextAlignment:](self->_noWifiTextView, "setTextAlignment:", 4);
  -[SFAirDropActivityViewController title](self, "title");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAirDropActivityViewController noWiFiBTText](self, "noWiFiBTText");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAirDropActivityViewController attributedStringWithTitle:content:](self, "attributedStringWithTitle:content:", v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setAttributedText:](self->_noWifiTextView, "setAttributedText:", v32);

  -[UITextView addGestureRecognizer:](self->_noWifiTextView, "addGestureRecognizer:", v68);
  -[UITextView setUserInteractionEnabled:](self->_noWifiTextView, "setUserInteractionEnabled:", 1);
  -[UITextView setTranslatesAutoresizingMaskIntoConstraints:](self->_noWifiTextView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v33 = -[SFAirDropActiveIconView initWithFrame:grayscale:]([SFAirDropActiveIconView alloc], "initWithFrame:grayscale:", 0, v5, v6, v7, v8);
  airDropActiveIconView = self->_airDropActiveIconView;
  self->_airDropActiveIconView = v33;

  -[SFAirDropActiveIconView setAlpha:](self->_airDropActiveIconView, "setAlpha:", 0.0);
  -[SFAirDropActiveIconView setTranslatesAutoresizingMaskIntoConstraints:](self->_airDropActiveIconView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAirDropActiveIconView setBackgroundColor:](self->_airDropActiveIconView, "setBackgroundColor:", v35);

  v36 = (UITextView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA88]), "initReadonlyAndUnselectableWithFrame:textContainer:", 0, v5, v6, v7, v8);
  instructionsTextView = self->_instructionsTextView;
  self->_instructionsTextView = v36;

  -[UITextView setScrollingEnabled:](self->_instructionsTextView, "setScrollingEnabled:", 0);
  -[UITextView textContainer](self->_instructionsTextView, "textContainer");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setLineFragmentPadding:", 0.0);

  -[UITextView setTextContainerInset:](self->_instructionsTextView, "setTextContainerInset:", v25, v26, v27, v28);
  -[UITextView textContainer](self->_instructionsTextView, "textContainer");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setMaximumNumberOfLines:", 0);

  -[UITextView textContainer](self->_instructionsTextView, "textContainer");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setLineBreakMode:", 4);

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setBackgroundColor:](self->_instructionsTextView, "setBackgroundColor:", v41);

  -[UITextView setAlpha:](self->_instructionsTextView, "setAlpha:", 0.0);
  -[UITextView setTranslatesAutoresizingMaskIntoConstraints:](self->_instructionsTextView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v42 = -[SFAirDropActiveIconView initWithFrame:grayscale:]([SFAirDropActiveIconView alloc], "initWithFrame:grayscale:", 1, v5, v6, v7, v8);
  airDropInactiveIconView = self->_airDropInactiveIconView;
  self->_airDropInactiveIconView = v42;

  -[SFAirDropActiveIconView setAlpha:](self->_airDropInactiveIconView, "setAlpha:", 0.0);
  -[SFAirDropActiveIconView setTranslatesAutoresizingMaskIntoConstraints:](self->_airDropInactiveIconView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v44 = (UITextView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA88]), "initReadonlyAndUnselectableWithFrame:textContainer:", 0, v5, v6, v7, v8);
  noAWDLTextView = self->_noAWDLTextView;
  self->_noAWDLTextView = v44;

  -[UITextView setScrollingEnabled:](self->_noAWDLTextView, "setScrollingEnabled:", 0);
  -[UITextView textContainer](self->_noAWDLTextView, "textContainer");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setLineFragmentPadding:", 0.0);

  -[UITextView setTextContainerInset:](self->_noAWDLTextView, "setTextContainerInset:", v25, v26, v27, v28);
  -[UITextView textContainer](self->_noAWDLTextView, "textContainer");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setMaximumNumberOfLines:", 0);

  -[UITextView textContainer](self->_noAWDLTextView, "textContainer");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setLineBreakMode:", 4);

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setBackgroundColor:](self->_noAWDLTextView, "setBackgroundColor:", v49);

  -[UITextView setAlpha:](self->_noAWDLTextView, "setAlpha:", 0.0);
  -[UITextView setTextAlignment:](self->_noAWDLTextView, "setTextAlignment:", 4);
  -[SFAirDropActivityViewController title](self, "title");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAirDropActivityViewController noAWDLText](self, "noAWDLText");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAirDropActivityViewController attributedStringWithTitle:content:](self, "attributedStringWithTitle:content:", v50, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setAttributedText:](self->_noAWDLTextView, "setAttributedText:", v52);

  -[UITextView setTranslatesAutoresizingMaskIntoConstraints:](self->_noAWDLTextView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v53 = (UIButton *)objc_alloc_init(MEMORY[0x24BEBD430]);
  showMoreButton = self->_showMoreButton;
  self->_showMoreButton = v53;

  -[UIButton setAlpha:](self->_showMoreButton, "setAlpha:", 0.0);
  v55 = self->_showMoreButton;
  SFLocalizedStringForKey();
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTitle:forState:](v55, "setTitle:forState:", v56, 0);

  v57 = self->_showMoreButton;
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTitleColor:forState:](v57, "setTitleColor:forState:", v58, 0);

  -[UIButton addTarget:action:forEvents:](self->_showMoreButton, "addTarget:action:forEvents:", self, sel_showMore_, 64);
  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_showMoreButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIButton setContentEdgeInsets:](self->_showMoreButton, "setContentEdgeInsets:", 0.0, 1.0, 0.0, 1.0);
  v59 = (void *)MEMORY[0x24BEBB520];
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "_scaledValueForValue:", 11.0);
  objc_msgSend(v59, "systemFontOfSize:");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_titleLabel, "setFont:", v61);

  -[UITextView setTextAlignment:](self->_instructionsTextView, "setTextAlignment:", 4);
  -[SFAirDropActivityViewController title](self, "title");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAirDropActivityViewController instructionsText](self, "instructionsText");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAirDropActivityViewController attributedStringWithTitle:content:](self, "attributedStringWithTitle:content:", v62, v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setAttributedText:](self->_instructionsTextView, "setAttributedText:", v64);

  objc_msgSend(v69, "addSubview:", self->_collectionView);
  objc_msgSend(v69, "addSubview:", self->_titleLabel);
  objc_msgSend(v69, "addSubview:", self->_airDropIconView);
  objc_msgSend(v69, "addSubview:", self->_noWifiTextView);
  objc_msgSend(v69, "addSubview:", self->_airDropActiveIconView);
  objc_msgSend(v69, "addSubview:", self->_instructionsTextView);
  objc_msgSend(v69, "addSubview:", self->_airDropInactiveIconView);
  objc_msgSend(v69, "addSubview:", self->_noAWDLTextView);
  objc_msgSend(v69, "addSubview:", self->_showMoreButton);
  v65 = (void *)MEMORY[0x24BDD1628];
  _NSDictionaryOfVariableBindings(CFSTR("_collectionView"), self->_collectionView, 0);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[_collectionView]|"), 0, 0, v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v69, "addConstraints:", v67);
  -[SFAirDropActivityViewController _createiOSLayoutConstraints](self, "_createiOSLayoutConstraints");
  -[SFAirDropActivityViewController _updateFontSizes](self, "_updateFontSizes");

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  NSString *v5;
  void *v6;
  NSString *v7;
  NSComparisonResult v8;
  CGFloat Width;
  double v10;
  void *v11;
  NSString *v12;
  BOOL IsAccessibilityCategory;
  NSComparisonResult v14;
  SFCollectionViewLayout *v15;
  void *v16;
  double v17;
  double v18;
  double titleLabelTopConstraintDefaultConstant;
  char v20;
  SFCollectionViewLayout *collectionViewLayout;
  void *v22;
  double v23;
  objc_super v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  v24.receiver = self;
  v24.super_class = (Class)SFAirDropActivityViewController;
  -[SFAirDropActivityViewController viewDidLayoutSubviews](&v24, sel_viewDidLayoutSubviews);
  -[SFAirDropActivityViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v4))
  {

    v5 = (NSString *)*MEMORY[0x24BEBE098];
LABEL_4:
    -[SFAirDropActivityViewController _updateExclusionPathsForTextViews](self, "_updateExclusionPathsForTextViews");
    goto LABEL_5;
  }
  v5 = (NSString *)*MEMORY[0x24BEBE098];
  -[SFAirDropActivityViewController traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredContentSizeCategory");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  v8 = UIContentSizeCategoryCompareToCategory(v5, v7);

  if (v8 == NSOrderedAscending)
    goto LABEL_4;
LABEL_5:
  -[SFAirDropActiveIconView bounds](self->_airDropActiveIconView, "bounds");
  Width = CGRectGetWidth(v25);
  v10 = SFRoundToScreen(Width * 0.5);
  -[SFAirDropActivityViewController traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "preferredContentSizeCategory");
  v12 = (NSString *)objc_claimAutoreleasedReturnValue();

  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v12);
  v14 = UIContentSizeCategoryCompareToCategory(v5, v12);
  if (IsAccessibilityCategory || v14 == NSOrderedAscending)
  {
    v20 = v14 != NSOrderedAscending || IsAccessibilityCategory;
    v18 = 16.0;
    if ((v20 & 1) == 0)
    {
      collectionViewLayout = self->_collectionViewLayout;
      -[SFAirDropActivityViewController view](self, "view");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "bounds");
      -[SFCollectionViewLayout firstItemCenterForContainerWidth:](collectionViewLayout, "firstItemCenterForContainerWidth:", CGRectGetWidth(v27));
      v18 = v23 - v10;

    }
    objc_msgSend(MEMORY[0x24BDD1628], "deactivateConstraints:", self->_textViewConstraints);
    objc_msgSend(MEMORY[0x24BDD1628], "deactivateConstraints:", self->_airdropViewYConstraints);
    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", self->_largeTextTextViewConstraints);
    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", self->_largeTextAirdropViewYConstraints);
    titleLabelTopConstraintDefaultConstant = self->_titleLabelTopConstraintDefaultConstant + 3.0;
  }
  else
  {
    v15 = self->_collectionViewLayout;
    -[SFAirDropActivityViewController view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bounds");
    -[SFCollectionViewLayout firstItemCenterForContainerWidth:](v15, "firstItemCenterForContainerWidth:", CGRectGetWidth(v26));
    v18 = v17 - v10;

    objc_msgSend(MEMORY[0x24BDD1628], "deactivateConstraints:", self->_largeTextTextViewConstraints);
    objc_msgSend(MEMORY[0x24BDD1628], "deactivateConstraints:", self->_largeTextAirdropViewYConstraints);
    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", self->_textViewConstraints);
    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", self->_airdropViewYConstraints);
    titleLabelTopConstraintDefaultConstant = self->_titleLabelTopConstraintDefaultConstant;
  }
  -[NSLayoutConstraint setConstant:](self->_titleLabelTopConstraint, "setConstant:", titleLabelTopConstraintDefaultConstant);
  -[NSLayoutConstraint setConstant:](self->_airDropActiveIconLeftConstraint, "setConstant:", v18);
  -[NSLayoutConstraint setConstant:](self->_instructionsRightConstraint, "setConstant:", -v18);
  -[NSLayoutConstraint setConstant:](self->_airDropInactiveIconLeftConstraint, "setConstant:", v18);
  -[NSLayoutConstraint setConstant:](self->_noAWDLRightConstraint, "setConstant:", -v18);
  -[NSLayoutConstraint setConstant:](self->_airDropIconLeftConstraint, "setConstant:", v18);
  -[NSLayoutConstraint setConstant:](self->_noWifiRightConstraint, "setConstant:", -v18);
  -[SFAirDropActivityViewController updatePreferredContentSize](self, "updatePreferredContentSize");

}

- (void)_updateExclusionPathsForTextViews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  int v9;
  uint64_t v10;
  double MinX;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  UITextView *instructionsTextView;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  UITextView *noWifiTextView;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  UITextView *noAWDLTextView;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[2];
  CGRect v41;

  v40[1] = *MEMORY[0x24BDAC8D0];
  -[UIButton alpha](self->_showMoreButton, "alpha");
  if (v3 == 0.0)
  {
    -[UITextView textContainer](self->_instructionsTextView, "textContainer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x24BDBD1A8];
    objc_msgSend(v15, "setExclusionPaths:", MEMORY[0x24BDBD1A8]);

    -[UITextView textContainer](self->_noWifiTextView, "textContainer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setExclusionPaths:", v16);

    -[UITextView textContainer](self->_noAWDLTextView, "textContainer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setExclusionPaths:", v16);

    -[UITextView sizeToFit](self->_instructionsTextView, "sizeToFit");
    -[UITextView sizeToFit](self->_noWifiTextView, "sizeToFit");
    -[UITextView sizeToFit](self->_noAWDLTextView, "sizeToFit");
  }
  else
  {
    -[UIButton frame](self->_showMoreButton, "frame");
    v5 = v4;
    v7 = v6;
    -[SFAirDropActivityViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "_shouldReverseLayoutDirection");
    -[UITextView frame](self->_instructionsTextView, "frame");
    if (v9)
      MinX = CGRectGetMinX(*(CGRect *)&v10);
    else
      MinX = CGRectGetMaxX(*(CGRect *)&v10) - v5;

    -[UITextView frame](self->_instructionsTextView, "frame");
    v19 = v7 * 0.5 + CGRectGetMaxY(v41) - v7;
    v20 = (void *)MEMORY[0x24BEBD420];
    instructionsTextView = self->_instructionsTextView;
    -[SFAirDropActivityViewController view](self, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView convertRect:fromView:](instructionsTextView, "convertRect:fromView:", v22, MinX, v19, v5, v7);
    objc_msgSend(v20, "bezierPathWithRect:");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v23;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v40, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView textContainer](self->_instructionsTextView, "textContainer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setExclusionPaths:", v24);

    v26 = (void *)MEMORY[0x24BEBD420];
    noWifiTextView = self->_noWifiTextView;
    -[SFAirDropActivityViewController view](self, "view");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView convertRect:fromView:](noWifiTextView, "convertRect:fromView:", v28, MinX, v19, v5, v7);
    objc_msgSend(v26, "bezierPathWithRect:");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v29;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v39, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView textContainer](self->_noWifiTextView, "textContainer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setExclusionPaths:", v30);

    v32 = (void *)MEMORY[0x24BEBD420];
    noAWDLTextView = self->_noAWDLTextView;
    -[SFAirDropActivityViewController view](self, "view");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView convertRect:fromView:](noAWDLTextView, "convertRect:fromView:", v34, MinX, v19, v5, v7);
    objc_msgSend(v32, "bezierPathWithRect:");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v35;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v38, 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView textContainer](self->_noAWDLTextView, "textContainer");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setExclusionPaths:", v36);

  }
}

- (void)_createiOSLayoutConstraints
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  CGFloat v10;
  unint64_t v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  NSLayoutConstraint *v27;
  NSLayoutConstraint *titleLabelTopConstraint;
  void *v29;
  void *v30;
  void *v31;
  SFAirDropActiveIconView *airDropActiveIconView;
  void *v33;
  void *v34;
  uint64_t v35;
  double v36;
  void *v37;
  SFAirDropActiveIconView *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSLayoutConstraint *v47;
  NSLayoutConstraint *airDropActiveIconLeftConstraint;
  SFAirDropIconView *airDropIconView;
  void *v50;
  void *v51;
  SFAirDropIconView *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  NSLayoutConstraint *v58;
  NSLayoutConstraint *airDropIconLeftConstraint;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  NSLayoutConstraint *v66;
  NSLayoutConstraint *noAWDLRightConstraint;
  SFAirDropActiveIconView *airDropInactiveIconView;
  void *v69;
  void *v70;
  uint64_t v71;
  double v72;
  void *v73;
  SFAirDropActiveIconView *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  double v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  NSLayoutConstraint *v83;
  NSLayoutConstraint *airDropInactiveIconLeftConstraint;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  NSLayoutConstraint *v91;
  NSLayoutConstraint *noWifiRightConstraint;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  NSLayoutConstraint *v100;
  NSLayoutConstraint *instructionsRightConstraint;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  uint64_t v109;
  void *v110;
  uint64_t v111;
  double v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  uint64_t v120;
  double v121;
  void *v122;
  NSArray *v123;
  NSArray *airdropViewYConstraints;
  void *v125;
  void *v126;
  double v127;
  double v128;
  double v129;
  NSLayoutConstraint *v130;
  NSLayoutConstraint *largeTextAirdropViewYConstraint;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  NSArray *v140;
  NSArray *largeTextAirdropViewYConstraints;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  NSArray *v151;
  NSArray *textViewConstraints;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  NSArray *v162;
  NSArray *largeTextTextViewConstraints;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  _QWORD v172[3];
  _QWORD v173[3];
  _QWORD v174[3];
  _QWORD v175[3];
  _QWORD v176[2];
  _QWORD v177[4];

  v177[2] = *MEMORY[0x24BDAC8D0];
  -[SFAirDropActivityViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  v6 = v5 & 0xFFFFFFFFFFFFFFFBLL;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v9 = 10;
  else
    v9 = 6;
  v10 = dbl_2127A2B00[(v8 & 0xFFFFFFFFFFFFFFFBLL) == 1];
  if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v11 = 9;
  else
    v11 = 3;
  if (v6 == 1)
    v12 = 78.0;
  else
    v12 = 62.0;
  self->_minimumPreferredContentSize.width = 0.0;
  self->_minimumPreferredContentSize.height = v10;
  v176[0] = CFSTR("topPadding");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v176[1] = CFSTR("middlePadding");
  v177[0] = v13;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v177[1] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v177, v176, 2);
  v170 = (void *)objc_claimAutoreleasedReturnValue();

  -[UILabel centerXAnchor](self->_titleLabel, "centerXAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeAreaLayoutGuide");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "centerXAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v17);
  v171 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addConstraint:", v171);
  -[UILabel widthAnchor](self->_titleLabel, "widthAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v3;
  objc_msgSend(v3, "safeAreaLayoutGuide");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "widthAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:constant:", v21, -20.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addConstraint:", v22);

  v23 = (double)v11;
  self->_titleLabelTopConstraintDefaultConstant = (double)v11;
  -[UILabel topAnchor](self->_titleLabel, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "safeAreaLayoutGuide");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "topAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:constant:", v26, self->_titleLabelTopConstraintDefaultConstant);
  v27 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  titleLabelTopConstraint = self->_titleLabelTopConstraint;
  self->_titleLabelTopConstraint = v27;

  objc_msgSend(v19, "addConstraint:", self->_titleLabelTopConstraint);
  v29 = (void *)MEMORY[0x24BDD1628];
  _NSDictionaryOfVariableBindings(CFSTR("_titleLabel, _collectionView"), self->_titleLabel, self->_collectionView, 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[_titleLabel]-middlePadding-[_collectionView]|"), 0, v170, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addConstraints:", v31);

  airDropActiveIconView = self->_airDropActiveIconView;
  -[SFAirDropActiveIconView widthAnchor](airDropActiveIconView, "widthAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "userInterfaceIdiom");

  if ((v35 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v36 = 76.0;
  else
    v36 = 60.0;
  objc_msgSend(v33, "constraintEqualToConstant:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAirDropActiveIconView addConstraint:](airDropActiveIconView, "addConstraint:", v37);

  v38 = self->_airDropActiveIconView;
  -[SFAirDropActiveIconView heightAnchor](v38, "heightAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "userInterfaceIdiom");

  if ((v41 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v42 = 76.0;
  else
    v42 = 60.0;
  objc_msgSend(v39, "constraintEqualToConstant:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAirDropActiveIconView addConstraint:](v38, "addConstraint:", v43);

  -[SFAirDropActiveIconView leadingAnchor](self->_airDropActiveIconView, "leadingAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "safeAreaLayoutGuide");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "leadingAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:", v46);
  v47 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  airDropActiveIconLeftConstraint = self->_airDropActiveIconLeftConstraint;
  self->_airDropActiveIconLeftConstraint = v47;

  objc_msgSend(v19, "addConstraint:", self->_airDropActiveIconLeftConstraint);
  airDropIconView = self->_airDropIconView;
  -[SFAirDropIconView widthAnchor](airDropIconView, "widthAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToConstant:", v12);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAirDropIconView addConstraint:](airDropIconView, "addConstraint:", v51);

  v52 = self->_airDropIconView;
  -[SFAirDropIconView heightAnchor](v52, "heightAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintEqualToConstant:", v12);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAirDropIconView addConstraint:](v52, "addConstraint:", v54);

  -[SFAirDropIconView leadingAnchor](self->_airDropIconView, "leadingAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "safeAreaLayoutGuide");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "leadingAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "constraintEqualToAnchor:", v57);
  v58 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  airDropIconLeftConstraint = self->_airDropIconLeftConstraint;
  self->_airDropIconLeftConstraint = v58;

  objc_msgSend(v19, "addConstraint:", self->_airDropIconLeftConstraint);
  -[UITextView leadingAnchor](self->_noAWDLTextView, "leadingAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAirDropActiveIconView trailingAnchor](self->_airDropInactiveIconView, "trailingAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "constraintEqualToAnchor:constant:", v61, 15.0);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addConstraint:", v62);

  -[UITextView trailingAnchor](self->_noAWDLTextView, "trailingAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "safeAreaLayoutGuide");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "trailingAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "constraintEqualToAnchor:constant:", v65, 5.0);
  v66 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  noAWDLRightConstraint = self->_noAWDLRightConstraint;
  self->_noAWDLRightConstraint = v66;

  objc_msgSend(v19, "addConstraint:", self->_noAWDLRightConstraint);
  airDropInactiveIconView = self->_airDropInactiveIconView;
  -[SFAirDropActiveIconView widthAnchor](airDropInactiveIconView, "widthAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = objc_msgSend(v70, "userInterfaceIdiom");

  if ((v71 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v72 = 76.0;
  else
    v72 = 60.0;
  objc_msgSend(v69, "constraintEqualToConstant:", v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAirDropActiveIconView addConstraint:](airDropInactiveIconView, "addConstraint:", v73);

  v74 = self->_airDropInactiveIconView;
  -[SFAirDropActiveIconView heightAnchor](v74, "heightAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = objc_msgSend(v76, "userInterfaceIdiom");

  if ((v77 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v78 = 76.0;
  else
    v78 = 60.0;
  objc_msgSend(v75, "constraintEqualToConstant:", v78);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAirDropActiveIconView addConstraint:](v74, "addConstraint:", v79);

  -[SFAirDropActiveIconView leadingAnchor](self->_airDropInactiveIconView, "leadingAnchor");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "safeAreaLayoutGuide");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "leadingAnchor");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "constraintEqualToAnchor:", v82);
  v83 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  airDropInactiveIconLeftConstraint = self->_airDropInactiveIconLeftConstraint;
  self->_airDropInactiveIconLeftConstraint = v83;

  objc_msgSend(v19, "addConstraint:", self->_airDropInactiveIconLeftConstraint);
  -[UITextView leadingAnchor](self->_noWifiTextView, "leadingAnchor");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAirDropIconView trailingAnchor](self->_airDropIconView, "trailingAnchor");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "constraintEqualToAnchor:constant:", v86, 15.0);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addConstraint:", v87);

  -[UITextView trailingAnchor](self->_noWifiTextView, "trailingAnchor");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "safeAreaLayoutGuide");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "trailingAnchor");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "constraintEqualToAnchor:constant:", v90, -12.0);
  v91 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  noWifiRightConstraint = self->_noWifiRightConstraint;
  self->_noWifiRightConstraint = v91;

  v93 = v19;
  objc_msgSend(v19, "addConstraint:", self->_noWifiRightConstraint);
  -[UITextView leadingAnchor](self->_instructionsTextView, "leadingAnchor");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAirDropActiveIconView trailingAnchor](self->_airDropActiveIconView, "trailingAnchor");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "constraintEqualToAnchor:constant:", v95, 15.0);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addConstraint:", v96);

  -[UITextView trailingAnchor](self->_instructionsTextView, "trailingAnchor");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "safeAreaLayoutGuide");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "trailingAnchor");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "constraintEqualToAnchor:constant:", v99, -5.0);
  v100 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  instructionsRightConstraint = self->_instructionsRightConstraint;
  self->_instructionsRightConstraint = v100;

  objc_msgSend(v19, "addConstraint:", self->_instructionsRightConstraint);
  -[UIButton trailingAnchor](self->_showMoreButton, "trailingAnchor");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView trailingAnchor](self->_instructionsTextView, "trailingAnchor");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "constraintEqualToAnchor:", v103);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addConstraint:", v104);

  -[UIButton bottomAnchor](self->_showMoreButton, "bottomAnchor");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView bottomAnchor](self->_instructionsTextView, "bottomAnchor");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "constraintEqualToAnchor:", v106);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addConstraint:", v107);

  -[SFAirDropActiveIconView centerYAnchor](self->_airDropActiveIconView, "centerYAnchor");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v166 = v108;
  -[UICollectionView topAnchor](self->_collectionView, "topAnchor");
  v109 = objc_claimAutoreleasedReturnValue();
  v164 = (void *)v109;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = objc_msgSend(v110, "userInterfaceIdiom");

  if ((v111 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v112 = 38.0;
  else
    v112 = 30.0;
  objc_msgSend(v108, "constraintEqualToAnchor:constant:", v109, floor(v112) + -1.0);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v175[0] = v113;
  -[SFAirDropIconView centerYAnchor](self->_airDropIconView, "centerYAnchor");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView topAnchor](self->_collectionView, "topAnchor");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "constraintEqualToAnchor:constant:", v115, floor(v12 * 0.5) + -2.0);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v175[1] = v116;
  -[SFAirDropActiveIconView centerYAnchor](self->_airDropInactiveIconView, "centerYAnchor");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView topAnchor](self->_collectionView, "topAnchor");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v120 = objc_msgSend(v119, "userInterfaceIdiom");

  if ((v120 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v121 = 38.0;
  else
    v121 = 30.0;
  objc_msgSend(v117, "constraintEqualToAnchor:constant:", v118, floor(v121) + -1.0);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v175[2] = v122;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v175, 3);
  v123 = (NSArray *)objc_claimAutoreleasedReturnValue();
  airdropViewYConstraints = self->_airdropViewYConstraints;
  self->_airdropViewYConstraints = v123;

  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 11.0);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "lineHeight");
  -[SFAirDropActivityViewController traitCollection](self, "traitCollection");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "displayScale");
  UIRoundToScale();
  v128 = v127;

  -[SFAirDropActiveIconView topAnchor](self->_airDropActiveIconView, "topAnchor");
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "safeAreaLayoutGuide");
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v169, "topAnchor");
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  v129 = v128 + v23;
  objc_msgSend(v167, "constraintEqualToAnchor:constant:", v165, v129);
  v130 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  largeTextAirdropViewYConstraint = self->_largeTextAirdropViewYConstraint;
  self->_largeTextAirdropViewYConstraint = v130;

  v174[0] = v130;
  -[SFAirDropIconView topAnchor](self->_airDropIconView, "topAnchor");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  v168 = v93;
  objc_msgSend(v93, "safeAreaLayoutGuide");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v133, "topAnchor");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "constraintEqualToAnchor:constant:", v134, v129);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  v174[1] = v135;
  -[SFAirDropActiveIconView topAnchor](self->_airDropInactiveIconView, "topAnchor");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "safeAreaLayoutGuide");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v137, "topAnchor");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "constraintEqualToAnchor:constant:", v138, v129);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  v174[2] = v139;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v174, 3);
  v140 = (NSArray *)objc_claimAutoreleasedReturnValue();
  largeTextAirdropViewYConstraints = self->_largeTextAirdropViewYConstraints;
  self->_largeTextAirdropViewYConstraints = v140;

  -[UITextView centerYAnchor](self->_noAWDLTextView, "centerYAnchor");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAirDropActiveIconView centerYAnchor](self->_airDropInactiveIconView, "centerYAnchor");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v142, "constraintEqualToAnchor:", v143);
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  v173[0] = v144;
  -[UITextView centerYAnchor](self->_noWifiTextView, "centerYAnchor");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAirDropIconView centerYAnchor](self->_airDropIconView, "centerYAnchor");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v145, "constraintEqualToAnchor:", v146);
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  v173[1] = v147;
  -[UITextView centerYAnchor](self->_instructionsTextView, "centerYAnchor");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAirDropActiveIconView centerYAnchor](self->_airDropActiveIconView, "centerYAnchor");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "constraintEqualToAnchor:", v149);
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  v173[2] = v150;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v173, 3);
  v151 = (NSArray *)objc_claimAutoreleasedReturnValue();
  textViewConstraints = self->_textViewConstraints;
  self->_textViewConstraints = v151;

  -[UITextView topAnchor](self->_noAWDLTextView, "topAnchor");
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAirDropActiveIconView topAnchor](self->_airDropInactiveIconView, "topAnchor");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v153, "constraintEqualToAnchor:", v154);
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  v172[0] = v155;
  -[UITextView topAnchor](self->_noWifiTextView, "topAnchor");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAirDropIconView topAnchor](self->_airDropIconView, "topAnchor");
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v156, "constraintEqualToAnchor:", v157);
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  v172[1] = v158;
  -[UITextView topAnchor](self->_instructionsTextView, "topAnchor");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAirDropActiveIconView topAnchor](self->_airDropActiveIconView, "topAnchor");
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v159, "constraintEqualToAnchor:", v160);
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  v172[2] = v161;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v172, 3);
  v162 = (NSArray *)objc_claimAutoreleasedReturnValue();
  largeTextTextViewConstraints = self->_largeTextTextViewConstraints;
  self->_largeTextTextViewConstraints = v162;

}

- (void)_createtvOSLayoutConstraints
{
  void *v3;
  void *v4;
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
  void *v15;
  void *v16;
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
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;

  -[SFAirDropActivityViewController view](self, "view");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView widthAnchor](self->_titleVibrancyView, "widthAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "widthAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintEqualToAnchor:", v4);
  v109 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIVisualEffectView heightAnchor](self->_titleVibrancyView, "heightAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "heightAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:multiplier:", v6, 0.22);
  v108 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIVisualEffectView topAnchor](self->_titleVibrancyView, "topAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "topAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v8);
  v107 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v109, "setActive:", 1);
  objc_msgSend(v108, "setActive:", 1);
  objc_msgSend(v107, "setActive:", 1);
  -[UIVisualEffectView widthAnchor](self->_iconsVibrancyView, "widthAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "widthAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v106 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIVisualEffectView heightAnchor](self->_iconsVibrancyView, "heightAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "heightAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:multiplier:", v12, 0.45);
  v105 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIVisualEffectView topAnchor](self->_iconsVibrancyView, "topAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView bottomAnchor](self->_titleVibrancyView, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v104 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v106, "setActive:", 1);
  objc_msgSend(v105, "setActive:", 1);
  objc_msgSend(v104, "setActive:", 1);
  -[UICollectionView widthAnchor](self->_collectionView, "widthAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "widthAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v16);
  v103 = (void *)objc_claimAutoreleasedReturnValue();

  -[UICollectionView heightAnchor](self->_collectionView, "heightAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "heightAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:multiplier:", v18, 0.33);
  v102 = (void *)objc_claimAutoreleasedReturnValue();

  -[UICollectionView topAnchor](self->_collectionView, "topAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView bottomAnchor](self->_titleVibrancyView, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:constant:", v20, 48.0);
  v101 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v103, "setActive:", 1);
  objc_msgSend(v102, "setActive:", 1);
  objc_msgSend(v101, "setActive:", 1);
  -[UIVisualEffectView widthAnchor](self->_instructionsVibrancyView, "widthAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "widthAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v22);
  v100 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIVisualEffectView heightAnchor](self->_instructionsVibrancyView, "heightAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "heightAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:multiplier:", v24, 0.33);
  v99 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIVisualEffectView topAnchor](self->_instructionsVibrancyView, "topAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView bottomAnchor](self->_iconsVibrancyView, "bottomAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v26);
  v98 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v100, "setActive:", 1);
  objc_msgSend(v99, "setActive:", 1);
  objc_msgSend(v98, "setActive:", 1);
  -[UILabel centerXAnchor](self->_titleLabel, "centerXAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "centerXAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v28);
  v97 = (void *)objc_claimAutoreleasedReturnValue();

  -[UILabel firstBaselineAnchor](self->_titleLabel, "firstBaselineAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "topAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:constant:", v30, 198.0);
  v96 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v97, "setActive:", 1);
  objc_msgSend(v96, "setActive:", 1);
  -[SFAirDropActiveIconView widthAnchor](self->_airDropActiveIconView, "widthAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToConstant:", 266.0);
  v95 = (void *)objc_claimAutoreleasedReturnValue();

  -[SFAirDropActiveIconView heightAnchor](self->_airDropActiveIconView, "heightAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToConstant:", 266.0);
  v93 = (void *)objc_claimAutoreleasedReturnValue();

  -[SFAirDropActiveIconView centerXAnchor](self->_airDropActiveIconView, "centerXAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "centerXAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v34);
  v94 = (void *)objc_claimAutoreleasedReturnValue();

  -[SFAirDropActiveIconView topAnchor](self->_airDropActiveIconView, "topAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView topAnchor](self->_iconsVibrancyView, "topAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:constant:", v36, 70.0);
  v92 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v94, "setActive:", 1);
  objc_msgSend(v95, "setActive:", 1);
  objc_msgSend(v93, "setActive:", 1);
  objc_msgSend(v92, "setActive:", 1);
  -[SFAirDropIconView widthAnchor](self->_airDropIconView, "widthAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToConstant:", 266.0);
  v91 = (void *)objc_claimAutoreleasedReturnValue();

  -[SFAirDropIconView heightAnchor](self->_airDropIconView, "heightAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToConstant:", 266.0);
  v90 = (void *)objc_claimAutoreleasedReturnValue();

  -[SFAirDropIconView centerXAnchor](self->_airDropIconView, "centerXAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "centerXAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:", v40);
  v89 = (void *)objc_claimAutoreleasedReturnValue();

  -[SFAirDropIconView topAnchor](self->_airDropIconView, "topAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView topAnchor](self->_iconsVibrancyView, "topAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:", v42);
  v88 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v91, "setActive:", 1);
  objc_msgSend(v90, "setActive:", 1);
  objc_msgSend(v89, "setActive:", 1);
  objc_msgSend(v88, "setActive:", 1);
  -[SFAirDropActiveIconView widthAnchor](self->_airDropInactiveIconView, "widthAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToConstant:", 266.0);
  v87 = (void *)objc_claimAutoreleasedReturnValue();

  -[SFAirDropActiveIconView heightAnchor](self->_airDropInactiveIconView, "heightAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToConstant:", 266.0);
  v86 = (void *)objc_claimAutoreleasedReturnValue();

  -[SFAirDropActiveIconView centerXAnchor](self->_airDropInactiveIconView, "centerXAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "centerXAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:", v46);
  v85 = (void *)objc_claimAutoreleasedReturnValue();

  -[SFAirDropActiveIconView topAnchor](self->_airDropInactiveIconView, "topAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView topAnchor](self->_iconsVibrancyView, "topAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:", v48);
  v84 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v87, "setActive:", 1);
  objc_msgSend(v86, "setActive:", 1);
  objc_msgSend(v85, "setActive:", 1);
  objc_msgSend(v84, "setActive:", 1);
  -[UITextView topAnchor](self->_noAWDLTextView, "topAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView topAnchor](self->_instructionsVibrancyView, "topAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToAnchor:", v50);
  v83 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v83, "setActive:", 1);
  -[UITextView topAnchor](self->_noWifiTextView, "topAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView topAnchor](self->_instructionsVibrancyView, "topAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintEqualToAnchor:", v52);
  v82 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v82, "setActive:", 1);
  -[UITextView topAnchor](self->_instructionsTextView, "topAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView topAnchor](self->_instructionsVibrancyView, "topAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintEqualToAnchor:constant:", v54, 3.0);
  v81 = (void *)objc_claimAutoreleasedReturnValue();

  -[UITextView widthAnchor](self->_instructionsTextView, "widthAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "widthAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "constraintEqualToAnchor:multiplier:", v56, 0.53);
  v80 = (void *)objc_claimAutoreleasedReturnValue();

  -[UITextView centerXAnchor](self->_instructionsTextView, "centerXAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "centerXAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "constraintEqualToAnchor:", v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v81, "setActive:", 1);
  objc_msgSend(v80, "setActive:", 1);
  objc_msgSend(v59, "setActive:", 1);
  -[UIFocusContainerGuide topAnchor](self->_fcg, "topAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView bottomAnchor](self->_collectionView, "bottomAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "constraintEqualToAnchor:constant:", v61, 0.0);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIFocusContainerGuide bottomAnchor](self->_fcg, "bottomAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "bottomAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "constraintEqualToAnchor:constant:", v64, 0.0);
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIFocusContainerGuide widthAnchor](self->_fcg, "widthAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "widthAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "constraintEqualToAnchor:constant:", v67, 0.0);
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v62, "setActive:", 1);
  objc_msgSend(v65, "setActive:", 1);
  objc_msgSend(v68, "setActive:", 1);
  -[UIButton topAnchor](self->_doneButton, "topAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView lastBaselineAnchor](self->_instructionsTextView, "lastBaselineAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "constraintEqualToAnchor:constant:", v70, 40.0);
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIButton centerXAnchor](self->_doneButton, "centerXAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "centerXAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "constraintEqualToAnchor:constant:", v73, 0.0);
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIButton widthAnchor](self->_doneButton, "widthAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "constraintGreaterThanOrEqualToConstant:", 200.0);
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIButton heightAnchor](self->_doneButton, "heightAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "constraintEqualToConstant:", 82.0);
  v78 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v71, "setActive:", 1);
  objc_msgSend(v74, "setActive:", 1);
  objc_msgSend(v76, "setActive:", 1);
  objc_msgSend(v78, "setActive:", 1);
  -[UIVisualEffectView contentView](self->_iconsVibrancyView, "contentView");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "bringSubviewToFront:", self->_airDropActiveIconView);

}

- (id)attributedStringWithTitle:(id)a3 content:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSString *v14;
  void *v15;
  NSString *v16;
  NSComparisonResult v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "length");
  v9 = (void *)MEMORY[0x24BDD17C8];
  if (v8)
  {
    SFLocalizedStringForKey();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", v10, v6, v7);
  }
  else
  {
    SFLocalizedStringForKey();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", v10, v7, v37);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[SFAirDropActivityViewController traitCollection](self, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "preferredContentSizeCategory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v13))
  {

LABEL_8:
    v25 = *MEMORY[0x24BEBE1E8];
    -[SFAirDropActivityViewController _screen](self, "_screen");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    _SFPersonCollectionViewMaximumSizeCategory(v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAirDropActivityViewController _fontWithStyle:maxSizeCategory:traits:](self, "_fontWithStyle:maxSizeCategory:traits:", v25, v27, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    -[SFAirDropActivityViewController _screen](self, "_screen");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    _SFPersonCollectionViewMaximumSizeCategory(v23);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAirDropActivityViewController _fontWithStyle:maxSizeCategory:traits:](self, "_fontWithStyle:maxSizeCategory:traits:", v25, v28, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
  v14 = (NSString *)*MEMORY[0x24BEBE098];
  -[SFAirDropActivityViewController traitCollection](self, "traitCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "preferredContentSizeCategory");
  v16 = (NSString *)objc_claimAutoreleasedReturnValue();
  v17 = UIContentSizeCategoryCompareToCategory(v14, v16);

  if (v17 == NSOrderedAscending)
    goto LABEL_8;
  v18 = (void *)MEMORY[0x24BEBB520];
  v19 = *MEMORY[0x24BEBE1D0];
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "_scaledValueForValue:", 11.0);
  objc_msgSend(v18, "boldSystemFontOfSize:");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)MEMORY[0x24BEBB520];
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", v19);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "_scaledValueForValue:", 11.0);
  objc_msgSend(v22, "systemFontOfSize:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  v29 = objc_msgSend(v11, "rangeOfString:", v6);
  v31 = v30;
  v40 = *MEMORY[0x24BEBB360];
  v32 = v40;
  v41[0] = v21;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v32;
  v39 = v24;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:attributes:", v11, v34);
  objc_msgSend(v35, "setAttributes:range:", v33, v29, v31);

  return v35;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SFAirDropActivityViewController;
  v4 = a3;
  -[SFAirDropActivityViewController traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  -[SFAirDropActivityViewController traitCollection](self, "traitCollection", v10.receiver, v10.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "isEqualToString:", v7);
  if ((v4 & 1) == 0)
  {
    self->_shouldExpandTextIfNeeded = 0;
    -[SFAirDropActivityViewController _updateFontSizes](self, "_updateFontSizes");
    -[SFAirDropActivityViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNeedsUpdateConstraints");

    -[SFAirDropActivityViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setNeedsLayout");

    -[SFAirDropActivityViewController updateContentAreaAnimated:](self, "updateContentAreaAnimated:", 1);
  }
}

+ (BOOL)isAirDropAvailable
{
  void *v2;
  char v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isAirDropAllowed") & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "isClassroomEnabled");

  }
  return v3;
}

+ (BOOL)airDropActivityCanPerformActivityWithItemClasses:(id)a3
{
  void *v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  id v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  char v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint8_t v48[128];
  uint8_t buf[4];
  void *v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  airdrop_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    +[SFAirDropActivityViewController airDropActivityCanPerformActivityWithItemClasses:].cold.2(a2, v5);

  airdrop_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    +[SFAirDropActivityViewController airDropActivityCanPerformActivityWithItemClasses:].cold.1();

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v44;
    *(_QWORD *)&v9 = 138412290;
    v34 = v9;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v44 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        objc_msgSend(v13, "description", v34);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v14, "length") >= 0x3D)
        {
          objc_msgSend(v13, "description");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "substringToIndex:", 60);
          v16 = objc_claimAutoreleasedReturnValue();

          v14 = (void *)v16;
        }
        airdrop_log();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v34;
          v50 = v14;
          _os_log_debug_impl(&dword_212728000, v17, OS_LOG_TYPE_DEBUG, "Top level values: %@", buf, 0xCu);
        }

      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
    }
    while (v10);
  }

  sIgnoreStrings = 0;
  if ((unint64_t)objc_msgSend(v7, "count") >= 2)
  {
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v18 = v7;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v40;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v40 != v21)
            objc_enumerationMutation(v18);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * j), "isSubclassOfClass:", objc_opt_class()))sIgnoreStrings = 1;
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
      }
      while (v20);
    }

  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v23 = v7;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
  if (v24)
  {
    v25 = v24;
    v26 = 0;
    v27 = 0;
    v28 = 0;
    v29 = *(_QWORD *)v36;
    do
    {
      v30 = 0;
      do
      {
        if (*(_QWORD *)v36 != v29)
          objc_enumerationMutation(v23);
        v31 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v30);
        v26 = v26
           || (objc_msgSend(v31, "isSubclassOfClass:", objc_opt_class()) & 1) != 0
           || (objc_msgSend(v31, "isSubclassOfClass:", objc_opt_class()) & 1) != 0
           || (objc_msgSend(v31, "isSubclassOfClass:", objc_opt_class()) & 1) != 0
           || (objc_msgSend(v31, "isSubclassOfClass:", objc_opt_class()) & 1) != 0
           || (objc_msgSend(v31, "isSubclassOfClass:", objc_opt_class()) & 1) != 0
           || objc_msgSend(v31, "isSubclassOfClass:", objc_opt_class());
        if ((objc_msgSend(v31, "isSubclassOfClass:", objc_opt_class()) & 1) != 0
          || (objc_msgSend(v31, "isSubclassOfClass:", objc_opt_class()) & 1) != 0
          || objc_msgSend(v31, "isSubclassOfClass:", objc_opt_class()))
        {
          v26 = 1;
          v28 = 1;
        }
        if ((objc_msgSend(v31, "isSubclassOfClass:", objc_opt_class()) & 1) != 0
          || objc_msgSend(v31, "isSubclassOfClass:", objc_opt_class()))
        {
          v26 = 1;
          v27 = 1;
        }
        ++v30;
      }
      while (v25 != v30);
      v32 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
      v25 = v32;
    }
    while (v32);
  }
  else
  {
    v26 = 0;
    v27 = 0;
    v28 = 0;
  }

  sIgnoreStrings = v27 & v28 & 1;
  return v26;
}

- (BOOL)enableModernShareSheeet
{
  int AppBooleanValue;
  BOOL v4;
  void *v5;
  int v6;
  void *v7;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("EnableModernShareSheet"), CFSTR("com.apple.Sharing"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v4 = AppBooleanValue == 0;
  else
    v4 = 1;
  if (v4)
  {
    -[NSString lowercaseString](self->_sendingAppBundleID, "lowercaseString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.mobileslideshow")) & 1) != 0)
    {
      LOBYTE(v6) = 0;
    }
    else
    {
      -[NSString lowercaseString](self->_sendingAppBundleID, "lowercaseString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.camera")) ^ 1;

    }
  }
  else
  {
    LOBYTE(v6) = 1;
  }
  return v6;
}

- (BOOL)isDebugMode
{
  int AppBooleanValue;
  BOOL v3;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("EnableBrowserDebugMode"), CFSTR("com.apple.Sharing"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v3 = AppBooleanValue == 0;
  else
    v3 = 1;
  return !v3;
}

- (BOOL)isTetheredModeEnabled
{
  int AppBooleanValue;
  BOOL v3;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("EnableTetheredDisplayPortMode"), (CFStringRef)*MEMORY[0x24BDBD568], &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v3 = AppBooleanValue == 0;
  else
    v3 = 1;
  return !v3;
}

- (BOOL)isWifiEnabled
{
  return (-[SFWirelessSettingsController isWifiEnabled](self->_wirelessSettings, "isWifiEnabled") & 1) != 0
      || -[SFAirDropActivityViewController isTetheredModeEnabled](self, "isTetheredModeEnabled");
}

- (BOOL)isBluetoothEnabled
{
  return (-[SFWirelessSettingsController isBluetoothEnabled](self->_wirelessSettings, "isBluetoothEnabled") & 1) != 0
      || -[SFAirDropActivityViewController isTetheredModeEnabled](self, "isTetheredModeEnabled");
}

- (void)enableAirDropRequiredFeatures
{
  -[SFWirelessSettingsController setWifiEnabled:](self->_wirelessSettings, "setWifiEnabled:", 1);
  -[SFWirelessSettingsController setBluetoothEnabled:](self->_wirelessSettings, "setBluetoothEnabled:", 1);
}

- (void)setOtherActivityViewPresented:(BOOL)a3
{
  if (self->_otherActivityViewPresented != a3)
    self->_otherActivityViewPresented = a3;
}

- (id)preferredFocusEnvironments
{
  UICollectionView **p_collectionView;
  void *v3;
  UICollectionView *collectionView;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  if (!self->_doneFocused)
  {
    if (self->_collectionView)
    {
      collectionView = self->_collectionView;
      p_collectionView = &collectionView;
      goto LABEL_6;
    }
LABEL_7:
    v3 = (void *)MEMORY[0x24BDBD1A8];
    return v3;
  }
  if (!self->_doneButton)
    goto LABEL_7;
  v6[0] = self->_doneButton;
  p_collectionView = (UICollectionView **)v6;
LABEL_6:
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", p_collectionView, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  return v3;
}

- (void)updateShowMoreButtonForShowPeople:(BOOL)a3 inactive:(BOOL)a4 active:(BOOL)a5 static:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v12;
  double height;
  double v14;
  double v15;
  int v16;
  int *v17;
  id v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  int v29;
  double v30;
  void *v31;
  CGFloat v32;
  void *v33;
  double v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  unint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  _QWORD v44[5];
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v9 = a3;
  if (self->_shouldExpandTextIfNeeded || a4)
    v12 = !self->_shouldExpandTextIfNeeded;
  else
    v12 = a5 || a6;
  height = self->_minimumPreferredContentSize.height;
  -[NSLayoutConstraint constant](self->_largeTextAirdropViewYConstraint, "constant");
  v15 = height - v14;
  if (v12 && !v9)
  {
    v16 = v8 || v7;
    v17 = &OBJC_IVAR___SFAirDropActivityViewController__instructionsTextView;
    if (v8)
      v17 = &OBJC_IVAR___SFAirDropActivityViewController__noAWDLTextView;
    if (!v16)
      v17 = &OBJC_IVAR___SFAirDropActivityViewController__noWifiTextView;
    if ((v16 & 1) != 0 || v6)
    {
      v23 = *v17;
      objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v23), "frame");
      v20 = v24;
      v19 = v25;
      v22 = v26;
      v21 = v27;
      v18 = *(id *)((char *)&self->super.super.super.isa + v23);
    }
    else
    {
      v18 = 0;
      v20 = *MEMORY[0x24BDBF090];
      v19 = *(double *)(MEMORY[0x24BDBF090] + 8);
      v22 = *(double *)(MEMORY[0x24BDBF090] + 16);
      v21 = *(double *)(MEMORY[0x24BDBF090] + 24);
    }
    -[SFAirDropActivityViewController view](self, "view");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "_shouldReverseLayoutDirection");

    if (v29)
    {
      v51.origin.x = v20;
      v51.origin.y = v19;
      v51.size.width = v22;
      v51.size.height = v21;
      v30 = CGRectGetMaxX(v51) + -16.0;
    }
    else
    {
      -[SFAirDropActivityViewController view](self, "view");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "frame");
      v32 = CGRectGetWidth(v52) + -16.0;
      v53.origin.x = v20;
      v53.origin.y = v19;
      v53.size.width = v22;
      v53.size.height = v21;
      v30 = v32 - CGRectGetMinX(v53);

    }
    objc_msgSend(v18, "textContainer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setMaximumNumberOfLines:", 0);

    objc_msgSend(v18, "sizeThatFits:", v30, 0.0);
    v12 = v34 > v15;

  }
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__0;
  v49 = __Block_byref_object_dispose__0;
  v50 = 0;
  -[UITextView attributedText](self->_instructionsTextView, "attributedText");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "length");
  v37 = *MEMORY[0x24BEBB360];
  v44[0] = MEMORY[0x24BDAC760];
  v44[1] = 3221225472;
  v44[2] = __92__SFAirDropActivityViewController_updateShowMoreButtonForShowPeople_inactive_active_static___block_invoke;
  v44[3] = &unk_24CE0F748;
  v44[4] = &v45;
  objc_msgSend(v35, "enumerateAttribute:inRange:options:usingBlock:", v37, 0, v36, 0, v44);
  if (v9 || v12)
  {
    objc_msgSend((id)v46[5], "_bodyLeading");
    *(float *)&v38 = v15 / v38;
    v39 = vcvtms_u32_f32(*(float *)&v38);
  }
  else
  {
    v39 = 0;
  }
  -[UITextView textContainer](self->_noWifiTextView, "textContainer");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setMaximumNumberOfLines:", v39);

  -[UITextView textContainer](self->_noAWDLTextView, "textContainer");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setMaximumNumberOfLines:", v39);

  -[UITextView textContainer](self->_instructionsTextView, "textContainer");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setMaximumNumberOfLines:", v39);

  v43 = 0.0;
  if (v12)
    v43 = 1.0;
  -[UIButton setAlpha:](self->_showMoreButton, "setAlpha:", v43);

  _Block_object_dispose(&v45, 8);
}

void __92__SFAirDropActivityViewController_updateShowMoreButtonForShowPeople_inactive_active_static___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v8;

  v8 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a5 = 1;
  }

}

- (void)updatePreferredContentSize
{
  -[SFAirDropActivityViewController calculatePreferredContentSize](self, "calculatePreferredContentSize");
  -[SFAirDropActivityViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (void)_updateFontSizes
{
  void *v3;
  NSString *v4;
  _BOOL4 IsAccessibilityCategory;
  uint64_t *v6;
  NSString *v7;
  void *v8;
  NSString *v9;
  NSComparisonResult v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  -[SFAirDropActivityViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);
  v6 = (uint64_t *)MEMORY[0x24BEBE1E8];
  if (IsAccessibilityCategory)
  {

  }
  else
  {
    v7 = (NSString *)*MEMORY[0x24BEBE098];
    -[SFAirDropActivityViewController traitCollection](self, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "preferredContentSizeCategory");
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    v10 = UIContentSizeCategoryCompareToCategory(v7, v9);

    if (v10 != NSOrderedAscending)
    {
      v11 = (void *)MEMORY[0x24BEBB520];
      objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_scaledValueForValue:", 11.0);
      objc_msgSend(v11, "systemFontOfSize:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](self->_titleLabel, "setFont:", v13);
      v14 = 0;
      goto LABEL_6;
    }
  }
  v15 = *v6;
  -[SFAirDropActivityViewController _screen](self, "_screen");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _SFPersonCollectionViewMaximumSizeCategory(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAirDropActivityViewController _fontWithStyle:maxSizeCategory:traits:](self, "_fontWithStyle:maxSizeCategory:traits:", v15, v13, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_titleLabel, "setFont:", v16);

  v14 = 1;
LABEL_6:

  -[SFAirDropActivityViewController title](self, "title");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAirDropActivityViewController instructionsText](self, "instructionsText");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAirDropActivityViewController attributedStringWithTitle:content:](self, "attributedStringWithTitle:content:", v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setAttributedText:](self->_instructionsTextView, "setAttributedText:", v19);

  -[SFAirDropActivityViewController title](self, "title");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAirDropActivityViewController noWiFiBTText](self, "noWiFiBTText");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAirDropActivityViewController attributedStringWithTitle:content:](self, "attributedStringWithTitle:content:", v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setAttributedText:](self->_noWifiTextView, "setAttributedText:", v22);

  -[SFAirDropActivityViewController title](self, "title");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAirDropActivityViewController noAWDLText](self, "noAWDLText");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAirDropActivityViewController attributedStringWithTitle:content:](self, "attributedStringWithTitle:content:", v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setAttributedText:](self->_noAWDLTextView, "setAttributedText:", v25);

  if (v14)
  {
    v26 = *v6;
    -[SFAirDropActivityViewController _screen](self, "_screen");
    v30 = (id)objc_claimAutoreleasedReturnValue();
    _SFPersonCollectionViewMaximumSizeCategory(v30);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAirDropActivityViewController _fontWithStyle:maxSizeCategory:traits:](self, "_fontWithStyle:maxSizeCategory:traits:", v26, v27, 0);
  }
  else
  {
    v27 = (void *)MEMORY[0x24BEBB520];
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
    v30 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "_scaledValueForValue:", 11.0);
    objc_msgSend(v27, "systemFontOfSize:");
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton titleLabel](self->_showMoreButton, "titleLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setFont:", v28);

  if (v14)
  {

    v28 = v27;
  }

}

- (id)_fontWithStyle:(id)a3 maxSizeCategory:(id)a4 traits:(unsigned int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  v9 = a4;
  -[SFAirDropActivityViewController traitCollection](self, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "preferredContentSizeCategory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v11, (UIContentSizeCategory)v9) != NSOrderedAscending)
  {
    v12 = v9;

    v11 = v12;
  }
  objc_msgSend(MEMORY[0x24BEBDAB0], "traitCollectionWithPreferredContentSizeCategory:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)v5)
  {
    objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", v8, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fontDescriptorWithSymbolicTraits:", v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v15, 0.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:compatibleWithTraitCollection:", v8, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

- (CGSize)calculatePreferredContentSize
{
  void *v3;
  NSString *v4;
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
  UITextView *noWifiTextView;
  double height;
  CGFloat width;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGSize result;

  -[SFAirDropActivityViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (UIContentSizeCategoryCompareToCategory(v4, (UIContentSizeCategory)*MEMORY[0x24BEBE0A0]) == NSOrderedAscending)
  {
    width = self->_minimumPreferredContentSize.width;
    height = self->_minimumPreferredContentSize.height;
    goto LABEL_17;
  }
  -[SFAirDropActivityViewController _cachedPreferredItemSize](self, "_cachedPreferredItemSize");
  v6 = v5;
  -[UILabel frame](self->_titleLabel, "frame");
  v8 = v6 + v7;
  -[UITextView alpha](self->_noAWDLTextView, "alpha");
  v10 = v9;
  -[UITextView alpha](self->_instructionsTextView, "alpha");
  v12 = v11;
  -[UITextView alpha](self->_noWifiTextView, "alpha");
  if (self->_shouldExpandTextIfNeeded)
  {
    if (v10 == 0.0)
    {
      if (v12 == 0.0)
      {
        if (v13 == 0.0)
          goto LABEL_13;
        -[SFAirDropIconView frame](self->_airDropIconView, "frame");
        v15 = v20;
        noWifiTextView = self->_noWifiTextView;
      }
      else
      {
        -[SFAirDropActiveIconView frame](self->_airDropActiveIconView, "frame");
        v15 = v19;
        noWifiTextView = self->_instructionsTextView;
      }
    }
    else
    {
      -[SFAirDropActiveIconView frame](self->_airDropInactiveIconView, "frame");
      v15 = v14;
      noWifiTextView = self->_noAWDLTextView;
    }
    -[UITextView frame](noWifiTextView, "frame");
    -[UITextView sizeThatFits:](noWifiTextView, "sizeThatFits:", v21, 0.0);
    if (v15 >= v22)
      v8 = v15;
    else
      v8 = v22;
  }
LABEL_13:
  if (v8 + 20.0 >= self->_minimumPreferredContentSize.height)
    height = v8 + 20.0;
  else
    height = self->_minimumPreferredContentSize.height;
  width = 0.0;
LABEL_17:

  v23 = width;
  v24 = height;
  result.height = v24;
  result.width = v23;
  return result;
}

- (void)setSendingApplicationAuditToken:(id *)a3
{
  NSString *sendingAppBundleID;
  __int128 v6;
  __int128 v7;
  NSString *v8;
  __int128 v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSString *v18;
  NSString *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  NSString *v29;
  NSString *v30;
  NSObject *v31;
  NSString *v32;
  pid_t pidp;
  NSString *v34;
  audit_token_t atoken;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  sendingAppBundleID = self->_sendingAppBundleID;
  self->_sendingAppBundleID = 0;

  v6 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)self->_sendingApplicationAuditToken.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_sendingApplicationAuditToken.val[4] = v6;
  v34 = 0;
  v7 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)atoken.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&atoken.val[4] = v7;
  if (CPCopyBundleIdentifierAndTeamFromAuditToken())
  {
    v8 = self->_sendingAppBundleID;
    self->_sendingAppBundleID = v34;

  }
  if (!self->_sendingAppBundleID)
  {
    pidp = 0;
    v9 = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)atoken.val = *(_OWORD *)a3->var0;
    *(_OWORD *)&atoken.val[4] = v9;
    audit_token_to_au32(&atoken, 0, 0, 0, 0, 0, &pidp, 0, 0);
    if (pidp)
    {
      airdrop_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[SFAirDropActivityViewController setSendingApplicationAuditToken:].cold.2(v10, v11, v12, v13, v14, v15, v16, v17);

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), pidp);
      v18 = (NSString *)objc_claimAutoreleasedReturnValue();
      v19 = self->_sendingAppBundleID;
      self->_sendingAppBundleID = v18;

    }
    if (!self->_sendingAppBundleID)
    {
      airdrop_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[SFAirDropActivityViewController setSendingApplicationAuditToken:].cold.1(v20, v21, v22, v23, v24, v25, v26, v27);

      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "bundleIdentifier");
      v29 = (NSString *)objc_claimAutoreleasedReturnValue();
      v30 = self->_sendingAppBundleID;
      self->_sendingAppBundleID = v29;

    }
  }
  airdrop_log();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    v32 = self->_sendingAppBundleID;
    atoken.val[0] = 138412290;
    *(_QWORD *)&atoken.val[1] = v32;
    _os_log_impl(&dword_212728000, v31, OS_LOG_TYPE_DEFAULT, "Sending app is %@", (uint8_t *)&atoken, 0xCu);
  }

}

- (CGSize)suggestedThumbnailSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");
  SFSuggestedAirDropThumbnailSize();
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return -[NSArray count](self->_people, "count", a3, a4);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  UICollectionView *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  UICollectionView *detailCollectionView;
  uint64_t v13;
  NSMutableDictionary *personToStoredTransferFinalState;
  void *v15;
  void *v16;
  NSMutableDictionary *personToProgress;
  void *v18;
  void *v19;
  UICollectionView *collectionView;

  v6 = a4;
  v7 = (UICollectionView *)a3;
  -[UICollectionView dequeueReusableCellWithReuseIdentifier:forIndexPath:](v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("PersonCellID"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAirDropActivityViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  objc_msgSend(v8, "setActivitySheetWidth:", v10);

  objc_msgSend(v8, "setDarkStyleOnLegacyApp:", self->_darkStyleOnLegacyApp);
  objc_msgSend(v8, "setStateBeingRestored:", 1);
  objc_msgSend(v8, "setDelegate:", self);
  objc_msgSend(v8, "setSessionID:", self->_sessionID);
  -[NSArray objectAtIndexedSubscript:](self->_people, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  detailCollectionView = self->_detailCollectionView;

  if (detailCollectionView == v7)
  {
    -[NSArray objectAtIndexedSubscript:](self->_people, "objectAtIndexedSubscript:", objc_msgSend(v6, "row") + (-[NSArray count](self->_people, "count") >> 1));
    v13 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v13;
  }
  objc_msgSend(v8, "setPerson:", v11);
  personToStoredTransferFinalState = self->_personToStoredTransferFinalState;
  objc_msgSend(v11, "realName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](personToStoredTransferFinalState, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    objc_msgSend(v8, "restoreCellStateFromFinalTransferState:", objc_msgSend(v16, "integerValue"));
  personToProgress = self->_personToProgress;
  objc_msgSend(v11, "realName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](personToProgress, "objectForKeyedSubscript:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setProgress:", v19);
  collectionView = self->_collectionView;
  if (v19)
    -[UICollectionView selectItemAtIndexPath:animated:scrollPosition:](collectionView, "selectItemAtIndexPath:animated:scrollPosition:", v6, 0, 0);
  else
    -[UICollectionView deselectItemAtIndexPath:animated:](collectionView, "deselectItemAtIndexPath:animated:", v6, 0);
  objc_msgSend(v8, "setSelected:", v19 != 0);
  objc_msgSend(v8, "setStateBeingRestored:", 0);

  return v8;
}

- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3
{
  id v4;
  void *v5;
  NSIndexPath *v6;
  void *v7;
  NSIndexPath *focusedIndexPath;
  NSIndexPath *v9;

  v4 = a3;
  objc_msgSend(v4, "indexPathsForSelectedItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v6 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "cellForItemAtIndexPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  focusedIndexPath = v6;
  if (!v7)
    focusedIndexPath = self->_focusedIndexPath;
  v9 = focusedIndexPath;

  return v9;
}

- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v6;
  NSIndexPath *v7;
  NSIndexPath *focusedIndexPath;
  UIButton *v9;

  v6 = a4;
  objc_msgSend(v6, "nextFocusedIndexPath");
  v7 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();
  focusedIndexPath = self->_focusedIndexPath;
  self->_focusedIndexPath = v7;

  objc_msgSend(v6, "nextFocusedView");
  v9 = (UIButton *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = v9 == self->_doneButton;
  self->_doneFocused = (char)v6;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return self->_sharedItemsAvailable;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSMutableDictionary *personToSharedItemsRequestID;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSMutableDictionary *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int64_t v40;
  void *v41;
  NSMutableDictionary *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  SFAirDropActivityViewControllerDelegate **p_delegate;
  id WeakRetained;
  id v48;
  void *v49;
  char v50;
  id v51;
  void *v52;
  void *v53;
  _QWORD v54[4];
  id v55;
  _QWORD v56[4];
  id v57;
  _QWORD aBlock[5];
  id v59;
  int64_t v60;
  const __CFString *v61;
  void *v62;
  void *v63;
  _QWORD v64[3];

  v64[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "cellForItemAtIndexPath:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "person");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "realName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary removeObjectForKey:](self->_personToStoredTransferFinalState, "removeObjectForKey:", v9);
  objc_msgSend(v7, "person");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isSuggestion");

  if (!v11)
  {
    self->_didSelectNode = 1;
    objc_msgSend(v7, "userDidSelect");
    objc_msgSend(v7, "person");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_itemsReady)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_sharedItemsRequestID);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      personToSharedItemsRequestID = self->_personToSharedItemsRequestID;
      objc_msgSend(v24, "realName");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](personToSharedItemsRequestID, "setObject:forKeyedSubscript:", v25, v27);

      v63 = v24;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v63, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAirDropActivityViewController startTransferForPeople:](self, "startTransferForPeople:", v28);
    }
    else
    {
      if (!self->_itemsRequested)
      {
        self->_itemsRequested = 1;
        v40 = self->_sharedItemsRequestID + 1;
        self->_sharedItemsRequestID = v40;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = self->_personToSharedItemsRequestID;
        objc_msgSend(v24, "realName");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](v42, "setObject:forKeyedSubscript:", v41, v43);

        self->_generatedPreviews = 0;
        v44 = MEMORY[0x24BDAC760];
        aBlock[0] = MEMORY[0x24BDAC760];
        aBlock[1] = 3221225472;
        aBlock[2] = __75__SFAirDropActivityViewController_collectionView_didSelectItemAtIndexPath___block_invoke;
        aBlock[3] = &unk_24CE0F798;
        aBlock[4] = self;
        v60 = v40;
        v59 = v6;
        v45 = _Block_copy(aBlock);
        p_delegate = &self->_delegate;
        WeakRetained = objc_loadWeakRetained((id *)p_delegate);
        LODWORD(v43) = objc_msgSend(WeakRetained, "conformsToProtocol:", &unk_254B8F730);

        v48 = objc_loadWeakRetained((id *)p_delegate);
        v49 = v48;
        if ((_DWORD)v43)
        {
          objc_msgSend(v48, "fmf_airDropActivityRequestingSharedItemsWithCompletionHandler:", v45);
        }
        else
        {
          v50 = objc_opt_respondsToSelector();

          v51 = objc_loadWeakRetained((id *)p_delegate);
          if ((v50 & 1) != 0)
          {
            v61 = CFSTR("SFAirDropActivityMaxPreviewsKey");
            v62 = &unk_24CE21EC0;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v56[0] = v44;
            v56[1] = 3221225472;
            v56[2] = __75__SFAirDropActivityViewController_collectionView_didSelectItemAtIndexPath___block_invoke_280;
            v56[3] = &unk_24CE0F3C0;
            v57 = v45;
            objc_msgSend(v51, "airDropActivityRequestingSharedItemsWithOptions:completionHandler:", v52, v56);

            v49 = v57;
          }
          else
          {
            v54[0] = v44;
            v54[1] = 3221225472;
            v54[2] = __75__SFAirDropActivityViewController_collectionView_didSelectItemAtIndexPath___block_invoke_2_281;
            v54[3] = &unk_24CE0F3C0;
            v55 = v45;
            objc_msgSend(v51, "airDropActivityRequestingSharedItemsWithCompletionHandler:", v54);

            v49 = v55;
          }
        }

        goto LABEL_11;
      }
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_sharedItemsRequestID);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = self->_personToSharedItemsRequestID;
      objc_msgSend(v24, "realName");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v31, "setObject:forKeyedSubscript:", v28, v32);

    }
LABEL_11:

    goto LABEL_14;
  }
  objc_msgSend(v7, "person");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "transportBundleID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.MobileSMS"));

  if (!v14)
  {
    objc_msgSend(v7, "person");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "transportBundleID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v30, "isEqualToString:", CFSTR("com.apple.mobilemail")))
    {

    }
    else
    {
      objc_msgSend(v7, "person");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "transportBundleID");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "isEqualToString:", CFSTR("com.apple.telephonyutilities.callservicesd"));

      if (!v35)
        goto LABEL_14;
    }
    -[SFAirDropActivityViewController delegate](self, "delegate");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "person");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "displayName");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v64[0] = v38;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v64, 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "nodePressedWithRecipients:", v39);

    goto LABEL_14;
  }
  -[SFAirDropActivityViewController delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "person");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "realName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "person");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "displayName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "person");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "secondaryName");
  v20 = v9;
  v21 = v6;
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "componentsSeparatedByString:", CFSTR(", "));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "nodePressedWithGUID:groupName:recipients:", v16, v18, v23);

  v6 = v21;
  v9 = v20;

LABEL_14:
}

void __75__SFAirDropActivityViewController_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1, int a2)
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD block[5];
  id v19;
  uint64_t v20;

  if (a2)
  {
    dispatch_get_global_queue(0, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __75__SFAirDropActivityViewController_collectionView_didSelectItemAtIndexPath___block_invoke_2;
    block[3] = &unk_24CE0F770;
    v5 = *(void **)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 48);
    block[4] = *(_QWORD *)(a1 + 32);
    v20 = v4;
    v19 = v5;
    dispatch_async(v3, block);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setNeedsRequestingSharedItems");
    if (objc_msgSend(*(id *)(a1 + 40), "numberOfItemsInSection:", 0) >= 1)
    {
      v6 = 0;
      do
      {
        v7 = *(void **)(a1 + 40);
        objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v6, 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "cellForItemAtIndexPath:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v9, "isSelected"))
        {
          objc_msgSend(v9, "person");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = *(void **)(*(_QWORD *)(a1 + 32) + 1248);
          objc_msgSend(v10, "realName");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "integerValue");
          v15 = *(_QWORD *)(a1 + 48);

          if (v14 == v15)
          {
            objc_msgSend(v9, "userDidCancel");
            v16 = *(void **)(*(_QWORD *)(a1 + 32) + 1168);
            objc_msgSend(v16, "indexPathForCell:", v9);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "deselectItemAtIndexPath:animated:", v17, 0);

          }
        }

        ++v6;
      }
      while (objc_msgSend(*(id *)(a1 + 40), "numberOfItemsInSection:", 0) > v6);
    }
  }
}

void __75__SFAirDropActivityViewController_collectionView_didSelectItemAtIndexPath___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  _QWORD block[5];
  id v12;
  uint64_t v13;

  objc_msgSend(*(id *)(a1[4] + 1288), "waitUntilAllOperationsAreFinished");
  v2 = a1[4];
  if (*(int *)(v2 + 1404) >= 1)
  {
    v3 = 0;
    do
    {
      v4 = *(void **)(v2 + 1272);
      v5 = *(void **)(v2 + 1408);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v7);

      v3 = (v3 + 1);
      v2 = a1[4];
    }
    while ((int)v3 < *(_DWORD *)(v2 + 1404));
  }
  objc_msgSend((id)v2, "generateSpecialPreviewPhotoForRequestID:", a1[6]);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __75__SFAirDropActivityViewController_collectionView_didSelectItemAtIndexPath___block_invoke_3;
  block[3] = &unk_24CE0F770;
  v8 = (void *)a1[5];
  block[4] = a1[4];
  v9 = v8;
  v10 = a1[6];
  v12 = v9;
  v13 = v10;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __75__SFAirDropActivityViewController_collectionView_didSelectItemAtIndexPath___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
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
  id v15;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1281) = 1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 40), "numberOfItemsInSection:", 0) >= 1)
  {
    v2 = 0;
    do
    {
      v3 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v2, 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "cellForItemAtIndexPath:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v5, "isSelected"))
      {
        v6 = *(void **)(*(_QWORD *)(a1 + 32) + 1248);
        objc_msgSend(v5, "person");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "realName");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v9)
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 48));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = *(void **)(*(_QWORD *)(a1 + 32) + 1248);
          objc_msgSend(v5, "person");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "realName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v13);

        }
        objc_msgSend(v5, "person");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v14);

      }
      ++v2;
    }
    while (objc_msgSend(*(id *)(a1 + 40), "numberOfItemsInSection:", 0) > v2);
  }
  objc_msgSend(*(id *)(a1 + 32), "startTransferForPeople:", v15);

}

uint64_t __75__SFAirDropActivityViewController_collectionView_didSelectItemAtIndexPath___block_invoke_280(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __75__SFAirDropActivityViewController_collectionView_didSelectItemAtIndexPath___block_invoke_2_281(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  id v4;

  objc_msgSend(a3, "cellForItemAtIndexPath:", a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userDidCancel");

}

- (CGSize)_cachedPreferredItemSize
{
  void *v3;
  double Width;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;
  CGRect v14;

  -[SFAirDropActivityViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  Width = CGRectGetWidth(v14);
  -[SFAirDropActivityViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFPersonCollectionViewCell _cachedPreferredItemSizeForViewWidth:sizeCategory:](SFPersonCollectionViewCell, "_cachedPreferredItemSizeForViewWidth:sizeCategory:", v6, Width);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)subscribeToProgresses
{
  void *v3;
  void *v4;
  void *v5;
  id progressToken;
  _QWORD v7[5];

  if (!self->_progressToken)
  {
    v3 = (void *)MEMORY[0x24BDD1768];
    objc_msgSend(MEMORY[0x24BDD1768], "sf_publishingKeyForApp:sessionID:", self->_sendingAppBundleID, self->_sessionID);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __56__SFAirDropActivityViewController_subscribeToProgresses__block_invoke;
    v7[3] = &unk_24CE0F7C0;
    v7[4] = self;
    objc_msgSend(v3, "_addSubscriberForCategory:usingPublishingHandler:", v4, v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    progressToken = self->_progressToken;
    self->_progressToken = v5;

  }
}

id __56__SFAirDropActivityViewController_subscribeToProgresses__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v3 = a2;
  objc_msgSend(v3, "sf_personRealName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "subscribedProgress:forPersonWithRealName:", v3, v4);

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __56__SFAirDropActivityViewController_subscribeToProgresses__block_invoke_2;
  v8[3] = &unk_24CE0EDA8;
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v4;
  v5 = v4;
  v6 = _Block_copy(v8);

  return v6;
}

uint64_t __56__SFAirDropActivityViewController_subscribeToProgresses__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "unpublishedProgressForPersonWithRealName:", *(_QWORD *)(a1 + 40));
}

- (void)unsubscribeToProgresses
{
  id progressToken;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (self->_progressToken)
  {
    objc_msgSend(MEMORY[0x24BDD1768], "_removeSubscriber:");
    progressToken = self->_progressToken;
    self->_progressToken = 0;

  }
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[NSMutableDictionary allKeys](self->_personToProgress, "allKeys", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[SFAirDropActivityViewController unpublishedProgressForPersonWithRealName:](self, "unpublishedProgressForPersonWithRealName:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

  -[NSMutableDictionary removeAllObjects](self->_personToProgress, "removeAllObjects");
}

- (void)subscribedProgress:(id)a3 forPersonWithRealName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v17 = v6;
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_personToProgress, "setObject:forKeyedSubscript:", v6, v7);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[UICollectionView visibleCells](self->_collectionView, "visibleCells");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v12);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v13, "person");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "realName");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isEqualToString:", v7);

          if (v16)
            objc_msgSend(v13, "setProgress:", v17);

        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

}

- (void)unpublishedProgressForPersonWithRealName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_personToProgress, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "sf_transferState");
    if ((unint64_t)(v7 - 4) <= 2)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_personToStoredTransferFinalState, "setObject:forKeyedSubscript:", v8, v4);

    }
  }
  v18 = v6;
  -[NSMutableDictionary removeObjectForKey:](self->_personToProgress, "removeObjectForKey:", v4);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[UICollectionView visibleCells](self->_collectionView, "visibleCells");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v13);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v14, "person");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "realName");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqualToString:", v4);

          if (v17)
            objc_msgSend(v14, "setProgress:", 0);

        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }

}

- (void)personCollectionViewCellDidTerminateTransfer:(id)a3
{
  UICollectionView *collectionView;
  id v4;

  collectionView = self->_collectionView;
  -[UICollectionView indexPathForCell:](collectionView, "indexPathForCell:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UICollectionView deselectItemAtIndexPath:animated:](collectionView, "deselectItemAtIndexPath:animated:", v4, 0);

}

- (void)personCollectionViewCellDidStartTransfer:(id)a3
{
  SFAirDropActivityViewControllerDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v6, "airDropActivityDidSuccessfullyStartTransfer");

  }
}

- (void)personCollectionViewCellDidFinishTransfer:(id)a3
{
  UICollectionView *collectionView;
  void *v5;
  id WeakRetained;

  collectionView = self->_collectionView;
  -[UICollectionView indexPathForCell:](collectionView, "indexPathForCell:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView deselectItemAtIndexPath:animated:](collectionView, "deselectItemAtIndexPath:animated:", v5, 0);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "airDropActivityDidSuccessfullyCompleteTransfer");

}

- (void)wirelessSettingsDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[SFAirDropActivityViewController title](self, "title", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAirDropActivityViewController noWiFiBTText](self, "noWiFiBTText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAirDropActivityViewController attributedStringWithTitle:content:](self, "attributedStringWithTitle:content:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setAttributedText:](self->_noWifiTextView, "setAttributedText:", v6);

  -[SFAirDropActivityViewController title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAirDropActivityViewController noAWDLText](self, "noAWDLText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAirDropActivityViewController attributedStringWithTitle:content:](self, "attributedStringWithTitle:content:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setAttributedText:](self->_noAWDLTextView, "setAttributedText:", v9);

  -[SFAirDropActivityViewController updateContentAreaAnimated:](self, "updateContentAreaAnimated:", 1);
}

- (void)showMore:(id)a3
{
  self->_shouldExpandTextIfNeeded = 1;
  -[SFAirDropActivityViewController updateContentAreaAnimated:](self, "updateContentAreaAnimated:", 1);
}

- (id)indexSetToIndexPaths:(id)a3 inSection:(int64_t)a4
{
  objc_class *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  int64_t v12;

  v5 = (objc_class *)MEMORY[0x24BDBCEB8];
  v6 = a3;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithCapacity:", objc_msgSend(v6, "count"));
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __66__SFAirDropActivityViewController_indexSetToIndexPaths_inSection___block_invoke;
  v10[3] = &unk_24CE0F7E8;
  v8 = v7;
  v11 = v8;
  v12 = a4;
  objc_msgSend(v6, "enumerateIndexesUsingBlock:", v10);

  return v8;
}

void __66__SFAirDropActivityViewController_indexSetToIndexPaths_inSection___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", a2, *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (void)browserDidUpdatePeople:(id)a3
{
  NSArray *people;
  _QWORD v5[5];

  people = self->_people;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __58__SFAirDropActivityViewController_browserDidUpdatePeople___block_invoke;
  v5[3] = &unk_24CE0F860;
  v5[4] = self;
  objc_msgSend(a3, "getChangedIndexesForClientPeopleList:withCompletion:", people, v5);
}

void __58__SFAirDropActivityViewController_browserDidUpdatePeople___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  _QWORD v18[4];
  uint64_t v19;
  id v20;
  id v21;
  id v22;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1376), "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.SharingUI.ShareSheet"));

    if (v12)
    {
      objc_msgSend(MEMORY[0x24BEBDB00], "setAnimationsEnabled:", 0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1168), "setAlpha:", 0.0);
    }
  }
  v13 = (void *)MEMORY[0x24BEBDB00];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __58__SFAirDropActivityViewController_browserDidUpdatePeople___block_invoke_2;
  v18[3] = &unk_24CE0F810;
  v19 = *(_QWORD *)(a1 + 32);
  v20 = v7;
  v21 = v8;
  v22 = v9;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __58__SFAirDropActivityViewController_browserDidUpdatePeople___block_invoke_291;
  v17[3] = &unk_24CE0F838;
  v17[4] = v19;
  v14 = v9;
  v15 = v8;
  v16 = v7;
  objc_msgSend(v13, "_animateUsingDefaultDampedSpringWithDelay:initialSpringVelocity:options:animations:completion:", 32, v18, v17, 0.0, 0.0);

}

void __58__SFAirDropActivityViewController_browserDidUpdatePeople___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  uint64_t v10;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 1168);
  v6[0] = MEMORY[0x24BDAC760];
  v6[2] = __58__SFAirDropActivityViewController_browserDidUpdatePeople___block_invoke_3;
  v6[3] = &unk_24CE0F810;
  v6[1] = 3221225472;
  v7 = v2;
  v8 = *(id *)(a1 + 48);
  v4 = *(id *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 32);
  v9 = v4;
  v10 = v5;
  objc_msgSend(v3, "performBatchUpdates:completion:", v6, 0);

}

void __58__SFAirDropActivityViewController_browserDidUpdatePeople___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  airdrop_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "valueForKeyPath:", CFSTR("displayName"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    SFCompactStringFromCollection();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    SFCompactStringFromCollection();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    SFCompactStringFromCollection();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412802;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_212728000, v2, OS_LOG_TYPE_DEFAULT, "browserDidUpdatePeople %@ with deleted %@, inserted %@", (uint8_t *)&v9, 0x20u);

  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 56) + 1376), *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 56), "_collectTelemetryForPeople:", *(_QWORD *)(*(_QWORD *)(a1 + 56) + 1376));
  objc_msgSend(*(id *)(a1 + 56), "updateContentAreaAnimated:", 1);
  objc_msgSend(*(id *)(a1 + 56), "indexSetToIndexPaths:inSection:", *(_QWORD *)(a1 + 40), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 1168), "deleteItemsAtIndexPaths:", v7);
  objc_msgSend(*(id *)(a1 + 56), "indexSetToIndexPaths:inSection:", *(_QWORD *)(a1 + 48), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 1168), "insertItemsAtIndexPaths:", v8);

}

void __58__SFAirDropActivityViewController_browserDidUpdatePeople___block_invoke_291(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  _QWORD v5[5];

  if ((objc_msgSend(MEMORY[0x24BEBDB00], "areAnimationsEnabled") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "bundleIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.SharingUI.ShareSheet"));

    if (v4)
    {
      objc_msgSend(MEMORY[0x24BEBDB00], "setAnimationsEnabled:", 1);
      v5[0] = MEMORY[0x24BDAC760];
      v5[1] = 3221225472;
      v5[2] = __58__SFAirDropActivityViewController_browserDidUpdatePeople___block_invoke_2_292;
      v5[3] = &unk_24CE0ED80;
      v5[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:", v5, 0.25);
    }
  }
}

uint64_t __58__SFAirDropActivityViewController_browserDidUpdatePeople___block_invoke_2_292(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1168), "setAlpha:", 1.0);
}

- (id)cellForPerson:(id)a3
{
  id v4;
  uint64_t v5;
  UICollectionView *collectionView;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  if (-[SFAirDropActivityViewController collectionView:numberOfItemsInSection:](self, "collectionView:numberOfItemsInSection:", self->_collectionView, 0) < 1)
  {
LABEL_5:
    v8 = 0;
  }
  else
  {
    v5 = 0;
    while (1)
    {
      collectionView = self->_collectionView;
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", v5, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UICollectionView cellForItemAtIndexPath:](collectionView, "cellForItemAtIndexPath:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "person");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqual:", v4);

      if ((v10 & 1) != 0)
        break;

      if (-[SFAirDropActivityViewController collectionView:numberOfItemsInSection:](self, "collectionView:numberOfItemsInSection:", self->_collectionView, 0) <= ++v5)goto LABEL_5;
    }
  }

  return v8;
}

- (void)setSharedItemsAvailable:(BOOL)a3
{
  _QWORD v3[5];

  if (self->_sharedItemsAvailable != a3)
  {
    self->_sharedItemsAvailable = a3;
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __59__SFAirDropActivityViewController_setSharedItemsAvailable___block_invoke;
    v3[3] = &unk_24CE0ED80;
    v3[4] = self;
    objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:", v3, 0.35);
  }
}

void __59__SFAirDropActivityViewController_setSharedItemsAvailable___block_invoke(uint64_t a1)
{
  uint64_t v1;
  double v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  double v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  _QWORD v15[5];

  v15[4] = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 1424))
    v2 = 1.0;
  else
    v2 = 0.35;
  v15[0] = *(_QWORD *)(v1 + 1000);
  v15[1] = *(_QWORD *)(v1 + 1168);
  v15[2] = *(_QWORD *)(v1 + 1064);
  v15[3] = *(_QWORD *)(v1 + 1080);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 4);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v8, "alpha", (_QWORD)v10);
        if (v9 != 0.0)
          objc_msgSend(v8, "setAlpha:", v2);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (void)setNeedsRequestingSharedItems
{
  self->_itemsReady = 0;
  self->_itemsRequested = 0;
}

- (void)startTransferForPeople:(id)a3
{
  __int128 v3;
  NSMutableDictionary *personToSharedItemsRequestID;
  void *v5;
  void *v6;
  NSObject *v7;
  NSMutableOrderedSet *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  unsigned __int8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  uint64_t v17;
  void *v18;
  BOOL v19;
  char v20;
  void *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  BOOL v26;
  id v27;
  NSString *sendingAppBundleID;
  NSString *sessionID;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  UICollectionView *collectionView;
  void *v36;
  id WeakRetained;
  char v38;
  id v39;
  __int128 v40;
  id obj;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  void *v46;
  void *v48;
  id v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  void *v62;
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  obj = a3;
  v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
  if (v44)
  {
    v43 = *(_QWORD *)v56;
    *(_QWORD *)&v3 = 138412546;
    v40 = v3;
    do
    {
      for (i = 0; i != v44; ++i)
      {
        if (*(_QWORD *)v56 != v43)
          objc_enumerationMutation(obj);
        v46 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
        -[SFAirDropActivityViewController _emitTelemetryForPerson:](self, "_emitTelemetryForPerson:", v40);
        personToSharedItemsRequestID = self->_personToSharedItemsRequestID;
        objc_msgSend(v46, "realName");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](personToSharedItemsRequestID, "objectForKeyedSubscript:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        if (v6)
        {
          -[NSMutableDictionary objectForKeyedSubscript:](self->_sharedItemsRequestIDToPreviewPhoto, "objectForKeyedSubscript:", v6);
          v7 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = self->_cachedSharedItems;
          objc_sync_enter(v8);
          v9 = (void *)-[NSMutableOrderedSet copy](self->_cachedSharedItems, "copy");
          objc_sync_exit(v8);

          v53 = 0u;
          v54 = 0u;
          v51 = 0u;
          v52 = 0u;
          v49 = v9;
          v10 = 0;
          v11 = 0;
          v12 = 0;
          v13 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
          if (!v13)
            goto LABEL_22;
          v14 = *(_QWORD *)v52;
          while (1)
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v52 != v14)
                objc_enumerationMutation(v49);
              v16 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * j);
              v17 = objc_msgSend(v16, "identifer");
              if (v17 == objc_msgSend(v6, "integerValue"))
              {
                objc_msgSend(v16, "URL");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v19 = v18 == 0;

                if (!v19)
                {
                  if (v7)
                  {
                    if (!v10)
                    {
LABEL_18:
                      objc_msgSend(v16, "payloadDescription");
                      v10 = (void *)objc_claimAutoreleasedReturnValue();
                    }
                  }
                  else
                  {
                    objc_msgSend(v16, "previewImage");
                    v7 = objc_claimAutoreleasedReturnValue();
                    if (!v10)
                      goto LABEL_18;
                  }
                  v20 = objc_msgSend(v16, "wasString");
                  objc_msgSend(v48, "addObject:", v16);
                  v11 |= v20;
                  v12 |= v20 ^ 1;
                  continue;
                }
              }
            }
            v13 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
            if (!v13)
            {
LABEL_22:

              objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v48, "count"));
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v48, "count"))
              {
                v22 = 0;
                do
                {
                  objc_msgSend(v48, "objectAtIndexedSubscript:", v22);
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  v24 = v23;
                  if ((v11 & v12 & 1) == 0 || (objc_msgSend(v23, "wasString") & 1) == 0)
                  {
                    objc_msgSend(v24, "URL");
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v21, "addObject:", v25);

                  }
                  ++v22;
                }
                while (objc_msgSend(v48, "count") > v22);
              }
              v50 = 0;
              v26 = -[SFAirDropActivityViewController isValidPayload:toPerson:invalidMessage:](self, "isValidPayload:toPerson:invalidMessage:", v21, v46, &v50);
              v27 = v50;
              if (v26)
              {
                sendingAppBundleID = self->_sendingAppBundleID;
                sessionID = self->_sessionID;
                SFScaleAndRotateImage(v7, 540.0);
                v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                objc_msgSend(v46, "startSendForBundleID:sessionID:items:description:previewImage:fromShareSheet:", sendingAppBundleID, sessionID, v21, v10, objc_msgSend(v30, "CGImage"), 0);
              }
              else
              {
                v30 = (id)objc_opt_new();
                SFLocalizedStringForKey();
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "setTitle:", v32);

                objc_msgSend(v30, "setMessage:", v27);
                SFLocalizedStringForKey();
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "setDefaultButtonTitle:", v33);

                objc_msgSend(v30, "present");
                -[SFAirDropActivityViewController cellForPerson:](self, "cellForPerson:", v46);
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "userDidCancel");
                collectionView = self->_collectionView;
                -[UICollectionView indexPathForCell:](collectionView, "indexPathForCell:", v34);
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                -[UICollectionView deselectItemAtIndexPath:animated:](collectionView, "deselectItemAtIndexPath:animated:", v36, 0);

                WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
                v38 = objc_opt_respondsToSelector();

                if ((v38 & 1) != 0)
                {
                  v39 = objc_loadWeakRetained((id *)&self->_delegate);
                  objc_msgSend(v39, "airDropActivityDidFailToStartTransfer");

                }
                v27 = v34;
              }

              goto LABEL_36;
            }
          }
        }
        airdrop_log();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v40;
          v60 = v31;
          v61 = 2112;
          v62 = v46;
          _os_log_error_impl(&dword_212728000, v7, OS_LOG_TYPE_ERROR, "%@ failed to find request ID for %@", buf, 0x16u);

        }
LABEL_36:

      }
      v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
    }
    while (v44);
  }

}

- (BOOL)isValidPayload:(id)a3 toPerson:(id)a4 invalidMessage:(id *)a5
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  int MyFriendsLink;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t i;
  int v28;
  __CFString *v29;
  void *v30;
  __CFString *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  __CFString *v41;
  id v42;
  void *v43;
  __CFString *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t j;
  uint64_t v54;
  void *v55;
  void *v56;
  int v57;
  id v58;
  id v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  id obj;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint64_t v74;
  __int16 v75;
  uint64_t v76;
  uint64_t v77;
  _BYTE v78[128];
  _QWORD v79[2];
  _QWORD v80[2];
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v76 = 0;
  v77 = 0;
  SFFakeFilesAndItemsArrayForURLs();
  v8 = 0;
  v9 = 0;
  v75 = 0;
  v74 = 0;
  SFContentTypes();
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = 0;
  v61 = v9;
  if ((objc_msgSend(v7, "supportsPasses") & 1) == 0)
  {
    v63 = v7;
    v58 = v6;
    v59 = v8;
    objc_msgSend(v8, "firstObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", *MEMORY[0x24BE90410]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "pathExtension");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v62, "allKeys");
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v81, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v71;
      v26 = 1;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v71 != v25)
            objc_enumerationMutation(obj);
          if (SFIsPass())
          {
            v28 = objc_msgSend(v63, "isUnknown");
            v29 = CFSTR("TRANSFER_TO_PERSON_NO_WALLET_TEXT");
            if (v28)
              v29 = CFSTR("TRANSFER_TO_DEVICE_NO_WALLET_TEXT");
            v30 = (void *)MEMORY[0x24BDD17C8];
            v31 = v29;
            SFLocalizedStringForKey();
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = (void *)MEMORY[0x24BDD17C8];
            SFLocalizedStringForKey();
            v34 = v12;
            v35 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v63, "displayName");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "stringWithFormat:", v35, v36);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "stringWithFormat:", v32, v37);
            *a5 = (id)objc_claimAutoreleasedReturnValue();

            v12 = v34;
            v26 = 0;
          }
        }
        v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v81, 16);
      }
      while (v24);
    }
    else
    {
      v26 = 1;
    }

    v6 = v58;
    goto LABEL_27;
  }
  if ((objc_msgSend(v7, "supportsFMF") & 1) != 0)
  {
    if (!objc_msgSend(v7, "supportsCredentials") || objc_msgSend(v7, "isUnknown"))
    {
      objc_msgSend(v9, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "scheme");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lowercaseString");
      v12 = (id)objc_claimAutoreleasedReturnValue();

      MyFriendsLink = SFIsCredential();
      if (MyFriendsLink)
      {
        objc_msgSend(v61, "firstObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        SFIsPasskeyCredentialLink();

        v15 = (void *)MEMORY[0x24BDD17C8];
        SFLocalizedStringForKey();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        SFLocalizedStringForKeyInStringsFileNamed();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringWithFormat:", v16, v17);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

        v79[0] = CFSTR("supportsCredentials");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v7, "supportsCredentials"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v79[1] = CFSTR("unknownPeer");
        v80[0] = v18;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v7, "isUnknown"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v80[1] = v19;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v80, v79, 2);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        SFMetricsLog();
LABEL_23:

        goto LABEL_24;
      }
      goto LABEL_24;
    }
    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    v12 = v6;
    v50 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v66, v78, 16);
    if (!v50)
    {
      v26 = 1;
      goto LABEL_28;
    }
    v51 = v50;
    v59 = v8;
    v63 = v7;
    v52 = *(_QWORD *)v67;
    while (2)
    {
      for (j = 0; j != v51; ++j)
      {
        if (*(_QWORD *)v67 != v52)
          objc_enumerationMutation(v12);
        v54 = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * j);
        objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v55, "isApplicationAvailableToOpenURL:error:", v54, 0))
        {

        }
        else
        {
          objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = objc_msgSend(v56, "isApplicationAvailableToOpenURL:includePrivateURLSchemes:error:", v54, 1, 0);

          if (v57)
          {
            objc_msgSend(v12, "count");
            SFLocalizedStringForKey();
            v26 = 0;
            *a5 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_27;
          }
        }
      }
      v51 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v66, v78, 16);
      v26 = 1;
      if (v51)
        continue;
      break;
    }
LABEL_27:
    v7 = v63;
    v8 = v59;
    goto LABEL_28;
  }
  objc_msgSend(v9, "firstObject");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "scheme");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "lowercaseString");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  MyFriendsLink = SFIsFindMyFriendsLink();
  if (MyFriendsLink)
  {
    v40 = objc_msgSend(v7, "isUnknown");
    v41 = CFSTR("TRANSFER_TO_PERSON_NO_FMF_TEXT");
    if (v40)
      v41 = CFSTR("TRANSFER_TO_DEVICE_NO_FMF_TEXT");
    v42 = v12;
    v43 = (void *)MEMORY[0x24BDD17C8];
    v44 = v41;
    SFLocalizedStringForKey();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = (void *)MEMORY[0x24BDD17C8];
    SFLocalizedStringForKey();
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "displayName");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "stringWithFormat:", v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "stringWithFormat:", v20, v48);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    v12 = v42;
    goto LABEL_23;
  }
LABEL_24:
  v26 = MyFriendsLink ^ 1;
LABEL_28:

  return v26 & 1;
}

- (BOOL)addURL:(id)a3 withAttachmentName:(id)a4 description:(id)a5 previewImage:(id)a6 itemIndex:(int)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  int64_t generatedPreviews;
  NSOperationQueue *v19;
  NSObject *v20;
  NSOperationQueue *operationQueue;
  void *v23;
  _QWORD v24[4];
  NSObject *v25;
  id v26;
  id v27;
  SFAirDropActivityViewController *v28;
  int v29;
  _QWORD v30[4];
  NSObject *v31;
  id v32;
  SFAirDropActivityViewController *v33;
  int v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  __int16 v41;
  id v42;
  __int16 v43;
  void *v44;
  uint64_t v45;
  CGSize v46;

  v45 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  airdrop_log();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v15, "size");
    NSStringFromCGSize(v46);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v36 = v12;
    v37 = 2112;
    v38 = v13;
    v39 = 2112;
    v40 = v14;
    v41 = 2112;
    v42 = v15;
    v43 = 2112;
    v44 = v23;
    _os_log_debug_impl(&dword_212728000, v16, OS_LOG_TYPE_DEBUG, "addURL:[%@] withAttachmentName:[%@] description:[%@] previewImage:[%@]-size:[%@]", buf, 0x34u);

  }
  objc_msgSend(v12, "scheme");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    self->_itemsReady = 0;
    if (v15 || (generatedPreviews = self->_generatedPreviews, generatedPreviews > 2))
    {
      operationQueue = self->_operationQueue;
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = __96__SFAirDropActivityViewController_addURL_withAttachmentName_description_previewImage_itemIndex___block_invoke_332;
      v24[3] = &unk_24CE0F8B0;
      v25 = v12;
      v26 = v14;
      v27 = v15;
      v28 = self;
      v29 = a7;
      -[NSOperationQueue addOperationWithBlock:](operationQueue, "addOperationWithBlock:", v24);

      v20 = v25;
    }
    else
    {
      self->_generatedPreviews = generatedPreviews + 1;
      v19 = self->_operationQueue;
      v30[0] = MEMORY[0x24BDAC760];
      v30[1] = 3221225472;
      v30[2] = __96__SFAirDropActivityViewController_addURL_withAttachmentName_description_previewImage_itemIndex___block_invoke;
      v30[3] = &unk_24CE0F888;
      v31 = v12;
      v32 = v14;
      v33 = self;
      v34 = a7;
      -[NSOperationQueue addOperationWithBlock:](v19, "addOperationWithBlock:", v30);

      v20 = v31;
    }
  }
  else
  {
    airdrop_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[SFAirDropActivityViewController addURL:withAttachmentName:description:previewImage:itemIndex:].cold.1();
  }

  return 1;
}

void __96__SFAirDropActivityViewController_addURL_withAttachmentName_description_previewImage_itemIndex___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  __CFString *v4;
  const __CFString *PreferredIdentifierForTag;
  const __CFString *v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  if (objc_msgSend(*(id *)(a1 + 32), "isFileURL"))
  {
    objc_msgSend(*(id *)(a1 + 32), "path");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (v2)
    {
      objc_msgSend(v2, "pathExtension");
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      PreferredIdentifierForTag = UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x24BDC1658], v4, 0);
      if (PreferredIdentifierForTag)
      {
        v6 = PreferredIdentifierForTag;
        if (UTTypeConformsTo(PreferredIdentifierForTag, (CFStringRef)*MEMORY[0x24BDC17A0]))
        {
          objc_msgSend(MEMORY[0x24BEBD640], "imageWithContentsOfFile:", v3);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v7 = 0;
        }
        CFRelease(v6);
      }
      else
      {
        airdrop_log();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          __96__SFAirDropActivityViewController_addURL_withAttachmentName_description_previewImage_itemIndex___block_invoke_cold_1();

        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }
  v9 = +[SFAirDropPayload newPayloadWithURL:description:previewImage:identifier:](SFAirDropPayload, "newPayloadWithURL:description:previewImage:identifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v7, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 992));
  v10 = *(id *)(*(_QWORD *)(a1 + 48) + 1408);
  objc_sync_enter(v10);
  v11 = *(void **)(*(_QWORD *)(a1 + 48) + 1408);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 56));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, v12);

  objc_sync_exit(v10);
}

void __96__SFAirDropActivityViewController_addURL_withAttachmentName_description_previewImage_itemIndex___block_invoke_332(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  v5 = +[SFAirDropPayload newPayloadWithURL:description:previewImage:identifier:](SFAirDropPayload, "newPayloadWithURL:description:previewImage:identifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 56) + 992));
  v2 = *(id *)(*(_QWORD *)(a1 + 56) + 1408);
  objc_sync_enter(v2);
  v3 = *(void **)(*(_QWORD *)(a1 + 56) + 1408);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 64));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, v4);

  objc_sync_exit(v2);
}

- (BOOL)addImage:(id)a3 withAttachmentName:(id)a4 description:(id)a5 previewImage:(id)a6 itemIndex:(int)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  NSString *sessionID;
  int64_t v19;
  void *v20;
  void *SuggestedFilename;
  void *v22;
  void *v23;
  NSOperationQueue *operationQueue;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  id v37;
  SFAirDropActivityViewController *v38;
  int v39;
  uint8_t buf[4];
  id v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  __int16 v48;
  id v49;
  __int16 v50;
  void *v51;
  uint64_t v52;
  CGSize v53;
  CGSize v54;

  v52 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  airdrop_log();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v12, "size");
    NSStringFromCGSize(v53);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "size");
    NSStringFromCGSize(v54);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413570;
    v41 = v12;
    v42 = 2112;
    v43 = v30;
    v44 = 2112;
    v45 = v13;
    v46 = 2112;
    v47 = v14;
    v48 = 2112;
    v49 = v15;
    v50 = 2112;
    v51 = v31;
    _os_log_debug_impl(&dword_212728000, v16, OS_LOG_TYPE_DEBUG, "addImage:[%@]-size:[%@] withAttachmentName:[%@] description:[%@] previewImage:[%@]-size:[%@]", buf, 0x3Eu);

  }
  v32 = v13;

  self->_itemsReady = 0;
  if (!v15)
    v15 = v12;
  v17 = (void *)MEMORY[0x24BDD17C8];
  sessionID = self->_sessionID;
  v19 = self->_attachmentCount + 1;
  self->_attachmentCount = v19;
  objc_msgSend(v17, "stringWithFormat:", CFSTR("IMG_%@-%ld"), sessionID, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  SuggestedFilename = (void *)_UTTypeCreateSuggestedFilename();
  NSTemporaryDirectory();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringByAppendingPathComponent:", SuggestedFilename);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  operationQueue = self->_operationQueue;
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __98__SFAirDropActivityViewController_addImage_withAttachmentName_description_previewImage_itemIndex___block_invoke;
  v33[3] = &unk_24CE0F8D8;
  v34 = v12;
  v35 = v23;
  v36 = v14;
  v37 = v15;
  v38 = self;
  v39 = a7;
  v25 = v15;
  v26 = v14;
  v27 = v23;
  v28 = v12;
  -[NSOperationQueue addOperationWithBlock:](operationQueue, "addOperationWithBlock:", v33);

  return 1;
}

void __98__SFAirDropActivityViewController_addImage_withAttachmentName_description_previewImage_itemIndex___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  UIImageJPEGRepresentation(*(UIImage **)(a1 + 32), 1.0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "writeToFile:atomically:", *(_QWORD *)(a1 + 40), 1);
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[SFAirDropPayload newPayloadWithURL:description:previewImage:identifier:](SFAirDropPayload, "newPayloadWithURL:description:previewImage:identifier:", v2, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(*(_QWORD *)(a1 + 64) + 992));

  v4 = *(id *)(*(_QWORD *)(a1 + 64) + 1408);
  objc_sync_enter(v4);
  v5 = *(void **)(*(_QWORD *)(a1 + 64) + 1408);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 72));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v3, v6);

  objc_sync_exit(v4);
}

- (BOOL)addData:(id)a3 ofType:(id)a4 withAttachmentName:(id)a5 description:(id)a6 previewImage:(id)a7 itemIndex:(int)a8
{
  uint64_t v8;
  id v14;
  __CFString *v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  id v20;
  void *v21;
  id v22;
  BOOL v23;
  uint64_t v25;
  void *v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  __CFString *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  __int16 v39;
  void *v40;
  uint64_t v41;
  CGSize v42;

  v8 = *(_QWORD *)&a8;
  v41 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = (__CFString *)a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  airdrop_log();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    v25 = objc_msgSend(v14, "length");
    objc_msgSend(v18, "size");
    NSStringFromCGSize(v42);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219522;
    v28 = v14;
    v29 = 2048;
    v30 = v25;
    v31 = 2112;
    v32 = v15;
    v33 = 2112;
    v34 = v16;
    v35 = 2112;
    v36 = v17;
    v37 = 2112;
    v38 = v18;
    v39 = 2112;
    v40 = v26;
    _os_log_debug_impl(&dword_212728000, v19, OS_LOG_TYPE_DEBUG, "addData:[%p]-length:[%lu] ofType:[%@] withAttachmentName:[%@] description:[%@] previewImage:[%@]-size:[%@]", buf, 0x48u);

  }
  self->_itemsReady = 0;
  v20 = v18;
  v21 = v20;
  if (!v20)
  {
    if (UTTypeConformsTo(v15, (CFStringRef)*MEMORY[0x24BDC17A0]))
    {
      objc_msgSend(MEMORY[0x24BEBD640], "imageWithData:", v14);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = 0;
    }
  }
  if (v16)
    v22 = v16;
  else
    v22 = v17;
  v23 = -[SFAirDropActivityViewController createURLPayloadForData:ofType:withAttachmentName:description:previewImage:itemIndex:completion:](self, "createURLPayloadForData:ofType:withAttachmentName:description:previewImage:itemIndex:completion:", v14, v15, v22, v17, v21, v8, 0);

  return v23;
}

- (BOOL)createURLPayloadForData:(id)a3 ofType:(id)a4 withAttachmentName:(id)a5 description:(id)a6 previewImage:(id)a7 itemIndex:(int)a8 completion:(id)a9
{
  id v14;
  const __CFString *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *SuggestedFilename;
  __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int64_t v26;
  __CFString *v27;
  CFStringRef v28;
  __CFString *v29;
  void *v30;
  NSString *sessionID;
  int64_t v32;
  void *v33;
  int64_t v34;
  void *v35;
  void *v36;
  NSOperationQueue *operationQueue;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  __CFString *v45;
  void *v46;
  _QWORD v47[4];
  id v48;
  id v49;
  id v50;
  id v51;
  SFAirDropActivityViewController *v52;
  id v53;
  int v54;

  v14 = a3;
  v15 = (const __CFString *)a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a9;
  v46 = v17;
  v45 = (__CFString *)v15;
  if (objc_msgSend(v16, "length"))
  {
    SuggestedFilename = (void *)_UTTypeCreateSuggestedFilename();
    v21 = (__CFString *)objc_msgSend(SuggestedFilename, "mutableCopy");

    -[__CFString replaceOccurrencesOfString:withString:options:range:](v21, "replaceOccurrencesOfString:withString:options:range:", CFSTR("/"), CFSTR("-"), 0, 0, -[__CFString length](v21, "length"));
    -[__CFString replaceOccurrencesOfString:withString:options:range:](v21, "replaceOccurrencesOfString:withString:options:range:", CFSTR(":"), CFSTR("-"), 0, 0, -[__CFString length](v21, "length"));
    if (self->_attachmentCount)
    {
      v22 = v14;
      -[__CFString pathExtension](v21, "pathExtension");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v23, "length"))
      {
        -[__CFString stringByDeletingPathExtension](v21, "stringByDeletingPathExtension");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)MEMORY[0x24BDD17C8];
        v26 = self->_attachmentCount + 1;
        self->_attachmentCount = v26;
        objc_msgSend(v25, "stringWithFormat:", CFSTR("%@-%ld.%@"), v24, v26, v23);
        v27 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v33 = (void *)MEMORY[0x24BDD17C8];
        v34 = self->_attachmentCount + 1;
        self->_attachmentCount = v34;
        objc_msgSend(v33, "stringWithFormat:", CFSTR("%@-%ld.%@"), v21, v34, v23);
        v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      v22 = v14;
      v27 = v21;
      ++self->_attachmentCount;
    }
  }
  else
  {
    v22 = v14;
    v28 = UTTypeCopyPreferredTagWithClass(v15, (CFStringRef)*MEMORY[0x24BDC1658]);
    if (v28)
      v21 = (__CFString *)v28;
    else
      v21 = CFSTR("data");
    v29 = (__CFString *)UTTypeCopyDescription(v15);
    v30 = (void *)MEMORY[0x24BDD17C8];
    sessionID = self->_sessionID;
    v32 = self->_attachmentCount + 1;
    self->_attachmentCount = v32;
    objc_msgSend(v30, "stringWithFormat:", CFSTR("%@-%@-%ld.%@"), v29, sessionID, v32, v21);
    v27 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  NSTemporaryDirectory();
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "stringByAppendingPathComponent:", v27);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  operationQueue = self->_operationQueue;
  v47[0] = MEMORY[0x24BDAC760];
  v47[1] = 3221225472;
  v47[2] = __131__SFAirDropActivityViewController_createURLPayloadForData_ofType_withAttachmentName_description_previewImage_itemIndex_completion___block_invoke;
  v47[3] = &unk_24CE0F900;
  v48 = v22;
  v49 = v36;
  v50 = v46;
  v51 = v18;
  v54 = a8;
  v52 = self;
  v53 = v19;
  v38 = v19;
  v39 = v18;
  v40 = v46;
  v41 = v36;
  v42 = v22;
  -[NSOperationQueue addOperationWithBlock:](operationQueue, "addOperationWithBlock:", v47);

  return 1;
}

void __131__SFAirDropActivityViewController_createURLPayloadForData_ofType_withAttachmentName_description_previewImage_itemIndex_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "writeToFile:atomically:", *(_QWORD *)(a1 + 40), 1);
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[SFAirDropPayload newPayloadWithURL:description:previewImage:identifier:](SFAirDropPayload, "newPayloadWithURL:description:previewImage:identifier:", v2, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(*(_QWORD *)(a1 + 64) + 992));

  v3 = *(id *)(*(_QWORD *)(a1 + 64) + 1408);
  objc_sync_enter(v3);
  v4 = *(void **)(*(_QWORD *)(a1 + 64) + 1408);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 80));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, v5);

  objc_sync_exit(v3);
  v6 = *(_QWORD *)(a1 + 72);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);

}

- (BOOL)addString:(id)a3 withAttachmentName:(id)a4 description:(id)a5 previewImage:(id)a6 itemIndex:(int)a7
{
  uint64_t v7;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  BOOL v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  uint64_t v34;
  CGSize v35;

  v7 = *(_QWORD *)&a7;
  v34 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  airdrop_log();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v16, "size");
    NSStringFromCGSize(v35);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v25 = v13;
    v26 = 2112;
    v27 = v14;
    v28 = 2112;
    v29 = v15;
    v30 = 2112;
    v31 = v16;
    v32 = 2112;
    v33 = v23;
    _os_log_debug_impl(&dword_212728000, v17, OS_LOG_TYPE_DEBUG, "addString:[%@] withAttachmentName:[%@] description:[%@] previewImage:[%@]-size:[%@]", buf, 0x34u);

  }
  if (sIgnoreStrings)
  {
    v18 = 1;
  }
  else
  {
    objc_msgSend(v13, "dataUsingEncoding:", 4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      airdrop_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v25 = v21;
        _os_log_impl(&dword_212728000, v20, OS_LOG_TYPE_DEFAULT, "%@ discarding description", buf, 0xCu);

      }
    }
    v18 = -[SFAirDropActivityViewController createURLPayloadForData:ofType:withAttachmentName:description:previewImage:itemIndex:completion:](self, "createURLPayloadForData:ofType:withAttachmentName:description:previewImage:itemIndex:completion:", v19, *MEMORY[0x24BDC1830], v14, v15, v16, v7, &__block_literal_global_6);

  }
  return v18;
}

uint64_t __99__SFAirDropActivityViewController_addString_withAttachmentName_description_previewImage_itemIndex___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setWasString:", 1);
}

- (BOOL)addAttributedString:(id)a3 withAttachmentName:(id)a4 description:(id)a5 previewImage:(id)a6 itemIndex:(int)a7
{
  uint64_t v7;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  BOOL v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  void *v39;
  uint64_t v40;
  CGSize v41;

  v7 = *(_QWORD *)&a7;
  v40 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  airdrop_log();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v15, "size");
    NSStringFromCGSize(v41);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v31 = v12;
    v32 = 2112;
    v33 = v13;
    v34 = 2112;
    v35 = v14;
    v36 = 2112;
    v37 = v15;
    v38 = 2112;
    v39 = v26;
    _os_log_debug_impl(&dword_212728000, v16, OS_LOG_TYPE_DEBUG, "addAttributedString:[%@] withAttachmentName:[%@] description:[%@] previewImage:[%@]-size:[%@]", buf, 0x34u);

  }
  if (sIgnoreStrings)
  {
    v17 = 1;
  }
  else
  {
    v18 = objc_msgSend(v12, "length");
    v28 = *MEMORY[0x24BEBB348];
    v29 = *MEMORY[0x24BEBB370];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    objc_msgSend(v12, "dataFromRange:documentAttributes:error:", 0, v18, v19, &v27);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v27;

    if (v21)
    {
      airdrop_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[SFAirDropActivityViewController addAttributedString:withAttachmentName:description:previewImage:itemIndex:].cold.1();

      objc_msgSend(v12, "string");
      v23 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v20, 4);
    }
    v24 = (void *)v23;
    v17 = -[SFAirDropActivityViewController addString:withAttachmentName:description:previewImage:itemIndex:](self, "addString:withAttachmentName:description:previewImage:itemIndex:", v23, v13, v14, v15, v7);

  }
  return v17;
}

- (void)handleLivePhotoItemProvider:(id)a3 withAttachmentName:(id)a4 description:(id)a5 previewImage:(id)a6 itemIndex:(int)a7
{
  id v11;
  id v12;
  id v13;
  dispatch_semaphore_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  dispatch_time_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSOperationQueue *operationQueue;
  id v26;
  id v27;
  id v28;
  _QWORD v30[4];
  id v31;
  id v32;
  SFAirDropActivityViewController *v33;
  uint64_t *v34;
  int v35;
  _QWORD v36[4];
  NSObject *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;
  _QWORD v46[3];

  v46[1] = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v28 = a4;
  v12 = a5;
  v13 = a6;
  v14 = dispatch_semaphore_create(0);
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__0;
  v43 = __Block_byref_object_dispose__0;
  v44 = 0;
  v45 = *MEMORY[0x24BDD0E50];
  v46[0] = *MEMORY[0x24BDD0E48];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v46, &v45, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x24BDAC760];
  v17 = *MEMORY[0x24BDC17D8];
  v36[0] = MEMORY[0x24BDAC760];
  v36[1] = 3221225472;
  v36[2] = __117__SFAirDropActivityViewController_handleLivePhotoItemProvider_withAttachmentName_description_previewImage_itemIndex___block_invoke;
  v36[3] = &unk_24CE0F968;
  v38 = &v39;
  v18 = v14;
  v37 = v18;
  objc_msgSend(v11, "loadItemForTypeIdentifier:options:completionHandler:", v17, v15, v36);
  v19 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v18, v19);
  v20 = v13;
  v21 = v20;
  if (!v20)
  {
    v22 = (void *)MEMORY[0x24BEBD640];
    objc_msgSend((id)v40[5], "imageURL");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "path");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "imageWithContentsOfFile:", v24);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  operationQueue = self->_operationQueue;
  v30[0] = v16;
  v30[1] = 3221225472;
  v30[2] = __117__SFAirDropActivityViewController_handleLivePhotoItemProvider_withAttachmentName_description_previewImage_itemIndex___block_invoke_2;
  v30[3] = &unk_24CE0F990;
  v34 = &v39;
  v26 = v12;
  v31 = v26;
  v27 = v21;
  v32 = v27;
  v33 = self;
  v35 = a7;
  -[NSOperationQueue addOperationWithBlock:](operationQueue, "addOperationWithBlock:", v30);

  _Block_object_dispose(&v39, 8);
}

void __117__SFAirDropActivityViewController_handleLivePhotoItemProvider_withAttachmentName_description_previewImage_itemIndex___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  if (v4)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __117__SFAirDropActivityViewController_handleLivePhotoItemProvider_withAttachmentName_description_previewImage_itemIndex___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2050000000;
  v2 = (void *)getPLPhotoLibraryClass_softClass;
  v17 = getPLPhotoLibraryClass_softClass;
  if (!getPLPhotoLibraryClass_softClass)
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __getPLPhotoLibraryClass_block_invoke;
    v13[3] = &unk_24CE0FA08;
    v13[4] = &v14;
    __getPLPhotoLibraryClass_block_invoke((uint64_t)v13);
    v2 = (void *)v15[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v14, 8);
  objc_msgSend(v3, "photoOutboundSharingTmpDirectoryURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "videoURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "imageURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SFCreateLivePhotoBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = +[SFAirDropPayload newPayloadWithURL:description:previewImage:identifier:](SFAirDropPayload, "newPayloadWithURL:description:previewImage:identifier:", v8, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 992));
  v10 = *(id *)(*(_QWORD *)(a1 + 48) + 1408);
  objc_sync_enter(v10);
  v11 = *(void **)(*(_QWORD *)(a1 + 48) + 1408);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 64));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, v12);

  objc_sync_exit(v10);
}

- (void)handleImageItemProvider:(id)a3 withAttachmentName:(id)a4 description:(id)a5 previewImage:(id)a6 itemIndex:(int)a7
{
  uint64_t v7;
  id v12;
  id v13;
  id v14;
  id v15;
  dispatch_semaphore_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  dispatch_time_t v20;
  _QWORD v21[4];
  NSObject *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  _QWORD v31[2];

  v7 = *(_QWORD *)&a7;
  v31[1] = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = dispatch_semaphore_create(0);
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__0;
  v28 = __Block_byref_object_dispose__0;
  v29 = 0;
  v30 = *MEMORY[0x24BDD0E50];
  v31[0] = *MEMORY[0x24BDD0E48];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *MEMORY[0x24BDC17A0];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __113__SFAirDropActivityViewController_handleImageItemProvider_withAttachmentName_description_previewImage_itemIndex___block_invoke;
  v21[3] = &unk_24CE0F9B8;
  v23 = &v24;
  v19 = v16;
  v22 = v19;
  objc_msgSend(v12, "loadItemForTypeIdentifier:options:completionHandler:", v18, v17, v21);
  v20 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v19, v20);
  -[SFAirDropActivityViewController addImage:withAttachmentName:description:previewImage:itemIndex:](self, "addImage:withAttachmentName:description:previewImage:itemIndex:", v25[5], v13, v14, v15, v7);

  _Block_object_dispose(&v24, 8);
}

void __113__SFAirDropActivityViewController_handleImageItemProvider_withAttachmentName_description_previewImage_itemIndex___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  if (v4)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)handleOtherItemProvider:(id)a3 withDataType:(id)a4 attachmentName:(id)a5 description:(id)a6 previewImage:(id)a7
{
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  dispatch_semaphore_t v24;
  void *v25;
  NSObject *v26;
  dispatch_time_t v27;
  char isKindOfClass;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  BOOL v33;
  unsigned __int8 v34;
  id v35;
  unsigned __int8 v36;
  id v37;
  char v38;
  id v39;
  char v40;
  id v41;
  id v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  id v47;
  _QWORD v48[4];
  NSObject *v49;
  uint64_t *v50;
  uint64_t v51;
  id *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint64_t v61;
  uint64_t v62;
  _BYTE v63[128];
  _QWORD v64[7];

  v64[5] = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v45 = a5;
  v46 = a6;
  v47 = a7;
  v14 = *MEMORY[0x24BDC17A0];
  v64[0] = *MEMORY[0x24BDC1890];
  v64[1] = v14;
  v15 = *MEMORY[0x24BDC1830];
  v64[2] = *MEMORY[0x24BDC1850];
  v64[3] = v15;
  v64[4] = *MEMORY[0x24BDC1748];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v64, 5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v13)
  {
    objc_msgSend(v16, "arrayByAddingObject:", v13);
    v18 = objc_claimAutoreleasedReturnValue();

    v17 = (void *)v18;
  }
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v19 = v17;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
  if (!v20)
    goto LABEL_36;
  v21 = *(_QWORD *)v58;
  while (2)
  {
    for (i = 0; i != v20; ++i)
    {
      if (*(_QWORD *)v58 != v21)
        objc_enumerationMutation(v19);
      v23 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * i);
      if (objc_msgSend(v12, "hasItemConformingToTypeIdentifier:", v23))
      {
        v24 = dispatch_semaphore_create(0);
        v51 = 0;
        v52 = (id *)&v51;
        v53 = 0x3032000000;
        v54 = __Block_byref_object_copy__0;
        v55 = __Block_byref_object_dispose__0;
        v56 = 0;
        v61 = *MEMORY[0x24BDD0E50];
        v62 = *MEMORY[0x24BDD0E48];
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v48[0] = MEMORY[0x24BDAC760];
        v48[1] = 3221225472;
        v48[2] = __112__SFAirDropActivityViewController_handleOtherItemProvider_withDataType_attachmentName_description_previewImage___block_invoke;
        v48[3] = &unk_24CE0F9E0;
        v50 = &v51;
        v26 = v24;
        v49 = v26;
        objc_msgSend(v12, "loadItemForTypeIdentifier:options:completionHandler:", v23, v25, v48);
        v27 = dispatch_time(0, 5000000000);
        dispatch_semaphore_wait(v26, v27);
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        if ((isKindOfClass & 1) != 0)
        {
          v29 = (void *)MEMORY[0x24BDBCF48];
          v30 = v52[5];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
LABEL_22:
            objc_opt_class();
            v34 = objc_opt_isKindOfClass();
            v35 = v52[5];
            if ((v34 & (sIgnoreStrings == 0)) == 1)
            {
              ++self->_sharedItemsCount;
              -[SFAirDropActivityViewController addString:withAttachmentName:description:previewImage:itemIndex:](self, "addString:withAttachmentName:description:previewImage:itemIndex:", v35, v45, v46, v47);
            }
            else
            {
              objc_opt_class();
              v36 = objc_opt_isKindOfClass();
              v37 = v52[5];
              if ((v36 & (sIgnoreStrings == 0)) == 1)
              {
                ++self->_sharedItemsCount;
                -[SFAirDropActivityViewController addAttributedString:withAttachmentName:description:previewImage:itemIndex:](self, "addAttributedString:withAttachmentName:description:previewImage:itemIndex:", v37, v45, v46, v47);
              }
              else
              {
                objc_opt_class();
                v38 = objc_opt_isKindOfClass();
                v39 = v52[5];
                if ((v38 & 1) != 0)
                {
                  ++self->_sharedItemsCount;
                  -[SFAirDropActivityViewController addURL:withAttachmentName:description:previewImage:itemIndex:](self, "addURL:withAttachmentName:description:previewImage:itemIndex:", v39, v45, v46, v47);
                }
                else
                {
                  objc_opt_class();
                  v40 = objc_opt_isKindOfClass();
                  v41 = v52[5];
                  if ((v40 & 1) != 0)
                  {
                    ++self->_sharedItemsCount;
                    -[SFAirDropActivityViewController addImage:withAttachmentName:description:previewImage:itemIndex:](self, "addImage:withAttachmentName:description:previewImage:itemIndex:", v41, v45, v46, v47);
                  }
                  else
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      if (v13)
                      {
                        v42 = v13;
                      }
                      else
                      {
                        objc_msgSend(v12, "registeredTypeIdentifiers");
                        v43 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v43, "firstObject");
                        v42 = (id)objc_claimAutoreleasedReturnValue();

                      }
                      v44 = v52[5];
                      ++self->_sharedItemsCount;
                      -[SFAirDropActivityViewController addData:ofType:withAttachmentName:description:previewImage:itemIndex:](self, "addData:ofType:withAttachmentName:description:previewImage:itemIndex:", v44, v42, v45, v46, v47);

                    }
                  }
                }
              }
            }

            _Block_object_dispose(&v51, 8);
            goto LABEL_36;
          }
          v29 = (void *)MEMORY[0x24BDBCF48];
          objc_msgSend(v52[5], "string");
          v30 = (id)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v29, "URLWithString:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if ((isKindOfClass & 1) == 0)

        if (v31)
        {
          objc_msgSend(v31, "scheme");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = v32 == 0;

          if (!v33)
            objc_storeStrong(v52 + 5, v31);
        }

        goto LABEL_22;
      }
    }
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
    if (v20)
      continue;
    break;
  }
LABEL_36:

}

void __112__SFAirDropActivityViewController_handleOtherItemProvider_withDataType_attachmentName_description_previewImage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  if (v7)
  {
    airdrop_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "localizedDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_212728000, v8, OS_LOG_TYPE_DEFAULT, "Failed to load item for type identifier with error %@", (uint8_t *)&v10, 0xCu);

    }
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (BOOL)addItemProvider:(id)a3 withDataType:(id)a4 attachmentName:(id)a5 description:(id)a6 previewImage:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v19;
  int v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;
  CGSize v31;

  v30 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = a4;
  airdrop_log();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v15, "size");
    NSStringFromCGSize(v31);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138413314;
    v21 = v12;
    v22 = 2112;
    v23 = v13;
    v24 = 2112;
    v25 = v14;
    v26 = 2112;
    v27 = v15;
    v28 = 2112;
    v29 = v19;
    _os_log_debug_impl(&dword_212728000, v17, OS_LOG_TYPE_DEBUG, "addItemProvider:[%@] withAttachmentName:[%@] description:[%@] previewImage:[%@]-size:[%@]", (uint8_t *)&v20, 0x34u);

  }
  self->_itemsReady = 0;
  -[SFAirDropActivityViewController handleOtherItemProvider:withDataType:attachmentName:description:previewImage:](self, "handleOtherItemProvider:withDataType:attachmentName:description:previewImage:", v12, v16, v13, v14, v15);

  return 1;
}

- (BOOL)addItemProvider:(id)a3 withAttachmentName:(id)a4 description:(id)a5 previewImage:(id)a6
{
  return -[SFAirDropActivityViewController addItemProvider:withDataType:attachmentName:description:previewImage:](self, "addItemProvider:withDataType:attachmentName:description:previewImage:", a3, 0, a4, a5, a6);
}

- (void)generateSpecialPreviewPhotoForRequestID:(int64_t)a3
{
  void *v4;
  void *v5;
  NSMutableOrderedSet *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  const __CFString *v20;
  uint64_t j;
  __CFString *v22;
  __CFString *PreferredIdentifierForTag;
  void *v24;
  double v25;
  _BOOL4 v26;
  NSMutableDictionary *sharedItemsRequestIDToPreviewPhoto;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = self->_cachedSharedItems;
  objc_sync_enter(v6);
  v7 = (void *)-[NSMutableOrderedSet copy](self->_cachedSharedItems, "copy");
  objc_sync_exit(v6);

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v35 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        if (objc_msgSend(v12, "identifer") == a3)
        {
          objc_msgSend(v12, "URL");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            objc_msgSend(v12, "previewImage");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = v14 == 0;

            if (!v15)
            {
              objc_msgSend(v12, "previewImage");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "addObject:", v16);

              objc_msgSend(v12, "URL");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "addObject:", v17);

            }
          }
        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v9);
  }

  if ((unint64_t)objc_msgSend(v4, "count") >= 2)
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    obj = v5;
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v31;
      v20 = (const __CFString *)*MEMORY[0x24BDC1658];
      while (2)
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v31 != v19)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * j), "pathExtension");
          v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
          PreferredIdentifierForTag = (__CFString *)UTTypeCreatePreferredIdentifierForTag(v20, v22, 0);
          if ((SFIsImage() & 1) == 0 && (SFIsVideo() & 1) == 0 && (SFIsLivePhotos() & 1) == 0)
          {

            goto LABEL_25;
          }

        }
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
        if (v18)
          continue;
        break;
      }
    }

    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "scale");
    v26 = v25 == 2.0;

    SFImageStackFromImages(v4, dbl_2127A2B10[v26]);
    obj = (id)objc_claimAutoreleasedReturnValue();
    sharedItemsRequestIDToPreviewPhoto = self->_sharedItemsRequestIDToPreviewPhoto;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](sharedItemsRequestIDToPreviewPhoto, "setObject:forKeyedSubscript:", obj, v22);
LABEL_25:

  }
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  UIEdgeInsets result;

  v7 = a4;
  v8 = a3;
  objc_msgSend(v7, "itemSize");
  v10 = v9;
  objc_msgSend(v7, "minimumLineSpacing");
  v12 = v11;

  v13 = objc_msgSend(v8, "numberOfItemsInSection:", a5);
  v14 = v10 * (double)v13;
  v15 = v12 * (double)(v13 - 1);
  objc_msgSend(v8, "bounds");
  v17 = v16;

  v18 = 0.0;
  if ((v17 - v14 - v15) * 0.5 >= 0.0)
    v18 = (v17 - v14 - v15) * 0.5;
  v19 = 0.0;
  v20 = 0.0;
  v21 = 0.0;
  result.right = v21;
  result.bottom = v20;
  result.left = v18;
  result.top = v19;
  return result;
}

- (void)handleOperationCallback:(__SFOperation *)a3 event:(int64_t)a4 withResults:(id)a5
{
  id v6;
  NSObject *v7;
  _BOOL4 v8;

  v6 = a5;
  airdrop_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
  if (a4 == 10)
  {
    if (v8)
      -[SFAirDropActivityViewController handleOperationCallback:event:withResults:].cold.1(v6, v7);
  }
  else if (v8)
  {
    -[SFAirDropActivityViewController handleOperationCallback:event:withResults:].cold.2(a4, (uint64_t)v6, v7);
  }

}

- (void)cleanupWithSelectedActivityType:(id)a3
{
  id v5;
  NSObject *v6;

  v5 = a3;
  airdrop_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[SFAirDropActivityViewController cleanupWithSelectedActivityType:].cold.1(a2, (uint64_t)v5, v6);

  if (!self->_logger)
  {
    self->_logger = (__SFOperation *)SFOperationCreate();
    SFOperationSetClient();
    SFOperationSetDispatchQueue();
    SFOperationSetProperty();
    SFOperationSetProperty();
    SFOperationResume();
  }

}

- (void)_startTelemetry
{
  NSMapTable *v3;
  NSMapTable *realNameToFirstSeenTimestamp;

  self->_peopleStartTimestamp = mach_continuous_time();
  objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
  v3 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
  realNameToFirstSeenTimestamp = self->_realNameToFirstSeenTimestamp;
  self->_realNameToFirstSeenTimestamp = v3;

}

- (void)_stopTelemetry
{
  NSMapTable *realNameToFirstSeenTimestamp;

  realNameToFirstSeenTimestamp = self->_realNameToFirstSeenTimestamp;
  self->_realNameToFirstSeenTimestamp = 0;

}

- (void)_collectTelemetryForPeople:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  NSMapTable *realNameToFirstSeenTimestamp;
  void *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14 = mach_continuous_time();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "realName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          -[NSMapTable objectForKey:](self->_realNameToFirstSeenTimestamp, "objectForKey:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v11)
          {
            realNameToFirstSeenTimestamp = self->_realNameToFirstSeenTimestamp;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v14);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMapTable setObject:forKey:](realNameToFirstSeenTimestamp, "setObject:forKey:", v13, v10);

          }
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

}

- (void)_emitTelemetryForPerson:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  unint64_t peopleStartTimestamp;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  int v15;
  unint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "realName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NSMapTable objectForKey:](self->_realNameToFirstSeenTimestamp, "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      airdrop_log();
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = os_signpost_id_make_with_pointer(v7, v4);

      airdrop_log();
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
      {
        peopleStartTimestamp = self->_peopleStartTimestamp;
        v15 = 134349056;
        v16 = peopleStartTimestamp;
        _os_signpost_emit_with_name_impl(&dword_212728000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "TimeToDiscoverPerson", " enableTelemetry=YES  %{public, signpost.description:begin_time}llu", (uint8_t *)&v15, 0xCu);
      }

      airdrop_log();
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
      {
        v14 = objc_msgSend(v6, "unsignedLongLongValue");
        v15 = 134349056;
        v16 = v14;
        _os_signpost_emit_with_name_impl(&dword_212728000, v13, OS_SIGNPOST_INTERVAL_END, v8, "TimeToDiscoverPerson", "%{public, signpost.description:end_time}llu", (uint8_t *)&v15, 0xCu);
      }

    }
  }

}

- ($115C4C562B26FF47E01F9F4EA65B5887)sendingApplicationAuditToken
{
  __int128 v3;

  v3 = *(_OWORD *)self[47].var0;
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self[46].var0[4];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (SFAirDropActivityViewControllerDelegate)delegate
{
  return (SFAirDropActivityViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)sharedItemsAvailable
{
  return self->_sharedItemsAvailable;
}

- (BOOL)otherActivityViewPresented
{
  return self->_otherActivityViewPresented;
}

- (BOOL)darkStyleOnLegacyApp
{
  return self->_darkStyleOnLegacyApp;
}

- (void)setDarkStyleOnLegacyApp:(BOOL)a3
{
  self->_darkStyleOnLegacyApp = a3;
}

- (BOOL)multipleRows
{
  return self->_multipleRows;
}

- (void)setMultipleRows:(BOOL)a3
{
  self->_multipleRows = a3;
}

- (NSArray)urlsBeingShared
{
  return self->_urlsBeingShared;
}

- (void)setUrlsBeingShared:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1440);
}

- (NSArray)photosAssetIDs
{
  return self->_photosAssetIDs;
}

- (void)setPhotosAssetIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1448);
}

- (NSString)overriddenTitleText
{
  return self->_overriddenTitleText;
}

- (void)setOverriddenTitleText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1456);
}

- (NSString)overriddenNoWiFIBTText
{
  return self->_overriddenNoWiFIBTText;
}

- (void)setOverriddenNoWiFIBTText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1464);
}

- (NSString)overriddenNoAWDLText
{
  return self->_overriddenNoAWDLText;
}

- (void)setOverriddenNoAWDLText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1472);
}

- (NSString)overriddenInstructionsText
{
  return self->_overriddenInstructionsText;
}

- (void)setOverriddenInstructionsText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1480);
}

- (BOOL)manuallyManageBrowsing
{
  return self->_manuallyManageBrowsing;
}

- (void)setManuallyManageBrowsing:(BOOL)a3
{
  self->_manuallyManageBrowsing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overriddenInstructionsText, 0);
  objc_storeStrong((id *)&self->_overriddenNoAWDLText, 0);
  objc_storeStrong((id *)&self->_overriddenNoWiFIBTText, 0);
  objc_storeStrong((id *)&self->_overriddenTitleText, 0);
  objc_storeStrong((id *)&self->_photosAssetIDs, 0);
  objc_storeStrong((id *)&self->_urlsBeingShared, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_focusedIndexPath, 0);
  objc_storeStrong((id *)&self->_sharedItemsMap, 0);
  objc_storeStrong((id *)&self->_realNameToFirstSeenTimestamp, 0);
  objc_storeStrong((id *)&self->_people, 0);
  objc_storeStrong((id *)&self->_fcg, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_iconsVibrancyView, 0);
  objc_storeStrong((id *)&self->_instructionsVibrancyView, 0);
  objc_storeStrong((id *)&self->_titleVibrancyView, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_cachedSharedItems, 0);
  objc_storeStrong((id *)&self->_wirelessSettings, 0);
  objc_storeStrong((id *)&self->_sharedItemsRequestIDToPreviewPhoto, 0);
  objc_storeStrong((id *)&self->_personToSharedItemsRequestID, 0);
  objc_storeStrong((id *)&self->_personToStoredTransferFinalState, 0);
  objc_storeStrong((id *)&self->_personToProgress, 0);
  objc_storeStrong(&self->_progressToken, 0);
  objc_storeStrong((id *)&self->_browser, 0);
  objc_storeStrong((id *)&self->_detailCollectionViewLayout, 0);
  objc_storeStrong((id *)&self->_collectionViewLayout, 0);
  objc_storeStrong((id *)&self->_showMoreButton, 0);
  objc_storeStrong((id *)&self->_detailCollectionView, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_largeTextAirdropViewYConstraints, 0);
  objc_storeStrong((id *)&self->_airdropViewYConstraints, 0);
  objc_storeStrong((id *)&self->_largeTextTextViewConstraints, 0);
  objc_storeStrong((id *)&self->_textViewConstraints, 0);
  objc_storeStrong((id *)&self->_largeTextAirdropViewYConstraint, 0);
  objc_storeStrong((id *)&self->_noAWDLRightConstraint, 0);
  objc_storeStrong((id *)&self->_noAWDLTextView, 0);
  objc_storeStrong((id *)&self->_airDropInactiveIconLeftConstraint, 0);
  objc_storeStrong((id *)&self->_airDropInactiveIconView, 0);
  objc_storeStrong((id *)&self->_instructionsRightConstraint, 0);
  objc_storeStrong((id *)&self->_instructionsTextView, 0);
  objc_storeStrong((id *)&self->_airDropActiveIconLeftConstraint, 0);
  objc_storeStrong((id *)&self->_airDropActiveIconView, 0);
  objc_storeStrong((id *)&self->_noWifiRightConstraint, 0);
  objc_storeStrong((id *)&self->_noWifiTextView, 0);
  objc_storeStrong((id *)&self->_airDropIconLeftConstraint, 0);
  objc_storeStrong((id *)&self->_airDropIconView, 0);
  objc_storeStrong((id *)&self->_titleLabelTopConstraint, 0);
  objc_storeStrong((id *)&self->_reportBugButton, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_sendingAppBundleID, 0);
}

+ (void)airDropActivityCanPerformActivityWithItemClasses:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_212728000, v0, v1, "Classes: %@", v2);
  OUTLINED_FUNCTION_2_0();
}

+ (void)airDropActivityCanPerformActivityWithItemClasses:(const char *)a1 .cold.2(const char *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  NSStringFromSelector(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_212728000, a2, v4, "%@", v5);

  OUTLINED_FUNCTION_6();
}

- (void)setSendingApplicationAuditToken:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_1(&dword_212728000, a1, a3, "Failed to get bundleID and pid from audit token, using mainBundle", a5, a6, a7, a8, 0);
}

- (void)setSendingApplicationAuditToken:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_1(&dword_212728000, a1, a3, "Failed to get bundleID from audit token, using pid", a5, a6, a7, a8, 0);
}

- (void)addURL:withAttachmentName:description:previewImage:itemIndex:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_212728000, v0, v1, "Invalid URL (no scheme) %@", v2);
  OUTLINED_FUNCTION_2_0();
}

void __96__SFAirDropActivityViewController_addURL_withAttachmentName_description_previewImage_itemIndex___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_212728000, v0, v1, "UTTypeCreatePreferredIdentifierForTag(%@) returned NULL", v2);
  OUTLINED_FUNCTION_2_0();
}

- (void)addAttributedString:withAttachmentName:description:previewImage:itemIndex:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  v3 = v0;
  _os_log_error_impl(&dword_212728000, v1, OS_LOG_TYPE_ERROR, "Failed to convert NSAttributedString [%@] to HTML due to: %@", v2, 0x16u);
  OUTLINED_FUNCTION_2_0();
}

- (void)handleOperationCallback:(void *)a1 event:(NSObject *)a2 withResults:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "objectForKeyedSubscript:", *MEMORY[0x24BE90400]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_212728000, a2, v4, "SFAirDropActivityViewController %@", v5);

  OUTLINED_FUNCTION_6();
}

- (void)handleOperationCallback:(uint64_t)a1 event:(uint64_t)a2 withResults:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  const __CFString *v3;
  int v4;
  const __CFString *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if ((unint64_t)(a1 - 1) > 0xE)
    v3 = CFSTR("?");
  else
    v3 = off_24CE0FA40[a1 - 1];
  v4 = 138412802;
  v5 = v3;
  v6 = 1024;
  v7 = a1;
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl(&dword_212728000, log, OS_LOG_TYPE_ERROR, "SFAirDropActivityViewController UNHANDLED EVENT %@ [%d] %@", (uint8_t *)&v4, 0x1Cu);
  OUTLINED_FUNCTION_6();
}

- (void)cleanupWithSelectedActivityType:(NSObject *)a3 .cold.1(const char *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint8_t v6[14];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  v7 = a2;
  _os_log_debug_impl(&dword_212728000, a3, OS_LOG_TYPE_DEBUG, "%@ %@", v6, 0x16u);

}

@end
