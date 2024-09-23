@implementation ICLiveLink

- (ICLiveLink)initWithSharedListeningSessionIdentifier:(id)a3 identity:(id)a4
{
  id v6;
  id v7;
  ICLiveLink *v8;
  uint64_t v9;
  NSString *identifier;
  uint64_t v11;
  ICLiveLinkIdentity *clientSpecifiedIdentity;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSMutableDictionary *pendingRequests;
  uint64_t v21;
  NSMutableArray *pendingActions;
  NSObject *v23;
  dispatch_queue_t v24;
  OS_dispatch_queue *delegateQueue;
  objc_super v27;

  v6 = a3;
  v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)ICLiveLink;
  v8 = -[ICLiveLink init](&v27, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    clientSpecifiedIdentity = v8->_clientSpecifiedIdentity;
    v8->_clientSpecifiedIdentity = (ICLiveLinkIdentity *)v11;

    v8->_currentRetryCount = 0;
    v8->_started = 0;
    *(_WORD *)&v8->_starting = 0;
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.mobileipod"));
    v14 = objc_msgSend(v13, "integerForKey:", CFSTR("LiveLinkMaxRetries"));

    v15 = 3;
    if (v14 > 3)
      v15 = v14;
    v8->_maxRetries = v15;
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.mobileipod"));
    v17 = objc_msgSend(v16, "integerForKey:", CFSTR("LiveLinkMaxRetryWaitPeriod"));

    v18 = 2;
    if (v17 > 2)
      v18 = v17;
    v8->_maxRetryWaitPeriod = v18;
    v8->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v19 = objc_claimAutoreleasedReturnValue();
    pendingRequests = v8->_pendingRequests;
    v8->_pendingRequests = (NSMutableDictionary *)v19;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v21 = objc_claimAutoreleasedReturnValue();
    pendingActions = v8->_pendingActions;
    v8->_pendingActions = (NSMutableArray *)v21;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = dispatch_queue_create("com.apple.amp.MediaServices.LiveLink.delegateQueue", v23);
    delegateQueue = v8->_delegateQueue;
    v8->_delegateQueue = (OS_dispatch_queue *)v24;

  }
  return v8;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  ICLiveLink *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v6 = self;
    _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_DEFAULT, "ILL %p: Deallocating.", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)ICLiveLink;
  -[ICLiveLink dealloc](&v4, sel_dealloc);
}

- (BOOL)isStarted
{
  ICLiveLink *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_started;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (NSURL)invitationURL
{
  void *v2;
  void *v3;

  -[ICLiveLink connectionController](self, "connectionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inviteURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (void)start
{
  NSObject *v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  ICLiveLink *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (-[ICLiveLink isStarted](self, "isStarted"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICLiveLink.m"), 372, CFSTR("Attempted to start an already started live link"));

  }
  v4 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 134217984;
    v20 = self;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "ILL %p: Starting.", (uint8_t *)&v19, 0xCu);
  }

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[ICLiveLink setStarting:](self, "setStarting:", 1);
  -[ICLiveLink connectionController](self, "connectionController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.mobileipod"));
    v8 = objc_msgSend(v7, "BOOLForKey:", CFSTR("forceExternalQR"));

    if (v8)
    {
      -[ICLiveLink identifier](self, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICLiveLink clientSpecifiedIdentity](self, "clientSpecifiedIdentity");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bundleIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = objc_msgSend(MEMORY[0x1E0D4D070], "hasBoolEntitlement:", CFSTR("com.apple.itunescloud.quic.inprocess"));
      -[ICLiveLink identifier](self, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICLiveLink clientSpecifiedIdentity](self, "clientSpecifiedIdentity");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bundleIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        +[ICSharedListeningConnectionController sharedListeningConnectionWithSessionIdentifier:identity:bundleID:](ICSharedListeningConnectionController, "sharedListeningConnectionWithSessionIdentifier:identity:bundleID:", v9, v10, v12);
        v14 = objc_claimAutoreleasedReturnValue();
LABEL_11:
        v15 = (void *)v14;
        -[ICLiveLink setConnectionController:](self, "setConnectionController:", v14);

        -[ICLiveLink connectionController](self, "connectionController");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setDelegate:", self);

        -[ICLiveLink connectionController](self, "connectionController");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "start");

        goto LABEL_12;
      }
    }
    +[ICSharedListeningConnectionController externalSharedListeningConnectionWithSessionIdentifier:identity:bundleID:](ICSharedListeningConnectionController, "externalSharedListeningConnectionWithSessionIdentifier:identity:bundleID:", v9, v10, v12);
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
LABEL_12:
  os_unfair_lock_unlock(p_lock);
}

- (void)stop
{
  os_unfair_lock_s *p_lock;
  _BOOL4 started;
  void *v5;
  id WeakRetained;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  ICLiveLink *v10;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  started = self->_started;
  -[ICLiveLink setStarted:](self, "setStarted:", 0);
  -[ICLiveLink setStarting:](self, "setStarting:", 0);
  -[ICLiveLink connectionController](self, "connectionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stop");

  -[ICLiveLink setConnectionController:](self, "setConnectionController:", 0);
  -[ICLiveLink setForcedReconnectReason:](self, "setForcedReconnectReason:", 0);
  -[ICLiveLink setDeferredReconnectReason:](self, "setDeferredReconnectReason:", 0);
  os_unfair_lock_unlock(p_lock);
  if (started)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[ICLiveLink delegateQueue](self, "delegateQueue");
      v7 = objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __18__ICLiveLink_stop__block_invoke;
      v8[3] = &unk_1E4391110;
      v9 = WeakRetained;
      v10 = self;
      dispatch_async(v7, v8);

    }
  }
}

- (void)reconnectWithReason:(id)a3 options:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  ICLiveLink *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134218242;
    v10 = self;
    v11 = 2114;
    v12 = v5;
    _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_DEFAULT, "ILL %p: forcing reconnect because: %{public}@", (uint8_t *)&v9, 0x16u);
  }

  os_unfair_lock_lock(&self->_lock);
  -[ICLiveLink forcedReconnectReason](self, "forcedReconnectReason");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[ICLiveLink setDeferredReconnectReason:](self, "setDeferredReconnectReason:", v5);
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    -[ICLiveLink setCurrentRetryCount:](self, "setCurrentRetryCount:", 0);
    -[ICLiveLink setForcedReconnectReason:](self, "setForcedReconnectReason:", v5);
    os_unfair_lock_unlock(&self->_lock);
    -[ICLiveLink connectionController](self, "connectionController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stop");

  }
}

- (void)beginSynchronizedPlaybackWithAVPlaybackCoordinator:(id)a3
{
  id v4;
  ICLiveLinkPlaybackCoordinatorMedium *playbackCoordinatorMedium;
  id v6;
  NSObject *v7;
  ICLinkLinkAVPlaybackCoordinatorMedium *v8;
  NSObject *v9;
  int v10;
  ICLiveLink *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_playbackCoordinatorMedium)
    goto LABEL_5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_5;
  playbackCoordinatorMedium = self->_playbackCoordinatorMedium;
  -[ICLiveLinkPlaybackCoordinatorMedium playbackCoordinator](playbackCoordinatorMedium, "playbackCoordinator");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 != v4)
  {

LABEL_5:
    v7 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 134218242;
      v11 = self;
      v12 = 2114;
      v13 = v4;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "ILL %p: beginning playback sync with coordinator: %{public}@", (uint8_t *)&v10, 0x16u);
    }

    v8 = -[ICLinkLinkAVPlaybackCoordinatorMedium initWithPlaybackCoordinator:liveLink:]([ICLinkLinkAVPlaybackCoordinatorMedium alloc], "initWithPlaybackCoordinator:liveLink:", v4, self);
    playbackCoordinatorMedium = self->_playbackCoordinatorMedium;
    self->_playbackCoordinatorMedium = &v8->super;
    goto LABEL_8;
  }
  v9 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134218242;
    v11 = self;
    v12 = 2114;
    v13 = v4;
    _os_log_impl(&dword_1A03E3000, v9, OS_LOG_TYPE_DEFAULT, "ILL %p: already syncing playback with coordinator: %{public}@", (uint8_t *)&v10, 0x16u);
  }

LABEL_8:
}

- (void)beginSynchronizedPlaybackWithAVCFPlaybackCoordinator:(void *)a3
{
  NSObject *v4;
  int v5;
  ICLiveLink *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 134217984;
    v6 = self;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "ILL %p: failed to begin playback sync with AVCFPlaybackCoordinator [ICLiveLink compiled without AVCFPlaybackCoordinator.h]", (uint8_t *)&v5, 0xCu);
  }

}

- (void)endSynchronizedPlayback
{
  NSObject *v3;
  ICLiveLinkPlaybackCoordinatorMedium *playbackCoordinatorMedium;
  int v5;
  ICLiveLink *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 134217984;
    v6 = self;
    _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_DEFAULT, "ILL %p: ending playback sync", (uint8_t *)&v5, 0xCu);
  }

  -[ICLiveLinkPlaybackCoordinatorMedium clearCoordinationMediumDelegate](self->_playbackCoordinatorMedium, "clearCoordinationMediumDelegate");
  playbackCoordinatorMedium = self->_playbackCoordinatorMedium;
  self->_playbackCoordinatorMedium = 0;

}

- (void)broadcastDirectCurrentItemChangedToItemIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  id *v6;
  void *v7;
  _BYTE *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id *v13;
  id *v14;
  id *v15;
  id *v16;
  NSObject *v17;
  void *v18;
  uint8_t buf[4];
  ICLiveLink *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_new();
  v6 = (id *)v5;
  if (v5)
  {
    *(_BYTE *)(v5 + 52) |= 1u;
    *(_DWORD *)(v5 + 48) = 1;
    v7 = (void *)objc_opt_new();
    -[_ICLLProtocolMessage setCommand:]((uint64_t)v6, v7);

    v8 = v6[2];
    if (v8)
    {
      v8[104] |= 1u;
      *((_DWORD *)v8 + 6) = 5;
    }
  }
  else
  {
    v18 = (void *)objc_opt_new();
    -[_ICLLProtocolMessage setCommand:](0, v18);

    v8 = 0;
  }

  v9 = (void *)objc_opt_new();
  if (v6)
    v10 = v6[2];
  else
    v10 = 0;
  v11 = v10;
  v12 = v9;
  if (v11)
  {
    -[_ICLLCommandMessage clearOneofValuesForCommand]((uint64_t)v11);
    *((_BYTE *)v11 + 104) |= 1u;
    *((_DWORD *)v11 + 6) = 5;
    objc_storeStrong((id *)v11 + 4, v9);
  }

  if (v6 && (v13 = (id *)v6[2]) != 0)
  {
    v14 = v13;
    v15 = (id *)v13[4];
    v16 = v15;
    if (v15)
      objc_storeStrong(v15 + 1, a3);
  }
  else
  {
    v16 = 0;
    v14 = 0;
  }

  v17 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v21 = self;
    v22 = 2114;
    v23 = v4;
    _os_log_impl(&dword_1A03E3000, v17, OS_LOG_TYPE_DEFAULT, "ILL %p: broadcastDirectCurrentItemChangedToItemIdentifier itemId=%{public}@", buf, 0x16u);
  }

  -[ICLiveLink sendMessage:completion:](self, "sendMessage:completion:", v6, &__block_literal_global_11184);
}

- (void)updateWithIdentity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  ICLiveLinkIdentity *v8;
  ICLiveLinkIdentity *clientSpecifiedIdentity;
  _BOOL4 started;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  id *v14;
  void *v15;
  _BYTE *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  int v31;
  ICLiveLink *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[ICLiveLinkIdentity externalIdentifier](self->_clientSpecifiedIdentity, "externalIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "externalIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == v6)
    v7 = 1;
  else
    v7 = objc_msgSend(v5, "isEqual:", v6);

  v8 = (ICLiveLinkIdentity *)objc_msgSend(v4, "copy");
  clientSpecifiedIdentity = self->_clientSpecifiedIdentity;
  self->_clientSpecifiedIdentity = v8;

  started = self->_started;
  -[ICLiveLinkIdentity externalIdentifier](self->_clientSpecifiedIdentity, "externalIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_lock);
  if (started && (v7 & 1) == 0)
  {
    v12 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v31 = 134218242;
      v32 = self;
      v33 = 2114;
      v34 = v11;
      _os_log_impl(&dword_1A03E3000, v12, OS_LOG_TYPE_DEFAULT, "ILL %p: Notifying server of updated externalID: %{public}@", (uint8_t *)&v31, 0x16u);
    }

    v13 = objc_opt_new();
    v14 = (id *)v13;
    if (v13)
    {
      *(_BYTE *)(v13 + 52) |= 1u;
      *(_DWORD *)(v13 + 48) = 1;
      v15 = (void *)objc_opt_new();
      -[_ICLLProtocolMessage setCommand:]((uint64_t)v14, v15);

      v16 = v14[2];
      if (v16)
      {
        v16[104] |= 1u;
        *((_DWORD *)v16 + 6) = 8;
      }
    }
    else
    {
      v30 = (void *)objc_opt_new();
      -[_ICLLProtocolMessage setCommand:](0, v30);

      v16 = 0;
    }

    v17 = (void *)objc_opt_new();
    if (v14)
      v18 = v14[2];
    else
      v18 = 0;
    v19 = v18;
    -[_ICLLCommandMessage setClientInfo:]((uint64_t)v19, v17);

    -[ICLiveLink connectionController](self, "connectionController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "sessionToken");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v22 = v14[2];
      v23 = v22;
      if (v22)
      {
        v24 = (void *)*((_QWORD *)v22 + 2);
        goto LABEL_16;
      }
    }
    else
    {
      v23 = 0;
    }
    v24 = 0;
LABEL_16:
    v25 = v24;
    -[_ICLLClientInfoCommand setSharedSessionToken:]((uint64_t)v25, v21);

    if (v14)
    {
      v26 = v14[2];
      v27 = v26;
      if (v26)
      {
        v28 = (void *)*((_QWORD *)v26 + 2);
LABEL_19:
        v29 = v28;
        -[_ICLLClientInfoCommand setExternalId:]((uint64_t)v29, v11);

        -[ICLiveLink sendMessage:completion:](self, "sendMessage:completion:", v14, &__block_literal_global_57);
        goto LABEL_20;
      }
    }
    else
    {
      v27 = 0;
    }
    v28 = 0;
    goto LABEL_19;
  }
LABEL_20:

}

- (void)expectingToJoinWithStartItem:(id)a3 asInitiator:(BOOL)a4
{
  _BOOL4 v4;
  NSString *v6;
  NSObject *v7;
  NSString *expectingToJoinStartItemIdentifier;
  int v9;
  ICLiveLink *v10;
  __int16 v11;
  NSString *v12;
  __int16 v13;
  _BOOL4 v14;
  uint64_t v15;

  v4 = a4;
  v15 = *MEMORY[0x1E0C80C00];
  v6 = (NSString *)a3;
  v7 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134218498;
    v10 = self;
    v11 = 2114;
    v12 = v6;
    v13 = 1024;
    v14 = v4;
    _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "ILL %p: expectingToJoin startItem=%{public}@ asInitiator=%{BOOL}u", (uint8_t *)&v9, 0x1Cu);
  }

  expectingToJoinStartItemIdentifier = self->_expectingToJoinStartItemIdentifier;
  self->_expectingToJoinStartItemIdentifier = v6;

  self->_expectingToJoinAsInitiator = v4;
}

- (ICLiveLinkIdentity)identity
{
  os_unfair_lock_s *p_lock;
  NSArray *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  ICLiveLinkIdentity *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_participants;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v4;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
      if (objc_msgSend(v10, "serverID", (_QWORD)v13) == self->_localParticipantServerID)
        break;
      if (v7 == ++v9)
      {
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v11 = v10;

    if (v11)
      goto LABEL_12;
  }
  else
  {
LABEL_9:

  }
  v11 = self->_clientSpecifiedIdentity;
LABEL_12:
  os_unfair_lock_unlock(p_lock);

  return v11;
}

