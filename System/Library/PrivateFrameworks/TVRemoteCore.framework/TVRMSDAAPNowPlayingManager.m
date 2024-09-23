@implementation TVRMSDAAPNowPlayingManager

- (TVRMSDAAPNowPlayingManager)initWithRequestManager:(id)a3
{
  id v5;
  TVRMSDAAPNowPlayingManager *v6;
  TVRMSDAAPNowPlayingManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TVRMSDAAPNowPlayingManager;
  v6 = -[TVRMSDAAPNowPlayingManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_requestManager, a3);

  return v7;
}

- (void)beginObservingNowPlaying
{
  NSObject *v2;
  _QWORD v4[4];
  id v5;
  id buf[2];

  if (self->_isObserving)
  {
    _TVRCRMSLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_21A51B000, v2, OS_LOG_TYPE_DEFAULT, "NowPlayingManager asked to begin observing, but observing was already in progress", (uint8_t *)buf, 2u);
    }

  }
  else
  {
    self->_isObserving = 1;
    objc_initWeak(buf, self);
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __54__TVRMSDAAPNowPlayingManager_beginObservingNowPlaying__block_invoke;
    v4[3] = &unk_24DCD71E0;
    objc_copyWeak(&v5, buf);
    -[TVRMSDAAPNowPlayingManager _requestNowPlayingInfoWithCompletionHandler:](self, "_requestNowPlayingInfoWithCompletionHandler:", v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(buf);
  }
}

void __54__TVRMSDAAPNowPlayingManager_beginObservingNowPlaying__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6;
  id *v7;
  id *WeakRetained;
  id *v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  dispatch_time_t v14;
  _QWORD block[4];
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (id *)(a1 + 32);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    if (a2 == 1)
    {
      objc_storeStrong(WeakRetained + 2, a3);
      v9[9] = 0;
      v10 = objc_loadWeakRetained(v9 + 15);
      objc_msgSend(v10, "nowPlayingManager:didUpdateNowPlayingInfo:", v9, v6);

      objc_msgSend(v9, "_requestArtworkDataIfNecessaryForNowPlayingInfo:", v6);
      if (objc_msgSend(v9[3], "supportsSpeakerSelection"))
        objc_msgSend(v9, "_requestAudioRoutes");
      if (objc_msgSend(v9[3], "supportsVolumeControl"))
        objc_msgSend(v9, "_requestVolume");
      objc_msgSend(v9, "_refreshNowPlayingInfoRequest");
    }
    else
    {
      objc_msgSend(WeakRetained[2], "setRevisionNumber:", 0);
      v11 = (uint64_t)v9[9];
      if (v11 >= 9)
        v11 = 9;
      v9[9] = (id)(v11 + 1);
      _TVRCRMSLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = v9[9];
        *(_DWORD *)buf = 134217984;
        v18 = v13;
        _os_log_impl(&dword_21A51B000, v12, OS_LOG_TYPE_DEFAULT, "Now playing info unavailable, retrying in %td seconds", buf, 0xCu);
      }

      v14 = dispatch_time(0, 1000000000 * (_QWORD)v9[9]);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __54__TVRMSDAAPNowPlayingManager_beginObservingNowPlaying__block_invoke_1;
      block[3] = &unk_24DCD71B8;
      objc_copyWeak(&v16, v7);
      dispatch_after(v14, MEMORY[0x24BDAC9B8], block);
      objc_destroyWeak(&v16);
    }
  }

}

void __54__TVRMSDAAPNowPlayingManager_beginObservingNowPlaying__block_invoke_1(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_refreshNowPlayingInfoRequest");

}

