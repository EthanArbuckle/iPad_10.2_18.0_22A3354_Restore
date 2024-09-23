@implementation MailStatusObserver

- (void)messageRepository:(id)a3 query:(id)a4 countDidChange:(int64_t)a5
{
  id v7;

  -[MailStatusObserver setBadgeCount:](self, "setBadgeCount:", a5, a4);
  v7 = (id)objc_claimAutoreleasedReturnValue(-[MailStatusObserver delegate](self, "delegate"));
  if (v7)
    objc_msgSend(v7, "badgeCountUpdated:badgeCount:", self, a5);

}

- (EFCancelationToken)activityObserverCancelable
{
  return self->_activityObserverCancelable;
}

- (NSMutableArray)mailboxesToIgnoreFirstError
{
  return self->_mailboxesToIgnoreFirstError;
}

- (MailStatusObserver)initWithMailboxRepository:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  MailStatusObserver *v9;
  MailStatusObserver *v10;
  dispatch_queue_attr_t v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  NSMutableArray *v15;
  NSMutableArray *mailboxesToIgnoreFirstError;
  MailStatusObserver *v17;
  uint64_t v18;
  id networkObserverID;
  uint64_t v20;
  EFScheduler *activityStatusUpdateScheduler;
  void *v22;
  void *v23;
  uint64_t v24;
  EMActivityRegistry *activityRegistry;
  void **v27;
  uint64_t v28;
  id (*v29)(uint64_t);
  void *v30;
  id v31;
  MailStatusObserver *v32;
  objc_super v33;

  v7 = a3;
  v8 = a4;
  v33.receiver = self;
  v33.super_class = (Class)MailStatusObserver;
  v9 = -[MailStatusObserver init](&v33, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mailboxRepository, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = dispatch_queue_create("com.apple.mobilemail.statusobserver", v12);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v13;

    v15 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    mailboxesToIgnoreFirstError = v10->_mailboxesToIgnoreFirstError;
    v10->_mailboxesToIgnoreFirstError = v15;

    v27 = _NSConcreteStackBlock;
    v28 = 3221225472;
    v29 = sub_10003B07C;
    v30 = &unk_10051A910;
    v31 = v8;
    v17 = v10;
    v32 = v17;
    v18 = objc_claimAutoreleasedReturnValue(+[MFNetworkController addNetworkObserverBlock:queue:](MFNetworkController, "addNetworkObserverBlock:queue:", &v27, v10->_queue));
    networkObserverID = v17->_networkObserverID;
    v17->_networkObserverID = (id)v18;

    atomic_store(0, &v17->_currentStatusObserverID);
    v20 = objc_claimAutoreleasedReturnValue(+[EFScheduler serialDispatchQueueSchedulerWithName:qualityOfService:](EFScheduler, "serialDispatchQueueSchedulerWithName:qualityOfService:", CFSTR("com.apple.mobilemail.statusobserver.activityRegistryUpdate"), 17, v27, v28, v29, v30));
    activityStatusUpdateScheduler = v17->_activityStatusUpdateScheduler;
    v17->_activityStatusUpdateScheduler = (EFScheduler *)v20;

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "daemonInterface"));
    v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "activityRegistry"));
    activityRegistry = v17->_activityRegistry;
    v17->_activityRegistry = (EMActivityRegistry *)v24;

  }
  return v10;
}

- (void)startObservingForActivityStatusMailboxes:(id)a3 badgeCountStatusMailboxes:(id)a4 filterPredicate:(id)a5 label:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  EFScheduler *activityStatusUpdateScheduler;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[MailStatusObserver stopObserving](self, "stopObserving");
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  activityStatusUpdateScheduler = self->_activityStatusUpdateScheduler;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100025BF8;
  v19[3] = &unk_10051EAE8;
  objc_copyWeak(&v24, &location);
  v15 = v10;
  v20 = v15;
  v16 = v11;
  v21 = v16;
  v17 = v12;
  v22 = v17;
  v18 = v13;
  v23 = v18;
  -[EFScheduler performBlock:](activityStatusUpdateScheduler, "performBlock:", v19);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

}

