@implementation TVPVideoView

void __26__TVPVideoView_initialize__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v1 = (void *)sPreservedVideoViews;
  sPreservedVideoViews = (uint64_t)v0;

}

- (void)setVideoGravity:(int64_t)a3
{
  id *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  self->_videoGravity = a3;
  v9 = (id)*MEMORY[0x24BDB1C78];
  if (a3 == 2)
  {
    v5 = (id *)MEMORY[0x24BDB1C70];
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    v5 = (id *)MEMORY[0x24BDB1C80];
LABEL_5:
    v6 = *v5;

    v9 = v6;
  }
  -[TVPVideoView playerLayerView](self, "playerLayerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "avPlayerLayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setVideoGravity:", v9);

}

- (void)setPlayer:(id)a3
{
  TVPAVFPlayback *v5;
  TVPAVFPlayback **p_player;
  TVPAVFPlayback *player;
  void *v8;
  TVPAVFPlayback *v9;
  void *v10;
  void *v11;
  TVPAVFPlayback *v12;

  v5 = (TVPAVFPlayback *)a3;
  p_player = &self->_player;
  player = self->_player;
  v12 = v5;
  if (player != v5)
  {
    if (player)
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeObserver:name:object:", self, CFSTR("TVPPlayerStillImageDidChangeNotification"), *p_player);

      v9 = *p_player;
    }
    else
    {
      v9 = 0;
    }
    -[TVPAVFPlayback removeWeakReferenceToVideoView:](v9, "removeWeakReferenceToVideoView:", self);
    objc_storeStrong((id *)&self->_player, a3);
    -[TVPAVFPlayback addWeakReferenceToVideoView:](*p_player, "addWeakReferenceToVideoView:", self);
    -[TVPAVFPlayback avPlayer](*p_player, "avPlayer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVPVideoView setAVPlayer:](self, "setAVPlayer:", v10);

    if (*p_player)
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObserver:selector:name:object:", self, sel__playerStillImageDidChange_, CFSTR("TVPPlayerStillImageDidChangeNotification"), *p_player);

    }
  }

}

- (void)setAVPlayer:(id)a3
{
  TVPPlayerLayerView *playerLayerView;
  id v4;
  id v5;

  playerLayerView = self->_playerLayerView;
  v4 = a3;
  -[TVPPlayerLayerView avPlayerLayer](playerLayerView, "avPlayerLayer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPlayer:", v4);

}

- (TVPPlayerLayerView)playerLayerView
{
  return self->_playerLayerView;
}

- (BOOL)isPrimarySubtitleDisplayer
{
  return self->_isPrimarySubtitleDisplayer;
}

- (TVPVideoView)initWithFrame:(CGRect)a3
{
  TVPVideoView *v3;
  TVPVideoView *v4;
  TVPPlayerLayerView *v5;
  uint64_t v6;
  TVPPlayerLayerView *playerLayerView;
  TVPPlayerLayerView *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TVPVideoView;
  v3 = -[TVPVideoView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_isPrimarySubtitleDisplayer = 1;
    v5 = [TVPPlayerLayerView alloc];
    -[TVPVideoView bounds](v4, "bounds");
    v6 = -[TVPPlayerLayerView initWithFrame:](v5, "initWithFrame:");
    playerLayerView = v4->_playerLayerView;
    v4->_playerLayerView = (TVPPlayerLayerView *)v6;

    -[TVPPlayerLayerView addObserver:forKeyPath:options:context:](v4->_playerLayerView, "addObserver:forKeyPath:options:context:", v4, CFSTR("avPlayerLayer.readyForDisplay"), 0, AVPlayerLayerReadyForDisplayKVOContext);
    -[TVPPlayerLayerView setAutoresizingMask:](v4->_playerLayerView, "setAutoresizingMask:", 18);
    v8 = v4->_playerLayerView;
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVPPlayerLayerView setBackgroundColor:](v8, "setBackgroundColor:", v9);

    -[TVPVideoView addSubview:](v4, "addSubview:", v4->_playerLayerView);
    -[TVPVideoView setClipsToBounds:](v4, "setClipsToBounds:", 1);
  }
  return v4;
}

+ (void)initialize
{
  if (initialize_onceToken_4 != -1)
    dispatch_once(&initialize_onceToken_4, &__block_literal_global_9);
}

+ (void)preserveVideoViewForReuse:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void **p_vtable;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "player");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v6)
    goto LABEL_19;
  if (!v7)
    goto LABEL_19;
  if (!v8)
    goto LABEL_19;
  objc_msgSend(v8, "state");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[TVPPlaybackState stopped](TVPPlaybackState, "stopped");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 == v11)
    goto LABEL_19;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  p_vtable = TVPChapterCollection.vtable;
  objc_msgSend((id)sPreservedVideoViews, "allKeys", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v14)
  {
    v15 = v14;
    v16 = 0;
    v17 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v13);
        objc_msgSend(a1, "preservedVideoViewsForPlayer:identifier:", v9, *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v16 += objc_msgSend(v19, "count");

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v15);

    p_vtable = (void **)(TVPChapterCollection + 24);
    if (v16)
      goto LABEL_16;
  }
  else
  {

  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObserver:selector:name:object:", a1, sel__playerStateDidChange_, CFSTR("TVPPlaybackStateDidChangeNotification"), v9);

LABEL_16:
  objc_msgSend(p_vtable[252], "objectForKey:", v7);
  v21 = (id)objc_claimAutoreleasedReturnValue();
  if (!v21)
    v21 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  objc_msgSend(v21, "addObject:", v6);
  objc_msgSend(p_vtable[252], "setObject:forKey:", v21, v7);

LABEL_19:
}

