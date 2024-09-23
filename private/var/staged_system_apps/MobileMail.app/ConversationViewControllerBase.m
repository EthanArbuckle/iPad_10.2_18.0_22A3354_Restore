@implementation ConversationViewControllerBase

- (void)_splitViewStateChanged:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  unsigned __int8 v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  unsigned __int8 v20;

  v16 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "object"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase splitViewController](self, "splitViewController"));

  if (v5 == v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "userInfo"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("MailSplitViewControllerNewDisplayModeKey")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("MailSplitViewControllerNewTraitCollectionKey")));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("MailSplitViewControllerIsCollapsedKey")));
    v11 = (void *)v10;
    if (!v8 || !v10)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ConversationViewControllerBase.m"), 3245, CFSTR("Notification is missing information:%@, %@"), v8, v11);

    }
    v12 = objc_msgSend(v8, "integerValue");
    v13 = objc_msgSend(v11, "BOOLValue");
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000864D0;
    v17[3] = &unk_10051C330;
    v17[4] = self;
    v19 = v12;
    v14 = v9;
    v18 = v14;
    v20 = v13;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v17);

  }
}

- (ConversationViewControllerBase)initWithScene:(id)a3
{
  id v4;
  ConversationViewControllerBase *v5;
  ConversationViewControllerBase *v6;
  EMCachingContactStore *v7;
  EMCachingContactStore *contactStore;
  _TtC10MobileMail37ConversationNavigationBarItemsManager *v9;
  _TtC10MobileMail37ConversationNavigationBarItemsManager *barItemsManager;
  uint64_t v11;
  NSMutableDictionary *cellHeightCache;
  MFConversationCurrentVisibleMessageStrategy *v13;
  MFConversationCurrentVisibleMessageStrategy *currentVisibleMessageStrategy;
  MFConversationHandoffCoordinator *v15;
  MFConversationHandoffCoordinator *handoffCoordinator;
  MFConversationAssistantContextProvider *v17;
  MFConversationCurrentVisibleMessageStrategy *v18;
  void *v19;
  MFConversationAssistantContextProvider *v20;
  MFConversationAssistantContextProvider *assistantContextProvider;
  char v22;
  id v23;
  void *v24;
  EFLocked *v25;
  EFLocked *quickReplyAnimationContext;
  void *v27;
  MFConversationPreviewState *v28;
  MFConversationPreviewState *previewState;
  MFMessageViewControllerReuseQueue *v30;
  MFMessageViewControllerReuseQueue *messageViewControllerReuseQueue;
  BlankConversationController *v32;
  BlankConversationController *blankConversationController;
  double v34;
  void *v35;
  uint64_t v36;
  EMMailboxRepository *mailboxRepository;
  objc_super v39;

  v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)ConversationViewControllerBase;
  v5 = -[ConversationViewControllerBase initWithNibName:bundle:](&v39, "initWithNibName:bundle:", 0, 0);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_scene, v4);
    v7 = (EMCachingContactStore *)objc_alloc_init((Class)EMCachingContactStore);
    contactStore = v6->_contactStore;
    v6->_contactStore = v7;

    v9 = -[ConversationNavigationBarItemsManager initWithScene:delegate:actionHandler:arrowDelegate:]([_TtC10MobileMail37ConversationNavigationBarItemsManager alloc], "initWithScene:delegate:actionHandler:arrowDelegate:", v4, v6, v6, v6);
    barItemsManager = v6->_barItemsManager;
    v6->_barItemsManager = v9;

    v11 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    cellHeightCache = v6->_cellHeightCache;
    v6->_cellHeightCache = (NSMutableDictionary *)v11;

    v13 = -[MFConversationCurrentVisibleMessageStrategy initWithConversationViewController:]([MFConversationCurrentVisibleMessageStrategy alloc], "initWithConversationViewController:", v6);
    currentVisibleMessageStrategy = v6->_currentVisibleMessageStrategy;
    v6->_currentVisibleMessageStrategy = v13;

    v15 = -[MFConversationHandoffCoordinator initWithUserActivityProvider:currentVisibleMessageStrategy:]([MFConversationHandoffCoordinator alloc], "initWithUserActivityProvider:currentVisibleMessageStrategy:", v6, v6->_currentVisibleMessageStrategy);
    handoffCoordinator = v6->_handoffCoordinator;
    v6->_handoffCoordinator = v15;

    v17 = [MFConversationAssistantContextProvider alloc];
    v18 = v6->_currentVisibleMessageStrategy;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase contactStore](v6, "contactStore"));
    v20 = -[MFConversationAssistantContextProvider initWithCurrentVisibileMessageStrategy:contactStore:](v17, "initWithCurrentVisibileMessageStrategy:contactStore:", v18, v19);
    assistantContextProvider = v6->_assistantContextProvider;
    v6->_assistantContextProvider = v20;

    v6->_conversationSortOrder = -[ConversationViewControllerBase _currentConversationSortOrderPreference](v6, "_currentConversationSortOrderPreference");
    if (sub_100039F8C(0))
      v22 = 32;
    else
      v22 = 0;
    *(_BYTE *)&v6->_flags = *(_BYTE *)&v6->_flags & 0xDF | v22;
    v23 = objc_alloc((Class)EFLocked);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v25 = (EFLocked *)objc_msgSend(v23, "initWithObject:", v24);
    quickReplyAnimationContext = v6->_quickReplyAnimationContext;
    v6->_quickReplyAnimationContext = v25;

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v27, "addObserver:selector:name:object:", v6, "_updateConversationSortOrder", MailApplicationDidChangeConversationOrder, 0);
    objc_msgSend(v27, "addObserver:selector:name:object:", v6, "_updateIncludeRelatedMessages", MailApplicationDidChangeConversationViewIncludesRelatedMessages, 0);
    objc_msgSend(v27, "addObserver:selector:name:object:", v6, "_fontMetricCacheDidInvalidate:", MFFontMetricCacheInvalidationNotification, 0);
    objc_msgSend(v27, "addObserver:selector:name:object:", v6, "_splitViewStateChanged:", CFSTR("MailSplitViewControllerViewStateChangedNotification"), 0);
    objc_msgSend(v27, "addObserver:selector:name:object:", v6, "_sceneDidActivate:", UISceneDidActivateNotification, v4);
    objc_msgSend(v27, "addObserver:selector:name:object:", v6, "_sceneWillDeactivate:", UISceneWillDeactivateNotification, v4);
    objc_msgSend(v27, "addObserver:selector:name:object:", v6, "_contentSizeCategoryDidChange:", UIContentSizeCategoryDidChangeNotification, 0);
    v28 = -[MFConversationPreviewState initWithBackgroundUpdater:]([MFConversationPreviewState alloc], "initWithBackgroundUpdater:", 0);
    previewState = v6->_previewState;
    v6->_previewState = v28;

    v30 = -[MFMessageViewControllerReuseQueue initWithScene:]([MFMessageViewControllerReuseQueue alloc], "initWithScene:", v4);
    messageViewControllerReuseQueue = v6->_messageViewControllerReuseQueue;
    v6->_messageViewControllerReuseQueue = v30;

    *(_BYTE *)&v6->_flags &= ~0x80u;
    v32 = objc_alloc_init(BlankConversationController);
    blankConversationController = v6->_blankConversationController;
    v6->_blankConversationController = v32;

    if (_os_feature_enabled_impl("Mail", "QuickReply"))
    {
      +[QuickReplyView defaultHeight](_TtC10MobileMail14QuickReplyView, "defaultHeight");
      v6->_quickReplyHeight = v34;
    }
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "daemonInterface"));
    v36 = objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "mailboxRepository"));
    mailboxRepository = v6->_mailboxRepository;
    v6->_mailboxRepository = (EMMailboxRepository *)v36;

  }
  return v6;
}

- (void)setIsPrimary:(BOOL)a3
{
  self->_isPrimary = a3;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (ComposeCapable)scene
{
  return (ComposeCapable *)objc_loadWeakRetained((id *)&self->_scene);
}

- (EMMessageListItem)referenceMessageListItem
{
  return self->_referenceMessageListItem;
}

- (EMCachingContactStore)contactStore
{
  return self->_contactStore;
}

- (void)_sceneDidActivate:(id)a3
{
  sub_10000945C(self, 1);
}

- (unint64_t)_currentConversationSortOrderPreference
{
  return sub_100039F44(0);
}

+ (id)log
{
  if (qword_1005A9AE0 != -1)
    dispatch_once(&qword_1005A9AE0, &stru_10051BF88);
  return (id)qword_1005A9AD8;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MFKeyboardAvoidance sharedController](MFKeyboardAvoidance, "sharedController"));
  objc_msgSend(v3, "unregisterKeyboardAvoidable:", self);

  -[ConversationViewControllerBase invalidateAutomaticMarkAsReadForAllMessages](self, "invalidateAutomaticMarkAsReadForAllMessages");
  v4.receiver = self;
  v4.super_class = (Class)ConversationViewControllerBase;
  -[ConversationViewControllerBase dealloc](&v4, "dealloc");
}

- (UICollectionView)collectionView
{
  -[ConversationViewControllerBase loadViewIfNeeded](self, "loadViewIfNeeded");
  return (UICollectionView *)self->_conversationView;
}

- (void)_sceneWillDeactivate:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase blankConversationController](self, "blankConversationController", a3));
  objc_msgSend(v3, "reportMetrics");

}

- (void)loadView
{
  MFSwipableCollectionViewLayout *v3;
  MFSwipableCollectionViewLayout *conversationLayout;
  double v5;
  double v6;
  double v7;
  double v8;
  _MFConversationViewCollectionView *v9;
  _MFConversationViewCollectionView *conversationView;
  void *v11;
  void *v12;
  MFConversationCellConfigurator *v13;
  MFConversationCellConfigurator *cellConfigurator;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL8 v20;
  void *v21;
  _UIFindInteraction *v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)ConversationViewControllerBase;
  -[ConversationViewControllerBase loadView](&v23, "loadView");
  v3 = objc_alloc_init(MFSwipableCollectionViewLayout);
  conversationLayout = self->_conversationLayout;
  self->_conversationLayout = v3;

  v5 = sub_10007A788(self);
  v9 = -[_MFConversationViewCollectionView initWithFrame:collectionViewLayout:]([_MFConversationViewCollectionView alloc], "initWithFrame:collectionViewLayout:", self->_conversationLayout, v5, v6, v7, v8);
  conversationView = self->_conversationView;
  self->_conversationView = v9;

  -[_MFConversationViewCollectionView setAutoresizingMask:](self->_conversationView, "setAutoresizingMask:", 18);
  -[_MFConversationViewCollectionView setInsetsLayoutMarginsFromSafeArea:](self->_conversationView, "setInsetsLayoutMarginsFromSafeArea:", 0);
  -[_MFConversationViewCollectionView setDelegate:](self->_conversationView, "setDelegate:", self);
  -[_MFConversationViewCollectionView setDragDelegate:](self->_conversationView, "setDragDelegate:", self);
  -[_MFConversationViewCollectionView setAllowsSelection:](self->_conversationView, "setAllowsSelection:", 0);
  -[_MFConversationViewCollectionView setAlwaysBounceVertical:](self->_conversationView, "setAlwaysBounceVertical:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mailConversationViewBackgroundColor](UIColor, "mailConversationViewBackgroundColor"));
  -[_MFConversationViewCollectionView setBackgroundColor:](self->_conversationView, "setBackgroundColor:", v11);

  -[_MFConversationViewCollectionView setPrefetchingEnabled:](self->_conversationView, "setPrefetchingEnabled:", 0);
  -[_MFConversationViewCollectionView setOpaque:](self->_conversationView, "setOpaque:", 1);
  -[_MFConversationViewCollectionView setContentInsetAdjustmentBehavior:](self->_conversationView, "setContentInsetAdjustmentBehavior:", 2);
  -[_MFConversationViewCollectionView _setIndicatorInsetAdjustmentBehavior:](self->_conversationView, "_setIndicatorInsetAdjustmentBehavior:", 1);
  -[ConversationViewControllerBase _calculateCollectionViewInsets](self, "_calculateCollectionViewInsets");
  -[_MFConversationViewCollectionView setContentInset:](self->_conversationView, "setContentInset:");
  if (-[ConversationViewControllerBase allowQuickReply](self, "allowQuickReply"))
    -[_MFConversationViewCollectionView setKeyboardDismissMode:](self->_conversationView, "setKeyboardDismissMode:", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase view](self, "view"));
  objc_msgSend(v12, "addSubview:", self->_conversationView);

  v13 = -[MFConversationCellConfigurator initWithCollectionView:]([MFConversationCellConfigurator alloc], "initWithCollectionView:", self->_conversationView);
  cellConfigurator = self->_cellConfigurator;
  self->_cellConfigurator = v13;

  -[MFConversationCellConfigurator setDelegate:](self->_cellConfigurator, "setDelegate:", self);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase contactStore](self, "contactStore"));
  -[MFConversationCellConfigurator setContactStore:](self->_cellConfigurator, "setContactStore:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase scene](self, "scene"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "brandIndicatorProvider"));
  -[MFConversationCellConfigurator setBrandIndicatorProvider:](self->_cellConfigurator, "setBrandIndicatorProvider:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationCellConfigurator sizeTracker](self->_cellConfigurator, "sizeTracker"));
  objc_msgSend(v18, "setDelegate:", self);

  -[ConversationViewControllerBase _updateLayout](self, "_updateLayout");
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase restorationFuture](self, "restorationFuture"));
  v20 = v19 == 0;

  -[ConversationViewControllerBase _doSetShouldShowNoMessageSelectedView:](self, "_doSetShouldShowNoMessageSelectedView:", v20);
  -[ConversationViewControllerBase mf_updateAlertSuppressionContextsForReason:](self, "mf_updateAlertSuppressionContextsForReason:", CFSTR("conversation view did load"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase navigationItem](self, "navigationItem"));
  objc_msgSend(v21, "setLargeTitleDisplayMode:", 2);

  v22 = self->_findInteraction;
  if (v22)
    -[_MFConversationViewCollectionView addInteraction:](self->_conversationView, "addInteraction:", v22);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ConversationViewControllerBase;
  -[ConversationViewControllerBase viewDidLoad](&v3, "viewDidLoad");
  -[ConversationViewControllerBase _updateNavigationChromelessSettings](self, "_updateNavigationChromelessSettings");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id WeakRetained;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)ConversationViewControllerBase;
  -[ConversationViewControllerBase viewWillAppear:](&v14, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase scene](self, "scene"));
  if (!-[ConversationViewControllerBase didNotifyExtendedLaunchTracker](self, "didNotifyExtendedLaunchTracker"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "extendedLaunchTracker"));
    objc_msgSend(v5, "observeViewController:scene:", self, v4);

  }
  *(_BYTE *)&self->_flags |= 0x10u;
  -[ConversationViewControllerBase _updateBarButtonsAnimated:force:](self, "_updateBarButtonsAnimated:force:", 0, 1);
  -[ConversationViewControllerBase _updateCollectionViewMargins](self, "_updateCollectionViewMargins");
  -[ConversationViewControllerBase _updateDisplayMetrics](self, "_updateDisplayMetrics");
  -[ConversationViewControllerBase _updateTitle](self, "_updateTitle");
  -[ConversationViewControllerBase _resetNavigationChromelessAppearance](self, "_resetNavigationChromelessAppearance");
  *(_BYTE *)&self->_flags &= ~0x40u;
  if (+[UIDevice mf_isPad](UIDevice, "mf_isPad"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "popoverManager"));
    objc_msgSend(v6, "addPassthroughViewProvider:", self);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase referenceMessageListItem](self, "referenceMessageListItem"));
  if (v7)
  {

LABEL_7:
    -[ConversationViewControllerBase setShouldShowNoMessageSelectedView:](self, "setShouldShowNoMessageSelectedView:", 0);
    goto LABEL_12;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "accountsProvider"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "displayedAccounts"));
  v11 = objc_msgSend(v10, "count");

  if (!v11)
    goto LABEL_7;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector(WeakRetained, "selectInitialMessageForConversationViewController:") & 1) != 0)
    objc_msgSend(WeakRetained, "selectInitialMessageForConversationViewController:", self);

LABEL_12:
  -[ConversationViewControllerBase mf_updateAlertSuppressionContextsForReason:](self, "mf_updateAlertSuppressionContextsForReason:", CFSTR("conversation view will appear"));
  if (+[UIDevice mf_isPad](UIDevice, "mf_isPad")
    && objc_msgSend(UIApp, "launchedToTest")
    && !-[ConversationViewControllerBase didNotifyExtendedLaunchTracker](self, "didNotifyExtendedLaunchTracker"))
  {
    -[ConversationViewControllerBase setDidNotifyExtendedLaunchTracker:](self, "setDidNotifyExtendedLaunchTracker:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "extendedLaunchTracker"));
    objc_msgSend(v13, "didFinishLoadViewController:scene:", self, v4);

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  MFConversationCellExpansionGestureRecognizer *v4;
  MFConversationCellExpansionGestureRecognizer *cellExpansionRecognizer;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  unsigned int v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  os_signpost_id_t v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  uint8_t v26[16];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  _BYTE v32[128];

  v31.receiver = self;
  v31.super_class = (Class)ConversationViewControllerBase;
  -[ConversationViewControllerBase viewDidAppear:](&v31, "viewDidAppear:", a3);
  sub_10000945C(self, 1);
  if (-[ConversationViewControllerBase isPrimary](self, "isPrimary"))
  {
    if (!self->_cellExpansionRecognizer)
    {
      v4 = -[MFConversationCellExpansionGestureRecognizer initWithTarget:action:]([MFConversationCellExpansionGestureRecognizer alloc], "initWithTarget:action:", self, "_expansionRecognizerDidRecognize:");
      cellExpansionRecognizer = self->_cellExpansionRecognizer;
      self->_cellExpansionRecognizer = v4;

      -[MFConversationCellExpansionGestureRecognizer setDelegate:](self->_cellExpansionRecognizer, "setDelegate:", self);
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase view](self, "view"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase cellExpansionRecognizer](self, "cellExpansionRecognizer"));
    objc_msgSend(v6, "addGestureRecognizer:", v7);

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "interactions"));

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v28;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v28 != v11)
            objc_enumerationMutation(v9);
          v13 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v12);
          v14 = objc_opt_class(UIDragInteraction);
          if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
            objc_msgSend(v13, "_setLiftDelay:", 0.57);
          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v10);
    }

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase previewState](self, "previewState"));
  v16 = objc_msgSend(v15, "shouldScheduleMarkMessageAsRead");

  if (v16)
    -[ConversationViewControllerBase scheduleAutomaticMarkAsReadForReferenceMessage](self, "scheduleAutomaticMarkAsReadForReferenceMessage");
  -[ConversationViewControllerBase mf_updateAlertSuppressionContextsForReason:](self, "mf_updateAlertSuppressionContextsForReason:", CFSTR("conversation view did appear"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[MFKeyboardAvoidance sharedController](MFKeyboardAvoidance, "sharedController"));
  objc_msgSend(v17, "registerKeyboardAvoidable:", self);

  v18 = MFMessageSelectionLifecycleSignpostLog();
  v19 = objc_claimAutoreleasedReturnValue(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase referenceMessageListItem](self, "referenceMessageListItem"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "itemID"));
  v22 = os_signpost_id_make_with_pointer(v19, v21);

  v23 = MFMessageSelectionLifecycleSignpostLog();
  v24 = objc_claimAutoreleasedReturnValue(v23);
  v25 = v24;
  if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    *(_WORD *)v26 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v25, OS_SIGNPOST_EVENT, v22, "Message selection lifecycle", "Conversation view did appear", v26, 2u);
  }

}

- (void)_enumerateExpandedCellMessageContentViewsWithBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase resizingContentViews](self, "resizingContentViews"));
  v6 = objc_msgSend(v5, "mutableCopy");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase cellConfigurator](self, "cellConfigurator"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10007AF98;
  v13[3] = &unk_10051BFB0;
  v8 = v4;
  v15 = v8;
  v9 = v6;
  v14 = v9;
  objc_msgSend(v7, "enumerateExpandedCellsWithBlock:", v13);

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10007B01C;
  v11[3] = &unk_10051BFD8;
  v10 = v8;
  v12 = v10;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v11);

}

- (void)setResizingState:(int64_t)a3
{
  _QWORD *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  _QWORD v16[4];
  _QWORD *v17;
  _QWORD v18[4];
  id v19;
  id location;
  _QWORD v21[4];
  BOOL v22;

  if (self->_resizingState != a3)
  {
    self->_resizingState = a3;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10007B2E8;
    v21[3] = &unk_10051BFF8;
    v22 = a3 != 2;
    v5 = objc_retainBlock(v21);
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10007B2F4;
    v18[3] = &unk_10051B978;
    objc_copyWeak(&v19, &location);
    v6 = objc_retainBlock(v18);
    switch(a3)
    {
      case 0:
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_10007B400;
        v16[3] = &unk_10051C040;
        v17 = v5;
        -[ConversationViewControllerBase _enumerateExpandedCellMessageContentViewsWithBlock:](self, "_enumerateExpandedCellMessageContentViewsWithBlock:", v16);
        -[ConversationViewControllerBase setResizingContentViews:](self, "setResizingContentViews:", 0);
        ((void (*)(_QWORD *, _QWORD))v6[2])(v6, 0);
        v7 = v17;
        goto LABEL_7;
      case 1:
        v10 = 0;
        v11 = &v10;
        v12 = 0x3032000000;
        v13 = sub_10007B40C;
        v14 = sub_10007B41C;
        v15 = (id)0xAAAAAAAAAAAAAAAALL;
        v15 = objc_alloc_init((Class)NSMutableArray);
        v9[0] = _NSConcreteStackBlock;
        v9[1] = 3221225472;
        v9[2] = sub_10007B424;
        v9[3] = &unk_10051C068;
        v9[4] = &v10;
        -[ConversationViewControllerBase _enumerateExpandedCellMessageContentViewsWithBlock:](self, "_enumerateExpandedCellMessageContentViewsWithBlock:", v9);
        -[ConversationViewControllerBase setResizingContentViews:](self, "setResizingContentViews:", v11[5]);
        _Block_object_dispose(&v10, 8);
        v7 = v15;
LABEL_7:

        break;
      case 2:
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
        objc_msgSend(v8, "directionalLayoutMargins");
        -[ConversationViewControllerBase _updateConversationHeaderViewLayoutMarginsWithSuperviewMargins:](self, "_updateConversationHeaderViewLayoutMarginsWithSuperviewMargins:");

        -[ConversationViewControllerBase _enumerateExpandedCellMessageContentViewsWithBlock:](self, "_enumerateExpandedCellMessageContentViewsWithBlock:", v5);
        break;
      case 3:
        -[ConversationViewControllerBase _enumerateExpandedCellMessageContentViewsWithBlock:](self, "_enumerateExpandedCellMessageContentViewsWithBlock:", v5);
        ((void (*)(_QWORD *, uint64_t))v6[2])(v6, 1);
        break;
      default:
        break;
    }

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);

  }
}

