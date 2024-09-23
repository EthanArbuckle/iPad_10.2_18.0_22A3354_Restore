@implementation MCDGenresViewController

- (MCDGenresViewController)initWithIdentifier:(id)a3 limitedUI:(BOOL)a4 showLocalContent:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  MCDGenresDataSource *v9;
  MCDGenresViewController *v10;
  objc_super v12;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v9 = -[_MCDLibraryDataSource initWithLimitedUI:]([MCDGenresDataSource alloc], "initWithLimitedUI:", v6);
  v12.receiver = self;
  v12.super_class = (Class)MCDGenresViewController;
  v10 = -[MCDLibraryTableViewController initWithIdentifier:limitedUI:showLocalContent:dataSource:](&v12, "initWithIdentifier:limitedUI:showLocalContent:dataSource:", v8, v6, v5, v9);

  if (v10)
    -[MCDGenresViewController setPlayActivityFeatureName:](v10, "setPlayActivityFeatureName:", CFSTR("genres"));
  return v10;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MCDGenresViewController;
  -[MCDLibraryTableViewController viewDidLoad](&v4, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryTableViewController contentManager](self, "contentManager"));
  objc_msgSend(v3, "setTableCellConfigurationBlock:", &stru_1010A91C8);

}

- (id)textForHeaderViewInContentManager:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (-[MCDTableViewController limitedUI](self, "limitedUI", a3))
  {
    v4 = sub_100023AC0();
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("RECENTLY_ADDED_GENRES"), &stru_101122068, CFSTR("MusicCarDisplayUI")));

  }
  else if (-[MCDLibraryTableViewController showLocalContent](self, "showLocalContent"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString downloadedOnlyMessage](NSString, "downloadedOnlyMessage"));
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)contentManager:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  unsigned int v5;
  void *v6;
  id v7;
  void *v8;

  v5 = -[MCDTableViewController limitedUI](self, "limitedUI", a3);
  v6 = 0;
  if (!a4 && v5)
  {
    v7 = sub_100023AC0();
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("RECENTLY_ADDED_GENRES"), &stru_101122068, CFSTR("MusicCarDisplayUI")));

  }
  return v6;
}

@end
