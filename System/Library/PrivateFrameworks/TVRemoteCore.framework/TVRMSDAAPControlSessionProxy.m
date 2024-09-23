@implementation TVRMSDAAPControlSessionProxy

- (TVRMSDAAPControlSessionProxy)init
{
  TVRMSDAAPControlSessionProxy *v2;
  void *v3;
  uint64_t v4;
  TVRMSIDSClient *idsClient;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TVRMSDAAPControlSessionProxy;
  v2 = -[TVRMSSessionProxy initWithTimeout:](&v7, sel_initWithTimeout_, *(double *)&TVRMSDAAPControlSessionTimeout);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__handleNowPlayingInfoDidUpdateNotification_, CFSTR("RMSIDSClientNowPlayingInfoDidUpdateNotification"), 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__handleNowPlayingArtworkDidBecomeAvailableNotification_, CFSTR("RMSIDSClientNowPlayingArtworkDidBecomeAvailableNotification"), 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__handleAudioRoutesDidUpdateNotification_, CFSTR("RMSIDSClientNowPlayingAudioRoutesDidUpdateNotification"), 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__handleVolumeDidUpdateNotification_, CFSTR("RMSIDSClientNowPlayingVolumeDidUpdateNotification"), 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__handleSessionDidEndNotification_, CFSTR("RMSIDSClientSessionDidEndNotification"), 0);
    +[TVRMSIDSClient sharedClient](TVRMSIDSClient, "sharedClient");
    v4 = objc_claimAutoreleasedReturnValue();
    idsClient = v2->_idsClient;
    v2->_idsClient = (TVRMSIDSClient *)v4;

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[TVRMSSessionProxy endHeartbeat](self, "endHeartbeat");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)TVRMSDAAPControlSessionProxy;
  -[TVRMSSessionProxy dealloc](&v4, sel_dealloc);
}

- (void)connectToService:(id)a3 pairingGUID:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  TVRMSIDSClient *idsClient;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_storeStrong((id *)&self->_service, a3);
  -[TVRMSSessionProxy setSessionIdentifier:](self, "setSessionIdentifier:", 0);
  objc_initWeak(&location, self);
  idsClient = self->_idsClient;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __79__TVRMSDAAPControlSessionProxy_connectToService_pairingGUID_completionHandler___block_invoke;
  v14[3] = &unk_24DCD7050;
  objc_copyWeak(&v16, &location);
  v13 = v11;
  v15 = v13;
  -[TVRMSIDSClient connectToService:pairingGUID:completionHandler:](idsClient, "connectToService:pairingGUID:completionHandler:", v9, v10, v14);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __79__TVRMSDAAPControlSessionProxy_connectToService_pairingGUID_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7;
  NSObject *v8;
  id WeakRetained;
  id v10;
  _DWORD v11[2];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  if (a2 == 1)
  {
    _TVRCRMSLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v11[0] = 67109120;
      v11[1] = a4;
      _os_log_impl(&dword_21A51B000, v8, OS_LOG_TYPE_DEFAULT, "Control session proxy received successful connection response, sessionIdentifier=%d", (uint8_t *)v11, 8u);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "setSessionIdentifier:", a4);

    v10 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v10, "beginHeartbeat");

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)logout
{
  if (-[TVRMSSessionProxy sessionIdentifier](self, "sessionIdentifier"))
  {
    -[TVRMSIDSClient logoutWithSessionIdentifier:](self->_idsClient, "logoutWithSessionIdentifier:", -[TVRMSSessionProxy sessionIdentifier](self, "sessionIdentifier"));
    -[TVRMSSessionProxy endHeartbeat](self, "endHeartbeat");
  }
}

- (void)sendPlaybackCommand:(int64_t)a3 completionHandler:(id)a4
{
  -[TVRMSIDSClient sendPlaybackCommand:sessionIdentifier:](self->_idsClient, "sendPlaybackCommand:sessionIdentifier:", a3, -[TVRMSSessionProxy sessionIdentifier](self, "sessionIdentifier", a3, a4));
}