- (void)prepareForResizing
{
  -[ConversationViewControllerBase setResizingState:](self, "setResizingState:", 1);
}

- (void)beginResizing
{
  -[ConversationViewControllerBase setResizingState:](self, "setResizingState:", 2);
}

- (void)beginInteractiveResizing
{
  -[ConversationViewControllerBase setResizingState:](self, "setResizingState:", 3);
}

- (void)endResizing
{
  -[ConversationViewControllerBase setResizingState:](self, "setResizingState:", 0);
}

- (void)_reloadDataSource
{
  -[ConversationViewControllerBase doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[ConversationViewControllerBase _reloadDataSource]", "ConversationViewControllerBase.m", 530, "0");
}

- (int64_t)countOfMessages
{
  -[ConversationViewControllerBase doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[ConversationViewControllerBase countOfMessages]", "ConversationViewControllerBase.m", 534, "0");
}

- (int64_t)countOfSummaries
{
  -[ConversationViewControllerBase doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[ConversationViewControllerBase countOfSummaries]", "ConversationViewControllerBase.m", 538, "0");
}

- (id)_messageItemIDAtIndexPath:(id)a3
{
  id v5;

  v5 = a3;
  -[ConversationViewControllerBase doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[ConversationViewControllerBase _messageItemIDAtIndexPath:]", "ConversationViewControllerBase.m", 542, "0");
}

- (int64_t)_headerDisplayOptionsForCell:(id)a3 displayedAsSingleMessage:(BOOL)a4
{
  return 1;
}

- (void)_showSingleMessage:(id)a3 animationOffset:(CGPoint)a4 initialScrollOffset:(CGPoint)a5
{
  id v7;

  v7 = a3;
  -[ConversationViewControllerBase doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[ConversationViewControllerBase _showSingleMessage:animationOffset:initialScrollOffset:]", "ConversationViewControllerBase.m", 559, "0");
}

- (id)_currentlyVisibleIndexPath
{
  -[ConversationViewControllerBase doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[ConversationViewControllerBase _currentlyVisibleIndexPath]", "ConversationViewControllerBase.m", 563, "0");
}

- (id)_indexPathForReferenceMessage
{
  -[ConversationViewControllerBase doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[ConversationViewControllerBase _indexPathForReferenceMessage]", "ConversationViewControllerBase.m", 567, "0");
}

- (id)_indexPathOfMessageViewControllerMessage:(id)a3
{
  id v5;

  v5 = a3;
  -[ConversationViewControllerBase doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[ConversationViewControllerBase _indexPathOfMessageViewControllerMessage:]", "ConversationViewControllerBase.m", 571, "0");
}

- (BOOL)_isItemInitiallyUnreadAtIndexPath:(id)a3
{
  id v5;

  v5 = a3;
  -[ConversationViewControllerBase doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[ConversationViewControllerBase _isItemInitiallyUnreadAtIndexPath:]", "ConversationViewControllerBase.m", 575, "0");
}

- (void)_enqueueMessageViewController:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase messageViewControllerReuseQueue](self, "messageViewControllerReuseQueue"));
  objc_msgSend(v4, "enqueueMessageViewController:", v5);

}

- (UIEdgeInsets)_calculateCollectionViewInsets
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double Height;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  id v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect v26;
  UIEdgeInsets result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
  objc_msgSend(v3, "contentInset");
  v5 = v4;
  v7 = v6;

  Height = 0.0;
  v9 = 0.0;
  if (!-[ConversationViewControllerBase beingPreviewed](self, "beingPreviewed"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase navigationController](self, "navigationController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "presentingViewController"));

    if (!v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase scene](self, "scene"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "statusBarManager"));
      objc_msgSend(v13, "statusBarFrame");
      Height = CGRectGetHeight(v26);

    }
    -[ConversationViewControllerBase _navigationBarHeight](self, "_navigationBarHeight");
    Height = Height + v14;
    if (!+[UIDevice mf_isPad](UIDevice, "mf_isPad")
      || (v15 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase traitCollection](self, "traitCollection")),
          v16 = objc_msgSend(v15, "horizontalSizeClass"),
          v15,
          v16 == (id)1))
    {
      -[ConversationViewControllerBase _itemSpacing](self, "_itemSpacing");
      Height = Height + v17;
    }
    -[ConversationViewControllerBase _itemSpacing](self, "_itemSpacing");
    v19 = v18;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase view](self, "view"));
    objc_msgSend(v20, "safeAreaInsets");
    v9 = v19 + v21 + self->_adjustmentForKeyboard;

  }
  v22 = Height;
  v23 = v5;
  v24 = v9;
  v25 = v7;
  result.right = v25;
  result.bottom = v24;
  result.left = v23;
  result.top = v22;
  return result;
}

- (double)_navigationBarHeight
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase navigationController](self, "navigationController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "navigationBar"));
  objc_msgSend(v3, "frame");
  v5 = v4;

  return v5;
}

- (void)viewDidLayoutSubviews
{
  _QWORD *v3;
  void *v4;
  unsigned int v5;
  _QWORD v6[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ConversationViewControllerBase;
  -[ConversationViewControllerBase viewDidLayoutSubviews](&v7, "viewDidLayoutSubviews");
  if ((id)-[ConversationViewControllerBase resizingState](self, "resizingState") != (id)2)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10007BA88;
    v6[3] = &unk_10051AA98;
    v6[4] = self;
    v3 = objc_retainBlock(v6);
    if (!-[ConversationViewControllerBase isPerformingQuickReplySendAnimation](self, "isPerformingQuickReplySendAnimation"))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase previewState](self, "previewState"));
      v5 = objc_msgSend(v4, "shouldScrollToReferenceMessage");

      if (v5)
      {
        +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v3);
        -[ConversationViewControllerBase _scrollToInitialPosition](self, "_scrollToInitialPosition");
      }
      else
      {
        ((void (*)(_QWORD *))v3[2])(v3);
      }
    }

  }
}

- (void)collectionViewMarginsDidChange:(NSDirectionalEdgeInsets)a3
{
  double trailing;
  double bottom;
  double leading;
  double top;
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
  double v23;

  trailing = a3.trailing;
  bottom = a3.bottom;
  leading = a3.leading;
  top = a3.top;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase view](self, "view"));
  v9 = MFEdgeInsetsFromDirectionalEdgeInsets(objc_msgSend(v8, "mf_prefersRightToLeftInterfaceLayout"), top, leading, bottom, trailing);
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase displayMetrics](self, "displayMetrics"));
  objc_msgSend(v16, "layoutMargins");
  if (v11 == v20 && v9 == v17 && v15 == v19)
  {
    v23 = v18;

    if (v13 == v23)
      return;
  }
  else
  {

  }
  -[ConversationViewControllerBase _updateDisplayMetrics](self, "_updateDisplayMetrics");
  if ((id)-[ConversationViewControllerBase resizingState](self, "resizingState") != (id)3)
    -[ConversationViewControllerBase _restorePinnedScrollPosition](self, "_restorePinnedScrollPosition");
}

- (NSDirectionalEdgeInsets)layoutMarginsForCollectionViewFrame:(CGRect)a3
{
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
  double v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  unsigned int v38;
  double v39;
  void *i;
  void *v41;
  uint64_t v42;
  void *v43;
  double v44;
  double v45;
  unsigned int v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  NSDirectionalEdgeInsets result;

  -[ConversationViewControllerBase systemMinimumLayoutMargins](self, "systemMinimumLayoutMargins");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase view](self, "view"));
  v13 = MFEdgeInsetsFromDirectionalEdgeInsets(objc_msgSend(v12, "mf_prefersRightToLeftInterfaceLayout"), v5, v7, v9, v11);
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase view](self, "view"));
  objc_msgSend(v20, "safeAreaInsets");
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;

  +[MFReadableContentMarginCalculator readableContentMarginsForWidth:minMargins:safeAreaInsets:](MFReadableContentMarginCalculator, "readableContentMarginsForWidth:minMargins:safeAreaInsets:", CGRectGetWidth(a3), v13, v15, v17, v19, v22, v24, v26, v28);
  v30 = v29;
  v32 = v31;
  v34 = v33;
  v36 = v35;
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase view](self, "view"));
  v38 = objc_msgSend(v37, "mf_prefersRightToLeftInterfaceLayout");
  if (v38)
    v39 = v36;
  else
    v39 = v32;
  if (v38)
    v36 = v32;

  for (i = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase navigationController](self, "navigationController"));
        ;
        i = (void *)v42)
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(i, "navigationController"));

    if (!v41)
      break;
    v42 = objc_claimAutoreleasedReturnValue(objc_msgSend(i, "navigationController"));

  }
  if (i)
  {
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase traitCollection](self, "traitCollection"));
    objc_msgSend(v43, "mf_leadingEdgeToBackButtonText");
    v45 = v39 + v44;

    v36 = v45;
  }
  else
  {
    v46 = +[UIDevice mf_isPad](UIDevice, "mf_isPad");
    v47 = 40.0;
    if (!v46)
      v47 = 22.0;
    if (v39 >= v47)
      v45 = v39;
    else
      v45 = v47;
    if (v36 < v47)
      v36 = v47;
  }

  v48 = v30;
  v49 = v45;
  v50 = v34;
  v51 = v36;
  result.trailing = v51;
  result.bottom = v50;
  result.leading = v49;
  result.top = v48;
  return result;
}

- (void)_updateCollectionViewMargins
{
  -[_MFConversationViewCollectionView updateLayoutMargins](self->_conversationView, "updateLayoutMargins");
  -[ConversationViewControllerBase _updateConversationHeaderViewLayoutMarginsWithSuperviewMargins:](self, "_updateConversationHeaderViewLayoutMarginsWithSuperviewMargins:");
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)ConversationViewControllerBase;
  -[ConversationViewControllerBase viewWillDisappear:](&v6, "viewWillDisappear:");
  -[ConversationViewControllerBase _endEditingAnimated:](self, "_endEditingAnimated:", v3);
  if (-[ConversationViewControllerBase allowQuickReply](self, "allowQuickReply"))
  {
    -[ConversationViewControllerBase _dismissKeyboardIfNecessary](self, "_dismissKeyboardIfNecessary");
    if (self->_adjustmentForKeyboard > 0.0)
      -[ConversationViewControllerBase _adjustForKeyboardAvoidanceOverlap:](self, "_adjustForKeyboardAvoidanceOverlap:", 0.0);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MFKeyboardAvoidance sharedController](MFKeyboardAvoidance, "sharedController"));
  objc_msgSend(v5, "unregisterKeyboardAvoidable:", self);

  -[ConversationViewControllerBase setTextSelectionScrollHandler:](self, "setTextSelectionScrollHandler:", 0);
  *(_BYTE *)&self->_flags |= 0x40u;
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ConversationViewControllerBase;
  -[ConversationViewControllerBase viewDidDisappear:](&v7, "viewDidDisappear:", a3);
  *(_BYTE *)&self->_flags &= 0xAFu;
  sub_10000945C(self, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase scene](self, "scene"));
  if (+[UIDevice mf_isPad](UIDevice, "mf_isPad"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "popoverManager"));
    objc_msgSend(v5, "removePassthroughViewProvider:", self);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationCellExpansionGestureRecognizer view](self->_cellExpansionRecognizer, "view"));
  objc_msgSend(v6, "removeGestureRecognizer:", self->_cellExpansionRecognizer);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  NSString *v9;
  NSString *v10;
  _BOOL4 IsAccessibilityCategory;
  void *v12;
  unsigned int v13;
  void *v14;
  _QWORD v15[5];
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ConversationViewControllerBase;
  -[ConversationViewControllerBase traitCollectionDidChange:](&v16, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase splitViewController](self, "splitViewController"));

  if (!v5)
    -[ConversationViewControllerBase _updateBarButtonsAnimated:force:](self, "_updateBarButtonsAnimated:force:", 0, 1);
  -[ConversationViewControllerBase _updateTitle](self, "_updateTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase traitCollection](self, "traitCollection"));
  v7 = objc_msgSend(v6, "mf_traitDifferenceAffectsTextLayout:", v4);

  if (v7)
  {
    -[ConversationViewControllerBase _updateDisplayMetrics](self, "_updateDisplayMetrics");
    -[ConversationViewControllerBase _updateLayout](self, "_updateLayout");
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase traitCollection](self, "traitCollection"));
  v9 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "preferredContentSizeCategory"));

  v10 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v9);
  if (IsAccessibilityCategory != UIContentSizeCategoryIsAccessibilityCategory(v10))
    -[ConversationViewControllerBase _reloadPreparedCells](self, "_reloadPreparedCells");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase cellConfigurator](self, "cellConfigurator"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10007C25C;
  v15[3] = &unk_10051C090;
  v15[4] = self;
  objc_msgSend(v12, "enumerateExpandedCellsWithBlock:", v15);

  v13 = -[ConversationViewControllerBase shouldHideStickyFooterView](self, "shouldHideStickyFooterView");
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase navigationController](self, "navigationController"));
  objc_msgSend(v14, "setToolbarHidden:", v13 ^ 1);

  -[ConversationViewControllerBase _updateNavigationChromelessSettings](self, "_updateNavigationChromelessSettings");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  objc_super v13;
  _QWORD v14[5];
  _QWORD v15[5];

  height = a3.height;
  width = a3.width;
  v7 = a4;
  -[ConversationViewControllerBase _toggleCellsGroupOpacityDuringRotationWithCoordinator:](self, "_toggleCellsGroupOpacityDuringRotationWithCoordinator:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase view](self, "view"));
  objc_msgSend(v8, "bounds");
  if (width - v9 >= 0.0)
    v10 = width - v9;
  else
    v10 = -(width - v9);

  if (v10 < 2.22044605e-16)
    goto LABEL_7;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "window"));

  if (v12)
  {
    -[ConversationViewControllerBase _beginResizingConversationView:](self, "_beginResizingConversationView:", width, height);
    v14[4] = self;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10007C4C0;
    v15[3] = &unk_10051C0B8;
    v15[4] = self;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10007C5D0;
    v14[3] = &unk_10051C0B8;
    objc_msgSend(v7, "animateAlongsideTransition:completion:", v15, v14);
LABEL_7:
    v13.receiver = self;
    v13.super_class = (Class)ConversationViewControllerBase;
    -[ConversationViewControllerBase viewWillTransitionToSize:withTransitionCoordinator:](&v13, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  }

}

- (BOOL)isFullyVisible
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase previewState](self, "previewState"));
  v3 = objc_msgSend(v2, "isFullyVisible");

  return v3;
}

- (void)setReferenceMessageListItem:(id)a3
{
  EMMessageListItem *v4;
  EMMessageListItem *referenceMessageListItem;
  id v6;

  v4 = (EMMessageListItem *)a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase delegate](self, "delegate"));
  if (!v4
    && self->_referenceMessageListItem
    && (objc_opt_respondsToSelector(v6, "referenceMessageNoLongerAvailableInConversationView:") & 1) != 0)
  {
    objc_msgSend(v6, "referenceMessageNoLongerAvailableInConversationView:", self);
  }
  referenceMessageListItem = self->_referenceMessageListItem;
  self->_referenceMessageListItem = v4;

}

- (id)previewActionItems
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  int64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id WeakRetained;
  void *v17;
  _QWORD v18[7];
  _QWORD v19[2];
  _QWORD v20[2];

  if (!qword_1005A9AE8)
  {
    v19[0] = CFSTR("SubMenuTitle");
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("MARK_ELIPSIS"), &stru_100531B00, CFSTR("Main")));
    v19[1] = CFSTR("SubMenuItems");
    v20[0] = v4;
    v20[1] = &off_100542118;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 2));

    v18[0] = &off_100541368;
    v18[1] = &off_100541380;
    v18[2] = &off_100541398;
    v18[3] = v5;
    v18[4] = &off_1005413B0;
    v18[5] = &off_1005413C8;
    v18[6] = &off_1005413E0;
    v6 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 7));
    v7 = (void *)qword_1005A9AE8;
    qword_1005A9AE8 = v6;

  }
  v8 = sub_1001D6D14(0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = +[MFTriageActionUtilities triageActionForActionKey:](MFTriageActionUtilities, "triageActionForActionKey:", v9);

  v11 = qword_1005A9AE8;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v10));
  v17 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase _previewActionsForTriageActions:excludingActions:](self, "_previewActionsForTriageActions:excludingActions:", v11, v13));

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector(WeakRetained, "didOrbOnMessageInConversationViewController:") & 1) != 0)
    objc_msgSend(WeakRetained, "didOrbOnMessageInConversationViewController:", self);

  return v14;
}

- (id)leadingPreviewAction
{
  id v3;
  void *v4;
  int64_t v5;

  v3 = sub_1001D6D14(0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = +[MFTriageActionUtilities triageActionForActionKey:](MFTriageActionUtilities, "triageActionForActionKey:", v4);

  if (v5 == 16)
  {
    if (-[ConversationViewControllerBase _shouldArchiveByDefault](self, "_shouldArchiveByDefault"))
      v5 = 8;
    else
      v5 = 9;
  }
  return -[ConversationViewControllerBase _previewActionForTriageAction:forSwipe:](self, "_previewActionForTriageAction:forSwipe:", v5, 1);
}

- (id)trailingPreviewAction
{
  uint64_t v3;

  if (-[ConversationViewControllerBase _shouldArchiveByDefault](self, "_shouldArchiveByDefault"))
    v3 = 9;
  else
    v3 = 8;
  return -[ConversationViewControllerBase _previewActionForTriageAction:forSwipe:](self, "_previewActionForTriageAction:forSwipe:", v3, 1);
}

- (id)_previewActionsForTriageActions:(id)a3 excludingActions:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id obj;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v6 = a3;
  v22 = a4;
  v21 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array", v6));
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v24;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v9);
        v11 = objc_opt_class(NSDictionary);
        if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
        {
          v12 = v10;
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("SubMenuTitle")));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("SubMenuItems")));
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase _previewActionsForTriageActions:excludingActions:](self, "_previewActionsForTriageActions:excludingActions:", v14, v22));
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIPreviewActionGroup actionGroupWithTitle:style:actions:](UIPreviewActionGroup, "actionGroupWithTitle:style:actions:", v13, 0, v15));
          objc_msgSend(v21, "addObject:", v16);

LABEL_8:
          goto LABEL_11;
        }
        v17 = objc_opt_class(NSNumber);
        if ((objc_opt_isKindOfClass(v10, v17) & 1) != 0
          && (objc_msgSend(v22, "containsObject:", v10) & 1) == 0)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase _previewActionForTriageAction:forSwipe:](self, "_previewActionForTriageAction:forSwipe:", objc_msgSend(v10, "integerValue"), 0));
          if (v13)
            objc_msgSend(v21, "addObject:", v13);
          goto LABEL_8;
        }
LABEL_11:
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      v7 = v18;
    }
    while (v18);
  }

  return v21;
}

- (void)_shrinkMessagesToBarButton:(id)a3 withInteraction:(id)a4 completionHandler:(id)a5
{
  id v8;
  void *v9;
  id v10;

  v10 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "view"));
  -[ConversationViewControllerBase _shrinkMessagesToView:withInteraction:completionHandler:](self, "_shrinkMessagesToView:withInteraction:completionHandler:", v9, v10, v8);

}

- (void)_shrinkMessagesToView:(id)a3 withInteraction:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  _QWORD v49[5];
  id v50;
  id v51;
  id v52;
  unsigned __int8 v53;
  _QWORD v54[4];
  id v55;
  id v56;
  id v57;
  id v58;
  ConversationViewControllerBase *v59;
  unsigned __int8 v60;

  v8 = a3;
  v9 = a4;
  v47 = a5;
  v46 = v9;
  v10 = objc_msgSend(UIApp, "launchedToTest");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase delegate](self, "delegate"));
  v48 = v11;
  if ((objc_opt_respondsToSelector(v11, "shrinkAnimationContainerViewForConversationViewController:") & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "shrinkAnimationContainerViewForConversationViewController:", self));
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "superview"));

  }
  objc_msgSend(v12, "bounds");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
  objc_msgSend(v22, "contentInset");
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;

  v31 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", v15 + v26, v17 + v24, v19 - (v26 + v30), v21 - (v24 + v28));
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.5));
  objc_msgSend(v31, "setBackgroundColor:", v32);

  objc_msgSend(v12, "addSubview:", v31);
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase view](self, "view"));
  v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "snapshotViewAfterScreenUpdates:", 0));

  v45 = (void *)v34;
  objc_msgSend(v12, "addSubview:", v34);
  if ((objc_opt_respondsToSelector(v48, "conversationViewController:willRemoveAllVisibleMessagesWithItemIDs:") & 1) != 0)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase referenceMessageListItem](self, "referenceMessageListItem"));
    v36 = objc_msgSend(v35, "count");
    v37 = objc_msgSend(v9, "messageCount");

    if (v36 == v37)
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase _messagesForTriageInteraction:](self, "_messagesForTriageInteraction:", v9));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "ef_map:", &stru_10051C0D8));

      objc_msgSend(v48, "conversationViewController:willRemoveAllVisibleMessagesWithItemIDs:", self, v39);
    }
  }
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472;
  v54[2] = sub_10007D20C;
  v54[3] = &unk_10051C100;
  v55 = v45;
  v40 = v12;
  v56 = v40;
  v41 = v8;
  v57 = v41;
  v60 = v10;
  v58 = v31;
  v59 = self;
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_10007D320;
  v49[3] = &unk_10051C128;
  v53 = v10;
  v49[4] = self;
  v42 = v55;
  v50 = v42;
  v43 = v58;
  v51 = v43;
  v44 = v47;
  v52 = v44;
  +[UIView _animateUsingDefaultTimingWithOptions:animations:completion:](UIView, "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, v54, v49);

}

- (id)_previewActionForTriageAction:(int64_t)a3 forSwipe:(BOOL)a4
{
  return 0;
}

- (id)_messagesForTriageInteraction:(id)a3
{
  return &__NSArray0__struct;
}

- (void)setBeingPreviewed:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase previewState](self, "previewState"));
  objc_msgSend(v4, "setBeingPreviewed:", v3);

}

- (BOOL)beingPreviewed
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase previewState](self, "previewState"));
  v3 = objc_msgSend(v2, "beingPreviewed");

  return v3;
}

- (void)previewCancelled
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase previewState](self, "previewState"));
  objc_msgSend(v2, "previewCancelled");

}

- (void)previewDidCommit:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase previewState](self, "previewState"));
  objc_msgSend(v4, "previewDidCommit:", v3);

}

- (void)updateContentUnavailableConfigurationUsingState:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (objc_msgSend(v8, "showNoMessageSelectedView"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIContentUnavailableConfiguration emptyConfiguration](UIContentUnavailableConfiguration, "emptyConfiguration"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("NO_MESSAGE_SELECTED"), &stru_100531B00, CFSTR("Main")));
    objc_msgSend(v4, "setText:", v6);

    v7 = v4;
  }
  else
  {
    v7 = 0;
  }
  -[ConversationViewControllerBase setContentUnavailableConfiguration:](self, "setContentUnavailableConfiguration:", v7);

}