- (void)_startBadgeCountObserversWithLabel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusObserver badgeCountStatusMailboxes](self, "badgeCountStatusMailboxes"));
  if (objc_msgSend(v5, "count"))
  {
    v28 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusObserver delegate](self, "delegate"));
    v27 = v6;
    if (v6)
      v7 = objc_msgSend(v6, "preferUnreadCountInsteadOfTotalCount:", self);
    else
      v7 = 0;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[EMMessageListItemPredicates predicateForMessagesInMailboxes:](EMMessageListItemPredicates, "predicateForMessagesInMailboxes:", v5));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", v8));

    v26 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusObserver filterPredicate](self, "filterPredicate"));
    if (v10)
      objc_msgSend(v9, "addObject:", v10);
    if (v7)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[EMMessageListItemPredicates predicateForUnreadMessages](EMMessageListItemPredicates, "predicateForUnreadMessages"));
      if ((objc_msgSend(v10, "isEqual:", v11) & 1) == 0)
        objc_msgSend(v9, "addObject:", v11);

    }
    v24 = objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate ef_andCompoundPredicateWithSubpredicates:](NSCompoundPredicate, "ef_andCompoundPredicateWithSubpredicates:", v9));
    v29 = objc_msgSend(objc_alloc((Class)EMQuery), "initWithTargetClass:predicate:sortDescriptors:queryOptions:label:", objc_opt_class(EMMessage), v24, &__NSArray0__struct, 0, v4);
    v40 = 0;
    v41 = &v40;
    v42 = 0x3032000000;
    v43 = sub_1000FAD84;
    v44 = sub_1000FAD94;
    v45 = 0;
    v36 = 0;
    v37 = &v36;
    v38 = 0x2020000000;
    v39 = 0;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_10003B088;
    v32[3] = &unk_10051EBB0;
    v34 = &v40;
    v12 = objc_alloc_init((Class)NSMutableSet);
    v33 = v12;
    v35 = &v36;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ef_filter:", v32));
    v14 = v13;
    if (*((_BYTE *)v37 + 24))
    {
      v15 = 0;
    }
    else if (objc_msgSend(v13, "count", v24) || objc_msgSend(v12, "count"))
    {
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_100008390;
      v30[3] = &unk_10051B028;
      v16 = v12;
      v31 = v16;
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "ef_filter:", v30));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "ef_mapSelector:", "objectID"));

      v19 = objc_msgSend(objc_alloc((Class)NSSet), "initWithArray:", v18);
      v15 = objc_msgSend(objc_alloc((Class)EMMailboxScope), "initWithMailboxTypes:excludeTypes:mailboxObjectIDs:excludeMailboxes:", v16, 0, v19, 0);

    }
    else
    {
      v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v41[5], "mailboxScope"));
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication", v24));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "daemonInterface"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "messageRepository"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "startCountingQuery:includingServerCountsForMailboxScope:withObserver:", v29, v15, self));
    -[MailStatusObserver setBadgeCountObserverCancelable:](self, "setBadgeCountObserverCancelable:", v23);

    _Block_object_dispose(&v36, 8);
    _Block_object_dispose(&v40, 8);

    v4 = v28;
  }

}

- (MailStatusObserverDelegate)delegate
{
  return (MailStatusObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)_isMailboxObjectIDInActivityStatusMailboxes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusObserver activityStatusMailboxes](self, "activityStatusMailboxes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusObserver mailboxRepository](self, "mailboxRepository"));
  v7 = 0;
  if (v6 && v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[EMMessageListItemPredicates predicateForMessagesInMailboxes:](EMMessageListItemPredicates, "predicateForMessagesInMailboxes:", v5));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[EMMessageListItemPredicates mailboxScopeForPredicate:withMailboxTypeResolver:](EMMessageListItemPredicates, "mailboxScopeForPredicate:withMailboxTypeResolver:", v8, v6));
    v7 = objc_msgSend(v9, "scopeContainsMailboxObjectID:mailboxTypeResolver:", v4, v6);

  }
  return v7;
}

- (EMMailboxRepository)mailboxRepository
{
  return self->_mailboxRepository;
}

- (NSArray)activityStatusMailboxes
{
  return self->_activityStatusMailboxes;
}

