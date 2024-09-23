@implementation MCDBrowseItemsMusicKitContentManager

- (id)_modelRequest
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  _Unwind_Exception *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v3 = objc_alloc_init((Class)MPModelStoreBrowseRoomRequest);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager dataSource](self, "dataSource"));
  v5 = objc_opt_respondsToSelector(v4, "parentSection");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager dataSource](self, "dataSource"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "parentSection"));
    objc_msgSend(v3, "configureWithParentSection:", v7);

  }
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v8 = (_QWORD *)getMCDMusicCarPlayBundleIdentifierSymbolLoc_ptr_0;
  v19 = getMCDMusicCarPlayBundleIdentifierSymbolLoc_ptr_0;
  if (!getMCDMusicCarPlayBundleIdentifierSymbolLoc_ptr_0)
  {
    v9 = (void *)MusicCarDisplayUILibrary_7();
    v8 = dlsym(v9, "MCDMusicCarPlayBundleIdentifier");
    v17[3] = (uint64_t)v8;
    getMCDMusicCarPlayBundleIdentifierSymbolLoc_ptr_0 = (uint64_t)v8;
  }
  _Block_object_dispose(&v16, 8);
  if (!v8)
  {
    soft_MCDMusicGeneralLogging_cold_1();
LABEL_14:
    soft_MCDMusicGeneralLogging_cold_1();
    goto LABEL_15;
  }
  objc_msgSend(v3, "setClientIdentifier:", *v8, v16);
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v10 = (_QWORD *)getMCDMusicCarPlayVersionSymbolLoc_ptr_0;
  v19 = getMCDMusicCarPlayVersionSymbolLoc_ptr_0;
  if (!getMCDMusicCarPlayVersionSymbolLoc_ptr_0)
  {
    v11 = (void *)MusicCarDisplayUILibrary_7();
    v10 = dlsym(v11, "MCDMusicCarPlayVersion");
    v17[3] = (uint64_t)v10;
    getMCDMusicCarPlayVersionSymbolLoc_ptr_0 = (uint64_t)v10;
  }
  _Block_object_dispose(&v16, 8);
  if (!v10)
    goto LABEL_14;
  objc_msgSend(v3, "setClientVersion:", *v10, v16);
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v12 = (_QWORD *)getMCDMusicCarPlayPlatformIdentifierSymbolLoc_ptr_0;
  v19 = getMCDMusicCarPlayPlatformIdentifierSymbolLoc_ptr_0;
  if (!getMCDMusicCarPlayPlatformIdentifierSymbolLoc_ptr_0)
  {
    v13 = (void *)MusicCarDisplayUILibrary_7();
    v12 = dlsym(v13, "MCDMusicCarPlayPlatformIdentifier");
    v17[3] = (uint64_t)v12;
    getMCDMusicCarPlayPlatformIdentifierSymbolLoc_ptr_0 = (uint64_t)v12;
  }
  _Block_object_dispose(&v16, 8);
  if (!v12)
  {
LABEL_15:
    v15 = (_Unwind_Exception *)soft_MCDMusicGeneralLogging_cold_1();
    _Block_object_dispose(&v16, 8);
    _Unwind_Resume(v15);
  }
  objc_msgSend(v3, "setClientPlatformIdentifier:", *v12, v16);
  objc_msgSend(v3, "setAuthenticationOptions:", 1);
  return v3;
}

@end
