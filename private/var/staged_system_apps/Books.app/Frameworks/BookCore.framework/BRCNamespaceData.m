@implementation BRCNamespaceData

- (id)copyWithZone:(_NSZone *)a3
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

  v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BRCNamespaceData namespaceIdentifier](self, "namespaceIdentifier"));
  objc_msgSend(v4, "setNamespaceIdentifier:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BRCNamespaceData bundleID](self, "bundleID"));
  objc_msgSend(v4, "setBundleID:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BRCNamespaceData systemDefaults](self, "systemDefaults"));
  objc_msgSend(v4, "setSystemDefaults:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BRCNamespaceData configuration](self, "configuration"));
  objc_msgSend(v4, "setConfiguration:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BRCNamespaceData subscribers](self, "subscribers"));
  objc_msgSend(v4, "setSubscribers:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BRCNamespaceData treatmentIDs](self, "treatmentIDs"));
  objc_msgSend(v4, "setTreatmentIDs:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BRCNamespaceData segmentIDs](self, "segmentIDs"));
  objc_msgSend(v4, "setSegmentIDs:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BRCNamespaceData segmentSetIDs](self, "segmentSetIDs"));
  objc_msgSend(v4, "setSegmentSetIDs:", v12);

  return v4;
}

- (BRCNamespaceData)init
{
  BRCNamespaceData *v2;
  NSMutableArray *v3;
  NSMutableArray *subscribers;
  NSDictionary *v5;
  NSDictionary *configuration;
  NSDictionary *v7;
  NSDictionary *systemDefaults;
  NSArray *v9;
  NSArray *segmentIDs;
  NSArray *v11;
  NSArray *segmentSetIDs;
  NSArray *v13;
  NSArray *treatmentIDs;
  id v15;
  NSUserDefaults *v16;
  NSUserDefaults *userDefaults;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)BRCNamespaceData;
  v2 = -[BRCNamespaceData init](&v19, "init");
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    subscribers = v2->_subscribers;
    v2->_subscribers = v3;

    v5 = (NSDictionary *)objc_alloc_init((Class)NSDictionary);
    configuration = v2->_configuration;
    v2->_configuration = v5;

    v7 = (NSDictionary *)objc_alloc_init((Class)NSDictionary);
    systemDefaults = v2->_systemDefaults;
    v2->_systemDefaults = v7;

    v9 = (NSArray *)objc_alloc_init((Class)NSArray);
    segmentIDs = v2->_segmentIDs;
    v2->_segmentIDs = v9;

    v11 = (NSArray *)objc_alloc_init((Class)NSArray);
    segmentSetIDs = v2->_segmentSetIDs;
    v2->_segmentSetIDs = v11;

    v13 = (NSArray *)objc_alloc_init((Class)NSArray);
    treatmentIDs = v2->_treatmentIDs;
    v2->_treatmentIDs = v13;

    v15 = objc_alloc((Class)NSUserDefaults);
    v16 = (NSUserDefaults *)objc_msgSend(v15, "initWithSuiteName:", BUBooksGroupContainerIdentifier);
    userDefaults = v2->_userDefaults;
    v2->_userDefaults = v16;

  }
  return v2;
}

- (NSDictionary)systemDefaults
{
  BRCNamespaceData *v2;
  NSDictionary *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_systemDefaults;
  objc_sync_exit(v2);

  return v3;
}

- (void)setSystemDefaults:(id)a3
{
  BRCNamespaceData *v4;
  uint64_t v5;
  NSDictionary *systemDefaults;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bu_dictionaryByRecursivelyRemovingNSNulls"));
  systemDefaults = v4->_systemDefaults;
  v4->_systemDefaults = (NSDictionary *)v5;

  objc_sync_exit(v4);
}

- (NSDictionary)configuration
{
  BRCNamespaceData *v2;
  NSDictionary *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_configuration;
  objc_sync_exit(v2);

  return v3;
}

- (void)setConfiguration:(id)a3
{
  BRCNamespaceData *v4;
  uint64_t v5;
  NSDictionary *configuration;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bu_dictionaryByRecursivelyRemovingNSNulls"));
  configuration = v4->_configuration;
  v4->_configuration = (NSDictionary *)v5;

  objc_sync_exit(v4);
}

- (void)settingsWithUserID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  unsigned int v8;
  __CFString *v9;
  NSInteger v10;
  NSInteger v11;
  NSInteger v12;
  __CFString **v13;
  id v14;
  __CFString *v15;
  _BOOL8 v16;
  _BOOL8 v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  unsigned int v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  __CFString *v31;
  id v32;
  _QWORD v33[5];
  __CFString *v34;
  id v35;
  id v36;
  id v37;
  id v38;

  v6 = a3;
  v7 = a4;
  v8 = -[NSUserDefaults BOOLForKey:](self->_userDefaults, "BOOLForKey:", CFSTR("BRCEnableMonitoring"));
  v9 = CFSTR("com.apple.news.public");
  if (!v8)
  {
    v14 = 0;
    goto LABEL_10;
  }
  v10 = -[NSUserDefaults integerForKey:](self->_userDefaults, "integerForKey:", CFSTR("BRCConfigSource"));
  v11 = -[NSUserDefaults integerForKey:](self->_userDefaults, "integerForKey:", CFSTR("BRCServerEnv"));
  v12 = v11;
  v32 = v6;
  if (v11 == 2)
  {
    v13 = BRCSettingsBooksContainerIdentifierQA;
  }
  else
  {
    if (v11 != 1)
    {
      v31 = v9;
      goto LABEL_9;
    }
    v13 = BRCSettingsBooksContainerIdentifierStaging;
  }
  v15 = *v13;

  v31 = v15;
LABEL_9:
  v16 = -[NSUserDefaults BOOLForKey:](self->_userDefaults, "BOOLForKey:", CFSTR("BRCDisableABTesting"));
  v17 = -[NSUserDefaults BOOLForKey:](self->_userDefaults, "BOOLForKey:", CFSTR("BRCIgnoreCache"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults stringForKey:](self->_userDefaults, "stringForKey:", CFSTR("BRCOverrideSegmentIDs")));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults stringForKey:](self->_userDefaults, "stringForKey:", CFSTR("BRCAdditionalSegmentIDs")));
  v20 = brc_segmentIDSplit(v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v22 = brc_segmentIDSplit(v19);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  LOBYTE(v30) = 1;
  v14 = objc_msgSend(objc_alloc((Class)RCDebugOverrides), "initWithDisableAbTesting:overrideSegmentSetIDs:additionalSegmentSetIDs:configurationSource:debugEnvironment:ignoreCache:enableExtraLogs:", v16, v21, v23, v10, v12, v17, v30);

  v9 = v31;
  v6 = v32;
LABEL_10:
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[BRCNamespaceData namespaceIdentifier](self, "namespaceIdentifier"));
  v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("BooksDefaults"));

  if (v25)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[BUAccountsProvider sharedProvider](BUAccountsProvider, "sharedProvider"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "currentStorefront"));

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[BRCNamespaceData _storefrontIDFromStorefront:](self, "_storefrontIDFromStorefront:", v27));
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_BBC1C;
    v33[3] = &unk_290708;
    v33[4] = self;
    v34 = v9;
    v35 = v6;
    v36 = v28;
    v37 = v14;
    v38 = v7;
    v29 = v28;
    -[BRCNamespaceData _booksRecordIDFrom:completion:](self, "_booksRecordIDFrom:completion:", v29, v33);

  }
  else
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

