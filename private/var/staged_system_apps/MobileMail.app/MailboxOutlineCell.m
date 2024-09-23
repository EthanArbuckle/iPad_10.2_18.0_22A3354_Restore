@implementation MailboxOutlineCell

+ (id)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C9370;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005A9C88 != -1)
    dispatch_once(&qword_1005A9C88, block);
  return (id)qword_1005A9C80;
}

+ (double)defaultRowHeight
{
  return 44.0;
}

- (MailboxOutlineCell)initWithFrame:(CGRect)a3
{
  MailboxOutlineCell *v3;
  MailboxOutlineCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MailboxOutlineCell;
  v3 = -[MailboxOutlineCell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MailboxOutlineCell _resetDebouncer](v3, "_resetDebouncer");
    v4->_cellEnabled = 1;
    -[MailboxOutlineCell setBadgeCount:](v4, "setBadgeCount:", 0);
    -[MailboxOutlineCell setShowFocusIcon:](v4, "setShowFocusIcon:", 0);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[EFCancelable cancel](self->_unreadCountToken, "cancel");
  -[EFDebouncer cancel](self->_countDebouncer, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)MailboxOutlineCell;
  -[MailboxOutlineCell dealloc](&v3, "dealloc");
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MailboxOutlineCell;
  -[MailboxOutlineCell prepareForReuse](&v4, "prepareForReuse");
  -[MailboxOutlineCell setForceZeroSeparatorInset:](self, "setForceZeroSeparatorInset:", 0);
  -[MailboxOutlineCell setExpandable:](self, "setExpandable:", 0);
  -[MailboxOutlineCell setExpanded:](self, "setExpanded:", 0);
  -[MailboxOutlineCell setFlattenHierarchy:](self, "setFlattenHierarchy:", 0);
  -[MailboxOutlineCell setShowsDetailDisclosureButton:](self, "setShowsDetailDisclosureButton:", 0);
  -[MailboxOutlineCell setCanMoveItem:](self, "setCanMoveItem:", 0);
  -[MailboxOutlineCell setShowsSelectionCheckmarkForEditing:](self, "setShowsSelectionCheckmarkForEditing:", 0);
  -[MailboxOutlineCell setHideBadgeCountForEditing:](self, "setHideBadgeCountForEditing:", 0);
  -[MailboxOutlineCell setShowFocusIcon:](self, "setShowFocusIcon:", 0);
  -[MailboxOutlineCell setAccessories:](self, "setAccessories:", &__NSArray0__struct);
  -[MailboxOutlineCell setSubtitle:](self, "setSubtitle:", 0);
  -[MailboxOutlineCell setIcon:](self, "setIcon:", 0);
  -[MailboxOutlineCell setIconTintColor:](self, "setIconTintColor:", 0);
  -[MailboxOutlineCell setSelectedIconTintColor:](self, "setSelectedIconTintColor:", 0);
  -[MailboxOutlineCell setCellEnabled:](self, "setCellEnabled:", 1);
  -[MailboxOutlineCell setDisabledForEditing:](self, "setDisabledForEditing:", 0);
  -[MailboxOutlineCell setMailboxes:observeCount:](self, "setMailboxes:observeCount:", 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxOutlineCell detailsDisclosureButton](self, "detailsDisclosureButton"));
  objc_msgSend(v3, "removeTarget:action:forControlEvents:", 0, 0, 64);

}

- (void)_resetDebouncer
{
  EFDebouncer *countDebouncer;
  EFDebouncer *v5;
  id v6;
  void *v7;
  EFDebouncer *v8;
  EFDebouncer *v9;
  _QWORD v10[4];
  id v11[2];
  id location;

  countDebouncer = self->_countDebouncer;
  if (countDebouncer)
  {
    -[EFDebouncer cancel](countDebouncer, "cancel");
    v5 = self->_countDebouncer;
    self->_countDebouncer = 0;

  }
  if (-[MailboxOutlineCell shouldShowBadgeCountIfNecessary](self, "shouldShowBadgeCountIfNecessary"))
  {
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v6 = objc_alloc((Class)EFDebouncer);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000C97A0;
    v10[3] = &unk_10051DA80;
    objc_copyWeak(v11, &location);
    v11[1] = (id)a2;
    v8 = (EFDebouncer *)objc_msgSend(v6, "initWithTimeInterval:scheduler:startAfter:block:", v7, 1, v10, 0.2);
    v9 = self->_countDebouncer;
    self->_countDebouncer = v8;

    objc_destroyWeak(v11);
    objc_destroyWeak(&location);
  }
}

- (void)setMailboxes:(id)a3 observeCount:(BOOL)a4
{
  _BOOL8 v4;
  NSSet *legacyMailboxes;
  id v7;

  v4 = a4;
  legacyMailboxes = self->_legacyMailboxes;
  self->_legacyMailboxes = 0;
  v7 = a3;

  -[MailboxOutlineCell _setMailboxes:observeCount:unreadCountIncludesRead:](self, "_setMailboxes:observeCount:unreadCountIncludesRead:", v7, v4, 0);
}

