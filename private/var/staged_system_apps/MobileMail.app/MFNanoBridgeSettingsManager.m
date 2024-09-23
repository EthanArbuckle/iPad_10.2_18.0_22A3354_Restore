@implementation MFNanoBridgeSettingsManager

+ (id)sharedInstance
{
  if (qword_1005AA288 != -1)
    dispatch_once(&qword_1005AA288, &stru_1005223D0);
  return (id)qword_1005AA280;
}

- (MFNanoBridgeSettingsManager)init
{
  MFNanoBridgeSettingsManager *v2;
  MFNanoBridgeSettingsManager *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *mailboxUidById;
  NSMutableDictionary *v6;
  NSMutableDictionary *accountByMailboxId;
  uint64_t v8;
  NSArray *activeAccounts;
  NPSManager *v10;
  NPSManager *syncManager;
  void *v12;
  void *v13;
  MFNanoBridgeSettingsManager *v14;
  objc_super v16;

  v2 = self;
  if ((MFDeviceSupportsNanoCompanion(self, a2) & 1) != 0)
  {
    v16.receiver = v2;
    v16.super_class = (Class)MFNanoBridgeSettingsManager;
    v3 = -[MFNanoBridgeSettingsManager init](&v16, "init");
    if (v3)
    {
      v4 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      mailboxUidById = v3->_mailboxUidById;
      v3->_mailboxUidById = v4;

      v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      accountByMailboxId = v3->_accountByMailboxId;
      v3->_accountByMailboxId = v6;

      v8 = objc_claimAutoreleasedReturnValue(-[MFNanoBridgeSettingsManager _loadAccounts](v3, "_loadAccounts"));
      activeAccounts = v3->_activeAccounts;
      v3->_activeAccounts = (NSArray *)v8;

      v10 = (NPSManager *)objc_alloc_init(off_1005A2848());
      syncManager = v3->_syncManager;
      v3->_syncManager = v10;

      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v12, "addObserver:selector:name:object:", v3, "_handleDidUnpair", NRPairedDeviceRegistryDeviceDidUnpairNotification, 0);

      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v13, "addObserver:selector:name:object:", v3, "_handlePairedDeviceChanged", NRPairedDeviceRegistryDeviceDidBecomeActive, 0);

      -[MFNanoBridgeSettingsManager updateSharedPreferences](v3, "updateSharedPreferences");
    }
    v2 = v3;
    v14 = v2;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)updateSharedPreferences
{
  if (-[MFNanoBridgeSettingsManager mirrorSettingsFromCompanion](self, "mirrorSettingsFromCompanion"))
    -[MFNanoBridgeSettingsManager notifyMirrorSettingsFromCompanionChanged](self, "notifyMirrorSettingsFromCompanionChanged");
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, NRPairedDeviceRegistryDeviceDidUnpairNotification, 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:name:object:", self, NRPairedDeviceRegistryDeviceDidBecomeActive, 0);

  v5.receiver = self;
  v5.super_class = (Class)MFNanoBridgeSettingsManager;
  -[MFNanoBridgeSettingsManager dealloc](&v5, "dealloc");
}

- (BOOL)mirrorSettingsFromCompanion
{
  return -[MFNanoBridgeSettingsManager _mirrorSettingsFromCompanion](self, "_mirrorSettingsFromCompanion");
}

- (id)bridgeSettingsMailboxSelection
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  unint64_t v16;
  uint64_t v17;
  MFBridgeSettingsMailboxSelection *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v19 = objc_alloc_init(MFBridgeSettingsMailboxSelection);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFNanoBridgeSettingsManager includeMailMailboxes](self, "includeMailMailboxes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", objc_msgSend(v3, "count")));

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFNanoBridgeSettingsManager includeMailMailboxes](self, "includeMailMailboxes"));
  v6 = 0;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v21;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v9);
        v11 = objc_opt_class(MFNanoBridgeSettingsAccountSpecificMailbox);
        if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
        {
          v12 = v10;
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "mailboxId"));
          objc_msgSend(v4, "addObject:", v13);

        }
        else
        {
          v14 = objc_opt_class(MFNanoBridgeSettingsSharedMailbox);
          if ((objc_opt_isKindOfClass(v10, v14) & 1) != 0)
          {
            v15 = v10;
            v16 = (unint64_t)objc_msgSend(v15, "mailboxFilterType");

            v6 |= v16;
          }
          else
          {
            v17 = objc_opt_class(MFNanoBridgeSettingsUnifiedMailbox);
            v6 |= objc_opt_isKindOfClass(v10, v17) & 1;
          }
        }
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v7);
  }

  -[MFBridgeSettingsMailboxSelection setInboxesFilterTypes:](v19, "setInboxesFilterTypes:", v6);
  -[MFBridgeSettingsMailboxSelection setSelectedMailboxes:](v19, "setSelectedMailboxes:", v4);

  return v19;
}

