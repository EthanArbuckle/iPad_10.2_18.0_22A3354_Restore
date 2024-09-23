@implementation MailStatusViewController

- (void)mailboxStatusUpdated:(id)a3 statusInfo:(id)a4 forMailboxObjectID:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v7 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusViewController mailboxStatusScheduler](self, "mailboxStatusScheduler"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10003A6E0;
  v12[3] = &unk_10051A960;
  v12[4] = self;
  v10 = v8;
  v13 = v10;
  v11 = v7;
  v14 = v11;
  objc_msgSend(v9, "performSyncBlock:", v12);

  -[MailStatusViewController _performStatusUpdateAndSignpostForMailboxObjectID:](self, "_performStatusUpdateAndSignpostForMailboxObjectID:", v10);
}

- (void)networkStatusChanged:(id)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MFNetworkController sharedInstance](MFNetworkController, "sharedInstance", a3));
  v5 = objc_msgSend(v4, "dataStatus");

  v6 = objc_claimAutoreleasedReturnValue(+[MailStatusViewController log](MailStatusViewController, "log"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v5));
    v8 = 138543362;
    v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Network status changed: %{public}@", (uint8_t *)&v8, 0xCu);

  }
  -[MailStatusViewController resetAccountErrors](self, "resetAccountErrors");
  -[MailStatusViewController _performStatusUpdate](self, "_performStatusUpdate");
}

- (void)iCloudQuotaOfferUpdated:(id)a3 offer:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  MailStatusViewController *v9;

  v5 = a4;
  v8 = v5;
  v9 = self;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler", _NSConcreteStackBlock, 3221225472, sub_10003ADFC, &unk_10051A910));
  objc_msgSend(v6, "performBlock:", &v7);

}

- (id)mailboxQualifier
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "mailboxQualifier"));

  return v3;
}

- (void)stopObserving
{
  NSObject *v3;
  void *v4;
  _QWORD v5[5];
  uint8_t buf[4];
  MailStatusViewController *v7;
  __int16 v8;
  uint64_t v9;

  objc_storeWeak((id *)&self->_delegate, 0);
  v3 = objc_claimAutoreleasedReturnValue(+[MailStatusViewController log](MailStatusViewController, "log"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v7 = self;
    v8 = 2112;
    v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%p Set delegate:%@", buf, 0x16u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusViewController mailboxStatusScheduler](self, "mailboxStatusScheduler"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003BAA4;
  v5[3] = &unk_10051AA98;
  v5[4] = self;
  objc_msgSend(v4, "performBlock:", v5);

}

- (void)startObservingForVisibleMailboxes:(id)a3 delegate:(id)a4 filterPredicate:(id)a5 label:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v15[5];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusViewController mailboxStatusScheduler](self, "mailboxStatusScheduler"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10003A2A8;
  v15[3] = &unk_10051AA98;
  v15[4] = self;
  objc_msgSend(v14, "performBlock:", v15);

  -[MailStatusViewController startObservingForActivityStatusMailboxes:badgeCountStatusMailboxes:delegate:filterPredicate:label:](self, "startObservingForActivityStatusMailboxes:badgeCountStatusMailboxes:delegate:filterPredicate:label:", v10, v10, v11, v12, v13);
}

- (void)_reset
{
  MailStatusInfo *v3;
  MailStatusInfo *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[MailStatusViewController mailboxStatusInfos](self, "mailboxStatusInfos"));
  objc_msgSend(v7, "removeAllObjects");

  -[MailStatusViewController setBadgeCount:](self, "setBadgeCount:", 0);
  v8 = (id)objc_claimAutoreleasedReturnValue(-[MailStatusViewController statusInfo](self, "statusInfo"));
  v3 = objc_alloc_init(MailStatusInfo);
  -[MailStatusInfo setStatus:](v3, "setStatus:", &stru_100531B00);
  -[MailStatusInfo setState:](v3, "setState:", 2);
  -[MailStatusViewController setStatusInfo:](self, "setStatusInfo:", v3);
  v4 = v3;
  -[MailStatusViewController signpostPreviousStatus:andCurrentStatus:usingMailboxObjectID:](self, "signpostPreviousStatus:andCurrentStatus:usingMailboxObjectID:", v8, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusViewController statusBarView](self, "statusBarView"));
  objc_msgSend(v5, "setNeedsDisplayWithStatusInfo:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusViewController statusObserver](self, "statusObserver"));
  objc_msgSend(v6, "checkForiCloudQuotaUpsellOffer");

}

