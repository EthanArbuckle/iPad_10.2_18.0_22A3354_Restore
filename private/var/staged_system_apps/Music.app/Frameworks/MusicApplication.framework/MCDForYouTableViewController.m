@implementation MCDForYouTableViewController

- (MCDForYouTableViewController)initWithLimitedUI:(BOOL)a3
{
  MCDForYouTableViewController *v3;
  MCDForYouTableViewController *v4;
  _TtC16MusicApplication22RecentlyPlayedObserver *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MCDForYouTableViewController;
  v3 = -[MCDFuseTableViewController initWithLimitedUI:](&v7, "initWithLimitedUI:", a3);
  v4 = v3;
  if (v3)
  {
    -[MCDForYouTableViewController setPlayActivityFeatureName:](v3, "setPlayActivityFeatureName:", CFSTR("home"));
    v5 = objc_opt_new(_TtC16MusicApplication22RecentlyPlayedObserver);
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
  v3 = (uint64_t (*)(void))getMCDMusicGeneralLoggingSymbolLoc_ptr_2;
  v21 = getMCDMusicGeneralLoggingSymbolLoc_ptr_2;
  if (!getMCDMusicGeneralLoggingSymbolLoc_ptr_2)
  {
    *(_QWORD *)buf = _NSConcreteStackBlock;
    v14 = 3221225472;
    v15 = __getMCDMusicGeneralLoggingSymbolLoc_block_invoke;
    v16 = &unk_1339000;
    v17 = &v18;
    __getMCDMusicGeneralLoggingSymbolLoc_block_invoke((uint64_t)buf);
    v3 = (uint64_t (*)(void))v19[3];
  }
  _Block_object_dispose(&v18, 8);
  if (!v3)
  {
    v9 = (_Unwind_Exception *)soft_MCDMusicGeneralLogging_cold_1();
    _Block_object_dispose(&v18, 8);
    _Unwind_Resume(v9);
  }
  v4 = v3();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Loading view for For You", buf, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCDForYouTableViewController tableView](self, "tableView"));
  objc_msgSend(v6, "_setHeaderAndFooterViewsFloat:", 0);

  objc_initWeak((id *)buf, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCDForYouTableViewController recentlyPlayedObserver](self, "recentlyPlayedObserver"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __43__MCDForYouTableViewController_viewDidLoad__block_invoke;
  v10[3] = &unk_13393D0;
  objc_copyWeak(&v11, (id *)buf);
  objc_msgSend(v7, "registerHandler:", v10);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseTableViewController contentManager](self, "contentManager"));
  objc_msgSend(v8, "setTableCellConfigurationBlock:", &__block_literal_global_4);

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

void __43__MCDForYouTableViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "contentManager"));
  objc_msgSend(v1, "performRefresh");

}

void __43__MCDForYouTableViewController_viewDidLoad__block_invoke_2(id a1, UITableViewCell *a2, MPModelObject *a3, MPModelObject *a4, UITableView *a5, NSIndexPath *a6)
{
  MPModelObject *v9;
  MPModelObject *v10;
  UITableView *v11;
  uint64_t v12;
  MPModelObject *v13;
  MPModelObject *v14;
  uint64_t v15;
  MPModelObject *v16;
  MPModelObject *v17;
  void *v18;
  double v19;
  double v20;
  int *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  MPModelObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  UITableViewCell *v33;

  v33 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = objc_opt_class(MPModelForYouRecommendationGroup);
  if ((objc_opt_isKindOfClass(v10, v12) & 1) != 0)
    v13 = v10;
  else
    v13 = 0;
  v14 = v13;
  v15 = objc_opt_class(MPModelForYouRecommendationItem);
  if ((objc_opt_isKindOfClass(v10, v15) & 1) != 0)
    v16 = v10;
  else
    v16 = 0;
  v17 = v16;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView traitCollection](v11, "traitCollection"));

  objc_msgSend(v18, "displayScale");
  v20 = v19;

  -[UITableViewCell setAccessoryType:](v33, "setAccessoryType:", 0);
  if (v14)
  {
    v21 = (int *)-[MPModelObject groupType](v14, "groupType");
    v22 = objc_claimAutoreleasedReturnValue(-[MPModelObject title](v14, "title"));
    v23 = (void *)v22;
    if (v21 == &dword_4)
    {
      v24 = (void *)v22;
      if (!v22)
      {
        v21 = (int *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("Recently Played"), &stru_13E1990, 0));
      }
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell textLabel](v33, "textLabel"));
      objc_msgSend(v25, "setText:", v24);

      if (!v23)
      {

      }
    }
    else
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell textLabel](v33, "textLabel"));
      objc_msgSend(v29, "setText:", v23);

      -[UITableViewCell setAccessoryType:](v33, "setAccessoryType:", 1);
    }
    v26 = v10;