- (void)setUpdateMailboxSelection:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *i;
  uint64_t v8;
  void *v9;
  MFNanoBridgeSettingsAccountSpecificMailbox *v10;
  void *v11;
  MFNanoBridgeSettingsAccountSpecificMailbox *v12;
  MFNanoBridgeSettingsUnifiedMailbox *v13;
  id v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v14 = a3;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "mailboxesWithAllMessagesSyncEnabledIds"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_mailboxUidById, "objectForKeyedSubscript:", v8));
        if (v9)
        {
          v10 = [MFNanoBridgeSettingsAccountSpecificMailbox alloc];
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_accountByMailboxId, "objectForKeyedSubscript:", v8));
          v12 = -[MFNanoBridgeSettingsAccountSpecificMailbox initWithMailboxUid:account:](v10, "initWithMailboxUid:account:", v9, v11);

          objc_msgSend(v15, "addObject:", v12);
        }

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }

  -[MFNanoBridgeSettingsManager addSharedSettingsToArray:ifFilterTypes:containsFilter:](self, "addSharedSettingsToArray:ifFilterTypes:containsFilter:", v15, objc_msgSend(v14, "aggregatedMailboxesFilterTypes"), 2);
  -[MFNanoBridgeSettingsManager addSharedSettingsToArray:ifFilterTypes:containsFilter:](self, "addSharedSettingsToArray:ifFilterTypes:containsFilter:", v15, objc_msgSend(v14, "aggregatedMailboxesFilterTypes"), 4);
  -[MFNanoBridgeSettingsManager addSharedSettingsToArray:ifFilterTypes:containsFilter:](self, "addSharedSettingsToArray:ifFilterTypes:containsFilter:", v15, objc_msgSend(v14, "aggregatedMailboxesFilterTypes"), 8);
  -[MFNanoBridgeSettingsManager addSharedSettingsToArray:ifFilterTypes:containsFilter:](self, "addSharedSettingsToArray:ifFilterTypes:containsFilter:", v15, objc_msgSend(v14, "aggregatedMailboxesFilterTypes"), 16);
  -[MFNanoBridgeSettingsManager addSharedSettingsToArray:ifFilterTypes:containsFilter:](self, "addSharedSettingsToArray:ifFilterTypes:containsFilter:", v15, objc_msgSend(v14, "aggregatedMailboxesFilterTypes"), 32);
  -[MFNanoBridgeSettingsManager addSharedSettingsToArray:ifFilterTypes:containsFilter:](self, "addSharedSettingsToArray:ifFilterTypes:containsFilter:", v15, objc_msgSend(v14, "aggregatedMailboxesFilterTypes"), 64);
  if ((objc_msgSend(v14, "aggregatedMailboxesFilterTypes") & 1) != 0)
  {
    v13 = -[MFNanoBridgeSettingsUnifiedMailbox initWithType:]([MFNanoBridgeSettingsUnifiedMailbox alloc], "initWithType:", 7);
    objc_msgSend(v15, "addObject:", v13);

  }
  -[MFNanoBridgeSettingsManager setIncludeMailMailboxes:](self, "setIncludeMailMailboxes:", v15);

}

- (void)addSharedSettingsToArray:(id)a3 ifFilterTypes:(unint64_t)a4 containsFilter:(unint64_t)a5
{
  MFNanoBridgeSettingsSharedMailbox *v7;
  id v8;

  v8 = a3;
  if ((a5 & a4) != 0)
  {
    v7 = -[MFNanoBridgeSettingsSharedMailbox initWithType:]([MFNanoBridgeSettingsSharedMailbox alloc], "initWithType:", +[MFNanoBridgeSettingsMailbox sourceTypeForMailboxFilterType:](MFNanoBridgeSettingsMailbox, "sourceTypeForMailboxFilterType:", a5));
    objc_msgSend(v8, "addObject:", v7);

  }
}

- (NSDictionary)standaloneAccountStateByAccountId
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFNanoBridgeSettingsManager _getValueForKey:](self, "_getValueForKey:", CFSTR("kStandaloneAccountStateByAccountIdKey")));
  if (v2)
  {
    v7 = objc_opt_class(NSDictionary);
    v8 = objc_opt_class(NSString);
    v9 = objc_opt_class(NSNumber);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 3));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v3, v7, v8));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v4, v2, 0));

  }
  else
  {
    v5 = 0;
  }

  return (NSDictionary *)v5;
}

- (void)setStandaloneAccountStateByAccountId:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, 0));
  -[MFNanoBridgeSettingsManager _setValue:forKey:syncWithClient:](self, "_setValue:forKey:syncWithClient:");

}

- (NSArray)accountIdentities
{
  void *v2;
  Class v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFNanoBridgeSettingsManager _getValueForKey:](self, "_getValueForKey:", CFSTR("kAccountIdentitiesKey")));
  if (v2)
  {
    v3 = off_1005A2850();
    v8[0] = objc_opt_class(v3);
    v8[1] = objc_opt_class(NSArray);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v8, 2));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v4));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v5, v2, 0));

  }
  else
  {
    v6 = 0;
  }

  return (NSArray *)v6;
}

