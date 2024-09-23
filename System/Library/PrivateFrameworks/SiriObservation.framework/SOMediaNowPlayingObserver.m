@implementation SOMediaNowPlayingObserver

- (SOMediaNowPlayingObserver)initWithQueue:(id)a3 instanceContext:(id)a4
{
  id v8;
  id v9;
  SOMediaNowPlayingObserver *v10;
  SOMediaNowPlayingObserver *v11;
  AFInstanceContext *v12;
  AFInstanceContext *instanceContext;
  uint64_t v14;
  NSHashTable *listeners;
  NSObject *v16;
  AFInstanceContext *v17;
  NSObject *queue;
  _QWORD v20[4];
  SOMediaNowPlayingObserver *v21;
  SEL v22;
  objc_super v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  SOMediaNowPlayingObserver *v27;
  __int16 v28;
  AFInstanceContext *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v23.receiver = self;
  v23.super_class = (Class)SOMediaNowPlayingObserver;
  v10 = -[SOMediaNowPlayingObserver init](&v23, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_queue, a3);
    v11->_playbackStateGroupDepth = 0;
    if (v9)
    {
      v12 = (AFInstanceContext *)v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE091F8], "defaultContext");
      v12 = (AFInstanceContext *)objc_claimAutoreleasedReturnValue();
    }
    instanceContext = v11->_instanceContext;
    v11->_instanceContext = v12;

    v14 = objc_msgSend(objc_alloc(MEMORY[0x24BDD15C0]), "initWithOptions:capacity:", 5, 0);
    listeners = v11->_listeners;
    v11->_listeners = (NSHashTable *)v14;

    v16 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      v17 = v11->_instanceContext;
      *(_DWORD *)buf = 136315650;
      v25 = "-[SOMediaNowPlayingObserver initWithQueue:instanceContext:]";
      v26 = 2048;
      v27 = v11;
      v28 = 2112;
      v29 = v17;
      _os_log_impl(&dword_212A19000, v16, OS_LOG_TYPE_INFO, "%s %p %@", buf, 0x20u);
    }
    -[SOMediaNowPlayingObserver _beginGroup](v11, "_beginGroup");
    queue = v11->_queue;
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __59__SOMediaNowPlayingObserver_initWithQueue_instanceContext___block_invoke;
    v20[3] = &unk_24CE75938;
    v21 = v11;
    v22 = a2;
    dispatch_async(queue, v20);

  }
  return v11;
}

- (SOMediaNowPlayingObserver)initWithQueue:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  SOMediaNowPlayingObserver *v7;

  v4 = (void *)MEMORY[0x24BE091F8];
  v5 = a3;
  objc_msgSend(v4, "currentContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SOMediaNowPlayingObserver initWithQueue:instanceContext:](self, "initWithQueue:instanceContext:", v5, v6);

  return v7;
}

- (void)dealloc
{
  NSObject *v3;
  AFInstanceContext *instanceContext;
  objc_super v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  SOMediaNowPlayingObserver *v9;
  __int16 v10;
  AFInstanceContext *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[SOMediaNowPlayingObserver _stopObservingNowPlayingAppPlaybackState](self, "_stopObservingNowPlayingAppPlaybackState");
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    instanceContext = self->_instanceContext;
    *(_DWORD *)buf = 136315650;
    v7 = "-[SOMediaNowPlayingObserver dealloc]";
    v8 = 2048;
    v9 = self;
    v10 = 2112;
    v11 = instanceContext;
    _os_log_impl(&dword_212A19000, v3, OS_LOG_TYPE_INFO, "%s %p %@", buf, 0x20u);
  }
  v5.receiver = self;
  v5.super_class = (Class)SOMediaNowPlayingObserver;
  -[SOMediaNowPlayingObserver dealloc](&v5, sel_dealloc);
}

- (int64_t)playbackState
{
  NSObject *queue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __42__SOMediaNowPlayingObserver_playbackState__block_invoke;
  v5[3] = &unk_24CE75960;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)getPlaybackStateWithCompletion:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __60__SOMediaNowPlayingObserver_getPlaybackStateWithCompletion___block_invoke;
    v6[3] = &unk_24CE75988;
    v7 = v4;
    -[SOMediaNowPlayingObserver getPlaybackStateAndLastPlayingDateWithCompletion:](self, "getPlaybackStateAndLastPlayingDateWithCompletion:", v6);

  }
}

- (void)getPlaybackStateAndLastPlayingDateWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __78__SOMediaNowPlayingObserver_getPlaybackStateAndLastPlayingDateWithCompletion___block_invoke;
    v7[3] = &unk_24CE75E20;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

- (void)getNowPlayingInfoForCurrentItemWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __75__SOMediaNowPlayingObserver_getNowPlayingInfoForCurrentItemWithCompletion___block_invoke;
    v7[3] = &unk_24CE75E20;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