- (id)contentUnavailableConfigurationState
{
  void *v2;
  id v4;
  void *v5;
  unsigned int v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ConversationViewControllerBase;
  v4 = -[ConversationViewControllerBase contentUnavailableConfigurationState](&v9, "contentUnavailableConfigurationState");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = -[ConversationViewControllerBase shouldShowNoMessageSelectedView](self, "shouldShowNoMessageSelectedView");
  if (v6)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase delegate](self, "delegate"));
    v7 = objc_msgSend(v2, "conversationViewControllerCanShowNoMessageSelectedView:", self);
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v5, "setShowNoMessageSelectedView:", v7);
  if (v6)

  return v5;
}

- (void)_doSetShouldShowNoMessageSelectedView:(BOOL)a3
{
  self->_shouldShowNoMessageSelectedView = a3;
  -[ConversationViewControllerBase setNeedsUpdateContentUnavailableConfiguration](self, "setNeedsUpdateContentUnavailableConfiguration");
}

- (void)setShouldShowNoMessageSelectedView:(BOOL)a3
{
  if (self->_shouldShowNoMessageSelectedView != a3)
    -[ConversationViewControllerBase _doSetShouldShowNoMessageSelectedView:](self, "_doSetShouldShowNoMessageSelectedView:");
}

- (EMCollectionItemID)targetMessageItemIDForBarButtonTriage
{
  -[ConversationViewControllerBase doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[ConversationViewControllerBase targetMessageItemIDForBarButtonTriage]", "ConversationViewControllerBase.m", 1092, "0");
}

- (EMMessageListItem)targetMessageForBarButtonTriage
{
  -[ConversationViewControllerBase doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[ConversationViewControllerBase targetMessageForBarButtonTriage]", "ConversationViewControllerBase.m", 1096, "0");
}

- (void)_updateTitle
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  NSObject *WeakRetained;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  NSObject *v17;
  void *v18;
  void *v19;
  double Width;
  ConversationHeaderView *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned __int8 v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  unsigned int v38;
  __int16 v39;
  _BOOL4 v40;
  CGRect v41;

  v3 = -[ConversationViewControllerBase countOfMessages](self, "countOfMessages");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase navigationItem](self, "navigationItem"));
  objc_msgSend(v4, "setTitleView:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase scene](self, "scene"));
  if (v3 < 1
    || (v6 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase barItemsManager](self, "barItemsManager")),
        v7 = objc_msgSend(v6, "useDesktopClassNavigationBar"),
        v6,
        (v7 & 1) != 0))
  {
    WeakRetained = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase referenceMessageListItem](self, "referenceMessageListItem"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ef_publicDescription"));
      *(_DWORD *)buf = 138412290;
      v36 = (uint64_t)v10;
      _os_log_impl((void *)&_mh_execute_header, WeakRetained, OS_LOG_TYPE_DEFAULT, "Skip title update, message count is 0, referenceMessage=%@", buf, 0xCu);

    }
    v11 = 0;
LABEL_6:
    v12 = 0;
    goto LABEL_7;
  }
  if (!-[ConversationViewControllerBase isPrimary](self, "isPrimary"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector(WeakRetained, "titleForSingletonConversationViewController:") & 1) != 0)
      v11 = objc_claimAutoreleasedReturnValue(-[NSObject titleForSingletonConversationViewController:](WeakRetained, "titleForSingletonConversationViewController:", self));
    else
      v11 = 0;
    v32 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v36 = (uint64_t)WeakRetained;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Get title from delegate: %@", buf, 0xCu);
    }

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase conversationHeaderView](self, "conversationHeaderView"));
    objc_msgSend(v33, "setDelegate:", 0);

    goto LABEL_6;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("MESSAGE_COUNT_FORMAT%1$lu"), &stru_100531B00, CFSTR("Main")));
  WeakRetained = objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v15, v3));

  v16 = -[ConversationViewControllerBase _isDisplayingSingleMessage](self, "_isDisplayingSingleMessage");
  if (v16)
    v17 = 0;
  else
    v17 = WeakRetained;
  v11 = v17;
  if (-[ConversationViewControllerBase _shouldShowConversationHeader](self, "_shouldShowConversationHeader"))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase conversationHeaderView](self, "conversationHeaderView"));

    if (!v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase view](self, "view"));
      objc_msgSend(v19, "frame");
      Width = CGRectGetWidth(v41);

      v21 = -[ConversationHeaderView initWithFrame:]([ConversationHeaderView alloc], "initWithFrame:", 0.0, 0.0, Width, 0.0);
      -[ConversationViewControllerBase setConversationHeaderView:](self, "setConversationHeaderView:", v21);

    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase conversationHeaderView](self, "conversationHeaderView"));
    objc_msgSend(v22, "setDelegate:", self);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase conversationSubject](self, "conversationSubject"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[ECSubjectFormatter subjectStringForDisplayForSubject:style:](ECSubjectFormatter, "subjectStringForDisplayForSubject:style:", v23, 1));

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase conversationHeaderView](self, "conversationHeaderView"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "title"));
    v27 = objc_msgSend(v26, "isEqualToString:", v24);

    if ((v27 & 1) == 0)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase conversationHeaderView](self, "conversationHeaderView"));
      objc_msgSend(v28, "setCollapsed:animated:", 0, 0);

    }
    v29 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      v36 = v3;
      v37 = 1024;
      v38 = v16;
      v39 = 1024;
      v40 = v24 != 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Update conversation header view (messageCount=%ld, isDisplayingSingleMessage=%{BOOL}d, hasTrimmedSubject=%{BOOL}d)", buf, 0x18u);
    }

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase conversationHeaderView](self, "conversationHeaderView"));
    objc_msgSend(v30, "setSuperTitle:", v11);

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase conversationHeaderView](self, "conversationHeaderView"));
    objc_msgSend(v31, "setTitle:", v24);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase conversationHeaderView](self, "conversationHeaderView"));
  }
  else
  {
    v34 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v36 = v3;
      v37 = 1024;
      v38 = v16;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Update title (messageCount=%ld, isDisplayingSingleMessage=%{BOOL}d)", buf, 0x12u);
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase conversationHeaderView](self, "conversationHeaderView"));
    v12 = 0;
    objc_msgSend(v24, "setDelegate:", 0);
  }

LABEL_7:
  -[ConversationViewControllerBase setTitle:](self, "setTitle:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase navigationItem](self, "navigationItem"));
  objc_msgSend(v13, "setTitleView:", v12);

  objc_msgSend(v5, "mf_resetPreferredTitle");
}

- (id)mf_preferredTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase conversationSubject](self, "conversationSubject"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ECSubjectFormatter subjectStringForDisplayForSubject:style:](ECSubjectFormatter, "subjectStringForDisplayForSubject:style:", v2, 0));

  return v3;
}

- (BOOL)_shouldShowConversationHeader
{
  BOOL v3;
  void *v4;
  void *v5;
  id v6;

  v3 = -[ConversationViewControllerBase isPrimary](self, "isPrimary");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase conversationSubject](self, "conversationSubject"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subjectWithoutPrefix"));
  v6 = objc_msgSend(v5, "length");

  return v6 && v3;
}

- (id)_visibleNavigationBar
{
  void *v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_10007B40C;
  v11 = sub_10007B41C;
  v12 = (id)0xAAAAAAAAAAAAAAAALL;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase navigationController](self, "navigationController"));
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "navigationBar"));

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10007DF9C;
  v6[3] = &unk_10051C150;
  v6[4] = &v7;
  -[ConversationViewControllerBase _executeIfSplitViewIsAvailable:](self, "_executeIfSplitViewIsAvailable:", v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)_updateConversationHeaderViewLayoutMarginsWithSuperviewMargins:(NSDirectionalEdgeInsets)a3
{
  -[ConversationHeaderView directionalLayoutMargins](self->_conversationHeaderView, "directionalLayoutMargins", a3.top, a3.leading, a3.bottom);
  -[ConversationHeaderView setDirectionalLayoutMargins:](self->_conversationHeaderView, "setDirectionalLayoutMargins:");
}

- (void)_updateNavigationChromelessSettings
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;

  if (+[UIDevice mf_isPad](UIDevice, "mf_isPad")
    && (v13 = (id)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase traitCollection](self, "traitCollection")),
        v3 = objc_msgSend(v13, "horizontalSizeClass"),
        v13,
        v3 == (id)2))
  {
    v14 = (id)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase navigationController](self, "navigationController"));
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "navigationBar"));
    objc_msgSend((id)v4, "setScrollEdgeAppearance:", 0);

    v15 = (id)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase navigationItem](self, "navigationItem"));
    LOBYTE(v4) = objc_msgSend(v15, "_isManualScrollEdgeAppearanceEnabled");

    if ((v4 & 1) != 0)
      return;
    v16 = (id)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase navigationItem](self, "navigationItem"));
    objc_msgSend(v16, "_setAutoScrollEdgeTransitionDistance:", 1.0);

    v17 = (id)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase navigationItem](self, "navigationItem"));
    objc_msgSend(v17, "_setManualScrollEdgeAppearanceProgress:", 1.0);

    v18 = (id)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase navigationItem](self, "navigationItem"));
    objc_msgSend(v18, "_setManualScrollEdgeAppearanceEnabled:", 1);
  }
  else
  {
    v19 = (id)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase navigationController](self, "navigationController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "navigationBar"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "standardAppearance"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase navigationController](self, "navigationController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "navigationBar"));
    objc_msgSend(v8, "setScrollEdgeAppearance:", v6);

    v20 = (id)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase navigationItem](self, "navigationItem"));
    objc_msgSend(v20, "_setManualScrollEdgeAppearanceEnabled:", 0);

    if (!-[ConversationViewControllerBase allowQuickReply](self, "allowQuickReply"))
      return;
    v18 = (id)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase navigationController](self, "navigationController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "toolbar"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "standardAppearance"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase navigationController](self, "navigationController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "toolbar"));
    objc_msgSend(v12, "setScrollEdgeAppearance:", v10);

  }
}

- (void)_resetNavigationChromelessAppearance
{
  void *v3;
  UINavigationBarAppearance *v4;

  v4 = objc_opt_new(UINavigationBarAppearance);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase navigationItem](self, "navigationItem"));
  objc_msgSend(v3, "setStandardAppearance:", v4);

}

- (void)_updateLayout
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  NSObject *v19;
  void *v20;
  MFSwipableCollectionViewLayout *v21;
  double v22;
  double v23;
  double v24;
  int v25;
  void *v26;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase viewIfLoaded](self, "viewIfLoaded"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window"));

  if (v4)
  {
    -[ConversationViewControllerBase _calculateCollectionViewInsets](self, "_calculateCollectionViewInsets");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
    objc_msgSend(v13, "contentInset");
    if (v17 == v8 && v14 == v6 && v16 == v12)
    {
      v18 = v15;

      if (v18 == v10)
      {
LABEL_12:
        v21 = self->_conversationLayout;
        -[ConversationViewControllerBase _itemSpacing](self, "_itemSpacing");
        v23 = v22;
        -[MFSwipableCollectionViewLayout minimumLineSpacing](v21, "minimumLineSpacing");
        if (v24 != v23)
          -[MFSwipableCollectionViewLayout setMinimumLineSpacing:](v21, "setMinimumLineSpacing:", v23);
        -[ConversationViewControllerBase _updateCollectionViewMargins](self, "_updateCollectionViewMargins");

        goto LABEL_15;
      }
    }
    else
    {

    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
    objc_msgSend(v20, "setContentInset:", v6, v8, v10, v12);

    goto LABEL_12;
  }
  v19 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v25 = 134217984;
    v26 = v3;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Skip _updateLayout since window is nil (view:%p)", (uint8_t *)&v25, 0xCu);
  }

LABEL_15:
}

- (void)_reloadPreparedCells
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void **v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *);
  void *v10;
  ConversationViewControllerBase *v11;
  id v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase cellConfigurator](self, "cellConfigurator"));
  v7 = _NSConcreteStackBlock;
  v8 = 3221225472;
  v9 = sub_10007E678;
  v10 = &unk_10051C178;
  v11 = self;
  v5 = v3;
  v12 = v5;
  objc_msgSend(v4, "enumeratePreparedCellsWithBlock:", &v7);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allObjects", v7, v8, v9, v10, v11));
  -[ConversationViewControllerBase _reloadCellsAtIndexPaths:animated:](self, "_reloadCellsAtIndexPaths:animated:", v6, 1);

}

- (void)_updateCells
{
  unsigned __int8 v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  int64_t v25;
  void **v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *);
  void *v29;
  id v30;
  id v31;
  uint64_t *v32;
  unsigned __int8 v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint8_t buf[4];
  id v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  int64_t v43;

  v3 = -[ConversationViewControllerBase _isDisplayingSingleMessage](self, "_isDisplayingSingleMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase cellConfigurator](self, "cellConfigurator"));
  v26 = _NSConcreteStackBlock;
  v27 = 3221225472;
  v28 = sub_10007EAB0;
  v29 = &unk_10051C1A0;
  v32 = &v34;
  v7 = v5;
  v30 = v7;
  v33 = v3;
  v8 = v4;
  v31 = v8;
  objc_msgSend(v6, "enumerateExpandedCellsWithBlock:", &v26);

  v9 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log", v26, v27, v28, v29));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v23 = objc_msgSend(v8, "count");
    v24 = v35[3];
    v25 = -[ConversationViewControllerBase countOfMessages](self, "countOfMessages");
    *(_DWORD *)buf = 134218496;
    v39 = v23;
    v40 = 2048;
    v41 = v24;
    v42 = 2048;
    v43 = v25;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "_updateCells reloadIndexPath.count:%lu expandedCellCount:%lu countOfMessages:%li", buf, 0x20u);
  }

  if (objc_msgSend(v8, "count"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allObjects"));
    -[ConversationViewControllerBase _reloadCellsAtIndexPaths:animated:](self, "_reloadCellsAtIndexPaths:animated:", v10, 1);
LABEL_5:

    goto LABEL_7;
  }
  if (!v35[3] && -[ConversationViewControllerBase countOfMessages](self, "countOfMessages") >= 1)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase _indexPathForReferenceMessage](self, "_indexPathForReferenceMessage"));
    v11 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      sub_100390D54((uint64_t)v10, v11, v12, v13, v14, v15, v16, v17);

    if (v10)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase _messageItemIDAtIndexPath:](self, "_messageItemIDAtIndexPath:", v10));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase cellConfigurator](self, "cellConfigurator"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "expansionTracker"));
      v21 = objc_msgSend(v20, "expansionStatusForCellWithItemID:", v18);

      if (v21 == (id)3)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase cellConfigurator](self, "cellConfigurator"));
        objc_msgSend(v22, "expandCellAtIndexPath:animated:highlightFirst:", v10, 0, 0);

      }
    }
    goto LABEL_5;
  }
LABEL_7:

  _Block_object_dispose(&v34, 8);
}

- (void)_reloadCellsAtIndexPaths:(id)a3 animated:(BOOL)a4
{
  id v6;

  v6 = a3;
  -[ConversationViewControllerBase doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[ConversationViewControllerBase _reloadCellsAtIndexPaths:animated:]", "ConversationViewControllerBase.m", 1418, "0");
}

- (void)_invalidateQuickReplyFooter
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  void *v11;

  v3 = objc_alloc_init((Class)UICollectionViewFlowLayoutInvalidationContext);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", 0, 0));
  v11 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
  objc_msgSend(v3, "invalidateSupplementaryElementsOfKind:atIndexPaths:", UICollectionElementKindSectionFooter, v5);

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10007ED38;
  v8[3] = &unk_10051A910;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
  v6 = v3;
  v10 = v6;
  v7 = v9;
  objc_msgSend(v7, "performBatchUpdates:completion:", v8, 0);

}

- (void)updateUserActivityState:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase handoffCoordinator](self, "handoffCoordinator", a3));
  objc_msgSend(v3, "updateUserActivityState");

}

- (id)_indexPathForTopMostVisibleRow
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
  objc_msgSend(v6, "contentOffset");
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
  objc_msgSend(v9, "contentInset");
  v11 = v8 + v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "indexPathForItemAtPoint:", v5 * 0.5, v11));

  return v13;
}

- (void)setPinnedItem:(id)a3
{
  id v4;
  NSObject *v5;
  PinnedConversationItem **p_pinnedItem;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;

  v4 = a3;
  if (-[ConversationViewControllerBase disableScrollPinning](self, "disableScrollPinning"))
  {
    v5 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Pinning is disabled. This is for testing purposes only.", (uint8_t *)&v11, 2u);
    }

    v4 = 0;
  }
  p_pinnedItem = &self->_pinnedItem;
  if (!-[PinnedConversationItem isEqual:](*p_pinnedItem, "isEqual:", v4))
  {
    if (*p_pinnedItem)
    {
      v7 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[PinnedConversationItem ef_publicDescription](*p_pinnedItem, "ef_publicDescription"));
        v11 = 138412290;
        v12 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Unpinning %@", (uint8_t *)&v11, 0xCu);

      }
    }
    if (v4)
    {
      v9 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ef_publicDescription"));
        v11 = 138412290;
        v12 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Pinning to %@", (uint8_t *)&v11, 0xCu);

      }
    }
    objc_storeStrong((id *)p_pinnedItem, v4);
  }

}

- (void)_restorePinnedScrollPosition
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase pinnedItem](self, "pinnedItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "indexPath"));
  if (v6)
  {
    if (v3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dynamicOffset"));

      if (v4)
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dynamicOffset"));
        -[ConversationViewControllerBase _scrollToItemAtIndexPath:dynamicOffset:shouldAdjustToShowPreviousMessage:animated:pin:completion:](self, "_scrollToItemAtIndexPath:dynamicOffset:shouldAdjustToShowPreviousMessage:animated:pin:completion:", v3, v5, 1, 0, 0, 0);

      }
    }
  }

}

- (void)_maybeAttemptLoadMissingMessages:(id)a3
{
  unint64_t v4;
  unsigned int v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v11;

  v11 = a3;
  v4 = -[ConversationViewControllerBase conversationSortOrder](self, "conversationSortOrder");
  if ((objc_msgSend(v11, "isTracking") & 1) != 0)
    v5 = 1;
  else
    v5 = objc_msgSend(v11, "isDecelerating");
  objc_msgSend(v11, "_verticalVelocity");
  v7 = v6;
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v9 = -v7;
  if (v4 == 1)
    v9 = v7;
  if (v5)
  {
    if (v9 > 0.0 && v8 >= self->_nextAvailableLoadMoreInterval)
      -[ConversationViewControllerBase _attemptLoadMissingMessages](self, "_attemptLoadMissingMessages");
  }

}

- (void)_attemptLoadMissingMessages
{
  double v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase _oldestIndexPath](self, "_oldestIndexPath"));
  if (v4)
    -[ConversationViewControllerBase _loadMoreMessagesWithMaxVisibleIndexPath:](self, "_loadMoreMessagesWithMaxVisibleIndexPath:", v4);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  self->_nextAvailableLoadMoreInterval = v3 + 0.5;

}

- (void)scrollViewDidScroll:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase viewIfLoaded](self, "viewIfLoaded"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));

  if (v5)
  {
    if ((id)-[ConversationViewControllerBase resizingState](self, "resizingState") != (id)3)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "visibleCells"));
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_10007F410;
      v9[3] = &unk_10051BD20;
      v9[4] = self;
      objc_msgSend(v7, "enumerateObjectsUsingBlock:", v9);

      -[MFConversationCellExpansionGestureRecognizer cancel](self->_cellExpansionRecognizer, "cancel");
      if (-[ConversationViewControllerBase allowQuickReply](self, "allowQuickReply"))
        -[ConversationViewControllerBase _updateQuickReplySendButtonOffset:](self, "_updateQuickReplySendButtonOffset:", v8);
    }
  }

}

- (void)scrollViewDidScrollToTop:(id)a3
{
  void *v4;

  -[ConversationViewControllerBase setPinnedItem:](self, "setPinnedItem:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, 0));
  -[ConversationViewControllerBase _updateHandoffWithMessageAtIndexPath:](self, "_updateHandoffWithMessageAtIndexPath:", v4);

  -[ConversationViewControllerBase mf_updateAlertSuppressionContextsForReason:](self, "mf_updateAlertSuppressionContextsForReason:", CFSTR("scrolled to top"));
  if (!-[ConversationViewControllerBase conversationSortOrder](self, "conversationSortOrder"))
    -[ConversationViewControllerBase _attemptLoadMissingMessages](self, "_attemptLoadMissingMessages");
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[ConversationViewControllerBase mf_updateAlertSuppressionContextsForReason:](self, "mf_updateAlertSuppressionContextsForReason:", CFSTR("begin Dragging"));
  -[ConversationViewControllerBase setPinnedItem:](self, "setPinnedItem:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase conversationHeaderView](self, "conversationHeaderView"));
  objc_msgSend(v4, "hostScrollViewWillBeginDragging:", v5);

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  double x;
  double v9;
  void *v10;
  void *v11;
  id v12;

  y = a4.y;
  x = a4.x;
  v12 = a3;
  v9 = -y;
  if (y >= 0.0)
    v9 = y;
  if (v9 < 0.00000011920929)
  {
    -[ConversationViewControllerBase pinCurrentItem](self, "pinCurrentItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase handoffCoordinator](self, "handoffCoordinator"));
    objc_msgSend(v10, "updateHandoffMessageBasedOnMessageVisibility");

    -[ConversationViewControllerBase updateArrowControlsView](self, "updateArrowControlsView");
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase conversationHeaderView](self, "conversationHeaderView"));
  objc_msgSend(v11, "hostScrollViewWillEndDragging:withVelocity:targetContentOffset:", v12, a5, x, y);

}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[ConversationViewControllerBase pinCurrentItem](self, "pinCurrentItem");
  -[ConversationViewControllerBase _shrinkBottomPaddingIfNecessary](self, "_shrinkBottomPaddingIfNecessary");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase handoffCoordinator](self, "handoffCoordinator"));
  objc_msgSend(v4, "updateHandoffMessageBasedOnMessageVisibility");

  -[ConversationViewControllerBase updateArrowControlsView](self, "updateArrowControlsView");
  -[ConversationViewControllerBase mf_updateAlertSuppressionContextsForReason:](self, "mf_updateAlertSuppressionContextsForReason:", CFSTR("ended decelerating"));
  if (-[ConversationViewControllerBase _scrollViewIsScrolledToEnd:](self, "_scrollViewIsScrolledToEnd:", v6)
    && -[ConversationViewControllerBase _isDisplayingSingleMessage](self, "_isDisplayingSingleMessage"))
  {
    -[ConversationViewControllerBase _scrolledToEndOfSingleMessage](self, "_scrolledToEndOfSingleMessage");
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase conversationHeaderView](self, "conversationHeaderView"));
  objc_msgSend(v5, "hostScrollViewDidEndDecelerating:", v6);

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v6;

  v6 = a3;
  if (!a4)
    -[ConversationViewControllerBase _shrinkBottomPaddingIfNecessary](self, "_shrinkBottomPaddingIfNecessary");
  -[ConversationViewControllerBase mf_updateAlertSuppressionContextsForReason:](self, "mf_updateAlertSuppressionContextsForReason:", CFSTR("ended dragging"));

}