- (void)stopObserving
{
  EFScheduler *activityStatusUpdateScheduler;
  _QWORD v4[4];
  id v5;
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  activityStatusUpdateScheduler = self->_activityStatusUpdateScheduler;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001DE14;
  v4[3] = &unk_10051B1B8;
  objc_copyWeak(&v5, &location);
  -[EFScheduler performBlock:](activityStatusUpdateScheduler, "performBlock:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)activityRegistry:(id)a3 startedActivity:(id)a4
{
  id v5;
  id v6;
  _QWORD *v7;
  void *v8;
  EFScheduler *activityStatusUpdateScheduler;
  _QWORD *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15[2];
  _QWORD v16[4];
  id v17;
  id v18;
  id location;

  v5 = a4;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10001A4F4;
  v16[3] = &unk_10051EB10;
  objc_copyWeak(&v18, &location);
  v6 = v5;
  v17 = v6;
  v7 = objc_retainBlock(v16);
  v8 = (void *)atomic_load(&self->_currentStatusObserverID);
  activityStatusUpdateScheduler = self->_activityStatusUpdateScheduler;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002E620;
  v12[3] = &unk_10051EB88;
  objc_copyWeak(v15, &location);
  v15[1] = v8;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  -[EFScheduler performBlock:](activityStatusUpdateScheduler, "performBlock:", v12);

  objc_destroyWeak(v15);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)startObservingForVisibleMailboxes:(id)a3 filterPredicate:(id)a4 label:(id)a5
{
  -[MailStatusObserver startObservingForActivityStatusMailboxes:badgeCountStatusMailboxes:filterPredicate:label:](self, "startObservingForActivityStatusMailboxes:badgeCountStatusMailboxes:filterPredicate:label:", a3, a3, a4, a5);
}

- (void)setFilterPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_filterPredicate, a3);
}

- (void)setBadgeCountStatusMailboxes:(id)a3
{
  objc_storeStrong((id *)&self->_badgeCountStatusMailboxes, a3);
}

- (void)setBadgeCountObserverCancelable:(id)a3
{
  objc_storeStrong((id *)&self->_badgeCountObserverCancelable, a3);
}

- (void)setBadgeCount:(int64_t)a3
{
  self->_badgeCount = a3;
}

- (void)setActivityStatusMailboxes:(id)a3
{
  objc_storeStrong((id *)&self->_activityStatusMailboxes, a3);
}

- (void)setActivityObserverCancelable:(id)a3
{
  objc_storeStrong((id *)&self->_activityObserverCancelable, a3);
}

- (void)icqOfferDidChange:(id)a3
{
  void *v4;
  _QWORD v5[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICQOfferManager sharedOfferManager](ICQOfferManager, "sharedOfferManager", a3));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000166C0;
  v5[3] = &unk_10051EBD8;
  v5[4] = self;
  objc_msgSend(v4, "getOfferWithCompletion:", v5);

}

- (NSPredicate)filterPredicate
{
  return self->_filterPredicate;
}

- (void)checkForiCloudQuotaUpsellOffer
{
  -[MailStatusObserver icqOfferDidChange:](self, "icqOfferDidChange:", 0);
}

- (int64_t)badgeCount
{
  return self->_badgeCount;
}

- (NSArray)badgeCountStatusMailboxes
{
  return self->_badgeCountStatusMailboxes;
}

- (EFCancelable)badgeCountObserverCancelable
{
  return self->_badgeCountObserverCancelable;
}

- (EMActivityRegistry)activityRegistry
{
  return self->_activityRegistry;
}

- (int64_t)_matchingMailStatusState:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return 0xAAAAAAAAAAAAAAAALL;
  else
    return qword_1004C9670[a3];
}

- (void)dealloc
{
  id networkObserverID;
  objc_super v4;

  sub_10001DE5C(self);
  if (self->_networkObserverID)
  {
    +[MFNetworkController removeNetworkObserver:](MFNetworkController, "removeNetworkObserver:");
    networkObserverID = self->_networkObserverID;
    self->_networkObserverID = 0;

  }
  v4.receiver = self;
  v4.super_class = (Class)MailStatusObserver;
  -[MailStatusObserver dealloc](&v4, "dealloc");
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setMailboxRepository:(id)a3
{
  objc_storeStrong((id *)&self->_mailboxRepository, a3);
}

- (EMOutgoingMessageRepository)outgoingMessageRepository
{
  return self->_outgoingMessageRepository;
}

- (void)setOutgoingMessageRepository:(id)a3
{
  objc_storeStrong((id *)&self->_outgoingMessageRepository, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setActivityRegistry:(id)a3
{
  objc_storeStrong((id *)&self->_activityRegistry, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailboxesToIgnoreFirstError, 0);
  objc_storeStrong((id *)&self->_badgeCountObserverCancelable, 0);
  objc_storeStrong((id *)&self->_activityObserverCancelable, 0);
  objc_storeStrong((id *)&self->_activityRegistry, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_filterPredicate, 0);
  objc_storeStrong((id *)&self->_badgeCountStatusMailboxes, 0);
  objc_storeStrong((id *)&self->_activityStatusMailboxes, 0);
  objc_storeStrong((id *)&self->_outgoingMessageRepository, 0);
  objc_storeStrong((id *)&self->_mailboxRepository, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_networkObserverID, 0);
  objc_storeStrong((id *)&self->_activityStatusUpdateScheduler, 0);
}

@end
