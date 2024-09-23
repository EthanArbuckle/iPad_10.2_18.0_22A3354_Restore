@implementation ConversationViewController

- (id)_priorityLoadingComparatorForPinnedItemID:(id)a3
{
  id v4;
  id v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD *v19;
  _QWORD v20[4];
  id v21;

  v4 = a3;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10005C708;
  v20[3] = &unk_10051AF38;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ConversationViewController collectionViewDataSource](self, "collectionViewDataSource"));
  v21 = v5;
  v6 = objc_retainBlock(v20);
  v7 = v6;
  if (v4)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10005C728;
    v17[3] = &unk_10051AF60;
    v19 = v6;
    v18 = v4;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[EFFuture lazyFutureWithBlock:](EFFuture, "lazyFutureWithBlock:", v17));

  }
  else
  {
    v8 = 0;
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10005C788;
  v14[3] = &unk_10051AF88;
  v15 = v8;
  v16 = v7;
  v9 = v8;
  v10 = v7;
  v11 = objc_retainBlock(v14);
  v12 = objc_retainBlock(v11);

  return v12;
}

- (ConversationViewController)initWithScene:(id)a3
{
  id v4;
  char *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  NSMutableDictionary *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  MFPriorityLoadingQueue *v23;
  void *v24;
  void *v25;
  _UIFindInteraction *v26;
  void *v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  _QWORD v34[4];
  id v35;
  id v36;
  id location;
  objc_super v38;

  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)ConversationViewController;
  v5 = -[ConversationViewControllerBase initWithScene:](&v38, "initWithScene:", v4);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "daemonInterface"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "messageRepository"));
    v8 = *(void **)(v5 + 420);
    *(_QWORD *)(v5 + 420) = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "daemonInterface"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mailboxRepository"));
    v11 = *(void **)(v5 + 428);
    *(_QWORD *)(v5 + 428) = v10;

    v12 = objc_msgSend(objc_alloc((Class)MessageListCollectionHelper), "initWithLoggableClient:updateQueueName:sectionObjectID:", v5, CFSTR("com.apple.mobilemail.ConversationViewController.collectionViewUpdate"), 0);
    v13 = *(void **)(v5 + 452);
    *(_QWORD *)(v5 + 452) = v12;

    v14 = objc_msgSend(objc_alloc((Class)EFLRUCache), "initWithCapacity:", 50);
    v15 = *(void **)(v5 + 460);
    *(_QWORD *)(v5 + 460) = v14;

    if (_os_feature_enabled_impl("Mail", "CatchUpManualSummarization")
      && EMIsGreymatterSupportedWithOverride())
    {
      v16 = objc_opt_new(NSMutableDictionary);
      v17 = *(void **)(v5 + 660);
      *(_QWORD *)(v5 + 660) = v16;

    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler serialDispatchQueueSchedulerWithName:qualityOfService:](EFScheduler, "serialDispatchQueueSchedulerWithName:qualityOfService:", CFSTR("com.apple.mobilemail.loadingQueue"), 25));
    v19 = objc_claimAutoreleasedReturnValue(+[EFScheduler serialDispatchQueueSchedulerWithName:qualityOfService:](EFScheduler, "serialDispatchQueueSchedulerWithName:qualityOfService:", CFSTR("com.apple.mobilemail.mailboxPrediction"), 17));
    v20 = *(void **)(v5 + 572);
    *(_QWORD *)(v5 + 572) = v19;

    v21 = objc_claimAutoreleasedReturnValue(+[EFScheduler serialDispatchQueueSchedulerWithName:qualityOfService:](EFScheduler, "serialDispatchQueueSchedulerWithName:qualityOfService:", CFSTR("com.apple.mobilemail.conversationViewController.messageLoading"), 25));
    v22 = *(void **)(v5 + 580);
    *(_QWORD *)(v5 + 580) = v21;

    v23 = -[MFPriorityLoadingQueue initWithScheduler:]([MFPriorityLoadingQueue alloc], "initWithScheduler:", v18);
    v24 = *(void **)(v5 + 476);
    *(_QWORD *)(v5 + 476) = v23;

    objc_msgSend(*(id *)(v5 + 476), "setItemHandler:", &stru_10051AD68);
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_priorityLoadingComparatorForPinnedItemID:", 0));
    objc_msgSend(*(id *)(v5 + 476), "setComparator:", v25);

    v26 = objc_opt_new(_UIFindInteraction);
    -[_UIFindInteraction setSearchableObject:](v26, "setSearchableObject:", v5);
    sub_1000473F8((uint64_t)v5, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults em_userDefaults](NSUserDefaults, "em_userDefaults"));
    v28 = EMUserDefaultDisableFollowUp;
    objc_msgSend(v5, "setHideFollowUp:", objc_msgSend(v27, "BOOLForKey:", EMUserDefaultDisableFollowUp));
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v5);
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_100058B5C;
    v34[3] = &unk_10051AD90;
    objc_copyWeak(&v36, &location);
    v29 = v27;
    v35 = v29;
    v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "ef_observeKeyPath:options:autoCancelToken:usingBlock:", v28, 1, 1, v34));
    v31 = *(void **)(v5 + 604);
    *(_QWORD *)(v5 + 604) = v30;

    if (_os_feature_enabled_impl("Mail", "CatchUpManualSummarization")
      && EMIsGreymatterSupportedWithOverride())
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v32, "addObserver:selector:name:object:", v5, "_generativeModelsAvailabilityDidChange:", EMGenerativeModelsAvailabilityDidChange, 0);

    }
    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);

  }
  return (ConversationViewController *)v5;
}

- (void)setHideFollowUp:(BOOL)a3
{
  self->_hideFollowUp = a3;
}

- (void)setDiagnosticsHelperToken:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_diagnosticsHelperToken + 4), a3);
}

- (void)setDiagnosticsHelper:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (*(id *)((char *)&self->_diagnosticsHelper + 4) != v7)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController diagnosticsHelperToken](self, "diagnosticsHelperToken"));
    objc_msgSend(v5, "cancel");

    objc_storeStrong((id *)((char *)&self->_diagnosticsHelper + 4), a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "registerDiagnosticFileProvider:", self));
    -[ConversationViewController setDiagnosticsHelperToken:](self, "setDiagnosticsHelperToken:", v6);

  }
}

- (EFCancelable)diagnosticsHelperToken
{
  return *(EFCancelable **)((char *)&self->_diagnosticsHelperToken + 4);
}

- (UICollectionViewDiffableDataSource)collectionViewDataSource
{
  return *(UICollectionViewDiffableDataSource **)((char *)&self->_collectionViewDataSource + 4);
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003C148;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005A9AC0 != -1)
    dispatch_once(&qword_1005A9AC0, block);
  return (OS_os_log *)(id)qword_1005A9AB8;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController contentItemsCancelable](self, "contentItemsCancelable"));
  objc_msgSend(v3, "cancel");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController predictedMailboxForConversation](self, "predictedMailboxForConversation"));
  objc_msgSend(v4, "cancel");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController diagnosticsHelperToken](self, "diagnosticsHelperToken"));
  objc_msgSend(v5, "cancel");

  v6.receiver = self;
  v6.super_class = (Class)ConversationViewController;
  -[ConversationViewControllerBase dealloc](&v6, "dealloc");
}

- (void)setConversationSortOrder:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ConversationViewController;
  -[ConversationViewControllerBase setConversationSortOrder:](&v4, "setConversationSortOrder:", a3);
  -[ConversationViewController _reloadDataSource](self, "_reloadDataSource");
  -[ConversationViewController _updateQuickReplyState](self, "_updateQuickReplyState");
}

- (EMQuery)referenceMessageListQuery
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController referenceMessageList](self, "referenceMessageList"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "query"));

  return (EMQuery *)v3;
}

- (void)loadView
{
  void ***v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void **v8;
  uint64_t v9;
  id (*v10)(uint64_t, uint64_t, void *, void *);
  void *v11;
  id v12;
  id location;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)ConversationViewController;
  -[ConversationViewControllerBase loadView](&v14, "loadView");
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v8 = _NSConcreteStackBlock;
  v9 = 3221225472;
  v10 = sub_100058F00;
  v11 = &unk_10051ADF8;
  objc_copyWeak(&v12, &location);
  v3 = objc_retainBlock(&v8);
  v4 = objc_alloc((Class)UICollectionViewDiffableDataSource);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView", v8, v9, v10, v11));
  v6 = objc_msgSend(v4, "initWithCollectionView:cellProvider:", v5, v3);
  -[ConversationViewController setCollectionViewDataSource:](self, "setCollectionViewDataSource:", v6);

  if (-[ConversationViewControllerBase allowQuickReply](self, "allowQuickReply"))
    -[ConversationViewController _setupQuickReplySupplementaryViewProvider](self, "_setupQuickReplySupplementaryViewProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase conversationLayout](self, "conversationLayout"));
  objc_msgSend(v7, "setSwipeDelegate:", self);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ConversationViewController;
  -[ConversationViewControllerBase viewWillAppear:](&v9, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase referenceMessageListItem](self, "referenceMessageListItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sendLaterDate"));
  if (v5 || (v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "readLater"))) != 0)
  {

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "followUp"));

    if (!v8)
      goto LABEL_5;
  }
  -[ConversationViewController _reloadDataSource](self, "_reloadDataSource");
LABEL_5:
  v6 = -[ConversationViewControllerBase shouldHideStickyFooterView](self, "shouldHideStickyFooterView");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController navigationController](self, "navigationController"));
  objc_msgSend(v7, "setToolbarHidden:", v6 ^ 1);

  if (!v4 && -[ConversationViewControllerBase shouldShowNoMessageSelectedView](self, "shouldShowNoMessageSelectedView"))
    sub_10005923C(self);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ConversationViewController;
  -[ConversationViewControllerBase viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[ConversationViewController _reloadTopSummaryIfNecessary](self, "_reloadTopSummaryIfNecessary");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ConversationViewController;
  -[ConversationViewControllerBase viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  -[ConversationViewController swipableCollectionViewLayout:willEndSwipeForItemAtIndexPath:]_0(self);
}

- (void)swipableCollectionViewLayout:(void *)a1 willEndSwipeForItemAtIndexPath:
{
  id v2;
  void *v3;
  void *v4;
  _BOOL4 v5;
  NSObject *v6;
  NSString *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  _BOOL4 v14;
  __int16 v15;
  void *v16;

  if (a1)
  {
    v2 = sub_100062ED8(a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "presentedViewController"));
    v5 = sub_100062DB0(a1, v4);

    v6 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = NSStringFromSelector("_dismissPresentedViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      v9 = 134218754;
      v10 = a1;
      v11 = 2112;
      v12 = v8;
      v13 = 1024;
      v14 = v5;
      v15 = 2112;
      v16 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "<%p> %@ shouldDismiss:%d presentingVC:%@", (uint8_t *)&v9, 0x26u);

    }
    if (v5)
      objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ConversationViewController;
  -[ConversationViewControllerBase viewDidDisappear:](&v4, "viewDidDisappear:", a3);
  -[ConversationViewController reenableAutomaticMarkAsReadForAllMessages](self, "reenableAutomaticMarkAsReadForAllMessages");
}

- (BOOL)canBecomeFirstResponder
{
  return 0;
}

- (id)undoManager
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase scene](self, "scene"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "undoManager"));

  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  unsigned int v10;
  void *v11;
  NSString *v12;
  int IsAccessibilityCategory;
  NSString *v14;
  objc_super v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController presentedViewController](self, "presentedViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _mailActionsViewControllerFromPresentedViewController:](self, "_mailActionsViewControllerFromPresentedViewController:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController presentedViewController](self, "presentedViewController"));
  if (v7)
  {
    if (v6)
    {
      v8 = -[ConversationViewControllerBase _shouldHideStickyFooterViewForTraitCollection:](self, "_shouldHideStickyFooterViewForTraitCollection:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController traitCollection](self, "traitCollection"));
      v10 = -[ConversationViewControllerBase _shouldHideStickyFooterViewForTraitCollection:](self, "_shouldHideStickyFooterViewForTraitCollection:", v9);

      if (v8 != v10)
        goto LABEL_4;
      if (objc_msgSend(v6, "useActionSheetStyleCard"))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController traitCollection](self, "traitCollection"));
        v12 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "preferredContentSizeCategory"));
        IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v12);

        v14 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));
        LODWORD(v12) = UIContentSizeCategoryIsAccessibilityCategory(v14);

        if (IsAccessibilityCategory != (_DWORD)v12)
LABEL_4:
          -[ConversationViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
      }
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)ConversationViewController;
  -[ConversationViewControllerBase traitCollectionDidChange:](&v15, "traitCollectionDidChange:", v4);

}

- (void)setReferenceMessageListItem:(id)a3 referenceMessageList:(id)a4 showAsConversation:(BOOL)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  os_signpost_id_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  ConversationViewController *v19;
  void *v20;
  unsigned int v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  ConversationViewController *v32;
  NSObject *v33;
  ConversationViewController *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  ConversationViewController *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  BOOL v46;
  void *v47;
  NSObject *v48;
  ConversationViewController *v49;
  void **v50;
  uint64_t v51;
  void (*v52)(uint64_t);
  void *v53;
  ConversationViewController *v54;
  id v55;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  ConversationViewController *v58;
  __int16 v59;
  id v60;
  __int16 v61;
  _BOOL4 v62;
  __int16 v63;
  _BOOL4 v64;
  __int16 v65;
  _BOOL4 v66;

  v6 = a6;
  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = MFMessageSelectionLifecycleSignpostLog();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "itemID"));
  v15 = os_signpost_id_make_with_pointer(v13, v14);

  v16 = MFMessageSelectionLifecycleSignpostLog();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  v18 = v17;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    v19 = (ConversationViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "itemID"));
    *(_DWORD *)buf = 138543362;
    v58 = v19;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_EVENT, v15, "Message selection lifecycle", "Setting reference item for message with itemID: %{public}@", buf, 0xCu);

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase referenceMessageListItem](self, "referenceMessageListItem"));
  v21 = objc_msgSend(v20, "isEqual:", v10);

  v22 = _os_activity_create((void *)&_mh_execute_header, "loading messages for the conversation view", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v22, &state);
  if (!v21)
  {
    -[ConversationViewController setDidAutoReloadDataSource:](self, "setDidAutoReloadDataSource:", 0);
LABEL_13:
    -[ConversationViewController setDisabledMarkAsReadMessageItemIDs:](self, "setDisabledMarkAsReadMessageItemIDs:", 0);
    -[ConversationViewController setExpandedContentItemIDs:](self, "setExpandedContentItemIDs:", 0);
    -[ConversationViewController setPinnedItem:](self, "setPinnedItem:", 0);
    -[ConversationViewControllerBase setDidCompleteFirstPaint:](self, "setDidCompleteFirstPaint:", 0);
    -[ConversationViewController _resetManualSummaryItemIDs](self, "_resetManualSummaryItemIDs");
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase restorationFuture](self, "restorationFuture"));

    if (v27)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase restorationFuture](self, "restorationFuture"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "resultIfAvailable"));
      v30 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "referenceMessageListItem"));

      if (v10 && v30 == v10)
      {
        v31 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          v32 = (ConversationViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ef_publicDescription"));
          *(_DWORD *)buf = 138412290;
          v58 = v32;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Conversation reference item successfully restored: %@", buf, 0xCu);

        }
      }
      else
      {
        v33 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          v34 = (ConversationViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "itemID"));
          *(_DWORD *)buf = 138412290;
          v58 = v34;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "setReferenceMessageListItem (itemID=%@): called before state restoration was complete. Cancelling restoration future.", buf, 0xCu);

        }
        v31 = objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase restorationFuture](self, "restorationFuture"));
        -[NSObject tryCancel](v31, "tryCancel");
      }

      -[ConversationViewControllerBase setRestorationFuture:](self, "setRestorationFuture:", 0);
    }
    -[ConversationViewControllerBase shouldShowNoMessageSelectedView](self, "shouldShowNoMessageSelectedView");
    if (v10)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController blankConversationTailspinToken](self, "blankConversationTailspinToken"));
      objc_msgSend(v35, "cancel");

      v36 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler globalAsyncScheduler](EFScheduler, "globalAsyncScheduler"));
      v50 = _NSConcreteStackBlock;
      v51 = 3221225472;
      v52 = sub_100059FF8;
      v53 = &unk_10051A910;
      v54 = self;
      v55 = v10;
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "afterDelay:performBlock:", &v50, 1.5));
      -[ConversationViewController setBlankConversationTailspinToken:](self, "setBlankConversationTailspinToken:", v37, v50, v51, v52, v53, v54);

    }
    else
    {
      v38 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v58 = self;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "%p: No message list item. Showing No Message Selected", buf, 0xCu);
      }

    }
    -[ConversationViewControllerBase setShouldShowNoMessageSelectedView:](self, "setShouldShowNoMessageSelectedView:", v10 == 0);
    v39 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      v40 = (ConversationViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ef_publicDescription"));
      *(_DWORD *)buf = 138413314;
      v58 = v40;
      v59 = 2112;
      v60 = v11;
      v61 = 1024;
      v62 = v10 == 0;
      v63 = 1024;
      v64 = v7;
      v65 = 1024;
      v66 = v6;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Setting referenceMessageListItem:%@\nreferenceMessageList:%@\nshowAsConversation:%{BOOL}d, shouldShowNoMessageSelectedView:%{BOOL}d, animated: %{BOOL}d", buf, 0x28u);

    }
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase messageViewControllerReuseQueue](self, "messageViewControllerReuseQueue"));
    objc_msgSend(v41, "drain");

    v42 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase cellHeightCache](self, "cellHeightCache"));
    objc_msgSend(v42, "removeAllObjects");

    v43 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase cellConfigurator](self, "cellConfigurator"));
    objc_msgSend(v43, "resetCaches");

    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    -[ConversationViewController setInitiallyUnreadItemIDs:](self, "setInitiallyUnreadItemIDs:", v44);

    -[ConversationViewController _stopTextFindingIfNecessary](self, "_stopTextFindingIfNecessary");
    -[ConversationViewControllerBase _updateAllowQuickReplyForMessageListItem:](self, "_updateAllowQuickReplyForMessageListItem:", v10);
    -[ConversationViewControllerBase setReferenceMessageListItem:](self, "setReferenceMessageListItem:", v10);
    -[ConversationViewController setReferenceMessageList:](self, "setReferenceMessageList:", v11);
    -[ConversationViewControllerBase setShownAsConversation:](self, "setShownAsConversation:", v7);
    -[ConversationViewController _reloadDataSource](self, "_reloadDataSource");
    if ((*(_BYTE *)&self->super._flags & 0x10) != 0)
    {
      -[ConversationViewControllerBase _updateBarButtonsAnimated:force:](self, "_updateBarButtonsAnimated:force:", v6, 1);
      -[ConversationViewControllerBase updateArrowControlsView](self, "updateArrowControlsView");
    }
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase referenceMessageListItem](self, "referenceMessageListItem"));
    v46 = v45 == 0;

    if (!v46)
    {
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase previewState](self, "previewState"));
      objc_msgSend(v47, "transitionAfterChangingSources");

    }
    -[ConversationViewController _updateGestureForMessageListItem:](self, "_updateGestureForMessageListItem:", v10);
    -[ConversationViewController _resetQuickReplyViewControllerWithReason:resetCompose:override:](self, "_resetQuickReplyViewControllerWithReason:resetCompose:override:", 0, 1, 0);
    -[ConversationViewControllerBase _resetNavigationChromelessAppearance](self, "_resetNavigationChromelessAppearance");
    goto LABEL_34;
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController contentRequestCache](self, "contentRequestCache"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "displayMessageItemID"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKey:", v24));

  if (-[ConversationViewController _shouldReloadEmptyMessageList](self, "_shouldReloadEmptyMessageList"))
  {
    -[ConversationViewController setDidAutoReloadDataSource:](self, "setDidAutoReloadDataSource:", 0);
    v26 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "itemID"));
      sub_1003900F4();
    }

    goto LABEL_12;
  }
  if (!v25 || objc_msgSend(v25, "state") == (id)3)
  {
LABEL_12:

    goto LABEL_13;
  }
  v48 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    v49 = (ConversationViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "itemID"));
    *(_DWORD *)buf = 138412290;
    v58 = v49;
    _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "setReferenceMessageListItem: Skip setting the same message list item: %@", buf, 0xCu);

  }
LABEL_34:
  os_activity_scope_leave(&state);

}

- (void)_resetQuickReplyViewControllerWithReason:(int64_t)a3 resetCompose:(BOOL)a4 override:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v5 = a5;
  v6 = a4;
  if (-[ConversationViewControllerBase allowQuickReply](self, "allowQuickReply") || v5)
  {
    -[ConversationViewControllerBase setIsPerformingQuickReplySendAnimation:](self, "setIsPerformingQuickReplySendAnimation:", 0);
    +[QuickReplyView defaultHeight](_TtC10MobileMail14QuickReplyView, "defaultHeight");
    -[ConversationViewControllerBase setQuickReplyHeight:](self, "setQuickReplyHeight:");
    -[ConversationViewController setQuickReplyHasContent:](self, "setQuickReplyHasContent:", 0);
    v14 = (id)objc_claimAutoreleasedReturnValue(-[ConversationViewController _quickReplyView](self, "_quickReplyView"));
    objc_msgSend(v14, "resetWithReason:", a3);
    objc_msgSend(v14, "setHidden:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController quickReplyMailComposeController](self, "quickReplyMailComposeController"));
    -[ConversationViewController mailComposeController:didChangeQuickReplyWebViewHeight:](self, "mailComposeController:didChangeQuickReplyWebViewHeight:", v9, 0.0);

    -[ConversationViewController _updateQuickReplyLabelIfNeeded](self, "_updateQuickReplyLabelIfNeeded");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase quickReplyAnimationContext](self, "quickReplyAnimationContext"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    objc_msgSend(v10, "setObject:", v11);

    if (v6)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController quickReplyMailComposeController](self, "quickReplyMailComposeController"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "view"));
      objc_msgSend(v13, "removeFromSuperview");

      -[ConversationViewController setQuickReplyMailComposeController:](self, "setQuickReplyMailComposeController:", 0);
    }

  }
}

- (void)_resetManualSummaryItemIDs
{
  NSMutableDictionary *v3;

  if (_os_feature_enabled_impl("Mail", "CatchUpManualSummarization")
    && EMIsGreymatterSupportedWithOverride())
  {
    v3 = objc_opt_new(NSMutableDictionary);
    -[ConversationViewController setSummaryContextByItemID:](self, "setSummaryContextByItemID:", v3);

  }
  -[ConversationViewController setTopSummaryItemID:](self, "setTopSummaryItemID:", 0);
  -[ConversationViewController setInlineSummaryItemID:](self, "setInlineSummaryItemID:", 0);
}

- (id)focusedMessage
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase handoffCoordinator](self, "handoffCoordinator"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "handoffMessageRequest"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "message"));

  return v4;
}

- (id)_focusedMessageItemID
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase handoffCoordinator](self, "handoffCoordinator"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "handoffMessageRequest"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "itemID"));

  return v4;
}

- (BOOL)containsMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController collectionViewDataSource](self, "collectionViewDataSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "displayMessageItemID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathForItemIdentifier:", v6));
  v8 = v7 != 0;

  return v8;
}

- (void)scrollToMessageIfPossible:(id)a3 animated:(BOOL)a4 pin:(BOOL)a5
{
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "displayMessageItemID"));
  -[ConversationViewController scrollToMessageItemIDIfPossible:animated:pin:](self, "scrollToMessageItemIDIfPossible:animated:pin:");

}

- (void)scrollToMessageItemIDIfPossible:(id)a3 animated:(BOOL)a4 pin:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  if (!v5
    || (v9 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase pinnedItem](self, "pinnedItem")),
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "itemID")),
        v11 = objc_msgSend(v10, "isEqual:", v8),
        v10,
        v9,
        (v11 & 1) == 0))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController collectionViewDataSource](self, "collectionViewDataSource"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "indexPathForItemIdentifier:", v8));

    if (v13)
    {
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10005A794;
      v18[3] = &unk_10051A960;
      v18[4] = self;
      v14 = v13;
      v19 = v14;
      v20 = v8;
      -[ConversationViewControllerBase _scrollToItemAtIndexPath:dynamicOffset:shouldAdjustToShowPreviousMessage:animated:pin:completion:](self, "_scrollToItemAtIndexPath:dynamicOffset:shouldAdjustToShowPreviousMessage:animated:pin:completion:", v14, 0, 1, v6, v5, v18);
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase cellConfigurator](self, "cellConfigurator"));
      v16 = objc_msgSend(v15, "messageAtIndexPathIsExpanded:", v14);

      if ((v16 & 1) == 0)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase cellConfigurator](self, "cellConfigurator"));
        objc_msgSend(v17, "expandCellAtIndexPath:animated:highlightFirst:", v14, v6, 0);

      }
    }

  }
}

- (id)messageCountHint
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase referenceMessageListItem](self, "referenceMessageListItem"));
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "count");
    if ((unint64_t)v5 <= 1 && (*(_BYTE *)&self->super._flags & 0x20) != 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[EFPromise promise](EFPromise, "promise", v5));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _conversationViewQueryIncludeRelated:](self, "_conversationViewQueryIncludeRelated:", 1));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController messageRepository](self, "messageRepository"));
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10005AA6C;
      v13[3] = &unk_10051AE20;
      v11 = v8;
      v14 = v11;
      objc_msgSend(v10, "performCountQuery:completionHandler:", v9, v13);

      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "future"));
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v5));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[EFFuture futureWithResult:](EFFuture, "futureWithResult:", v6));

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_reloadDataSource
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;

  -[ConversationViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[ConversationViewController setMessageList:](self, "setMessageList:", 0);
  -[ConversationViewController setDisplaySubjectItemID:](self, "setDisplaySubjectItemID:", 0);
  -[ConversationViewControllerBase setLastExpandedCellIndexPath:](self, "setLastExpandedCellIndexPath:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController messageRepository](self, "messageRepository"));
  if (v3)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase referenceMessageListItem](self, "referenceMessageListItem"));

    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _conversationViewQueryIncludeRelated:](self, "_conversationViewQueryIncludeRelated:", (*(_BYTE *)&self->super._flags >> 5) & 1));
      v6 = objc_alloc((Class)EMMessageList);
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController messageRepository](self, "messageRepository"));
      v4 = objc_msgSend(v6, "initWithQuery:repository:", v5, v7);

      v8 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "query"));
        v10 = 138412290;
        v11 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Loading messages for conversation view query: %@", (uint8_t *)&v10, 0xCu);

      }
    }
  }
  else
  {
    v4 = 0;
  }
  -[ConversationViewController _reloadDataSourceWithMessageList:](self, "_reloadDataSourceWithMessageList:", v4);
  -[ConversationViewController _resetContentRequest](self, "_resetContentRequest");
  -[ConversationViewController setPredictedMailboxForConversation:](self, "setPredictedMailboxForConversation:", 0);

}

- (void)_reloadDataSourceWithMessageList:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[5];
  id v20;
  uint8_t buf[4];
  ConversationViewController *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;

  v5 = a3;
  if (pthread_main_np() != 1)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ConversationViewController.m"), 613, CFSTR("Current thread must be main"));

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController messageList](self, "messageList"));
  v7 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ef_publicDescription"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ef_publicDescription"));
    *(_DWORD *)buf = 138412802;
    v22 = self;
    v23 = 2112;
    v24 = v8;
    v25 = 2112;
    v26 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@: Reloading messageList old:%@\nnew:%@", buf, 0x20u);

  }
  if (v6)
    objc_msgSend(v6, "stopObserving:", self);
  -[ConversationViewController setMessageList:](self, "setMessageList:", v5);
  if (v5)
  {
    -[ConversationViewController setSwappingMessageList:](self, "setSwappingMessageList:", 1);
    -[ConversationViewController setNextUpdateShouldAvoidAnimation:](self, "setNextUpdateShouldAvoidAnimation:", 1);
    objc_msgSend(v5, "beginObserving:", self);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10005B018;
    v19[3] = &unk_10051A910;
    v19[4] = self;
    v20 = v5;
    v10 = objc_retainBlock(v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase scene](self, "scene"));
    v12 = objc_msgSend(v11, "isInExpandedEnvironment");

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
      v14 = objc_msgSend(v13, "afterDelay:performBlock:", v10, 0.25);

    }
    else
    {
      ((void (*)(_QWORD *))v10[2])(v10);
    }

  }
  else
  {
    v17[4] = self;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10005B254;
    v18[3] = &unk_10051AE70;
    v18[4] = self;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10005B30C;
    v17[3] = &unk_10051AA98;
    -[ConversationViewController _performDataSourceUpdateAnimated:collection:update:completion:](self, "_performDataSourceUpdateAnimated:collection:update:completion:", 0, 0, v18, v17);
  }
  v15 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v22 = self;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Reloading: %@", buf, 0xCu);
  }

}

- (void)_performDataSourceUpdateAnimated:(BOOL)a3 collection:(id)a4 update:(id)a5
{
  -[ConversationViewController _performDataSourceUpdateAnimated:collection:update:completion:](self, "_performDataSourceUpdateAnimated:collection:update:completion:", a3, a4, a5, 0);
}

- (void)_performDataSourceUpdateAnimated:(BOOL)a3 collection:(id)a4 update:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  BOOL v21;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10005B450;
  v17[3] = &unk_10051AE98;
  v17[4] = self;
  v13 = v10;
  v18 = v13;
  v21 = a3;
  v14 = v11;
  v19 = v14;
  v15 = v12;
  v20 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
  objc_msgSend(v16, "performBlock:", v17);

}

- (id)_updateQueue
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController messageListCollectionHelper](self, "messageListCollectionHelper"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "updateQueue"));

  return v3;
}

- (void)_nts_performDataSourceUpdateAnimated:(BOOL)a3 collection:(id)a4 update:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  unsigned __int8 v16;
  unsigned __int8 v17;
  void *v18;
  NSObject *v19;
  id v20;
  _QWORD *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD block[4];
  _QWORD *v27;
  _QWORD v28[4];
  NSObject *v29;
  id v30;
  ConversationViewController *v31;
  id v32;
  id v33;
  BOOL v34;
  unsigned __int8 v35;
  unsigned __int8 v36;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (pthread_main_np() != 1)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ConversationViewController.m"), 721, CFSTR("Current thread must be main"));

  }
  v14 = (id)objc_claimAutoreleasedReturnValue(-[ConversationViewController messageList](self, "messageList"));

  if (v14 == v11)
  {
    -[ConversationViewController setIsPerformingDataSourceUpdate:](self, "setIsPerformingDataSourceUpdate:", 1);
    v16 = -[ConversationViewController isSwappingMessageList](self, "isSwappingMessageList");
    v17 = -[ConversationViewController nextUpdateShouldAvoidAnimation](self, "nextUpdateShouldAvoidAnimation");
    -[ConversationViewController setSwappingMessageList:](self, "setSwappingMessageList:", 0);
    -[ConversationViewController setNextUpdateShouldAvoidAnimation:](self, "setNextUpdateShouldAvoidAnimation:", 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController collectionViewDataSource](self, "collectionViewDataSource"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController messageListCollectionHelper](self, "messageListCollectionHelper"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "sectionObjectID"));
    v19 = objc_claimAutoreleasedReturnValue(-[ConversationViewController _updateQueue](self, "_updateQueue"));
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10005B9DC;
    v28[3] = &unk_10051AEC0;
    v34 = a3;
    v35 = v17;
    v36 = v16;
    v15 = v25;
    v29 = v15;
    v20 = v24;
    v30 = v20;
    v31 = self;
    v32 = v12;
    v33 = v13;
    v21 = objc_retainBlock(v28);
    v22 = v21;
    if (v19)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10005BC00;
      block[3] = &unk_10051A870;
      v27 = v21;
      dispatch_async(v19, block);

    }
    else
    {
      ((void (*)(_QWORD *))v21[2])(v21);
    }
    -[ConversationViewController setIsPerformingDataSourceUpdate:](self, "setIsPerformingDataSourceUpdate:", 0);

  }
  else
  {
    v15 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "ef_publicDescription"));
      sub_100390134();
    }
  }

}

