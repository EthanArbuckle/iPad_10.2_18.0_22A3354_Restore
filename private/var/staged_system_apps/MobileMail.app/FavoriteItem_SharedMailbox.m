@implementation FavoriteItem_SharedMailbox

- (void)_observeNotifications:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v6;
  id v7;
  void *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  _BOOL4 v20;

  v3 = a3;
  if (-[FavoriteItem_SharedMailbox isObserving](self, "isObserving") != a3)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[FavoriteItem log](FavoriteItem, "log"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (id)objc_opt_class(self);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem_SharedMailbox displayName](self, "displayName"));
      v9 = NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v13 = 138544130;
      v14 = v7;
      v15 = 2114;
      v16 = v8;
      v17 = 2114;
      v18 = v10;
      v19 = 1024;
      v20 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@:%{public}@ - %{public}@ observe:%{BOOL}d", (uint8_t *)&v13, 0x26u);

    }
    -[FavoriteItem_SharedMailbox setIsObserving:](self, "setIsObserving:", v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v12 = v11;
    if (v3)
    {
      objc_msgSend(v11, "addObserver:selector:name:object:", self, "_accountsDidChange:", ECMailAccountsDidChangeNotification, 0);
      objc_msgSend(v12, "addObserver:selector:name:object:", self, "_significantTimeChange", UIApplicationSignificantTimeChangeNotification, 0);
    }
    else
    {
      objc_msgSend(v11, "removeObserver:name:object:", self, ECMailAccountsDidChangeNotification, 0);
      objc_msgSend(v12, "removeObserver:name:object:", self, UIApplicationSignificantTimeChangeNotification, 0);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observationToken, 0);
  objc_storeStrong((id *)&self->_unreadCountToken, 0);
}

- (void)dealloc
{
  objc_super v3;

  -[FavoriteItem_SharedMailbox setUnreadCountToken:](self, "setUnreadCountToken:", 0);
  v3.receiver = self;
  v3.super_class = (Class)FavoriteItem_SharedMailbox;
  -[FavoriteItem_SharedMailbox dealloc](&v3, "dealloc");
}

- (void)setUnreadCountToken:(id)a3
{
  EFCancelable *v5;
  EFCancelable **p_unreadCountToken;
  EFCancelable *unreadCountToken;
  NSObject *v8;
  id v9;
  void *v10;
  EFCancelable *v11;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  EFCancelable *v18;

  v5 = (EFCancelable *)a3;
  p_unreadCountToken = &self->_unreadCountToken;
  unreadCountToken = self->_unreadCountToken;
  if (unreadCountToken != v5)
  {
    -[EFCancelable cancel](unreadCountToken, "cancel");
    if (*p_unreadCountToken)
    {
      v8 = objc_claimAutoreleasedReturnValue(+[FavoriteItem log](FavoriteItem, "log"));
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = (id)objc_opt_class(self);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem_SharedMailbox displayName](self, "displayName"));
        v11 = *p_unreadCountToken;
        v13 = 138543874;
        v14 = v9;
        v15 = 2114;
        v16 = v10;
        v17 = 2114;
        v18 = v11;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@:%{public}@ - Cancel token:%{public}@", (uint8_t *)&v13, 0x20u);

      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v12, "removeObserver:", self);

      -[FavoriteItem_SharedMailbox setIsObserving:](self, "setIsObserving:", 0);
    }
    objc_storeStrong((id *)&self->_unreadCountToken, a3);
  }

}

- (void)prepareItemForView
{
  -[FavoriteItem_SharedMailbox _startCountQueryIfNeeded](self, "_startCountQueryIfNeeded");
}

- (void)_startCountQueryIfNeeded
{
  unsigned int v3;
  unsigned int v4;
  void *v5;
  id v6;

  v3 = -[FavoriteItem isSelected](self, "isSelected");
  v4 = -[FavoriteItem_SharedMailbox _isTokenValid](self, "_isTokenValid");
  if (!v3 || (v4 & 1) != 0)
  {
    if ((v3 & 1) == 0)
    {
      if (v4)
        -[FavoriteItem_SharedMailbox _observeNotifications:](self, "_observeNotifications:", 0);
      -[FavoriteItem_SharedMailbox setUnreadCountToken:](self, "setUnreadCountToken:", 0);
    }
  }
  else
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[FavoriteItem_SharedMailbox sharedMailboxController](self, "sharedMailboxController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startCountQuery"));
    -[FavoriteItem_SharedMailbox setUnreadCountToken:](self, "setUnreadCountToken:", v5);

    -[FavoriteItem_SharedMailbox _observeNotifications:](self, "_observeNotifications:", 1);
  }
}

