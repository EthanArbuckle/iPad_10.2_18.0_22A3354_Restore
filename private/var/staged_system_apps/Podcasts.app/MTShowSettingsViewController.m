@implementation MTShowSettingsViewController

- (MTShowSettingsViewController)init
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("MTWrongInitializer"), CFSTR("Use -[self init]"), 0));
  objc_exception_throw(v2);
}

- (MTShowSettingsViewController)initWithPodcastUuid:(id)a3
{
  return -[MTShowSettingsViewController initWithPodcastUuid:delegate:](self, "initWithPodcastUuid:delegate:", a3, 0);
}

- (MTShowSettingsViewController)initWithPodcastUuid:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  MTShowSettingsViewController *v9;
  MTShowSettingsViewController *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  MTShowSettingsViewController *v17;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)MTShowSettingsViewController;
  v9 = -[MTGenericSettingsViewController init](&v18, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_uuid, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "mainOrPrivateContext"));

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100066D44;
    v15[3] = &unk_1004A6640;
    v16 = v12;
    v17 = v10;
    v13 = v12;
    objc_msgSend(v13, "performBlockAndWait:", v15);

  }
  return v10;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController defaultsNotifier](self, "defaultsNotifier"));
  objc_msgSend(v3, "stop");

  -[MTShowSettingsViewController setDefaultsNotifier:](self, "setDefaultsNotifier:", 0);
  v4.receiver = self;
  v4.super_class = (Class)MTShowSettingsViewController;
  -[MTGenericSettingsViewController dealloc](&v4, "dealloc");
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTShowSettingsViewController;
  -[MTGenericSettingsViewController viewDidLoad](&v3, "viewDidLoad");
  -[MTShowSettingsViewController setupView](self, "setupView");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)MTShowSettingsViewController;
  v7 = a4;
  -[MTShowSettingsViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100066F10;
  v8[3] = &unk_1004A7508;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, &stru_1004A7548);

}