- (void)setVolume:(float)a3 completionHandler:(id)a4
{
  TVRMSIDSClient *idsClient;
  uint64_t v6;
  double v7;

  idsClient = self->_idsClient;
  v6 = -[TVRMSSessionProxy sessionIdentifier](self, "sessionIdentifier", a4);
  *(float *)&v7 = a3;
  -[TVRMSIDSClient setVolume:sessionIdentifier:](idsClient, "setVolume:sessionIdentifier:", v6, v7);
}

- (void)pickAudioRoute:(id)a3 completionHandler:(id)a4
{
  TVRMSIDSClient *idsClient;
  id v7;

  idsClient = self->_idsClient;
  v7 = a4;
  -[TVRMSIDSClient pickAudioRouteWithMacAddress:sessionIdentifier:completionHandler:](idsClient, "pickAudioRouteWithMacAddress:sessionIdentifier:completionHandler:", objc_msgSend(a3, "macAddress"), -[TVRMSSessionProxy sessionIdentifier](self, "sessionIdentifier"), v7);

}

- (void)seekToPlaybackTime:(int)a3 completionHandler:(id)a4
{
  -[TVRMSIDSClient seekToPlaybackTime:sessionIdentifier:](self->_idsClient, "seekToPlaybackTime:sessionIdentifier:", *(_QWORD *)&a3, -[TVRMSSessionProxy sessionIdentifier](self, "sessionIdentifier", *(_QWORD *)&a3, a4));
}

- (void)setLikedState:(int64_t)a3 itemID:(unint64_t)a4 databaseID:(unint64_t)a5 completionHandler:(id)a6
{
  TVRMSIDSClient *idsClient;
  id v11;

  idsClient = self->_idsClient;
  v11 = a6;
  -[TVRMSIDSClient setLikedState:itemID:databaseID:sessionIdentifier:completionHandler:](idsClient, "setLikedState:itemID:databaseID:sessionIdentifier:completionHandler:", a3, a4, a5, -[TVRMSSessionProxy sessionIdentifier](self, "sessionIdentifier"), v11);

}

- (void)addToWishlist:(unint64_t)a3 databaseID:(unint64_t)a4 completionHandler:(id)a5
{
  TVRMSIDSClient *idsClient;
  id v9;

  idsClient = self->_idsClient;
  v9 = a5;
  -[TVRMSIDSClient addToWishlist:databaseID:sessionIdentifier:completionHandler:](idsClient, "addToWishlist:databaseID:sessionIdentifier:completionHandler:", a3, a4, -[TVRMSSessionProxy sessionIdentifier](self, "sessionIdentifier"), v9);

}

- (void)beginObservingNowPlaying
{
  TVRMSIDSClient *idsClient;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  idsClient = self->_idsClient;
  v4 = -[TVRMSSessionProxy sessionIdentifier](self, "sessionIdentifier");
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __56__TVRMSDAAPControlSessionProxy_beginObservingNowPlaying__block_invoke;
  v5[3] = &unk_24DCD7078;
  objc_copyWeak(&v6, &location);
  -[TVRMSIDSClient beginObservingNowPlayingWithSessionIdentifier:completionHandler:](idsClient, "beginObservingNowPlayingWithSessionIdentifier:completionHandler:", v4, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __56__TVRMSDAAPControlSessionProxy_beginObservingNowPlaying__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  if (a2 != 1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "beginObservingNowPlaying");

  }
}

- (void)endObservingNowPlaying
{
  if (-[TVRMSSessionProxy sessionIdentifier](self, "sessionIdentifier"))
    -[TVRMSIDSClient endObservingNowPlayingWithSessionIdentifier:](self->_idsClient, "endObservingNowPlayingWithSessionIdentifier:", -[TVRMSSessionProxy sessionIdentifier](self, "sessionIdentifier"));
}