- (void)getNowPlayingApplicationBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __70__SOMediaNowPlayingObserver_getNowPlayingApplicationBundleIdentifier___block_invoke;
    v7[3] = &unk_24CE75E20;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

- (void)getProxyGroupPlayerStateWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __68__SOMediaNowPlayingObserver_getProxyGroupPlayerStateWithCompletion___block_invoke;
    v7[3] = &unk_24CE75E20;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

- (void)addListener:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __41__SOMediaNowPlayingObserver_addListener___block_invoke;
    v7[3] = &unk_24CE75E70;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

- (void)removeListener:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __44__SOMediaNowPlayingObserver_removeListener___block_invoke;
    v7[3] = &unk_24CE75E70;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

- (void)controller:(id)a3 playbackStateDidChangeFrom:(unsigned int)a4 to:(unsigned int)a5
{
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *queue;
  _QWORD v16[6];
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  SOMediaNowPlayingObserver *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v9 = v8;
    v10 = (void *)MRMediaRemoteCopyPlaybackStateDescription();
    v11 = v10;
    v12 = (void *)MRMediaRemoteCopyPlaybackStateDescription();
    *(_DWORD *)buf = 136315906;
    v18 = "-[SOMediaNowPlayingObserver controller:playbackStateDidChangeFrom:to:]";
    v19 = 2048;
    v20 = self;
    v21 = 2112;
    v22 = v10;
    v23 = 2112;
    v24 = v12;
    _os_log_impl(&dword_212A19000, v9, OS_LOG_TYPE_INFO, "%s %p %@ -> %@", buf, 0x2Au);

  }
  v13 = a5 - 1;
  if (v13 < 5)
    v14 = v13 + 1;
  else
    v14 = 0;
  queue = self->_queue;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __70__SOMediaNowPlayingObserver_controller_playbackStateDidChangeFrom_to___block_invoke;
  v16[3] = &unk_24CE75938;
  v16[4] = self;
  v16[5] = v14;
  dispatch_async(queue, v16);

}

- (void)controller:(id)a3 playbackQueueDidChangeFrom:(id)a4 to:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  SOMediaNowPlayingObserver *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  v9 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v13 = "-[SOMediaNowPlayingObserver controller:playbackQueueDidChangeFrom:to:]";
    v14 = 2048;
    v15 = self;
    v16 = 2112;
    v17 = v7;
    v18 = 2112;
    v19 = v8;
    _os_log_impl(&dword_212A19000, v9, OS_LOG_TYPE_INFO, "%s %p playback queue changed from %@ to %@", buf, 0x2Au);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__SOMediaNowPlayingObserver_controller_playbackQueueDidChangeFrom_to___block_invoke;
  block[3] = &unk_24CE75B38;
  block[4] = self;
  dispatch_async(queue, block);

}

- (void)controller:(id)a3 didLoadResponse:(id)a4
{
  int v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *queue;
  _QWORD v12[6];
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  SOMediaNowPlayingObserver *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend(a4, "playbackState", a3);
  v6 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v7 = v6;
    v8 = (void *)MRMediaRemoteCopyPlaybackStateDescription();
    *(_DWORD *)buf = 136315650;
    v14 = "-[SOMediaNowPlayingObserver controller:didLoadResponse:]";
    v15 = 2048;
    v16 = self;
    v17 = 2112;
    v18 = v8;
    _os_log_impl(&dword_212A19000, v7, OS_LOG_TYPE_INFO, "%s %p %@", buf, 0x20u);

  }
  v9 = (v5 - 1);
  if (v9 < 5)
    v10 = v9 + 1;
  else
    v10 = 0;
  queue = self->_queue;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __56__SOMediaNowPlayingObserver_controller_didLoadResponse___block_invoke;
  v12[3] = &unk_24CE75938;
  v12[4] = self;
  v12[5] = v10;
  dispatch_async(queue, v12);
}

- (void)controllerWillReloadForInvalidation:(id)a3
{
  NSObject *v5;
  NSObject *queue;
  _QWORD v7[6];
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  SOMediaNowPlayingObserver *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "-[SOMediaNowPlayingObserver controllerWillReloadForInvalidation:]";
    v10 = 2048;
    v11 = self;
    _os_log_impl(&dword_212A19000, v5, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
  }
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __65__SOMediaNowPlayingObserver_controllerWillReloadForInvalidation___block_invoke;
  v7[3] = &unk_24CE75938;
  v7[4] = self;
  v7[5] = a2;
  dispatch_async(queue, v7);
}

- (void)controller:(id)a3 didFailWithError:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *queue;
  _QWORD v9[6];
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  SOMediaNowPlayingObserver *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v11 = "-[SOMediaNowPlayingObserver controller:didFailWithError:]";
    v12 = 2048;
    v13 = self;
    v14 = 2112;
    v15 = v6;
    _os_log_error_impl(&dword_212A19000, v7, OS_LOG_TYPE_ERROR, "%s %p %@", buf, 0x20u);
  }
  queue = self->_queue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __57__SOMediaNowPlayingObserver_controller_didFailWithError___block_invoke;
  v9[3] = &unk_24CE75938;
  v9[4] = self;
  v9[5] = a2;
  dispatch_async(queue, v9);

}

