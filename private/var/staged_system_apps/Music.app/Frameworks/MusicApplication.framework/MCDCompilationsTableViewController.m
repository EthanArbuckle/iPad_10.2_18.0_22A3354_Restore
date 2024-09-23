@implementation MCDCompilationsTableViewController

- (MCDCompilationsTableViewController)initWithIdentifier:(id)a3 limitedUI:(BOOL)a4 showLocalContent:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  MCDCompilationsDataSource *v9;
  MCDCompilationsTableViewController *v10;
  objc_super v12;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v9 = -[_MCDLibraryDataSource initWithLimitedUI:]([MCDCompilationsDataSource alloc], "initWithLimitedUI:", v6);
  v12.receiver = self;
  v12.super_class = (Class)MCDCompilationsTableViewController;
  v10 = -[MCDLibraryTableViewController initWithIdentifier:limitedUI:showLocalContent:dataSource:](&v12, "initWithIdentifier:limitedUI:showLocalContent:dataSource:", v8, v6, v5, v9);

  if (v10)
    -[MCDCompilationsTableViewController setPlayActivityFeatureName:](v10, "setPlayActivityFeatureName:", CFSTR("compilations"));
  return v10;
}

- (id)textForHeaderViewInContentManager:(id)a3
{
  id v4;
  uint64_t (*v5)(void);
  uint64_t v6;
  void *v7;
  void *v8;
  _Unwind_Exception *v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void *v15;

  v4 = a3;
  if (-[MCDTableViewController limitedUI](self, "limitedUI"))
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v5 = (uint64_t (*)(void))getMCDCarDisplayBundleSymbolLoc_ptr_3;
    v15 = getMCDCarDisplayBundleSymbolLoc_ptr_3;
    if (!getMCDCarDisplayBundleSymbolLoc_ptr_3)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = __getMCDCarDisplayBundleSymbolLoc_block_invoke_0;
      v11[3] = &unk_1339000;
      v11[4] = &v12;
      __getMCDCarDisplayBundleSymbolLoc_block_invoke_0((uint64_t)v11);
      v5 = (uint64_t (*)(void))v13[3];
    }
    _Block_object_dispose(&v12, 8);
    if (!v5)
    {
      v10 = (_Unwind_Exception *)soft_MCDMusicGeneralLogging_cold_1();
      _Block_object_dispose(&v12, 8);
      _Unwind_Resume(v10);
    }
    v6 = v5();
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("RECENTLY_PLAYED_ALBUMS"), &stru_13E1990, CFSTR("MusicCarDisplayUI")));

  }
  else if (-[MCDLibraryTableViewController showLocalContent](self, "showLocalContent"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString downloadedOnlyMessage](NSString, "downloadedOnlyMessage"));
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)sortingPreferenceKey
{
  return CFSTR("compilationsOnlyAlbumsSortType");
}

- (id)filteringPreferenceKey
{
  return CFSTR("LibraryCompilationsFilterOption");
}

- (id)legacyFilteringPreferenceKey
{
  return CFSTR("compilations");
}

@end