- (void)setAccountIdentities:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, 0));
  -[MFNanoBridgeSettingsManager _setValue:forKey:syncWithClient:](self, "_setValue:forKey:syncWithClient:");

}

- (NSArray)includeMailMailboxes
{
  return (NSArray *)-[MFNanoBridgeSettingsManager _includeMailMailbox](self, "_includeMailMailbox");
}

- (unint64_t)linesOfPreview
{
  return -[MFNanoBridgeSettingsManager _linesOfPreview](self, "_linesOfPreview");
}

- (void)setLinesOfPreview:(unint64_t)a3
{
  -[MFNanoBridgeSettingsManager _setLinesOfPreview:](self, "_setLinesOfPreview:", a3);
}

- (BOOL)askBeforeDeleting
{
  return -[MFNanoBridgeSettingsManager _askBeforeDeleting](self, "_askBeforeDeleting");
}

- (void)setAskBeforeDeleting:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (!-[MFNanoBridgeSettingsManager mirrorSettingsFromCompanion](self, "mirrorSettingsFromCompanion"))
    -[MFNanoBridgeSettingsManager _setAskBeforeDeleting:](self, "_setAskBeforeDeleting:", v3);
}

- (BOOL)loadRemoteImages
{
  return -[MFNanoBridgeSettingsManager _loadRemoteImages](self, "_loadRemoteImages");
}

- (void)setLoadRemoteImages:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (!-[MFNanoBridgeSettingsManager mirrorSettingsFromCompanion](self, "mirrorSettingsFromCompanion"))
    -[MFNanoBridgeSettingsManager _setLoadRemoteImages:](self, "_setLoadRemoteImages:", v3);
}

- (BOOL)organizeByThread
{
  return -[MFNanoBridgeSettingsManager _organizeByThread](self, "_organizeByThread");
}

- (void)setOrganizeByThread:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (!-[MFNanoBridgeSettingsManager mirrorSettingsFromCompanion](self, "mirrorSettingsFromCompanion"))
    -[MFNanoBridgeSettingsManager _setOrganizeByThread:](self, "_setOrganizeByThread:", v3);
}

- (NSString)swipeRightAction
{
  return (NSString *)-[MFNanoBridgeSettingsManager _swipeRightAction](self, "_swipeRightAction");
}

- (BOOL)cloudNotificationsEnabled
{
  return -[MFNanoBridgeSettingsManager _cloudNotificationsEnabled](self, "_cloudNotificationsEnabled");
}

- (void)setCloudNotificationsEnabled:(BOOL)a3
{
  -[MFNanoBridgeSettingsManager _setCloudNotificationsEnabled:](self, "_setCloudNotificationsEnabled:", a3);
}

- (NSString)htmlSignature
{
  return (NSString *)-[MFNanoBridgeSettingsManager _signature](self, "_signature");
}

- (void)setHtmlSignature:(id)a3
{
  -[MFNanoBridgeSettingsManager _setSignature:](self, "_setSignature:", a3);
}

- (BOOL)alwaysLoadContentDirectly
{
  return -[MFNanoBridgeSettingsManager _alwaysLoadContentDirectly](self, "_alwaysLoadContentDirectly");
}

- (void)setAlwaysLoadContentDirectly:(BOOL)a3
{
  -[MFNanoBridgeSettingsManager _setAlwaysLoadContentDirectly:](self, "_setAlwaysLoadContentDirectly:", a3);
}

- (NSString)signature
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;
  _QWORD v21[2];
  _QWORD v22[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MFNanoBridgeSettingsManager sharedInstance](MFNanoBridgeSettingsManager, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "htmlSignature"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dataUsingEncoding:", 4));

  v5 = objc_alloc((Class)NSAttributedString);
  v21[0] = NSDocumentTypeDocumentAttribute;
  v21[1] = NSCharacterEncodingDocumentAttribute;
  v22[0] = NSHTMLTextDocumentType;
  v22[1] = &off_1005418D8;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v22, v21, 2));
  v20 = 0;
  v7 = objc_msgSend(v5, "initWithData:options:documentAttributes:error:", v4, v6, 0, &v20);
  v8 = v20;

  if (v8)
  {
    v10 = MFLogGeneral(v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1003947FC((uint64_t)v8, v11);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "string"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet newlineCharacterSet](NSCharacterSet, "newlineCharacterSet"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_stringByReplacingCharactersInSet:withCharacter:", v13, 10));

  if (v14)
  {
    while (objc_msgSend(v14, "rangeOfString:", CFSTR("\n\n")) != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n\n"), CFSTR("\n")));

      v14 = (void *)v15;
    }
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(" ")));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stringByTrimmingCharactersInSet:", v17));

  return (NSString *)v18;
}

- (BOOL)privacyProtectionEnabled
{
  _BOOL4 v3;

  v3 = -[MFNanoBridgeSettingsManager mirrorSettingsFromCompanion](self, "mirrorSettingsFromCompanion");
  if (v3)
    LOBYTE(v3) = -[MFNanoBridgeSettingsManager _mobileMailPrivacyProtectionEnabled](self, "_mobileMailPrivacyProtectionEnabled");
  return v3;
}

