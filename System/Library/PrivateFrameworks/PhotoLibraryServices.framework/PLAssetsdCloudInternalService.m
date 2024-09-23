@implementation PLAssetsdCloudInternalService

- (PLAssetsdCloudInternalService)initWithLibraryServicesManager:(id)a3 connectionAuthorization:(id)a4
{
  id v7;
  PLAssetsdCloudInternalService *v8;
  PLAssetsdCloudInternalService *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PLAssetsdCloudInternalService;
  v8 = -[PLAbstractLibraryServicesManagerService initWithLibraryServicesManager:](&v11, sel_initWithLibraryServicesManager_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_connectionAuthorization, a4);

  return v9;
}

- (void)createPhotostreamAlbumWithStreamID:(id)a3
{
  id v4;
  int v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  const char *Name;
  __int128 v10;
  char v11;
  __int128 v12;
  SEL sel[2];
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  *(_OWORD *)sel = 0u;
  v10 = 0u;
  v5 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v10) = v5;
  if (v5)
  {
    *((_QWORD *)&v10 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: createPhotostreamAlbumWithStreamID:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v10 + 1), (os_activity_scope_state_t)((char *)&v12 + 8));
  }
  v6 = -[PLAbstractLibraryServicesManagerService newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", "-[PLAssetsdCloudInternalService createPhotostreamAlbumWithStreamID:]", (_QWORD)v10);
  objc_msgSend(v6, "createPhotoStreamAlbumWithStreamID:", v4);

  if (v11)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v12 + 8));
  if ((_QWORD)v12)
  {
    PLRequestGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if ((unint64_t)(v12 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v15 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v8, OS_SIGNPOST_INTERVAL_END, v12, "########## Syncing with Cloud Photo Library!", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)enablePhotostreamsWithStreamID:(id)a3
{
  char *v4;
  int v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  const char *Name;
  __int128 v13;
  char v14;
  __int128 v15;
  SEL sel[2];
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (char *)a3;
  v15 = 0u;
  *(_OWORD *)sel = 0u;
  v13 = 0u;
  v5 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v13) = v5;
  if (v5)
  {
    *((_QWORD *)&v13 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: enablePhotostreamsWithStreamID:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v13 + 1), (os_activity_scope_state_t)((char *)&v15 + 8));
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", (_QWORD)v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", *MEMORY[0x1E0D74DF8], *MEMORY[0x1E0D74DB8]);
  PLGatekeeperXPCGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v4;
    _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "enqueing job with streamID %@", buf, 0xCu);
  }

  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageWriter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "enqueueJob:", v6);

  if (v14)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v15 + 8));
  if ((_QWORD)v15)
  {
    PLRequestGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if ((unint64_t)(v15 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v18 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v11, OS_SIGNPOST_INTERVAL_END, v15, "########## Syncing with Cloud Photo Library!", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)updateSharedAlbumsCachedServerConfigurationLimits
{
  int v2;
  NSObject *v3;
  NSObject *v4;
  const char *Name;
  __int128 v6;
  char v7;
  __int128 v8;
  SEL sel[2];
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  *(_OWORD *)sel = 0u;
  v6 = 0u;
  v2 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v6) = v2;
  if (v2)
  {
    *((_QWORD *)&v6 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: updateSharedAlbumsCachedServerConfigurationLimits", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v6 + 1), (os_activity_scope_state_t)((char *)&v8 + 8));
  }
  +[PLPhotoSharingHelper updateSharedAlbumsCachedServerConfigurationLimits](PLPhotoSharingHelper, "updateSharedAlbumsCachedServerConfigurationLimits", (_QWORD)v6);
  if (v7)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v8 + 8));
  if ((_QWORD)v8)
  {
    PLRequestGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if ((unint64_t)(v8 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v11 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v4, OS_SIGNPOST_INTERVAL_END, v8, "########## Syncing with Cloud Photo Library!", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)cloudSharingSpaceManagementRequestWithType:(unint64_t)a3 optionalBytesToPurge:(unint64_t)a4 reply:(id)a5
{
  id v8;
  int v9;
  NSObject *v10;
  void *v11;
  int v12;
  int v13;
  const __CFString *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  os_signpost_id_t v24;
  const char *Name;
  _QWORD v26[4];
  id v27;
  _BYTE *v28;
  _QWORD v29[4];
  id v30;
  _BYTE *v31;
  unint64_t v32;
  char v33;
  char v34;
  __int128 v35;
  __int128 v36;
  SEL sel[2];
  _BYTE buf[24];
  unint64_t v39;
  __int16 v40;
  int v41;
  __int16 v42;
  int v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v36 = 0u;
  *(_OWORD *)sel = 0u;
  v35 = 0u;
  v9 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v35) = v9;
  if (v9)
  {
    v10 = _os_activity_create(&dword_199541000, "PLXPC Service: cloudSharingSpaceManagementRequestWithType:optionalBytesToPurge:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v11 = (void *)*((_QWORD *)&v35 + 1);
    *((_QWORD *)&v35 + 1) = v10;

    os_activity_scope_enter(v10, (os_activity_scope_state_t)((char *)&v36 + 8));
  }
  if (a3 == 2)
  {
    v14 = CFSTR("PurgeNonRecentlyViewedAssets");
    v12 = 1;
LABEL_9:
    v13 = 1;
    goto LABEL_11;
  }
  if (a3 == 1)
  {
    v12 = 0;
    v14 = CFSTR("PurgeSpace");
    goto LABEL_9;
  }
  v12 = 0;
  v13 = 0;
  if (a3)
    v14 = 0;
  else
    v14 = CFSTR("GetSpaceAvailable");
LABEL_11:
  PLPhotoSharingGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134219010;
    *(_QWORD *)&buf[4] = a3;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v14;
    *(_WORD *)&buf[22] = 2048;
    v39 = a4;
    v40 = 1024;
    v41 = v13;
    v42 = 1024;
    v43 = v12;
    _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEFAULT, "cloudSharingSpaceManagementRequest jobType %lu %@ bytesToPurge %lld shouldFreeSpace %d shouldKeepRecentlyViewed %d", buf, 0x2Cu);
  }

  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "databaseContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "newShortLivedLibraryWithName:", "-[PLAssetsdCloudInternalService cloudSharingSpaceManagementRequestWithType:optionalBytesToPurge:reply:]");

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v39 = 0;
  v19 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __103__PLAssetsdCloudInternalService_cloudSharingSpaceManagementRequestWithType_optionalBytesToPurge_reply___block_invoke;
  v29[3] = &unk_1E366A810;
  v31 = buf;
  v32 = a4;
  v33 = v13;
  v34 = v12;
  v20 = v18;
  v30 = v20;
  v26[0] = v19;
  v26[1] = 3221225472;
  v26[2] = __103__PLAssetsdCloudInternalService_cloudSharingSpaceManagementRequestWithType_optionalBytesToPurge_reply___block_invoke_2;
  v26[3] = &unk_1E36714A8;
  v21 = v8;
  v27 = v21;
  v28 = buf;
  objc_msgSend(v20, "performTransaction:completionHandler:", v29, v26);

  _Block_object_dispose(buf, 8);
  if ((_BYTE)v35)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v36 + 8));
  if ((_QWORD)v36)
  {
    PLRequestGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    v24 = v36;
    if ((unint64_t)(v36 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      *(_QWORD *)&buf[4] = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v23, OS_SIGNPOST_INTERVAL_END, v24, "########## Syncing with Cloud Photo Library!", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)keyForEmailAddress:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, void *);
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  const char *Name;
  __int128 v19;
  char v20;
  __int128 v21;
  SEL sel[2];
  uint64_t v23;
  const __CFString *v24;
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, void *))a4;
  v21 = 0u;
  *(_OWORD *)sel = 0u;
  v19 = 0u;
  v8 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v19) = v8;
  if (v8)
  {
    *((_QWORD *)&v19 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: keyForEmailAddress:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v19 + 1), (os_activity_scope_state_t)((char *)&v21 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager", (_QWORD)v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "libraryBundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "emailAddressManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "keyForEmailAddress:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = 0;
  }
  else
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v23 = *MEMORY[0x1E0CB2D50];
    v24 = CFSTR("Key not found for email address");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41003, v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v7[2](v7, objc_msgSend(v12, "longLongValue"), v13);

  if (v20)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v21 + 8));
  if ((_QWORD)v21)
  {
    PLRequestGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if ((unint64_t)(v21 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v26 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v17, OS_SIGNPOST_INTERVAL_END, v21, "########## Syncing with Cloud Photo Library!", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)emailAddressForKey:(int64_t)a3 reply:(id)a4
{
  void (**v6)(id, void *, void *);
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  const char *Name;
  __int128 v19;
  char v20;
  __int128 v21;
  SEL sel[2];
  uint64_t v23;
  const __CFString *v24;
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, void *, void *))a4;
  v21 = 0u;
  *(_OWORD *)sel = 0u;
  v19 = 0u;
  v7 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v19) = v7;
  if (v7)
  {
    *((_QWORD *)&v19 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: emailAddressForKey:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v19 + 1), (os_activity_scope_state_t)((char *)&v21 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager", (_QWORD)v19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "libraryBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "emailAddressManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "emailAddressForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = 0;
  }
  else
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v23 = *MEMORY[0x1E0CB2D50];
    v24 = CFSTR("Email address not found for key");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41003, v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v6[2](v6, v12, v13);

  if (v20)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v21 + 8));
  if ((_QWORD)v21)
  {
    PLRequestGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if ((unint64_t)(v21 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v26 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v17, OS_SIGNPOST_INTERVAL_END, v21, "########## Syncing with Cloud Photo Library!", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)personInfoDictionaryForPersonID:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, void *, void *);
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  const char *Name;
  __int128 v20;
  __int128 v21;
  SEL sel[2];
  uint64_t v23;
  void *v24;
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, void *))a4;
  v21 = 0u;
  *(_OWORD *)sel = 0u;
  v20 = 0u;
  v8 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v20) = v8;
  if (v8)
  {
    *((_QWORD *)&v20 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: personInfoDictionaryForPersonID:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v20 + 1), (os_activity_scope_state_t)((char *)&v21 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "libraryBundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "personInfoManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "personInfoForPersonID:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = 0;
  }
  else
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v23 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("person info not found with personID %@"), v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41003, v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v7[2](v7, v12, v13);

  if ((_BYTE)v20)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v21 + 8));
  if ((_QWORD)v21)
  {
    PLRequestGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if ((unint64_t)(v21 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v26 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v18, OS_SIGNPOST_INTERVAL_END, v21, "########## Syncing with Cloud Photo Library!", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)setPersonInfoDictionary:(id)a3 forPersonID:(id)a4
{
  id v6;
  id v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  const char *Name;
  __int128 v15;
  char v16;
  __int128 v17;
  SEL sel[2];
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v17 = 0u;
  *(_OWORD *)sel = 0u;
  v15 = 0u;
  v8 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v15) = v8;
  if (v8)
  {
    *((_QWORD *)&v15 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: setPersonInfoDictionary:forPersonID:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v15 + 1), (os_activity_scope_state_t)((char *)&v17 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager", (_QWORD)v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "libraryBundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "personInfoManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPersonInfo:forPersonID:", v6, v7);

  if (v16)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v17 + 8));
  if ((_QWORD)v17)
  {
    PLRequestGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if ((unint64_t)(v17 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v20 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v13, OS_SIGNPOST_INTERVAL_END, v17, "########## Syncing with Cloud Photo Library!", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)isReadyForCloudPhotoLibraryWithReply:(id)a3
{
  void (**v4)(id, uint64_t);
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  const char *Name;
  __int128 v12;
  char v13;
  __int128 v14;
  SEL sel[2];
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t))a3;
  v14 = 0u;
  *(_OWORD *)sel = 0u;
  v12 = 0u;
  v5 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v12) = v5;
  if (v5)
  {
    *((_QWORD *)&v12 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: isReadyForCloudPhotoLibraryWithReply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v12 + 1), (os_activity_scope_state_t)((char *)&v14 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager", (_QWORD)v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cplReadiness");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isReadyForCloudPhotoLibraryWithStatus:", 0);

  v4[2](v4, v8);
  if (v13)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v14 + 8));
  if ((_QWORD)v14)
  {
    PLRequestGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if ((unint64_t)(v14 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v17 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v10, OS_SIGNPOST_INTERVAL_END, v14, "########## Syncing with Cloud Photo Library!", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)isReadyForAnalysisQuickCheckWithReply:(id)a3
{
  PLAssetsdConnectionAuthorization *connectionAuthorization;
  void (**v5)(id, uint64_t);
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  connectionAuthorization = self->_connectionAuthorization;
  v5 = (void (**)(id, uint64_t))a3;
  if (-[PLAssetsdConnectionAuthorization isQuickCheckReadyForAnalysisClient](connectionAuthorization, "isQuickCheckReadyForAnalysisClient"))
  {
    -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "readyForAnalysis");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, objc_msgSend(v6, "isReadyForAnalysisQuickCheck"));

  }
  else
  {
    PLBackendGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      -[PLAssetsdConnectionAuthorization trustedCallerBundleID](self->_connectionAuthorization, "trustedCallerBundleID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v11 = v8;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_FAULT, "Invalid client for isReadyForAnalysisQuickCheck. Falling back to isReadyForAnalysis for bundle ID: %{public}@", buf, 0xCu);

    }
    -[PLAssetsdCloudInternalService isReadyForAnalysisWithReply:](self, "isReadyForAnalysisWithReply:", v5);

  }
}

