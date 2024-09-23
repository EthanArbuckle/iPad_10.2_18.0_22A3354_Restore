@implementation SYContentItem

- (SYContentItem)initWithItemIdentifier:(id)a3 displayTitle:(id)a4 sourceIdentifier:(id)a5 sourceName:(id)a6 itemURL:(id)a7 activityType:(id)a8 activityCanonicalURL:(id)a9 activityTargetContentIdentifier:(id)a10 activityPersistentIdentifier:(id)a11 userActivity:(id)a12
{
  id v17;
  id v18;
  unint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  unint64_t v24;
  void *v25;
  SYContentItem *v26;
  SYContentItem *v27;
  uint64_t v28;
  NSString *displayTitle;
  uint64_t v30;
  NSString *sourceIdentifier;
  uint64_t v32;
  NSString *sourceLastKnownName;
  uint64_t v34;
  NSURL *itemURL;
  uint64_t v36;
  NSURL *activityCanonicalURL;
  uint64_t v38;
  NSString *activityType;
  uint64_t v40;
  NSString *activityTargetContentIdentifier;
  uint64_t v42;
  NSString *activityPersistentIdentifier;
  void *v45;
  void *v46;
  void *v47;
  void *v50;
  id v51;
  id v52;
  objc_super v54;

  v17 = a3;
  v52 = a4;
  v18 = a5;
  v51 = a6;
  v19 = (unint64_t)a7;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  v23 = a11;
  v24 = (unint64_t)a12;
  v50 = v17;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SYContentItem.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("itemID"));

  }
  if (!(v19 | v24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SYContentItem.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("userActivity || itemURL"));

  }
  v25 = v21;
  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SYContentItem.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sourceIdentifier"));

  }
  v54.receiver = self;
  v54.super_class = (Class)SYContentItem;
  v26 = -[SYContentItem init](&v54, sel_init);
  v27 = v26;
  if (v26)
  {
    objc_storeStrong((id *)&v26->_itemIdentifier, a3);
    v28 = objc_msgSend(v52, "copy");
    displayTitle = v27->_displayTitle;
    v27->_displayTitle = (NSString *)v28;

    v30 = objc_msgSend(v18, "copy");
    sourceIdentifier = v27->_sourceIdentifier;
    v27->_sourceIdentifier = (NSString *)v30;

    v32 = objc_msgSend(v51, "copy");
    sourceLastKnownName = v27->_sourceLastKnownName;
    v27->_sourceLastKnownName = (NSString *)v32;

    v34 = objc_msgSend((id)v19, "copy");
    itemURL = v27->_itemURL;
    v27->_itemURL = (NSURL *)v34;

    v36 = objc_msgSend(v25, "copy");
    activityCanonicalURL = v27->_activityCanonicalURL;
    v27->_activityCanonicalURL = (NSURL *)v36;

    v38 = objc_msgSend(v20, "copy");
    activityType = v27->_activityType;
    v27->_activityType = (NSString *)v38;

    v40 = objc_msgSend(v22, "copy");
    activityTargetContentIdentifier = v27->_activityTargetContentIdentifier;
    v27->_activityTargetContentIdentifier = (NSString *)v40;

    v42 = objc_msgSend(v23, "copy");
    activityPersistentIdentifier = v27->_activityPersistentIdentifier;
    v27->_activityPersistentIdentifier = (NSString *)v42;

    objc_storeStrong((id *)&v27->_userActivity, a12);
  }

  return v27;
}

- (SYContentItem)initWithUserActivity:(id)a3 sourceAppID:(id)a4 sourceAppName:(id)a5 identifier:(id)a6
{
  id v11;
  id v12;
  id v13;
  SYContentItem *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  SYContentItem *v24;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  v11 = a3;
  v12 = a4;
  v29 = a5;
  v13 = a6;
  v14 = self;
  v15 = v13;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SYContentItem.m"), 63, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("userActivity"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SYContentItem.m"), 64, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appBundleID"));

LABEL_3:
  v28 = v15;
  if (v15)
  {
    v16 = v15;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  v17 = v16;
  objc_msgSend(v11, "activityType");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "targetContentIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "persistentIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "webpageURL");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "canonicalURL");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "title");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[SYContentItem initWithItemIdentifier:displayTitle:sourceIdentifier:sourceName:itemURL:activityType:activityCanonicalURL:activityTargetContentIdentifier:activityPersistentIdentifier:userActivity:](v14, "initWithItemIdentifier:displayTitle:sourceIdentifier:sourceName:itemURL:activityType:activityCanonicalURL:activityTargetContentIdentifier:activityPersistentIdentifier:userActivity:", v17, v23, v12, v29, v21, v18, v22, v19, v20, v11);

  return v24;
}