- (void)endObservingNowPlaying
{
  TVRMSNowPlayingInfo *currentNowPlayingInfo;
  NSArray *currentAudioRoutes;
  NSNumber *lastVolume;

  self->_isObserving = 0;
  currentNowPlayingInfo = self->_currentNowPlayingInfo;
  self->_currentNowPlayingInfo = 0;

  currentAudioRoutes = self->_currentAudioRoutes;
  self->_currentAudioRoutes = 0;

  lastVolume = self->_lastVolume;
  self->_lastVolume = 0;

  self->_requestBackoffInterval = 0;
  self->_artworkRequestBackoffInterval = 0;
  -[NSURLSessionDataTask cancel](self->_nowPlayingInfoRequest, "cancel");
  -[NSURLSessionDataTask cancel](self->_artworkRequest, "cancel");
  -[NSURLSessionDataTask cancel](self->_audioRoutesRequest, "cancel");
  -[NSURLSessionDataTask cancel](self->_volumeRequest, "cancel");
  -[TVRMSDAAPNowPlayingManager _cancelArtworkRetryTimer](self, "_cancelArtworkRetryTimer");
}

- (void)_refreshNowPlayingInfoRequest
{
  if (self->_isObserving)
  {
    self->_isObserving = 0;
    -[TVRMSDAAPNowPlayingManager beginObservingNowPlaying](self, "beginObservingNowPlaying");
  }
}

- (void)_requestNowPlayingInfoWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  TVRMSDAAPRequestManager *requestManager;
  void *v7;
  void *v8;
  id v9;
  NSURLSessionDataTask *v10;
  NSURLSessionDataTask *nowPlayingInfoRequest;
  _QWORD v12[4];
  id v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s/1/%s"), "ctrl-int", "playstatusupdate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURLSessionDataTask cancel](self->_nowPlayingInfoRequest, "cancel");
  v14 = CFSTR("revision-number");
  requestManager = self->_requestManager;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[TVRMSNowPlayingInfo revisionNumber](self->_currentNowPlayingInfo, "revisionNumber"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __74__TVRMSDAAPNowPlayingManager__requestNowPlayingInfoWithCompletionHandler___block_invoke;
  v12[3] = &unk_24DCD6FE0;
  v13 = v4;
  v9 = v4;
  -[TVRMSDAAPRequestManager requestWithPath:method:postData:queryArgs:completionHandler:](requestManager, "requestWithPath:method:postData:queryArgs:completionHandler:", v5, CFSTR("GET"), 0, v8, v12);
  v10 = (NSURLSessionDataTask *)objc_claimAutoreleasedReturnValue();
  nowPlayingInfoRequest = self->_nowPlayingInfoRequest;
  self->_nowPlayingInfoRequest = v10;

}