- (void)isReadyForAnalysisCPLInitialDownloadCompletedWithReply:(id)a3
{
  void (**v4)(id, _QWORD);
  int v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  const char *Name;
  __int128 v15;
  __int128 v16;
  SEL sel[2];
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  v16 = 0u;
  *(_OWORD *)sel = 0u;
  v15 = 0u;
  v5 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v15) = v5;
  if (v5)
  {
    *((_QWORD *)&v15 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: isReadyForAnalysisCPLInitialDownloadCompletedWithReply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v15 + 1), (os_activity_scope_state_t)((char *)&v16 + 8));
  }
  if (!MEMORY[0x19AEC04BC]())
    goto LABEL_7;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLForKey:", CFSTR("PLInhibitReadyForAnalysis"));

  if ((v7 & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "BOOLForKey:", CFSTR("PLOverrideReadyForAnalysis")),
        v8,
        v9))
  {
    v4[2](v4, v7 ^ 1u);
  }
  else
  {
LABEL_7:
    -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager", v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "readyForAnalysis");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, objc_msgSend(v11, "isReadyForAnalysisInitialDownloadCompleted"));

  }
  if ((_BYTE)v15)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v16 + 8));
  if ((_QWORD)v16)
  {
    PLRequestGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if ((unint64_t)(v16 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v19 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v13, OS_SIGNPOST_INTERVAL_END, v16, "########## Syncing with Cloud Photo Library!", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)isReadyForAnalysisWithReply:(id)a3
{
  void (**v4)(id, _QWORD);
  int v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  const char *Name;
  __int128 v15;
  __int128 v16;
  SEL sel[2];
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  v16 = 0u;
  *(_OWORD *)sel = 0u;
  v15 = 0u;
  v5 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v15) = v5;
  if (v5)
  {
    *((_QWORD *)&v15 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: isReadyForAnalysisWithReply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v15 + 1), (os_activity_scope_state_t)((char *)&v16 + 8));
  }
  if (!MEMORY[0x19AEC04BC]())
    goto LABEL_7;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLForKey:", CFSTR("PLInhibitReadyForAnalysis"));

  if ((v7 & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "BOOLForKey:", CFSTR("PLOverrideReadyForAnalysis")),
        v8,
        v9))
  {
    v4[2](v4, v7 ^ 1u);
  }
  else
  {
LABEL_7:
    -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager", v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "readyForAnalysis");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, objc_msgSend(v11, "isReadyForAnalysis"));

  }
  if ((_BYTE)v15)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v16 + 8));
  if ((_QWORD)v16)
  {
    PLRequestGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if ((unint64_t)(v16 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v19 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v13, OS_SIGNPOST_INTERVAL_END, v16, "########## Syncing with Cloud Photo Library!", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)shouldAutoEnableiCPLOnOSXWithReply:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdCloudInternalService.m"), 222, CFSTR("shouldAutoEnableiCPLOnOSXWithReply is only available on OSX"));

}

- (void)syncCloudPhotoLibrary
{
  int v3;
  void *v4;
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  const char *Name;
  __int128 v12;
  char v13;
  __int128 v14;
  SEL sel[2];
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  *(_OWORD *)sel = 0u;
  v12 = 0u;
  v3 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v12) = v3;
  if (v3)
  {
    *((_QWORD *)&v12 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: syncCloudPhotoLibrary", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v12 + 1), (os_activity_scope_state_t)((char *)&v14 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager", (_QWORD)v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isCloudPhotoLibraryEnabled");

  if (v5)
  {
    PLGatekeeperXPCGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "########## Syncing with Cloud Photo Library!", buf, 2u);
    }

    -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cloudPhotoLibraryManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sync");

  }
  if (v13)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v14 + 8));
  if ((_QWORD)v14)
  {
    PLRequestGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if ((unint64_t)(v14 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v17 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v10, OS_SIGNPOST_INTERVAL_END, v14, "########## Syncing with Cloud Photo Library!", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)setCloudPhotoLibraryEnabledState:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  const char *Name;
  __int128 v12;
  char v13;
  __int128 v14;
  SEL sel[2];
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  *(_OWORD *)sel = 0u;
  v12 = 0u;
  v5 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v12) = v5;
  if (v5)
  {
    *((_QWORD *)&v12 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: setCloudPhotoLibraryEnabledState:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v12 + 1), (os_activity_scope_state_t)((char *)&v14 + 8));
  }
  if (v3)
    PLCPLRecordEnableForCurrentAccount();
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager", (_QWORD)v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setICloudPhotosEnabledInternal:", v3);

  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cplReadiness");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "processCloudPhotosLibraryStateChange:", v3);

  if (v13)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v14 + 8));
  if ((_QWORD)v14)
  {
    PLRequestGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if ((unint64_t)(v14 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v17 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v10, OS_SIGNPOST_INTERVAL_END, v14, "########## Syncing with Cloud Photo Library!", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)setCloudPhotoLibraryPauseState:(BOOL)a3 reason:(signed __int16)a4
{
  int v4;
  _BOOL8 v5;
  int v7;
  __int16 v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  const char *Name;
  __int128 v17;
  __int128 v18;
  SEL sel[2];
  uint8_t buf[4];
  const char *v21;
  uint64_t v22;

  v4 = a4;
  v5 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  *(_OWORD *)sel = 0u;
  v17 = 0u;
  v7 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v17) = v7;
  if (v7)
  {
    *((_QWORD *)&v17 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: setCloudPhotoLibraryPauseState:reason:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v17 + 1), (os_activity_scope_state_t)((char *)&v18 + 8));
  }
  if (v4 >= 4)
    v8 = 4;
  else
    v8 = v4;
  v9 = v8;
  if (v5)
  {
    PLGatekeeperXPCGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    *(_DWORD *)buf = 67109120;
    LODWORD(v21) = v9;
    v11 = "########## Pausing (%hd) cloud photo";
  }
  else
  {
    PLGatekeeperXPCGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    *(_DWORD *)buf = 67109120;
    LODWORD(v21) = v9;
    v11 = "########## Resuming (%hd) cloud photo";
  }
  _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEFAULT, v11, buf, 8u);
