@implementation MTPlaylistSettingsViewController

- (double)heightForRowWithDescription:(id)a3 inGroupWithIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  double v9;
  double v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("podcasts"));
  if ((_DWORD)v8 && !isTV(v8))
  {
    v10 = 50.0;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)MTPlaylistSettingsViewController;
    -[MTGenericSettingsViewController heightForRowWithDescription:inGroupWithIdentifier:](&v12, "heightForRowWithDescription:inGroupWithIdentifier:", v6, v7);
    v10 = v9;
  }

  return v10;
}

- (MTPlaylistSettingsViewController)initWithPlaylistUuid:(id)a3 library:(id)a4
{
  id v7;
  id v8;
  MTPlaylistSettingsViewController *v9;
  MTPlaylistSettingsViewController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MTPlaylistSettingsViewController;
  v9 = -[MTGenericSettingsViewController init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    v9->_userDriven = 1;
    objc_storeStrong((id *)&v9->_playlistUuid, a3);
    objc_storeStrong((id *)&v10->_library, a4);
  }

  return v10;
}

- (void)viewDidLoad
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTPlaylistSettingsViewController;
  -[MTGenericSettingsViewController viewDidLoad](&v4, "viewDidLoad");
  v3 = -[MTPlaylistSettingsViewController newSettingsController](self, "newSettingsController");
  -[MTGenericSettingsViewController setSettingsController:](self, "setSettingsController:", v3);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTPlaylistSettingsViewController;
  -[MTGenericSettingsViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[MTPlaylistSettingsViewController selectAppearancePathIfNecessary](self, "selectAppearancePathIfNecessary");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTPlaylistSettingsViewController;
  -[MTPlaylistSettingsViewController viewWillTransitionToSize:withTransitionCoordinator:](&v6, "viewWillTransitionToSize:withTransitionCoordinator:", a4, a3.width, a3.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSettingsViewController deleteStationAlertController](self, "deleteStationAlertController"));
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)selectAppearancePathIfNecessary
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSettingsViewController appearanceSelectedPath](self, "appearanceSelectedPath"));

  if (v3)
  {
    -[MTPlaylistSettingsViewController setUserDriven:](self, "setUserDriven:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSettingsViewController tableView](self, "tableView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSettingsViewController appearanceSelectedPath](self, "appearanceSelectedPath"));
    -[MTGenericSettingsViewController tableView:didSelectRowAtIndexPath:](self, "tableView:didSelectRowAtIndexPath:", v4, v5);

    -[MTPlaylistSettingsViewController setUserDriven:](self, "setUserDriven:", 1);
    -[MTPlaylistSettingsViewController setAppearanceSelectedPath:](self, "setAppearanceSelectedPath:", 0);
  }
}

- (BOOL)isPresentedModally
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSettingsViewController presentingViewController](self, "presentingViewController"));
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSettingsViewController navigationController](self, "navigationController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "presentingViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "presentedViewController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSettingsViewController navigationController](self, "navigationController"));
    v4 = v7 == v8;

  }
  return v4;
}

- (void)deletePlaylist:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  char v17;
  id location;
  _QWORD v19[4];
  id v20;
  MTPlaylistSettingsViewController *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mainQueueContext"));

  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_10004681C;
  v27 = sub_100046A84;
  v28 = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000F9F28;
  v19[3] = &unk_1004A6F10;
  v22 = &v23;
  v7 = v6;
  v20 = v7;
  v21 = self;
  objc_msgSend(v7, "performBlockAndWait:", v19);
  LOBYTE(v6) = -[MTPlaylistSettingsViewController isPresentedModally](self, "isPresentedModally");
  objc_initWeak(&location, self);
  v8 = v24[5];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSettingsViewController library](self, "library"));
  v12 = _NSConcreteStackBlock;
  v13 = 3221225472;
  v14 = sub_1000F9F84;
  v15 = &unk_1004AB058;
  v17 = (char)v6;
  objc_copyWeak(&v16, &location);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController controllerForDeletingStation:fromLibrary:deletionCompletion:](UIAlertController, "controllerForDeletingStation:fromLibrary:deletionCompletion:", v8, v9, &v12));
  -[MTPlaylistSettingsViewController setDeleteStationAlertController:](self, "setDeleteStationAlertController:", v10, v12, v13, v14, v15);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSettingsViewController deleteStationAlertController](self, "deleteStationAlertController"));
  -[MTPlaylistSettingsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v23, 8);
}