- (void)setupView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  MTDefaultsChangeNotifier *v7;
  void *v8;
  MTDefaultsChangeNotifier *v9;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  NSMutableArray *v66;
  NSMutableDictionary *v67;
  void *v68;
  MTSettingsController *v69;
  _QWORD v70[5];
  _QWORD v71[5];
  _QWORD v72[5];
  _QWORD v73[5];
  _QWORD v74[5];
  _QWORD v75[5];
  _QWORD v76[4];
  id v77;
  _QWORD v78[4];
  id v79;
  MTShowSettingsViewController *v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t (*v85)(uint64_t, uint64_t);
  void (*v86)(uint64_t);
  id v87;
  id location;
  uint64_t v89;
  void *v90;
  _QWORD v91[2];
  _QWORD v92[4];

  -[MTShowSettingsViewController addPodcastInfoViewHeader](self, "addPodcastInfoViewHeader");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController tableView](self, "tableView"));
  objc_msgSend(v3, "setContentInset:", -0.5, 0.0, 0.0, 0.0);

  objc_initWeak(&location, self);
  v82 = 0;
  v83 = &v82;
  v84 = 0x3032000000;
  v85 = sub_100046604;
  v86 = sub_100046984;
  v87 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mainOrPrivateContext"));

  v78[0] = _NSConcreteStackBlock;
  v78[1] = 3221225472;
  v78[2] = sub_100067B44;
  v78[3] = &unk_1004A6690;
  v79 = v5;
  v80 = self;
  v81 = &v82;
  v65 = v79;
  objc_msgSend(v79, "performBlockAndWait:", v78);
  -[MTShowSettingsViewController setTitle:](self, "setTitle:", v83[5]);
  v92[0] = kMTPodcastDeletePlayedEpisodesDefaultKey;
  v92[1] = kMTPodcastAutoDownloadStateDefaultKey;
  v92[2] = kMTPodcastEpisodeLimitDefaultKey;
  v92[3] = MTPodcastHidesPlayedEpisodesAppWideUserDefaultsKey;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v92, 4));
  v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v6));

  v7 = [MTDefaultsChangeNotifier alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults _applePodcastsFoundationSettingsUserDefaults](NSUserDefaults, "_applePodcastsFoundationSettingsUserDefaults"));
  v9 = -[MTDefaultsChangeNotifier initWithProperties:defaults:](v7, "initWithProperties:defaults:", v68, v8);
  -[MTShowSettingsViewController setDefaultsNotifier:](self, "setDefaultsNotifier:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController defaultsNotifier](self, "defaultsNotifier"));
  v76[0] = _NSConcreteStackBlock;
  v76[1] = 3221225472;
  v76[2] = sub_100067BBC;
  v76[3] = &unk_1004A7598;
  objc_copyWeak(&v77, &location);
  objc_msgSend(v10, "addCallback:", v76);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController defaultsNotifier](self, "defaultsNotifier"));
  objc_msgSend(v11, "start");

  v69 = objc_alloc_init(MTSettingsController);
  v67 = objc_opt_new(NSMutableDictionary);
  v66 = objc_opt_new(NSMutableArray);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Following"), &stru_1004C6D40, 0));
  v75[0] = _NSConcreteStackBlock;
  v75[1] = 3221225472;
  v75[2] = sub_100067C60;
  v75[3] = &unk_1004A63A0;
  v75[4] = self;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MTSetting switchSettingWithTitle:initialValue:identifier:changeHandler:](MTSetting, "switchSettingWithTitle:initialValue:identifier:changeHandler:", v13, 0, CFSTR("subscription"), v75));
  -[MTShowSettingsViewController setSubscribedSetting:](self, "setSubscribedSetting:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("ACCOUNT_NOTIFICATIONS_TITLE"), &stru_1004C6D40, 0));
  v74[0] = _NSConcreteStackBlock;
  v74[1] = 3221225472;
  v74[2] = sub_100067C6C;
  v74[3] = &unk_1004A63A0;
  v74[4] = self;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[MTSetting switchSettingWithTitle:initialValue:identifier:changeHandler:](MTSetting, "switchSettingWithTitle:initialValue:identifier:changeHandler:", v16, 1, CFSTR("notifications"), v74));
  -[MTShowSettingsViewController setNotificationsSetting:](self, "setNotificationsSetting:", v17);

  v73[0] = _NSConcreteStackBlock;
  v73[1] = 3221225472;
  v73[2] = sub_100067C78;
  v73[3] = &unk_1004A75C0;
  v73[4] = self;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[MTRadioGroupDescription radioGroupWithInitialValue:changeHandler:](MTRadioGroupDescription, "radioGroupWithInitialValue:changeHandler:", 0, v73));
  v19 = objc_alloc_init((Class)NSMutableArray);
  if (-[MTShowSettingsViewController isSerialPodcast](self, "isSerialPodcast"))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("SHOW_TYPE_SERIAL"), &stru_1004C6D40, 0));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[MTSetting radioOptionWithTitle:radioGroup:value:identifier:](MTSetting, "radioOptionWithTitle:radioGroup:value:identifier:", v21, v18, 2, CFSTR("showTypeSerial")));

    objc_msgSend(v19, "addObject:", v22);
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("SHOW_TYPE_EPISODIC"), &stru_1004C6D40, 0));
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[MTSetting radioOptionWithTitle:radioGroup:value:identifier:](MTSetting, "radioOptionWithTitle:radioGroup:value:identifier:", v24, v18, 1, CFSTR("showTypeEpisodic")));

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("SHOW_TYPE_OLDEST_TO_NEWEST"), &stru_1004C6D40, 0));
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[MTSetting radioOptionWithTitle:radioGroup:value:identifier:](MTSetting, "radioOptionWithTitle:radioGroup:value:identifier:", v27, v18, 4, CFSTR("showTypeOldestToNewest")));

  v91[0] = v28;
  v91[1] = v25;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v91, 2));
  objc_msgSend(v19, "addObjectsFromArray:", v29);

  -[MTShowSettingsViewController setShowTypeRadioGroup:](self, "setShowTypeRadioGroup:", v18);
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("Episode Order"), &stru_1004C6D40, 0));
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[MTSettingsGroup groupWithTitle:footerText:settings:](MTSettingsGroup, "groupWithTitle:footerText:settings:", v31, 0, v19));
  -[MTShowSettingsViewController setEpisodeOrderSettingsGroup:](self, "setEpisodeOrderSettingsGroup:", v32);

  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("SHOW_SETTINGS_HIDE_PLAYED_EPISODES_TITLE"), &stru_1004C6D40, 0));
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("SHOW_SETTINGS_HIDE_PLAYED_EPISODES_TITLE"), &stru_1004C6D40, 0));
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[MTShowSettingsViewController footerText](MTShowSettingsViewController, "footerText"));
  v72[0] = _NSConcreteStackBlock;
  v72[1] = 3221225472;
  v72[2] = sub_100067C84;
  v72[3] = &unk_1004A75C0;
  v72[4] = self;
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[MTSetting optionSettingWithTitle:headerTitle:footerText:initialValue:optionDescription:identifier:changeHandler:](MTSetting, "optionSettingWithTitle:headerTitle:footerText:initialValue:optionDescription:identifier:changeHandler:", v34, v36, v37, 0, 0, CFSTR("hide-played-episodes"), v72));
  -[MTShowSettingsViewController setHidesPlayedEpisodes:](self, "setHidesPlayedEpisodes:", v38);

  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("SHOW_SETTINGS_EPISODE_DISPLAY_TITLE"), &stru_1004C6D40, 0));
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[MTShowSettingsViewController footerText](MTShowSettingsViewController, "footerText"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController hidesPlayedEpisodes](self, "hidesPlayedEpisodes"));
  v90 = v42;
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v90, 1));
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[MTSettingsGroup groupWithTitle:footerText:settings:](MTSettingsGroup, "groupWithTitle:footerText:settings:", v40, v41, v43));
  -[MTShowSettingsViewController setEpisodeDisplayGroup:](self, "setEpisodeDisplayGroup:", v44);

  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "localizedStringForKey:value:table:", CFSTR("REMOVE_PLAYED_DOWNLOADS"), &stru_1004C6D40, 0));
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "localizedStringForKey:value:table:", CFSTR("REMOVE_PLAYED_DOWNLOADS"), &stru_1004C6D40, 0));
  v71[0] = _NSConcreteStackBlock;
  v71[1] = 3221225472;
  v71[2] = sub_100067C90;
  v71[3] = &unk_1004A75C0;
  v71[4] = self;
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[MTSetting optionSettingWithTitle:headerTitle:footerText:initialValue:optionDescription:identifier:changeHandler:](MTSetting, "optionSettingWithTitle:headerTitle:footerText:initialValue:optionDescription:identifier:changeHandler:", v46, v48, 0, 0, 0, CFSTR("remove-played-downlaods"), v71));
  -[MTShowSettingsViewController setRemovePlayedDownloadsSetting:](self, "setRemovePlayedDownloadsSetting:", v49);

  v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "localizedStringForKey:value:table:", CFSTR("AUTOMATICALLY_DOWNLOAD"), &stru_1004C6D40, 0));
  v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "localizedStringForKey:value:table:", CFSTR("LIMIT_EPISODES_NAVBAR"), &stru_1004C6D40, 0));
  v70[0] = _NSConcreteStackBlock;
  v70[1] = 3221225472;
  v70[2] = sub_100067C9C;
  v70[3] = &unk_1004A75C0;
  v70[4] = self;
  v54 = (void *)objc_claimAutoreleasedReturnValue(+[MTSetting optionSettingWithTitle:headerTitle:footerText:initialValue:optionDescription:identifier:changeHandler:](MTSetting, "optionSettingWithTitle:headerTitle:footerText:initialValue:optionDescription:identifier:changeHandler:", v51, v53, 0, 0, 0, CFSTR("limit-unplayed"), v70));
  -[MTShowSettingsViewController setEpisodesToKeepSetting:](self, "setEpisodesToKeepSetting:", v54);

  v55 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController settingsForDownloadsGroup](self, "settingsForDownloadsGroup"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(+[MTSettingsGroup groupWithTitle:footerText:settings:](MTSettingsGroup, "groupWithTitle:footerText:settings:", 0, 0, v55));
  -[MTShowSettingsViewController setDownloadsSettingsGroup:](self, "setDownloadsSettingsGroup:", v56);

  v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "localizedStringForKey:value:table:", CFSTR("Downloads"), &stru_1004C6D40, 0));
  v59 = objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController episodesToKeepSetting](self, "episodesToKeepSetting"));
  v89 = v59;
  v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v89, 1));
  v61 = (void *)objc_claimAutoreleasedReturnValue(+[MTSettingsGroup groupWithTitle:footerText:settings:](MTSettingsGroup, "groupWithTitle:footerText:settings:", v58, 0, v60));
  -[MTShowSettingsViewController setAutoDownloadsSettingsGroup:](self, "setAutoDownloadsSettingsGroup:", v61);

  -[MTSettingsController setGroups:](v69, "setGroups:", v67);
  -[MTSettingsController setOrder:](v69, "setOrder:", v66);
  -[MTGenericSettingsViewController setSettingsController:](self, "setSettingsController:", v69);
  -[MTShowSettingsViewController refreshSettings](self, "refreshSettings");
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController subscribedSetting](self, "subscribedSetting"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "value"));
  LOBYTE(v59) = objc_msgSend(v63, "BOOLValue");

  if ((v59 & 1) == 0)
  {
    -[MTShowSettingsViewController updateNotificationSettingsToMatchSubscription:](self, "updateNotificationSettingsToMatchSubscription:", 0);
    v64 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController tableView](self, "tableView"));
    objc_msgSend(v64, "reloadData");

  }
  objc_destroyWeak(&v77);

  _Block_object_dispose(&v82, 8);
  objc_destroyWeak(&location);
}