- (void)setStatusInfo:(id)a3
{
  os_unfair_lock_s *p_statusInfoLock;
  MailStatusInfo **p_statusInfo;
  MailStatusInfo *statusInfo;
  MailStatusInfo *v8;

  v8 = (MailStatusInfo *)a3;
  p_statusInfoLock = &self->_statusInfoLock;
  os_unfair_lock_lock(&self->_statusInfoLock);
  statusInfo = self->_statusInfo;
  p_statusInfo = &self->_statusInfo;
  if (statusInfo != v8)
    objc_storeStrong((id *)p_statusInfo, a3);
  os_unfair_lock_unlock(p_statusInfoLock);

}

- (void)_performStatusUpdateAndSignpostForMailboxObjectID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusViewController mailboxStatusScheduler](self, "mailboxStatusScheduler"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100029F0C;
  v7[3] = &unk_10051A910;
  v7[4] = self;
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "performBlock:", v7);

}

- (NSArray)activityStatusMailboxes
{
  return self->_activityStatusMailboxes;
}

- (id)networkStatusErrorString
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v14;
  void *v15;
  uint8_t buf[4];
  void *v17;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MFNetworkController sharedInstance](MFNetworkController, "sharedInstance"));
  v3 = objc_msgSend(v2, "dataStatus");

  v4 = objc_claimAutoreleasedReturnValue(+[MailStatusViewController log](MailStatusViewController, "log"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v3));
    *(_DWORD *)buf = 138543362;
    v17 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Current network data status: %{public}@", buf, 0xCu);

  }
  if (!v3)
    return 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = MFLookupLocalizedString(CFSTR("NETWORK_OFFLINE"), CFSTR("Network Offline"), CFSTR("Message"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_100531B00, CFSTR("Main")));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor", NSForegroundColorAttributeName));
  v15 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));

  v12 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithString:attributes:", v9, v11);
  return v12;
}

- (void)startObservingForActivityStatusMailboxes:(id)a3 badgeCountStatusMailboxes:(id)a4 delegate:(id)a5 filterPredicate:(id)a6 label:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  MailStatusViewController *v29;
  __int16 v30;
  id v31;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_storeWeak((id *)&self->_delegate, v14);
  v17 = objc_claimAutoreleasedReturnValue(+[MailStatusViewController log](MailStatusViewController, "log"));
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v29 = self;
    v30 = 2112;
    v31 = v14;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%p Set delegate:%@", buf, 0x16u);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusViewController mailboxStatusScheduler](self, "mailboxStatusScheduler"));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10001C5A8;
  v23[3] = &unk_10051EC78;
  v23[4] = self;
  v19 = v12;
  v24 = v19;
  v20 = v13;
  v25 = v20;
  v21 = v15;
  v26 = v21;
  v22 = v16;
  v27 = v22;
  objc_msgSend(v18, "performBlock:", v23);

}

