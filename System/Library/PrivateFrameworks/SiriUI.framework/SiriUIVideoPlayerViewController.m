@implementation SiriUIVideoPlayerViewController

- (SiriUIVideoPlayerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  SiriUIVideoPlayerViewController *v4;
  SiriUIVideoPlayerViewController *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SiriUIVideoPlayerViewController;
  v4 = -[SiriUIVideoPlayerViewController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_observingPlayerStatus = 0;
    v4->_observingItemStatus = 0;
    v4->_observingPlayback = 0;
    v4->_observingViewController = 0;
    v4->_playerStatusObserverContext = &v4->_observingPlayerStatus;
    v4->_itemStatusObserverContext = &v4->_observingItemStatus;
    -[SiriUIVideoPlayerViewController player](v4, "player");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      -[SiriUIVideoPlayerViewController _registerObservers](v5, "_registerObservers");
  }
  return v5;
}

- (void)setPlayer:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  -[SiriUIVideoPlayerViewController player](self, "player");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    -[SiriUIVideoPlayerViewController player](self, "player");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[SiriUIVideoPlayerViewController _removeObservers](self, "_removeObservers");
      -[SiriUIVideoPlayerViewController _restoreAudioPlaybackCategoryAndOptions](self, "_restoreAudioPlaybackCategoryAndOptions");
    }
    v7.receiver = self;
    v7.super_class = (Class)SiriUIVideoPlayerViewController;
    -[SiriUIVideoPlayerViewController setPlayer:](&v7, sel_setPlayer_, v4);
    -[SiriUIVideoPlayerViewController _registerObservers](self, "_registerObservers");
  }

}

- (void)dealloc
{
  objc_super v3;

  -[SiriUIVideoPlayerViewController _removeObservers](self, "_removeObservers");
  v3.receiver = self;
  v3.super_class = (Class)SiriUIVideoPlayerViewController;
  -[SiriUIVideoPlayerViewController dealloc](&v3, sel_dealloc);
}

- (void)doneButtonTapped:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = (void *)MEMORY[0x24BDD16D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16C8], "notificationWithName:object:", CFSTR("AVPlayerViewControllerUserDidTapDoneButtonNotification"), self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotification:", v7);

  v8.receiver = self;
  v8.super_class = (Class)SiriUIVideoPlayerViewController;
  -[SiriUIVideoPlayerViewController doneButtonTapped:](&v8, sel_doneButtonTapped_, v5);

}

- (BOOL)shouldPlayHighResolutionContent
{
  void *v2;
  double Width;
  double v4;
  const __SCNetworkReachability *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  char v12;
  id v14;
  SCNetworkReachabilityFlags flags;
  sockaddr address;
  uint64_t v17;
  CGRect v18;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  Width = CGRectGetWidth(v18);
  objc_msgSend(v2, "scale");
  if (Width * v4 <= 320.0)
  {
    v12 = 0;
  }
  else
  {
    address = (sockaddr)xmmword_217697D40;
    v5 = SCNetworkReachabilityCreateWithAddress(0, &address);
    flags = 0;
    SCNetworkReachabilityGetFlags(v5, &flags);
    CFRelease(v5);
    if ((~flags & 0x40002) != 0)
    {
      v12 = 1;
    }
    else
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC2810]), "initWithQueue:", 0);
      v14 = 0;
      objc_msgSend(v6, "getDataStatus:error:", 0, &v14);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v14;
      if (v7)
      {
        objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24D7EF540);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v7, "indicator"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "containsObject:", v10);

        v12 = v11 ^ 1;
      }
      else
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
          -[SiriUIVideoPlayerViewController shouldPlayHighResolutionContent].cold.1();
        v12 = 1;
      }

    }
  }

  return v12;
}

- (void)_playbackDidFinish:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  -[SiriUIVideoPlayerViewController videoPlayerControllerDelegate](self, "videoPlayerControllerDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[SiriUIVideoPlayerViewController videoPlayerControllerDelegate](self, "videoPlayerControllerDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "playbackDidFinishForVideoPlayerViewController:", self);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:", CFSTR("SiriUIVideoPlaybackDidFinishNotification"), self);

  }
}