- (void)_setMailboxes:(id)a3 observeCount:(BOOL)a4 unreadCountIncludesRead:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  NSArray *v8;
  NSArray *mailboxes;
  id v10;
  id v11;

  v5 = a5;
  v6 = a4;
  v11 = a3;
  v8 = (NSArray *)objc_msgSend(v11, "copy");
  mailboxes = self->_mailboxes;
  self->_mailboxes = v8;

  -[MailboxOutlineCell setShouldShowBadgeCountIfNecessary:](self, "setShouldShowBadgeCountIfNecessary:", -[NSArray count](self->_mailboxes, "count") != 0);
  if (v6)
  {
    if (-[NSArray count](self->_mailboxes, "count"))
      v10 = v11;
    else
      v10 = 0;
  }
  else
  {
    v10 = 0;
  }
  -[MailboxOutlineCell _setUnreadCountMailboxes:unreadCountIncludesRead:](self, "_setUnreadCountMailboxes:unreadCountIncludesRead:", v10, v5);

}

- (void)setLegacyMailboxes:(id)a3
{
  -[MailboxOutlineCell setLegacyMailboxes:showUnreadCount:](self, "setLegacyMailboxes:showUnreadCount:", a3, 0);
}

- (void)setLegacyMailboxes:(id)a3 showUnreadCount:(BOOL)a4
{
  -[MailboxOutlineCell setLegacyMailboxes:showUnreadCount:unreadCountIncludesRead:](self, "setLegacyMailboxes:showUnreadCount:unreadCountIncludesRead:", a3, a4, 0);
}

- (void)setLegacyMailboxes:(id)a3 showUnreadCount:(BOOL)a4 unreadCountIncludesRead:(BOOL)a5
{
  _BOOL8 v5;
  id v9;
  NSSet **p_legacyMailboxes;
  unsigned int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  int v21;
  uint64_t v22;
  NSString *v23;
  void *v24;
  unsigned int v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  _BOOL4 v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  MailboxOutlineCell *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  unsigned int v40;
  __int16 v41;
  _BOOL4 v42;
  __int16 v43;
  int v44;
  __int16 v45;
  _BOOL4 v46;

  v32 = a5;
  v5 = a4;
  v9 = a3;
  p_legacyMailboxes = &self->_legacyMailboxes;
  v11 = objc_msgSend(v9, "isEqualToSet:", self->_legacyMailboxes);
  if ((v11 & 1) == 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v13 = MFMailboxUidWasRenamedNotification;
    objc_msgSend(v12, "removeObserver:name:object:", self, MFMailboxUidWasRenamedNotification, 0);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxOutlineCell unreadCountToken](self, "unreadCountToken"));
    objc_msgSend(v14, "cancel");

    -[MailboxOutlineCell setUnreadCountToken:](self, "setUnreadCountToken:", 0);
    objc_storeStrong((id *)&self->_legacyMailboxes, a3);
    if ((id)-[NSSet count](*p_legacyMailboxes, "count") == (id)1)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSSet anyObject](*p_legacyMailboxes, "anyObject"));
      v16 = sub_1001D6E84();
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "iconFromBundle:", v17));
      -[MailboxOutlineCell setIcon:](self, "setIcon:", v18);

      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v19, "addObserver:selector:name:object:", self, "_updateMailboxName", v13, v15);

    }
  }
  v20 = objc_claimAutoreleasedReturnValue(+[MailboxOutlineCell log](MailboxOutlineCell, "log"));
  v21 = v11 ^ 1;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v22 = objc_opt_class(self);
    v23 = NSStringFromSelector(a2);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v25 = -[MailboxOutlineCell shouldShowBadgeCountIfNecessary](self, "shouldShowBadgeCountIfNecessary");
    v26 = *p_legacyMailboxes != 0;
    *(_DWORD *)buf = 138544898;
    v34 = v22;
    v35 = 2048;
    v36 = self;
    v37 = 2114;
    v38 = v24;
    v39 = 1024;
    v40 = v25;
    v41 = 1024;
    v42 = v5;
    v43 = 1024;
    v44 = v21;
    v45 = 1024;
    v46 = v26;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "<%{public}@ : %p> %{public}@ - shouldShowBadgeCountIfNecessary:(%{BOOL}d, %{BOOL}d) mailboxesChanged:%{BOOL}d has _legacyMailboxes:%{BOOL}d", buf, 0x38u);

  }
  if (-[MailboxOutlineCell shouldShowBadgeCountIfNecessary](self, "shouldShowBadgeCountIfNecessary") ^ v5 | v21)
  {
    -[MailboxOutlineCell setBadgeCount:](self, "setBadgeCount:", 0);
    -[MailboxOutlineCell setShouldShowBadgeCountIfNecessary:](self, "setShouldShowBadgeCountIfNecessary:", v5);
    if (-[MailboxOutlineCell shouldShowBadgeCountIfNecessary](self, "shouldShowBadgeCountIfNecessary")
      && *p_legacyMailboxes)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allObjects"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxOutlineCell _createMailboxesFromUids:](self, "_createMailboxesFromUids:", v27));

      if (!objc_msgSend(v28, "count"))
      {
        v29 = objc_claimAutoreleasedReturnValue(+[MailboxOutlineCell log](MailboxOutlineCell, "log"));
        if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
        {
          v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "mailboxProvider"));
          sub_100391EE0(v31, buf, v29, v30);
        }

      }
      -[MailboxOutlineCell _setMailboxes:observeCount:unreadCountIncludesRead:](self, "_setMailboxes:observeCount:unreadCountIncludesRead:", v28, 1, v32);

    }
    else
    {
      -[MailboxOutlineCell _resetDebouncer](self, "_resetDebouncer");
    }
  }
  -[MailboxOutlineCell _updateMailboxName](self, "_updateMailboxName");

}

- (id)_createMailboxesFromUids:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mailboxProvider"));

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000C9E94;
  v9[3] = &unk_10051DAA8;
  v10 = v5;
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ef_compactMap:", v9));

  return v7;
}