- (void)_resetContentRequest
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  ConversationViewController *v21;

  v3 = EMLogCategoryMessageLoading(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138412546;
    v19 = objc_opt_class(self);
    v20 = 2048;
    v21 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "<%@: %p> Resetting content request", (uint8_t *)&v18, 0x16u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController contentItemsCancelable](self, "contentItemsCancelable"));
  objc_msgSend(v5, "cancel");

  v6 = objc_alloc_init((Class)EFCancelationToken);
  -[ConversationViewController setContentItemsCancelable:](self, "setContentItemsCancelable:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController contentRequestQueue](self, "contentRequestQueue"));
  v8 = objc_msgSend(v7, "drain");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase referenceMessageListItem](self, "referenceMessageListItem"));
  v10 = v9 == 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController contentRequestCache](self, "contentRequestCache"));
  v12 = v11;
  if (v10)
  {
    objc_msgSend(v11, "removeAllObjects");
  }
  else
  {
    objc_msgSend(v11, "removeAllObjects");

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase referenceMessageListItem](self, "referenceMessageListItem"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "displayMessageItemID"));

    if (v12)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _priorityLoadingComparatorForPinnedItemID:](self, "_priorityLoadingComparatorForPinnedItemID:", v12));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController contentRequestQueue](self, "contentRequestQueue"));
      objc_msgSend(v15, "setComparator:", v14);

      v16 = -[ConversationViewController _contentRequestForMessageWithItemID:](self, "_contentRequestForMessageWithItemID:", v12);
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController contentRequestQueue](self, "contentRequestQueue"));
      objc_msgSend(v17, "immediatelyProcessQueue");

    }
  }

}

- (id)_contentRequestForMessageWithItemID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  int v20;
  uint64_t v21;
  __int16 v22;
  ConversationViewController *v23;
  __int16 v24;
  id v25;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController contentRequestCache](self, "contentRequestCache"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

  if (!v6)
  {
    v9 = EMLogCategoryMessageLoading(v7, v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 138412802;
      v21 = objc_opt_class(self);
      v22 = 2048;
      v23 = self;
      v24 = 2114;
      v25 = v4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "<%@: %p> Content request cache miss. Generating content request for itemID: %{public}@ ", (uint8_t *)&v20, 0x20u);
    }

    v11 = objc_claimAutoreleasedReturnValue(-[ConversationViewController _generateContentRequestForMessageWithItemID:](self, "_generateContentRequestForMessageWithItemID:", v4));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController contentRequestCache](self, "contentRequestCache"));
    objc_msgSend(v12, "addObject:forKey:", v11, v4);

    v6 = (void *)v11;
  }
  v13 = objc_msgSend(v6, "hasStarted");
  if ((v13 & 1) == 0)
  {
    v15 = EMLogCategoryMessageLoading(v13, v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_opt_class(self);
      v20 = 138412802;
      v21 = v17;
      v22 = 2048;
      v23 = self;
      v24 = 2114;
      v25 = v4;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "<%@: %p> Enqueueing content request for itemID: %{public}@", (uint8_t *)&v20, 0x20u);
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController contentRequestQueue](self, "contentRequestQueue"));
    objc_msgSend(v18, "enqueue:", v6);

  }
  return v6;
}

- (id)_generateContentRequestForMessageWithItemID:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  id v33;
  _QWORD v35[4];
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  _BYTE buf[12];
  __int16 v41;
  ConversationViewController *v42;
  __int16 v43;
  id v44;
  __int16 v45;
  id v46;

  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_10005C5D8;
  v38[3] = &unk_10051AEE8;
  v4 = a3;
  v39 = v4;
  v5 = objc_retainBlock(v38);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController contentRequestQueue](self, "contentRequestQueue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allObjects"));

  v8 = objc_msgSend(v7, "indexOfObjectPassingTest:", v5);
  if (v8 == (id)0x7FFFFFFFFFFFFFFFLL
    || (v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", v8)),
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController contentRequestQueue](self, "contentRequestQueue")),
        objc_msgSend(v10, "dequeueObject:", v9),
        v10,
        (v11 = (void *)v9) == 0))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView", v8));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController collectionViewDataSource](self, "collectionViewDataSource"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "indexPathForItemIdentifier:", v4));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "cellForItemAtIndexPath:", v14));

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "viewModel"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "messageContentRequest"));

    if (!v11)
      goto LABEL_5;
  }
  v17 = objc_msgSend(v11, "state");
  if (v17 == (id)3)
  {
LABEL_5:
    v19 = EMLogCategoryMessageLoading(v17, v18);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = objc_opt_class(self);
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v21;
      v41 = 2048;
      v42 = self;
      v43 = 2114;
      v44 = v4;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "<%@: %p> Could not find an appropriate context for itemID: %{public}@. Creating a new one", buf, 0x20u);
    }

    v22 = objc_alloc((Class)MessageContentRepresentationRequest);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController messageList](self, "messageList"));
    v24 = objc_msgSend(v22, "initWithMessageList:itemIdentifier:includeSuggestions:", v23, v4, 1);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController contentItemsCancelable](self, "contentItemsCancelable"));
    objc_msgSend(v25, "addCancelable:", v24);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase handoffCoordinator](self, "handoffCoordinator"));
    *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, v24);
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_10005C628;
    v35[3] = &unk_10051AF10;
    objc_copyWeak(&v37, (id *)buf);
    v28 = v26;
    v36 = v28;
    v29 = objc_msgSend(v24, "onScheduler:addLoadObserver:", v27, v35);

    objc_destroyWeak(&v37);
    objc_destroyWeak((id *)buf);

    v11 = v24;
  }
  v30 = EMLogCategoryMessageLoading(v17, v18);
  v31 = objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    v32 = objc_opt_class(self);
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = v32;
    v41 = 2048;
    v42 = self;
    v43 = 2048;
    v44 = v11;
    v45 = 2114;
    v46 = v4;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "<%@: %p> Generated content request %p for itemID: %{public}@", buf, 0x2Au);
  }

  v33 = v11;
  return v33;
}

- (void)_updateForDataSourceChanges:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  _DWORD v8[2];

  v3 = a3;
  v5 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "_updateForDataSourceChanges:%{BOOL}d", (uint8_t *)v8, 8u);
  }

  -[ConversationViewController _updateSubject](self, "_updateSubject");
  -[ConversationViewControllerBase _updateLayout](self, "_updateLayout");
  -[ConversationViewControllerBase _updateCells](self, "_updateCells");
  -[ConversationViewController _updateQuickReplyLabelIfNeeded](self, "_updateQuickReplyLabelIfNeeded");
  if (v3
    && !-[ConversationViewControllerBase isPerformingQuickReplySendAnimation](self, "isPerformingQuickReplySendAnimation"))
  {
    -[ConversationViewControllerBase _resetBottomPaddingIfDisplayingSingleMessage](self, "_resetBottomPaddingIfDisplayingSingleMessage");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
    if ((objc_msgSend(v6, "isTracking") & 1) != 0
      || (objc_msgSend(v6, "isDecelerating") & 1) != 0
      || objc_msgSend(v6, "isDragging"))
    {
      v7 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v8[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Skip _scrollToInitialPosition - conversation view is currently scrolling after user interaction", (uint8_t *)v8, 2u);
      }

    }
    else
    {
      -[ConversationViewController _scrollToInitialPosition](self, "_scrollToInitialPosition");
    }

  }
}

- (void)_updateSubject
{
  _QWORD *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  _QWORD *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10005CC88;
  v14[3] = &unk_10051AFB0;
  objc_copyWeak(&v15, &location);
  v3 = objc_retainBlock(v14);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _messageFutureForConversationSubject](self, "_messageFutureForConversationSubject"));
  if (!v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100390174();

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10005CD1C;
  v12[3] = &unk_10051AFD8;
  v7 = v3;
  v13 = v7;
  objc_msgSend(v4, "onScheduler:addSuccessBlock:", v6, v12);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10005CD28;
  v10[3] = &unk_10051B000;
  v9 = v7;
  v11 = v9;
  objc_msgSend(v4, "onScheduler:addFailureBlock:", v8, v10);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (id)_messageFutureForConversationSubject
{
  int64_t v3;
  int64_t v4;
  void *v5;
  _BOOL8 v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = -[ConversationViewController countOfMessages](self, "countOfMessages");
  if (v3)
  {
    v4 = v3;
    if (_os_feature_enabled_impl("Mail", "CatchUpManualSummarization")
      && EMIsGreymatterAvailableWithOverride())
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController topSummaryItemID](self, "topSummaryItemID"));
      v6 = v5 != 0;

    }
    else
    {
      v6 = 0;
    }
    if ((id)-[ConversationViewControllerBase conversationSortOrder](self, "conversationSortOrder") == (id)1)
      v7 = v4 - 1;
    else
      v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", v7, 0));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController collectionViewDataSource](self, "collectionViewDataSource"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "itemIdentifierForIndexPath:", v8));

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _messageFutureForItemID:](self, "_messageFutureForItemID:", v10));
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (id)_conversationViewQueryIncludeRelated:(BOOL)a3
{
  return (id)objc_claimAutoreleasedReturnValue(-[ConversationViewController _queryForConversationViewIncludeRelated:](self, "_queryForConversationViewIncludeRelated:", (*(_BYTE *)&self->super._flags >> 5) & 1));
}

- (id)_queryForConversationViewIncludeRelated:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  _QWORD v20[2];
  _QWORD v21[2];
  void *v22;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _mailboxExclusionPredicate](self, "_mailboxExclusionPredicate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[EMMessageListItemPredicates sortDescriptorForDateAscending:](EMMessageListItemPredicates, "sortDescriptorForDateAscending:", -[ConversationViewControllerBase conversationSortOrder](self, "conversationSortOrder") == 0));
  v22 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController referenceMessageListQuery](self, "referenceMessageListQuery"));
  if (-[ConversationViewControllerBase shownAsConversation](self, "shownAsConversation"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase referenceMessageListItem](self, "referenceMessageListItem"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[EMMessageListItemPredicates predicateForMessagesInConversation:](EMMessageListItemPredicates, "predicateForMessagesInConversation:", objc_msgSend(v9, "conversationID")));

    if (a3)
      goto LABEL_12;
    if ((objc_msgSend(v8, "queryOptions") & 0x20) != 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _referenceMessageListMailboxScope](self, "_referenceMessageListMailboxScope"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[EMMessageListItemPredicates predicateForMessagesWithMailboxScope:](EMMessageListItemPredicates, "predicateForMessagesWithMailboxScope:", v14));

    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "predicate"));
    }
    if (v11)
    {
      v21[0] = v10;
      v21[1] = v11;
      v12 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 2));
      v15 = objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v12));

      v10 = (void *)v15;
    }
    else
    {
      v12 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_1003901E0();
    }
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase referenceMessageListItem](self, "referenceMessageListItem"));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "displayMessageItemID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController mailboxRepository](self, "mailboxRepository"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[EMMessage predicateForMessageWithItemID:mailboxPredicate:mailboxTypeResolver:](EMMessage, "predicateForMessageWithItemID:mailboxPredicate:mailboxTypeResolver:", v12, v5, v13));

  }
LABEL_12:
  if (v5)
  {
    v20[0] = v10;
    v20[1] = v5;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 2));
    v17 = objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v16));

    v10 = (void *)v17;
  }
  v18 = objc_msgSend(objc_alloc((Class)EMQuery), "initWithTargetClass:predicate:sortDescriptors:queryOptions:label:", objc_opt_class(EMMessage), v10, v7, 8, CFSTR("conversation"));

  return v18;
}

- (id)_mailboxExclusionPredicate
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _excludedMailboxes](self, "_excludedMailboxes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[EMMessageListItemPredicates predicateForExcludingMessagesInMailboxes:](EMMessageListItemPredicates, "predicateForExcludingMessagesInMailboxes:", v2));

  return v3;
}

- (id)_excludedMailboxes
{
  void *v3;
  void *v4;
  NSArray *v5;
  _UNKNOWN **v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase referenceMessageListItem](self, "referenceMessageListItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mailboxObjectIDs"));

  v5 = objc_opt_new(NSArray);
  if (_os_feature_enabled_impl("Mail", "ShowUndoSendInConversation") && sub_10005D484((uint64_t)self))
    v6 = &off_1005420E8;
  else
    v6 = &off_100542100;

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[EMMailbox mailboxesWithTypes:](EMMailbox, "mailboxesWithTypes:", v6));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10005D520;
  v11[3] = &unk_10051B028;
  v8 = v4;
  v12 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ef_filter:", v11));

  return v9;
}

- (id)_messageFutureForItemID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController messageList](self, "messageList"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "messageListItemForItemID:", v4));

  return v6;
}

- (id)_messageForItemID:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v9;
  id v10;
  __int16 v11;
  void *v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _messageFutureForItemID:](self, "_messageFutureForItemID:", v4));
  if ((objc_msgSend(v5, "isFinished") & 1) == 0)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412546;
      v10 = v4;
      v11 = 2112;
      v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Waiting for item %@ future %@", (uint8_t *)&v9, 0x16u);
    }

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "result"));

  return v7;
}

- (id)_messageAtIndexPath:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _messageItemIDAtIndexPath:](self, "_messageItemIDAtIndexPath:", a3));
  v5 = objc_opt_class(EMMessageCollectionItemID);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _messageForItemID:](self, "_messageForItemID:", v4));
  else
    v6 = 0;

  return v6;
}

- (void)collectionDidFinishInitialLoad:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  NSObject *v7;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ConversationViewController messageList](self, "messageList"));

  if (v5 == v4)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ef_publicDescription"));
      sub_100390244();
    }

    v6 = objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase blankConversationController](self, "blankConversationController"));
    -[NSObject conversationViewDidLoadMessageSuccessfully](v6, "conversationViewDidLoadMessageSuccessfully");
  }
  else
  {
    v6 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ef_publicDescription"));
      sub_100390280();
    }
  }

}

- (void)_updateInitiallyUnreadItemIDs:(id)a3
{
  id v5;
  NSObject *v6;
  NSString *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;

  v5 = a3;
  v6 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v10 = 138543618;
    v11 = v8;
    v12 = 2114;
    v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ unreadItemIDs:%{public}@", (uint8_t *)&v10, 0x16u);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController initiallyUnreadItemIDs](self, "initiallyUnreadItemIDs"));
  objc_msgSend(v9, "addObjectsFromArray:", v5);

}

- (void)populateSummaryItemForSnapshot:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  MFGeneratedSummaryCollectionItemID *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  MFGeneratedSummaryCollectionItemID *v18;
  void *v19;
  MFGeneratedSummaryCollectionItemID *v20;
  MFGeneratedSummaryCollectionItemID *v21;

  v4 = a3;
  if (!-[ConversationViewControllerBase beingPreviewed](self, "beingPreviewed"))
  {
    if (_os_feature_enabled_impl("Mail", "CatchUpManualSummarization"))
    {
      if (EMIsGreymatterAvailableWithOverride())
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController topSummaryItemID](self, "topSummaryItemID"));
        if (!v5
          || (v6 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController inlineSummaryItemID](self, "inlineSummaryItemID")),
              v6,
              v5,
              !v6))
        {
          v7 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _messageItemIDsFromShapshot:](self, "_messageItemIDsFromShapshot:", v4));
          v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
          v9 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase referenceMessageListItem](self, "referenceMessageListItem"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "displayMessageItemID"));

          if (v8)
          {
            if (v10)
            {
              v11 = objc_opt_class(EMMessageCollectionItemID);
              if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
              {
                v12 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController topSummaryItemID](self, "topSummaryItemID"));

                if (!v12)
                {
                  v13 = -[MFGeneratedSummaryCollectionItemID initWithAnchorMessageItemID:]([MFGeneratedSummaryCollectionItemID alloc], "initWithAnchorMessageItemID:", v8);
                  v21 = v13;
                  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
                  objc_msgSend(v4, "insertItemsWithIdentifiers:beforeItemWithIdentifier:", v14, v8);

                  -[ConversationViewController setTopSummaryItemID:](self, "setTopSummaryItemID:", v13);
                }
                v15 = 0;
                if ((unint64_t)objc_msgSend(v7, "count") >= 2 && v8 != v10)
                {
                  if (objc_msgSend(v7, "containsObject:", v10))
                  {
                    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController initiallyUnreadItemIDs](self, "initiallyUnreadItemIDs"));
                    v15 = objc_msgSend(v16, "containsObject:", v10);

                  }
                  else
                  {
                    v15 = 0;
                  }
                }
                v17 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController inlineSummaryItemID](self, "inlineSummaryItemID"));
                if (v17)
                  v15 = 0;

                if (v15)
                {
                  v18 = -[MFGeneratedSummaryCollectionItemID initWithAnchorMessageItemID:]([MFGeneratedSummaryCollectionItemID alloc], "initWithAnchorMessageItemID:", v10);
                  v20 = v18;
                  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
                  objc_msgSend(v4, "insertItemsWithIdentifiers:beforeItemWithIdentifier:", v19, v10);

                  -[ConversationViewController setInlineSummaryItemID:](self, "setInlineSummaryItemID:", v18);
                }
              }
            }
          }

        }
      }
    }
  }

}

- (void)collection:(id)a3 addedItemIDs:(id)a4 toThreadWithItemID:(id)a5 before:(id)a6 unreadItemIDs:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  ConversationViewController *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  SEL v28;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v16 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    sub_1003902C0();

  if (!objc_msgSend(v13, "count"))
    sub_10005923C(self);
  v23 = self;
  v17 = v12;
  v24 = v17;
  v18 = v15;
  v25 = v18;
  v19 = v13;
  v26 = v19;
  v20 = v14;
  v27 = v20;
  v28 = a2;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler", _NSConcreteStackBlock, 3221225472, sub_10005DF4C, &unk_10051B078, v23));
  objc_msgSend(v21, "performBlock:", &v22);

}

- (void)collection:(id)a3 addedItemIDs:(id)a4 toThreadWithItemID:(id)a5 after:(id)a6 unreadItemIDs:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  ConversationViewController *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  SEL v28;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v16 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    sub_100390364();

  v23 = self;
  v17 = v12;
  v24 = v17;
  v18 = v15;
  v25 = v18;
  v19 = v14;
  v26 = v19;
  v20 = v13;
  v27 = v20;
  v28 = a2;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler", _NSConcreteStackBlock, 3221225472, sub_10005E398, &unk_10051B078, v23));
  objc_msgSend(v21, "performBlock:", &v22);

}

- (void)collection:(id)a3 movedItemIDs:(id)a4 before:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  ConversationViewController *v12;
  id v13;

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10005E8B8;
  v10[3] = &unk_10051B0A0;
  v11 = a4;
  v12 = self;
  v13 = a5;
  v8 = v13;
  v9 = v11;
  -[ConversationViewController _performDataSourceUpdateAnimated:collection:update:](self, "_performDataSourceUpdateAnimated:collection:update:", 1, a3, v10);

}

- (void)collection:(id)a3 movedItemIDs:(id)a4 after:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  ConversationViewController *v12;
  id v13;

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10005EB04;
  v10[3] = &unk_10051B0A0;
  v11 = a4;
  v12 = self;
  v13 = a5;
  v8 = v13;
  v9 = v11;
  -[ConversationViewController _performDataSourceUpdateAnimated:collection:update:](self, "_performDataSourceUpdateAnimated:collection:update:", 1, a3, v10);

}

- (void)collection:(id)a3 changedItemIDs:(id)a4
{
  id v6;
  _QWORD v7[6];
  _QWORD v8[4];
  id v9;
  _QWORD *v10;
  _QWORD v11[5];
  id v12;

  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = sub_10005ED90;
  v11[4] = sub_10005EDA0;
  v12 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10005EDA8;
  v8[3] = &unk_10051B0C8;
  v9 = a4;
  v10 = v11;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10005EE14;
  v7[3] = &unk_10051ACE8;
  v7[4] = self;
  v7[5] = v11;
  v6 = v9;
  -[ConversationViewController _performDataSourceUpdateAnimated:collection:update:completion:](self, "_performDataSourceUpdateAnimated:collection:update:completion:", 1, a3, v8, v7);

  _Block_object_dispose(v11, 8);
}

- (void)collection:(id)a3 deletedItemIDs:(id)a4
{
  -[ConversationViewController _deleteItemsWithIDs:fromCollection:completionHandler:](self, "_deleteItemsWithIDs:fromCollection:completionHandler:", a4, a3, 0);
}

- (void)collection:(id)a3 addedItemIDs:(id)a4 before:(id)a5
{
  id v9;
  id v10;
  id v11;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[ConversationViewController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[ConversationViewController collection:addedItemIDs:before:]", "ConversationViewController.m", 1392, "0");
}

- (void)collection:(id)a3 addedItemIDs:(id)a4 after:(id)a5
{
  id v9;
  id v10;
  id v11;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[ConversationViewController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[ConversationViewController collection:addedItemIDs:after:]", "ConversationViewController.m", 1396, "0");
}

- (void)_deleteItemsWithIDs:(id)a3 fromCollection:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD v22[4];
  id v23;
  ConversationViewController *v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD v27[5];
  id v28;
  _QWORD v29[5];
  id v30;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    sub_100390408();

  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = sub_10005ED90;
  v29[4] = sub_10005EDA0;
  v30 = 0;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = sub_10005ED90;
  v27[4] = sub_10005EDA0;
  v28 = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase pinnedItem](self, "pinnedItem"));
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase pinnedItem](self, "pinnedItem"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "itemID"));
    v15 = objc_msgSend(v8, "containsObject:", v14);

    if (v15)
      -[ConversationViewController setPinnedItem:](self, "setPinnedItem:", 0);
  }
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10005FAAC;
  v22[3] = &unk_10051B168;
  v25 = v29;
  v16 = v8;
  v23 = v16;
  v24 = self;
  v26 = v27;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10005FD28;
  v18[3] = &unk_10051B190;
  v20 = v29;
  v21 = v27;
  v18[4] = self;
  v17 = v10;
  v19 = v17;
  -[ConversationViewController _performDataSourceUpdateAnimated:collection:update:completion:](self, "_performDataSourceUpdateAnimated:collection:update:completion:", 1, v9, v22, v18);

  _Block_object_dispose(v27, 8);
  _Block_object_dispose(v29, 8);

}

- (id)_itemIDsForReloadAfterInsertingObjectsAfterItemID:(id)a3 snapshot:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init((Class)NSMutableArray);
  objc_msgSend(v8, "addObject:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _itemIDBeforeItemID:snapshot:](self, "_itemIDBeforeItemID:snapshot:", v6, v7));
  v10 = v9;
  if (v9 && (objc_msgSend(v9, "isEqual:", v6) & 1) == 0)
    objc_msgSend(v8, "addObject:", v10);

  return v8;
}

- (id)_itemIDBeforeItemID:(id)a3 snapshot:(id)a4
{
  id v5;
  id v6;
  char *v7;
  char *v8;
  id v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  v7 = (char *)objc_msgSend(v6, "indexOfItemIdentifier:", v5);
  v8 = v7;
  if (v7)
  {
    if (v7 == (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      v9 = 0;
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "itemIdentifiers"));
      v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", v8 - 1));

    }
  }
  else
  {
    v9 = v5;
  }

  return v9;
}

- (id)_messageItemIDsFromShapshot:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "itemIdentifiers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ef_filter:", &stru_10051B1F8));

  return v4;
}

- (void)collection:(id)a3 replacedExistingItemID:(id)a4 withNewItemID:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  _QWORD v19[4];
  id v20;
  ConversationViewController *v21;
  id v22;
  size_t v23;
  _DWORD __b[162];
  int v25[2];
  int v26;
  pid_t v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "isEqual:", v10))
  {
    v11 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_100390474();

    memset(__b, 170, sizeof(__b));
    __b[8] = 0;
    *(_QWORD *)v25 = 0xE00000001;
    v26 = 1;
    v27 = getpid();
    v23 = 648;
    if (!sysctl(v25, 4u, __b, &v23, 0, 0) && (__b[8] & 0x800) != 0)
    {
      __debugbreak();
      JUMPOUT(0x1000603D4);
    }
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase pinnedItem](self, "pinnedItem"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "itemID"));
    v14 = objc_msgSend(v9, "isEqual:", v13);

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dynamicOffset"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController pinnedIndexPathProvider](self, "pinnedIndexPathProvider"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[PinnedConversationItem pinnedItemWithID:dynamicOffset:indexPathProvider:](PinnedConversationItem, "pinnedItemWithID:dynamicOffset:indexPathProvider:", v10, v15, v16));
      -[ConversationViewController setPinnedItem:](self, "setPinnedItem:", v17);

    }
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000605B0;
    v19[3] = &unk_10051B0A0;
    v20 = v9;
    v21 = self;
    v22 = v10;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10006084C;
    v18[3] = &unk_10051AA98;
    v18[4] = self;
    -[ConversationViewController _performDataSourceUpdateAnimated:collection:update:completion:](self, "_performDataSourceUpdateAnimated:collection:update:completion:", 0, v8, v19, v18);

  }
}

- (id)cellConfigurator:(id)a3 messageItemIDAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController collectionViewDataSource](self, "collectionViewDataSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "itemIdentifierForIndexPath:", v5));

  return v7;
}

- (void)cellConfigurator:(id)a3 wantsToReloadCellAtIndexPaths:(id)a4 animated:(BOOL)a5
{
  -[ConversationViewController _reloadCellsAtIndexPaths:animated:](self, "_reloadCellsAtIndexPaths:animated:", a4, a5);
}

- (void)messageViewController:(id)a3 didStartDownloadForContentItemWithProgress:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController contentItemsCancelable](self, "contentItemsCancelable"));
  objc_msgSend(v5, "addCancelable:", v6);

}

- (void)messageViewController:(id)a3 didTapShowMoreAtCollapsedOffset:(CGPoint)a4 expandedOffset:(CGPoint)a5
{
  double y;
  double x;
  double v7;
  double v8;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  y = a5.y;
  x = a5.x;
  v7 = a4.y;
  v8 = a4.x;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "contentRequest"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "itemID"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase cellConfigurator](self, "cellConfigurator"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "expansionTracker"));
  v15 = objc_msgSend(v14, "expansionStatusForCellWithItemID:", v12);

  if (v15 == (id)2)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController collectionViewDataSource](self, "collectionViewDataSource"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "indexPathForItemIdentifier:", v12));

    if (v17)
    {
      -[ConversationViewController setPinnedItem:](self, "setPinnedItem:", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase cellConfigurator](self, "cellConfigurator"));
      objc_msgSend(v18, "expandCellAtIndexPath:animated:highlightFirst:expansionStatus:", v17, 0, 0, 3);

    }
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)ConversationViewController;
    -[ConversationViewControllerBase messageViewController:didTapShowMoreAtCollapsedOffset:expandedOffset:](&v19, "messageViewController:didTapShowMoreAtCollapsedOffset:expandedOffset:", v10, v8, v7, x, y);
  }

}

- (void)messageViewController:(id)a3 didTapRevealActionsButton:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "contentRequest"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "message"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "predictedMailbox"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "contentRequest"));
  -[ConversationViewController _didTapRevealActionsButton:message:predictedMailbox:contentRequest:didDismissHandler:](self, "_didTapRevealActionsButton:message:predictedMailbox:contentRequest:didDismissHandler:", v6, v8, v9, v10, 0);

}

- (void)messageViewController:(id)a3 didTapUndoSendButton:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "contentRequest"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "message"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "predictedMailbox"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "contentRequest"));
  -[ConversationViewController _didTapUndoSendButton:message:predictedMailbox:contentRequest:didDismissHandler:](self, "_didTapUndoSendButton:message:predictedMailbox:contentRequest:didDismissHandler:", v6, v8, v9, v10, 0);

}

- (void)_messageViewControllerDidDisplayContent:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  dispatch_queue_t *v7;
  dispatch_queue_t *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  if (sub_100087C28((_BOOL8)self))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "contentRequest"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "itemID"));

    v6 = sub_100084168((uint64_t)self);
    v7 = (dispatch_queue_t *)objc_claimAutoreleasedReturnValue(v6);
    v8 = sub_100057F28(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v5));

    v11 = sub_100060E5C(self, v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    if (v12)
    {
      if (objc_msgSend(v10, "count"))
      {
        -[ConversationViewController _decorateFoundRanges:inExpandedCell:](self, "_decorateFoundRanges:inExpandedCell:", v10, v12);
      }
      else
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "messageContentView"));
        objc_msgSend(v13, "didBeginTextSearch");

      }
    }

  }
}

- (void)_didTapRevealActionsButton:(id)a3 message:(id)a4 predictedMailbox:(id)a5 contentRequest:(id)a6 didDismissHandler:(id)a7
{
  void *v8;
  id v9;

  v9 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _actionsViewControllerWithMessage:contentRequest:predictedMailbox:button:didDismissHandler:](self, "_actionsViewControllerWithMessage:contentRequest:predictedMailbox:button:didDismissHandler:"));
  -[ConversationViewController setSelectedMessage:](self, "setSelectedMessage:", v9);
  if (v8)
    -[ConversationViewControllerBase presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);

}

