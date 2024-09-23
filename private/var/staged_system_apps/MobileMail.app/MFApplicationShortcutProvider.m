@implementation MFApplicationShortcutProvider

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100143E04;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005AA048 != -1)
    dispatch_once(&qword_1005AA048, block);
  return (OS_os_log *)(id)qword_1005AA040;
}

- (MFApplicationShortcutProvider)initWithAccountsProvider:(id)a3 favoritesPersistence:(id)a4 messagePersistence:(id)a5 hookRegistry:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  MFApplicationShortcutProvider *v15;
  MFApplicationShortcutProvider *v16;
  void *v17;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)MFApplicationShortcutProvider;
  v15 = -[MFApplicationShortcutProvider init](&v19, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_accountsProvider, a3);
    objc_storeStrong((id *)&v16->_favoritesPersistence, a4);
    objc_storeStrong((id *)&v16->_messagePersistence, a5);
    objc_storeStrong((id *)&v16->_hookRegistry, a6);
    -[MFApplicationShortcutProvider _updateApplicationShortcuts](v16, "_updateApplicationShortcuts");
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v17, "addObserver:selector:name:object:", v16, "_favoritesDidChange:", CFSTR("MailApplicationFavoritesDidChange"), 0);

  }
  return v16;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFApplicationShortcutProvider specialMailboxCountObserver](self, "specialMailboxCountObserver"));
  objc_msgSend(v4, "cancel");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFApplicationShortcutProvider mailboxCountObserver](self, "mailboxCountObserver"));
  objc_msgSend(v5, "cancel");

  v6.receiver = self;
  v6.super_class = (Class)MFApplicationShortcutProvider;
  -[MFApplicationShortcutProvider dealloc](&v6, "dealloc");
}

- (void)_favoritesDidChange:(id)a3
{
  void *v3;
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10014412C;
  v4[3] = &unk_10051AA98;
  v4[4] = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler", a3));
  objc_msgSend(v3, "performBlock:", v4);

}

- (void)_unreadCountDidChange:(id)a3
{
  void *v3;
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001441BC;
  v4[3] = &unk_10051AA98;
  v4[4] = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler", a3));
  objc_msgSend(v3, "performBlock:", v4);

}

- (void)_updateApplicationShortcuts
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  __int128 v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  unsigned __int8 v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned __int8 v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  __int128 v34;
  _QWORD v35[5];
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  id v42;
  _BYTE v43[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFApplicationShortcutProvider accountsProvider](self, "accountsProvider"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "displayedAccounts"));
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFApplicationShortcutProvider favoritesPersistence](self, "favoritesPersistence"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mailboxesCollection"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "selectedItems"));

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v9 = v8;
    v10 = 0;
    v11 = 0;
    v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    if (v12)
    {
      v14 = *(_QWORD *)v38;
      *(_QWORD *)&v13 = 138412290;
      v34 = v13;
      while (1)
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v38 != v14)
            objc_enumerationMutation(v9);
          v16 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)v15);
          if (v10)
            goto LABEL_12;
          if (objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)v15), "type") == (id)3
            || objc_msgSend(v16, "type") == (id)2
            || objc_msgSend(v16, "type") == (id)4)
          {
            v10 = v16;
LABEL_12:
            if (v11)
              goto LABEL_21;
            goto LABEL_13;
          }
          v10 = 0;
          if (v11)
            goto LABEL_21;
LABEL_13:
          if (objc_msgSend(v16, "type", v34) != (id)5)
          {
            v11 = 0;
            goto LABEL_23;
          }
          v17 = v16;
          if (_MSSourceTypeIsValid(objc_msgSend(v17, "sourceType")))
          {
            v11 = v17;
          }
          else
          {
            v18 = objc_claimAutoreleasedReturnValue(+[MFApplicationShortcutProvider log](MFApplicationShortcutProvider, "log"));
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v34;
              v42 = v17;
              _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Special mailbox %@ has an invalid source type", buf, 0xCu);
            }

            v11 = 0;
          }