+ (id)cellClassForSettingType:(int64_t)a3 inGroupWithIdentifier:(id)a4
{
  id v6;
  void *v7;
  id v8;
  __objc2_class *v9;
  id v10;
  uint64_t v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  objc_super v16;

  v6 = a4;
  v7 = v6;
  if (a3 == 5 && (v8 = objc_msgSend(v6, "isEqualToString:", CFSTR("podcasts")), (_DWORD)v8))
  {
    if (isTV(v8))
      v9 = MTPlaylistSettingsPodcastGroupCellTV;
    else
      v9 = MTPlaylistSettingsPodcastGroupCell;
    v12 = (objc_class *)objc_opt_class(v9);
    v13 = NSStringFromClass(v12);
    v11 = objc_claimAutoreleasedReturnValue(v13);
  }
  else
  {
    v16.receiver = a1;
    v16.super_class = (Class)&OBJC_METACLASS___MTPlaylistSettingsViewController;
    v10 = objc_msgSendSuper2(&v16, "cellClassForSettingType:inGroupWithIdentifier:", a3, v7);
    v11 = objc_claimAutoreleasedReturnValue(v10);
  }
  v14 = (void *)v11;

  return v14;
}

- (void)configureCell:(id)a3 atIndexPath:(id)a4 withDescription:(id)a5 inGroupWithIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  objc_super v25;

  v10 = a3;
  v11 = a5;
  v25.receiver = self;
  v25.super_class = (Class)MTPlaylistSettingsViewController;
  v12 = a6;
  -[MTiOSGenericSettingsViewController configureCell:atIndexPath:withDescription:inGroupWithIdentifier:](&v25, "configureCell:atIndexPath:withDescription:inGroupWithIdentifier:", v10, a4, v11, v12);
  LODWORD(a4) = objc_msgSend(v12, "isEqualToString:", CFSTR("podcasts"), v25.receiver, v25.super_class);

  if ((_DWORD)a4 && objc_msgSend(v11, "type") == (id)5)
  {
    v13 = objc_opt_class(MTPlaylistSettingsPodcastGroupCell);
    if ((objc_opt_isKindOfClass(v10, v13) & 1) != 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "artworkView"));
      objc_msgSend(v15, "setArtworkKey:", v14);
    }
    else
    {
      objc_msgSend((id)objc_opt_class(self), "podcastImageSize");
      v17 = v16;
      v19 = v18;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[MTImageStore defaultStore](MTImageStore, "defaultStore"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "imageForKey:size:", v14, v17, v19));

      if (!v15)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[MTImageStore defaultStore](MTImageStore, "defaultStore"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "imageForKey:size:", kMTLibraryDefaultImageKey, v17, v19));

      }
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "imageView"));
      objc_msgSend(v22, "setImage:", v15);

    }
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
  v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("add"));

  if (v24)
    objc_msgSend(v10, "setAccessoryType:", 1);

}

- (id)newSettingsController
{
  void *v3;
  void *v4;
  MTSettingsController *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  MTPlaylistSettingsViewController *v13;
  id v14;
  id v15;
  id location;
  _QWORD v17[3];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mainQueueContext"));

  v5 = objc_alloc_init(MTSettingsController);
  objc_initWeak(&location, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000FA448;
  v11[3] = &unk_1004AB190;
  v7 = v4;
  v12 = v7;
  v13 = self;
  objc_copyWeak(&v15, &location);
  v8 = v6;
  v14 = v8;
  objc_msgSend(v7, "performBlockAndWait:", v11);
  -[MTSettingsController setGroups:](v5, "setGroups:", v8);
  v17[0] = CFSTR("station");
  v17[1] = CFSTR("include");
  v17[2] = CFSTR("podcasts");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v17, 3));
  -[MTSettingsController setOrder:](v5, "setOrder:", v9);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v5;
}