LABEL_12:

  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "cplReadiness");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "pauseCloudPhotos:reason:", v5, v9);

  if ((_BYTE)v17)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v18 + 8));
  if ((_QWORD)v18)
  {
    PLRequestGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if ((unint64_t)(v18 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v21 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v15, OS_SIGNPOST_INTERVAL_END, v18, "########## Syncing with Cloud Photo Library!", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)rampingRequestForResourceType:(unint64_t)a3 numRequested:(unint64_t)a4 reply:(id)a5
{
  id v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  const char *Name;
  __int128 v14;
  char v15;
  __int128 v16;
  SEL sel[2];
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  v16 = 0u;
  *(_OWORD *)sel = 0u;
  v14 = 0u;
  v7 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v14) = v7;
  if (v7)
  {
    *((_QWORD *)&v14 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: rampingRequestForResourceType:numRequested:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v14 + 1), (os_activity_scope_state_t)((char *)&v16 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager", (_QWORD)v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isCloudPhotoLibraryEnabled");

  if (v9)
  {
    (*((void (**)(id, uint64_t, _QWORD, _QWORD))v6 + 2))(v6, 1, 0, 0);
  }
  else
  {
    +[PLCloudPhotoLibraryError createErrorWithType:withDebugMessage:](PLCloudPhotoLibraryError, "createErrorWithType:withDebugMessage:", 15, CFSTR("iCloud Photo Library not enabled"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v6 + 2))(v6, 0, 0, v10);

  }
  if (v15)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v16 + 8));
  if ((_QWORD)v16)
  {
    PLRequestGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if ((unint64_t)(v16 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v19 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v12, OS_SIGNPOST_INTERVAL_END, v16, "########## Syncing with Cloud Photo Library!", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)getCurrentTransferProgress:(id)a3
{
  void (**v4)(id, uint64_t, uint64_t, uint64_t, uint64_t);
  int v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  const char *Name;
  __int128 v17;
  char v18;
  __int128 v19;
  SEL sel[2];
  uint8_t buf[16];
  __int128 v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, uint64_t, uint64_t, uint64_t))a3;
  v19 = 0u;
  *(_OWORD *)sel = 0u;
  v17 = 0u;
  v5 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v17) = v5;
  if (v5)
  {
    *((_QWORD *)&v17 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: getCurrentTransferProgress:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v17 + 1), (os_activity_scope_state_t)((char *)&v19 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager", (_QWORD)v17);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isCloudPhotoLibraryEnabled");

  if (v7)
  {
    -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cloudPhotoLibraryManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    *(_OWORD *)buf = 0u;
    v22 = 0u;
    if (v9)
    {
      objc_msgSend(v9, "currentTransferProgress");
      v11 = *(_QWORD *)buf;
      v10 = *(_QWORD *)&buf[8];
      v12 = *((_QWORD *)&v22 + 1);
      v13 = v22;
    }
    else
    {
      v12 = 0;
      v13 = 0;
      v10 = 0;
      v11 = 0;
    }

  }
  else
  {
    v10 = 0;
    v12 = 0;
    v13 = 0;
    v11 = 0;
  }
  v4[2](v4, v11, v10, v13, v12);
  if (v18)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v19 + 8));
  if ((_QWORD)v19)
  {
    PLRequestGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if ((unint64_t)(v19 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      *(_QWORD *)&buf[4] = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v15, OS_SIGNPOST_INTERVAL_END, v19, "########## Syncing with Cloud Photo Library!", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)getNotUploadedCount:(id)a3
{
  void (**v4)(id, unint64_t, unint64_t, unint64_t, id);
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  unint64_t v11;
  id v12;
  unint64_t v13;
  id v14;
  unint64_t v15;
  id v16;
  unint64_t v17;
  id v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  os_signpost_id_t v25;
  const char *Name;
  id v27;
  id v28;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  SEL sel[2];
  uint8_t buf[4];
  const char *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, unint64_t, unint64_t, unint64_t, id))a3;
  v32 = 0u;
  *(_OWORD *)sel = 0u;
  v31 = 0u;
  v5 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v31) = v5;
  if (v5)
  {
    v6 = _os_activity_create(&dword_199541000, "PLXPC Service: getNotUploadedCount:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v7 = (void *)*((_QWORD *)&v31 + 1);
    *((_QWORD *)&v31 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v32 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isCloudPhotoLibraryEnabled");

  if (v9)
  {
    v10 = -[PLAbstractLibraryServicesManagerService newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", "-[PLAssetsdCloudInternalService getNotUploadedCount:]");
    v30 = 0;
    v11 = +[PLManagedAsset countOfNotUploadedAssetsInPhotoLibrary:forAssetType:error:](PLManagedAsset, "countOfNotUploadedAssetsInPhotoLibrary:forAssetType:error:", v10, 0, &v30);
    v12 = v30;
    v29 = v12;
    v13 = +[PLManagedAsset countOfNotUploadedAssetsInPhotoLibrary:forAssetType:error:](PLManagedAsset, "countOfNotUploadedAssetsInPhotoLibrary:forAssetType:error:", v10, 1, &v29);
    v14 = v29;

    v28 = v14;
    v15 = +[PLManagedAsset countOfNotUploadedAssetsInPhotoLibrary:forAssetType:error:](PLManagedAsset, "countOfNotUploadedAssetsInPhotoLibrary:forAssetType:error:", v10, 2, &v28);
    v16 = v28;

    v27 = v16;
    v17 = +[PLManagedAsset countOfNotUploadedAssetsInPhotoLibrary:forAssetType:error:](PLManagedAsset, "countOfNotUploadedAssetsInPhotoLibrary:forAssetType:error:", v10, 3, &v27);
    v18 = v27;

    v19 = 0;
    if (v11 == 0x7FFFFFFFFFFFFFFFLL || v13 == 0x7FFFFFFFFFFFFFFFLL || v15 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v20 = 0;
      v21 = 0;
      v22 = v18;
    }
    else
    {
      v20 = 0;
      v21 = 0;
      v22 = v18;
      if (v17 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v22 = 0;
        v21 = v17 + v15;
        v19 = v11;
        v20 = v13;
      }
    }
    v4[2](v4, v19, v20, v21, v22);

  }
  else
  {
    +[PLCloudPhotoLibraryError createErrorWithType:withDebugMessage:](PLCloudPhotoLibraryError, "createErrorWithType:withDebugMessage:", 15, CFSTR("iCloud Photo Library not enabled"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, 0, 0, v10);
  }

  if ((_BYTE)v31)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v32 + 8));
  if ((_QWORD)v32)
  {
    PLRequestGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v23;
    v25 = v32;
    if ((unint64_t)(v32 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v35 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v24, OS_SIGNPOST_INTERVAL_END, v25, "########## Syncing with Cloud Photo Library!", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)getSystemBudgetsWithReply:(id)a3
{
  id v4;
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  const char *Name;
  _QWORD v18[4];
  id v19;
  __int128 v20;
  __int128 v21;
  SEL sel[2];
  uint8_t buf[4];
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21 = 0u;
  *(_OWORD *)sel = 0u;
  v20 = 0u;
  v5 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v20) = v5;
  if (v5)
  {
    v6 = _os_activity_create(&dword_199541000, "PLXPC Service: getSystemBudgetsWithReply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v7 = (void *)*((_QWORD *)&v20 + 1);
    *((_QWORD *)&v20 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v21 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isCloudPhotoLibraryEnabled");

  if (v9)
  {
    -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cloudPhotoLibraryManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      PLBackendGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "Getting cellular and battery budget", buf, 2u);
      }

      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __59__PLAssetsdCloudInternalService_getSystemBudgetsWithReply___block_invoke;
      v18[3] = &unk_1E3676880;
      v19 = v4;
      objc_msgSend(v11, "getSystemBudgetsWithCompletionHandler:", v18);
      v13 = v19;
    }
    else
    {
      +[PLCloudPhotoLibraryError createErrorWithType:withDebugMessage:](PLCloudPhotoLibraryError, "createErrorWithType:withDebugMessage:", 15, CFSTR("iCloud Photo Library not enabled"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, void *))v4 + 2))(v4, 0, 0, v13);
    }

  }
  else
  {
    +[PLCloudPhotoLibraryError createErrorWithType:withDebugMessage:](PLCloudPhotoLibraryError, "createErrorWithType:withDebugMessage:", 15, CFSTR("iCloud Photo Library not enabled"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v4 + 2))(v4, 0, 0, v11);
  }

  if ((_BYTE)v20)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v21 + 8));
  if ((_QWORD)v21)
  {
    PLRequestGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v16 = v21;
    if ((unint64_t)(v21 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v24 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v15, OS_SIGNPOST_INTERVAL_END, v16, "########## Syncing with Cloud Photo Library!", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)overrideSystemBudgetsForSyncSession:(BOOL)a3 pauseReason:(id)a4 systemBudgets:(unint64_t)a5 reply:(id)a6
{
  _BOOL8 v8;
  id v10;
  void (**v11)(id, uint64_t, void *);
  int v12;
  void *v13;
  int v14;
  NSObject *v15;
  const char *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  const char *Name;
  __int128 v24;
  char v25;
  __int128 v26;
  SEL sel[2];
  uint8_t buf[4];
  const char *v29;
  uint64_t v30;

  v8 = a3;
  v30 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = (void (**)(id, uint64_t, void *))a6;
  v26 = 0u;
  *(_OWORD *)sel = 0u;
  v24 = 0u;
  v12 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v24) = v12;
  if (v12)
  {
    *((_QWORD *)&v24 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: overrideSystemBudgetsForSyncSession:pauseReason:systemBudgets:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v24 + 1), (os_activity_scope_state_t)((char *)&v26 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager", (_QWORD)v24);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isCloudPhotoLibraryEnabled");

  if (!v14)
  {
    +[PLCloudPhotoLibraryError createErrorWithType:withDebugMessage:](PLCloudPhotoLibraryError, "createErrorWithType:withDebugMessage:", 15, CFSTR("iCloud Photo Library not enabled"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    goto LABEL_12;
  }
  if (v8)
  {
    PLBackendGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v16 = "Starting override cellular and battery budget";
LABEL_10:
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEFAULT, v16, buf, 2u);
    }
  }
  else
  {
    PLBackendGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v16 = "Stopping override cellular and battery budget";
      goto LABEL_10;
    }
  }

  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "cloudPhotoLibraryManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_msgSend(v20, "overrideSystemBudgetsForSyncSession:pauseReason:forSystemBudgets:", v8, v10, a5);
  v17 = 0;
LABEL_12:
  v11[2](v11, v18, v17);

  if (v25)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v26 + 8));
  if ((_QWORD)v26)
  {
    PLRequestGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v29 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v22, OS_SIGNPOST_INTERVAL_END, v26, "########## Syncing with Cloud Photo Library!", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)publishShareWithUUID:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  int v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  const char *Name;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  SEL sel[2];
  uint8_t buf[4];
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v24 = 0u;
  *(_OWORD *)sel = 0u;
  v23 = 0u;
  v8 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v23) = v8;
  if (v8)
  {
    v9 = _os_activity_create(&dword_199541000, "PLXPC Service: publishShareWithUUID:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v10 = (void *)*((_QWORD *)&v23 + 1);
    *((_QWORD *)&v23 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v24 + 8));
  }
  v11 = -[PLAbstractLibraryServicesManagerService newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", "-[PLAssetsdCloudInternalService publishShareWithUUID:reply:]");
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __60__PLAssetsdCloudInternalService_publishShareWithUUID_reply___block_invoke;
  v19[3] = &unk_1E3676290;
  v12 = v6;
  v20 = v12;
  v13 = v11;
  v21 = v13;
  v14 = v7;
  v22 = v14;
  objc_msgSend(v13, "performBlock:", v19);

  if ((_BYTE)v23)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v24 + 8));
  if ((_QWORD)v24)
  {
    PLRequestGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = v24;
    if ((unint64_t)(v24 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v27 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v16, OS_SIGNPOST_INTERVAL_END, v17, "########## Syncing with Cloud Photo Library!", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)fetchShareWithURL:(id)a3 ignoreExistingShare:(BOOL)a4 reply:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  PLAssetsdCloudInternalService *v19;
  id v20;
  id v21;
  BOOL v22;

  v8 = a3;
  v9 = a5;
  v10 = (void *)MEMORY[0x1E0D73258];
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __77__PLAssetsdCloudInternalService_fetchShareWithURL_ignoreExistingShare_reply___block_invoke;
  v18 = &unk_1E36755F8;
  v19 = self;
  v20 = v8;
  v22 = a4;
  v21 = v9;
  v11 = v9;
  v12 = v8;
  objc_msgSend(v10, "operationWithName:requiredState:parentProgress:execution:", CFSTR("Fetch Share URL"), 7, 0, &v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager", v15, v16, v17, v18, v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "enqueueOperation:error:", v13, 0);

}

- (void)acceptShareWithUUID:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  int v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  const char *Name;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  SEL sel[2];
  uint8_t buf[4];
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v24 = 0u;
  *(_OWORD *)sel = 0u;
  v23 = 0u;
  v8 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v23) = v8;
  if (v8)
  {
    v9 = _os_activity_create(&dword_199541000, "PLXPC Service: acceptShareWithUUID:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v10 = (void *)*((_QWORD *)&v23 + 1);
    *((_QWORD *)&v23 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v24 + 8));
  }
  v11 = -[PLAbstractLibraryServicesManagerService newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", "-[PLAssetsdCloudInternalService acceptShareWithUUID:reply:]");
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __59__PLAssetsdCloudInternalService_acceptShareWithUUID_reply___block_invoke;
  v19[3] = &unk_1E3676290;
  v12 = v6;
  v20 = v12;
  v13 = v11;
  v21 = v13;
  v14 = v7;
  v22 = v14;
  objc_msgSend(v13, "performBlock:", v19);

  if ((_BYTE)v23)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v24 + 8));
  if ((_QWORD)v24)
  {
    PLRequestGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = v24;
    if ((unint64_t)(v24 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v27 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v16, OS_SIGNPOST_INTERVAL_END, v17, "########## Syncing with Cloud Photo Library!", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)queryUserIdentitiesWithEmails:(id)a3 phoneNumbers:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  os_signpost_id_t v32;
  const char *Name;
  _QWORD v34[4];
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  const __CFString *v48;
  _BYTE v49[128];
  uint8_t v50[128];
  uint8_t buf[4];
  const char *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v45 = 0u;
  v46 = 0u;
  v44 = 0u;
  v11 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v44) = v11;
  if (v11)
  {
    v12 = _os_activity_create(&dword_199541000, "PLXPC Service: queryUserIdentitiesWithEmails:phoneNumbers:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v13 = (void *)*((_QWORD *)&v44 + 1);
    *((_QWORD *)&v44 + 1) = v12;

    os_activity_scope_enter(v12, (os_activity_scope_state_t)((char *)&v45 + 8));
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count") + objc_msgSend(v8, "count"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v15 = v8;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v41;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v41 != v17)
          objc_enumerationMutation(v15);
        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D11478]), "initWithEmail:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v18));
        objc_msgSend(v14, "addObject:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
    }
    while (v16);
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v20 = v9;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v37;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v37 != v22)
          objc_enumerationMutation(v20);
        v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D11478]), "initWithPhoneNumber:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v23));
        objc_msgSend(v14, "addObject:", v24);

        ++v23;
      }
      while (v21 != v23);
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
    }
    while (v21);
  }

  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "cloudPhotoLibraryManager");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __82__PLAssetsdCloudInternalService_queryUserIdentitiesWithEmails_phoneNumbers_reply___block_invoke;
    v34[3] = &unk_1E36687E8;
    v35 = v10;
    objc_msgSend(v26, "queryUserIdentitiesWithParticipants:completionHandler:", v14, v34);
    v27 = v35;
  }
  else
  {
    v28 = (void *)MEMORY[0x1E0CB35C8];
    v47 = *MEMORY[0x1E0CB2D50];
    v48 = CFSTR("PLCloudPhotoLibraryManager not available");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41004, v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v10 + 2))(v10, 0, 0, v29);

  }
  if ((_BYTE)v44)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v45 + 8));
  if ((_QWORD)v45)
  {
    PLRequestGetLog();
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = v30;
    v32 = v45;
    if ((unint64_t)(v45 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
    {
      Name = sel_getName(*((SEL *)&v46 + 1));
      *(_DWORD *)buf = 136446210;
      v52 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v31, OS_SIGNPOST_INTERVAL_END, v32, "########## Syncing with Cloud Photo Library!", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)forceSyncMomentShareWithUUID:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  int v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  const char *Name;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  SEL sel[2];
  uint8_t buf[4];
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v24 = 0u;
  *(_OWORD *)sel = 0u;
  v23 = 0u;
  v8 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v23) = v8;
  if (v8)
  {
    v9 = _os_activity_create(&dword_199541000, "PLXPC Service: forceSyncMomentShareWithUUID:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v10 = (void *)*((_QWORD *)&v23 + 1);
    *((_QWORD *)&v23 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v24 + 8));
  }
  v11 = -[PLAbstractLibraryServicesManagerService newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", "-[PLAssetsdCloudInternalService forceSyncMomentShareWithUUID:reply:]");
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __68__PLAssetsdCloudInternalService_forceSyncMomentShareWithUUID_reply___block_invoke;
  v19[3] = &unk_1E3676290;
  v12 = v6;
  v20 = v12;
  v13 = v11;
  v21 = v13;
  v14 = v7;
  v22 = v14;
  objc_msgSend(v13, "performBlock:", v19);

  if ((_BYTE)v23)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v24 + 8));
  if ((_QWORD)v24)
  {
    PLRequestGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = v24;
    if ((unint64_t)(v24 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v27 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v16, OS_SIGNPOST_INTERVAL_END, v17, "########## Syncing with Cloud Photo Library!", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)getResetSyncStatusWithReply:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  void (**v7)(id, _QWORD);

  v7 = (void (**)(id, _QWORD))a3;
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cloudPhotoLibraryManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "currentResetSyncType");
  if (v6 <= 6)
    v7[2](v7, qword_199B9B680[v6]);

}

- (id)activateLibraryScopeWithUUID:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  int v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  const char *Name;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  __int128 *p_buf;
  __int128 v26;
  __int128 v27;
  SEL sel[2];
  __int128 buf;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v27 = 0u;
  *(_OWORD *)sel = 0u;
  v26 = 0u;
  v8 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v26) = v8;
  if (v8)
  {
    v9 = _os_activity_create(&dword_199541000, "PLXPC Service: activateLibraryScopeWithUUID:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v10 = (void *)*((_QWORD *)&v26 + 1);
    *((_QWORD *)&v26 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v27 + 8));
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__33258;
  v32 = __Block_byref_object_dispose__33259;
  v33 = 0;
  v11 = -[PLAbstractLibraryServicesManagerService newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", "-[PLAssetsdCloudInternalService activateLibraryScopeWithUUID:reply:]");
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __68__PLAssetsdCloudInternalService_activateLibraryScopeWithUUID_reply___block_invoke;
  v21[3] = &unk_1E3668810;
  v12 = v6;
  v22 = v12;
  v13 = v11;
  v23 = v13;
  p_buf = &buf;
  v14 = v7;
  v24 = v14;
  objc_msgSend(v13, "performTransactionAndWait:", v21);
  v15 = *(id *)(*((_QWORD *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v26)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v27 + 8));
  if ((_QWORD)v27)
  {
    PLRequestGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v18 = v27;
    if ((unint64_t)(v27 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v17, OS_SIGNPOST_INTERVAL_END, v18, "########## Syncing with Cloud Photo Library!", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
  return v15;
}

- (void)deactivateLibraryScopeWithUUID:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  int v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  const char *Name;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  SEL sel[2];
  uint8_t buf[4];
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v24 = 0u;
  *(_OWORD *)sel = 0u;
  v23 = 0u;
  v8 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v23) = v8;
  if (v8)
  {
    v9 = _os_activity_create(&dword_199541000, "PLXPC Service: deactivateLibraryScopeWithUUID:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v10 = (void *)*((_QWORD *)&v23 + 1);
    *((_QWORD *)&v23 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v24 + 8));
  }
  v11 = -[PLAbstractLibraryServicesManagerService newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", "-[PLAssetsdCloudInternalService deactivateLibraryScopeWithUUID:reply:]");
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __70__PLAssetsdCloudInternalService_deactivateLibraryScopeWithUUID_reply___block_invoke;
  v19[3] = &unk_1E3676290;
  v12 = v6;
  v20 = v12;
  v13 = v11;
  v21 = v13;
  v14 = v7;
  v22 = v14;
  objc_msgSend(v13, "performBlock:", v19);

  if ((_BYTE)v23)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v24 + 8));
  if ((_QWORD)v24)
  {
    PLRequestGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = v24;
    if ((unint64_t)(v24 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v27 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v16, OS_SIGNPOST_INTERVAL_END, v17, "########## Syncing with Cloud Photo Library!", "%{public}s", buf, 0xCu);
    }

  }
}

- (id)markOnboardingPreviewAssetsByProcessingRulesOnLibraryScopeWithUUID:(id)a3 excludePersonUUIDs:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  os_signpost_id_t v24;
  const char *Name;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  __int128 *p_buf;
  __int128 v33;
  __int128 v34;
  SEL sel[2];
  __int128 buf;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v34 = 0u;
  *(_OWORD *)sel = 0u;
  v33 = 0u;
  v11 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v33) = v11;
  if (v11)
  {
    v12 = _os_activity_create(&dword_199541000, "PLXPC Service: markOnboardingPreviewAssetsByProcessingRulesOnLibraryScopeWithUUID:excludePersonUUIDs:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v13 = (void *)*((_QWORD *)&v33 + 1);
    *((_QWORD *)&v33 + 1) = v12;

    os_activity_scope_enter(v12, (os_activity_scope_state_t)((char *)&v34 + 8));
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__33258;
  v39 = __Block_byref_object_dispose__33259;
  v40 = 0;
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "databaseContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "newShortLivedCplLibraryWithNameSuffix:", "-[PLAssetsdCloudInternalService markOnboardingPreviewAssetsByProcessingRulesOnLibraryScopeWithUUID:excludePersonUUIDs:reply:]");

  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __125__PLAssetsdCloudInternalService_markOnboardingPreviewAssetsByProcessingRulesOnLibraryScopeWithUUID_excludePersonUUIDs_reply___block_invoke;
  v27[3] = &unk_1E366D420;
  v17 = v8;
  v28 = v17;
  v18 = v16;
  v29 = v18;
  p_buf = &buf;
  v19 = v9;
  v30 = v19;
  v20 = v10;
  v31 = v20;
  objc_msgSend(v18, "performTransactionAndWait:", v27);
  v21 = *(id *)(*((_QWORD *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v33)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v34 + 8));
  if ((_QWORD)v34)
  {
    PLRequestGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    v24 = v34;
    if ((unint64_t)(v34 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v23, OS_SIGNPOST_INTERVAL_END, v24, "########## Syncing with Cloud Photo Library!", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
  return v21;
}

- (void)confirmAllRemainingOnboardingPreviewAssetsOnLibraryScopeWithUUID:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, BOOL, _QWORD);
  int v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  const char *Name;
  _QWORD v19[4];
  id v20;
  id v21;
  uint64_t *v22;
  __int128 *p_buf;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  __int128 v28;
  __int128 v29;
  SEL sel[2];
  __int128 buf;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, BOOL, _QWORD))a4;
  v29 = 0u;
  *(_OWORD *)sel = 0u;
  v28 = 0u;
  v8 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v28) = v8;
  if (v8)
  {
    v9 = _os_activity_create(&dword_199541000, "PLXPC Service: confirmAllRemainingOnboardingPreviewAssetsOnLibraryScopeWithUUID:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v10 = (void *)*((_QWORD *)&v28 + 1);
    *((_QWORD *)&v28 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v29 + 8));
  }
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__33258;
  v34 = __Block_byref_object_dispose__33259;
  v35 = 0;
  v11 = -[PLAbstractLibraryServicesManagerService newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", "-[PLAssetsdCloudInternalService confirmAllRemainingOnboardingPreviewAssetsOnLibraryScopeWithUUID:reply:]");
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __104__PLAssetsdCloudInternalService_confirmAllRemainingOnboardingPreviewAssetsOnLibraryScopeWithUUID_reply___block_invoke;
  v19[3] = &unk_1E3676348;
  v12 = v6;
  v20 = v12;
  v13 = v11;
  v21 = v13;
  v22 = &v24;
  p_buf = &buf;
  objc_msgSend(v13, "performTransactionAndWait:", v19);
  if (*((_BYTE *)v25 + 24))
    v14 = 0;
  else
    v14 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
  v7[2](v7, *((_BYTE *)v25 + 24) != 0, v14);

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(&v24, 8);
  if ((_BYTE)v28)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v29 + 8));
  if ((_QWORD)v29)
  {
    PLRequestGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = v29;
    if ((unint64_t)(v29 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v16, OS_SIGNPOST_INTERVAL_END, v17, "########## Syncing with Cloud Photo Library!", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
}

- (void)requestDeviceLibraryConfigurationChange:(int64_t)a3 reply:(id)a4
{
  id v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  const char *Name;
  _QWORD v17[4];
  id v18;
  __int128 v19;
  __int128 v20;
  SEL sel[2];
  uint8_t buf[4];
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v20 = 0u;
  *(_OWORD *)sel = 0u;
  v19 = 0u;
  v7 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v19) = v7;
  if (v7)
  {
    v8 = _os_activity_create(&dword_199541000, "PLXPC Service: requestDeviceLibraryConfigurationChange:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v9 = (void *)*((_QWORD *)&v19 + 1);
    *((_QWORD *)&v19 + 1) = v8;

    os_activity_scope_enter(v8, (os_activity_scope_state_t)((char *)&v20 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cloudPhotoLibraryManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __79__PLAssetsdCloudInternalService_requestDeviceLibraryConfigurationChange_reply___block_invoke;
  v17[3] = &unk_1E3668838;
  v12 = v6;
  v18 = v12;
  objc_msgSend(v11, "requestDeviceLibraryConfigurationChange:completionHandler:", a3, v17);

  if ((_BYTE)v19)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v20 + 8));
  if ((_QWORD)v20)
  {
    PLRequestGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = v20;
    if ((unint64_t)(v20 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v23 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v14, OS_SIGNPOST_INTERVAL_END, v15, "########## Syncing with Cloud Photo Library!", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)resetLocalOnlyLibraryScopesAndAllLibraryScopeAssetStatesWithReply:(id)a3
{
  _QWORD *v4;
  int v5;
  NSObject *v6;
  void *v7;
  id v8;
  id v9;
  void (*v10)(_QWORD *, uint64_t);
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  const char *Name;
  _QWORD v15[4];
  id v16;
  __int128 *p_buf;
  __int128 v18;
  __int128 v19;
  SEL sel[2];
  __int128 buf;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19 = 0u;
  *(_OWORD *)sel = 0u;
  v18 = 0u;
  v5 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v18) = v5;
  if (v5)
  {
    v6 = _os_activity_create(&dword_199541000, "PLXPC Service: resetLocalOnlyLibraryScopesAndAllLibraryScopeAssetStatesWithReply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v7 = (void *)*((_QWORD *)&v18 + 1);
    *((_QWORD *)&v18 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v19 + 8));
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__33258;
  v24 = __Block_byref_object_dispose__33259;
  v25 = 0;
  v8 = -[PLAbstractLibraryServicesManagerService newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", "-[PLAssetsdCloudInternalService resetLocalOnlyLibraryScopesAndAllLibraryScopeAssetStatesWithReply:]");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __99__PLAssetsdCloudInternalService_resetLocalOnlyLibraryScopesAndAllLibraryScopeAssetStatesWithReply___block_invoke;
  v15[3] = &unk_1E3677C68;
  p_buf = &buf;
  v9 = v8;
  v16 = v9;
  objc_msgSend(v9, "performTransactionAndWait:", v15);
  v10 = (void (*)(_QWORD *, uint64_t))v4[2];
  if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
    v10(v4, 0);
  else
    v10(v4, 1);

  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v18)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v19 + 8));
  if ((_QWORD)v19)
  {
    PLRequestGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = v19;
    if ((unint64_t)(v19 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v12, OS_SIGNPOST_INTERVAL_END, v13, "########## Syncing with Cloud Photo Library!", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
}

- (void)startExitFromLibraryScopeWithIdentifier:(id)a3 retentionPolicy:(int64_t)a4 exitSource:(int64_t)a5 reply:(id)a6
{
  id v10;
  id v11;
  int v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  os_signpost_id_t v21;
  const char *Name;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  __int128 *p_buf;
  int64_t v28;
  int64_t v29;
  __int128 v30;
  __int128 v31;
  SEL sel[2];
  __int128 buf;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  v31 = 0u;
  *(_OWORD *)sel = 0u;
  v30 = 0u;
  v12 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v30) = v12;
  if (v12)
  {
    v13 = _os_activity_create(&dword_199541000, "PLXPC Service: startExitFromLibraryScopeWithIdentifier:retentionPolicy:exitSource:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v14 = (void *)*((_QWORD *)&v30 + 1);
    *((_QWORD *)&v30 + 1) = v13;

    os_activity_scope_enter(v13, (os_activity_scope_state_t)((char *)&v31 + 8));
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__33258;
  v36 = __Block_byref_object_dispose__33259;
  v37 = 0;
  v15 = -[PLAbstractLibraryServicesManagerService newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", "-[PLAssetsdCloudInternalService startExitFromLibraryScopeWithIdentifier:retentionPolicy:exitSource:reply:]");
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __106__PLAssetsdCloudInternalService_startExitFromLibraryScopeWithIdentifier_retentionPolicy_exitSource_reply___block_invoke;
  v23[3] = &unk_1E3668860;
  v16 = v10;
  v24 = v16;
  v17 = v15;
  v25 = v17;
  v28 = a4;
  v29 = a5;
  v18 = v11;
  v26 = v18;
  p_buf = &buf;
  objc_msgSend(v17, "performTransactionAndWait:", v23);

  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v30)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v31 + 8));
  if ((_QWORD)v31)
  {
    PLRequestGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    v21 = v31;
    if ((unint64_t)(v31 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v20, OS_SIGNPOST_INTERVAL_END, v21, "########## Syncing with Cloud Photo Library!", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
}

- (void)removeParticipantsWithParticipantUUIDs:(id)a3 fromLibraryScopeWithIdentifier:(id)a4 retentionPolicy:(int64_t)a5 exitSource:(int64_t)a6 reply:(id)a7
{
  id v12;
  id v13;
  id v14;
  int v15;
  NSObject *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  os_signpost_id_t v25;
  const char *Name;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  __int128 *p_buf;
  int64_t v33;
  int64_t v34;
  __int128 v35;
  __int128 v36;
  SEL sel[2];
  __int128 buf;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a7;
  v36 = 0u;
  *(_OWORD *)sel = 0u;
  v35 = 0u;
  v15 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v35) = v15;
  if (v15)
  {
    v16 = _os_activity_create(&dword_199541000, "PLXPC Service: removeParticipantsWithParticipantUUIDs:fromLibraryScopeWithIdentifier:retentionPolicy:exitSource:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v17 = (void *)*((_QWORD *)&v35 + 1);
    *((_QWORD *)&v35 + 1) = v16;

    os_activity_scope_enter(v16, (os_activity_scope_state_t)((char *)&v36 + 8));
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__33258;
  v41 = __Block_byref_object_dispose__33259;
  v42 = 0;
  v18 = -[PLAbstractLibraryServicesManagerService newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", "-[PLAssetsdCloudInternalService removeParticipantsWithParticipantUUIDs:fromLibraryScopeWithIdentifier:retentionPolicy:exitSource:reply:]");
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __136__PLAssetsdCloudInternalService_removeParticipantsWithParticipantUUIDs_fromLibraryScopeWithIdentifier_retentionPolicy_exitSource_reply___block_invoke;
  v27[3] = &unk_1E3668888;
  v19 = v13;
  v28 = v19;
  v20 = v18;
  v29 = v20;
  v21 = v12;
  v30 = v21;
  v33 = a5;
  v34 = a6;
  v22 = v14;
  v31 = v22;
  p_buf = &buf;
  objc_msgSend(v20, "performTransactionAndWait:", v27);

  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v35)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v36 + 8));
  if ((_QWORD)v36)
  {
    PLRequestGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v23;
    v25 = v36;
    if ((unint64_t)(v36 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v24, OS_SIGNPOST_INTERVAL_END, v25, "########## Syncing with Cloud Photo Library!", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
}

- (void)sharedLibraryRampCheckWithReply:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  os_signpost_id_t v20;
  const char *Name;
  _QWORD v22[4];
  void (**v23)(id, uint64_t, _QWORD);
  __int128 v24;
  __int128 v25;
  SEL sel[2];
  uint8_t buf[4];
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  v25 = 0u;
  *(_OWORD *)sel = 0u;
  v24 = 0u;
  v5 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v24) = v5;
  if (v5)
  {
    v6 = _os_activity_create(&dword_199541000, "PLXPC Service: sharedLibraryRampCheckWithReply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v7 = (void *)*((_QWORD *)&v24 + 1);
    *((_QWORD *)&v24 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v25 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cloudPhotoLibraryManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cplConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
    goto LABEL_15;
  objc_msgSend(v10, "valueForKey:", CFSTR("feature.sharedlibrary.skiprampcheck"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12 && objc_msgSend(v12, "BOOLValue"))
  {
    PLBackendSharingGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_INFO, "PLShouldShowSharedLibrarySetting: Returning YES because CPLConfiguration says we should skip the ramp check", buf, 2u);
    }

    v4[2](v4, 1, 0);
    goto LABEL_16;
  }
  objc_msgSend(v11, "valueForKey:", CFSTR("feature.sharedlibrary.hidesetting"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15 || !objc_msgSend(v15, "BOOLValue"))
  {

LABEL_15:
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __65__PLAssetsdCloudInternalService_sharedLibraryRampCheckWithReply___block_invoke;
    v22[3] = &unk_1E36768D0;
    v23 = v4;
    objc_msgSend(v9, "sharedLibraryRampCheckWithCompletionHandler:", v22);
    v13 = v23;
    goto LABEL_16;
  }
  PLBackendSharingGetLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_INFO, "PLShouldShowSharedLibrarySetting: Returning NO because CPLConfiguration says we should hide the setting", buf, 2u);
  }

  v4[2](v4, 0, 0);
LABEL_16:

  if ((_BYTE)v24)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v25 + 8));
  if ((_QWORD)v25)
  {
    PLRequestGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    v20 = v25;
    if ((unint64_t)(v25 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v28 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v19, OS_SIGNPOST_INTERVAL_END, v20, "########## Syncing with Cloud Photo Library!", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)userViewedSharedLibraryParticipantAssetTrashNotificationWithReply:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  _QWORD *v11;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__33258;
  v12[4] = __Block_byref_object_dispose__33259;
  v13 = 0;
  v5 = -[PLAbstractLibraryServicesManagerService newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", "-[PLAssetsdCloudInternalService userViewedSharedLibraryParticipantAssetTrashNotificationWithReply:]");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __99__PLAssetsdCloudInternalService_userViewedSharedLibraryParticipantAssetTrashNotificationWithReply___block_invoke;
  v8[3] = &unk_1E3676F20;
  v6 = v5;
  v9 = v6;
  v11 = v12;
  v7 = v4;
  v10 = v7;
  objc_msgSend(v6, "performTransactionAndWait:", v8);

  _Block_object_dispose(v12, 8);
}

- (void)forceParticipantAssetTrashNotificationWithReply:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  v5 = -[PLAbstractLibraryServicesManagerService newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", "-[PLAssetsdCloudInternalService forceParticipantAssetTrashNotificationWithReply:]");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __81__PLAssetsdCloudInternalService_forceParticipantAssetTrashNotificationWithReply___block_invoke;
  v8[3] = &unk_1E3675C58;
  v9 = v5;
  v10 = v4;
  v6 = v4;
  v7 = v5;
  objc_msgSend(v7, "performTransactionAndWait:", v8);

}

- (void)refreshLibraryScopeWithIdentifier:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  const char *Name;
  _QWORD v21[4];
  id v22;
  __int128 v23;
  __int128 v24;
  SEL sel[2];
  uint64_t v26;
  const __CFString *v27;
  uint8_t buf[4];
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v24 = 0u;
  *(_OWORD *)sel = 0u;
  v23 = 0u;
  v8 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v23) = v8;
  if (v8)
  {
    v9 = _os_activity_create(&dword_199541000, "PLXPC Service: refreshLibraryScopeWithIdentifier:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v10 = (void *)*((_QWORD *)&v23 + 1);
    *((_QWORD *)&v23 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v24 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "cloudPhotoLibraryManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v11, "cloudPhotoLibraryManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __73__PLAssetsdCloudInternalService_refreshLibraryScopeWithIdentifier_reply___block_invoke;
    v21[3] = &unk_1E36688B0;
    v22 = v7;
    objc_msgSend(v13, "refreshLibraryScopeWithIdentifier:completionHandler:", v6, v21);

    v14 = v22;
  }
  else
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v26 = *MEMORY[0x1E0CB2D50];
    v27 = CFSTR("PLCloudPhotoLibraryManager not available");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41004, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v16);

  }
  if ((_BYTE)v23)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v24 + 8));
  if ((_QWORD)v24)
  {
    PLRequestGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    v19 = v24;
    if ((unint64_t)(v24 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v29 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v18, OS_SIGNPOST_INTERVAL_END, v19, "########## Syncing with Cloud Photo Library!", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)getLibraryScopeStatusCountsForScopeWithIdentifier:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  const char *Name;
  _QWORD v21[4];
  id v22;
  __int128 v23;
  __int128 v24;
  SEL sel[2];
  uint64_t v26;
  const __CFString *v27;
  uint8_t buf[4];
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v24 = 0u;
  *(_OWORD *)sel = 0u;
  v23 = 0u;
  v8 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v23) = v8;
  if (v8)
  {
    v9 = _os_activity_create(&dword_199541000, "PLXPC Service: getLibraryScopeStatusCountsForScopeWithIdentifier:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v10 = (void *)*((_QWORD *)&v23 + 1);
    *((_QWORD *)&v23 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v24 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "cloudPhotoLibraryManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v11, "cloudPhotoLibraryManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __89__PLAssetsdCloudInternalService_getLibraryScopeStatusCountsForScopeWithIdentifier_reply___block_invoke;
    v21[3] = &unk_1E36688D8;
    v22 = v7;
    objc_msgSend(v13, "getLibraryScopeStatusCountsForScopeWithIdentifier:completionHandler:", v6, v21);

    v14 = v22;
  }
  else
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v26 = *MEMORY[0x1E0CB2D50];
    v27 = CFSTR("PLCloudPhotoLibraryManager not available");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41004, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v16);

  }
  if ((_BYTE)v23)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v24 + 8));
  if ((_QWORD)v24)
  {
    PLRequestGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    v19 = v24;
    if ((unint64_t)(v24 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v29 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v18, OS_SIGNPOST_INTERVAL_END, v19, "########## Syncing with Cloud Photo Library!", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)unsharePendingAssetsSharedToScopeWithIdentifier:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  const char *Name;
  __int128 v11;
  char v12;
  __int128 v13;
  SEL sel[2];
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  *(_OWORD *)sel = 0u;
  v11 = 0u;
  v5 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v11) = v5;
  if (v5)
  {
    *((_QWORD *)&v11 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: unsharePendingAssetsSharedToScopeWithIdentifier:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v11 + 1), (os_activity_scope_state_t)((char *)&v13 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager", (_QWORD)v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cloudPhotoLibraryManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startUnsharingPendingAssetsSharedToScopeWithIdentifier:", v4);

  if (v12)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v13 + 8));
  if ((_QWORD)v13)
  {
    PLRequestGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if ((unint64_t)(v13 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v16 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v9, OS_SIGNPOST_INTERVAL_END, v13, "########## Syncing with Cloud Photo Library!", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)markResourcesPurgeableWithUrgency:(int64_t)a3 assetUuids:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  int v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  os_signpost_id_t v26;
  const char *Name;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  __int128 v32;
  __int128 v33;
  SEL sel[2];
  _QWORD v35[2];
  uint8_t buf[4];
  const char *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v33 = 0u;
  *(_OWORD *)sel = 0u;
  v32 = 0u;
  v10 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v32) = v10;
  if (v10)
  {
    v11 = _os_activity_create(&dword_199541000, "PLXPC Service: markResourcesPurgeableWithUrgency:assetUuids:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v12 = (void *)*((_QWORD *)&v32 + 1);
    *((_QWORD *)&v32 + 1) = v11;

    os_activity_scope_enter(v11, (os_activity_scope_state_t)((char *)&v33 + 8));
  }
  v13 = -[PLAbstractLibraryServicesManagerService newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", "-[PLAssetsdCloudInternalService markResourcesPurgeableWithUrgency:assetUuids:reply:]");
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K >= %d"), CFSTR("localAvailability"), 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("all"));

    if ((v16 & 1) == 0)
    {
      v17 = (void *)MEMORY[0x1E0CB3528];
      v35[0] = v14;
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("asset.uuid"), v8);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v35[1] = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "andPredicateWithSubpredicates:", v19);
      v20 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v20;
    }
    -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "cloudPhotoLibraryManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      if (a3 == -1)
      {
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __84__PLAssetsdCloudInternalService_markResourcesPurgeableWithUrgency_assetUuids_reply___block_invoke;
        v30[3] = &unk_1E3676CD8;
        v31 = v9;
        objc_msgSend(v22, "clearPurgeableResourcesMatchingPredicate:inLibrary:completionHandler:", v14, v13, v30);
        v23 = v31;
      }
      else
      {
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __84__PLAssetsdCloudInternalService_markResourcesPurgeableWithUrgency_assetUuids_reply___block_invoke_2;
        v28[3] = &unk_1E3676CD8;
        v29 = v9;
        objc_msgSend(v22, "markPurgeableResourcesMatchingPredicate:urgency:inLibrary:completionHandler:", v14, a3, v13, v28);
        v23 = v29;
      }
    }
    else
    {
      v23 = (void *)PLErrorCreate();
      (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v23);
    }

  }
  else
  {
    v14 = (void *)PLErrorCreate();
    (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v14);
  }

  if ((_BYTE)v32)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v33 + 8));
  if ((_QWORD)v33)
  {
    PLRequestGetLog();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = v24;
    v26 = v33;
    if ((unint64_t)(v33 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v37 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v25, OS_SIGNPOST_INTERVAL_END, v26, "########## Syncing with Cloud Photo Library!", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)getCPLConfigrationValueForKey:(id)a3 reply:(id)a4
{
  char *v6;
  void (**v7)(id, void *);
  int v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  const char *Name;
  __int128 v16;
  char v17;
  __int128 v18;
  SEL sel[2];
  uint8_t buf[4];
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = (char *)a3;
  v7 = (void (**)(id, void *))a4;
  v18 = 0u;
  *(_OWORD *)sel = 0u;
  v16 = 0u;
  v8 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v16) = v8;
  if (v8)
  {
    *((_QWORD *)&v16 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: getCPLConfigrationValueForKey:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v16 + 1), (os_activity_scope_state_t)((char *)&v18 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager", (_QWORD)v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "directServerConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "check");
  objc_msgSend(v10, "valueForKey:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      PLBackendGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v21 = v6;
        _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "CPL configuration value for key %{public}@ is not a dictionary", buf, 0xCu);
      }

      v11 = 0;
    }
  }
  v7[2](v7, v11);

  if (v17)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v18 + 8));
  if ((_QWORD)v18)
  {
    PLRequestGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if ((unint64_t)(v18 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v21 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v14, OS_SIGNPOST_INTERVAL_END, v18, "########## Syncing with Cloud Photo Library!", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)getCPLSettingsWithReply:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cplSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))a3 + 2))(v5, v6);

}