- (void)_beginGroup
{
  NSObject *playbackStateGroup;
  OS_dispatch_group *v4;
  OS_dispatch_group *v5;

  playbackStateGroup = self->_playbackStateGroup;
  if (!playbackStateGroup)
  {
    v4 = (OS_dispatch_group *)dispatch_group_create();
    v5 = self->_playbackStateGroup;
    self->_playbackStateGroup = v4;

    playbackStateGroup = self->_playbackStateGroup;
  }
  dispatch_group_enter(playbackStateGroup);
  ++self->_playbackStateGroupDepth;
}

- (void)_endGroup
{
  NSObject *playbackStateGroup;
  OS_dispatch_group **p_playbackStateGroup;
  OS_dispatch_group *v5;

  p_playbackStateGroup = &self->_playbackStateGroup;
  playbackStateGroup = self->_playbackStateGroup;
  self->_playbackStateGroupDepth = (int64_t)p_playbackStateGroup[1] - 1;
  dispatch_group_leave(playbackStateGroup);
  if (!self->_playbackStateGroupDepth)
  {
    v5 = self->_playbackStateGroup;
    self->_playbackStateGroup = 0;

  }
}

- (void)_startObservingNowPlayingAppPlaybackState
{
  NSObject *v3;
  void *v4;
  MRNowPlayingController *nowPlayingController;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  SOMediaNowPlayingObserver *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[SOMediaNowPlayingObserver _stopObservingNowPlayingAppPlaybackState](self, "_stopObservingNowPlayingAppPlaybackState");
  if (!self->_isObserving)
  {
    v3 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      v8 = 136315394;
      v9 = "-[SOMediaNowPlayingObserver _startObservingNowPlayingAppPlaybackState]";
      v10 = 2048;
      v11 = self;
      _os_log_impl(&dword_212A19000, v3, OS_LOG_TYPE_INFO, "%s %p", (uint8_t *)&v8, 0x16u);
    }
    if (-[SOMediaNowPlayingObserver _supportsProxyGroupPlayer](self, "_supportsProxyGroupPlayer"))
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_mediaRemoteActiveDeviceInfoDidChange_, *MEMORY[0x24BE655A0], 0);

    }
    nowPlayingController = self->_nowPlayingController;
    if (nowPlayingController)
    {
      -[MRNowPlayingController beginLoadingUpdates](nowPlayingController, "beginLoadingUpdates");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_mediaRemoteNowPlayingApplicationPlaybackStateDidChange_, *MEMORY[0x24BE65768], 0);

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_mediaRemoteNowPlayingInfoDidChange_, *MEMORY[0x24BE657C0], 0);

      MRMediaRemoteSetWantsNowPlayingNotifications();
    }
    self->_isObserving = 1;
  }
}

- (void)_stopObservingNowPlayingAppPlaybackState
{
  NSObject *v3;
  void *v4;
  MRNowPlayingController *nowPlayingController;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  SOMediaNowPlayingObserver *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (self->_isObserving)
  {
    v3 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      v8 = 136315394;
      v9 = "-[SOMediaNowPlayingObserver _stopObservingNowPlayingAppPlaybackState]";
      v10 = 2048;
      v11 = self;
      _os_log_impl(&dword_212A19000, v3, OS_LOG_TYPE_INFO, "%s %p", (uint8_t *)&v8, 0x16u);
    }
    if (-[SOMediaNowPlayingObserver _supportsProxyGroupPlayer](self, "_supportsProxyGroupPlayer"))
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BE655A0], 0);

    }
    nowPlayingController = self->_nowPlayingController;
    if (nowPlayingController)
    {
      -[MRNowPlayingController endLoadingUpdates](nowPlayingController, "endLoadingUpdates");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x24BE65768], 0);

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObserver:name:object:", self, *MEMORY[0x24BE657C0], 0);

      MRMediaRemoteSetWantsNowPlayingNotifications();
    }
    self->_isObserving = 0;
  }
}

- (BOOL)_supportsProxyGroupPlayer
{
  return 0;
}