- (void)cleanupSubscribers
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BRCNamespaceData subscribers](self, "subscribers"));
  v5 = objc_msgSend(v4, "copy");

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "object", (_QWORD)v14));

        if (!v12)
          objc_msgSend(v3, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BRCNamespaceData subscribers](self, "subscribers"));
  objc_msgSend(v13, "removeObjectsInArray:", v3);

}

- (id)segmentsAsStrings
{
  return -[BRCNamespaceData _IDsToStrings:](self, "_IDsToStrings:", self->_segmentIDs);
}

- (id)segmentSetsAsStrings
{
  return -[BRCNamespaceData _IDsToStrings:](self, "_IDsToStrings:", self->_segmentSetIDs);
}

- (id)treatmentsAsStrings
{
  return -[BRCNamespaceData _IDsToStrings:](self, "_IDsToStrings:", self->_treatmentIDs);
}

- (BOOL)isEqual:(id)a3
{
  BRCNamespaceData *v4;
  uint64_t v5;
  NSString *namespaceIdentifier;
  uint64_t v7;
  void *v8;
  NSString *v9;
  void *v10;
  unsigned __int8 v11;
  NSString *bundleID;
  uint64_t v13;
  void *v14;
  NSString *v15;
  void *v16;
  NSDictionary *systemDefaults;
  uint64_t v18;
  void *v19;
  NSDictionary *v20;
  void *v21;
  NSDictionary *configuration;
  uint64_t v23;
  void *v24;
  NSDictionary *v25;
  void *v26;
  NSMutableArray *subscribers;
  uint64_t v28;
  void *v29;
  NSMutableArray *v30;
  void *v31;
  NSArray *treatmentIDs;
  uint64_t v33;
  void *v34;
  NSArray *v35;
  void *v36;
  NSArray *segmentIDs;
  uint64_t v38;
  void *v39;
  NSArray *v40;
  void *v41;
  NSArray *segmentSetIDs;
  NSArray *v44;
  NSArray *v45;
  void *v46;

  v4 = (BRCNamespaceData *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    v5 = objc_opt_class(BRCNamespaceData);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) == 0)
    {
LABEL_30:
      v11 = 0;
      goto LABEL_31;
    }
    namespaceIdentifier = self->_namespaceIdentifier;
    v7 = objc_claimAutoreleasedReturnValue(-[BRCNamespaceData namespaceIdentifier](v4, "namespaceIdentifier"));
    if (namespaceIdentifier == (NSString *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      v9 = self->_namespaceIdentifier;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BRCNamespaceData namespaceIdentifier](v4, "namespaceIdentifier"));
      LODWORD(v9) = -[NSString isEqual:](v9, "isEqual:", v10);

      if (!(_DWORD)v9)
        goto LABEL_30;
    }
    bundleID = self->_bundleID;
    v13 = objc_claimAutoreleasedReturnValue(-[BRCNamespaceData bundleID](v4, "bundleID"));
    if (bundleID == (NSString *)v13)
    {

    }
    else
    {
      v14 = (void *)v13;
      v15 = self->_bundleID;
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[BRCNamespaceData bundleID](v4, "bundleID"));
      LODWORD(v15) = -[NSString isEqual:](v15, "isEqual:", v16);

      if (!(_DWORD)v15)
        goto LABEL_30;
    }
    systemDefaults = self->_systemDefaults;
    v18 = objc_claimAutoreleasedReturnValue(-[BRCNamespaceData systemDefaults](v4, "systemDefaults"));
    if (systemDefaults == (NSDictionary *)v18)
    {

    }
    else
    {
      v19 = (void *)v18;
      v20 = self->_systemDefaults;
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[BRCNamespaceData systemDefaults](v4, "systemDefaults"));
      LODWORD(v20) = -[NSDictionary isEqual:](v20, "isEqual:", v21);

      if (!(_DWORD)v20)
        goto LABEL_30;
    }
    configuration = self->_configuration;
    v23 = objc_claimAutoreleasedReturnValue(-[BRCNamespaceData configuration](v4, "configuration"));
    if (configuration == (NSDictionary *)v23)
    {

    }
    else
    {
      v24 = (void *)v23;
      v25 = self->_configuration;
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[BRCNamespaceData configuration](v4, "configuration"));
      LODWORD(v25) = -[NSDictionary isEqual:](v25, "isEqual:", v26);

      if (!(_DWORD)v25)
        goto LABEL_30;
    }
    subscribers = self->_subscribers;
    v28 = objc_claimAutoreleasedReturnValue(-[BRCNamespaceData subscribers](v4, "subscribers"));
    if (subscribers == (NSMutableArray *)v28)
    {

    }
    else
    {
      v29 = (void *)v28;
      v30 = self->_subscribers;
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[BRCNamespaceData subscribers](v4, "subscribers"));
      LODWORD(v30) = -[NSMutableArray isEqual:](v30, "isEqual:", v31);

      if (!(_DWORD)v30)
        goto LABEL_30;
    }
    treatmentIDs = self->_treatmentIDs;
    v33 = objc_claimAutoreleasedReturnValue(-[BRCNamespaceData treatmentIDs](v4, "treatmentIDs"));
    if (treatmentIDs == (NSArray *)v33)
    {

    }
    else
    {
      v34 = (void *)v33;
      v35 = self->_treatmentIDs;
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[BRCNamespaceData treatmentIDs](v4, "treatmentIDs"));
      LODWORD(v35) = -[NSArray isEqual:](v35, "isEqual:", v36);

      if (!(_DWORD)v35)
        goto LABEL_30;
    }
    segmentIDs = self->_segmentIDs;
    v38 = objc_claimAutoreleasedReturnValue(-[BRCNamespaceData segmentIDs](v4, "segmentIDs"));
    if (segmentIDs == (NSArray *)v38)
    {

    }
    else
    {
      v39 = (void *)v38;
      v40 = self->_segmentIDs;
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[BRCNamespaceData segmentIDs](v4, "segmentIDs"));
      LODWORD(v40) = -[NSArray isEqual:](v40, "isEqual:", v41);

      if (!(_DWORD)v40)
        goto LABEL_30;
    }
    segmentSetIDs = self->_segmentSetIDs;
    v44 = (NSArray *)objc_claimAutoreleasedReturnValue(-[BRCNamespaceData segmentSetIDs](v4, "segmentSetIDs"));
    if (segmentSetIDs == v44)
    {
      v11 = 1;
    }
    else
    {
      v45 = self->_segmentSetIDs;
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[BRCNamespaceData segmentSetIDs](v4, "segmentSetIDs"));
      v11 = -[NSArray isEqual:](v45, "isEqual:", v46);

    }
  }