- (void)_didTapUndoSendButton:(id)a3 message:(id)a4 predictedMailbox:(id)a5 contentRequest:(id)a6 didDismissHandler:(id)a7
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase scene](self, "scene"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "daemonInterface"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "outgoingMessageRepository"));

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100061160;
  v13[3] = &unk_10051B220;
  objc_copyWeak(&v15, &location);
  v12 = v8;
  v14 = v12;
  objc_msgSend(v11, "cancelLastDelayedMessage:", v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

- (id)_actionsViewControllerWithMessage:(id)a3 contentRequest:(id)a4 predictedMailbox:(id)a5 button:(id)a6 didDismissHandler:(id)a7
{
  id v13;
  id v14;
  void (**v15)(_QWORD);
  double v16;
  double v17;
  void *v18;
  double Width;
  MailActionViewHeader *v20;
  void *v21;
  void *v22;
  ConversationCellViewModel *v23;
  id v24;
  ConversationCellViewModel *v25;
  MailActionsViewController *v26;
  MailActionsViewController *v27;
  id v28;
  void *v29;
  void *v30;
  NSObject *v31;
  NSString *v32;
  void *v33;
  NSString *v34;
  _BOOL4 IsAccessibilityCategory;
  void *v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  id *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  _QWORD v48[4];
  void (**v49)(_QWORD);
  id v50;
  _QWORD v51[4];
  id v52;
  id v53;
  ConversationViewController *v54;
  id location[2];
  CGRect v56;

  v13 = a3;
  v14 = a4;
  v46 = a5;
  v47 = a6;
  v15 = (void (**)(_QWORD))a7;
  v45 = v14;
  if (v13)
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase displayMetrics](self, "displayMetrics"));
    +[MailActionViewHeader defaultHeightWithDisplayMetrics:](MailActionViewHeader, "defaultHeightWithDisplayMetrics:", v44);
    v17 = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController view](self, "view"));
    objc_msgSend(v18, "frame");
    Width = CGRectGetWidth(v56);

    v20 = -[MailActionViewHeader initWithFrame:]([MailActionViewHeader alloc], "initWithFrame:", 0.0, 0.0, Width, v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase contactStore](self, "contactStore"));
    -[MFMessageConversationViewCell setContactStore:](v20, "setContactStore:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[MFMessageDisplayMetrics mf_actionCardMetricsFromDisplayMetrics:](MFMessageDisplayMetrics, "mf_actionCardMetricsFromDisplayMetrics:", v44));
    -[MFConversationViewCell setDisplayMetrics:](v20, "setDisplayMetrics:", v22);

    v23 = [ConversationCellViewModel alloc];
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = sub_100061960;
    v51[3] = &unk_10051B248;
    v52 = v14;
    v24 = v13;
    v53 = v24;
    v54 = self;
    v25 = -[ConversationCellViewModel initWithBuilder:](v23, "initWithBuilder:", v51);
    -[MFCollapsedMessageCell setViewModel:](v20, "setViewModel:", v25);

    location[0] = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(location, self);
    v26 = [MailActionsViewController alloc];
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_100061AB0;
    v48[3] = &unk_10051B270;
    objc_copyWeak(&v50, location);
    v49 = v15;
    v27 = -[MailActionsViewController initWithDelegate:messageHeaderView:didDismissHandler:](v26, "initWithDelegate:messageHeaderView:didDismissHandler:", self, v20, v48);
    v28 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v27);
    objc_msgSend(v28, "setModalPresentationStyle:", 7);
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "presentationController"));
    objc_msgSend(v29, "setDelegate:", self);

    if ((v15 != 0) | ((objc_opt_respondsToSelector(v47, "mui_setAsSourceWithExtendedRectForPopoverPresentationController:") & 1) == 0))
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "popoverPresentationController", &v50));
      objc_msgSend(v47, "mui_setAsSourceForPopoverPresentationController:", v30);
    }
    else
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "popoverPresentationController", &v50));
      objc_msgSend(v47, "mui_setAsSourceWithExtendedRectForPopoverPresentationController:", v30);
    }

    if (+[UIDevice mf_isPad](UIDevice, "mf_isPad"))
    {
      objc_msgSend(v44, "mailActionCardPreferredHeightForPad");
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController traitCollection](self, "traitCollection"));
      v34 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "preferredContentSizeCategory"));
      IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v34);

      if (IsAccessibilityCategory)
        -[MailActionsViewController approximateHeightNeededForAccessibilityContentSizeCategory](v27, "approximateHeightNeededForAccessibilityContentSizeCategory");
      -[MailActionsViewController preferredContentSize](v27, "preferredContentSize");
      objc_msgSend(v28, "setPreferredContentSize:");
    }
    if (v15)
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase referenceMessageListItem](self, "referenceMessageListItem"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _completionForSwipeCardActionsForMailActionsViewController:messageListItem:](self, "_completionForSwipeCardActionsForMailActionsViewController:messageListItem:", v27, v36));
      v38 = objc_retainBlock(v37);

      v39 = 0;
    }
    else
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _preparationForFooterViewCardActionsForMailActionsViewController:](self, "_preparationForFooterViewCardActionsForMailActionsViewController:", v27));
      v39 = objc_retainBlock(v40);

      v36 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _completionForFooterViewCardActionsForMailActionsViewController:](self, "_completionForFooterViewCardActionsForMailActionsViewController:", v27));
      v38 = objc_retainBlock(v36);
    }

    v41 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _mailActionsViewDataSourceForMailActionsViewController:message:predictedMailbox:preparation:completion:](self, "_mailActionsViewDataSourceForMailActionsViewController:message:predictedMailbox:preparation:completion:", v27, v24, v46, v39, v38));
    -[MailActionsViewController setDataSource:](v27, "setDataSource:", v41);

    objc_destroyWeak(v43);
    objc_destroyWeak(location);

  }
  else
  {
    v31 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v32 = NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue(v32);
      sub_100390508();
    }

    v15[2](v15);
    v28 = 0;
  }

  return v28;
}

- (id)messageViewController:(id)a3 mostRecentAncestorMessageForMessage:(id)a4
{
  return 0;
}

- (void)messageViewController:(id)a3 scrollToRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "messageContentView"));
  -[ConversationViewController _scrollToRect:forMessageContentView:](self, "_scrollToRect:forMessageContentView:", x, y, width, height);

}

- (id)messageViewControllerMessageListMailboxScope:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(-[ConversationViewController _referenceMessageListMailboxScope](self, "_referenceMessageListMailboxScope", a3));
}

- (id)messageSourceMailboxObjectIDForMessageViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentRequest"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "message"));

  if (-[ConversationViewController _isDisplayingSingleMessage](self, "_isDisplayingSingleMessage"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mailboxObjectIDs"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase referenceMessageListItem](self, "referenceMessageListItem"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mailboxObjectIDs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObjectCommonWithArray:", v9));
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _visibleIndexPathForMessageViewController:](self, "_visibleIndexPathForMessageViewController:", v4));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _messageAtIndexPath:](self, "_messageAtIndexPath:", v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mailboxObjectIDs"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mailboxObjectIDs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObjectCommonWithArray:", v11));

  }
  return v10;
}

- (void)presentationController:(id)a3 prepareAdaptivePresentationController:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  BOOL v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSString *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  double v26;
  BOOL v27;
  void *v28;
  void *v29;
  _QWORD v30[2];

  v6 = a3;
  v7 = a4;
  v8 = objc_opt_class(UISheetPresentationController);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "presentedViewController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _mailActionsViewControllerFromPresentedViewController:](self, "_mailActionsViewControllerFromPresentedViewController:", v9));

    if (v10)
    {
      v22 = v7;
      objc_msgSend(v22, "_setShouldDismissWhenTappedOutside:", 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase displayMetrics](self, "displayMetrics"));
      objc_msgSend(v10, "approximateHeightForActionSheetStyleCard");
      v12 = v11;
      v13 = v11 > 0.0;
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_10006207C;
      v23[3] = &unk_10051B298;
      v14 = v21;
      v24 = v14;
      v27 = v13;
      v25 = v10;
      v26 = v12;
      v15 = objc_claimAutoreleasedReturnValue(+[UISheetPresentationControllerDetent _detentWithIdentifier:resolutionContextBlock:](UISheetPresentationControllerDetent, "_detentWithIdentifier:resolutionContextBlock:", CFSTR("ConversationControllerCustomMediumDetent"), v23));
      v16 = (void *)v15;
      if (v12 <= 0.0)
      {
        v30[0] = v15;
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[UISheetPresentationControllerDetent largeDetent](UISheetPresentationControllerDetent, "largeDetent"));
        v30[1] = v17;
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v30, 2));
      }
      else
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController traitCollection](self, "traitCollection"));
        v18 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "preferredContentSizeCategory"));
        if (UIContentSizeCategoryIsAccessibilityCategory(v18))
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[UISheetPresentationControllerDetent largeDetent](UISheetPresentationControllerDetent, "largeDetent"));
          v29 = v19;
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v29, 1));

        }
        else
        {
          v28 = v16;
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v28, 1));
        }

      }
      objc_msgSend(v22, "setDetents:", v20);

    }
  }

}

- (id)_mailActionsViewDataSourceForMailActionsViewController:(id)a3 message:(id)a4 predictedMailbox:(id)a5 preparation:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  MFTriageInteractionTarget *v19;
  void *v20;
  void *v21;
  void *v22;
  MailActionsViewDataSource *v23;
  id v24;
  MFTriageInteractionTarget *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  MailActionsViewDataSource *v30;
  void *v32;
  MFTriageInteractionTarget *v33;
  void *v34;
  id v35;
  void *v36;
  _QWORD v37[5];
  id v38;
  MFTriageInteractionTarget *v39;
  id v40;
  id v41;
  id v42;
  id v43;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v35 = a7;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "itemID"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _contentRequestForMessageWithItemID:](self, "_contentRequestForMessageWithItemID:", v16));

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "itemID"));
  v18 = objc_claimAutoreleasedReturnValue(-[ConversationViewController _getCurrentlySelectedMessageContentForMessageItemID:](self, "_getCurrentlySelectedMessageContentForMessageItemID:", v17));

  v34 = (void *)v18;
  v19 = [MFTriageInteractionTarget alloc];
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase referenceMessageListItem](self, "referenceMessageListItem"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "displayMessage"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "result"));
  v33 = -[MFTriageInteractionTarget initWithMessageListItem:primaryMessage:selectedMessageContent:primaryMessageContentRequest:targetPreference:preferQuickCompositionalActions:](v19, "initWithMessageListItem:primaryMessage:selectedMessageContent:primaryMessageContentRequest:targetPreference:preferQuickCompositionalActions:", v20, v22, v18, v36, 0, 0);

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase delegate](self, "delegate"));
  v23 = [MailActionsViewDataSource alloc];
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_1000624E8;
  v37[3] = &unk_10051B2C0;
  v37[4] = self;
  v24 = v12;
  v38 = v24;
  v25 = v33;
  v39 = v25;
  v26 = v15;
  v42 = v26;
  v27 = v35;
  v43 = v27;
  v28 = v14;
  v40 = v28;
  v29 = v32;
  v41 = v29;
  v30 = -[MailActionsViewDataSource initWithBuilderBlock:](v23, "initWithBuilderBlock:", v37);

  return v30;
}

- (id)_preparationForFooterViewCardActionsForMailActionsViewController:(id)a3
{
  id v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD v7[5];
  id v8;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000626D0;
  v7[3] = &unk_10051B2E8;
  v7[4] = self;
  v8 = a3;
  v3 = v8;
  v4 = objc_retainBlock(v7);
  v5 = objc_retainBlock(v4);

  return v5;
}

- (id)_completionForFooterViewCardActionsForMailActionsViewController:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD v12[5];
  id v13;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController selectedMessage](self, "selectedMessage", a3));
  v5 = v4;
  if (v4)
    v6 = v4;
  else
    v6 = (id)objc_claimAutoreleasedReturnValue(-[ConversationViewController targetMessageForBarButtonTriage](self, "targetMessageForBarButtonTriage"));
  v7 = v6;

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100062840;
  v12[3] = &unk_10051B310;
  v12[4] = self;
  v13 = v7;
  v8 = v7;
  v9 = objc_retainBlock(v12);
  v10 = objc_retainBlock(v9);

  return v10;
}

- (id)_completionForSwipeCardActionsForMailActionsViewController:(id)a3 messageListItem:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD v14[5];
  id v15;
  id v16;
  id location;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController selectedMessage](self, "selectedMessage"));
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = (id)objc_claimAutoreleasedReturnValue(-[ConversationViewController targetMessageForBarButtonTriage](self, "targetMessageForBarButtonTriage"));
  v9 = v8;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, v5);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100062AB8;
  v14[3] = &unk_10051B338;
  objc_copyWeak(&v16, &location);
  v14[4] = self;
  v15 = v9;
  v10 = v9;
  v11 = objc_retainBlock(v14);
  v12 = objc_retainBlock(v11);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v12;
}

- (void)mailActionsViewController:(id)a3 didSelectAction:(id)a4
{
  _objc_msgSend(a4, "executeHandlerIfEnabled", a3);
}

- (id)_mailActionsViewControllerFromPresentedViewController:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;

  v3 = a3;
  v4 = objc_opt_class(UINavigationController);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topViewController"));
    v6 = objc_opt_class(MailActionsViewController);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) == 0)
    {

LABEL_6:
      v5 = 0;
    }
  }
  else
  {
    v7 = objc_opt_class(MailActionsViewController);
    if ((objc_opt_isKindOfClass(v3, v7) & 1) == 0)
      goto LABEL_6;
    v5 = v3;
  }

  return v5;
}

- (BOOL)_isDisplayingSingleMessage
{
  return !-[ConversationViewControllerBase shownAsConversation](self, "shownAsConversation")
      || (id)-[ConversationViewController countOfMessages](self, "countOfMessages") == (id)1;
}

- (BOOL)_shouldArchiveByDefault
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase referenceMessageListItem](self, "referenceMessageListItem"));
  v3 = objc_msgSend(v2, "shouldArchiveByDefault");

  return v3;
}

- (id)_messageItemIDAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController collectionViewDataSource](self, "collectionViewDataSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "itemIdentifierForIndexPath:", v4));

  return v6;
}

- (int64_t)countOfMessages
{
  void *v3;
  void *v4;
  id v5;
  int64_t v6;
  int64_t v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController collectionViewDataSource](self, "collectionViewDataSource"));
  if ((uint64_t)objc_msgSend(v4, "numberOfSectionsInCollectionView:", v3) < 1)
    v5 = 0;
  else
    v5 = objc_msgSend(v4, "collectionView:numberOfItemsInSection:", v3, 0);
  v6 = -[ConversationViewController countOfSummaries](self, "countOfSummaries");
  v7 = ((uint64_t)v5 - v6) & ~(((uint64_t)v5 - v6) >> 63);

  return v7;
}

- (int64_t)countOfSummaries
{
  void *v3;
  void *v4;
  int64_t v5;

  if (!_os_feature_enabled_impl("Mail", "CatchUpManualSummarization")
    || !EMIsGreymatterAvailableWithOverride())
  {
    return 0;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController topSummaryItemID](self, "topSummaryItemID"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController inlineSummaryItemID](self, "inlineSummaryItemID"));
  v5 = 1;
  if (v3)
    v5 = 2;
  if (v4)
    return v5;
  else
    return v3 != 0;
}

- (void)_showSingleMessage:(id)a3 animationOffset:(CGPoint)a4 initialScrollOffset:(CGPoint)a5
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSMutableSet *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "contentRequest", a4.x, a4.y, a5.x, a5.y));
  v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "message"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "itemID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _cellForMessageItemIDIfExpanded:](self, "_cellForMessageItemIDIfExpanded:", v7));

  if (v8)
  {
    v9 = objc_opt_class(MFExpandedMessageCell);
    if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    {
      if (!*(NSMutableSet **)((char *)&self->_expandedContentItemIDs + 4))
      {
        v10 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
        v11 = *(NSMutableSet **)((char *)&self->_expandedContentItemIDs + 4);
        *(NSMutableSet **)((char *)&self->_expandedContentItemIDs + 4) = v10;

      }
      -[ConversationViewController setPinnedItem:](self, "setPinnedItem:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "messageViewController"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "messageContentView"));

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController expandedContentItemIDs](self, "expandedContentItemIDs"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "itemID"));
      objc_msgSend(v14, "addObject:", v15);

      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "messageViewController"));
      objc_msgSend(v16, "setAutomaticallyCollapseQuotedContent:", 0);

      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "footerView"));
      objc_msgSend(v17, "setBlockquotesAreExpanded:", 1);

      objc_msgSend(v13, "reload");
    }
  }

}

- (BOOL)_shouldAutomaticallyCollapseQuotedContentForCellAtIndexPath:(id)a3
{
  id v4;
  unsigned __int8 v5;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ConversationViewController;
  v5 = -[ConversationViewControllerBase _shouldAutomaticallyCollapseQuotedContentForCellAtIndexPath:](&v10, "_shouldAutomaticallyCollapseQuotedContentForCellAtIndexPath:", v4);
  v6 = objc_claimAutoreleasedReturnValue(-[ConversationViewController collectionViewDataSource](self, "collectionViewDataSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v6, "itemIdentifierForIndexPath:", v4));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController expandedContentItemIDs](self, "expandedContentItemIDs"));
  LOBYTE(v6) = objc_msgSend(v8, "containsObject:", v7);

  return v5 & (v6 ^ 1);
}

- (void)_reloadCellsAtIndexPaths:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController messageList](self, "messageList"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100063518;
  v9[3] = &unk_10051AE70;
  v8 = v6;
  v10 = v8;
  -[ConversationViewController _performDataSourceUpdateAnimated:collection:update:](self, "_performDataSourceUpdateAnimated:collection:update:", v4, v7, v9);

}

- (int64_t)_headerDisplayOptionsForCell:(id)a3 displayedAsSingleMessage:(BOOL)a4
{
  if (-[ConversationViewControllerBase beingPreviewed](self, "beingPreviewed", a3, a4))
    return 18;
  else
    return 2;
}

- (void)_updateBarButtonsEnabled
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase referenceMessageListItem](self, "referenceMessageListItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase barItemsManager](self, "barItemsManager"));
  objc_msgSend(v3, "updateEnabledStatesForMessage:", v4);

}

- (void)_scrollToInitialPosition
{
  _QWORD *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  _QWORD v33[5];
  uint8_t buf[4];
  double v35;
  __int16 v36;
  void *v37;

  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100063C90;
  v33[3] = &unk_10051B388;
  v33[4] = self;
  v3 = objc_retainBlock(v33);
  -[ConversationViewControllerBase initialScrollOffset](self, "initialScrollOffset");
  v6 = v5;
  v7 = v4;
  if (v5 == CGPointZero.x && v4 == CGPointZero.y)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase pinnedItem](self, "pinnedItem"));
    if (v11)
    {
      v12 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "ef_publicDescription"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dynamicOffset"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "ef_publicDescription"));
        *(_DWORD *)buf = 138412546;
        v35 = *(double *)&v13;
        v36 = 2112;
        v37 = v15;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Scroll to pinned item: %@, dynamicOffset: %@", buf, 0x16u);

      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "itemID"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dynamicOffset"));
      ((void (*)(_QWORD *, void *, void *, uint64_t))v3[2])(v3, v16, v17, 1);
    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase referenceMessageListItem](self, "referenceMessageListItem"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "displayMessageItemID"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController topSummaryItemID](self, "topSummaryItemID"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "anchorMessageItemID"));
      v20 = v17 == v19;

      if (v20)
      {
        if (-[ConversationViewController _shouldShowSummarizeControls:](self, "_shouldShowSummarizeControls:", v17))
        {
          v27 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "ef_publicDescription"));
            *(_DWORD *)buf = 138412290;
            v35 = *(double *)&v28;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Scroll to top summary item: %@", buf, 0xCu);

          }
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController topSummaryItemID](self, "topSummaryItemID"));
          ((void (*)(_QWORD *, void *, _QWORD, _QWORD))v3[2])(v3, v26, 0, 0);
        }
        else
        {
          v31 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "ef_publicDescription"));
            *(_DWORD *)buf = 138412290;
            v35 = *(double *)&v32;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Scroll to reference message list item: %@", buf, 0xCu);

          }
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "displayMessageItemID"));
          ((void (*)(_QWORD *, void *, _QWORD, _QWORD))v3[2])(v3, v26, 0, 0);
        }
      }
      else
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController inlineSummaryItemID](self, "inlineSummaryItemID"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "anchorMessageItemID"));
        v23 = v17 == v22;

        if (v23)
        {
          v29 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "ef_publicDescription"));
            *(_DWORD *)buf = 138412290;
            v35 = *(double *)&v30;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Scroll to inline summary item: %@", buf, 0xCu);

          }
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController inlineSummaryItemID](self, "inlineSummaryItemID"));
          ((void (*)(_QWORD *, void *, _QWORD, uint64_t))v3[2])(v3, v26, 0, 1);
        }
        else
        {
          v24 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "ef_publicDescription"));
            *(_DWORD *)buf = 138412290;
            v35 = *(double *)&v25;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Scroll to reference message list item: %@", buf, 0xCu);

          }
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "displayMessageItemID"));
          ((void (*)(_QWORD *, void *, _QWORD, uint64_t))v3[2])(v3, v26, 0, 1);
        }
      }

    }
  }
  else
  {
    v9 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v35 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Scroll to initial scroll offset: %.2f", buf, 0xCu);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
    objc_msgSend(v10, "setContentOffset:animated:", 0, v6, v7);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase previewState](self, "previewState"));
    objc_msgSend(v11, "transitionAfterScrollingToReferenceMessage");
  }

}

- (BOOL)_shouldShowSummarizeControls:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  unsigned __int8 v9;

  v4 = a3;
  if ((+[MUIManualSummaryController shouldAlwaysHideConversationSummarizeControl](MUIManualSummaryController, "shouldAlwaysHideConversationSummarizeControl") & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController initiallyUnreadItemIDs](self, "initiallyUnreadItemIDs"));
    if (!objc_msgSend(v5, "count"))
    {
      v9 = 0;
LABEL_8:

      goto LABEL_10;
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController initiallyUnreadItemIDs](self, "initiallyUnreadItemIDs"));
    v7 = objc_msgSend(v6, "containsObject:", v4);

    if (v7)
    {
      if ((id)-[ConversationViewController countOfMessages](self, "countOfMessages") != (id)1)
      {
        v9 = 1;
        goto LABEL_10;
      }
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase referenceMessageListItem](self, "referenceMessageListItem"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "summary"));
      v9 = +[MUIManualSummaryController shouldAllowSummarizationForContentLength:](MUIManualSummaryController, "shouldAllowSummarizationForContentLength:", objc_msgSend(v8, "length"));

      goto LABEL_8;
    }
  }
  v9 = 0;
LABEL_10:

  return v9;
}

- (BOOL)_isItemInitiallyUnreadAtIndexPath:(id)a3
{
  void *v4;
  unsigned __int8 v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _messageItemIDAtIndexPath:](self, "_messageItemIDAtIndexPath:", a3));
  if (v4)
    v5 = objc_msgSend(*(id *)((char *)&self->_initiallyUnreadItemIDs + 4), "containsObject:", v4);
  else
    v5 = 0;

  return v5;
}

- (void)_fetchConversationAttachmentDataWithCompletion:(id)a3
{
  id v3;
  _QWORD v4[4];
  ConversationViewController *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10006418C;
  v4[3] = &unk_10051B400;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[ConversationViewController _allMessageIDsWithCompletion:](v5, "_allMessageIDsWithCompletion:", v4);

}

- (void)_fetchConversationRichLinkDataWithCompletion:(id)a3
{
  id v3;
  _QWORD v4[4];
  ConversationViewController *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10006440C;
  v4[3] = &unk_10051B400;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[ConversationViewController _allMessageIDsWithCompletion:](v5, "_allMessageIDsWithCompletion:", v4);

}

- (void)setBeingPreviewed:(BOOL)a3
{
  void *v5;
  _QWORD v6[5];
  BOOL v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ConversationViewController;
  -[ConversationViewControllerBase setBeingPreviewed:](&v8, "setBeingPreviewed:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase cellConfigurator](self, "cellConfigurator"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000646A8;
  v6[3] = &unk_10051B468;
  v7 = a3;
  v6[4] = self;
  objc_msgSend(v5, "enumerateExpandedCellsWithBlock:", v6);

}

- (void)_configureExpandedCell:(id)a3 atIndexPath:(id)a4 viewModel:(id)a5 collapseQuotedContent:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  unsigned int v26;
  NSObject *v27;
  _BOOL4 v28;
  void *v29;
  id v30;
  _QWORD *v31;
  void *v32;
  _TtC10MobileMail37SemiExpandedMessageHeaderSubjectBlock *v33;
  _TtC10MobileMail37SemiExpandedMessageHeaderSubjectBlock *v34;
  uint64_t v35;
  void *v36;
  unsigned int v37;
  id v38;
  void *v39;
  MessageHeaderSubjectBlock *v40;
  MFMessageSashHeaderBlock *v41;
  void *v42;
  void *v43;
  MFMessageSashHeaderBlock *v44;
  void *v45;
  _BOOL4 v46;
  void *v47;
  _BOOL4 v48;
  void *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  unsigned int v56;
  void *v57;
  int v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  NSObject *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  _BOOL4 v71;
  unsigned int v72;
  _BOOL4 v73;
  id v74;
  id v75;
  id v76;
  void *v77;
  id v78;
  id val;
  void *v80;
  void *v81;
  _QWORD v82[4];
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  _QWORD v89[4];
  id v90;
  id v91;
  id v92;
  _QWORD v93[4];
  id v94;
  id v95;
  id v96;
  BOOL v97;
  id from;
  id location;
  _BYTE buf[14];
  id v101;
  __int16 v102;
  void *v103;
  __int16 v104;
  void *v105;

  v6 = a6;
  v10 = a3;
  v78 = a4;
  v75 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController blankConversationTailspinToken](self, "blankConversationTailspinToken"));
  v73 = v6;
  objc_msgSend(v11, "cancel");

  v12 = -[ConversationViewController _isDisplayingSingleMessage](self, "_isDisplayingSingleMessage");
  v72 = -[ConversationViewControllerBase allowQuickReply](self, "allowQuickReply");
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "messageContentRequest"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "messageViewController"));

  if (!v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase messageViewControllerReuseQueue](self, "messageViewControllerReuseQueue"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dequeueMessageViewControllerForContentRequest:", v77));
    objc_msgSend(v10, "setMessageViewController:", v15);

  }
  val = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "messageViewController"));
  objc_msgSend(val, "setDelegate:", self);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase contactStore](self, "contactStore"));
  objc_msgSend(val, "setContactStore:", v16);

  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(val, "messageContentView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase cellConfigurator](self, "cellConfigurator"));
  v18 = objc_msgSend(v17, "expansionStatusForMessageAtIndexPath:", v78);

  if (v18 == (id)2)
    v19 = 1;
  else
    v19 = v12 ^ 1;
  objc_msgSend(v81, "setSuppressScrolling:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase contactStore](self, "contactStore"));
  objc_msgSend(v81, "setContactStore:", v20);

  v21 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
  v76 = v18;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "messageContentRequest"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "itemID"));
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v78;
    *(_WORD *)&buf[12] = 2114;
    v101 = v23;
    v102 = 2048;
    v103 = v81;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Configuring expanded cell at indexPath: %@ with itemID: %{public}@, contentView:%p", buf, 0x20u);

  }
  v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "message"));
  objc_msgSend(v10, "setShouldArchiveByDefault:", objc_msgSend(v80, "shouldArchiveByDefault"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(val, "contentRequest"));
  v25 = objc_msgSend(v24, "isEqual:", v77);

  v26 = objc_msgSend(v10, "isConfiguredForSingleMessageDisplay");
  v27 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
  v28 = v12 ^ v26;
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&buf[4] = v25 ^ 1;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = v28;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Content requests differs %{BOOL}d, singleMessageConfigurationDiffers %{BOOL}d", buf, 0xEu);
  }

  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "readLater"));
  if (v29 || (v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "sendLaterDate"))) != 0)
  {

  }
  else
  {
    v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "followUp"));
    v71 = v70 != 0;

    if (((v25 ^ 1 | v28 | v71) & 1) == 0)
    {
      objc_msgSend(v10, "setConfiguredForSingleMessageDisplay:", v12);
      objc_msgSend(val, "setAutomaticallyCollapseQuotedContent:reloadIfNeeded:", v73, 1);
      goto LABEL_29;
    }
  }
  v74 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "headerView"));
  v30 = objc_alloc_init((Class)NSMutableArray);
  *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, val);
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, v10);
  from = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&from, self);
  v93[0] = _NSConcreteStackBlock;
  v93[1] = 3221225472;
  v93[2] = sub_100065630;
  v93[3] = &unk_10051B490;
  objc_copyWeak(&v94, &from);
  objc_copyWeak(&v95, (id *)buf);
  objc_copyWeak(&v96, &location);
  v97 = v12;
  v31 = objc_retainBlock(v93);
  v32 = v31;
  if (v76 == (id)2)
  {
    v92 = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&v92, v74);
    v33 = [_TtC10MobileMail37SemiExpandedMessageHeaderSubjectBlock alloc];
    v89[0] = _NSConcreteStackBlock;
    v89[1] = 3221225472;
    v89[2] = sub_100065720;
    v89[3] = &unk_10051B4B8;
    objc_copyWeak(&v91, &v92);
    v90 = v32;
    v34 = -[SemiExpandedMessageHeaderSubjectBlock initWithHandler:](v33, "initWithHandler:", v89);
    objc_msgSend(v30, "addObject:", v34);

    objc_destroyWeak(&v91);
    objc_destroyWeak(&v92);
  }
  else
  {
    v35 = ((uint64_t (*)(_QWORD *))v31[2])(v31);
    v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
    objc_msgSend(v30, "addObject:", v36);

  }
  v37 = -[ConversationViewController _shouldShowMailboxForMessage:](self, "_shouldShowMailboxForMessage:", v80);
  v38 = sub_1000657B8(self, v80);
  v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
  objc_msgSend(v30, "ef_addOptionalObject:", v39);

  if (v76 != (id)2)
  {
    v40 = -[MessageHeaderSubjectBlock initWithFrame:]([MessageHeaderSubjectBlock alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    objc_msgSend(v30, "addObject:", v40);
    objc_msgSend(v81, "setHeaderViewSubjectBlock:", v40);
    -[MessageHeaderSubjectBlock setHidden:](v40, "setHidden:", v12 ^ 1);

  }
  if (v37)
  {
    v41 = [MFMessageSashHeaderBlock alloc];
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "accountsProvider"));
    v44 = -[MFMessageSashHeaderBlock initWithFrame:accountsProvider:](v41, "initWithFrame:accountsProvider:", v43, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);

    -[MFMessageSashHeaderBlock setShouldShowMailbox:](v44, "setShouldShowMailbox:", 1);
    objc_msgSend(v30, "insertObject:atIndex:", v44, 0);
    if ((v25 & 1) != 0)
      goto LABEL_24;
LABEL_22:
    objc_msgSend(v74, "setHeaderBlocks:", v30);
    if (v44)
      objc_msgSend(v74, "setPinnedBlock:", v44);
    goto LABEL_24;
  }
  v44 = 0;
  if ((v25 & 1) == 0)
    goto LABEL_22;
LABEL_24:
  objc_msgSend(v10, "setConfiguredForSingleMessageDisplay:", v12);
  objc_msgSend(val, "setAutomaticallyCollapseQuotedContent:reloadIfNeeded:", v73, v25);
  objc_msgSend(val, "setContentRequest:", v77);
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController predictedMailboxForConversation](self, "predictedMailboxForConversation"));
  v46 = v45 == 0;

  if (v46)
    -[ConversationViewController _updatePredictedMailboxForConversation](self, "_updatePredictedMailboxForConversation");
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "predictedMailbox"));
  v48 = v47 == 0;

  if (v48)
    -[ConversationViewController configurePredictedMailboxForCell:forMessage:](self, "configurePredictedMailboxForCell:forMessage:", v10, v80);
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "itemID"));
  -[ConversationViewController _updateStickySubjectForItemID:cell:indexPath:](self, "_updateStickySubjectForItemID:cell:indexPath:", v49, v10, v78);

  objc_destroyWeak(&v96);
  objc_destroyWeak(&v95);
  objc_destroyWeak(&v94);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);

