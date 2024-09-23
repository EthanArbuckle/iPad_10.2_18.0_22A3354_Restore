@implementation MCDPlaybackManager

- (MCDPlaybackManager)initWithDelegate:(id)a3
{
  id v4;
  MCDPlaybackManager *v5;
  MCDPlaybackManager *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MCDPlaybackManager;
  v5 = -[MCDPlaybackManager init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (void)setupPlaybackRequestWithCompletion:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  v4 = objc_alloc_init((Class)MPCPlayerRequest);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MPAVRoutingController systemRoute](MPAVRoutingController, "systemRoute"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MPCPlayerPath systemMusicPathWithRoute:playerID:](MPCPlayerPath, "systemMusicPathWithRoute:playerID:", v5, CFSTR("Music")));
  objc_msgSend(v4, "setPlayerPath:", v6);

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10003A094;
  v9[3] = &unk_1010A9880;
  v10 = v3;
  v7 = v3;
  v8 = objc_msgSend(v4, "performWithCompletion:", v9);

}

- (void)performPlaybackRequestWithCommand:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003A170;
  v5[3] = &unk_1010A98A8;
  objc_copyWeak(&v6, &location);
  +[MPCPlayerChangeRequest performRequest:completion:](MPCPlayerChangeRequest, "performRequest:completion:", v4, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

- (MCDPlayableDelegate)delegate
{
  return (MCDPlayableDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)localContentOnly
{
  return self->_localContentOnly;
}

- (void)setLocalContentOnly:(BOOL)a3
{
  self->_localContentOnly = a3;
}

- (BOOL)favoriteContentOnly
{
  return self->_favoriteContentOnly;
}

- (void)setFavoriteContentOnly:(BOOL)a3
{
  self->_favoriteContentOnly = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
