@implementation MTUpNextManifest

- (void)_mediaItemDidChange:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", IMAVPlayerNotificationKey_OldMediaItem));

  v5 = v11;
  if (v11)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[MTUpNextManifest currentItem](self, "currentItem"));
    if (v11 != v6)
    {
LABEL_5:

      v5 = v11;
      goto LABEL_6;
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTUpNextManifest playerController](self, "playerController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "upNextController"));
    v9 = objc_msgSend(v8, "count");

    v5 = v11;
    if (v9)
    {
      v6 = (id)objc_claimAutoreleasedReturnValue(-[MTUpNextManifest playerController](self, "playerController"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "upNextController"));
      objc_msgSend(v10, "removeEpisodeAtIndex:", 0);

      goto LABEL_5;
    }
  }
LABEL_6:

}

- (MTUpNextManifest)initWithPlayerController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  MTUpNextManifest *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  -[MTUpNextManifest setPlayerController:](self, "setPlayerController:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "upNextController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "items"));

  v14.receiver = self;
  v14.super_class = (Class)MTUpNextManifest;
  v7 = -[MTItemListManifest initWithItems:](&v14, "initWithItems:", v6);
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v9 = IMAVPlayerNotification_MediaItemDidChange;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "player"));
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, "_mediaItemDidChange:", v9, v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "upNextController"));
    objc_msgSend(v11, "addObserver:selector:name:object:", v7, "_upNextItemsDidChange", CFSTR("MTUpNextControllerItemsDidChange"), v12);

  }
  return v7;
}

- (void)setPlayerController:(id)a3
{
  objc_storeWeak((id *)&self->_playerController, a3);
}

- (void)setCurrentIndex:(unint64_t)a3
{
  unint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  objc_super v14;
  objc_super v15;

  v3 = a3;
  if (a3 && a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTUpNextManifest playerController](self, "playerController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "upNextController"));
    objc_msgSend(v6, "beginUpdates");

    do
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTUpNextManifest playerController](self, "playerController"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "upNextController"));
      objc_msgSend(v8, "removeEpisodeAtIndex:", 0);

      --v3;
    }
    while (v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTUpNextManifest playerController](self, "playerController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "upNextController"));
    objc_msgSend(v10, "endUpdates");

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTUpNextManifest playerController](self, "playerController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "upNextController"));
    if (objc_msgSend(v12, "count"))
      v13 = 0;
    else
      v13 = 0x7FFFFFFFFFFFFFFFLL;

    -[MTUpNextManifest setCurrentIndex:](&v15, "setCurrentIndex:", v13, v14.receiver, v14.super_class, self, MTUpNextManifest);
  }
  else
  {
    -[MTUpNextManifest setCurrentIndex:](&v14, "setCurrentIndex:", a3, self, MTUpNextManifest, v15.receiver, v15.super_class);
  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MTUpNextManifest;
  -[MTUpNextManifest dealloc](&v4, "dealloc");
}

- (BOOL)defaultToInitialIndexZero
{
  return 0;
}

- (void)_upNextItemsDidChange
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000AD99C;
  v2[3] = &unk_1004A6200;
  v2[4] = self;
  +[IMAVPlayer performOnMainQueue:](IMAVPlayer, "performOnMainQueue:", v2);
}

- (void)_updateUpNext
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTUpNextManifest playerController](self, "playerController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "upNextController"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "items"));

  -[MTItemListManifest setItems:](self, "setItems:", v5);
}

- (MTPlayerController)playerController
{
  return (MTPlayerController *)objc_loadWeakRetained((id *)&self->_playerController);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_playerController);
}

@end
