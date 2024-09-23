@implementation SVAudioSession

+ (id)sharedSessionForMode:(int)a3
{
  if (a3 == 2)
    objc_msgSend(a1, "sharedSilentSession");
  else
    objc_msgSend(a1, "sharedSession");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)sharedSession
{
  if (sharedSession_onceToken != -1)
    dispatch_once(&sharedSession_onceToken, &__block_literal_global_1);
  return (id)sharedSession___sharedSession;
}

void __31__SVAudioSession_sharedSession__block_invoke()
{
  SVAudioSession *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [SVAudioSession alloc];
  objc_msgSend(MEMORY[0x24BDB1858], "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[SVAudioSession initWithAudioSession:](v0, "initWithAudioSession:", v3);
  v2 = (void *)sharedSession___sharedSession;
  sharedSession___sharedSession = v1;

}

+ (id)sharedSilentSession
{
  if (sharedSilentSession_onceToken != -1)
    dispatch_once(&sharedSilentSession_onceToken, &__block_literal_global_2);
  return (id)sharedSilentSession___sharedSilentSession;
}

void __37__SVAudioSession_sharedSilentSession__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  id v4;
  SVAudioSession *v5;
  SVAudioSession *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB1858]), "initAuxiliarySession");
  v1 = *MEMORY[0x24BDB1598];
  v2 = *MEMORY[0x24BDB1618];
  v12 = 0;
  v3 = objc_msgSend(v0, "setCategory:mode:routeSharingPolicy:options:error:", v1, v2, 0, 0, &v12);
  v4 = v12;
  v5 = [SVAudioSession alloc];
  v6 = v5;
  if ((v3 & 1) != 0)
  {
    v7 = -[SVAudioSession initWithAudioSession:](v5, "initWithAudioSession:", v0);
    v8 = (void *)sharedSilentSession___sharedSilentSession;
    sharedSilentSession___sharedSilentSession = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDB1858], "sharedInstance");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = -[SVAudioSession initWithAudioSession:](v6, "initWithAudioSession:", v9);
    v11 = (void *)sharedSilentSession___sharedSilentSession;
    sharedSilentSession___sharedSilentSession = v10;

    v8 = v4;
    v4 = (id)v9;
  }

}

- (SVAudioSession)initWithAudioSession:(id)a3
{
  id v5;
  SVAudioSession *v6;
  SVAudioSession *v7;
  dispatch_semaphore_t v8;
  OS_dispatch_semaphore *semaphore;
  uint64_t v10;
  NSMapTable *players;
  SVMediaPlaybackController *v12;
  SVMediaPlaybackController *playbackController;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SVAudioSession;
  v6 = -[SVAudioSession init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_audioSession, a3);
    v8 = dispatch_semaphore_create(1);
    semaphore = v7->_semaphore;
    v7->_semaphore = (OS_dispatch_semaphore *)v8;

    objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
    v10 = objc_claimAutoreleasedReturnValue();
    players = v7->_players;
    v7->_players = (NSMapTable *)v10;

    v12 = objc_alloc_init(SVMediaPlaybackController);
    playbackController = v7->_playbackController;
    v7->_playbackController = v12;

  }
  return v7;
}

- (void)registerPlaybackControlForPlayer:(id)a3 withMode:(int)a4
{
  id v5;
  id v6;

  if (a4 != 2)
  {
    v5 = a3;
    -[SVAudioSession playbackController](self, "playbackController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "registerPlayer:", v5);

  }
}

- (void)addInterestForPlayer:(id)a3 withMode:(int)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  -[SVAudioSession semaphore](self, "semaphore");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);

  -[SVAudioSession players](self, "players");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v9, v6);

  -[SVAudioSession registerPlaybackControlForPlayer:withMode:](self, "registerPlaybackControlForPlayer:withMode:", v6, v4);
  -[SVAudioSession setupAudioSessionCategory](self, "setupAudioSessionCategory");
  -[SVAudioSession audioSession](self, "audioSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAudioSession:", v10);

  -[SVAudioSession activateAudioSessionCategory](self, "activateAudioSessionCategory");
  -[SVAudioSession semaphore](self, "semaphore");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v11);

}

- (void)removeInterestForPlayer:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  dispatch_time_t v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD block[5];

  v4 = a3;
  -[SVAudioSession semaphore](self, "semaphore");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

  -[SVAudioSession playbackController](self, "playbackController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unregisterPlayer:", v4);

  -[SVAudioSession players](self, "players");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectForKey:", v4);

  -[SVAudioSession setupAudioSessionCategory](self, "setupAudioSessionCategory");
  v8 = dispatch_time(0, 1000000000);
  dispatch_get_global_queue(0, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__SVAudioSession_removeInterestForPlayer___block_invoke;
  block[3] = &unk_24DBC2330;
  block[4] = self;
  dispatch_after(v8, v9, block);

  -[SVAudioSession semaphore](self, "semaphore");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v10);

}

uint64_t __42__SVAudioSession_removeInterestForPlayer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deactivateAudioSessionCategory");
}