- (void)_setUnreadCountMailboxes:(id)a3 unreadCountIncludesRead:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  NSString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  MailboxOutlineCell *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  void *v34;

  v4 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxOutlineCell unreadCountToken](self, "unreadCountToken"));
  objc_msgSend(v8, "cancel");

  -[MailboxOutlineCell setUnreadCountToken:](self, "setUnreadCountToken:", 0);
  -[MailboxOutlineCell _resetDebouncer](self, "_resetDebouncer");
  if (v7 && objc_msgSend(v7, "count"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[EMMessageListItemPredicates predicateForMessagesInMailboxes:](EMMessageListItemPredicates, "predicateForMessagesInMailboxes:", self->_mailboxes));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", v9));

    if (!v4)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[EMMessageListItemPredicates predicateForUnreadMessages](EMMessageListItemPredicates, "predicateForUnreadMessages"));
      objc_msgSend(v24, "addObject:", v10);

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate ef_andCompoundPredicateWithSubpredicates:](NSCompoundPredicate, "ef_andCompoundPredicateWithSubpredicates:", v24));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxOutlineCell _countQueryLabelForMailboxes:](self, "_countQueryLabelForMailboxes:", v7));
    v13 = objc_msgSend(objc_alloc((Class)EMQuery), "initWithTargetClass:predicate:sortDescriptors:queryOptions:label:", objc_opt_class(EMMessage), v11, &__NSArray0__struct, 0, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ef_mapSelector:", "objectID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[EMMailboxScope mailboxScopeForMailboxObjectIDs:forExclusion:](EMMailboxScope, "mailboxScopeForMailboxObjectIDs:forExclusion:", v14, 0));

    v16 = objc_claimAutoreleasedReturnValue(+[MailboxOutlineCell log](MailboxOutlineCell, "log"));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_opt_class(self);
      v18 = NSStringFromSelector(a2);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      *(_DWORD *)buf = 138544386;
      v26 = v17;
      v27 = 2048;
      v28 = self;
      v29 = 2114;
      v30 = v19;
      v31 = 2114;
      v32 = v13;
      v33 = 2114;
      v34 = v12;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "<%{public}@ : %p> %{public}@ - start counting query with query:%{public}@ label:%{public}@", buf, 0x34u);

    }
    -[MailboxOutlineCell setCurrentUnreadCountQueryIncludesRead:](self, "setCurrentUnreadCountQueryIncludesRead:", v4);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "daemonInterface"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "messageRepository"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "startCountingQuery:includingServerCountsForMailboxScope:withObserver:", v13, v15, self));
    -[MailboxOutlineCell setUnreadCountToken:](self, "setUnreadCountToken:", v23);

  }
}

- (id)_countQueryLabelForMailboxes:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  __CFString *v8;
  id v9;
  void *v10;
  id v11;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  if ((objc_msgSend(v4, "descriptionUsesRealName") & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[EFPrivacy fullyOrPartiallyRedactedStringForString:](EFPrivacy, "fullyOrPartiallyRedactedStringForString:", v5));

    v7 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Generic mailbox %@"), v6);
    v5 = v7;
  }
  if ((unint64_t)objc_msgSend(v3, "count") < 2)
    v8 = &stru_100531B00;
  else
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" mailboxes:%lu"), objc_msgSend(v3, "count")));
  v9 = objc_alloc((Class)NSString);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accountIdentifier"));
  v11 = objc_msgSend(v9, "initWithFormat:", CFSTR("%@ (accountID: %@)%@"), v5, v10, v8);

  return v11;
}

- (void)setBadgeCount:(int64_t)a3
{
  NSObject *v6;
  uint64_t v7;
  NSString *v8;
  void *v9;
  NSBundle *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  MailboxOutlineCell *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  int64_t v21;

  if (self->_badgeCount != a3)
  {
    self->_badgeCount = a3;
    v6 = objc_claimAutoreleasedReturnValue(+[MailboxOutlineCell log](MailboxOutlineCell, "log"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_opt_class(self);
      v8 = NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      *(_DWORD *)buf = 138544130;
      v15 = v7;
      v16 = 2048;
      v17 = self;
      v18 = 2114;
      v19 = v9;
      v20 = 2048;
      v21 = a3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "<%{public}@ : %p> %{public}@ - count:%li", buf, 0x2Au);

    }
    v10 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(MailboxOutlineCell));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("UNREAD_COUNT_FORMAT%1$lu"), &stru_100531B00, CFSTR("Main")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v12, a3));
    -[MailboxOutlineCell setAccessibilityValue:](self, "setAccessibilityValue:", v13);

    -[MailboxOutlineCell updateAccessories](self, "updateAccessories");
  }
}

- (void)messageRepository:(id)a3 query:(id)a4 countDidChange:(int64_t)a5
{
  void *v5;
  uint64_t v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler", a3, a4, _NSConcreteStackBlock, 3221225472, sub_1000CA65C, &unk_10051ABD8, self, a5));
  objc_msgSend(v5, "performBlock:", &v6);

}