LABEL_31:

  return v11;
}

- (id)description
{
  id v3;
  objc_class *v4;
  NSString *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v3 = objc_alloc((Class)NSMutableString);
  v4 = (objc_class *)objc_opt_class(self);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %p"), v6, self);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BRCNamespaceData namespaceIdentifier](self, "namespaceIdentifier"));
  objc_msgSend(v7, "appendFormat:", CFSTR(" namespaceIdentifier=%@"), v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BRCNamespaceData bundleID](self, "bundleID"));
  objc_msgSend(v7, "appendFormat:", CFSTR(" bundleID=%@"), v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BRCNamespaceData systemDefaults](self, "systemDefaults"));
  objc_msgSend(v7, "appendFormat:", CFSTR(" systemDefaults=%@"), v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BRCNamespaceData configuration](self, "configuration"));
  objc_msgSend(v7, "appendFormat:", CFSTR(" configuration=%@"), v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BRCNamespaceData subscribers](self, "subscribers"));
  objc_msgSend(v7, "appendFormat:", CFSTR(" subscribers=%@"), v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BRCNamespaceData treatmentIDs](self, "treatmentIDs"));
  objc_msgSend(v7, "appendFormat:", CFSTR(" treatmentIDs=%@"), v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BRCNamespaceData segmentIDs](self, "segmentIDs"));
  objc_msgSend(v7, "appendFormat:", CFSTR(" segmentIDs=%@"), v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BRCNamespaceData segmentSetIDs](self, "segmentSetIDs"));
  objc_msgSend(v7, "appendFormat:", CFSTR(" segmentSetIDs=%@"), v15);

  objc_msgSend(v7, "appendFormat:", CFSTR(">"));
  v16 = objc_msgSend(v7, "copy");

  return v16;
}

