@implementation MCDFuseTableViewController

- (MCDFuseTableViewController)initWithLimitedUI:(BOOL)a3
{
  MCDFuseTableViewController *v3;
  MCDStorePlaybackManager *v4;
  MCDStorePlaybackManager *playbackManager;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MCDFuseTableViewController;
  v3 = -[MCDTableViewController initWithLimitedUI:](&v7, "initWithLimitedUI:", a3);
  if (v3)
  {
    v4 = -[MCDPlaybackManager initWithDelegate:]([MCDStorePlaybackManager alloc], "initWithDelegate:", v3);
    playbackManager = v3->_playbackManager;
    v3->_playbackManager = v4;

  }
  return v3;
}

- (void)loadContentManager:(id)a3
{
  MCDFuseContentManager *v4;
  MCDFuseContentManager *contentManager;
  id v6;

  v6 = a3;
  v4 = (MCDFuseContentManager *)objc_claimAutoreleasedReturnValue(-[MCDFuseTableViewController _contentManager](self, "_contentManager"));
  contentManager = self->_contentManager;
  self->_contentManager = v4;

  -[MCDFuseTableViewController setCompletionHandler:](self, "setCompletionHandler:", v6);
}

- (void)_limitedUIDidChange
{
  _BOOL8 v3;
  id v4;

  v3 = -[MCDTableViewController limitedUI](self, "limitedUI");
  v4 = (id)objc_claimAutoreleasedReturnValue(-[MCDFuseTableViewController contentManager](self, "contentManager"));
  objc_msgSend(v4, "setLimitedUI:", v3);

}

- (id)_contentManager
{
  return 0;
}

- (void)viewDidLoad
{
  MCDFuseContentManager *v3;
  MCDFuseContentManager *contentManager;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MCDFuseTableViewController;
  -[MCDTableViewController viewDidLoad](&v7, "viewDidLoad");
  if (!self->_contentManager)
  {
    v3 = (MCDFuseContentManager *)objc_claimAutoreleasedReturnValue(-[MCDFuseTableViewController _contentManager](self, "_contentManager"));
    contentManager = self->_contentManager;
    self->_contentManager = v3;

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseTableViewController tableView](self, "tableView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseTableViewController contentManager](self, "contentManager"));
  objc_msgSend(v6, "setTableView:", v5);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MCDFuseTableViewController;
  -[MCDTableViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseTableViewController contentManager](self, "contentManager"));
  objc_msgSend(v4, "displayPlaceholderViewIfNeeded");

}

- (void)setHasLoadedStoreContent:(BOOL)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);

  if (self->_hasLoadedStoreContent != a3)
  {
    self->_hasLoadedStoreContent = a3;
    if (a3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseTableViewController completionHandler](self, "completionHandler"));

      if (v4)
      {
        v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[MCDFuseTableViewController completionHandler](self, "completionHandler"));
        v5[2](v5, 0);

        -[MCDFuseTableViewController setCompletionHandler:](self, "setCompletionHandler:", 0);
      }
    }
  }
}

- (void)playbackManagerShouldShowNowPlaying:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseTableViewController navigationController](self, "navigationController", a3));
  objc_msgSend(v4, "MCD_pushNowPlayingViewControllerAnimated:fromViewController:", 1, self);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseTableViewController contentManager](self, "contentManager"));
  objc_msgSend(v5, "clearActivityIndicatorForSelectedIndexPath");

  v7 = (id)objc_claimAutoreleasedReturnValue(-[MCDFuseTableViewController contentManager](self, "contentManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tableView"));
  objc_msgSend(v6, "reloadData");

}

- (void)playbackManager:(id)a3 shouldShowError:(id)a4
{
  id v6;
  id v7;
  uint64_t (*v8)(void);
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _Unwind_Exception *v19;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  void *v24;

  v6 = a3;
  v7 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v8 = (uint64_t (*)(void))off_1011EC9C8;
  v24 = off_1011EC9C8;
  if (!off_1011EC9C8)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100009F74;
    v20[3] = &unk_1010A89D8;
    v20[4] = &v21;
    sub_100009F74((uint64_t)v20);
    v8 = (uint64_t (*)(void))v22[3];
  }
  _Block_object_dispose(&v21, 8);
  if (!v8)
  {
    v19 = (_Unwind_Exception *)sub_100DE9368();
    _Block_object_dispose(&v21, 8);
    _Unwind_Resume(v19);
  }
  v9 = v8();
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("An Error Occurred"), &stru_101122068, CFSTR("MusicCarDisplayUI")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", 0, v11, 1));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_101122068, 0));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v14, 1, 0));

  objc_msgSend(v12, "addAction:", v15);
  -[MCDFuseTableViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseTableViewController contentManager](self, "contentManager"));
  objc_msgSend(v16, "clearActivityIndicatorForSelectedIndexPath");

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseTableViewController contentManager](self, "contentManager"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "tableView"));
  objc_msgSend(v18, "reloadData");

}

- (void)contentManager:(id)a3 shouldDisplayViewController:(id)a4
{
  id v5;
  _QWORD v6[4];
  id v7;
  MCDFuseTableViewController *v8;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000099F8;
  v6[3] = &unk_1010A89B0;
  v7 = a4;
  v8 = self;
  v5 = v7;
  objc_msgSend(v5, "loadContentManager:", v6);

}