- (void)setEditing:(BOOL)a3
{
  _BOOL4 v3;
  int v5;
  _BOOL8 v6;
  uint64_t v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MailboxOutlineCell;
  -[MailboxOutlineCell setEditing:](&v8, "setEditing:");
  v5 = _os_feature_enabled_impl("Mail", "CollapsibleMailboxes");
  if (!v3)
  {
    if (!v5)
    {
      -[MailboxOutlineCell setUserInteractionEnabled:](self, "setUserInteractionEnabled:", -[MailboxOutlineCell isCellEnabled](self, "isCellEnabled"));
      return;
    }
    -[MailboxOutlineCell setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 1);
    v7 = -[MailboxOutlineCell isCellEnabled](self, "isCellEnabled") ^ 1;
    goto LABEL_12;
  }
  if (self->_disabledForEditing)
    v6 = 0;
  else
    v6 = self->_cellEnabled || -[MailboxOutlineCell _isCellEnabledForMailboxes](self, "_isCellEnabledForMailboxes");
  -[MailboxOutlineCell setUserInteractionEnabled:](self, "setUserInteractionEnabled:", v6);
  if (v5)
  {
    v7 = v6 ^ 1;
LABEL_12:
    -[MailboxOutlineCell setUseDisabledAppearance:](self, "setUseDisabledAppearance:", v7);
  }
}

- (void)setTitle:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[NSString isEqualToString:](self->_title, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_title, a3);
    -[MailboxOutlineCell setAccessibilityLabel:](self, "setAccessibilityLabel:", v5);
  }

}

- (void)setFlattenHierarchy:(BOOL)a3
{
  if (self->_flattenHierarchy != a3)
  {
    self->_flattenHierarchy = a3;
    if (a3)
      -[MailboxOutlineCell setIndentationLevel:](self, "setIndentationLevel:", 0);
  }
}

- (BOOL)_isCellEnabledForMailboxes
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSSet anyObject](self->_legacyMailboxes, "anyObject"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSSet anyObject](self->_legacyMailboxes, "anyObject"));
    v5 = objc_msgSend(v4, "isStore");

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (BOOL)isCellEnabled
{
  if (self->_cellEnabled)
    return -[MailboxOutlineCell _isCellEnabledForMailboxes](self, "_isCellEnabledForMailboxes");
  else
    return 0;
}

- (void)setCellEnabled:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  self->_cellEnabled = a3;
  if (_os_feature_enabled_impl("Mail", "CollapsibleMailboxes"))
    -[MailboxOutlineCell setUseDisabledAppearance:](self, "setUseDisabledAppearance:", v3 ^ 1);
  else
    -[MailboxOutlineCell setUserInteractionEnabled:](self, "setUserInteractionEnabled:", v3);
}

- (void)setExpanded:(BOOL)a3
{
  void *v4;
  _QWORD v5[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MailboxOutlineCell;
  -[MailboxOutlineCell setExpanded:](&v6, "setExpanded:", a3);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000CAA28;
  v5[3] = &unk_10051AA98;
  v5[4] = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
  objc_msgSend(v4, "performBlock:", v5);

}

- (void)setUseDisabledAppearance:(BOOL)a3
{
  _BOOL4 useDisabledAppearance;

  useDisabledAppearance = self->_useDisabledAppearance;
  self->_useDisabledAppearance = a3;
  if (useDisabledAppearance != a3)
    -[MailboxOutlineCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
}

- (NSLayoutConstraint)separatorFlushLeadingConstraint
{
  NSLayoutConstraint *separatorFlushLeadingConstraint;
  void *v4;
  void *v5;
  void *v6;
  NSLayoutConstraint *v7;
  NSLayoutConstraint *v8;

  separatorFlushLeadingConstraint = self->_separatorFlushLeadingConstraint;
  if (!separatorFlushLeadingConstraint)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxOutlineCell separatorLayoutGuide](self, "separatorLayoutGuide"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leadingAnchor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxOutlineCell leadingAnchor](self, "leadingAnchor"));
    v7 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v6));
    v8 = self->_separatorFlushLeadingConstraint;
    self->_separatorFlushLeadingConstraint = v7;

    separatorFlushLeadingConstraint = self->_separatorFlushLeadingConstraint;
  }
  return separatorFlushLeadingConstraint;
}

- (void)setForceZeroSeparatorInset:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_forceZeroSeparatorInset != a3)
  {
    v3 = a3;
    self->_forceZeroSeparatorInset = a3;
    v4 = (id)objc_claimAutoreleasedReturnValue(-[MailboxOutlineCell separatorFlushLeadingConstraint](self, "separatorFlushLeadingConstraint"));
    objc_msgSend(v4, "setActive:", v3);

  }
}

- (UIImage)icon
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  UIImage *v6;
  UIImage *icon;
  UIImage *v8;

  if (self->_icon)
  {
    v3 = 0;
  }
  else
  {
    v4 = objc_claimAutoreleasedReturnValue(-[MailboxOutlineCell createIconBlock](self, "createIconBlock"));
    v3 = (void *)v4;
    if (v4)
    {
      v5 = (*(uint64_t (**)(uint64_t))(v4 + 16))(v4);
      v6 = (UIImage *)objc_claimAutoreleasedReturnValue(v5);
      icon = self->_icon;
      self->_icon = v6;

    }
  }
  v8 = self->_icon;

  return v8;
}

- (void)_invalidateIcon
{
  UIImage *icon;

  icon = self->_icon;
  self->_icon = 0;

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MailboxOutlineCell;
  -[MailboxOutlineCell traitCollectionDidChange:](&v5, "traitCollectionDidChange:", v4);
  -[MailboxOutlineCell _invalidateIcon](self, "_invalidateIcon");

}

