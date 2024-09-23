@implementation SUAudioPlayer

- (SUAudioPlayer)initWithURL:(id)a3
{
  SUAudioPlayer *v4;
  SUPlayerStatus *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUAudioPlayer;
  v4 = -[SUAudioPlayer init](&v7, sel_init);
  if (v4)
  {
    v4->_url = (NSURL *)a3;
    v5 = objc_alloc_init(SUPlayerStatus);
    v4->_status = v5;
    -[SUPlayerStatus setPlayerState:](v5, "setPlayerState:", 0);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[SUAudioPlayer _destroyPlayer](self, "_destroyPlayer");
  -[SUAudioPlayer _destroyPlayerItem](self, "_destroyPlayerItem");

  v3.receiver = self;
  v3.super_class = (Class)SUAudioPlayer;
  -[SUAudioPlayer dealloc](&v3, sel_dealloc);
}

- (SUPlayerStatus)playerStatus
{
  return (SUPlayerStatus *)(id)-[SUPlayerStatus copy](self->_status, "copy");
}

- (void)play
{
  AVPlayer *player;
  uint64_t v4;
  id v5;
  void *v6;
  AVURLAsset *v7;
  AVURLAsset *asset;
  uint64_t v9;
  _QWORD v10[5];

  if (self->_asset)
  {
    player = self->_player;
    if (player)
      -[AVPlayer play](player, "play");
  }
  else
  {
    v4 = objc_msgSend(MEMORY[0x24BEB20C0], "weakReferenceWithObject:", self);
    v5 = objc_alloc(MEMORY[0x24BDBCE70]);
    v6 = (void *)objc_msgSend(v5, "initWithObjectsAndKeys:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDB2200], 0);
    v7 = (AVURLAsset *)objc_msgSend(objc_alloc(MEMORY[0x24BDB26C8]), "initWithURL:options:", self->_url, v6);
    self->_asset = v7;
    -[AVAssetResourceLoader setDelegate:queue:](-[AVURLAsset resourceLoader](v7, "resourceLoader"), "setDelegate:queue:", self, dispatch_get_global_queue(0, 0));
    asset = self->_asset;
    v9 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("duration"), CFSTR("tracks"), 0);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __21__SUAudioPlayer_play__block_invoke;
    v10[3] = &unk_24DE7AF90;
    v10[4] = v4;
    -[AVURLAsset loadValuesAsynchronouslyForKeys:completionHandler:](asset, "loadValuesAsynchronouslyForKeys:completionHandler:", v9, v10);
    -[SUAudioPlayer _setPlayerState:](self, "_setPlayerState:", 1);

  }
}

void __21__SUAudioPlayer_play__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __21__SUAudioPlayer_play__block_invoke_2;
  block[3] = &unk_24DE7AF90;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __21__SUAudioPlayer_play__block_invoke_2(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "object"), "_handleAssetValuesDidLoad");
}

- (void)pause
{
  -[AVPlayer pause](self->_player, "pause");
}

- (void)seekToTime:(double)a3
{
  AVPlayer *player;
  CMTime v4;

  player = self->_player;
  CMTimeMakeWithSeconds(&v4, a3, 1);
  -[AVPlayer seekToTime:](player, "seekToTime:", &v4);
}

- (void)setValue:(id)a3 forNowPlayingKey:(id)a4
{
  NSMutableDictionary *nowPlayingInfo;

  nowPlayingInfo = self->_nowPlayingInfo;
  if (a3)
  {
    if (!nowPlayingInfo)
    {
      nowPlayingInfo = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      self->_nowPlayingInfo = nowPlayingInfo;
    }
    -[NSMutableDictionary setObject:forKey:](nowPlayingInfo, "setObject:forKey:", a3, a4);
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](nowPlayingInfo, "removeObjectForKey:", a4);
  }
  -[SUAudioPlayer _applyNowPlayingInfo](self, "_applyNowPlayingInfo");
}

