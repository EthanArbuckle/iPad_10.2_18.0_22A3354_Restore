@implementation SharedMailboxController

- (void)_startCountQueryIfNeededWithToken:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  id v8;
  NSObject *v9;
  _DWORD v10[2];
  __int16 v11;
  void *v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SharedMailboxController unreadCountToken](self, "unreadCountToken"));
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "isCanceled");
  else
    v7 = 1;
  v8 = sub_10003A048();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109378;
    v10[1] = v7;
    v11 = 2114;
    v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Starting count query %{BOOL}d token: %{public}@", (uint8_t *)v10, 0x12u);
  }

  if (v7)
  {
    -[SharedMailboxController _updateMailboxes](self, "_updateMailboxes");
    -[SharedMailboxController _startCountQueryWithToken:](self, "_startCountQueryWithToken:", v4);
  }

}

- (void)_updateMailboxes
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSArray *v12;
  NSArray *mailboxes;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  -[EFSuspendableScheduler assertIsExecuting:](self->_scheduler, "assertIsExecuting:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "accountsProvider"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "displayedAccounts"));

  v6 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v5, "count"));
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v7);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v10), "primaryMailboxUid", (_QWORD)v14));
        objc_msgSend(v6, "addObject:", v11);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = (NSArray *)objc_msgSend(v6, "copy");
  mailboxes = self->_mailboxes;
  self->_mailboxes = v12;

}

+ (id)sharedInstanceForSourceType:(unint64_t)a3
{
  void *v6;
  void *v7;
  void *v8;
  int IsValid;
  int v10;
  void *v11;

  if (a3 && _MSSourceTypeIsValid(a3))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sharedInstanceMapping"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v7));

    IsValid = _MSSourceTypeIsValid(a3);
    if (v8)
      v10 = 0;
    else
      v10 = IsValid;
    if (v10 == 1)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SharedMailboxController.m"), 146, CFSTR("Unsupported source type"));

    }
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)_startCountQueryWithToken:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v17;
  NSUInteger v18;
  _QWORD v19[5];
  id v20;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  NSUInteger v29;
  _QWORD v30[2];

  v4 = a3;
  -[EFSuspendableScheduler assertIsExecuting:](self->_scheduler, "assertIsExecuting:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SharedMailboxController unreadCountToken](self, "unreadCountToken"));
  objc_msgSend(v5, "cancel");

  -[SharedMailboxController setUnreadCountToken:](self, "setUnreadCountToken:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SharedMailboxController unscopedCountPredicate](self, "unscopedCountPredicate"));
  v7 = objc_msgSend(v6, "copy");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SharedMailboxController mailbox](self, "mailbox"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mailboxScope"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[EMMessageListItemPredicates predicateForMessagesWithMailboxScope:](EMMessageListItemPredicates, "predicateForMessagesWithMailboxScope:", v9));

  if (v10)
  {
    v30[0] = v7;
    v30[1] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v30, 2));
    v12 = objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v11));

    v7 = (id)v12;
  }
  if (v7 && -[NSArray count](self->_mailboxes, "count"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "focusController"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100025E40;
    v19[3] = &unk_1005238F0;
    v19[4] = self;
    v20 = v7;
    v21 = v4;
    objc_msgSend(v14, "getCurrentFocus:", v19);

  }
  else
  {
    v15 = sub_10003A048();
    v16 = (id)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (id)objc_opt_class(self);
      v18 = -[NSArray count](self->_mailboxes, "count");
      *(_DWORD *)buf = 138544130;
      v23 = v17;
      v24 = 2048;
      v25 = v10;
      v26 = 2048;
      v27 = v7;
      v28 = 2048;
      v29 = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ not starting query: scopePredicate: %p, countPredicate: %p, _mailboxes.count %ld", buf, 0x2Au);

    }
  }

}