- (void)sendTouchMoveWithDirection:(int64_t)a3 repeatCount:(unsigned int)a4
{
  -[TVRMSIDSClient sendTouchMoveWithDirection:repeatCount:sessionIdentifier:](self->_idsClient, "sendTouchMoveWithDirection:repeatCount:sessionIdentifier:", a3, *(_QWORD *)&a4, -[TVRMSSessionProxy sessionIdentifier](self, "sessionIdentifier"));
}

- (void)sendTouchEndWithDirection:(int64_t)a3 repeatCount:(unsigned int)a4
{
  -[TVRMSIDSClient sendTouchEndWithDirection:repeatCount:sessionIdentifier:](self->_idsClient, "sendTouchEndWithDirection:repeatCount:sessionIdentifier:", a3, *(_QWORD *)&a4, -[TVRMSSessionProxy sessionIdentifier](self, "sessionIdentifier"));
}

- (void)sendNavigationCommand:(int64_t)a3
{
  -[TVRMSIDSClient sendNavigationCommand:sessionIdentifier:](self->_idsClient, "sendNavigationCommand:sessionIdentifier:", a3, -[TVRMSSessionProxy sessionIdentifier](self, "sessionIdentifier"));
}

- (void)heartbeatDidFail
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "controlSessionDidEnd:", self);

}

- (void)_notifyDelegateForArtworkChange
{
  void *v3;
  void *v4;
  id WeakRetained;
  id v6;

  -[TVRMSNowPlayingInfo artworkIdentifier](self->_nowPlayingInfo, "artworkIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[TVRMSNowPlayingArtworkCache sharedArtworkCache](TVRMSNowPlayingArtworkCache, "sharedArtworkCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "artworkDataForIdentifier:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "controlSession:artworkDataDidBecomeAvailable:identifier:", self, v4, v6);

}

- (void)_handleNowPlayingInfoDidUpdateNotification:(id)a3
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  id v11;

  v11 = a3;
  v4 = -[TVRMSSessionProxy sessionMatchesNotification:](self, "sessionMatchesNotification:", v11);
  v5 = v11;
  if (v4)
  {
    objc_msgSend(v11, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("RMSIDSClientNowPlayingInfoNotificationKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v6) = objc_msgSend(v7, "revisionNumber");
    if ((int)v6 >= -[TVRMSNowPlayingInfo revisionNumber](self->_nowPlayingInfo, "revisionNumber"))
    {
      -[TVRMSNowPlayingInfo artworkIdentifier](self->_nowPlayingInfo, "artworkIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "artworkIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)&self->_nowPlayingInfo, v7);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "controlSession:didUpdateNowPlayingInfo:", self, v7);

      if ((objc_msgSend(v9, "isEqualToString:", v8) & 1) == 0 && v9 != v8)
        -[TVRMSDAAPControlSessionProxy _notifyDelegateForArtworkChange](self, "_notifyDelegateForArtworkChange");

    }
    v5 = v11;
  }

}

- (void)_handleAudioRoutesDidUpdateNotification:(id)a3
{
  void *v4;
  void *v5;
  id WeakRetained;
  id v7;

  v7 = a3;
  if (-[TVRMSSessionProxy sessionMatchesNotification:](self, "sessionMatchesNotification:"))
  {
    objc_msgSend(v7, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RMSIDSClientNowPlayingAudioRoutesNotificationKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "controlSession:didUpdateAudioRoutes:", self, v5);

  }
}

- (void)_handleVolumeDidUpdateNotification:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  int v7;
  id WeakRetained;
  double v9;
  id v10;

  v10 = a3;
  if (-[TVRMSSessionProxy sessionMatchesNotification:](self, "sessionMatchesNotification:"))
  {
    objc_msgSend(v10, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RMSIDSClientNowPlayingVolumeNotificationKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "floatValue");
    v7 = v6;

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    LODWORD(v9) = v7;
    objc_msgSend(WeakRetained, "controlSession:didUpdateVolume:", self, v9);

  }
}