- (MailStatusViewController)initWithMailboxRepository:(id)a3 outgoingMessageRepository:(id)a4 scene:(id)a5
{
  id v9;
  id v10;
  id v11;
  MailStatusViewController *v12;
  MailStatusBarView *v13;
  MailStatusBarView *statusBarView;
  uint64_t v15;
  UIColor *statusBarViewTintColor;
  UIBarButtonItem *v17;
  UIBarButtonItem *mailStatusBarButtonItem;
  MailStatusObserver *v19;
  MailStatusObserver *statusObserver;
  NSMutableDictionary *v21;
  NSMutableDictionary *mailboxStatusInfos;
  NSString *v23;
  void *v24;
  uint64_t v25;
  EFScheduler *mailboxStatusScheduler;
  MailStatusInfo *v27;
  MailStatusInfo *statusInfo;
  objc_super v30;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v30.receiver = self;
  v30.super_class = (Class)MailStatusViewController;
  v12 = -[MailStatusViewController init](&v30, "init");
  if (v12)
  {
    v13 = -[MailStatusBarView initWithFrame:]([MailStatusBarView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    statusBarView = v12->_statusBarView;
    v12->_statusBarView = v13;

    -[MailStatusBarView setDelegate:](v12->_statusBarView, "setDelegate:", v12);
    -[MailStatusBarView setTarget:withAction:](v12->_statusBarView, "setTarget:withAction:", v12, "_subtitlePressed");
    -[MailStatusBarView setDelegate:](v12->_statusBarView, "setDelegate:", v12);
    v15 = objc_claimAutoreleasedReturnValue(-[MailStatusBarView tintColor](v12->_statusBarView, "tintColor"));
    statusBarViewTintColor = v12->_statusBarViewTintColor;
    v12->_statusBarViewTintColor = (UIColor *)v15;

    v17 = (UIBarButtonItem *)objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithCustomView:", v12->_statusBarView);
    mailStatusBarButtonItem = v12->_mailStatusBarButtonItem;
    v12->_mailStatusBarButtonItem = v17;

    objc_storeStrong((id *)&v12->_mailboxRepository, a3);
    objc_storeStrong((id *)&v12->_outgoingMessageRepository, a4);
    v19 = -[MailStatusObserver initWithMailboxRepository:delegate:]([MailStatusObserver alloc], "initWithMailboxRepository:delegate:", v12->_mailboxRepository, v12);
    statusObserver = v12->_statusObserver;
    v12->_statusObserver = v19;

    v21 = objc_opt_new(NSMutableDictionary);
    mailboxStatusInfos = v12->_mailboxStatusInfos;
    v12->_mailboxStatusInfos = v21;

    v23 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.mobilemail.%@.scheduler"), objc_opt_class(v12));
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v25 = objc_claimAutoreleasedReturnValue(+[EFScheduler serialDispatchQueueSchedulerWithName:](EFScheduler, "serialDispatchQueueSchedulerWithName:", v24));
    mailboxStatusScheduler = v12->_mailboxStatusScheduler;
    v12->_mailboxStatusScheduler = (EFScheduler *)v25;

    *(_QWORD *)&v12->_statusInfoLock._os_unfair_lock_opaque = 0;
    v12->_hasDelayedMessagesLock._os_unfair_lock_opaque = 0;
    v27 = objc_alloc_init(MailStatusInfo);
    statusInfo = v12->_statusInfo;
    v12->_statusInfo = v27;

    objc_storeWeak((id *)&v12->_scene, v11);
    v12->_hasDelayedMessages = 0;
  }

  return v12;
}

- (MailStatusInfo)statusInfo
{
  os_unfair_lock_s *p_statusInfoLock;
  MailStatusInfo *v4;

  p_statusInfoLock = &self->_statusInfoLock;
  os_unfair_lock_lock(&self->_statusInfoLock);
  v4 = self->_statusInfo;
  os_unfair_lock_unlock(p_statusInfoLock);
  return v4;
}

- (BOOL)_rebuildStatus
{
  unint64_t numberOfPendingMessages;
  _BOOL4 hasDelayedMessages;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  MailStatusInfo *v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  NSObject *v20;
  void *v21;
  id v23;
  void *j;
  uint64_t v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  void *v48;
  void *v49;
  unint64_t v50;
  uint64_t v51;
  void *v52;
  id v53;
  uint64_t v55;
  void *v56;
  id v57;
  void *v58;
  id v59;
  void *v60;
  uint64_t v61;
  void *v62;
  id obj;
  void *v64;
  void *v65;
  _QWORD v66[4];
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint8_t buf[4];
  MailStatusViewController *v77;
  __int16 v78;
  void *v79;
  _BYTE v80[128];
  _BYTE v81[128];

  v52 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusViewController mailboxStatusInfos](self, "mailboxStatusInfos"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v53 = objc_alloc_init((Class)NSMutableArray);
  -[MailStatusViewController setPressedBlock:](self, "setPressedBlock:", 0);
  os_unfair_lock_lock(&self->_numberOfPendingMessagesLock);
  numberOfPendingMessages = self->_numberOfPendingMessages;
  hasDelayedMessages = self->_hasDelayedMessages;
  os_unfair_lock_unlock(&self->_numberOfPendingMessagesLock);
  v50 = numberOfPendingMessages;
  if (hasDelayedMessages)
  {
    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    v4 = v52;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v72, v81, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v73;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v73 != v6)
            objc_enumerationMutation(v4);
          v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * (_QWORD)i), v50));
          objc_msgSend(v8, "setState:", 4);

        }
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v72, v81, 16);
      }
      while (v5);
    }

    v59 = 0;
    v60 = 0;
    v64 = 0;
    v9 = 0;
    v58 = 0;
    v10 = 0;
    v11 = 0;
    v62 = 0;
    v56 = 0;
    v12 = 4;
    goto LABEL_12;
  }
  if (numberOfPendingMessages)
  {
    v59 = 0;
    v60 = 0;
    v64 = 0;
    v9 = 0;
    v58 = 0;
    v10 = 0;
    v11 = 0;
    v62 = 0;
    v56 = 0;
    v12 = 1;
LABEL_12:
    v61 = v12;
    goto LABEL_13;
  }
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  obj = v52;
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v80, 16);
  if (!v23)
  {
    v59 = 0;
    v60 = 0;
    v64 = 0;
    v9 = 0;
    v58 = 0;
    v11 = 0;
    v56 = 0;
    v61 = 1;
    v62 = 0;
    goto LABEL_53;
  }
  v59 = 0;
  v60 = 0;
  v64 = 0;
  v9 = 0;
  v58 = 0;
  v11 = 0;
  v55 = *(_QWORD *)v69;
  v56 = 0;
  v61 = 1;
  v62 = 0;
  do
  {
    v57 = v23;
    for (j = 0; j != v57; j = (char *)j + 1)
    {
      if (*(_QWORD *)v69 != v55)
        objc_enumerationMutation(obj);
      v25 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * (_QWORD)j);
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "objectForKeyedSubscript:", v25, v50));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "lastUpdateTime"));
      v28 = objc_msgSend(v27, "compare:", v65) == (id)1;

      if (v28)
      {
        v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "lastUpdateTime"));

        v65 = (void *)v29;
      }
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "progress"));
      v31 = v30;
      if (v30 && (uint64_t)objc_msgSend(v30, "totalUnitCount") >= 1)
      {
        if (!v59)
          v59 = objc_msgSend(objc_alloc((Class)NSProgress), "initWithParent:userInfo:", 0, 0);
        v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "status"));

        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSProgress discreteProgressWithTotalUnitCount:](NSProgress, "discreteProgressWithTotalUnitCount:", objc_msgSend(v31, "totalUnitCount")));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "progress"));
        objc_msgSend(v9, "setCompletedUnitCount:", objc_msgSend(v33, "completedUnitCount"));

        objc_msgSend(v59, "addChild:withPendingUnitCount:", v9, 1);
        v34 = 3;
        goto LABEL_40;
      }
      if (v61 == 3)
      {
        v61 = 3;
        goto LABEL_41;
      }
      if (objc_msgSend(v26, "state") == (id)2)
      {
        v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "status"));
        v34 = 2;