- (void)setPrefetchMode:(int64_t)a3 reply:(id)a4
{
  void (**v6)(id, _BOOL8, id);
  void *v7;
  void *v8;
  _BOOL8 v9;
  id v10;
  id v11;

  v6 = (void (**)(id, _BOOL8, id))a4;
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "libraryBundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v9 = +[PLCPLSettings setPrefetchMode:withLibraryBundle:error:](PLCPLSettings, "setPrefetchMode:withLibraryBundle:error:", a3, v8, &v11);
  v10 = v11;

  v6[2](v6, v9, v10);
}

- (void)runComputeSyncBackfillMigrationSynchronously
{
  id v2;
  id v3;
  _QWORD v4[4];
  id v5;

  v2 = -[PLAbstractLibraryServicesManagerService newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", "-[PLAssetsdCloudInternalService runComputeSyncBackfillMigrationSynchronously]");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __77__PLAssetsdCloudInternalService_runComputeSyncBackfillMigrationSynchronously__block_invoke;
  v4[3] = &unk_1E3677AA0;
  v5 = v2;
  v3 = v2;
  objc_msgSend(v3, "performTransactionAndWait:", v4);

}

- (void)isComputeSyncEnabledForDirection:(int64_t)a3 reply:(id)a4
{
  void (**v6)(id, _BOOL8, id);
  id v7;
  _BOOL8 v8;
  id v9;
  id v10;

  v6 = (void (**)(id, _BOOL8, id))a4;
  v7 = -[PLAbstractLibraryServicesManagerService newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", "-[PLAssetsdCloudInternalService isComputeSyncEnabledForDirection:reply:]");
  v10 = 0;
  v8 = +[PLManagedAsset isComputeSyncEnabledForDirection:library:debugMode:debugLog:](PLManagedAsset, "isComputeSyncEnabledForDirection:library:debugMode:debugLog:", a3, v7, 1, &v10);
  v9 = v10;
  v6[2](v6, v8, v9);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionAuthorization, 0);
}

uint64_t __77__PLAssetsdCloudInternalService_runComputeSyncBackfillMigrationSynchronously__block_invoke(uint64_t a1)
{
  return +[PLManagedAsset runComputeSyncBackfillMigrationOnProcessedAssets:](PLManagedAsset, "runComputeSyncBackfillMigrationOnProcessedAssets:", *(_QWORD *)(a1 + 32));
}

uint64_t __84__PLAssetsdCloudInternalService_markResourcesPurgeableWithUrgency_assetUuids_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __84__PLAssetsdCloudInternalService_markResourcesPurgeableWithUrgency_assetUuids_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __89__PLAssetsdCloudInternalService_getLibraryScopeStatusCountsForScopeWithIdentifier_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __73__PLAssetsdCloudInternalService_refreshLibraryScopeWithIdentifier_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __81__PLAssetsdCloudInternalService_forceParticipantAssetTrashNotificationWithReply___block_invoke(uint64_t a1)
{
  id v2;

  +[PLLibraryScope fireParticipantAssetTrashNotificationIfNeededWithPhotoLibrary:forceNotification:](PLLibraryScope, "fireParticipantAssetTrashNotificationIfNeededWithPhotoLibrary:forceNotification:", *(_QWORD *)(a1 + 32), 1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __99__PLAssetsdCloudInternalService_userViewedSharedLibraryParticipantAssetTrashNotificationWithReply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLLibraryScope activeLibraryScopeInManagedObjectContext:](PLLibraryScope, "activeLibraryScopeInManagedObjectContext:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "userViewedAssetTrashNotificationWithManagedObjectContext:", v4);

  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CB35C8];
    v10 = *MEMORY[0x1E0CB2D50];
    v11[0] = CFSTR("No active Library scope found");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("PLCloudPhotoLibraryErrorDomain"), 100, v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __65__PLAssetsdCloudInternalService_sharedLibraryRampCheckWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __136__PLAssetsdCloudInternalService_removeParticipantsWithParticipantUUIDs_fromLibraryScopeWithIdentifier_retentionPolicy_exitSource_reply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLShare shareWithScopeIdentifier:includeTrashed:inManagedObjectContext:](PLLibraryScope, "shareWithScopeIdentifier:includeTrashed:inManagedObjectContext:", v2, 1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "removeParticipantsWithParticipantUUIDs:fromLibraryScopeWithIdentifier:retentionPolicy:exitSource:completionHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 72), *(unsigned __int16 *)(a1 + 80), *(_QWORD *)(a1 + 56));
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Library scope with scopeIdentifier %@ not found"), *(_QWORD *)(a1 + 32), *MEMORY[0x1E0CB2D50]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("PLCloudPhotoLibraryErrorDomain"), 100, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __106__PLAssetsdCloudInternalService_startExitFromLibraryScopeWithIdentifier_retentionPolicy_exitSource_reply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLShare shareWithScopeIdentifier:includeTrashed:inManagedObjectContext:](PLLibraryScope, "shareWithScopeIdentifier:includeTrashed:inManagedObjectContext:", v2, 1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "startExitWithRetentionPolicy:exitSource:completionHandler:", *(_QWORD *)(a1 + 64), *(unsigned __int16 *)(a1 + 72), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Library scope with scopeIdentifier %@ not found"), *(_QWORD *)(a1 + 32), *MEMORY[0x1E0CB2D50]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("PLCloudPhotoLibraryErrorDomain"), 100, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __99__PLAssetsdCloudInternalService_resetLocalOnlyLibraryScopesAndAllLibraryScopeAssetStatesWithReply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[PLLibraryScope resetLocalOnlyLibraryScopesAndAllLibraryScopeAssetStatesWithManagedObjectContext:](PLLibraryScope, "resetLocalOnlyLibraryScopesAndAllLibraryScopeAssetStatesWithManagedObjectContext:", v5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __79__PLAssetsdCloudInternalService_requestDeviceLibraryConfigurationChange_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __104__PLAssetsdCloudInternalService_confirmAllRemainingOnboardingPreviewAssetsOnLibraryScopeWithUUID_reply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id obj;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLShare shareWithUUID:includeTrashed:inManagedObjectContext:](PLLibraryScope, "shareWithUUID:includeTrashed:inManagedObjectContext:", v2, 0, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "libraryServicesManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "databaseContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    obj = *(id *)(v7 + 40);
    v8 = objc_msgSend(v4, "confirmAllRemainingOnboardingPreviewAssetsWithProgress:databaseContext:withError:", 0, v6, &obj);
    objc_storeStrong((id *)(v7 + 40), obj);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v8;
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Library scope %@ not found"), *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("PLCloudPhotoLibraryErrorDomain"), 100, v6);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
}

void __125__PLAssetsdCloudInternalService_markOnboardingPreviewAssetsByProcessingRulesOnLibraryScopeWithUUID_excludePersonUUIDs_reply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLShare shareWithUUID:includeTrashed:inManagedObjectContext:](PLLibraryScope, "shareWithUUID:includeTrashed:inManagedObjectContext:", v2, 0, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __125__PLAssetsdCloudInternalService_markOnboardingPreviewAssetsByProcessingRulesOnLibraryScopeWithUUID_excludePersonUUIDs_reply___block_invoke_2;
    v13[3] = &unk_1E3676858;
    v5 = *(_QWORD *)(a1 + 48);
    v14 = *(id *)(a1 + 56);
    objc_msgSend(v4, "markOnboardingPreviewAssetsByProcessingRulesWithExcludePersonUUIDs:completionHandler:", v5, v13);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    v9 = v14;
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Library scope %@ not found"), *(_QWORD *)(a1 + 32));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("PLCloudPhotoLibraryErrorDomain"), 100, v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

uint64_t __125__PLAssetsdCloudInternalService_markOnboardingPreviewAssetsByProcessingRulesOnLibraryScopeWithUUID_excludePersonUUIDs_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __70__PLAssetsdCloudInternalService_deactivateLibraryScopeWithUUID_reply___block_invoke(id *a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  objc_msgSend(a1[5], "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLShare shareWithUUID:includeTrashed:inManagedObjectContext:](PLLibraryScope, "shareWithUUID:includeTrashed:inManagedObjectContext:", v2, 0, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __70__PLAssetsdCloudInternalService_deactivateLibraryScopeWithUUID_reply___block_invoke_2;
    v9[3] = &unk_1E3674E40;
    v10 = a1[4];
    v11 = a1[6];
    objc_msgSend(v4, "deactivateScopeWithCompletionHandler:", v9);

    v5 = v10;
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Library scope %@ not found"), a1[4]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("PLCloudPhotoLibraryErrorDomain"), 100, v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(void))a1[6] + 2))();
  }

}

void __70__PLAssetsdCloudInternalService_deactivateLibraryScopeWithUUID_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLBackendGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v8 = 138543618;
      v9 = v6;
      v10 = 2114;
      v11 = v3;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "Failed to deactivate library scope uuid: %{public}@ (%{public}@)", (uint8_t *)&v8, 0x16u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "Deactivated library scope with uuid: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __68__PLAssetsdCloudInternalService_activateLibraryScopeWithUUID_reply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLShare shareWithUUID:includeTrashed:inManagedObjectContext:](PLLibraryScope, "shareWithUUID:includeTrashed:inManagedObjectContext:", v2, 0, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __68__PLAssetsdCloudInternalService_activateLibraryScopeWithUUID_reply___block_invoke_2;
    v12[3] = &unk_1E3674E40;
    v13 = *(id *)(a1 + 32);
    v14 = *(id *)(a1 + 48);
    objc_msgSend(v4, "activateScopeWithCompletionHandler:", v12);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v8 = v13;
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Library scope %@ not found"), *(_QWORD *)(a1 + 32));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("PLCloudPhotoLibraryErrorDomain"), 100, v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __68__PLAssetsdCloudInternalService_activateLibraryScopeWithUUID_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLBackendGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v8 = 138543618;
      v9 = v6;
      v10 = 2114;
      v11 = v3;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "Failed to activate library scope uuid: %{public}@ (%{public}@)", (uint8_t *)&v8, 0x16u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "Activated library scope with uuid: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __68__PLAssetsdCloudInternalService_forceSyncMomentShareWithUUID_reply___block_invoke(uint64_t a1)
{
  uint64_t v2;
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
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLShare shareWithUUID:includeTrashed:inManagedObjectContext:](PLMomentShare, "shareWithUUID:includeTrashed:inManagedObjectContext:", v2, 0, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    switch(objc_msgSend(v4, "status"))
    {
      case 0u:
      case 2u:
        v5 = (void *)MEMORY[0x1E0CB35C8];
        v17 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot force sync a pending moment share %@"), *(_QWORD *)(a1 + 32));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v18[0] = v6;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("PLCloudPhotoLibraryErrorDomain"), 102, v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
        goto LABEL_4;
      case 1u:
      case 3u:
LABEL_4:
        v16 = v4;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLMomentShare forceSyncMomentShares:photoLibrary:](PLMomentShare, "forceSyncMomentShares:photoLibrary:", v9, *(_QWORD *)(a1 + 40));

        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
        break;
      default:
        break;
    }
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Moment share %@ not found"), *(_QWORD *)(a1 + 32));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("PLCloudPhotoLibraryErrorDomain"), 100, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __82__PLAssetsdCloudInternalService_queryUserIdentitiesWithEmails_phoneNumbers_reply___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v7 = a2;
  if (!v7 || a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v7, "count"));
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __82__PLAssetsdCloudInternalService_queryUserIdentitiesWithEmails_phoneNumbers_reply___block_invoke_2;
    v8[3] = &unk_1E36687C0;
    v9 = v5;
    v6 = v5;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v8);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

