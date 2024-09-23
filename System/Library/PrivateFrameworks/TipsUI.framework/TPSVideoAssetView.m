@implementation TPSVideoAssetView

- (void)dealloc
{
  objc_super v3;

  -[TPSVideoAssetView stopVideoPlayer](self, "stopVideoPlayer");
  -[TPSVideoAssetView cancelVideoDownloadTask](self, "cancelVideoDownloadTask");
  -[TPSKVOManager removeAllKVOObjects](self->_KVOManager, "removeAllKVOObjects");
  v3.receiver = self;
  v3.super_class = (Class)TPSVideoAssetView;
  -[TPSVideoAssetView dealloc](&v3, sel_dealloc);
}

- (void)commonInit
{
  TPSKVOManager *v3;
  TPSKVOManager *KVOManager;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TPSVideoAssetView;
  -[TPSImageAssetView commonInit](&v5, sel_commonInit);
  v3 = (TPSKVOManager *)objc_msgSend(objc_alloc(MEMORY[0x24BEB7D60]), "initWithObserver:", self);
  KVOManager = self->_KVOManager;
  self->_KVOManager = v3;

  self->_videoDelayTime = 0.4;
}

- (void)setVideoDelegate:(id)a3
{
  id WeakRetained;
  id v5;
  id v6;
  id v7;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_videoDelegate);

  if (WeakRetained != obj)
  {
    v5 = objc_storeWeak((id *)&self->_videoDelegate, obj);
    self->_supportsVideoAssetViewCanShowMedia = objc_opt_respondsToSelector() & 1;

    v6 = objc_loadWeakRetained((id *)&self->_videoDelegate);
    self->_supportsVideoAssetViewFinishedPlayingVideo = objc_opt_respondsToSelector() & 1;

    v7 = objc_loadWeakRetained((id *)&self->_videoDelegate);
    self->_supportsVideoAssetViewUpdateAssetLoadingFinished = objc_opt_respondsToSelector() & 1;

  }
}

- (void)setAspectFillAsset:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[TPSImageAssetView aspectFillAsset](self, "aspectFillAsset") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)TPSVideoAssetView;
    -[TPSImageAssetView setAspectFillAsset:](&v5, sel_setAspectFillAsset_, v3);
    -[TPSVideoAssetView updateVideoGravity](self, "updateVideoGravity");
  }
}

- (void)setVideoPath:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[NSString isEqualToString:](self->_videoPath, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_videoPath, a3);
    -[TPSVideoAssetView resetVideoPlayer](self, "resetVideoPlayer");
  }

}

- (void)updateVideoGravity
{
  _BOOL4 v3;
  _QWORD *v4;

  v3 = -[TPSImageAssetView aspectFillAsset](self, "aspectFillAsset");
  v4 = (_QWORD *)MEMORY[0x24BDB1C80];
  if (!v3)
    v4 = (_QWORD *)MEMORY[0x24BDB1C78];
  -[AVPlayerLayer setVideoGravity:](self->_avplayerLayer, "setVideoGravity:", *v4);
}

- (void)removeVideoPlayerLayer
{
  -[AVPlayer pause](self->_avplayer, "pause");
  -[AVPlayerLayer removeFromSuperlayer](self->_avplayerLayer, "removeFromSuperlayer");
}

- (void)resetVideoPlayer
{
  -[TPSVideoAssetView cancelVideoDownloadTask](self, "cancelVideoDownloadTask");
  -[TPSVideoAssetView cancelReplayButtonTimer](self, "cancelReplayButtonTimer");
  -[TPSVideoAssetView updateReplayButtonHiddenState:](self, "updateReplayButtonHiddenState:", 1);
  -[TPSVideoAssetView stopVideoPlayer](self, "stopVideoPlayer");
  -[AVPlayer replaceCurrentItemWithPlayerItem:](self->_avplayer, "replaceCurrentItemWithPlayerItem:", 0);
  -[TPSVideoAssetView scrubVideoToFirstFrame](self, "scrubVideoToFirstFrame");
}