- (void)setShowsDetailDisclosureButton:(BOOL)a3
{
  UIButton *v4;
  UIButton *detailsDisclosureButton;
  double Height;
  double Width;
  double v8;
  void *v9;
  CGRect v10;
  CGRect v11;

  if (self->_showsDetailDisclosureButton != a3)
  {
    self->_showsDetailDisclosureButton = a3;
    if (a3 && !self->_detailsDisclosureButton)
    {
      v4 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 4));
      detailsDisclosureButton = self->_detailsDisclosureButton;
      self->_detailsDisclosureButton = v4;

      -[UIButton frame](self->_detailsDisclosureButton, "frame");
      Height = CGRectGetHeight(v10);
      -[UIButton frame](self->_detailsDisclosureButton, "frame");
      Width = CGRectGetWidth(v11);
      if (Height >= Width)
        Width = Height;
      v8 = Width * 0.5;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](self->_detailsDisclosureButton, "layer"));
      objc_msgSend(v9, "setCornerRadius:", v8);

      -[UIButton setPointerInteractionEnabled:](self->_detailsDisclosureButton, "setPointerInteractionEnabled:", 1);
    }
  }
}

- (id)detailsDisclosureButtonIfShown
{
  UIButton *detailsDisclosureButton;

  if (-[MailboxOutlineCell showsDetailDisclosureButton](self, "showsDetailDisclosureButton"))
    detailsDisclosureButton = self->_detailsDisclosureButton;
  else
    detailsDisclosureButton = 0;
  return detailsDisclosureButton;
}

- (id)configurationState
{
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MailboxOutlineCell;
  v3 = -[MailboxOutlineCell configurationState](&v6, "configurationState");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (_os_feature_enabled_impl("Mail", "CollapsibleMailboxes"))
    objc_msgSend(v4, "setDisabled:", -[MailboxOutlineCell useDisabledAppearance](self, "useDisabledAppearance"));
  return v4;
}

- (void)updateConfigurationUsingState:(id)a3
{
  void *v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  const __CFString *v8;
  unsigned int v9;
  void *v10;
  uint64_t v11;
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
  unsigned int v22;
  void *v23;
  void *v24;
  unsigned int v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  unsigned int v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;

  v36 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxOutlineCell traitCollection](self, "traitCollection"));
  v5 = objc_msgSend(v4, "mf_useSplitViewStyling");

  if ((id)-[MailboxOutlineCell disclosureType](self, "disclosureType") == (id)1)
  {
    v6 = -[MailboxOutlineCell expanded](self, "expanded");
    v7 = MSAccessibilityIdentifierMailboxListAccountCell;
    v8 = CFSTR(".isCollapsed");
    if (v6)
      v8 = CFSTR(".isExpanded");
  }
  else
  {
    v9 = -[MailboxOutlineCell expanded](self, "expanded");
    v7 = MSAccessibilityIdentifierMailboxListCell;
    v8 = CFSTR(".isCollapsed");
    if (v9)
      v8 = CFSTR(".isExpanded");
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v8));
  -[MailboxOutlineCell setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v10);

  if (-[MailboxOutlineCell isExpandable](self, "isExpandable"))
  {
    if (v5)
      v11 = objc_claimAutoreleasedReturnValue(+[UIListContentConfiguration sidebarHeaderConfiguration](UIListContentConfiguration, "sidebarHeaderConfiguration"));
    else
      v11 = objc_claimAutoreleasedReturnValue(+[UIListContentConfiguration prominentInsetGroupedHeaderConfiguration](UIListContentConfiguration, "prominentInsetGroupedHeaderConfiguration"));
    v12 = (void *)v11;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxOutlineCell title](self, "title"));
    objc_msgSend(v12, "setText:", v14);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIBackgroundConfiguration listSidebarHeaderConfiguration](UIBackgroundConfiguration, "listSidebarHeaderConfiguration"));
    sub_1000CADBC((uint64_t)self, v12);
    goto LABEL_36;
  }
  if (v5)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIListContentConfiguration accompaniedSidebarSubtitleCellConfiguration](UIListContentConfiguration, "accompaniedSidebarSubtitleCellConfiguration"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIBackgroundConfiguration listAccompaniedSidebarCellConfiguration](UIBackgroundConfiguration, "listAccompaniedSidebarCellConfiguration"));
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIListContentConfiguration subtitleCellConfiguration](UIListContentConfiguration, "subtitleCellConfiguration"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIBackgroundConfiguration listGroupedCellConfiguration](UIBackgroundConfiguration, "listGroupedCellConfiguration"));
    if (objc_msgSend(v36, "isEditing"))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tableCellGroupedBackgroundColor](UIColor, "tableCellGroupedBackgroundColor"));
      objc_msgSend(v13, "setBackgroundColor:", v15);

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "secondaryTextProperties"));
    objc_msgSend(v17, "setColor:", v16);

  }
  sub_1000CADBC((uint64_t)self, v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxOutlineCell title](self, "title"));
  objc_msgSend(v12, "setText:", v18);

  if (-[MailboxOutlineCell useTintColor](self, "useTintColor"))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxOutlineCell tintColor](self, "tintColor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "textProperties"));
    objc_msgSend(v20, "setColor:", v19);

  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxOutlineCell subtitle](self, "subtitle"));
  objc_msgSend(v12, "setSecondaryText:", v21);

  v22 = objc_msgSend(v36, "isSelected");
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxOutlineCell icon](self, "icon"));
  objc_msgSend(v12, "setImage:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxOutlineCell selectedIconTintColor](self, "selectedIconTintColor"));
  if (v24)
    v25 = v22;
  else
    v25 = 0;

  if (v25 == 1)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxOutlineCell selectedIconTintColor](self, "selectedIconTintColor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "imageProperties"));
    objc_msgSend(v27, "setTintColor:", v26);
  }
  else
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxOutlineCell iconTintColor](self, "iconTintColor"));
    if (v28)
      v29 = v22;
    else
      v29 = 1;

    if ((v29 & 1) != 0)
      goto LABEL_30;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxOutlineCell iconTintColor](self, "iconTintColor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "imageProperties"));
    objc_msgSend(v27, "setTintColor:", v26);
  }