void __74__TVRMSDAAPNowPlayingManager__requestNowPlayingInfoWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
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
  uint64_t v21;
  void *v22;
  unint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (a2 == 1)
  {
    +[TVRMSDAAPParser objectWithData:](TVRMSDAAPParser, "objectWithData:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _TVRCRMSLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v34 = 138412290;
      v35 = v6;
      _os_log_impl(&dword_21A51B000, v7, OS_LOG_TYPE_DEFAULT, "Received now-playing info: %@", (uint8_t *)&v34, 0xCu);
    }

    v8 = (void *)objc_opt_new();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("dmap.itemid"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setItemID:", objc_msgSend(v9, "longLongValue"));

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("dmap.databaseid"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDatabaseID:", objc_msgSend(v10, "longLongValue"));

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("dmap.itemname"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTrackName:", v11);

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("daap.songartist"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setArtistName:", v12);

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("daap.songalbum"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAlbumName:", v13);

    objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
    objc_msgSend(v8, "setTimestamp:");
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("daap.songtimeremaining"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTimeRemaining:", (double)objc_msgSend(v14, "unsignedIntValue"));

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("daap.songtime"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTotalDuration:", (double)objc_msgSend(v15, "unsignedIntValue"));

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("dmcp.playstatusrevision"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRevisionNumber:", objc_msgSend(v16, "intValue"));

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("com.apple.itunes.likeable"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLikeable:", objc_msgSend(v17, "BOOLValue"));

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("com.apple.itunes.can-add-to-wishlist"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCanWishlist:", objc_msgSend(v18, "BOOLValue"));

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("com.apple.itunes.has-chapter-data"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHasChapterData:", objc_msgSend(v19, "BOOLValue"));

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("mediaKind"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "integerValue");

    if (v21 <= 4095)
    {
      if (v21 > 127)
      {
        if (v21 <= 511)
        {
          if (v21 != 128 && v21 != 256)
            goto LABEL_53;
        }
        else if (v21 != 512 && v21 != 1024 && v21 != 2048)
        {
          goto LABEL_53;
        }
      }
      else if ((unint64_t)(v21 - 1) > 0x3F || ((1 << (v21 - 1)) & 0x800000008000808BLL) == 0)
      {
        goto LABEL_53;
      }
    }
    else if (v21 < 0x40000)
    {
      if (v21 >= 0x8000)
      {
        if (v21 != 0x8000 && v21 != 0x10000 && v21 != 0x20000)
          goto LABEL_53;
      }
      else if (v21 != 4096 && v21 != 0x2000 && v21 != 0x4000)
      {
        goto LABEL_53;
      }
    }
    else if (v21 < 0x200000)
    {
      if (v21 != 0x40000 && v21 != 0x80000 && v21 != 0x100000)
        goto LABEL_53;
    }
    else if (v21 >= 0x800000)
    {
      if (v21 != 0x800000 && v21 != 0x1000000)
        goto LABEL_53;
    }
    else if (v21 != 0x200000 && v21 != 0x400000)
    {
LABEL_53:
      v21 = 0;
    }
    objc_msgSend(v8, "setMediaKind:", v21);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("dacp.available-skip-states"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "integerValue");

    objc_msgSend(v8, "setCanSkipPrevious:", (v23 >> 2) & 1);
    objc_msgSend(v8, "setCanSkipNext:", (v23 >> 1) & 1);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("dacp.playerstate"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "integerValue");

    if ((unint64_t)(v25 - 1) >= 6)
      v26 = 0;
    else
      v26 = v25;
    objc_msgSend(v8, "setPlaybackState:", v26);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("com.apple.itunes.liked-state"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "integerValue");

    if ((unint64_t)(v28 - 1) >= 3)
      v29 = 0;
    else
      v29 = v28;
    objc_msgSend(v8, "setLikedState:", v29);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("dacp.scrubbable"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (v30)
    {
      if (objc_msgSend(v30, "BOOLValue"))
        v32 = 1;
      else
        v32 = -1;
    }
    else
    {
      v32 = 0;
    }
    objc_msgSend(v8, "setScrubbableState:", v32);

    goto LABEL_27;
  }
  v8 = 0;
LABEL_27:
  v33 = *(_QWORD *)(a1 + 32);
  if (v33)
    (*(void (**)(uint64_t, uint64_t, void *))(v33 + 16))(v33, a2, v8);

}

- (void)_requestArtworkDataIfNecessaryForNowPlayingInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *currentArtworkIdentifier;
  NSObject *v9;
  void *WeakRetained;
  NSObject *v11;
  TVRMSDAAPRequestManager *requestManager;
  NSURLSessionDataTask *v13;
  NSURLSessionDataTask *artworkRequest;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "artworkIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    _TVRCRMSLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21A51B000, v11, OS_LOG_TYPE_DEFAULT, "Now playing is empty, don't fetch artwork", buf, 2u);
    }

    -[NSURLSessionDataTask cancel](self->_artworkRequest, "cancel");
    currentArtworkIdentifier = self->_currentArtworkIdentifier;
    self->_currentArtworkIdentifier = 0;
    goto LABEL_12;
  }
  if ((objc_msgSend(v5, "isEqualToString:", self->_currentArtworkIdentifier) & 1) == 0)
  {
    -[NSURLSessionDataTask cancel](self->_artworkRequest, "cancel");
    -[TVRMSDAAPNowPlayingManager _cancelArtworkRetryTimer](self, "_cancelArtworkRetryTimer");
    objc_storeStrong((id *)&self->_currentArtworkIdentifier, v6);
    +[TVRMSNowPlayingArtworkCache sharedArtworkCache](TVRMSNowPlayingArtworkCache, "sharedArtworkCache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "artworkDataForNowPlayingInfo:", v4);
    currentArtworkIdentifier = (void *)objc_claimAutoreleasedReturnValue();

    if (currentArtworkIdentifier)
    {
      _TVRCRMSLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v6;
        _os_log_impl(&dword_21A51B000, v9, OS_LOG_TYPE_DEFAULT, "Artwork was cached for identifier: %@", buf, 0xCu);
      }

      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "nowPlayingManager:artworkDataDidBecomeAvailable:identifier:", self, currentArtworkIdentifier, v6);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s/1/%s"), "ctrl-int", "nowplayingartwork");
      WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak((id *)buf, self);
      requestManager = self->_requestManager;
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __78__TVRMSDAAPNowPlayingManager__requestArtworkDataIfNecessaryForNowPlayingInfo___block_invoke;
      v15[3] = &unk_24DCD7208;
      objc_copyWeak(&v18, (id *)buf);
      v16 = v4;
      v17 = v6;
      -[TVRMSDAAPRequestManager requestWithPath:method:postData:queryArgs:completionHandler:](requestManager, "requestWithPath:method:postData:queryArgs:completionHandler:", WeakRetained, CFSTR("GET"), 0, 0, v15);
      v13 = (NSURLSessionDataTask *)objc_claimAutoreleasedReturnValue();
      artworkRequest = self->_artworkRequest;
      self->_artworkRequest = v13;

      objc_destroyWeak(&v18);
      objc_destroyWeak((id *)buf);
    }

LABEL_12:
  }

}

void __78__TVRMSDAAPNowPlayingManager__requestArtworkDataIfNecessaryForNowPlayingInfo___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (a2 == 1 && objc_msgSend(v5, "length"))
    {
      *((_QWORD *)WeakRetained + 10) = 0;
      +[TVRMSNowPlayingArtworkCache sharedArtworkCache](TVRMSNowPlayingArtworkCache, "sharedArtworkCache");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setArtworkData:forNowPlayingInfo:", v5, *(_QWORD *)(a1 + 32));

      v8 = objc_loadWeakRetained((id *)WeakRetained + 15);
      objc_msgSend(v8, "nowPlayingManager:artworkDataDidBecomeAvailable:identifier:", WeakRetained, v5, *(_QWORD *)(a1 + 40));

    }
    else
    {
      v9 = (void *)*((_QWORD *)WeakRetained + 11);
      *((_QWORD *)WeakRetained + 11) = 0;

      v10 = *((_QWORD *)WeakRetained + 10);
      if (v10 >= 9)
        v10 = 9;
      *((_QWORD *)WeakRetained + 10) = v10 + 1;
      _TVRCRMSLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = *((_QWORD *)WeakRetained + 10);
        v14 = 134217984;
        v15 = v12;
        _os_log_impl(&dword_21A51B000, v11, OS_LOG_TYPE_DEFAULT, "Artwork unavailable, retrying in %td seconds", (uint8_t *)&v14, 0xCu);
      }

      objc_msgSend(WeakRetained, "_scheduleArtworkRetryForNowPlayingInfo:delay:", *(_QWORD *)(a1 + 32), (double)*((uint64_t *)WeakRetained + 10));
      v13 = objc_loadWeakRetained((id *)WeakRetained + 15);
      objc_msgSend(v13, "nowPlayingManager:artworkDataDidBecomeAvailable:identifier:", WeakRetained, 0, 0);

    }
  }

}

- (void)_scheduleArtworkRetryForNowPlayingInfo:(id)a3 delay:(double)a4
{
  id v6;
  OS_dispatch_source *v7;
  OS_dispatch_source *artworkRetryTimer;
  NSObject *v9;
  dispatch_time_t v10;
  NSObject *v11;
  id v12;
  _QWORD handler[4];
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, MEMORY[0x24BDAC9B8]);
  artworkRetryTimer = self->_artworkRetryTimer;
  self->_artworkRetryTimer = v7;

  objc_initWeak(&location, self);
  v9 = self->_artworkRetryTimer;
  v10 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, (uint64_t)(a4 * 1000000000.0) / 10);
  v11 = self->_artworkRetryTimer;
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __75__TVRMSDAAPNowPlayingManager__scheduleArtworkRetryForNowPlayingInfo_delay___block_invoke;
  handler[3] = &unk_24DCD7230;
  objc_copyWeak(&v15, &location);
  v14 = v6;
  v12 = v6;
  dispatch_source_set_event_handler(v11, handler);
  dispatch_resume((dispatch_object_t)self->_artworkRetryTimer);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __75__TVRMSDAAPNowPlayingManager__scheduleArtworkRetryForNowPlayingInfo_delay___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_requestArtworkDataIfNecessaryForNowPlayingInfo:", *(_QWORD *)(a1 + 32));

}

- (void)_cancelArtworkRetryTimer
{
  NSObject *artworkRetryTimer;
  OS_dispatch_source *v4;

  artworkRetryTimer = self->_artworkRetryTimer;
  if (artworkRetryTimer)
  {
    dispatch_source_cancel(artworkRetryTimer);
    v4 = self->_artworkRetryTimer;
    self->_artworkRetryTimer = 0;

  }
}

- (void)_requestAudioRoutes
{
  void *v3;
  TVRMSDAAPRequestManager *requestManager;
  NSURLSessionDataTask *v5;
  NSURLSessionDataTask *audioRoutesRequest;
  _QWORD v7[4];
  id v8;
  id location;

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s/1/%s"), "ctrl-int", "getspeakers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURLSessionDataTask cancel](self->_audioRoutesRequest, "cancel");
  requestManager = self->_requestManager;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__TVRMSDAAPNowPlayingManager__requestAudioRoutes__block_invoke;
  v7[3] = &unk_24DCD7258;
  objc_copyWeak(&v8, &location);
  -[TVRMSDAAPRequestManager requestWithPath:method:postData:queryArgs:completionHandler:](requestManager, "requestWithPath:method:postData:queryArgs:completionHandler:", v3, CFSTR("POST"), 0, 0, v7);
  v5 = (NSURLSessionDataTask *)objc_claimAutoreleasedReturnValue();
  audioRoutesRequest = self->_audioRoutesRequest;
  self->_audioRoutesRequest = v5;

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __49__TVRMSDAAPNowPlayingManager__requestAudioRoutes__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id *WeakRetained;
  id *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  id v22;
  id *v23;
  id v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (a2 == 1 && WeakRetained)
  {
    v23 = WeakRetained;
    v24 = v5;
    +[TVRMSDAAPParser objectWithData:](TVRMSDAAPParser, "objectWithData:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_opt_new();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    obj = v8;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v27 != v12)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          v15 = (void *)objc_opt_new();
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("dmap.itemname"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setDisplayName:", v16);

          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("dacp.macAddress"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setMacAddress:", objc_msgSend(v17, "longLongValue"));

          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("dacp.supportsVideo"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setSupportsVideo:", objc_msgSend(v18, "BOOLValue"));

          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("dacp.selectedForVideo"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "BOOLValue");

          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("dacp.selectedForAudio"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v19) = objc_msgSend(v21, "BOOLValue");

          objc_msgSend(v15, "setSelected:", v19 | v20);
          objc_msgSend(v9, "addObject:", v15);

        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v11);
    }

    v7 = v23;
    if ((objc_msgSend(v23, "_audioRoutes:equalAudioRoutes:", v9, v23[12]) & 1) == 0)
    {
      objc_storeStrong(v23 + 12, v9);
      v22 = objc_loadWeakRetained(v23 + 15);
      objc_msgSend(v22, "nowPlayingManager:didUpdateAudioRoutes:", v23, v9);

    }
    v5 = v24;
  }

}

- (void)_requestVolume
{
  void *v3;
  TVRMSDAAPRequestManager *requestManager;
  void *v5;
  NSURLSessionDataTask *v6;
  NSURLSessionDataTask *volumeRequest;
  _QWORD v8[4];
  id v9;
  id location;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s/1/%s"), "ctrl-int", "getproperty");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURLSessionDataTask cancel](self->_volumeRequest, "cancel");
  requestManager = self->_requestManager;
  v11 = CFSTR("properties");
  v12[0] = CFSTR("dmcp.volume");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __44__TVRMSDAAPNowPlayingManager__requestVolume__block_invoke;
  v8[3] = &unk_24DCD7258;
  objc_copyWeak(&v9, &location);
  -[TVRMSDAAPRequestManager requestWithPath:method:postData:queryArgs:completionHandler:](requestManager, "requestWithPath:method:postData:queryArgs:completionHandler:", v3, CFSTR("POST"), 0, v5, v8);
  v6 = (NSURLSessionDataTask *)objc_claimAutoreleasedReturnValue();
  volumeRequest = self->_volumeRequest;
  self->_volumeRequest = v6;

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __44__TVRMSDAAPNowPlayingManager__requestVolume__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *WeakRetained;
  void *v5;
  void *v6;
  float v7;
  float v8;
  double v9;
  uint64_t v10;
  id v11;
  id v12;
  double v13;
  id v14;

  v14 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    +[TVRMSDAAPParser objectWithData:](TVRMSDAAPParser, "objectWithData:", v14);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("dacp.volume"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "floatValue");
    v8 = v7;

    objc_msgSend(WeakRetained[13], "floatValue");
    if (v8 != *(float *)&v9 || !WeakRetained[13])
    {
      *(float *)&v9 = v8;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v9);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = WeakRetained[13];
      WeakRetained[13] = (id)v10;

      v12 = objc_loadWeakRetained(WeakRetained + 15);
      *(float *)&v13 = v8;
      objc_msgSend(v12, "nowPlayingManager:didUpdateVolume:", WeakRetained, v13);

    }
  }

}

- (BOOL)_audioRoutes:(id)a3 equalAudioRoutes:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "count");
  if (v7 == objc_msgSend(v6, "count"))
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v27;
      v21 = v5;
      while (1)
      {
        v12 = 0;
LABEL_5:
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v12);
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v14 = v6;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (!v15)
          break;
        v16 = v15;
        v17 = *(_QWORD *)v23;
