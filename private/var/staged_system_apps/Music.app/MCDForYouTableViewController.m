@implementation MCDForYouTableViewController

- (MCDForYouTableViewController)initWithLimitedUI:(BOOL)a3
{
  MCDForYouTableViewController *v3;
  MCDForYouTableViewController *v4;
  _TtC5Music22RecentlyPlayedObserver *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MCDForYouTableViewController;
  v3 = -[MCDFuseTableViewController initWithLimitedUI:](&v7, "initWithLimitedUI:", a3);
  v4 = v3;
  if (v3)
  {
    -[MCDForYouTableViewController setPlayActivityFeatureName:](v3, "setPlayActivityFeatureName:", CFSTR("home"));
    v5 = objc_opt_new(_TtC5Music22RecentlyPlayedObserver);
    -[MCDForYouTableViewController setRecentlyPlayedObserver:](v4, "setRecentlyPlayedObserver:", v5);

  }
  return v4;
}

- (void)viewDidLoad
{
  uint64_t (*v3)(void);
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  _Unwind_Exception *v9;
  _QWORD v10[4];
  id v11;
  objc_super v12;
  uint8_t buf[8];
  uint64_t v14;
  void *(*v15)(uint64_t);
  void *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  void *v21;

  v12.receiver = self;
  v12.super_class = (Class)MCDForYouTableViewController;
  -[MCDFuseTableViewController viewDidLoad](&v12, "viewDidLoad");
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v3 = (uint64_t (*)(void))off_1011ECA70;
  v21 = off_1011ECA70;
  if (!off_1011ECA70)
  {
    *(_QWORD *)buf = _NSConcreteStackBlock;
    v14 = 3221225472;
    v15 = sub_10000F370;
    v16 = &unk_1010A89D8;
    v17 = &v18;
    sub_10000F370((uint64_t)buf);
    v3 = (uint64_t (*)(void))v19[3];
  }
  _Block_object_dispose(&v18, 8);
  if (!v3)
  {
    v9 = (_Unwind_Exception *)sub_100DE9368();
    _Block_object_dispose(&v18, 8);
    _Unwind_Resume(v9);
  }
  v4 = v3();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Loading view for For You", buf, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCDForYouTableViewController tableView](self, "tableView"));
  objc_msgSend(v6, "_setHeaderAndFooterViewsFloat:", 0);

  objc_initWeak((id *)buf, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCDForYouTableViewController recentlyPlayedObserver](self, "recentlyPlayedObserver"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000EE00;
  v10[3] = &unk_1010A8BF8;
  objc_copyWeak(&v11, (id *)buf);
  objc_msgSend(v7, "registerHandler:", v10);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseTableViewController contentManager](self, "contentManager"));
  objc_msgSend(v8, "setTableCellConfigurationBlock:", &stru_1010A8C38);

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

- (id)contentManager:(id)a3 viewControllerForItem:(id)a4 indexPath:(id)a5
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  MCDForYouGroupTableViewController *v10;

  v6 = a4;
  v8 = objc_opt_class(MPModelForYouRecommendationGroup, v7);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0)
  {
    v9 = v6;
    v10 = -[MCDForYouGroupTableViewController initWithLimitedUI:recommendationGroup:]([MCDForYouGroupTableViewController alloc], "initWithLimitedUI:recommendationGroup:", -[MCDTableViewController limitedUI](self, "limitedUI"), v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_contentManager
{
  MCDForYouContentManager *v3;
  MCDForYouDataSource *v4;
  void *v5;
  MCDForYouContentManager *v6;

  v3 = [MCDForYouContentManager alloc];
  v4 = -[MCDForYouDataSource initWithRecommendationGroup:]([MCDForYouDataSource alloc], "initWithRecommendationGroup:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseTableViewController playbackManager](self, "playbackManager"));
  v6 = -[MCDFuseContentManager initWithDataSource:delegate:viewController:playbackManager:limitedUI:](v3, "initWithDataSource:delegate:viewController:playbackManager:limitedUI:", v4, self, self, v5, -[MCDTableViewController limitedUI](self, "limitedUI"));

  return v6;
}

- (_TtC5Music22RecentlyPlayedObserver)recentlyPlayedObserver
{
  return self->_recentlyPlayedObserver;
}

- (void)setRecentlyPlayedObserver:(id)a3
{
  objc_storeStrong((id *)&self->_recentlyPlayedObserver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentlyPlayedObserver, 0);
}

@end
