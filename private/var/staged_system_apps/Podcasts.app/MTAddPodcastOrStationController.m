@implementation MTAddPodcastOrStationController

- (MTAddPodcastOrStationController)init
{
  MTAddPodcastOrStationController *v2;
  MTAddPodcastOrStationController *v3;
  MTAddPodcastOrStationController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTAddPodcastOrStationController;
  v2 = -[MTAddPodcastOrStationController init](&v6, "init");
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (id)plusButtonItem
{
  UIBarButtonItem *plusButtonItem;
  UIBarButtonItem *v4;
  UIBarButtonItem *v5;

  plusButtonItem = self->_plusButtonItem;
  if (!plusButtonItem)
  {
    v4 = (UIBarButtonItem *)objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 4, self, "plusButtonPressed:");
    v5 = self->_plusButtonItem;
    self->_plusButtonItem = v4;

    plusButtonItem = self->_plusButtonItem;
  }
  return plusButtonItem;
}

- (void)plusButtonPressed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[5];
  _QWORD v23[5];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Add Podcast"), &stru_1004C6D40, 0));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Add Station"), &stru_1004C6D40, 0));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_1004C6D40, 0));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0));
  -[MTAddPodcastOrStationController setAlertController:](self, "setAlertController:", v11);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000B57F0;
  v23[3] = &unk_1004A9420;
  v23[4] = self;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v6, 0, v23));
  objc_msgSend(v11, "addAction:", v12);

  if (-[MTAddPodcastOrStationController userHasSomePodcasts](self, "userHasSomePodcasts"))
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000B57F8;
    v22[3] = &unk_1004A9420;
    v22[4] = self;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v8, 0, v22));
    objc_msgSend(v11, "addAction:", v13);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v10, 1, 0));
  objc_msgSend(v11, "addAction:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "popoverPresentationController"));
  objc_msgSend(v15, "setBarButtonItem:", v4);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor appTintColor](UIColor, "appTintColor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "view"));
  objc_msgSend(v17, "setTintColor:", v16);

  objc_msgSend(v11, "setModalPresentationStyle:", 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTAddPodcastOrStationController presentingViewController](self, "presentingViewController"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000B5800;
  v20[3] = &unk_1004A6200;
  v21 = v11;
  v19 = v11;
  objc_msgSend(v18, "presentViewController:animated:completion:", v19, 1, v20);

}

- (void)presentAddPodcastUI
{
  -[MTAddPodcastOrStationController presentAddPodcastUIWithUrl:](self, "presentAddPodcastUIWithUrl:", 0);
}

- (void)presentAddPodcastUIWithUrl:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[6];
  _QWORD v24[4];
  id v25;
  _QWORD *v26;
  _QWORD v27[5];
  id v28;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Add Podcast"), &stru_1004C6D40, 0));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("ADD_PODCAST_MESSAGE"), &stru_1004C6D40, 0));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Follow"), &stru_1004C6D40, 0));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_1004C6D40, 0));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v6, v8, 1));
  -[MTAddPodcastOrStationController setAlertController:](self, "setAlertController:", v13);
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = sub_10004671C;
  v27[4] = sub_100046A04;
  v28 = 0;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000B5B58;
  v24[3] = &unk_1004A96C8;
  v26 = v27;
  v14 = v4;
  v25 = v14;
  objc_msgSend(v13, "addTextFieldWithConfigurationHandler:", v24);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v12, 1, 0));
  objc_msgSend(v13, "addAction:", v15);

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000B5BC8;
  v23[3] = &unk_1004A96F0;
  v23[4] = self;
  v23[5] = v27;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v10, 0, v23));
  objc_msgSend(v13, "addAction:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor appTintColor](UIColor, "appTintColor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "view"));
  objc_msgSend(v18, "setTintColor:", v17);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[MTApplication appController](MTApplication, "appController"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000B5CF4;
  v21[3] = &unk_1004A6640;
  v21[4] = self;
  v20 = v13;
  v22 = v20;
  objc_msgSend(v19, "dismissNowPlayingAnimated:completion:", 1, v21);

  _Block_object_dispose(v27, 8);
}