- (id)titleForCurrentPodcasts
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  MTPlaylistSettingsViewController *v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mainOrPrivateContext"));

  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000FB96C;
  v16[3] = &unk_1004A70A0;
  v5 = v4;
  v17 = v5;
  v18 = self;
  v19 = &v30;
  v20 = &v26;
  v21 = &v22;
  objc_msgSend(v5, "performBlockAndWait:", v16);
  if (*((_BYTE *)v31 + 24))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("PODCAST_ALL"), &stru_1004C6D40, 0));
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("%@ of %@"), &stru_1004C6D40, 0));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v27[3]));
    v10 = IMAccessibilityLocalizedNumber(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v23[3]));
    v13 = IMAccessibilityLocalizedNumber(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v6, CFSTR("%@ %@"), 0, v11, v14));

  }
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);

  return v7;
}

- (void)updatePodcastCount
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController settingsController](self, "settingsController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSettingsViewController titleForCurrentPodcasts](self, "titleForCurrentPodcasts"));
  objc_msgSend(v4, "setValue:forSettingWithIdentifier:inGroup:", v3, CFSTR("add"), CFSTR("podcasts"));

}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  char v16;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController settingsController](self, "settingsController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "order"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v5, "section")));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController settingsController](self, "settingsController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "groups"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v8));

  if (objc_msgSend(v8, "isEqualToString:", CFSTR("podcasts")))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "groupSettings"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v5, "row")));

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
    v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("add"));

    v16 = v15 ^ 1;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  if (a4 == 1)
    -[MTPlaylistSettingsViewController removePodcastAtIndex:](self, "removePodcastAtIndex:", (char *)objc_msgSend(a5, "row", a3) - 1);
}

- (void)removePodcastAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id WeakRetained;
  _QWORD v11[4];
  id v12;
  MTPlaylistSettingsViewController *v13;
  unint64_t v14;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mainOrPrivateContext"));

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000FBCFC;
  v11[3] = &unk_1004A6580;
  v12 = v6;
  v13 = self;
  v14 = a3;
  v7 = v6;
  objc_msgSend(v7, "performBlockAndWaitWithSave:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](_TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  objc_msgSend(v8, "setIsPlaylistSyncDirty:", 1);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController settingsController](self, "settingsController"));
  objc_msgSend(v9, "removeSettingAtIndex:fromGroupWithIdentifier:", a3 + 1, CFSTR("podcasts"));

  -[MTPlaylistSettingsViewController updatePodcastCount](self, "updatePodcastCount");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "playlistSettingsDidChangeSetting:", self);

}

- (void)updateShowSetting:(int64_t)a3 forSettings:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id WeakRetained;
  _QWORD v13[4];
  id v14;
  id v15;
  int64_t v16;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mainOrPrivateContext"));

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000FBE9C;
  v13[3] = &unk_1004A6580;
  v14 = v8;
  v15 = v6;
  v16 = a3;
  v9 = v6;
  v10 = v8;
  objc_msgSend(v10, "performBlockAndWaitWithSave:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](_TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  objc_msgSend(v11, "setIsPlaylistSyncDirty:", 1);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "playlistSettingsDidChangeSetting:", self);

}

