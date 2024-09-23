@implementation SVPlayerLayer

- (void)initialize
{
  SVImageLayer *v3;
  SVImageLayer *stillImageLayer;
  AVPlayerLayer *v5;
  AVPlayerLayer *playerLayer;
  SVNonAnimatingDelegate *v7;
  SVNonAnimatingDelegate *nonAnimatingDelegate;

  self->_currentPlaybackKind = 1;
  v3 = objc_alloc_init(SVImageLayer);
  stillImageLayer = self->_stillImageLayer;
  self->_stillImageLayer = v3;

  v5 = (AVPlayerLayer *)objc_alloc_init(MEMORY[0x24BDB2648]);
  playerLayer = self->_playerLayer;
  self->_playerLayer = v5;

  v7 = objc_alloc_init(SVNonAnimatingDelegate);
  nonAnimatingDelegate = self->_nonAnimatingDelegate;
  self->_nonAnimatingDelegate = v7;

  -[SVImageLayer setDelegate:](self->_stillImageLayer, "setDelegate:", self->_nonAnimatingDelegate);
  -[AVPlayerLayer setDelegate:](self->_playerLayer, "setDelegate:", self->_nonAnimatingDelegate);
  -[SVPlayerLayer addSublayer:](self, "addSublayer:", self->_playerLayer);
  -[SVPlayerLayer addSublayer:](self, "addSublayer:", self->_stillImageLayer);
}

- (SVPlayerLayer)init
{
  SVPlayerLayer *v2;
  SVPlayerLayer *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SVPlayerLayer;
  v2 = -[SVPlayerLayer init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[SVPlayerLayer initialize](v2, "initialize");
  return v3;
}

- (SVPlayerLayer)initWithLayer:(id)a3
{
  SVPlayerLayer *v3;
  SVPlayerLayer *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SVPlayerLayer;
  v3 = -[SVPlayerLayer initWithLayer:](&v6, sel_initWithLayer_, a3);
  v4 = v3;
  if (v3)
    -[SVPlayerLayer initialize](v3, "initialize");
  return v4;
}

- (SVPlayerLayer)initWithCoder:(id)a3
{

  return 0;
}

- (void)layoutSublayers
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)SVPlayerLayer;
  -[SVPlayerLayer layoutSublayers](&v21, sel_layoutSublayers);
  -[SVPlayerLayer bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SVPlayerLayer stillImageLayer](self, "stillImageLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[SVPlayerLayer bounds](self, "bounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[SVPlayerLayer playerLayer](self, "playerLayer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

}

- (AVPlayer)player
{
  return -[AVPlayerLayer player](self->_playerLayer, "player");
}

- (void)setPlayer:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  SVKeyValueObserver *v9;
  id v10;
  SVKeyValueObserver *v11;
  SVKeyValueObserver *statusObserver;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  v4 = a3;
  -[AVPlayerLayer player](self->_playerLayer, "player");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[SVPlayerLayer setPlayer:].cold.1();
  +[SVAudioSession sharedSessionForMode:](SVAudioSession, "sharedSessionForMode:", 2);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v4 && v6)
  {
    -[AVPlayerLayer player](self->_playerLayer, "player");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeInterestForPlayer:", v8);

    -[AVPlayerLayer setPlayer:](self->_playerLayer, "setPlayer:", v4);
    objc_msgSend(v7, "addInterestForPlayer:withMode:", v4, 2);
  }
  objc_initWeak(&location, self);
  v9 = [SVKeyValueObserver alloc];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __27__SVPlayerLayer_setPlayer___block_invoke;
  v13[3] = &unk_24DBC25E0;
  objc_copyWeak(&v15, &location);
  v10 = v4;
  v14 = v10;
  v11 = -[SVKeyValueObserver initWithKeyPath:ofObject:withOptions:change:](v9, "initWithKeyPath:ofObject:withOptions:change:", CFSTR("status"), v10, 1, v13);
  statusObserver = self->_statusObserver;
  self->_statusObserver = v11;

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __27__SVPlayerLayer_setPlayer___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  BOOL v3;
  id v4;
  id v5;
  id *v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v3 = objc_msgSend(*(id *)(a1 + 32), "status") == 2;
    WeakRetained = v6;
    if (v3)
    {
      objc_msgSend(v6[4], "setHidden:", 0);
      v4 = v6[7];
      v6[7] = 0;

      v5 = v6[8];
      v6[8] = 0;

      WeakRetained = v6;
    }
  }

}

- (NSString)videoGravity
{
  return -[AVPlayerLayer videoGravity](self->_playerLayer, "videoGravity");
}

- (void)setVideoGravity:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)MEMORY[0x24BDE57D8];
  v5 = a3;
  objc_msgSend(v4, "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setValue:forKey:", *MEMORY[0x24BDBD270], *MEMORY[0x24BDE5DF0]);
  -[AVPlayerLayer setVideoGravity:](self->_playerLayer, "setVideoGravity:", v5);

  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

+ (id)defaultActionForKey:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null", a3);
}