void __82__PLAssetsdCloudInternalService_queryUserIdentitiesWithEmails_phoneNumbers_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "email");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4 || (objc_msgSend(v3, "phoneNumber"), (v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "hasiCloudAccount"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v6, v4);

  }
  else
  {
    PLBackendGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "Invalid fetched participant %@", (uint8_t *)&v7, 0xCu);
    }
  }

}

void __59__PLAssetsdCloudInternalService_acceptShareWithUUID_reply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLShare shareWithUUID:includeTrashed:inManagedObjectContext:](PLShare, "shareWithUUID:includeTrashed:inManagedObjectContext:", v2, 0, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    switch(objc_msgSend(v4, "status"))
    {
      case 0u:
      case 2u:
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __59__PLAssetsdCloudInternalService_acceptShareWithUUID_reply___block_invoke_2;
        v12[3] = &unk_1E36778D0;
        v15 = *(id *)(a1 + 48);
        v13 = *(id *)(a1 + 40);
        v14 = v4;
        objc_msgSend(v14, "acceptWithCompletionHandler:", v12);

        break;
      case 1u:
        v10 = (void *)MEMORY[0x1E0CB35C8];
        v18 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot accept an owned share %@"), *(_QWORD *)(a1 + 32));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v19[0] = v6;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v10;
        v9 = 102;
        goto LABEL_6;
      case 3u:
        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
        break;
      default:
        break;
    }
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Share %@ not found"), *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v5;
    v9 = 100;
LABEL_6:
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("PLCloudPhotoLibraryErrorDomain"), v9, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __59__PLAssetsdCloudInternalService_acceptShareWithUUID_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    PLBackendGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v9 = v3;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_ERROR, "Failed to accept share: %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __59__PLAssetsdCloudInternalService_acceptShareWithUUID_reply___block_invoke_71;
    v6[3] = &unk_1E3677AA0;
    v5 = *(void **)(a1 + 32);
    v7 = *(id *)(a1 + 40);
    objc_msgSend(v5, "performBlock:", v6);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
}

