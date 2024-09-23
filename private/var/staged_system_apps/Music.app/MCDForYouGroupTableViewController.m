@implementation MCDForYouGroupTableViewController

- (MCDForYouGroupTableViewController)initWithLimitedUI:(BOOL)a3 recommendationGroup:(id)a4
{
  _BOOL8 v5;
  id v7;
  MCDForYouGroupTableViewController *v8;
  MCDForYouGroupTableViewController *v9;
  void *v10;
  id v11;
  const __CFString *v12;
  objc_super v14;

  v5 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MCDForYouGroupTableViewController;
  v8 = -[MCDFuseTableViewController initWithLimitedUI:](&v14, "initWithLimitedUI:", v5);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_recommendation, a4);
    if (objc_msgSend(v7, "groupType") == (id)4)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[MusicCarPlayApplicationCapabilitiesController sharedController](MusicCarPlayApplicationCapabilitiesController, "sharedController"));
      v11 = objc_msgSend(v10, "userSubscriptionState");

      if (v11 == (id)3)
        v12 = CFSTR("play_it_again");
      else
        v12 = CFSTR("recently_played");
    }
    else
    {
      v12 = CFSTR("grouping");
    }
    -[MCDForYouGroupTableViewController setPlayActivityFeatureName:](v9, "setPlayActivityFeatureName:", v12);
  }

  return v9;
}

- (MCDForYouGroupTableViewController)initWithLimitedUI:(BOOL)a3 recommendationItem:(id)a4
{
  _BOOL8 v5;
  id v7;
  MCDForYouGroupTableViewController *v8;
  MCDForYouGroupTableViewController *v9;
  objc_super v11;

  v5 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MCDForYouGroupTableViewController;
  v8 = -[MCDFuseTableViewController initWithLimitedUI:](&v11, "initWithLimitedUI:", v5);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_recommendation, a4);
    -[MCDForYouGroupTableViewController setPlayActivityFeatureName:](v9, "setPlayActivityFeatureName:", CFSTR("grouping"));
  }

  return v9;
}

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char isKindOfClass;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  char v11;
  _BOOL4 v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t (*v19)(void);
  uint64_t v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  objc_super v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  void *v32;
  __int128 buf;
  void *(*v34)(uint64_t);
  void *v35;
  uint64_t *v36;

  v28.receiver = self;
  v28.super_class = (Class)MCDForYouGroupTableViewController;
  -[MCDFuseTableViewController viewDidLoad](&v28, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCDForYouGroupTableViewController recommendation](self, "recommendation"));
  v5 = objc_opt_class(MPModelForYouRecommendationGroup, v4);
  isKindOfClass = objc_opt_isKindOfClass(v3, v5);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCDForYouGroupTableViewController recommendation](self, "recommendation"));
  if ((isKindOfClass & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    v10 = objc_opt_class(MPModelForYouRecommendationItem, v7);
    v11 = objc_opt_isKindOfClass(v8, v10);

    if ((v11 & 1) != 0)
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCDForYouGroupTableViewController recommendation](self, "recommendation"));
    else
      v9 = 0;
    v8 = 0;
  }
  v12 = objc_msgSend(v8, "groupType") == (id)4;
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "title"));
  v14 = (void *)v13;
  if (v12)
  {
    if (v13)
    {
LABEL_9:
      -[MCDForYouGroupTableViewController setTitle:](self, "setTitle:", v13);
      goto LABEL_17;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "title"));
    if (v15)
    {
      -[MCDForYouGroupTableViewController setTitle:](self, "setTitle:", v15);
    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Recently Played"), &stru_101122068, 0));
      -[MCDForYouGroupTableViewController setTitle:](self, "setTitle:", v18);

    }
  }
  else
  {
    if (v13)
      goto LABEL_9;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "title"));
    -[MCDForYouGroupTableViewController setTitle:](self, "setTitle:", v16);

  }
LABEL_17:

  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v19 = (uint64_t (*)(void))off_1011ECA40;
  v32 = off_1011ECA40;
  if (!off_1011ECA40)
  {
    *(_QWORD *)&buf = _NSConcreteStackBlock;
    *((_QWORD *)&buf + 1) = 3221225472;
    v34 = sub_10000DF8C;
    v35 = &unk_1010A89D8;
    v36 = &v29;
    sub_10000DF8C((uint64_t)&buf);
    v19 = (uint64_t (*)(void))v30[3];
  }
  _Block_object_dispose(&v29, 8);
  if (!v19)
  {
    sub_100DE9368();
    __break(1u);
  }
  v20 = v19();
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MCDForYouGroupTableViewController title](self, "title"));
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v22;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Loading For You group view, title: %@", (uint8_t *)&buf, 0xCu);

  }
  objc_initWeak((id *)&buf, self);
  objc_copyWeak(&v27, (id *)&buf);
  v23 = v8;
  v26 = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseTableViewController contentManager](self, "contentManager", _NSConcreteStackBlock, 3221225472, sub_10000DA94, &unk_1010A8B80));
  objc_msgSend(v24, "setTableCellConfigurationBlock:", &v25);

  objc_destroyWeak(&v27);
  objc_destroyWeak((id *)&buf);

}

+ (BOOL)wantsTallCells
{
  return 1;
}

- (id)_contentManager
{
  void *v3;
  void *v4;
  MCDForYouGroupContentManager *v5;
  MCDForYouDataSource *v6;
  void *v7;
  _BOOL8 v8;
  id v9;
  MCDForYouGroupContentManager *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCDForYouGroupTableViewController recommendation](self, "recommendation"));
  v4 = (void *)objc_opt_new(MPMutableSectionedCollection);
  objc_msgSend(v4, "appendSection:", v3);
  v5 = [MCDForYouGroupContentManager alloc];
  v6 = -[MCDForYouDataSource initWithRecommendationGroup:]([MCDForYouDataSource alloc], "initWithRecommendationGroup:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseTableViewController playbackManager](self, "playbackManager"));
  v8 = -[MCDTableViewController limitedUI](self, "limitedUI");
  v9 = objc_msgSend(v4, "copy");
  v10 = -[MCDForYouContentManager initWithDataSource:delegate:viewController:playbackManager:limitedUI:contentResults:](v5, "initWithDataSource:delegate:viewController:playbackManager:limitedUI:contentResults:", v6, self, self, v7, v8, v9);

  return v10;
}

- (id)contentManager:(id)a3 viewControllerForItem:(id)a4 indexPath:(id)a5
{
  id v6;
  MCDForYouGroupTableViewController *v7;
  _BOOL8 v8;
  void *v9;
  MCDForYouGroupTableViewController *v10;

  v6 = a4;
  if (objc_msgSend(v6, "itemType") == (id)4)
  {
    v7 = [MCDForYouGroupTableViewController alloc];
    v8 = -[MCDTableViewController limitedUI](self, "limitedUI");
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subgroup"));
    v10 = -[MCDForYouGroupTableViewController initWithLimitedUI:recommendationGroup:](v7, "initWithLimitedUI:recommendationGroup:", v8, v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (MPModelObject)recommendation
{
  return self->_recommendation;
}

- (void)setRecommendation:(id)a3
{
  objc_storeStrong((id *)&self->_recommendation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recommendation, 0);
}

@end