- (BOOL)_isTokenValid
{
  void *v2;
  void *v3;
  unsigned int v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem_SharedMailbox unreadCountToken](self, "unreadCountToken"));
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "isCanceled") ^ 1;
  else
    LOBYTE(v4) = 0;

  return v4;
}

- (EFCancelable)unreadCountToken
{
  return self->_unreadCountToken;
}

- (FavoriteItem_SharedMailbox)initWithSourceType:(unint64_t)a3
{
  FavoriteItem_SharedMailbox *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FavoriteItem_SharedMailbox;
  result = -[FavoriteItem initWithType:](&v5, "initWithType:", 5);
  if (result)
    result->_sourceType = a3;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  FavoriteItem_SharedMailbox *v4;
  FavoriteItem_SharedMailbox *v5;
  uint64_t v6;
  BOOL v7;

  v4 = (FavoriteItem_SharedMailbox *)a3;
  v5 = v4;
  if (v4 == self)
    v7 = 1;
  else
    v7 = v4
      && (v6 = objc_opt_class(self), (objc_opt_isKindOfClass(v5, v6) & 1) != 0)
      && self->_sourceType == v5->_sourceType;

  return v7;
}

- (id)persistentIDForMigration
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SharedMailbox-%i"), self->_sourceType);
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FavoriteItem_SharedMailbox;
  v3 = -[FavoriteItem dictionaryRepresentation](&v7, "dictionaryRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", self->_sourceType));
  objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("sourceType"));

  return v4;
}

- (unint64_t)sourceType
{
  return self->_sourceType;
}

- (FavoriteItem_SharedMailbox)initWithDictionary:(id)a3
{
  id v4;
  FavoriteItem_SharedMailbox *v5;
  void *v6;
  FavoriteItem_SharedMailbox *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FavoriteItem_SharedMailbox;
  v5 = -[FavoriteItem initWithDictionary:](&v9, "initWithDictionary:", v4);
  if (v5
    && (v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("sourceType"))),
        v5->_sourceType = (unint64_t)objc_msgSend(v6, "integerValue"),
        v6,
        v5->_sourceType > 0x1A))
  {
    v7 = 0;
  }
  else
  {
    v7 = v5;
  }

  return v7;
}

- (id)sharedMailboxController
{
  return +[SharedMailboxController sharedInstanceForSourceType:](SharedMailboxController, "sharedInstanceForSourceType:", self->_sourceType);
}

- (BOOL)isVisible
{
  return 1;
}

- (id)displayName
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem_SharedMailbox sharedMailboxController](self, "sharedMailboxController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mailboxTitle"));

  return v3;
}

- (void)setIsObserving:(BOOL)a3
{
  self->_isObserving = a3;
}

- (BOOL)isObserving
{
  return self->_isObserving;
}

- (id)defaultIconBlock
{
  unint64_t sourceType;
  _QWORD v4[5];

  sourceType = self->_sourceType;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000984DC;
  v4[3] = &unk_10051C818;
  v4[4] = sourceType;
  return objc_retainBlock(v4);
}

- (id)iconTintColor
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem_SharedMailbox sharedMailboxController](self, "sharedMailboxController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iconTintColor"));

  return v3;
}

- (id)selectedIconTintColor
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem_SharedMailbox sharedMailboxController](self, "sharedMailboxController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "selectedIconTintColor"));

  return v3;
}

- (id)applicationShortcutIcon
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem_SharedMailbox sharedMailboxController](self, "sharedMailboxController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "applicationShortcutIconImage"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplicationShortcutIcon iconWithCustomImage:](UIApplicationShortcutIcon, "iconWithCustomImage:", v3));
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "applicationShortcutIconName"));
    if (v5)
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplicationShortcutIcon iconWithSystemImageName:](UIApplicationShortcutIcon, "iconWithSystemImageName:", v5));
    else
      v4 = 0;

  }
  return v4;
}

- (id)criterion
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem_SharedMailbox sharedMailboxController](self, "sharedMailboxController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "criterion"));

  return v3;
}

- (void)_accountsDidChange:(id)a3
{
  -[FavoriteItem_SharedMailbox _restartCountTokenIfNecessary](self, "_restartCountTokenIfNecessary", a3);
}

- (void)_significantTimeChange
{
  -[FavoriteItem_SharedMailbox _restartCountTokenIfNecessary](self, "_restartCountTokenIfNecessary");
}