- (SYContentItem)initWithDisplayTitle:(id)a3 sourceIdentifier:(id)a4 sourceName:(id)a5 itemURL:(id)a6 identifier:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  SYContentItem *v22;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (v14)
  {
    if (v16)
      goto LABEL_3;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SYContentItem.m"), 81, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("itemURL"));

    if (v17)
      goto LABEL_4;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SYContentItem.m"), 80, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sourceIdentifier"));

  if (!v16)
    goto LABEL_6;
LABEL_3:
  if (!v17)
    goto LABEL_7;
LABEL_4:
  v18 = v17;
LABEL_8:
  v21 = v18;
  v22 = -[SYContentItem initWithItemIdentifier:displayTitle:sourceIdentifier:sourceName:itemURL:activityType:activityCanonicalURL:activityTargetContentIdentifier:activityPersistentIdentifier:userActivity:](self, "initWithItemIdentifier:displayTitle:sourceIdentifier:sourceName:itemURL:activityType:activityCanonicalURL:activityTargetContentIdentifier:activityPersistentIdentifier:userActivity:", v18, v13, v14, v15, v16, 0, 0, 0, 0, 0);

  return v22;
}

- (SYContentItem)initWithUserActivity:(id)a3 sourceAppID:(id)a4
{
  return -[SYContentItem initWithUserActivity:sourceAppID:sourceAppName:identifier:](self, "initWithUserActivity:sourceAppID:sourceAppName:identifier:", a3, a4, 0, 0);
}

- (SYContentItem)initWithUserActivity:(id)a3 sourceAppID:(id)a4 sourceAppName:(id)a5
{
  return -[SYContentItem initWithUserActivity:sourceAppID:sourceAppName:identifier:](self, "initWithUserActivity:sourceAppID:sourceAppName:identifier:", a3, a4, a5, 0);
}

- (SYContentItem)initWithDisplayTitle:(id)a3 sourceIdentifier:(id)a4 sourceName:(id)a5 itemURL:(id)a6
{
  return -[SYContentItem initWithDisplayTitle:sourceIdentifier:sourceName:itemURL:identifier:](self, "initWithDisplayTitle:sourceIdentifier:sourceName:itemURL:identifier:", a3, a4, a5, a6, 0);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  id v18;
  void *v19;
  void *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  objc_super v24;

  -[SYContentItem displayTitle](self, "displayTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    -[SYContentItem displayTitle](self, "displayTitle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("'%@'"), v5);
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v21 = CFSTR("(null)");
  }

  -[SYContentItem itemIdentifier](self, "itemIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "substringWithRange:", 0, 8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v24.receiver = self;
  v24.super_class = (Class)SYContentItem;
  -[SYContentItem description](&v24, sel_description);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYContentItem sourceLastKnownName](self, "sourceLastKnownName");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYContentItem sourceIdentifier](self, "sourceIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYContentItem itemURL](self, "itemURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYContentItem activityCanonicalURL](self, "activityCanonicalURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYContentItem activityType](self, "activityType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYContentItem activityTargetContentIdentifier](self, "activityTargetContentIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYContentItem activityPersistentIdentifier](self, "activityPersistentIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYContentItem userActivity](self, "userActivity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    v14 = CFSTR("Yes");
  else
    v14 = CFSTR("No");
  -[SYContentItem linkPreviewMetadata](self, "linkPreviewMetadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    v16 = CFSTR("Yes");
  else
    v16 = CFSTR("No");
  objc_msgSend(v19, "stringByAppendingFormat:", CFSTR(" itemID: %@…, title: %@, source: %@ (%@), itemURL: %@, canonicalURL: %@, activityType: %@, targetContentID: %@, persistentID: %@, hasUserActivity: %@, hasLinkPreview: %@"), v20, v21, v23, v22, v8, v9, v10, v11, v12, v14, v16);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  return (NSString *)v18;
}

- (NSString)webpageDisplayDomain
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;

  -[SYContentItem itemURL](self, "itemURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_6;
  -[SYContentItem userActivity](self, "userActivity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    if (objc_msgSend(v3, "_lp_isHTTPFamilyURL"))
      goto LABEL_4;
LABEL_6:
    v7 = 0;
    goto LABEL_7;
  }
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB3418]);

  if ((v6 & 1) == 0)
    goto LABEL_6;
LABEL_4:
  objc_msgSend(v3, "_lp_highLevelDomain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return (NSString *)v7;
}

