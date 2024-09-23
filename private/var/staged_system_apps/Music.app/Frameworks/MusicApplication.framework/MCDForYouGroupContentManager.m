@implementation MCDForYouGroupContentManager

- (id)_modelRequest
{
  id v3;
  _QWORD *v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  _Unwind_Exception *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v3 = objc_alloc_init((Class)MPModelForYouRecommendationsRequest);
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v4 = (_QWORD *)getMCDMusicCarPlayBundleIdentifierSymbolLoc_ptr;
  v20 = getMCDMusicCarPlayBundleIdentifierSymbolLoc_ptr;
  if (!getMCDMusicCarPlayBundleIdentifierSymbolLoc_ptr)
  {
    v5 = (void *)MusicCarDisplayUILibrary_3();
    v4 = dlsym(v5, "MCDMusicCarPlayBundleIdentifier");
    v18[3] = (uint64_t)v4;
    getMCDMusicCarPlayBundleIdentifierSymbolLoc_ptr = (uint64_t)v4;
  }
  _Block_object_dispose(&v17, 8);
  if (!v4)
  {
    soft_MCDMusicGeneralLogging_cold_1();
LABEL_14:
    soft_MCDMusicGeneralLogging_cold_1();
    goto LABEL_15;
  }
  objc_msgSend(v3, "setClientIdentifier:", *v4, v17);
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v6 = (_QWORD *)getMCDMusicCarPlayVersionSymbolLoc_ptr;
  v20 = getMCDMusicCarPlayVersionSymbolLoc_ptr;
  if (!getMCDMusicCarPlayVersionSymbolLoc_ptr)
  {
    v7 = (void *)MusicCarDisplayUILibrary_3();
    v6 = dlsym(v7, "MCDMusicCarPlayVersion");
    v18[3] = (uint64_t)v6;
    getMCDMusicCarPlayVersionSymbolLoc_ptr = (uint64_t)v6;
  }
  _Block_object_dispose(&v17, 8);
  if (!v6)
    goto LABEL_14;
  objc_msgSend(v3, "setClientVersion:", *v6, v17);
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v8 = (_QWORD *)getMCDMusicCarPlayPlatformIdentifierSymbolLoc_ptr;
  v20 = getMCDMusicCarPlayPlatformIdentifierSymbolLoc_ptr;
  if (!getMCDMusicCarPlayPlatformIdentifierSymbolLoc_ptr)
  {
    v9 = (void *)MusicCarDisplayUILibrary_3();
    v8 = dlsym(v9, "MCDMusicCarPlayPlatformIdentifier");
    v18[3] = (uint64_t)v8;
    getMCDMusicCarPlayPlatformIdentifierSymbolLoc_ptr = (uint64_t)v8;
  }
  _Block_object_dispose(&v17, 8);
  if (!v8)
  {
LABEL_15:
    v16 = (_Unwind_Exception *)soft_MCDMusicGeneralLogging_cold_1();
    _Block_object_dispose(&v17, 8);
    _Unwind_Resume(v16);
  }
  objc_msgSend(v3, "setClientPlatformIdentifier:", *v8, v17);
  objc_msgSend(v3, "setFilteringPolicy:", 1);
  objc_msgSend(v3, "setRequestEndpoint:", 1);
  objc_msgSend(v3, "setAuthenticationOptions:", 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager dataSource](self, "dataSource"));
  v11 = objc_opt_respondsToSelector(v10, "recommendationGroup");

  if ((v11 & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager dataSource](self, "dataSource"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "recommendationGroup"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "loadAdditionalContentURL"));
    objc_msgSend(v3, "setCustomForYouURL:", v14);

  }
  return v3;
}

- (id)itemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager dataSource](self, "dataSource"));
  v6 = objc_opt_respondsToSelector(v5, "recommendationGroup");

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager dataSource](self, "dataSource"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "recommendationGroup"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "itemAtIndex:", objc_msgSend(v4, "row")));

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (int64_t)allowedNumberOfItemsForDisplayWithResponse:(id)a3 inSection:(int64_t)a4
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;
  unsigned int v10;
  int64_t v11;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager dataSource](self, "dataSource", a3, a4));
  v6 = objc_opt_respondsToSelector(v5, "recommendationGroup");

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager dataSource](self, "dataSource"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "recommendationGroup"));
    v9 = objc_msgSend(v8, "numberOfItems");

  }
  else
  {
    v9 = 0;
  }
  v10 = -[MCDFuseContentManager limitedUI](self, "limitedUI");
  v11 = 12;
  if ((uint64_t)v9 < 12)
    v11 = (int64_t)v9;
  if (v10)
    return v11;
  else
    return (int64_t)v9;
}

- (id)transformedResponse:(id)a3
{
  return a3;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

@end