- (id)_IDsToStrings:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v3, "count"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v9), "stringValue", (_QWORD)v12));
        objc_msgSend(v4, "addObject:", v10);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (char)_containerIDForContainerIdentifier:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.news.public")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.news.public.staging")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.news.public.qa")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_permanentURLForRecordID:(id)a3 containerIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  unsigned __int8 v15;
  unsigned __int8 v16;
  char v17;
  char v18;

  v18 = 2;
  v17 = 0;
  v6 = a4;
  v7 = a3;
  v16 = objc_msgSend(v7, "length");
  v15 = -[BRCNamespaceData _containerIDForContainerIdentifier:](self, "_containerIDForContainerIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](NSMutableData, "data"));
  objc_msgSend(v8, "appendBytes:length:", &v18, 1);
  objc_msgSend(v8, "appendBytes:length:", &v15, 1);
  objc_msgSend(v8, "appendBytes:length:", &v16, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dataUsingEncoding:", 4));

  objc_msgSend(v8, "appendData:", v9);
  objc_msgSend(v8, "appendBytes:length:", &v17, 1);
  objc_msgSend(v8, "appendBytes:length:", "17", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BRCNamespaceData _URLSafeBase64EncodedStringWithData:options:](self, "_URLSafeBase64EncodedStringWithData:options:", v8, 0));
  v11 = objc_alloc_init((Class)NSURLComponents);
  objc_msgSend(v11, "setScheme:", CFSTR("https"));
  objc_msgSend(v11, "setHost:", CFSTR("c.apple.news"));
  -[BRCNamespaceData _updateAssetURLHostIfNeededWithParameters:containerIdentifier:](self, "_updateAssetURLHostIfNeededWithParameters:containerIdentifier:", v11, v6);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/%@"), v10));
  objc_msgSend(v11, "setPath:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "URL"));
  return v13;
}

- (void)_updateAssetURLHostIfNeededWithParameters:(id)a3 containerIdentifier:(id)a4
{
  id v5;
  id v6;

  v6 = a3;
  v5 = a4;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.news.public.staging")) & 1) != 0
    || objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.news.public.qa")))
  {
    objc_msgSend(v6, "setHost:", CFSTR("cvws-internal.icloud.com"));
  }

}

- (id)_URLSafeBase64EncodedStringWithData:(id)a3 options:(unint64_t)a4
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "base64EncodedStringWithOptions:", a4));
  v5 = objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "replaceOccurrencesOfString:withString:options:range:", CFSTR("+"), CFSTR("-"), 0, 0, objc_msgSend(v5, "length"));
  objc_msgSend(v5, "replaceOccurrencesOfString:withString:options:range:", CFSTR("/"), CFSTR("_"), 0, 0, objc_msgSend(v5, "length"));
  objc_msgSend(v5, "replaceOccurrencesOfString:withString:options:range:", CFSTR("="), &stru_296430, 0, 0, objc_msgSend(v5, "length"));
  v6 = objc_msgSend(v5, "copy");

  return v6;
}

