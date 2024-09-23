@implementation TVRMSDAAPControlSession

+ (id)localControlSession
{
  return (id)objc_opt_new();
}

+ (id)proxyControlSession
{
  return (id)objc_opt_new();
}

- (TVRMSDAAPControlSession)init
{
  TVRMSDAAPControlSession *v2;
  uint64_t v3;
  TVRMSDAAPRequestManager *requestManager;
  TVRMSDAAPLoginManager *v5;
  TVRMSDAAPLoginManager *loginManager;
  TVRMSDAAPNowPlayingManager *v7;
  TVRMSDAAPNowPlayingManager *nowPlayingManager;
  TVRMSDAAPTouchRemoteManager *v9;
  TVRMSDAAPTouchRemoteManager *touchRemoteManager;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TVRMSDAAPControlSession;
  v2 = -[TVRMSDAAPControlSession init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    requestManager = v2->_requestManager;
    v2->_requestManager = (TVRMSDAAPRequestManager *)v3;

    -[TVRMSDAAPRequestManager setDelegate:](v2->_requestManager, "setDelegate:", v2);
    v5 = -[TVRMSDAAPLoginManager initWithRequestManager:]([TVRMSDAAPLoginManager alloc], "initWithRequestManager:", v2->_requestManager);
    loginManager = v2->_loginManager;
    v2->_loginManager = v5;

    v7 = -[TVRMSDAAPNowPlayingManager initWithRequestManager:]([TVRMSDAAPNowPlayingManager alloc], "initWithRequestManager:", v2->_requestManager);
    nowPlayingManager = v2->_nowPlayingManager;
    v2->_nowPlayingManager = v7;

    -[TVRMSDAAPNowPlayingManager setDelegate:](v2->_nowPlayingManager, "setDelegate:", v2);
    v9 = -[TVRMSDAAPTouchRemoteManager initWithRequestManager:]([TVRMSDAAPTouchRemoteManager alloc], "initWithRequestManager:", v2->_requestManager);
    touchRemoteManager = v2->_touchRemoteManager;
    v2->_touchRemoteManager = v9;

    -[TVRMSDAAPTouchRemoteManager setDelegate:](v2->_touchRemoteManager, "setDelegate:", v2);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[TVRMSDAAPNowPlayingManager endObservingNowPlaying](self->_nowPlayingManager, "endObservingNowPlaying");
  v3.receiver = self;
  v3.super_class = (Class)TVRMSDAAPControlSession;
  -[TVRMSDAAPControlSession dealloc](&v3, sel_dealloc);
}

- (void)connectToService:(id)a3 pairingGUID:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  TVRMSDAAPRequestManager *requestManager;
  void *v13;
  TVRMSDAAPRequestManager *v14;
  void *v15;
  TVRMSDAAPLoginManager *loginManager;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id location;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_storeStrong((id *)&self->_service, a3);
  requestManager = self->_requestManager;
  objc_msgSend(v9, "hostName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRMSDAAPRequestManager setHostName:](requestManager, "setHostName:", v13);

  -[TVRMSDAAPRequestManager setPort:](self->_requestManager, "setPort:", (int)objc_msgSend(v9, "port"));
  v14 = self->_requestManager;
  objc_msgSend(v9, "homeSharingGroupKey");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRMSDAAPRequestManager setHomeSharingGroupKey:](v14, "setHomeSharingGroupKey:", v15);

  -[TVRMSDAAPRequestManager setPairingGUID:](self->_requestManager, "setPairingGUID:", v10);
  -[TVRMSDAAPRequestManager setSessionIdentifier:](self->_requestManager, "setSessionIdentifier:", 0);
  objc_initWeak(&location, self);
  loginManager = self->_loginManager;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __74__TVRMSDAAPControlSession_connectToService_pairingGUID_completionHandler___block_invoke;
  v18[3] = &unk_24DCD6FB8;
  objc_copyWeak(&v20, &location);
  v17 = v11;
  v19 = v17;
  -[TVRMSDAAPLoginManager loginWithCompletionHandler:](loginManager, "loginWithCompletionHandler:", v18);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

void __74__TVRMSDAAPControlSession_connectToService_pairingGUID_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;
  _QWORD v7[4];
  id v8;
  id v9;

  v5 = a3;
  if (a2 == 1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __74__TVRMSDAAPControlSession_connectToService_pairingGUID_completionHandler___block_invoke_2;
    v7[3] = &unk_24DCD6F90;
    v9 = *(id *)(a1 + 32);
    v8 = v5;
    objc_msgSend(WeakRetained, "_initializeManagersWithControlInterface:completionHandler:", v8, v7);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

uint64_t __74__TVRMSDAAPControlSession_connectToService_pairingGUID_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 32));
}