- (void)stop
{
  -[AVPlayer pause](self->_player, "pause");
  -[SUAudioPlayer _destroyPlayer](self, "_destroyPlayer");
  -[SUAudioPlayer _destroyPlayerItem](self, "_destroyPlayerItem");
  -[SUAudioPlayer _setPlayerState:](self, "_setPlayerState:", 5);
}

- (id)valueForNowPlayingKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_nowPlayingInfo, "objectForKey:", a3);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v8;
  void *player;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("status"), a4, a5, a6))
  {
    if (self->_player == a4)
    {
      if (objc_msgSend(a4, "status") == 2)
      {
        player = self->_player;
        goto LABEL_9;
      }
    }
    else if (self->_playerItem == a4)
    {
      v8 = objc_msgSend(a4, "status");
      if (v8 == 1)
      {
        -[AVPlayer play](self->_player, "play");
      }
      else if (v8 == 2)
      {
        player = self->_playerItem;
LABEL_9:
        -[SUAudioPlayer _failWithError:](self, "_failWithError:", objc_msgSend(player, "error"));
      }
    }
  }
}

- (void)_itemFailedToPlayToEndNotification:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__SUAudioPlayer__itemFailedToPlayToEndNotification___block_invoke;
  block[3] = &unk_24DE7AF90;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __52__SUAudioPlayer__itemFailedToPlayToEndNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_failWithError:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "error"));
}

- (void)_itemPlayedToEndNotification:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__SUAudioPlayer__itemPlayedToEndNotification___block_invoke;
  block[3] = &unk_24DE7AF90;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __46__SUAudioPlayer__itemPlayedToEndNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setPlayerState:", 5);
}

- (BOOL)resourceLoader:(id)a3 shouldWaitForLoadingOfRequestedResource:(id)a4
{
  SUPastisOperation *v6;

  v6 = objc_alloc_init(SUPastisOperation);
  -[SUPastisOperation setLoadingRequest:](v6, "setLoadingRequest:", a4);
  -[SUPastisOperation setKeyURL:](v6, "setKeyURL:", self->_keyUrl);
  -[SUPastisOperation setCertificateURL:](v6, "setCertificateURL:", self->_certificateUrl);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BEC8BE8], "mainQueue"), "addOperation:", v6);

  return 1;
}

- (void)_applyNowPlayingInfo
{
  unint64_t v3;
  void *v4;
  NSMutableDictionary *nowPlayingInfo;

  v3 = -[SUPlayerStatus playerState](self->_status, "playerState") - 1;
  v4 = (void *)objc_msgSend(MEMORY[0x24BDDCAC8], "defaultCenter");
  if (v3 > 2)
    nowPlayingInfo = 0;
  else
    nowPlayingInfo = self->_nowPlayingInfo;
  objc_msgSend(v4, "setNowPlayingInfo:", nowPlayingInfo);
}

- (void)_destroyPlayer
{
  if (self->_timeObserver)
  {
    -[AVPlayer removeTimeObserver:](self->_player, "removeTimeObserver:");

    self->_timeObserver = 0;
  }
  -[AVPlayer removeObserver:forKeyPath:](self->_player, "removeObserver:forKeyPath:", self, CFSTR("status"));

  self->_player = 0;
}

- (void)_destroyPlayerItem
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDB1FB8], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDB1FA8], 0);
  -[AVPlayerItem removeObserver:forKeyPath:](self->_playerItem, "removeObserver:forKeyPath:", self, CFSTR("status"));

  self->_playerItem = 0;
}

- (void)_failWithError:(id)a3
{
  -[SUPlayerStatus setError:](self->_status, "setError:", a3);
  -[SUAudioPlayer _setPlayerState:](self, "_setPlayerState:", 4);
}