LABEL_29:
  objc_msgSend(v10, "setOnlyMaskBottomCorners:", v72 & v12);
  v50 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
  {
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "headerView"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "headerBlocks"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "messageContentRequest"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "itemID"));
    *(_DWORD *)buf = 138544130;
    *(_QWORD *)&buf[4] = v52;
    *(_WORD *)&buf[12] = 2112;
    v101 = v78;
    v102 = 2114;
    v103 = v54;
    v104 = 2048;
    v105 = v81;
    _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "Header blocks %{public}@ for expanded cell at indexPath: %@ with itemID: %{public}@, contentView:%p", buf, 0x2Au);

  }
  if (!-[ConversationViewControllerBase didCompleteFirstPaint](self, "didCompleteFirstPaint"))
    -[ConversationViewControllerBase setDidCompleteFirstPaint:](self, "setDidCompleteFirstPaint:", objc_msgSend(val, "didCompleteFirstPaint"));
  v55 = v76;
  v56 = -[ConversationViewControllerBase allowQuickReply](self, "allowQuickReply");
  v57 = v80;
  v58 = _os_feature_enabled_impl("Mail", "ShowUndoSendInConversation");
  if ((v56 & -[ConversationViewController _isQuickReplyMessageAtIndexPath:](self, "_isQuickReplyMessageAtIndexPath:", v78)) == 1)
  {
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase quickReplyAnimationContext](self, "quickReplyAnimationContext"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "getObject"));

    if ((*(unsigned int (**)(_QWORD, void *))(EFIsNull + 16))(EFIsNull, v60))
      v61 = 0;
    else
      v61 = v60;
    v62 = v61;

    if (!v62)
    {
      -[ConversationViewController _resetQuickReplyViewControllerWithReason:resetCompose:override:](self, "_resetQuickReplyViewControllerWithReason:resetCompose:override:", 4, 1, 0);
      v63 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
      {
        v64 = (void *)objc_opt_class(self);
        sub_100390548(v64, (uint64_t)self, (uint64_t)buf, v63);
      }

    }
    objc_msgSend(v10, "prepareForQuickReplyAnimationWithContext:", v62);
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _quickReplyView](self, "_quickReplyView"));
    objc_msgSend(v65, "setHidden:", 1);

    +[QuickReplyView defaultHeight](_TtC10MobileMail14QuickReplyView, "defaultHeight");
    -[ConversationViewControllerBase setQuickReplyHeight:](self, "setQuickReplyHeight:");

    v57 = v80;
    v55 = v76;
  }
  if (-[ConversationViewControllerBase beingPreviewed](self, "beingPreviewed"))
    objc_msgSend(v81, "setShowMessageFooter:", 0);
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "footerView"));
  objc_msgSend(v66, "setIsSemiExpanded:", v55 == (id)2);
  if (v58)
  {
    objc_msgSend(v66, "setUndoSendButtonHidden:", -[ConversationViewController _isMessageInOutbox:](self, "_isMessageInOutbox:", v57) ^ 1);
  }
  else
  {
    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "itemID"));
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v68 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController messageLoadingScheduler](self, "messageLoadingScheduler"));
    v82[0] = _NSConcreteStackBlock;
    v82[1] = 3221225472;
    v82[2] = sub_100065960;
    v82[3] = &unk_10051B508;
    v83 = v80;
    objc_copyWeak(&v88, &location);
    v84 = v10;
    v69 = v67;
    v85 = v69;
    v86 = v66;
    v87 = v78;
    objc_msgSend(v68, "performBlock:", v82);

    objc_destroyWeak(&v88);
    objc_destroyWeak(&location);

  }
}

- (BOOL)_shouldRemoveBannerBlock:(id)a3 forHeaderViewModel:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  unsigned int v11;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "type");
  if (!v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sendLaterDate"));
    LOBYTE(v11) = v9 == 0;
LABEL_8:

    goto LABEL_9;
  }
  if (v8 == (id)1)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "readLaterDate"));
    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase delegate](self, "delegate"));
      v11 = objc_msgSend(v10, "conversationViewControllerAllowsRemindMeAction:", self) ^ 1;

    }
    else
    {
      LOBYTE(v11) = 1;
    }
    goto LABEL_8;
  }
  LOBYTE(v11) = 0;
LABEL_9:

  return v11;
}

- (void)configurePredictedMailboxForCell:(id)a3 forMessage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[EFPromise promise](EFPromise, "promise"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "future"));
  objc_msgSend(v6, "setPredictedMailbox:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController mailboxPredictionScheduler](self, "mailboxPredictionScheduler"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100065D84;
  v13[3] = &unk_10051A910;
  v11 = v8;
  v14 = v11;
  v12 = v7;
  v15 = v12;
  objc_msgSend(v10, "performBlock:", v13);

}

- (void)_configureCollapsedCell:(id)a3 atIndexPath:(id)a4 viewModel:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  void *v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController blankConversationTailspinToken](self, "blankConversationTailspinToken"));
  objc_msgSend(v11, "cancel");

  v12 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "messageContentRequest"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "itemID"));
    v15 = 138412546;
    v16 = v9;
    v17 = 2114;
    v18 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Configuring collapsed cell at indexPath: %@ with itemID: %{public}@", (uint8_t *)&v15, 0x16u);

  }
  if (sub_100087C28((_BOOL8)self))
    objc_msgSend(v8, "addConversationSearchOverlay");

}

- (id)_currentlyVisibleIndexPath
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController collectionViewDataSource](self, "collectionViewDataSource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _focusedMessageItemID](self, "_focusedMessageItemID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "indexPathForItemIdentifier:", v4));

  return v5;
}

- (id)_indexPathForReferenceMessage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController collectionViewDataSource](self, "collectionViewDataSource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase referenceMessageListItem](self, "referenceMessageListItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "displayMessageItemID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "indexPathForItemIdentifier:", v5));

  return v6;
}

- (id)_indexPathOfMessageViewControllerMessage:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "contentRequest"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "message"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController collectionViewDataSource](self, "collectionViewDataSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "itemID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "indexPathForItemIdentifier:", v7));

  return v8;
}

- (id)_visibleIndexPathForMessageViewController:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(-[ConversationViewController _indexPathOfMessageViewControllerMessage:](self, "_indexPathOfMessageViewControllerMessage:", a3));
}

- (id)_targetMessageOrItemIDForBarButtonTriage:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  char *v19;
  char *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  _QWORD v27[4];
  Block_layout *v28;
  Block_layout *v29;
  uint64_t *v30;
  unsigned __int8 v31;
  BOOL v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController collectionViewDataSource](self, "collectionViewDataSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "snapshot"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _messageItemIDsFromShapshot:](self, "_messageItemIDsFromShapshot:", v6));
  if (objc_msgSend(v7, "count"))
  {
    v8 = -[ConversationViewController _isDisplayingSingleMessage](self, "_isDisplayingSingleMessage");
    v33 = 0;
    v34 = &v33;
    v35 = 0x3032000000;
    v36 = sub_10005ED90;
    v37 = sub_10005EDA0;
    v38 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase cellConfigurator](self, "cellConfigurator"));
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1000665C8;
    v27[3] = &unk_10051B5B0;
    v31 = v8;
    v32 = v3;
    v28 = &stru_10051B548;
    v29 = &stru_10051B588;
    v30 = &v33;
    objc_msgSend(v9, "enumerateExpandedCellsWithBlock:", v27);

    v10 = (void *)v34[5];
    if (v10)
    {
LABEL_21:
      v17 = v10;

      _Block_object_dispose(&v33, 8);
      goto LABEL_22;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase referenceMessageListItem](self, "referenceMessageListItem"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "displayMessageItemID"));
    v13 = (uint64_t)objc_msgSend(v7, "indexOfObject:", v12);

    if (v13 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v14 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_1003905BC();

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _referenceDisplayMessage](self, "_referenceDisplayMessage"));
      v16 = objc_claimAutoreleasedReturnValue(+[EFPair pairWithFirst:second:](EFPair, "pairWithFirst:second:", 0, v15));
    }
    else
    {
      if ((id)-[ConversationViewControllerBase conversationSortOrder](self, "conversationSortOrder") == (id)1)
      {
        if (v13 <= 1)
          v18 = 1;
        else
          v18 = v13;
        v19 = (char *)(v18 - 1);
      }
      else
      {
        v20 = (char *)objc_msgSend(v7, "count");
        if (v13 + 1 < (uint64_t)(v20 - 1))
          v19 = (char *)(v13 + 1);
        else
          v19 = v20 - 1;
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", v19));
      if (v3)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _messageForItemID:](self, "_messageForItemID:", v15));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "displayMessage"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "result"));
        v24 = objc_claimAutoreleasedReturnValue(+[EFPair pairWithFirst:second:](EFPair, "pairWithFirst:second:", 0, v23));
        v25 = (void *)v34[5];
        v34[5] = v24;

LABEL_20:
        v10 = (void *)v34[5];
        goto LABEL_21;
      }
      v16 = objc_claimAutoreleasedReturnValue(+[EFPair pairWithFirst:second:](EFPair, "pairWithFirst:second:", v15, 0));
    }
    v21 = (void *)v34[5];
    v34[5] = v16;
    goto LABEL_20;
  }
  v17 = 0;
LABEL_22:

  return v17;
}

- (id)targetMessageItemIDForBarButtonTriage
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _targetMessageOrItemIDForBarButtonTriage:](self, "_targetMessageOrItemIDForBarButtonTriage:", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "first"));

  return v3;
}

- (id)targetMessageForBarButtonTriage
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _targetMessageOrItemIDForBarButtonTriage:](self, "_targetMessageOrItemIDForBarButtonTriage:", 1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "second"));

  return v3;
}

- (void)_updateHandoffWithMessageAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController collectionViewDataSource](self, "collectionViewDataSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "itemIdentifierForIndexPath:", v4));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _contentRequestForMessageWithItemID:](self, "_contentRequestForMessageWithItemID:", v6));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase handoffCoordinator](self, "handoffCoordinator"));
    objc_msgSend(v8, "setHandoffMessageRequest:", v7);

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase handoffCoordinator](self, "handoffCoordinator"));
    objc_msgSend(v9, "setHandoffMessageRequest:", 0);

    v10 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1003905E8();

  }
}

- (BOOL)_shouldReloadEmptyMessageList
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController messageList](self, "messageList"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allItemIDs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "resultIfAvailable"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase referenceMessageListItem](self, "referenceMessageListItem"));
  v7 = 0;
  if (objc_msgSend(v6, "count") && v5)
    v7 = objc_msgSend(v5, "count") == 0;

  return v7;
}

- (void)_autoReloadDataSourceForEmptyAddIfNeeded
{
  NSObject *v4;
  NSString *v5;

  if (-[ConversationViewController _shouldReloadEmptyMessageList](self, "_shouldReloadEmptyMessageList")
    && !-[ConversationViewController didAutoReloadDataSource](self, "didAutoReloadDataSource"))
  {
    -[ConversationViewController setDidAutoReloadDataSource:](self, "setDidAutoReloadDataSource:", 1);
    v4 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue(v5);
      sub_10039064C();
    }

    -[ConversationViewController _reloadDataSource](self, "_reloadDataSource");
  }
}

- (id)_persistentIDForEMMessageObjectID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController messageRepository](self, "messageRepository"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "persistentIDForMessageObjectID:", v4));

  return v6;
}

- (BOOL)_isMessageInOutbox:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  unsigned __int8 v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mailboxes"));
  v5 = objc_msgSend(v4, "ef_any:", &stru_10051B5F0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mailboxes"));
  v7 = objc_msgSend(v6, "ef_any:", &stru_10051B610);

  return v5 & (v7 ^ 1);
}

- (id)pinnedIndexPathProvider
{
  void *v3;
  _QWORD *v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  id location;

  v3 = *(id *)((char *)&self->_pinnedIndexPathProvider + 4);
  if (!v3)
  {
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100066D20;
    v7[3] = &unk_10051B638;
    objc_copyWeak(&v8, &location);
    v4 = objc_retainBlock(v7);
    v5 = *(id *)((char *)&self->_pinnedIndexPathProvider + 4);
    *(id *)((char *)&self->_pinnedIndexPathProvider + 4) = v4;

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
    v3 = *(id *)((char *)&self->_pinnedIndexPathProvider + 4);
  }
  return objc_retainBlock(v3);
}

- (void)setPinnedItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ConversationViewController;
  -[ConversationViewControllerBase setPinnedItem:](&v8, "setPinnedItem:", v4);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "itemID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _priorityLoadingComparatorForPinnedItemID:](self, "_priorityLoadingComparatorForPinnedItemID:", v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController contentRequestQueue](self, "contentRequestQueue"));
    objc_msgSend(v7, "setComparator:", v6);

  }
}

- (void)pinCurrentItem
{
  double v3;
  double v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v13 = (id)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase displayMetrics](self, "displayMetrics"));
  +[MFCollapsedMessageCell defaultHeightWithDisplayMetrics:](MFCollapsedMessageCell, "defaultHeightWithDisplayMetrics:");
  v4 = v3;

  if ((id)-[ConversationViewControllerBase conversationSortOrder](self, "conversationSortOrder") == (id)1)
    v5 = 1;
  else
    v5 = 4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
  v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mf_mostVisibleCellNearestEdge:preferredMinimumHeight:", v5, v4));

  if (v14)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "itemID"));

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mf_dynamicOffsetForVisibleCell:", v14));

      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "itemID"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController pinnedIndexPathProvider](self, "pinnedIndexPathProvider"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[PinnedConversationItem pinnedItemWithID:dynamicOffset:indexPathProvider:](PinnedConversationItem, "pinnedItemWithID:dynamicOffset:indexPathProvider:", v10, v9, v11));

      -[ConversationViewController setPinnedItem:](self, "setPinnedItem:", v12);
    }
  }

}

- (void)pinItemAtIndexPath:(id)a3 dynamicOffset:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController collectionViewDataSource](self, "collectionViewDataSource"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "itemIdentifierForIndexPath:", v11));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController pinnedIndexPathProvider](self, "pinnedIndexPathProvider"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[PinnedConversationItem pinnedItemWithID:dynamicOffset:indexPathProvider:](PinnedConversationItem, "pinnedItemWithID:dynamicOffset:indexPathProvider:", v8, v6, v9));
  -[ConversationViewController setPinnedItem:](self, "setPinnedItem:", v10);

}

- (id)_referenceMessageListMailboxScope
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController referenceMessageListQuery](self, "referenceMessageListQuery"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "predicate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController messageRepository](self, "messageRepository"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mailboxRepository"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[EMMessageListItemPredicates mailboxScopeForPredicate:withMailboxTypeResolver:](EMMessageListItemPredicates, "mailboxScopeForPredicate:withMailboxTypeResolver:", v4, v6));

  return v7;
}

- (int64_t)_dataOwnerForDragSessionAtIndexPath:(id)a3
{
  void *v4;
  void *v5;
  int64_t v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _messageAtIndexPath:](self, "_messageAtIndexPath:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _referenceMessageListMailboxScope](self, "_referenceMessageListMailboxScope"));
  if (objc_msgSend(v4, "isInManagedAccountWithSourceMailboxScope:", v5))
    v6 = 2;
  else
    v6 = 1;

  return v6;
}

- (id)_dragItemsForItemAtIndexPath:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v16;
  void *v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    v19 = objc_msgSend(v4, "row");
    v20 = 2048;
    v21 = objc_msgSend(v4, "section");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "#DragAndDrop Conversation view drag source items requested for indexPath {%ld, %ld}", buf, 0x16u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _messageAtIndexPath:](self, "_messageAtIndexPath:", v4));
  if (v6)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "#DragAndDrop Will begin dragging message", buf, 2u);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController messageList](self, "messageList"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MessageListItemDragContext withItem:messageList:](MessageListItemDragContext, "withItem:messageList:", v6, v8));

    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dragItem"));
    v17 = v6;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController undoManager](self, "undoManager"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MFTriageInteraction interactionWithMessageListItems:undoManager:origin:actor:](MFMoveMessageTriageInteraction, "interactionWithMessageListItems:undoManager:origin:actor:", v11, v12, 3, 2));

    -[NSObject setLocalObject:](v10, "setLocalObject:", v13);
    if (!v10)
    {
      v14 = 0;
      goto LABEL_13;
    }
    v16 = v10;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));
  }
  else
  {
    v10 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "#DragAndDrop No items found for indexPath", buf, 2u);
    }
    v14 = 0;
  }

LABEL_13:
  return v14;
}

- (id)_messageContentViewForMessageItemID:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _cellForMessageItemIDIfExpanded:](self, "_cellForMessageItemIDIfExpanded:", a3));
  if (v3
    && (v4 = objc_opt_class(MFMessageConversationViewCell), (objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    && objc_msgSend(v3, "expanded"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "messageViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "messageContentView"));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_getCurrentlySelectedMessageContentForMessageItemID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _messageContentViewForMessageItemID:](self, "_messageContentViewForMessageItemID:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "selectedHTML"));
  if (objc_msgSend(v6, "length"))
  {
    v9 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_clearSelectedMessageContentForMessageItemID:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[ConversationViewController _messageContentViewForMessageItemID:](self, "_messageContentViewForMessageItemID:", a3));
  objc_msgSend(v3, "clearSelectedHTML");

}

- (void)_allMessageIDsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController messageList](self, "messageList"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allItemIDs"));

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10006789C;
  v8[3] = &unk_10051B3D8;
  v7 = v4;
  v9 = v7;
  objc_msgSend(v6, "addSuccessBlock:", v8);
  objc_msgSend(v6, "addFailureBlock:", &stru_10051B6B8);

}

- (id)_allMessages
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _conversationViewQueryIncludeRelated:](self, "_conversationViewQueryIncludeRelated:", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[EFPromise promise](EFPromise, "promise"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController messageRepository](self, "messageRepository"));
  v6 = -[ConversationViewController countOfMessages](self, "countOfMessages");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "completionHandlerAdapter"));
  objc_msgSend(v5, "performQuery:limit:completionHandler:", v3, v6, v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "future"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "result:", 0));

  if (v9)
    v10 = v9;
  else
    v10 = &__NSArray0__struct;
  v11 = v10;

  return v11;
}

- (id)_messageListItemsForBarButtonTriage
{
  void *v3;
  void *v4;
  uint64_t v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v14;
  uint64_t v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase delegate](self, "delegate"));
  if (-[ConversationViewControllerBase shownAsConversation](self, "shownAsConversation"))
  {
    if (-[ConversationViewControllerBase shownAsConversation](self, "shownAsConversation")
      && (v4 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase referenceMessageListItem](self, "referenceMessageListItem")),
          v5 = objc_opt_class(EMThread),
          isKindOfClass = objc_opt_isKindOfClass(v4, v5),
          v4,
          (isKindOfClass & 1) != 0))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase referenceMessageListItem](self, "referenceMessageListItem"));
      v14 = v7;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));

    }
    else if ((objc_opt_respondsToSelector(v3, "conversationViewController:messagesToActOnForReferenceMessage:") & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase referenceMessageListItem](self, "referenceMessageListItem"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "conversationViewController:messagesToActOnForReferenceMessage:", self, v11));

    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v9 = objc_claimAutoreleasedReturnValue(-[ConversationViewController _referenceDisplayMessage](self, "_referenceDisplayMessage"));
    v10 = (void *)v9;
    if (v9)
    {
      v15 = v9;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
    }
    else
    {
      v8 = 0;
    }

  }
  if (!objc_msgSend(v8, "count"))
  {
    v12 = objc_claimAutoreleasedReturnValue(-[ConversationViewController _allMessages](self, "_allMessages"));

    v8 = (void *)v12;
  }

  return v8;
}

- (int64_t)_messageListItemCount
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase referenceMessageListItem](self, "referenceMessageListItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "displayMessageItemID"));

  if (!v4)
    return 0;
  if (!-[ConversationViewControllerBase shownAsConversation](self, "shownAsConversation"))
    return 1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase referenceMessageListItem](self, "referenceMessageListItem"));
  v6 = objc_msgSend(v5, "count");

  return (int64_t)v6;
}

- (id)_referenceDisplayMessage
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v15;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase referenceMessageListItem](self, "referenceMessageListItem"));
  if (-[ConversationViewControllerBase shownAsConversation](self, "shownAsConversation")
    || (v5 = objc_opt_class(EMMessage), (objc_opt_isKindOfClass(v4, v5) & 1) == 0))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase referenceMessageListItem](self, "referenceMessageListItem"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "displayMessageItemID"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController contentRequestCache](self, "contentRequestCache"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", v10));

    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "message"));
    if (!v8)
    {
      v13 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase referenceMessageListItem](self, "referenceMessageListItem"));
        sub_1003906F0();
      }

    }
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "displayMessageItemID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "itemID"));

    if (v6 != v7)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ConversationViewController.m"), 2683, CFSTR("When threading is off displayMessageItemID should always equal itemID"));

    }
    v8 = v4;
  }

  return v8;
}

- (id)_messagesForTriageInteraction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v15;
  void *v16;
  void *v17;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "messageListItemSelection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "messageListItems"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase referenceMessageListItem](self, "referenceMessageListItem"));
  if (objc_msgSend(v6, "count") != (id)1 || objc_msgSend(v5, "count") != (id)1)
  {

    return v5;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
  v8 = objc_msgSend(v7, "conversationID");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase referenceMessageListItem](self, "referenceMessageListItem"));
  v10 = objc_msgSend(v9, "conversationID");

  if (v8 != v10)
    return v5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase referenceMessageListItem](self, "referenceMessageListItem"));
  v17 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));

  v13 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412290;
    v16 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "_messagesForTriageInteraction - using referenceMessageListItem.itemID:%@", (uint8_t *)&v15, 0xCu);
  }

  return v12;
}

- (void)_updatePredictedMailboxForConversation
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController mailboxPredictionScheduler](self, "mailboxPredictionScheduler"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000682C8;
  v4[3] = &unk_10051AA98;
  v4[4] = self;
  objc_msgSend(v3, "performBlock:", v4);

}

- (void)_deleteMessageListItemsForMoveOrDestructiveInteraction:(id)a3 completion:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "messageListItemSelection"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "messageListItems"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ef_compactMap:", &stru_10051B6F8));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController messageList](self, "messageList"));
  -[ConversationViewController _deleteItemsWithIDs:fromCollection:completionHandler:](self, "_deleteItemsWithIDs:fromCollection:completionHandler:", v8, v9, v10);

}

- (void)_scrollToRect:(CGRect)a3 forMessageContentView:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  NSObject *v16;
  double v17;
  NSString *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  id v26;
  __int16 v27;
  void *v28;
  NSPoint v29;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
  objc_msgSend(v10, "convertRect:fromView:", v9, x, y, width, height);
  v12 = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
  objc_msgSend(v13, "adjustedContentInset");
  v15 = v14;

  v16 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
  v17 = v12 - (v15 + 32.0);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v29.x = 0.0;
    v29.y = v17;
    v18 = NSStringFromPoint(v29);
    v19 = (id)objc_claimAutoreleasedReturnValue(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentRequest"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "messageFuture"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "resultIfAvailable"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "ef_publicDescription"));
    v25 = 138412546;
    v26 = v19;
    v27 = 2112;
    v28 = v23;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Scroll to point (%@) for message: %@", (uint8_t *)&v25, 0x16u);

  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
  objc_msgSend(v24, "setContentOffset:animated:", 1, 0.0, v17);

}

- (BOOL)_showQuickReplyBelowConversation
{
  return -[ConversationViewControllerBase conversationSortOrder](self, "conversationSortOrder") == 0;
}

- (void)validateCommand:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ConversationViewController;
  -[ConversationViewController validateCommand:](&v11, "validateCommand:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase referenceMessageListItem](self, "referenceMessageListItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "flags"));

  v7 = (char *)objc_msgSend(v4, "action");
  if (v7 == "_markAsJunkCommandInvoked:")
  {
    if (objc_msgSend(v6, "junkLevel") == (id)1)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("OPERATION_NOT_JUNK_DESC"), &stru_100531B00, CFSTR("Main")));
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("OPERATION_JUNK_DESC"), &stru_100531B00, CFSTR("Main")));
    }
    goto LABEL_19;
  }
  if (v7 == "_flagCommandInvoked:")
  {
    if (objc_msgSend(v6, "flagged"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("MARK_EMAIL_UNFLAGGED"), &stru_100531B00, CFSTR("Main")));
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("MARK_EMAIL_FLAGGED"), &stru_100531B00, CFSTR("Main")));
    }
    goto LABEL_19;
  }
  if (v7 == "_markAsReadCommandInvoked:")
  {
    if (objc_msgSend(v6, "read"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("MARK_EMAIL_UNREAD"), &stru_100531B00, CFSTR("Main")));
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("MARK_EMAIL_READ"), &stru_100531B00, CFSTR("Main")));
    }
    goto LABEL_19;
  }
  if (v7 == "_deleteMessageCommandInvoked:")
  {
    if ((id)-[ConversationViewController _messageListItemCount](self, "_messageListItemCount") == (id)1)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("DELETE_EMAIL"), &stru_100531B00, CFSTR("Main")));
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("DELETE_EMAIL_PLURAL"), &stru_100531B00, CFSTR("Main")));
    }
    goto LABEL_19;
  }
  if (v7 == "_archiveShortcutInvoked:")
  {
    if ((id)-[ConversationViewController _messageListItemCount](self, "_messageListItemCount") == (id)1)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ARCHIVE_EMAIL"), &stru_100531B00, CFSTR("Main")));
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ARCHIVE_EMAIL_PLURAL"), &stru_100531B00, CFSTR("Main")));
    }
LABEL_19:
    v10 = (void *)v9;
    objc_msgSend(v4, "setDiscoverabilityTitle:", v9);

  }
}

- (void)_replyCommandInvoked:(id)a3
{
  sub_100068FF8((id *)&self->super.super.super.super.isa, 0, a3);
}

- (void)_replyAllCommandInvoked:(id)a3
{
  sub_100068FF8((id *)&self->super.super.super.super.isa, 1, a3);
}

- (void)_printCommandInvoked:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  _QWORD v7[5];

  v4 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000691D4;
  v7[3] = &unk_10051B770;
  v7[4] = self;
  v5 = objc_retainBlock(v7);
  v6 = (void *)objc_opt_class(MFPrintTriageInteraction);
  sub_100068C68((id *)&self->super.super.super.super.isa, v6, v4, 0, v5, 0);

}

- (void)_forwardCommandInvoked:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void ***v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void **v16;
  uint64_t v17;
  id *(*v18)(id *, uint64_t, int);
  void *v19;
  ConversationViewController *v20;
  id v21;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController targetMessageForBarButtonTriage](self, "targetMessageForBarButtonTriage"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "itemID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _contentRequestForMessageWithItemID:](self, "_contentRequestForMessageWithItemID:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _getCurrentlySelectedMessageContentForMessageItemID:](self, "_getCurrentlySelectedMessageContentForMessageItemID:", v6));
  v16 = _NSConcreteStackBlock;
  v17 = 3221225472;
  v18 = sub_10006941C;
  v19 = &unk_10051B310;
  v20 = self;
  v9 = v6;
  v21 = v9;
  v10 = objc_retainBlock(&v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase scene](self, "scene", v16, v17, v18, v19, v20));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MFMessageCompositionTriageInteraction interactionWithContentRequest:scene:](MFForwardTriageInteraction, "interactionWithContentRequest:scene:", v7, v11));

  if (v8)
    objc_msgSend(v12, "setOriginalContent:", v8);
  objc_msgSend(v12, "setDelegate:", self);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mailboxes"));
  objc_msgSend(v12, "setMessageSourceMailboxes:", v13);

  objc_msgSend(v12, "setShouldPromptToLoadRestOfMessage:", 0);
  v14 = objc_opt_class(UIBarButtonItem);
  if ((objc_opt_isKindOfClass(v4, v14) & 1) != 0)
    objc_msgSend(v12, "setPresentationSource:", v4);
  else
    objc_msgSend(v12, "setAttachmentPolicy:", 1);
  v15 = objc_msgSend(v12, "alertActionWithCompletion:", v10);
  objc_msgSend(v12, "performInteraction");

}

- (void)_markAsJunkCommandInvoked:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v4 = sub_100067AE4(self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController undoManager](self, "undoManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MFFlagChangeTriageInteraction interactionWithMessageListItemSelection:undoManager:origin:actor:reason:](MFJunkTriageInteraction, "interactionWithMessageListItemSelection:undoManager:origin:actor:reason:", v5, v6, 3, 2, 4));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController selectionDataSource](self, "selectionDataSource"));
  if (objc_msgSend(v8, "shouldUseSelectionDataSourceForConversationViewController:", self))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "messageTriageInteractionHelperForConversationViewController:", self));
    objc_msgSend(v7, "setDelegate:", v9);

  }
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000695DC;
  v11[3] = &unk_10051B798;
  objc_copyWeak(&v13, &location);
  v10 = v8;
  v12 = v10;
  objc_msgSend(v7, "performInteractionWithCompletion:", v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

- (id)_readTriageInteraction
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = sub_100067AE4(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController undoManager](self, "undoManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MFFlagChangeTriageInteraction interactionWithMessageListItemSelection:undoManager:origin:actor:reason:](MFReadTriageInteraction, "interactionWithMessageListItemSelection:undoManager:origin:actor:reason:", v4, v5, 3, 2, 4));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController selectionDataSource](self, "selectionDataSource"));
  if (objc_msgSend(v7, "shouldUseSelectionDataSourceForConversationViewController:", self))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "messageTriageInteractionHelperForConversationViewController:", self));
    objc_msgSend(v6, "setDelegate:", v8);

  }
  return v6;
}

- (id)_messageReadCompletionHandlerForSelectionDataSource:(id)a3
{
  id v4;
  id v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100069820;
  v9[3] = &unk_10051B798;
  objc_copyWeak(&v11, &location);
  v10 = v4;
  v5 = v4;
  v6 = objc_retainBlock(v9);
  v7 = objc_retainBlock(v6);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return v7;
}

- (id)_readActionForMessageListItemSelection:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _readTriageInteraction](self, "_readTriageInteraction", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController selectionDataSource](self, "selectionDataSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _messageReadCompletionHandlerForSelectionDataSource:](self, "_messageReadCompletionHandlerForSelectionDataSource:", v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "menuActionWithPreparation:completion:", 0, v6));

  return v7;
}

- (void)_markAsReadCommandInvoked:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[ConversationViewController _readTriageInteraction](self, "_readTriageInteraction", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController selectionDataSource](self, "selectionDataSource"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _messageReadCompletionHandlerForSelectionDataSource:](self, "_messageReadCompletionHandlerForSelectionDataSource:", v4));
  objc_msgSend(v6, "performInteractionWithCompletion:", v5);

}