- (BOOL)_isProxyGroupPlayer
{
  uint64_t v3;
  const void *v4;
  int v5;
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  SOMediaNowPlayingObserver *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (-[SOMediaNowPlayingObserver _supportsProxyGroupPlayer](self, "_supportsProxyGroupPlayer"))
  {
    MRMediaRemoteGetLocalOrigin();
    v3 = MRMediaRemoteCopyDeviceInfo();
    if (v3)
    {
      v4 = (const void *)v3;
      v5 = MEMORY[0x212BF7A84]();
      CFRelease(v4);
    }
    else
    {
      v5 = 0;
    }
    v6 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
    {
      v8 = 136315650;
      v9 = "-[SOMediaNowPlayingObserver _isProxyGroupPlayer]";
      v10 = 2048;
      v11 = self;
      v12 = 1024;
      v13 = v5;
      _os_log_debug_impl(&dword_212A19000, v6, OS_LOG_TYPE_DEBUG, "%s %p isProxyGroupPlayer = %d", (uint8_t *)&v8, 0x1Cu);
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (void)mediaRemoteNowPlayingApplicationPlaybackStateDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  _QWORD v8[4];
  id v9;
  SOMediaNowPlayingObserver *v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  SOMediaNowPlayingObserver *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v12 = "-[SOMediaNowPlayingObserver mediaRemoteNowPlayingApplicationPlaybackStateDidChange:]";
    v13 = 2048;
    v14 = self;
    v15 = 2112;
    v16 = v4;
    _os_log_impl(&dword_212A19000, v5, OS_LOG_TYPE_INFO, "%s %p notification = %@", buf, 0x20u);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __84__SOMediaNowPlayingObserver_mediaRemoteNowPlayingApplicationPlaybackStateDidChange___block_invoke;
  v8[3] = &unk_24CE75E70;
  v9 = v4;
  v10 = self;
  v7 = v4;
  dispatch_async(queue, v8);

}

- (void)mediaRemoteNowPlayingInfoDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  SOMediaNowPlayingObserver *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v9 = "-[SOMediaNowPlayingObserver mediaRemoteNowPlayingInfoDidChange:]";
    v10 = 2048;
    v11 = self;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_212A19000, v5, OS_LOG_TYPE_INFO, "%s %p notification = %@", buf, 0x20u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__SOMediaNowPlayingObserver_mediaRemoteNowPlayingInfoDidChange___block_invoke;
  block[3] = &unk_24CE75B38;
  block[4] = self;
  dispatch_async(queue, block);

}

- (void)_updateProxyGroupPlayerState
{
  int isProxyGroupPlayer;
  int v4;
  NSHashTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  isProxyGroupPlayer = self->_isProxyGroupPlayer;
  v4 = -[SOMediaNowPlayingObserver _isProxyGroupPlayer](self, "_isProxyGroupPlayer");
  self->_isProxyGroupPlayer = v4;
  if (isProxyGroupPlayer != v4)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = self->_listeners;
    v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v10, "nowPlayingObserver:proxyGroupPlayerStateDidChangeFrom:to:", self, isProxyGroupPlayer != 0, self->_isProxyGroupPlayer, (_QWORD)v11);
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

  }
}

- (void)_handleGroupIdentifierUpdatesFromMediaRemoteActiveDeviceInfo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSHashTable *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  SOMediaNowPlayingObserver *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE65A70]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "airPlayGroupUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v22 = "-[SOMediaNowPlayingObserver _handleGroupIdentifierUpdatesFromMediaRemoteActiveDeviceInfo:]";
      v23 = 2048;
      v24 = self;
      v25 = 2112;
      v26 = v6;
      _os_log_impl(&dword_212A19000, v7, OS_LOG_TYPE_INFO, "%s #hal %p airPlayGroupUID from kMRActiveDeviceInfoDidChangeNotification: %@", buf, 0x20u);
    }
    if (objc_msgSend(v6, "length"))
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v8 = self->_listeners;
      v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v17;
        while (2)
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v17 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
            if ((objc_opt_respondsToSelector() & 1) != 0
              && (objc_msgSend(v13, "nowPlayingObserver:isGroupIdentifierFromMediaRemoteActiveDeviceInfoIdenticalToContext:", self, v6, (_QWORD)v16) & 1) == 0)
            {
              v15 = *MEMORY[0x24BE08FB0];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315138;
                v22 = "-[SOMediaNowPlayingObserver _handleGroupIdentifierUpdatesFromMediaRemoteActiveDeviceInfo:]";
                _os_log_impl(&dword_212A19000, v15, OS_LOG_TYPE_INFO, "%s #hal Group identifier in mediaRemoteActiveDeviceInfo is different to group identifier in device context. Invalidate playbackState as the airplay route has changed.", buf, 0xCu);
              }
              -[SOMediaNowPlayingObserver _handleNowPlayingApplicationPlaybackStateChange:](self, "_handleNowPlayingApplicationPlaybackStateChange:", 0);
              goto LABEL_20;
            }
          }
          v10 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
          if (v10)
            continue;
          break;
        }
      }
LABEL_20:

    }
  }
  else
  {
    v14 = *MEMORY[0x24BE08FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB8], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v22 = "-[SOMediaNowPlayingObserver _handleGroupIdentifierUpdatesFromMediaRemoteActiveDeviceInfo:]";
      _os_log_debug_impl(&dword_212A19000, v14, OS_LOG_TYPE_DEBUG, "%s #hal deviceRef from kMRActiveDeviceInfoDidChangeNotification was invalid. Returning.", buf, 0xCu);
    }
  }

}