- (BOOL)_contentItemIsPlaying:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  unsigned __int8 v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  char v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  char v38;
  id v39;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MusicCarPlayManager sharedManager](MusicCarPlayManager, "sharedManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "nowPlayingContentManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentPlayingSong"));

  v9 = objc_opt_class(MPModelSong, v8);
  if ((objc_opt_isKindOfClass(v4, v9) & 1) != 0)
  {
    if (!-[MCDTableViewController currentAppIsPlaying](self, "currentAppIsPlaying"))
    {
      v23 = 0;
      v11 = 0;
      v12 = 0;
      goto LABEL_39;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifiers"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifiers"));
  }
  else
  {
    v11 = 0;
    v12 = 0;
  }
  v13 = objc_opt_class(MPModelAlbum, v10);
  if ((objc_opt_isKindOfClass(v4, v13) & 1) != 0)
  {
    if (!-[MCDTableViewController currentAppIsPlaying](self, "currentAppIsPlaying"))
    {
LABEL_15:
      v23 = 0;
      goto LABEL_39;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "album"));
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifiers"));

    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifiers"));
    v11 = (void *)v16;
    v12 = (void *)v17;
  }
  if (!v11 || !v12)
  {
    v24 = objc_opt_class(MPModelPlaylist, v14);
    if ((objc_opt_isKindOfClass(v4, v24) & 1) != 0)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[MusicCarPlayManager sharedManager](MusicCarPlayManager, "sharedManager"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "nowPlayingContentManager"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "currentPlayingPlaylist"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "identifiers"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifiers"));
      v23 = objc_msgSend(v28, "intersectsSet:", v29);

LABEL_37:
      goto LABEL_38;
    }
    goto LABEL_15;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "universalStore"));
  if (!objc_msgSend(v18, "purchasedAdamID"))
  {
    v23 = 0;
    goto LABEL_18;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "universalStore"));
  v20 = objc_msgSend(v19, "purchasedAdamID");

  if (v20)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "universalStore"));
    v21 = objc_msgSend(v18, "purchasedAdamID");
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "universalStore"));
    v23 = v21 == objc_msgSend(v22, "purchasedAdamID");

LABEL_18:
    goto LABEL_20;
  }
  v23 = 0;
LABEL_20:
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "universalStore"));
  if (!objc_msgSend(v30, "subscriptionAdamID"))
  {
LABEL_28:

    goto LABEL_29;
  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "universalStore"));
  v32 = objc_msgSend(v31, "purchasedAdamID");

  if (v32)
    v33 = v23;
  else
    v33 = 1;
  if (v32)
    v23 = 1;
  if ((v33 & 1) == 0)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "universalStore"));
    v34 = objc_msgSend(v30, "subscriptionAdamID");
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "universalStore"));
    v23 = v34 == objc_msgSend(v35, "subscriptionAdamID");

    goto LABEL_28;
  }
LABEL_29:
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "universalStore"));
  if (!objc_msgSend(v25, "adamID"))
  {
LABEL_38:

    goto LABEL_39;
  }
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "universalStore"));
  v37 = objc_msgSend(v36, "adamID");

  if (v37)
    v38 = v23;
  else
    v38 = 1;
  if (v37)
    v23 = 1;
  if ((v38 & 1) == 0)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "universalStore"));
    v39 = objc_msgSend(v25, "adamID");
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "universalStore"));
    v23 = v39 == objc_msgSend(v26, "adamID");
    goto LABEL_37;
  }
LABEL_39:

  return v23;
}

- (BOOL)hasLoadedStoreContent
{
  return self->_hasLoadedStoreContent;
}

- (UIView)MCD_tableView
{
  return self->_MCD_tableView;
}

- (void)setMCD_tableView:(id)a3
{
  objc_storeStrong((id *)&self->_MCD_tableView, a3);
}

- (UIView)placeholderView
{
  return self->_placeholderView;
}

- (void)setPlaceholderView:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderView, a3);
}

- (MPWeakTimer)loadingTimer
{
  return self->_loadingTimer;
}

- (void)setLoadingTimer:(id)a3
{
  objc_storeStrong((id *)&self->_loadingTimer, a3);
}

- (MPModelResponse)recommendationsResponse
{
  return self->_recommendationsResponse;
}

- (void)setRecommendationsResponse:(id)a3
{
  objc_storeStrong((id *)&self->_recommendationsResponse, a3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)networkOffline
{
  return self->_networkOffline;
}

- (void)setNetworkOffline:(BOOL)a3
{
  self->_networkOffline = a3;
}

- (MCDFuseContentManager)contentManager
{
  return self->_contentManager;
}

- (MCDStorePlaybackManager)playbackManager
{
  return self->_playbackManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackManager, 0);
  objc_storeStrong((id *)&self->_contentManager, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_recommendationsResponse, 0);
  objc_storeStrong((id *)&self->_loadingTimer, 0);
  objc_storeStrong((id *)&self->_placeholderView, 0);
  objc_storeStrong((id *)&self->_MCD_tableView, 0);
}

@end