void __59__PLAssetsdCloudInternalService_acceptShareWithUUID_reply___block_invoke_71(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PLBackendGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "compactDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "Accepted share %@", (uint8_t *)&v4, 0xCu);

  }
}

void __77__PLAssetsdCloudInternalService_fetchShareWithURL_ignoreExistingShare_reply___block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  const char *Name;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  char v15;
  __int128 v16;
  __int128 v17;
  SEL sel[2];
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  *(_OWORD *)sel = 0u;
  v16 = 0u;
  v2 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v16) = v2;
  if (v2)
  {
    v3 = _os_activity_create(&dword_199541000, "PLXPC Service: fetchShareWithURL:ignoreExistingShare:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v4 = (void *)*((_QWORD *)&v16 + 1);
    *((_QWORD *)&v16 + 1) = v3;

    os_activity_scope_enter(v3, (os_activity_scope_state_t)((char *)&v17 + 8));
  }
  v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "newShortLivedLibraryWithName:", "-[PLAssetsdCloudInternalService fetchShareWithURL:ignoreExistingShare:reply:]_block_invoke");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __77__PLAssetsdCloudInternalService_fetchShareWithURL_ignoreExistingShare_reply___block_invoke_2;
  v11[3] = &unk_1E36755F8;
  v12 = *(id *)(a1 + 40);
  v6 = v5;
  v13 = v6;
  v15 = *(_BYTE *)(a1 + 56);
  v14 = *(id *)(a1 + 48);
  objc_msgSend(v6, "performBlockAndWait:", v11);

  if ((_BYTE)v16)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v17 + 8));
  if ((_QWORD)v17)
  {
    PLRequestGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = v17;
    if ((unint64_t)(v17 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v20 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v8, OS_SIGNPOST_INTERVAL_END, v9, "########## Syncing with Cloud Photo Library!", "%{public}s", buf, 0xCu);
    }

  }
}