- (void)scrubVideoToFirstFrame
{
  void *v3;
  AVPlayer *avplayer;
  void *v5;
  void *v6;
  id v7;
  __int128 v8;
  uint64_t v9;

  if (!self->_lastFrameDominant || !-[TPSVideoAssetView displayingVideoLastFrame](self, "displayingVideoLastFrame"))
  {
    -[AVPlayer currentItem](self->_avplayer, "currentItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      avplayer = self->_avplayer;
      v8 = *MEMORY[0x24BDC0D88];
      v9 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
      -[AVPlayer seekToTime:](avplayer, "seekToTime:", &v8);
    }
    else
    {
      -[TPSImageAssetView currentDisplayIdentifier](self, "currentDisplayIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[TPSImageAssetController imageFromMemoryCacheForIdentifier:](TPSImageAssetController, "imageFromMemoryCacheForIdentifier:", v5);
      v7 = (id)objc_claimAutoreleasedReturnValue();

      v6 = v7;
      if (v7)
      {
        -[TPSImageAssetView setImage:](self, "setImage:", v7);
        v6 = v7;
      }

    }
  }
}

- (void)continuePlayVideo
{
  self->_videoPlaybackFinished = 0;
  -[TPSVideoAssetView playVideo](self, "playVideo");
}

- (BOOL)videoInProgress
{
  return self->_avplayer || self->_avplayerLayer || self->_videoURLSessionItem != 0;
}

- (void)playVideo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSString *videoPath;
  void *v8;
  int v9;
  double v10;
  TPSURLSessionItem *v11;
  TPSURLSessionItem *videoURLSessionItem;
  id WeakRetained;
  _QWORD v14[4];
  id v15;
  id location;

  if (!self->_lastFrameDominant
    || !-[TPSVideoAssetView displayingVideoLastFrame](self, "displayingVideoLastFrame")
    || -[AVPlayer timeControlStatus](self->_avplayer, "timeControlStatus") != AVPlayerTimeControlStatusPlaying)
  {
    if (!self->_videoPath)
      goto LABEL_15;
    if (self->_videoURLSessionItem)
      goto LABEL_16;
    -[AVPlayerLayer superlayer](self->_avplayerLayer, "superlayer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      -[TPSImageAssetView imageView](self, "imageView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "layer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addSublayer:", self->_avplayerLayer);

    }
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x24BEB7CF8], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    videoPath = self->_videoPath;
    -[TPSVideoAssetView cacheVideoIdentifier](self, "cacheVideoIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x24BDD1350];
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __30__TPSVideoAssetView_playVideo__block_invoke;
    v14[3] = &unk_24C5DDCE0;
    objc_copyWeak(&v15, &location);
    LODWORD(v10) = v9;
    objc_msgSend(v6, "formattedDataForPath:identifier:attributionIdentifier:priority:completionHandler:", videoPath, v8, 0, v14, v10);
    v11 = (TPSURLSessionItem *)objc_claimAutoreleasedReturnValue();
    videoURLSessionItem = self->_videoURLSessionItem;
    self->_videoURLSessionItem = v11;

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
    if (self->_videoPath)
    {
LABEL_16:
      if (!self->_videoPlaybackFinished)
      {
        objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_playVideoDelay, 0);
        -[TPSVideoAssetView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_playVideoDelay, 0, self->_videoDelayTime);
      }
    }
    else
    {
LABEL_15:
      if (self->_supportsVideoAssetViewUpdateAssetLoadingFinished)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_videoDelegate);
        objc_msgSend(WeakRetained, "videoAssetViewUpdateAssetLoadingFinished:error:", self, 0);

      }
    }
  }
}

void __30__TPSVideoAssetView_playVideo__block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  id v9;
  id v10;
  id WeakRetained;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;

  v9 = a3;
  v10 = a7;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v12 = WeakRetained;
  if (v10)
  {
    if (objc_msgSend(WeakRetained, "supportsVideoAssetViewUpdateAssetLoadingFinished"))
    {
      objc_msgSend(MEMORY[0x24BEB7D68], "data");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        __30__TPSVideoAssetView_playVideo__block_invoke_cold_1(v12, (uint64_t)v10, v13);

      objc_msgSend(v12, "videoDelegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "videoAssetViewUpdateAssetLoadingFinished:error:", v12, v10);

    }
  }
  else
  {
    objc_msgSend(v9, "path");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDownloadedVideoPath:", v15);

    if (objc_msgSend(v12, "readyToDisplayAVPlayer"))
      objc_msgSend(v12, "playVideoDelay");
  }
  objc_msgSend(v12, "setVideoURLSessionItem:", 0);

}