LABEL_30:
  v30 = objc_msgSend(v36, "isFocused");
  if (-[MailboxOutlineCell showsDetailDisclosureButton](self, "showsDetailDisclosureButton"))
  {
    if ((v22 & v30) == 1)
      v31 = objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
    else
      v31 = objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
    v32 = (void *)v31;
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxOutlineCell detailsDisclosureButton](self, "detailsDisclosureButton"));
    objc_msgSend(v33, "setTintColor:", v32);

  }
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "imageProperties"));
  objc_msgSend(v34, "reservedLayoutSize");

  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "imageProperties"));
  objc_msgSend(v35, "setReservedLayoutSize:", _UIContentViewDefaultSymbolImageReservedLayoutSize, _UIContentViewDefaultSymbolImageReservedLayoutSize);

LABEL_36:
  -[MailboxOutlineCell setContentConfiguration:](self, "setContentConfiguration:", v12);
  -[MailboxOutlineCell setBackgroundConfiguration:](self, "setBackgroundConfiguration:", v13);
  -[MailboxOutlineCell updateAccessories](self, "updateAccessories");
  -[MailboxOutlineCell _updateIndentationLevel](self, "_updateIndentationLevel");

}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MailboxOutlineCell;
  -[MailboxOutlineCell tintColorDidChange](&v3, "tintColorDidChange");
  if (-[MailboxOutlineCell useTintColor](self, "useTintColor"))
    -[MailboxOutlineCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
}

- (void)updateAccessories
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  id v12;
  void *v13;
  unsigned int v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;

  v18 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (-[MailboxOutlineCell showsSelectionCheckmarkForEditing](self, "showsSelectionCheckmarkForEditing"))
  {
    v3 = objc_alloc_init((Class)UICellAccessoryMultiselect);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxOutlineCell multiselectCheckmarkColor](self, "multiselectCheckmarkColor"));
    objc_msgSend(v3, "setTintColor:", v4);

    objc_msgSend(v3, "setDisplayedState:", 1);
    objc_msgSend(v18, "addObject:", v3);

  }
  if (-[MailboxOutlineCell showsDetailDisclosureButton](self, "showsDetailDisclosureButton"))
  {
    v5 = objc_alloc((Class)UICellAccessoryCustomView);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxOutlineCell detailsDisclosureButton](self, "detailsDisclosureButton"));
    v7 = objc_msgSend(v5, "initWithCustomView:placement:", v6, 1);

    objc_msgSend(v7, "setDisplayedState:", 2);
    objc_msgSend(v18, "addObject:", v7);

  }
  if (-[MailboxOutlineCell showFocusIcon](self, "showFocusIcon"))
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[MailboxOutlineCell focusAccessoryView](self, "focusAccessoryView"));
    objc_msgSend(v18, "addObject:", v8);
LABEL_7:

    goto LABEL_13;
  }
  if (-[MailboxOutlineCell shouldShowBadgeCountIfNecessary](self, "shouldShowBadgeCountIfNecessary")
    && -[MailboxOutlineCell badgeCount](self, "badgeCount") >= 1
    && (!-[MailboxOutlineCell isExpandable](self, "isExpandable")
     || -[MailboxOutlineCell isExpandable](self, "isExpandable")
     && (-[MailboxOutlineCell expanded](self, "expanded") & 1) == 0))
  {
    v14 = -[MailboxOutlineCell hideBadgeCountForEditing](self, "hideBadgeCountForEditing");
    v15 = objc_alloc((Class)UICellAccessoryLabel);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumberFormatter ef_formatUnsignedInteger:withGrouping:](NSNumberFormatter, "ef_formatUnsignedInteger:withGrouping:", -[MailboxOutlineCell badgeCount](self, "badgeCount"), 0));
    v8 = objc_msgSend(v15, "initWithText:", v16);

    if (v14)
      v17 = 2;
    else
      v17 = 0;
    objc_msgSend(v8, "setDisplayedState:", v17);
    objc_msgSend(v18, "addObject:", v8);
    goto LABEL_7;
  }
LABEL_13:
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxOutlineCell traitCollection](self, "traitCollection"));
  v10 = objc_msgSend(v9, "mf_useSplitViewStyling");

  if ((v10 & 1) == 0 && !-[MailboxOutlineCell disclosureType](self, "disclosureType"))
  {
    v11 = objc_alloc_init((Class)UICellAccessoryDisclosureIndicator);
    objc_msgSend(v11, "setDisplayedState:", 2);
    objc_msgSend(v18, "addObject:", v11);
    goto LABEL_20;
  }
  if ((id)-[MailboxOutlineCell disclosureType](self, "disclosureType") == (id)1)
  {
    v11 = objc_alloc_init((Class)UICellAccessoryOutlineDisclosure);
    objc_msgSend(v11, "setStyle:", 1);
    objc_msgSend(v11, "setDisplayedState:", 0);
    objc_msgSend(v18, "addObject:", v11);
LABEL_20:

    goto LABEL_21;
  }
  if ((id)-[MailboxOutlineCell disclosureType](self, "disclosureType") == (id)2)
  {
    v11 = objc_alloc_init((Class)UICellAccessoryOutlineDisclosure);
    objc_msgSend(v11, "setStyle:", 2);
    objc_msgSend(v11, "setDisplayedState:", 0);
    objc_msgSend(v18, "addObject:", v11);
    goto LABEL_20;
  }
