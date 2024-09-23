@implementation PLAssetsdDiagnosticsService

- (void)setPhotosXPCEndpoint:(id)a3 withReply:(id)a4
{
  id v5;
  void (**v6)(id, uint64_t, _QWORD);
  int v7;
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
  v5 = a3;
  v6 = (void (**)(id, uint64_t, _QWORD))a4;
  v14 = 0u;
  *(_OWORD *)sel = 0u;
  v12 = 0u;
  v7 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v12) = v7;
  if (v7)
  {
    *((_QWORD *)&v12 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: setPhotosXPCEndpoint:withReply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v12 + 1), (os_activity_scope_state_t)((char *)&v14 + 8));
  }
  objc_msgSend(v5, "_endpoint", (_QWORD)v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLAssetsdLibraryManagementService setPhotosXPCEndpoint:](PLAssetsdLibraryManagementService, "setPhotosXPCEndpoint:", v8);

  v6[2](v6, 1, 0);
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

- (void)incompleteRestoreProcessesWithReply:(id)a3
{
  void (**v4)(id, void *);
  int v5;
  id v6;
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
  v4 = (void (**)(id, void *))a3;
  v13 = 0u;
  *(_OWORD *)sel = 0u;
  v11 = 0u;
  v5 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v11) = v5;
  if (v5)
  {
    *((_QWORD *)&v11 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: incompleteRestoreProcessesWithReply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v11 + 1), (os_activity_scope_state_t)((char *)&v13 + 8));
  }
  v6 = -[PLAbstractLibraryServicesManagerService newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", "-[PLAssetsdDiagnosticsService incompleteRestoreProcessesWithReply:]", (_QWORD)v11);
  objc_msgSend(v6, "incompleteRestoreProcesses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v7);

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
      _os_signpost_emit_with_name_impl(&dword_199541000, v9, OS_SIGNPOST_INTERVAL_END, v13, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

@end