- (void)updateSetting:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id WeakRetained;
  void **v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  MTPlaylistSettingsViewController *v20;
  id v21;
  id v22;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mainOrPrivateContext"));

  v15 = _NSConcreteStackBlock;
  v16 = 3221225472;
  v17 = sub_1000FC06C;
  v18 = &unk_1004A6C78;
  v19 = v9;
  v20 = self;
  v21 = v7;
  v22 = v6;
  v10 = v6;
  v11 = v7;
  v12 = v9;
  objc_msgSend(v12, "performBlockAndWaitWithSave:", &v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](_TtC18PodcastsFoundation18SyncKeysRepository, "shared", v15, v16, v17, v18));
  objc_msgSend(v13, "setIsPlaylistSyncDirty:", 1);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "playlistSettingsDidChangeSetting:", self);

}

- (void)updateContainerOrder:(int)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id WeakRetained;
  _QWORD v10[4];
  id v11;
  MTPlaylistSettingsViewController *v12;
  int v13;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mainOrPrivateContext"));

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000FC240;
  v10[3] = &unk_1004A76E8;
  v11 = v6;
  v12 = self;
  v13 = a3;
  v7 = v6;
  objc_msgSend(v7, "performBlockAndWaitWithSave:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](_TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  objc_msgSend(v8, "setIsPlaylistSyncDirty:", 1);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "playlistSettingsDidChangeSetting:", self);

}

- (void)showAddPodcastsSheet
{
  NSMutableSet *v3;
  void *v4;
  void *v5;
  id v6;
  NSMutableSet *v7;
  void *v8;
  MTPlaylistSelectPodcastListViewController *v9;
  void *v10;
  MTPlaylistSelectPodcastListViewController *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  MTPlaylistSettingsViewController *v18;
  NSMutableSet *v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v3 = objc_opt_new(NSMutableSet);
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = sub_10004681C;
  v30 = sub_100046A84;
  v31 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mainOrPrivateContext"));

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000FC568;
  v16[3] = &unk_1004AA510;
  v6 = v5;
  v17 = v6;
  v18 = self;
  v20 = &v26;
  v21 = &v22;
  v7 = v3;
  v19 = v7;
  objc_msgSend(v6, "performBlockAndWait:", v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTPodcast sortDescriptorsForAllPodcasts](MTPodcast, "sortDescriptorsForAllPodcasts"));
  v9 = [MTPlaylistSelectPodcastListViewController alloc];
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MTPodcast predicateForNotHiddenNotImplicitlyFollowedPodcasts](MTPodcast, "predicateForNotHiddenNotImplicitlyFollowedPodcasts"));
  v11 = -[MTFetchedTableViewController initWithEntityName:predicate:sortDescriptors:](v9, "initWithEntityName:predicate:sortDescriptors:", kMTPodcastEntityName, v10, v8);

  -[MTPlaylistSelectPodcastListViewController setSaveDelegate:](v11, "setSaveDelegate:", self);
  -[MTPlaylistSelectPodcastListViewController setPlaylistName:](v11, "setPlaylistName:", v27[5]);
  -[MTBasePodcastListViewController setDelegate:](v11, "setDelegate:", self);
  -[MTPlaylistSelectPodcastListViewController setPodcastUuids:](v11, "setPodcastUuids:", v7);
  -[MTPlaylistSelectPodcastListViewController setAllPodcastsSelected:](v11, "setAllPodcastsSelected:", *((unsigned __int8 *)v23 + 24));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSettingsViewController playlistUuid](self, "playlistUuid"));
  -[MTPlaylistSelectPodcastListViewController setPlaylistUuid:](v11, "setPlaylistUuid:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Podcasts Header"), &stru_1004C6D40, 0));
  -[MTPlaylistSelectPodcastListViewController setTitle:](v11, "setTitle:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSettingsViewController navigationController](self, "navigationController"));
  objc_msgSend(v15, "pushViewController:animated:", v11, -[MTPlaylistSettingsViewController userDriven](self, "userDriven"));

  -[MTPlaylistSettingsViewController setAddPodcastsViewController:](self, "setAddPodcastsViewController:", v11);
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);

}

