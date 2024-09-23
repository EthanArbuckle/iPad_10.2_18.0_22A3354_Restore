@implementation PLNotification

- (PLNotification)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLNotification.m"), 124, CFSTR("Do not use this initializer"));

  return 0;
}

- (id)_initWithType:(int64_t)a3
{
  PLNotification *v4;
  PLNotification *v5;
  void *v6;
  uint64_t v7;
  NSDate *date;
  uint64_t v9;
  NSDate *originalDate;
  void *v11;
  uint64_t v12;
  NSDate *expirationDate;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PLNotification;
  v4 = -[PLNotification init](&v15, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_notificationType = a3;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    date = v5->_date;
    v5->_date = (NSDate *)v7;

    v9 = -[NSDate copy](v5->_date, "copy");
    originalDate = v5->_originalDate;
    v5->_originalDate = (NSDate *)v9;

    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 604800.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v12;

  }
  return v5;
}

- (PLNotification)initWithInvitationAlbum:(id)a3
{
  id v4;
  PLNotification *v5;
  void *v6;
  uint64_t v7;
  NSString *senderName;
  NSMutableSet *v9;
  NSMutableSet *senderNames;
  void *v11;
  uint64_t v12;
  NSString *senderEmailAddress;
  void *v14;
  uint64_t v15;
  NSString *albumTitle;
  void *v17;
  uint64_t v18;
  NSString *albumUUID;
  void *v20;
  uint64_t v21;
  NSString *albumCloudGUID;

  v4 = a3;
  v5 = -[PLNotification _initWithType:](self, "_initWithType:", 0);
  if (v5)
  {
    objc_msgSend(v4, "cloudOwnerDisplayNameIncludingEmail:allowsEmail:", 0, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    senderName = v5->_senderName;
    v5->_senderName = (NSString *)v7;

    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    senderNames = v5->_senderNames;
    v5->_senderNames = v9;

    if (v5->_senderName)
      -[NSMutableSet addObject:](v5->_senderNames, "addObject:");
    objc_msgSend(v4, "cloudOwnerEmail");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    senderEmailAddress = v5->_senderEmailAddress;
    v5->_senderEmailAddress = (NSString *)v12;

    objc_msgSend(v4, "localizedTitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "copy");
    albumTitle = v5->_albumTitle;
    v5->_albumTitle = (NSString *)v15;

    objc_msgSend(v4, "uuid");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "copy");
    albumUUID = v5->_albumUUID;
    v5->_albumUUID = (NSString *)v18;

    objc_msgSend(v4, "cloudGUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "copy");
    albumCloudGUID = v5->_albumCloudGUID;
    v5->_albumCloudGUID = (NSString *)v21;

    v5->_offerToReportAsJunk = objc_msgSend(v4, "cloudOwnerIsWhitelisted") ^ 1;
  }

  return v5;
}

- (PLNotification)initWithInvitationRecordStatusChanged:(id)a3
{
  id v4;
  PLNotification *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *senderName;
  NSMutableSet *v10;
  NSMutableSet *senderNames;
  void *v12;
  void *v13;
  uint64_t v14;
  NSString *senderEmailAddress;
  void *v16;
  uint64_t v17;
  NSString *albumTitle;
  void *v19;
  uint64_t v20;
  NSString *albumUUID;
  void *v22;
  void *v23;
  uint64_t v24;
  NSString *albumCloudGUID;

  v4 = a3;
  v5 = -[PLNotification _initWithType:](self, "_initWithType:", 1);
  if (v5)
  {
    objc_msgSend(v4, "album");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "inviteeDisplayNameIncludingEmail:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "copy");
    senderName = v5->_senderName;
    v5->_senderName = (NSString *)v8;

    v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    senderNames = v5->_senderNames;
    v5->_senderNames = v10;

    if (v5->_senderName)
      -[NSMutableSet addObject:](v5->_senderNames, "addObject:");
    objc_msgSend(v4, "inviteeEmails");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "copy");
    senderEmailAddress = v5->_senderEmailAddress;
    v5->_senderEmailAddress = (NSString *)v14;

    objc_msgSend(v6, "localizedTitle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "copy");
    albumTitle = v5->_albumTitle;
    v5->_albumTitle = (NSString *)v17;

    objc_msgSend(v6, "uuid");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "copy");
    albumUUID = v5->_albumUUID;
    v5->_albumUUID = (NSString *)v20;

    objc_msgSend(v4, "invitationState");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_invitationState = objc_msgSend(v22, "intValue");

    objc_msgSend(v6, "cloudGUID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "copy");
    albumCloudGUID = v5->_albumCloudGUID;
    v5->_albumCloudGUID = (NSString *)v24;

  }
  return v5;
}

- (PLNotification)initWithMultipleContributorEnabledForAlbum:(id)a3
{
  id v4;
  PLNotification *v5;
  void *v6;
  uint64_t v7;
  NSString *senderName;
  NSMutableSet *v9;
  NSMutableSet *senderNames;
  void *v11;
  uint64_t v12;
  NSString *senderEmailAddress;
  void *v14;
  uint64_t v15;
  NSString *albumTitle;
  void *v17;
  uint64_t v18;
  NSString *albumUUID;
  void *v20;
  uint64_t v21;
  NSString *albumCloudGUID;

  v4 = a3;
  v5 = -[PLNotification _initWithType:](self, "_initWithType:", 2);
  if (v5)
  {
    objc_msgSend(v4, "cloudOwnerDisplayNameIncludingEmail:allowsEmail:", 0, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    senderName = v5->_senderName;
    v5->_senderName = (NSString *)v7;

    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    senderNames = v5->_senderNames;
    v5->_senderNames = v9;

    if (v5->_senderName)
      -[NSMutableSet addObject:](v5->_senderNames, "addObject:");
    objc_msgSend(v4, "cloudOwnerEmail");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    senderEmailAddress = v5->_senderEmailAddress;
    v5->_senderEmailAddress = (NSString *)v12;

    objc_msgSend(v4, "localizedTitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "copy");
    albumTitle = v5->_albumTitle;
    v5->_albumTitle = (NSString *)v15;

    objc_msgSend(v4, "uuid");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "copy");
    albumUUID = v5->_albumUUID;
    v5->_albumUUID = (NSString *)v18;

    objc_msgSend(v4, "cloudGUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "copy");
    albumCloudGUID = v5->_albumCloudGUID;
    v5->_albumCloudGUID = (NSString *)v21;

  }
  return v5;
}

- (PLNotification)initWithAssetAdded:(id)a3 atIndex:(unint64_t)a4 toAlbum:(id)a5
{
  id v9;
  id v10;
  void *v11;
  PLNotification *v12;
  void *v13;
  uint64_t v14;
  NSString *senderName;
  NSMutableSet *v16;
  NSMutableSet *senderNames;
  void *v18;
  uint64_t v19;
  NSString *senderEmailAddress;
  void *v21;
  uint64_t v22;
  NSString *albumTitle;
  void *v24;
  uint64_t v25;
  NSString *albumUUID;
  void *v27;
  uint64_t v28;
  NSString *albumCloudGUID;
  void *v30;
  uint64_t v31;
  NSString *mainAssetUUID;
  void *v33;
  uint64_t v34;
  NSString *photosBatchID;
  uint64_t v36;
  NSMutableSet *assetUUIDs;
  NSMutableSet *v38;
  NSMutableSet *placeholderAssetUUIDs;
  id *p_placeholderAssetUUIDs;
  NSMutableSet *v41;
  NSMutableSet *lowResThumbAssetUUIDs;
  int v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v49;
  void *v50;

  v9 = a3;
  v10 = a5;
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLNotification.m"), 202, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetAdded"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLNotification.m"), 203, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("album"));

LABEL_3:
  v12 = -[PLNotification _initWithType:](self, "_initWithType:", 3);
  if (!v12)
    goto LABEL_12;
  objc_msgSend(v9, "cloudOwnerFullName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "copy");
  senderName = v12->_senderName;
  v12->_senderName = (NSString *)v14;

  v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  senderNames = v12->_senderNames;
  v12->_senderNames = v16;

  if (v12->_senderName)
    -[NSMutableSet addObject:](v12->_senderNames, "addObject:");
  objc_msgSend(v9, "cloudOwnerEmail");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "copy");
  senderEmailAddress = v12->_senderEmailAddress;
  v12->_senderEmailAddress = (NSString *)v19;

  objc_msgSend(v11, "localizedTitle");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "copy");
  albumTitle = v12->_albumTitle;
  v12->_albumTitle = (NSString *)v22;

  objc_msgSend(v11, "uuid");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "copy");
  albumUUID = v12->_albumUUID;
  v12->_albumUUID = (NSString *)v25;

  objc_msgSend(v11, "cloudGUID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "copy");
  albumCloudGUID = v12->_albumCloudGUID;
  v12->_albumCloudGUID = (NSString *)v28;

  objc_msgSend(v9, "uuid");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "copy");
  mainAssetUUID = v12->_mainAssetUUID;
  v12->_mainAssetUUID = (NSString *)v31;

  objc_msgSend(v9, "cloudBatchID");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "copy");
  photosBatchID = v12->_photosBatchID;
  v12->_photosBatchID = (NSString *)v34;

  v12->_mainAssetIsMine = objc_msgSend(v9, "cloudIsMyAsset");
  v12->_mainAssetIsVideo = objc_msgSend(v9, "isVideo");
  v36 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:", v12->_mainAssetUUID, 0);
  assetUUIDs = v12->_assetUUIDs;
  v12->_assetUUIDs = (NSMutableSet *)v36;

  v12->_assetCount = 1;
  v38 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  p_placeholderAssetUUIDs = (id *)&v12->_placeholderAssetUUIDs;
  placeholderAssetUUIDs = v12->_placeholderAssetUUIDs;
  v12->_placeholderAssetUUIDs = v38;

  v41 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  lowResThumbAssetUUIDs = v12->_lowResThumbAssetUUIDs;
  v12->_lowResThumbAssetUUIDs = v41;

  v43 = objc_msgSend(v9, "cloudPlaceholderKind");
  if (v43 != 2)
  {
    if ((unsigned __int16)v43 != 3)
      goto LABEL_10;
    p_placeholderAssetUUIDs = (id *)&v12->_lowResThumbAssetUUIDs;
  }
  objc_msgSend(*p_placeholderAssetUUIDs, "addObject:", v12->_mainAssetUUID);
LABEL_10:
  v12->_containsBatchFirstKnownAsset = 1;
  if (a4)
  {
    objc_msgSend(v11, "assets");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "objectAtIndex:", a4 - 1);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "cloudBatchID");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "cloudBatchID");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v12->_containsBatchFirstKnownAsset = objc_msgSend(v46, "isEqualToString:", v47) ^ 1;

  }
LABEL_12:

  return v12;
}

