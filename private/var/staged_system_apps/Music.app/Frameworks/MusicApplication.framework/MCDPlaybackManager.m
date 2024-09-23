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
  v9[2] = __57__MCDPlaybackManager_setupPlaybackRequestWithCompletion___block_invoke;
  v9[3] = &unk_1339860;
  v10 = v3;
  v7 = v3;
  v8 = objc_msgSend(v4, "performWithCompletion:", v9);

}

uint64_t __57__MCDPlaybackManager_setupPlaybackRequestWithCompletion___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
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
  v5[2] = __56__MCDPlaybackManager_performPlaybackRequestWithCommand___block_invoke;
  v5[3] = &unk_1339888;
  objc_copyWeak(&v6, &location);
  +[MPCPlayerChangeRequest performRequest:completion:](MPCPlayerChangeRequest, "performRequest:completion:", v4, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

void __56__MCDPlaybackManager_performPlaybackRequestWithCommand___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __56__MCDPlaybackManager_performPlaybackRequestWithCommand___block_invoke_2;
  v5[3] = &unk_1338F48;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

  objc_destroyWeak(&v7);
}

void __56__MCDPlaybackManager_performPlaybackRequestWithCommand___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v9 = WeakRetained;
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "delegate"));
  v5 = (void *)v4;
  if (v3)
  {
    v6 = objc_opt_respondsToSelector(v4, "playbackManager:shouldShowError:");

    if ((v6 & 1) != 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "delegate"));
      objc_msgSend(v7, "playbackManager:shouldShowError:", v9, *(_QWORD *)(a1 + 32));
LABEL_6:

    }
  }
  else
  {
    v8 = objc_opt_respondsToSelector(v4, "playbackManagerShouldShowNowPlaying:");

    if ((v8 & 1) != 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "delegate"));
      objc_msgSend(v7, "playbackManagerShouldShowNowPlaying:", v9);
      goto LABEL_6;
    }
  }

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