- (void)playVideoDelay
{
  id v3;
  int v4;
  float v5;
  id WeakRetained;
  uint64_t v7;
  void *v8;
  AVPlayer *avplayer;
  AVPlayer *v10;
  AVPlayer *v11;
  AVPlayerLayer *v12;
  AVPlayerLayer *avplayerLayer;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  TPSKVOManager *KVOManager;
  void *v22;
  id v23;

  if (!self->_supportsVideoAssetViewCanShowMedia
    || (v3 = objc_loadWeakRetained((id *)&self->_videoDelegate),
        v4 = objc_msgSend(v3, "videoAssetViewCanDisplayAssets:", self),
        v3,
        v4))
  {
    objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_playVideoDelay, 0);
    -[TPSVideoAssetView cancelReplayButtonTimer](self, "cancelReplayButtonTimer");
    self->_readyToDisplayAVPlayer = 1;
    if (self->_downloadedVideoPath)
    {
      -[AVPlayer rate](self->_avplayer, "rate");
      if (v5 == 0.0 && !self->_videoPlaybackFinished)
      {
        if (self->_supportsVideoAssetViewUpdateAssetLoadingFinished)
        {
          WeakRetained = objc_loadWeakRetained((id *)&self->_videoDelegate);
          objc_msgSend(WeakRetained, "videoAssetViewUpdateAssetLoadingFinished:error:", self, 0);

        }
        objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", self->_downloadedVideoPath, 0);
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = (void *)v7;
        if (v7)
        {
          objc_msgSend(MEMORY[0x24BDB2618], "playerItemWithURL:", v7);
          v7 = objc_claimAutoreleasedReturnValue();
        }
        v23 = (id)v7;
        avplayer = self->_avplayer;
        if (avplayer)
        {
          -[AVPlayer replaceCurrentItemWithPlayerItem:](avplayer, "replaceCurrentItemWithPlayerItem:", v23);
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDB2610], "playerWithPlayerItem:", v23);
          v10 = (AVPlayer *)objc_claimAutoreleasedReturnValue();
          v11 = self->_avplayer;
          self->_avplayer = v10;

          -[AVPlayer setActionAtItemEnd:](self->_avplayer, "setActionAtItemEnd:", 1);
          -[AVPlayer setAllowsExternalPlayback:](self->_avplayer, "setAllowsExternalPlayback:", 0);
          -[AVPlayer setMuted:](self->_avplayer, "setMuted:", 1);
          -[AVPlayer _setDisallowsVideoLayerDisplayCompositing:](self->_avplayer, "_setDisallowsVideoLayerDisplayCompositing:", 1);
          objc_msgSend(MEMORY[0x24BDB2648], "playerLayerWithPlayer:", self->_avplayer);
          v12 = (AVPlayerLayer *)objc_claimAutoreleasedReturnValue();
          avplayerLayer = self->_avplayerLayer;
          self->_avplayerLayer = v12;

          -[TPSImageAssetView imageView](self, "imageView");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "layer");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addSublayer:", self->_avplayerLayer);

          -[AVPlayerLayer frame](self->_avplayerLayer, "frame");
          v17 = v16;
          v19 = v18;
          -[TPSVideoAssetView bounds](self, "bounds");
          -[AVPlayerLayer setFrame:](self->_avplayerLayer, "setFrame:", v17, v19);
          -[TPSVideoAssetView updateVideoGravity](self, "updateVideoGravity");
        }
        if (v23)
        {
          if (!self->_registeredForAVPlayerNotification)
          {
            self->_registeredForAVPlayerNotification = 1;
            objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "addObserver:selector:name:object:", self, sel_avplayerDidFinishPlaying_, *MEMORY[0x24BDB1FA8], 0);

            KVOManager = self->_KVOManager;
            -[AVPlayer currentItem](self->_avplayer, "currentItem");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[TPSKVOManager addKVOObject:forKeyPath:options:context:](KVOManager, "addKVOObject:forKeyPath:options:context:", v22, CFSTR("error"), 1, sel_avplayerItemErrorChanged_);

          }
          -[TPSVideoAssetView updateReplayButtonHiddenState:](self, "updateReplayButtonHiddenState:", 1);
          -[AVPlayer play](self->_avplayer, "play");
        }

      }
    }
  }
}