LABEL_40:
        v61 = v34;

        v9 = (void *)v32;
      }
LABEL_41:
      if (objc_msgSend(v26, "state") == (id)1)
      {
        v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "status"));

        v58 = (void *)v35;
      }
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "iCloudQuotaOfferText"));

      if (v36)
      {
        v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "iCloudQuotaOfferText"));

        v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "iCloudQuotaOfferLink"));
        v64 = (void *)v37;
        v60 = (void *)v38;
      }
      if (objc_msgSend(v26, "hasAccountError"))
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusViewController mailboxRepository](self, "mailboxRepository"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "mailboxForObjectID:", v25));
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "result:", 0));

        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "account"));
        if (v42)
          objc_msgSend(v53, "addObject:", v42);
        v43 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "error"));

        v44 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "accountErrorTitle"));
        v45 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "failureReasonDescription"));

        v11 = (void *)v43;
        v62 = (void *)v44;
        v56 = (void *)v45;
      }

    }
    v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v80, 16);
  }
  while (v23);
LABEL_53:

  if (objc_msgSend(v53, "count"))
  {
    v46 = objc_claimAutoreleasedReturnValue(-[MailStatusViewController accountStatusErrorAttributedStringForAccountWithErrors:](self, "accountStatusErrorAttributedStringForAccountWithErrors:", v53));
    v47 = (id)objc_claimAutoreleasedReturnValue(-[MailStatusViewController actionBlockForAccountError:error:description:failureReason:](self, "actionBlockForAccountError:error:description:failureReason:", v53, v11, v62, v56));
    -[MailStatusViewController setPressedBlock:](self, "setPressedBlock:", v47);
    v10 = (void *)v46;
    goto LABEL_57;
  }
  if (v60)
  {
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusViewController scene](self, "scene"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "masterNavigationController"));

    v66[0] = _NSConcreteStackBlock;
    v66[1] = 3221225472;
    v66[2] = sub_1000FBF4C;
    v66[3] = &unk_10051AA98;
    v67 = v49;
    v47 = v49;
    -[MailStatusViewController setPressedBlock:](self, "setPressedBlock:", v66);

    v10 = 0;
LABEL_57:

  }
  else
  {
    v10 = 0;
  }
  if (!v65)
    v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