- (void)setLinkPreviewMetadata:(id)a3
{
  -[SYContentItem setLinkPreviewMetadata:loadLevel:](self, "setLinkPreviewMetadata:loadLevel:", a3, 2);
}

- (NSData)linkPreviewMetadata
{
  SYContentItem *v2;
  NSData *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_linkPreviewMetadata;
  objc_sync_exit(v2);

  return v3;
}

- (void)setLinkPreviewMetadata:(id)a3 loadLevel:(int64_t)a4
{
  NSData *v6;
  NSData *linkPreviewMetadata;
  SYContentItem *obj;

  v6 = (NSData *)a3;
  obj = self;
  objc_sync_enter(obj);
  linkPreviewMetadata = obj->_linkPreviewMetadata;
  obj->_linkPreviewMetadata = v6;

  obj->_previewLoadLevel = a4;
  objc_sync_exit(obj);

}

- (void)loadFullPreviewIfNeeded
{
  -[SYContentItem loadFullPreviewIfNeededWithCompletion:](self, "loadFullPreviewIfNeededWithCompletion:", 0);
}

- (void)loadFullPreviewIfNeededWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  _QWORD v6[4];
  void (**v7)(_QWORD);
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD))a3;
  if ((unint64_t)-[SYContentItem previewLoadLevel](self, "previewLoadLevel") > 1)
  {
    if (v4)
      v4[2](v4);
  }
  else
  {
    v8[0] = self;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __55__SYContentItem_loadFullPreviewIfNeededWithCompletion___block_invoke;
    v6[3] = &unk_1E757C1F8;
    v7 = v4;
    +[SYContentItemPreviewManager loadPreviewDataForItems:fullDetail:didFinishLoadingPreviewHandler:](SYContentItemPreviewManager, "loadPreviewDataForItems:fullDetail:didFinishLoadingPreviewHandler:", v5, 1, v6);

  }
}

uint64_t __55__SYContentItem_loadFullPreviewIfNeededWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)representsSameContentAsItem:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;

  v4 = a3;
  -[SYContentItem userActivity](self, "userActivity");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(v4, "userActivity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[SYContentItem userActivity](self, "userActivity");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "userActivity");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = SYEquivalentUserActivities(v8, v9);
LABEL_7:
      LOBYTE(v11) = v10;

      goto LABEL_8;
    }
  }
  -[SYContentItem itemURL](self, "itemURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v4, "itemURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      LOBYTE(v11) = 0;
      goto LABEL_8;
    }
    -[SYContentItem itemURL](self, "itemURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "itemURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = SYEquivalentURLs(v8, v9);
    goto LABEL_7;
  }
LABEL_8:

  return (char)v11;
}