- (void)_restartCountTokenIfNecessary
{
  -[FavoriteItem_SharedMailbox setUnreadCountToken:](self, "setUnreadCountToken:", 0);
  -[FavoriteItem_SharedMailbox _startCountQueryIfNeeded](self, "_startCountQueryIfNeeded");
}

- (void)configureOutlineCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FavoriteItem_SharedMailbox;
  -[FavoriteItem configureOutlineCell:](&v8, "configureOutlineCell:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem_SharedMailbox sharedMailboxController](self, "sharedMailboxController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mailboxTitle"));
  objc_msgSend(v4, "setTitle:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem_SharedMailbox unreadCountToken](self, "unreadCountToken"));
  objc_msgSend(v4, "setShouldShowBadgeCountIfNecessary:", v7 != 0);

  objc_msgSend(v4, "setBadgeCount:", objc_msgSend(v5, "badgeCount"));
}

- (void)wasSelected:(id)a3 indexPath:(id)a4 accessoryTapped:(BOOL)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  void *v9;
  id v10;

  v6 = a6;
  v7 = a5;
  v10 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem_SharedMailbox sharedMailboxController](self, "sharedMailboxController"));
  objc_msgSend(v9, "presentFromSelectionTarget:item:accessoryTapped:animated:", v10, self, v7, v6);

}

- (BOOL)wantsDisclosureButton
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem_SharedMailbox sharedMailboxController](self, "sharedMailboxController"));
  v3 = objc_msgSend(v2, "wantsDisclosureButton");

  return v3;
}

- (id)smartMailbox
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem_SharedMailbox sharedMailboxController](self, "sharedMailboxController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mailbox"));

  return v3;
}

- (void)setSelected:(BOOL)a3 fromUI:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  id v8;

  v4 = a4;
  -[FavoriteItem setSelected:](self, "setSelected:", a3);
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[FavoritesManager defaultsKeyForAutomaticMailboxVisibilityForSourceType:](FavoritesManager, "defaultsKeyForAutomaticMailboxVisibilityForSourceType:", -[FavoriteItem_SharedMailbox sourceType](self, "sourceType")));
    if (v6)
    {
      v8 = v6;
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      objc_msgSend(v7, "setBool:forKey:", 1, v8);

      v6 = v8;
    }

  }
}

- (unint64_t)hash
{
  return self->_sourceType;
}

- (id)itemURLString
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("favoriteitem://sharedmailbox/%i"), self->_sourceType);
}

- (BOOL)_displayNameShouldBeRedacted
{
  return 0;
}

- (id)badgeCountString
{
  void *v2;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = -[FavoriteItem_SharedMailbox sourceType](self, "sourceType");
  if (v4 <= 0x1A)
  {
    if (((1 << v4) & 0x2FF800C) != 0)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.Message")));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("MESSAGE_COUNT_FORMAT%1$lu"), &stru_100531B00, CFSTR("Main")));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem badgeCount](self, "badgeCount"));
      v8 = objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, objc_msgSend(v7, "integerValue")));
LABEL_6:
      v2 = (void *)v8;

      return v2;
    }
    if (((1 << v4) & 0x40001F3) != 0)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.Message")));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("UNREAD_COUNT_FORMAT%1$lu"), &stru_100531B00, CFSTR("Main")));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem badgeCount](self, "badgeCount"));
      v8 = objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, objc_msgSend(v7, "integerValue")));
      goto LABEL_6;
    }
  }
  return v2;
}