- (PLNotification)initWithAssetsAdded:(id)a3 toAlbum:(id)a4
{
  id v7;
  id v8;
  PLNotification *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  NSString *senderName;
  NSMutableSet *v16;
  NSMutableSet *senderNames;
  void *v18;
  uint64_t v19;
  NSString *senderEmailAddress;
  void *v21;
  uint64_t v22;
  NSString *albumTitle;
  void *v24;
  uint64_t v25;
  NSString *albumUUID;
  void *v27;
  uint64_t v28;
  NSString *albumCloudGUID;
  void *v30;
  uint64_t v31;
  NSString *mainAssetUUID;
  void *v33;
  uint64_t v34;
  NSString *photosBatchID;
  NSMutableSet *v36;
  NSMutableSet *assetUUIDs;
  NSMutableSet *v38;
  NSMutableSet *placeholderAssetUUIDs;
  NSMutableSet *v40;
  NSMutableSet *lowResThumbAssetUUIDs;
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[4];
  PLNotification *v47;
  _QWORD v48[4];
  id v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLNotification.m"), 252, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetsAdded"));

  }
  if (objc_msgSend(v7, "count"))
  {
    if (v8)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLNotification.m"), 253, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[assetsAdded count]"));

    if (v8)
      goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLNotification.m"), 254, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("album"));

LABEL_5:
  v9 = -[PLNotification _initWithType:](self, "_initWithType:", 3);
  if (v9)
  {
    v51 = 0;
    v52 = &v51;
    v53 = 0x3032000000;
    v54 = __Block_byref_object_copy__67512;
    v55 = __Block_byref_object_dispose__67513;
    objc_msgSend(v7, "firstObject");
    v56 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "assets");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __46__PLNotification_initWithAssetsAdded_toAlbum___block_invoke;
    v48[3] = &unk_1E366FD70;
    v12 = v7;
    v49 = v12;
    v50 = &v51;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v48);

    objc_msgSend((id)v52[5], "cloudOwnerFullName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "copy");
    senderName = v9->_senderName;
    v9->_senderName = (NSString *)v14;

    v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    senderNames = v9->_senderNames;
    v9->_senderNames = v16;

    if (v9->_senderName)
      -[NSMutableSet addObject:](v9->_senderNames, "addObject:");
    objc_msgSend((id)v52[5], "cloudOwnerEmail");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "copy");
    senderEmailAddress = v9->_senderEmailAddress;
    v9->_senderEmailAddress = (NSString *)v19;

    objc_msgSend(v8, "localizedTitle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "copy");
    albumTitle = v9->_albumTitle;
    v9->_albumTitle = (NSString *)v22;

    objc_msgSend(v8, "uuid");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "copy");
    albumUUID = v9->_albumUUID;
    v9->_albumUUID = (NSString *)v25;

    objc_msgSend(v8, "cloudGUID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "copy");
    albumCloudGUID = v9->_albumCloudGUID;
    v9->_albumCloudGUID = (NSString *)v28;

    objc_msgSend((id)v52[5], "uuid");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "copy");
    mainAssetUUID = v9->_mainAssetUUID;
    v9->_mainAssetUUID = (NSString *)v31;

    objc_msgSend((id)v52[5], "cloudBatchID");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "copy");
    photosBatchID = v9->_photosBatchID;
    v9->_photosBatchID = (NSString *)v34;

    v9->_mainAssetIsMine = objc_msgSend((id)v52[5], "cloudIsMyAsset");
    v9->_mainAssetIsVideo = objc_msgSend((id)v52[5], "isVideo");
    v36 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    assetUUIDs = v9->_assetUUIDs;
    v9->_assetUUIDs = v36;

    v9->_assetCount = objc_msgSend(v12, "count");
    v38 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    placeholderAssetUUIDs = v9->_placeholderAssetUUIDs;
    v9->_placeholderAssetUUIDs = v38;

    v40 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    lowResThumbAssetUUIDs = v9->_lowResThumbAssetUUIDs;
    v9->_lowResThumbAssetUUIDs = v40;

    v46[0] = v11;
    v46[1] = 3221225472;
    v46[2] = __46__PLNotification_initWithAssetsAdded_toAlbum___block_invoke_2;
    v46[3] = &unk_1E36740E0;
    v47 = v9;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v46);

    _Block_object_dispose(&v51, 8);
  }

  return v9;
}

- (id)_initWithPhotosAddedNotification:(id)a3 mergedWithNotification:(id)a4
{
  id v6;
  _QWORD *v7;
  id *v8;
  id *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  id v20;
  id *v21;
  id *v22;

  v6 = a3;
  v7 = a4;
  v8 = -[PLNotification _initWithType:](self, "_initWithType:", 3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong(v8 + 3, *((id *)v6 + 3));
    v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v11 = v9[19];
    v9[19] = v10;

    if (v9[3])
      objc_msgSend(v9[19], "addObject:");
    objc_storeStrong(v9 + 4, *((id *)v6 + 4));
    objc_storeStrong(v9 + 5, *((id *)v6 + 5));
    objc_storeStrong(v9 + 34, *((id *)v6 + 34));
    objc_storeStrong(v9 + 35, *((id *)v6 + 35));
    objc_storeStrong(v9 + 7, *((id *)v6 + 7));
    objc_storeStrong(v9 + 6, *((id *)v6 + 6));
    *((_BYTE *)v9 + 64) = *((_BYTE *)v6 + 64);
    *((_BYTE *)v9 + 65) = *((_BYTE *)v6 + 65);
    *((_BYTE *)v9 + 66) = *((_BYTE *)v6 + 66);
    v12 = (void *)v7[40];
    if (v12)
      objc_storeStrong(v9 + 40, v12);
    v13 = objc_msgSend(*((id *)v6 + 9), "mutableCopy");
    v14 = v9[9];
    v9[9] = (id)v13;

    objc_msgSend(v9[9], "unionSet:", v7[9]);
    v15 = objc_msgSend(v6, "notificationType");
    if (v15 == objc_msgSend(v7, "notificationType"))
      v16 = objc_msgSend(v9[9], "count");
    else
      v16 = *((_QWORD *)v6 + 10);
    v9[10] = (id)v16;
    v17 = objc_msgSend(*((id *)v6 + 11), "mutableCopy");
    v18 = v9[11];
    v9[11] = (id)v17;

    objc_msgSend(v9[11], "unionSet:", v7[11]);
    v19 = objc_msgSend(*((id *)v6 + 12), "mutableCopy");
    v20 = v9[12];
    v9[12] = (id)v19;

    objc_msgSend(v9[12], "unionSet:", v7[12]);
    v21 = (id *)v6;
    if (objc_msgSend(v7, "notificationType") == 4)
    {
      v22 = v7;

      v21 = v22;
    }
    objc_storeStrong(v9 + 14, v21[14]);
    objc_storeStrong(v9 + 15, v21[15]);
    objc_storeStrong(v9 + 16, v21[16]);
    *((_BYTE *)v9 + 144) = *((_BYTE *)v21 + 144);

  }
  return v9;
}

- (id)_initWithPhotosAddedNotification:(id)a3 mergedWithNotificationDictionary:(id)a4
{
  id *v6;
  id v7;
  id *v8;
  id *v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  char *v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  id v19;
  id *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;

  v6 = (id *)a3;
  v7 = a4;
  v8 = -[PLNotification _initWithType:](self, "_initWithType:", 3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong(v8 + 3, v6[3]);
    v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v11 = v9[19];
    v9[19] = v10;

    if (v9[3])
      objc_msgSend(v9[19], "addObject:");
    objc_storeStrong(v9 + 4, v6[4]);
    objc_storeStrong(v9 + 5, v6[5]);
    objc_storeStrong(v9 + 34, v6[34]);
    objc_storeStrong(v9 + 35, v6[35]);
    objc_storeStrong(v9 + 7, v6[7]);
    objc_storeStrong(v9 + 6, v6[6]);
    *((_BYTE *)v9 + 64) = *((_BYTE *)v6 + 64);
    *((_BYTE *)v9 + 65) = *((_BYTE *)v6 + 65);
    *((_BYTE *)v9 + 66) = *((_BYTE *)v6 + 66);
    v12 = objc_msgSend(v6[9], "mutableCopy");
    v13 = v9[9];
    v9[9] = (id)v12;

    v14 = (char *)v6[10];
    objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0D74B40]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v9[10] = &v14[objc_msgSend(v15, "integerValue")];

    v16 = objc_msgSend(v6[11], "mutableCopy");
    v17 = v9[11];
    v9[11] = (id)v16;

    v18 = objc_msgSend(v6[12], "mutableCopy");
    v19 = v9[12];
    v9[12] = (id)v18;

    v20 = v6;
    objc_storeStrong(v9 + 14, v20[14]);
    objc_storeStrong(v9 + 15, v20[15]);
    objc_storeStrong(v9 + 16, v20[16]);
    *((_BYTE *)v9 + 144) = *((_BYTE *)v20 + 144);
    objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0D74BF0]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "integerValue");

    objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0D74B78]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "BOOLValue");

    if (v22 == 4 || v22 == 3 && v24)
    {
      objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0D74B60]);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0D74B70]);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0D74B88]);
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = v9[14];
      v9[14] = v25;
      v29 = v25;

      v30 = v9[15];
      v9[15] = v26;
      v31 = v26;

      v32 = v9[16];
      v9[16] = (id)v27;

      *((_BYTE *)v9 + 144) = v24;
    }

  }
  return v9;
}