- (void)performSubscribe:(id)a3
{
  id v3;
  void *v4;
  MTAddPodcastParams *v5;

  v3 = a3;
  v5 = objc_opt_new(MTAddPodcastParams);
  -[MTAddPodcastParams setUrl:](v5, "setUrl:", v3);

  -[MTAddPodcastParams setUserInitiated:](v5, "setUserInitiated:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTSubscriptionManager sharedInstance](MTSubscriptionManager, "sharedInstance"));
  objc_msgSend(v4, "subscribeToPodcastWithParams:", v5);

}

- (void)presentAddStationUI
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[6];
  _QWORD v23[4];
  id v24;
  _QWORD *v25;
  _QWORD v26[5];
  id v27;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("NEW_PLAYLIST_ALERT"), &stru_1004C6D40, 0));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Save Playlist"), &stru_1004C6D40, 0));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_1004C6D40, 0));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("TITLE_PLACEHOLDER"), &stru_1004C6D40, 0));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v4, &stru_1004C6D40, 1));
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = sub_10004671C;
  v26[4] = sub_100046A04;
  v27 = 0;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000B60C4;
  v23[3] = &unk_1004A9718;
  v12 = v10;
  v24 = v12;
  v25 = v26;
  objc_msgSend(v11, "addTextFieldWithConfigurationHandler:", v23);
  v19 = (void *)v4;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v8, 1, 0));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000B610C;
  v22[3] = &unk_1004A96F0;
  v22[4] = self;
  v22[5] = v26;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v6, 0, v22));
  objc_msgSend(v11, "addAction:", v13);
  objc_msgSend(v11, "addAction:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor appTintColor](UIColor, "appTintColor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "view"));
  objc_msgSend(v16, "setTintColor:", v15);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[MTApplication appController](MTApplication, "appController"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000B619C;
  v20[3] = &unk_1004A6640;
  v20[4] = self;
  v18 = v11;
  v21 = v18;
  objc_msgSend(v17, "dismissNowPlayingAnimated:completion:", 1, v20);

  _Block_object_dispose(v26, 8);
}

- (void)presentStationWithTitle:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "length"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTAddPodcastOrStationController createAndSaveStationWithTitle:](self, "createAndSaveStationWithTitle:", v6));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTApplication appController](MTApplication, "appController"));
    objc_msgSend(v5, "presentStation:new:", v4, 1);

  }
}

- (id)createAndSaveStationWithTitle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void **v11;
  uint64_t v12;
  void (*v13)(_QWORD *);
  void *v14;
  id v15;
  id v16;
  uint64_t *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  _QWORD v25[5];
  id v26;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mainOrPrivateContext"));

  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = sub_10004671C;
  v25[4] = sub_100046A04;
  v26 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_10004671C;
  v23 = sub_100046A04;
  v24 = 0;
  v11 = _NSConcreteStackBlock;
  v12 = 3221225472;
  v13 = sub_1000B63DC;
  v14 = &unk_1004A9740;
  v17 = &v19;
  v6 = v5;
  v15 = v6;
  v7 = v3;
  v16 = v7;
  v18 = v25;
  objc_msgSend(v6, "performBlockAndWaitWithSave:", &v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](_TtC18PodcastsFoundation18SyncKeysRepository, "shared", v11, v12, v13, v14));
  objc_msgSend(v8, "setIsPlaylistSyncDirty:", 1);

  v9 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(v25, 8);
  return v9;
}

- (id)presentingViewController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTApplication appController](MTApplication, "appController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "rootViewController"));

  return v3;
}

- (BOOL)userHasSomePodcasts
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  BOOL v9;
  uint64_t v11;

  v2 = objc_alloc((Class)NSFetchRequest);
  v3 = objc_msgSend(v2, "initWithEntityName:", kMTPodcastEntityName);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTPodcast predicateForNotHiddenNotImplicitlyFollowedPodcasts](MTPodcast, "predicateForNotHiddenNotImplicitlyFollowedPodcasts"));
  objc_msgSend(v3, "setPredicate:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mainQueueContext"));
  v11 = 0;
  v7 = objc_msgSend(v6, "countForFetchRequest:error:", v3, &v11);

  v9 = v7 != (id)0x7FFFFFFFFFFFFFFFLL && v7 != 0;
  return v9;
}

- (void)dismissAllModalsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTAddPodcastOrStationController alertController](self, "alertController"));

  if (v5)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[MTAddPodcastOrStationController alertController](self, "alertController"));
    objc_msgSend(v6, "dismissViewControllerAnimated:completion:", v3, 0);

  }
}

- (UIAlertController)alertController
{
  return (UIAlertController *)objc_loadWeakRetained((id *)&self->_alertController);
}

- (void)setAlertController:(id)a3
{
  objc_storeWeak((id *)&self->_alertController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_alertController);
  objc_storeStrong((id *)&self->_plusButtonItem, 0);
}

@end