- (void)_shrinkBottomPaddingIfNecessary
{
  double v3;
  double v4;
  double MaxY;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  CGRect v11;

  if (!-[ConversationViewControllerBase _isDisplayingSingleMessage](self, "_isDisplayingSingleMessage"))
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
    objc_msgSend(v10, "_contentScrollInset");
    v4 = v3;
    if (v3 > 0.00000011920929)
    {
      objc_msgSend(v10, "visibleBounds");
      MaxY = CGRectGetMaxY(v11);
      objc_msgSend(v10, "contentInset");
      v7 = v6;
      objc_msgSend(v10, "contentSize");
      v9 = MaxY - v7 - v8;
      if (v9 < 0.0)
        v9 = 0.0;
      if (v4 - v9 > 0.00000011920929)
      {
        *(_BYTE *)&self->_flags |= 8u;
        -[ConversationViewControllerBase _setBottomPadding:](self, "_setBottomPadding:");
      }
    }

  }
}

- (void)_scrollToItemAtIndexPath:(id)a3 dynamicOffset:(id)a4 shouldAdjustToShowPreviousMessage:(BOOL)a5 animated:(BOOL)a6 pin:(BOOL)a7 completion:(id)a8
{
  _BOOL4 v9;
  _BOOL8 v10;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  void *v19;
  MFCollectionViewPagingAnimator *v20;
  void *v21;
  MFCollectionViewPagingAnimator *v22;
  MFCollectionViewPagingAnimator *pagingAnimator;
  MFCollectionViewPagingAnimator *v24;
  id v25;
  id v26;
  _BOOL4 v27;
  _QWORD v28[5];
  id v29;
  id v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  _BOOL4 v38;
  __int16 v39;
  _BOOL4 v40;

  v9 = a7;
  v10 = a6;
  v27 = a5;
  v13 = a3;
  v14 = a4;
  v15 = a8;
  v16 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = objc_msgSend(v13, "section");
    v18 = objc_msgSend(v13, "item");
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "ef_publicDescription"));
    *(_DWORD *)buf = 134219010;
    v32 = v17;
    v33 = 2048;
    v34 = v18;
    v35 = 2112;
    v36 = v19;
    v37 = 1024;
    v38 = v10;
    v39 = 1024;
    v40 = v9;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Scroll to item at index path {%ld, %ld}, dynamicOffset: %@, animated: %{BOOL}d, pin:%{BOOL}d", buf, 0x2Cu);

  }
  -[ConversationViewControllerBase _ensureSubjectViewLayoutIfNeededAtIndexPath:](self, "_ensureSubjectViewLayoutIfNeededAtIndexPath:", v13);
  if (v9 && !-[ConversationViewControllerBase disableScrollPinning](self, "disableScrollPinning"))
  {
    -[ConversationViewControllerBase pinItemAtIndexPath:dynamicOffset:](self, "pinItemAtIndexPath:dynamicOffset:", v13, v14);
    if ((uint64_t)objc_msgSend(v13, "item") >= 1)
    {
      *(_BYTE *)&self->_flags &= ~8u;
      -[ConversationViewControllerBase _updateBottomPadding](self, "_updateBottomPadding");
    }
  }
  -[ConversationViewControllerBase _updateHandoffWithMessageAtIndexPath:](self, "_updateHandoffWithMessageAtIndexPath:", v13);
  -[ConversationViewControllerBase updateArrowControlsView](self, "updateArrowControlsView");
  if (!self->_pagingAnimator)
  {
    v20 = [MFCollectionViewPagingAnimator alloc];
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
    v22 = -[MFCollectionViewPagingAnimator initWithCollectionView:](v20, "initWithCollectionView:", v21);
    pagingAnimator = self->_pagingAnimator;
    self->_pagingAnimator = v22;

  }
  -[ConversationViewControllerBase _autoscrollAdjustmentWithBaseOffset:](self, "_autoscrollAdjustmentWithBaseOffset:", 10.0);
  -[MFCollectionViewPagingAnimator setAutoScrollOffsetAdjustment:](self->_pagingAnimator, "setAutoScrollOffsetAdjustment:");
  -[ConversationViewControllerBase _autoscrollAdjustmentWithBaseOffset:](self, "_autoscrollAdjustmentWithBaseOffset:", 5.0);
  -[MFCollectionViewPagingAnimator setAutoScrollOffsetAdjustmentWithoutPreviousMessage:](self->_pagingAnimator, "setAutoScrollOffsetAdjustmentWithoutPreviousMessage:");
  v24 = self->_pagingAnimator;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10007FC30;
  v28[3] = &unk_10051C1C8;
  v28[4] = self;
  v25 = v13;
  v29 = v25;
  v26 = v15;
  v30 = v26;
  -[MFCollectionViewPagingAnimator scrollToItemAtIndexPath:dynamicOffset:shouldAdjustToShowPreviousMessage:animated:completion:](v24, "scrollToItemAtIndexPath:dynamicOffset:shouldAdjustToShowPreviousMessage:animated:completion:", v25, v14, v27, v10, v28);

}

- (id)_layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ConversationViewControllerBase _ensureSubjectViewLayoutIfNeededAtIndexPath:](self, "_ensureSubjectViewLayoutIfNeededAtIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layoutAttributesForItemAtIndexPath:", v4));

  return v6;
}

- (void)_ensureSubjectViewLayoutIfNeededAtIndexPath:(id)a3
{
  -[ConversationHeaderView layoutIfNeeded](self->_conversationHeaderView, "layoutIfNeeded", a3);
}

- (void)_resetBottomPaddingIfDisplayingSingleMessage
{
  if (-[ConversationViewControllerBase _isDisplayingSingleMessage](self, "_isDisplayingSingleMessage"))
    -[ConversationViewControllerBase _setBottomPadding:](self, "_setBottomPadding:", 0.0);
}

- (void)_updateBottomPadding
{
  uint64_t v3;
  void *v4;
  double v5;
  double v6;
  id v7;

  if ((*(_BYTE *)&self->_flags & 8) == 0)
  {
    v3 = -[ConversationViewControllerBase countOfMessages](self, "countOfMessages");
    if (v3 >= 1)
    {
      v7 = (id)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", v3 - 1, 0));
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase cellConfigurator](self, "cellConfigurator"));
      objc_msgSend(v4, "sizeForItemAtIndexPath:", v7);
      v6 = v5;

      -[ConversationViewControllerBase _updateBottomPaddingWithLastItemHeight:](self, "_updateBottomPaddingWithLastItemHeight:", v6);
    }
  }
}

- (void)_updateBottomPaddingWithLastItemHeight:(double)a3
{
  unsigned __int8 v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;

  v5 = -[ConversationViewControllerBase _isDisplayingSingleMessage](self, "_isDisplayingSingleMessage");
  v6 = 0.0;
  if ((v5 & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView", 0.0));
    objc_msgSend(v7, "mf_visibleHeight");
    v9 = v8;

    -[ConversationViewControllerBase _autoscrollAdjustmentWithBaseOffset:](self, "_autoscrollAdjustmentWithBaseOffset:", 10.0);
    v6 = v9 - (fmax(a3, 276.0) + v10);
  }
  -[ConversationViewControllerBase _setBottomPadding:](self, "_setBottomPadding:", v6);
}

- (void)_setBottomPadding:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  __n128 v12;
  double v13;
  id v14;
  id v15;
  id v16;

  if (!_os_feature_enabled_impl("Mail", "QuickReply")
    || !-[ConversationViewControllerBase isPerformingQuickReplySendAnimation](self, "isPerformingQuickReplySendAnimation"))
  {
    v14 = (id)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
    objc_msgSend(v14, "_contentScrollInset");
    v6 = v5;
    v8 = v7;
    v10 = v9;

    v11 = objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
    v12.n128_f64[0] = a3;
    v15 = (id)v11;
    v13 = UIRoundToViewScale(v11, v12);

    v16 = (id)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
    objc_msgSend(v16, "_setContentScrollInset:", v6, v8, fmax(v13, 0.0), v10);

  }
}

- (void)cellConfigurator:(id)a3 didConfigureCell:(id)a4 atIndexPath:(id)a5
{
  ConversationViewControllerBase *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  _BOOL8 v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  uint64_t v26;
  __int16 v27;
  ConversationViewControllerBase *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  id v32;
  __int16 v33;
  void *v34;

  v7 = (ConversationViewControllerBase *)a4;
  v8 = a5;
  v9 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v25 = 138543874;
    v26 = objc_opt_class(v7);
    v27 = 2048;
    v28 = v7;
    v29 = 2114;
    v30 = (uint64_t)v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Configuring class:%{public}@ cell:%p indexPath:%{public}@", (uint8_t *)&v25, 0x20u);
  }

  v10 = objc_opt_class(MFExpandedMessageCell);
  if ((objc_opt_isKindOfClass(v7, v10) & 1) != 0)
  {
    v11 = -[ConversationViewControllerBase _shouldAutomaticallyCollapseQuotedContentForCellAtIndexPath:](self, "_shouldAutomaticallyCollapseQuotedContentForCellAtIndexPath:", v8);
    v12 = v7;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject viewModel](v12, "viewModel"));
    -[ConversationViewControllerBase _configureExpandedCell:atIndexPath:viewModel:collapseQuotedContent:](self, "_configureExpandedCell:atIndexPath:viewModel:collapseQuotedContent:", v12, v8, v13, v11);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject messageViewController](v12, "messageViewController"));
    -[ConversationViewControllerBase addChildViewController:](self, "addChildViewController:", v14);
    objc_msgSend(v14, "didMoveToParentViewController:", self);
    v15 = -[ConversationViewControllerBase resizingState](self, "resizingState");
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "messageContentView"));
    objc_msgSend(v16, "setContentPaddingFollowsLayoutMargins:", v15 != 2);

LABEL_10:
    goto LABEL_11;
  }
  v17 = objc_opt_class(MFCollapsedMessageCell);
  if ((objc_opt_isKindOfClass(v7, v17) & 1) != 0)
  {
    v12 = v7;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject viewModel](v12, "viewModel"));
    -[ConversationViewControllerBase _configureCollapsedCell:atIndexPath:viewModel:](self, "_configureCollapsedCell:atIndexPath:viewModel:", v12, v8, v18);

    goto LABEL_10;
  }
  v19 = objc_opt_class(MFGeneratedSummaryViewCell);
  if ((objc_opt_isKindOfClass(v7, v19) & 1) == 0)
  {
    v12 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v20 = objc_opt_class(self);
      v21 = objc_opt_class(v7);
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase viewModel](v7, "viewModel"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "messageContentRequest"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "itemID"));
      v25 = 138413314;
      v26 = v20;
      v27 = 2048;
      v28 = self;
      v29 = 2112;
      v30 = v21;
      v31 = 2112;
      v32 = v8;
      v33 = 2114;
      v34 = v24;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "<%@: %p> Cannot configure an unknown cell type %@ at indexPath %@ for itemID: %{public}@", (uint8_t *)&v25, 0x34u);

    }
    goto LABEL_10;
  }
LABEL_11:

}

- (int64_t)cellConfigurator:(id)a3 expansionStatusForMessageAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  int64_t v7;
  unsigned int v9;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase _indexPathForReferenceMessage](self, "_indexPathForReferenceMessage"));
  if ((objc_msgSend(v5, "isEqual:", v6) & 1) != 0
    || -[ConversationViewControllerBase _isQuickReplyMessageAtIndexPath:](self, "_isQuickReplyMessageAtIndexPath:", v5)
    || -[ConversationViewControllerBase _isUndoSendMessageAtIndexPath:](self, "_isUndoSendMessageAtIndexPath:", v5))
  {

    v7 = 3;
  }
  else
  {
    v9 = -[ConversationViewControllerBase _isItemInitiallyUnreadAtIndexPath:](self, "_isItemInitiallyUnreadAtIndexPath:", v5);

    if (v9)
      v7 = 3;
    else
      v7 = 1;
  }

  return v7;
}

- (void)cellConfigurator:(id)a3 didInvalidateConfigurationForCellsAtIndexPaths:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  ConversationViewControllerBase *v10;
  id v11;
  id v12;

  v7 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase pinnedItem](self, "pinnedItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPath"));
  if (!-[ConversationViewControllerBase _isDisplayingSingleMessage](self, "_isDisplayingSingleMessage") && v5 && v6)
  {
    -[ConversationViewControllerBase setPinnedItem:](self, "setPinnedItem:", 0);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000805CC;
    v8[3] = &unk_10051C1F0;
    v9 = v7;
    v10 = self;
    v11 = v6;
    v12 = v5;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v8);

  }
}

- (id)cellConfigurator:(id)a3 targetHeightForExpandingCellAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase _messageItemIDAtIndexPath:](self, "_messageItemIDAtIndexPath:", a4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase _currentSizeMetadataKey](self, "_currentSizeMetadataKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), v5, v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase cellHeightCache](self, "cellHeightCache"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v7));

  return v9;
}

- (id)cellConfigurator:(id)a3 messageItemIDAtIndexPath:(id)a4
{
  id v7;
  id v8;

  v7 = a3;
  v8 = a4;
  -[ConversationViewControllerBase doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[ConversationViewControllerBase cellConfigurator:messageItemIDAtIndexPath:]", "ConversationViewControllerBase.m", 1846, "0");
}

- (void)cellConfigurator:(id)a3 wantsToReloadCellAtIndexPaths:(id)a4 animated:(BOOL)a5
{
  id v8;
  id v9;

  v8 = a3;
  v9 = a4;
  -[ConversationViewControllerBase doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[ConversationViewControllerBase cellConfigurator:wantsToReloadCellAtIndexPaths:animated:]", "ConversationViewControllerBase.m", 1850, "0");
}

- (BOOL)collapsedCellsShowsSubjectForCellConfigurator:(id)a3
{
  return 0;
}

- (id)_currentSizeMetadataKey
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGFloat Width;
  uint64_t v13;
  void *v14;
  unsigned int v15;
  const __CFString *v16;
  void *v17;
  CGRect v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
  objc_msgSend(v3, "mf_visibleBounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v19.origin.x = v5;
  v19.origin.y = v7;
  v19.size.width = v9;
  v19.size.height = v11;
  Width = CGRectGetWidth(v19);
  v13 = MFModernUIApplicationPreferredContentSizeCode();
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = -[ConversationViewControllerBase _isDisplayingSingleMessage](self, "_isDisplayingSingleMessage");
  v16 = CFSTR("conversation");
  if (v15)
    v16 = CFSTR("single");
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("v%@-w%.1f-s%@-%@"), CFSTR("1.0"), *(_QWORD *)&Width, v14, v16));

  return v17;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  double v6;
  double v7;
  double v8;
  double height;
  double width;
  CGSize result;

  if (-[ConversationViewControllerBase allowQuickReply](self, "allowQuickReply", a3, a4, a5)
    && -[ConversationViewControllerBase didCompleteFirstPaint](self, "didCompleteFirstPaint")
    && (id)-[ConversationViewControllerBase conversationSortOrder](self, "conversationSortOrder") == (id)1)
  {
    -[ConversationViewControllerBase quickReplyHeight](self, "quickReplyHeight");
    v7 = v6;
    -[ConversationViewControllerBase _itemSpacing](self, "_itemSpacing");
    height = v7 + v8;
    width = 0.0;
  }
  else
  {
    width = CGSizeZero.width;
    height = CGSizeZero.height;
  }
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5
{
  double width;
  double height;
  double v8;
  double v9;
  double v10;
  CGSize result;

  if (-[ConversationViewControllerBase allowQuickReply](self, "allowQuickReply", a3, a4, a5)
    && -[ConversationViewControllerBase didCompleteFirstPaint](self, "didCompleteFirstPaint")
    && !-[ConversationViewControllerBase conversationSortOrder](self, "conversationSortOrder"))
  {
    -[ConversationViewControllerBase quickReplyHeight](self, "quickReplyHeight");
    v9 = v8;
    -[ConversationViewControllerBase _itemSpacing](self, "_itemSpacing");
    height = v9 + v10;
    width = 0.0;
  }
  else
  {
    width = CGSizeZero.width;
    height = CGSizeZero.height;
  }
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  NSObject *v11;
  NSObject *v12;
  double v13;
  double v14;
  CGSize result;

  v6 = a5;
  -[MFConversationCellConfigurator sizeForItemAtIndexPath:](self->_cellConfigurator, "sizeForItemAtIndexPath:", v6);
  v8 = v7;
  v10 = v9;
  if (v9 < 0.0)
  {
    v11 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_100390E18();

    v10 = 0.0;
  }
  if (v8 < 0.0)
  {
    v12 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_100390DB8();

    v8 = 0.0;
  }

  v13 = v8;
  v14 = v10;
  result.height = v14;
  result.width = v13;
  return result;
}

- (double)_itemSpacing
{
  double v3;

  v3 = 10.0;
  if ((+[UIDevice mf_isPad](UIDevice, "mf_isPad") & 1) == 0
    && (_os_feature_enabled_impl("Mail", "QuickReply") & 1) == 0
    && (!_os_feature_enabled_impl("Mail", "CatchUpManualSummarization")
     || (EMIsGreymatterAvailableWithOverride() & 1) == 0))
  {
    if (-[ConversationViewControllerBase _isDisplayingSingleMessage](self, "_isDisplayingSingleMessage"))
      return 0.0;
    else
      return 10.0;
  }
  return v3;
}

- (double)_minimumItemHeight
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase displayMetrics](self, "displayMetrics"));
  +[MFCollapsedMessageCell defaultHeightWithDisplayMetrics:](MFCollapsedMessageCell, "defaultHeightWithDisplayMetrics:", v2);
  v4 = v3 + 180.0;

  return v4;
}

- (double)_autoscrollAdjustmentWithBaseOffset:(double)a3
{
  double v5;
  double v6;
  void *v7;
  double v8;
  unsigned int v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  void *v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v30;
  double v31;
  CGFloat r2;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  -[ConversationViewControllerBase _itemSpacing](self, "_itemSpacing");
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase previewState](self, "previewState"));
  v8 = v6 + a3;
  if (objc_msgSend(v7, "shouldScheduleMarkMessageAsRead"))
  {
    v9 = -[ConversationViewControllerBase _shouldShowConversationHeader](self, "_shouldShowConversationHeader");

    if (v9)
    {
      -[ConversationHeaderView frame](self->_conversationHeaderView, "frame");
      r2 = v10;
      v12 = v11;
      v14 = v13;
      v16 = v15;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase _visibleNavigationBar](self, "_visibleNavigationBar"));
      objc_msgSend(v17, "bounds");
      v19 = v18;
      v21 = v20;
      v23 = v22;
      v25 = v24;

      v34.origin.x = v19;
      v34.origin.y = v21;
      v34.size.width = v23;
      v34.size.height = v25;
      v37.origin.x = r2;
      v37.origin.y = v12;
      v37.size.width = v14;
      v37.size.height = v16;
      v35 = CGRectIntersection(v34, v37);
      x = v35.origin.x;
      y = v35.origin.y;
      width = v35.size.width;
      height = v35.size.height;
      -[ConversationHeaderView contentHeight](self->_conversationHeaderView, "contentHeight");
      v31 = v30;
      v36.origin.x = x;
      v36.origin.y = y;
      v36.size.width = width;
      v36.size.height = height;
      return v8 + v31 - CGRectGetHeight(v36);
    }
  }
  else
  {

  }
  return v8;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a4;
  v7 = a5;
  -[ConversationViewControllerBase _toggleCellGroupOpacityIfNeeded:displaying:](self, "_toggleCellGroupOpacityIfNeeded:displaying:", v17, 1);
  v8 = objc_opt_class(MFExpandedMessageCell);
  if ((objc_opt_isKindOfClass(v17, v8) & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MFSwipableCollectionViewLayout expandingIndexPath](self->_conversationLayout, "expandingIndexPath"));
    v10 = objc_msgSend(v7, "compare:", v9);

    if (!v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "layer"));
      objc_msgSend(v11, "setAllowsGroupOpacity:", 0);

    }
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "viewModel"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "messageContentRequest"));

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "viewModel"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "messageContentRequest"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "message"));
    objc_msgSend(v17, "associateViewWithEntityFromMessageItem:", v16);

  }
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  unsigned __int8 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;

  v27 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_opt_class(MFExpandedMessageCell);
  if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0)
  {
    v11 = v8;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "viewModel"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "messageContentRequest"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "itemID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase _messageItemIDAtIndexPath:](self, "_messageItemIDAtIndexPath:", v9));
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16
      || (v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "indexPathsForVisibleItems")),
          v18 = objc_msgSend(v17, "containsObject:", v9),
          v17,
          (v18 & 1) == 0))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "viewModel"));
      -[ConversationViewControllerBase cancelAutomaticMarkAsReadForCellViewModel:](self, "cancelAutomaticMarkAsReadForCellViewModel:", v19);

    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "messageViewController"));
    objc_msgSend(v20, "willMoveToParentViewController:", 0);
    objc_msgSend(v20, "removeFromParentViewController");
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "valueForKeyPath:", CFSTR("firstResponderViewType")));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "valueForKeyPath:", CFSTR("firstResponderView")));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "valueForKeyPath:", CFSTR("firstResponderIndexPath")));
    if (v22 && objc_msgSend(v21, "integerValue") == (id)1 && v23)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase _layoutAttributesForItemAtIndexPath:](self, "_layoutAttributesForItemAtIndexPath:", v23));
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_1000811F0;
      v28[3] = &unk_10051A910;
      v29 = v22;
      v30 = v24;
      v25 = v24;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v28);

    }
    -[ConversationViewControllerBase _enqueueMessageViewController:](self, "_enqueueMessageViewController:", v20);
    objc_msgSend(v20, "setDelegate:", 0);
    objc_msgSend(v11, "setMessageViewController:", 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "layer"));
    objc_msgSend(v26, "setAllowsGroupOpacity:", 1);

  }
  -[ConversationViewControllerBase _toggleCellGroupOpacityIfNeeded:displaying:](self, "_toggleCellGroupOpacityIfNeeded:displaying:", v8, 0);

}

- (int64_t)_collectionView:(id)a3 dataOwnerForDragSession:(id)a4 atIndexPath:(id)a5
{
  return -[ConversationViewControllerBase _dataOwnerForDragSessionAtIndexPath:](self, "_dataOwnerForDragSessionAtIndexPath:", a5, a4);
}