- (NSArray)participants
{
  os_unfair_lock_s *p_lock;
  NSArray *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_participants;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (ICSharedListeningQueue)queue
{
  os_unfair_lock_s *p_lock;
  ICSharedListeningQueue *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_queue;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)isExpectingToJoinWithStartItem
{
  return self->_expectingToJoinStartItemIdentifier != 0;
}

- (void)fetchPlaybackSyncStateForMediumWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id *v6;
  void *v7;
  _BYTE *v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  NSString *expectingToJoinStartItemIdentifier;
  _BOOL4 expectingToJoinAsInitiator;
  NSString *v15;
  id *v16;
  id *v17;
  id *v18;
  id *v19;
  BOOL v20;
  id *v21;
  id *v22;
  _BYTE *v23;
  NSString *v24;
  id v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  uint8_t buf[4];
  ICLiveLink *v30;
  __int16 v31;
  NSString *v32;
  __int16 v33;
  _BOOL4 v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_new();
  v6 = (id *)v5;
  if (v5)
  {
    *(_BYTE *)(v5 + 52) |= 1u;
    *(_DWORD *)(v5 + 48) = 4;
    v7 = (void *)objc_opt_new();
    -[_ICLLProtocolMessage setQuery:]((uint64_t)v6, v7);

    v8 = v6[4];
    if (v8)
    {
      v8[48] |= 1u;
      *((_DWORD *)v8 + 8) = 2;
    }
  }
  else
  {
    v26 = (void *)objc_opt_new();
    -[_ICLLProtocolMessage setQuery:](0, v26);

    v8 = 0;
  }

  v9 = (void *)objc_opt_new();
  if (v6)
    v10 = v6[4];
  else
    v10 = 0;
  v11 = v10;
  -[_ICLLQueryMessage setPlaybackSyncState:]((uint64_t)v11, v9);

  if (self->_expectingToJoinStartItemIdentifier)
  {
    v12 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      expectingToJoinStartItemIdentifier = self->_expectingToJoinStartItemIdentifier;
      expectingToJoinAsInitiator = self->_expectingToJoinAsInitiator;
      *(_DWORD *)buf = 134218498;
      v30 = self;
      v31 = 2114;
      v32 = expectingToJoinStartItemIdentifier;
      v33 = 1024;
      v34 = expectingToJoinAsInitiator;
      _os_log_impl(&dword_1A03E3000, v12, OS_LOG_TYPE_DEFAULT, "ILL %p: fetchPlaybackSyncStateForMedium [first AV sync] initialAVSyncStartItem=%{public}@ initialAVSyncInitiator=%{BOOL}u", buf, 0x1Cu);
    }

    if (v6 && (v15 = self->_expectingToJoinStartItemIdentifier, (v16 = (id *)v6[4]) != 0))
    {
      v17 = v16;
      v18 = (id *)v16[3];
      v19 = v18;
      if (v18)
        objc_storeStrong(v18 + 2, v15);

    }
    else if (!v6)
    {
      goto LABEL_22;
    }
    v20 = self->_expectingToJoinAsInitiator;
    v21 = (id *)v6[4];
    if (v21)
    {
      v22 = v21;
      v23 = v21[3];
      if (v23)
      {
        v23[44] |= 1u;
        v23[40] = v20;
      }
      goto LABEL_17;
    }
LABEL_22:
    v23 = 0;
    v22 = 0;
LABEL_17:

    v24 = self->_expectingToJoinStartItemIdentifier;
    self->_expectingToJoinStartItemIdentifier = 0;

  }
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __60__ICLiveLink_fetchPlaybackSyncStateForMediumWithCompletion___block_invoke;
  v27[3] = &unk_1E438BA80;
  v27[4] = self;
  v28 = v4;
  v25 = v4;
  -[ICLiveLink sendMessage:completion:](self, "sendMessage:completion:", v6, v27);

}

- (void)fetchPlaybackSyncStateWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id *v6;
  void *v7;
  _BYTE *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[5];
  id v15;

  v4 = a3;
  v5 = objc_opt_new();
  v6 = (id *)v5;
  if (v5)
  {
    *(_BYTE *)(v5 + 52) |= 1u;
    *(_DWORD *)(v5 + 48) = 4;
    v7 = (void *)objc_opt_new();
    -[_ICLLProtocolMessage setQuery:]((uint64_t)v6, v7);

    v8 = v6[4];
    if (v8)
    {
      v8[48] |= 1u;
      *((_DWORD *)v8 + 8) = 2;
    }
  }
  else
  {
    v13 = (void *)objc_opt_new();
    -[_ICLLProtocolMessage setQuery:](0, v13);

    v8 = 0;
  }

  v9 = (void *)objc_opt_new();
  if (v6)
    v10 = v6[4];
  else
    v10 = 0;
  v11 = v10;
  -[_ICLLQueryMessage setPlaybackSyncState:]((uint64_t)v11, v9);

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __51__ICLiveLink_fetchPlaybackSyncStateWithCompletion___block_invoke;
  v14[3] = &unk_1E438BA80;
  v14[4] = self;
  v15 = v4;
  v12 = v4;
  -[ICLiveLink sendMessage:completion:](self, "sendMessage:completion:", v6, v14);

}

- (id)participantForParticipantUUID:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  NSArray *participants;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  ICLiveLink *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  NSArray *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v5 = self->_participants;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v5;
  v7 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "identifier", (_QWORD)v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqual:", v4);

        if (v12)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  os_unfair_lock_unlock(&self->_lock);
  if (!v7)
  {
    v13 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      participants = self->_participants;
      *(_DWORD *)buf = 134218498;
      v21 = self;
      v22 = 2114;
      v23 = v4;
      v24 = 2114;
      v25 = participants;
      _os_log_impl(&dword_1A03E3000, v13, OS_LOG_TYPE_ERROR, "ILL %p: Failed to find participant with UUID: %{public}@, in participants: %{public}@", buf, 0x20u);
    }

  }
  return v7;
}

- (void)receivedCurrentItemIdentifier:(id)a3 fromParticipant:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id *v12;
  id *v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[4];
  _QWORD v17[2];
  id v18;
  _QWORD block[4];
  _QWORD v20[2];
  id v21;
  NSObject *v22;

  v7 = a3;
  v8 = a4;
  os_unfair_lock_lock(&self->_lock);
  -[ICSharedListeningQueue itemForIdentifier:](self->_queue, "itemForIdentifier:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_lock);
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICLiveLink.m"), 618, CFSTR("Received current item ID not in queue: %@"), v7);

  }
  -[ICLiveLink delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[ICLiveLink delegateQueue](self, "delegateQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__ICLiveLink_receivedCurrentItemIdentifier_fromParticipant___block_invoke;
    block[3] = &unk_1E43912A8;
    v12 = (id *)v20;
    v20[0] = v10;
    v20[1] = self;
    v13 = &v21;
    v21 = v9;
    v22 = v8;
    dispatch_async(v11, block);

    v14 = v22;
LABEL_7:

    goto LABEL_8;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[ICLiveLink delegateQueue](self, "delegateQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __60__ICLiveLink_receivedCurrentItemIdentifier_fromParticipant___block_invoke_2;
    v16[3] = &unk_1E4391230;
    v12 = (id *)v17;
    v17[0] = v10;
    v17[1] = self;
    v13 = &v18;
    v18 = v9;
    dispatch_async(v14, v16);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)receivedEvent:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  ICLiveLink *v11;
  id v12;
  uint8_t buf[4];
  ICLiveLink *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ICLiveLink delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218754;
    v14 = self;
    v15 = 2114;
    v16 = (id)objc_opt_class();
    v17 = 2048;
    v18 = v5;
    v19 = 2114;
    v20 = v4;
    v7 = v16;
    _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_DEFAULT, "ILL %p: receivedEvent delegate=<%{public}@ %p> event=%{public}@", buf, 0x2Au);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[ICLiveLink delegateQueue](self, "delegateQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __28__ICLiveLink_receivedEvent___block_invoke;
    block[3] = &unk_1E4391230;
    v10 = v5;
    v11 = self;
    v12 = v4;
    dispatch_async(v8, block);

  }
}

- (void)sendPlaybackSyncPayload:(id)a3
{
  id v4;
  uint64_t v5;
  id *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id *v12;
  id *v13;
  _BYTE *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  NSObject *v19;
  const char *v20;
  void *v21;
  void *v22;
  id *v23;
  id *v24;
  _BYTE *v25;
  id v26;
  void *v27;
  void *v28;
  _BYTE *v29;
  uint64_t v30;
  id *v31;
  id *v32;
  _BYTE *v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  uint8_t buf[4];
  ICLiveLink *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  NSObject *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_new();
  v6 = (id *)v5;
  if (v5)
  {
    *(_BYTE *)(v5 + 52) |= 1u;
    *(_DWORD *)(v5 + 48) = 1;
  }
  v7 = (void *)objc_opt_new();
  -[_ICLLProtocolMessage setCommand:]((uint64_t)v6, v7);

  v8 = (void *)objc_opt_new();
  if (v6)
    v9 = v6[2];
  else
    v9 = 0;
  v10 = v9;
  v11 = v8;
  if (v10)
  {
    -[_ICLLCommandMessage clearOneofValuesForCommand]((uint64_t)v10);
    *((_BYTE *)v10 + 104) |= 1u;
    *((_DWORD *)v10 + 6) = 1;
    objc_storeStrong((id *)v10 + 9, v8);
  }

  if (v6 && (v12 = (id *)v6[2]) != 0)
  {
    v13 = v12;
    v14 = v12[9];
    if (v14)
    {
      v14[32] |= 1u;
      *((_DWORD *)v14 + 4) = 0;
    }
  }
  else
  {
    v14 = 0;
    v13 = 0;
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ICLiveLinkTransportControlStateKey"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ICLiveLinkTransportControlStateKey"));
    v16 = objc_claimAutoreleasedReturnValue();
    v37 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v16, 0, &v37);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v37;
    if (v18)
    {
      v19 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218498;
        v39 = self;
        v40 = 2114;
        v41 = v18;
        v42 = 2114;
        v43 = v16;
        v20 = "ILL %p: Serialization failed with error %{public}@ for transport control state %{public}@";
LABEL_19:
        _os_log_impl(&dword_1A03E3000, v19, OS_LOG_TYPE_ERROR, v20, buf, 0x20u);
        goto LABEL_42;
      }
      goto LABEL_42;
    }
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v17, 4);
    if (v6 && (v23 = (id *)v6[2]) != 0)
    {
      v24 = v23;
      v25 = v23[9];
      if (v25)
      {
        v25[32] |= 1u;
        *((_DWORD *)v25 + 4) = 2;
      }

    }
    else if (!v6)
    {
      v27 = 0;
      goto LABEL_48;
    }
    v26 = v6[2];
    v27 = v26;
    if (v26)
    {
      v28 = (void *)*((_QWORD *)v26 + 9);
      goto LABEL_27;
    }
LABEL_48:
    v28 = 0;
LABEL_27:
    v29 = v28;
    v19 = v22;
    if (v29)
    {
      -[_ICLLPlaybackSyncCommand clearOneofValuesForPayload]((uint64_t)v29);
      v29[32] |= 1u;
      *((_DWORD *)v29 + 4) = 2;
      v30 = 24;
LABEL_40:
      objc_storeStrong((id *)&v29[v30], v22);
      goto LABEL_41;
    }
    goto LABEL_41;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ICLiveLinkPlaybackSyncParticipantStateKey"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ICLiveLinkPlaybackSyncParticipantStateKey"));
    v16 = objc_claimAutoreleasedReturnValue();
    v36 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v16, 0, &v36);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v36;
    if (v18)
    {
      v19 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218498;
        v39 = self;
        v40 = 2114;
        v41 = v18;
        v42 = 2114;
        v43 = v16;
        v20 = "ILL %p: Serialization failed with error %{public}@ for participant state %{public}@";
        goto LABEL_19;
      }
LABEL_42:

      goto LABEL_43;
    }
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v17, 4);
    if (v6 && (v31 = (id *)v6[2]) != 0)
    {
      v32 = v31;
      v33 = v31[9];
      if (v33)
      {
        v33[32] |= 1u;
        *((_DWORD *)v33 + 4) = 1;
      }

    }
    else if (!v6)
    {
      v27 = 0;
      goto LABEL_51;
    }
    v34 = v6[2];
    v27 = v34;
    if (v34)
    {
      v35 = (void *)*((_QWORD *)v34 + 9);
      goto LABEL_38;
    }
LABEL_51:
    v35 = 0;
LABEL_38:
    v29 = v35;
    v19 = v22;
    if (v29)
    {
      -[_ICLLPlaybackSyncCommand clearOneofValuesForPayload]((uint64_t)v29);
      v29[32] |= 1u;
      *((_DWORD *)v29 + 4) = 1;
      v30 = 8;
      goto LABEL_40;
    }
LABEL_41:

    goto LABEL_42;
  }
  v16 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218242;
    v39 = self;
    v40 = 2114;
    v41 = v4;
    _os_log_impl(&dword_1A03E3000, v16, OS_LOG_TYPE_ERROR, "ILL %p: Playback sync payload had no recognized key. Payload: %{public}@", buf, 0x16u);
  }
LABEL_43:

  -[ICLiveLink sendMessage:completion:](self, "sendMessage:completion:", v6, &__block_literal_global_70);
}

- (void)sendMessage:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD *v12;

  v12 = a3;
  v6 = a4;
  if (v12)
    v7 = (void *)v12[5];
  else
    v7 = 0;
  v8 = v7;
  if (!objc_msgSend(v8, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[_ICLLProtocolMessage setTraceId:]((uint64_t)v12, v10);
    v8 = v10;
  }
  -[ICLiveLink _storeTraceID:completion:](self, "_storeTraceID:completion:", v8, v6);
  -[ICLiveLink connectionController](self, "connectionController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sendMessage:", v12);

}

- (void)_didReceiveAddItemsAction:(id)a3 completion:(id)a4
{
  id *v6;
  void (**v7)(_QWORD);
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  _QWORD v12[4];
  id *v13;
  ICLiveLink *v14;
  id v15;
  void (**v16)(_QWORD);
  uint8_t buf[4];
  ICLiveLink *v18;
  __int16 v19;
  id *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = (id *)a3;
  v7 = (void (**)(_QWORD))a4;
  if (v6 && (v8 = v6[3]) != 0)
  {
    v9 = v8;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __51__ICLiveLink__didReceiveAddItemsAction_completion___block_invoke;
    v12[3] = &unk_1E438EF60;
    v13 = v6;
    v14 = self;
    v10 = v9;
    v15 = v10;
    v16 = v7;
    -[ICLiveLink _updateQueueWithReason:completion:](self, "_updateQueueWithReason:completion:", CFSTR("ServerAction[AddItems]"), v12);

  }
  else
  {
    v11 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      v18 = self;
      v19 = 2114;
      v20 = v6;
      _os_log_impl(&dword_1A03E3000, v11, OS_LOG_TYPE_ERROR, "ILL %p: Received invalid AddItemsAction %{public}@", buf, 0x16u);
    }

    v7[2](v7);
    v10 = 0;
  }

}

- (void)_didReceiveCurrentItemChangeAction:(id)a3 completion:(id)a4
{
  id *v6;
  void (**v7)(_QWORD);
  id *v8;
  id *v9;
  id *v10;
  void *v11;
  id *v12;
  void *v13;
  NSObject *v14;
  ICLiveLinkPlaybackEvent *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  _QWORD v20[4];
  id *v21;
  uint8_t buf[4];
  ICLiveLink *v23;
  __int16 v24;
  id *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = (id *)a3;
  v7 = (void (**)(_QWORD))a4;
  if (v6 && (v8 = (id *)v6[5]) != 0)
  {
    v9 = v8;
    v10 = (id *)v8[1];
    -[ICLiveLink participants](self, "participants");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __60__ICLiveLink__didReceiveCurrentItemChangeAction_completion___block_invoke;
    v20[3] = &unk_1E438B9B8;
    v12 = v6;
    v21 = v12;
    objc_msgSend(v11, "msv_firstWhere:", v20);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      v23 = self;
      v24 = 2114;
      v25 = v10;
      v26 = 2114;
      v27 = v13;
      _os_log_impl(&dword_1A03E3000, v14, OS_LOG_TYPE_DEFAULT, "ILL %p: [received current item change] currentItemIdentifier=%{public}@ originator=%{public}@", buf, 0x20u);
    }

    -[ICLiveLink receivedCurrentItemIdentifier:fromParticipant:](self, "receivedCurrentItemIdentifier:fromParticipant:", v10, v13);
    if (*((_BYTE *)v12 + 144))
    {
      v15 = -[ICLiveLinkPlaybackEvent initWithKind:]([ICLiveLinkPlaybackEvent alloc], "initWithKind:", 4);
      -[ICLiveLink _participantForAction:](self, "_participantForAction:", v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[ICLiveLinkEvent eventWithPlaybackEvent:participant:](ICLiveLinkEvent, "eventWithPlaybackEvent:participant:", v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      -[ICLiveLink receivedEvent:](self, "receivedEvent:", v17);
      v7[2](v7);

    }
    else
    {
      v18 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        v23 = self;
        v24 = 2114;
        v25 = v9;
        _os_log_impl(&dword_1A03E3000, v18, OS_LOG_TYPE_DEFAULT, "ILL %p: Received CurrentItemChangeAction with displayNotice=NO %{public}@", buf, 0x16u);
      }

      v7[2](v7);
    }

  }
  else
  {
    v19 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      v23 = self;
      v24 = 2114;
      v25 = v6;
      _os_log_impl(&dword_1A03E3000, v19, OS_LOG_TYPE_ERROR, "ILL %p: Received invalid CurrentItemChangeAction %{public}@", buf, 0x16u);
    }

    v7[2](v7);
    v9 = 0;
  }

}