- (PLNotification)initWithCommentAdded:(id)a3
{
  id v4;
  PLNotification *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *mainAssetUUID;
  void *v10;
  uint64_t v11;
  NSString *photosBatchID;
  void *v13;
  uint64_t v14;
  NSString *firstCommentGUID;
  void *v16;
  uint64_t v17;
  NSDate *commentDate;
  void *v19;
  uint64_t v20;
  NSString *senderName;
  NSMutableSet *v22;
  NSMutableSet *senderNames;
  void *v24;
  uint64_t v25;
  NSString *senderEmailAddress;
  void *v27;
  void *v28;
  uint64_t v29;
  NSString *albumTitle;
  void *v31;
  uint64_t v32;
  NSString *commentText;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  NSString *albumUUID;
  void *v39;
  void *v40;
  uint64_t v41;
  NSString *albumCloudGUID;
  NSMutableSet *v43;
  NSMutableSet *assetUUIDs;
  NSMutableSet *v45;
  NSMutableSet *placeholderAssetUUIDs;
  id *p_placeholderAssetUUIDs;
  NSMutableSet *v48;
  NSMutableSet *lowResThumbAssetUUIDs;
  int v50;

  v4 = a3;
  v5 = -[PLNotification _initWithType:](self, "_initWithType:", 4);
  if (v5)
  {
    objc_msgSend(v4, "asset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "copy");
    mainAssetUUID = v5->_mainAssetUUID;
    v5->_mainAssetUUID = (NSString *)v8;

    objc_msgSend(v6, "cloudBatchID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    photosBatchID = v5->_photosBatchID;
    v5->_photosBatchID = (NSString *)v11;

    objc_msgSend(v4, "cloudGUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "copy");
    firstCommentGUID = v5->_firstCommentGUID;
    v5->_firstCommentGUID = (NSString *)v14;

    objc_msgSend(v4, "commentDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "copy");
    commentDate = v5->_commentDate;
    v5->_commentDate = (NSDate *)v17;

    objc_msgSend(v4, "commenterDisplayName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "copy");
    senderName = v5->_senderName;
    v5->_senderName = (NSString *)v20;

    v22 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    senderNames = v5->_senderNames;
    v5->_senderNames = v22;

    if (v5->_senderName)
      -[NSMutableSet addObject:](v5->_senderNames, "addObject:");
    objc_msgSend(v4, "commenterEmail");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "copy");
    senderEmailAddress = v5->_senderEmailAddress;
    v5->_senderEmailAddress = (NSString *)v25;

    objc_msgSend(v6, "cloudShareAlbum");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "localizedTitle");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "copy");
    albumTitle = v5->_albumTitle;
    v5->_albumTitle = (NSString *)v29;

    objc_msgSend(v4, "commentText");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "copy");
    commentText = v5->_commentText;
    v5->_commentText = (NSString *)v32;

    v5->_commentCount = 1;
    objc_msgSend(v4, "isCaption");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_commentIsCaption = objc_msgSend(v34, "BOOLValue");

    objc_msgSend(v6, "cloudShareAlbum");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "uuid");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "copy");
    albumUUID = v5->_albumUUID;
    v5->_albumUUID = (NSString *)v37;

    objc_msgSend(v6, "cloudShareAlbum");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "cloudGUID");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "copy");
    albumCloudGUID = v5->_albumCloudGUID;
    v5->_albumCloudGUID = (NSString *)v41;

    v5->_mainAssetIsMine = objc_msgSend(v6, "cloudIsMyAsset");
    v5->_mainAssetIsVideo = objc_msgSend(v6, "isVideo");
    v43 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    assetUUIDs = v5->_assetUUIDs;
    v5->_assetUUIDs = v43;

    v45 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    p_placeholderAssetUUIDs = (id *)&v5->_placeholderAssetUUIDs;
    placeholderAssetUUIDs = v5->_placeholderAssetUUIDs;
    v5->_placeholderAssetUUIDs = v45;

    v48 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    lowResThumbAssetUUIDs = v5->_lowResThumbAssetUUIDs;
    v5->_lowResThumbAssetUUIDs = v48;

    -[NSMutableSet addObject:](v5->_assetUUIDs, "addObject:", v5->_mainAssetUUID);
    v5->_assetCount = 1;
    v50 = objc_msgSend(v6, "cloudPlaceholderKind");
    if (v50 != 2)
    {
      if ((unsigned __int16)v50 != 3)
      {
LABEL_8:

        goto LABEL_9;
      }
      p_placeholderAssetUUIDs = (id *)&v5->_lowResThumbAssetUUIDs;
    }
    objc_msgSend(*p_placeholderAssetUUIDs, "addObject:", v5->_mainAssetUUID);
    goto LABEL_8;
  }
LABEL_9:

  return v5;
}

- (PLNotification)initWithLikeAdded:(id)a3
{
  id v4;
  PLNotification *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *mainAssetUUID;
  void *v10;
  uint64_t v11;
  NSString *photosBatchID;
  void *v13;
  uint64_t v14;
  NSString *firstCommentGUID;
  void *v16;
  uint64_t v17;
  NSDate *commentDate;
  void *v19;
  uint64_t v20;
  NSString *senderName;
  NSMutableSet *v22;
  NSMutableSet *senderNames;
  void *v24;
  uint64_t v25;
  NSString *senderEmailAddress;
  void *v27;
  void *v28;
  uint64_t v29;
  NSString *albumTitle;
  void *v31;
  void *v32;
  uint64_t v33;
  NSString *albumUUID;
  void *v35;
  void *v36;
  uint64_t v37;
  NSString *albumCloudGUID;
  char v39;
  NSMutableSet *v40;
  NSMutableSet *assetUUIDs;
  NSMutableSet *v42;
  NSMutableSet *placeholderAssetUUIDs;
  id *p_placeholderAssetUUIDs;
  NSMutableSet *v45;
  NSMutableSet *lowResThumbAssetUUIDs;
  int v47;

  v4 = a3;
  v5 = -[PLNotification _initWithType:](self, "_initWithType:", 5);
  if (v5)
  {
    objc_msgSend(v4, "asset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "copy");
    mainAssetUUID = v5->_mainAssetUUID;
    v5->_mainAssetUUID = (NSString *)v8;

    objc_msgSend(v6, "cloudBatchID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    photosBatchID = v5->_photosBatchID;
    v5->_photosBatchID = (NSString *)v11;

    objc_msgSend(v4, "cloudGUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "copy");
    firstCommentGUID = v5->_firstCommentGUID;
    v5->_firstCommentGUID = (NSString *)v14;

    objc_msgSend(v4, "commentDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "copy");
    commentDate = v5->_commentDate;
    v5->_commentDate = (NSDate *)v17;

    objc_msgSend(v4, "commenterDisplayName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "copy");
    senderName = v5->_senderName;
    v5->_senderName = (NSString *)v20;

    v22 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    senderNames = v5->_senderNames;
    v5->_senderNames = v22;

    if (v5->_senderName)
      -[NSMutableSet addObject:](v5->_senderNames, "addObject:");
    objc_msgSend(v4, "commenterEmail");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "copy");
    senderEmailAddress = v5->_senderEmailAddress;
    v5->_senderEmailAddress = (NSString *)v25;

    objc_msgSend(v6, "cloudShareAlbum");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "localizedTitle");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "copy");
    albumTitle = v5->_albumTitle;
    v5->_albumTitle = (NSString *)v29;

    v5->_commentCount = 1;
    objc_msgSend(v6, "cloudShareAlbum");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "uuid");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "copy");
    albumUUID = v5->_albumUUID;
    v5->_albumUUID = (NSString *)v33;

    objc_msgSend(v6, "cloudShareAlbum");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "cloudGUID");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "copy");
    albumCloudGUID = v5->_albumCloudGUID;
    v5->_albumCloudGUID = (NSString *)v37;

    v39 = objc_msgSend(v6, "cloudIsMyAsset");
    v5->_mainAssetIsMine = v39;
    v5->_allMultipleAssetIsMine = v39;
    v5->_mainAssetIsVideo = objc_msgSend(v6, "isVideo");
    v40 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    assetUUIDs = v5->_assetUUIDs;
    v5->_assetUUIDs = v40;

    v42 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    p_placeholderAssetUUIDs = (id *)&v5->_placeholderAssetUUIDs;
    placeholderAssetUUIDs = v5->_placeholderAssetUUIDs;
    v5->_placeholderAssetUUIDs = v42;

    v45 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    lowResThumbAssetUUIDs = v5->_lowResThumbAssetUUIDs;
    v5->_lowResThumbAssetUUIDs = v45;

    -[NSMutableSet addObject:](v5->_assetUUIDs, "addObject:", v5->_mainAssetUUID);
    v5->_assetCount = 1;
    v47 = objc_msgSend(v6, "cloudPlaceholderKind");
    if (v47 != 2)
    {
      if ((unsigned __int16)v47 != 3)
      {
LABEL_8:

        goto LABEL_9;
      }
      p_placeholderAssetUUIDs = (id *)&v5->_lowResThumbAssetUUIDs;
    }
    objc_msgSend(*p_placeholderAssetUUIDs, "addObject:", v5->_mainAssetUUID);
    goto LABEL_8;
  }
LABEL_9:

  return v5;
}

- (id)_initWithCommentsCount:(int64_t)a3 commentDate:(id)a4 firstCommentGUID:(id)a5 toAssetWithUUID:(id)a6 photosBatchID:(id)a7 mainAssetIsMine:(BOOL)a8 mainAssetIsVideo:(BOOL)a9 inAlbumWithTitle:(id)a10 albumUUID:(id)a11 albumCloudGUID:(id)a12 assetUUIDs:(id)a13 placeholderAssetUUIDs:(id)a14 lowResThumbAssetUUIDs:(id)a15
{
  id v19;
  id v20;
  id v21;
  id *v22;
  id *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;

  v38 = a4;
  v36 = a5;
  v34 = a6;
  v33 = a7;
  v37 = a10;
  v35 = a11;
  v19 = a12;
  v20 = a13;
  v21 = a14;
  v32 = a15;
  v22 = -[PLNotification _initWithType:](self, "_initWithType:", 4);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong(v22 + 7, a6);
    objc_storeStrong(v23 + 6, a7);
    *((_BYTE *)v23 + 64) = a8;
    *((_BYTE *)v23 + 65) = a9;
    objc_storeStrong(v23 + 14, a5);
    objc_storeStrong(v23 + 15, a4);
    objc_storeStrong(v23 + 5, a10);
    v24 = v23[16];
    v23[16] = 0;
    v23[17] = (id)a3;

    v25 = v23[3];
    v23[3] = 0;

    v26 = v23[19];
    v23[19] = 0;

    v27 = v23[4];
    v23[4] = 0;

    objc_storeStrong(v23 + 9, a13);
    v23[10] = (id)objc_msgSend(v20, "count");
    objc_storeStrong(v23 + 34, a11);
    objc_storeStrong(v23 + 35, a12);
    objc_storeStrong(v23 + 11, a14);
    objc_storeStrong(v23 + 12, a15);
  }

  return v23;
}

- (id)_initWithLikesCount:(int64_t)a3 commentDate:(id)a4 firstCommentGUID:(id)a5 toAssetWithUUID:(id)a6 photosBatchID:(id)a7 mainAssetIsMine:(BOOL)a8 mainAssetIsVideo:(BOOL)a9 inAlbumWithTitle:(id)a10 albumUUID:(id)a11 albumCloudGUID:(id)a12 assetUUIDs:(id)a13 placeholderAssetUUIDs:(id)a14 lowResThumbAssetUUIDs:(id)a15 senderNames:(id)a16 forMultipleAsset:(BOOL)a17 allMultipleAssetIsMine:(BOOL)a18 isMixedType:(BOOL)a19
{
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id *v28;
  id *v29;
  id v30;
  id v31;
  id obj;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;

  v43 = a4;
  obj = a5;
  v22 = a5;
  v23 = a7;
  v41 = v22;
  v40 = a6;
  v39 = a7;
  v44 = a10;
  v42 = a11;
  v38 = a12;
  v24 = a13;
  v25 = a14;
  v26 = a15;
  v27 = a16;
  v28 = -[PLNotification _initWithType:](self, "_initWithType:", 5);
  v29 = v28;
  if (v28)
  {
    objc_storeStrong(v28 + 7, a6);
    objc_storeStrong(v29 + 6, v23);
    *((_BYTE *)v29 + 64) = a8;
    *((_BYTE *)v29 + 65) = a9;
    objc_storeStrong(v29 + 14, obj);
    objc_storeStrong(v29 + 15, a4);
    objc_storeStrong(v29 + 5, a10);
    v29[17] = (id)a3;
    v30 = v29[3];
    v29[3] = 0;

    objc_storeStrong(v29 + 19, a16);
    v31 = v29[4];
    v29[4] = 0;

    objc_storeStrong(v29 + 9, a13);
    v29[10] = (id)objc_msgSend(v24, "count");
    objc_storeStrong(v29 + 34, a11);
    objc_storeStrong(v29 + 35, a12);
    objc_storeStrong(v29 + 11, a14);
    objc_storeStrong(v29 + 12, a15);
    *((_BYTE *)v29 + 160) = a17;
    *((_BYTE *)v29 + 161) = a18;
    *((_BYTE *)v29 + 162) = a19;
  }

  return v29;
}