- (void)notifyMirrorSettingsFromCompanionChanged
{
  if (-[MFNanoBridgeSettingsManager mirrorSettingsFromCompanion](self, "mirrorSettingsFromCompanion"))
  {
    -[MFNanoBridgeSettingsManager notifyMobileMailAskBeforeDeletingChanged](self, "notifyMobileMailAskBeforeDeletingChanged");
    -[MFNanoBridgeSettingsManager notifyMobileMailLoadRemoteImagesChanged](self, "notifyMobileMailLoadRemoteImagesChanged");
    -[MFNanoBridgeSettingsManager notifyMobileMailPrivacyProtectionChanged](self, "notifyMobileMailPrivacyProtectionChanged");
    -[MFNanoBridgeSettingsManager notifyMobileMailOrganizeByThreadChanged](self, "notifyMobileMailOrganizeByThreadChanged");
    -[MFNanoBridgeSettingsManager notifyMobileMailDefaultAccountUidChanged](self, "notifyMobileMailDefaultAccountUidChanged");
  }
  else
  {
    -[MFNanoBridgeSettingsManager notifyMobileMailPrivacyProtectionChanged](self, "notifyMobileMailPrivacyProtectionChanged");
  }
}

- (void)notifyMobileMailAskBeforeDeletingChanged
{
  -[MFNanoBridgeSettingsManager _setAskBeforeDeleting:](self, "_setAskBeforeDeleting:", -[MFNanoBridgeSettingsManager _mobileMailAskBeforeDeleting](self, "_mobileMailAskBeforeDeleting"));
}

- (void)notifyMobileMailLoadRemoteImagesChanged
{
  -[MFNanoBridgeSettingsManager _setLoadRemoteImages:](self, "_setLoadRemoteImages:", -[MFNanoBridgeSettingsManager _mobileMailLoadRemoteImages](self, "_mobileMailLoadRemoteImages"));
}

- (void)notifyMobileMailPrivacyProtectionChanged
{
  -[MFNanoBridgeSettingsManager _setPrivacyProtectionEnabled:](self, "_setPrivacyProtectionEnabled:", -[MFNanoBridgeSettingsManager privacyProtectionEnabled](self, "privacyProtectionEnabled"));
}

- (void)notifyMobileMailOrganizeByThreadChanged
{
  -[MFNanoBridgeSettingsManager _setOrganizeByThread:](self, "_setOrganizeByThread:", -[MFNanoBridgeSettingsManager _mobileMailOrganizeByThread](self, "_mobileMailOrganizeByThread"));
}

- (void)notifyMobileMailSwipeRightActionChanged
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MFNanoBridgeSettingsManager _mobileMailSwipeRightAction](self, "_mobileMailSwipeRightAction"));
  -[MFNanoBridgeSettingsManager _setSwipeRightAction:](self, "_setSwipeRightAction:");

}

- (void)notifyMobileMailDefaultAccountUidChanged
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MFNanoBridgeSettingsManager _mobileMailDefaultAccountId](self, "_mobileMailDefaultAccountId"));
  -[MFNanoBridgeSettingsManager _setDefaultAccountId:](self, "_setDefaultAccountId:");

}

- (void)notifyMobileMailAccountsChanged
{
  NSArray *v3;
  NSArray *activeAccounts;
  void *v5;
  MFNanoBridgeSettingsUnifiedMailbox *v6;
  unsigned int v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  uint64_t v13;
  id v14;
  void *v16;
  void *v17;
  void *v18;
  NSArray *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v19 = self->_activeAccounts;
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue(-[MFNanoBridgeSettingsManager _loadAccounts](self, "_loadAccounts"));
  activeAccounts = self->_activeAccounts;
  self->_activeAccounts = v3;

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MFNanoBridgeSettingsManager includeMailMailboxes](self, "includeMailMailboxes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:"));
  v6 = -[MFNanoBridgeSettingsUnifiedMailbox initWithType:]([MFNanoBridgeSettingsUnifiedMailbox alloc], "initWithType:", 7);
  v7 = objc_msgSend(v5, "containsObject:", v6);
  if (-[NSArray count](self->_activeAccounts, "count") < 2 || (id)-[NSArray count](v19, "count") != (id)1)
  {
    if (!v7)
      goto LABEL_22;
LABEL_21:
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[MailAccount nano_bridgeSettingsInboxesFromAccounts:](MailAccount, "nano_bridgeSettingsInboxesFromAccounts:", self->_activeAccounts));
    objc_msgSend(v5, "addObjectsFromArray:", v16);

    goto LABEL_22;
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v18;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v13 = objc_opt_class(MFNanoBridgeSettingsAccountSpecificMailbox);
        if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
        {
          v14 = v12;
          if (objc_msgSend(v14, "type") == (id)7 && (v7 & 1) == 0)
          {
            objc_msgSend(v5, "addObject:", v6);
            LOBYTE(v7) = 1;
          }

        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  if ((v7 & 1) != 0)
    goto LABEL_21;
LABEL_22:
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allObjects"));
  -[MFNanoBridgeSettingsManager _setIncludeMailMailboxes:](self, "_setIncludeMailMailboxes:", v17);

}