void __77__PLAssetsdCloudInternalService_fetchShareWithURL_ignoreExistingShare_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLShare shareWithShareURL:includeTrashed:inManagedObjectContext:](PLShare, "shareWithShareURL:includeTrashed:inManagedObjectContext:", v2, 1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(a1 + 56))
    v6 = 1;
  else
    v6 = v4 == 0;
  if (v6)
  {
    v8 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(a1 + 40);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __77__PLAssetsdCloudInternalService_fetchShareWithURL_ignoreExistingShare_reply___block_invoke_3;
    v16[3] = &unk_1E3668798;
    v17 = v7;
    v18 = v5;
    v19 = *(id *)(a1 + 32);
    v20 = *(id *)(a1 + 48);
    +[PLShare fetchShareFromShareURL:inPhotoLibrary:completionHandler:](PLShare, "fetchShareFromShareURL:inPhotoLibrary:completionHandler:", v8, v17, v16);

    v9 = v17;
  }
  else
  {
    objc_msgSend(v4, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "trashedState") == 1)
    {
      v10 = (void *)MEMORY[0x1E0CB35C8];
      v21 = *MEMORY[0x1E0CB2D50];
      v11 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v4, "uuid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("Share %@ found but it's trashed"), v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("PLCloudPhotoLibraryErrorDomain"), 101, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
  }

}