- (BOOL)isEqual:(id)a3
{
  SYContentItem *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (SYContentItem *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[SYContentItem itemIdentifier](v4, "itemIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[SYContentItem itemIdentifier](self, "itemIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[SYContentItem itemIdentifier](self, "itemIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (SYContentItem)initWithData:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  id v9;
  SYPBContentItem *v10;
  SYPBContentItem *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  NSData *v30;
  NSData *linkPreviewMetadata;
  char v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  NSObject *v42;
  void *v44;
  SYContentItem *v45;
  void *v46;
  void *v47;
  id *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD v60[3];

  v60[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SYContentItem.m"), 244, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serializedData"));

  }
  v58 = 0;
  v56 = 0;
  v57 = 0;
  +[SYSerializationSupport itemDataFromArchiveData:majorVersion:minorVersion:error:](SYSerializationSupport, "itemDataFromArchiveData:majorVersion:minorVersion:error:", v7, &v58, &v57, &v56);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v56;
  if (v8)
  {
    v10 = -[SYPBContentItem initWithData:]([SYPBContentItem alloc], "initWithData:", v8);
    if (v10)
    {
      v11 = v10;
      v48 = a4;
      -[SYPBContentItem displayTitle](v10, "displayTitle");
      v12 = objc_claimAutoreleasedReturnValue();
      -[SYPBContentItem sourceIdentifier](v11, "sourceIdentifier");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[SYPBContentItem sourceLastKnownName](v11, "sourceLastKnownName");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[SYPBContentItem itemIdentifierData](v11, "itemIdentifierData");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "length");

      if (v14)
      {
        v15 = (void *)MEMORY[0x1E0CB3710];
        v16 = objc_opt_class();
        -[SYPBContentItem itemIdentifierData](v11, "itemIdentifierData");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = 0;
        objc_msgSend(v15, "unarchivedObjectOfClass:fromData:error:", v16, v17, &v55);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = v55;

      }
      else
      {
        v54 = 0;
        v52 = 0;
      }
      -[SYPBContentItem itemURL](v11, "itemURL");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "length");

      if (v22)
      {
        v23 = (void *)MEMORY[0x1E0C99E98];
        -[SYPBContentItem itemURL](v11, "itemURL");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "URLWithString:", v24);
        v25 = objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v25 = 0;
      }
      -[SYPBContentItem userActivityData](v11, "userActivityData");
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = (void *)v26;
      if (v26)
      {
        v28 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA5920]), "_initWithUserActivityData:", v26);
        objc_msgSend((id)v28, "activityType");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v28, "canonicalURL");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v28, "targetContentIdentifier");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v28, "persistentIdentifier");
        v26 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v28 = 0;
        v29 = 0;
        v49 = 0;
        v50 = 0;
      }
      v46 = (void *)v26;
      v47 = (void *)v12;
      if (v54 && v53 && v25 | v28)
      {
        self = -[SYContentItem initWithItemIdentifier:displayTitle:sourceIdentifier:sourceName:itemURL:activityType:activityCanonicalURL:activityTargetContentIdentifier:activityPersistentIdentifier:userActivity:](self, "initWithItemIdentifier:displayTitle:sourceIdentifier:sourceName:itemURL:activityType:activityCanonicalURL:activityTargetContentIdentifier:activityPersistentIdentifier:userActivity:", v54, v12, v53, v51, v25, v29, v50, v49, v26, v28);
        -[SYPBContentItem linkPreviewMetadata](v11, "linkPreviewMetadata");
        v30 = (NSData *)objc_claimAutoreleasedReturnValue();
        linkPreviewMetadata = self->_linkPreviewMetadata;
        self->_linkPreviewMetadata = v30;

        self->_previewLoadLevel = -[SYPBContentItem previewLoadLevel](v11, "previewLoadLevel");
        v32 = 1;
      }
      else
      {
        v45 = self;
        v33 = v8;
        v34 = v27;
        v35 = v29;
        v36 = v25;
        v37 = v7;
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", CFSTR("Data for serialized item is incomplete or corrupted."), *MEMORY[0x1E0CB2D50]);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v38;
        if (v52)
          objc_msgSend(v38, "setObject:forKeyedSubscript:", v52, *MEMORY[0x1E0CB3388]);
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.synapse"), -121, v39);
        v40 = objc_claimAutoreleasedReturnValue();

        v32 = 0;
        v9 = (id)v40;
        v7 = v37;
        v25 = v36;
        v29 = v35;
        v27 = v34;
        v8 = v33;
        self = v45;
      }

      if ((v32 & 1) != 0)
      {
        v41 = 0;
        a4 = v48;
        if (!v48)
          goto LABEL_30;
        goto LABEL_29;
      }
      a4 = v48;
    }
    else
    {
      v18 = (void *)MEMORY[0x1E0CB35C8];
      v59 = *MEMORY[0x1E0CB2D50];
      v60[0] = CFSTR("Failed to deserialize data for content item.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, &v59, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("com.apple.synapse"), -120, v19);
      v20 = objc_claimAutoreleasedReturnValue();

      v9 = (id)v20;
    }
  }

  v42 = os_log_create("com.apple.synapse", "ContentItemManager");
  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    -[SYContentItem initWithData:error:].cold.1((uint64_t)v9, v42);

  self = 0;
  v41 = v9;
  if (a4)
LABEL_29:
    *a4 = objc_retainAutorelease(v41);
LABEL_30:

  return self;
}