LABEL_9:
        v18 = 0;
        while (1)
        {
          if (*(_QWORD *)v23 != v17)
            objc_enumerationMutation(v14);
          if ((objc_msgSend(v13, "isEqualToAudioRoute:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v18)) & 1) != 0)
            break;
          if (v16 == ++v18)
          {
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
            if (v16)
              goto LABEL_9;
            goto LABEL_20;
          }
        }

        if (++v12 != v10)
          goto LABEL_5;
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
        v19 = 1;
        v5 = v21;
        if (!v10)
          goto LABEL_22;
      }
LABEL_20:

      v19 = 0;
      v5 = v21;
    }
    else
    {
      v19 = 1;
    }
LABEL_22:

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (TVRMSDAAPNowPlayingManagerDelegate)delegate
{
  return (TVRMSDAAPNowPlayingManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (TVRMSControlInterface)controlInterface
{
  return self->_controlInterface;
}

- (void)setControlInterface:(id)a3
{
  objc_storeStrong((id *)&self->_controlInterface, a3);
}

- (BOOL)isObserving
{
  return self->_observing;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lastVolume, 0);
  objc_storeStrong((id *)&self->_currentAudioRoutes, 0);
  objc_storeStrong((id *)&self->_currentArtworkIdentifier, 0);
  objc_storeStrong((id *)&self->_artworkRetryTimer, 0);
  objc_storeStrong((id *)&self->_volumeRequest, 0);
  objc_storeStrong((id *)&self->_audioRoutesRequest, 0);
  objc_storeStrong((id *)&self->_artworkRequest, 0);
  objc_storeStrong((id *)&self->_nowPlayingInfoRequest, 0);
  objc_storeStrong((id *)&self->_controlInterface, 0);
  objc_storeStrong((id *)&self->_currentNowPlayingInfo, 0);
  objc_storeStrong((id *)&self->_requestManager, 0);
}

@end