- (id)settingsForShowGroup
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController subscribedSetting](self, "subscribedSetting"));
  v7[0] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController notificationsSetting](self, "notificationsSetting"));
  v7[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v7, 2));

  return v5;
}

- (id)settingsForEpisodesGroup
{
  void *v2;
  void *v3;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController showTypeSetting](self, "showTypeSetting"));
  v5 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1));

  return v3;
}

- (id)settingsForDownloadsGroup
{
  void *v2;
  void *v3;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController removePlayedDownloadsSetting](self, "removePlayedDownloadsSetting"));
  v5 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1));

  return v3;
}

- (void)refreshSettings
{
  void *v3;
  void *v4;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  MTShowSettingsViewController *v33;
  uint64_t *v34;
  uint64_t *v35;
  _QWORD *v36;
  uint64_t *v37;
  uint64_t *v38;
  _QWORD *v39;
  uint64_t *v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD v50[3];
  char v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD v60[3];
  char v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  char v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  char v69;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mainOrPrivateContext"));

  v66 = 0;
  v67 = &v66;
  v68 = 0x2020000000;
  v69 = 0;
  v62 = 0;
  v63 = &v62;
  v64 = 0x2020000000;
  v65 = 0;
  v60[0] = 0;
  v60[1] = v60;
  v60[2] = 0x2020000000;
  v61 = 0;
  v56 = 0;
  v57 = &v56;
  v58 = 0x2020000000;
  v59 = 0;
  v52 = 0;
  v53 = &v52;
  v54 = 0x2020000000;
  v55 = 0;
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x2020000000;
  v51 = 0;
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v49 = 0;
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v45 = 0;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100068304;
  v31[3] = &unk_1004A75E8;
  v5 = v4;
  v32 = v5;
  v33 = self;
  v34 = &v66;
  v35 = &v62;
  v36 = v60;
  v37 = &v56;
  v38 = &v52;
  v39 = v50;
  v40 = &v46;
  v41 = &v42;
  objc_msgSend(v5, "performBlockAndWait:", v31);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *((unsigned __int8 *)v67 + 24)));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController subscribedSetting](self, "subscribedSetting"));
  objc_msgSend(v7, "setValue:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v53[3]));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController episodesToKeepSetting](self, "episodesToKeepSetting"));
  objc_msgSend(v9, "setValue:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController optionsForLimitWithGlobalDefault](self, "optionsForLimitWithGlobalDefault"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController episodesToKeepSetting](self, "episodesToKeepSetting"));
  objc_msgSend(v11, "setOptions:", v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *((unsigned __int8 *)v63 + 24)));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController notificationsSetting](self, "notificationsSetting"));
  objc_msgSend(v13, "setValue:", v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)v43 + 6)));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController hidesPlayedEpisodes](self, "hidesPlayedEpisodes"));
  objc_msgSend(v15, "setValue:", v14);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController optionsForHidesPlayedEpisodes](self, "optionsForHidesPlayedEpisodes"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController hidesPlayedEpisodes](self, "hidesPlayedEpisodes"));
  objc_msgSend(v17, "setOptions:", v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v57[3]));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController removePlayedDownloadsSetting](self, "removePlayedDownloadsSetting"));
  objc_msgSend(v19, "setValue:", v18);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController optionsForDeletePlayedEpisodes](self, "optionsForDeletePlayedEpisodes"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController removePlayedDownloadsSetting](self, "removePlayedDownloadsSetting"));
  objc_msgSend(v21, "setOptions:", v20);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController deletePlayedText:](self, "deletePlayedText:", v57[3]));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_1004C6D40, "stringByAppendingString:", v22));

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[MTSettingsGroup footerAttributedString:](MTSettingsGroup, "footerAttributedString:", v23));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController downloadsSettingsGroup](self, "downloadsSettingsGroup"));
  objc_msgSend(v25, "setGroupFooter:", v24);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController autoDownloadFooterTextWithGlobalLimit](self, "autoDownloadFooterTextWithGlobalLimit"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController autoDownloadsSettingsGroup](self, "autoDownloadsSettingsGroup"));
  objc_msgSend(v27, "setGroupFooter:", v26);

  v28 = v47[3];
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController showTypeRadioGroup](self, "showTypeRadioGroup"));
  objc_msgSend(v29, "setValue:", v28);

  -[MTShowSettingsViewController updateSettings:](self, "updateSettings:", *((unsigned __int8 *)v67 + 24));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController tableView](self, "tableView"));
  objc_msgSend(v30, "reloadData");

  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(v50, 8);
  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(v60, 8);
  _Block_object_dispose(&v62, 8);
  _Block_object_dispose(&v66, 8);

}