- (void)reloadCachedAccounts
{
  NSArray *v3;
  NSArray *activeAccounts;

  +[MailAccount reloadAccounts](MailAccount, "reloadAccounts");
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue(-[MFNanoBridgeSettingsManager _loadAccounts](self, "_loadAccounts"));
  activeAccounts = self->_activeAccounts;
  self->_activeAccounts = v3;

}

- (BOOL)_mirrorSettingsFromCompanion
{
  return PSIsNanoMirroringDomain(kMFMobileMailBundleIdentifier, a2);
}

- (id)_includeMailMailbox
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  id v26;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  void *v36;
  uint8_t buf[4];
  void *v38;

  v2 = objc_claimAutoreleasedReturnValue(-[MFNanoBridgeSettingsManager _mailboxSelectionFromPreviousOSVersion](self, "_mailboxSelectionFromPreviousOSVersion"));
  v29 = (void *)v2;
  if (v2)
  {
    v3 = MFLogGeneral(v2);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v38 = v29;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#Nano Mailbox selection list is from legacy OS. %{public}@", buf, 0xCu);
    }

    v5 = objc_opt_class(MFNanoBridgeSettingsUnifiedMailbox);
    if ((objc_opt_isKindOfClass(v29, v5) & 1) != 0)
    {
      v30 = 0;
    }
    else
    {
      v36 = v29;
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v36, 1));
      -[MFNanoBridgeSettingsManager _setIncludeMailMailboxes:](self, "_setIncludeMailMailboxes:");
    }
  }
  else
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[MFNanoBridgeSettingsManager _includeMailMailboxesFromDisk](self, "_includeMailMailboxesFromDisk"));
    v6 = MFLogGeneral(v30);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v38 = v30;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "#Nano Mailbox selection list read from disk. %{public}@", buf, 0xCu);
    }

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MailAccount nano_activeMailAccounts](MailAccount, "nano_activeMailAccounts"));
  v9 = 0;
  if (objc_msgSend(v8, "count") && v30)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v30, "count")));
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v11 = v30;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (!v12)
      goto LABEL_27;
    v13 = *(_QWORD *)v32;
    while (1)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v32 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
        v16 = objc_opt_class(MFNanoBridgeSettingsUnifiedMailbox);
        if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
        {
          if ((unint64_t)objc_msgSend(v8, "count") > 1)
            goto LABEL_21;
        }
        else
        {
          v17 = objc_msgSend(v15, "isValid");
          if ((_DWORD)v17)
          {
LABEL_21:
            objc_msgSend(v10, "addObject:", v15);
            continue;
          }
          v18 = MFLogGeneral(v17);
          v19 = objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v38 = v15;
            _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "#Nano Mailbox no longer available. Ignoring. %{public}@", buf, 0xCu);
          }

        }
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      if (!v12)
      {
LABEL_27:

        v9 = v10;
        break;
      }
    }
  }
  v20 = objc_msgSend(v9, "count");
  if (v20)
  {
    v21 = MFLogGeneral(v20);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v38 = v9;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "#Nano Mailbox selection list validated. %{public}@", buf, 0xCu);
    }

  }
  else
  {
    v23 = MFLogGeneral(0);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "#Nano Mailbox selection list does not exist. Creating default seletion", buf, 2u);
    }

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[MFNanoBridgeSettingsMailbox defaultSelectedMailboxes](MFNanoBridgeSettingsMailbox, "defaultSelectedMailboxes"));
    v26 = objc_msgSend(v25, "mutableCopy");

    v9 = v26;
    -[MFNanoBridgeSettingsManager _setIncludeMailMailboxes:](self, "_setIncludeMailMailboxes:", v26);
  }

  return v9;
}

- (unint64_t)_linesOfPreview
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  unint64_t v8;

  v3 = off_1005A2858();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFNanoBridgeSettingsManager _getValueForKey:](self, "_getValueForKey:", v4));

  if (v5 && (v6 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
    v7 = objc_msgSend(v5, "unsignedIntegerValue");
  else
    v7 = (id)off_1005A2860();
  v8 = (unint64_t)v7;

  return v8;
}

- (BOOL)_askBeforeDeleting
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unsigned __int8 v7;
  BOOL v8;

  v3 = off_1005A2868();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFNanoBridgeSettingsManager _getValueForKey:](self, "_getValueForKey:", v4));

  if (v5 && (v6 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
    v7 = objc_msgSend(v5, "BOOLValue");
  else
    v7 = off_1005A2870();
  v8 = v7;

  return v8;
}

- (BOOL)_loadRemoteImages
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unsigned __int8 v7;
  BOOL v8;

  v3 = off_1005A2878();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFNanoBridgeSettingsManager _getValueForKey:](self, "_getValueForKey:", v4));

  if (v5 && (v6 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
    v7 = objc_msgSend(v5, "BOOLValue");
  else
    v7 = off_1005A2880();
  v8 = v7;

  return v8;
}

- (BOOL)_organizeByThread
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unsigned __int8 v7;
  BOOL v8;

  v3 = off_1005A2888();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFNanoBridgeSettingsManager _getValueForKey:](self, "_getValueForKey:", v4));

  if (v5 && (v6 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
    v7 = objc_msgSend(v5, "BOOLValue");
  else
    v7 = off_1005A2890();
  v8 = v7;

  return v8;
}

- (id)_swipeRightAction
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;

  v3 = off_1005A2898();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFNanoBridgeSettingsManager _getValueForKey:perGizmo:](self, "_getValueForKey:perGizmo:", v4, 0));

  if (v5)
  {
    v6 = v5;
  }
  else
  {
    v7 = off_1005A28A0();
    v6 = (id)objc_claimAutoreleasedReturnValue(v7);
  }
  v8 = v6;

  return v8;
}