- (void)logout
{
  id v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), "logout");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[TVRMSDAAPRequestManager requestWithPath:method:postData:queryArgs:completionHandler:](self->_requestManager, "requestWithPath:method:postData:queryArgs:completionHandler:", v4, CFSTR("GET"), 0, 0, 0);

}

- (void)sendPlaybackCommand:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  TVRMSDAAPRequestManager *requestManager;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v6 = a4;
  v7 = (void *)MEMORY[0x24BDD17C8];
  -[TVRMSDAAPControlSession _stringFromRMSPlaybackCommand:](self, "_stringFromRMSPlaybackCommand:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%s/1/%@"), "ctrl-int", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  requestManager = self->_requestManager;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __65__TVRMSDAAPControlSession_sendPlaybackCommand_completionHandler___block_invoke;
  v13[3] = &unk_24DCD6FE0;
  v11 = v6;
  v14 = v11;
  v12 = -[TVRMSDAAPRequestManager requestWithPath:method:postData:queryArgs:completionHandler:](requestManager, "requestWithPath:method:postData:queryArgs:completionHandler:", v9, CFSTR("POST"), 0, 0, v13);
  if ((unint64_t)(a3 - 5) <= 1
    && -[TVRMSDAAPNowPlayingManager isObserving](self->_nowPlayingManager, "isObserving"))
  {
    -[TVRMSDAAPNowPlayingManager endObservingNowPlaying](self->_nowPlayingManager, "endObservingNowPlaying");
    -[TVRMSDAAPNowPlayingManager beginObservingNowPlaying](self->_nowPlayingManager, "beginObservingNowPlaying");
  }

}

uint64_t __65__TVRMSDAAPControlSession_sendPlaybackCommand_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setVolume:(float)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  TVRMSDAAPRequestManager *requestManager;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s/1/%s"), "ctrl-int", "setproperty");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), (unint64_t)(float)(a3 * 100.0));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  requestManager = self->_requestManager;
  v15 = CFSTR("dmcp.volume");
  v16[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __55__TVRMSDAAPControlSession_setVolume_completionHandler___block_invoke;
  v13[3] = &unk_24DCD6FE0;
  v14 = v6;
  v11 = v6;
  v12 = -[TVRMSDAAPRequestManager requestWithPath:method:postData:queryArgs:completionHandler:](requestManager, "requestWithPath:method:postData:queryArgs:completionHandler:", v7, CFSTR("POST"), 0, v10, v13);

}

uint64_t __55__TVRMSDAAPControlSession_setVolume_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)pickAudioRoute:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  TVRMSDAAPRequestManager *requestManager;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = (void *)MEMORY[0x24BDD17C8];
  v8 = a3;
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%s/1/%s"), "ctrl-int", "setspeakers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDD17C8];
  v11 = objc_msgSend(v8, "macAddress");

  objc_msgSend(v10, "stringWithFormat:", CFSTR("0x%qx"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  requestManager = self->_requestManager;
  v19 = CFSTR("speaker-id");
  v20[0] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __60__TVRMSDAAPControlSession_pickAudioRoute_completionHandler___block_invoke;
  v17[3] = &unk_24DCD6FE0;
  v18 = v6;
  v15 = v6;
  v16 = -[TVRMSDAAPRequestManager requestWithPath:method:postData:queryArgs:completionHandler:](requestManager, "requestWithPath:method:postData:queryArgs:completionHandler:", v9, CFSTR("POST"), 0, v14, v17);

}

uint64_t __60__TVRMSDAAPControlSession_pickAudioRoute_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)seekToPlaybackTime:(int)a3 completionHandler:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  TVRMSDAAPRequestManager *requestManager;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  const __CFString *v15;
  _QWORD v16[2];

  v4 = *(_QWORD *)&a3;
  v16[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s/1/%s"), "ctrl-int", "setproperty");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = CFSTR("dacp.playingtime");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  requestManager = self->_requestManager;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __64__TVRMSDAAPControlSession_seekToPlaybackTime_completionHandler___block_invoke;
  v13[3] = &unk_24DCD6FE0;
  v14 = v6;
  v11 = v6;
  v12 = -[TVRMSDAAPRequestManager requestWithPath:method:postData:queryArgs:completionHandler:](requestManager, "requestWithPath:method:postData:queryArgs:completionHandler:", v7, CFSTR("POST"), 0, v9, v13);

}