- (void)_didReceiveCurrentItemTransitionAction:(id)a3 completion:(id)a4
{
  id *v6;
  void (**v7)(_QWORD);
  id *v8;
  id *v9;
  void (**v10)(_QWORD);
  id *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  _QWORD v16[4];
  id *v17;
  uint8_t buf[4];
  ICLiveLink *v19;
  __int16 v20;
  id *v21;
  __int16 v22;
  void (**v23)(_QWORD);
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = (id *)a3;
  v7 = (void (**)(_QWORD))a4;
  if (v6 && (v8 = (id *)v6[6]) != 0)
  {
    v9 = v8;
    v10 = (void (**)(_QWORD))v8[2];
    v11 = (id *)v9[1];
    -[ICLiveLink participants](self, "participants");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __64__ICLiveLink__didReceiveCurrentItemTransitionAction_completion___block_invoke;
    v16[3] = &unk_1E438B9B8;
    v17 = v6;
    objc_msgSend(v12, "msv_firstWhere:", v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218754;
      v19 = self;
      v20 = 2114;
      v21 = v11;
      v22 = 2114;
      v23 = v10;
      v24 = 2114;
      v25 = v13;
      _os_log_impl(&dword_1A03E3000, v14, OS_LOG_TYPE_DEFAULT, "ILL %p: [received current item transition - INFORMATIONAL ONLY] fromItemID=%{public}@ toItemID=%{public}@ originator=%{public}@", buf, 0x2Au);
    }

    v7[2](v7);
    v7 = v10;
  }
  else
  {
    v15 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      v19 = self;
      v20 = 2114;
      v21 = v6;
      _os_log_impl(&dword_1A03E3000, v15, OS_LOG_TYPE_ERROR, "ILL %p: Received invalid CurrentItemTransitionAction %{public}@", buf, 0x16u);
    }

    v7[2](v7);
    v9 = 0;
  }

}

- (void)_didReceiveMoveItemAction:(id)a3 completion:(id)a4
{
  id *v6;
  void (**v7)(_QWORD);
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  _QWORD v12[4];
  id *v13;
  ICLiveLink *v14;
  id v15;
  void (**v16)(_QWORD);
  uint8_t buf[4];
  ICLiveLink *v18;
  __int16 v19;
  id *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = (id *)a3;
  v7 = (void (**)(_QWORD))a4;
  if (v6 && (v8 = v6[8]) != 0)
  {
    v9 = v8;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __51__ICLiveLink__didReceiveMoveItemAction_completion___block_invoke;
    v12[3] = &unk_1E438EF60;
    v13 = v6;
    v14 = self;
    v10 = v9;
    v15 = v10;
    v16 = v7;
    -[ICLiveLink _updateQueueWithReason:completion:](self, "_updateQueueWithReason:completion:", CFSTR("ServerAction[MoveItem]"), v12);

  }
  else
  {
    v11 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      v18 = self;
      v19 = 2114;
      v20 = v6;
      _os_log_impl(&dword_1A03E3000, v11, OS_LOG_TYPE_ERROR, "ILL %p: Received invalid MoveItemAction %{public}@", buf, 0x16u);
    }

    v7[2](v7);
    v10 = 0;
  }

}

- (void)_didReceiveParticipantChangeAction:(id)a3 completion:(id)a4
{
  id *v6;
  void (**v7)(_QWORD);
  _QWORD *v8;
  _QWORD *v9;
  int v10;
  void *v12;
  void *v13;
  ICLiveLinkPlaybackCoordinatorMedium *playbackCoordinatorMedium;
  void *v15;
  NSObject *v16;
  id *v17;
  void *v18;
  id v19;
  NSObject *v20;
  _QWORD v21[5];
  id *v22;
  id v23;
  void (**v24)(_QWORD);
  uint8_t buf[4];
  ICLiveLink *v26;
  __int16 v27;
  id *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = (id *)a3;
  v7 = (void (**)(_QWORD))a4;
  if (v6)
  {
    v8 = v6[10];
    if (v8)
    {
      v9 = v8;
      if ((*((_BYTE *)v8 + 28) & 2) != 0)
      {
        v10 = *((_DWORD *)v8 + 6);
        if (v10 == 4 || v10 == 2)
        {
          -[ICLiveLink _participantForAction:](self, "_participantForAction:", v6);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            v13 = v12;
            playbackCoordinatorMedium = self->_playbackCoordinatorMedium;
            objc_msgSend(v12, "identifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[ICLiveLinkPlaybackCoordinatorMedium removeParticipant:](playbackCoordinatorMedium, "removeParticipant:", v15);

LABEL_15:
            v18 = (void *)v9[2];
            if (v18)
            {
              v19 = v18;
              -[ICLiveLink _handleUpdatedParticipantQuery:](self, "_handleUpdatedParticipantQuery:", v19);
              -[ICLiveLink _emitSessionEventIfNeededForAction:disconnectedParticipant:](self, "_emitSessionEventIfNeededForAction:disconnectedParticipant:", v6, v13);
              v7[2](v7);

            }
            else
            {
              v21[0] = MEMORY[0x1E0C809B0];
              v21[1] = 3221225472;
              v21[2] = __60__ICLiveLink__didReceiveParticipantChangeAction_completion___block_invoke;
              v21[3] = &unk_1E438EF60;
              v21[4] = self;
              v22 = v6;
              v23 = v13;
              v24 = v7;
              -[ICLiveLink _updateParticipantsWithReason:completion:](self, "_updateParticipantsWithReason:completion:", CFSTR("ParticipantChangeAction"), v21);

            }
            goto LABEL_22;
          }
          v16 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            v17 = (id *)v6[1];
            *(_DWORD *)buf = 134218240;
            v26 = self;
            v27 = 2048;
            v28 = v17;
            _os_log_impl(&dword_1A03E3000, v16, OS_LOG_TYPE_ERROR, "ILL %p: Received Participant Leave/Disconnect for unknown participant ID = %ld", buf, 0x16u);
          }

        }
      }
      v13 = 0;
      goto LABEL_15;
    }
  }
  v20 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218242;
    v26 = self;
    v27 = 2114;
    v28 = v6;
    _os_log_impl(&dword_1A03E3000, v20, OS_LOG_TYPE_ERROR, "ILL %p: Received invalid ParticipantChangeAction %{public}@", buf, 0x16u);
  }

  v7[2](v7);
  v9 = 0;
LABEL_22:

}

- (void)_didReceivePlaybackSyncAction:(id)a3 completion:(id)a4
{
  id *v6;
  void (**v7)(_QWORD);
  id *v8;
  id *v9;
  int v10;
  const __CFString *v11;
  int *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  ICLiveLinkPlaybackCoordinatorMedium *playbackCoordinatorMedium;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v24[4];
  id *v25;
  id v26;
  const __CFString *v27;
  void *v28;
  uint8_t buf[4];
  ICLiveLink *v30;
  __int16 v31;
  id *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = (id *)a3;
  v7 = (void (**)(_QWORD))a4;
  if (v6)
  {
    v8 = (id *)v6[12];
    if (v8)
    {
      v9 = v8;
      if (((_BYTE)v8[4] & 1) != 0)
      {
        v10 = *((_DWORD *)v8 + 4);
        if (v10 == 2)
        {
          v11 = CFSTR("ICLiveLinkTransportControlStateKey");
          v12 = &OBJC_IVAR____ICLLPlaybackSyncAction__transportControlState;
LABEL_8:
          v13 = *(id *)((char *)v8 + *v12);
          objc_msgSend(v13, "dataUsingEncoding:", 4);
          v14 = objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            v26 = 0;
            objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v14, 0, &v26);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v26;
            if (v23)
            {
              v16 = v15;
              v17 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134218242;
                v30 = self;
                v31 = 2114;
                v32 = v9;
                _os_log_impl(&dword_1A03E3000, v17, OS_LOG_TYPE_ERROR, "ILL %p: Could not construct payload for sync message %{public}@", buf, 0x16u);
              }
            }
            else
            {
              playbackCoordinatorMedium = self->_playbackCoordinatorMedium;
              v27 = v11;
              v28 = v15;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              -[ICLiveLinkPlaybackCoordinatorMedium handlePlaybackSyncPayload:](playbackCoordinatorMedium, "handlePlaybackSyncPayload:", v19);

              if (!-[ICLiveLinkPlaybackCoordinatorMedium isCoordinatorSuspended](self->_playbackCoordinatorMedium, "isCoordinatorSuspended")|| ((_BYTE)v9[4] & 1) == 0|| *((_DWORD *)v9 + 4) != 2|| !_NSIsNSDictionary())
              {
                goto LABEL_20;
              }
              v16 = v15;
              v20 = v15;
              objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("Identifier"));
              v17 = objc_claimAutoreleasedReturnValue();
              -[ICLiveLink participants](self, "participants");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v24[0] = MEMORY[0x1E0C809B0];
              v24[1] = 3221225472;
              v24[2] = __55__ICLiveLink__didReceivePlaybackSyncAction_completion___block_invoke;
              v24[3] = &unk_1E438B9B8;
              v25 = v6;
              objc_msgSend(v21, "msv_firstWhere:", v24);
              v22 = (void *)objc_claimAutoreleasedReturnValue();

              -[ICLiveLink receivedCurrentItemIdentifier:fromParticipant:](self, "receivedCurrentItemIdentifier:fromParticipant:", v17, v22);
            }

            v15 = v16;
LABEL_20:

            goto LABEL_24;
          }
          goto LABEL_13;
        }
        if (v10 == 1)
        {
          v11 = CFSTR("ICLiveLinkPlaybackSyncParticipantStateKey");
          v12 = &OBJC_IVAR____ICLLPlaybackSyncAction__participantState;
          goto LABEL_8;
        }
      }
LABEL_13:
      v14 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218242;
        v30 = self;
        v31 = 2114;
        v32 = v9;
        _os_log_impl(&dword_1A03E3000, v14, OS_LOG_TYPE_ERROR, "ILL %p: No payload for sync message %{public}@", buf, 0x16u);
      }
      goto LABEL_24;
    }
  }
  v14 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218242;
    v30 = self;
    v31 = 2114;
    v32 = v6;
    _os_log_impl(&dword_1A03E3000, v14, OS_LOG_TYPE_ERROR, "ILL %p: Received invalid PlaybackSyncAction %{public}@", buf, 0x16u);
  }
  v9 = 0;
LABEL_24:

  v7[2](v7);
}

- (void)_didReceivePlayNowQueueItemsAction:(id)a3 completion:(id)a4
{
  id *v6;
  void (**v7)(_QWORD);
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  ICLiveLink *v14;
  id *v15;
  void (**v16)(_QWORD);
  uint8_t buf[4];
  ICLiveLink *v18;
  __int16 v19;
  id *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = (id *)a3;
  v7 = (void (**)(_QWORD))a4;
  if (v6 && (v8 = v6[11]) != 0)
  {
    v9 = v8;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __60__ICLiveLink__didReceivePlayNowQueueItemsAction_completion___block_invoke;
    v12[3] = &unk_1E438EF60;
    v16 = v7;
    v10 = v9;
    v13 = v10;
    v14 = self;
    v15 = v6;
    -[ICLiveLink _updateQueueWithReason:completion:](self, "_updateQueueWithReason:completion:", CFSTR("ServerAction[PlayNowQueueItems]"), v12);

  }
  else
  {
    v11 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      v18 = self;
      v19 = 2114;
      v20 = v6;
      _os_log_impl(&dword_1A03E3000, v11, OS_LOG_TYPE_ERROR, "ILL %p: Received invalid PlayNowQueueItemsAction %{public}@", buf, 0x16u);
    }

    v7[2](v7);
    v10 = 0;
  }

}

- (void)_didReceiveQueueSyncAction:(id)a3 completion:(id)a4
{
  id *v6;
  void (**v7)(_QWORD);
  id *v8;
  id *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  os_log_t v14;
  ICLiveLinkQueueEventContentUpdatedMessage *v15;
  objc_class *v16;
  objc_class *v17;
  ICLiveLinkQueueEventContentUpdatedMessage *v18;
  void *v19;
  void *v20;
  void *v21;
  const char *v22;
  NSObject *v23;
  int v24;
  ICLiveLink *v25;
  __int16 v26;
  id *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = (id *)a3;
  v7 = (void (**)(_QWORD))a4;
  if (v6)
  {
    v8 = (id *)v6[13];
    if (v8)
    {
      v9 = v8;
      v10 = v8[2];
      v11 = v9[1];
      v12 = v9[3];
      -[ICLiveLink _handleUpdatedQueue:playbackControlSettings:serverQueueContext:](self, "_handleUpdatedQueue:playbackControlSettings:serverQueueContext:", v10, v11, v12);

      if (*((_BYTE *)v6 + 144))
      {
        v13 = v6[7];
        if (v13)
        {
          v14 = (os_log_t)v13;
          v15 = [ICLiveLinkQueueEventContentUpdatedMessage alloc];
          v16 = v14[2].isa;
          v17 = v14[1].isa;
          v18 = -[ICLiveLinkQueueEventContentUpdatedMessage initWithLocalizedTitle:localizedMessage:](v15, "initWithLocalizedTitle:localizedMessage:", v16, v17);

          +[ICLiveLinkQueueEvent queueEventWithContentUpdatedMessage:](ICLiveLinkQueueEvent, "queueEventWithContentUpdatedMessage:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICLiveLink _participantForAction:](self, "_participantForAction:", v6);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          +[ICLiveLinkEvent eventWithQueueEvent:participant:](ICLiveLinkEvent, "eventWithQueueEvent:participant:", v19, v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          -[ICLiveLink receivedEvent:](self, "receivedEvent:", v21);
LABEL_11:

          goto LABEL_15;
        }
        v14 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          goto LABEL_11;
        v24 = 134218242;
        v25 = self;
        v26 = 2114;
        v27 = v9;
        v22 = "ILL %p: Received QueueSyncAction with displayNotice=YES but no DisplayMessage %{public}@";
      }
      else
      {
        v14 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          goto LABEL_11;
        v24 = 134218242;
        v25 = self;
        v26 = 2114;
        v27 = v9;
        v22 = "ILL %p: Received QueueSyncAction with displayNotice=NO %{public}@";
      }
      _os_log_impl(&dword_1A03E3000, v14, OS_LOG_TYPE_ERROR, v22, (uint8_t *)&v24, 0x16u);
      goto LABEL_11;
    }
  }
  v23 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    v24 = 134218242;
    v25 = self;
    v26 = 2114;
    v27 = v6;
    _os_log_impl(&dword_1A03E3000, v23, OS_LOG_TYPE_ERROR, "ILL %p: Received invalid QueueSyncAction %{public}@", (uint8_t *)&v24, 0x16u);
  }

  v9 = 0;
LABEL_15:
  v7[2](v7);

}