- (void)updateSettings:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *v5;
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
  NSMutableDictionary *v16;

  v3 = a3;
  v16 = objc_opt_new(NSMutableDictionary);
  v5 = objc_opt_new(NSMutableArray);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController subscribeFooterText:](self, "subscribeFooterText:", v3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController settingsForShowGroup](self, "settingsForShowGroup"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTSettingsGroup groupWithTitle:footerText:settings:](MTSettingsGroup, "groupWithTitle:footerText:settings:", 0, v6, v7));
  -[MTShowSettingsViewController setShowSettingsGroup:](self, "setShowSettingsGroup:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController showSettingsGroup](self, "showSettingsGroup"));
  -[NSMutableDictionary setObject:forKey:](v16, "setObject:forKey:", v9, CFSTR("showSettings"));

  -[NSMutableArray addObject:](v5, "addObject:", CFSTR("showSettings"));
  if (v3)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController episodeOrderSettingsGroup](self, "episodeOrderSettingsGroup"));
    -[NSMutableDictionary setObject:forKey:](v16, "setObject:forKey:", v10, CFSTR("episodeOrderSettings"));

    -[NSMutableArray addObject:](v5, "addObject:", CFSTR("episodeOrderSettings"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController episodeDisplayGroup](self, "episodeDisplayGroup"));
    -[NSMutableDictionary setObject:forKey:](v16, "setObject:forKey:", v11, CFSTR("episodeDisplayGroup"));

    -[NSMutableArray addObject:](v5, "addObject:", CFSTR("episodeDisplayGroup"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController autoDownloadsSettingsGroup](self, "autoDownloadsSettingsGroup"));
    -[NSMutableDictionary setObject:forKey:](v16, "setObject:forKey:", v12, CFSTR("autoDownloadsSettings"));

    -[NSMutableArray addObject:](v5, "addObject:", CFSTR("autoDownloadsSettings"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController downloadsSettingsGroup](self, "downloadsSettingsGroup"));
    -[NSMutableDictionary setObject:forKey:](v16, "setObject:forKey:", v13, CFSTR("downloadsSettings"));

    -[NSMutableArray addObject:](v5, "addObject:", CFSTR("downloadsSettings"));
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController settingsController](self, "settingsController"));
  objc_msgSend(v14, "setGroups:", v16);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController settingsController](self, "settingsController"));
  objc_msgSend(v15, "setOrder:", v5);

}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return *(double *)&qword_100550870;
}

- (id)headerForOnThisDevice
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  const __CFString *v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("LOCAL_DEVICE_SETTINGS_iPad"), &stru_1004C6D40, 0));
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "model"));

    v7 = objc_msgSend(v4, "rangeOfString:", CFSTR("iPhone"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = v8;
    if (v7 == (id)0x7FFFFFFFFFFFFFFFLL)
      v10 = CFSTR("LOCAL_DEVICE_SETTINGS_iPod");
    else
      v10 = CFSTR("LOCAL_DEVICE_SETTINGS_iPhone");
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_1004C6D40, 0));

  }
  return v5;
}

