@implementation MCDMusicNowPlayingViewController

+ (id)musicNowPlayingViewController
{
  void *v2;
  objc_class *v3;
  id v4;
  id MCDMusicBundleIdentifier;
  void *v6;
  id v7;
  MCDNowPlayingContentManager *v8;
  MCDNowPlayingDataSource *v9;
  id v10;
  void *v11;
  MCDNowPlayingContentManager *v12;
  MCDUpNextViewController *v13;
  void *v14;
  MCDUpNextViewController *v15;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v18 = 0;
  v19 = &v18;
  v20 = 0x2050000000;
  v2 = (void *)getMCDNowPlayingViewControllerClass_softClass_0;
  v21 = getMCDNowPlayingViewControllerClass_softClass_0;
  if (!getMCDNowPlayingViewControllerClass_softClass_0)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = __getMCDNowPlayingViewControllerClass_block_invoke_0;
    v17[3] = &unk_1339000;
    v17[4] = &v18;
    __getMCDNowPlayingViewControllerClass_block_invoke_0((uint64_t)v17);
    v2 = (void *)v19[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v18, 8);
  v4 = [v3 alloc];
  MCDMusicBundleIdentifier = getMCDMusicBundleIdentifier();
  v6 = (void *)objc_claimAutoreleasedReturnValue(MCDMusicBundleIdentifier);
  v7 = objc_msgSend(v4, "initWithBundleID:appName:", v6, 0);

  v8 = [MCDNowPlayingContentManager alloc];
  v9 = objc_opt_new(MCDNowPlayingDataSource);
  v10 = getMCDMusicBundleIdentifier();
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = -[MCDNowPlayingContentManager initWithDelegate:dataSource:bundleID:](v8, "initWithDelegate:dataSource:bundleID:", v7, v9, v11);

  objc_msgSend(v7, "setContentManager:", v12);
  v13 = [MCDUpNextViewController alloc];
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contentManager"));
  v15 = -[MCDUpNextViewController initWithContentManager:](v13, "initWithContentManager:", v14);
  objc_msgSend(v7, "setPlaybackQueueViewController:", v15);

  objc_msgSend(v7, "setPlayActivityFeatureName:", CFSTR("now_playing"));
  return v7;
}

@end