- (id)collectionView:(id)a3 dragPreviewParametersForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase cellExpansionRecognizer](self, "cellExpansionRecognizer"));
  objc_msgSend(v8, "cancel");

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cellForItemAtIndexPath:", v7));
  v10 = objc_alloc_init((Class)UIDragPreviewParameters);
  v11 = objc_opt_class(MFMessageConversationViewCell);
  if ((objc_opt_isKindOfClass(v9, v11) & 1) != 0 && objc_msgSend(v9, "roundsCellCorners"))
  {
    objc_msgSend(v9, "bounds");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    +[MFMessageConversationViewCell defaultCornerRadius](MFMessageConversationViewCell, "defaultCornerRadius");
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v13, v15, v17, v19, v20));
    objc_msgSend(v10, "setVisiblePath:", v21);
  }
  else
  {
    objc_msgSend(v9, "bounds");
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:"));
    objc_msgSend(v10, "setVisiblePath:", v21);
  }

  return v10;
}

- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "cellForItemAtIndexPath:", v9));
  objc_msgSend(v8, "locationInView:", v10);
  if (objc_msgSend(v10, "canBeginDragWithTouchAtPoint:"))
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase _dragItemsForItemAtIndexPath:](self, "_dragItemsForItemAtIndexPath:", v9));
  else
    v11 = 0;
  if (v11)
    v12 = v11;
  else
    v12 = &__NSArray0__struct;
  v13 = v12;

  return v13;
}

- (id)collectionView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6
{
  double y;
  double x;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  y = a6.y;
  x = a6.x;
  v10 = a3;
  v11 = a5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "cellForItemAtIndexPath:", v11));
  objc_msgSend(v10, "convertPoint:toView:", v12, x, y);
  if (objc_msgSend(v12, "canBeginDragWithTouchAtPoint:"))
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase _dragItemsForItemAtIndexPath:](self, "_dragItemsForItemAtIndexPath:", v11));
  else
    v13 = 0;
  if (v13)
    v14 = v13;
  else
    v14 = &__NSArray0__struct;
  v15 = v14;

  return v15;
}

- (int64_t)_dataOwnerForDragSessionAtIndexPath:(id)a3
{
  id v5;

  v5 = a3;
  -[ConversationViewControllerBase doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[ConversationViewControllerBase _dataOwnerForDragSessionAtIndexPath:]", "ConversationViewControllerBase.m", 2061, "0");
}

- (id)_dragItemsForItemAtIndexPath:(id)a3
{
  id v5;

  v5 = a3;
  -[ConversationViewControllerBase doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[ConversationViewControllerBase _dragItemsForItemAtIndexPath:]", "ConversationViewControllerBase.m", 2065, "0");
}

- (void)messageViewController:(id)a3 didFinishRenderingWithHeight:(double)a4
{
  ConversationViewControllerBase *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  NSObject *v32;
  double v33;
  int64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  unsigned int v39;
  __CFString *v40;
  NSObject *v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _BOOL4 v48;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  double v53;
  double v54;
  void *v55;
  double v56;
  double v57;
  NSObject *v58;
  id v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  double MinY;
  void *v66;
  id v67;
  __CFString *v68;
  __CFString *v69;
  NSObject *v70;
  double v71;
  double v72;
  double v73;
  double v74;
  id v75;
  double v76;
  double y;
  double v78;
  id v79;
  _QWORD *v80;
  void *v81;
  unsigned __int8 v82;
  void *v83;
  __CFString *v84;
  CGFloat rect;
  void *rect_8;
  void *rect_16;
  void *rect_24;
  void *v89;
  id v90;
  _QWORD v91[5];
  id v92;
  id v93;
  id v94;
  double v95;
  double v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  _QWORD v101[5];
  uint8_t v102[128];
  uint8_t buf[4];
  double v104;
  __int16 v105;
  double v106;
  __int16 v107;
  double v108;
  __int16 v109;
  double v110;
  __int16 v111;
  double v112;
  __int16 v113;
  double v114;
  __int16 v115;
  double v116;
  __int16 v117;
  double v118;
  __int16 v119;
  void *v120;
  CGRect v121;
  CGRect v122;

  v90 = a3;
  v6 = (ConversationViewControllerBase *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "parentViewController"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase _indexPathOfMessageViewControllerMessage:](self, "_indexPathOfMessageViewControllerMessage:", v90));
  if (v7 && v6 == self)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
    rect_24 = v8;
    v101[0] = _NSConcreteStackBlock;
    v101[1] = 3221225472;
    v101[2] = sub_100082150;
    v101[3] = &unk_10051C218;
    v101[4] = self;
    rect_16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mui_sortedIndexPathsForVisibleItems"));
    rect_8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(rect_16, "ef_map:", v101));
    v89 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase _messageItemIDAtIndexPath:](self, "_messageItemIDAtIndexPath:", v7));
    objc_msgSend(v8, "mf_visibleBounds");
    rect = v9;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase cellConfigurator](self, "cellConfigurator"));
    objc_msgSend(v16, "sizeForItemAtIndexPath:", v7);
    v18 = v17;

    -[ConversationViewControllerBase _minimumItemHeight](self, "_minimumItemHeight");
    v20 = v19;
    v21 = ceil(a4);
    if (v20 >= v21)
      v22 = v20;
    else
      v22 = v21;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase cellConfigurator](self, "cellConfigurator"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "sizeTracker"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
    objc_msgSend(v25, "frame");
    objc_msgSend(v24, "setIntrinsicSize:forCellWithItemID:", v89, v26, v22);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase cellConfigurator](self, "cellConfigurator"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "sizeTracker"));
    objc_msgSend(v28, "displaySizeForCellWithItemID:", v89);
    v30 = v29;

    v31 = v22 - v30;
    if (v22 - v30 < 0.0)
      v31 = -(v22 - v30);
    if (v31 < 2.22044605e-16)
    {
      v30 = v22;
    }
    else
    {
      v32 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218752;
        v104 = v22;
        v105 = 2048;
        v106 = a4;
        v107 = 2048;
        v108 = v20;
        v109 = 2048;
        v110 = v30;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Height does not match value from size tracker: %.2f (renderedHeight: %.2f, minimumHeight: %.2f) <-> %.2f", buf, 0x2Au);
      }

    }
    v33 = -(v30 - v18);
    if (v30 - v18 >= 0.0)
      v33 = v30 - v18;
    if (v33 < 2.22044605e-16)
      goto LABEL_56;
    v34 = -[ConversationViewControllerBase resizingState](self, "resizingState");
    if (v34 != 3)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase _currentSizeMetadataKey](self, "_currentSizeMetadataKey"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), v89, v35));

      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v30));
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase cellHeightCache](self, "cellHeightCache"));
      objc_msgSend(v38, "setObject:forKeyedSubscript:", v37, v36);

    }
    v39 = objc_msgSend(rect_16, "containsObject:", v7);
    v40 = CFSTR("off-screen");
    if (v39)
      v40 = CFSTR("visible");
    v84 = v40;
    v41 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      v42 = COERCE_DOUBLE(objc_msgSend(v7, "section"));
      v43 = COERCE_DOUBLE(objc_msgSend(v7, "row"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "contentRequest"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "messageFuture"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "resultIfAvailable"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "ef_publicDescription"));
      *(_DWORD *)buf = 138414338;
      v104 = *(double *)&v84;
      v105 = 2048;
      v106 = v42;
      v107 = 2048;
      v108 = v43;
      v109 = 2048;
      v110 = v18;
      v111 = 2048;
      v112 = v30;
      v113 = 2048;
      v114 = v30 - v18;
      v115 = 2048;
      v116 = a4;
      v117 = 2048;
      v118 = v20;
      v119 = 2112;
      v120 = v47;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Height changed for %@ cell at {%ld, %ld} (%g->%g, delta=%g, renderedHeight=%g, minimumHeight=%g) for message: %@", buf, 0x5Cu);

    }
    if (v34 == 3)
    {
      v48 = 0;
      v49 = v30 - v18;
LABEL_48:
      v75 = objc_alloc_init((Class)UICollectionViewFlowLayoutInvalidationContext);
      objc_msgSend(v75, "setContentSizeAdjustment:", 0.0, v30 - v18);
      if (v48)
        objc_msgSend(v75, "setContentOffsetAdjustment:", 0.0, v49);
      -[ConversationViewControllerBase layoutInvalidationContentOffset](self, "layoutInvalidationContentOffset");
      y = CGPointZero.y;
      if (v78 != CGPointZero.x || v76 != y)
      {
        -[ConversationViewControllerBase layoutInvalidationContentOffset](self, "layoutInvalidationContentOffset");
        objc_msgSend(v75, "setContentOffsetAdjustment:", 0.0);
        -[ConversationViewControllerBase setLayoutInvalidationContentOffset:](self, "setLayoutInvalidationContentOffset:", CGPointZero.x, y);
      }
      v91[0] = _NSConcreteStackBlock;
      v91[1] = 3221225472;
      v91[2] = sub_1000821D8;
      v91[3] = &unk_10051C240;
      v91[4] = self;
      v92 = v7;
      v95 = v30 - v18;
      v96 = v30;
      v79 = v75;
      v93 = v79;
      v94 = rect_24;
      v80 = objc_retainBlock(v91);
      v81 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase cellConfigurator](self, "cellConfigurator"));
      v82 = objc_msgSend(v81, "animatePendingHeightChangesIfNecessary");

      if ((v82 & 1) == 0)
        ((void (*)(_QWORD *))v80[2])(v80);

      v8 = rect_24;
LABEL_56:
      v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cellForItemAtIndexPath:", v7));
      -[ConversationViewControllerBase _updateFooterViewFrameForCell:](self, "_updateFooterViewFrameForCell:", v83);

      goto LABEL_57;
    }
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase pinnedItem](self, "pinnedItem"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "dynamicOffset"));

    if (v51)
    {
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "dynamicOffset"));
      objc_msgSend(rect_24, "mf_cellOffsetByApplyingDynamicOffset:cellHeight:", v52, v18);
      v54 = v53;

      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "dynamicOffset"));
      objc_msgSend(rect_24, "mf_cellOffsetByApplyingDynamicOffset:cellHeight:", v55, v30);
      v57 = v56;

      v58 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
      v49 = v57 - v54;
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v104 = v49;
        _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "Cell being resized is the pinned cell. Will adjust content offset by %0.1f", buf, 0xCu);
      }
      v48 = 1;
    }
    else
    {
      if (-[ConversationViewControllerBase _isDisplayingSingleMessage](self, "_isDisplayingSingleMessage"))
      {
        v48 = 0;
        v49 = v30 - v18;
LABEL_47:

        goto LABEL_48;
      }
      v99 = 0u;
      v100 = 0u;
      v97 = 0u;
      v98 = 0u;
      v59 = rect_8;
      v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v97, v102, 16);
      if (v60)
      {
        v61 = *(_QWORD *)v98;
LABEL_32:
        v62 = 0;
        while (1)
        {
          if (*(_QWORD *)v98 != v61)
            objc_enumerationMutation(v59);
          v63 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * v62);
          v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "second"));
          objc_msgSend(v64, "frame");
          MinY = CGRectGetMinY(v121);
          v122.origin.x = rect;
          v122.origin.y = v11;
          v122.size.width = v13;
          v122.size.height = v15;
          if (MinY >= CGRectGetMinY(v122))
            break;

          if (v60 == (id)++v62)
          {
            v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v97, v102, 16);
            if (v60)
              goto LABEL_32;
            goto LABEL_38;
          }
        }
        v58 = objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "first"));

        if (v58)
          goto LABEL_41;
      }
      else
      {
LABEL_38:

      }
      v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "firstObject"));
      v58 = objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "first"));

LABEL_41:
      v67 = objc_msgSend(v7, "compare:", v58);
      v48 = v67 == (id)-1;
      v68 = CFSTR("Will NOT adjust");
      if (v67 == (id)-1)
        v68 = CFSTR("Will adjust");
      v69 = v68;
      v70 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
      if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
      {
        v71 = COERCE_DOUBLE(objc_msgSend(v7, "section"));
        v72 = COERCE_DOUBLE(objc_msgSend(v7, "row"));
        v73 = COERCE_DOUBLE(-[NSObject section](v58, "section"));
        v74 = COERCE_DOUBLE(-[NSObject row](v58, "row"));
        *(_DWORD *)buf = 138413570;
        v104 = *(double *)&v69;
        v105 = 2048;
        v106 = v30 - v18;
        v107 = 2048;
        v108 = v71;
        v109 = 2048;
        v110 = v72;
        v111 = 2048;
        v112 = v73;
        v113 = 2048;
        v114 = v74;
        _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "%@ content offset (adjustment=%.2f, resizedPath={%ld, %ld}, topPath={%ld, %ld})", buf, 0x3Eu);
      }

      v49 = v30 - v18;
    }

    goto LABEL_47;
  }
LABEL_57:

}

- (void)messageViewControllerDidFinishFirstPaint:(id)a3
{
  unsigned int v4;
  unsigned int v5;
  id v6;
  id v7;
  id v8;

  if (!-[ConversationViewControllerBase didCompleteFirstPaint](self, "didCompleteFirstPaint", a3))
    -[ConversationViewControllerBase setDidCompleteFirstPaint:](self, "setDidCompleteFirstPaint:", 1);
  v6 = (id)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
  if (-[ConversationViewControllerBase _scrollViewIsScrolledToEnd:](self, "_scrollViewIsScrolledToEnd:"))
  {
    v4 = -[ConversationViewControllerBase _isDisplayingSingleMessage](self, "_isDisplayingSingleMessage");

    if (v4)
      -[ConversationViewControllerBase _scrolledToEndOfSingleMessage](self, "_scrolledToEndOfSingleMessage");
  }
  else
  {

  }
  v7 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v5 = objc_msgSend(v7, "isTesting");

  if (v5)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v8, "postNotificationName:object:", CFSTR("MFMailConversationViewDidShow"), self);

  }
}

- (void)messageViewControllerDidDisplayContent:(id)a3 success:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  os_signpost_id_t v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  const __CFString *v20;
  int v21;
  const __CFString *v22;
  __int16 v23;
  void *v24;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contentRequest"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "message"));

  -[ConversationViewControllerBase scheduleAutomaticMarkAsReadForMessage:](self, "scheduleAutomaticMarkAsReadForMessage:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase mailboxRepository](self, "mailboxRepository"));
  objc_msgSend(v9, "recordFrecencyEventWithMailboxesOfMessage:", v8);

  if (objc_msgSend(UIApp, "launchedToTest"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v10, "postNotificationName:object:", CFSTR("MFMailConversationViewChildMessageViewDidDisplayContent"), v6);

  }
  if (v4)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase blankConversationController](self, "blankConversationController"));
    objc_msgSend(v11, "conversationViewWebViewDidLoadMessage");

  }
  -[ConversationViewControllerBase _updateFooterViewFrameForVisibleCells](self, "_updateFooterViewFrameForVisibleCells");
  -[ConversationViewControllerBase _messageViewControllerDidDisplayContent:](self, "_messageViewControllerDidDisplayContent:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase referenceMessageListItem](self, "referenceMessageListItem"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "itemID"));

  v14 = MFMessageSelectionLifecycleSignpostLog();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  v16 = os_signpost_id_make_with_pointer(v15, v13);

  v17 = MFMessageSelectionLifecycleSignpostLog();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  v19 = v18;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    v20 = CFSTR("failed to display");
    if (v4)
      v20 = CFSTR("successfully displayed");
    v21 = 138412546;
    v22 = v20;
    v23 = 2112;
    v24 = v13;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_INTERVAL_END, v16, "Message selection lifecycle", "Message view controller %@ message with itemID: %@", (uint8_t *)&v21, 0x16u);
  }

}

- (void)messageViewController:(id)a3 didStartDownloadForContentItemWithProgress:(id)a4
{
  id v7;
  id v8;

  v7 = a3;
  v8 = a4;
  -[ConversationViewControllerBase doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[ConversationViewControllerBase messageViewController:didStartDownloadForContentItemWithProgress:]", "ConversationViewControllerBase.m", 2237, "0");
}

- (void)messageViewController:(id)a3 didTapShowMoreAtCollapsedOffset:(CGPoint)a4 expandedOffset:(CGPoint)a5
{
  double y;
  double x;
  double v7;
  double v8;
  id v10;

  y = a5.y;
  x = a5.x;
  v7 = a4.y;
  v8 = a4.x;
  v10 = a3;
  -[ConversationViewControllerBase setPinnedItem:](self, "setPinnedItem:", 0);
  -[ConversationViewControllerBase _showSingleMessage:animationOffset:initialScrollOffset:](self, "_showSingleMessage:animationOffset:initialScrollOffset:", v10, v8, v7, x, y);

}

- (void)messageViewController:(id)a3 didTapRevealActionsButton:(id)a4
{
  id v7;
  id v8;

  v7 = a3;
  v8 = a4;
  -[ConversationViewControllerBase doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[ConversationViewControllerBase messageViewController:didTapRevealActionsButton:]", "ConversationViewControllerBase.m", 2246, "0");
}

- (void)messageViewController:(id)a3 didTapUndoSendButton:(id)a4
{
  id v7;
  id v8;

  v7 = a3;
  v8 = a4;
  -[ConversationViewControllerBase doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[ConversationViewControllerBase messageViewController:didTapUndoSendButton:]", "ConversationViewControllerBase.m", 2250, "0");
}

- (BOOL)_isDisplayingSingleMessage
{
  -[ConversationViewControllerBase doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[ConversationViewControllerBase _isDisplayingSingleMessage]", "ConversationViewControllerBase.m", 2254, "0");
}

- (id)messageViewController:(id)a3 mostRecentAncestorMessageForMessage:(id)a4
{
  id v7;
  id v8;

  v7 = a3;
  v8 = a4;
  -[ConversationViewControllerBase doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[ConversationViewControllerBase messageViewController:mostRecentAncestorMessageForMessage:]", "ConversationViewControllerBase.m", 2258, "0");
}

- (id)_visibleIndexPathForMessageViewController:(id)a3
{
  id v5;

  v5 = a3;
  -[ConversationViewControllerBase doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[ConversationViewControllerBase _visibleIndexPathForMessageViewController:]", "ConversationViewControllerBase.m", 2262, "0");
}

- (void)messageViewController:(id)a3 contentViewDidEndZoomingMessageWithOffset:(CGPoint)a4
{
  self->_layoutInvalidationContentOffset = a4;
}

- (void)messageViewControllerDidTapToExpand:(id)a3
{
  -[ConversationViewControllerBase _showSingleMessage:animationOffset:initialScrollOffset:](self, "_showSingleMessage:animationOffset:initialScrollOffset:", a3, CGPointZero.x, CGPointZero.y, CGPointZero.x, CGPointZero.y);
}

- (void)messageViewControllerDidTapAddressAtom:(id)a3 contactViewController:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  objc_msgSend(v6, "setDelegate:", self);
  objc_msgSend(v7, "bounds");
  -[ConversationViewControllerBase _showModalViewController:fromView:sourceRect:animated:](self, "_showModalViewController:fromView:sourceRect:animated:", v6, v7, 1);

}

- (void)messageViewController:(id)a3 didChangeSelectedHTML:(id)a4
{
  id v6;
  MFTextSelectionScrollHandler *textSelectionScrollHandler;
  MFTextSelectionScrollHandler *v8;
  void *v9;
  MFTextSelectionScrollHandler *v10;
  MFTextSelectionScrollHandler *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  textSelectionScrollHandler = self->_textSelectionScrollHandler;
  if (!textSelectionScrollHandler)
  {
    v8 = [MFTextSelectionScrollHandler alloc];
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
    v10 = -[MFTextSelectionScrollHandler initWithScrollView:](v8, "initWithScrollView:", v9);
    v11 = self->_textSelectionScrollHandler;
    self->_textSelectionScrollHandler = v10;

    textSelectionScrollHandler = self->_textSelectionScrollHandler;
  }
  -[MFTextSelectionScrollHandler handleTextSelectionChanged:](textSelectionScrollHandler, "handleTextSelectionChanged:", v6);

}

- (id)messageViewController:(id)a3 displayNameForEmailAddress:(id)a4 abbreviated:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  void *v9;

  v5 = a5;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase contactStore](self, "contactStore"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "displayNameForEmailAddress:abbreviated:", v7, v5));

  return v9;
}

- (void)contactCardInteractions:(id)a3 triggerSearchForDisplayName:(id)a4 emailAddresses:(id)a5
{
  id v5;
  _QWORD v6[4];
  ConversationViewControllerBase *v7;
  id v8;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100082C7C;
  v6[3] = &unk_10051A910;
  v7 = self;
  v8 = a5;
  v5 = v8;
  -[ConversationViewControllerBase dismissViewControllerAnimated:completion:](v7, "dismissViewControllerAnimated:completion:", 1, v6);

}

- (void)messageViewController:(id)a3 webViewDidTerminateWithReason:(int64_t)a4
{
  id v6;
  id v7;
  id v8;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase scene](self, "scene", a3));
  v6 = objc_msgSend(v7, "activationState");

  v8 = (id)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase blankConversationController](self, "blankConversationController"));
  objc_msgSend(v8, "conversationViewWebViewCrashedWithReason:isBackgrounded:", a4, v6 == (id)2);

}

- (id)hostScrollViewForConversationHeaderView:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView", a3));
}

- (double)stickySubjectViewMaxYForConversationHeaderView:(id)a3
{
  id v5;

  v5 = a3;
  -[ConversationViewControllerBase doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[ConversationViewControllerBase stickySubjectViewMaxYForConversationHeaderView:]", "ConversationViewControllerBase.m", 2332, "0");
}

- (double)stickySubjectViewFirstBaselineForConversationHeaderView:(id)a3
{
  id v5;

  v5 = a3;
  -[ConversationViewControllerBase doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[ConversationViewControllerBase stickySubjectViewFirstBaselineForConversationHeaderView:]", "ConversationViewControllerBase.m", 2336, "0");
}

- (BOOL)_scrollViewIsScrolledToEnd:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  BOOL v10;

  v3 = a3;
  objc_msgSend(v3, "contentSize");
  if (v4 <= 1.0)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v3, "contentOffset");
    v6 = v5;
    objc_msgSend(v3, "bounds");
    v8 = v7;
    objc_msgSend(v3, "contentSize");
    v10 = (v6 + v8) / v9 >= 0.85;
  }

  return v10;
}

- (id)indexSetForRowsFromIndexPaths:(id)a3 section:(int64_t)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSet](NSMutableIndexSet, "indexSet"));
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v11, "section", (_QWORD)v13) == (id)a4)
          objc_msgSend(v6, "addIndex:", objc_msgSend(v11, "row"));
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v6;
}