- (void)_didReceiveReactionAction:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  id *v8;
  id *v9;
  ICLiveLinkReactionEvent *v10;
  id v11;
  id v12;
  id v13;
  ICLiveLinkReactionEvent *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  int v19;
  ICLiveLink *v20;
  __int16 v21;
  id *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (v6 && (v8 = (id *)*((id *)v6 + 14)) != 0)
  {
    v9 = v8;
    if (*((_BYTE *)v6 + 144))
    {
      v10 = [ICLiveLinkReactionEvent alloc];
      v11 = v9[2];
      v12 = v9[3];
      v13 = v9[1];
      v14 = -[ICLiveLinkReactionEvent initWithReaction:reactionIdentifier:itemIdentifier:](v10, "initWithReaction:reactionIdentifier:itemIdentifier:", v11, v12, v13);

      -[ICLiveLink _participantForAction:](self, "_participantForAction:", v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[ICLiveLinkEvent eventWithReactionEvent:participant:](ICLiveLinkEvent, "eventWithReactionEvent:participant:", v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      -[ICLiveLink receivedEvent:](self, "receivedEvent:", v16);
      v7[2](v7);

    }
    else
    {
      v17 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v19 = 134218242;
        v20 = self;
        v21 = 2114;
        v22 = v9;
        _os_log_impl(&dword_1A03E3000, v17, OS_LOG_TYPE_ERROR, "ILL %p: Received ReactionAction with displayNotice=NO %{public}@", (uint8_t *)&v19, 0x16u);
      }

      v7[2](v7);
    }
  }
  else
  {
    v18 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = 134218242;
      v20 = self;
      v21 = 2114;
      v22 = (id *)v6;
      _os_log_impl(&dword_1A03E3000, v18, OS_LOG_TYPE_ERROR, "ILL %p: Received invalid ReactionAction %{public}@", (uint8_t *)&v19, 0x16u);
    }

    v7[2](v7);
    v9 = 0;
  }

}

- (void)_didReceiveRemoveItemAction:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  id *v8;
  id *v9;
  ICLiveLinkQueueEventContentRemoved *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _QWORD v17[4];
  void (**v18)(_QWORD);
  uint8_t buf[4];
  ICLiveLink *v20;
  __int16 v21;
  id *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (v6 && (v8 = (id *)*((id *)v6 + 15)) != 0)
  {
    v9 = v8;
    if (*((_BYTE *)v6 + 144))
    {
      v10 = [ICLiveLinkQueueEventContentRemoved alloc];
      v11 = v9[1];
      v12 = -[ICLiveLinkQueueEventContentRemoved initWithItemIdentifier:](v10, "initWithItemIdentifier:", v11);

      +[ICLiveLinkQueueEvent queueEventWithContentRemoved:](ICLiveLinkQueueEvent, "queueEventWithContentRemoved:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICLiveLink _participantForAction:](self, "_participantForAction:", v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[ICLiveLinkEvent eventWithQueueEvent:participant:](ICLiveLinkEvent, "eventWithQueueEvent:participant:", v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      -[ICLiveLink receivedEvent:](self, "receivedEvent:", v15);
    }
    else
    {
      v12 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        v20 = self;
        v21 = 2114;
        v22 = v9;
        _os_log_impl(&dword_1A03E3000, v12, OS_LOG_TYPE_DEFAULT, "ILL %p: Received RemoveItemAction with displayNotice=NO %{public}@", buf, 0x16u);
      }
    }

    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __53__ICLiveLink__didReceiveRemoveItemAction_completion___block_invoke;
    v17[3] = &unk_1E438E500;
    v18 = v7;
    -[ICLiveLink _updateQueueWithReason:completion:](self, "_updateQueueWithReason:completion:", CFSTR("ServerAction[RemoveItem]"), v17);

  }
  else
  {
    v16 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      v20 = self;
      v21 = 2114;
      v22 = (id *)v6;
      _os_log_impl(&dword_1A03E3000, v16, OS_LOG_TYPE_ERROR, "ILL %p: Received invalid RemoveItemAction %{public}@", buf, 0x16u);
    }

    v7[2](v7);
    v9 = 0;
  }

}

- (void)_didReceiveReplaceQueueItemsAction:(id)a3 completion:(id)a4
{
  id *v6;
  void (**v7)(_QWORD);
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  ICLiveLink *v14;
  id *v15;
  void (**v16)(_QWORD);
  uint8_t buf[4];
  ICLiveLink *v18;
  __int16 v19;
  id *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = (id *)a3;
  v7 = (void (**)(_QWORD))a4;
  if (v6 && (v8 = v6[16]) != 0)
  {
    v9 = v8;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __60__ICLiveLink__didReceiveReplaceQueueItemsAction_completion___block_invoke;
    v12[3] = &unk_1E438EF60;
    v16 = v7;
    v10 = v9;
    v13 = v10;
    v14 = self;
    v15 = v6;
    -[ICLiveLink _updateQueueWithReason:completion:](self, "_updateQueueWithReason:completion:", CFSTR("ServerAction[ReplaceQueueItems]"), v12);

  }
  else
  {
    v11 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      v18 = self;
      v19 = 2114;
      v20 = v6;
      _os_log_impl(&dword_1A03E3000, v11, OS_LOG_TYPE_ERROR, "ILL %p: Received invalid ReplaceQueueItemsAction %{public}@", buf, 0x16u);
    }

    v7[2](v7);
    v10 = 0;
  }

}

- (void)_didReceiveServerNoticeAction:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  id *v8;
  id *v9;
  ICLiveLinkCustomEvent *v10;
  id v11;
  ICLiveLinkCustomEvent *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  int v17;
  ICLiveLink *v18;
  __int16 v19;
  id *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (v6 && (v8 = (id *)*((id *)v6 + 17)) != 0)
  {
    v9 = v8;
    if (*((_BYTE *)v6 + 144))
    {
      v10 = [ICLiveLinkCustomEvent alloc];
      v11 = v9[1];
      v12 = -[ICLiveLinkCustomEvent initWithLocalizedMessage:](v10, "initWithLocalizedMessage:", v11);

      -[ICLiveLink _participantForAction:](self, "_participantForAction:", v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[ICLiveLinkEvent eventWithCustomEvent:participant:](ICLiveLinkEvent, "eventWithCustomEvent:participant:", v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      -[ICLiveLink receivedEvent:](self, "receivedEvent:", v14);
      v7[2](v7);

    }
    else
    {
      v15 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v17 = 134218242;
        v18 = self;
        v19 = 2114;
        v20 = v9;
        _os_log_impl(&dword_1A03E3000, v15, OS_LOG_TYPE_ERROR, "ILL %p: Received ServerNoticeAction with displayNotice=NO %{public}@", (uint8_t *)&v17, 0x16u);
      }

      v7[2](v7);
    }
  }
  else
  {
    v16 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = 134218242;
      v18 = self;
      v19 = 2114;
      v20 = (id *)v6;
      _os_log_impl(&dword_1A03E3000, v16, OS_LOG_TYPE_ERROR, "ILL %p: Received invalid ServerNoticeAction %{public}@", (uint8_t *)&v17, 0x16u);
    }

    v7[2](v7);
    v9 = 0;
  }

}

- (void)_emitSessionEventIfNeededForAction:(id)a3 disconnectedParticipant:(id)a4
{
  id v6;
  id v7;
  int64_t localParticipantServerID;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  ICLiveLinkSessionEvent *v12;
  unsigned int *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  int64_t v18;
  int v19;
  ICLiveLink *v20;
  __int16 v21;
  int64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6 || !*((_BYTE *)v6 + 144))
  {
    v10 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_22;
    if (v6)
      v11 = (void *)*((_QWORD *)v6 + 10);
    else
      v11 = 0;
    v12 = v11;
    v19 = 134218242;
    v20 = self;
    v21 = 2114;
    v22 = (int64_t)v12;
    _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_DEFAULT, "ILL %p: Received ParticipantChangeAction with displayNotice=NO %{public}@", (uint8_t *)&v19, 0x16u);
LABEL_16:

    goto LABEL_22;
  }
  os_unfair_lock_lock(&self->_lock);
  localParticipantServerID = self->_localParticipantServerID;
  v9 = *((_QWORD *)v6 + 1);
  os_unfair_lock_unlock(&self->_lock);
  if (v9 == localParticipantServerID)
  {
    v10 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 134218240;
      v20 = self;
      v21 = 2048;
      v22 = localParticipantServerID;
      _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_DEFAULT, "ILL %p: Received ParticipantChangeAction for the local participant: %lld", (uint8_t *)&v19, 0x16u);
    }
    goto LABEL_22;
  }
  v13 = (unsigned int *)*((id *)v6 + 10);
  if (v13 && (v13[7] & 2) != 0)
  {
    v14 = v13[6];
    switch((int)v14)
    {
      case 1:
        break;
      case 2:
        v14 = 4;
        goto LABEL_13;
      case 3:
        v14 = 2;
        break;
      case 4:
        v14 = 3;
        goto LABEL_13;
      case 5:
        v14 = 5;
        goto LABEL_13;
      default:
        goto LABEL_12;
    }

    -[ICLiveLink _participantForAction:](self, "_participantForAction:", v6);
    v15 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_12:
    v14 = 0;
LABEL_13:

    v15 = v7;
  }
  v10 = v15;
  if (v15)
  {
    v12 = -[ICLiveLinkSessionEvent initWithKind:]([ICLiveLinkSessionEvent alloc], "initWithKind:", v14);
    +[ICLiveLinkEvent eventWithSessionEvent:participant:](ICLiveLinkEvent, "eventWithSessionEvent:participant:", v12, v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICLiveLink receivedEvent:](self, "receivedEvent:", v16);

    goto LABEL_16;
  }
  v17 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    v18 = *((_QWORD *)v6 + 1);
    v19 = 134218240;
    v20 = self;
    v21 = 2048;
    v22 = v18;
    _os_log_impl(&dword_1A03E3000, v17, OS_LOG_TYPE_ERROR, "ILL %p: Received Participant Join/Connect for unknown participant ID = %ld", (uint8_t *)&v19, 0x16u);
  }

  v10 = 0;
LABEL_22:

}

- (void)_handleReceivedMessage:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  Class isa;
  objc_class *v7;
  NSMutableDictionary *pendingRequests;
  Class v9;
  objc_class *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  NSMutableDictionary *v12;
  Class v13;
  objc_class *v14;
  NSObject *v15;
  NSObject *v16;
  int v17;
  ICLiveLink *v18;
  __int16 v19;
  NSObject *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
    isa = v4[5].isa;
  else
    isa = 0;
  v7 = isa;

  if (!v7)
    goto LABEL_11;
  os_unfair_lock_lock(&self->_lock);
  pendingRequests = self->_pendingRequests;
  v9 = v5 ? v5[5].isa : 0;
  v10 = v9;
  -[NSMutableDictionary objectForKeyedSubscript:](pendingRequests, "objectForKeyedSubscript:", v10);
  v11 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  v12 = self->_pendingRequests;
  v13 = v5 ? v5[5].isa : 0;
  v14 = v13;
  -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", 0, v14);

  os_unfair_lock_unlock(&self->_lock);
  if (v11)
  {
    ((void (**)(_QWORD, NSObject *, _QWORD))v11)[2](v11, v5, 0);

  }
  else
  {
LABEL_11:
    if (v5 && (BYTE4(v5[6].isa) & 1) != 0)
    {
      switch(LODWORD(v5[6].isa))
      {
        case 0:
        case 1:
        case 4:
          goto LABEL_13;
        case 2:
          v15 = v5[1].isa;
          v16 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            v17 = 134218242;
            v18 = self;
            v19 = 2114;
            v20 = v15;
            _os_log_impl(&dword_1A03E3000, v16, OS_LOG_TYPE_DEBUG, "ILL %p: _handleReceivedMessage enqueuing action: %{public}@", (uint8_t *)&v17, 0x16u);
          }

          os_unfair_lock_lock(&self->_lock);
          -[NSMutableArray addObject:](self->_pendingActions, "addObject:", v15);
          os_unfair_lock_unlock(&self->_lock);
          -[ICLiveLink _processPendingActions](self, "_processPendingActions");
          goto LABEL_15;
        case 3:
          v15 = v5[3].isa;
          -[ICLiveLink _didReceivePluginErrorMessage:](self, "_didReceivePluginErrorMessage:", v15);
          goto LABEL_15;
        default:
          break;
      }
    }
    else
    {
LABEL_13:
      v15 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v17 = 134218242;
        v18 = self;
        v19 = 2114;
        v20 = v5;
        _os_log_impl(&dword_1A03E3000, v15, OS_LOG_TYPE_ERROR, "ILL %p: Received unhandled message %{public}@", (uint8_t *)&v17, 0x16u);
      }
LABEL_15:

    }
  }

}

- (void)_handleUpdatedParticipantQuery:(id)a3
{
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD block[4];
  id v14;
  ICLiveLink *v15;
  id v16;
  _QWORD v17[6];
  uint8_t buf[4];
  ICLiveLink *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (a3)
    v5 = (void *)*((_QWORD *)a3 + 1);
  else
    v5 = 0;
  v6 = v5;
  v7 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __45__ICLiveLink__handleUpdatedParticipantQuery___block_invoke;
  v17[3] = &unk_1E438BA08;
  v17[4] = self;
  v17[5] = a2;
  objc_msgSend(v6, "msv_map:", v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_lock(&self->_lock);
  if (self->_localParticipantServerID)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", self->_participants);
    v9 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_participants, v8);
    os_unfair_lock_unlock(&self->_lock);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((-[NSObject isEqual:](v9, "isEqual:", v10) & 1) == 0)
    {
      -[ICLiveLink delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[ICLiveLink delegateQueue](self, "delegateQueue");
        v12 = objc_claimAutoreleasedReturnValue();
        block[0] = v7;
        block[1] = 3221225472;
        block[2] = __45__ICLiveLink__handleUpdatedParticipantQuery___block_invoke_3;
        block[3] = &unk_1E4391230;
        v14 = v11;
        v15 = self;
        v16 = v8;
        dispatch_async(v12, block);

      }
    }

  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
    v9 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v19 = self;
      v20 = 2114;
      v21 = v8;
      _os_log_impl(&dword_1A03E3000, v9, OS_LOG_TYPE_DEFAULT, "ILL %p: Dropping participants [waiting for clientInfo] %{public}@", buf, 0x16u);
    }
  }

}

- (void)_handleUpdatedQueue:(id)a3 playbackControlSettings:(id)a4 serverQueueContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  ICSharedListeningQueue *v11;
  int64_t v12;
  uint64_t v13;
  _BOOL4 v14;
  _BOOL4 v15;
  int v16;
  int v17;
  int v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  _QWORD block[4];
  NSObject *v23;
  ICLiveLink *v24;
  ICSharedListeningQueue *v25;
  uint8_t buf[4];
  ICLiveLink *v27;
  __int16 v28;
  int64_t v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  int v33;
  __int16 v34;
  int v35;
  __int16 v36;
  _BOOL4 v37;
  __int16 v38;
  _BOOL4 v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[ICSharedListeningQueue initWithProtobuf:serverQueueContext:liveLink:playbackControlSettings:]([ICSharedListeningQueue alloc], "initWithProtobuf:serverQueueContext:liveLink:playbackControlSettings:", v10, v8, self, v9);

  os_unfair_lock_lock(&self->_lock);
  v12 = -[ICSharedListeningQueue serverRevision](self->_queue, "serverRevision");
  v13 = -[ICSharedListeningQueue serverRevision](v11, "serverRevision");
  v14 = -[ICSharedListeningQueue isAutoPlayEnabled](self->_queue, "isAutoPlayEnabled");
  v15 = -[ICSharedListeningQueue isAutoPlayEnabled](v11, "isAutoPlayEnabled");
  v16 = -[ICSharedListeningQueue isAutoPlayAvailable](self->_queue, "isAutoPlayAvailable");
  v17 = -[ICSharedListeningQueue isAutoPlayAvailable](v11, "isAutoPlayAvailable");
  v18 = v17;
  if (v13 > v12 || ((v14 ^ v15) & 1) != 0 || v16 != v17)
  {
    objc_storeStrong((id *)&self->_queue, v11);
    os_unfair_lock_unlock(&self->_lock);
    v20 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134219520;
      v27 = self;
      v28 = 2048;
      v29 = v12;
      v30 = 2048;
      v31 = v13;
      v32 = 1024;
      v33 = v16;
      v34 = 1024;
      v35 = v18;
      v36 = 1024;
      v37 = v14;
      v38 = 1024;
      v39 = v15;
      _os_log_impl(&dword_1A03E3000, v20, OS_LOG_TYPE_DEFAULT, "ILL %p: _handleUpdatedQueue [serverRevision:(%ld --> %ld), isAutoPlayAvailable:(%{BOOL}u --> %{BOOL}u), isAutoPlayEnabled:(%{BOOL}u --> %{BOOL}u)]", buf, 0x38u);
    }

    -[ICLiveLink delegate](self, "delegate");
    v19 = objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[ICLiveLink delegateQueue](self, "delegateQueue");
      v21 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __77__ICLiveLink__handleUpdatedQueue_playbackControlSettings_serverQueueContext___block_invoke;
      block[3] = &unk_1E4391230;
      v19 = v19;
      v23 = v19;
      v24 = self;
      v25 = v11;
      dispatch_async(v21, block);

    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
    v19 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      v27 = self;
      v28 = 2048;
      v29 = v12;
      v30 = 2048;
      v31 = v13;
      _os_log_impl(&dword_1A03E3000, v19, OS_LOG_TYPE_DEFAULT, "ILL %p: _handleUpdatedQueue dropping queue update [client already has newer revision] currentRevision=%ld updatedRevision=%ld", buf, 0x20u);
    }
  }

}