- (PLNotification)initWithInterestingMemoryNotificationWithMemoryUUID:(id)a3 keyAssetUUID:(id)a4 notificationTitle:(id)a5 notificationSubtitle:(id)a6 photoLibraryURLString:(id)a7
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id *v19;
  PLNotification *v20;
  uint64_t v21;
  NSString *mainAssetUUID;
  uint64_t v23;
  NSString *notificationTitle;
  uint64_t v25;
  NSString *notificationSubtitle;
  uint64_t v27;
  NSString *photoLibraryURLString;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  if (v14)
  {
    if (v16)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLNotification.m"), 563, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("memoryUUID"));

    if (v16)
    {
LABEL_3:
      if (v17)
        goto LABEL_4;
LABEL_12:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLNotification.m"), 565, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("notificationSubtitle"));

      if (v18)
        goto LABEL_5;
      goto LABEL_13;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLNotification.m"), 564, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("notificationTitle"));

  if (!v17)
    goto LABEL_12;
LABEL_4:
  if (v18)
    goto LABEL_5;
LABEL_13:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLNotification.m"), 566, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibraryURLString"));

LABEL_5:
  v19 = -[PLNotification _initWithType:](self, "_initWithType:", 6);
  v20 = (PLNotification *)v19;
  if (v19)
  {
    objc_storeStrong(v19 + 21, a3);
    if (v15)
    {
      v21 = objc_msgSend(v15, "copy");
      mainAssetUUID = v20->_mainAssetUUID;
      v20->_mainAssetUUID = (NSString *)v21;

      -[NSMutableSet addObject:](v20->_lowResThumbAssetUUIDs, "addObject:", v20->_mainAssetUUID);
    }
    v23 = objc_msgSend(v16, "copy");
    notificationTitle = v20->_notificationTitle;
    v20->_notificationTitle = (NSString *)v23;

    v25 = objc_msgSend(v17, "copy");
    notificationSubtitle = v20->_notificationSubtitle;
    v20->_notificationSubtitle = (NSString *)v25;

    v27 = objc_msgSend(v18, "copy");
    photoLibraryURLString = v20->_photoLibraryURLString;
    v20->_photoLibraryURLString = (NSString *)v27;

  }
  return v20;
}

- (id)initCMMInvitationWithMomentShare:(id)a3
{
  id v5;
  _QWORD *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v17;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLNotification.m"), 583, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("momentShare"));

  }
  v6 = -[PLNotification _initWithType:](self, "_initWithType:", 8);
  if (v6)
  {
    objc_msgSend(v5, "shareURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "absoluteString");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v6[2];
    v6[2] = v8;

    objc_msgSend(v5, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    v12 = (void *)v6[24];
    v6[24] = v11;

    objc_msgSend(v5, "owner");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "emailAddress");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v6[4];
    v6[4] = v14;

  }
  return v6;
}

- (id)initCMMInvitationReadyToViewWithMomentShare:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v22;
  void *v23;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLNotification.m"), 596, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("momentShare"));

  }
  objc_msgSend(v5, "previewData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D113E0]), "initWithData:", v6);
  objc_msgSend(v7, "previewImageDatas");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLNotification.m"), 600, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("thumbnailImageData"));

  }
  objc_msgSend(v5, "owner");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "nameComponents");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0CB3858]);
    objc_msgSend(v12, "setStyle:", 1);
    objc_msgSend(v12, "stringFromPersonNameComponents:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }
  v14 = -[PLNotification _initWithType:](self, "_initWithType:", 10);
  if (v14)
  {
    objc_msgSend(v5, "shareURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "absoluteString");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)*((_QWORD *)v14 + 2);
    *((_QWORD *)v14 + 2) = v16;

    objc_msgSend(v5, "uuid");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "copy");
    v20 = (void *)*((_QWORD *)v14 + 24);
    *((_QWORD *)v14 + 24) = v19;

    objc_storeStrong((id *)v14 + 40, v9);
    objc_storeStrong((id *)v14 + 26, v13);
  }

  return v14;
}

- (PLNotification)initWithExpiringMomentShares:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  PLNotification *v8;
  void *v9;
  NSArray *v10;
  NSArray *momentShareUUIDs;
  NSArray *v12;
  void *v13;
  uint64_t v14;
  NSString *destinationURLString;
  void *v16;
  uint64_t v17;
  NSString *keyMomentShareUUID;
  uint64_t v19;
  NSData *thumbnailImageData;
  void *v22;
  void *v23;
  _QWORD v24[4];
  NSArray *v25;

  v5 = a3;
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLNotification.m"), 622, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("firstMomentShare"));

  }
  objc_msgSend(v6, "thumbnailImageData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLNotification.m"), 623, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("firstMomentShare.thumbnailImageData"));

  }
  v8 = -[PLNotification _initWithType:](self, "_initWithType:", 9);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __47__PLNotification_initWithExpiringMomentShares___block_invoke;
    v24[3] = &unk_1E366FD98;
    v10 = v9;
    v25 = v10;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v24);
    momentShareUUIDs = v8->_momentShareUUIDs;
    v8->_momentShareUUIDs = v10;
    v12 = v10;

    objc_msgSend(v6, "shareURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "absoluteString");
    v14 = objc_claimAutoreleasedReturnValue();
    destinationURLString = v8->_destinationURLString;
    v8->_destinationURLString = (NSString *)v14;

    objc_msgSend(v6, "uuid");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "copy");
    keyMomentShareUUID = v8->_keyMomentShareUUID;
    v8->_keyMomentShareUUID = (NSString *)v17;

    objc_msgSend(v6, "thumbnailImageData");
    v19 = objc_claimAutoreleasedReturnValue();
    thumbnailImageData = v8->_thumbnailImageData;
    v8->_thumbnailImageData = (NSData *)v19;

  }
  return v8;
}

