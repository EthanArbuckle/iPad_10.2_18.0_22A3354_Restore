@implementation MCDForYouGroupTableViewController

- (MCDForYouGroupTableViewController)initWithLimitedUI:(BOOL)a3 recommendationGroup:(id)a4
{
  _BOOL8 v5;
  id v7;
  MCDForYouGroupTableViewController *v8;
  MCDForYouGroupTableViewController *v9;
  void *v10;
  char *v11;
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
    if (objc_msgSend(v7, "groupType") == &dword_4)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[MusicCarPlayApplicationCapabilitiesController sharedController](MusicCarPlayApplicationCapabilitiesController, "sharedController"));
      v11 = (char *)objc_msgSend(v10, "userSubscriptionState");

      if (v11 == (_BYTE *)&dword_0 + 3)
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
  char isKindOfClass;
  void *v6;
  void *v7;
  uint64_t v8;
  char v9;
  _BOOL4 v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t (*v17)(void);
  uint64_t v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  objc_super v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  void *v30;
  __int128 buf;
  void *(*v32)(uint64_t);
  void *v33;
  uint64_t *v34;

  v26.receiver = self;
  v26.super_class = (Class)MCDForYouGroupTableViewController;
  -[MCDFuseTableViewController viewDidLoad](&v26, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCDForYouGroupTableViewController recommendation](self, "recommendation"));
  v4 = objc_opt_class(MPModelForYouRecommendationGroup);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCDForYouGroupTableViewController recommendation](self, "recommendation"));
  if ((isKindOfClass & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v8 = objc_opt_class(MPModelForYouRecommendationItem);
    v9 = objc_opt_isKindOfClass(v6, v8);

    if ((v9 & 1) != 0)
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCDForYouGroupTableViewController recommendation](self, "recommendation"));
    else
      v7 = 0;
    v6 = 0;
  }
  v10 = objc_msgSend(v6, "groupType") == &dword_4;
  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
  v12 = (void *)v11;
  if (v10)
  {
    if (v11)
    {
LABEL_9:
      -[MCDForYouGroupTableViewController setTitle:](self, "setTitle:", v11);
      goto LABEL_17;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "title"));
    if (v13)
    {
      -[MCDForYouGroupTableViewController setTitle:](self, "setTitle:", v13);
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Recently Played"), &stru_13E1990, 0));
      -[MCDForYouGroupTableViewController setTitle:](self, "setTitle:", v16);

    }
  }
  else
  {
    if (v11)
      goto LABEL_9;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "title"));
    -[MCDForYouGroupTableViewController setTitle:](self, "setTitle:", v14);

  }
LABEL_17:

  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v17 = (uint64_t (*)(void))getMCDMusicGeneralLoggingSymbolLoc_ptr_10;
  v30 = getMCDMusicGeneralLoggingSymbolLoc_ptr_10;
  if (!getMCDMusicGeneralLoggingSymbolLoc_ptr_10)
  {
    *(_QWORD *)&buf = _NSConcreteStackBlock;
    *((_QWORD *)&buf + 1) = 3221225472;
    v32 = __getMCDMusicGeneralLoggingSymbolLoc_block_invoke_3;
    v33 = &unk_1339000;
    v34 = &v27;
    __getMCDMusicGeneralLoggingSymbolLoc_block_invoke_3((uint64_t)&buf);
    v17 = (uint64_t (*)(void))v28[3];
  }
  _Block_object_dispose(&v27, 8);
  if (!v17)
  {
    soft_MCDMusicGeneralLogging_cold_1();
    __break(1u);
  }
  v18 = v17();
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MCDForYouGroupTableViewController title](self, "title"));
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v20;
    _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "Loading For You group view, title: %@", (uint8_t *)&buf, 0xCu);

  }
  objc_initWeak((id *)&buf, self);
  objc_copyWeak(&v25, (id *)&buf);
  v21 = v6;
  v24 = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseTableViewController contentManager](self, "contentManager", _NSConcreteStackBlock, 3221225472, __48__MCDForYouGroupTableViewController_viewDidLoad__block_invoke, &unk_133A090));
  objc_msgSend(v22, "setTableCellConfigurationBlock:", &v23);

  objc_destroyWeak(&v25);
  objc_destroyWeak((id *)&buf);

}

void __48__MCDForYouGroupTableViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id WeakRetained;
  id v13;
  id v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char *v24;
  unsigned int v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;

  v34 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v13 = v10;
  v14 = v9;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "traitCollection"));

  objc_msgSend(v15, "displayScale");
  v17 = v16;

  switch((unint64_t)objc_msgSend(v13, "itemType"))
  {
    case 1uLL:
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "album"));
      v19 = objc_msgSend(v14, "shouldDisplayUtterances");
      if (v19)
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "utterance"));
      else
        v20 = 0;
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "album"));
      objc_msgSend(v34, "configureWithAlbum:utterance:currentlyPlaying:artworkScale:", v18, v20, objc_msgSend(WeakRetained, "_contentItemIsPlaying:", v26), v17);
      goto LABEL_14;
    case 2uLL:
      v24 = (char *)objc_msgSend(*(id *)(a1 + 32), "groupType");
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "playlist"));
      v25 = objc_msgSend(v14, "shouldDisplayUtterances");
      if (v25)
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "utterance"));
      else
        v20 = 0;
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "playlist"));
      objc_msgSend(v34, "configureWithPlaylist:utterance:currentlyPlaying:artworkScale:showCurator:", v18, v20, objc_msgSend(WeakRetained, "_contentItemIsPlaying:", v33), v24 != (_BYTE *)&dword_0 + 1, v17);

      if (!v25)
        goto LABEL_16;
      goto LABEL_15;
    case 3uLL:
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "radioStation"));
      v19 = objc_msgSend(v14, "shouldDisplayUtterances");
      if (v19)
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "utterance"));
      else
        v20 = 0;
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "radioStation"));
      objc_msgSend(v34, "configureWithRadioStation:utterance:currentlyPlaying:artworkScale:", v18, v20, objc_msgSend(WeakRetained, "_contentItemIsPlaying:", v26), v17);
LABEL_14:

      if (v19)
LABEL_15:

      goto LABEL_16;
    case 4uLL:
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "subgroup"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "title"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "textLabel"));
      objc_msgSend(v23, "setText:", v22);

      objc_msgSend(v34, "setAccessoryType:", 1);
      goto LABEL_17;
    default:
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "textLabel"));
      objc_msgSend(v18, "setText:", 0);
LABEL_16:

LABEL_17:
      v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "reason"));
      if (v27)
      {
        v28 = (void *)v27;
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "reason"));
        v30 = objc_msgSend(v29, "length");

        if (v30)
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "reason"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "detailTextLabel"));
          objc_msgSend(v32, "setText:", v31);

        }
      }

      return;
  }
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
  if (objc_msgSend(v6, "itemType") == &dword_4)
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