- (id)countQueryPredicate
{
  unint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = -[FavoriteItem_SharedMailbox sourceType](self, "sourceType");
  v4 = objc_alloc_init((Class)NSMutableArray);
  v5 = 0;
  v6 = 1;
  switch(v3)
  {
    case 1uLL:
      v7 = 1;
      v8 = objc_claimAutoreleasedReturnValue(+[EMMessageListItemPredicates predicateForIsVIP:](EMMessageListItemPredicates, "predicateForIsVIP:", 1));
      goto LABEL_19;
    case 2uLL:
      v8 = objc_claimAutoreleasedReturnValue(+[EMMessageListItemPredicates predicateForFlaggedMessages](EMMessageListItemPredicates, "predicateForFlaggedMessages", 1));
      goto LABEL_18;
    case 3uLL:
      v8 = objc_claimAutoreleasedReturnValue(+[EMMessageListItemPredicates predicateForUnreadMessages](EMMessageListItemPredicates, "predicateForUnreadMessages", 1));
      goto LABEL_18;
    case 4uLL:
      v8 = objc_claimAutoreleasedReturnValue(+[EMMessageListItemPredicates predicateForIncludesMeMessages](EMMessageListItemPredicates, "predicateForIncludesMeMessages", 1));
      goto LABEL_10;
    case 5uLL:
      v8 = objc_claimAutoreleasedReturnValue(+[EMMessageListItemPredicates predicateForMessagesWithAttachments](EMMessageListItemPredicates, "predicateForMessagesWithAttachments", 1));
      goto LABEL_10;
    case 6uLL:
      v8 = objc_claimAutoreleasedReturnValue(+[EMMessageListItemPredicates predicateForNotifyMessages](EMMessageListItemPredicates, "predicateForNotifyMessages", 1));
      goto LABEL_10;
    case 7uLL:
      v8 = objc_claimAutoreleasedReturnValue(+[EMMessageListItemPredicates predicateForTodayMessages](EMMessageListItemPredicates, "predicateForTodayMessages", 1));
      goto LABEL_10;
    case 8uLL:
      v8 = objc_claimAutoreleasedReturnValue(+[EMMessageListItemPredicates predicateForMuteMessages](EMMessageListItemPredicates, "predicateForMuteMessages", 1));
LABEL_10:
      v7 = 1;
      goto LABEL_19;
    case 0x10uLL:
      goto LABEL_17;
    case 0x11uLL:
      v6 = 0;
      goto LABEL_17;
    case 0x12uLL:
      v6 = 5;
      goto LABEL_17;
    case 0x13uLL:
      v6 = 4;
      goto LABEL_17;
    case 0x14uLL:
      v6 = 2;
      goto LABEL_17;
    case 0x15uLL:
      v6 = 3;
      goto LABEL_17;
    case 0x16uLL:
      v6 = 6;
LABEL_17:
      v8 = objc_claimAutoreleasedReturnValue(+[EMMessageListItemPredicates predicateForFlagColor:](EMMessageListItemPredicates, "predicateForFlagColor:", v6));
LABEL_18:
      v7 = 0;
LABEL_19:
      v9 = (void *)v8;
      objc_msgSend(v4, "addObject:", v8);
      if (v7)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[EMMessageListItemPredicates predicateForUnreadMessages](EMMessageListItemPredicates, "predicateForUnreadMessages"));
        objc_msgSend(v4, "addObject:", v10);

      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem_SharedMailbox mailboxScope](self, "mailboxScope"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[EMMessageListItemPredicates predicateForMessagesWithMailboxScope:](EMMessageListItemPredicates, "predicateForMessagesWithMailboxScope:", v11));
      objc_msgSend(v4, "addObject:", v12);

      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v4));
      break;
    default:
      break;
  }

  return v5;
}

- (id)mailboxScope
{
  unint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;

  v2 = -[FavoriteItem_SharedMailbox sourceType](self, "sourceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[EMMailboxScope mailboxScopeForMailboxTypes:forExclusion:](EMMailboxScope, "mailboxScopeForMailboxTypes:forExclusion:", &off_100542148, 1));
  v4 = objc_claimAutoreleasedReturnValue(+[EMMailboxScope mailboxScopeForMailboxType:forExclusion:](EMMailboxScope, "mailboxScopeForMailboxType:forExclusion:", 7, 0));
  v5 = (void *)v4;
  v6 = 0;
  if (v2 <= 0x16)
  {
    if (((1 << v2) & 0x7F0144) != 0)
    {
      v7 = v3;
LABEL_5:
      v6 = v7;
      goto LABEL_6;
    }
    v7 = (void *)v4;
    if (((1 << v2) & 0xBA) != 0)
      goto LABEL_5;
  }
LABEL_6:

  return v6;
}

- (id)serverCountMailboxScope
{
  void *v3;

  if ((id)-[FavoriteItem_SharedMailbox sourceType](self, "sourceType") == (id)3)
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem_SharedMailbox mailboxScope](self, "mailboxScope"));
  else
    v3 = 0;
  return v3;
}

- (id)analyticsKey
{
  unint64_t v2;

  v2 = -[FavoriteItem_SharedMailbox sourceType](self, "sourceType") - 1;
  if (v2 <= 0x15 && ((0x3F80FFu >> v2) & 1) != 0)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Smart_%@"), off_10051C908[v2]));
  else
    return 0;
}

- (EFCancelable)observationToken
{
  return self->_observationToken;
}

- (void)setObservationToken:(id)a3
{
  objc_storeStrong((id *)&self->_observationToken, a3);
}

@end
