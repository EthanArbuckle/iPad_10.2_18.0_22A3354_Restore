@implementation MCDSongsTableViewController

- (MCDSongsTableViewController)initWithIdentifier:(id)a3 limitedUI:(BOOL)a4 showLocalContent:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  MCDSongsDataSource *v9;
  MCDSongsTableViewController *v10;
  objc_super v12;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v9 = -[_MCDLibraryDataSource initWithLimitedUI:]([MCDSongsDataSource alloc], "initWithLimitedUI:", v6);
  v12.receiver = self;
  v12.super_class = (Class)MCDSongsTableViewController;
  v10 = -[MCDLibraryTableViewController initWithIdentifier:limitedUI:showLocalContent:dataSource:](&v12, "initWithIdentifier:limitedUI:showLocalContent:dataSource:", v8, v6, v5, v9);

  if (v10)
    -[MCDSongsTableViewController setPlayActivityFeatureName:](v10, "setPlayActivityFeatureName:", CFSTR("songs"));
  return v10;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id location;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MCDSongsTableViewController;
  -[MCDLibraryTableViewController viewDidLoad](&v8, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController contentManager](self, "contentManager"));
  objc_msgSend(v3, "setShowShuffleAll:", 1);

  objc_initWeak(&location, self);
  objc_copyWeak(&v6, &location);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController contentManager](self, "contentManager", _NSConcreteStackBlock, 3221225472, sub_10000FF6C, &unk_1010A8A18));
  objc_msgSend(v4, "setTableCellConfigurationBlock:", &v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (id)sortingPreferenceKey
{
  return CFSTR("sortSongs");
}

- (id)filteringPreferenceKey
{
  return CFSTR("SongsFilterOption");
}

- (id)legacyFilteringPreferenceKey
{
  return CFSTR("songs");
}

- (id)sectionIndexTitlesForContentManager:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  if (-[MCDTableViewController limitedUI](self, "limitedUI"))
  {
    v5 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastReceivedResponse"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "results"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100010224;
    v11[3] = &unk_1010A8A40;
    v12 = v6;
    v9 = v6;
    objc_msgSend(v8, "enumerateSectionsUsingBlock:", v11);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v9));
  }

  return v5;
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
    v5 = (uint64_t (*)(void))off_1011ECA80;
    v15 = off_1011ECA80;
    if (!off_1011ECA80)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1000103A4;
      v11[3] = &unk_1010A89D8;
      v11[4] = &v12;
      sub_1000103A4((uint64_t)v11);
      v5 = (uint64_t (*)(void))v13[3];
    }
    _Block_object_dispose(&v12, 8);
    if (!v5)
    {
      v10 = (_Unwind_Exception *)sub_100DE9368();
      _Block_object_dispose(&v12, 8);
      _Unwind_Resume(v10);
    }
    v6 = v5();
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("RECENTLY_PLAYED_SONGS"), &stru_101122068, CFSTR("MusicCarDisplayUI")));

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

@end