- (id)_participantForAction:(id)a3
{
  if (a3)
    a3 = (id)*((_QWORD *)a3 + 1);
  return -[ICLiveLink _participantForParticipantID:](self, "_participantForParticipantID:", a3);
}

- (id)_participantForParticipantID:(int64_t)a3
{
  os_unfair_lock_s *p_lock;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = self->_participants;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v12, "serverID", (_QWORD)v15) == a3)
        {
          v13 = objc_msgSend(v12, "copy");

          v9 = (void *)v13;
        }
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  os_unfair_lock_unlock(p_lock);
  return v9;
}

- (void)_processPendingActions
{
  os_unfair_lock_s *p_lock;
  uint64_t v5;
  char v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void (**v14)(_QWORD);
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  ICLiveLink *v20;
  id v21;
  SEL v22;
  _QWORD v23[5];
  id v24;
  SEL v25;
  uint8_t buf[4];
  ICLiveLink *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v5 = -[NSMutableArray count](self->_pendingActions, "count");
  if (v5 < 1 || self->_processingAction)
  {
    v6 = 0;
  }
  else
  {
    v6 = 1;
    self->_processingAction = 1;
  }
  -[NSMutableArray firstObject](self->_pendingActions, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  if ((v6 & 1) != 0)
  {
    v8 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      v27 = self;
      v28 = 2048;
      v29 = v7;
      _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_DEBUG, "ILL %p: _processPendingActions: [processing action] action=%p", buf, 0x16u);
    }

    v9 = objc_alloc(MEMORY[0x1E0D4D048]);
    v10 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __36__ICLiveLink__processPendingActions__block_invoke;
    v23[3] = &unk_1E438C1C8;
    v25 = a2;
    v23[4] = self;
    v11 = v7;
    v24 = v11;
    v18[0] = v10;
    v18[1] = 3221225472;
    v18[2] = __36__ICLiveLink__processPendingActions__block_invoke_2;
    v18[3] = &unk_1E438BA30;
    v19 = (id)objc_msgSend(v9, "initWithDeallocHandler:", v23);
    v20 = self;
    v12 = v11;
    v21 = v12;
    v22 = a2;
    v13 = v19;
    v14 = (void (**)(_QWORD))MEMORY[0x1A1AFA8D0](v18);
    if (v12 && (*((_BYTE *)v12 + 148) & 2) != 0)
    {
      switch(*((_DWORD *)v12 + 4))
      {
        case 0:
          break;
        case 1:
          -[ICLiveLink _didReceivePlaybackSyncAction:completion:](self, "_didReceivePlaybackSyncAction:completion:", v12, v14);
          goto LABEL_14;
        case 2:
          -[ICLiveLink _didReceiveAddItemsAction:completion:](self, "_didReceiveAddItemsAction:completion:", v12, v14);
          goto LABEL_14;
        case 3:
          -[ICLiveLink _didReceiveRemoveItemAction:completion:](self, "_didReceiveRemoveItemAction:completion:", v12, v14);
          goto LABEL_14;
        case 4:
          -[ICLiveLink _didReceiveMoveItemAction:completion:](self, "_didReceiveMoveItemAction:completion:", v12, v14);
          goto LABEL_14;
        case 5:
          -[ICLiveLink _didReceiveCurrentItemChangeAction:completion:](self, "_didReceiveCurrentItemChangeAction:completion:", v12, v14);
          goto LABEL_14;
        case 6:
          -[ICLiveLink _didReceiveReactionAction:completion:](self, "_didReceiveReactionAction:completion:", v12, v14);
          goto LABEL_14;
        case 7:
          -[ICLiveLink _didReceiveParticipantChangeAction:completion:](self, "_didReceiveParticipantChangeAction:completion:", v12, v14);
          goto LABEL_14;
        case 8:
          -[ICLiveLink _didReceiveServerNoticeAction:completion:](self, "_didReceiveServerNoticeAction:completion:", v12, v14);
          goto LABEL_14;
        case 9:
          v15 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
          if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            goto LABEL_13;
          *(_DWORD *)buf = 134218242;
          v27 = self;
          v28 = 2114;
          v29 = v12;
          v16 = "ILL %p: Received ClientInfo action with no matching completion %{public}@";
          goto LABEL_12;
        case 0xA:
          -[ICLiveLink _didReceiveReplaceQueueItemsAction:completion:](self, "_didReceiveReplaceQueueItemsAction:completion:", v12, v14);
          goto LABEL_14;
        case 0xB:
          -[ICLiveLink _didReceivePlayNowQueueItemsAction:completion:](self, "_didReceivePlayNowQueueItemsAction:completion:", v12, v14);
          goto LABEL_14;
        case 0xC:
          -[ICLiveLink _didReceiveCurrentItemTransitionAction:completion:](self, "_didReceiveCurrentItemTransitionAction:completion:", v12, v14);
          goto LABEL_14;
        case 0xD:
          -[ICLiveLink _didReceiveQueueSyncAction:completion:](self, "_didReceiveQueueSyncAction:completion:", v12, v14);
          goto LABEL_14;
        default:
          v15 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
          if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            goto LABEL_13;
          *(_DWORD *)buf = 134218242;
          v27 = self;
          v28 = 2114;
          v29 = v12;
          v16 = "ILL %p: Received unknown action %{public}@";
          goto LABEL_12;
      }
    }
    v15 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      v27 = self;
      v28 = 2114;
      v29 = v12;
      v16 = "ILL %p: Received invalid action %{public}@";
LABEL_12:
      _os_log_impl(&dword_1A03E3000, v15, OS_LOG_TYPE_ERROR, v16, buf, 0x16u);
    }
LABEL_13:

    v14[2](v14);
LABEL_14:

  }
  else if (v7)
  {
    v17 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218496;
      v27 = self;
      v28 = 2048;
      v29 = v7;
      v30 = 2048;
      v31 = v5;
      _os_log_impl(&dword_1A03E3000, v17, OS_LOG_TYPE_DEBUG, "ILL %p: _processPendingActions: [action already in flight] action=%p pendingActionCount=%ld", buf, 0x20u);
    }

  }
}

- (void)_storeTraceID:(id)a3 completion:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v7 = a4;
  if (v13)
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICLiveLink.m"), 1337, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("traceID"));

    if (v7)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICLiveLink.m"), 1338, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

LABEL_3:
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_pendingRequests, "objectForKeyedSubscript:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICLiveLink.m"), 1340, CFSTR("Attempted to overwrite completion handler for traceID %@"), v13);

  }
  v9 = (void *)MEMORY[0x1A1AFA8D0](v7);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pendingRequests, "setObject:forKeyedSubscript:", v9, v13);

  os_unfair_lock_unlock(&self->_lock);
}

- (void)_updateParticipantsWithReason:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id *v9;
  void *v10;
  _BYTE *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  ICLiveLink *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_opt_new();
  v9 = (id *)v8;
  if (v8)
  {
    *(_BYTE *)(v8 + 52) |= 1u;
    *(_DWORD *)(v8 + 48) = 4;
    v10 = (void *)objc_opt_new();
    -[_ICLLProtocolMessage setQuery:]((uint64_t)v9, v10);

    v11 = v9[4];
    if (v11)
    {
      v11[48] |= 1u;
      *((_DWORD *)v11 + 8) = 4;
    }
  }
  else
  {
    v22 = (void *)objc_opt_new();
    -[_ICLLProtocolMessage setQuery:](0, v22);

    v11 = 0;
  }

  v12 = (void *)objc_opt_new();
  if (v9)
    v13 = v9[4];
  else
    v13 = 0;
  v14 = v13;
  v15 = v12;
  if (v14)
  {
    -[_ICLLQueryMessage clearOneofValuesForQuery]((uint64_t)v14);
    *((_BYTE *)v14 + 48) |= 1u;
    *((_DWORD *)v14 + 8) = 4;
    objc_storeStrong((id *)v14 + 1, v12);
  }

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "UUIDString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[_ICLLProtocolMessage setTraceId:]((uint64_t)v9, v17);
  v18 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v28 = self;
    v29 = 2114;
    v30 = v6;
    v31 = 2114;
    v32 = v17;
    _os_log_impl(&dword_1A03E3000, v18, OS_LOG_TYPE_DEFAULT, "ILL %p: _updateParticipantsWithReason [requesting] reason=%{public}@ traceID=%{public}@", buf, 0x20u);
  }

  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __55__ICLiveLink__updateParticipantsWithReason_completion___block_invoke;
  v23[3] = &unk_1E438BB98;
  v23[4] = self;
  v24 = v6;
  v25 = v17;
  v26 = v7;
  v19 = v17;
  v20 = v6;
  v21 = v7;
  -[ICLiveLink sendMessage:completion:](self, "sendMessage:completion:", v9, v23);

}

- (void)_updateQueueWithReason:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id *v9;
  void *v10;
  _BYTE *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  ICLiveLink *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_opt_new();
  v9 = (id *)v8;
  if (v8)
  {
    *(_BYTE *)(v8 + 52) |= 1u;
    *(_DWORD *)(v8 + 48) = 4;
    v10 = (void *)objc_opt_new();
    -[_ICLLProtocolMessage setQuery:]((uint64_t)v9, v10);

    v11 = v9[4];
    if (v11)
    {
      v11[48] |= 1u;
      *((_DWORD *)v11 + 8) = 1;
    }
  }
  else
  {
    v22 = (void *)objc_opt_new();
    -[_ICLLProtocolMessage setQuery:](0, v22);

    v11 = 0;
  }

  v12 = (void *)objc_opt_new();
  if (v9)
    v13 = v9[4];
  else
    v13 = 0;
  v14 = v13;
  v15 = v12;
  if (v14)
  {
    -[_ICLLQueryMessage clearOneofValuesForQuery]((uint64_t)v14);
    *((_BYTE *)v14 + 48) |= 1u;
    *((_DWORD *)v14 + 8) = 1;
    objc_storeStrong((id *)v14 + 5, v12);
  }

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "UUIDString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[_ICLLProtocolMessage setTraceId:]((uint64_t)v9, v17);
  v18 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v28 = self;
    v29 = 2114;
    v30 = v6;
    v31 = 2114;
    v32 = v17;
    _os_log_impl(&dword_1A03E3000, v18, OS_LOG_TYPE_DEFAULT, "ILL %p: _updateQueueWithReason [requesting] reason=%{public}@ traceID=%{public}@", buf, 0x20u);
  }

  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __48__ICLiveLink__updateQueueWithReason_completion___block_invoke;
  v23[3] = &unk_1E438BB98;
  v23[4] = self;
  v24 = v6;
  v25 = v17;
  v26 = v7;
  v19 = v17;
  v20 = v6;
  v21 = v7;
  -[ICLiveLink sendMessage:completion:](self, "sendMessage:completion:", v9, v23);

}

- (void)_updatePlaybackControlSettingsWithReason:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id *v9;
  void *v10;
  _BYTE *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  ICLiveLink *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_opt_new();
  v9 = (id *)v8;
  if (v8)
  {
    *(_BYTE *)(v8 + 52) |= 1u;
    *(_DWORD *)(v8 + 48) = 4;
    v10 = (void *)objc_opt_new();
    -[_ICLLProtocolMessage setQuery:]((uint64_t)v9, v10);

    v11 = v9[4];
    if (v11)
    {
      v11[48] |= 1u;
      *((_DWORD *)v11 + 8) = 3;
    }
  }
  else
  {
    v22 = (void *)objc_opt_new();
    -[_ICLLProtocolMessage setQuery:](0, v22);

    v11 = 0;
  }

  v12 = (void *)objc_opt_new();
  if (v9)
    v13 = v9[4];
  else
    v13 = 0;
  v14 = v13;
  v15 = v12;
  if (v14)
  {
    -[_ICLLQueryMessage clearOneofValuesForQuery]((uint64_t)v14);
    *((_BYTE *)v14 + 48) |= 1u;
    *((_DWORD *)v14 + 8) = 3;
    objc_storeStrong((id *)v14 + 2, v12);
  }

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "UUIDString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[_ICLLProtocolMessage setTraceId:]((uint64_t)v9, v17);
  v18 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v28 = self;
    v29 = 2114;
    v30 = v6;
    v31 = 2114;
    v32 = v17;
    _os_log_impl(&dword_1A03E3000, v18, OS_LOG_TYPE_DEFAULT, "ILL %p: _updatePlaybackControlSettingsWithReason [requesting] reason=%{public}@ traceID=%{public}@", buf, 0x20u);
  }

  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __66__ICLiveLink__updatePlaybackControlSettingsWithReason_completion___block_invoke;
  v23[3] = &unk_1E438BB98;
  v23[4] = self;
  v24 = v6;
  v25 = v17;
  v26 = v7;
  v19 = v17;
  v20 = v6;
  v21 = v7;
  -[ICLiveLink sendMessage:completion:](self, "sendMessage:completion:", v9, v23);

}

- (void)_performClientInfoExchangeAndInitializeQueue
{
  uint64_t v3;
  id *v4;
  void *v5;
  _BYTE *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  _QWORD v26[5];

  v3 = objc_opt_new();
  v4 = (id *)v3;
  if (v3)
  {
    *(_BYTE *)(v3 + 52) |= 1u;
    *(_DWORD *)(v3 + 48) = 1;
    v5 = (void *)objc_opt_new();
    -[_ICLLProtocolMessage setCommand:]((uint64_t)v4, v5);

    v6 = v4[2];
    if (v6)
    {
      v6[104] |= 1u;
      *((_DWORD *)v6 + 6) = 8;
    }
  }
  else
  {
    v23 = (void *)objc_opt_new();
    -[_ICLLProtocolMessage setCommand:](0, v23);

    v6 = 0;
  }

  v7 = (void *)objc_opt_new();
  if (v4)
    v8 = v4[2];
  else
    v8 = 0;
  v9 = v8;
  -[_ICLLCommandMessage setClientInfo:]((uint64_t)v9, v7);

  -[ICLiveLink connectionController](self, "connectionController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sessionToken");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v12 = v4[2];
    v13 = v12;
    if (v12)
    {
      v14 = (void *)*((_QWORD *)v12 + 2);
      goto LABEL_9;
    }
  }
  else
  {
    v13 = 0;
  }
  v14 = 0;
LABEL_9:
  v15 = v14;
  -[_ICLLClientInfoCommand setSharedSessionToken:]((uint64_t)v15, v11);

  -[ICLiveLink identity](self, "identity");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "externalIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v19 = 0;
    goto LABEL_18;
  }
  v18 = v4[2];
  v19 = v18;
  if (!v18)
  {
LABEL_18:
    v20 = 0;
    goto LABEL_12;
  }
  v20 = (void *)*((_QWORD *)v18 + 2);
LABEL_12:
  v21 = v20;
  -[_ICLLClientInfoCommand setExternalId:]((uint64_t)v21, v17);

  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __58__ICLiveLink__performClientInfoExchangeAndInitializeQueue__block_invoke;
  v26[3] = &unk_1E43902A0;
  v26[4] = self;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __58__ICLiveLink__performClientInfoExchangeAndInitializeQueue__block_invoke_3;
  v24[3] = &unk_1E438BA80;
  v24[4] = self;
  v25 = (id)MEMORY[0x1A1AFA8D0](v26);
  v22 = v25;
  -[ICLiveLink sendMessage:completion:](self, "sendMessage:completion:", v4, v24);

}