LABEL_21:
          if (v10 && v11)
          {

            goto LABEL_31;
          }
LABEL_23:
          v15 = (char *)v15 + 1;
        }
        while (v12 != v15);
        v19 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
        v12 = v19;
        if (!v19)
        {

          if (!v11)
            goto LABEL_33;
LABEL_31:
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[MFApplicationShortcutProvider specialMailboxCountObserver](self, "specialMailboxCountObserver", v34));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "favoriteItem"));
          v22 = objc_msgSend(v21, "isEqual:", v11);

          if ((v22 & 1) == 0)
          {
            -[MFApplicationShortcutProvider setSpecialMailboxFavoriteItem:](self, "setSpecialMailboxFavoriteItem:", v11);
            v23 = (void *)objc_claimAutoreleasedReturnValue(-[MFApplicationShortcutProvider specialMailboxCountObserver](self, "specialMailboxCountObserver"));
            objc_msgSend(v23, "cancel");

            v24 = (void *)objc_claimAutoreleasedReturnValue(-[MFApplicationShortcutProvider startCountQueryForMailboxFavoriteItem:](self, "startCountQueryForMailboxFavoriteItem:", v11));
            -[MFApplicationShortcutProvider setSpecialMailboxCountObserver:](self, "setSpecialMailboxCountObserver:", v24);

          }
LABEL_33:
          if (v10)
          {
            v25 = (void *)objc_claimAutoreleasedReturnValue(-[MFApplicationShortcutProvider mailboxCountObserver](self, "mailboxCountObserver"));
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "favoriteItem"));
            v27 = objc_msgSend(v26, "isEqual:", v10);

            if ((v27 & 1) == 0)
            {
              -[MFApplicationShortcutProvider setMailboxFavoriteItem:](self, "setMailboxFavoriteItem:", v10);
              v28 = (void *)objc_claimAutoreleasedReturnValue(-[MFApplicationShortcutProvider mailboxCountObserver](self, "mailboxCountObserver"));
              objc_msgSend(v28, "cancel");

              v29 = (void *)objc_claimAutoreleasedReturnValue(-[MFApplicationShortcutProvider startCountQueryForMailboxFavoriteItem:](self, "startCountQueryForMailboxFavoriteItem:", v10));
              -[MFApplicationShortcutProvider setMailboxCountObserver:](self, "setMailboxCountObserver:", v29);
              goto LABEL_38;
            }
          }
          goto LABEL_39;
        }
      }
    }
    v29 = v9;
LABEL_38:

LABEL_39:
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_100144734;
    v35[3] = &unk_10051A910;
    v35[4] = self;
    v32 = objc_alloc_init((Class)NSMutableArray);
    v36 = v32;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
    objc_msgSend(v33, "performBlock:", v35);

  }
  else
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[MFApplicationShortcutProvider specialMailboxCountObserver](self, "specialMailboxCountObserver"));
    objc_msgSend(v30, "cancel");

    -[MFApplicationShortcutProvider setSpecialMailboxCountObserver:](self, "setSpecialMailboxCountObserver:", 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[MFApplicationShortcutProvider mailboxCountObserver](self, "mailboxCountObserver"));
    objc_msgSend(v31, "cancel");

    -[MFApplicationShortcutProvider setMailboxCountObserver:](self, "setMailboxCountObserver:", 0);
    -[MFApplicationShortcutProvider updateApplicationShortcutsForNoDisplayedAccounts](self, "updateApplicationShortcutsForNoDisplayedAccounts");
  }
}