- (void)mediaRemoteActiveDeviceInfoDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  SOMediaNowPlayingObserver *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v11 = "-[SOMediaNowPlayingObserver mediaRemoteActiveDeviceInfoDidChange:]";
    v12 = 2048;
    v13 = self;
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_212A19000, v5, OS_LOG_TYPE_INFO, "%s %p notification = %@", buf, 0x20u);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __66__SOMediaNowPlayingObserver_mediaRemoteActiveDeviceInfoDidChange___block_invoke;
  v8[3] = &unk_24CE75E70;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(queue, v8);

}

- (void)_handleNowPlayingApplicationPlaybackStateChange:(int64_t)a3
{
  int64_t playbackState;
  void *v6;
  AFInstanceContext *instanceContext;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void (**v13)(_QWORD);
  void *v14;
  _QWORD v15[5];
  void (**v16)(_QWORD);
  _QWORD v17[7];
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  SOMediaNowPlayingObserver *v21;
  __int16 v22;
  AFInstanceContext *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  playbackState = self->_playbackState;
  if (playbackState != a3)
  {
    v6 = (void *)*MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      instanceContext = self->_instanceContext;
      v8 = v6;
      AFMediaPlaybackStateGetName();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      AFMediaPlaybackStateGetName();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136316162;
      v19 = "-[SOMediaNowPlayingObserver _handleNowPlayingApplicationPlaybackStateChange:]";
      v20 = 2048;
      v21 = self;
      v22 = 2112;
      v23 = instanceContext;
      v24 = 2112;
      v25 = v9;
      v26 = 2112;
      v27 = v10;
      _os_log_impl(&dword_212A19000, v8, OS_LOG_TYPE_INFO, "%s %p %@ fromState = %@, toState = %@", buf, 0x34u);

      playbackState = self->_playbackState;
    }
    self->_playbackState = a3;
    if (a3 == 1 || playbackState == 1)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SOMediaNowPlayingObserver _handleLastPlayingDateChangedTo:](self, "_handleLastPlayingDateChangedTo:", v11);

    }
    v12 = MEMORY[0x24BDAC760];
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __77__SOMediaNowPlayingObserver__handleNowPlayingApplicationPlaybackStateChange___block_invoke;
    v17[3] = &unk_24CE759B0;
    v17[4] = self;
    v17[5] = playbackState;
    v17[6] = a3;
    v13 = (void (**)(_QWORD))MEMORY[0x212BF7D48](v17);
    v14 = v13;
    if (self->_lastPlayingDate)
    {
      v13[2](v13);
    }
    else
    {
      v15[0] = v12;
      v15[1] = 3221225472;
      v15[2] = __77__SOMediaNowPlayingObserver__handleNowPlayingApplicationPlaybackStateChange___block_invoke_2;
      v15[3] = &unk_24CE759D8;
      v15[4] = self;
      v16 = v13;
      -[SOMediaNowPlayingObserver _fetchLastPlayingDateWithCompletion:](self, "_fetchLastPlayingDateWithCompletion:", v15);

    }
  }
}

- (void)_handleLastPlayingDateChangedTo:(id)a3
{
  objc_storeStrong((id *)&self->_lastPlayingDate, a3);
}

- (void)_fetchNowPlayingAppPlaybackStateForReason:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16[2];
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  SOMediaNowPlayingObserver *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v18 = "-[SOMediaNowPlayingObserver _fetchNowPlayingAppPlaybackStateForReason:completion:]";
    v19 = 2048;
    v20 = self;
    v21 = 2112;
    v22 = v6;
    _os_log_impl(&dword_212A19000, v8, OS_LOG_TYPE_INFO, "%s %p reason = %@", buf, 0x20u);
  }
  v9 = (void *)mach_absolute_time();
  objc_initWeak((id *)buf, self);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __82__SOMediaNowPlayingObserver__fetchNowPlayingAppPlaybackStateForReason_completion___block_invoke;
  v13[3] = &unk_24CE75A00;
  v13[4] = self;
  v10 = v6;
  v14 = v10;
  v16[1] = v9;
  objc_copyWeak(v16, (id *)buf);
  v11 = v7;
  v15 = v11;
  v12 = (void *)MEMORY[0x212BF7D48](v13);
  _AFGetPlaybackState();

  objc_destroyWeak(v16);
  objc_destroyWeak((id *)buf);

}