LABEL_13:
  v13 = objc_alloc_init(MailStatusInfo);
  -[MailStatusInfo setState:](v13, "setState:", v61);
  if (v9)
    v14 = v9;
  else
    v14 = v58;
  -[MailStatusInfo setStatus:](v13, "setStatus:", v14, v50);
  -[MailStatusInfo setHasAccountError:](v13, "setHasAccountError:", objc_msgSend(v53, "count") != 0);
  -[MailStatusInfo setLastUpdateTime:](v13, "setLastUpdateTime:", v65);
  v15 = -[MailStatusViewController shouldShowSubtitle](self, "shouldShowSubtitle");
  if (v60)
    v16 = 1;
  else
    v16 = v15;
  -[MailStatusInfo setShouldShowSubtitle:](v13, "setShouldShowSubtitle:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusViewController networkStatusErrorString](self, "networkStatusErrorString"));
  -[MailStatusInfo setNetworkingAccountErrorString:](v13, "setNetworkingAccountErrorString:", v17);

  -[MailStatusInfo setAccountErrorString:](v13, "setAccountErrorString:", v10);
  -[MailStatusInfo setBadgeCount:](v13, "setBadgeCount:", -[MailStatusViewController badgeCount](self, "badgeCount"));
  -[MailStatusInfo setUnsentCount:](v13, "setUnsentCount:", v51);
  -[MailStatusInfo setProgress:](v13, "setProgress:", v59);
  -[MailStatusInfo setICloudQuotaOfferText:](v13, "setICloudQuotaOfferText:", v64);
  -[MailStatusInfo setICloudQuotaOfferLink:](v13, "setICloudQuotaOfferLink:", v60);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusViewController statusInfo](self, "statusInfo"));
  v19 = -[MailStatusInfo isEqual:](v13, "isEqual:", v18);

  if ((v19 & 1) == 0)
  {
    v20 = objc_claimAutoreleasedReturnValue(+[MailStatusViewController log](MailStatusViewController, "log"));
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusInfo ef_publicDescription](v13, "ef_publicDescription"));
      *(_DWORD *)buf = 134218242;
      v77 = self;
      v78 = 2112;
      v79 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%p rebuildStatus - setting new statusInfo:%@", buf, 0x16u);

    }
    -[MailStatusViewController setStatusInfo:](self, "setStatusInfo:", v13);
  }

  return v19 ^ 1;
}

- (BOOL)shouldShowSubtitle
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusViewController delegate](self, "delegate"));
  v3 = objc_msgSend(v2, "shouldShowSubtitle");

  return v3;
}

- (MailStatusDelegate)delegate
{
  return (MailStatusDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)signpostPreviousStatus:(id)a3 andCurrentStatus:(id)a4 usingMailboxObjectID:(id)a5
{
  id v8;
  id v9;
  id v10;
  _BOOL4 v11;
  _BOOL4 v12;
  NSObject *v13;
  os_signpost_id_t v14;
  NSString *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  const char *v26;
  NSObject *v27;
  os_signpost_type_t v28;
  NSObject *v29;
  NSObject *v30;
  id v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;

  v8 = a3;
  v9 = a4;
  v31 = v8;
  v32 = a5;
  v10 = objc_msgSend(v8, "state");
  if (v10 == objc_msgSend(v9, "state"))
  {
    v11 = 0;
    v12 = 0;
  }
  else
  {
    v11 = objc_msgSend(v8, "state") == (id)1;
    v12 = objc_msgSend(v9, "state") == (id)1;
  }
  v13 = objc_claimAutoreleasedReturnValue(+[MailStatusViewController signpostLog](MailStatusViewController, "signpostLog"));
  v14 = os_signpost_id_make_with_pointer(v13, self);

  v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p>"), objc_opt_class(self), self);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "ef_publicDescription"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ef_publicDescription"));
  v19 = v9;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ef_publicDescription"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("mailbox=%@\n    previously= %@\n    currently=  %@"), v17, v18, v20));

  if (v11)
  {
    v22 = v31;
    v23 = v19;
    v24 = objc_claimAutoreleasedReturnValue(+[MailStatusViewController signpostLog](MailStatusViewController, "signpostLog"));
    v25 = v24;
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      *(_DWORD *)buf = 138543618;
      v34 = v16;
      v35 = 2114;
      v36 = v21;
      v26 = "%{public, signpost.telemetry:string1}@\nBegin: %{public, signpost.telemetry:string2}@ enableTelemetry=YES ";
      v27 = v25;
      v28 = OS_SIGNPOST_INTERVAL_BEGIN;
LABEL_15:
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v27, v28, v14, "Mail Status Activity", v26, buf, 0x16u);
    }
  }
  else
  {
    v22 = v31;
    v23 = v19;
    if (v12)
    {
      v29 = objc_claimAutoreleasedReturnValue(+[MailStatusViewController signpostLog](MailStatusViewController, "signpostLog"));
      v25 = v29;
      if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
      {
        *(_DWORD *)buf = 138543618;
        v34 = v16;
        v35 = 2114;
        v36 = v21;
        v26 = "%{public, signpost.telemetry:string1}@\nEnd: %{public, signpost.telemetry:string2}@ enableTelemetry=YES ";
        v27 = v25;
        v28 = OS_SIGNPOST_INTERVAL_END;
        goto LABEL_15;
      }
    }
    else
    {
      v30 = objc_claimAutoreleasedReturnValue(+[MailStatusViewController signpostLog](MailStatusViewController, "signpostLog"));
      v25 = v30;
      if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
      {
        *(_DWORD *)buf = 138543618;
        v34 = v16;
        v35 = 2114;
        v36 = v21;
        v26 = "%{public, signpost.telemetry:string1}@\n"
              "Event: %{public, signpost.telemetry:string2}@ enableTelemetry=YES ";
        v27 = v25;
        v28 = OS_SIGNPOST_EVENT;
        goto LABEL_15;
      }
    }
  }

}