- (id)_storefrontIDFromStorefront:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  int v10;
  id v11;

  v3 = a3;
  if (!v3
    || (v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR(" -,"))), v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsSeparatedByCharactersInSet:", v4)), v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject")), v5, v4, !v6))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[BRCNamespaceData fallbackStorefrontID](BRCNamespaceData, "fallbackStorefrontID"));
    v7 = BRCConfigLog();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v10 = 138412290;
      v11 = v3;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "BRCNamespaceData: _storefrontIDFromStorefront: unable to get storefrontID from %@", (uint8_t *)&v10, 0xCu);
    }

  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BRCNamespaceData namespaceIdentifier](self, "namespaceIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("namespaceIdentifier"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BRCNamespaceData bundleID](self, "bundleID"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("bundleID"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BRCNamespaceData systemDefaults](self, "systemDefaults"));
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("systemDefaults"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BRCNamespaceData configuration](self, "configuration"));
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("configuration"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BRCNamespaceData treatmentIDs](self, "treatmentIDs"));
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("treatmentIDs"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BRCNamespaceData segmentIDs](self, "segmentIDs"));
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("segmentIDs"));

  v11 = (id)objc_claimAutoreleasedReturnValue(-[BRCNamespaceData segmentSetIDs](self, "segmentSetIDs"));
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("segmentSetIDs"));

}