- (void)_handleNowPlayingArtworkDidBecomeAvailableNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  TVRMSIDSClient *idsClient;
  TVRMSNowPlayingInfo *nowPlayingInfo;
  double v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[TVRMSSessionProxy sessionMatchesNotification:](self, "sessionMatchesNotification:", v4))
  {
    objc_msgSend(v4, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("RMSIDSClientNowPlayingArtworkIdentifierKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[TVRMSNowPlayingInfo artworkIdentifier](self->_nowPlayingInfo, "artworkIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqualToString:", v7) & 1) != 0)
    {
      +[TVRMSNowPlayingArtworkCache sharedArtworkCache](TVRMSNowPlayingArtworkCache, "sharedArtworkCache");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "artworkDataForIdentifier:", v7);
      v9 = objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        _TVRCRMSLog();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v23 = v6;
          _os_log_impl(&dword_21A51B000, v10, OS_LOG_TYPE_DEFAULT, "Control session was notified of avialable artwork for [%@], but data is already in cache", buf, 0xCu);
        }

      }
      else
      {
        objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "bounds");
        v13 = v12;
        v15 = v14;

        objc_initWeak((id *)buf, self);
        idsClient = self->_idsClient;
        nowPlayingInfo = self->_nowPlayingInfo;
        v19[0] = MEMORY[0x24BDAC760];
        v19[1] = 3221225472;
        v19[2] = __87__TVRMSDAAPControlSessionProxy__handleNowPlayingArtworkDidBecomeAvailableNotification___block_invoke;
        v19[3] = &unk_24DCD70A0;
        v20 = v6;
        objc_copyWeak(&v21, (id *)buf);
        LODWORD(v18) = 1050253722;
        -[TVRMSIDSClient requestArtworkDataForNowPlayingInfo:width:height:compressionQuality:completionHandler:](idsClient, "requestArtworkDataForNowPlayingInfo:width:height:compressionQuality:completionHandler:", nowPlayingInfo, v13, v15, v19, v18);
        objc_destroyWeak(&v21);

        objc_destroyWeak((id *)buf);
      }
    }
    else
    {
      _TVRCRMSLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v23 = v6;
        v24 = 2112;
        v25 = v7;
        _os_log_impl(&dword_21A51B000, v9, OS_LOG_TYPE_DEFAULT, "Control session was notified of available artwork for [%@], but current now playing is [%@]", buf, 0x16u);
      }
    }

  }
}

void __87__TVRMSDAAPControlSessionProxy__handleNowPlayingArtworkDidBecomeAvailableNotification___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id WeakRetained;

  v3 = a2;
  +[TVRMSNowPlayingArtworkCache sharedArtworkCache](TVRMSNowPlayingArtworkCache, "sharedArtworkCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setArtworkData:forIdentifier:", v3, *(_QWORD *)(a1 + 32));

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_notifyDelegateForArtworkChange");

}

- (void)_handleSessionDidEndNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  if (-[TVRMSSessionProxy sessionMatchesNotification:](self, "sessionMatchesNotification:", a3))
  {
    _TVRCRMSLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21A51B000, v4, OS_LOG_TYPE_DEFAULT, "Control session ended", buf, 2u);
    }

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __65__TVRMSDAAPControlSessionProxy__handleSessionDidEndNotification___block_invoke;
    block[3] = &unk_24DCD70C8;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

void __65__TVRMSDAAPControlSessionProxy__handleSessionDidEndNotification___block_invoke(uint64_t a1)
{
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "endHeartbeat");
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
  objc_msgSend(WeakRetained, "controlSessionDidEnd:", *(_QWORD *)(a1 + 32));

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
  objc_storeStrong((id *)&self->_idsClient, 0);
}

@end