- (id)subscribeFooterText:(BOOL)a3
{
  id v3;
  void *v4;
  void *v5;

  if (a3)
  {
    v3 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:attributes:", &stru_1004C6D40, 0);
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SETTINGS_FOOTER_UNFOLLOW"), &stru_1004C6D40, 0));

    v3 = (id)objc_claimAutoreleasedReturnValue(+[MTSettingsGroup footerAttributedString:](MTSettingsGroup, "footerAttributedString:", v5));
  }
  return v3;
}

- (id)optionsForLimitWithGlobalDefault
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[12];

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController stringForGlobalDefaultLimit](self, "stringForGlobalDefaultLimit"));
  v30[0] = v29;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("Off"), &stru_1004C6D40, 0));
  v30[1] = v27;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("Latest Episode"), &stru_1004C6D40, 0));
  v30[2] = v25;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("2 Latest Episodes"), &stru_1004C6D40, 0));
  v30[3] = v23;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("3 Latest Episodes"), &stru_1004C6D40, 0));
  v30[4] = v21;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("5 Latest Episodes"), &stru_1004C6D40, 0));
  v30[5] = v19;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("10 Latest Episodes"), &stru_1004C6D40, 0));
  v30[6] = v17;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Last 24 Hours"), &stru_1004C6D40, 0));
  v30[7] = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Last 7 Days"), &stru_1004C6D40, 0));
  v30[8] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Last 14 Days"), &stru_1004C6D40, 0));
  v30[9] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Last 30 Days"), &stru_1004C6D40, 0));
  v30[10] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("All New Episodes"), &stru_1004C6D40, 0));
  v30[11] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v30, 12));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSOrderedSet orderedSetWithArray:](NSOrderedSet, "orderedSetWithArray:", &off_1004D7440));
  v13 = objc_msgSend(v11, "mutableCopy");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MTOptionsDescription optionsWithLongTitles:shortTitles:valueList:footerTextCallback:headerTextCallback:](MTOptionsDescription, "optionsWithLongTitles:shortTitles:valueList:footerTextCallback:headerTextCallback:", v11, v13, v12, 0, &stru_1004A7628));

  return v14;
}

- (id)stringForGlobalDefaultLimit
{
  void *v2;
  const mach_header_64 *v3;
  const __CFString *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults _applePodcastsFoundationSettingsUserDefaults](NSUserDefaults, "_applePodcastsFoundationSettingsUserDefaults"));
  v3 = (const mach_header_64 *)objc_msgSend(v2, "episodeLimitForKey:", kMTPodcastEpisodeLimitDefaultKey);

  switch((unint64_t)v3)
  {
    case 0uLL:
      v4 = CFSTR("All New Episodes");
      break;
    case 1uLL:
      v4 = CFSTR("Latest Episode");
      break;
    case 2uLL:
      v4 = CFSTR("2 Latest Episodes");
      break;
    case 3uLL:
      v4 = CFSTR("3 Latest Episodes");
      break;
    case 4uLL:
      v4 = CFSTR("5 Latest Episodes");
      break;
    case 5uLL:
      v4 = CFSTR("10 Latest Episodes");
      break;
    case 6uLL:
      v4 = CFSTR("Last 24 Hours");
      break;
    case 7uLL:
      v4 = CFSTR("Last 7 Days");
      break;
    case 8uLL:
      v4 = CFSTR("Last 14 Days");
      break;
    case 9uLL:
      v4 = CFSTR("Last 30 Days");
      break;
    default:
      v5 = CFSTR("Default");
      if (v3 != (const mach_header_64 *)((char *)&_mh_execute_header.magic + 1))
        v5 = CFSTR("fell through");
      if (v3 == &_mh_execute_header)
        v4 = CFSTR("Off");
      else
        v4 = v5;
      break;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Default (%@)"), &stru_1004C6D40, 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", v4, &stru_1004C6D40, 0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v9));

  return v10;
}

- (id)optionsForLimitSetting
{
  void *v2;
  void *v3;
  void *v4;
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
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  _QWORD v52[10];
  _QWORD v53[10];

  v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "localizedStringForKey:value:table:", CFSTR("Off"), &stru_1004C6D40, 0));
  v53[0] = v46;
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "localizedStringForKey:value:table:", CFSTR("1 Most Recent"), &stru_1004C6D40, 0));
  v53[1] = v42;
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "localizedStringForKey:value:table:", CFSTR("2 Most Recent"), &stru_1004C6D40, 0));
  v53[2] = v38;
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("3 Most Recent"), &stru_1004C6D40, 0));
  v53[3] = v34;
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("5 Most Recent"), &stru_1004C6D40, 0));
  v53[4] = v30;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("10 Most Recent"), &stru_1004C6D40, 0));
  v53[5] = v27;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("1 Day"), &stru_1004C6D40, 0));
  v53[6] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("1 Week"), &stru_1004C6D40, 0));
  v53[7] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("2 Weeks"), &stru_1004C6D40, 0));
  v53[8] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("1 Month"), &stru_1004C6D40, 0));
  v53[9] = v9;
  v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v53, 10));

  v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "localizedStringForKey:value:table:", CFSTR("Off"), &stru_1004C6D40, 0));
  v52[0] = v47;
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "localizedStringForKey:value:table:", CFSTR("1 Next"), &stru_1004C6D40, 0));
  v52[1] = v43;
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "localizedStringForKey:value:table:", CFSTR("2 Next"), &stru_1004C6D40, 0));
  v52[2] = v39;
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("3 Next"), &stru_1004C6D40, 0));
  v52[3] = v35;
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("5 Next"), &stru_1004C6D40, 0));
  v52[4] = v31;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("10 Next"), &stru_1004C6D40, 0));
  v52[5] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("1 Day"), &stru_1004C6D40, 0));
  v52[6] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("1 Week"), &stru_1004C6D40, 0));
  v52[7] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("2 Weeks"), &stru_1004C6D40, 0));
  v52[8] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("1 Month"), &stru_1004C6D40, 0));
  v52[9] = v18;
  v19 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v52, 10));

  v20 = (void *)v19;
  if (self->_isSerialPodcast)
    v21 = (void *)v19;
  else
    v21 = v50;
  v22 = v21;
  v23 = objc_msgSend(v22, "mutableCopy");
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSOrderedSet orderedSetWithArray:](NSOrderedSet, "orderedSetWithArray:", &off_1004D7458));
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[MTOptionsDescription optionsWithLongTitles:shortTitles:valueList:footerTextCallback:headerTextCallback:](MTOptionsDescription, "optionsWithLongTitles:shortTitles:valueList:footerTextCallback:headerTextCallback:", v22, v23, v24, 0, &stru_1004A7648));

  return v25;
}