- (PLNotification)initWithExpiringMomentShareUUIDs:(id)a3 thumbnailImageData:(id)a4 notificationTitle:(id)a5 notificationSubtitle:(id)a6
{
  id v12;
  id v13;
  id v14;
  id v15;
  id *v16;
  PLNotification *v17;
  void *v18;
  uint64_t v19;
  NSString *keyMomentShareUUID;
  uint64_t v21;
  NSString *notificationTitle;
  uint64_t v23;
  NSString *notificationSubtitle;
  void *v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (!objc_msgSend(v12, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLNotification.m"), 644, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("UUIDs.count"));

  }
  v16 = -[PLNotification _initWithType:](self, "_initWithType:", 9);
  v17 = (PLNotification *)v16;
  if (v16)
  {
    objc_storeStrong(v16 + 25, a3);
    objc_msgSend(v12, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "copy");
    keyMomentShareUUID = v17->_keyMomentShareUUID;
    v17->_keyMomentShareUUID = (NSString *)v19;

    objc_storeStrong((id *)&v17->_thumbnailImageData, a4);
    v21 = objc_msgSend(v14, "copy");
    notificationTitle = v17->_notificationTitle;
    v17->_notificationTitle = (NSString *)v21;

    v23 = objc_msgSend(v15, "copy");
    notificationSubtitle = v17->_notificationSubtitle;
    v17->_notificationSubtitle = (NSString *)v23;

  }
  return v17;
}

- (id)initForPhotosChallengeSubmission
{
  return -[PLNotification _initWithType:](self, "_initWithType:", 11);
}

- (id)initForPhotosChallengeNewQuestions
{
  return -[PLNotification _initWithType:](self, "_initWithType:", 15);
}

- (id)initForSharedLibrarySuggestions
{
  return -[PLNotification _initWithType:](self, "_initWithType:", 12);
}

- (id)initForSharedLibraryScopeAcceptWithLibraryScopeIdentifier:(id)a3 participantName:(id)a4
{
  id v7;
  id v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v16;
  void *v17;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLNotification.m"), 676, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scopeIdentifier"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLNotification.m"), 677, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("participantName"));

LABEL_3:
  v10 = -[PLNotification _initWithType:](self, "_initWithType:", 13);
  if (v10)
  {
    v11 = objc_msgSend(v7, "copy");
    v12 = (void *)v10[27];
    v10[27] = v11;

    v13 = objc_msgSend(v9, "copy");
    v14 = (void *)v10[28];
    v10[28] = v13;

  }
  return v10;
}

- (id)initForSharedLibraryParticipantAssetTrashNotificationWithTrashedPhotoCount:(unint64_t)a3 videoCount:(unint64_t)a4 itemCount:(unint64_t)a5
{
  id result;

  result = -[PLNotification _initWithType:](self, "_initWithType:", 14);
  if (result)
  {
    *((_QWORD *)result + 29) = a3;
    *((_QWORD *)result + 30) = a4;
    *((_QWORD *)result + 31) = a5;
  }
  return result;
}

- (id)initForSharedLibraryExitInitatedByOwnerWithType:(signed __int16)a3 retentionPolicy:(int64_t)a4 ownerName:(id)a5
{
  unsigned int v6;
  id v8;
  PLNotification *v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;

  v6 = a3;
  v8 = a5;
  if (v6 >= 2)
  {
    v10 = -[PLNotification _initWithType:](self, "_initWithType:", 16);
    v11 = v10;
    if (v10)
    {
      *((_WORD *)v10 + 128) = v6;
      v10[33] = a4;
      v12 = objc_msgSend(v8, "copy");
      v13 = (void *)v11[28];
      v11[28] = v12;

    }
    self = v11;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)canMergeWithPersistedNotifications
{
  int64_t notificationType;

  notificationType = self->_notificationType;
  return notificationType == 4 && !self->_commentIsCaption || ((notificationType - 3) & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (id)notificationByMergingWithNotification:(id)a3
{
  PLNotification *v4;
  PLNotification *v5;
  uint64_t v6;
  int64_t notificationType;
  _BOOL4 v8;
  PLNotification *v9;
  PLNotification *v10;
  PLNotification *v11;
  BOOL v12;
  PLNotification *v13;
  int64_t commentCount;
  NSDate *originalDate;
  NSDate *v16;
  void *v17;
  void *v18;
  PLNotification *v19;
  id v20;
  NSDate *v21;
  NSDate *v22;
  void *v23;
  _BOOL8 v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  int64_t v31;
  void *v32;
  BOOL isMixedType;
  int64_t v34;
  BOOL v35;
  int64_t v36;
  PLNotification *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  PLNotification *v41;
  _BOOL8 v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  int64_t v46;
  void *v47;
  void *v48;
  void *v49;

  v4 = (PLNotification *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_26;
  v6 = -[PLNotification notificationType](v4, "notificationType");
  notificationType = self->_notificationType;
  if (notificationType != 3
    || (v8 = -[NSString isEqualToString:](self->_albumUUID, "isEqualToString:", v5->_albumUUID),
        notificationType = self->_notificationType,
        !v8))
  {
    v12 = v6 == notificationType && (notificationType & 0xFFFFFFFFFFFFFFFELL) == 4;
    if (!v12
      || !-[NSString isEqualToString:](self->_albumUUID, "isEqualToString:", v5->_albumUUID)
      || self->_commentIsCaption
      || v5->_commentIsCaption)
    {
      goto LABEL_26;
    }
    v13 = self;
    -[NSDate earlierDate:](v13->_commentDate, "earlierDate:", v5->_commentDate);
    v11 = (PLNotification *)objc_claimAutoreleasedReturnValue();
    v9 = v13;
    if (-[PLNotification isEqualToDate:](v11, "isEqualToDate:", v5->_commentDate))
    {
      v9 = v5;

    }
    commentCount = v13->_commentCount;
    originalDate = v13->_originalDate;
    v16 = v5->_originalDate;
    v46 = v5->_commentCount;
    if (originalDate)
    {
      -[NSDate earlierDate:](originalDate, "earlierDate:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v17, "copy");

    }
    else
    {
      v18 = (void *)-[NSDate copy](v16, "copy");
    }
    v26 = (void *)-[NSMutableSet mutableCopy](v13->_assetUUIDs, "mutableCopy");
    objc_msgSend(v26, "unionSet:", v5->_assetUUIDs);
    v27 = (void *)-[NSMutableSet mutableCopy](v13->_placeholderAssetUUIDs, "mutableCopy");
    objc_msgSend(v27, "unionSet:", v5->_placeholderAssetUUIDs);
    v47 = (void *)-[NSMutableSet mutableCopy](v13->_lowResThumbAssetUUIDs, "mutableCopy");
    objc_msgSend(v47, "unionSet:", v5->_lowResThumbAssetUUIDs);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (v13->_senderNames)
      objc_msgSend(v28, "unionSet:");
    if (v5->_senderNames)
      objc_msgSend(v29, "unionSet:");
    v48 = v26;
    v49 = v29;
    if (v13->_forMultipleAsset || v5->_forMultipleAsset)
      v30 = 1;
    else
      v30 = !-[NSString isEqualToString:](v13->_mainAssetUUID, "isEqualToString:", v5->_mainAssetUUID);
    v31 = commentCount;
    if (v13->_isMixedType)
    {
      v32 = v27;
      isMixedType = 1;
    }
    else
    {
      v32 = v27;
      isMixedType = v5->_isMixedType;
      if (!v5->_isMixedType && ((v30 ^ 1) & 1) == 0)
        isMixedType = v13->_mainAssetIsVideo != v5->_mainAssetIsVideo;
    }
    v34 = v46 + v31;
    v35 = v13->_allMultipleAssetIsMine && v5->_allMultipleAssetIsMine;
    v36 = self->_notificationType;
    if (v36 == 5)
    {
      v41 = [PLNotification alloc];
      BYTE2(v45) = isMixedType;
      BYTE1(v45) = v35;
      LOBYTE(v45) = v30;
      v39 = v47;
      v38 = v48;
      LOBYTE(v44) = v9->_mainAssetIsVideo;
      v40 = -[PLNotification _initWithLikesCount:commentDate:firstCommentGUID:toAssetWithUUID:photosBatchID:mainAssetIsMine:mainAssetIsVideo:inAlbumWithTitle:albumUUID:albumCloudGUID:assetUUIDs:placeholderAssetUUIDs:lowResThumbAssetUUIDs:senderNames:forMultipleAsset:allMultipleAssetIsMine:isMixedType:](v41, "_initWithLikesCount:commentDate:firstCommentGUID:toAssetWithUUID:photosBatchID:mainAssetIsMine:mainAssetIsVideo:inAlbumWithTitle:albumUUID:albumCloudGUID:assetUUIDs:placeholderAssetUUIDs:lowResThumbAssetUUIDs:senderNames:forMultipleAsset:allMultipleAssetIsMine:isMixedType:", v34, v9->_commentDate, v9->_firstCommentGUID, v9->_mainAssetUUID, v9->_photosBatchID, v9->_mainAssetIsMine, v44, v9->_albumTitle, v9->_albumUUID, v9->_albumCloudGUID, v48, v32, v47, v49, v45);
    }
    else
    {
      if (v36 != 4)
      {
        v20 = 0;
        v39 = v47;
        v38 = v48;
        goto LABEL_56;
      }
      v37 = [PLNotification alloc];
      v39 = v47;
      v38 = v48;
      LOBYTE(v44) = v9->_mainAssetIsVideo;
      v40 = -[PLNotification _initWithCommentsCount:commentDate:firstCommentGUID:toAssetWithUUID:photosBatchID:mainAssetIsMine:mainAssetIsVideo:inAlbumWithTitle:albumUUID:albumCloudGUID:assetUUIDs:placeholderAssetUUIDs:lowResThumbAssetUUIDs:](v37, "_initWithCommentsCount:commentDate:firstCommentGUID:toAssetWithUUID:photosBatchID:mainAssetIsMine:mainAssetIsVideo:inAlbumWithTitle:albumUUID:albumCloudGUID:assetUUIDs:placeholderAssetUUIDs:lowResThumbAssetUUIDs:", v34, v9->_commentDate, v9->_firstCommentGUID, v9->_mainAssetUUID, v9->_photosBatchID, v9->_mainAssetIsMine, v44, v9->_albumTitle, v9->_albumUUID, v9->_albumCloudGUID, v48, v32, v47);
    }
    v20 = (id)v40;
LABEL_56:
    objc_msgSend(v20, "setOriginalDate:", v18);
    v42 = v9->_suppressAlert || v5->_suppressAlert;
    objc_msgSend(v20, "setSuppressAlert:", v42);
    -[PLNotification thumbnailImageData](v5, "thumbnailImageData");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setThumbnailImageData:", v43);

    goto LABEL_33;
  }
  if (v6 == notificationType)
  {
    v9 = self;
    v10 = v5;
    v11 = v10;
    if (v6 == 4 || !v10->_containsBatchFirstKnownAsset)
    {
LABEL_24:
      v20 = -[PLNotification _initWithPhotosAddedNotification:mergedWithNotification:]([PLNotification alloc], "_initWithPhotosAddedNotification:mergedWithNotification:", v9, v11);
      v21 = v9->_originalDate;
      v22 = v11->_originalDate;
      if (v21)
      {
        -[NSDate earlierDate:](v21, "earlierDate:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setOriginalDate:", v23);

      }
      else
      {
        objc_msgSend(v20, "setOriginalDate:", v22);
      }
      v25 = v9->_suppressAlert || v11->_suppressAlert;
      objc_msgSend(v20, "setSuppressAlert:", v25);
      -[PLNotification thumbnailImageData](v5, "thumbnailImageData");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setThumbnailImageData:", v18);
LABEL_33:

      goto LABEL_27;
    }

LABEL_23:
    v19 = v11;
    v11 = v9;
    v9 = v19;
    goto LABEL_24;
  }
  if (v6 == 4 && v5->_commentIsCaption)
  {
    v11 = self;
    v9 = v5;
    goto LABEL_23;
  }
LABEL_26:
  v20 = 0;
LABEL_27:

  return v20;
}

- (id)notificationByMergingWithNotificationDictionary:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  double v9;
  void *v10;
  int64_t notificationType;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSString *v19;
  NSString *v20;
  void *v21;
  int64_t commentCount;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  char v31;
  NSString *mainAssetUUID;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  int v37;
  _BOOL4 mainAssetIsVideo;
  void *v39;
  char v40;
  uint64_t v41;
  void *v42;
  BOOL v43;
  void *v44;
  int64_t v45;
  PLNotification *v46;
  uint64_t v47;
  PLNotification *v48;
  void *v49;
  unsigned int v50;
  uint64_t v51;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int64_t v56;
  void *v57;
  void *v58;
  int v59;
  void *v60;
  void *v61;
  NSString *v62;
  void *v63;
  void *v64;
  void *v65;

  v4 = a3;
  -[PLNotification originalDate](self, "originalDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D74C00];
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D74C00]);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (!v5 || !v7 || (objc_msgSend(v5, "timeIntervalSinceDate:", v7), v9 <= 14400.0))
  {
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D74BF0]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    notificationType = objc_msgSend(v10, "integerValue");

    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D74B30]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D74C38]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_notificationType != notificationType)
      goto LABEL_17;
    if (notificationType == 3)
    {
      if (-[NSString isEqualToString:](self->_albumUUID, "isEqualToString:", v12))
      {
        v14 = -[PLNotification _initWithPhotosAddedNotification:mergedWithNotificationDictionary:]([PLNotification alloc], "_initWithPhotosAddedNotification:mergedWithNotificationDictionary:", self, v4);
        objc_msgSend(v14, "thumbnailImageData");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15 && v13)
          objc_msgSend(v14, "setThumbnailImageData:", v13);
        objc_msgSend(v4, "objectForKey:", v6);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setOriginalDate:", v16);
        goto LABEL_59;
      }
      notificationType = self->_notificationType;
    }
    if ((notificationType & 0xFFFFFFFFFFFFFFFELL) != 4
      || !-[NSString isEqualToString:](self->_albumUUID, "isEqualToString:", v12))
    {
LABEL_17:
      v14 = 0;
LABEL_60:

      goto LABEL_61;
    }
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D74B70]);
    v17 = objc_claimAutoreleasedReturnValue();
    -[NSDate earlierDate:](self->_commentDate, "earlierDate:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "isEqualToDate:", v17))
    {
      objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D74B60]);
      v19 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = self->_firstCommentGUID;
    }
    v20 = v19;
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D74B68]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v21;
    if (v21)
      v55 = objc_msgSend(v21, "integerValue");
    else
      v55 = 0;
    v62 = v20;
    v63 = v18;
    commentCount = self->_commentCount;
    v65 = (void *)-[NSMutableSet mutableCopy](self->_assetUUIDs, "mutableCopy");
    v61 = (void *)-[NSMutableSet mutableCopy](self->_placeholderAssetUUIDs, "mutableCopy");
    v60 = (void *)-[NSMutableSet mutableCopy](self->_lowResThumbAssetUUIDs, "mutableCopy");
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (self->_senderNames)
      objc_msgSend(v23, "unionSet:");
    v64 = v24;
    v25 = *MEMORY[0x1E0D74C20];
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D74C20]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_msgSend(v4, "objectForKey:", v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "addObjectsFromArray:", v27);

    }
    v28 = *MEMORY[0x1E0D74BB8];
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D74BB8]);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      objc_msgSend(v4, "objectForKey:", v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "BOOLValue");

    }
    else
    {
      v31 = 0;
    }
    v59 = 1;
    if (!self->_forMultipleAsset && (v31 & 1) == 0)
    {
      mainAssetUUID = self->_mainAssetUUID;
      objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D74B58]);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = !-[NSString isEqualToString:](mainAssetUUID, "isEqualToString:", v33);

    }
    v34 = *MEMORY[0x1E0D74BD8];
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D74BD8]);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      objc_msgSend(v4, "objectForKey:", v34);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "BOOLValue");

    }
    else
    {
      v37 = 0;
    }
    if (self->_isMixedType)
      mainAssetIsVideo = 1;
    else
      mainAssetIsVideo = v37;
    v57 = (void *)v17;
    if (!mainAssetIsVideo && ((v59 ^ 1) & 1) == 0)
      mainAssetIsVideo = self->_mainAssetIsVideo;
    HIDWORD(v54) = mainAssetIsVideo;
    v56 = commentCount + v55;
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D74B48]);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "BOOLValue");

    v41 = *MEMORY[0x1E0D74B38];
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D74B38]);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
      v43 = 1;
    else
      v43 = v40;
    if (v42 && (v40 & 1) == 0)
    {
      objc_msgSend(v4, "objectForKey:", v41);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = v44 != 0;

    }
    v45 = self->_notificationType;
    if (v45 == 5)
    {
      if (!self->_allMultipleAssetIsMine)
        v43 = 0;
      v48 = [PLNotification alloc];
      BYTE2(v54) = BYTE4(v54);
      BYTE1(v54) = v43;
      LOBYTE(v54) = v59;
      LOBYTE(v53) = self->_mainAssetIsVideo;
      v47 = -[PLNotification _initWithLikesCount:commentDate:firstCommentGUID:toAssetWithUUID:photosBatchID:mainAssetIsMine:mainAssetIsVideo:inAlbumWithTitle:albumUUID:albumCloudGUID:assetUUIDs:placeholderAssetUUIDs:lowResThumbAssetUUIDs:senderNames:forMultipleAsset:allMultipleAssetIsMine:isMixedType:](v48, "_initWithLikesCount:commentDate:firstCommentGUID:toAssetWithUUID:photosBatchID:mainAssetIsMine:mainAssetIsVideo:inAlbumWithTitle:albumUUID:albumCloudGUID:assetUUIDs:placeholderAssetUUIDs:lowResThumbAssetUUIDs:senderNames:forMultipleAsset:allMultipleAssetIsMine:isMixedType:", v56, v63, v62, self->_mainAssetUUID, self->_photosBatchID, self->_mainAssetIsMine, v53, self->_albumTitle, self->_albumUUID, self->_albumCloudGUID, v65, v61, v60, v64, v54);
    }
    else
    {
      if (v45 != 4)
      {
        v14 = 0;
        goto LABEL_55;
      }
      v46 = [PLNotification alloc];
      LOBYTE(v53) = self->_mainAssetIsVideo;
      v47 = -[PLNotification _initWithCommentsCount:commentDate:firstCommentGUID:toAssetWithUUID:photosBatchID:mainAssetIsMine:mainAssetIsVideo:inAlbumWithTitle:albumUUID:albumCloudGUID:assetUUIDs:placeholderAssetUUIDs:lowResThumbAssetUUIDs:](v46, "_initWithCommentsCount:commentDate:firstCommentGUID:toAssetWithUUID:photosBatchID:mainAssetIsMine:mainAssetIsVideo:inAlbumWithTitle:albumUUID:albumCloudGUID:assetUUIDs:placeholderAssetUUIDs:lowResThumbAssetUUIDs:", v56, v63, v62, self->_mainAssetUUID, self->_photosBatchID, self->_mainAssetIsMine, v53, self->_albumTitle, self->_albumUUID, self->_albumCloudGUID, v65, v61, v60);
    }
    v14 = (id)v47;