- (BRCNamespaceData)initWithCoder:(id)a3
{
  id v4;
  BRCNamespaceData *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSSet *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSSet *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSSet *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSSet *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSSet *v31;
  void *v32;
  void *v33;

  v4 = a3;
  v5 = -[BRCNamespaceData init](self, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("namespaceIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[BRCNamespaceData setNamespaceIdentifier:](v5, "setNamespaceIdentifier:", v7);

    v8 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("bundleID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[BRCNamespaceData setBundleID:](v5, "setBundleID:", v9);

    v10 = objc_opt_class(NSDictionary);
    v11 = objc_opt_class(NSArray);
    v12 = objc_opt_class(NSString);
    v13 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, v11, v12, objc_opt_class(NSNumber), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("systemDefaults")));
    -[BRCNamespaceData setSystemDefaults:](v5, "setSystemDefaults:", v15);

    v16 = objc_opt_class(NSDictionary);
    v17 = objc_opt_class(NSArray);
    v18 = objc_opt_class(NSString);
    v19 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v16, v17, v18, objc_opt_class(NSNumber), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("configuration")));
    -[BRCNamespaceData setConfiguration:](v5, "setConfiguration:", v21);

    v22 = objc_opt_class(NSArray);
    v23 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v22, objc_opt_class(NSNumber), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("treatmentIDs")));
    -[BRCNamespaceData setTreatmentIDs:](v5, "setTreatmentIDs:", v25);

    v26 = objc_opt_class(NSArray);
    v27 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v26, objc_opt_class(NSNumber), 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v28, CFSTR("segmentIDs")));
    -[BRCNamespaceData setSegmentIDs:](v5, "setSegmentIDs:", v29);

    v30 = objc_opt_class(NSArray);
    v31 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v30, objc_opt_class(NSNumber), 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v32, CFSTR("segmentSetIDs")));
    -[BRCNamespaceData setSegmentSetIDs:](v5, "setSegmentSetIDs:", v33);

  }
  return v5;
}

- (NSString)namespaceIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setNamespaceIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSMutableArray)subscribers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSubscribers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSArray)treatmentIDs
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTreatmentIDs:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (NSArray)segmentIDs
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSegmentIDs:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (NSArray)segmentSetIDs
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSegmentSetIDs:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segmentSetIDs, 0);
  objc_storeStrong((id *)&self->_segmentIDs, 0);
  objc_storeStrong((id *)&self->_treatmentIDs, 0);
  objc_storeStrong((id *)&self->_subscribers, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_namespaceIdentifier, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_systemDefaults, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
}

+ (NSString)fallbackStorefrontID
{
  return (NSString *)String._bridgeToObjectiveC()();
}

- (void)_booksRecordIDFrom:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BRCNamespaceData *v11;

  v6 = _Block_copy(a4);
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;
  v10 = swift_allocObject(&unk_294AD8, 24, 7);
  *(_QWORD *)(v10 + 16) = v6;
  v11 = self;
  BRCNamespaceData._booksRecordID(from:completion:)(v7, v9, (uint64_t)sub_196D54, v10);

  swift_bridgeObjectRelease(v9);
  swift_release(v10);
}

@end