- (id)optionsForDeletePlayedEpisodes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[5];
  _QWORD v21[3];

  v21[0] = CFSTR("PLACEHOLDER");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("On"), &stru_1004C6D40, 0));
  v21[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Off"), &stru_1004C6D40, 0));
  v21[2] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 3));
  v8 = objc_msgSend(v7, "mutableCopy");

  v9 = objc_msgSend(v8, "mutableCopy");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSOrderedSet orderedSetWithArray:](NSOrderedSet, "orderedSetWithArray:", &off_1004D7470));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", +[MTPodcast deletePlayedEpisodesDefaultValue](MTPodcast, "deletePlayedEpisodesDefaultValue")));
  v12 = objc_msgSend(v10, "indexOfObject:", v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Default (%@)"), &stru_1004C6D40, 0));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", v12));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, v15));
  objc_msgSend(v8, "setObject:atIndexedSubscript:", v16, 0);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", v12));
  objc_msgSend(v9, "setObject:atIndexedSubscript:", v17, 0);

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100069650;
  v20[3] = &unk_1004A7670;
  v20[4] = self;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[MTOptionsDescription optionsWithLongTitles:shortTitles:valueList:footerTextCallback:headerTextCallback:](MTOptionsDescription, "optionsWithLongTitles:shortTitles:valueList:footerTextCallback:headerTextCallback:", v8, v9, v10, v20, 0));

  return v18;
}

- (id)deletePlayedText:(int64_t)a3
{
  id v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v3 = (id)a3;
  if (a3 == 0xFFFFFFFFLL)
    v3 = +[MTPodcast deletePlayedEpisodesDefaultValue](MTPodcast, "deletePlayedEpisodesDefaultValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = v4;
  if (v3 == (id)1)
    v6 = CFSTR("DELETE_PLAYED_FOOTER_ON");
  else
    v6 = CFSTR("DELETE_PLAYED_FOOTER_OFF");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1004C6D40, 0));

  return v7;
}

- (id)autoDownloadFooterTextWithGlobalLimit
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("CHANGE_FOR_ALL"), &stru_1004C6D40, 0));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("AUTODOWNLOAD_FOOTER_MACOS"), &stru_1004C6D40, 0));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v5, CFSTR("%@"), 0, v3));
  v7 = objc_msgSend(v6, "rangeOfString:", v3);
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", UIApplicationOpenSettingsURLString));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MTSettingsGroup footerAttributedString:additionalAttributeName:additionalAttributeValue:additionalAttributeRange:](MTSettingsGroup, "footerAttributedString:additionalAttributeName:additionalAttributeValue:additionalAttributeRange:", v6, NSLinkAttributeName, v10, v7, v9));

  return v11;
}

- (id)optionsForHidesPlayedEpisodes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[3];

  v20[0] = CFSTR("PLACEHOLDER");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Off"), &stru_1004C6D40, 0));
  v20[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("On"), &stru_1004C6D40, 0));
  v20[2] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 3));
  v7 = objc_msgSend(v6, "mutableCopy");

  v8 = objc_msgSend(v7, "mutableCopy");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSOrderedSet orderedSetWithArray:](NSOrderedSet, "orderedSetWithArray:", &off_1004D7488));
  if (MTPodcastHidesPlayedEpisodesAppWideSetting())
    v10 = 2;
  else
    v10 = 1;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v10));
  v12 = objc_msgSend(v9, "indexOfObject:", v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Default (%@)"), &stru_1004C6D40, 0));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", v12));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, v15));
  objc_msgSend(v7, "setObject:atIndexedSubscript:", v16, 0);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", v12));
  objc_msgSend(v8, "setObject:atIndexedSubscript:", v17, 0);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[MTOptionsDescription optionsWithLongTitles:shortTitles:valueList:footerTextCallback:headerTextCallback:](MTOptionsDescription, "optionsWithLongTitles:shortTitles:valueList:footerTextCallback:headerTextCallback:", v7, v8, v9, 0, 0));
  return v18;
}