LABEL_55:
    v16 = v57;
    objc_msgSend(v14, "setOriginalDate:", v5);
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D74C30]);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v49, "BOOLValue");

    if (self->_suppressAlert)
      v51 = 1;
    else
      v51 = v50;
    objc_msgSend(v14, "setSuppressAlert:", v51);
    objc_msgSend(v14, "setThumbnailImageData:", v13);

LABEL_59:
    goto LABEL_60;
  }
  v14 = 0;
LABEL_61:

  return v14;
}

- (BOOL)allAssetsAreFullResolution
{
  return !-[NSMutableSet count](self->_placeholderAssetUUIDs, "count")
      && -[NSMutableSet count](self->_lowResThumbAssetUUIDs, "count") == 0;
}

- (BOOL)thumbnailAssetIsPlaceholder
{
  return -[NSMutableSet containsObject:](self->_placeholderAssetUUIDs, "containsObject:", self->_mainAssetUUID);
}

- (double)completionPercentage
{
  int64_t assetCount;
  uint64_t v4;
  uint64_t v5;

  assetCount = self->_assetCount;
  v4 = -[NSMutableSet count](self->_placeholderAssetUUIDs, "count");
  v5 = -[NSMutableSet count](self->_lowResThumbAssetUUIDs, "count");
  if (assetCount)
    return (double)(unint64_t)(v5 + v4) / (double)assetCount;
  else
    return 0.0;
}

