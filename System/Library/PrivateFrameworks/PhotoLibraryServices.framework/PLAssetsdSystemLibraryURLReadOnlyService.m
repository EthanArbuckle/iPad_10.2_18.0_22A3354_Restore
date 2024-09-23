@implementation PLAssetsdSystemLibraryURLReadOnlyService

- (PLAssetsdSystemLibraryURLReadOnlyService)initWithConnectionAuthorization:(id)a3
{
  id v5;
  PLAssetsdSystemLibraryURLReadOnlyService *v6;
  PLAssetsdSystemLibraryURLReadOnlyService *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLAssetsdSystemLibraryURLReadOnlyService;
  v6 = -[PLAssetsdSystemLibraryURLReadOnlyService init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_connectionAuthorization, a3);

  return v7;
}

- (void)systemPhotoLibraryURL:(id)a3
{
  void (**v3)(id, void *, _QWORD);
  int v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  const char *Name;
  __int128 v9;
  char v10;
  __int128 v11;
  SEL sel[2];
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void (**)(id, void *, _QWORD))a3;
  v11 = 0u;
  *(_OWORD *)sel = 0u;
  v9 = 0u;
  v4 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v9) = v4;
  if (v4)
  {
    *((_QWORD *)&v9 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: systemPhotoLibraryURL:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v9 + 1), (os_activity_scope_state_t)((char *)&v11 + 8));
  }
  objc_msgSend(MEMORY[0x1E0D73288], "systemLibraryURL", (_QWORD)v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v3[2](v3, v5, 0);

  if (v10)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v11 + 8));
  if ((_QWORD)v11)
  {
    PLRequestGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v14 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v7, OS_SIGNPOST_INTERVAL_END, v11, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionAuthorization, 0);
}

@end