- (BOOL)_shouldAutomaticallyCollapseQuotedContentForCellAtIndexPath:(id)a3
{
  id v4;
  unsigned int v5;
  int64_t v6;
  char *v7;
  char *v8;
  BOOL v9;

  v4 = a3;
  if (_os_feature_enabled_impl("Mail", "CatchUpManualSummarization"))
    v5 = EMIsGreymatterAvailableWithOverride();
  else
    v5 = 0;
  if (-[ConversationViewControllerBase conversationSortOrder](self, "conversationSortOrder"))
  {
    if (v5)
    {
      v6 = -[ConversationViewControllerBase countOfMessages](self, "countOfMessages");
      v7 = (char *)-[ConversationViewControllerBase countOfSummaries](self, "countOfSummaries") + v6;
    }
    else
    {
      v7 = -[ConversationViewControllerBase countOfMessages](self, "countOfMessages");
    }
    v8 = v7 - 1;
  }
  else
  {
    v8 = (char *)v5;
  }
  v9 = objc_msgSend(v4, "row") != v8;

  return v9;
}

- (id)_nextMessageIndexWithDirection:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;

  v3 = *(_QWORD *)&a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase _currentlyVisibleIndexPath](self, "_currentlyVisibleIndexPath"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase _nextIndexPathToSelectFromIndexPath:withDirection:](self, "_nextIndexPathToSelectFromIndexPath:withDirection:", v5, v3));

  return v6;
}

- (id)_nextIndexPathToSelectFromIndexPath:(id)a3 withDirection:(int)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  char isKindOfClass;

  v6 = objc_msgSend(a3, "row");
  if (a4 == -1)
    v7 = -1;
  else
    v7 = 1;
  v8 = (uint64_t)v6 + v7;
  if ((uint64_t)v6 + v7 >= 1)
  {
    do
    {
      if (v8 >= -[ConversationViewControllerBase countOfMessages](self, "countOfMessages"))
        break;
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v8, 0));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase _messageItemIDAtIndexPath:](self, "_messageItemIDAtIndexPath:", v9));
      v11 = objc_opt_class(EMMessageCollectionItemID);
      isKindOfClass = objc_opt_isKindOfClass(v10, v11);

      if ((isKindOfClass & 1) != 0)
        return v9;

      v8 += v7;
    }
    while (v8 > 0);
  }
  v9 = 0;
  return v9;
}

- (id)_oldestIndexPath
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "indexPathsForVisibleItems"));

  if ((id)-[ConversationViewControllerBase conversationSortOrder](self, "conversationSortOrder") == (id)1)
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastObject"));
  else
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
  v6 = (void *)v5;

  return v6;
}

- (void)_hideRemovedSingleMessageCellIfInRemovedIndexPaths:(id)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase removedSingleMessageIndexPath](self, "removedSingleMessageIndexPath"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase removedSingleMessageIndexPath](self, "removedSingleMessageIndexPath"));
    v6 = objc_msgSend(v14, "containsObject:", v5);

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "indexPathsForVisibleItems"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase removedSingleMessageIndexPath](self, "removedSingleMessageIndexPath"));
      v10 = objc_msgSend(v8, "containsObject:", v9);

      if (v10)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase removedSingleMessageIndexPath](self, "removedSingleMessageIndexPath"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "cellForItemAtIndexPath:", v12));

        objc_msgSend(v13, "setAlpha:", 0.0);
      }
      -[ConversationViewControllerBase setRemovedSingleMessageIndexPath:](self, "setRemovedSingleMessageIndexPath:", 0);
    }
  }

}

- (CGPoint)collectionView:(id)a3 targetContentOffsetForProposedContentOffset:(CGPoint)a4
{
  double y;
  CGFloat x;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  int v24;
  double v25;
  __int16 v26;
  double v27;
  CGPoint result;

  y = a4.y;
  x = a4.x;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase pinnedItem](self, "pinnedItem", a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "indexPath"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase pinnedItem](self, "pinnedItem"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dynamicOffset"));

  if (v8 && v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
    objc_msgSend(v11, "mf_contentOffsetApplyingDynamicOffset:indexPath:", v10, v8);
    v13 = v12;

    if (v13 == y)
    {
      x = 0.0;
      goto LABEL_10;
    }
    v14 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
    x = 0.0;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v24 = 134218240;
      v25 = v13;
      v26 = 2048;
      v27 = y;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Conversation view has pinned item. Using calculated offset of %.02f instead of proposed %.02f", (uint8_t *)&v24, 0x16u);
    }
  }
  else
  {
    v14 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      sub_100390E78(v14, v15, v16, v17, v18, v19, v20, v21);
    v13 = y;
  }

LABEL_10:
  v22 = x;
  v23 = v13;
  result.y = v23;
  result.x = v22;
  return result;
}

- (id)viewForKeyboardAvoidance:(id)a3
{
  return self->_conversationView;
}

- (id)transitionCoordinatorForKeyboardAvoidance:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase transitionCoordinator](self, "transitionCoordinator", a3));
}

- (void)_adjustForKeyboardAvoidanceOverlap:(double)a3
{
  id v5;
  void *v6;
  double v7;
  double v8;
  unsigned __int8 v9;
  unsigned __int8 v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  uint64_t v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  double v35;
  double v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  double v49;
  CGFloat v50;
  double v51;
  CGFloat v52;
  double v53;
  CGFloat v54;
  double v55;
  double v56;
  double v57;
  double MaxY;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  NSObject *v70;
  id v71;
  double v72;
  double v73;
  _BYTE rect[36];
  __int16 v75;
  ConversationViewControllerBase *v76;
  __int16 v77;
  double v78;
  __int16 v79;
  uint64_t v80;
  CGRect v81;
  CGRect v82;

  if (_os_feature_enabled_impl("Mail", "QuickReply")
    && -[ConversationViewControllerBase isPerformingQuickReplySendAnimation](self, "isPerformingQuickReplySendAnimation"))
  {
    if (self->_adjustmentForKeyboard != a3)
      self->_adjustmentForKeyboard = a3;
  }
  else
  {
    *(_QWORD *)&rect[16] = objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase traitCollection](self, "traitCollection"));
    v5 = objc_msgSend(*(id *)&rect[16], "horizontalSizeClass");

    *(_QWORD *)&rect[16] = objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase navigationController](self, "navigationController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&rect[16], "toolbar"));
    objc_msgSend(v6, "frame");
    v8 = v7;

    v9 = -[ConversationViewControllerBase allowQuickReply](self, "allowQuickReply");
    if (a3 > 0.0)
      v10 = v9;
    else
      v10 = 0;
    v11 = 0.0;
    if ((v10 & (v5 == (id)1)) != 0)
      v11 = v8;
    *(double *)&rect[8] = a3 - v11;
    if (a3 - v11 != self->_adjustmentForKeyboard)
    {
      v72 = v8;
      *(_QWORD *)&rect[16] = self->_conversationView;
      objc_msgSend(*(id *)&rect[16], "contentInset");
      v13 = v12;
      v15 = v14;
      v17 = v16;
      v19 = v18;
      objc_msgSend(*(id *)&rect[16], "scrollIndicatorInsets");
      *(_QWORD *)rect = v20;
      v22 = v21;
      v24 = v23;
      v26 = v25;
      v27 = *(double *)&rect[8] - self->_adjustmentForKeyboard;
      objc_msgSend(*(id *)&rect[16], "setContentInset:", v13, v15, v17 + v27, v19);
      objc_msgSend(*(id *)&rect[16], "setScrollIndicatorInsets:", *(double *)rect, v22, v24 + v27, v26);
      self->_adjustmentForKeyboard = *(double *)&rect[8];
      if (-[ConversationViewControllerBase allowQuickReply](self, "allowQuickReply"))
        -[ConversationViewControllerBase _shrinkBottomPaddingIfNecessary](self, "_shrinkBottomPaddingIfNecessary");
      -[ConversationViewControllerBase _updateBottomPadding](self, "_updateBottomPadding", *(_QWORD *)&v72);
      if (-[ConversationViewControllerBase allowQuickReply](self, "allowQuickReply"))
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
        objc_msgSend(v28, "frame");
        *(_QWORD *)rect = v29;
        v31 = v30;
        v33 = v32;
        v35 = v34;
        if (v5 != (id)1 || *(double *)&rect[8] <= 0.0)
          v37 = 0.0;
        else
          v37 = v73;
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase _quickReplyView](self, "_quickReplyView"));
        v39 = v38;
        if (!v38)
        {

          return;
        }
        objc_msgSend(v38, "frame");
        v41 = v40;
        v43 = v42;
        v45 = v44;
        v47 = v46;
        v48 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase view](self, "view"));
        objc_msgSend(v48, "convertRect:fromView:", v28, v41, v43, v45, v47);
        v50 = v49;
        v52 = v51;
        v54 = v53;
        v56 = v55;

        -[ConversationViewControllerBase _itemSpacing](self, "_itemSpacing");
        v81.size.height = v56 + v57;
        v81.origin.x = v50;
        v81.origin.y = v52;
        v81.size.width = v54;
        MaxY = CGRectGetMaxY(v81);
        v82.size.height = v35 - *(double *)&rect[8] - v37;
        v82.origin.x = *(CGFloat *)rect;
        v82.origin.y = v31;
        v82.size.width = v33;
        v59 = MaxY - CGRectGetMaxY(v82);
        if (v59 > 0.0)
        {
          objc_msgSend(v28, "contentOffset");
          v61 = v60;
          v63 = v62;
          objc_msgSend(v28, "contentSize");
          v65 = v64;
          objc_msgSend(v28, "bounds");
          v67 = v66;
          objc_msgSend(v28, "contentInset");
          v69 = v65 - v67 + v68;
          if (v59 + v63 < v69)
            v69 = v59 + v63;
          objc_msgSend(v28, "setContentOffset:", v61, v69);
          v70 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
          if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)&rect[24] = 138413058;
            *(_QWORD *)&rect[28] = objc_opt_class(self);
            v75 = 2048;
            v76 = self;
            v77 = 2048;
            v78 = v59;
            v79 = 2048;
            v80 = *(_QWORD *)&rect[8];
            v71 = *(id *)&rect[28];
            _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "<%@: %p> [Quick Reply] Did scroll up by amount=%f to adjust for keyboard overlap=%f", &rect[24], 0x2Au);

          }
        }

      }
    }
  }
}

- (void)_animateWithKeyboard:(id)a3 animations:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  _QWORD v27[5];
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", UIKeyboardAnimationDurationUserInfoKey));
  objc_msgSend(v9, "doubleValue");
  v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", UIKeyboardAnimationCurveUserInfoKey));
  v14 = objc_msgSend(v13, "integerValue");

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", UIKeyboardFrameEndUserInfoKey));
  objc_msgSend(v16, "CGRectValue");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100083EA4;
  v27[3] = &unk_10051C290;
  v25 = v7;
  v29 = v18;
  v30 = v20;
  v31 = v22;
  v32 = v24;
  v27[4] = self;
  v28 = v25;
  v26 = +[UIViewPropertyAnimator runningPropertyAnimatorWithDuration:delay:options:animations:completion:](UIViewPropertyAnimator, "runningPropertyAnimatorWithDuration:delay:options:animations:completion:", (_QWORD)v14 << 16, v27, 0, v11, 0.0);

}

- (BOOL)canHandleAction:(SEL)a3 withMailMenuCommand:(id)a4
{
  unsigned int v6;

  v6 = -[ConversationViewControllerBase _isConversationViewShortcut:](self, "_isConversationViewShortcut:", a3, a4);
  if (v6)
    LOBYTE(v6) = sub_100083F08((uint64_t *)self, (char *)a3);
  return v6;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  unsigned __int8 v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  SEL v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000842C4;
  v9[3] = &unk_10051C2B8;
  v11 = &v13;
  v12 = a3;
  v6 = a4;
  v10 = v6;
  if (-[ConversationViewControllerBase _executeIfSplitViewIsAvailable:](self, "_executeIfSplitViewIsAvailable:", v9))
  {
    v7 = *((_BYTE *)v14 + 24) != 0;
  }
  else
  {
    v7 = -[ConversationViewControllerBase canHandleAction:withMailMenuCommand:](self, "canHandleAction:withMailMenuCommand:", a3, v6);
    *((_BYTE *)v14 + 24) = v7;
  }

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (BOOL)_isConversationViewShortcut:(SEL)a3
{
  return sub_1000F98A0((uint64_t)MailSplitViewController, (char *)a3)
      || sub_1000F93F8((uint64_t)MailSplitViewController, (char *)a3);
}

- (void)_pageUpCommandInvoked:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView", a3));
  objc_msgSend(v3, "mf_pageUp");

}

- (void)_pageDownCommandInvoked:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView", a3));
  objc_msgSend(v3, "mf_pageDown");

}

- (void)_selectNextMessageCommandInvoked:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase delegate](self, "delegate", a3));
  if (objc_msgSend(v4, "conversationViewController:canAdvanceToNextConversationWithDirection:", self, 0xFFFFFFFFLL))objc_msgSend(v4, "conversationViewController:advanceToNextConversationWithDirection:", self, 0xFFFFFFFFLL);

}

- (void)_selectPreviousMessageCommandInvoked:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase delegate](self, "delegate", a3));
  if (objc_msgSend(v4, "conversationViewController:canAdvanceToNextConversationWithDirection:", self, 1))objc_msgSend(v4, "conversationViewController:advanceToNextConversationWithDirection:", self, 1);

}

- (BOOL)_shouldArchiveByDefault
{
  -[ConversationViewControllerBase doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[ConversationViewControllerBase _shouldArchiveByDefault]", "ConversationViewControllerBase.m", 2649, "0");
}

- (BOOL)_shouldShowArrowsForDisplayMode:(int64_t)a3 collapsed:(BOOL)a4
{
  BOOL v4;
  void *v6;
  id v7;

  if (a4)
    return 1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase traitCollection](self, "traitCollection"));
  v7 = objc_msgSend(v6, "horizontalSizeClass");
  v4 = (a3 & 0xFFFFFFFFFFFFFFFDLL) == 1 || v7 == (id)1 || a3 == 5;

  return v4;
}

- (void)_updateBarButtonsAnimated:(BOOL)a3 force:(BOOL)a4
{
  -[ConversationViewControllerBase _updateBarButtonsAnimated:force:isShowingTitle:](self, "_updateBarButtonsAnimated:force:isShowingTitle:", a3, a4, 0);
}

- (void)_updateBarButtonsAnimated:(BOOL)a3 force:(BOOL)a4 isShowingTitle:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  _BOOL8 v7;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase splitViewController](self, "splitViewController"));
  v12 = v9;
  if (v9)
  {
    v10 = (uint64_t)objc_msgSend(v9, "displayMode");
    v11 = (uint64_t)objc_msgSend(v12, "isCollapsed");
  }
  else
  {
    v11 = 1;
    v10 = 1;
  }
  -[ConversationViewControllerBase _updateBarButtonsAnimated:withDisplayMode:withTraitCollection:collapsed:force:isShowingTitle:](self, "_updateBarButtonsAnimated:withDisplayMode:withTraitCollection:collapsed:force:isShowingTitle:", v7, v10, 0, v11, v6, v5);

}

- (void)_updateBarButtonsAnimated:(BOOL)a3 withDisplayMode:(int64_t)a4 isCollapsed:(BOOL)a5 isShowingTitle:(BOOL)a6
{
  -[ConversationViewControllerBase _updateBarButtonsAnimated:withDisplayMode:withTraitCollection:collapsed:force:isShowingTitle:](self, "_updateBarButtonsAnimated:withDisplayMode:withTraitCollection:collapsed:force:isShowingTitle:", a3, a4, 0, a5, 1, a6);
}

- (void)_removeNavigationBarFromSelf
{
  id v3;
  id v4;
  id v5;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase navigationItem](self, "navigationItem"));
  objc_msgSend(v3, "setLeftBarButtonItem:", 0);

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase navigationItem](self, "navigationItem"));
  objc_msgSend(v4, "setCenterItemGroups:", &__NSArray0__struct);

  v5 = (id)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase navigationItem](self, "navigationItem"));
  objc_msgSend(v5, "setRightBarButtonItem:", 0);

}

- (BOOL)_shouldUseDesktopClassNavigationBarForTraitCollection:(id)a3
{
  id v4;
  BOOL v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  unsigned __int8 v11;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = -86;
  v11 = +[UINavigationBar mf_shouldUseDesktopClassNavigationBarForTraitCollection:](UINavigationBar, "mf_shouldUseDesktopClassNavigationBarForTraitCollection:", v4);
  if (*((_BYTE *)v9 + 24))
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000848A0;
    v7[3] = &unk_10051C150;
    v7[4] = &v8;
    -[ConversationViewControllerBase _executeIfSplitViewIsAvailable:](self, "_executeIfSplitViewIsAvailable:", v7);
    v5 = *((_BYTE *)v9 + 24) != 0;
  }
  else
  {
    v5 = 0;
  }
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (void)_updateBarButtonsAnimated:(BOOL)a3 withDisplayMode:(int64_t)a4 withTraitCollection:(id)a5 collapsed:(BOOL)a6 force:(BOOL)a7 isShowingTitle:(BOOL)a8
{
  _BOOL4 v8;
  _BOOL8 v9;
  _BOOL8 v11;
  void *v13;
  _BOOL8 v14;
  _BOOL8 v15;
  id v16;
  ConversationViewControllerBase *v17;
  ConversationViewControllerBase *v18;
  _BOOL8 v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned int v26;
  NSArray *v27;
  NSArray *defaultBarButtons;
  $8E77E832BB222766B6D1F97AC6EE4C4B flags;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  NSMutableArray *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  unsigned __int8 v43;
  void *v44;
  void *v45;
  _BOOL4 v46;
  id v47;
  void *v48;
  void *v49;

  v46 = a8;
  v8 = a7;
  v9 = a6;
  v11 = a3;
  v47 = a5;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase barItemsManager](self, "barItemsManager"));
  v14 = -[ConversationViewControllerBase _shouldArchiveByDefault](self, "_shouldArchiveByDefault");
  if (v14 != objc_msgSend(v13, "useArchiveButton"))
  {
    objc_msgSend(v13, "setUseArchiveButton:", v14);
    v8 = 1;
  }
  v15 = -[ConversationViewControllerBase _shouldShowArrowsForDisplayMode:collapsed:](self, "_shouldShowArrowsForDisplayMode:collapsed:", a4, v9);
  if (v15 != objc_msgSend(v13, "showNavigationArrows"))
  {
    objc_msgSend(v13, "setShowNavigationArrows:", v15);
    v8 = 1;
  }
  v16 = sub_100084698(self);
  v17 = (ConversationViewControllerBase *)objc_claimAutoreleasedReturnValue(v16);
  v18 = v17;
  if (!v47)
    v47 = (id)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase traitCollection](v17, "traitCollection"));
  if (v18 != self)
    -[ConversationViewControllerBase _removeNavigationBarFromSelf](self, "_removeNavigationBarFromSelf");
  v19 = -[ConversationViewControllerBase _shouldUseDesktopClassNavigationBarForTraitCollection:](self, "_shouldUseDesktopClassNavigationBarForTraitCollection:", v47);
  v20 = v8 | v19 ^ objc_msgSend(v13, "useDesktopClassNavigationBar");
  if (v20 != 1)
    goto LABEL_12;
  objc_msgSend(v13, "setUseDesktopClassNavigationBar:", v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase navigationController](v18, "navigationController"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "navigationBar"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase navigationItem](v18, "navigationItem"));
  objc_msgSend(v13, "configureNavigationBar:navigationItem:", v22, v23);

  if (v19)
  {
    -[ConversationViewControllerBase setToolbarItems:animated:](v18, "setToolbarItems:animated:", 0, v11);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase navigationController](v18, "navigationController"));
    objc_msgSend(v24, "setNavigationBarHidden:animated:", 0, v11);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase navigationItem](v18, "navigationItem"));
    objc_msgSend(v13, "configureDesktopClassButtonsFor:isPrimary:isShowingTitle:animated:", v25, -[ConversationViewControllerBase isPrimary](self, "isPrimary"), v46, v11);

    -[ConversationViewControllerBase _updateBarButtonsEnabled](self, "_updateBarButtonsEnabled");
  }
  else
  {
LABEL_12:
    v26 = objc_msgSend(v47, "mf_hasCompactDimension");
    if (((self->_defaultBarButtons != 0) & ~v20) == 0)
    {
      v27 = (NSArray *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase _defaultBarButtonItems](self, "_defaultBarButtonItems"));
      defaultBarButtons = self->_defaultBarButtons;
      self->_defaultBarButtons = v27;

    }
    flags = self->_flags;
    if ((v26 & *(_DWORD *)&flags) == 1)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase toolbarItems](self, "toolbarItems"));
      v31 = v30 == 0;

    }
    else
    {
      v31 = v26 ^ *(_DWORD *)&flags;
    }
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase navigationController](v18, "navigationController"));
    objc_msgSend(v32, "setNavigationBarHidden:animated:", 0, v11);

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase navigationItem](v18, "navigationItem"));
    if (((v20 | v31) & 1) != 0)
    {
      *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | v26;
      v34 = objc_opt_new(NSMutableArray);
      if ((*(_BYTE *)&self->_flags & 1) != 0)
      {
        if (v15)
        {
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "arrowControlsButtonItem"));
          v49 = v39;
          v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v49, 1));

        }
        else
        {
          v40 = 0;
        }
        objc_msgSend(v33, "setRightBarButtonItems:animated:", v40, v11);
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase _defaultBarButtonsWithFlexibleSpacing:reverseOrder:](self, "_defaultBarButtonsWithFlexibleSpacing:reverseOrder:", 1, 0));
        -[ConversationViewControllerBase setToolbarItems:animated:](v18, "setToolbarItems:animated:", v41, v11);

      }
      else
      {
        -[ConversationViewControllerBase setToolbarItems:animated:](v18, "setToolbarItems:animated:", 0, v11);
        if (-[ConversationViewControllerBase isPrimary](self, "isPrimary"))
        {
          if (-[NSMutableArray count](v34, "count"))
          {
            v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "leftSpaceItem"));
            -[NSMutableArray addObject:](v34, "addObject:", v35);

          }
          if (v15)
          {
            v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "arrowControlsButtonItem"));
            -[NSMutableArray addObject:](v34, "addObject:", v36);

          }
        }
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase _defaultBarButtonsWithFlexibleSpacing:reverseOrder:](self, "_defaultBarButtonsWithFlexibleSpacing:reverseOrder:", 0, 1));
        v38 = objc_msgSend(v37, "mutableCopy");

        objc_msgSend(v33, "setRightBarButtonItems:animated:", v38, v11);
      }
      if (-[NSMutableArray count](v34, "count"))
      {
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "leftBarButtonItems"));
        v43 = -[NSMutableArray isEqual:](v34, "isEqual:", v42);

        if ((v43 & 1) == 0)
          objc_msgSend(v33, "setLeftBarButtonItems:animated:", v34, v11);
        objc_msgSend(v33, "setLeftItemsSupplementBackButton:", 1);
      }
      else
      {
        objc_msgSend(v33, "setLeftBarButtonItems:animated:", 0, v11);
      }
      if (-[ConversationViewControllerBase shouldAddDoneButtonForConversationNavigationBarItemsManager:](self, "shouldAddDoneButtonForConversationNavigationBarItemsManager:", v13))
      {
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "doneButtonItem"));
        v48 = v44;
        v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v48, 1));

        if ((*(_BYTE *)&self->_flags & 1) != 0)
        {
          objc_msgSend(v33, "setRightBarButtonItems:animated:", v45, v11);
          objc_msgSend(v33, "setHidesBackButton:animated:", 1, v11);
        }
        else
        {
          objc_msgSend(v33, "setLeftBarButtonItems:animated:", v45, v11);
          objc_msgSend(v33, "setLeftItemsSupplementBackButton:", 0);
        }

      }
    }
    -[ConversationViewControllerBase _updateBarButtonsEnabled](self, "_updateBarButtonsEnabled");

  }
}