- (void)connectionControllerConnectionDidStart:(id)a3
{
  os_unfair_lock_s *p_lock;
  _BOOL4 started;
  uint64_t v6;
  void *v7;
  void *v8;
  NSString *v9;
  NSString *identifier;
  id WeakRetained;
  NSObject *v12;
  NSObject *v13;
  id *v14;
  uint64_t *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  id v21;
  ICLiveLink *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t);
  void *v26;
  id v27;
  ICLiveLink *v28;
  uint8_t buf[4];
  ICLiveLink *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  started = self->_started;
  v6 = -[ICLiveLink currentRetryCount](self, "currentRetryCount");
  -[ICLiveLink setReceivedDisconnectionNotice:](self, "setReceivedDisconnectionNotice:", 0);
  -[ICLiveLink setStarted:](self, "setStarted:", 1);
  -[ICLiveLink setStarting:](self, "setStarting:", 0);
  -[ICLiveLink deferredReconnectReason](self, "deferredReconnectReason");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICLiveLink setForcedReconnectReason:](self, "setForcedReconnectReason:", 0);
  -[ICLiveLink setDeferredReconnectReason:](self, "setDeferredReconnectReason:", 0);
  -[ICLiveLink connectionController](self, "connectionController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sessionIdentifier");
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  self->_identifier = v9;

  os_unfair_lock_unlock(p_lock);
  if (!v7)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (started || (objc_opt_respondsToSelector() & 1) == 0)
    {
      if (v6 < 1 || (objc_opt_respondsToSelector() & 1) == 0)
        goto LABEL_14;
      v16 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v30 = self;
        _os_log_impl(&dword_1A03E3000, v16, OS_LOG_TYPE_DEFAULT, "ILL %p: calling delegate liveLinkDidReconnect", buf, 0xCu);
      }

      -[ICLiveLink delegateQueue](self, "delegateQueue");
      v13 = objc_claimAutoreleasedReturnValue();
      v17 = MEMORY[0x1E0C809B0];
      v18 = 3221225472;
      v19 = __53__ICLiveLink_connectionControllerConnectionDidStart___block_invoke_159;
      v20 = &unk_1E4391110;
      v14 = &v21;
      v21 = WeakRetained;
      v22 = self;
      v15 = &v17;
    }
    else
    {
      v12 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v30 = self;
        _os_log_impl(&dword_1A03E3000, v12, OS_LOG_TYPE_DEFAULT, "ILL %p: calling delegate didStartLiveLink", buf, 0xCu);
      }

      -[ICLiveLink delegateQueue](self, "delegateQueue");
      v13 = objc_claimAutoreleasedReturnValue();
      v23 = MEMORY[0x1E0C809B0];
      v24 = 3221225472;
      v25 = __53__ICLiveLink_connectionControllerConnectionDidStart___block_invoke;
      v26 = &unk_1E4391110;
      v14 = &v27;
      v27 = WeakRetained;
      v28 = self;
      v15 = &v23;
    }
    dispatch_async(v13, v15);

LABEL_14:
    -[ICLiveLink _performClientInfoExchangeAndInitializeQueue](self, "_performClientInfoExchangeAndInitializeQueue", v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28);

    goto LABEL_15;
  }
  -[ICLiveLink reconnectWithReason:options:](self, "reconnectWithReason:options:", v7, 0);
LABEL_15:

}

- (void)connectionController:(id)a3 didEncounterFatalError:(id)a4
{
  id v5;
  NSObject *v6;
  id WeakRetained;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  ICLiveLink *v11;
  id v12;
  uint8_t buf[4];
  ICLiveLink *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218242;
    v14 = self;
    v15 = 2114;
    v16 = v5;
    _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_ERROR, "ILL %p: Stopping because connection controller encountered fatal error: %{public}@", buf, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[ICLiveLink delegateQueue](self, "delegateQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__ICLiveLink_connectionController_didEncounterFatalError___block_invoke;
    block[3] = &unk_1E4391230;
    v10 = WeakRetained;
    v11 = self;
    v12 = v5;
    dispatch_async(v8, block);

  }
  -[ICLiveLink stop](self, "stop");

}

- (void)connectionController:(id)a3 connectionDidEndWithError:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v10 = a4;
  os_unfair_lock_lock(&self->_lock);
  -[ICLiveLink forcedReconnectReason](self, "forcedReconnectReason");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)-[NSMutableDictionary copy](self->_pendingRequests, "copy");
  -[NSMutableArray removeAllObjects](self->_pendingActions, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_pendingRequests, "removeAllObjects");
  os_unfair_lock_unlock(&self->_lock);
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("ICLiveLinkErrorDomain"), 8620, v10, CFSTR("Connection ended with error."));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61__ICLiveLink_connectionController_connectionDidEndWithError___block_invoke;
  v11[3] = &unk_1E438BAA8;
  v12 = v7;
  v8 = v7;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v11);
  if (v10)
  {
    -[ICLiveLink _handlePotentiallyRecoverableError:](self, "_handlePotentiallyRecoverableError:");
  }
  else if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("ICLiveLinkErrorDomain"), 100, CFSTR("Requested reconnection because %@."), v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICLiveLink _handlePotentiallyRecoverableError:](self, "_handlePotentiallyRecoverableError:", v9);

  }
  else
  {
    -[ICLiveLink stop](self, "stop");
  }

}

- (void)connectionController:(id)a3 connectionDidReceiveMessage:(id)a4
{
  -[ICLiveLink _handleReceivedMessage:](self, "_handleReceivedMessage:", a4);
}

- (void)_didReceivePluginErrorMessage:(id)a3
{
  _BYTE *v4;
  _DWORD *v5;
  NSObject *v6;
  int v7;
  NSObject *v8;
  unsigned int v9;
  __CFString *v10;
  uint8_t buf[4];
  ICLiveLink *v12;
  __int16 v13;
  __CFString *v14;
  __int16 v15;
  _DWORD *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4 || (v4[24] & 1) == 0)
  {
    v6 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      if (!v5)
        goto LABEL_12;
      goto LABEL_11;
    }
    goto LABEL_18;
  }
  v7 = *((_DWORD *)v4 + 2);
  v8 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
  v6 = v8;
  if (v7 != 10)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
LABEL_11:
      if ((v5[6] & 1) != 0)
      {
        v9 = v5[2];
        if (v9 >= 0x10)
          goto LABEL_15;
        goto LABEL_14;
      }
LABEL_12:
      v9 = 0;
LABEL_14:
      if (((0xEFFFu >> v9) & 1) != 0)
      {
        v10 = off_1E438BD98[v9];
        goto LABEL_17;
      }
LABEL_15:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UnexpectedCode-%ld"), (int)v9);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_17:
      *(_DWORD *)buf = 134218498;
      v12 = self;
      v13 = 2112;
      v14 = v10;
      v15 = 2114;
      v16 = v5;
      _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_ERROR, "ILL %p: Received error code %@, message %{public}@", buf, 0x20u);

    }
LABEL_18:

    goto LABEL_19;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v12 = self;
    _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_DEFAULT, "ILL %p: Server restart. Will retry connection after termination.", buf, 0xCu);
  }

  os_unfair_lock_lock(&self->_lock);
  -[ICLiveLink setReceivedDisconnectionNotice:](self, "setReceivedDisconnectionNotice:", 1);
  os_unfair_lock_unlock(&self->_lock);
LABEL_19:

}

- (void)_handlePotentiallyRecoverableError:(id)a3
{
  id v4;
  _BOOL4 v5;
  uint64_t v6;
  int64_t v7;
  NSObject *v8;
  void *v9;
  char v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  int64_t v14;
  int64_t v15;
  int64_t v16;
  NSObject *v17;
  dispatch_time_t v18;
  _QWORD v19[6];
  _QWORD block[4];
  id v21;
  ICLiveLink *v22;
  id v23;
  BOOL v24;
  uint8_t buf[4];
  ICLiveLink *v26;
  __int16 v27;
  int64_t v28;
  __int16 v29;
  _BOOL4 v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v5 = self->_starting || self->_started;
  v6 = -[ICLiveLink currentRetryCount](self, "currentRetryCount");
  -[ICLiveLink setCurrentRetryCount:](self, "setCurrentRetryCount:", (v6 + 1) % (-[ICLiveLink maxRetries](self, "maxRetries") + 1));
  os_unfair_lock_unlock(&self->_lock);
  if (v5)
  {
    v7 = -[ICLiveLink maxRetries](self, "maxRetries");
    v8 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      v26 = self;
      v27 = 2114;
      v28 = (int64_t)v4;
      v29 = 1024;
      v30 = v6 < v7;
      _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_DEFAULT, "ILL %p: QRConnection encountered error %{public}@, willRetry: %{BOOL}u", buf, 0x1Cu);
    }

    -[ICLiveLink delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();
    v11 = MEMORY[0x1E0C809B0];
    if ((v10 & 1) != 0)
    {
      -[ICLiveLink delegateQueue](self, "delegateQueue");
      v12 = objc_claimAutoreleasedReturnValue();
      block[0] = v11;
      block[1] = 3221225472;
      block[2] = __49__ICLiveLink__handlePotentiallyRecoverableError___block_invoke;
      block[3] = &unk_1E438BAD0;
      v21 = v9;
      v22 = self;
      v23 = v4;
      v24 = v6 < v7;
      dispatch_async(v12, block);

    }
    if (v6 >= v7)
    {
      if (-[ICLiveLink isStarted](self, "isStarted"))
        -[ICLiveLink stop](self, "stop");
    }
    else
    {
      if (v6 >= 1)
        v13 = 1;
      else
        v13 = v6;
      v14 = v13 << v6;
      v15 = -[ICLiveLink maxRetryWaitPeriod](self, "maxRetryWaitPeriod");
      if (v14 >= v15)
        v16 = v15;
      else
        v16 = v14;
      v17 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        v26 = self;
        v27 = 2048;
        v28 = v16;
        _os_log_impl(&dword_1A03E3000, v17, OS_LOG_TYPE_DEFAULT, "ILL %p: QRConnection will retry connection after %ld seconds.", buf, 0x16u);
      }

      v18 = dispatch_time(0, 1000000000 * v16);
      v19[0] = v11;
      v19[1] = 3221225472;
      v19[2] = __49__ICLiveLink__handlePotentiallyRecoverableError___block_invoke_165;
      v19[3] = &unk_1E438E1E8;
      v19[4] = self;
      v19[5] = v6;
      dispatch_after(v18, MEMORY[0x1E0C80D38], v19);
    }

  }
}

- (ICLiveLinkDelegate)delegate
{
  return (ICLiveLinkDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)sessionKey
{
  return self->_sessionKey;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (NSMutableDictionary)pendingRequests
{
  return self->_pendingRequests;
}

- (void)setPendingRequests:(id)a3
{
  objc_storeStrong((id *)&self->_pendingRequests, a3);
}

- (NSMutableArray)pendingActions
{
  return self->_pendingActions;
}

- (void)setPendingActions:(id)a3
{
  objc_storeStrong((id *)&self->_pendingActions, a3);
}

- (BOOL)processingAction
{
  return self->_processingAction;
}

- (void)setProcessingAction:(BOOL)a3
{
  self->_processingAction = a3;
}

- (ICLiveLinkPlaybackCoordinatorMedium)playbackCoordinatorMedium
{
  return self->_playbackCoordinatorMedium;
}

- (void)setPlaybackCoordinatorMedium:(id)a3
{
  objc_storeStrong((id *)&self->_playbackCoordinatorMedium, a3);
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (ICSharedListeningConnectionController)connectionController
{
  return self->_connectionController;
}

- (void)setConnectionController:(id)a3
{
  objc_storeStrong((id *)&self->_connectionController, a3);
}

- (ICLiveLinkIdentity)clientSpecifiedIdentity
{
  return self->_clientSpecifiedIdentity;
}

- (int64_t)localParticipantServerID
{
  return self->_localParticipantServerID;
}

- (BOOL)isStarting
{
  return self->_starting;
}

- (void)setStarting:(BOOL)a3
{
  self->_starting = a3;
}

- (NSString)forcedReconnectReason
{
  return self->_forcedReconnectReason;
}

- (void)setForcedReconnectReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)deferredReconnectReason
{
  return self->_deferredReconnectReason;
}

- (void)setDeferredReconnectReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (BOOL)receivedDisconnectionNotice
{
  return self->_receivedDisconnectionNotice;
}

- (void)setReceivedDisconnectionNotice:(BOOL)a3
{
  self->_receivedDisconnectionNotice = a3;
}

- (int64_t)currentRetryCount
{
  return self->_currentRetryCount;
}

- (void)setCurrentRetryCount:(int64_t)a3
{
  self->_currentRetryCount = a3;
}

- (int64_t)maxRetries
{
  return self->_maxRetries;
}

- (void)setMaxRetries:(int64_t)a3
{
  self->_maxRetries = a3;
}

- (int64_t)maxRetryWaitPeriod
{
  return self->_maxRetryWaitPeriod;
}

- (void)setMaxRetryWaitPeriod:(int64_t)a3
{
  self->_maxRetryWaitPeriod = a3;
}

- (NSString)expectingToJoinStartItemIdentifier
{
  return self->_expectingToJoinStartItemIdentifier;
}

- (void)setExpectingToJoinStartItemIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (BOOL)expectingToJoinAsInitiator
{
  return self->_expectingToJoinAsInitiator;
}

- (void)setExpectingToJoinAsInitiator:(BOOL)a3
{
  self->_expectingToJoinAsInitiator = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expectingToJoinStartItemIdentifier, 0);
  objc_storeStrong((id *)&self->_deferredReconnectReason, 0);
  objc_storeStrong((id *)&self->_forcedReconnectReason, 0);
  objc_storeStrong((id *)&self->_clientSpecifiedIdentity, 0);
  objc_storeStrong((id *)&self->_connectionController, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_playbackCoordinatorMedium, 0);
  objc_storeStrong((id *)&self->_pendingActions, 0);
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_storeStrong((id *)&self->_sessionKey, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_participants, 0);
}

uint64_t __49__ICLiveLink__handlePotentiallyRecoverableError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "liveLink:didEncounterError:willRetry:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
}

void __49__ICLiveLink__handlePotentiallyRecoverableError___block_invoke_165(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40) + 1;
    v6 = 134218496;
    v7 = v3;
    v8 = 2048;
    v9 = v4;
    v10 = 2048;
    v11 = objc_msgSend(v3, "maxRetries");
    _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_DEFAULT, "ILL %p: QRConnection retry attempt %ld (max attempts: %ld)", (uint8_t *)&v6, 0x20u);
  }

  objc_msgSend(*(id *)(a1 + 32), "connectionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "start");

}

uint64_t __61__ICLiveLink_connectionController_connectionDidEndWithError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a3 + 16))(a3, 0, *(_QWORD *)(a1 + 32));
}

uint64_t __58__ICLiveLink_connectionController_didEncounterFatalError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "liveLink:didEncounterError:willRetry:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);
}

uint64_t __53__ICLiveLink_connectionControllerConnectionDidStart___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didStartLiveLink:", *(_QWORD *)(a1 + 40));
}

uint64_t __53__ICLiveLink_connectionControllerConnectionDidStart___block_invoke_159(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "liveLinkDidReconnect:", *(_QWORD *)(a1 + 40));
}

void __58__ICLiveLink__performClientInfoExchangeAndInitializeQueue__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegateQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__ICLiveLink__performClientInfoExchangeAndInitializeQueue__block_invoke_2;
    block[3] = &unk_1E4391230;
    v6 = v4;
    v7 = *(_QWORD *)(a1 + 32);
    v9 = v6;
    v10 = v7;
    v11 = v3;
    dispatch_async(v5, block);

  }
  objc_msgSend(*(id *)(a1 + 32), "stop");

}