- (void)_handleAssetValuesDidLoad
{
  AVPlayer *v3;
  uint64_t v4;
  AVPlayer *player;
  id v6;
  id v7;
  AVPlayerItem *v8;
  id v9;
  void *v10;
  SUPlayerStatus *status;
  AVURLAsset *asset;
  CMTime v13;
  _QWORD v14[5];
  CMTime v15;
  uint64_t v16;

  v16 = 0;
  if (-[AVURLAsset statusOfValueForKey:error:](self->_asset, "statusOfValueForKey:error:", CFSTR("duration"), &v16) == 2
    && -[AVURLAsset statusOfValueForKey:error:](self->_asset, "statusOfValueForKey:error:", CFSTR("tracks"), &v16) == 2)
  {
    v3 = (AVPlayer *)objc_alloc_init(MEMORY[0x24BDB2610]);
    self->_player = v3;
    -[AVPlayer setAllowsExternalPlayback:](v3, "setAllowsExternalPlayback:", 0);
    -[AVPlayer addObserver:forKeyPath:options:context:](self->_player, "addObserver:forKeyPath:options:context:", self, CFSTR("status"), 0, 0);
    v4 = objc_msgSend(MEMORY[0x24BEB20C0], "weakReferenceWithObject:", self);
    player = self->_player;
    CMTimeMakeWithSeconds(&v15, 1.0, 4);
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __42__SUAudioPlayer__handleAssetValuesDidLoad__block_invoke;
    v14[3] = &unk_24DE7DF00;
    v14[4] = v4;
    v6 = -[AVPlayer addPeriodicTimeObserverForInterval:queue:usingBlock:](player, "addPeriodicTimeObserverForInterval:queue:usingBlock:", &v15, MEMORY[0x24BDAC9B8], v14);
    self->_timeObserver = v6;
    v7 = v6;
    v8 = (AVPlayerItem *)objc_msgSend(objc_alloc(MEMORY[0x24BDB2618]), "initWithAsset:", self->_asset);
    self->_playerItem = v8;
    -[AVPlayerItem addObserver:forKeyPath:options:context:](v8, "addObserver:forKeyPath:options:context:", self, CFSTR("status"), 0, 0);
    v9 = -[SUAudioPlayer _newFadeInAudioMixForAsset:](self, "_newFadeInAudioMixForAsset:", self->_asset);
    -[AVPlayerItem setAudioMix:](self->_playerItem, "setAudioMix:", v9);

    v10 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v10, "addObserver:selector:name:object:", self, sel__itemFailedToPlayToEndNotification_, *MEMORY[0x24BDB1FB8], 0);
    objc_msgSend(v10, "addObserver:selector:name:object:", self, sel__itemPlayedToEndNotification_, *MEMORY[0x24BDB1FA8], self->_playerItem);
    -[AVPlayer replaceCurrentItemWithPlayerItem:](self->_player, "replaceCurrentItemWithPlayerItem:", self->_playerItem);
    status = self->_status;
    asset = self->_asset;
    if (asset)
      -[AVURLAsset duration](asset, "duration");
    else
      memset(&v13, 0, sizeof(v13));
    -[SUPlayerStatus setDuration:](status, "setDuration:", CMTimeGetSeconds(&v13));
    -[SUAudioPlayer _postStatusChangeNotification](self, "_postStatusChangeNotification");
  }
  else
  {
    -[SUAudioPlayer _failWithError:](self, "_failWithError:", v16);
  }
}

uint64_t __42__SUAudioPlayer__handleAssetValuesDidLoad__block_invoke(uint64_t a1, CMTime *a2)
{
  void *v3;
  CMTime v5;

  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "object");
  v5 = *a2;
  return objc_msgSend(v3, "_updateForPeriodicTickWithTime:", CMTimeGetSeconds(&v5));
}