- (void)_fetchLastPlayingDateWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  MRNowPlayingController *nowPlayingController;
  NSObject *v9;
  _BOOL4 v10;
  OS_dispatch_queue *v11;
  MRNowPlayingController *v12;
  OS_dispatch_queue *v13;
  id v14;
  _QWORD v15[4];
  OS_dispatch_queue *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id location;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  SOMediaNowPlayingObserver *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_initWeak(&location, self);
  v5 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __65__SOMediaNowPlayingObserver__fetchLastPlayingDateWithCompletion___block_invoke;
  v18[3] = &unk_24CE75A28;
  objc_copyWeak(&v20, &location);
  v6 = v4;
  v19 = v6;
  v7 = (void *)MEMORY[0x212BF7D48](v18);
  nowPlayingController = self->_nowPlayingController;
  v9 = *MEMORY[0x24BE08FB0];
  v10 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG);
  if (nowPlayingController)
  {
    if (v10)
    {
      *(_DWORD *)buf = 136315394;
      v23 = "-[SOMediaNowPlayingObserver _fetchLastPlayingDateWithCompletion:]";
      v24 = 2048;
      v25 = self;
      _os_log_debug_impl(&dword_212A19000, v9, OS_LOG_TYPE_DEBUG, "%s %p Calling -[MRNowPlayingController performRequestWithCompletion:]...", buf, 0x16u);
    }
    v11 = self->_queue;
    v12 = self->_nowPlayingController;
    v15[0] = v5;
    v15[1] = 3221225472;
    v15[2] = __65__SOMediaNowPlayingObserver__fetchLastPlayingDateWithCompletion___block_invoke_26;
    v15[3] = &unk_24CE75A50;
    v13 = v11;
    v16 = v13;
    v17 = v7;
    -[MRNowPlayingController performRequestWithCompletion:](v12, "performRequestWithCompletion:", v15);

  }
  else
  {
    if (v10)
    {
      *(_DWORD *)buf = 136315394;
      v23 = "-[SOMediaNowPlayingObserver _fetchLastPlayingDateWithCompletion:]";
      v24 = 2048;
      v25 = self;
      _os_log_debug_impl(&dword_212A19000, v9, OS_LOG_TYPE_DEBUG, "%s %p Calling MRMediaRemote C APIs...", buf, 0x16u);
    }
    v14 = v7;
    MRMediaRemoteGetActiveOrigin();

  }
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nowPlayingController, 0);
  objc_storeStrong((id *)&self->_instanceContext, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_lastPlayingDate, 0);
  objc_storeStrong((id *)&self->_playbackStateGroup, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __65__SOMediaNowPlayingObserver__fetchLastPlayingDateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  id WeakRetained;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    v7 = v4;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v9 = 136315650;
    v10 = "-[SOMediaNowPlayingObserver _fetchLastPlayingDateWithCompletion:]_block_invoke";
    v11 = 2048;
    v12 = WeakRetained;
    v13 = 2112;
    v14 = v3;
    _os_log_debug_impl(&dword_212A19000, v7, OS_LOG_TYPE_DEBUG, "%s %p lastPlayingDate = %@", (uint8_t *)&v9, 0x20u);

  }
  v5 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v5, "_handleLastPlayingDateChangedTo:", v3);

  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);

}

void __65__SOMediaNowPlayingObserver__fetchLastPlayingDateWithCompletion___block_invoke_26(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__SOMediaNowPlayingObserver__fetchLastPlayingDateWithCompletion___block_invoke_2;
  block[3] = &unk_24CE75EC0;
  v11 = v6;
  v12 = v5;
  v7 = *(NSObject **)(a1 + 32);
  v13 = *(id *)(a1 + 40);
  v8 = v5;
  v9 = v6;
  dispatch_async(v7, block);

}

void __65__SOMediaNowPlayingObserver__fetchLastPlayingDateWithCompletion___block_invoke_28(uint64_t a1, int a2, uint64_t a3)
{
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE65530]), "initWithOrigin:", a3);
    v5 = *(void **)(a1 + 40);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __65__SOMediaNowPlayingObserver__fetchLastPlayingDateWithCompletion___block_invoke_2_30;
    v8[3] = &unk_24CE75A78;
    v9 = v5;
    objc_msgSend(v4, "requestLastPlayingDateOnQueue:completion:", v6, v8);

  }
  else
  {
    v7 = *MEMORY[0x24BE08FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v11 = "-[SOMediaNowPlayingObserver _fetchLastPlayingDateWithCompletion:]_block_invoke";
      _os_log_error_impl(&dword_212A19000, v7, OS_LOG_TYPE_ERROR, "%s Failed fetching active origin for Last Playing Date", buf, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __65__SOMediaNowPlayingObserver__fetchLastPlayingDateWithCompletion___block_invoke_2_30(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void (*v8)(void);
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = *MEMORY[0x24BE08FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB8], OS_LOG_TYPE_ERROR))
    {
      v9 = 136315394;
      v10 = "-[SOMediaNowPlayingObserver _fetchLastPlayingDateWithCompletion:]_block_invoke_2";
      v11 = 2112;
      v12 = v6;
      _os_log_error_impl(&dword_212A19000, v7, OS_LOG_TYPE_ERROR, "%s Failed fetching Last Playing Date with error: %@", (uint8_t *)&v9, 0x16u);
    }
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v8();

}

void __65__SOMediaNowPlayingObserver__fetchLastPlayingDateWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  if (*(_QWORD *)(a1 + 32) || !*(_QWORD *)(a1 + 40))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v1 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "deviceLastPlayingDate");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

  }
}