- (SharedMailboxController)initWithType:(unint64_t)a3
{
  SharedMailboxController *v4;
  SharedMailboxController *v5;
  id v6;
  uint64_t v7;
  EMSmartMailbox *mailbox;
  NSString *v9;
  void *v10;
  uint64_t v11;
  EFSuspendableScheduler *scheduler;
  void *v13;
  void *v14;
  uint64_t v15;
  MFMessageCriterion *criterion;
  id v17;
  void *v18;
  SharedMailboxController *v19;
  EFDebouncer *v20;
  EFDebouncer *badgeCountDebouncer;
  _QWORD v23[4];
  SharedMailboxController *v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)SharedMailboxController;
  v4 = -[SharedMailboxController init](&v25, "init");
  v5 = v4;
  if (v4)
  {
    v4->_lock._os_unfair_lock_opaque = 0;
    v4->_sourceType = a3;
    v6 = objc_msgSend((id)objc_opt_class(v4), "sharedSmartMailboxForSourceType:", a3);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    mailbox = v5->_mailbox;
    v5->_mailbox = (EMSmartMailbox *)v7;

    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.mobilemail.%@"), objc_opt_class(v5));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = objc_claimAutoreleasedReturnValue(+[EFScheduler serialDispatchQueueSchedulerWithName:](EFScheduler, "serialDispatchQueueSchedulerWithName:", v10));
    scheduler = v5->_scheduler;
    v5->_scheduler = (EFSuspendableScheduler *)v11;

    -[EFSuspendableScheduler suspend](v5->_scheduler, "suspend");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SharedMailboxController lastInitialBadgeCountDefaultKey](v5, "lastInitialBadgeCountDefaultKey"));
    v5->_badgeCount = (int64_t)objc_msgSend(v13, "integerForKey:", v14);

    v15 = objc_claimAutoreleasedReturnValue(-[SharedMailboxController unreadCriterion](v5, "unreadCriterion"));
    criterion = v5->_criterion;
    v5->_criterion = (MFMessageCriterion *)v15;

    v17 = objc_alloc((Class)EFDebouncer);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100016D5C;
    v23[3] = &unk_10051B950;
    v19 = v5;
    v24 = v19;
    v20 = (EFDebouncer *)objc_msgSend(v17, "initWithTimeInterval:scheduler:startAfter:block:", v18, 1, v23, 0.2);
    badgeCountDebouncer = v19->_badgeCountDebouncer;
    v19->_badgeCountDebouncer = v20;

  }
  return v5;
}

- (id)lastInitialBadgeCountDefaultKey
{
  objc_class *v2;
  NSString *v3;
  void *v4;
  void *v5;

  v2 = (objc_class *)objc_opt_class(self);
  v3 = NSStringFromClass(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@BadgeCount"), v4));

  return v5;
}

+ (id)sharedSmartMailboxForSourceType:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (qword_1005AA568 != -1)
    dispatch_once(&qword_1005AA568, &stru_1005238C8);
  v4 = (void *)qword_1005AA560;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v5));

  return v6;
}

- (void)resume
{
  EFSuspendableScheduler *scheduler;
  id v4;
  _QWORD v5[5];

  -[EFSuspendableScheduler resume](self->_scheduler, "resume");
  if (-[SharedMailboxController alwaysActiveCountQuery](self, "alwaysActiveCountQuery"))
  {
    scheduler = self->_scheduler;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10003C0BC;
    v5[3] = &unk_10051C5E0;
    v5[4] = self;
    v4 = -[EFSuspendableScheduler performCancelableBlock:](scheduler, "performCancelableBlock:", v5);
  }
}

- (EFCancelable)unreadCountToken
{
  return self->_unreadCountToken;
}

- (id)startCountQuery
{
  id v3;
  id v4;
  void *v5;
  id v6;
  EFSuspendableScheduler *scheduler;
  void *v8;
  _QWORD v10[5];

  v3 = objc_alloc((Class)EFCancelationToken);
  v4 = objc_msgSend((id)objc_opt_class(self), "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_msgSend(v3, "initWithLabel:", v5);

  if (!-[SharedMailboxController alwaysActiveCountQuery](self, "alwaysActiveCountQuery"))
  {
    scheduler = self->_scheduler;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10003BA38;
    v10[3] = &unk_10051C5E0;
    v10[4] = self;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[EFSuspendableScheduler performCancelableBlock:](scheduler, "performCancelableBlock:", v10));
    objc_msgSend(v6, "addCancelable:", v8);

  }
  return v6;
}

- (void)setUnreadCountToken:(id)a3
{
  objc_storeStrong((id *)&self->_unreadCountToken, a3);
}

- (void)setBadgeCount:(int64_t)a3 notifyChange:(BOOL)a4
{
  os_unfair_lock_s *p_lock;
  void *v8;
  int64_t badgeCount;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_badgeCount == a3)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_badgeCount = a3;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    badgeCount = self->_badgeCount;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SharedMailboxController lastInitialBadgeCountDefaultKey](self, "lastInitialBadgeCountDefaultKey"));
    objc_msgSend(v8, "setInteger:forKey:", badgeCount, v10);

    os_unfair_lock_unlock(p_lock);
    if (a4)
    {
      v14 = SharedNetworkControllerBadgeCountKey;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
      v15 = v11;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));

      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v13, "postNotificationName:object:userInfo:", SharedMailboxControllerBadgeCountDidChangeNotification, self, v12);

    }
  }
}

- (void)setBadgeCount:(int64_t)a3
{
  -[SharedMailboxController setBadgeCount:notifyChange:](self, "setBadgeCount:notifyChange:", a3, 1);
}