- (void)_flagCommandInvoked:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v4 = sub_100067AE4(self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController undoManager](self, "undoManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MFFlagChangeTriageInteraction interactionWithMessageListItemSelection:undoManager:origin:actor:reason:](MFFlagTriageInteraction, "interactionWithMessageListItemSelection:undoManager:origin:actor:reason:", v5, v6, 3, 2, 4));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController selectionDataSource](self, "selectionDataSource"));
  if (objc_msgSend(v8, "shouldUseSelectionDataSourceForConversationViewController:", self))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "messageTriageInteractionHelperForConversationViewController:", self));
    objc_msgSend(v7, "setDelegate:", v9);

  }
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100069E24;
  v11[3] = &unk_10051B798;
  objc_copyWeak(&v13, &location);
  v10 = v8;
  v12 = v10;
  objc_msgSend(v7, "performInteractionWithCompletion:", v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

- (void)_deleteMessageCommandInvoked:(id)a3
{
  -[ConversationViewController _doDeleteSelectedMessagesAskingConfirmation:presentationSourceButtonItem:forceArchive:](self, "_doDeleteSelectedMessagesAskingConfirmation:presentationSourceButtonItem:forceArchive:", 0, 0, 0);
}

- (void)_archiveShortcutInvoked:(id)a3
{
  -[ConversationViewController _doDeleteSelectedMessagesAskingConfirmation:presentationSourceButtonItem:forceArchive:](self, "_doDeleteSelectedMessagesAskingConfirmation:presentationSourceButtonItem:forceArchive:", 0, 0, 1);
}

- (unint64_t)_summarizableMessageCountForItemID:(id)a3
{
  void *v3;
  void *v4;
  unint64_t v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _summarizableMessageItemIDsForSummaryItemID:](self, "_summarizableMessageItemIDsForSummaryItemID:", a3));
  v4 = v3;
  if (v3)
    v5 = (unint64_t)objc_msgSend(v3, "count");
  else
    v5 = 0x7FFFFFFFFFFFFFFFLL;

  return v5;
}

- (id)_summarizableMessageItemIDsForSummaryItemID:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  char *v9;
  void *v10;
  id v11;
  char *v12;
  id v13;
  void *v14;

  v4 = a3;
  v5 = objc_opt_class(MFGeneratedSummaryCollectionItemID);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController collectionViewDataSource](self, "collectionViewDataSource"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "snapshot"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "itemIdentifiers"));

    v9 = (char *)objc_msgSend(v8, "indexOfObject:", v4);
    if (v9 == (char *)0x7FFFFFFFFFFFFFFFLL || (unint64_t)objc_msgSend(v8, "count") < 2)
    {
      v10 = 0;
    }
    else
    {
      v11 = (id)objc_claimAutoreleasedReturnValue(-[ConversationViewController topSummaryItemID](self, "topSummaryItemID"));

      if (v11 == v4)
      {
        v13 = v8;
      }
      else
      {
        if ((id)-[ConversationViewControllerBase conversationSortOrder](self, "conversationSortOrder") == (id)1)
        {
          v12 = v9 + 1;
          v9 = 0;
        }
        else
        {
          v12 = (char *)((_BYTE *)objc_msgSend(v8, "count") - v9);
        }
        v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "subarrayWithRange:", v9, v12));
      }
      v14 = v13;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "ef_filter:", &stru_10051B7B8));

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_manualSummaryContextForItemID:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;

  v4 = a3;
  v5 = objc_opt_class(MFGeneratedSummaryCollectionItemID);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = -[ConversationViewController _summarizableMessageCountForItemID:](self, "_summarizableMessageCountForItemID:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue(-[ConversationViewController inlineSummaryItemID](self, "inlineSummaryItemID"));

    v8 = v4;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController summaryContextByItemID](self, "summaryContextByItemID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v8));

    if (v10)
    {
      objc_msgSend(v10, "setSummarizableMessageCount:", v6);
      v11 = v10;
    }
    else
    {
      location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, self);
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10006A550;
      v16[3] = &unk_10051B7E0;
      objc_copyWeak(&v18, &location);
      v12 = v8;
      v17 = v12;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[EFFuture lazyFutureWithBlock:](EFFuture, "lazyFutureWithBlock:", v16));
      v11 = objc_msgSend(objc_alloc((Class)MUIManualSummaryContext), "initWithSummary:error:summarizableMessageCount:isInlineSummary:summaryControllerFuture:", 0, 0, v6, v7 == v4, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController summaryContextByItemID](self, "summaryContextByItemID"));
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v11, v12);

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_reloadTopSummaryIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController topSummaryItemID](self, "topSummaryItemID"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController collectionViewDataSource](self, "collectionViewDataSource"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "indexPathForItemIdentifier:", v3));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
      v7 = objc_msgSend(v6, "mui_isIndexPathVisible:", v5);

      if ((v7 & 1) != 0)
      {
        v9 = v5;
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
        -[ConversationViewController _reloadCellsAtIndexPaths:animated:](self, "_reloadCellsAtIndexPaths:animated:", v8, 0);

      }
    }

  }
}

- (void)_updateQuickReplyState
{
  void *v3;
  void *v4;

  if (-[ConversationViewControllerBase allowQuickReply](self, "allowQuickReply"))
  {
    -[ConversationViewController _setupQuickReplySupplementaryViewProvider](self, "_setupQuickReplySupplementaryViewProvider");
  }
  else if (_os_feature_enabled_impl("Mail", "QuickReply"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController collectionViewDataSource](self, "collectionViewDataSource"));
    objc_msgSend(v3, "setSupplementaryViewProvider:", 0);

    -[ConversationViewController _resetQuickReplyViewControllerWithReason:resetCompose:override:](self, "_resetQuickReplyViewControllerWithReason:resetCompose:override:", 2, 1, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase conversationLayout](self, "conversationLayout"));
    objc_msgSend(v4, "invalidateLayout");

    -[ConversationViewController _reloadDataSource](self, "_reloadDataSource");
  }
}

- (void)_updateQuickReplyLabelIfNeeded
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[ConversationViewController _quickReplyView](self, "_quickReplyView"));
  -[ConversationViewController _updateQuickReplyLabelIfNeeded:](self, "_updateQuickReplyLabelIfNeeded:");

}

- (void)_updateQuickReplyLabelIfNeeded:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v9 = v4;
    v6 = objc_msgSend(v4, "isComposing");
    v5 = v9;
    if ((v6 & 1) == 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController targetMessageForBarButtonTriage](self, "targetMessageForBarButtonTriage"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[MFComposeMailMessage legacyMessageWithMessage:mailboxUid:skipAttachmentDownload:](MFComposeMailMessage, "legacyMessageWithMessage:mailboxUid:skipAttachmentDownload:", v7, 0, 1));
      objc_msgSend(v9, "updatePlaceholderWithMessage:", v8);

      v5 = v9;
    }
  }

}

- (id)_quickReplyCompositionContext
{
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  NSString *v18;
  NSString *v19;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController targetMessageForBarButtonTriage](self, "targetMessageForBarButtonTriage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "itemID"));
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[ConversationViewController _contentRequestForMessageWithItemID:](self, "_contentRequestForMessageWithItemID:", v5));
    v7 = v6;
    if (v6)
    {
      v8 = objc_claimAutoreleasedReturnValue(-[NSObject message](v6, "message"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mailboxProvider"));

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject mailboxObjectIDs](v8, "mailboxObjectIDs"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "legacyMailboxForObjectID:", v12));

      if (!v13)
      {
        v14 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          sub_1003908A8();

      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[MFComposeMailMessage legacyMessageWithMessage:mailboxUid:skipAttachmentDownload:](MFComposeMailMessage, "legacyMessageWithMessage:mailboxUid:skipAttachmentDownload:", v8, v13, 1));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _getCurrentlySelectedMessageContentForMessageItemID:](self, "_getCurrentlySelectedMessageContentForMessageItemID:", v5));
      v17 = objc_msgSend(objc_alloc((Class)_MFMailCompositionContext), "initReplyAllToMessage:legacyMessage:isEML:", v8, v15, 0);
      objc_msgSend(v17, "setQuickReply:", 1);
      objc_msgSend(v17, "setShowKeyboardImmediately:", 1);
      objc_msgSend(v17, "setOriginalContent:", v16);

    }
    else
    {
      v8 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v19 = NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue(v19);
        sub_100390824();
      }
      v17 = 0;
    }

  }
  else
  {
    v7 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ef_publicDescription"));
      v18 = NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue(v18);
      sub_100390864();
    }
    v17 = 0;
  }

  return v17;
}

- (BOOL)_isQuickReplyMessageAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  char *v6;
  void *v7;
  char *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  BOOL v12;
  unsigned int v13;
  void *v14;
  void *v15;

  v4 = a3;
  if (-[ConversationViewControllerBase allowQuickReply](self, "allowQuickReply"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
    v6 = (char *)objc_msgSend(v5, "numberOfSections");

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
    v8 = (char *)objc_msgSend(v7, "numberOfItemsInSection:", --v6) - 1;

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", v8, v6));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", 0, 0));
    if (-[ConversationViewController _showQuickReplyBelowConversation](self, "_showQuickReplyBelowConversation"))
      v11 = objc_msgSend(v4, "isEqual:", v9);
    else
      v11 = objc_msgSend(v4, "isEqual:", v10);
    v13 = v11;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase quickReplyAnimationContext](self, "quickReplyAnimationContext"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "getObject"));

    if ((v13 & (*(unsigned int (**)(_QWORD, void *))(EFIsNotNull + 16))(EFIsNotNull, v15)) == 1)
      v12 = -[ConversationViewController _userIsSenderAtIndexPath:](self, "_userIsSenderAtIndexPath:", v4);
    else
      v12 = 0;

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)_isUndoSendMessageAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  NSObject *v7;
  id v8;
  id v10;
  int v11;
  id v12;
  __int16 v13;
  ConversationViewController *v14;
  __int16 v15;
  id v16;

  v4 = a3;
  if ((_os_feature_enabled_impl("Mail", "ShowUndoSendInConversation") & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _messageAtIndexPath:](self, "_messageAtIndexPath:", v4));
    if (v5)
    {
      if (-[ConversationViewController _isMessageInOutbox:](self, "_isMessageInOutbox:", v5))
      {
        v6 = sub_10005D484((uint64_t)self);
LABEL_11:

        goto LABEL_12;
      }
      v7 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        v11 = 138412802;
        v12 = (id)objc_opt_class(self);
        v13 = 2048;
        v14 = self;
        v15 = 2112;
        v16 = v4;
        v10 = v12;
        _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "<%@: %p> Message at indexPath=%@ is not in outbox, don't expand to show Undo Send", (uint8_t *)&v11, 0x20u);

      }
    }
    else
    {
      v7 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        v11 = 138412802;
        v12 = (id)objc_opt_class(self);
        v13 = 2048;
        v14 = self;
        v15 = 2112;
        v16 = v4;
        v8 = v12;
        _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "<%@: %p> No message found for indexPath=%@", (uint8_t *)&v11, 0x20u);

      }
    }

    v6 = 0;
    goto LABEL_11;
  }
  v6 = 0;
LABEL_12:

  return v6;
}

- (void)_didChangeHorizontalPadding:(double)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ConversationViewController _quickReplyView](self, "_quickReplyView"));
  objc_msgSend(v4, "setHorizontalInset:", a3);

}

- (CGRect)_quickReplyViewFrame
{
  void *v2;
  void *v3;
  double v4;
  CGFloat x;
  double v6;
  CGFloat y;
  double v8;
  CGFloat width;
  double v10;
  CGFloat height;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _quickReplyView](self, "_quickReplyView"));
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "frame");
    x = v4;
    y = v6;
    width = v8;
    height = v10;
  }
  else
  {
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
  }

  v12 = x;
  v13 = y;
  v14 = width;
  v15 = height;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (BOOL)_userIsSenderAtIndexPath:(id)a3
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
  void *v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  NSObject *v19;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  ConversationViewController *v25;
  __int16 v26;
  id v27;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _messageAtIndexPath:](self, "_messageAtIndexPath:", v4));
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "senderList"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "emailAddressValue"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "simpleAddress"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lowercaseString"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "accountsProvider"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "displayedAccounts"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "allObjects"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "ef_flatMap:", &stru_10051B820));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "ef_mapSelector:", "lowercaseString"));

    v18 = objc_msgSend(v17, "containsObject:", v11);
  }
  else
  {
    v19 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v23 = (id)objc_opt_class(self);
      v24 = 2048;
      v25 = self;
      v26 = 2112;
      v27 = v4;
      v21 = v23;
      _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "<%@: %p> [Quick Reply] No message found for indexPath=%@", buf, 0x20u);

    }
    v18 = 0;
  }

  return v18;
}

- (id)_quickReplyView
{
  void *v3;
  unint64_t v4;
  id *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void **v13;
  uint64_t v14;
  id (*v15)(uint64_t, uint64_t);
  void *v16;
  id v17;
  id v18;

  if (!-[ConversationViewControllerBase allowQuickReply](self, "allowQuickReply"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
  v4 = -[ConversationViewControllerBase conversationSortOrder](self, "conversationSortOrder");
  v5 = (id *)&UICollectionElementKindSectionFooter;
  if (v4)
    v5 = (id *)&UICollectionElementKindSectionHeader;
  v6 = *v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "indexPathsForVisibleSupplementaryElementsOfKind:", v6));
  v13 = _NSConcreteStackBlock;
  v14 = 3221225472;
  v15 = sub_10006B630;
  v16 = &unk_10051B848;
  v8 = v3;
  v17 = v8;
  v9 = v6;
  v18 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ef_compactMap:", &v13));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ef_firstObjectPassingTest:", &stru_10051B888, v13, v14, v15, v16));

  return v11;
}

- (void)_updateQuickReplySendButtonOffset:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;

  v15 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _quickReplyView](self, "_quickReplyView"));
  v5 = objc_claimAutoreleasedReturnValue(-[ConversationViewController quickReplyMailComposeController](self, "quickReplyMailComposeController"));
  v6 = (void *)v5;
  if (v4 && v5)
  {
    v7 = 0.0;
    if (-[ConversationViewController _showQuickReplyBelowConversation](self, "_showQuickReplyBelowConversation"))
    {
      -[ConversationViewControllerBase _itemSpacing](self, "_itemSpacing");
      v7 = v8;
    }
    objc_msgSend(v15, "contentInset");
    v10 = v9;
    objc_msgSend(v15, "contentOffset");
    v12 = v11;
    objc_msgSend(v4, "frame");
    v14 = v7 + v13;
    if (v10 + v12 >= v14)
      objc_msgSend(v4, "updateQuickReplySendButtonTopOffset:", v10 + v12 - v14);
  }

}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  if (-[ConversationViewControllerBase allowQuickReply](self, "allowQuickReply", a3))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController quickReplyMailComposeController](self, "quickReplyMailComposeController"));

    if (!v4)
    {
      +[QuickReplyView defaultHeight](_TtC10MobileMail14QuickReplyView, "defaultHeight");
      -[ConversationViewControllerBase setQuickReplyHeight:](self, "setQuickReplyHeight:");
      v6 = (id)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "collectionViewLayout"));
      objc_msgSend(v5, "invalidateLayout");

    }
  }
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  return (id)objc_claimAutoreleasedReturnValue(-[ConversationViewController animationControllerForTransition:](self, "animationControllerForTransition:", 1, a4, a5));
}

- (id)animationControllerForDismissedController:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(-[ConversationViewController animationControllerForTransition:](self, "animationControllerForTransition:", 0));
}

- (id)animationControllerForTransition:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  id v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _quickReplyView](self, "_quickReplyView"));
  v5 = 0;
  if (v4 && v3)
  {
    v5 = objc_alloc_init((Class)_UISheetAnimationController);
    objc_msgSend(v5, "setIsReversed:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "animationSourceView"));
    objc_msgSend(v5, "setSourceView:", v6);

  }
  return v5;
}

- (id)_fullComposeViewControllerForQuickReply:(id)a3 userActivity:(id)a4
{
  id v6;
  id v7;
  ComposeNavigationController *v8;
  void *v9;
  ComposeNavigationController *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;

  v6 = a3;
  v7 = a4;
  v8 = [ComposeNavigationController alloc];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase scene](self, "scene"));
  v10 = -[ComposeNavigationController initWithUserActivity:scene:](v8, "initWithUserActivity:scene:", v7, v9);

  -[ComposeNavigationController setTransitioningDelegate:](v10, "setTransitioningDelegate:", self);
  -[ComposeNavigationController setModalPresentationStyle:](v10, "setModalPresentationStyle:", 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase scene](self, "scene"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "composeViewDelegateHandler"));
  -[ComposeNavigationController setMailComposeDelegate:](v10, "setMailComposeDelegate:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ComposeNavigationController autosaveIdentifier](v10, "autosaveIdentifier"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "session"));
  objc_msgSend(v14, "mf_setActiveDraftIdentifier:", v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ComposeNavigationController presentationController](v10, "presentationController"));
  v16 = objc_opt_class(UISheetPresentationController);
  if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
  {
    v17 = v15;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "animationSourceView"));
    objc_msgSend(v17, "setSourceView:", v18);

    +[QuickReplyView cornerRadius](_TtC10MobileMail14QuickReplyView, "cornerRadius");
    objc_msgSend(v17, "_setCornerRadiusForPresentationAndDismissal:");
    objc_msgSend(v17, "_setShouldDismissWhenTappedOutside:", 1);

  }
  objc_msgSend(v15, "setDelegate:", self);

  return v10;
}

- (void)_runAlongsideAnimationsForTransition:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  BOOL v10;
  _QWORD v11[4];
  id v12;
  BOOL v13;
  id location;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController transitionCoordinator](self, "transitionCoordinator"));

  if (v5)
  {
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController transitionCoordinator](self, "transitionCoordinator"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10006BCD0;
    v11[3] = &unk_10051B8B0;
    objc_copyWeak(&v12, &location);
    v13 = v3;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10006BD48;
    v8[3] = &unk_10051B8B0;
    objc_copyWeak(&v9, &location);
    v10 = v3;
    objc_msgSend(v6, "animateAlongsideTransition:completion:", v11, v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[ConversationViewController _quickReplyView](self, "_quickReplyView"));
    objc_msgSend(v7, "setHidden:", v3);

  }
}

- (void)_presentationControllerWillDismiss:(id)a3
{
  -[ConversationViewController _runAlongsideAnimationsForTransition:](self, "_runAlongsideAnimationsForTransition:", 0);
}

- (void)_setupQuickReplySupplementaryViewProvider
{
  void *v3;
  void *v4;
  _QWORD *v5;
  UICollectionViewSupplementaryRegistration *v6;
  void *v7;
  UICollectionViewSupplementaryRegistration *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController quickReplyHeaderSupplementaryRegistration](self, "quickReplyHeaderSupplementaryRegistration"));
  if (!v3
    || (v4 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController quickReplyFooterSupplementaryRegistration](self, "quickReplyFooterSupplementaryRegistration")), v4, v3, !v4))
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10006C08C;
    v15[3] = &unk_10051B8D8;
    objc_copyWeak(&v16, &location);
    v5 = objc_retainBlock(v15);
    v6 = +[UICollectionViewSupplementaryRegistration registrationWithSupplementaryClass:elementKind:configurationHandler:](UICollectionViewSupplementaryRegistration, "registrationWithSupplementaryClass:elementKind:configurationHandler:", objc_opt_class(_TtC10MobileMail14QuickReplyView), UICollectionElementKindSectionHeader, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[ConversationViewController setQuickReplyHeaderSupplementaryRegistration:](self, "setQuickReplyHeaderSupplementaryRegistration:", v7);

    v8 = +[UICollectionViewSupplementaryRegistration registrationWithSupplementaryClass:elementKind:configurationHandler:](UICollectionViewSupplementaryRegistration, "registrationWithSupplementaryClass:elementKind:configurationHandler:", objc_opt_class(_TtC10MobileMail14QuickReplyView), UICollectionElementKindSectionFooter, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[ConversationViewController setQuickReplyFooterSupplementaryRegistration:](self, "setQuickReplyFooterSupplementaryRegistration:", v9);

    objc_destroyWeak(&v16);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController collectionViewDataSource](self, "collectionViewDataSource"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "supplementaryViewProvider"));

  if (!v11)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10006C218;
    v13[3] = &unk_10051B900;
    objc_copyWeak(&v14, &location);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController collectionViewDataSource](self, "collectionViewDataSource"));
    objc_msgSend(v12, "setSupplementaryViewProvider:", v13);

    objc_destroyWeak(&v14);
  }
  objc_destroyWeak(&location);
}

- (void)_dismissKeyboardIfNecessary
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[ConversationViewController view](self, "view"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window"));
  objc_msgSend(v2, "endEditing:", 1);

}

- (id)mailComposeViewForQuickReplyView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController quickReplyMailComposeController](self, "quickReplyMailComposeController"));
  objc_msgSend(v5, "removeFromParentViewController");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController quickReplyMailComposeController](self, "quickReplyMailComposeController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
  objc_msgSend(v7, "removeFromSuperview");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase scene](self, "scene"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _quickReplyCompositionContext](self, "_quickReplyCompositionContext"));
  v10 = objc_msgSend(objc_alloc((Class)MFMailComposeController), "initWithCompositionContext:options:", v9, 0);
  -[ConversationViewController setQuickReplyMailComposeController:](self, "setQuickReplyMailComposeController:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "composeViewDelegate"));
  objc_msgSend(v10, "setDelegate:", v11);

  objc_msgSend(v10, "setQuickReplyDelegate:", self);
  objc_msgSend(v10, "setQuickReplyActionButtonProvider:", v4);
  -[ConversationViewController addChildViewController:](self, "addChildViewController:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "view"));

  return v12;
}

- (void)mailComposeViewSnapshotForQuickReplyView:(id)a3 :(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController quickReplyMailComposeController](self, "quickReplyMailComposeController"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10006C6C8;
  v8[3] = &unk_10051B928;
  v7 = v5;
  v9 = v7;
  objc_msgSend(v6, "takeSnapshotWithCompletionHandler:", v8);

}

- (id)displayNameForAddresses:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  v5 = objc_alloc_init((Class)NSMutableArray);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase contactStore](self, "contactStore", (_QWORD)v15));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "displayNameForEmailAddress:", v10));
        objc_msgSend(v5, "addObject:", v12);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", ")));
  return v13;
}

- (void)quickReplyView:(id)a3 didTapExpandButton:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController quickReplyMailComposeController](self, "quickReplyMailComposeController", a3, a4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "composeWebView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getCaretPosition"));

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10006C9C0;
  v8[3] = &unk_10051B950;
  v8[4] = self;
  objc_msgSend(v7, "addSuccessBlock:", v8);

}

- (void)quickReplyView:(id)a3 didTapSendButton:(id)a4 animationContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void **v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  id location;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  ConversationViewController *v27;
  __int16 v28;
  id v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v18 = _NSConcreteStackBlock;
    v19 = 3221225472;
    v20 = sub_10006CD84;
    v21 = &unk_10051B1B8;
    objc_copyWeak(&v22, &location);
    objc_msgSend(v10, "setCompletionBlock:", &v18);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase quickReplyAnimationContext](self, "quickReplyAnimationContext", v18, v19, v20, v21));
    objc_msgSend(v11, "setObject:", v10);

    v12 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_opt_class(self);
      *(_DWORD *)buf = 138412802;
      v25 = v13;
      v26 = 2048;
      v27 = self;
      v28 = 2112;
      v29 = v10;
      v14 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "<%@: %p> [Quick Reply][Send Animation] Did prepare quick-reply send animation with context: %@", buf, 0x20u);

    }
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  v15 = MFComposeLog();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[Quick Reply][Send Animation] Will perform send...", buf, 2u);
  }

  -[ConversationViewControllerBase setIsPerformingQuickReplySendAnimation:](self, "setIsPerformingQuickReplySendAnimation:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController quickReplyMailComposeController](self, "quickReplyMailComposeController"));
  objc_msgSend(v17, "performSend");

}

- (void)mailComposeController:(id)a3 didChangeQuickReplyWebViewHeight:(double)a4
{
  NSObject *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  CGFloat MinX;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  void *v58;
  id v59;
  double v60;
  CGFloat rect;
  CGFloat v62;
  CGFloat v63;
  uint8_t buf[4];
  id v65;
  __int16 v66;
  ConversationViewController *v67;
  __int16 v68;
  double v69;
  __int16 v70;
  double v71;
  CGPoint v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;

  v6 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log", a3));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v59 = (id)objc_opt_class(self);
    -[ConversationViewControllerBase quickReplyHeight](self, "quickReplyHeight");
    *(_DWORD *)buf = 138413058;
    v65 = v59;
    v66 = 2048;
    v67 = self;
    v68 = 2048;
    v69 = a4;
    v70 = 2048;
    v71 = v60;
    _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "<%@: %p> [Quick Reply] Wants to change height to: %f, current height: %f", buf, 0x2Au);

  }
  +[QuickReplyView innerVerticalPadding](_TtC10MobileMail14QuickReplyView, "innerVerticalPadding");
  v8 = v7;
  +[QuickReplyView innerVerticalPadding](_TtC10MobileMail14QuickReplyView, "innerVerticalPadding");
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
  +[QuickReplyView defaultHeight](_TtC10MobileMail14QuickReplyView, "defaultHeight");
  v13 = v8 + a4 + v10;
  if (v13 >= v12)
    v14 = v8 + a4 + v10;
  else
    v14 = v12;
  -[ConversationViewControllerBase quickReplyHeight](self, "quickReplyHeight");
  v16 = v15 - v14;
  if (v16 < 0.0)
    v16 = -v16;
  if (v16 >= 2.22044605e-16)
  {
    -[ConversationViewControllerBase quickReplyHeight](self, "quickReplyHeight");
    v18 = v17;
    -[ConversationViewControllerBase setQuickReplyHeight:](self, "setQuickReplyHeight:", v14);
    v19 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = (void *)objc_opt_class(self);
      *(_DWORD *)buf = 138413058;
      v65 = v20;
      v66 = 2048;
      v67 = self;
      v68 = 2048;
      v69 = v14;
      v70 = 2048;
      v71 = v14 - v18;
      v21 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "<%@: %p> [Quick Reply] Did change height to: %f, delta: %f", buf, 0x2Au);

    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _quickReplyView](self, "_quickReplyView"));
    if (v22)
    {
      if (-[ConversationViewController _showQuickReplyBelowConversation](self, "_showQuickReplyBelowConversation"))
      {
        -[ConversationViewControllerBase _itemSpacing](self, "_itemSpacing");
        v24 = v23;
        objc_msgSend(v11, "mf_visibleFrame");
        v62 = v26;
        v63 = v25;
        rect = v27;
        v29 = v28;
        objc_msgSend(v22, "frame");
        v31 = v30;
        v33 = v32;
        v35 = v34;
        v37 = v36;
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController view](self, "view"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
        objc_msgSend(v38, "convertRect:fromView:", v39, v31, v24 + v33, v35, v37 - v24);
        v41 = v40;
        v43 = v42;
        v45 = v44;
        v47 = v46;

        v73.origin.x = v41;
        v73.origin.y = v43;
        v73.size.width = v45;
        v73.size.height = v47;
        MinX = CGRectGetMinX(v73);
        v74.origin.x = v41;
        v74.origin.y = v43;
        v74.size.width = v45;
        v74.size.height = v47;
        v72.y = CGRectGetMaxY(v74);
        v75.size.height = v24 + v29;
        v75.origin.y = v62;
        v75.origin.x = v63;
        v75.size.width = rect;
        v72.x = MinX;
        LOBYTE(v38) = CGRectContainsPoint(v75, v72);
        objc_msgSend(v11, "contentSize");
        v50 = v49;
        objc_msgSend(v11, "contentInset");
        v52 = v51;
        objc_msgSend(v11, "contentInset");
        v54 = v53;
        objc_msgSend(v11, "frame");
        v56 = v55;
        v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "collectionViewLayout"));
        objc_msgSend(v57, "invalidateLayout");

        if ((v38 & (v13 + v50 + v52 + v54 >= v56)) == 1)
        {
          objc_msgSend(v11, "contentOffset");
          objc_msgSend(v11, "setContentOffset:animated:", 0);
        }
      }
      else
      {
        v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "collectionViewLayout"));
        objc_msgSend(v58, "invalidateLayout");

      }
    }
    -[ConversationViewController _updateQuickReplySendButtonOffset:](self, "_updateQuickReplySendButtonOffset:", v11);

  }
}

- (void)mailComposeController:(id)a3 composeBodyIsEmpty:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  -[ConversationViewController setQuickReplyHasContent:](self, "setQuickReplyHasContent:", !a4);
  v6 = (id)objc_claimAutoreleasedReturnValue(-[ConversationViewController _quickReplyView](self, "_quickReplyView"));
  objc_msgSend(v6, "setQuickReplyPlaceholderLabelState:", v4);

}

- (void)mailComposeController:(id)a3 willMigrateToFullComposeWithReason:(int64_t)a4
{
  NSObject *v5;
  id v6;
  void *v7;
  int v8;
  id v9;
  __int16 v10;
  ConversationViewController *v11;

  if (!a4)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log", a3));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412546;
      v9 = (id)objc_opt_class(self);
      v10 = 2048;
      v11 = self;
      v6 = v9;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "<%@: %p> [Quick Reply] Will add attachment, applying snapshot to view hierarchy", (uint8_t *)&v8, 0x16u);

    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _quickReplyView](self, "_quickReplyView"));
    objc_msgSend(v7, "showSnapshot");

  }
}

- (void)mailComposeController:(id)a3 migrateToFullCompose:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void **v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id location;

  v5 = a4;
  if (+[UIDevice mf_isPad](UIDevice, "mf_isPad"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase scene](self, "scene"));
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10006D7D8;
    v21[3] = &unk_10051B978;
    objc_copyWeak(&v22, &location);
    objc_msgSend(v6, "showComposeWithUserActivity:completion:", v5, v21);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _quickReplyView](self, "_quickReplyView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _fullComposeViewControllerForQuickReply:userActivity:](self, "_fullComposeViewControllerForQuickReply:userActivity:", v6, v5));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "autosaveIdentifier"));
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dockPersistence"));
      objc_msgSend(v10, "removeDockedStateWithIdentifier:sender:", v8, 0);

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase scene](self, "scene"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dockContainer"));
    v15 = _NSConcreteStackBlock;
    v16 = 3221225472;
    v17 = sub_10006D83C;
    v18 = &unk_10051A910;
    v13 = v11;
    v19 = v13;
    v14 = v8;
    v20 = v14;
    objc_msgSend(v12, "presentViewController:animated:completion:", v7, 1, &v15);

    -[ConversationViewController _runAlongsideAnimationsForTransition:](self, "_runAlongsideAnimationsForTransition:", 1, v15, v16, v17, v18);
  }

}

- (void)mailComposeController:(id)a3 isSending:(BOOL)a4
{
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  ConversationViewController *v14;

  v6 = a3;
  if (!a4
    && -[ConversationViewControllerBase isPerformingQuickReplySendAnimation](self, "isPerformingQuickReplySendAnimation"))
  {
    v7 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412546;
      v12 = (id)objc_opt_class(self);
      v13 = 2048;
      v14 = self;
      v8 = v12;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<%@: %p> [Quick Reply][Send Animation] Aborting send animation", (uint8_t *)&v11, 0x16u);

    }
    -[ConversationViewControllerBase setIsPerformingQuickReplySendAnimation:](self, "setIsPerformingQuickReplySendAnimation:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase quickReplyAnimationContext](self, "quickReplyAnimationContext"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    objc_msgSend(v9, "setObject:", v10);

  }
}

- (id)_sheetPresentationControllerViewForTouchContinuation:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "presentedViewController"));
  v4 = objc_opt_class(ComposeNavigationController);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));
  else
    v5 = 0;

  return v5;
}