+ (id)preservedVideoViewsForPlayer:(id)a3 identifier:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (v5 && v6)
  {
    objc_msgSend((id)sPreservedVideoViews, "objectForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v13, "player");
          v14 = (id)objc_claimAutoreleasedReturnValue();

          if (v14 == v5)
            objc_msgSend(v7, "addObject:", v13);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

  }
  return v7;
}

- (int64_t)videoGravity
{
  void *v2;
  void *v3;
  void *v4;
  int64_t v5;

  -[TVPVideoView playerLayerView](self, "playerLayerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "avPlayerLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "videoGravity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDB1C70]) & 1) != 0)
  {
    v5 = 2;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDB1C78]) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDB1C80]);
  }

  return v5;
}

+ (void)_playerStateDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "object");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "state");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[TVPPlaybackState stopped](TVPPlaybackState, "stopped");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
  {
    objc_msgSend(a1, "_purgePreservedVideoViewsForPlayer:", v7);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:name:object:", a1, CFSTR("TVPPlaybackStateDidChangeNotification"), v7);

  }
}

+ (void)_purgePreservedVideoViewsForPlayer:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  id v14;
  id obj;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend((id)sPreservedVideoViews, "allValues");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v4)
  {
    v5 = v4;
    v16 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v8 = (void *)objc_msgSend(v7, "copy");
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v18;
          do
          {
            for (j = 0; j != v10; ++j)
            {
              if (*(_QWORD *)v18 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * j);
              objc_msgSend(v13, "player");
              v14 = (id)objc_claimAutoreleasedReturnValue();

              if (v14 == v3)
                objc_msgSend(v7, "removeObject:", v13);
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          }
          while (v10);
        }

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v5);
  }

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[TVPPlayerLayerView removeObserver:forKeyPath:context:](self->_playerLayerView, "removeObserver:forKeyPath:context:", self, CFSTR("avPlayerLayer.readyForDisplay"), AVPlayerLayerReadyForDisplayKVOContext);
  v4.receiver = self;
  v4.super_class = (Class)TVPVideoView;
  -[TVPVideoView dealloc](&v4, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7;
  objc_super v8;

  if ((void *)AVPlayerLayerReadyForDisplayKVOContext == a6)
  {
    -[TVPPlayerLayerView avPlayerLayer](self->_playerLayerView, "avPlayerLayer", a3, a4, a5);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[TVPVideoView setReadyForDisplay:](self, "setReadyForDisplay:", objc_msgSend(v7, "isReadyForDisplay"));

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)TVPVideoView;
    -[TVPVideoView observeValueForKeyPath:ofObject:change:context:](&v8, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)setIsPrimarySubtitleDisplayer:(BOOL)a3
{
  id v3;

  self->_isPrimarySubtitleDisplayer = a3;
  if (!a3)
  {
    -[TVPPlayerLayerView avPlayerLayer](self->_playerLayerView, "avPlayerLayer");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setLanczosFilterDownscalingEnabled:", 1);
    objc_msgSend(v3, "setLanczosFilterDownscaleFactor:", 3);

  }
}

- (id)AVPlayer
{
  void *v2;
  void *v3;

  -[TVPPlayerLayerView avPlayerLayer](self->_playerLayerView, "avPlayerLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_playerStillImageDidChange:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("TVPPlayerStillImageKey"));
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[TVPVideoView stillImageView](self, "stillImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (!v5)
    {
      v6 = objc_alloc(MEMORY[0x24BDF6AE8]);
      -[TVPVideoView bounds](self, "bounds");
      v5 = (void *)objc_msgSend(v6, "initWithFrame:");
      objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setBackgroundColor:", v7);

      objc_msgSend(v5, "setContentMode:", 1);
      -[TVPVideoView setStillImageView:](self, "setStillImageView:", v5);
      -[TVPVideoView playerLayerView](self, "playerLayerView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVPVideoView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v5, v8);

    }
    -[TVPVideoView stillImageView](self, "stillImageView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setImage:", v10);

  }
  else
  {
    objc_msgSend(v5, "removeFromSuperview");

    -[TVPVideoView setStillImageView:](self, "setStillImageView:", 0);
  }

}

- (TVPAVFPlayback)player
{
  return self->_player;
}

- (UILabel)debugLabel
{
  return self->_debugLabel;
}

- (BOOL)isReadyForDisplay
{
  return self->_readyForDisplay;
}

- (void)setReadyForDisplay:(BOOL)a3
{
  self->_readyForDisplay = a3;
}

- (void)setPlayerLayerView:(id)a3
{
  objc_storeStrong((id *)&self->_playerLayerView, a3);
}

- (UIImageView)stillImageView
{
  return self->_stillImageView;
}

- (void)setStillImageView:(id)a3
{
  objc_storeStrong((id *)&self->_stillImageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stillImageView, 0);
  objc_storeStrong((id *)&self->_playerLayerView, 0);
  objc_storeStrong((id *)&self->_debugLabel, 0);
  objc_storeStrong((id *)&self->_player, 0);
}

@end