- (id)_signature
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  Class v8;
  NSBundle *v9;
  void *v10;
  id v11;
  void *v12;

  v3 = off_1005A28A8();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFNanoBridgeSettingsManager _getValueForKey:](self, "_getValueForKey:", v4));

  if (v5 && (v6 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    v7 = v5;
  }
  else
  {
    v8 = off_1005A28B0();
    v9 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(v8));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = off_1005A28B8();
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", v12, &stru_100531B00, CFSTR("NanoMailKit")));

  }
  return v7;
}

- (BOOL)_alwaysLoadContentDirectly
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unsigned __int8 v7;
  BOOL v8;

  v3 = off_1005A28C0();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFNanoBridgeSettingsManager _getValueForKey:](self, "_getValueForKey:", v4));

  if (v5 && (v6 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
    v7 = objc_msgSend(v5, "BOOLValue");
  else
    v7 = off_1005A28C8();
  v8 = v7;

  return v8;
}

- (BOOL)_cloudNotificationsEnabled
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unsigned __int8 v7;
  BOOL v8;

  v3 = off_1005A28D0();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFNanoBridgeSettingsManager _getValueForKey:perGizmo:](self, "_getValueForKey:perGizmo:", v4, 0));

  if (v5 && (v6 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
    v7 = objc_msgSend(v5, "BOOLValue");
  else
    v7 = off_1005A28D8();
  v8 = v7;

  return v8;
}

- (void)_setIncludeMailMailboxes:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, 0));
  -[MFNanoBridgeSettingsManager _setValue:forKey:syncWithClient:](self, "_setValue:forKey:syncWithClient:");

}

- (id)_includeMailMailboxesFromDisk
{
  void *v2;
  uint64_t v3;
  NSSet *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFNanoBridgeSettingsManager _getValueForKey:](self, "_getValueForKey:", CFSTR("kIncludeMailBoxesKey")));
  if (v2)
  {
    v3 = objc_opt_class(NSArray);
    v4 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v3, objc_opt_class(MFNanoBridgeSettingsMailbox), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v5, v2, 0));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_mailboxSelectionFromPreviousOSVersion
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFNanoBridgeSettingsManager _getValueForKey:](self, "_getValueForKey:", CFSTR("NanoMailIncludeMail")));
  if (v3)
  {
    v4 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(MFNanoBridgeSettingsMailbox), v3, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    -[MFNanoBridgeSettingsManager _setValue:forKey:syncWithClient:](self, "_setValue:forKey:syncWithClient:", 0, CFSTR("NanoMailIncludeMail"), 0);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_setLinesOfPreview:(unint64_t)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v4 = off_1005A2858();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[MFNanoBridgeSettingsManager _setValue:forKey:syncWithClient:](self, "_setValue:forKey:syncWithClient:", v6, v5, 1);

}

- (void)_setAskBeforeDeleting:(BOOL)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a3));
  v4 = off_1005A2868();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[MFNanoBridgeSettingsManager _setValue:forKey:syncWithClient:](self, "_setValue:forKey:syncWithClient:", v6, v5, 1);

}

- (void)_setLoadRemoteImages:(BOOL)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a3));
  v4 = off_1005A2878();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[MFNanoBridgeSettingsManager _setValue:forKey:syncWithClient:](self, "_setValue:forKey:syncWithClient:", v6, v5, 1);

}

- (void)_setPrivacyProtectionEnabled:(BOOL)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a3));
  v4 = off_1005A28E0();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[MFNanoBridgeSettingsManager _setValue:forKey:syncWithClient:](self, "_setValue:forKey:syncWithClient:", v6, v5, 1);

}

- (void)_setAlwaysLoadContentDirectly:(BOOL)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a3));
  v4 = off_1005A28C0();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[MFNanoBridgeSettingsManager _setValue:forKey:syncWithClient:](self, "_setValue:forKey:syncWithClient:", v6, v5, 1);

}

- (void)_setOrganizeByThread:(BOOL)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a3));
  v4 = off_1005A2888();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[MFNanoBridgeSettingsManager _setValue:forKey:syncWithClient:](self, "_setValue:forKey:syncWithClient:", v6, v5, 1);

}