- (id)dataRepresentationWithError:(id *)a3
{
  id v5;
  void *v6;
  void *v7;
  SYPBContentItem *v8;
  void *v9;
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
  id v21;

  -[SYContentItem userActivity](self, "userActivity");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v7 = 0;
    goto LABEL_7;
  }
  -[SYContentItem userActivity](self, "userActivity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(v6, "_createUserActivityDataWithSaving:options:error:", 0, 0, &v21);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v21;

  if (v7)
  {
LABEL_7:
    v11 = (void *)MEMORY[0x1E0CB36F8];
    -[SYContentItem itemIdentifier](self, "itemIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "archivedDataWithRootObject:requiringSecureCoding:error:", v12, 1, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_alloc_init(SYPBContentItem);
    -[SYPBContentItem setItemIdentifierData:](v8, "setItemIdentifierData:", v10);
    -[SYContentItem displayTitle](self, "displayTitle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYPBContentItem setDisplayTitle:](v8, "setDisplayTitle:", v13);

    -[SYContentItem sourceIdentifier](self, "sourceIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYPBContentItem setSourceIdentifier:](v8, "setSourceIdentifier:", v14);

    -[SYContentItem sourceLastKnownName](self, "sourceLastKnownName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYPBContentItem setSourceLastKnownName:](v8, "setSourceLastKnownName:", v15);

    -[SYContentItem itemURL](self, "itemURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "absoluteString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYPBContentItem setItemURL:](v8, "setItemURL:", v17);

    -[SYPBContentItem setUserActivityData:](v8, "setUserActivityData:", v7);
    -[SYContentItem linkPreviewMetadata](self, "linkPreviewMetadata");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYPBContentItem setLinkPreviewMetadata:](v8, "setLinkPreviewMetadata:", v18);

    -[SYPBContentItem setPreviewLoadLevel:](v8, "setPreviewLoadLevel:", -[SYContentItem previewLoadLevel](self, "previewLoadLevel"));
    -[SYPBContentItem data](v8, "data");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[SYSerializationSupport archiveDataFromItemData:](SYSerializationSupport, "archiveDataFromItemData:", v19);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
  v8 = os_log_create("com.apple.synapse", "ContentItemManager");
  if (os_log_type_enabled(&v8->super.super, OS_LOG_TYPE_ERROR))
    -[SYContentItem dataRepresentationWithError:].cold.1(self, (uint64_t)v5, &v8->super.super);
  v7 = 0;
  v9 = 0;
  v10 = v8;
LABEL_8:

  if (a3)
    *a3 = objc_retainAutorelease(v5);

  return v9;
}

- (id)searchableItemLinkingRelatedIdentifier:(id)a3 domainIdentifier:(id)a4
{
  return +[SYItemIndexingManager searchableItemLinkingContentItem:toContainerIdentifier:uniqueIdentifier:relatedIdentifier:domainIdentifier:](SYItemIndexingManager, "searchableItemLinkingContentItem:toContainerIdentifier:uniqueIdentifier:relatedIdentifier:domainIdentifier:", self, a3, 0, a3, a4);
}

- (NSUUID)itemIdentifier
{
  return self->_itemIdentifier;
}

- (NSString)displayTitle
{
  return self->_displayTitle;
}

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (NSString)sourceLastKnownName
{
  return self->_sourceLastKnownName;
}

- (NSUserActivity)userActivity
{
  return self->_userActivity;
}

- (NSURL)itemURL
{
  return self->_itemURL;
}

- (NSString)activityType
{
  return self->_activityType;
}

- (NSURL)activityCanonicalURL
{
  return self->_activityCanonicalURL;
}

- (NSString)activityTargetContentIdentifier
{
  return self->_activityTargetContentIdentifier;
}

- (NSString)activityPersistentIdentifier
{
  return self->_activityPersistentIdentifier;
}

- (int64_t)previewLoadLevel
{
  return self->_previewLoadLevel;
}

- (void)setPreviewLoadLevel:(int64_t)a3
{
  self->_previewLoadLevel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityPersistentIdentifier, 0);
  objc_storeStrong((id *)&self->_activityTargetContentIdentifier, 0);
  objc_storeStrong((id *)&self->_activityCanonicalURL, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
  objc_storeStrong((id *)&self->_itemURL, 0);
  objc_storeStrong((id *)&self->_userActivity, 0);
  objc_storeStrong((id *)&self->_sourceLastKnownName, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
  objc_storeStrong((id *)&self->_displayTitle, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_linkPreviewMetadata, 0);
}

+ (NSArray)readableTypeIdentifiersForItemProvider
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.synapse.item");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  id v7;
  SYContentItem *v8;

  v7 = a3;
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("com.apple.synapse.item")))
    v8 = -[SYContentItem initWithData:error:]([SYContentItem alloc], "initWithData:error:", v7, a5);
  else
    v8 = 0;

  return v8;
}

+ (NSArray)writableTypeIdentifiersForItemProvider
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.synapse.item");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  void (**v6)(id, void *, id);
  void *v7;
  id v8;
  id v10;

  v6 = (void (**)(id, void *, id))a4;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.synapse.item")))
  {
    v10 = 0;
    -[SYContentItem dataRepresentationWithError:](self, "dataRepresentationWithError:", &v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v10;
  }
  else
  {
    v8 = 0;
    v7 = 0;
  }
  v6[2](v6, v7, v8);

  return 0;
}

- (void)initWithData:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1BCC38000, a2, OS_LOG_TYPE_ERROR, "Error initializing content item: %@", (uint8_t *)&v2, 0xCu);
}

- (void)dataRepresentationWithError:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "userActivity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl(&dword_1BCC38000, a3, OS_LOG_TYPE_ERROR, "Failed to serialize data for user activity %@. Error: %@", (uint8_t *)&v6, 0x16u);

}

@end