- (EMMailboxScope)serverCountMailboxScope
{
  return 0;
}

- (void)messageRepository:(id)a3 query:(id)a4 countDidChange:(int64_t)a5
{
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[SharedMailboxController badgeCountDebouncer](self, "badgeCountDebouncer", a3, a4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a5));
  objc_msgSend(v7, "debounceResult:", v6);

}

- (EMSmartMailbox)mailbox
{
  return self->_mailbox;
}

- (EFDebouncer)badgeCountDebouncer
{
  return self->_badgeCountDebouncer;
}

- (BOOL)alwaysActiveCountQuery
{
  return 0;
}

+ (id)sharedInstanceMapping
{
  _QWORD v3[6];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10003136C;
  v3[3] = &unk_1005238A8;
  v3[4] = a2;
  v3[5] = a1;
  if (qword_1005AA558 != -1)
    dispatch_once(&qword_1005AA558, v3);
  return (id)qword_1005AA550;
}

+ (id)allSharedInstances
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sharedInstanceMapping"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allValues"));

  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[EFCancelable cancel](self->_unreadCountToken, "cancel");
  -[EFDebouncer cancel](self->_badgeCountDebouncer, "cancel");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SharedMailboxController;
  -[SharedMailboxController dealloc](&v4, "dealloc");
}

- (void)suspend
{
  -[EFSuspendableScheduler suspend](self->_scheduler, "suspend");
}

- (int64_t)badgeCount
{
  os_unfair_lock_s *p_lock;
  int64_t badgeCount;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  badgeCount = self->_badgeCount;
  os_unfair_lock_unlock(p_lock);
  return badgeCount;
}

- (BOOL)shouldBeDisplayed
{
  return 1;
}

- (id)mailboxTitle
{
  return 0;
}

- (id)navigationTitle
{
  return 0;
}

- (CGPoint)iconOffset
{
  double x;
  double y;
  CGPoint result;

  x = CGPointZero.x;
  y = CGPointZero.y;
  result.y = y;
  result.x = x;
  return result;
}

- (id)iconImage
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SharedMailboxController iconImageName](self, "iconImageName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage mf_systemImageNamed:forView:](UIImage, "mf_systemImageNamed:forView:", v2, 7));

  return v3;
}

- (id)iconTintColor
{
  return 0;
}

- (id)selectedIconTintColor
{
  return +[UIColor mailInteractiveColor](UIColor, "mailInteractiveColor");
}

- (id)icon
{
  os_unfair_lock_s *p_lock;
  UIImage *v4;
  UIImage *icon;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_icon)
  {
    v4 = (UIImage *)objc_claimAutoreleasedReturnValue(-[SharedMailboxController iconImage](self, "iconImage"));
    icon = self->_icon;
    self->_icon = v4;

  }
  os_unfair_lock_unlock(p_lock);
  return self->_icon;
}

- (id)applicationShortcutIconImage
{
  return 0;
}

- (id)applicationShortcutIconName
{
  return -[SharedMailboxController shortcutIconName](self, "shortcutIconName");
}

- (void)invalidateIcon
{
  UIImage *icon;

  icon = self->_icon;
  self->_icon = 0;

}

- (id)criterion
{
  -[SharedMailboxController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[SharedMailboxController criterion]", "SharedMailboxController.m", 289, "0");
}

- (void)presentFromSelectionTarget:(id)a3 item:(id)a4 accessoryTapped:(BOOL)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  id v10;

  v6 = a6;
  v10 = a3;
  v9 = a4;
  objc_msgSend(v10, "selectCombinedInboxWithSourceType:item:animated:", -[SharedMailboxController sourceType](self, "sourceType"), v9, v6);

}

- (NSPredicate)unscopedCountPredicate
{
  return self->_unscopedCountPredicate;
}

- (unint64_t)sourceType
{
  return self->_sourceType;
}

- (void)setSourceType:(unint64_t)a3
{
  self->_sourceType = a3;
}

- (BOOL)wantsDisclosureButton
{
  return self->_wantsDisclosureButton;
}

- (void)setMailbox:(id)a3
{
  objc_storeStrong((id *)&self->_mailbox, a3);
}

- (EFSuspendableScheduler)scheduler
{
  return self->_scheduler;
}

- (BOOL)isObserving
{
  return self->_isObserving;
}

- (void)setIsObserving:(BOOL)a3
{
  self->_isObserving = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_badgeCountDebouncer, 0);
  objc_storeStrong((id *)&self->_unreadCountToken, 0);
  objc_storeStrong((id *)&self->_mailbox, 0);
  objc_storeStrong((id *)&self->_unscopedCountPredicate, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_criterion, 0);
  objc_storeStrong((id *)&self->_mailboxes, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