LABEL_21:
  if (-[MailboxOutlineCell canMoveItem](self, "canMoveItem")
    && (-[MailboxOutlineCell expanded](self, "expanded") & 1) == 0)
  {
    v12 = objc_alloc_init((Class)UICellAccessoryReorder);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor"));
    objc_msgSend(v12, "setTintColor:", v13);

    objc_msgSend(v12, "setDisplayedState:", 1);
    objc_msgSend(v18, "addObject:", v12);

  }
  -[MailboxOutlineCell setAccessories:](self, "setAccessories:", v18);

}

- (UICellAccessoryCustomView)focusAccessoryView
{
  UICellAccessoryCustomView *focusAccessoryView;
  id v4;
  void *v5;
  id v6;
  void *v7;
  UICellAccessoryCustomView *v8;
  UICellAccessoryCustomView *v9;

  focusAccessoryView = self->_focusAccessoryView;
  if (!focusAccessoryView)
  {
    v4 = objc_alloc((Class)UIImageView);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", MFImageGlyphFocusCircle));
    v6 = objc_msgSend(v4, "initWithImage:", v5);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
    objc_msgSend(v6, "setTintColor:", v7);

    objc_msgSend(v6, "setContentMode:", 4);
    v8 = (UICellAccessoryCustomView *)objc_msgSend(objc_alloc((Class)UICellAccessoryCustomView), "initWithCustomView:placement:", v6, 1);
    v9 = self->_focusAccessoryView;
    self->_focusAccessoryView = v8;

    -[UICellAccessoryCustomView setDisplayedState:](self->_focusAccessoryView, "setDisplayedState:", 2);
    focusAccessoryView = self->_focusAccessoryView;
  }
  return focusAccessoryView;
}

- (CGPoint)destinationPointForAnimation
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  void *v21;
  id v22;
  double MidY;
  double MidX;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGPoint result;
  CGRect v34;
  CGRect v35;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxOutlineCell contentView](self, "contentView"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "textLabel"));
  objc_msgSend(v12, "frame");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxOutlineCell traitCollection](self, "traitCollection"));
  v22 = objc_msgSend(v21, "horizontalSizeClass");

  v34.origin.x = v5;
  v34.origin.y = v7;
  v34.size.width = v9;
  v34.size.height = v11;
  MidY = CGRectGetMidY(v34);
  v35.origin.x = v14;
  v35.origin.y = v16;
  v35.size.width = v18;
  v35.size.height = v20;
  MidX = CGRectGetMidX(v35);
  v25 = 3.0;
  if (v22 == (id)1)
    v25 = 2.0;
  v26 = v9 / v25;
  if (v26 >= MidX)
    MidX = v26;
  -[MailboxOutlineCell convertPoint:fromView:](self, "convertPoint:fromView:", v3, MidX, MidY);
  v28 = v27;
  v30 = v29;

  v31 = v28;
  v32 = v30;
  result.y = v32;
  result.x = v31;
  return result;
}

- (double)_verticalPaddingForExpandableTitle
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MFFontMetricCache sharedFontMetricCache](MFFontMetricCache, "sharedFontMetricCache"));
  objc_msgSend(v2, "cachedFloat:forKey:", &stru_10051DAE8, CFSTR("MailboxOutlineCell.verticalPaddingForExpandableTitle"));
  v4 = v3;

  return v4;
}

- (void)addTargetForDetailDisclosure:(id)a3 action:(SEL)a4
{
  void *v6;
  id v7;

  v7 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxOutlineCell detailsDisclosureButton](self, "detailsDisclosureButton"));
  objc_msgSend(v6, "addTarget:action:forControlEvents:", v7, a4, 64);

}

- (void)_updateMailboxName
{
  void *v3;
  void *v4;
  id v5;

  if ((id)-[NSSet count](self->_legacyMailboxes, "count") == (id)1)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[NSSet anyObject](self->_legacyMailboxes, "anyObject"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MailChangeManager sharedChangeManager](MailChangeManager, "sharedChangeManager"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "displayNameUsingSpecialNamesForMailbox:", v5));

    -[MailboxOutlineCell setTitle:](self, "setTitle:", v4);
    -[MailboxOutlineCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");

  }
}

- (void)_updateIndentationLevel
{
  uint64_t v3;
  void *v4;
  int v5;
  id v6;

  if ((id)-[NSSet count](self->_legacyMailboxes, "count") == (id)1)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[NSSet anyObject](self->_legacyMailboxes, "anyObject"));
    if (-[MailboxOutlineCell flattenHierarchy](self, "flattenHierarchy"))
    {
      v3 = 0;
    }
    else
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[MailChangeManager sharedChangeManager](MailChangeManager, "sharedChangeManager"));
      v5 = objc_msgSend(v4, "levelForMailbox:", v6);

      v3 = v5 & ~(v5 >> 31);
    }
    -[MailboxOutlineCell setIndentationLevel:](self, "setIndentationLevel:", v3);

  }
}