- (void)disableAutomaticMarkAsReadForMessages:(id)a3
{
  id v4;
  NSMutableSet *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v15;
  void *v16;

  v4 = a3;
  if (!*(NSMutableSet **)((char *)&self->_disabledMarkAsReadMessageItemIDs + 4))
  {
    v5 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v6 = *(NSMutableSet **)((char *)&self->_disabledMarkAsReadMessageItemIDs + 4);
    *(NSMutableSet **)((char *)&self->_disabledMarkAsReadMessageItemIDs + 4) = v5;

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
  v8 = objc_opt_class(EMThread);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0 && objc_msgSend(v4, "count") == (id)1)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase referenceMessageListItem](self, "referenceMessageListItem"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));

    if (v9 == v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController collectionViewDataSource](self, "collectionViewDataSource"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "snapshot"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "itemIdentifiers"));

      goto LABEL_9;
    }
  }
  else
  {

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ef_mapSelector:", "itemID"));
LABEL_9:
  v14 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412290;
    v16 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Disable auto-mark-as-read for itemIDs: %@", (uint8_t *)&v15, 0xCu);
  }

  objc_msgSend(*(id *)((char *)&self->_disabledMarkAsReadMessageItemIDs + 4), "addObjectsFromArray:", v13);
}

- (void)reenableAutomaticMarkAsReadForAllMessages
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  if (*(NSMutableSet **)((char *)&self->_disabledMarkAsReadMessageItemIDs + 4))
  {
    v3 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Leaving the conversation should re-enable automatic mark-as-read", v5, 2u);
    }

    v4 = *(NSMutableSet **)((char *)&self->_disabledMarkAsReadMessageItemIDs + 4);
    *(NSMutableSet **)((char *)&self->_disabledMarkAsReadMessageItemIDs + 4) = 0;

  }
}

- (void)scheduleAutomaticMarkAsReadForViewModel:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "messageContentRequest"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "message"));

  -[ConversationViewController scheduleAutomaticMarkAsReadForMessage:](self, "scheduleAutomaticMarkAsReadForMessage:", v5);
}

- (void)scheduleAutomaticMarkAsReadForMessage:(id)a3
{
  id v4;
  NSMapTable *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v4 = a3;
  if (-[ConversationViewController _shouldAutomaticallyMarkAsReadMessage:](self, "_shouldAutomaticallyMarkAsReadMessage:", v4))
  {
    if (!*(NSMapTable **)((char *)&self->_delayedReadCancelables + 4))
    {
      v5 = (NSMapTable *)objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](NSMapTable, "strongToStrongObjectsMapTable"));
      v6 = *(NSMapTable **)((char *)&self->_delayedReadCancelables + 4);
      *(NSMapTable **)((char *)&self->_delayedReadCancelables + 4) = v5;

    }
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10006DF70;
    v12[3] = &unk_10051B9A0;
    objc_copyWeak(&v14, &location);
    v8 = v4;
    v13 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "afterDelay:performBlock:", v12, 0.66));

    v10 = *(NSMapTable **)((char *)&self->_delayedReadCancelables + 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "itemID"));
    objc_msgSend(v10, "setObject:forKey:", v9, v11);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

}

- (void)scheduleAutomaticMarkAsReadForReferenceMessage
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id location;
  uint8_t buf[4];
  void *v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _indexPathForReferenceMessage](self, "_indexPathForReferenceMessage"));
  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase referenceMessageListItem](self, "referenceMessageListItem"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject displayMessageItemID](v4, "displayMessageItemID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _messageFutureForItemID:](self, "_messageFutureForItemID:", v5));

    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v7 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject displayMessageItemID](v4, "displayMessageItemID"));
      *(_DWORD *)buf = 138412290;
      v16 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ - Scheduling auto-mark-as-read for reference message", buf, 0xCu);

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10006E6F0;
    v12[3] = &unk_10051AFB0;
    objc_copyWeak(&v13, &location);
    objc_msgSend(v6, "onScheduler:addSuccessBlock:", v9, v12);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);

  }
  else
  {
    v4 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase referenceMessageListItem](self, "referenceMessageListItem"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "itemID"));
      *(_DWORD *)buf = 138412290;
      v16 = v11;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ - Do not auto-mark-as-read because indexPath for referenceMessage is nil", buf, 0xCu);

    }
  }

}

- (void)cancelAutomaticMarkAsReadForCellViewModel:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "messageContentRequest"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "message"));

  v5 = *(NSMapTable **)((char *)&self->_delayedReadCancelables + 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "itemID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v6));
  objc_msgSend(v7, "cancel");

  v8 = *(NSMapTable **)((char *)&self->_delayedReadCancelables + 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "itemID"));
  objc_msgSend(v8, "removeObjectForKey:", v9);

}

- (void)invalidateAutomaticMarkAsReadForAllMessages
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->_delayedReadCancelables + 4), "objectEnumerator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allObjects"));
  objc_msgSend(v4, "makeObjectsPerformSelector:", "cancel");

  objc_msgSend(*(id *)((char *)&self->_delayedReadCancelables + 4), "removeAllObjects");
}

- (BOOL)_shouldAutomaticallyMarkAsReadMessage:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  int v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  void *v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  NSObject *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  CGFloat v47;
  double v48;
  CGFloat v49;
  double v50;
  CGFloat v51;
  double v52;
  CGFloat v53;
  CGSize v54;
  double v55;
  CGFloat v56;
  double v57;
  CGFloat v58;
  double v59;
  CGFloat v60;
  double v61;
  CGFloat v62;
  CGFloat Height;
  void *v64;
  CGFloat v65;
  CGFloat v66;
  double v67;
  NSObject *v68;
  CGFloat v69;
  CGFloat v70;
  CGFloat v71;
  CGFloat v72;
  CGRect remainder;
  CGRect buf;
  __int16 v75;
  const char *v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "flags"));
  v6 = objc_msgSend(v5, "read");

  if (v4)
    v7 = v6;
  else
    v7 = 1;
  if (v7 != 1)
  {
    v9 = *(NSMapTable **)((char *)&self->_delayedReadCancelables + 4);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "itemID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v10));

    if (v11)
    {
      v8 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "itemID"));
        sub_100390A40();
      }
      goto LABEL_12;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController collectionViewDataSource](self, "collectionViewDataSource"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "itemID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "indexPathForItemIdentifier:", v15));

    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase previewState](self, "previewState"));
      if ((objc_msgSend(v17, "shouldScheduleMarkMessageAsRead") & 1) != 0)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase cellConfigurator](self, "cellConfigurator"));
        v19 = objc_msgSend(v18, "messageAtIndexPathIsExpandedOrSemiExpanded:", v16);

        if (v19)
        {
          v20 = *(NSMutableSet **)((char *)&self->_disabledMarkAsReadMessageItemIDs + 4);
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "itemID"));
          LOBYTE(v20) = objc_msgSend(v20, "containsObject:", v21);

          if ((v20 & 1) == 0)
          {
            v22 = objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
            -[NSObject mf_visibleBounds](v22, "mf_visibleBounds");
            v29 = v28;
            v31 = v30;
            v33 = v32;
            v35 = v34;
            v36 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase _layoutAttributesForItemAtIndexPath:](self, "_layoutAttributesForItemAtIndexPath:", v16));
            objc_msgSend(v36, "frame");
            v81.origin.x = v37;
            v81.origin.y = v38;
            v81.size.width = v39;
            v81.size.height = v40;
            v77.origin.x = v29;
            v77.origin.y = v31;
            v77.size.width = v33;
            v77.size.height = v35;
            if (CGRectIntersectsRect(v77, v81))
            {
              v41 = objc_claimAutoreleasedReturnValue(-[NSObject cellForItemAtIndexPath:](v22, "cellForItemAtIndexPath:", v16));
              v42 = objc_opt_class(MFExpandedMessageCell);
              if ((objc_opt_isKindOfClass(v41, v42) & 1) == 0)
              {

                goto LABEL_13;
              }
              v43 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject messageViewController](v41, "messageViewController"));
              v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "messageContentView"));

              v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "headerView"));
              v69 = v35;
              v70 = v33;
              v71 = v31;
              v72 = v29;
              objc_msgSend(v45, "frame");
              v47 = v46;
              v49 = v48;
              v51 = v50;
              v53 = v52;

              v54.width = NAN;
              v54.height = NAN;
              buf.origin = (CGPoint)v54;
              buf.size = v54;
              remainder.origin = (CGPoint)v54;
              remainder.size = v54;
              objc_msgSend(v44, "bounds");
              v56 = v55;
              v58 = v57;
              v60 = v59;
              v62 = v61;
              v78.origin.x = v47;
              v78.origin.y = v49;
              v78.size.width = v51;
              v78.size.height = v53;
              Height = CGRectGetHeight(v78);
              v79.origin.x = v56;
              v79.origin.y = v58;
              v79.size.width = v60;
              v79.size.height = v62;
              CGRectDivide(v79, &buf, &remainder, Height, CGRectMinYEdge);
              -[NSObject convertRect:fromView:](v22, "convertRect:fromView:", v44, remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height);

              v64 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
              objc_msgSend(v64, "lineHeight");
              v82.origin.x = UIRectInset(objc_msgSend(v64, "leading"));
              v82.origin.y = v65;
              v82.size.width = v66;
              v82.size.height = fmax(v67, 1.0);
              v80.origin.y = v71;
              v80.origin.x = v72;
              v80.size.height = v69;
              v80.size.width = v70;
              if (CGRectIntersectsRect(v80, v82))
              {
                v27 = 1;
              }
              else
              {
                v68 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
                if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
                {
                  objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "itemID"));
                  sub_1003909C8();
                }

                v27 = 0;
              }

            }
            else
            {
              v41 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
              if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
              {
                objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "itemID"));
                sub_100390A04();
              }
              v27 = 0;
            }

LABEL_35:
            v12 = v27 != 0;
            goto LABEL_14;
          }
          v22 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "itemID"));
            sub_100390978();
          }
LABEL_34:
          v27 = 0;
          goto LABEL_35;
        }
      }
      else
      {

      }
    }
    v22 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "itemID"));
      if (v16)
        v24 = "NO";
      else
        v24 = "YES";
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase previewState](self, "previewState"));
      if (v16)
      {
        self = (ConversationViewController *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase cellConfigurator](self, "cellConfigurator"));
        if (-[ConversationViewController messageAtIndexPathIsExpanded:](self, "messageAtIndexPathIsExpanded:", v16))v26 = "YES";
        else
          v26 = "NO";
      }
      else
      {
        v26 = "UNKNOWN";
      }
      LODWORD(buf.origin.x) = 138413058;
      *(_QWORD *)((char *)&buf.origin.x + 4) = v23;
      WORD2(buf.origin.y) = 2080;
      *(_QWORD *)((char *)&buf.origin.y + 6) = v24;
      HIWORD(buf.size.width) = 2112;
      *(_QWORD *)&buf.size.height = v25;
      v75 = 2080;
      v76 = v26;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%@ - Do not auto-mark-as-read for reasons: indexPath-is-nil: %s, previewState: %@, message-is-expanded: %s", (uint8_t *)&buf, 0x2Au);
      if (v16)

    }
    goto LABEL_34;
  }
  if (!v4)
  {
    v8 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10039094C();
LABEL_12:

  }
LABEL_13:
  v12 = 0;
LABEL_14:

  return v12;
}

- (id)_cellForMessageItemIDIfExpanded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController collectionViewDataSource](self, "collectionViewDataSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathForItemIdentifier:", v4));

  if (v6
    && (v7 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase cellConfigurator](self, "cellConfigurator")),
        v8 = objc_msgSend(v7, "messageAtIndexPathIsExpanded:", v6),
        v7,
        v8))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "cellForItemAtIndexPath:", v6));

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)_shouldShowMailboxForMessage:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (-[ConversationViewControllerBase messagesShowSourceMailbox](self, "messagesShowSourceMailbox"))
  {
    v5 = 1;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mailboxObjectIDs"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase referenceMessageListItem](self, "referenceMessageListItem"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mailboxObjectIDs"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObjectCommonWithArray:", v8));
    v5 = v9 == 0;

  }
  return v5;
}

- (void)swipableCollectionViewLayout:(id)a3 willBeginSwipeAtIndexPath:(id)a4
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase cellExpansionRecognizer](self, "cellExpansionRecognizer", a3, a4));
  objc_msgSend(v4, "cancel");

}

- (id)swipableCollectionViewLayout:(id)a3 leadingSwipeActionsConfigurationForItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  int64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v21;
  void *v22;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _messageAtIndexPath:](self, "_messageAtIndexPath:", v5));
  v7 = v6;
  if (v6 && (objc_msgSend(v6, "isEditable") & 1) == 0)
  {
    v22 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));
    v10 = sub_1001D6D14(0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = +[MFTriageActionUtilities triageActionForActionKey:](MFTriageActionUtilities, "triageActionForActionKey:", v11);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController messageTriageInteractionHelper](self, "messageTriageInteractionHelper"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "cellForItemAtIndexPath:", v5));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "triageInteractionForTriageAction:withMessageListItems:presentationSource:presentingViewController:moveInteractionDelegate:forPreview:origin:", v12, v9, v15, self, self, 0, 3));

    v17 = objc_claimAutoreleasedReturnValue(-[ConversationViewController _swipeActionForTriageInteraction:](self, "_swipeActionForTriageInteraction:", v16));
    v18 = (void *)v17;
    if (v17)
    {
      v21 = v17;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[UISwipeActionsConfiguration configurationWithActions:](UISwipeActionsConfiguration, "configurationWithActions:", v19));

      objc_msgSend(v8, "setPerformsFirstActionWithFullSwipe:", objc_msgSend(v16, "isDestructive") ^ 1);
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)swipableCollectionViewLayout:(id)a3 trailingSwipeActionsConfigurationForItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  int64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _messageAtIndexPath:](self, "_messageAtIndexPath:", v5));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cellForItemAtIndexPath:", v5));

    v8 = objc_opt_class(MFMessageConversationViewCell);
    if ((objc_opt_isKindOfClass(v32, v8) & 1) != 0)
    {
      v9 = v32;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "predictedMailbox"));

      if (!v10)
      {
        v34 = v6;
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v34, 1));
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[MFMoveToPredictionTriageInteraction predictMailboxForMovingMessages:](MFMoveToPredictionTriageInteraction, "predictMailboxForMovingMessages:", v11));
        objc_msgSend(v9, "setPredictedMailbox:", v12);

      }
    }
    v13 = objc_msgSend(v6, "isEditable");
    v33 = v6;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v33, 1));
    v15 = objc_alloc_init((Class)NSMutableArray);
    if ((v13 & 1) != 0 || !objc_msgSend(v6, "shouldArchiveByDefault"))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController undoManager](self, "undoManager"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[MFDestructiveTriageInteraction interactionWithMessageListItems:undoManager:origin:actor:](MFDeleteTriageInteraction, "interactionWithMessageListItems:undoManager:origin:actor:", v14, v16, 3, 2));
    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController undoManager](self, "undoManager"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[MFDestructiveTriageInteraction interactionWithMessageListItems:undoManager:origin:actor:](MFArchiveTriageInteraction, "interactionWithMessageListItems:undoManager:origin:actor:", v14, v16, 3, 2));
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "swipeActionWithPreparation:completion:", 0, 0));
    objc_msgSend(v15, "addObject:", v17);
    if ((v13 & 1) == 0)
    {
      v18 = sub_1001D6DCC(0);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      v20 = +[MFTriageActionUtilities triageActionForActionKey:](MFTriageActionUtilities, "triageActionForActionKey:", v19);

      v21 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController messageTriageInteractionHelper](self, "messageTriageInteractionHelper"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "cellForItemAtIndexPath:", v5));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "triageInteractionForTriageAction:withMessageListItems:presentationSource:presentingViewController:moveInteractionDelegate:forPreview:origin:", v20, v14, v23, self, self, 0, 3));

      v25 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _swipeActionForTriageInteraction:](self, "_swipeActionForTriageInteraction:", v24));
      if (v25)
        objc_msgSend(v15, "addObject:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController undoManager](self, "undoManager"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[MFMoreTriageInteraction interactionWithMessageListItems:undoManager:origin:actor:interactionStyle:](MFMoreTriageInteraction, "interactionWithMessageListItems:undoManager:origin:actor:interactionStyle:", v14, v26, 3, 2, 1));

      objc_msgSend(v27, "setDelegate:", self);
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "swipeAction"));
      objc_msgSend(v15, "addObject:", v28);

    }
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[UISwipeActionsConfiguration configurationWithActions:](UISwipeActionsConfiguration, "configurationWithActions:", v15));
    objc_msgSend(v29, "setPerformsFirstActionWithFullSwipe:", 0);

  }
  else
  {
    v29 = 0;
  }

  return v29;
}

- (BOOL)swipableCollectionViewLayout:(id)a3 shouldAnimateAppearingItemAtIndexPath:(id)a4
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  BOOL v10;
  int v12;
  void *v13;
  __int16 v14;
  ConversationViewController *v15;
  __int16 v16;
  id v17;

  v5 = a4;
  if (-[ConversationViewControllerBase allowQuickReply](self, "allowQuickReply")
    && -[ConversationViewController _isQuickReplyMessageAtIndexPath:](self, "_isQuickReplyMessageAtIndexPath:", v5))
  {
    v6 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (objc_class *)objc_opt_class(self);
      v8 = NSStringFromClass(v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v12 = 138412802;
      v13 = v9;
      v14 = 2048;
      v15 = self;
      v16 = 2112;
      v17 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "<%@: %p> Should animate appearing item at indexPath=%@)", (uint8_t *)&v12, 0x20u);

    }
    v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_swipeActionForTriageInteraction:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[5];

  v4 = a3;
  v5 = objc_opt_class(MFReadTriageInteraction);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10006FB9C;
    v9[3] = &unk_10051B9C8;
    v9[4] = self;
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "swipeActionWithPreparation:completion:", 0, v9));
  }
  else
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "swipeAction"));
  }
  v7 = (void *)v6;

  return v7;
}

- (void)flagButtonTapped:(id)a3
{
  -[ConversationViewController _flagCommandInvoked:](self, "_flagCommandInvoked:", a3);
}

- (void)readButtonTapped:(id)a3
{
  -[ConversationViewController _markAsReadCommandInvoked:](self, "_markAsReadCommandInvoked:", a3);
}

- (void)unreadButtonTapped:(id)a3
{
  -[ConversationViewController _markAsReadCommandInvoked:](self, "_markAsReadCommandInvoked:", a3);
}

- (void)junkButtonTapped:(id)a3
{
  -[ConversationViewController _markAsJunkCommandInvoked:](self, "_markAsJunkCommandInvoked:", a3);
}

- (void)muteButtonTapped:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase referenceMessageListItem](self, "referenceMessageListItem", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController undoManager](self, "undoManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MFConversationFlagTriageInteraction interactionWithReferenceMessage:undoManager:origin:actor:](MFMuteTriageInteraction, "interactionWithReferenceMessage:undoManager:origin:actor:", v4, v5, 3, 2));

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10006FE48;
  v7[3] = &unk_10051B9F0;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v6, "performInteractionWithCompletion:", v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

- (void)laterButtonTapped:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = sub_100070120(self, a3, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100070214;
  v6[3] = &unk_10051B9F0;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v5, "performInteractionWithCompletion:", v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

- (void)conversationNavigationBarItemsManager:(id)a3 validateBarButtonItem:(id)a4 ofType:(int64_t)a5
{
  void *v7;
  unsigned int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  _BOOL4 v29;
  int v30;
  unsigned __int8 v31;
  _BOOL8 v32;
  void *v33;
  int v34;
  int v35;
  id v36;

  v36 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController selectionDataSource](self, "selectionDataSource"));
  v8 = objc_msgSend(v7, "shouldUseSelectionDataSourceForConversationViewController:", self);
  if (v8)
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "messageListItemSelectionForConversationViewController:", self));
  else
    v9 = 0;
  if ((objc_msgSend(v9, "isSelectAll") & 1) != 0)
  {
    v10 = 1;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "messageListItems"));
    v10 = objc_msgSend(v11, "count") != 0;

  }
  switch(a5)
  {
    case 0:
    case 1:
    case 2:
      goto LABEL_16;
    case 3:
    case 4:
    case 5:
    case 12:
    case 13:
    case 14:
      v10 = v8 ^ 1;
      goto LABEL_17;
    case 6:
      v35 = sub_1000705F8(self);
      if (v8)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "messageListItems"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "flagColors"));
        a5 = objc_claimAutoreleasedReturnValue(+[UIColor mf_colorFromFlagColor:](UIColor, "mf_colorFromFlagColor:", objc_msgSend(v14, "firstIndex")));

      }
      else
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase referenceMessageListItem](self, "referenceMessageListItem"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "flagColors"));
        a5 = objc_claimAutoreleasedReturnValue(+[UIColor mf_colorFromFlagColor:](UIColor, "mf_colorFromFlagColor:", objc_msgSend(v13, "firstIndex")));
      }

      sub_100069F30((uint64_t)self, v36, v35, (void *)a5);
      if (v8)
        objc_msgSend(v36, "setEnabled:", v10);
      goto LABEL_33;
    case 7:
      a5 = (int64_t)v36;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", MFImageGlyphRead));
      objc_msgSend((id)a5, "setImage:", v15);

      v16 = _EFLocalizedString(CFSTR("Read"), &unk_10059D2A0, &unk_10059D2A8);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      objc_msgSend((id)a5, "setTitle:", v17);
      v18 = 0;
      goto LABEL_13;
    case 8:
      v19 = v36;
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", MFImageGlyphUnread));
      objc_msgSend(v19, "setImage:", v20);

      v21 = _EFLocalizedString(CFSTR("Unread"), &unk_10059D2A0, &unk_10059D2A8);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v21);
      objc_msgSend(v19, "setTitle:", v17);
      a5 = 0;
      v18 = v19;
LABEL_13:

      if (v8)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "messageTriageInteractionHelperForConversationViewController:", self));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "messageListItems"));
        v24 = objc_msgSend(v22, "flagStateForTriageAction:messageListItems:isSelectAll:supportsSelectAll:", 2, v23, objc_msgSend(v9, "isSelectAll"), 1);

        sub_100069BBC(self, v18, (void *)a5, v24, v10);
      }
      else
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase referenceMessageListItem](self, "referenceMessageListItem"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "flags"));
        sub_100069BBC(self, v18, (void *)a5, (int)objc_msgSend(v33, "read"), v22 != 0);

      }
      goto LABEL_33;
    case 9:
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", MFImageGlyphJunk));
      objc_msgSend(v36, "setImage:", v25);

      v26 = _EFLocalizedString(CFSTR("Junk"), &unk_10059D2A0, &unk_10059D2A8);
      v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      objc_msgSend(v36, "setTitle:", v27);

LABEL_16:
      if ((v8 & 1) != 0)
LABEL_17:
        objc_msgSend(v36, "setEnabled:", v10);
      goto LABEL_34;
    case 10:
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase referenceMessageListItem](self, "referenceMessageListItem"));
      v29 = objc_msgSend(v28, "conversationNotificationLevel") == (id)1;

      sub_10006FF40((uint64_t)self, v36, v29);
      if (!v8)
        goto LABEL_34;
      a5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "messageListItems"));
      objc_msgSend(v36, "setEnabled:", objc_msgSend((id)a5, "count") == (id)1);
      goto LABEL_33;
    case 11:
      if (v8)
      {
        if ((objc_msgSend(v9, "isSelectAll") & 1) == 0)
        {
          v30 = sub_100070730(self);
          sub_1000703BC(self, v36, v30);
        }
        v31 = objc_msgSend(v9, "isSelectAll");
        if ((v31 & 1) != 0)
        {
          v32 = 0;
        }
        else
        {
          a5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "messageListItems"));
          v32 = objc_msgSend((id)a5, "count") == (id)1;
        }
        objc_msgSend(v36, "setEnabled:", v32);
        if ((v31 & 1) == 0)
LABEL_33:

      }
      else
      {
        v34 = sub_100070730(self);
        sub_1000703BC(self, v36, v34);
      }
LABEL_34:

      return;
    default:
      goto LABEL_34;
  }
}

- (void)revealActionsButtonTapped:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_opt_class(MailActionsViewDataSource);
  v5 = v4;
  -[ConversationViewController _presentMailActionsViewControllerFromBarButtonItem:dataSourceClass:includeMessageContentRequest:completionHandler:](self, "_presentMailActionsViewControllerFromBarButtonItem:dataSourceClass:includeMessageContentRequest:completionHandler:");

}

- (void)replyButtonTapped:(id)a3
{
  -[ConversationViewController _replyCommandInvoked:](self, "_replyCommandInvoked:", a3);
}

- (void)replyAllButtonTapped:(id)a3
{
  -[ConversationViewController _replyAllCommandInvoked:](self, "_replyAllCommandInvoked:", a3);
}

- (void)forwardButtonTapped:(id)a3
{
  -[ConversationViewController _forwardCommandInvoked:](self, "_forwardCommandInvoked:", a3);
}

- (void)deleteButtonTapped:(id)a3
{
  -[ConversationViewController _doDeleteSelectedMessagesAskingConfirmation:presentationSourceButtonItem:forceArchive:](self, "_doDeleteSelectedMessagesAskingConfirmation:presentationSourceButtonItem:forceArchive:", 1, a3, 0);
}

- (void)_doDeleteSelectedMessagesAskingConfirmation:(BOOL)a3 presentationSourceButtonItem:(id)a4 forceArchive:(BOOL)a5
{
  _BOOL8 v6;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  NSString *v15;
  NSObject *v16;
  const __CFString *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  _QWORD *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  ConversationViewController *v25;
  _QWORD *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  NSObject *v30;
  id v31;
  id v32;
  char v33;
  _QWORD v34[4];
  id v35;
  id location;
  uint8_t buf[4];
  ConversationViewController *v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  _BOOL4 v42;

  v6 = a3;
  v27 = a4;
  v9 = sub_100067AE4(self);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  if (v10)
  {
    if (a5 || -[ConversationViewController _shouldArchiveByDefault](self, "_shouldArchiveByDefault"))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController undoManager](self, "undoManager"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[MFDestructiveTriageInteraction interactionWithMessageListItemSelection:undoManager:origin:actor:](MFArchiveTriageInteraction, "interactionWithMessageListItemSelection:undoManager:origin:actor:", v10, v11, 3, 2));
      v13 = 1;
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController undoManager](self, "undoManager"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[MFDestructiveTriageInteraction interactionWithMessageListItemSelection:undoManager:origin:actor:](MFDeleteTriageInteraction, "interactionWithMessageListItemSelection:undoManager:origin:actor:", v10, v11, 3, 2));
      v13 = 0;
    }

    v16 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = CFSTR("Delete");
      *(_DWORD *)buf = 134218498;
      v38 = self;
      if (v13)
        v17 = CFSTR("Archive");
      v39 = 2112;
      v40 = (uint64_t)v17;
      v41 = 1024;
      v42 = v6;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "<%p> %@ selected messages. Ask for confirmation? %{BOOL}d", buf, 0x1Cu);
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController selectionDataSource](self, "selectionDataSource"));
    v19 = objc_msgSend(v18, "shouldUseSelectionDataSourceForConversationViewController:", self);
    if (v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "messageTriageInteractionHelperForConversationViewController:", self));
      objc_msgSend(v12, "setDelegate:", v20);

    }
    else
    {
      objc_msgSend(v12, "setDelegate:", self);
    }
    objc_msgSend(v12, "setShouldAskForConfirmation:", v6);
    objc_msgSend(v12, "setPresentationSource:", v27);
    objc_msgSend(v27, "setEnabled:", 0);
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_10007191C;
    v34[3] = &unk_10051B978;
    objc_copyWeak(&v35, &location);
    v21 = objc_retainBlock(v34);
    v22 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "messageListItems"));
      v24 = (void *)v23;
      v25 = (ConversationViewController *)CFSTR("selection data source");
      if (!v19)
        v25 = self;
      *(_DWORD *)buf = 138412546;
      v38 = v25;
      v39 = 2112;
      v40 = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Performing triage interaction with delegate from %@ and selection: %@", buf, 0x16u);

    }
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100071964;
    v28[3] = &unk_10051BAC8;
    objc_copyWeak(&v32, &location);
    v33 = v13;
    v29 = v27;
    v26 = v21;
    v31 = v26;
    v14 = v12;
    v30 = v14;
    -[NSObject performInteractionWithCompletion:](v14, "performInteractionWithCompletion:", v28);

    objc_destroyWeak(&v32);
    objc_destroyWeak(&v35);
    objc_destroyWeak(&location);

  }
  else
  {
    v14 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue(v15);
      sub_100390A7C();
    }
  }

}

- (void)searchMessages:(id)a3
{
  uint64_t v3;
  id v4;

  v3 = sub_10007A80C((uint64_t)self);
  v4 = (id)objc_claimAutoreleasedReturnValue(v3);
  objc_msgSend(v4, "presentFindNavigatorShowingReplace:", 0);

}

- (id)_messageDeletionCompletionHandlerForMenuOwner:(id)a3
{
  id v4;
  id v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD v9[4];
  id v10;
  ConversationViewController *v11;
  id v12;
  id location;

  v4 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100071C28;
  v9[3] = &unk_10051B338;
  objc_copyWeak(&v12, &location);
  v10 = v4;
  v11 = self;
  v5 = v4;
  v6 = objc_retainBlock(v9);
  v7 = objc_retainBlock(v6);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  return v7;
}

- (id)_deleteActionForMessageListItemSelection:(id)a3 menuOwner:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController undoManager](self, "undoManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MFDestructiveTriageInteraction interactionWithMessageListItemSelection:undoManager:origin:actor:](MFDeleteTriageInteraction, "interactionWithMessageListItemSelection:undoManager:origin:actor:", v6, v8, 3, 2));

  objc_msgSend(v9, "setDelegate:", self);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _messageDeletionCompletionHandlerForMenuOwner:](self, "_messageDeletionCompletionHandlerForMenuOwner:", v7));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "menuActionWithPreparation:completion:", 0, v10));

  return v11;
}

- (id)_archiveActionForMessageListItemSelection:(id)a3 menuOwner:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController undoManager](self, "undoManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MFDestructiveTriageInteraction interactionWithMessageListItemSelection:undoManager:origin:actor:](MFArchiveTriageInteraction, "interactionWithMessageListItemSelection:undoManager:origin:actor:", v6, v8, 3, 2));

  objc_msgSend(v9, "setDelegate:", self);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _messageDeletionCompletionHandlerForMenuOwner:](self, "_messageDeletionCompletionHandlerForMenuOwner:", v7));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "menuActionWithPreparation:completion:", 0, v10));

  objc_msgSend(v11, "setAttributes:", (unint64_t)objc_msgSend(v11, "attributes") ^ 2);
  return v11;
}

- (id)deleteButtonMenuForConversationNavigationBarItemsManager:(id)a3 menuOwner:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v5 = a4;
  v6 = sub_100067AE4(self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _deleteActionForMessageListItemSelection:menuOwner:](self, "_deleteActionForMessageListItemSelection:menuOwner:", v7, v5));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _archiveActionForMessageListItemSelection:menuOwner:](self, "_archiveActionForMessageListItemSelection:menuOwner:", v7, v5));
  v13[0] = v9;
  v13[1] = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 2));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:children:](UIMenu, "menuWithTitle:children:", &stru_100531B00, v10));

  return v11;
}