+ (id)signpostLog
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003BC70;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005A9E50 != -1)
    dispatch_once(&qword_1005A9E50, block);
  return (id)qword_1005A9E48;
}

- (void)updateBarItemTitle:(id)a3 secondaryTitle:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusViewController mailStatusBarButtonItem](self, "mailStatusBarButtonItem"));
  if (v7)
  {
    v8 = objc_msgSend(v11, "length");

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](NSMutableString, "stringWithString:", v11));
      if (-[MailStatusViewController shouldShowSubtitle](self, "shouldShowSubtitle") && objc_msgSend(v6, "length"))
      {
        objc_msgSend(v9, "appendString:", CFSTR("\n\n"));
        objc_msgSend(v9, "appendString:", v6);
      }
      if (objc_msgSend(v9, "length"))
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusViewController mailStatusBarButtonItem](self, "mailStatusBarButtonItem"));
        objc_msgSend(v10, "setTitle:", v9);

      }
    }
  }

}

- (UIBarButtonItem)mailStatusBarButtonItem
{
  return self->_mailStatusBarButtonItem;
}

- (void)tintColorDidChange
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusViewController statusBarView](self, "statusBarView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tintColor"));
  -[MailStatusViewController setStatusBarViewTintColor:](self, "setStatusBarViewTintColor:", v4);

  -[MailStatusViewController _performStatusUpdate](self, "_performStatusUpdate");
}

- (MailStatusObserver)statusObserver
{
  return self->_statusObserver;
}

- (MailStatusBarView)statusBarView
{
  return self->_statusBarView;
}

- (void)setStatusBarViewTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_statusBarViewTintColor, a3);
}

- (void)setPressedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void)setBadgeCountStatusMailboxes:(id)a3
{
  objc_storeStrong((id *)&self->_badgeCountStatusMailboxes, a3);
}

- (void)setBadgeCount:(int64_t)a3
{
  self->_badgeCount = a3;
}

- (void)setActivityStatusMailboxes:(id)a3
{
  objc_storeStrong((id *)&self->_activityStatusMailboxes, a3);
}

- (void)resetAccountErrors
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusViewController mailboxStatusScheduler](self, "mailboxStatusScheduler"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000D2A4;
  v4[3] = &unk_10051AA98;
  v4[4] = self;
  objc_msgSend(v3, "performSyncBlock:", v4);

}

- (BOOL)preferUnreadCountInsteadOfTotalCount:(id)a3
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusViewController delegate](self, "delegate", a3));
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "shouldShowSubtitle");
  else
    v5 = 0;

  return v5;
}

- (EMOutgoingMessageRepository)outgoingMessageRepository
{
  return self->_outgoingMessageRepository;
}