uint64_t __64__TVRMSDAAPControlSession_seekToPlaybackTime_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setLikedState:(int64_t)a3 itemID:(unint64_t)a4 databaseID:(unint64_t)a5 completionHandler:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  TVRMSDAAPRequestManager *requestManager;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x24BDAC8D0];
  v10 = a6;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s/1/%s"), "ctrl-int", "setproperty");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = CFSTR("com.apple.itunes.liked-state");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v12;
  v21[1] = CFSTR("database-spec");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("'dmap.itemid:0x%llX'"), a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v13;
  v21[2] = CFSTR("item-spec");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("'dmap.itemid:0x%llX'"), a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  requestManager = self->_requestManager;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __77__TVRMSDAAPControlSession_setLikedState_itemID_databaseID_completionHandler___block_invoke;
  v19[3] = &unk_24DCD6FE0;
  v20 = v10;
  v17 = v10;
  v18 = -[TVRMSDAAPRequestManager requestWithPath:method:postData:queryArgs:completionHandler:](requestManager, "requestWithPath:method:postData:queryArgs:completionHandler:", v11, CFSTR("POST"), 0, v15, v19);

}

uint64_t __77__TVRMSDAAPControlSession_setLikedState_itemID_databaseID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)addToWishlist:(unint64_t)a3 databaseID:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  TVRMSDAAPRequestManager *requestManager;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s/1/%s"), "ctrl-int", "setproperty");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = &unk_24DCF9098;
  v18[0] = CFSTR("com.apple.itunes.wishlist");
  v18[1] = CFSTR("database-spec");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("'dmap.itemid:0x%llX'"), a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v10;
  v18[2] = CFSTR("item-spec");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("'dmap.itemid:0x%llX'"), a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  requestManager = self->_requestManager;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __70__TVRMSDAAPControlSession_addToWishlist_databaseID_completionHandler___block_invoke;
  v16[3] = &unk_24DCD6FE0;
  v17 = v8;
  v14 = v8;
  v15 = -[TVRMSDAAPRequestManager requestWithPath:method:postData:queryArgs:completionHandler:](requestManager, "requestWithPath:method:postData:queryArgs:completionHandler:", v9, CFSTR("POST"), 0, v12, v16);

}

uint64_t __70__TVRMSDAAPControlSession_addToWishlist_databaseID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)beginObservingNowPlaying
{
  -[TVRMSDAAPNowPlayingManager beginObservingNowPlaying](self->_nowPlayingManager, "beginObservingNowPlaying");
}

- (void)endObservingNowPlaying
{
  -[TVRMSDAAPNowPlayingManager endObservingNowPlaying](self->_nowPlayingManager, "endObservingNowPlaying");
}

- (void)sendTouchMoveWithDirection:(int64_t)a3 repeatCount:(unsigned int)a4
{
  -[TVRMSDAAPTouchRemoteManager sendTouchMoveWithDirection:repeatCount:](self->_touchRemoteManager, "sendTouchMoveWithDirection:repeatCount:", a3, *(_QWORD *)&a4);
}

- (void)sendTouchEndWithDirection:(int64_t)a3 repeatCount:(unsigned int)a4
{
  -[TVRMSDAAPTouchRemoteManager sendTouchEndWithDirection:repeatCount:](self->_touchRemoteManager, "sendTouchEndWithDirection:repeatCount:", a3, *(_QWORD *)&a4);
}

- (void)sendNavigationCommand:(int64_t)a3
{
  if (a3 == 3 && -[TVRMSService isLegacy](self->_service, "isLegacy"))
    -[TVRMSDAAPControlSession sendPlaybackCommand:completionHandler:](self, "sendPlaybackCommand:completionHandler:", 2, 0);
  else
    -[TVRMSDAAPTouchRemoteManager sendNavigationCommand:](self->_touchRemoteManager, "sendNavigationCommand:", a3);
}

- (void)setKeyboardText:(id)a3
{
  -[TVRMSDAAPTouchRemoteManager setKeyboardText:](self->_touchRemoteManager, "setKeyboardText:", a3);
}

- (void)clearKeyboardText
{
  -[TVRMSDAAPTouchRemoteManager clearKeyboardText](self->_touchRemoteManager, "clearKeyboardText");
}

- (void)sendKeyboardReturnCommand
{
  -[TVRMSDAAPTouchRemoteManager sendKeyboardReturnCommand](self->_touchRemoteManager, "sendKeyboardReturnCommand");
}