- (void)updateEpisodeLimit:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  MTShowSettingsViewController *v11;
  int64_t v12;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mainOrPrivateContext"));

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100069BA0;
  v9[3] = &unk_1004A6580;
  v10 = v6;
  v11 = self;
  v12 = a3;
  v7 = v6;
  objc_msgSend(v7, "performBlockAndWaitWithSave:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController delegate](self, "delegate"));
  objc_msgSend(v8, "showSettings:changedEpisodeLimit:", self, a3);

  -[MTShowSettingsViewController refreshSettings](self, "refreshSettings");
}

- (void)updateRemovePlayedDownloads:(int64_t)a3
{
  void *v5;
  void *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController uuid](self, "uuid"));
  +[MTPodcast setRemovePlayedDownloadsSetting:forPodcastUuid:](MTPodcast, "setRemovePlayedDownloadsSetting:forPodcastUuid:", a3, v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController delegate](self, "delegate"));
  objc_msgSend(v6, "showSettings:changedRemovePlayedDownloads:", self, a3);

  -[MTShowSettingsViewController refreshSettings](self, "refreshSettings");
}

- (void)updateSubscription:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  MTShowSettingsViewController *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[PodcastsStateCoordinator shared](_TtC8Podcasts24PodcastsStateCoordinator, "shared"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController uuid](self, "uuid"));
  if (v3)
  {
    objc_msgSend(v5, "enableSubscriptionOnPodcastUUID:from:", v6, 3);

    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = sub_100046604;
    v20 = sub_100046984;
    v21 = 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mainOrPrivateContext"));

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100069E34;
    v12[3] = &unk_1004A6690;
    v9 = v8;
    v13 = v9;
    v14 = self;
    v15 = &v16;
    objc_msgSend(v9, "performBlockAndWait:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MTStoreReportingController sharedInstance](MTStoreReportingController, "sharedInstance"));
    objc_msgSend(v10, "reportWithType:userInfo:location:reason:", 4, v17[5], CFSTR("psst"), 0);

    _Block_object_dispose(&v16, 8);
  }
  else
  {
    objc_msgSend(v5, "disableSubscriptionOnPodcastUUID:from:", v6, 3);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController delegate](self, "delegate"));
  objc_msgSend(v11, "showSettings:changedSubscribed:", self, v3);

  -[MTShowSettingsViewController updateNotificationSettingsToMatchSubscription:](self, "updateNotificationSettingsToMatchSubscription:", v3);
  -[MTShowSettingsViewController refreshSettings](self, "refreshSettings");
}

- (void)updateNotificationSettingsToMatchSubscription:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController notificationsSetting](self, "notificationsSetting"));
  objc_msgSend(v4, "setEnabled:", v3);

}

- (void)updateNotifications:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  MTShowSettingsViewController *v11;
  BOOL v12;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mainOrPrivateContext"));

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100069FC0;
  v9[3] = &unk_1004A7698;
  v10 = v6;
  v11 = self;
  v12 = v3;
  v7 = v6;
  objc_msgSend(v7, "performBlockAndWaitWithSave:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController delegate](self, "delegate"));
  objc_msgSend(v8, "showSettings:changedNotifications:", self, v3);

  -[MTShowSettingsViewController refreshSettings](self, "refreshSettings");
}

- (void)updateEpisodeOrderSetting:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  MTShowSettingsViewController *v11;
  uint64_t *v12;
  uint64_t *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mainOrPrivateContext"));

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10006A170;
  v9[3] = &unk_1004A76C0;
  v7 = v6;
  v10 = v7;
  v11 = self;
  v12 = &v19;
  v13 = &v15;
  v14 = a3;
  objc_msgSend(v7, "performBlockAndWait:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController delegate](self, "delegate"));
  objc_msgSend(v8, "showSettings:changedShowType:", self, v20[3]);

  if (*((_BYTE *)v16 + 24))
    -[MTShowSettingsViewController refreshSettings](self, "refreshSettings");

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
}

- (void)updateHidePlayedEpisodes:(int)a3
{
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  MTShowSettingsViewController *v10;
  int v11;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mainOrPrivateContext"));

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10006A398;
  v8[3] = &unk_1004A76E8;
  v9 = v6;
  v10 = self;
  v11 = a3;
  v7 = v6;
  objc_msgSend(v7, "performBlockAndWaitWithSave:", v8);

}

- (id)metricsName
{
  return CFSTR("PodcastSettings");
}

- (id)metricDataSource
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mainOrPrivateContext"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController uuid](self, "uuid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "podcastForUuid:", v5));

  return v6;
}

- (void)podcastInfoViewDidExpand:(id)a3
{
  id v4;
  double v5;
  double v6;
  id v7;

  v4 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController tableView](self, "tableView"));
  objc_msgSend(v4, "frame");
  v6 = v5;

  objc_msgSend(v7, "_tableHeaderHeightDidChangeToHeight:", v6);
}

- (void)podcastInfoViewWasTapped:(id)a3
{
  -[MTShowSettingsViewController setDescriptionViewIsExpanded:](self, "setDescriptionViewIsExpanded:", 1);
}

+ (id)footerText
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SETTINGS_APP"), &stru_1004C6D40, 0));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SHOW_SETTINGS_EPISODE_DISPLAY_FOOTER"), &stru_1004C6D40, 0));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v5, CFSTR("%@"), 0, v3));
  v7 = objc_msgSend(v6, "rangeOfString:", v3);
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", UIApplicationOpenSettingsURLString));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MTSettingsGroup footerAttributedString:additionalAttributeName:additionalAttributeValue:additionalAttributeRange:](MTSettingsGroup, "footerAttributedString:additionalAttributeName:additionalAttributeValue:additionalAttributeRange:", v6, NSLinkAttributeName, v10, v7, v9));

  return v11;
}