- (id)_defaultBarButtonItems
{
  ConversationViewControllerBase *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[2];

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase barItemsManager](self, "barItemsManager"));
  v4 = objc_alloc_init((Class)NSMutableArray);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "destructiveButtonItem"));
  v14[0] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "moveButtonItem"));
  v14[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 2));
  objc_msgSend(v4, "addObjectsFromArray:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase traitCollection](v2, "traitCollection"));
  LODWORD(v2) = objc_msgSend(v8, "mf_hasCompactDimension");

  if ((_DWORD)v2)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "revealActionsButtonItem"));
    objc_msgSend(v4, "addObject:", v9);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "composeButtonItem"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "composeButtonItem"));
    objc_msgSend(v4, "addObject:", v11);

  }
  v12 = objc_msgSend(v4, "copy");

  return v12;
}

- (void)setDoneButton:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase barItemsManager](self, "barItemsManager"));
  objc_msgSend(v4, "setDoneButton:", v5);

}

- (UIBarButtonItem)doneButton
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase barItemsManager](self, "barItemsManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "doneButton"));

  return (UIBarButtonItem *)v3;
}

- (void)done:(id)a3
{
  void *v4;
  void *v5;
  ConversationViewControllerBase *v6;
  void *v7;
  id v8;
  id v9;

  v9 = (id)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase delegate](self, "delegate", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase navigationController](self, "navigationController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllers"));
  v6 = (ConversationViewControllerBase *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));

  if (v6 == self)
  {
    if ((objc_opt_respondsToSelector(v9, "conversationViewControllerWantsDismissal:") & 1) != 0)
      objc_msgSend(v9, "conversationViewControllerWantsDismissal:", self);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase navigationController](self, "navigationController"));
    v8 = objc_msgSend(v7, "popViewControllerAnimated:", 1);

  }
}

- (id)_flexibleSpaceBarButton
{
  return objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
}

- (id)_fixedSpaceBarButton
{
  id v2;

  v2 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 6, 0, 0);
  objc_msgSend(v2, "setWidth:", 10.0);
  return v2;
}

- (id)_defaultBarButtonsWithFlexibleSpacing:(BOOL)a3 reverseOrder:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSArray *defaultBarButtons;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void **v19;
  uint64_t v20;
  char *(*v21)(uint64_t, uint64_t, unint64_t);
  void *v22;
  id v23;
  ConversationViewControllerBase *v24;
  id v25;
  BOOL v26;

  v4 = a4;
  v5 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (v5)
    v8 = objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase _flexibleSpaceBarButton](self, "_flexibleSpaceBarButton"));
  else
    v8 = objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase _fixedSpaceBarButton](self, "_fixedSpaceBarButton"));
  v9 = (void *)v8;
  if (v4)
    v10 = 2;
  else
    v10 = 0;
  defaultBarButtons = self->_defaultBarButtons;
  v19 = _NSConcreteStackBlock;
  v20 = 3221225472;
  v21 = sub_100085528;
  v22 = &unk_10051C2E0;
  v12 = v7;
  v26 = v4;
  v23 = v12;
  v24 = self;
  v13 = v9;
  v25 = v13;
  -[NSArray enumerateObjectsWithOptions:usingBlock:](defaultBarButtons, "enumerateObjectsWithOptions:usingBlock:", v10, &v19);
  if (v5
    && -[ConversationViewControllerBase shouldHideStickyFooterView](self, "shouldHideStickyFooterView", v19, v20, v21, v22, v23, v24))
  {
    v14 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 6, 0, 0);
    objc_msgSend(v14, "setWidth:", 8.0);
    objc_msgSend(v12, "insertObject:atIndex:", v14, 0);
    v15 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 6, 0, 0);
    objc_msgSend(v15, "setWidth:", 8.0);
    objc_msgSend(v12, "addObject:", v15);

  }
  v16 = v25;
  v17 = v12;

  return v17;
}

- (void)revealActionsButtonTapped:(id)a3
{
  id v5;

  v5 = a3;
  -[ConversationViewControllerBase doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[ConversationViewControllerBase revealActionsButtonTapped:]", "ConversationViewControllerBase.m", 2954, "0");
}

- (void)replyButtonTapped:(id)a3
{
  id v5;

  v5 = a3;
  -[ConversationViewControllerBase doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[ConversationViewControllerBase replyButtonTapped:]", "ConversationViewControllerBase.m", 2958, "0");
}

- (void)replyAllButtonTapped:(id)a3
{
  id v5;

  v5 = a3;
  -[ConversationViewControllerBase doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[ConversationViewControllerBase replyAllButtonTapped:]", "ConversationViewControllerBase.m", 2962, "0");
}

- (void)forwardButtonTapped:(id)a3
{
  id v5;

  v5 = a3;
  -[ConversationViewControllerBase doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[ConversationViewControllerBase forwardButtonTapped:]", "ConversationViewControllerBase.m", 2966, "0");
}

- (void)contactDoneButtonItemTapped:(id)a3
{
  -[ConversationViewControllerBase _dismissPopover](self, "_dismissPopover", a3);
}

- (id)supplementaryButtonItemForConversationNavigationBarItemsManager:(id)a3
{
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_10007B40C;
  v10 = sub_10007B41C;
  v11 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100085808;
  v5[3] = &unk_10051C150;
  v5[4] = &v6;
  -[ConversationViewControllerBase _executeIfSplitViewIsAvailable:](self, "_executeIfSplitViewIsAvailable:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)groupedSenderActionMenuForConversationNavigationBarItemsManager:(id)a3 menuOwner:(id)a4
{
  return 0;
}

- (id)deleteButtonMenuForConversationNavigationBarItemsManager:(id)a3 menuOwner:(id)a4
{
  return 0;
}

- (BOOL)shouldAddDoneButtonForConversationNavigationBarItemsManager:(id)a3
{
  void *v4;
  BOOL v5;

  if (+[UIDevice mf_isPad](UIDevice, "mf_isPad", a3)
    && !-[ConversationViewControllerBase isPrimary](self, "isPrimary")
    && !-[ConversationViewControllerBase shownAsConversation](self, "shownAsConversation"))
  {
    return 1;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase doneButton](self, "doneButton"));
  v5 = v4 != 0;

  return v5;
}

- (void)arrowControlsView:(id)a3 didTapButtonWithDirection:(int)a4
{
  -[ConversationViewControllerBase _navigateToMessageInDirection:](self, "_navigateToMessageInDirection:", *(_QWORD *)&a4);
}

- (void)navigateToMessageInDirection:(int)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3;
  if (-[ConversationViewControllerBase _canBrowseInDirection:](self, "_canBrowseInDirection:"))
    -[ConversationViewControllerBase _navigateToMessageInDirection:](self, "_navigateToMessageInDirection:", v3);
}

- (void)_navigateToMessageInDirection:(int)a3
{
  uint64_t v3;
  uint64_t v5;
  unsigned int v6;
  char flags;
  id WeakRetained;
  uint64_t v9;
  id v10;

  v3 = *(_QWORD *)&a3;
  v5 = objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase _nextMessageIndexWithDirection:](self, "_nextMessageIndexWithDirection:"));
  v10 = (id)v5;
  if (v5)
  {
    *(_BYTE *)&self->_flags &= ~2u;
    -[ConversationViewControllerBase _scrollToItemAtIndexPath:dynamicOffset:shouldAdjustToShowPreviousMessage:animated:pin:completion:](self, "_scrollToItemAtIndexPath:dynamicOffset:shouldAdjustToShowPreviousMessage:animated:pin:completion:", v5, 0, 1, 1, 1, 0);
  }
  else
  {
    v6 = -[ConversationViewControllerBase _isDisplayingSingleMessage](self, "_isDisplayingSingleMessage");
    flags = (char)self->_flags;
    if ((v6 | ((flags & 2) >> 1)) == 1)
    {
      *(_BYTE *)&self->_flags = flags & 0xFD;
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "conversationViewController:advanceToNextConversationWithDirection:", self, v3);

    }
    else
    {
      *(_BYTE *)&self->_flags = flags | 2;
      if ((_DWORD)v3 == -1)
        v9 = 1;
      else
        v9 = 4;
      -[MFCollectionViewPagingAnimator bounceAlongEdge:](self->_pagingAnimator, "bounceAlongEdge:", v9);
    }
  }

}

- (BOOL)_canBrowseInDirection:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  id WeakRetained;

  v3 = *(_QWORD *)&a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase referenceMessageListItem](self, "referenceMessageListItem"));

  if (!v5)
    return 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase _nextMessageIndexWithDirection:](self, "_nextMessageIndexWithDirection:", v3));
  if (v6)
  {
    v7 = 1;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v7 = objc_msgSend(WeakRetained, "conversationViewController:canAdvanceToNextConversationWithDirection:", self, v3);

  }
  return v7;
}

- (void)updateArrowControlsView
{
  void *v3;
  _BOOL8 v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase barItemsManager](self, "barItemsManager"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "arrowControlsView"));

  v4 = -[ConversationViewControllerBase _canBrowseInDirection:](self, "_canBrowseInDirection:", 0xFFFFFFFFLL);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "upButton"));
  objc_msgSend(v5, "setEnabled:", v4);

  v6 = -[ConversationViewControllerBase _canBrowseInDirection:](self, "_canBrowseInDirection:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "downButton"));
  objc_msgSend(v7, "setEnabled:", v6);

}

- (void)_setNavigationBarTitleViewNeedsLayout
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase conversationHeaderView](self, "conversationHeaderView"));
  objc_msgSend(v2, "setNeedsLayout");

}

- (id)replyButtonItem
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase barItemsManager](self, "barItemsManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "replyButtonItem"));

  return v3;
}

- (id)deleteButtonItem
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase barItemsManager](self, "barItemsManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "deleteButtonItem"));

  return v3;
}

- (id)archiveButtonItem
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase barItemsManager](self, "barItemsManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "archiveButtonItem"));

  return v3;
}

- (id)moveButtonItem
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase barItemsManager](self, "barItemsManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "moveButtonItem"));

  return v3;
}

- (MFArrowControlsView)arrowControlsView
{
  MFArrowControlsView *arrowControlsView;
  void *v4;
  MFArrowControlsView *v5;
  MFArrowControlsView *v6;

  arrowControlsView = self->_arrowControlsView;
  if (!arrowControlsView)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase barItemsManager](self, "barItemsManager"));
    v5 = (MFArrowControlsView *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "arrowControlsView"));
    v6 = self->_arrowControlsView;
    self->_arrowControlsView = v5;

    arrowControlsView = self->_arrowControlsView;
  }
  return arrowControlsView;
}

- (void)_dismissPopover
{
  -[ConversationViewControllerBase dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_showModalViewController:(id)a3 fromView:(id)a4 sourceRect:(CGRect)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;
  CGRect v24;
  CGRect v25;

  v6 = a6;
  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v13 = a3;
  v14 = a4;
  v23 = v13;
  v15 = objc_opt_class(UINavigationController);
  v16 = v23;
  if ((objc_opt_isKindOfClass(v23, v15) & 1) == 0)
  {
    v17 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:");

    v16 = v17;
  }
  objc_msgSend(v16, "setModalPresentationStyle:", 7);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "popoverPresentationController"));
  objc_msgSend(v18, "setPermittedArrowDirections:", 3);
  objc_msgSend(v18, "setSourceView:", v14);
  objc_msgSend(v18, "setDelegate:", self);
  v25.origin.x = CGRectZero.origin.x;
  v25.origin.y = CGRectZero.origin.y;
  v25.size.width = CGRectZero.size.width;
  v25.size.height = CGRectZero.size.height;
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  if (CGRectEqualToRect(v24, v25))
  {
    -[ConversationViewControllerBase _defaultSourceRectForView:](self, "_defaultSourceRectForView:", v14);
    x = v19;
    y = v20;
    width = v21;
    height = v22;
  }
  objc_msgSend(v18, "setSourceRect:", x, y, width, height);
  -[ConversationViewControllerBase presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v16, v6, 0);

}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void ***v12;
  void *v13;
  void *v14;
  void **v15;
  uint64_t v16;
  id (*v17)(uint64_t);
  void *v18;
  id v19;
  ConversationViewControllerBase *v20;
  id v21;
  BOOL v22;

  v8 = a3;
  v9 = a5;
  v15 = _NSConcreteStackBlock;
  v16 = 3221225472;
  v17 = sub_100086084;
  v18 = &unk_10051C308;
  v10 = v8;
  v19 = v10;
  v22 = a4;
  v11 = v9;
  v20 = self;
  v21 = v11;
  v12 = objc_retainBlock(&v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase presentedViewController](self, "presentedViewController", v15, v16, v17, v18));
  v14 = v13;
  if (v13 && objc_msgSend(v13, "modalPresentationStyle") == (id)7)
    -[ConversationViewControllerBase dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, v12);
  else
    ((void (*)(void ***))v12[2])(v12);

}

- (CGRect)_defaultSourceRectForView:(id)a3
{
  id v3;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat MidY;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect v12;
  CGRect result;

  v3 = a3;
  objc_msgSend(v3, "bounds");
  x = v12.origin.x;
  y = v12.origin.y;
  width = v12.size.width;
  MidY = CGRectGetMidY(v12);

  v8 = x;
  v9 = y;
  v10 = width;
  v11 = MidY;
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (void)_endEditingAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase conversationLayout](self, "conversationLayout"));
  objc_msgSend(v4, "setSwipedIndexPath:animated:completion:", 0, v3, 0);

}

- (void)presentPreviousDraftPicker
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase scene](self, "scene"));
  if ((objc_opt_respondsToSelector(v5, "composeButtonLongPressed:") & 1) != 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase barItemsManager](self, "barItemsManager"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "composeButtonItem"));
    objc_msgSend(v5, "performSelector:withObject:", "composeButtonLongPressed:", v4);

  }
}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!-[ConversationViewControllerBase desiredContextualControllerPresentationStyle](self, "desiredContextualControllerPresentationStyle"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase barItemsManager](self, "barItemsManager"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contactLeftDoneButtonItem"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "navigationItem"));
    objc_msgSend(v7, "setLeftBarButtonItem:", v6);

  }
}

- (id)passthroughViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase barItemsManager](self, "barItemsManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "replyButtonItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));

  if (v6)
    objc_msgSend(v3, "addObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults em_userDefaults](NSUserDefaults, "em_userDefaults"));
  if ((objc_msgSend(v7, "BOOLForKey:", ShowMessageDeleteConfirmationKey) & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase barItemsManager](self, "barItemsManager"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "deleteButtonItem"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "view"));

    if (v10)
      objc_msgSend(v3, "addObject:", v10);
  }
  else
  {

    v10 = v6;
  }

  return v3;
}

- (void)_updateConversationSortOrder
{
  -[ConversationViewControllerBase setConversationSortOrder:](self, "setConversationSortOrder:", -[ConversationViewControllerBase _currentConversationSortOrderPreference](self, "_currentConversationSortOrderPreference"));
}

- (void)_updateIncludeRelatedMessages
{
  char v3;

  if (sub_100039F8C(0))
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xDF | v3;
  -[ConversationViewControllerBase _reloadDataSource](self, "_reloadDataSource");
}

- (CGSize)defaultCellSizeForTracker:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView", a3));
  objc_msgSend(v4, "mf_visibleHeight");
  v6 = v5;

  if (-[ConversationViewControllerBase _isDisplayingSingleMessage](self, "_isDisplayingSingleMessage"))
  {
    v7 = 0.0;
    if (!-[ConversationViewControllerBase shouldHideStickyFooterView](self, "shouldHideStickyFooterView"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
      objc_msgSend(v8, "contentInset");
      v7 = v9;

    }
    v10 = v6 + v7;
    if (+[UIDevice mf_isPad](UIDevice, "mf_isPad"))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase displayMetrics](self, "displayMetrics"));
      objc_msgSend(v11, "estimatedFooterViewHeight");
      v10 = v10 + v12 * -0.5;

    }
  }
  else
  {
    v10 = 276.0;
  }
  -[ConversationViewControllerBase _expectedCellWidth](self, "_expectedCellWidth");
  v14 = v10;
  result.height = v14;
  result.width = v13;
  return result;
}

- (double)_expectedCellWidth
{
  void *v3;
  double v4;
  CGRect v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
  objc_msgSend(v3, "mui_safeVisibleBounds");
  v4 = CGRectGetWidth(v6) + self->_horizontalPadding * -2.0;

  return v4;
}

- (double)quickReplyHeightForTracker:(id)a3
{
  double v4;
  double v5;
  double v6;

  -[ConversationViewControllerBase quickReplyHeight](self, "quickReplyHeight", a3);
  v5 = v4;
  -[ConversationViewControllerBase _itemSpacing](self, "_itemSpacing");
  return v5 + v6;
}

- (int64_t)conversationViewCellSizeTracker:(id)a3 expansionStatusForMessageWithItemID:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase cellConfigurator](self, "cellConfigurator"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "expansionTracker"));
  v8 = objc_msgSend(v7, "expansionStatusForCellWithItemID:", v5);

  return (int64_t)v8;
}

- (double)defaultSemiExpandedHeightForTracker:(id)a3
{
  void *v3;
  double v4;
  double v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase displayMetrics](self, "displayMetrics", a3));
  +[MFExpandedMessageCell defaultSemiExpandedHeightWithDisplayMetrics:](MFExpandedMessageCell, "defaultSemiExpandedHeightWithDisplayMetrics:", v3);
  v5 = v4;

  return v5;
}

- (void)presentationController:(id)a3 willPresentWithAdaptiveStyle:(int64_t)a4 transitionCoordinator:(id)a5
{
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "presentedViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "childViewControllers"));

  if (objc_msgSend(v8, "count"))
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v21;
LABEL_4:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v12);
        v14 = objc_opt_class(CNContactViewController);
        if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
          break;
        if (v10 == (id)++v12)
        {
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
          if (v10)
            goto LABEL_4;
          goto LABEL_20;
        }
      }
      v10 = v13;

      if (!v10)
        goto LABEL_21;
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "contentViewController", (_QWORD)v20));
      v16 = objc_msgSend(v15, "isEditing");

      if ((v16 & 1) != 0)
        goto LABEL_21;
      if (a4 == -1)
      {
        v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "navigationItem"));
        objc_msgSend(v9, "setLeftBarButtonItem:", 0);
      }
      else
      {
        v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "contact"));
        if (objc_msgSend(v9, "isUnknown"))
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase barItemsManager](self, "barItemsManager"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "contactLeftDoneButtonItem"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "navigationItem"));
          objc_msgSend(v19, "setRightBarButtonItem:", v18);
        }
        else
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase barItemsManager](self, "barItemsManager"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "contactLeftDoneButtonItem"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "navigationItem"));
          objc_msgSend(v19, "setLeftBarButtonItem:", v18);
        }

      }
    }
LABEL_20:

  }
  else
  {
    v10 = 0;
  }
LABEL_21:

}

- (BOOL)wantsBarHidingWhenVerticallyCompact
{
  return !-[ConversationViewControllerBase _shouldShowConversationHeader](self, "_shouldShowConversationHeader");
}

- (void)_toggleCellsGroupOpacityDuringRotationWithCoordinator:(id)a3
{
  id v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[5];

  v4 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100086B70;
  v9[3] = &unk_10051A848;
  v9[4] = self;
  v5 = objc_retainBlock(v9);
  ((void (*)(_QWORD *, uint64_t))v5[2])(v5, 1);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100086CF4;
  v7[3] = &unk_10051C358;
  v6 = v5;
  v8 = v6;
  objc_msgSend(v4, "animateAlongsideTransition:completion:", 0, v7);

}

- (void)_toggleCellGroupOpacityIfNeeded:(id)a3 displaying:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id v8;

  v4 = a4;
  v6 = a3;
  if ((*(_BYTE *)&self->_flags & 0x80000000) != 0)
  {
    v8 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layer"));
    objc_msgSend(v7, "setAllowsGroupOpacity:", !v4);

    v6 = v8;
  }

}

- (void)_beginResizingConversationView:(CGSize)a3
{
  double height;
  double width;
  id v6;
  void *v7;
  id v8;
  BOOL v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;
  CGRect v28;
  CGRect v29;

  height = a3.height;
  width = a3.width;
  v27 = (id)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
  if (objc_msgSend(v27, "numberOfSections"))
    v6 = objc_msgSend(v27, "numberOfItemsInSection:", 0);
  else
    v6 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase splitViewController](self, "splitViewController"));
  v8 = objc_msgSend(v7, "displayMode");

  v9 = v8 == (id)4 || v8 == (id)2;
  if (v9 && v6)
  {
    -[ConversationViewControllerBase prepareForResizing](self, "prepareForResizing");
    objc_msgSend(v27, "frame");
    v14 = v10;
    v15 = v11;
    v16 = v12;
    v17 = v13;
    v18 = 0.0;
    if (height == 0.0)
      v19 = 0.0;
    else
      v19 = width / height;
    if (CGRectGetHeight(*(CGRect *)&v10) != 0.0)
    {
      v28.origin.x = v14;
      v28.origin.y = v15;
      v28.size.width = v16;
      v28.size.height = v17;
      v20 = CGRectGetWidth(v28);
      v29.origin.x = v14;
      v29.origin.y = v15;
      v29.size.width = v16;
      v29.size.height = v17;
      v18 = v20 / CGRectGetHeight(v29);
    }
    if (v18 == v19 || v18 < 1.0 && v19 < 1.0 || v18 > 1.0 && v19 > 1.0)
    {
      v21 = objc_msgSend(v27, "center");
      v14 = UIRectCenteredAboutPoint(v21, v14, v15, width, v17, v22, v23);
      v15 = v24;
      width = v25;
      height = v26;
      objc_msgSend(v27, "setAutoresizingMask:", 5);
    }
    else
    {
      objc_msgSend(v27, "setAutoresizingMask:", 0);
    }
    objc_msgSend(v27, "setFrame:", v14, v15, width, height);
    -[ConversationViewControllerBase layoutMarginsForCollectionViewFrame:](self, "layoutMarginsForCollectionViewFrame:", v14, v15, width, height);
    objc_msgSend(v27, "setDirectionalLayoutMargins:");
    -[ConversationViewControllerBase beginResizing](self, "beginResizing");
  }

}