LABEL_20:
    if ((-[MPModelObject displaysAsGridCellInCarPlay](v26, "displaysAsGridCellInCarPlay") & 1) == 0)
      -[UITableViewCell setAccessoryType:](v33, "setAccessoryType:", 1);
    goto LABEL_35;
  }
  if (!v17)
  {
    v26 = 0;
    goto LABEL_35;
  }
  v26 = v9;
  switch((unint64_t)-[MPModelObject itemType](v17, "itemType"))
  {
    case 1uLL:
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[MPModelObject album](v17, "album"));
      if ((-[MPModelObject shouldDisplayUtterances](v26, "shouldDisplayUtterances") & 1) != 0)
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[MPModelObject utterance](v17, "utterance"));
        -[UITableViewCell configureWithAlbum:utterance:currentlyPlaying:artworkScale:](v33, "configureWithAlbum:utterance:currentlyPlaying:artworkScale:", v27, v28, 0, v20);
        goto LABEL_30;
      }
      -[UITableViewCell configureWithAlbum:utterance:currentlyPlaying:artworkScale:](v33, "configureWithAlbum:utterance:currentlyPlaying:artworkScale:", v27, 0, 0, v20);
      break;
    case 2uLL:
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[MPModelObject playlist](v17, "playlist"));
      if ((-[MPModelObject shouldDisplayUtterances](v26, "shouldDisplayUtterances") & 1) != 0)
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[MPModelObject utterance](v17, "utterance"));
        -[UITableViewCell configureWithPlaylist:utterance:currentlyPlaying:artworkScale:showCurator:](v33, "configureWithPlaylist:utterance:currentlyPlaying:artworkScale:showCurator:", v27, v28, 0, 0, v20);
        goto LABEL_30;
      }
      -[UITableViewCell configureWithPlaylist:utterance:currentlyPlaying:artworkScale:showCurator:](v33, "configureWithPlaylist:utterance:currentlyPlaying:artworkScale:showCurator:", v27, 0, 0, 0, v20);
      break;
    case 3uLL:
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[MPModelObject radioStation](v17, "radioStation"));
      if ((-[MPModelObject shouldDisplayUtterances](v26, "shouldDisplayUtterances") & 1) != 0)
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[MPModelObject utterance](v17, "utterance"));
        -[UITableViewCell configureWithRadioStation:utterance:currentlyPlaying:artworkScale:](v33, "configureWithRadioStation:utterance:currentlyPlaying:artworkScale:", v27, v28, 0, v20);
LABEL_30:

      }
      else
      {
        -[UITableViewCell configureWithRadioStation:utterance:currentlyPlaying:artworkScale:](v33, "configureWithRadioStation:utterance:currentlyPlaying:artworkScale:", v27, 0, 0, v20);
      }
      break;
    case 4uLL:
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[MPModelObject subgroup](v17, "subgroup"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "title"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell textLabel](v33, "textLabel"));
      objc_msgSend(v32, "setText:", v31);

      -[UITableViewCell setAccessoryType:](v33, "setAccessoryType:", 1);
      if (v26)
        goto LABEL_20;
      goto LABEL_35;
    default:
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell textLabel](v33, "textLabel"));
      objc_msgSend(v27, "setText:", 0);
      break;
  }

  if (v26)
    goto LABEL_20;
LABEL_35:

}

- (id)contentManager:(id)a3 viewControllerForItem:(id)a4 indexPath:(id)a5
{
  id v6;
  uint64_t v7;
  id v8;
  MCDForYouGroupTableViewController *v9;

  v6 = a4;
  v7 = objc_opt_class(MPModelForYouRecommendationGroup);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    v8 = v6;
    v9 = -[MCDForYouGroupTableViewController initWithLimitedUI:recommendationGroup:]([MCDForYouGroupTableViewController alloc], "initWithLimitedUI:recommendationGroup:", -[MCDTableViewController limitedUI](self, "limitedUI"), v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
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

- (_TtC16MusicApplication22RecentlyPlayedObserver)recentlyPlayedObserver
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