- (void)syncControllerOperationCompleted:(id)a3
{
  id v4;

  -[MTShowSettingsViewController refreshSettings](self, "refreshSettings", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController tableView](self, "tableView"));
  objc_msgSend(v4, "reloadData");

}

- (MTShowSettingsViewControllerDelegate)delegate
{
  return (MTShowSettingsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)descriptionViewIsExpanded
{
  return self->_descriptionViewIsExpanded;
}

- (void)setDescriptionViewIsExpanded:(BOOL)a3
{
  self->_descriptionViewIsExpanded = a3;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (BOOL)isSerialPodcast
{
  return self->_isSerialPodcast;
}

- (void)setIsSerialPodcast:(BOOL)a3
{
  self->_isSerialPodcast = a3;
}

- (MTSettingsGroup)showSettingsGroup
{
  return self->_showSettingsGroup;
}

- (void)setShowSettingsGroup:(id)a3
{
  objc_storeStrong((id *)&self->_showSettingsGroup, a3);
}

- (MTSetting)subscribedSetting
{
  return self->_subscribedSetting;
}

- (void)setSubscribedSetting:(id)a3
{
  objc_storeStrong((id *)&self->_subscribedSetting, a3);
}

- (MTSetting)notificationsSetting
{
  return self->_notificationsSetting;
}

- (void)setNotificationsSetting:(id)a3
{
  objc_storeStrong((id *)&self->_notificationsSetting, a3);
}

- (MTSettingsGroup)episodeOrderSettingsGroup
{
  return self->_episodeOrderSettingsGroup;
}

- (void)setEpisodeOrderSettingsGroup:(id)a3
{
  objc_storeStrong((id *)&self->_episodeOrderSettingsGroup, a3);
}

- (MTOptionSetting)showTypeSetting
{
  return self->_showTypeSetting;
}

- (void)setShowTypeSetting:(id)a3
{
  objc_storeStrong((id *)&self->_showTypeSetting, a3);
}

- (MTRadioGroupDescription)showTypeRadioGroup
{
  return self->_showTypeRadioGroup;
}

- (void)setShowTypeRadioGroup:(id)a3
{
  objc_storeStrong((id *)&self->_showTypeRadioGroup, a3);
}

- (MTSettingsGroup)episodeDisplayGroup
{
  return self->_episodeDisplayGroup;
}

- (void)setEpisodeDisplayGroup:(id)a3
{
  objc_storeStrong((id *)&self->_episodeDisplayGroup, a3);
}

- (MTOptionSetting)hidesPlayedEpisodes
{
  return self->_hidesPlayedEpisodes;
}

- (void)setHidesPlayedEpisodes:(id)a3
{
  objc_storeStrong((id *)&self->_hidesPlayedEpisodes, a3);
}

- (MTSettingsGroup)downloadsSettingsGroup
{
  return self->_downloadsSettingsGroup;
}

- (void)setDownloadsSettingsGroup:(id)a3
{
  objc_storeStrong((id *)&self->_downloadsSettingsGroup, a3);
}

- (MTSettingsGroup)autoDownloadsSettingsGroup
{
  return self->_autoDownloadsSettingsGroup;
}

- (void)setAutoDownloadsSettingsGroup:(id)a3
{
  objc_storeStrong((id *)&self->_autoDownloadsSettingsGroup, a3);
}

- (MTSetting)downloadSetting
{
  return self->_downloadSetting;
}

- (void)setDownloadSetting:(id)a3
{
  objc_storeStrong((id *)&self->_downloadSetting, a3);
}

- (MTOptionSetting)removePlayedDownloadsSetting
{
  return self->_removePlayedDownloadsSetting;
}

- (void)setRemovePlayedDownloadsSetting:(id)a3
{
  objc_storeStrong((id *)&self->_removePlayedDownloadsSetting, a3);
}

- (MTOptionSetting)episodesToKeepSetting
{
  return self->_episodesToKeepSetting;
}

- (void)setEpisodesToKeepSetting:(id)a3
{
  objc_storeStrong((id *)&self->_episodesToKeepSetting, a3);
}

- (MTDefaultsChangeNotifier)defaultsNotifier
{
  return self->_defaultsNotifier;
}

- (void)setDefaultsNotifier:(id)a3
{
  objc_storeStrong((id *)&self->_defaultsNotifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultsNotifier, 0);
  objc_storeStrong((id *)&self->_episodesToKeepSetting, 0);
  objc_storeStrong((id *)&self->_removePlayedDownloadsSetting, 0);
  objc_storeStrong((id *)&self->_downloadSetting, 0);
  objc_storeStrong((id *)&self->_autoDownloadsSettingsGroup, 0);
  objc_storeStrong((id *)&self->_downloadsSettingsGroup, 0);
  objc_storeStrong((id *)&self->_hidesPlayedEpisodes, 0);
  objc_storeStrong((id *)&self->_episodeDisplayGroup, 0);
  objc_storeStrong((id *)&self->_showTypeRadioGroup, 0);
  objc_storeStrong((id *)&self->_showTypeSetting, 0);
  objc_storeStrong((id *)&self->_episodeOrderSettingsGroup, 0);
  objc_storeStrong((id *)&self->_notificationsSetting, 0);
  objc_storeStrong((id *)&self->_subscribedSetting, 0);
  objc_storeStrong((id *)&self->_showSettingsGroup, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