- (id)_newFadeInAudioMixForAsset:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  double v13;
  double v14;
  id v15;
  __int128 v17;
  CMTime v18;
  __int128 v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v5 = (void *)objc_msgSend(a3, "tracksWithMediaType:", *MEMORY[0x24BDB1CF0]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    v17 = *MEMORY[0x24BDC0D88];
    v9 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v10);
        v12 = objc_alloc_init(MEMORY[0x24BDB25A8]);
        objc_msgSend(v12, "setTrackID:", objc_msgSend(v11, "trackID"));
        HIDWORD(v13) = DWORD1(v17);
        v19 = v17;
        v20 = v9;
        LODWORD(v13) = 0;
        objc_msgSend(v12, "setVolume:atTime:", &v19, v13);
        CMTimeMakeWithSeconds(&v18, 0.3, 1);
        LODWORD(v14) = 1.0;
        objc_msgSend(v12, "setVolume:atTime:", &v18, v14);
        objc_msgSend(v4, "addObject:", v12);

        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v7);
  }
  v15 = objc_alloc_init(MEMORY[0x24BDB25A0]);
  objc_msgSend(v15, "setInputParameters:", v4);

  return v15;
}

- (void)_postStatusChangeNotification
{
  SUAudioPlayer *v3;

  v3 = self;
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("SUAudioPlayerStatusChangeNotification"), self);
}

- (void)_setPlayerState:(int64_t)a3
{
  if (-[SUPlayerStatus playerState](self->_status, "playerState") != a3)
  {
    -[SUPlayerStatus setPlayerState:](self->_status, "setPlayerState:", a3);
    -[SUAudioPlayer _applyNowPlayingInfo](self, "_applyNowPlayingInfo");
    -[SUAudioPlayer _postStatusChangeNotification](self, "_postStatusChangeNotification");
  }
}

- (void)_updateForPeriodicTickWithTime:(double)a3
{
  double v5;
  double v6;
  double v7;
  int64_t v8;
  float v9;
  uint64_t v10;
  uint64_t v11;
  int64_t storeItemIdentifier;
  id v13;

  -[SUPlayerStatus duration](self->_status, "duration");
  v6 = v5;
  -[SUPlayerStatus setCurrentTime:](self->_status, "setCurrentTime:", a3);
  if (v6 >= a3)
    v7 = v6;
  else
    v7 = a3;
  -[SUPlayerStatus setDuration:](self->_status, "setDuration:", v7);
  v8 = -[SUPlayerStatus playerState](self->_status, "playerState");
  -[AVPlayer rate](self->_player, "rate");
  v10 = 3;
  if (v8 != 2)
    v10 = v8;
  if (v9 <= 0.00000011921)
    v11 = v10;
  else
    v11 = 2;
  if (-[SUPlayerStatus playerState](self->_status, "playerState") != v11)
  {
    -[SUPlayerStatus setPlayerState:](self->_status, "setPlayerState:", v11);
    -[SUAudioPlayer _applyNowPlayingInfo](self, "_applyNowPlayingInfo");
  }
  if (!self->_didPostForPreviewHistory && a3 >= 5.0)
  {
    storeItemIdentifier = self->_storeItemIdentifier;
    if (storeItemIdentifier)
    {
      v13 = SUCreatePreviewHistoryOperation(storeItemIdentifier);
      objc_msgSend((id)objc_msgSend(MEMORY[0x24BEC8BE8], "mainQueue"), "addOperation:", v13);
      self->_didPostForPreviewHistory = 1;

    }
  }
  -[SUAudioPlayer _postStatusChangeNotification](self, "_postStatusChangeNotification");
}

- (NSURL)certificateURL
{
  return self->_certificateUrl;
}

- (void)setCertificateURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSURL)keyURL
{
  return self->_keyUrl;
}

- (void)setKeyURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (int64_t)storeItemIdentifier
{
  return self->_storeItemIdentifier;
}

- (void)setStoreItemIdentifier:(int64_t)a3
{
  self->_storeItemIdentifier = a3;
}

- (NSURL)URL
{
  return self->_url;
}

@end