- (void)moveButtonTapped:(id)a3
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  unsigned int v16;
  unsigned int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;

  v5 = a3;
  v6 = sub_100067AE4(self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (v7)
  {
    v8 = objc_claimAutoreleasedReturnValue(-[ConversationViewController selectionDataSource](self, "selectionDataSource"));
    if (-[NSObject shouldUseSelectionDataSourceForConversationViewController:](v8, "shouldUseSelectionDataSourceForConversationViewController:", self))
    {
      -[NSObject conversationViewController:performTriageAction:presentationSource:](v8, "conversationViewController:performTriageAction:presentationSource:", self, 7, v5);
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase referenceMessageListItem](self, "referenceMessageListItem"));
      v11 = v10;
      if (v10
        && (v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "displayMessage")),
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "result")),
            v13,
            v12,
            v13))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController predictedMailboxForConversation](self, "predictedMailboxForConversation"));
        v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "resultIfAvailable"));

        v16 = -[ConversationViewControllerBase shouldHideStickyFooterView](self, "shouldHideStickyFooterView");
        if (v15)
          v17 = v16;
        else
          v17 = 0;
        if (v17 == 1)
        {
          v18 = objc_opt_class(MailMoveActionsViewDataSource);
          v26[0] = _NSConcreteStackBlock;
          v26[1] = 3221225472;
          v26[2] = sub_10007246C;
          v26[3] = &unk_10051BAA0;
          v26[4] = self;
          v27 = v5;
          -[ConversationViewController _presentMailActionsViewControllerFromBarButtonItem:dataSourceClass:includeMessageContentRequest:completionHandler:](self, "_presentMailActionsViewControllerFromBarButtonItem:dataSourceClass:includeMessageContentRequest:completionHandler:", v27, v18, 0, v26);

        }
        else
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "messageListItems"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController undoManager](self, "undoManager"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[MFMoveToPredictionTriageInteraction interactionWithMessageListItems:undoManager:origin:actor:presentationSource:delegate:presentingViewController:predictedMailbox:](MFMoveToPredictionTriageInteraction, "interactionWithMessageListItems:undoManager:origin:actor:presentationSource:delegate:presentingViewController:predictedMailbox:", v19, v20, 3, 2, v5, self, self, v15));

          v23[0] = _NSConcreteStackBlock;
          v23[1] = 3221225472;
          v23[2] = sub_1000725A4;
          v23[3] = &unk_10051BAF0;
          v23[4] = self;
          v24 = v5;
          v25 = v21;
          v22 = v21;
          objc_msgSend(v22, "performInteractionWithCompletion:", v23);

        }
      }
      else
      {
        v15 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          sub_100390ABC();
      }

    }
  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue(v9);
      sub_100390A7C();
    }
  }

}

- (id)_createMailActionViewHeader
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double Width;
  MailActionViewHeader *v8;
  void *v9;
  void *v10;
  CGRect v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase displayMetrics](self, "displayMetrics"));
  +[MailActionViewHeader defaultHeightWithDisplayMetrics:](MailActionViewHeader, "defaultHeightWithDisplayMetrics:", v3);
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController view](self, "view"));
  objc_msgSend(v6, "frame");
  Width = CGRectGetWidth(v12);

  v8 = -[MailActionViewHeader initWithFrame:]([MailActionViewHeader alloc], "initWithFrame:", 0.0, 0.0, Width, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase contactStore](self, "contactStore"));
  -[MFMessageConversationViewCell setContactStore:](v8, "setContactStore:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MFMessageDisplayMetrics mf_actionCardMetricsFromDisplayMetrics:](MFMessageDisplayMetrics, "mf_actionCardMetricsFromDisplayMetrics:", v3));
  -[MFConversationViewCell setDisplayMetrics:](v8, "setDisplayMetrics:", v10);

  return v8;
}

- (void)_presentMailActionsViewControllerFromBarButtonItem:(id)a3 dataSourceClass:(id)a4 includeMessageContentRequest:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  uint64_t (**v12)(_QWORD, id);
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  ConversationCellViewModel *v23;
  ConversationCellViewModel *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  MailActionsViewController *v30;
  MailActionsViewController *v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  _BOOL8 v36;
  MFTriageInteractionTarget *v37;
  void *v38;
  void *v39;
  MFTriageInteractionTarget *v40;
  void *v41;
  id v42;
  MFTriageInteractionTarget *v43;
  id v44;
  id v45;
  id v46;
  void *v47;
  id v48;
  void *v49;
  NSObject *v50;
  uint64_t (**v51)(_QWORD, id);
  void *v52;
  void *v53;
  _QWORD v54[5];
  id v55;
  MFTriageInteractionTarget *v56;
  id v57;
  id v58;
  _QWORD v59[4];
  id v60;
  id location;
  _QWORD v62[4];
  id v63;
  ConversationViewController *v64;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = (uint64_t (**)(_QWORD, id))a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController targetMessageForBarButtonTriage](self, "targetMessageForBarButtonTriage"));
  if (v13)
  {
    -[ConversationViewController setSelectedMessage:](self, "setSelectedMessage:", v13);
    v14 = objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase referenceMessageListItem](self, "referenceMessageListItem"));
    v15 = v14;
    if (v14
      && (v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject displayMessage](v14, "displayMessage")),
          v16,
          v16))
    {
      v53 = v10;
      v48 = v11;
      v51 = v12;
      if (v7)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "itemID"));
        v18 = objc_claimAutoreleasedReturnValue(-[ConversationViewController _contentRequestForMessageWithItemID:](self, "_contentRequestForMessageWithItemID:", v17));

        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "itemID"));
        v49 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _getCurrentlySelectedMessageContentForMessageItemID:](self, "_getCurrentlySelectedMessageContentForMessageItemID:", v19));

      }
      else
      {
        v49 = 0;
        v18 = 0;
      }
      v50 = v18;
      v52 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _createMailActionViewHeader](self, "_createMailActionViewHeader"));
      if (-[ConversationViewController _isDisplayingSingleMessage](self, "_isDisplayingSingleMessage") || v7)
      {
        v23 = [ConversationCellViewModel alloc];
        v62[0] = _NSConcreteStackBlock;
        v62[1] = 3221225472;
        v62[2] = sub_100072EF8;
        v62[3] = &unk_10051B0F0;
        v63 = v13;
        v64 = self;
        v24 = -[ConversationCellViewModel initWithBuilder:](v23, "initWithBuilder:", v62);
        objc_msgSend(v52, "setViewModel:", v24);

        v25 = v63;
      }
      else
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("MESSAGE_COUNT_FORMAT%1$lu"), &stru_100531B00, CFSTR("Main")));
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v27, -[NSObject count](v15, "count")));

        v28 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase conversationSubject](self, "conversationSubject"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[ECSubjectFormatter subjectStringForDisplayForSubject:style:](ECSubjectFormatter, "subjectStringForDisplayForSubject:style:", v28, 1));

        objc_msgSend(v52, "updateTitle:subject:", v25, v29);
      }

      location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, self);
      v30 = [MailActionsViewController alloc];
      v59[0] = _NSConcreteStackBlock;
      v59[1] = 3221225472;
      v59[2] = sub_100073040;
      v59[3] = &unk_10051B1B8;
      objc_copyWeak(&v60, &location);
      v31 = -[MailActionsViewController initWithDelegate:messageHeaderView:didDismissHandler:](v30, "initWithDelegate:messageHeaderView:didDismissHandler:", self, v52, v59);
      v32 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v31);
      objc_msgSend(v32, "setModalPresentationStyle:", 7);
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "presentationController"));
      objc_msgSend(v33, "setDelegate:", self);

      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "popoverPresentationController"));
      objc_msgSend(v53, "mui_setAsSourceForPopoverPresentationController:", v34);

      v35 = v51[2](v51, v31);
      v47 = (void *)objc_claimAutoreleasedReturnValue(v35);
      v36 = -[NSObject count](v15, "count") != (id)1;
      v37 = [MFTriageInteractionTarget alloc];
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject displayMessage](v15, "displayMessage"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "result"));
      v40 = -[MFTriageInteractionTarget initWithMessageListItem:primaryMessage:selectedMessageContent:primaryMessageContentRequest:targetPreference:preferQuickCompositionalActions:](v37, "initWithMessageListItem:primaryMessage:selectedMessageContent:primaryMessageContentRequest:targetPreference:preferQuickCompositionalActions:", v15, v39, v49, v50, v36, 0);

      v41 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase delegate](self, "delegate"));
      v42 = objc_msgSend(v11, "alloc");
      v54[0] = _NSConcreteStackBlock;
      v54[1] = 3221225472;
      v54[2] = sub_10007308C;
      v54[3] = &unk_10051BB18;
      v54[4] = self;
      v55 = v53;
      v43 = v40;
      v56 = v43;
      v44 = v47;
      v58 = v44;
      v45 = v41;
      v57 = v45;
      v46 = objc_msgSend(v42, "initWithBuilderBlock:", v54);
      -[MailActionsViewController setDataSource:](v31, "setDataSource:", v46);

      -[ConversationViewControllerBase presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v32, 1, 0);
      objc_destroyWeak(&v60);
      objc_destroyWeak(&location);

      v10 = v53;
      v11 = v48;
      v20 = v50;
      v12 = v51;
    }
    else
    {
      v20 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        sub_100390B8C();
    }

  }
  else
  {
    v15 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_100390B20(v15, v21, v22);
  }

}

- (void)presentTransferUIWithMoveInteraction:(id)a3 prediction:(id)a4 fromViewController:(id)a5 didDismissHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void ***v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void **v25;
  uint64_t v26;
  id (*v27)(uint64_t, uint64_t);
  void *v28;
  id v29;

  v10 = a3;
  v23 = a4;
  v11 = a5;
  v12 = a6;
  v25 = _NSConcreteStackBlock;
  v26 = 3221225472;
  v27 = sub_100073370;
  v28 = &unk_10051BB40;
  v13 = v10;
  v29 = v13;
  v14 = objc_retainBlock(&v25);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase referenceMessageListItem](self, "referenceMessageListItem"));
  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "messageListItemSelection"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "messageListItems"));
    v18 = objc_msgSend(v17, "em_messageListItemTotalCount");
    v19 = v18 == objc_msgSend(v15, "count");

  }
  else
  {
    v19 = 1;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "messageListItemSelection", v23, v25, v26, v27, v28));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "messageListItems"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "presentationSource"));
  sub_10007337C(self, v21, v24, v11, v22, v19, v14, v12);

}

- (id)moreTriageInteraction:(id)a3 actionsViewControllerWithInteractionTarget:(id)a4 didDismissHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v25;
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "messageListItem"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "itemID"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController collectionViewDataSource](self, "collectionViewDataSource"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "indexPathForItemIdentifier:", v12));

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "cellForItemAtIndexPath:", v14));

  v17 = objc_opt_class(MFMessageConversationViewCell);
  if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0)
  {
    v26 = v10;
    v18 = v16;
    v25 = v8;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "primaryMessage"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "primaryMessageContentRequest"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "predictedMailbox"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "presentationSource"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _actionsViewControllerWithMessage:contentRequest:predictedMailbox:button:didDismissHandler:](self, "_actionsViewControllerWithMessage:contentRequest:predictedMailbox:button:didDismissHandler:", v19, v20, v21, v22, v26));

    v8 = v25;
    v10 = v26;
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (id)messageRepositoryForTriageInteraction:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(-[ConversationViewController messageRepository](self, "messageRepository", a3));
}

- (id)transferStackViewController:(id)a3 displayMessageForMessageListItemWithItemID:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController messageList](self, "messageList"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "messageListItemForItemID:", v5));

  return v7;
}

- (id)transferStackViewController:(id)a3 itemIDsToDisplayFromItemIDs:(id)a4
{
  return a4;
}

- (void)datePickerViewController:(id)a3 didSelectDate:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "type");
  if (!v8)
  {
    v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "message"));
    sub_10007416C(self, v7, v12);
LABEL_7:

    goto LABEL_8;
  }
  if (v8 == (id)1)
  {
    v9 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      sub_100390C58();

    v10 = objc_alloc((Class)NSArray);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase referenceMessageListItem](self, "referenceMessageListItem"));
    v12 = objc_msgSend(v10, "initWithObjects:", v11, 0);

    v13 = objc_msgSend(objc_alloc((Class)EMMessageReadLaterAction), "initWithMessageListItems:origin:actor:readLaterDate:", v12, 3, 2, v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController messageRepository](self, "messageRepository"));
    objc_msgSend(v14, "performMessageChangeAction:", v13);

    goto LABEL_7;
  }
LABEL_8:
  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);
  -[ConversationViewController _reloadDataSource](self, "_reloadDataSource");

}

- (void)datePickerViewControllerDidDeleteDate:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;

  v4 = a3;
  v5 = objc_alloc((Class)NSArray);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase referenceMessageListItem](self, "referenceMessageListItem"));
  v7 = objc_msgSend(v5, "initWithObjects:", v6, 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "message"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sendLaterDate"));

  if (v9)
  {
    sub_10007416C(self, 0, v8);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "readLater"));

    if (v10)
    {
      v11 = objc_msgSend(objc_alloc((Class)EMMessageReadLaterAction), "initWithMessageListItems:origin:actor:readLaterDate:", v7, 3, 2, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController messageRepository](self, "messageRepository"));
      objc_msgSend(v12, "performMessageChangeAction:", v11);

      sub_100074758(self, v8, &stru_10051BC68);
    }
    else
    {
      v13 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ef_publicDescription"));
        sub_100390C90();
      }

    }
  }
  -[ConversationViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)_headerView:(id)a3 displayWithBannerForViewModel:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "displayMessageUsingViewModel:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "headerBlocks"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ef_firstObjectPassingTest:", &stru_10051BCF8));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "viewModel"));
    v9 = -[ConversationViewController _shouldRemoveBannerBlock:forHeaderViewModel:](self, "_shouldRemoveBannerBlock:forHeaderViewModel:", v7, v8);

    if (v9)
      objc_msgSend(v10, "removeHeaderBlock:animated:", v7, 1);
  }

}

- (id)presentingViewControllerForTriageInteraction:(id)a3
{
  void *v4;
  ConversationViewController *v5;
  void *v6;
  ConversationViewController *v7;
  void *v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController presentingViewController](self, "presentingViewController", a3));

  if (v4)
  {
    v5 = self;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController presentedViewController](self, "presentedViewController"));

    if (!v6)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase scene](self, "scene"));
      v7 = (ConversationViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mf_rootViewController"));

      return v7;
    }
    v5 = (ConversationViewController *)objc_claimAutoreleasedReturnValue(-[ConversationViewController presentedViewController](self, "presentedViewController"));
  }
  v7 = v5;
  return v7;
}

- (void)_testReplyForSelectedMessage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = (id)objc_claimAutoreleasedReturnValue(-[ConversationViewController targetMessageForBarButtonTriage](self, "targetMessageForBarButtonTriage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "itemID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _contentRequestForMessageWithItemID:](self, "_contentRequestForMessageWithItemID:", v3));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase scene](self, "scene"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MFMessageCompositionTriageInteraction interactionWithContentRequest:scene:](MFReplyTriageInteraction, "interactionWithContentRequest:scene:", v4, v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase referenceMessageListItem](self, "referenceMessageListItem"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mailboxes"));
  objc_msgSend(v6, "setMessageSourceMailboxes:", v8);

  objc_msgSend(v6, "setShouldPromptToLoadRestOfMessage:", 0);
  objc_msgSend(v6, "performInteraction");

}

- (MessageTriageInteractionHelper)messageTriageInteractionHelper
{
  void *v3;
  MessageTriageInteractionHelper *v4;
  void *v5;
  MessageTriageInteractionHelper *v6;
  void *v7;

  v3 = *(MessageTriageInteractionHelper **)((char *)&self->_messageTriageInteractionHelper + 4);
  if (!v3)
  {
    v4 = [MessageTriageInteractionHelper alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase scene](self, "scene"));
    v6 = -[MessageTriageInteractionHelper initWithDataSource:triageInteractionDelegate:scene:](v4, "initWithDataSource:triageInteractionDelegate:scene:", self, self, v5);
    v7 = *(MessageTriageInteractionHelper **)((char *)&self->_messageTriageInteractionHelper + 4);
    *(MessageTriageInteractionHelper **)((char *)&self->_messageTriageInteractionHelper + 4) = v6;

    v3 = *(MessageTriageInteractionHelper **)((char *)&self->_messageTriageInteractionHelper + 4);
  }
  return (MessageTriageInteractionHelper *)v3;
}

- (id)messageContentRepresentationRequestForMessageTriageInteractionHelper:(id)a3 message:(id)a4
{
  void *v5;
  void *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "itemID", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _contentRequestForMessageWithItemID:](self, "_contentRequestForMessageWithItemID:", v5));

  return v6;
}

- (id)messageTriageInteractionHelper:(id)a3 senderRepositoryForMessageListItems:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase scene](self, "scene", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "daemonInterface"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "senderRepository"));

  return v6;
}

- (void)_scrolledToEndOfSingleMessage
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase referenceMessageListItem](self, "referenceMessageListItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "displayMessageItemID"));

  if (v4)
  {
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _messageFutureForItemID:](self, "_messageFutureForItemID:", v4));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10007500C;
    v6[3] = &unk_10051AFB0;
    objc_copyWeak(&v7, &location);
    objc_msgSend(v5, "addSuccessBlock:", v6);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }

}

- (void)_updateFooterViewFrameForCell:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = objc_opt_class(MFExpandedMessageCell);
  if ((objc_opt_isKindOfClass(v7, v4) & 1) != 0
    && !-[ConversationViewControllerBase shouldHideStickyFooterView](self, "shouldHideStickyFooterView"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathForCell:", v7));

    -[ConversationViewController _updateFooterViewFrameForCell:atIndexPath:](self, "_updateFooterViewFrameForCell:atIndexPath:", v7, v6);
  }

}

- (void)_updateFooterToShowUndoSendForCell:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  if ((_os_feature_enabled_impl("Mail", "ShowUndoSendInConversation") & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "indexPathForCell:", v15));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "messageViewController"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "messageContentView"));
      v8 = objc_msgSend(v7, "showMessageFooter");

      if ((v8 & 1) != 0)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "messageViewController"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "messageContentView"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "footerView"));

        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "messageViewController"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "contentRequest"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "message"));
        objc_msgSend(v11, "setUndoSendButtonHidden:", -[ConversationViewController _isMessageInOutbox:](self, "_isMessageInOutbox:", v14) ^ 1);

      }
    }

  }
}

- (void)_updateFooterViewFrameForCell:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  unsigned __int8 v8;
  char v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double MaxY;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double Height;
  double v42;
  __n128 v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v59;
  double v60;
  double v61;
  void *v62;
  double v63;
  double v64;
  double v65;
  BOOL v66;
  double v67;
  void *v68;
  void *v69;
  double v70;
  double v71;
  unsigned int v72;
  void *v73;
  id v74;
  uint64_t v75;
  double v76;
  double v77;
  double v78;
  double MinY;
  double v80;
  double v81;
  double v82;
  double rect1;
  void *v84;
  void *v85;
  _QWORD v86[4];
  id v87;
  double v88;
  _QWORD v89[4];
  id v90;
  double v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;

  v6 = a3;
  v7 = a4;
  v8 = -[ConversationViewControllerBase shouldHideStickyFooterView](self, "shouldHideStickyFooterView");
  if (v7)
    v9 = v8;
  else
    v9 = 1;
  if ((v9 & 1) == 0)
  {
    if (objc_msgSend(v6, "expanded"))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "messageViewController"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "messageContentView"));
      v12 = objc_msgSend(v11, "showMessageFooter");

      if ((v12 & 1) != 0)
      {
        v85 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase displayMetrics](self, "displayMetrics"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
        v84 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase _layoutAttributesForItemAtIndexPath:](self, "_layoutAttributesForItemAtIndexPath:", v7));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "messageViewController"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "messageContentView"));

        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "footerView"));
        objc_msgSend(v16, "frame");
        v81 = v17;
        v82 = v18;
        rect1 = v19;
        objc_msgSend(v85, "estimatedFooterViewHeight");
        v80 = v20;
        objc_msgSend(v13, "frame");
        MaxY = CGRectGetMaxY(v92);
        objc_msgSend(v85, "cellHeightToStartScroll");
        v23 = v22;
        objc_msgSend(v84, "frame");
        v25 = v24;
        v27 = v26;
        v29 = v28;
        v31 = v30;
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController view](self, "view"));
        objc_msgSend(v13, "convertRect:toView:", v32, v25, v27, v29, v31);
        v34 = v33;
        v36 = v35;
        v38 = v37;
        v40 = v39;

        v93.origin.x = v34;
        v93.origin.y = v36;
        v93.size.width = v38;
        v93.size.height = v40;
        MinY = CGRectGetMinY(v93);
        v94.origin.x = v34;
        v94.origin.y = v36;
        v94.size.width = v38;
        v94.size.height = v40;
        Height = CGRectGetHeight(v94);
        objc_msgSend(v6, "frame");
        v42 = MaxY - v80;
        v44 = fmax(Height, CGRectGetHeight(v95)) - v80;
        if (v44 >= v23)
        {
          objc_msgSend(v13, "bounds");
          v45 = CGRectGetHeight(v96);
          v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "superview"));
          objc_msgSend(v6, "convertPoint:fromView:", v46, 0.0, v42);
          v42 = v47;

          if (MinY >= v45 - v23)
            v44 = v23;
          else
            v44 = fmin(fmax(v42, v23), v44);
        }
        v43.n128_f64[0] = v44;
        v48 = UIRoundToViewScale(v6, v43);
        objc_msgSend(v16, "frame");
        v102.origin.x = v49;
        v102.origin.y = v50;
        v102.size.width = v51;
        v102.size.height = v52;
        v97.origin.x = v81;
        v97.size.height = v82;
        v97.origin.y = v48;
        v97.size.width = rect1;
        if (!CGRectEqualToRect(v97, v102))
          objc_msgSend(v16, "setFrame:", v81, v48, rect1, v82);
        objc_msgSend(v85, "footerViewButtonsAnimationOffset", *(_QWORD *)&MinY);
        v54 = v53;
        objc_msgSend(v13, "frame");
        v55 = CGRectGetMaxY(v98);
        v99.origin.x = v34;
        v99.origin.y = v36;
        v99.size.width = v38;
        v99.size.height = v40;
        v56 = v55 - CGRectGetMaxY(v99);
        if (v56 <= v54)
          v57 = 0.0;
        else
          v57 = v54;
        if (v56 > v54 || v56 < 0.0)
          v56 = v57;
        objc_msgSend(v16, "moveOriginYByOffset:", v56);
        v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "scrollView"));
        objc_msgSend(v59, "contentSize");
        v61 = v60;
        v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "scrollView"));
        objc_msgSend(v62, "contentInset");
        v64 = v63;
        v100.origin.x = v34;
        v100.origin.y = v36;
        v100.size.width = v38;
        v100.size.height = v40;
        v65 = CGRectGetMinY(v100);

        if (v44 >= v42)
        {
          v68 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
          objc_msgSend(v68, "frame");
          v66 = v80 + v61 + v64 + v65 >= CGRectGetMaxY(v101);

          if (v66)
            v67 = 1.0;
          else
            v67 = 0.0;
        }
        else
        {
          v66 = 0;
          v67 = 0.0;
        }
        v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "backgroundView"));
        objc_msgSend(v69, "alpha");
        v71 = v70;

        if (v71 != v67)
        {
          v89[0] = _NSConcreteStackBlock;
          v89[1] = 3221225472;
          v89[2] = sub_1000759F8;
          v89[3] = &unk_10051ABD8;
          v90 = v16;
          v91 = v67;
          +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v89, 0.2);

        }
        if (_os_feature_enabled_impl("Mail", "ShowUndoSendInConversation"))
          v72 = objc_msgSend(v16, "isUndoSendButtonHidden") ^ 1;
        else
          v72 = 0;
        v73 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase cellConfigurator](self, "cellConfigurator"));
        v74 = objc_msgSend(v73, "expansionStatusForMessageAtIndexPath:", v7);

        if (v74 == (id)2)
        {
          v75 = 0;
        }
        else if (-[ConversationViewController _isDisplayingSingleMessage](self, "_isDisplayingSingleMessage"))
        {
          v75 = 1;
        }
        else
        {
          v75 = objc_msgSend(v15, "automaticallyCollapseQuotedContent") ^ 1 | v72;
        }
        objc_msgSend(v16, "setIsSemiExpanded:", v74 == (id)2);
        objc_msgSend(v16, "setSeeMoreButtonHidden:", v75);
        if (v66 || (objc_msgSend(v16, "seeMoreButtonHeight"), v77 = 1.0, v44 > v42 + v76))
          v77 = 0.0;
        if ((objc_msgSend(v16, "isSeeMoreButtonHidden") & 1) == 0)
        {
          objc_msgSend(v16, "seeMoreButtonAlpha");
          if (v78 != v77)
          {
            v86[0] = _NSConcreteStackBlock;
            v86[1] = 3221225472;
            v86[2] = sub_100075A54;
            v86[3] = &unk_10051ABD8;
            v87 = v16;
            v88 = v77;
            +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v86, 0.2);

          }
        }
        objc_msgSend(v16, "setAllowsPointerSnapping:", v66);

      }
    }
  }

}

- (void)_updateFooterViewFrameForVisibleCells
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "visibleCells"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100075B00;
  v5[3] = &unk_10051BD20;
  v5[4] = self;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);

}

- (id)captureRestorationState
{
  void *v3;
  unsigned __int8 v4;
  _QWORD v6[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase delegate](self, "delegate"));
  v4 = objc_msgSend(v3, "conversationViewControllerIsResultOfSearch:", self);

  if ((v4 & 1) != 0)
    return 0;
  -[ConversationViewController pinCurrentItem](self, "pinCurrentItem");
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100075C24;
  v6[3] = &unk_10051BD48;
  v6[4] = self;
  return (id)objc_claimAutoreleasedReturnValue(+[ConversationViewRestorationState stateWithBuilder:](ConversationViewRestorationState, "stateWithBuilder:", v6));
}

- (void)restoreState:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[8];

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v4 != 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Restore state? %{BOOL}d", buf, 8u);
  }

  -[ConversationViewControllerBase setRestorationFuture:](self, "setRestorationFuture:", v4);
  *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100076038;
  v10[3] = &unk_10051BD70;
  objc_copyWeak(&v11, (id *)buf);
  objc_msgSend(v4, "onScheduler:addSuccessBlock:", v6, v10);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000764B4;
  v8[3] = &unk_10051BD98;
  objc_copyWeak(&v9, (id *)buf);
  objc_msgSend(v4, "onScheduler:addFailureBlock:", v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);

}

- (id)newBackgroundMonitor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  MailSceneBackgroundQueryMonitor *v7;
  void *v8;
  void *v9;
  void *v10;
  MailSceneBackgroundQueryMonitor *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController messageList](self, "messageList"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "visibleCells"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ef_compactMap:", &stru_10051BDD8));

    if (objc_msgSend(v6, "count"))
    {
      v7 = [MailSceneBackgroundQueryMonitor alloc];
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase scene](self, "scene"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "daemonInterface"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "messageRepository"));
      v11 = -[MailSceneBackgroundQueryMonitor initWithMessageListItems:messageList:messageRepository:changeTypes:](v7, "initWithMessageListItems:messageList:messageRepository:changeTypes:", v6, v3, v10, 8);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_updateStickySubjectForItemID:(id)a3 cell:(id)a4 indexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[5];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[ConversationViewController _isDisplayingSingleMessage](self, "_isDisplayingSingleMessage")
    && (v11 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase referenceMessageListItem](self, "referenceMessageListItem")),
        v12 = objc_msgSend(v11, "count"),
        v11,
        v12 == (id)1))
  {
    -[ConversationViewController setDisplaySubjectItemID:](self, "setDisplaySubjectItemID:", v8);
  }
  else if (!v9 || objc_msgSend(v9, "expanded"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _indexPathForReferenceMessage](self, "_indexPathForReferenceMessage"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController displaySubjectItemID](self, "displaySubjectItemID"));
    if (v14)
    {

    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase referenceMessageListItem](self, "referenceMessageListItem"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "displayMessageItemID"));
      v17 = objc_msgSend(v8, "isEqual:", v16);

      if (v17)
      {
        -[ConversationViewController setDisplaySubjectItemID:](self, "setDisplaySubjectItemID:", v8);
        -[ConversationViewControllerBase setLastExpandedCellIndexPath:](self, "setLastExpandedCellIndexPath:", v13);
      }
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController collectionViewDataSource](self, "collectionViewDataSource"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController displaySubjectItemID](self, "displaySubjectItemID"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "indexPathForItemIdentifier:", v19));

    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "messageViewController"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "messageContentView"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "headerViewSubjectBlock"));

      v24 = objc_msgSend(v10, "item");
      if (v24 == objc_msgSend(v20, "item")
        || (v25 = objc_msgSend(v10, "item"),
            v26 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase lastExpandedCellIndexPath](self, "lastExpandedCellIndexPath")), v27 = objc_msgSend(v26, "item"), v26, v25 == v27))
      {
        v28 = objc_msgSend(v20, "copy");
        if (v28)
        {
          v29 = objc_msgSend(v10, "item");
          if ((uint64_t)v29 <= (uint64_t)objc_msgSend(v28, "item"))
          {
            if (objc_msgSend(v23, "isHidden"))
            {
              -[ConversationViewController setDisplaySubjectItemID:](self, "setDisplaySubjectItemID:", v8);
              objc_msgSend(v23, "setHidden:", 0);
              v30 = v10;

              v20 = v30;
            }
          }
        }
        if ((objc_msgSend(v28, "isEqual:", v20) & 1) == 0)
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "cellForItemAtIndexPath:", v28));

          v33 = objc_opt_class(MFMessageConversationViewCell);
          if ((objc_opt_isKindOfClass(v32, v33) & 1) != 0)
          {
            v34 = v32;
            v35 = v34;
            if (v34 && objc_msgSend(v34, "expanded"))
            {
              v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "messageViewController"));
              v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "messageContentView"));
              v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "headerViewSubjectBlock"));
              objc_msgSend(v38, "setHidden:", 1);

            }
          }
          v36 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
          v41[0] = _NSConcreteStackBlock;
          v41[1] = 3221225472;
          v41[2] = sub_100076C58;
          v41[3] = &unk_10051AA98;
          v41[4] = self;
          v37 = objc_msgSend(v36, "afterDelay:performBlock:", v41, 0.1);

        }
      }
      else if ((objc_msgSend(v23, "isHidden") & 1) == 0)
      {
        objc_msgSend(v23, "setHidden:", 1);
      }

    }
  }

}

- (void)_ensureSubjectViewLayoutIfNeededAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cellForItemAtIndexPath:", v4));

  v7 = objc_opt_class(MFExpandedMessageCell);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0 && objc_msgSend(v6, "expanded"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController collectionViewDataSource](self, "collectionViewDataSource"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "itemIdentifierForIndexPath:", v4));
    -[ConversationViewController _updateStickySubjectForItemID:cell:indexPath:](self, "_updateStickySubjectForItemID:cell:indexPath:", v9, v6, v4);

  }
  v10.receiver = self;
  v10.super_class = (Class)ConversationViewController;
  -[ConversationViewControllerBase _ensureSubjectViewLayoutIfNeededAtIndexPath:](&v10, "_ensureSubjectViewLayoutIfNeededAtIndexPath:", v4);

}