- (BOOL)shouldActivateAudioSession
{
  void *v2;
  BOOL v3;

  -[SVAudioSession players](self, "players");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (BOOL)canDeactivateAudioSession
{
  void *v2;
  BOOL v3;

  -[SVAudioSession players](self, "players");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") == 0;

  return v3;
}

- (BOOL)needsToSetupAudioSessionCategory
{
  void *v3;
  SVAudioSessionConfiguration *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SVAudioSessionConfiguration *v10;

  -[SVAudioSession desiredAudioSessionConfiguration](self, "desiredAudioSessionConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [SVAudioSessionConfiguration alloc];
  -[SVAudioSession audioSession](self, "audioSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "category");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SVAudioSession audioSession](self, "audioSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SVAudioSession audioSession](self, "audioSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SVAudioSessionConfiguration initWithCategory:mode:policy:](v4, "initWithCategory:mode:policy:", v6, v8, objc_msgSend(v9, "routeSharingPolicy"));

  LOBYTE(v9) = objc_msgSend(v3, "isEqualToConfiguration:", v10) ^ 1;
  return (char)v9;
}

- (void)setupAudioSessionCategory
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  if (-[SVAudioSession needsToSetupAudioSessionCategory](self, "needsToSetupAudioSessionCategory"))
  {
    -[SVAudioSession desiredAudioSessionConfiguration](self, "desiredAudioSessionConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SVAudioSession audioSession](self, "audioSession");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "category");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    objc_msgSend(v4, "setCategory:mode:routeSharingPolicy:options:error:", v5, v6, objc_msgSend(v3, "routeSharingPolicy"), 0, &v7);

  }
}

- (void)activateAudioSessionCategory
{
  void *v3;
  uint64_t v4;
  uint64_t v5;

  if (!-[SVAudioSession isAudioSessionActive](self, "isAudioSessionActive"))
  {
    if (-[SVAudioSession shouldActivateAudioSession](self, "shouldActivateAudioSession"))
    {
      -[SVAudioSession audioSession](self, "audioSession");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 0;
      v4 = objc_msgSend(v3, "setActive:error:", 1, &v5);

      -[SVAudioSession setAudioSessionActive:](self, "setAudioSessionActive:", v4);
    }
  }
}

- (void)deactivateAudioSessionCategory
{
  NSObject *v3;
  void *v4;
  int v5;
  NSObject *v6;
  uint64_t v7;

  -[SVAudioSession semaphore](self, "semaphore");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);

  if (-[SVAudioSession isAudioSessionActive](self, "isAudioSessionActive")
    && -[SVAudioSession canDeactivateAudioSession](self, "canDeactivateAudioSession"))
  {
    -[SVAudioSession audioSession](self, "audioSession");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    v5 = objc_msgSend(v4, "setActive:error:", 0, &v7);

    -[SVAudioSession setAudioSessionActive:](self, "setAudioSessionActive:", v5 ^ 1u);
  }
  -[SVAudioSession semaphore](self, "semaphore");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v6);

}

- (id)desiredAudioSessionConfiguration
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  SVAudioSessionConfiguration *v14;

  v3 = (id)*MEMORY[0x24BDB1598];
  v4 = (id)*MEMORY[0x24BDB1618];
  v5 = (void *)MEMORY[0x24BDD14E0];
  -[SVAudioSession players](self, "players");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectEnumerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "countForObject:", &unk_24DBC88D8))
  {
    v10 = (id)*MEMORY[0x24BDB15A8];

    v11 = (void *)*MEMORY[0x24BDB1640];
    v12 = 1;
    v3 = v4;
    v4 = (id)*MEMORY[0x24BDB1640];
LABEL_5:
    v13 = v11;

    v3 = v10;
    goto LABEL_6;
  }
  v12 = 0;
  if (objc_msgSend(v9, "countForObject:", &unk_24DBC88F0))
  {
    v11 = (void *)*MEMORY[0x24BDB15A8];
    v10 = (id)*MEMORY[0x24BDB15A8];
    goto LABEL_5;
  }
LABEL_6:
  v14 = -[SVAudioSessionConfiguration initWithCategory:mode:policy:]([SVAudioSessionConfiguration alloc], "initWithCategory:mode:policy:", v3, v4, v12);

  return v14;
}

- (BOOL)isAudioSessionActive
{
  return self->_audioSessionActive;
}

- (void)setAudioSessionActive:(BOOL)a3
{
  self->_audioSessionActive = a3;
}

- (OS_dispatch_semaphore)semaphore
{
  return self->_semaphore;
}

- (NSMapTable)players
{
  return self->_players;
}

- (SVMediaPlaybackController)playbackController
{
  return self->_playbackController;
}

- (AVAudioSession)audioSession
{
  return self->_audioSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioSession, 0);
  objc_storeStrong((id *)&self->_playbackController, 0);
  objc_storeStrong((id *)&self->_players, 0);
  objc_storeStrong((id *)&self->_semaphore, 0);
}

@end