uint64_t __82__SOMediaNowPlayingObserver__fetchNowPlayingAppPlaybackStateForReason_completion___block_invoke(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  id WeakRetained;
  uint64_t result;
  int v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = (a2 - 1);
  if (v3 < 5)
    v4 = v3 + 1;
  else
    v4 = 0;
  v5 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v8 = v5;
    AFMediaPlaybackStateGetName();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    mach_absolute_time();
    AFMachAbsoluteTimeGetTimeInterval();
    v13 = 136316162;
    v14 = "-[SOMediaNowPlayingObserver _fetchNowPlayingAppPlaybackStateForReason:completion:]_block_invoke";
    v15 = 2048;
    v16 = v6;
    v17 = 2112;
    v18 = v7;
    v19 = 2112;
    v20 = v9;
    v21 = 2048;
    v22 = v10;
    _os_log_impl(&dword_212A19000, v8, OS_LOG_TYPE_INFO, "%s %p reason = %@, state = %@ (took %f seconds)", (uint8_t *)&v13, 0x34u);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_handleNowPlayingApplicationPlaybackStateChange:", v4);

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v4);
  return result;
}

void __77__SOMediaNowPlayingObserver__handleNowPlayingApplicationPlaybackStateChange___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = *(id *)(a1[4] + 48);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "nowPlayingObserver:playbackStateDidChangeFrom:to:lastPlayingDate:", a1[4], a1[5], a1[6], v3, (_QWORD)v10);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

void __77__SOMediaNowPlayingObserver__handleNowPlayingApplicationPlaybackStateChange___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  id v10;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 8);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __77__SOMediaNowPlayingObserver__handleNowPlayingApplicationPlaybackStateChange___block_invoke_3;
  block[3] = &unk_24CE75EC0;
  block[4] = v4;
  v9 = v3;
  v10 = v5;
  v7 = v3;
  dispatch_async(v6, block);

}

uint64_t __77__SOMediaNowPlayingObserver__handleNowPlayingApplicationPlaybackStateChange___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = 136315650;
    v7 = "-[SOMediaNowPlayingObserver _handleNowPlayingApplicationPlaybackStateChange:]_block_invoke_3";
    v8 = 2048;
    v9 = v4;
    v10 = 2112;
    v11 = v5;
    _os_log_debug_impl(&dword_212A19000, v2, OS_LOG_TYPE_DEBUG, "%s %p fetched last playing date from MediaRemote: %@", (uint8_t *)&v6, 0x20u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_handleLastPlayingDateChangedTo:", *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __66__SOMediaNowPlayingObserver_mediaRemoteActiveDeviceInfoDidChange___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateProxyGroupPlayerState");
  return objc_msgSend(*(id *)(a1 + 32), "_handleGroupIdentifierUpdatesFromMediaRemoteActiveDeviceInfo:", *(_QWORD *)(a1 + 40));
}

void __64__SOMediaNowPlayingObserver_mediaRemoteNowPlayingInfoDidChange___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "nowPlayingObserverNowPlayingInfoDidChange:", *(_QWORD *)(a1 + 32), (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void __84__SOMediaNowPlayingObserver_mediaRemoteNowPlayingApplicationPlaybackStateDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x24BE65A20]);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v3 = *(void **)(a1 + 40);
  v4 = objc_msgSend(v6, "unsignedIntValue") - 1;
  if (v4 < 5)
    v5 = v4 + 1;
  else
    v5 = 0;
  objc_msgSend(v3, "_handleNowPlayingApplicationPlaybackStateChange:", v5);

}

void __57__SOMediaNowPlayingObserver_controller_didFailWithError___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if ((AFMediaPlaybackStateGetIsValidAndSpecified() & 1) != 0)
  {
    v2 = (void *)*MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v4 = v2;
      AFMediaPlaybackStateGetName();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v9 = "-[SOMediaNowPlayingObserver controller:didFailWithError:]_block_invoke";
      v10 = 2048;
      v11 = v3;
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_212A19000, v4, OS_LOG_TYPE_INFO, "%s %p Skipped fetching playback state because the playback state is %@ and it is valid.", buf, 0x20u);

    }
  }
  else
  {
    v6 = *(void **)(a1 + 32);
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_fetchNowPlayingAppPlaybackStateForReason:completion:");

  }
}

void __65__SOMediaNowPlayingObserver_controllerWillReloadForInvalidation___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_handleNowPlayingApplicationPlaybackStateChange:", 0);
  v2 = *(void **)(a1 + 32);
  NSStringFromSelector(*(SEL *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_fetchNowPlayingAppPlaybackStateForReason:completion:", v3, 0);

}

uint64_t __56__SOMediaNowPlayingObserver_controller_didLoadResponse___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleNowPlayingApplicationPlaybackStateChange:", *(_QWORD *)(a1 + 40));
}