- (void)fetchImageWithIdentifier:(id)a3 path:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v9;

  v6 = a3;
  v7 = a4;
  if (self->_lastFrameDominant && -[TPSVideoAssetView updateImageToVideoLastFrame](self, "updateImageToVideoLastFrame"))
  {
    -[TPSImageAssetView setCurrentImagePath:](self, "setCurrentImagePath:", v7);
    -[TPSImageAssetView delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "imageAssetViewImageUpdated:", self);

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)TPSVideoAssetView;
    -[TPSImageAssetView fetchImageWithIdentifier:path:](&v9, sel_fetchImageWithIdentifier_path_, v6, v7);
  }

}

- (void)avplayerItemErrorChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[AVPlayer currentItem](self->_avplayer, "currentItem");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 == v8)
  {
    objc_msgSend(v8, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(MEMORY[0x24BEB7CF8], "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[TPSVideoAssetView cacheVideoIdentifier](self, "cacheVideoIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeCacheForIdentifier:", v7);

    }
  }

}

- (void)updateReplayButtonHiddenState:(BOOL)a3
{
  _BOOL8 v3;
  _QWORD v5[5];
  _QWORD v6[5];

  v3 = a3;
  -[UIButton setHidden:](self->_replayButton, "setHidden:");
  -[UIImageView setHidden:](self->_replayGradientView, "setHidden:", v3);
  if (!v3)
  {
    -[UIButton setAlpha:](self->_replayButton, "setAlpha:", 0.0);
    -[UIImageView setAlpha:](self->_replayGradientView, "setAlpha:", 0.0);
    v5[4] = self;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __51__TPSVideoAssetView_updateReplayButtonHiddenState___block_invoke;
    v6[3] = &unk_24C5DDBD0;
    v6[4] = self;
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __51__TPSVideoAssetView_updateReplayButtonHiddenState___block_invoke_2;
    v5[3] = &unk_24C5DDD08;
    objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:completion:", v6, v5, 1.0);
  }
}

void __51__TPSVideoAssetView_updateReplayButtonHiddenState___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "replayButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "replayGradientView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 1.0);

}

void __51__TPSVideoAssetView_updateReplayButtonHiddenState___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "replayButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "replayGradientView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 1.0);

}

- (void)replayVideo
{
  AVPlayer *avplayer;
  __int128 v4;
  uint64_t v5;

  -[TPSVideoAssetView cancelReplayButtonTimer](self, "cancelReplayButtonTimer");
  -[TPSVideoAssetView updateReplayButtonHiddenState:](self, "updateReplayButtonHiddenState:", 1);
  avplayer = self->_avplayer;
  v4 = *MEMORY[0x24BDC0D88];
  v5 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
  -[AVPlayer seekToTime:](avplayer, "seekToTime:", &v4);
  -[AVPlayer pause](self->_avplayer, "pause");
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_restartVideoDelay, 0);
  -[TPSVideoAssetView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_restartVideoDelay, 0, self->_videoDelayTime);
}

- (void)restartVideoDelay
{
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_restartVideoDelay, 0);
  -[AVPlayer play](self->_avplayer, "play");
}

- (void)stopVideoPlayer
{
  void *v3;
  TPSKVOManager *KVOManager;
  void *v5;
  double v6;
  NSString *downloadedVideoPath;

  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_restartVideoDelay, 0);
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_playVideoDelay, 0);
  if (self->_registeredForAVPlayerNotification)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDB1FA8], 0);

    KVOManager = self->_KVOManager;
    -[AVPlayer currentItem](self->_avplayer, "currentItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSKVOManager removeKVOObject:forKeyPath:](KVOManager, "removeKVOObject:forKeyPath:", v5, CFSTR("error"));

    self->_registeredForAVPlayerNotification = 0;
  }
  -[AVPlayer pause](self->_avplayer, "pause");
  LODWORD(v6) = 0;
  -[AVPlayer setRate:](self->_avplayer, "setRate:", v6);
  self->_readyToDisplayAVPlayer = 0;
  self->_videoPlaybackFinished = 0;
  downloadedVideoPath = self->_downloadedVideoPath;
  self->_downloadedVideoPath = 0;

}