- (void)_registerObservers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (!self->_observingPlayerStatus)
  {
    -[SiriUIVideoPlayerViewController player](self, "player");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_status);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:forKeyPath:options:context:", self, v4, 1, self->_playerStatusObserverContext);

    self->_observingPlayerStatus = 1;
  }
  -[SiriUIVideoPlayerViewController player](self, "player");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentItem");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (!self->_observingItemStatus)
  {
    NSStringFromSelector(sel_status);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:forKeyPath:options:context:", self, v6, 1, self->_itemStatusObserverContext);

    self->_observingItemStatus = 1;
  }
  if (!self->_observingPlayback)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__playbackDidFinish_, *MEMORY[0x24BDB1FA8], v10);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__playbackDidFinish_, *MEMORY[0x24BDB1FB8], v10);

    self->_observingPlayback = 1;
  }
  if (!self->_observingViewController)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", self, sel__playbackDidFinish_, CFSTR("AVPlayerViewControllerUserDidTapDoneButtonNotification"), self);

    self->_observingViewController = 1;
  }

}

- (void)_removeObservers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  if (self->_observingPlayerStatus)
  {
    -[SiriUIVideoPlayerViewController player](self, "player");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "currentItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_status);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:forKeyPath:context:", self, v5, self->_itemStatusObserverContext);

    self->_observingPlayerStatus = 0;
  }
  if (self->_observingItemStatus)
  {
    -[SiriUIVideoPlayerViewController player](self, "player");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_status);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:forKeyPath:context:", self, v7, self->_playerStatusObserverContext);

    self->_observingItemStatus = 0;
  }
  if (self->_observingPlayback)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x24BDB1FA8];
    -[SiriUIVideoPlayerViewController player](self, "player");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "currentItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObserver:name:object:", self, v9, v11);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *MEMORY[0x24BDB1FB8];
    -[SiriUIVideoPlayerViewController player](self, "player");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "currentItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObserver:name:object:", self, v13, v15);

    self->_observingPlayback = 0;
  }
  if (self->_observingViewController)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeObserver:name:object:", self, CFSTR("AVPlayerViewControllerUserDidTapDoneButtonNotification"), self);

    self->_observingViewController = 0;
  }
}

- (void)_updateAudioSessionCategory
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0_0(&dword_21764F000, v0, v1, "%s Unable to set audio session category from %{public}@ to AVAudioSessionCategoryPlayback: %{public}@", v2);
}

- (void)_restoreAudioPlaybackCategoryAndOptions
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_21764F000, v0, v1, "%s Expected audio session category to be AVAudioSessionCategoryPlayback, but was %{public}@; not changing post-trailer-playback",
    v2,
    v3,
    v4,
    v5,
    2u);
  OUTLINED_FUNCTION_2();
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString **v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (self->_playerStatusObserverContext == a6)
  {
    if (objc_msgSend(v11, "status") == 1)
    {
      -[SiriUIVideoPlayerViewController _updateAudioSessionCategory](self, "_updateAudioSessionCategory");
      objc_msgSend(v11, "play");
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      v19 = SiriUIVideoPlaybackDidStartNotification;
      goto LABEL_10;
    }
  }
  else if (self->_itemStatusObserverContext == a6 && objc_msgSend(v11, "status") == 2)
  {
    v13 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      -[SiriUIVideoPlayerViewController observeValueForKeyPath:ofObject:change:context:].cold.1(v13);
    -[SiriUIVideoPlayerViewController videoPlayerControllerDelegate](self, "videoPlayerControllerDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_opt_respondsToSelector();

    if ((v15 & 1) != 0)
    {
      -[SiriUIVideoPlayerViewController videoPlayerControllerDelegate](self, "videoPlayerControllerDelegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "playbackDidFailForVideoPlayerViewController:", self);

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      v19 = SiriUIVideoPlaybackDidFinishNotification;
LABEL_10:
      objc_msgSend(v17, "postNotificationName:object:", *v19, self);

    }
  }

}

- (SiriUIVideoPlayerViewControllerDelegate)videoPlayerControllerDelegate
{
  return (SiriUIVideoPlayerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_videoPlayerControllerDelegate);
}

- (void)setVideoPlayerControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_videoPlayerControllerDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_videoPlayerControllerDelegate);
  objc_storeStrong((id *)&self->_savedAudioSessionCategory, 0);
}

- (void)shouldPlayHighResolutionContent
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_21764F000, v0, v1, "%s Unable to determine the current CTDataStatus: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)observeValueForKeyPath:(os_log_t)log ofObject:change:context:.cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[SiriUIVideoPlayerViewController observeValueForKeyPath:ofObject:change:context:]";
  _os_log_error_impl(&dword_21764F000, log, OS_LOG_TYPE_ERROR, "%s Unable to play video: no media types are available", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

@end
