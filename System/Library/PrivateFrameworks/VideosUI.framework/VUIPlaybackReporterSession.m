@implementation VUIPlaybackReporterSession

- (id)consumeStopType
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)*MEMORY[0x1E0D41850];
  -[VUIPlaybackReporterSession consumeMetadataForKey:](self, "consumeMetadataForKey:", CFSTR("VUIPlaybackReporterSessionMetadataKeyStopType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = v2;
  v5 = v3;

  return v5;
}

- (id)consumeStopReason
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)*MEMORY[0x1E0D41828];
  -[VUIPlaybackReporterSession consumeMetadataForKey:](self, "consumeMetadataForKey:", CFSTR("VUIPlaybackReporterSessionMetadataKeyStopReason"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = v2;
  v5 = v3;

  return v5;
}

- (id)consumeStartType
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)*MEMORY[0x1E0D41850];
  -[VUIPlaybackReporterSession consumeMetadataForKey:](self, "consumeMetadataForKey:", CFSTR("VUIPlaybackReporterSessionMetadataKeyStartType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = v2;
  v5 = v3;

  return v5;
}

- (id)consumeStartReason
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)*MEMORY[0x1E0D417D0];
  -[VUIPlaybackReporterSession consumeMetadataForKey:](self, "consumeMetadataForKey:", CFSTR("VUIPlaybackReporterSessionMetadataKeyStartReason"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = v2;
  v5 = v3;

  return v5;
}

+ (id)transitionTypeForMediaControllerAutoTransition:(id)a3
{
  id v3;
  id v4;
  int v5;
  id *v6;
  id v7;

  v3 = a3;
  v4 = (id)*MEMORY[0x1E0D41850];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(v3, "BOOLValue");
    v6 = (id *)MEMORY[0x1E0D41840];
    if (!v5)
      v6 = (id *)MEMORY[0x1E0D41848];
    v7 = *v6;

    v4 = v7;
  }

  return v4;
}

+ (id)transitionReasonForMediaControllerStartReason:(id)a3 autoStart:(id)a4
{
  id v5;
  id v6;
  id v7;
  const __CFString *v8;
  id v9;
  NSObject *v10;
  int v12;
  id v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (id)*MEMORY[0x1E0D417D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = 0;
    switch(objc_msgSend(v5, "integerValue"))
    {
      case 0:
        v8 = CFSTR("Unknown");
        break;
      case 1:
        v9 = (id)*MEMORY[0x1E0D41798];

        v8 = CFSTR("BackgroundTrailer");
        goto LABEL_11;
      case 2:
        v9 = (id)*MEMORY[0x1E0D417A8];

        v8 = CFSTR("UpNext");
        goto LABEL_11;
      case 3:
        v9 = (id)*MEMORY[0x1E0D417A8];

        v8 = CFSTR("PostPlay");
        goto LABEL_11;
      case 4:
        v9 = (id)*MEMORY[0x1E0D417A8];

        v8 = CFSTR("ProductPage");
        goto LABEL_11;
      case 8:
        v9 = (id)*MEMORY[0x1E0D417A8];

        v8 = CFSTR("Multiview");
        goto LABEL_11;
      case 9:
        v9 = (id)*MEMORY[0x1E0D417A0];

        v8 = CFSTR("CatchUpToLive");
        goto LABEL_11;
      case 10:
        v9 = (id)*MEMORY[0x1E0D417B0];

        v8 = CFSTR("PlayOther");
LABEL_11:
        v7 = v9;
        break;
      default:
        break;
    }
    VUIDefaultLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138413058;
      v13 = v7;
      v14 = 2112;
      v15 = v8;
      v16 = 2112;
      v17 = v5;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_1D96EE000, v10, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterSession (VPAF) -  Resolved start reason:[%@]. _reason:%@(%@) _autoStart:%@", (uint8_t *)&v12, 0x2Au);
    }

  }
  return v7;
}