- (void)_setSwipeRightAction:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = off_1005A2898();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[MFNanoBridgeSettingsManager _setValue:forKey:syncWithClient:perGizmo:](self, "_setValue:forKey:syncWithClient:perGizmo:", v6, v5, 1, 0);

}

- (void)_setSignature:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = off_1005A28A8();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[MFNanoBridgeSettingsManager _setValue:forKey:syncWithClient:](self, "_setValue:forKey:syncWithClient:", v6, v5, 1);

}

- (void)_setDefaultAccountId:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = off_1005A28E8();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[MFNanoBridgeSettingsManager _setValue:forKey:syncWithClient:](self, "_setValue:forKey:syncWithClient:", v6, v5, 1);

}

- (void)_setCloudNotificationsEnabled:(BOOL)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a3));
  v4 = off_1005A28D0();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[MFNanoBridgeSettingsManager _setValue:forKey:syncWithClient:](self, "_setValue:forKey:syncWithClient:", v6, v5, 1);

}

- (BOOL)_mobileMailAskBeforeDeleting
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults em_userDefaults](NSUserDefaults, "em_userDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", ShowMessageDeleteConfirmationKey));

  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (BOOL)_mobileMailLoadRemoteImages
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults em_userDefaults](NSUserDefaults, "em_userDefaults"));
  v3 = objc_msgSend(v2, "integerForKey:", EMUserDefaultLoadRemoteContentKey);

  return (v3 & 2) == 0;
}

- (BOOL)_mobileMailPrivacyProtectionEnabled
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults em_userDefaults](NSUserDefaults, "em_userDefaults"));
  v3 = objc_msgSend(v2, "integerForKey:", EMUserDefaultLoadRemoteContentKey);

  return (~v3 & 0xC) != 0;
}

- (BOOL)_mobileMailOrganizeByThread
{
  void *v2;
  void *v3;
  unsigned int v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults em_userDefaults](NSUserDefaults, "em_userDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", DisableThreadingKey));

  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue") ^ 1;
  else
    LOBYTE(v4) = 1;

  return v4;
}

- (id)_mobileMailSwipeRightAction
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults em_userDefaults](NSUserDefaults, "em_userDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", RightSwipeActionKey));

  return v3;
}

- (id)_mobileMailDefaultAccountId
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults em_userDefaults](NSUserDefaults, "em_userDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", MailDefaultSendingAccountKey));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MailAccount defaultMailAccountForDelivery](MailAccount, "defaultMailAccountForDelivery"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uniqueID"));

  }
  return v3;
}

- (id)_getValueForKey:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(-[MFNanoBridgeSettingsManager _getValueForKey:perGizmo:](self, "_getValueForKey:perGizmo:", a3, 1));
}

- (id)_getValueForKey:(id)a3 perGizmo:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v4 = a4;
  v6 = a3;
  if (v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFNanoBridgeSettingsManager domainAccessor](self, "domainAccessor"));
    v8 = objc_msgSend(v7, "synchronize");

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MFNanoBridgeSettingsManager domainAccessor](self, "domainAccessor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v6));

  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MFNanoBridgeSettingsManager readFromSharedPreferencesValueForKey:](self, "readFromSharedPreferencesValueForKey:", v6));
  }

  return v10;
}

- (void)_setValue:(id)a3 forKey:(id)a4 syncWithClient:(BOOL)a5
{
  -[MFNanoBridgeSettingsManager _setValue:forKey:syncWithClient:perGizmo:](self, "_setValue:forKey:syncWithClient:perGizmo:", a3, a4, a5, 1);
}

- (void)_setValue:(id)a3 forKey:(id)a4 syncWithClient:(BOOL)a5 perGizmo:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NPSManager *syncManager;
  void *v19;
  NPSManager *v20;
  id v21;
  void *v22;
  uint64_t v23;
  unsigned __int8 v24;
  uint64_t v25;
  void *v26;
  unsigned __int8 v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v35;
  id v36;

  v6 = a6;
  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MFNanoBridgeSettingsManager readFromSharedPreferencesValueForKey:](self, "readFromSharedPreferencesValueForKey:", v11));
  -[MFNanoBridgeSettingsManager _saveValueToSharedPreference:forKey:](self, "_saveValueToSharedPreference:forKey:", v10, v11);
  if (v6)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MFNanoBridgeSettingsManager domainAccessor](self, "domainAccessor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", v11));

    if ((objc_msgSend(v14, "isEqual:", v10) & 1) == 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[MFNanoBridgeSettingsManager domainAccessor](self, "domainAccessor"));
      objc_msgSend(v15, "setObject:forKey:", v10, v11);

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[MFNanoBridgeSettingsManager domainAccessor](self, "domainAccessor"));
      v17 = objc_msgSend(v16, "synchronize");

      if (v7)
      {
        syncManager = self->_syncManager;
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v11));
        -[NPSManager synchronizeNanoDomain:keys:](syncManager, "synchronizeNanoDomain:keys:", CFSTR("com.apple.NanoMail"), v19);

      }
    }
  }
  else
  {
    if (((objc_msgSend(v12, "isEqual:", v10) | !v7) & 1) != 0)
      goto LABEL_8;
    v20 = self->_syncManager;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v11));
    -[NPSManager synchronizeUserDefaultsDomain:keys:](v20, "synchronizeUserDefaultsDomain:keys:", CFSTR("com.apple.NanoMail"), v14);
  }