void __58__ICLiveLink__performClientInfoExchangeAndInitializeQueue__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id *v5;
  id *v6;
  id *v7;
  id *v8;
  _BYTE *v9;
  int v10;
  BOOL v11;
  id *v12;
  id *v13;
  _QWORD *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  __CFString *v19;
  uint64_t v20;
  void *v21;
  __CFString *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  BOOL v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  __CFString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (a3)
    goto LABEL_25;
  if (v5)
  {
    v7 = (id *)v5[1];
    if (v7)
    {
      v8 = v7;
      v9 = v7[4];
      if (!v9 || (v9[20] & 2) == 0)
        goto LABEL_6;
      v10 = *((_DWORD *)v9 + 4);

      if (v10 != 1)
        goto LABEL_12;
      os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
      v11 = objc_msgSend(*(id *)(a1 + 32), "currentRetryCount") > 0;
      objc_msgSend(*(id *)(a1 + 32), "setCurrentRetryCount:", 0);
      v12 = (id *)v6[1];
      v13 = v12;
      if (v12)
      {
        v14 = v12[4];
        if (v14)
        {
          v15 = v14[1];
LABEL_11:
          *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112) = v15;

          os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
          v24[0] = MEMORY[0x1E0C809B0];
          v24[1] = 3221225472;
          v24[2] = __58__ICLiveLink__performClientInfoExchangeAndInitializeQueue__block_invoke_4;
          v24[3] = &unk_1E438BA58;
          v16 = *(void **)(a1 + 40);
          v25 = *(id *)(a1 + 32);
          v26 = v16;
          v27 = v11;
          objc_msgSend(v25, "_updateParticipantsWithReason:completion:", CFSTR("InitialSync"), v24);

          goto LABEL_25;
        }
      }
      else
      {
        v14 = 0;
      }
      v15 = 0;
      goto LABEL_11;
    }
  }
  v9 = 0;
  v8 = 0;
LABEL_6:

  v10 = 0;
LABEL_12:
  v17 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    v18 = *(_QWORD *)(a1 + 32);
    if (v10)
    {
      if (v10 == 2)
      {
        v19 = CFSTR("INVALID TOKEN");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UnexpectedCode-%ld"), v10);
        v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v19 = CFSTR("UNKNOWN");
    }
    *(_DWORD *)buf = 134218242;
    v29 = v18;
    v30 = 2114;
    v31 = v19;
    _os_log_impl(&dword_1A03E3000, v17, OS_LOG_TYPE_ERROR, "ILL %p: received unexpected status %{public}@ for Client Info. Stopping.", buf, 0x16u);

  }
  v20 = *(_QWORD *)(a1 + 40);
  v21 = (void *)MEMORY[0x1E0CB35C8];
  if (v10)
  {
    if (v10 == 2)
    {
      v22 = CFSTR("INVALID TOKEN");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UnexpectedCode-%ld"), v10);
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v22 = CFSTR("UNKNOWN");
  }
  objc_msgSend(v21, "msv_errorWithDomain:code:debugDescription:", CFSTR("ICLiveLinkErrorDomain"), 4, CFSTR("Unexpected client info status %@"), v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v20 + 16))(v20, v23);

LABEL_25:
}

void __58__ICLiveLink__performClientInfoExchangeAndInitializeQueue__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  char v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqual:", CFSTR("ICLiveLinkErrorDomain")))
    {
      v6 = objc_msgSend(v4, "code");

      if (v6 == 8620)
        goto LABEL_10;
    }
    else
    {

    }
    v8 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134218242;
      v17 = v9;
      v18 = 2114;
      v19 = v4;
      _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_ERROR, "ILL %p: stopping live link [failed to load initial participants] error=%{public}@", buf, 0x16u);
    }

    v10 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("ICLiveLinkErrorDomain"), 3, v4, CFSTR("Failed to load initial participants"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);

  }
  else
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __58__ICLiveLink__performClientInfoExchangeAndInitializeQueue__block_invoke_146;
    v12[3] = &unk_1E438BA58;
    v7 = *(void **)(a1 + 40);
    v13 = *(id *)(a1 + 32);
    v14 = v7;
    v15 = *(_BYTE *)(a1 + 48);
    objc_msgSend(v13, "_updateQueueWithReason:completion:", CFSTR("InitialSync"), v12);

  }
LABEL_10:

}

void __58__ICLiveLink__performClientInfoExchangeAndInitializeQueue__block_invoke_146(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqual:", CFSTR("ICLiveLinkErrorDomain")))
    {
      v6 = objc_msgSend(v4, "code");

      if (v6 == 8620)
        goto LABEL_12;
    }
    else
    {

    }
    v11 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = *(_QWORD *)(a1 + 32);
      v15 = 134218242;
      v16 = v12;
      v17 = 2114;
      v18 = v4;
      _os_log_impl(&dword_1A03E3000, v11, OS_LOG_TYPE_ERROR, "ILL %p: stopping live link [failed to load initial queue] error=%{public}@", (uint8_t *)&v15, 0x16u);
    }

    v13 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("ICLiveLinkErrorDomain"), 2, v4, CFSTR("Failed to load initial queue"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v14);

  }
  else
  {
    v7 = CFSTR("ResyncAfterRetry");
    if (!*(_BYTE *)(a1 + 48))
      v7 = CFSTR("ResyncAfterConnect");
    v8 = *(void **)(a1 + 32);
    v9 = v7;
    objc_msgSend(v8, "playbackCoordinatorMedium");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "synchronizePlaybackStateForReason:", v9);

  }
LABEL_12:

}

uint64_t __58__ICLiveLink__performClientInfoExchangeAndInitializeQueue__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "liveLink:didEncounterError:willRetry:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);
}

void __66__ICLiveLink__updatePlaybackControlSettingsWithReason_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  uint64_t v7;
  id *v8;
  id *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = a1[7];
    if (v7)
      (*(void (**)(uint64_t, _QWORD, id))(v7 + 16))(v7, 0, v6);
    goto LABEL_18;
  }
  if (!v5 || (v8 = (id *)v5[4]) == 0)
  {
    v11 = 0;
    v9 = 0;
    goto LABEL_20;
  }
  v9 = v8;
  v10 = v8[2];
  v11 = v10;
  if (!v10)
  {
LABEL_20:
    v12 = 0;
    goto LABEL_8;
  }
  v12 = (void *)*((_QWORD *)v10 + 1);
LABEL_8:
  v13 = v12;

  v14 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink_Oversize");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = a1[4];
    v16 = a1[5];
    v17 = a1[6];
    v22 = 134218754;
    v23 = v15;
    v24 = 2114;
    v25 = v16;
    v26 = 2114;
    v27 = v17;
    v28 = 2114;
    v29 = v13;
    _os_log_impl(&dword_1A03E3000, v14, OS_LOG_TYPE_DEFAULT, "ILL %p: _updatePlaybackControlSettingsWithReason [received response] reason=%{public}@ traceID=%{public}@ settings=%{public}@", (uint8_t *)&v22, 0x2Au);
  }

  if (v13)
  {
    v18 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("ICLiveLinkErrorDomain"), 2, CFSTR("received no playback control settings in response"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = a1[4];
      v22 = 134217984;
      v23 = v20;
      _os_log_impl(&dword_1A03E3000, v19, OS_LOG_TYPE_ERROR, "ILL %p: received no playback control settings in response", (uint8_t *)&v22, 0xCu);
    }

  }
  v21 = a1[7];
  if (v21)
    (*(void (**)(uint64_t, id, void *))(v21 + 16))(v21, v13, v18);

LABEL_18:
}

void __48__ICLiveLink__updateQueueWithReason_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  void *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id *v21;
  id *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = a1[7];
    if (v7)
      (*(void (**)(uint64_t, id))(v7 + 16))(v7, v6);
    goto LABEL_24;
  }
  if (v5)
  {
    v8 = v5[4];
    v9 = v8;
    if (v8)
    {
      v10 = (void *)*((_QWORD *)v8 + 5);
      goto LABEL_7;
    }
  }
  else
  {
    v9 = 0;
  }
  v10 = 0;
LABEL_7:
  v11 = v10;

  if (v11)
    v12 = (void *)v11[2];
  else
    v12 = 0;
  v13 = v12;
  v14 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink_Oversize");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = a1[4];
    v16 = a1[5];
    v17 = a1[6];
    v30 = 134218754;
    v31 = v15;
    v32 = 2114;
    v33 = v16;
    v34 = 2114;
    v35 = v17;
    v36 = 2114;
    v37 = v13;
    _os_log_impl(&dword_1A03E3000, v14, OS_LOG_TYPE_DEFAULT, "ILL %p: _updateQueueWithReason [received response] reason=%{public}@ traceID=%{public}@ queue=%{public}@", (uint8_t *)&v30, 0x2Au);
  }

  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("ICLiveLinkErrorDomain"), 2, CFSTR("received no queue in response"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v28 = a1[4];
      v30 = 134217984;
      v31 = v28;
      _os_log_impl(&dword_1A03E3000, v20, OS_LOG_TYPE_ERROR, "ILL %p: received no queue in response.", (uint8_t *)&v30, 0xCu);
    }
    goto LABEL_21;
  }
  v18 = (void *)a1[4];
  if (v11)
    v19 = (void *)v11[1];
  else
    v19 = 0;
  v20 = v19;
  if (!v5 || (v21 = (id *)v5[4]) == 0)
  {
    v24 = 0;
    v22 = 0;
    goto LABEL_30;
  }
  v22 = v21;
  v23 = v21[5];
  v24 = v23;
  if (!v23)
  {
LABEL_30:
    v25 = 0;
    goto LABEL_18;
  }
  v25 = (void *)*((_QWORD *)v23 + 3);
LABEL_18:
  v26 = v25;
  objc_msgSend(v18, "_handleUpdatedQueue:playbackControlSettings:serverQueueContext:", v13, v20, v26);

  v27 = 0;
LABEL_21:

  v29 = a1[7];
  if (v29)
    (*(void (**)(uint64_t, void *))(v29 + 16))(v29, v27);

LABEL_24:
}

void __55__ICLiveLink__updateParticipantsWithReason_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = *(_QWORD *)(a1 + 56);
    if (v7)
      (*(void (**)(uint64_t, id))(v7 + 16))(v7, v6);
    goto LABEL_21;
  }
  if (!v5)
  {
    v9 = 0;
    goto LABEL_23;
  }
  v8 = v5[4];
  v9 = v8;
  if (!v8)
  {
LABEL_23:
    v10 = 0;
    goto LABEL_7;
  }
  v10 = (void *)*((_QWORD *)v8 + 1);
LABEL_7:
  v11 = v10;

  v12 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink_Oversize");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v14 = *(_QWORD *)(a1 + 32);
    v13 = *(_QWORD *)(a1 + 40);
    v15 = *(_QWORD *)(a1 + 48);
    if (v11)
      v16 = (void *)v11[1];
    else
      v16 = 0;
    v17 = v16;
    v24 = 134218754;
    v25 = v14;
    v26 = 2114;
    v27 = v13;
    v28 = 2114;
    v29 = v15;
    v30 = 2114;
    v31 = v17;
    _os_log_impl(&dword_1A03E3000, v12, OS_LOG_TYPE_DEFAULT, "ILL %p: _updateParticipantsWithReason [received response] reason=%{public}@ traceID=%{public}@ participants=%{public}@", (uint8_t *)&v24, 0x2Au);

  }
  if (v11)
    v18 = (void *)v11[1];
  else
    v18 = 0;
  v19 = v18;

  if (v19)
  {
    objc_msgSend(*(id *)(a1 + 32), "_handleUpdatedParticipantQuery:", v11);
    v20 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("ICLiveLinkErrorDomain"), 3, CFSTR("received no participants in response"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = *(_QWORD *)(a1 + 32);
      v24 = 134217984;
      v25 = v22;
      _os_log_impl(&dword_1A03E3000, v21, OS_LOG_TYPE_ERROR, "ILL %p: received no participants in response.", (uint8_t *)&v24, 0xCu);
    }

  }
  v23 = *(_QWORD *)(a1 + 56);
  if (v23)
    (*(void (**)(uint64_t, void *))(v23 + 16))(v23, v20);

LABEL_21:
}

void __36__ICLiveLink__processPendingActions__block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __CFString *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = a1[5];
  v4 = a1[6];
  v5 = a1[4];
  v7 = v2;
  if (v3)
  {
    if ((*(_BYTE *)(v3 + 148) & 2) != 0)
    {
      LODWORD(v3) = *(_DWORD *)(v3 + 16);
      if (v3 >= 0xE)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UnknownAction-%ld"), (int)v3);
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v2 = v7;
        goto LABEL_7;
      }
    }
    else
    {
      LODWORD(v3) = 0;
    }
  }
  v6 = off_1E438BD28[v3];
LABEL_7:
  objc_msgSend(v2, "handleFailureInMethod:object:file:lineNumber:description:", v4, v5, CFSTR("ICLiveLink.m"), 1249, CFSTR("LiveLink action completion handler not called: %@"), v6);

}

uint64_t __36__ICLiveLink__processPendingActions__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "disarm");
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 16));
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "firstObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(void **)(a1 + 48) != v2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), CFSTR("ICLiveLink.m"), 1257, CFSTR("Unexpected state (pending actions dequeued while processing) action=%@ firstAction=%@"), *(_QWORD *)(a1 + 48), v2);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "removeObjectAtIndex:", 0);

  }
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 9) = 0;
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "count");
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 16));
  v4 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 134218496;
    v10 = v5;
    v11 = 2048;
    v12 = v6;
    v13 = 2048;
    v14 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEBUG, "ILL %p: _processPendingActions: [completed action] action=%p pendingActionCount=%ld", buf, 0x20u);
  }

  return objc_msgSend(*(id *)(a1 + 40), "_processPendingActions");
}

uint64_t __77__ICLiveLink__handleUpdatedQueue_playbackControlSettings_serverQueueContext___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "liveLink:didUpdateQueue:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

id __45__ICLiveLink__handleUpdatedParticipantQuery___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  ICLiveLinkIdentity *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  __int128 v10;

  v3 = a2;
  v4 = [ICLiveLinkIdentity alloc];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__ICLiveLink__handleUpdatedParticipantQuery___block_invoke_2;
  v8[3] = &unk_1E438B9E0;
  v9 = v3;
  v10 = *(_OWORD *)(a1 + 32);
  v5 = v3;
  v6 = -[ICLiveLinkIdentity _initWithBlock:](v4, "_initWithBlock:", v8);

  return v6;
}

uint64_t __45__ICLiveLink__handleUpdatedParticipantQuery___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "liveLink:didUpdateParticipants:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __45__ICLiveLink__handleUpdatedParticipantQuery___block_invoke_2(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  _QWORD *v6;
  _QWORD *v7;
  void *v8;
  _QWORD *v9;
  _QWORD *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  id v16;

  v16 = a2;
  v3 = a1[4];
  if (v3)
    v4 = *(_QWORD *)(v3 + 8);
  else
    v4 = 0;
  objc_msgSend(v16, "setServerID:", v4);
  v5 = objc_alloc(MEMORY[0x1E0CB3A28]);
  v6 = (_QWORD *)a1[4];
  if (v6)
    v6 = (_QWORD *)v6[3];
  v7 = v6;
  v8 = (void *)objc_msgSend(v5, "initWithUUIDString:", v7);

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = a1[5];
    v12 = a1[6];
    v14 = (_QWORD *)a1[4];
    if (v14)
      v14 = (_QWORD *)v14[3];
    v15 = v14;
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", v12, v13, CFSTR("ICLiveLink.m"), 1143, CFSTR("Received invalid UUID from server: %@"), v15);

  }
  objc_msgSend(v16, "setIdentifier:", v8);
  v9 = (_QWORD *)a1[4];
  if (v9)
    v9 = (_QWORD *)v9[2];
  v10 = v9;
  objc_msgSend(v16, "setExternalIdentifier:", v10);

}

