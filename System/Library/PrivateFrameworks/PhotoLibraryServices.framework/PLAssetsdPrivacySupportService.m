@implementation PLAssetsdPrivacySupportService

- (PLAssetsdPrivacySupportService)initWithConnectionAuthorization:(id)a3
{
  id v5;
  PLAssetsdPrivacySupportService *v6;
  PLAssetsdPrivacySupportService *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLAssetsdPrivacySupportService;
  v6 = -[PLAssetsdPrivacySupportService init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_connectionAuthorization, a3);

  return v7;
}

- (void)presentLimitedLibraryPickerReprompt:(id)a3
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
    *((_QWORD *)&v12 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: presentLimitedLibraryPickerReprompt:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v12 + 1), (os_activity_scope_state_t)((char *)&v14 + 8));
  }
  -[PLAssetsdConnectionAuthorization trustedCallerDisplayName](self->_connectionAuthorization, "trustedCallerDisplayName", (_QWORD)v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAssetsdConnectionAuthorization trustedCallerPhotoLibraryUsageDescription](self->_connectionAuthorization, "trustedCallerPhotoLibraryUsageDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = PLPresentLimitedLibraryPickerRepromptForApplication();
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
      _os_signpost_emit_with_name_impl(&dword_199541000, v10, OS_SIGNPOST_INTERVAL_END, v14, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)setClientPrivacyOptions:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  int v8;
  uint64_t v9;
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
  v7 = (void (**)(id, _QWORD))a4;
  v17 = 0u;
  *(_OWORD *)sel = 0u;
  v15 = 0u;
  v8 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v15) = v8;
  if (v8)
  {
    *((_QWORD *)&v15 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: setClientPrivacyOptions:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v15 + 1), (os_activity_scope_state_t)((char *)&v17 + 8));
  }
  v9 = *MEMORY[0x1E0D74318];
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D74318], (_QWORD)v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLAssetsdConnectionAuthorization setClientLimitedLibraryCapable:](self->_connectionAuthorization, "setClientLimitedLibraryCapable:", objc_msgSend(v11, "BOOLValue"));

  }
  v7[2](v7, 0);
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
      _os_signpost_emit_with_name_impl(&dword_199541000, v13, OS_SIGNPOST_INTERVAL_END, v17, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionAuthorization, 0);
}

@end