- (void)playWithPlaybackKind:(unint64_t)a3 looping:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  SVLooper *v11;
  void *v12;
  SVLooper *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  SVKeyValueObserver *v17;
  void *v18;
  id v19;
  SVKeyValueObserver *v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  id location;

  v4 = a4;
  -[SVPlayerLayer setCurrentPlaybackKind:](self, "setCurrentPlaybackKind:");
  -[SVPlayerLayer player](self, "player");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[SVPlayerLayer player](self, "player");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "timeControlStatus");

    if (!v10 && (a3 == 1 || !UIAccessibilityIsReduceMotionEnabled()))
    {
      if (v4)
      {
        v11 = [SVLooper alloc];
        -[SVPlayerLayer player](self, "player");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[SVLooper initWithPlayer:](v11, "initWithPlayer:", v12);
        -[SVPlayerLayer setLooper:](self, "setLooper:", v13);

      }
      else
      {
        -[SVPlayerLayer setLooper:](self, "setLooper:", 0);
      }
      objc_initWeak(&location, self);
      v14 = MEMORY[0x24BDAC760];
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __46__SVPlayerLayer_playWithPlaybackKind_looping___block_invoke;
      v23[3] = &unk_24DBC2590;
      objc_copyWeak(&v24, &location);
      v15 = (void *)MEMORY[0x2207327F0](v23);
      -[SVPlayerLayer player](self, "player");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "play");

      v17 = [SVKeyValueObserver alloc];
      -[SVPlayerLayer playerLayer](self, "playerLayer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v14;
      v21[1] = 3221225472;
      v21[2] = __46__SVPlayerLayer_playWithPlaybackKind_looping___block_invoke_2;
      v21[3] = &unk_24DBC2608;
      v19 = v15;
      v22 = v19;
      v20 = -[SVKeyValueObserver initWithKeyPath:ofObject:withOptions:change:](v17, "initWithKeyPath:ofObject:withOptions:change:", CFSTR("readyForDisplay"), v18, 5, v21);
      -[SVPlayerLayer setReadyForDisplayObserver:](self, "setReadyForDisplayObserver:", v20);

      objc_destroyWeak(&v24);
      objc_destroyWeak(&location);
    }
  }
}

void __46__SVPlayerLayer_playWithPlaybackKind_looping___block_invoke(uint64_t a1)
{
  void *v1;
  int v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "playerLayer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isReadyForDisplay");

  if (v2)
  {
    objc_msgSend(WeakRetained, "stillImageLayer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setHidden:", 1);

    objc_msgSend(WeakRetained, "setReadyForDisplayObserver:", 0);
  }

}

uint64_t __46__SVPlayerLayer_playWithPlaybackKind_looping___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)play
{
  -[SVPlayerLayer playWithPlaybackKind:looping:](self, "playWithPlaybackKind:looping:", 1, 0);
}

- (void)pause
{
  id v2;

  -[SVPlayerLayer player](self, "player");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pause");

}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[SVPlayerLayer player](self, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pause");

  +[SVAudioSession sharedSessionForMode:](SVAudioSession, "sharedSessionForMode:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SVPlayerLayer player](self, "player");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeInterestForPlayer:", v5);

  v6.receiver = self;
  v6.super_class = (Class)SVPlayerLayer;
  -[SVPlayerLayer dealloc](&v6, sel_dealloc);
}

- (SVImageLayer)stillImageLayer
{
  return (SVImageLayer *)objc_getProperty(self, a2, 32, 1);
}

- (AVPlayerLayer)playerLayer
{
  return self->_playerLayer;
}

- (void)setPlayerLayer:(id)a3
{
  objc_storeStrong((id *)&self->_playerLayer, a3);
}

- (SVLooper)looper
{
  return self->_looper;
}

- (void)setLooper:(id)a3
{
  objc_storeStrong((id *)&self->_looper, a3);
}

- (SVKeyValueObserver)readyForDisplayObserver
{
  return self->_readyForDisplayObserver;
}

- (void)setReadyForDisplayObserver:(id)a3
{
  objc_storeStrong((id *)&self->_readyForDisplayObserver, a3);
}

- (SVKeyValueObserver)statusObserver
{
  return self->_statusObserver;
}

- (void)setStatusObserver:(id)a3
{
  objc_storeStrong((id *)&self->_statusObserver, a3);
}

- (SVNonAnimatingDelegate)nonAnimatingDelegate
{
  return self->_nonAnimatingDelegate;
}

- (void)setNonAnimatingDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_nonAnimatingDelegate, a3);
}

- (unint64_t)currentPlaybackKind
{
  return self->_currentPlaybackKind;
}

- (void)setCurrentPlaybackKind:(unint64_t)a3
{
  self->_currentPlaybackKind = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonAnimatingDelegate, 0);
  objc_storeStrong((id *)&self->_statusObserver, 0);
  objc_storeStrong((id *)&self->_readyForDisplayObserver, 0);
  objc_storeStrong((id *)&self->_looper, 0);
  objc_storeStrong((id *)&self->_playerLayer, 0);
  objc_storeStrong((id *)&self->_stillImageLayer, 0);
}

- (void)setPlayer:.cold.1()
{
  void *v0;
  int v1;
  const char *v2;
  __int16 v3;
  char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Tried to re-set an already created AVPlayer!"));
  v1 = 136315906;
  v2 = "-[SVPlayerLayer setPlayer:]";
  v3 = 2080;
  v4 = "SVPlayerLayer.m";
  v5 = 1024;
  v6 = 92;
  v7 = 2114;
  v8 = v0;
  _os_log_error_impl(&dword_219C0B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v1, 0x26u);

}

@end