void __60__ICLiveLink__didReceiveReplaceQueueItemsAction_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  ICLiveLinkQueueEventContentReplaced *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (!v3 || (v4 = *(id *)(v3 + 24)) == 0)
    {
      v5 = *(_QWORD **)(a1 + 32);
      if (v5)
        v5 = (_QWORD *)v5[2];
      v6 = v5;
      objc_msgSend(v6, "firstObject");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v7;
      if (v7)
        v9 = *(void **)(v7 + 24);
      else
        v9 = 0;
      v4 = v9;

      v10 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 134218242;
        v25 = v11;
        v26 = 2114;
        v27 = v4;
        _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_DEFAULT, "ILL %p: Received ReplaceQueueItemsAction without preferredPlayItemId, using first itemId: %{public}@", buf, 0x16u);
      }

    }
    objc_msgSend(*(id *)(a1 + 40), "participants");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __60__ICLiveLink__didReceiveReplaceQueueItemsAction_completion___block_invoke_102;
    v22[3] = &unk_1E438B9B8;
    v23 = *(id *)(a1 + 48);
    objc_msgSend(v12, "msv_firstWhere:", v22);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "receivedCurrentItemIdentifier:fromParticipant:", v4, v13);
    v14 = *(_QWORD *)(a1 + 48);
    if (v14 && *(_BYTE *)(v14 + 144))
    {
      v15 = -[ICLiveLinkQueueEventContentReplaced initWithStartItemIdentifier:]([ICLiveLinkQueueEventContentReplaced alloc], "initWithStartItemIdentifier:", v4);
      +[ICLiveLinkQueueEvent queueEventWithContentReplaced:](ICLiveLinkQueueEvent, "queueEventWithContentReplaced:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "_participantForAction:", *(_QWORD *)(a1 + 48));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[ICLiveLinkEvent eventWithQueueEvent:participant:](ICLiveLinkEvent, "eventWithQueueEvent:participant:", v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 40), "receivedEvent:", v18);
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

    }
    else
    {
      v19 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v21 = *(void **)(a1 + 32);
        v20 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 134218242;
        v25 = v20;
        v26 = 2114;
        v27 = v21;
        _os_log_impl(&dword_1A03E3000, v19, OS_LOG_TYPE_DEFAULT, "ILL %p: Received ReplaceQueueItemsAction with displayNotice=NO %{public}@", buf, 0x16u);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }

  }
}

BOOL __60__ICLiveLink__didReceiveReplaceQueueItemsAction_completion___block_invoke_102(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = objc_msgSend(a2, "serverID");
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v4 = *(_QWORD *)(v4 + 8);
  return v3 == v4;
}

uint64_t __53__ICLiveLink__didReceiveRemoveItemAction_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __60__ICLiveLink__didReceivePlayNowQueueItemsAction_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  void *v19;
  ICLiveLinkQueueEventContentPlayedNow *v20;
  ICLiveLinkQueueEventContentPlayedNow *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[7];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[4];
  id v40;
  _BYTE buf[24];
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v4 = *(_QWORD *)(a1 + 32);
    if (!v4 || (v5 = *(id *)(v4 + 24)) == 0)
    {
      v6 = *(_QWORD **)(a1 + 32);
      if (v6)
        v6 = (_QWORD *)v6[1];
      v7 = v6;
      objc_msgSend(v7, "firstObject");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      if (v8)
        v10 = *(void **)(v8 + 24);
      else
        v10 = 0;
      v5 = v10;

      v11 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 134218242;
        *(_QWORD *)&buf[4] = v12;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v5;
        _os_log_impl(&dword_1A03E3000, v11, OS_LOG_TYPE_DEFAULT, "ILL %p: Received PlayNowQueueItemsAction without preferredPlayItemId, using first itemId: %{public}@", buf, 0x16u);
      }

    }
    objc_msgSend(*(id *)(a1 + 40), "participants");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __60__ICLiveLink__didReceivePlayNowQueueItemsAction_completion___block_invoke_92;
    v39[3] = &unk_1E438B9B8;
    v40 = *(id *)(a1 + 48);
    objc_msgSend(v13, "msv_firstWhere:", v39);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "receivedCurrentItemIdentifier:fromParticipant:", v5, v15);
    v16 = *(_QWORD *)(a1 + 48);
    if (v16 && *(_BYTE *)(v16 + 144))
    {
      v35 = 0;
      v36 = &v35;
      v37 = 0x2020000000;
      v38 = 0;
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v42 = __Block_byref_object_copy__11071;
      v43 = __Block_byref_object_dispose__11072;
      v44 = 0;
      v29 = 0;
      v30 = &v29;
      v31 = 0x3032000000;
      v32 = __Block_byref_object_copy__11071;
      v33 = __Block_byref_object_dispose__11072;
      v34 = 0;
      v17 = *(_QWORD **)(a1 + 32);
      if (v17)
        v17 = (_QWORD *)v17[1];
      v18 = v17;
      v28[0] = v14;
      v28[1] = 3221225472;
      v28[2] = __60__ICLiveLink__didReceivePlayNowQueueItemsAction_completion___block_invoke_93;
      v28[3] = &unk_1E438B990;
      v28[4] = &v35;
      v28[5] = buf;
      v28[6] = &v29;
      objc_msgSend(v18, "msv_map:", v28);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = [ICLiveLinkQueueEventContentPlayedNow alloc];
      v21 = -[ICLiveLinkQueueEventContentPlayedNow initWithItemIdentifiers:containerKind:containerIdentifier:containerMediaIdentifier:startItemIdentifier:](v20, "initWithItemIdentifiers:containerKind:containerIdentifier:containerMediaIdentifier:startItemIdentifier:", v19, v36[3], *(_QWORD *)(*(_QWORD *)&buf[8] + 40), v30[5], v5);
      +[ICLiveLinkQueueEvent queueEventWithContentPlayedNow:](ICLiveLinkQueueEvent, "queueEventWithContentPlayedNow:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "_participantForAction:", *(_QWORD *)(a1 + 48));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[ICLiveLinkEvent eventWithQueueEvent:participant:](ICLiveLinkEvent, "eventWithQueueEvent:participant:", v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 40), "receivedEvent:", v24);
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

      _Block_object_dispose(&v29, 8);
      _Block_object_dispose(buf, 8);

      _Block_object_dispose(&v35, 8);
    }
    else
    {
      v25 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v27 = *(_QWORD *)(a1 + 32);
        v26 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 134218242;
        *(_QWORD *)&buf[4] = v26;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v27;
        _os_log_impl(&dword_1A03E3000, v25, OS_LOG_TYPE_DEFAULT, "ILL %p: Received PlayNowQueueItemsAction with displayNotice=NO %{public}@", buf, 0x16u);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }

  }
}

BOOL __60__ICLiveLink__didReceivePlayNowQueueItemsAction_completion___block_invoke_92(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = objc_msgSend(a2, "serverID");
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v4 = *(_QWORD *)(v4 + 8);
  return v3 == v4;
}

id __60__ICLiveLink__didReceivePlayNowQueueItemsAction_completion___block_invoke_93(_QWORD *a1, void *a2)
{
  id *v3;
  id *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  _DWORD *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;

  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24))
    goto LABEL_22;
  if (v3)
  {
    v5 = v3[2];
    v6 = v5;
    if (v5)
    {
      v7 = (void *)*((_QWORD *)v5 + 3);
      goto LABEL_5;
    }
  }
  else
  {
    v6 = 0;
  }
  v7 = 0;
LABEL_5:
  v8 = v7;

  if (objc_msgSend(v8, "length"))
  {
    if (v4)
    {
      v9 = v4[2];
      v10 = v9;
      if (v9)
      {
        v11 = (void *)*((_QWORD *)v9 + 1);
        goto LABEL_9;
      }
    }
    else
    {
      v10 = 0;
    }
    v11 = 0;
LABEL_9:
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), v11);

    if (v4)
    {
      v12 = v4[2];
      if (v12)
      {
        if ((v12[11] & 1) != 0)
        {
          v13 = (v12[10] - 1);
          if (v13 <= 3)
          {
            v14 = v13 + 1;
LABEL_20:
            *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = v14;

            objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), v7);
            goto LABEL_21;
          }
        }
      }
    }
    else
    {
      v12 = 0;
    }
    v14 = 0;
    goto LABEL_20;
  }
LABEL_21:

LABEL_22:
  if (v4)
    v15 = v4[3];
  else
    v15 = 0;
  v16 = v15;

  return v16;
}

BOOL __55__ICLiveLink__didReceivePlaybackSyncAction_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = objc_msgSend(a2, "serverID");
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v4 = *(_QWORD *)(v4 + 8);
  return v3 == v4;
}

uint64_t __60__ICLiveLink__didReceiveParticipantChangeAction_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_emitSessionEventIfNeededForAction:disconnectedParticipant:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __51__ICLiveLink__didReceiveMoveItemAction_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  ICLiveLinkQueueEventContentReordered *v3;
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  ICLiveLinkQueueEventContentReordered *v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2 && *(_BYTE *)(v2 + 144))
  {
    v3 = [ICLiveLinkQueueEventContentReordered alloc];
    v4 = *(_QWORD **)(a1 + 48);
    if (v4)
      v4 = (_QWORD *)v4[1];
    v5 = v4;
    v12 = -[ICLiveLinkQueueEventContentReordered initWithItemIdentifier:](v3, "initWithItemIdentifier:", v5);

    +[ICLiveLinkQueueEvent queueEventWithContentReordered:](ICLiveLinkQueueEvent, "queueEventWithContentReordered:", v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_participantForAction:", *(_QWORD *)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICLiveLinkEvent eventWithQueueEvent:participant:](ICLiveLinkEvent, "eventWithQueueEvent:participant:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "receivedEvent:", v8);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
  else
  {
    v9 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 40);
      v11 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 134218242;
      v14 = v10;
      v15 = 2114;
      v16 = v11;
      _os_log_impl(&dword_1A03E3000, v9, OS_LOG_TYPE_DEFAULT, "ILL %p: Received MoveItemAction with displayNotice=NO %{public}@", buf, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

BOOL __64__ICLiveLink__didReceiveCurrentItemTransitionAction_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = objc_msgSend(a2, "serverID");
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v4 = *(_QWORD *)(v4 + 8);
  return v3 == v4;
}

BOOL __60__ICLiveLink__didReceiveCurrentItemChangeAction_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = objc_msgSend(a2, "serverID");
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v4 = *(_QWORD *)(v4 + 8);
  return v3 == v4;
}

void __51__ICLiveLink__didReceiveAddItemsAction_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  void *v7;
  ICLiveLinkQueueEventContentAdded *v8;
  ICLiveLinkQueueEventContentAdded *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[7];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  _BYTE buf[24];
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4 && *(_BYTE *)(v4 + 144))
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x2020000000;
    v26 = 0;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v28 = __Block_byref_object_copy__11071;
    v29 = __Block_byref_object_dispose__11072;
    v30 = 0;
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__11071;
    v21 = __Block_byref_object_dispose__11072;
    v22 = 0;
    v5 = *(_QWORD **)(a1 + 48);
    if (v5)
      v5 = (_QWORD *)v5[1];
    v6 = v5;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __51__ICLiveLink__didReceiveAddItemsAction_completion___block_invoke_74;
    v16[3] = &unk_1E438B990;
    v16[4] = &v23;
    v16[5] = buf;
    v16[6] = &v17;
    objc_msgSend(v6, "msv_map:", v16);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = [ICLiveLinkQueueEventContentAdded alloc];
    v9 = -[ICLiveLinkQueueEventContentAdded initWithItemIdentifiers:containerKind:containerIdentifier:containerMediaIdentifier:](v8, "initWithItemIdentifiers:containerKind:containerIdentifier:containerMediaIdentifier:", v7, v24[3], *(_QWORD *)(*(_QWORD *)&buf[8] + 40), v18[5]);
    +[ICLiveLinkQueueEvent queueEventWithContentAdded:](ICLiveLinkQueueEvent, "queueEventWithContentAdded:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_participantForAction:", *(_QWORD *)(a1 + 32));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICLiveLinkEvent eventWithQueueEvent:participant:](ICLiveLinkEvent, "eventWithQueueEvent:participant:", v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "receivedEvent:", v12);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

    _Block_object_dispose(&v17, 8);
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(&v23, 8);
  }
  else
  {
    v13 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(_QWORD *)(a1 + 40);
      v15 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = v14;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v15;
      _os_log_impl(&dword_1A03E3000, v13, OS_LOG_TYPE_DEFAULT, "ILL %p: Received AddItemsAction with displayNotice=NO %{public}@", buf, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

id __51__ICLiveLink__didReceiveAddItemsAction_completion___block_invoke_74(_QWORD *a1, void *a2)
{
  id *v3;
  id *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  _DWORD *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;

  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24))
    goto LABEL_22;
  if (v3)
  {
    v5 = v3[2];
    v6 = v5;
    if (v5)
    {
      v7 = (void *)*((_QWORD *)v5 + 3);
      goto LABEL_5;
    }
  }
  else
  {
    v6 = 0;
  }
  v7 = 0;
LABEL_5:
  v8 = v7;

  if (objc_msgSend(v8, "length"))
  {
    if (v4)
    {
      v9 = v4[2];
      v10 = v9;
      if (v9)
      {
        v11 = (void *)*((_QWORD *)v9 + 1);
        goto LABEL_9;
      }
    }
    else
    {
      v10 = 0;
    }
    v11 = 0;
LABEL_9:
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), v11);

    if (v4)
    {
      v12 = v4[2];
      if (v12)
      {
        if ((v12[11] & 1) != 0)
        {
          v13 = (v12[10] - 1);
          if (v13 <= 3)
          {
            v14 = v13 + 1;
LABEL_20:
            *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = v14;

            objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), v7);
            goto LABEL_21;
          }
        }
      }
    }
    else
    {
      v12 = 0;
    }
    v14 = 0;
    goto LABEL_20;
  }
LABEL_21:

LABEL_22:
  if (v4)
    v15 = v4[3];
  else
    v15 = 0;
  v16 = v15;

  return v16;
}

uint64_t __28__ICLiveLink_receivedEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "liveLink:didReceiveEvent:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __60__ICLiveLink_receivedCurrentItemIdentifier_fromParticipant___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "liveLink:didReceiveDirectCurrentItemChanged:fromParticipant:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __60__ICLiveLink_receivedCurrentItemIdentifier_fromParticipant___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "liveLink:didReceiveDirectCurrentItemChanged:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __51__ICLiveLink_fetchPlaybackSyncStateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    if (v5)
    {
      v8 = v5[4];
      v9 = v8;
      if (v8)
      {
        v10 = (void *)*((_QWORD *)v8 + 3);
LABEL_7:
        v11 = v10;

        v12 = *(void **)(a1 + 40);
        v13 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 88);
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __51__ICLiveLink_fetchPlaybackSyncStateWithCompletion___block_invoke_2;
        v15[3] = &unk_1E4390EF8;
        v16 = v11;
        v17 = v12;
        v14 = v11;
        dispatch_async(v13, v15);

        goto LABEL_8;
      }
    }
    else
    {
      v9 = 0;
    }
    v10 = 0;
    goto LABEL_7;
  }
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, _QWORD, id))(v7 + 16))(v7, 0, v6);
LABEL_8:

}

uint64_t __51__ICLiveLink_fetchPlaybackSyncStateWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __60__ICLiveLink_fetchPlaybackSyncStateForMediumWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    if (v5)
    {
      v8 = v5[4];
      v9 = v8;
      if (v8)
      {
        v10 = (void *)*((_QWORD *)v8 + 3);
LABEL_7:
        v11 = v10;

        v12 = *(void **)(a1 + 40);
        v13 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 88);
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __60__ICLiveLink_fetchPlaybackSyncStateForMediumWithCompletion___block_invoke_2;
        v15[3] = &unk_1E4390EF8;
        v16 = v11;
        v17 = v12;
        v14 = v11;
        dispatch_async(v13, v15);

        goto LABEL_8;
      }
    }
    else
    {
      v9 = 0;
    }
    v10 = 0;
    goto LABEL_7;
  }
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, _QWORD, id))(v7 + 16))(v7, 0, v6);
LABEL_8:

}

uint64_t __60__ICLiveLink_fetchPlaybackSyncStateForMediumWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

uint64_t __18__ICLiveLink_stop__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didStopLiveLink:", *(_QWORD *)(a1 + 40));
}

+ (ICLiveLink)linkWithIdentity:(id)a3
{
  id v3;
  ICLiveLink *v4;

  v3 = a3;
  v4 = -[ICLiveLink initWithSharedListeningSessionIdentifier:identity:]([ICLiveLink alloc], "initWithSharedListeningSessionIdentifier:identity:", 0, v3);

  return v4;
}

+ (ICLiveLink)linkWithSessionIdentifier:(id)a3 identity:(id)a4
{
  id v5;
  id v6;
  ICLiveLink *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[ICLiveLink initWithSharedListeningSessionIdentifier:identity:]([ICLiveLink alloc], "initWithSharedListeningSessionIdentifier:identity:", v6, v5);

  return v7;
}

@end