- (id)_scriptingInfo
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MailboxOutlineCell;
  v3 = -[MailboxOutlineCell _scriptingInfo](&v9, "_scriptingInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if ((id)-[NSSet count](self->_legacyMailboxes, "count") == (id)1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MailChangeManager sharedChangeManager](MailChangeManager, "sharedChangeManager"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSSet anyObject](self->_legacyMailboxes, "anyObject"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "displayNameUsingSpecialNamesForMailbox:", v6));

    objc_msgSend(v4, "setValue:forKey:", v7, CFSTR("ID"));
  }
  return v4;
}

- (BOOL)isExpandable
{
  return self->_expandable;
}

- (void)setExpandable:(BOOL)a3
{
  self->_expandable = a3;
}

- (int64_t)badgeCount
{
  return self->_badgeCount;
}

- (BOOL)hideBadgeCountForEditing
{
  return self->_hideBadgeCountForEditing;
}

- (void)setHideBadgeCountForEditing:(BOOL)a3
{
  self->_hideBadgeCountForEditing = a3;
}

- (BOOL)showsDetailDisclosureButton
{
  return self->_showsDetailDisclosureButton;
}

- (BOOL)canMoveItem
{
  return self->_canMoveItem;
}

- (void)setCanMoveItem:(BOOL)a3
{
  self->_canMoveItem = a3;
}

- (BOOL)showsSelectionCheckmarkForEditing
{
  return self->_showsSelectionCheckmarkForEditing;
}

- (void)setShowsSelectionCheckmarkForEditing:(BOOL)a3
{
  self->_showsSelectionCheckmarkForEditing = a3;
}

- (int64_t)disclosureType
{
  return self->_disclosureType;
}

- (void)setDisclosureType:(int64_t)a3
{
  self->_disclosureType = a3;
}

- (BOOL)flattenHierarchy
{
  return self->_flattenHierarchy;
}

- (BOOL)isDisabledForEditing
{
  return self->_disabledForEditing;
}

- (void)setDisabledForEditing:(BOOL)a3
{
  self->_disabledForEditing = a3;
}

- (BOOL)forceZeroSeparatorInset
{
  return self->_forceZeroSeparatorInset;
}

- (BOOL)useTintColor
{
  return self->_useTintColor;
}

- (void)setUseTintColor:(BOOL)a3
{
  self->_useTintColor = a3;
}

- (BOOL)shouldShowBadgeCountIfNecessary
{
  return self->_shouldShowBadgeCountIfNecessary;
}

- (void)setShouldShowBadgeCountIfNecessary:(BOOL)a3
{
  self->_shouldShowBadgeCountIfNecessary = a3;
}

- (BOOL)showFocusIcon
{
  return self->_showFocusIcon;
}

- (void)setShowFocusIcon:(BOOL)a3
{
  self->_showFocusIcon = a3;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (id)createIconBlock
{
  return self->_createIconBlock;
}

- (void)setCreateIconBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (UIColor)iconTintColor
{
  return self->_iconTintColor;
}

- (void)setIconTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_iconTintColor, a3);
}

- (UIColor)selectedIconTintColor
{
  return self->_selectedIconTintColor;
}

- (void)setSelectedIconTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_selectedIconTintColor, a3);
}

- (UIColor)multiselectCheckmarkColor
{
  return self->_multiselectCheckmarkColor;
}

- (void)setMultiselectCheckmarkColor:(id)a3
{
  objc_storeStrong((id *)&self->_multiselectCheckmarkColor, a3);
}

- (EMSmartMailbox)smartMailbox
{
  return self->_smartMailbox;
}

- (void)setSmartMailbox:(id)a3
{
  objc_storeStrong((id *)&self->_smartMailbox, a3);
}

- (UIButton)detailsDisclosureButton
{
  return self->_detailsDisclosureButton;
}

- (void)setDetailsDisclosureButton:(id)a3
{
  objc_storeStrong((id *)&self->_detailsDisclosureButton, a3);
}

- (BOOL)currentUnreadCountQueryIncludesRead
{
  return self->_currentUnreadCountQueryIncludesRead;
}

- (void)setCurrentUnreadCountQueryIncludesRead:(BOOL)a3
{
  self->_currentUnreadCountQueryIncludesRead = a3;
}

- (EFCancelable)unreadCountToken
{
  return self->_unreadCountToken;
}

- (void)setUnreadCountToken:(id)a3
{
  objc_storeStrong((id *)&self->_unreadCountToken, a3);
}

- (EFDebouncer)countDebouncer
{
  return (EFDebouncer *)objc_getProperty(self, a2, 136, 1);
}

- (void)setSeparatorFlushLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_separatorFlushLeadingConstraint, a3);
}

- (BOOL)useDisabledAppearance
{
  return self->_useDisabledAppearance;
}

- (void)setFocusAccessoryView:(id)a3
{
  objc_storeStrong((id *)&self->_focusAccessoryView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusAccessoryView, 0);
  objc_storeStrong((id *)&self->_separatorFlushLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_countDebouncer, 0);
  objc_storeStrong((id *)&self->_unreadCountToken, 0);
  objc_storeStrong((id *)&self->_detailsDisclosureButton, 0);
  objc_storeStrong((id *)&self->_smartMailbox, 0);
  objc_storeStrong((id *)&self->_multiselectCheckmarkColor, 0);
  objc_storeStrong((id *)&self->_selectedIconTintColor, 0);
  objc_storeStrong((id *)&self->_iconTintColor, 0);
  objc_storeStrong(&self->_createIconBlock, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_mailboxes, 0);
  objc_storeStrong((id *)&self->_legacyMailboxes, 0);
}

@end