- (id)startCountQueryForMailboxFavoriteItem:(id)a3
{
  id v4;
  _ShortcutCountObserverWrapper *v5;
  void *v6;
  void *v7;
  _ShortcutCountObserverWrapper *v8;
  _QWORD v10[4];
  id v11;
  id location;

  v4 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v5 = [_ShortcutCountObserverWrapper alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFApplicationShortcutProvider messagePersistence](self, "messagePersistence"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFApplicationShortcutProvider hookRegistry](self, "hookRegistry"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100144B80;
  v10[3] = &unk_10051DEC8;
  objc_copyWeak(&v11, &location);
  v8 = -[_ShortcutCountObserverWrapper initWithFavoriteItem:messagePersistence:hookRegistry:countDidChange:](v5, "initWithFavoriteItem:messagePersistence:hookRegistry:countDidChange:", v4, v6, v7, v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v8;
}

- (void)updateApplicationShortcutsForNoDisplayedAccounts
{
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;

  if (pthread_main_np() != 1)
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFApplicationShortcutProvider.m"), 193, CFSTR("Current thread must be main"));

  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFApplicationShortcutProvider fixedShortcutItems](self, "fixedShortcutItems"));
  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v4));

  v5 = objc_alloc((Class)SBSApplicationShortcutSystemIcon);
  v6 = objc_msgSend(v5, "initWithSystemImageName:", MFImageGlpyhsAppShortcutAddAccount);
  v7 = objc_alloc_init((Class)SBSApplicationShortcutItem);
  objc_msgSend(v7, "setType:", CFSTR("com.apple.mobilemail.MFMailAddAccountAppShortcut"));
  v8 = MFLookupLocalizedString(CFSTR("ADD_ACCOUNT_APP_SHORTCUT"), CFSTR("Add Account"), CFSTR("Message"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v7, "setLocalizedTitle:", v9);

  objc_msgSend(v7, "setIcon:", v6);
  objc_msgSend(v10, "addObject:", v7);
  -[MFApplicationShortcutProvider setShortcutItems:](self, "setShortcutItems:", v10);

}

- (id)fixedShortcutItems
{
  void *v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v16[2];

  v2 = (void *)qword_1005AA050;
  if (!qword_1005AA050)
  {
    v3 = objc_alloc((Class)SBSApplicationShortcutSystemIcon);
    v4 = objc_msgSend(v3, "initWithSystemImageName:", MFImageGlpyhsAppShortcutCompose);
    v5 = objc_alloc_init((Class)SBSApplicationShortcutItem);
    objc_msgSend(v5, "setType:", CFSTR("com.apple.mobilemail.NewMessageApplicationShortcut"));
    v6 = MFLookupLocalizedString(CFSTR("COMPOSE_APP_SHORTCUT"), CFSTR("New Message"), CFSTR("Message"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    objc_msgSend(v5, "setLocalizedTitle:", v7);

    objc_msgSend(v5, "setIcon:", v4);
    v8 = objc_alloc((Class)SBSApplicationShortcutSystemIcon);
    v9 = objc_msgSend(v8, "initWithSystemImageName:", MFImageGlpyhsAppShortcutSearch);
    v10 = objc_alloc_init((Class)SBSApplicationShortcutItem);
    objc_msgSend(v10, "setType:", CFSTR("com.apple.mobilemail.SearchApplicationShortcut"));
    v11 = MFLookupLocalizedString(CFSTR("SEARCH_APP_SHORTCUT"), CFSTR("Search"), CFSTR("Message"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    objc_msgSend(v10, "setLocalizedTitle:", v12);

    objc_msgSend(v10, "setIcon:", v9);
    v16[0] = v5;
    v16[1] = v10;
    v13 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 2));
    v14 = (void *)qword_1005AA050;
    qword_1005AA050 = v13;

    v2 = (void *)qword_1005AA050;
  }
  return v2;
}

- (id)_applicationShortcutForFavoriteItem:(id)a3 badgeCountString:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  const __CFString *v19;
  void *v20;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "displayName"));
  v9 = v7;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[MFApplicationShortcutProvider _applicationShortcutIconForFavoriteItem:](self, "_applicationShortcutIconForFavoriteItem:", v6));
  if (!v10)
  {
    v11 = objc_alloc((Class)SBSApplicationShortcutSystemIcon);
    v10 = objc_msgSend(v11, "initWithSystemImageName:", MFImageGlyphGenericMailbox);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MFApplicationShortcutProvider favoritesPersistence](self, "favoritesPersistence"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "indexPathForItem:", v6));
  v14 = objc_msgSend(v13, "row");

  v19 = CFSTR("MFMailFavoriteItemAppShortcutFavoriteItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v14));
  v20 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));

  v17 = objc_alloc_init((Class)SBSApplicationShortcutItem);
  objc_msgSend(v17, "setType:", CFSTR("com.apple.mobilemail.FavoriteItemApplicationShortcut"));
  objc_msgSend(v17, "setLocalizedTitle:", v8);
  objc_msgSend(v17, "setLocalizedSubtitle:", v9);
  objc_msgSend(v17, "setIcon:", v10);
  objc_msgSend(v17, "setUserInfo:", v16);

  return v17;
}