- (void)nowPlayingManager:(id)a3 artworkDataDidBecomeAvailable:(id)a4 identifier:(id)a5
{
  TVRMSDAAPControlSessionDelegate **p_delegate;
  id v8;
  id v9;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v8 = a5;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "controlSession:artworkDataDidBecomeAvailable:identifier:", self, v9, v8);

}

- (void)nowPlayingManager:(id)a3 didUpdateAudioRoutes:(id)a4
{
  TVRMSDAAPControlSessionDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "controlSession:didUpdateAudioRoutes:", self, v6);

}

- (void)nowPlayingManager:(id)a3 didUpdateNowPlayingInfo:(id)a4
{
  TVRMSNowPlayingInfo *v5;
  id WeakRetained;
  id v7;
  TVRMSNowPlayingInfo *nowPlayingInfo;

  v5 = (TVRMSNowPlayingInfo *)a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "controlSession:didUpdateNowPlayingInfo:", self, v5);

  if (-[TVRMSNowPlayingInfo revisionNumber](self->_nowPlayingInfo, "revisionNumber") >= 1
    && !-[TVRMSNowPlayingInfo revisionNumber](v5, "revisionNumber"))
  {
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v7, "controlSessionDidEnd:", self);

  }
  nowPlayingInfo = self->_nowPlayingInfo;
  self->_nowPlayingInfo = v5;

}

- (void)nowPlayingManager:(id)a3 didUpdateVolume:(float)a4
{
  double v6;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  *(float *)&v6 = a4;
  objc_msgSend(WeakRetained, "controlSession:didUpdateVolume:", self, v6);

}

- (void)requestManagerFailedWithUnknownError:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "controlSessionDidEnd:", self);

}

- (void)requestManagerFailedWithUnauthorizedError:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "controlSessionDidEnd:", self);

}

- (void)touchRemoteManagerDidDisconnect:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "controlSessionDidEnd:", self);

}

- (void)touchRemoteManagerKeyboardEditingSessionDidBegin:(id)a3
{
  TVRMSDAAPControlSessionDelegate **p_delegate;
  id v5;
  void *v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(v5, "keyboardInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "controlSession:keyboardEditingDidBegin:", self, v6);
}

- (void)touchRemoteManagerKeyboardEditingSessionDidUpdate:(id)a3
{
  TVRMSDAAPControlSessionDelegate **p_delegate;
  id v5;
  void *v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(v5, "keyboardInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "controlSession:didUpdateKeyboardEditingInfo:", self, v6);
}

- (void)touchRemoteManagerKeyboardEditingSessionDidEnd:(id)a3
{
  TVRMSDAAPControlSessionDelegate **p_delegate;
  id v5;
  void *v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(v5, "keyboardInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "controlSession:keyboardEditingDidEnd:", self, v6);
}

- (void)_initializeManagersWithControlInterface:(id)a3 completionHandler:(id)a4
{
  TVRMSDAAPNowPlayingManager *nowPlayingManager;
  id v7;
  id v8;
  id v9;

  nowPlayingManager = self->_nowPlayingManager;
  v9 = a4;
  v7 = a3;
  -[TVRMSDAAPNowPlayingManager setControlInterface:](nowPlayingManager, "setControlInterface:", v7);
  LODWORD(nowPlayingManager) = objc_msgSend(v7, "supportsDirectionalControl");

  if ((_DWORD)nowPlayingManager)
  {
    -[TVRMSDAAPTouchRemoteManager initiateControlWithCompletionHandler:](self->_touchRemoteManager, "initiateControlWithCompletionHandler:", v9);

    v8 = -[TVRMSDAAPRequestManager requestWithPath:method:postData:queryArgs:completionHandler:](self->_requestManager, "requestWithPath:method:postData:queryArgs:completionHandler:", CFSTR("playqueue-contents"), CFSTR("POST"), 0, 0, 0);
  }
  else
  {
    (*((void (**)(id, uint64_t))v9 + 2))(v9, 1);

  }
}

- (id)_stringFromRMSPlaybackCommand:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 8)
    return CFSTR("play");
  else
    return off_24DCD7000[a3 - 1];
}

- (TVRMSDAAPControlSessionDelegate)delegate
{
  return (TVRMSDAAPControlSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (TVRMSService)service
{
  return self->_service;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_nowPlayingInfo, 0);
  objc_storeStrong((id *)&self->_touchRemoteManager, 0);
  objc_storeStrong((id *)&self->_nowPlayingManager, 0);
  objc_storeStrong((id *)&self->_loginManager, 0);
  objc_storeStrong((id *)&self->_requestManager, 0);
}

@end