void __70__SOMediaNowPlayingObserver_controller_playbackQueueDidChangeFrom_to___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "nowPlayingObserverNowPlayingInfoDidChange:", *(_QWORD *)(a1 + 32), (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

uint64_t __70__SOMediaNowPlayingObserver_controller_playbackStateDidChangeFrom_to___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleNowPlayingApplicationPlaybackStateChange:", *(_QWORD *)(a1 + 40));
}

uint64_t __44__SOMediaNowPlayingObserver_removeListener___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    v5 = v2;
    objc_msgSend(v3, "debugDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 136315650;
    v9 = "-[SOMediaNowPlayingObserver removeListener:]_block_invoke";
    v10 = 2048;
    v11 = v4;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_212A19000, v5, OS_LOG_TYPE_INFO, "%s %p Attempting to delete listener: %@", (uint8_t *)&v8, 0x20u);

  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObject:", *(_QWORD *)(a1 + 40));
}

uint64_t __41__SOMediaNowPlayingObserver_addListener___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "addObject:", *(_QWORD *)(a1 + 40));
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(v3 + 32);
    if (v4)
      return objc_msgSend(*(id *)(a1 + 40), "nowPlayingObserver:playbackStateDidChangeFrom:to:lastPlayingDate:", v3, 0, v4, *(_QWORD *)(v3 + 40));
  }
  return result;
}

uint64_t __68__SOMediaNowPlayingObserver_getProxyGroupPlayerStateWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 72));
}

uint64_t __70__SOMediaNowPlayingObserver_getNowPlayingApplicationBundleIdentifier___block_invoke()
{
  return _AFGetNowPlayingApplicationIdentifier();
}

uint64_t __75__SOMediaNowPlayingObserver_getNowPlayingInfoForCurrentItemWithCompletion___block_invoke()
{
  return _AFGetNowPlayingInfoDictionary();
}

void __78__SOMediaNowPlayingObserver_getPlaybackStateAndLastPlayingDateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 16);
  if (v3)
  {
    v4 = *(NSObject **)(v2 + 8);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __78__SOMediaNowPlayingObserver_getPlaybackStateAndLastPlayingDateWithCompletion___block_invoke_2;
    v6[3] = &unk_24CE75E20;
    v5 = *(id *)(a1 + 40);
    v6[4] = *(_QWORD *)(a1 + 32);
    v7 = v5;
    dispatch_group_notify(v3, v4, v6);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

uint64_t __78__SOMediaNowPlayingObserver_getPlaybackStateAndLastPlayingDateWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
}

uint64_t __60__SOMediaNowPlayingObserver_getPlaybackStateWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __42__SOMediaNowPlayingObserver_playbackState__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 32);
  return result;
}

void __59__SOMediaNowPlayingObserver_initWithQueue_instanceContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_startObservingNowPlayingAppPlaybackState");
  objc_msgSend(*(id *)(a1 + 32), "_updateProxyGroupPlayerState");
  v2 = *(void **)(a1 + 32);
  NSStringFromSelector(*(SEL *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __59__SOMediaNowPlayingObserver_initWithQueue_instanceContext___block_invoke_2;
  v4[3] = &unk_24CE75910;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v2, "_fetchNowPlayingAppPlaybackStateForReason:completion:", v3, v4);

}

uint64_t __59__SOMediaNowPlayingObserver_initWithQueue_instanceContext___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = v2;
    AFMediaPlaybackStateGetName();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 136315650;
    v8 = "-[SOMediaNowPlayingObserver initWithQueue:instanceContext:]_block_invoke_2";
    v9 = 2048;
    v10 = v3;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_212A19000, v4, OS_LOG_TYPE_INFO, "%s %p Initial playback state is %@.", (uint8_t *)&v7, 0x20u);

  }
  return objc_msgSend(*(id *)(a1 + 32), "_endGroup");
}

+ (id)defaultObserver
{
  if (defaultObserver_onceToken != -1)
    dispatch_once(&defaultObserver_onceToken, &__block_literal_global_250);
  return (id)defaultObserver_defaultObserver;
}

void __44__SOMediaNowPlayingObserver_defaultObserver__block_invoke()
{
  SOMediaNowPlayingObserver *v0;
  NSObject *v1;
  NSObject *v2;
  uint64_t v3;
  void *v4;
  dispatch_queue_t v5;

  v0 = [SOMediaNowPlayingObserver alloc];
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v1 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v1, QOS_CLASS_USER_INITIATED, 0);
  v2 = objc_claimAutoreleasedReturnValue();

  v5 = dispatch_queue_create("SOMediaNowPlayingObserver.defaultObserver", v2);
  v3 = -[SOMediaNowPlayingObserver initWithQueue:](v0, "initWithQueue:", v5);
  v4 = (void *)defaultObserver_defaultObserver;
  defaultObserver_defaultObserver = v3;

}

@end