- (BOOL)displayingVideoLastFrame
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v9;
  uint64_t v10;

  -[AVPlayer currentItem](self->_avplayer, "currentItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_videoPlaybackFinished)
  {
    if (v3)
    {
      objc_msgSend(v3, "currentTime");
      v5 = v10;
      objc_msgSend(v4, "duration");
      v6 = v9;
    }
    else
    {
      v6 = 0;
      v5 = 0;
    }
    v7 = v5 == v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime
{
  void *v4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  void *v6;

  -[AVPlayer currentItem](self->_avplayer, "currentItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    objc_msgSend(v4, "currentTime");
    v4 = v6;
  }
  else
  {
    retstr->var0 = 0;
    *(_QWORD *)&retstr->var1 = 0;
    retstr->var3 = 0;
  }

  return result;
}

- (BOOL)updateImageToVideoLastFrame
{
  void *v3;
  void *v4;
  uint64_t v5;
  AVPlayer *avplayer;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;

  v10 = 0uLL;
  v11 = 0;
  -[AVPlayer currentItem](self->_avplayer, "currentItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "duration");
  }
  else
  {
    v10 = 0uLL;
    v11 = 0;
  }

  v5 = v10;
  if ((uint64_t)v10 >= 1)
  {
    avplayer = self->_avplayer;
    v8 = v10;
    v9 = v11;
    -[AVPlayer seekToTime:](avplayer, "seekToTime:", &v8);
  }
  return v5 > 0;
}

- (void)avplayerDidFinishPlaying:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  id WeakRetained;
  void *v9;
  NSTimer *v10;
  NSTimer *replayButtonTimer;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;

  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlayer currentItem](self->_avplayer, "currentItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if (v7)
  {
    self->_videoPlaybackFinished = 1;
    if (self->_supportsVideoAssetViewFinishedPlayingVideo)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_videoDelegate);
      objc_msgSend(WeakRetained, "videoAssetViewFinishedPlayingVideo:", self);

    }
    if (self->_replayButton)
    {
      objc_initWeak(&location, self);
      v9 = (void *)MEMORY[0x24BDBCF40];
      v13 = MEMORY[0x24BDAC760];
      v14 = 3221225472;
      v15 = __46__TPSVideoAssetView_avplayerDidFinishPlaying___block_invoke;
      v16 = &unk_24C5DDD30;
      objc_copyWeak(&v17, &location);
      objc_msgSend(v9, "timerWithTimeInterval:repeats:block:", 0, &v13, 4.0);
      v10 = (NSTimer *)objc_claimAutoreleasedReturnValue();
      replayButtonTimer = self->_replayButtonTimer;
      self->_replayButtonTimer = v10;

      objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop", v13, v14, v15, v16);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addTimer:forMode:", self->_replayButtonTimer, *MEMORY[0x24BDBCA90]);

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
  }

}

void __46__TPSVideoAssetView_avplayerDidFinishPlaying___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateReplayButtonHiddenState:", 0);

}

- (void)cancel
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TPSVideoAssetView;
  -[TPSImageAssetView cancel](&v3, sel_cancel);
  -[TPSVideoAssetView cancelVideoDownloadTask](self, "cancelVideoDownloadTask");
  -[TPSVideoAssetView cancelReplayButtonTimer](self, "cancelReplayButtonTimer");
}

- (void)cancelVideoDownloadTask
{
  void *v3;
  TPSURLSessionItem *videoURLSessionItem;

  objc_msgSend(MEMORY[0x24BEB7DC8], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelSessionItem:", self->_videoURLSessionItem);

  videoURLSessionItem = self->_videoURLSessionItem;
  self->_videoURLSessionItem = 0;

}

- (void)cancelReplayButtonTimer
{
  NSTimer *replayButtonTimer;

  -[NSTimer invalidate](self->_replayButtonTimer, "invalidate");
  replayButtonTimer = self->_replayButtonTimer;
  self->_replayButtonTimer = 0;

}

- (void)layoutSubviews
{
  AVPlayerLayer *avplayerLayer;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)TPSVideoAssetView;
  -[TPSImageAssetView layoutSubviews](&v15, sel_layoutSubviews);
  avplayerLayer = self->_avplayerLayer;
  if (avplayerLayer)
  {
    -[AVPlayerLayer frame](avplayerLayer, "frame");
    v5 = v4;
    v7 = v6;
    -[TPSVideoAssetView bounds](self, "bounds");
    v9 = v8;
    v11 = v10;
    -[AVPlayerLayer frame](self->_avplayerLayer, "frame");
    if (v9 != v13 || v11 != v12)
      -[AVPlayerLayer setFrame:](self->_avplayerLayer, "setFrame:", v5, v7, v9, v11);
  }
}