- (NSString)title
{
  void *v3;
  NSString *senderName;
  NSString *result;
  int exitType;

  v3 = 0;
  switch(self->_notificationType)
  {
    case 0:
    case 0xBLL:
    case 0xFLL:
      goto LABEL_5;
    case 1:
    case 8:
      senderName = self->_senderName;
      goto LABEL_7;
    case 2:
    case 3:
    case 4:
    case 5:
      senderName = self->_albumTitle;
      goto LABEL_7;
    case 6:
      senderName = self->_notificationTitle;
      goto LABEL_7;
    case 9:
    case 0xALL:
      senderName = self->_notificationTitle;
      if (!senderName)
      {
LABEL_5:
        PLServicesLocalizedFrameworkStringForAssetsd();
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
LABEL_7:
      result = senderName;
      break;
    case 0xCLL:
    case 0xDLL:
    case 0xELL:
      goto LABEL_10;
    case 0x10:
      exitType = self->_exitType;
      if (exitType == 2 || exitType == 3)
      {
LABEL_10:
        PLServicesSharedLibraryLocalizedFrameworkString();
        v3 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
        result = v3;
      }
      else
      {
        result = (NSString *)0;
      }
      break;
    default:
      goto LABEL_11;
  }
  return result;
}

- (NSString)message
{
  __CFString *v2;
  __CFString *senderName;
  __CFString *v5;
  __CFString *albumTitle;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  int invitationState;
  int64_t commentCount;
  uint64_t v13;
  NSString *v14;
  uint64_t v15;
  unint64_t trashedAssetVideoCount;
  unint64_t trashedAssetPhotoCount;
  unint64_t trashedAssetItemCount;
  int exitType;
  _BOOL4 mainAssetIsVideo;
  _BOOL4 v21;
  const __CFString *v22;
  BOOL v23;
  const __CFString *v24;
  __CFString *v25;
  void *v26;
  __CFString *v27;
  __CFString *v28;
  void *v29;
  const __CFString *v30;
  const __CFString *v31;
  void *v33;

  v2 = 0;
  switch(self->_notificationType)
  {
    case 0:
      senderName = (__CFString *)self->_senderName;
      if (!senderName)
        senderName = &stru_1E36789C0;
      v5 = senderName;
      albumTitle = (__CFString *)self->_albumTitle;
      if (!albumTitle)
        albumTitle = &stru_1E36789C0;
      v7 = albumTitle;
      if (!-[__CFString length](v5, "length") || !-[__CFString length](v7, "length"))
        -[__CFString length](v5, "length");
      PLServicesLocalizedFrameworkStringForAssetsd();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      PFLocalizedStringWithValidatedFormat();
      v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_78;
    case 1:
      v8 = (__CFString *)self->_senderName;
      if (!v8)
        v8 = &stru_1E36789C0;
      v5 = v8;
      v9 = (__CFString *)self->_albumTitle;
      if (!v9)
        v9 = &stru_1E36789C0;
      v10 = v9;
      invitationState = self->_invitationState;
      if (invitationState == 2 || invitationState == 4)
      {
        PLServicesLocalizedFrameworkStringForAssetsd();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_57;
      }
      v2 = 0;
      goto LABEL_59;
    case 2:
    case 0xBLL:
    case 0xFLL:
      goto LABEL_52;
    case 3:
      -[NSString length](self->_commentText, "length");
      goto LABEL_17;
    case 4:
      commentCount = self->_commentCount;
      if (commentCount == 1)
      {
        if (self->_commentText)
        {
          PLServicesLocalizedFrameworkStringForAssetsd();
          v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_32:
          PFStringWithValidatedFormat();
          v15 = objc_claimAutoreleasedReturnValue();
LABEL_84:
          v2 = (__CFString *)v15;
LABEL_85:

          return (NSString *)v2;
        }
LABEL_17:
        PLServicesLocalizedFrameworkStringForAssetsd();
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_83;
      }
      if (commentCount >= 1)
        goto LABEL_17;
LABEL_44:
      v2 = 0;
      return (NSString *)v2;
    case 5:
      v13 = -[NSMutableSet count](self->_senderNames, "count");
      if (self->_forMultipleAsset)
      {
        if (v13 == 1)
        {
          PLServicesLocalizedFrameworkStringForAssetsd();
          v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
          -[NSMutableSet anyObject](self->_senderNames, "anyObject");
          v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
          PFLocalizedStringWithValidatedFormat();
          v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_78:

          goto LABEL_85;
        }
        if (self->_allMultipleAssetIsMine)
        {
          if (self->_isMixedType)
          {
            v27 = CFSTR("NEW_LIKES_ADDED_MY_ITEMS");
LABEL_91:
            v28 = v27;
            PLServicesLocalizedFrameworkStringForAssetsd();
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            PFLocalizedStringWithValidatedFormat();
            v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

            goto LABEL_92;
          }
          mainAssetIsVideo = self->_mainAssetIsVideo;
          v31 = CFSTR("NEW_LIKES_ADDED_MY_VIDEOS");
          v30 = CFSTR("NEW_LIKES_ADDED_MY_PHOTOS");
        }
        else
        {
          if (self->_isMixedType)
          {
            v27 = CFSTR("NEW_LIKES_ADDED_NOT_MY_ITEMS");
            goto LABEL_91;
          }
          mainAssetIsVideo = self->_mainAssetIsVideo;
          v31 = CFSTR("NEW_LIKES_ADDED_NOT_MY_VIDEOS");
          v30 = CFSTR("NEW_LIKES_ADDED_NOT_MY_PHOTOS");
        }
      }
      else
      {
        mainAssetIsVideo = self->_mainAssetIsMine;
        v21 = self->_mainAssetIsVideo;
        if (v13 == 1)
        {
          v22 = CFSTR("NEW_LIKE_ADDED_NOT_MY_VIDEO");
          v23 = !v21;
          v24 = CFSTR("NEW_LIKE_ADDED_MY_VIDEO");
          if (v23)
          {
            v22 = CFSTR("NEW_LIKE_ADDED_NOT_MY_PHOTO");
            v24 = CFSTR("NEW_LIKE_ADDED_MY_PHOTO");
          }
          if (self->_mainAssetIsMine)
            v25 = (__CFString *)v24;
          else
            v25 = (__CFString *)v22;
          v5 = v25;
          PLServicesLocalizedFrameworkStringForAssetsd();
          v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
          -[NSMutableSet anyObject](self->_senderNames, "anyObject");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_57:
          PFStringWithValidatedFormat();
          v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_59:
          goto LABEL_85;
        }
        v30 = CFSTR("NEW_LIKES_ADDED_NOT_MY_VIDEO");
        v23 = !v21;
        v31 = CFSTR("NEW_LIKES_ADDED_MY_VIDEO");
        if (v23)
        {
          v30 = CFSTR("NEW_LIKES_ADDED_NOT_MY_PHOTO");
          v31 = CFSTR("NEW_LIKES_ADDED_MY_PHOTO");
        }
      }
      if (mainAssetIsVideo)
        v27 = (__CFString *)v31;
      else
        v27 = (__CFString *)v30;
      goto LABEL_91;
    case 6:
      v14 = self->_notificationSubtitle;
      goto LABEL_77;
    case 8:
      v2 = &stru_1E36789C0;
      return (NSString *)v2;
    case 9:
      v2 = self->_notificationSubtitle;
      if (v2)
        return (NSString *)v2;
      -[NSArray count](self->_momentShareUUIDs, "count");
      PLServicesLocalizedFrameworkStringForAssetsd();
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    case 0xALL:
      if (-[NSString length](self->_momentShareOwnerLocalizedName, "length"))
        goto LABEL_17;
LABEL_52:
      PLServicesLocalizedFrameworkStringForAssetsd();
      v14 = (NSString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_77;
    case 0xCLL:
      goto LABEL_76;
    case 0xDLL:
      if (!self->_participantName)
        goto LABEL_44;
      PLServicesSharedLibraryLocalizedFrameworkString();
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    case 0xELL:
      trashedAssetVideoCount = self->_trashedAssetVideoCount;
      if (trashedAssetVideoCount)
      {
        trashedAssetPhotoCount = self->_trashedAssetPhotoCount;
        trashedAssetItemCount = self->_trashedAssetItemCount;
        if (!(trashedAssetPhotoCount | trashedAssetItemCount))
        {
          if (trashedAssetVideoCount == 1)
            goto LABEL_76;
LABEL_82:
          PLServicesSharedLibraryLocalizedFrameworkString();
          v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_83:
          PFLocalizedStringWithValidatedFormat();
          v15 = objc_claimAutoreleasedReturnValue();
          goto LABEL_84;
        }
      }
      else
      {
        trashedAssetItemCount = self->_trashedAssetItemCount;
        trashedAssetPhotoCount = self->_trashedAssetPhotoCount;
        if (!trashedAssetItemCount)
        {
          if (trashedAssetPhotoCount == 1)
            goto LABEL_76;
          goto LABEL_82;
        }
      }
      if (trashedAssetPhotoCount + trashedAssetItemCount + trashedAssetVideoCount == 1)
      {
LABEL_76:
        PLServicesSharedLibraryLocalizedFrameworkString();
        v14 = (NSString *)objc_claimAutoreleasedReturnValue();
LABEL_77:
        v2 = (__CFString *)v14;
        return (NSString *)v2;
      }
      PLServicesSharedLibraryLocalizedFrameworkString();
      v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
      PFLocalizedStringWithValidatedFormat();
      v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_92:

      return (NSString *)v2;
    case 0x10:
      exitType = self->_exitType;
      if (exitType == 2)
      {
        if (self->_exitRetentionPolicy < 3uLL)
          goto LABEL_61;
      }
      else if (exitType == 3 && self->_exitRetentionPolicy < 3uLL)
      {
LABEL_61:
        PLServicesSharedLibraryLocalizedFrameworkString();
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (v5 && self->_participantName)
          goto LABEL_32;
LABEL_65:
        v2 = 0;
        goto LABEL_85;
      }
      v5 = 0;
      goto LABEL_65;
    default:
      return (NSString *)v2;
  }
}

- (NSString)destinationURLString
{
  NSString *destinationURLString;
  __CFString *v3;
  NSString *result;
  int64_t notificationType;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  int64_t v10;
  uint8_t buf[4];
  int64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  destinationURLString = self->_destinationURLString;
  if (destinationURLString)
  {
    v3 = destinationURLString;
    return (NSString *)v3;
  }
  else
  {
    notificationType = self->_notificationType;
    v3 = CFSTR("photos://cloudfeed?source=notification");
    v7 = CFSTR("photos://cloudfeed?invitationalbumuuid=%@&source=notification");
    v8 = 272;
    switch(notificationType)
    {
      case 0:
        goto LABEL_9;
      case 1:
      case 2:
        return (NSString *)v3;
      case 3:
        v7 = CFSTR("photos://cloudfeed?revealassetuuid=%@&source=notification");
        v8 = 56;
        goto LABEL_9;
      case 4:
      case 5:
        v7 = CFSTR("photos://cloudfeed?revealcommentguid=%@&source=notification");
        v8 = 112;
        goto LABEL_9;
      case 6:
        v7 = CFSTR("photos://memory?uuid=%@&source=notification");
        v8 = 168;
LABEL_9:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v7, *(Class *)((char *)&self->super.isa + v8));
        v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (!v3)
          goto LABEL_10;
        return (NSString *)v3;
      case 11:
        return (NSString *)CFSTR("photos://photoschallengesubmission?source=notification");
      case 12:
        return (NSString *)CFSTR("photos://forYou?type=sharedLibrarySuggestions&source=notification");
      case 14:
        return (NSString *)CFSTR("photos://album?name=recently-deleted");
      case 15:
        return (NSString *)CFSTR("photos://contentmode?id=forYou&source=notification");
      default:
LABEL_10:
        PLSharingGetLog();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v10 = self->_notificationType;
          *(_DWORD *)buf = 134217984;
          v12 = v10;
          _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "Unknown notification type: %ld", buf, 0xCu);
        }

        result = (NSString *)0;
        break;
    }
  }
  return result;
}

- (BOOL)hasThumbnail
{
  int64_t notificationType;

  notificationType = self->_notificationType;
  return (unint64_t)(notificationType - 3) < 3 || notificationType == 6 && self->_mainAssetUUID;
}

- (NSArray)suppressionContexts
{
  void *v3;
  _QWORD *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PLNotification notificationType](self, "notificationType") == 6)
  {
    v4 = (_QWORD *)MEMORY[0x1E0D74850];
LABEL_7:
    objc_msgSend(v3, "addObject:", *v4);
    return (NSArray *)v3;
  }
  if (-[PLNotification notificationType](self, "notificationType") != 10)
  {
    objc_msgSend(v3, "addObject:", *MEMORY[0x1E0D74838]);
    objc_msgSend(v3, "addObject:", *MEMORY[0x1E0D74848]);
    v4 = (_QWORD *)MEMORY[0x1E0D74840];
    goto LABEL_7;
  }
  if (self->_keyMomentShareUUID)
  {
    PLSuppressionContextForMomentShareUUID();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  return (NSArray *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *albumUUID;
  NSString *albumCloudGUID;
  void *v7;
  void *v8;
  void *v9;
  NSDate *date;
  NSDate *originalDate;
  NSDate *expirationDate;
  void *v13;
  void *v14;
  NSString *mainAssetUUID;
  void *v16;
  void *v17;
  NSDate *commentDate;
  NSString *firstCommentGUID;
  _QWORD *v20;
  void *v21;
  void *v22;
  NSString *commentText;
  void *v24;
  void *v25;
  void *v26;
  NSMutableSet *senderNames;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSString *interestingMemoryUUID;
  NSString *notificationTitle;
  NSString *notificationSubtitle;
  NSDate *notificationDeliveryDate;
  void *v37;
  NSDictionary *v38;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_notificationType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, *MEMORY[0x1E0D74BF0]);

  albumUUID = self->_albumUUID;
  if (albumUUID)
    objc_msgSend(v3, "setObject:forKey:", albumUUID, *MEMORY[0x1E0D74B30]);
  albumCloudGUID = self->_albumCloudGUID;
  if (albumCloudGUID)
    objc_msgSend(v3, "setObject:forKey:", albumCloudGUID, *MEMORY[0x1E0D74B28]);
  if (self->_senderEmailAddress)
  {
    v40[0] = self->_senderEmailAddress;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, *MEMORY[0x1E0D74C08]);

  }
  -[PLNotification title](self, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v3, "setObject:forKey:", v8, *MEMORY[0x1E0D74C40]);
  -[PLNotification message](self, "message");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v3, "setObject:forKey:", v9, *MEMORY[0x1E0D74BD0]);
  date = self->_date;
  if (date)
    objc_msgSend(v3, "setObject:forKey:", date, *MEMORY[0x1E0D74B90]);
  originalDate = self->_originalDate;
  if (originalDate)
    objc_msgSend(v3, "setObject:forKey:", originalDate, *MEMORY[0x1E0D74C00]);
  expirationDate = self->_expirationDate;
  if (expirationDate)
    objc_msgSend(v3, "setObject:forKey:", expirationDate, *MEMORY[0x1E0D74BB0]);
  -[PLNotification destinationURLString](self, "destinationURLString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    objc_msgSend(v3, "setObject:forKey:", v13, *MEMORY[0x1E0D74B98]);
  if (-[PLNotification hasThumbnail](self, "hasThumbnail"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, *MEMORY[0x1E0D74BC0]);

  }
  mainAssetUUID = self->_mainAssetUUID;
  if (mainAssetUUID)
    objc_msgSend(v3, "setObject:forKey:", mainAssetUUID, *MEMORY[0x1E0D74B58]);
  if (self->_mainAssetIsMine)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, *MEMORY[0x1E0D74B48]);

  }
  if (self->_mainAssetIsVideo)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, *MEMORY[0x1E0D74B50]);

  }
  commentDate = self->_commentDate;
  if (commentDate)
    objc_msgSend(v3, "setObject:forKey:", commentDate, *MEMORY[0x1E0D74B70]);
  firstCommentGUID = self->_firstCommentGUID;
  if (firstCommentGUID)
    objc_msgSend(v3, "setObject:forKey:", firstCommentGUID, *MEMORY[0x1E0D74B60]);
  if (self->_commentCount)
  {
    v20 = (_QWORD *)MEMORY[0x1E0D74B68];
  }
  else
  {
    if (!self->_assetCount)
      goto LABEL_36;
    v20 = (_QWORD *)MEMORY[0x1E0D74B40];
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v21, *v20);