- (id)_applicationShortcutIconForFavoriteItem:(id)a3
{
  id v4;
  id v5;
  id *v6;
  id v7;
  id v9;
  void *v10;
  UIImage *v11;
  NSData *v12;
  void *v13;

  v4 = a3;
  v5 = 0;
  v6 = (id *)&MFImageGlyphGenericMailbox;
  switch((unint64_t)objc_msgSend(v4, "sourceType"))
  {
    case 0uLL:
      if (objc_msgSend(v4, "type") == (id)3)
      {
        v6 = (id *)&MFImageGlyphInboxMailbox;
      }
      else if (objc_msgSend(v4, "type") == (id)4)
      {
        v6 = (id *)&MFImageGlyphFavoriteInboxUnifiedMailbox;
      }
      goto LABEL_3;
    case 1uLL:
      v6 = (id *)&MFImageGlyphFavoriteVIPMailbox;
      goto LABEL_3;
    case 2uLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
    case 0x13uLL:
    case 0x14uLL:
    case 0x15uLL:
    case 0x16uLL:
      v6 = (id *)&MFImageGlyphFavoriteFlaggedMailbox;
      goto LABEL_3;
    case 3uLL:
      v6 = (id *)&MFImageGlyphFavoriteUnreadMailbox;
      goto LABEL_3;
    case 4uLL:
      v9 = objc_alloc((Class)SBSApplicationShortcutCustomImageIcon);
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
      v11 = (UIImage *)objc_claimAutoreleasedReturnValue(-[MFApplicationShortcutProvider _iconImageWithBackgroundColor:](self, "_iconImageWithBackgroundColor:", v10));
      v12 = UIImagePNGRepresentation(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v7 = objc_msgSend(v9, "initWithImageData:dataType:isTemplate:", v13, 0, 0);

      v5 = 0;
      goto LABEL_5;
    case 5uLL:
      v6 = (id *)&MFImageGlyphFavoriteAttachmentsMailbox;
      goto LABEL_3;
    case 6uLL:
      v6 = (id *)&MFImageGlyphFavoriteNotifydMailbox;
      goto LABEL_3;
    case 7uLL:
      v6 = (id *)&MFImageGlyphFavoriteTodayMailbox;
      goto LABEL_3;
    case 8uLL:
      v6 = (id *)&MFImageGlyphFavoriteMuteThreadMailbox;
      goto LABEL_3;
    case 0xFuLL:
      v6 = (id *)&MFImageGlyphFavoriteReadLaterMailbox;
      goto LABEL_3;
    case 0x17uLL:
      v6 = (id *)&MFImageGlyphFavoriteFollowUpMailbox;
      goto LABEL_3;
    case 0x19uLL:
      v6 = (id *)&MFImageGlyphFavoriteSendLaterMailbox;
      goto LABEL_3;
    case 0x1AuLL:
LABEL_3:
      v5 = *v6;
      break;
    default:
      break;
  }
  v7 = objc_msgSend(objc_alloc((Class)SBSApplicationShortcutSystemIcon), "initWithSystemImageName:", v5);
LABEL_5:

  return v7;
}

- (id)_iconImageWithBackgroundColor:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double y;
  double v22;
  UIImage *ImageFromCurrentImageContext;
  void *v24;
  CGSize v26;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));

  v6 = sub_10010A330(2, v5, 36.0);
  v7 = sub_10010A330(3, v5, 36.0);
  if (v6 < v7)
    v6 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = sub_100109D80(2, v5, v8, v3, 0, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = sub_100109D80(3, v5, v11, v3, 0, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  objc_msgSend(v10, "size");
  v15 = v14;
  objc_msgSend(v13, "size");
  v26.height = v15 + v16 + 2.0;
  v26.width = v6;
  UIGraphicsBeginImageContextWithOptions(v26, 0, 0.0);
  objc_msgSend(v10, "size");
  v18 = v17;
  v20 = v19;
  y = CGRectZero.origin.y;
  objc_msgSend(v10, "drawInRect:", CGRectZero.origin.x, y, v17, v19);
  objc_msgSend(v10, "size");
  objc_msgSend(v13, "drawInRect:", CGRectZero.origin.x, y + v22 + 2.0, v18, v20);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v24 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();

  return v24;
}

- (void)setShortcutItems:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  int v7;
  void *v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ef_map:", &stru_100520600));
  v5 = objc_claimAutoreleasedReturnValue(+[MFApplicationShortcutProvider log](MFApplicationShortcutProvider, "log"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Setting shortcuts: %@", (uint8_t *)&v7, 0xCu);
  }

  v6 = objc_alloc_init((Class)SBSApplicationShortcutService);
  objc_msgSend(v6, "updateDynamicApplicationShortcutItems:forBundleIdentifier:", v3, kMFMobileMailBundleIdentifier);

}

- (MFAccountsProvider)accountsProvider
{
  return self->_accountsProvider;
}

- (void)setAccountsProvider:(id)a3
{
  objc_storeStrong((id *)&self->_accountsProvider, a3);
}

- (FavoritesPersistence)favoritesPersistence
{
  return self->_favoritesPersistence;
}

- (void)setFavoritesPersistence:(id)a3
{
  objc_storeStrong((id *)&self->_favoritesPersistence, a3);
}

- (_ShortcutCountObserverWrapper)mailboxCountObserver
{
  return self->_mailboxCountObserver;
}

- (void)setMailboxCountObserver:(id)a3
{
  objc_storeStrong((id *)&self->_mailboxCountObserver, a3);
}

- (_ShortcutCountObserverWrapper)specialMailboxCountObserver
{
  return self->_specialMailboxCountObserver;
}

- (void)setSpecialMailboxCountObserver:(id)a3
{
  objc_storeStrong((id *)&self->_specialMailboxCountObserver, a3);
}

- (EDMessagePersistence)messagePersistence
{
  return self->_messagePersistence;
}

- (EDPersistenceHookRegistry)hookRegistry
{
  return self->_hookRegistry;
}

- (void)setHookRegistry:(id)a3
{
  objc_storeStrong((id *)&self->_hookRegistry, a3);
}

- (FavoriteItem)specialMailboxFavoriteItem
{
  return self->_specialMailboxFavoriteItem;
}

- (void)setSpecialMailboxFavoriteItem:(id)a3
{
  objc_storeStrong((id *)&self->_specialMailboxFavoriteItem, a3);
}

- (FavoriteItem)mailboxFavoriteItem
{
  return self->_mailboxFavoriteItem;
}

- (void)setMailboxFavoriteItem:(id)a3
{
  objc_storeStrong((id *)&self->_mailboxFavoriteItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailboxFavoriteItem, 0);
  objc_storeStrong((id *)&self->_specialMailboxFavoriteItem, 0);
  objc_storeStrong((id *)&self->_hookRegistry, 0);
  objc_storeStrong((id *)&self->_messagePersistence, 0);
  objc_storeStrong((id *)&self->_specialMailboxCountObserver, 0);
  objc_storeStrong((id *)&self->_mailboxCountObserver, 0);
  objc_storeStrong((id *)&self->_favoritesPersistence, 0);
  objc_storeStrong((id *)&self->_accountsProvider, 0);
}

@end