- (void)_endResizingConversationView
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
  objc_msgSend(v3, "setAutoresizingMask:", 18);

  v4 = sub_10007A788(self);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[ConversationViewControllerBase endResizing](self, "endResizing");
}

- (void)viewSafeAreaInsetsDidChange
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  char v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  objc_super v36;

  v36.receiver = self;
  v36.super_class = (Class)ConversationViewControllerBase;
  -[ConversationViewControllerBase viewSafeAreaInsetsDidChange](&v36, "viewSafeAreaInsetsDidChange");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase conversationLayout](self, "conversationLayout"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "swipedIndexPath"));

  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase view](self, "view"));
    objc_msgSend(v5, "safeAreaInsets");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase displayMetrics](self, "displayMetrics"));
    objc_msgSend(v14, "safeAreaInsets");
    if (v9 == v18 && v7 == v15 && v13 == v17)
    {
      v19 = v16;

      if (v11 == v19)
      {
        v20 = 1;
LABEL_9:
        -[ConversationViewControllerBase _calculateCollectionViewInsets](self, "_calculateCollectionViewInsets");
        v22 = v21;
        v24 = v23;
        v26 = v25;
        v28 = v27;
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
        objc_msgSend(v29, "contentInset");
        if (v33 == v24 && v30 == v22 && v32 == v28)
        {
          v34 = v31;

          if (v34 == v26)
          {
            if ((v20 & 1) != 0)
              return;
            goto LABEL_14;
          }
        }
        else
        {

        }
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
        objc_msgSend(v35, "setContentInset:", v22, v24, v26, v28);

        if ((v20 & 1) != 0)
          return;
LABEL_14:
        -[ConversationViewControllerBase _restorePinnedScrollPosition](self, "_restorePinnedScrollPosition");
        return;
      }
    }
    else
    {

    }
    -[ConversationViewControllerBase _updateDisplayMetrics](self, "_updateDisplayMetrics");
    v20 = 0;
    goto LABEL_9;
  }
}

- (void)_updateDisplayMetrics
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  double v8;
  unsigned int v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase traitCollection](self, "traitCollection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
  objc_msgSend(v4, "layoutMargins");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase messageDisplayMetricsForTraitCollection:layoutMargins:](self, "messageDisplayMetricsForTraitCollection:layoutMargins:", v3));
  -[ConversationViewControllerBase setDisplayMetrics:](self, "setDisplayMetrics:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase traitCollection](self, "traitCollection"));
  v7 = objc_msgSend(v6, "horizontalSizeClass");
  v8 = 0.0;
  if (v7 == (id)2)
  {
    v9 = +[UIDevice mf_isPad](UIDevice, "mf_isPad", 0.0);
    v8 = 0.0;
    if (v9)
      v8 = 24.0;
  }
  self->_horizontalPadding = v8;

  -[ConversationViewControllerBase _didChangeHorizontalPadding:](self, "_didChangeHorizontalPadding:", self->_horizontalPadding);
}

- (id)messageDisplayMetricsForTraitCollection:(id)a3 layoutMargins:(UIEdgeInsets)a4
{
  double right;
  double bottom;
  double left;
  double top;
  id v9;
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
  double v20;
  double v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase defaultBarButtons](self, "defaultBarButtons"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastObject"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "view"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase view](self, "view"));
  objc_msgSend(v13, "safeAreaInsets");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase scene](self, "scene"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[MFMessageDisplayMetrics displayMetricsWithTraitCollection:layoutMargins:safeAreaInsets:interfaceOrientation:trailingButtonView:](MFMessageDisplayMetrics, "displayMetricsWithTraitCollection:layoutMargins:safeAreaInsets:interfaceOrientation:trailingButtonView:", v9, objc_msgSend(v22, "interfaceOrientation"), v12, top, left, bottom, right, v15, v17, v19, v21));

  if (v23)
    v24 = v23;
  else
    v24 = (id)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase displayMetrics](self, "displayMetrics"));
  v25 = v24;

  return v25;
}

- (void)setDisplayMetrics:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if ((-[MFMessageDisplayMetrics isEqual:](self->_displayMetrics, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_displayMetrics, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase cellConfigurator](self, "cellConfigurator"));
    objc_msgSend(v5, "setDisplayMetrics:", v7);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase conversationLayout](self, "conversationLayout"));
    objc_msgSend(v6, "setDisplayMetrics:", v7);

  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  id v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase cellExpansionRecognizer](self, "cellExpansionRecognizer"));

  if (v5 == v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
    if ((objc_msgSend(v7, "hasActiveDrag") & 1) != 0)
    {
LABEL_4:
      LOBYTE(v6) = 0;
LABEL_8:

      goto LABEL_9;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
    if ((objc_msgSend(v8, "isDragging") & 1) != 0)
    {
      LOBYTE(v6) = 0;
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase conversationLayout](self, "conversationLayout"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "swipedIndexPath"));

      if (v11)
      {
        LOBYTE(v6) = 0;
        goto LABEL_9;
      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
      objc_msgSend(v4, "locationInView:", v12);
      v14 = v13;
      v16 = v15;

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "indexPathForItemAtPoint:", v14, v16));

      if (!v7)
        goto LABEL_4;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase cellConfigurator](self, "cellConfigurator"));
      v6 = objc_msgSend(v8, "messageAtIndexPathIsExpanded:", v7) ^ 1;
    }

    goto LABEL_8;
  }
  LOBYTE(v6) = 1;
LABEL_9:

  return v6;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase cellExpansionRecognizer](self, "cellExpansionRecognizer"));
  LOBYTE(self) = v6 == v5;

  return (char)self;
}

- (void)_expansionRecognizerDidRecognize:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  _QWORD v18[5];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
  objc_msgSend(v4, "locationInView:", v5);
  v8 = v6;
  v9 = v7;
  if (!qword_1005A9AF0)
  {
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathForItemAtPoint:", v6, v7));
    v11 = (void *)qword_1005A9AF0;
    qword_1005A9AF0 = v10;

  }
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100087978;
  v18[3] = &unk_10051A848;
  v18[4] = self;
  v12 = objc_retainBlock(v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathForItemAtPoint:", v8, v9));
  if (objc_msgSend(v4, "state") == (id)1)
  {
    objc_storeStrong((id *)&qword_1005A9AF0, v13);
    v14 = 1;
LABEL_13:
    ((void (*)(_QWORD *, uint64_t))v12[2])(v12, v14);
    goto LABEL_14;
  }
  if (objc_msgSend(v4, "state") == (id)2)
  {
    v14 = (uint64_t)objc_msgSend(v13, "isEqual:", qword_1005A9AF0);
    goto LABEL_13;
  }
  if (objc_msgSend(v4, "state") != (id)3)
  {
    if (objc_msgSend(v4, "state") != (id)4)
      goto LABEL_14;
LABEL_12:
    v14 = 0;
    goto LABEL_13;
  }
  if (!objc_msgSend(v13, "isEqual:", qword_1005A9AF0))
    goto LABEL_12;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
  v16 = objc_msgSend(v15, "isDragging");

  if ((v16 & 1) != 0)
    goto LABEL_12;
  -[ConversationViewControllerBase setLastExpandedCellIndexPath:](self, "setLastExpandedCellIndexPath:", v13);
  -[ConversationViewControllerBase setPinnedItem:](self, "setPinnedItem:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase cellConfigurator](self, "cellConfigurator"));
  objc_msgSend(v17, "expandCellAtIndexPath:animated:highlightFirst:expansionStatus:", v13, 1, 1, 3);

LABEL_14:
}

- (BOOL)_executeIfSplitViewIsAvailable:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  _BOOL4 v6;
  void *v7;

  v4 = (void (**)(id, void *))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase scene](self, "scene"));
  v6 = -[ConversationViewControllerBase isSplitViewAvailable](self, "isSplitViewAvailable");
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "splitViewController"));
    v4[2](v4, v7);

  }
  return v6;
}

- (BOOL)isSplitViewAvailable
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase scene](self, "scene"));
  v3 = objc_msgSend(v2, "conformsToProtocol:", &OBJC_PROTOCOL___SplitLayoutCapable);

  return v3;
}

- (void)_testReplyForSelectedMessage
{
  -[ConversationViewControllerBase doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[ConversationViewControllerBase _testReplyForSelectedMessage]", "ConversationViewControllerBase.m", 3600, "0");
}

- (void)_testDeleteSelectedMessage
{
  -[ConversationViewControllerBase doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[ConversationViewControllerBase _testDeleteSelectedMessage]", "ConversationViewControllerBase.m", 3604, "0");
}

- (void)setDisableScrollPinning:(BOOL)a3
{
  self->_disableScrollPinning = a3;
  if (a3)
    -[ConversationViewControllerBase setPinnedItem:](self, "setPinnedItem:", 0);
}

- (BOOL)shouldHideStickyFooterView
{
  ConversationViewControllerBase *v2;
  void *v3;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase traitCollection](self, "traitCollection"));
  LOBYTE(v2) = -[ConversationViewControllerBase _shouldHideStickyFooterViewForTraitCollection:](v2, "_shouldHideStickyFooterViewForTraitCollection:", v3);

  return (char)v2;
}

- (BOOL)_shouldHideStickyFooterViewForTraitCollection:(id)a3
{
  return objc_msgSend(a3, "mf_hasCompactDimension");
}

- (void)_messageSearchBegan
{
  ConversationSearchHandler *v3;
  ConversationSearchHandler *conversationSearchHandler;

  if (!self->_conversationSearchHandler)
  {
    v3 = objc_opt_new(ConversationSearchHandler);
    conversationSearchHandler = self->_conversationSearchHandler;
    self->_conversationSearchHandler = v3;

    sub_10005876C((id *)&self->_conversationSearchHandler->super.isa, self);
  }
}

- (void)_messageSearchEnded
{
  sub_100087C10((uint64_t)self, 0);
}

- (id)conversationSearchMessageListForConversationSearchHandler:(id)a3
{
  id v5;

  v5 = a3;
  -[ConversationViewControllerBase doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[ConversationViewControllerBase conversationSearchMessageListForConversationSearchHandler:]", "ConversationViewControllerBase.m", 3656, "0");
}

- (id)conversationSearchHandler:(id)a3 contentRepresentationRequestForItemID:(id)a4
{
  id v7;
  id v8;

  v7 = a3;
  v8 = a4;
  -[ConversationViewControllerBase doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[ConversationViewControllerBase conversationSearchHandler:contentRepresentationRequestForItemID:]", "ConversationViewControllerBase.m", 3660, "0");
}

- (BOOL)conversationSearchHandler:(id)a3 shouldConsiderQuotedContentForItemID:(id)a4
{
  id v7;
  id v8;

  v7 = a3;
  v8 = a4;
  -[ConversationViewControllerBase doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[ConversationViewControllerBase conversationSearchHandler:shouldConsiderQuotedContentForItemID:]", "ConversationViewControllerBase.m", 3664, "0");
}

- (double)widthForConversationViewCellsForConversationSearchHandler:(id)a3
{
  id v5;

  v5 = a3;
  -[ConversationViewControllerBase doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[ConversationViewControllerBase widthForConversationViewCellsForConversationSearchHandler:]", "ConversationViewControllerBase.m", 3668, "0");
}

- (id)_persistentIDForEMMessageObjectID:(id)a3
{
  id v5;

  v5 = a3;
  -[ConversationViewControllerBase doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[ConversationViewControllerBase _persistentIDForEMMessageObjectID:]", "ConversationViewControllerBase.m", 3672, "0");
}

- (void)_updateAllowQuickReplyForMessageListItem:(id)a3
{
  int v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  v4 = _os_feature_enabled_impl("Mail", "QuickReply") ^ 1;
  if (!v7)
    LOBYTE(v4) = 1;
  if ((v4 & 1) == 0 && !-[ConversationViewControllerBase beingPreviewed](self, "beingPreviewed"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sendLaterDate"));
    if (v5)
    {

    }
    else if ((objc_msgSend(v7, "isEditable") & 1) == 0)
    {
      -[ConversationViewControllerBase _setupQuickReplySupplementaryViewProvider](self, "_setupQuickReplySupplementaryViewProvider");
      v6 = 1;
      goto LABEL_9;
    }
  }
  v6 = 0;
LABEL_9:
  -[ConversationViewControllerBase setAllowQuickReply:](self, "setAllowQuickReply:", v6);

}

- (BOOL)_isQuickReplyMessageAtIndexPath:(id)a3
{
  return 0;
}

- (BOOL)_isUndoSendMessageAtIndexPath:(id)a3
{
  return 0;
}

- (double)_quickReplyHorizontalPadding
{
  return self->_horizontalPadding;
}

- (id)_quickReplyView
{
  return 0;
}

- (void)setDidCompleteFirstPaint:(BOOL)a3
{
  if (self->_didCompleteFirstPaint != a3)
  {
    self->_didCompleteFirstPaint = a3;
    if (a3)
      -[ConversationViewControllerBase _invalidateQuickReplyFooter](self, "_invalidateQuickReplyFooter");
  }
}

- (PinnedConversationItem)pinnedItem
{
  return self->_pinnedItem;
}

- (ConversationViewControllerBaseDelegate)delegate
{
  return (ConversationViewControllerBaseDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (unint64_t)conversationSortOrder
{
  return self->_conversationSortOrder;
}

- (void)setConversationSortOrder:(unint64_t)a3
{
  self->_conversationSortOrder = a3;
}

- (BOOL)isPrimary
{
  return self->_isPrimary;
}

- (BOOL)isStandalone
{
  return self->_isStandalone;
}

- (void)setIsStandalone:(BOOL)a3
{
  self->_isStandalone = a3;
}

- (BOOL)messagesShowSourceMailbox
{
  return self->_messagesShowSourceMailbox;
}

- (void)setMessagesShowSourceMailbox:(BOOL)a3
{
  self->_messagesShowSourceMailbox = a3;
}

- (BOOL)isToolbarHidden
{
  return self->_toolbarHidden;
}

- (void)setToolbarHidden:(BOOL)a3
{
  self->_toolbarHidden = a3;
}

- (BOOL)shownAsConversation
{
  return self->_shownAsConversation;
}

- (void)setShownAsConversation:(BOOL)a3
{
  self->_shownAsConversation = a3;
}

- (EMMessageListItem)focusedMessage
{
  return self->_focusedMessage;
}

- (CGPoint)initialScrollOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_initialScrollOffset.x;
  y = self->_initialScrollOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setInitialScrollOffset:(CGPoint)a3
{
  self->_initialScrollOffset = a3;
}

- (MFMessageDisplayMetrics)displayMetrics
{
  return self->_displayMetrics;
}

- (BOOL)allowQuickReply
{
  return self->_allowQuickReply;
}

- (void)setAllowQuickReply:(BOOL)a3
{
  self->_allowQuickReply = a3;
}

- (EMMailboxRepository)mailboxRepository
{
  return self->_mailboxRepository;
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (ECSubject)conversationSubject
{
  return self->_conversationSubject;
}

- (void)setConversationSubject:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSIndexPath)removedSingleMessageIndexPath
{
  return self->_removedSingleMessageIndexPath;
}

- (void)setRemovedSingleMessageIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_removedSingleMessageIndexPath, a3);
}

- (MFTextSelectionScrollHandler)textSelectionScrollHandler
{
  return self->_textSelectionScrollHandler;
}

- (void)setTextSelectionScrollHandler:(id)a3
{
  objc_storeStrong((id *)&self->_textSelectionScrollHandler, a3);
}

- (MFConversationHandoffCoordinator)handoffCoordinator
{
  return self->_handoffCoordinator;
}

- (void)setHandoffCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_handoffCoordinator, a3);
}

- (MFConversationAssistantContextProvider)assistantContextProvider
{
  return self->_assistantContextProvider;
}

- (void)setAssistantContextProvider:(id)a3
{
  objc_storeStrong((id *)&self->_assistantContextProvider, a3);
}

- (MFConversationCurrentVisibleMessageStrategy)currentVisibleMessageStrategy
{
  return self->_currentVisibleMessageStrategy;
}

- (void)setCurrentVisibleMessageStrategy:(id)a3
{
  objc_storeStrong((id *)&self->_currentVisibleMessageStrategy, a3);
}

- (MFCollectionViewPagingAnimator)pagingAnimator
{
  return self->_pagingAnimator;
}

- (void)setPagingAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_pagingAnimator, a3);
}

- (int64_t)resizingState
{
  return self->_resizingState;
}

- (NSArray)resizingContentViews
{
  return self->_resizingContentViews;
}

- (void)setResizingContentViews:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (MFConversationPreviewState)previewState
{
  return self->_previewState;
}

- (void)setPreviewState:(id)a3
{
  objc_storeStrong((id *)&self->_previewState, a3);
}

- (BOOL)shouldShowNoMessageSelectedView
{
  return self->_shouldShowNoMessageSelectedView;
}

- (CGPoint)layoutInvalidationContentOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_layoutInvalidationContentOffset.x;
  y = self->_layoutInvalidationContentOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLayoutInvalidationContentOffset:(CGPoint)a3
{
  self->_layoutInvalidationContentOffset = a3;
}

- (double)nextAvailableLoadMoreInterval
{
  return self->_nextAvailableLoadMoreInterval;
}

- (void)setNextAvailableLoadMoreInterval:(double)a3
{
  self->_nextAvailableLoadMoreInterval = a3;
}

- (_TtC10MobileMail37ConversationNavigationBarItemsManager)barItemsManager
{
  return self->_barItemsManager;
}

- (NSArray)defaultBarButtons
{
  return self->_defaultBarButtons;
}

- (void)setDefaultBarButtons:(id)a3
{
  objc_storeStrong((id *)&self->_defaultBarButtons, a3);
}

- (MFSwipableCollectionViewLayout)conversationLayout
{
  return self->_conversationLayout;
}

- (void)setConversationLayout:(id)a3
{
  objc_storeStrong((id *)&self->_conversationLayout, a3);
}

- (ConversationHeaderView)conversationHeaderView
{
  return self->_conversationHeaderView;
}

- (void)setConversationHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_conversationHeaderView, a3);
}

- (NSIndexPath)lastExpandedCellIndexPath
{
  return self->_lastExpandedCellIndexPath;
}

- (void)setLastExpandedCellIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_lastExpandedCellIndexPath, a3);
}

- (MFConversationCellExpansionGestureRecognizer)cellExpansionRecognizer
{
  return self->_cellExpansionRecognizer;
}

- (void)setCellExpansionRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_cellExpansionRecognizer, a3);
}

- (EFFuture)restorationFuture
{
  return self->_restorationFuture;
}

- (void)setRestorationFuture:(id)a3
{
  objc_storeStrong((id *)&self->_restorationFuture, a3);
}

- (BOOL)didCompleteFirstPaint
{
  return self->_didCompleteFirstPaint;
}

- (NSMutableDictionary)cellHeightCache
{
  return self->_cellHeightCache;
}

- (void)setCellHeightCache:(id)a3
{
  objc_storeStrong((id *)&self->_cellHeightCache, a3);
}

- (MFConversationCellConfigurator)cellConfigurator
{
  return self->_cellConfigurator;
}

- (void)setCellConfigurator:(id)a3
{
  objc_storeStrong((id *)&self->_cellConfigurator, a3);
}

- (MFMessageViewControllerReuseQueue)messageViewControllerReuseQueue
{
  return self->_messageViewControllerReuseQueue;
}

- (void)setMessageViewControllerReuseQueue:(id)a3
{
  objc_storeStrong((id *)&self->_messageViewControllerReuseQueue, a3);
}

- (void)setScene:(id)a3
{
  objc_storeWeak((id *)&self->_scene, a3);
}

- (BOOL)didNotifyExtendedLaunchTracker
{
  return self->_didNotifyExtendedLaunchTracker;
}

- (void)setDidNotifyExtendedLaunchTracker:(BOOL)a3
{
  self->_didNotifyExtendedLaunchTracker = a3;
}

- (BOOL)disableScrollPinning
{
  return self->_disableScrollPinning;
}

- (BlankConversationController)blankConversationController
{
  return self->_blankConversationController;
}

- (void)setBlankConversationController:(id)a3
{
  objc_storeStrong((id *)&self->_blankConversationController, a3);
}

- (EFLocked)quickReplyAnimationContext
{
  return self->_quickReplyAnimationContext;
}

- (BOOL)isPerformingQuickReplySendAnimation
{
  return self->_isPerformingQuickReplySendAnimation;
}

- (void)setIsPerformingQuickReplySendAnimation:(BOOL)a3
{
  self->_isPerformingQuickReplySendAnimation = a3;
}

- (double)horizontalPadding
{
  return self->_horizontalPadding;
}

- (void)setHorizontalPadding:(double)a3
{
  self->_horizontalPadding = a3;
}

- (double)quickReplyHeight
{
  return self->_quickReplyHeight;
}

- (void)setQuickReplyHeight:(double)a3
{
  self->_quickReplyHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quickReplyAnimationContext, 0);
  objc_storeStrong((id *)&self->_blankConversationController, 0);
  objc_storeStrong((id *)&self->_conversationSearchHandler, 0);
  objc_storeStrong((id *)&self->_findInteraction, 0);
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_messageViewControllerReuseQueue, 0);
  objc_storeStrong((id *)&self->_cellConfigurator, 0);
  objc_storeStrong((id *)&self->_cellHeightCache, 0);
  objc_storeStrong((id *)&self->_restorationFuture, 0);
  objc_storeStrong((id *)&self->_cellExpansionRecognizer, 0);
  objc_storeStrong((id *)&self->_lastExpandedCellIndexPath, 0);
  objc_storeStrong((id *)&self->_conversationHeaderView, 0);
  objc_storeStrong((id *)&self->_conversationLayout, 0);
  objc_storeStrong((id *)&self->_defaultBarButtons, 0);
  objc_storeStrong((id *)&self->_barItemsManager, 0);
  objc_storeStrong((id *)&self->_previewState, 0);
  objc_storeStrong((id *)&self->_resizingContentViews, 0);
  objc_storeStrong((id *)&self->_pagingAnimator, 0);
  objc_storeStrong((id *)&self->_currentVisibleMessageStrategy, 0);
  objc_storeStrong((id *)&self->_assistantContextProvider, 0);
  objc_storeStrong((id *)&self->_handoffCoordinator, 0);
  objc_storeStrong((id *)&self->_textSelectionScrollHandler, 0);
  objc_storeStrong((id *)&self->_removedSingleMessageIndexPath, 0);
  objc_storeStrong((id *)&self->_conversationSubject, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_mailboxRepository, 0);
  objc_storeStrong((id *)&self->_displayMetrics, 0);
  objc_storeStrong((id *)&self->_focusedMessage, 0);
  objc_storeStrong((id *)&self->_referenceMessageListItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_arrowControlsView, 0);
  objc_storeStrong((id *)&self->_pinnedItem, 0);
  objc_storeStrong((id *)&self->_conversationView, 0);
}

@end
