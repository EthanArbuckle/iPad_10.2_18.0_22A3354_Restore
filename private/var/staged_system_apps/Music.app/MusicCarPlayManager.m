@implementation MusicCarPlayManager

+ (MusicCarPlayManager)sharedManager
{
  if (qword_1011ECA58 != -1)
    dispatch_once(&qword_1011ECA58, &stru_1010A8BB8);
  return (MusicCarPlayManager *)(id)qword_1011ECA50;
}

- (id)_init
{
  MusicCarPlayManager *v2;
  MusicCarPlayManager *v3;
  NSArray *tabIdentifiers;
  MCDNowPlayingContentManager *v5;
  MCDNowPlayingDataSource *v6;
  id *v7;
  id v8;
  MCDNowPlayingContentManager *v9;
  MCDNowPlayingContentManagerProtocol *nowPlayingContentManager;
  _Unwind_Exception *v12;
  objc_super v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v13.receiver = self;
  v13.super_class = (Class)MusicCarPlayManager;
  v2 = -[MusicCarPlayManager init](&v13, "init");
  v3 = v2;
  if (v2)
  {
    tabIdentifiers = v2->_tabIdentifiers;
    v2->_tabIdentifiers = (NSArray *)&__NSArray0__struct;

    v5 = [MCDNowPlayingContentManager alloc];
    v6 = objc_opt_new(MCDNowPlayingDataSource);
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v7 = (id *)qword_1011ECA60;
    v18 = qword_1011ECA60;
    if (!qword_1011ECA60)
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10000EAA0;
      v14[3] = &unk_1010A89D8;
      v14[4] = &v15;
      sub_10000EAA0((uint64_t)v14);
      v7 = (id *)v16[3];
    }
    _Block_object_dispose(&v15, 8);
    if (!v7)
    {
      v12 = (_Unwind_Exception *)sub_100DE9368();
      _Block_object_dispose(&v15, 8);
      _Unwind_Resume(v12);
    }
    v8 = *v7;
    v9 = -[MCDNowPlayingContentManager initWithDelegate:dataSource:bundleID:](v5, "initWithDelegate:dataSource:bundleID:", 0, v6, v8);
    nowPlayingContentManager = v3->_nowPlayingContentManager;
    v3->_nowPlayingContentManager = (MCDNowPlayingContentManagerProtocol *)v9;

  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[MCDNowPlayingContentManagerProtocol endRequestObservation](self->_nowPlayingContentManager, "endRequestObservation");
  v3.receiver = self;
  v3.super_class = (Class)MusicCarPlayManager;
  -[MusicCarPlayManager dealloc](&v3, "dealloc");
}

- (BOOL)isAttached
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCDRootController carDisplayWindow](self->_carDisplayController, "carDisplayWindow"));
  v3 = v2 != 0;

  return v3;
}

- (BOOL)libraryHasContent
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaLibrary defaultMediaLibrary](MPMediaLibrary, "defaultMediaLibrary"));
  v3 = objc_msgSend(v2, "filterAvailableContentGroups:withOptions:", 128, 0) != 0;

  return v3;
}

- (void)attachToWindow:(id)a3
{
  id v4;
  MCDRootController *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = -[MCDRootController initWithWindow:]([MCDRootController alloc], "initWithWindow:", v4);

  -[MusicCarPlayManager setCarDisplayController:](self, "setCarDisplayController:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MusicCarPlayManager tabIdentifiers](self, "tabIdentifiers"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MusicCarPlayManager carDisplayController](self, "carDisplayController"));
  objc_msgSend(v7, "setTabIdentifiers:", v6);

  v8 = (id)objc_claimAutoreleasedReturnValue(-[MusicCarPlayManager nowPlayingContentManager](self, "nowPlayingContentManager"));
  objc_msgSend(v8, "beginRequestObservation");

}

- (BOOL)detachFromWindow:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MusicCarPlayManager carDisplayController](self, "carDisplayController"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "carDisplayWindow"));

  if (v6 == v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MusicCarPlayManager carDisplayController](self, "carDisplayController"));
    objc_msgSend(v7, "sceneDidDisconnect");

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MusicCarPlayManager nowPlayingContentManager](self, "nowPlayingContentManager"));
    objc_msgSend(v8, "endRequestObservation");

    -[MusicCarPlayManager setCarDisplayController:](self, "setCarDisplayController:", 0);
  }
  return v6 == v4;
}

- (void)showNowPlaying:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[MusicCarPlayManager carDisplayController](self, "carDisplayController"));
  objc_msgSend(v4, "showNowPlaying:", v3);

}

- (void)showSharePlayTogetherSettings
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[MusicCarPlayManager carDisplayController](self, "carDisplayController"));
  objc_msgSend(v2, "showSharePlayTogetherSettings");

}

- (void)setTabIdentifiers:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if (!-[NSArray isEqualToArray:](self->_tabIdentifiers, "isEqualToArray:"))
  {
    objc_storeStrong((id *)&self->_tabIdentifiers, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MusicCarPlayManager carDisplayController](self, "carDisplayController"));
    objc_msgSend(v5, "setTabIdentifiers:", v6);

  }
}

- (void)reloadTabsContent
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[MusicCarPlayManager carDisplayController](self, "carDisplayController"));
  objc_msgSend(v2, "reloadTabsContent");

}

- (NSArray)tabIdentifiers
{
  return self->_tabIdentifiers;
}

- (MCDNowPlayingContentManagerProtocol)nowPlayingContentManager
{
  return self->_nowPlayingContentManager;
}

- (void)setNowPlayingContentManager:(id)a3
{
  objc_storeStrong((id *)&self->_nowPlayingContentManager, a3);
}

- (MCDRootController)carDisplayController
{
  return self->_carDisplayController;
}

- (void)setCarDisplayController:(id)a3
{
  objc_storeStrong((id *)&self->_carDisplayController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carDisplayController, 0);
  objc_storeStrong((id *)&self->_nowPlayingContentManager, 0);
  objc_storeStrong((id *)&self->_tabIdentifiers, 0);
}

@end