- (void)numberOfPendingMessagesChanged:(unint64_t)a3
{
  os_unfair_lock_s *p_numberOfPendingMessagesLock;

  p_numberOfPendingMessagesLock = &self->_numberOfPendingMessagesLock;
  os_unfair_lock_lock(&self->_numberOfPendingMessagesLock);
  if (self->_numberOfPendingMessages == a3)
  {
    os_unfair_lock_unlock(p_numberOfPendingMessagesLock);
  }
  else
  {
    self->_numberOfPendingMessages = a3;
    os_unfair_lock_unlock(p_numberOfPendingMessagesLock);
    -[MailStatusViewController _performStatusUpdate](self, "_performStatusUpdate");
  }
}

- (EFScheduler)mailboxStatusScheduler
{
  return self->_mailboxStatusScheduler;
}

- (NSMutableDictionary)mailboxStatusInfos
{
  return self->_mailboxStatusInfos;
}

- (int64_t)badgeCount
{
  return self->_badgeCount;
}

- (void)badgeCountUpdated:(id)a3 badgeCount:(int64_t)a4
{
  void *v6;
  _QWORD v7[6];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusViewController mailboxStatusScheduler](self, "mailboxStatusScheduler", a3));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003B074;
  v7[3] = &unk_10051ABD8;
  v7[4] = self;
  v7[5] = a4;
  objc_msgSend(v6, "performBlock:", v7);

  -[MailStatusViewController _performStatusUpdate](self, "_performStatusUpdate");
}

- (NSArray)badgeCountStatusMailboxes
{
  return self->_badgeCountStatusMailboxes;
}

- (void)_performStatusUpdate
{
  -[MailStatusViewController _performStatusUpdateAndSignpostForMailboxObjectID:](self, "_performStatusUpdateAndSignpostForMailboxObjectID:", 0);
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003C344;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005A9E40 != -1)
    dispatch_once(&qword_1005A9E40, block);
  return (OS_os_log *)(id)qword_1005A9E38;
}

- (unint64_t)signpostID
{
  id v3;
  NSObject *v4;
  os_signpost_id_t v5;

  v3 = objc_msgSend((id)objc_opt_class(self), "signpostLog");
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = os_signpost_id_make_with_pointer(v4, self);

  return v5;
}

- (void)_subtitlePressed
{
  void *v3;
  void (**v4)(void);

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusViewController pressedBlock](self, "pressedBlock"));

  if (v3)
  {
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[MailStatusViewController pressedBlock](self, "pressedBlock"));
    v4[2]();

  }
}

- (int64_t)currentState
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusViewController statusInfo](self, "statusInfo"));
  v3 = objc_msgSend(v2, "state");

  return (int64_t)v3;
}

- (void)currentStatusInfoWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusViewController mailboxStatusScheduler](self, "mailboxStatusScheduler"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000FC1D8;
  v7[3] = &unk_10051B3B0;
  v6 = v4;
  v7[4] = self;
  v8 = v6;
  objc_msgSend(v5, "performBlock:", v7);

}

- (int64_t)interfaceOrientation
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusViewController scene](self, "scene"));
  v3 = objc_msgSend(v2, "interfaceOrientation");

  return (int64_t)v3;
}

- (void)mailStatusBarViewUndoButtonTapped:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "mailStatusViewControllerUndoButtonTapped:", self);

}

- (void)hasDelayedMessagesDidChange:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_hasDelayedMessagesLock;

  v3 = a3;
  p_hasDelayedMessagesLock = &self->_hasDelayedMessagesLock;
  os_unfair_lock_lock(&self->_hasDelayedMessagesLock);
  if (self->_hasDelayedMessages == v3)
  {
    os_unfair_lock_unlock(p_hasDelayedMessagesLock);
  }
  else
  {
    self->_hasDelayedMessages = v3;
    os_unfair_lock_unlock(p_hasDelayedMessagesLock);
    -[MailStatusViewController _performStatusUpdate](self, "_performStatusUpdate");
  }
}

- (id)accountStatusErrorAttributedStringForAccountWithErrors:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v20;
  NSAttributedStringKey v21;
  void *v22;
  NSAttributedStringKey v23;
  void *v24;

  v4 = a3;
  v23 = NSForegroundColorAttributeName;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
  v24 = v5;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));

  if (objc_msgSend(v4, "count") == (id)1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("ACCOUNT_ERROR"), &stru_100531B00, CFSTR("Main")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v9));

  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("ACCOUNT_ERRORS"), &stru_100531B00, CFSTR("Main")));
  }

  v11 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithString:attributes:", v10, v20);
  v21 = NSForegroundColorAttributeName;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusViewController statusBarViewTintColor](self, "statusBarViewTintColor"));
  v22 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));

  v14 = objc_alloc((Class)NSAttributedString);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("ACCOUNT_ERROR_DETAILS"), &stru_100531B00, CFSTR("Main")));
  v17 = objc_msgSend(v14, "initWithString:attributes:", v16, v13);

  v18 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", CFSTR(" "));
  objc_msgSend(v11, "appendAttributedString:", v18);

  objc_msgSend(v11, "appendAttributedString:", v17);
  return v11;
}