LABEL_36:
  if (self->_commentIsCaption)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v22, *MEMORY[0x1E0D74B78]);

  }
  commentText = self->_commentText;
  if (commentText)
    objc_msgSend(v3, "setObject:forKey:", commentText, *MEMORY[0x1E0D74B88]);
  -[PLNotification suppressionContexts](self, "suppressionContexts");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
    objc_msgSend(v3, "setObject:forKey:", v24, *MEMORY[0x1E0D74C28]);
  if (-[PLNotification isCommentPiggyBackedOnPhotosAddedNotification](self, "isCommentPiggyBackedOnPhotosAddedNotification"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v25, *MEMORY[0x1E0D74B80]);

  }
  if (self->_suppressAlert)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v26, *MEMORY[0x1E0D74C30]);

  }
  senderNames = self->_senderNames;
  if (senderNames)
  {
    -[NSMutableSet allObjects](senderNames, "allObjects");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v28, *MEMORY[0x1E0D74C20]);

  }
  if (self->_forMultipleAsset)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v29, *MEMORY[0x1E0D74BB8]);

  }
  if (self->_allMultipleAssetIsMine)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v30, *MEMORY[0x1E0D74B38]);

  }
  if (self->_isMixedType)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v31, *MEMORY[0x1E0D74BD8]);

  }
  if (self->_offerToReportAsJunk)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v32, *MEMORY[0x1E0D74BF8]);

  }
  interestingMemoryUUID = self->_interestingMemoryUUID;
  if (interestingMemoryUUID)
    objc_msgSend(v3, "setObject:forKey:", interestingMemoryUUID, *MEMORY[0x1E0D74BC8]);
  notificationTitle = self->_notificationTitle;
  if (notificationTitle)
    objc_msgSend(v3, "setObject:forKey:", notificationTitle, *MEMORY[0x1E0D74BE8]);
  notificationSubtitle = self->_notificationSubtitle;
  if (notificationSubtitle)
    objc_msgSend(v3, "setObject:forKey:", notificationSubtitle, *MEMORY[0x1E0D74BE0]);
  notificationDeliveryDate = self->_notificationDeliveryDate;
  if (notificationDeliveryDate)
    objc_msgSend(v3, "setObject:forKey:", notificationDeliveryDate, *MEMORY[0x1E0D74BA0]);
  if (-[NSData length](self->_thumbnailImageData, "length"))
    objc_msgSend(v3, "setObject:forKey:", self->_thumbnailImageData, *MEMORY[0x1E0D74C38]);
  -[PLNotification requestIdentifier](self, "requestIdentifier");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v37)
    objc_msgSend(v3, "setObject:forKey:", v37, *MEMORY[0x1E0D74C18]);
  v38 = v3;

  return v38;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PLNotification;
  -[PLNotification description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLNotification message](self, "message");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" - \"%@\"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isCommentPiggyBackedOnPhotosAddedNotification
{
  return -[PLNotification notificationType](self, "notificationType") == 3
      && -[NSString length](self->_commentText, "length") != 0;
}

- (NSString)keyObjectUUID
{
  int64_t notificationType;
  __CFString *v4;
  NSString *albumUUID;

  notificationType = self->_notificationType;
  v4 = CFSTR("PhotosChallengeSubmission");
  switch(notificationType)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
      albumUUID = self->_albumUUID;
      goto LABEL_5;
    case 6:
      albumUUID = self->_interestingMemoryUUID;
      goto LABEL_5;
    case 8:
    case 9:
    case 10:
      albumUUID = self->_keyMomentShareUUID;
LABEL_5:
      v4 = albumUUID;
      return (NSString *)v4;
    case 12:
      return (NSString *)CFSTR("SharedLibrarySuggestions");
    case 13:
      return (NSString *)CFSTR("SharedLibraryAccepted");
    case 14:
      return (NSString *)CFSTR("SharedLibraryParticipantAssetTrashNotification");
    case 15:
      return (NSString *)CFSTR("PhotosChallengeNewQuestions");
    case 16:
      return (NSString *)CFSTR("SharedLibraryExitInitatedByOwner");
    default:
      return (NSString *)v4;
  }
}

- (NSString)requestIdentifier
{
  NSString *v3;
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;

  if (self->_notificationType == 3
    && -[NSString length](self->_photosBatchID, "length")
    && self->_commentIsCaption
    && -[NSString length](self->_commentText, "length"))
  {
    v3 = self->_photosBatchID;
  }
  else
  {
    v3 = 0;
  }
  v4 = (void *)objc_opt_class();
  v5 = -[PLNotification notificationType](self, "notificationType");
  -[PLNotification keyObjectUUID](self, "keyObjectUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestIdentifierByNotificationType:keyObjectUUID:photosBatchID:", v5, v6, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (BOOL)assetWithUUID:(id)a3 didChangePlaceholderKindTo:(signed __int16)a4 fromOldKind:(signed __int16)a5
{
  int v5;
  id v7;
  int v8;

  v5 = a4;
  v7 = a3;
  v8 = -[NSMutableSet containsObject:](self->_assetUUIDs, "containsObject:", v7);
  if (v8)
  {
    if ((v5 - 4) < 2 || v5 == 7)
    {
      -[NSMutableSet removeObject:](self->_placeholderAssetUUIDs, "removeObject:", v7);
      -[NSMutableSet removeObject:](self->_lowResThumbAssetUUIDs, "removeObject:", v7);
    }
    else if (v5 == 3)
    {
      -[NSMutableSet removeObject:](self->_placeholderAssetUUIDs, "removeObject:", v7);
      -[NSMutableSet addObject:](self->_lowResThumbAssetUUIDs, "addObject:", v7);
    }
  }

  return v8;
}

- (int64_t)notificationType
{
  return self->_notificationType;
}

- (NSString)albumUUID
{
  return (NSString *)objc_getProperty(self, a2, 272, 1);
}

- (NSString)albumCloudGUID
{
  return (NSString *)objc_getProperty(self, a2, 280, 1);
}

- (NSString)mainAssetUUID
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)senderEmailAddress
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSDate)date
{
  return (NSDate *)objc_getProperty(self, a2, 288, 1);
}

- (NSDate)originalDate
{
  return (NSDate *)objc_getProperty(self, a2, 296, 1);
}

- (void)setOriginalDate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 296);
}

- (NSDate)expirationDate
{
  return (NSDate *)objc_getProperty(self, a2, 304, 1);
}

- (BOOL)suppressAlert
{
  return self->_suppressAlert;
}

- (void)setSuppressAlert:(BOOL)a3
{
  self->_suppressAlert = a3;
}

- (NSDate)notificationDeliveryDate
{
  return (NSDate *)objc_getProperty(self, a2, 312, 1);
}

- (void)setNotificationDeliveryDate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 312);
}

- (NSString)interestingMemoryUUID
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (NSData)thumbnailImageData
{
  return (NSData *)objc_getProperty(self, a2, 320, 1);
}

- (void)setThumbnailImageData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 320);
}

- (BOOL)offerToReportAsJunk
{
  return self->_offerToReportAsJunk;
}

- (NSString)photosBatchID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)commentText
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (NSString)photoLibraryURLString
{
  return (NSString *)objc_getProperty(self, a2, 328, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibraryURLString, 0);
  objc_storeStrong((id *)&self->_thumbnailImageData, 0);
  objc_storeStrong((id *)&self->_notificationDeliveryDate, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_originalDate, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_albumCloudGUID, 0);
  objc_storeStrong((id *)&self->_albumUUID, 0);
  objc_storeStrong((id *)&self->_participantName, 0);
  objc_storeStrong((id *)&self->_scopeIdentifier, 0);
  objc_storeStrong((id *)&self->_momentShareOwnerLocalizedName, 0);
  objc_storeStrong((id *)&self->_momentShareUUIDs, 0);
  objc_storeStrong((id *)&self->_keyMomentShareUUID, 0);
  objc_storeStrong((id *)&self->_notificationSubtitle, 0);
  objc_storeStrong((id *)&self->_notificationTitle, 0);
  objc_storeStrong((id *)&self->_interestingMemoryUUID, 0);
  objc_storeStrong((id *)&self->_senderNames, 0);
  objc_storeStrong((id *)&self->_commentText, 0);
  objc_storeStrong((id *)&self->_commentDate, 0);
  objc_storeStrong((id *)&self->_firstCommentGUID, 0);
  objc_storeStrong((id *)&self->_lowResThumbAssetUUIDs, 0);
  objc_storeStrong((id *)&self->_placeholderAssetUUIDs, 0);
  objc_storeStrong((id *)&self->_assetUUIDs, 0);
  objc_storeStrong((id *)&self->_mainAssetUUID, 0);
  objc_storeStrong((id *)&self->_photosBatchID, 0);
  objc_storeStrong((id *)&self->_albumTitle, 0);
  objc_storeStrong((id *)&self->_senderEmailAddress, 0);
  objc_storeStrong((id *)&self->_senderName, 0);
  objc_storeStrong((id *)&self->_destinationURLString, 0);
}

void __47__PLNotification_initWithExpiringMomentShares___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "uuid");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __46__PLNotification_initWithAssetsAdded_toAlbum___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:"))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

void __46__PLNotification_initWithAssetsAdded_toAlbum___block_invoke_2(uint64_t a1, void *a2)
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v3 = objc_msgSend(v8, "cloudPlaceholderKind");
  if (v3 == 3)
  {
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
    goto LABEL_5;
  }
  if ((unsigned __int16)v3 == 2)
  {
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
LABEL_5:
    objc_msgSend(v8, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  objc_msgSend(v8, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);

}

+ (id)requestIdentifierByNotificationType:(int64_t)a3 keyObjectUUID:(id)a4 photosBatchID:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v13;

  v8 = a5;
  v9 = a4;
  objc_msgSend(a1, "_UNCategoryFromNotificationType:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@_%@"), v10, v9, v8);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), v10, v9, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_UNCategoryFromNotificationType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xF)
    return CFSTR("PLUNCategoryInvitationReceived");
  else
    return off_1E366FDE8[a3 - 1];
}

@end