- (id)_shouldRecalculateStickySubjectBeforeDeletedItemIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController displaySubjectItemID](self, "displaySubjectItemID"));
  if (v5 && objc_msgSend(v4, "containsObject:", v5))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController collectionViewDataSource](self, "collectionViewDataSource"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "indexPathForItemIdentifier:", v5));

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_recalculateStickySubjectForDeletedIndexPath:(id)a3
{
  id v4;
  int64_t v5;
  int64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  char v10;
  char v12;
  uint64_t v13;
  char v14;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[6];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v4 = objc_msgSend(a3, "item");
  v5 = -[ConversationViewController countOfMessages](self, "countOfMessages");
  v6 = v5 - 1;
  if (v5 - 1 >= (uint64_t)v4)
    v7 = (uint64_t)v4;
  else
    v7 = v5 - 1;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_10005ED90;
  v27 = sub_10005EDA0;
  v28 = 0;
  -[ConversationViewController setDisplaySubjectItemID:](self, "setDisplaySubjectItemID:", 0);
  -[ConversationViewControllerBase setLastExpandedCellIndexPath:](self, "setLastExpandedCellIndexPath:", 0);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000770D4;
  v22[3] = &unk_10051BE00;
  v22[4] = self;
  v22[5] = &v23;
  v8 = objc_retainBlock(v22);
  v9 = v7;
  do
  {
    v10 = ((uint64_t (*)(_QWORD *, uint64_t))v8[2])(v8, v9);
    if (v6 == v9++)
      v12 = 1;
    else
      v12 = v10;
  }
  while ((v12 & 1) == 0);
  v13 = v24[5];
  if (!v13 && (v7 & 0x8000000000000000) == 0)
  {
    do
    {
      v14 = ((uint64_t (*)(_QWORD *, uint64_t))v8[2])(v8, v7);
      if (v7-- < 1)
        v16 = 1;
      else
        v16 = v14;
    }
    while ((v16 & 1) == 0);
    v13 = v24[5];
  }
  if (v13)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "cellForItemAtIndexPath:", v24[5]));

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController collectionViewDataSource](self, "collectionViewDataSource"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "itemIdentifierForIndexPath:", v24[5]));
    -[ConversationViewController setDisplaySubjectItemID:](self, "setDisplaySubjectItemID:", v20);

    -[ConversationViewControllerBase setLastExpandedCellIndexPath:](self, "setLastExpandedCellIndexPath:", v24[5]);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController displaySubjectItemID](self, "displaySubjectItemID"));
    -[ConversationViewController _updateStickySubjectForItemID:cell:indexPath:](self, "_updateStickySubjectForItemID:cell:indexPath:", v21, v18, v24[5]);

  }
  _Block_object_dispose(&v23, 8);

}

- (double)stickySubjectViewMaxYForConversationHeaderView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double MinY;
  void *v11;
  void *v12;
  void *v13;
  CGRect v15;
  CGRect v16;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController collectionViewDataSource](self, "collectionViewDataSource", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController displaySubjectItemID](self, "displaySubjectItemID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "indexPathForItemIdentifier:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cellForItemAtIndexPath:", v6));

  v9 = 0.0;
  if (v8 && objc_msgSend(v8, "expanded"))
  {
    objc_msgSend(v8, "frame");
    MinY = CGRectGetMinY(v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "messageViewController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "messageContentView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "headerViewSubjectBlock"));
    objc_msgSend(v13, "frame");
    v9 = MinY + 0.0 + CGRectGetMaxY(v16);

  }
  return v9;
}

- (double)stickySubjectViewFirstBaselineForConversationHeaderView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double MinY;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController collectionViewDataSource](self, "collectionViewDataSource", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController displaySubjectItemID](self, "displaySubjectItemID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "indexPathForItemIdentifier:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cellForItemAtIndexPath:", v6));

  v9 = 0.0;
  if (v8 && objc_msgSend(v8, "expanded"))
  {
    objc_msgSend(v8, "frame");
    MinY = CGRectGetMinY(v20);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "messageViewController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "messageContentView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "headerViewSubjectBlock"));
    objc_msgSend(v13, "frame");
    v14 = CGRectGetMinY(v21);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase displayMetrics](self, "displayMetrics"));
    objc_msgSend(v15, "firstSeparatorToSubjectBaseline");
    v17 = v16;

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController view](self, "view"));
    objc_msgSend(v18, "bounds");
    v9 = MinY + v14 + v17 + 0.0 - CGRectGetHeight(v22);

  }
  return v9;
}

- (DraftGestureHelper)draftGestureHelper
{
  void *v3;
  DraftGestureHelper *v4;
  void *v5;
  DraftGestureHelper *v6;
  void *v7;

  v3 = *(DraftGestureHelper **)((char *)&self->_draftGestureHelper + 4);
  if (!v3)
  {
    v4 = [DraftGestureHelper alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase scene](self, "scene"));
    v6 = -[DraftGestureHelper initWithConversationViewController:scene:](v4, "initWithConversationViewController:scene:", self, v5);
    v7 = *(DraftGestureHelper **)((char *)&self->_draftGestureHelper + 4);
    *(DraftGestureHelper **)((char *)&self->_draftGestureHelper + 4) = v6;

    v3 = *(DraftGestureHelper **)((char *)&self->_draftGestureHelper + 4);
  }
  return (DraftGestureHelper *)v3;
}

- (void)_updateGestureForMessageListItem:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mailboxes"));
  v5 = objc_msgSend(v4, "ef_any:", &stru_10051BE20);

  if ((v5 & 1) != 0 || *(DraftGestureHelper **)((char *)&self->_draftGestureHelper + 4))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController draftGestureHelper](self, "draftGestureHelper"));
    objc_msgSend(v6, "enableGesture:", v5);

  }
}

- (id)messageListItemsForDiagnosticsHelper:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  id v14;

  v4 = a3;
  if (objc_msgSend(v4, "source"))
  {
    v5 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v12 = objc_msgSend(v4, "source");
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Not providing diagnostics because source is %lu", buf, 0xCu);
    }
LABEL_8:
    v8 = 0;
    goto LABEL_9;
  }
  v5 = objc_claimAutoreleasedReturnValue(-[ConversationViewController focusedMessage](self, "focusedMessage"));
  v6 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject ef_publicDescription](v5, "ef_publicDescription"));
    *(_DWORD *)buf = 138543618;
    v12 = v7;
    v13 = 2112;
    v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Providing focusedMessage %{public}@ to %@", buf, 0x16u);

  }
  if (!v5)
    goto LABEL_8;
  v10 = v5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
LABEL_9:

  return v8;
}

- (void)find:(id)a3
{
  uint64_t v3;
  id v4;

  v3 = sub_10007A80C((uint64_t)self);
  v4 = (id)objc_claimAutoreleasedReturnValue(v3);
  objc_msgSend(v4, "presentFindNavigatorShowingReplace:", 0);

}

- (void)clearAllDecoratedFoundText
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase cellConfigurator](self, "cellConfigurator"));
  objc_msgSend(v2, "enumerateExpandedCellsWithBlock:", &stru_10051BE60);

}

- (void)decorateFoundTextRange:(id)a3 inDocument:(id)a4 usingStyle:(unint64_t)a5
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v9 = a3;
  v10 = a4;
  if ((objc_msgSend((id)objc_opt_class(v10), "conformsToProtocol:", &OBJC_PROTOCOL___EMCollectionItemID) & 1) == 0)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ConversationViewController.m"), 5418, CFSTR("Expected an EMCollectionItemID"));

  }
  v11 = objc_opt_class(ConversationSearchTextRange);
  if ((objc_opt_isKindOfClass(v9, v11) & 1) == 0)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ConversationViewController.m"), 5419, CFSTR("Expected ConversationSearchTextRange, got %@"), objc_opt_class(v9));

  }
  v25 = v9;
  if (a5 == 2)
  {
    v12 = sub_100084168((uint64_t)self);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    sub_100056978((uint64_t)v13, v25);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController collectionViewDataSource](self, "collectionViewDataSource"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "indexPathForItemIdentifier:", v10));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "cellForItemAtIndexPath:", v15));

  v18 = objc_opt_class(MFExpandedMessageCell);
  if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "messageViewController"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "messageContentView"));

    objc_msgSend(v20, "didBeginTextSearch");
    v21 = sub_100058A4C((uint64_t)v25);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    objc_msgSend(v20, "showSearchResultsAtRange:usingStyle:", v22, a5);

  }
}

- (int64_t)compareFoundRange:(id)a3 toRange:(id)a4 inDocument:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  _QWORD *v12;
  id v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = sub_100084168((uint64_t)self);
  v12 = (_QWORD *)objc_claimAutoreleasedReturnValue(v11);
  v13 = sub_1000581A0(v12, v8, v9);

  return (int64_t)v13;
}

- (void)performTextSearchWithQueryString:(id)a3 usingOptions:(id)a4 resultAggregator:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  _QWORD *v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412802;
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    v18 = 2112;
    v19 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Beginning search with string %@, options: %@, aggregator: %@", (uint8_t *)&v14, 0x20u);
  }

  -[ConversationViewController setSearchAggregator:](self, "setSearchAggregator:", v10);
  v12 = sub_100084168((uint64_t)self);
  v13 = (_QWORD *)objc_claimAutoreleasedReturnValue(v12);
  sub_1000560B4(v13, v8, v9, v10);

  sub_100077DC8(self, 1);
}

- (UITextRange)selectedTextRange
{
  return 0;
}

- (BOOL)shouldBeginTextSearchOperation
{
  if (qword_1005A9AD0 != -1)
    dispatch_once(&qword_1005A9AD0, &stru_10051BE80);
  return byte_1005A9AC8;
}

- (void)didBeginTextSearchOperation
{
  NSObject *v3;
  int v4;
  const char *v5;

  v3 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[ConversationViewController didBeginTextSearchOperation]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

  -[ConversationViewControllerBase _messageSearchBegan](self, "_messageSearchBegan");
}

- (void)didEndTextSearchOperation
{
  -[ConversationViewController _messageSearchEnded](self, "_messageSearchEnded");
}

- (int64_t)compareOrderFromDocument:(id)a3 toDocument:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  v9 = v7;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController collectionViewDataSource](self, "collectionViewDataSource"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "indexPathForItemIdentifier:", v8));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "indexPathForItemIdentifier:", v9));
  v13 = objc_msgSend(v11, "compare:", v12);

  return (int64_t)v13;
}

- (void)scrollRangeToVisible:(id)a3 inDocument:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  ConversationViewController *v26;
  id v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;

  v7 = a3;
  v8 = a4;
  v9 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v29 = "-[ConversationViewController scrollRangeToVisible:inDocument:]";
    v30 = 2112;
    v31 = v7;
    v32 = 2112;
    v33 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: range: %@, document: %@", buf, 0x20u);
  }

  v10 = v8;
  if ((objc_msgSend((id)objc_opt_class(v10), "conformsToProtocol:", &OBJC_PROTOCOL___EMCollectionItemID) & 1) == 0)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ConversationViewController.m"), 5502, CFSTR("Expected an EMCollectionItemID"));

  }
  v11 = objc_opt_class(ConversationSearchTextRange);
  if ((objc_opt_isKindOfClass(v7, v11) & 1) == 0)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ConversationViewController.m"), 5503, CFSTR("Expected ConversationSearchTextRange, got %@"), objc_opt_class(v7));

  }
  v12 = v7;
  v13 = sub_100060E5C(self, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = v14;
  if (v14)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "messageViewController"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "messageContentView"));

    v18 = sub_100058A4C((uint64_t)v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000783FC;
    v23[3] = &unk_10051BEA8;
    v24 = v12;
    v25 = v10;
    v26 = self;
    v20 = v17;
    v27 = v20;
    objc_msgSend(v20, "requestRectForFoundTextRange:completionHandler:", v19, v23);

  }
  else
  {
    -[ConversationViewController scrollToMessageItemIDIfPossible:animated:pin:](self, "scrollToMessageItemIDIfPossible:animated:pin:", v10, 1, 0);
  }

}

- (void)findNext:(id)a3
{
  NSObject *v3;
  int v4;
  const char *v5;

  v3 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log", a3));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[ConversationViewController findNext:]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

}

- (void)findPrevious:(id)a3
{
  NSObject *v3;
  int v4;
  const char *v5;

  v3 = objc_claimAutoreleasedReturnValue(+[ConversationViewController log](ConversationViewController, "log", a3));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[ConversationViewController findPrevious:]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

}

- (void)_messageSearchEnded
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ConversationViewController;
  -[ConversationViewControllerBase _messageSearchEnded](&v4, "_messageSearchEnded");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController searchAggregator](self, "searchAggregator"));
  objc_msgSend(v3, "invalidate");

  -[ConversationViewController setSearchAggregator:](self, "setSearchAggregator:", 0);
  sub_100077DC8(self, 0);
}

- (void)_decorateFoundRanges:(id)a3 inExpandedCell:(id)a4
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  unsigned int v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;
  id obj;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v24 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "messageViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "messageContentView"));

  v26 = v7;
  objc_msgSend(v7, "didBeginTextSearch");
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v24;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        v12 = sub_100084168((uint64_t)self);
        v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        v14 = sub_10005877C((uint64_t)v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        if (v15)
        {
          v16 = sub_100084168((uint64_t)self);
          v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
          v18 = sub_10005877C((uint64_t)v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
          v20 = objc_msgSend(v11, "isEqual:", v19);

          if (v20)
          {
            v21 = sub_100058A4C((uint64_t)v11);
            v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
            objc_msgSend(v26, "showSearchResultsAtRange:usingStyle:", v22, 2);
            goto LABEL_11;
          }
        }
        else
        {

        }
        v23 = sub_100058A4C((uint64_t)v11);
        v22 = (void *)objc_claimAutoreleasedReturnValue(v23);
        objc_msgSend(v26, "showSearchResultsAtRange:usingStyle:", v22, 1);
LABEL_11:

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v8);
  }

}

- (void)_stopTextFindingIfNecessary
{
  uint64_t v3;
  void *v4;

  v3 = sub_100084168((uint64_t)self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  if (v4)
    -[ConversationViewController _messageSearchEnded](self, "_messageSearchEnded");
}

- (id)conversationSearchMessageListForConversationSearchHandler:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(-[ConversationViewController messageList](self, "messageList", a3));
}

- (id)conversationSearchHandler:(id)a3 contentRepresentationRequestForItemID:(id)a4
{
  return (id)objc_claimAutoreleasedReturnValue(-[ConversationViewController _contentRequestForMessageWithItemID:](self, "_contentRequestForMessageWithItemID:", a4));
}

- (BOOL)conversationSearchHandler:(id)a3 shouldConsiderQuotedContentForItemID:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController collectionViewDataSource](self, "collectionViewDataSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "indexPathForItemIdentifier:", v5));

  LOBYTE(self) = !-[ConversationViewController _shouldAutomaticallyCollapseQuotedContentForCellAtIndexPath:](self, "_shouldAutomaticallyCollapseQuotedContentForCellAtIndexPath:", v7);
  return (char)self;
}

- (void)bannerViewDidSelectEditButton:(id)a3 itemID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
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
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id location;
  void *v30;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController _contentRequestForMessageWithItemID:](self, "_contentRequestForMessageWithItemID:", v7));
  v9 = objc_msgSend(v6, "type");
  if (!v9)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "message"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MFDatePickerViewController datePickerViewControllerWithType:message:](MFDatePickerViewController, "datePickerViewControllerWithType:message:", 0, v21));

    objc_msgSend(v11, "setDelegate:", self);
    v22 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v11);
    objc_msgSend(v22, "setModalPresentationStyle:", 7);
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "editButton"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "popoverPresentationController"));
    objc_msgSend(v23, "mui_setAsSourceForPopoverPresentationController:", v24);

    -[ConversationViewControllerBase presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v22, 1, 0);
    goto LABEL_7;
  }
  if (v9 == (id)1)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "message"));
    v30 = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v30, 1));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewController undoManager](self, "undoManager"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[MFReadLaterTriageInteraction interactionWithMessageListItems:undoManager:origin:actor:](MFReadLaterTriageInteraction, "interactionWithMessageListItems:undoManager:origin:actor:", v16, v17, 3, 2));

    objc_msgSend(v18, "setDelegate:", self);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "editButton"));
    objc_msgSend(v18, "setPresentationSource:", v19);

    objc_msgSend(v18, "setDatePickerPresentationStyle:", 7);
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100079068;
    v25[3] = &unk_10051B338;
    objc_copyWeak(&v28, &location);
    v20 = v18;
    v26 = v20;
    v27 = v8;
    objc_msgSend(v20, "performInteractionWithCompletion:", v25);

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);

  }
  else if (v9 == (id)2)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase scene](self, "scene"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MFMessageCompositionTriageInteraction interactionWithContentRequest:scene:](MFReplyAllTriageInteraction, "interactionWithContentRequest:scene:", v8, v10));

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "message"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "mailboxes"));
    objc_msgSend(v11, "setMessageSourceMailboxes:", v13);

    objc_msgSend(v11, "setShouldPromptToLoadRestOfMessage:", 0);
    objc_msgSend(v11, "setDelegate:", self);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "editButton"));
    objc_msgSend(v11, "setPresentationSource:", v14);

    objc_msgSend(v11, "performInteraction");
LABEL_7:

  }
}

- (id)conversationAttachmentURLsForConversationItemHeaderBlock:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000792BC;
  v7[3] = &unk_10051BF30;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[EFPromise promise](EFPromise, "promise", a3));
  v8 = v4;
  -[ConversationViewController _fetchConversationAttachmentDataWithCompletion:](self, "_fetchConversationAttachmentDataWithCompletion:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "future"));

  return v5;
}

- (id)richLinksInConversationForConversationItemHeaderBlock:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100079380;
  v7[3] = &unk_10051BF30;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[EFPromise promise](EFPromise, "promise", a3));
  v8 = v4;
  -[ConversationViewController _fetchConversationRichLinkDataWithCompletion:](self, "_fetchConversationRichLinkDataWithCompletion:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "future"));

  return v5;
}

- (void)summaryCell:(id)a3 withItemID:(id)a4 didLayoutWithHeight:(double)a5
{
  id v8;
  id v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  id v20;
  double v21;
  double v22;
  double v23;
  double v24;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "bounds");
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase cellConfigurator](self, "cellConfigurator"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "sizeTracker"));
  objc_msgSend(v13, "intrinsicSizeForCellWithItemID:", v9);
  v15 = v14;
  v17 = v16;

  if (v15 != v11 || v17 != a5)
  {
    v20 = v9;
    v21 = v15;
    v22 = v17;
    v23 = v11;
    v24 = a5;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler", _NSConcreteStackBlock, 3221225472, sub_1000794F4, &unk_10051BF58, self));
    objc_msgSend(v18, "performBlock:", &v19);

  }
}

- (void)summaryCell:(id)a3 withItemID:(id)a4 wantsToDisplayAlert:(id)a5
{
  -[ConversationViewControllerBase presentViewController:animated:completion:](self, "presentViewController:animated:completion:", a5, 1, 0);
}

- (void)_generativeModelsAvailabilityDidChange:(id)a3
{
  -[ConversationViewController _resetManualSummaryItemIDs](self, "_resetManualSummaryItemIDs", a3);
  -[ConversationViewController _reloadDataSource](self, "_reloadDataSource");
}

- (void)setMessageTriageInteractionHelper:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_messageTriageInteractionHelper + 4), a3);
}

- (ConversationViewControllerSelectionDataSource)selectionDataSource
{
  return (ConversationViewControllerSelectionDataSource *)objc_loadWeakRetained((id *)((char *)&self->_selectionDataSource + 4));
}

- (void)setSelectionDataSource:(id)a3
{
  objc_storeWeak((id *)((char *)&self->_selectionDataSource + 4), a3);
}

- (EMDiagnosticsHelper)diagnosticsHelper
{
  return *(EMDiagnosticsHelper **)((char *)&self->_diagnosticsHelper + 4);
}

- (EMMessageRepository)messageRepository
{
  return *(EMMessageRepository **)((char *)&self->_messageRepository + 4);
}

- (void)setMessageRepository:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_messageRepository + 4), a3);
}

- (EMMailboxRepository)mailboxRepository
{
  return *(EMMailboxRepository **)((char *)&self->_mailboxRepository + 4);
}

- (void)setMailboxRepository:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_mailboxRepository + 4), a3);
}

- (EMMessageList)referenceMessageList
{
  return *(EMMessageList **)((char *)&self->_referenceMessageList + 4);
}

- (void)setReferenceMessageList:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_referenceMessageList + 4), a3);
}

- (EMMessageList)messageList
{
  return *(EMMessageList **)((char *)&self->_messageList + 4);
}

- (void)setMessageList:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_messageList + 4), a3);
}

- (MessageListCollectionHelper)messageListCollectionHelper
{
  return *(MessageListCollectionHelper **)((char *)&self->_messageListCollectionHelper + 4);
}

- (void)setMessageListCollectionHelper:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_messageListCollectionHelper + 4), a3);
}

- (BOOL)isSwappingMessageList
{
  return self->_swappingMessageList;
}

- (void)setSwappingMessageList:(BOOL)a3
{
  self->_swappingMessageList = a3;
}

- (BOOL)nextUpdateShouldAvoidAnimation
{
  return self->_nextUpdateShouldAvoidAnimation;
}

- (void)setNextUpdateShouldAvoidAnimation:(BOOL)a3
{
  self->_nextUpdateShouldAvoidAnimation = a3;
}

- (BOOL)shouldHideFollowUp
{
  return self->_hideFollowUp;
}

- (EFLRUCache)contentRequestCache
{
  return *(EFLRUCache **)((char *)&self->_contentRequestCache + 4);
}

- (void)setContentRequestCache:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_contentRequestCache + 4), a3);
}

- (void)setCollectionViewDataSource:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_collectionViewDataSource + 4), a3);
}

- (MFPriorityLoadingQueue)contentRequestQueue
{
  return *(MFPriorityLoadingQueue **)((char *)&self->_contentRequestQueue + 4);
}

- (void)setContentRequestQueue:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_contentRequestQueue + 4), a3);
}

- (EFCancelationToken)contentItemsCancelable
{
  return *(EFCancelationToken **)((char *)&self->_contentItemsCancelable + 4);
}

- (void)setContentItemsCancelable:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_contentItemsCancelable + 4), a3);
}

- (NSMapTable)delayedReadCancelables
{
  return *(NSMapTable **)((char *)&self->_delayedReadCancelables + 4);
}

- (void)setDelayedReadCancelables:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_delayedReadCancelables + 4), a3);
}

- (NSMutableSet)disabledMarkAsReadMessageItemIDs
{
  return *(NSMutableSet **)((char *)&self->_disabledMarkAsReadMessageItemIDs + 4);
}

- (void)setDisabledMarkAsReadMessageItemIDs:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_disabledMarkAsReadMessageItemIDs + 4), a3);
}

- (NSMutableSet)expandedContentItemIDs
{
  return *(NSMutableSet **)((char *)&self->_expandedContentItemIDs + 4);
}

- (void)setExpandedContentItemIDs:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_expandedContentItemIDs + 4), a3);
}

- (MFTransferSplitViewController)transferController
{
  return *(MFTransferSplitViewController **)((char *)&self->_transferController + 4);
}

- (void)setTransferController:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_transferController + 4), a3);
}

- (EMMessage)selectedMessage
{
  return *(EMMessage **)((char *)&self->_selectedMessage + 4);
}

- (void)setSelectedMessage:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_selectedMessage + 4), a3);
}

- (EFFuture)predictedMailboxForConversation
{
  return *(EFFuture **)((char *)&self->_predictedMailboxForConversation + 4);
}

- (void)setPredictedMailboxForConversation:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_predictedMailboxForConversation + 4), a3);
}

- (NSMutableSet)initiallyUnreadItemIDs
{
  return *(NSMutableSet **)((char *)&self->_initiallyUnreadItemIDs + 4);
}

- (void)setInitiallyUnreadItemIDs:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_initiallyUnreadItemIDs + 4), a3);
}

- (EMCollectionItemID)displaySubjectItemID
{
  return *(EMCollectionItemID **)((char *)&self->_displaySubjectItemID + 4);
}

- (void)setDisplaySubjectItemID:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_displaySubjectItemID + 4), a3);
}

- (void)setDraftGestureHelper:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_draftGestureHelper + 4), a3);
}

- (void)setPinnedIndexPathProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 564);
}

- (EFScheduler)mailboxPredictionScheduler
{
  return *(EFScheduler **)((char *)&self->_mailboxPredictionScheduler + 4);
}

- (void)setMailboxPredictionScheduler:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_mailboxPredictionScheduler + 4), a3);
}

- (EFScheduler)messageLoadingScheduler
{
  return *(EFScheduler **)((char *)&self->_messageLoadingScheduler + 4);
}

- (void)setMessageLoadingScheduler:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_messageLoadingScheduler + 4), a3);
}

- (EFCancelable)blankConversationTailspinToken
{
  return *(EFCancelable **)((char *)&self->_blankConversationTailspinToken + 4);
}

- (void)setBlankConversationTailspinToken:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_blankConversationTailspinToken + 4), a3);
}

- (_UITextSearchAggregator)searchAggregator
{
  return *(_UITextSearchAggregator **)((char *)&self->_searchAggregator + 4);
}

- (void)setSearchAggregator:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_searchAggregator + 4), a3);
}

- (EFCancelable)userDefaultsObserver
{
  return *(EFCancelable **)((char *)&self->_userDefaultsObserver + 4);
}

- (void)setUserDefaultsObserver:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_userDefaultsObserver + 4), a3);
}

- (BOOL)didAutoReloadDataSource
{
  return self->_didAutoReloadDataSource;
}

- (void)setDidAutoReloadDataSource:(BOOL)a3
{
  self->_didAutoReloadDataSource = a3;
}

- (MFMailComposeController)quickReplyMailComposeController
{
  return *(MFMailComposeController **)((char *)&self->_quickReplyMailComposeController + 4);
}

- (void)setQuickReplyMailComposeController:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_quickReplyMailComposeController + 4), a3);
}

- (UICollectionViewSupplementaryRegistration)quickReplyHeaderSupplementaryRegistration
{
  return *(UICollectionViewSupplementaryRegistration **)((char *)&self->_quickReplyHeaderSupplementaryRegistration + 4);
}

- (void)setQuickReplyHeaderSupplementaryRegistration:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_quickReplyHeaderSupplementaryRegistration + 4), a3);
}

- (UICollectionViewSupplementaryRegistration)quickReplyFooterSupplementaryRegistration
{
  return *(UICollectionViewSupplementaryRegistration **)((char *)&self->_quickReplyFooterSupplementaryRegistration + 4);
}

- (void)setQuickReplyFooterSupplementaryRegistration:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_quickReplyFooterSupplementaryRegistration + 4), a3);
}

- (BOOL)quickReplyHasContent
{
  return self->_quickReplyHasContent;
}

- (void)setQuickReplyHasContent:(BOOL)a3
{
  self->_quickReplyHasContent = a3;
}

- (MFGeneratedSummaryCollectionItemID)topSummaryItemID
{
  return *(MFGeneratedSummaryCollectionItemID **)((char *)&self->_topSummaryItemID + 4);
}

- (void)setTopSummaryItemID:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_topSummaryItemID + 4), a3);
}

- (MFGeneratedSummaryCollectionItemID)inlineSummaryItemID
{
  return *(MFGeneratedSummaryCollectionItemID **)((char *)&self->_inlineSummaryItemID + 4);
}

- (void)setInlineSummaryItemID:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_inlineSummaryItemID + 4), a3);
}

- (NSMutableDictionary)summaryContextByItemID
{
  return *(NSMutableDictionary **)((char *)&self->_summaryContextByItemID + 4);
}

- (void)setSummaryContextByItemID:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_summaryContextByItemID + 4), a3);
}

- (BOOL)isPerformingDataSourceUpdate
{
  return self->_isPerformingDataSourceUpdate;
}

- (void)setIsPerformingDataSourceUpdate:(BOOL)a3
{
  self->_isPerformingDataSourceUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_summaryContextByItemID + 4), 0);
  objc_storeStrong((id *)((char *)&self->_inlineSummaryItemID + 4), 0);
  objc_storeStrong((id *)((char *)&self->_topSummaryItemID + 4), 0);
  objc_storeStrong((id *)((char *)&self->_diagnosticsHelperToken + 4), 0);
  objc_storeStrong((id *)((char *)&self->_quickReplyFooterSupplementaryRegistration + 4), 0);
  objc_storeStrong((id *)((char *)&self->_quickReplyHeaderSupplementaryRegistration + 4), 0);
  objc_storeStrong((id *)((char *)&self->_quickReplyMailComposeController + 4), 0);
  objc_storeStrong((id *)((char *)&self->_userDefaultsObserver + 4), 0);
  objc_storeStrong((id *)((char *)&self->_searchAggregator + 4), 0);
  objc_storeStrong((id *)((char *)&self->_blankConversationTailspinToken + 4), 0);
  objc_storeStrong((id *)((char *)&self->_messageLoadingScheduler + 4), 0);
  objc_storeStrong((id *)((char *)&self->_mailboxPredictionScheduler + 4), 0);
  objc_storeStrong((id *)((char *)&self->_pinnedIndexPathProvider + 4), 0);
  objc_storeStrong((id *)((char *)&self->_draftGestureHelper + 4), 0);
  objc_storeStrong((id *)((char *)&self->_displaySubjectItemID + 4), 0);
  objc_storeStrong((id *)((char *)&self->_initiallyUnreadItemIDs + 4), 0);
  objc_storeStrong((id *)((char *)&self->_predictedMailboxForConversation + 4), 0);
  objc_storeStrong((id *)((char *)&self->_selectedMessage + 4), 0);
  objc_storeStrong((id *)((char *)&self->_transferController + 4), 0);
  objc_storeStrong((id *)((char *)&self->_expandedContentItemIDs + 4), 0);
  objc_storeStrong((id *)((char *)&self->_disabledMarkAsReadMessageItemIDs + 4), 0);
  objc_storeStrong((id *)((char *)&self->_delayedReadCancelables + 4), 0);
  objc_storeStrong((id *)((char *)&self->_contentItemsCancelable + 4), 0);
  objc_storeStrong((id *)((char *)&self->_contentRequestQueue + 4), 0);
  objc_storeStrong((id *)((char *)&self->_collectionViewDataSource + 4), 0);
  objc_storeStrong((id *)((char *)&self->_contentRequestCache + 4), 0);
  objc_storeStrong((id *)((char *)&self->_messageListCollectionHelper + 4), 0);
  objc_storeStrong((id *)((char *)&self->_messageList + 4), 0);
  objc_storeStrong((id *)((char *)&self->_referenceMessageList + 4), 0);
  objc_storeStrong((id *)((char *)&self->_mailboxRepository + 4), 0);
  objc_storeStrong((id *)((char *)&self->_messageRepository + 4), 0);
  objc_storeStrong((id *)((char *)&self->_diagnosticsHelper + 4), 0);
  objc_destroyWeak((id *)((char *)&self->_selectionDataSource + 4));
  objc_storeStrong((id *)((char *)&self->_messageTriageInteractionHelper + 4), 0);
}

@end