- (id)actionBlockForAccountError:(id)a3 error:(id)a4 description:(id)a5 failureReason:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  _QWORD *v27;
  _QWORD *v28;
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;

  v9 = a3;
  v10 = a4;
  v31 = a5;
  v30 = a6;
  if (objc_msgSend(v9, "count") == (id)1)
  {
    v11 = objc_msgSend(v10, "code");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", MFMessageErrorDomain, v11, v31));
    objc_msgSend(v12, "setUserInfoObject:forKey:", v30, NSLocalizedFailureReasonErrorKey);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "representedObjectID"));

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[MailAccount accountWithUniqueId:](MailAccount, "accountWithUniqueId:", v15));
  }
  else
  {
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_1000FCCCC;
    v35[3] = &unk_10051ECA0;
    v36 = v10;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ef_compactMap:", v35));
    v18 = objc_alloc_init((Class)MUILocalizationListFormatter);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringFromList:", v17));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("MULTIPLE_ACCOUNT_ERRORS_DESCRIPTION %@"), &stru_100531B00, CFSTR("Main")));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v21, v19));

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("MULTIPLE_ACCOUNT_ERRORS"), &stru_100531B00, CFSTR("Main")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MFError errorWithDomain:code:localizedDescription:title:userInfo:](MFError, "errorWithDomain:code:localizedDescription:title:userInfo:", MFMessageErrorDomain, 1042, v22, v24, 0));

    v16 = 0;
    v15 = v36;
  }

  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_1000FCDE0;
  v32[3] = &unk_10051A910;
  v33 = v12;
  v34 = v16;
  v25 = v16;
  v26 = v12;
  v27 = objc_retainBlock(v32);
  v28 = objc_retainBlock(v27);

  return v28;
}

- (void)setMailStatusBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_mailStatusBarButtonItem, a3);
}

- (void)setStatusBarView:(id)a3
{
  objc_storeStrong((id *)&self->_statusBarView, a3);
}

- (UIColor)statusBarViewTintColor
{
  return self->_statusBarViewTintColor;
}

- (EMMailboxRepository)mailboxRepository
{
  return self->_mailboxRepository;
}

- (void)setMailboxRepository:(id)a3
{
  objc_storeStrong((id *)&self->_mailboxRepository, a3);
}

- (void)setOutgoingMessageRepository:(id)a3
{
  objc_storeStrong((id *)&self->_outgoingMessageRepository, a3);
}

- (void)setStatusObserver:(id)a3
{
  objc_storeStrong((id *)&self->_statusObserver, a3);
}

- (EFCancelable)progressObserverCancelable
{
  return self->_progressObserverCancelable;
}

- (void)setProgressObserverCancelable:(id)a3
{
  objc_storeStrong((id *)&self->_progressObserverCancelable, a3);
}

- (id)pressedBlock
{
  return self->_pressedBlock;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setMailboxStatusInfos:(id)a3
{
  objc_storeStrong((id *)&self->_mailboxStatusInfos, a3);
}

- (MailMainScene)scene
{
  return (MailMainScene *)objc_loadWeakRetained((id *)&self->_scene);
}

- (void)setScene:(id)a3
{
  objc_storeWeak((id *)&self->_scene, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_mailboxStatusInfos, 0);
  objc_storeStrong((id *)&self->_badgeCountStatusMailboxes, 0);
  objc_storeStrong((id *)&self->_activityStatusMailboxes, 0);
  objc_storeStrong((id *)&self->_mailboxStatusScheduler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_pressedBlock, 0);
  objc_storeStrong((id *)&self->_progressObserverCancelable, 0);
  objc_storeStrong((id *)&self->_statusObserver, 0);
  objc_storeStrong((id *)&self->_outgoingMessageRepository, 0);
  objc_storeStrong((id *)&self->_mailboxRepository, 0);
  objc_storeStrong((id *)&self->_statusBarViewTintColor, 0);
  objc_storeStrong((id *)&self->_statusBarView, 0);
  objc_storeStrong((id *)&self->_mailStatusBarButtonItem, 0);
  objc_storeStrong((id *)&self->_statusInfo, 0);
}

@end
