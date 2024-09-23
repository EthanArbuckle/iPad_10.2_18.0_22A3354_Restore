@implementation MCDComposersTableViewController

- (MCDComposersTableViewController)initWithIdentifier:(id)a3 limitedUI:(BOOL)a4 showLocalContent:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  MCDComposersDataSource *v9;
  MCDComposersTableViewController *v10;
  objc_super v12;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v9 = -[_MCDLibraryDataSource initWithLimitedUI:]([MCDComposersDataSource alloc], "initWithLimitedUI:", v6);
  v12.receiver = self;
  v12.super_class = (Class)MCDComposersTableViewController;
  v10 = -[MCDLibraryTableViewController initWithIdentifier:limitedUI:showLocalContent:dataSource:](&v12, "initWithIdentifier:limitedUI:showLocalContent:dataSource:", v8, v6, v5, v9);

  if (v10)
    -[MCDComposersTableViewController setPlayActivityFeatureName:](v10, "setPlayActivityFeatureName:", CFSTR("composers"));
  return v10;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MCDComposersTableViewController;
  -[MCDLibraryTableViewController viewDidLoad](&v4, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController contentManager](self, "contentManager"));
  objc_msgSend(v3, "setTableCellConfigurationBlock:", &__block_literal_global_17);

}

void __46__MCDComposersTableViewController_viewDidLoad__block_invoke(id a1, UITableViewCell *a2, MPModelObject *a3, MPModelObject *a4, UITableView *a5, NSIndexPath *a6)
{
  MPModelObject *v8;
  UITableViewCell *v9;
  void *v10;
  id v11;

  v8 = a4;
  v9 = a2;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[UITableView window](a5, "window"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "screen"));
  objc_msgSend(v10, "scale");
  -[UITableViewCell configureWithComposer:currentlyPlaying:artworkScale:](v9, "configureWithComposer:currentlyPlaying:artworkScale:", v8, 0);

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
    v5 = (uint64_t (*)(void))getMCDCarDisplayBundleSymbolLoc_ptr_12;
    v15 = getMCDCarDisplayBundleSymbolLoc_ptr_12;
    if (!getMCDCarDisplayBundleSymbolLoc_ptr_12)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = __getMCDCarDisplayBundleSymbolLoc_block_invoke_7;
      v11[3] = &unk_1339000;
      v11[4] = &v12;
      __getMCDCarDisplayBundleSymbolLoc_block_invoke_7((uint64_t)v11);
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
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("RECENTLY_ADDED_COMPOSERS"), &stru_13E1990, CFSTR("MusicCarDisplayUI")));

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
    v11[2] = __71__MCDComposersTableViewController_sectionIndexTitlesForContentManager___block_invoke;
    v11[3] = &unk_1339190;
    v12 = v6;
    v9 = v6;
    objc_msgSend(v8, "enumerateSectionsUsingBlock:", v11);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v9));
  }

  return v5;
}

void __71__MCDComposersTableViewController_sectionIndexTitlesForContentManager___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "length"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

@end
