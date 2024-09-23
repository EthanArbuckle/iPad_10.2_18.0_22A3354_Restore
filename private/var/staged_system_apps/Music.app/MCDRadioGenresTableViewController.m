@implementation MCDRadioGenresTableViewController

- (MCDRadioGenresTableViewController)initWithLimitedUI:(BOOL)a3
{
  MCDRadioGenresTableViewController *v3;
  MCDRadioGenresTableViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MCDRadioGenresTableViewController;
  v3 = -[MCDFuseTableViewController initWithLimitedUI:](&v6, "initWithLimitedUI:", a3);
  v4 = v3;
  if (v3)
    -[MCDRadioGenresTableViewController setPlayActivityFeatureName:](v3, "setPlayActivityFeatureName:", CFSTR("all_genres"));
  return v4;
}

- (void)viewDidLoad
{
  uint64_t (*v3)(void);
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _Unwind_Exception *v8;
  objc_super v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void *v14;

  v9.receiver = self;
  v9.super_class = (Class)MCDRadioGenresTableViewController;
  -[MCDContentItemTableViewController viewDidLoad](&v9, "viewDidLoad");
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v3 = (uint64_t (*)(void))off_1011ECF30;
  v14 = off_1011ECF30;
  if (!off_1011ECF30)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10003EA98;
    v10[3] = &unk_1010A89D8;
    v10[4] = &v11;
    sub_10003EA98((uint64_t)v10);
    v3 = (uint64_t (*)(void))v12[3];
  }
  _Block_object_dispose(&v11, 8);
  if (!v3)
  {
    v8 = (_Unwind_Exception *)sub_100DE9368();
    _Block_object_dispose(&v11, 8);
    _Unwind_Resume(v8);
  }
  v4 = v3();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("All Genres"), &stru_101122068, CFSTR("MusicCarDisplayUI")));
  -[MCDRadioGenresTableViewController setTitle:](self, "setTitle:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseTableViewController contentManager](self, "contentManager"));
  objc_msgSend(v7, "setTableCellConfigurationBlock:", &stru_1010A9A60);

}

- (id)contentManager:(id)a3 viewControllerForItem:(id)a4 indexPath:(id)a5
{
  id v6;
  MCDContentItemTableViewController *v7;

  v6 = a4;
  v7 = -[MCDContentItemTableViewController initWithSectionItem:limitedUI:showRankedList:queueListForPlayback:radioDomain:]([MCDContentItemTableViewController alloc], "initWithSectionItem:limitedUI:showRankedList:queueListForPlayback:radioDomain:", v6, -[MCDTableViewController limitedUI](self, "limitedUI"), 0, 0, 1);

  return v7;
}

- (id)_contentManager
{
  MCDRadioGenresContentManager *v3;
  MCDRadioGenresDataSource *v4;
  void *v5;
  MCDRadioGenresContentManager *v6;

  v3 = [MCDRadioGenresContentManager alloc];
  v4 = objc_opt_new(MCDRadioGenresDataSource);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseTableViewController playbackManager](self, "playbackManager"));
  v6 = -[MCDFuseContentManager initWithDataSource:delegate:viewController:playbackManager:limitedUI:](v3, "initWithDataSource:delegate:viewController:playbackManager:limitedUI:", v4, self, self, v5, -[MCDTableViewController limitedUI](self, "limitedUI"));

  return v6;
}

@end