void __77__PLAssetsdCloudInternalService_fetchShareWithURL_ignoreExistingShare_reply___block_invoke_3(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v7 = a2;
  v5 = a3;
  if (v5)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __77__PLAssetsdCloudInternalService_fetchShareWithURL_ignoreExistingShare_reply___block_invoke_4;
    v8[3] = &unk_1E3676D00;
    v6 = a1[4];
    v9 = a1[5];
    v10 = a1[4];
    v11 = v5;
    v12 = v7;
    v13 = a1[6];
    v14 = a1[7];
    objc_msgSend(v6, "performTransactionAndWait:", v8);

  }
  else
  {
    (*((void (**)(void))a1[7] + 2))();
  }

}

void __77__PLAssetsdCloudInternalService_fetchShareWithURL_ignoreExistingShare_reply___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLShare shareWithUUID:includeTrashed:inManagedObjectContext:](PLShare, "shareWithUUID:includeTrashed:inManagedObjectContext:", v2, 1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ((objc_msgSend(*(id *)(a1 + 48), "isCPLErrorWithCode:", 23) & 1) != 0
     || (objc_msgSend(*(id *)(a1 + 48), "isCPLErrorWithCode:", 26) & 1) != 0
     || objc_msgSend(*(id *)(a1 + 48), "isCPLErrorWithCode:", 25)))
  {
    PLBackendGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = *(_QWORD *)(a1 + 56);
      objc_msgSend(*(id *)(a1 + 64), "pl_redactedShareURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = v6;
      v10 = 2114;
      v11 = v7;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_INFO, "Locally existing share has been deleted on server, marking as trashed locally: %{public}@, shareURL: %{public}@", (uint8_t *)&v8, 0x16u);

    }
    objc_msgSend(v4, "trash");
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

}

void __60__PLAssetsdCloudInternalService_publishShareWithUUID_reply___block_invoke(id *a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  objc_msgSend(a1[5], "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLShare shareWithUUID:includeTrashed:inManagedObjectContext:](PLShare, "shareWithUUID:includeTrashed:inManagedObjectContext:", v2, 0, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __60__PLAssetsdCloudInternalService_publishShareWithUUID_reply___block_invoke_2;
    v12[3] = &unk_1E3668770;
    v13 = a1[4];
    v14 = a1[6];
    objc_msgSend(v4, "publishWithCompletionHandler:", v12);

    v5 = v13;
  }
  else if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __60__PLAssetsdCloudInternalService_publishShareWithUUID_reply___block_invoke_60;
    v9[3] = &unk_1E3668770;
    v10 = a1[4];
    v11 = a1[6];
    objc_msgSend(v4, "publishWithCompletionHandler:", v9);

    v5 = v10;
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Share %@ not found"), a1[4]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("PLCloudPhotoLibraryErrorDomain"), 100, v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(void))a1[6] + 2))();
  }

}

void __60__PLAssetsdCloudInternalService_publishShareWithUUID_reply___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  PLBackendGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v13 = 138543618;
      v14 = v10;
      v15 = 2114;
      v16 = v7;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "Failed to publish moment share uuid: %{public}@ (%{public}@)", (uint8_t *)&v13, 0x16u);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v6, "pl_redactedShareURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v11;
    v15 = 2114;
    v16 = v12;
    _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEFAULT, "Published moment share with uuid: %{public}@, shareURL: %{public}@", (uint8_t *)&v13, 0x16u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __60__PLAssetsdCloudInternalService_publishShareWithUUID_reply___block_invoke_60(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  PLBackendGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v13 = 138543618;
      v14 = v10;
      v15 = 2114;
      v16 = v7;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "Failed to publish library scope uuid: %{public}@ (%{public}@)", (uint8_t *)&v13, 0x16u);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v6, "pl_redactedShareURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v11;
    v15 = 2114;
    v16 = v12;
    _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEFAULT, "Published library scope with uuid: %{public}@, shareURL: %{public}@", (uint8_t *)&v13, 0x16u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __59__PLAssetsdCloudInternalService_getSystemBudgetsWithReply___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a2;
  v8 = v5;
  if (!a3)
  {
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D11330]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "BOOLValue");

    objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D11328]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "BOOLValue");

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

unint64_t __103__PLAssetsdCloudInternalService_cloudSharingSpaceManagementRequestWithType_optionalBytesToPurge_reply___block_invoke(uint64_t a1)
{
  unint64_t result;

  result = +[PLDiskSpaceManagement performCloudSharingSpaceManagementWithBytesToPurge:shouldFreeSpace:shouldKeepRecentlyViewedAssets:fromPhotoLibrary:](PLDiskSpaceManagement, "performCloudSharingSpaceManagementWithBytesToPurge:shouldFreeSpace:shouldKeepRecentlyViewedAssets:fromPhotoLibrary:", *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(unsigned __int8 *)(a1 + 57), *(_QWORD *)(a1 + 32));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __103__PLAssetsdCloudInternalService_cloudSharingSpaceManagementRequestWithType_optionalBytesToPurge_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), 0);
}

@end