- (TPSVideoAssetViewDelegate)videoDelegate
{
  return (TPSVideoAssetViewDelegate *)objc_loadWeakRetained((id *)&self->_videoDelegate);
}

- (BOOL)videoPlaybackFinished
{
  return self->_videoPlaybackFinished;
}

- (void)setVideoPlaybackFinished:(BOOL)a3
{
  self->_videoPlaybackFinished = a3;
}

- (BOOL)lastFrameDominant
{
  return self->_lastFrameDominant;
}

- (void)setLastFrameDominant:(BOOL)a3
{
  self->_lastFrameDominant = a3;
}

- (double)videoDelayTime
{
  return self->_videoDelayTime;
}

- (void)setVideoDelayTime:(double)a3
{
  self->_videoDelayTime = a3;
}

- (UIImage)lastFrameImage
{
  return self->_lastFrameImage;
}

- (void)setLastFrameImage:(id)a3
{
  objc_storeStrong((id *)&self->_lastFrameImage, a3);
}

- (NSString)cacheVideoIdentifier
{
  return self->_cacheVideoIdentifier;
}

- (void)setCacheVideoIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_cacheVideoIdentifier, a3);
}

- (NSString)videoPath
{
  return self->_videoPath;
}

- (NSString)downloadedVideoPath
{
  return self->_downloadedVideoPath;
}

- (void)setDownloadedVideoPath:(id)a3
{
  objc_storeStrong((id *)&self->_downloadedVideoPath, a3);
}

- (UIButton)replayButton
{
  return self->_replayButton;
}

- (void)setReplayButton:(id)a3
{
  objc_storeStrong((id *)&self->_replayButton, a3);
}

- (UIImageView)replayGradientView
{
  return self->_replayGradientView;
}

- (void)setReplayGradientView:(id)a3
{
  objc_storeStrong((id *)&self->_replayGradientView, a3);
}

- (BOOL)readyToDisplayAVPlayer
{
  return self->_readyToDisplayAVPlayer;
}

- (void)setReadyToDisplayAVPlayer:(BOOL)a3
{
  self->_readyToDisplayAVPlayer = a3;
}

- (BOOL)supportsVideoAssetViewCanShowMedia
{
  return self->_supportsVideoAssetViewCanShowMedia;
}

- (void)setSupportsVideoAssetViewCanShowMedia:(BOOL)a3
{
  self->_supportsVideoAssetViewCanShowMedia = a3;
}

- (BOOL)supportsVideoAssetViewFinishedPlayingVideo
{
  return self->_supportsVideoAssetViewFinishedPlayingVideo;
}

- (void)setSupportsVideoAssetViewFinishedPlayingVideo:(BOOL)a3
{
  self->_supportsVideoAssetViewFinishedPlayingVideo = a3;
}

- (BOOL)supportsVideoAssetViewUpdateAssetLoadingFinished
{
  return self->_supportsVideoAssetViewUpdateAssetLoadingFinished;
}

- (void)setSupportsVideoAssetViewUpdateAssetLoadingFinished:(BOOL)a3
{
  self->_supportsVideoAssetViewUpdateAssetLoadingFinished = a3;
}

- (TPSURLSessionItem)videoURLSessionItem
{
  return self->_videoURLSessionItem;
}

- (void)setVideoURLSessionItem:(id)a3
{
  objc_storeStrong((id *)&self->_videoURLSessionItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoURLSessionItem, 0);
  objc_storeStrong((id *)&self->_replayGradientView, 0);
  objc_storeStrong((id *)&self->_replayButton, 0);
  objc_storeStrong((id *)&self->_downloadedVideoPath, 0);
  objc_storeStrong((id *)&self->_videoPath, 0);
  objc_storeStrong((id *)&self->_cacheVideoIdentifier, 0);
  objc_storeStrong((id *)&self->_lastFrameImage, 0);
  objc_destroyWeak((id *)&self->_videoDelegate);
  objc_storeStrong((id *)&self->_KVOManager, 0);
  objc_storeStrong((id *)&self->_replayButtonTimer, 0);
  objc_storeStrong((id *)&self->_avplayerLayer, 0);
  objc_storeStrong((id *)&self->_avplayer, 0);
}

void __30__TPSVideoAssetView_playVideo__block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "videoPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_debug_impl(&dword_20CF80000, a3, OS_LOG_TYPE_DEBUG, "Video asset path %@ fetch error: %@", (uint8_t *)&v6, 0x16u);

}

@end