LABEL_8:
  v21 = off_1005A2888();
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  if ((objc_msgSend(v11, "isEqualToString:", v22) & 1) != 0)
  {

  }
  else
  {
    v24 = objc_msgSend(v11, "isEqualToString:", CFSTR("kIncludeMailBoxesKey"));

    if ((v24 & 1) == 0)
      goto LABEL_18;
  }
  v25 = MFUserAgent(v23);
  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  v27 = objc_msgSend(v26, "isMaild");

  if ((v27 & 1) != 0)
  {
    v29 = MFLogGeneral(v28);
    v30 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      sub_100394870((uint64_t)v11, v30);

    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v31, "postNotificationName:object:userInfo:", MailDefaultsChangedNotification, v11, 0);

  }
  else
  {
    v32 = MFLogGeneral(v28);
    v33 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v35 = 138412290;
      v36 = v11;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "#Nano Posting Darwin Notification Bridge Setting has Changed for key: %@", (uint8_t *)&v35, 0xCu);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("MFNanoMailImportantBridgeSettingHasChangedDarwinNotification"), 0, 0, 1u);
  }
LABEL_18:

}

- (void)_saveValueToSharedPreference:(id)a3 forKey:(id)a4
{
  __CFString *v5;
  id value;

  value = a3;
  v5 = (__CFString *)a4;
  CFPreferencesSetValue(v5, value, CFSTR("com.apple.NanoMail"), kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  CFPreferencesSynchronize(CFSTR("com.apple.NanoMail"), kCFPreferencesCurrentUser, kCFPreferencesAnyApplication);

}

- (id)readFromSharedPreferencesValueForKey:(id)a3
{
  return (id)(id)CFPreferencesCopyValue((CFStringRef)a3, CFSTR("com.apple.NanoMail"), kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
}

- (void)_handleDidUnpair
{
  NPSDomainAccessor *domainAccessor;

  domainAccessor = self->_domainAccessor;
  self->_domainAccessor = 0;

}

- (void)_handlePairedDeviceChanged
{
  NPSDomainAccessor *domainAccessor;

  domainAccessor = self->_domainAccessor;
  self->_domainAccessor = 0;

  -[MFNanoBridgeSettingsManager updateSharedPreferences](self, "updateSharedPreferences");
}

- (id)_loadAccounts
{
  void *v3;
  id v4;
  void *i;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *j;
  void *v12;
  void *v13;
  id v15;
  uint64_t v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];

  -[NSMutableDictionary removeAllObjects](self->_mailboxUidById, "removeAllObjects");
  v15 = objc_alloc_init((Class)NSMutableArray);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MailAccount activeAccounts](MailAccount, "activeAccounts"));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v4)
  {
    v16 = *(_QWORD *)v23;
    do
    {
      v17 = v4;
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v16)
          objc_enumerationMutation(v3);
        v6 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v7 = objc_opt_class(LocalAccount);
        if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
        {
          objc_msgSend(v15, "addObject:", v6);
          v20 = 0u;
          v21 = 0u;
          v18 = 0u;
          v19 = 0u;
          v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allMailboxUids"));
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          if (v9)
          {
            v10 = *(_QWORD *)v19;
            do
            {
              for (j = 0; j != v9; j = (char *)j + 1)
              {
                if (*(_QWORD *)v19 != v10)
                  objc_enumerationMutation(v8);
                v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)j);
                v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "nano_mailboxId"));
                if (v13)
                {
                  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_accountByMailboxId, "setObject:forKeyedSubscript:", v6, v13);
                  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mailboxUidById, "setObject:forKeyedSubscript:", v12, v13);
                }

              }
              v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
            }
            while (v9);
          }

        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v4);
  }

  return v15;
}

- (id)domainAccessor
{
  NPSDomainAccessor *domainAccessor;
  NPSDomainAccessor *v4;
  NPSDomainAccessor *v5;

  domainAccessor = self->_domainAccessor;
  if (!domainAccessor)
  {
    v4 = (NPSDomainAccessor *)objc_msgSend(objc_alloc(off_1005A28F0()), "initWithDomain:", CFSTR("com.apple.NanoMail"));
    v5 = self->_domainAccessor;
    self->_domainAccessor = v4;

    domainAccessor = self->_domainAccessor;
  }
  return domainAccessor;
}

- (NSArray)activeAccounts
{
  return self->_activeAccounts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeAccounts, 0);
  objc_storeStrong((id *)&self->_accountByMailboxId, 0);
  objc_storeStrong((id *)&self->_mailboxUidById, 0);
  objc_storeStrong((id *)&self->_domainAccessor, 0);
  objc_storeStrong((id *)&self->_syncManager, 0);
}

@end