+ (id)transitionReasonForMediaControllerStopReason:(id)a3 autoStop:(id)a4
{
  id v5;
  id v6;
  id v7;
  const __CFString *v8;
  id v9;
  NSObject *v10;
  int v12;
  id v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (id)*MEMORY[0x1E0D417D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    switch(objc_msgSend(v5, "integerValue"))
    {
      case 0:
        v8 = CFSTR("Unknown");
        break;
      case 1:
        v9 = (id)*MEMORY[0x1E0D41808];

        v8 = CFSTR("AnotherPlaybackStarted");
        goto LABEL_10;
      case 2:
        v9 = (id)*MEMORY[0x1E0D417F8];

        v8 = CFSTR("PostPlayBinge");
        goto LABEL_10;
      case 3:
        v9 = (id)*MEMORY[0x1E0D417E0];

        v8 = CFSTR("PostPlayNonBinge");
        goto LABEL_10;
      case 4:
        v9 = (id)*MEMORY[0x1E0D417F0];

        v8 = CFSTR("TimedOutWhilePaused");
        goto LABEL_10;
      case 5:
        v9 = (id)*MEMORY[0x1E0D417F8];

        v8 = CFSTR("CatchUpToLive");
LABEL_10:
        v7 = v9;
        break;
      default:
        v8 = 0;
        break;
    }
    VUIDefaultLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138413058;
      v13 = v7;
      v14 = 2112;
      v15 = v8;
      v16 = 2112;
      v17 = v5;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_1D96EE000, v10, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterSession (VPAF) -  Resolved stop reason:[%@] _reason:%@(%@) _autoStop:%@", (uint8_t *)&v12, 0x2Au);
    }

  }
  return v7;
}

- (VUIPlaybackReporterSession)initWithPlayer:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  VUIPlaybackReporterSession *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSString *UUID;
  NSMutableDictionary *v14;
  NSMutableDictionary *metadata;
  VUIPlaybackReporterSession *v16;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "currentMediaItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v18.receiver = self;
    v18.super_class = (Class)VUIPlaybackReporterSession;
    v9 = -[VUIPlaybackReporterSession init](&v18, sel_init);
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "UUIDString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "substringToIndex:", 7);
      v12 = objc_claimAutoreleasedReturnValue();
      UUID = v9->_UUID;
      v9->_UUID = (NSString *)v12;

      objc_storeWeak((id *)&v9->_player, v6);
      objc_storeStrong(&v9->_context, a4);
      v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      metadata = v9->_metadata;
      v9->_metadata = v14;

      v9->_metadataLock._os_unfair_lock_opaque = 0;
    }
    self = v9;
    v16 = self;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)VUIPlaybackReporterSession;
  -[VUIPlaybackReporterSession description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIPlaybackReporterSession player](self, "player");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIPlaybackReporterSession reportingEnabled](self, "reportingEnabled");
  VUIBoolLogString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@ Enabled:%@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)metadataForKey:(id)a3
{
  os_unfair_lock_s *p_metadataLock;
  id v5;
  void *v6;

  p_metadataLock = &self->_metadataLock;
  v5 = a3;
  os_unfair_lock_lock(p_metadataLock);
  -[NSMutableDictionary objectForKey:](self->_metadata, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_metadataLock);
  return v6;
}

- (void)setMetadata:(id)a3 forKey:(id)a4
{
  id v6;
  NSMutableDictionary *metadata;
  id v8;

  v8 = a3;
  v6 = a4;
  if (v6)
  {
    os_unfair_lock_lock(&self->_metadataLock);
    metadata = self->_metadata;
    if (v8)
      -[NSMutableDictionary setObject:forKey:](metadata, "setObject:forKey:", v8, v6);
    else
      -[NSMutableDictionary removeObjectForKey:](metadata, "removeObjectForKey:", v6);
    os_unfair_lock_unlock(&self->_metadataLock);
  }

}

- (id)consumeMetadataForKey:(id)a3
{
  os_unfair_lock_s *p_metadataLock;
  id v5;
  void *v6;

  p_metadataLock = &self->_metadataLock;
  v5 = a3;
  os_unfair_lock_lock(p_metadataLock);
  -[NSMutableDictionary objectForKey:](self->_metadata, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](self->_metadata, "removeObjectForKey:", v5);

  os_unfair_lock_unlock(p_metadataLock);
  return v6;
}

- (TVPPlayback)player
{
  return (TVPPlayback *)objc_loadWeakRetained((id *)&self->_player);
}

- (void)setPlayer:(id)a3
{
  objc_storeWeak((id *)&self->_player, a3);
}

- (NSString)UUID
{
  return self->_UUID;
}

- (id)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong(&self->_context, a3);
}

- (BOOL)reportingEnabled
{
  return self->_reportingEnabled;
}

- (void)setReportingEnabled:(BOOL)a3
{
  self->_reportingEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_context, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_destroyWeak((id *)&self->_player);
  objc_storeStrong((id *)&self->_metadata, 0);
}

@end