- (void)saveNewPlaylists
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  MTPlaylistSettingsViewController *v8;
  id v9;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mainOrPrivateContext"));

  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000FC7D0;
  v6[3] = &unk_1004A82E8;
  v5 = v4;
  v7 = v5;
  v8 = self;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v5, "performBlock:", v6);
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
}

- (void)sourceList:(id)a3 didSelectItemUuid:(id)a4 atIndexPath:(id)a5
{
  objc_msgSend(self->_addPodcastsViewController, "togglePodcastUuid:", a4);
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  objc_msgSend(a3, "resignFirstResponder");
  return 0;
}

- (void)_updateUngroupedListSetting:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id WeakRetained;
  _QWORD v10[4];
  id v11;
  MTPlaylistSettingsViewController *v12;
  BOOL v13;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mainOrPrivateContext"));

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000FCBE0;
  v10[3] = &unk_1004A7698;
  v11 = v6;
  v12 = self;
  v13 = v3;
  v7 = v6;
  objc_msgSend(v7, "performBlockAndWaitWithSave:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](_TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  objc_msgSend(v8, "setIsPlaylistSyncDirty:", 1);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "playlistSettings:didChangeLayout:", self, !v3);

}

- (id)metricsName
{
  return CFSTR("PlaylistSettings");
}

- (id)metricDataSource
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mainOrPrivateContext"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSettingsViewController playlistUuid](self, "playlistUuid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "playlistForUuid:", v5));

  return v6;
}

- (void)syncControllerOperationCompleted:(id)a3
{
  id v4;

  v4 = -[MTPlaylistSettingsViewController newSettingsController](self, "newSettingsController", a3);
  -[MTGenericSettingsViewController setSettingsController:](self, "setSettingsController:", v4);

}

- (void)updateTitle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  _QWORD v11[4];
  id v12;
  MTPlaylistSettingsViewController *v13;
  id v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mainOrPrivateContext"));

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000FCE38;
  v11[3] = &unk_1004A7398;
  v12 = v6;
  v13 = self;
  v14 = v4;
  v7 = v4;
  v8 = v6;
  objc_msgSend(v8, "performBlockAndWaitWithSave:", v11);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "playlistSettingsDidChangeSetting:", self);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](_TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  objc_msgSend(v10, "setIsPlaylistSyncDirty:", 1);

}

+ (CGSize)podcastImageSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 30.0;
  v3 = 30.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (MTPlaylistSettingsViewControllerDelegate)delegate
{
  return (MTPlaylistSettingsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)playlistUuid
{
  return self->_playlistUuid;
}

- (void)setPlaylistUuid:(id)a3
{
  objc_storeStrong((id *)&self->_playlistUuid, a3);
}

- (id)deletePlaylistBlock
{
  return self->_deletePlaylistBlock;
}

- (void)setDeletePlaylistBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)userDriven
{
  return self->_userDriven;
}

- (void)setUserDriven:(BOOL)a3
{
  self->_userDriven = a3;
}

- (NSIndexPath)appearanceSelectedPath
{
  return self->_appearanceSelectedPath;
}

- (void)setAppearanceSelectedPath:(id)a3
{
  objc_storeStrong((id *)&self->_appearanceSelectedPath, a3);
}

- (MTLibrary)library
{
  return self->_library;
}

- (void)setLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_library, a3);
}

- (id)addPodcastsViewController
{
  return self->_addPodcastsViewController;
}

- (void)setAddPodcastsViewController:(id)a3
{
  objc_storeStrong(&self->_addPodcastsViewController, a3);
}

- (UIAlertController)deleteStationAlertController
{
  return self->_deleteStationAlertController;
}

- (void)setDeleteStationAlertController:(id)a3
{
  objc_storeStrong((id *)&self->_deleteStationAlertController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deleteStationAlertController, 0);
  objc_storeStrong(&self->_addPodcastsViewController, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_appearanceSelectedPath, 0);
  objc_storeStrong(&self->_deletePlaylistBlock, 0);
  objc_storeStrong((id *)&self->_playlistUuid, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
