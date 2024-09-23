@implementation VUIMultiviewPlaybackInfo

- (VUIMultiviewPlaybackInfo)initWithPlayer:(id)a3 playerViewController:(id)a4 playsFromStart:(BOOL)a5 broadcastLocale:(id)a6
{
  id v11;
  id v12;
  id v13;
  VUIMultiviewPlaybackInfo *v14;
  VUIMultiviewPlaybackInfo *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)VUIMultiviewPlaybackInfo;
  v14 = -[VUIMultiviewPlaybackInfo init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_player, a3);
    objc_storeStrong((id *)&v15->_playerViewController, a4);
    v15->_context = 0;
    v15->_playsFromStart = a5;
    objc_storeStrong((id *)&v15->_broadcastLocale, a6);
    v15->_pausedDueToInterruption = 0;
  }

  return v15;
}

+ (id)prospectivePlaybackInfo
{
  if (prospectivePlaybackInfo_onceToken != -1)
    dispatch_once(&prospectivePlaybackInfo_onceToken, &__block_literal_global_57);
  return (id)prospectivePlaybackInfo_instance;
}

void __51__VUIMultiviewPlaybackInfo_prospectivePlaybackInfo__block_invoke()
{
  VUIMultiviewPlaybackInfo *v0;
  void *v1;

  v0 = -[VUIMultiviewPlaybackInfo initWithPlayer:playerViewController:playsFromStart:broadcastLocale:]([VUIMultiviewPlaybackInfo alloc], "initWithPlayer:playerViewController:playsFromStart:broadcastLocale:", 0, 0, 0, 0);
  v1 = (void *)prospectivePlaybackInfo_instance;
  prospectivePlaybackInfo_instance = (uint64_t)v0;

}

- (BOOL)isAtLiveEdge
{
  void *v2;
  char v3;

  -[VUIMultiviewPlaybackInfo player](self, "player");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isLive");

  return v3;
}

- (BOOL)_audioContainsAirPlayRoute
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentRoute");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "outputs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    v8 = (void *)*MEMORY[0x1E0C897C0];
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "portType", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10 == v8)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)waitForExternalPlaybackToBecomeType:(int64_t)a3 forPlayer:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  void (**v16)(_QWORD);
  id v17[2];
  id location;

  v8 = a4;
  v9 = (void (**)(_QWORD))a5;
  if (v8 && objc_msgSend(v8, "externalPlaybackType") != a3)
  {
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x1E0DB1F90];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __85__VUIMultiviewPlaybackInfo_waitForExternalPlaybackToBecomeType_forPlayer_completion___block_invoke;
    v14[3] = &unk_1E9F9CE48;
    v15 = v8;
    v17[1] = (id)a3;
    objc_copyWeak(v17, &location);
    v16 = v9;
    objc_msgSend(v10, "addObserverForName:object:queue:usingBlock:", v12, v15, v11, v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[VUIMultiviewPlaybackInfo setNotificationToken:](self, "setNotificationToken:", v13);
    objc_destroyWeak(v17);

    objc_destroyWeak(&location);
  }
  else if (v9)
  {
    v9[2](v9);
  }

}

uint64_t __85__VUIMultiviewPlaybackInfo_waitForExternalPlaybackToBecomeType_forPlayer_completion___block_invoke(uint64_t a1)
{
  uint64_t result;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  result = objc_msgSend(*(id *)(a1 + 32), "externalPlaybackType");
  if (result == *(_QWORD *)(a1 + 56))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "notificationToken");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_loadWeakRetained((id *)(a1 + 48));
      objc_msgSend(v6, "notificationToken");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "removeObserver:", v7);
    }
    result = *(_QWORD *)(a1 + 40);
    if (result)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_waitForExternalPlaybackToEndForPlayer:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __78__VUIMultiviewPlaybackInfo__waitForExternalPlaybackToEndForPlayer_completion___block_invoke;
  v9[3] = &unk_1E9F98E68;
  v10 = v6;
  v7 = v6;
  v8 = a3;
  -[VUIMultiviewPlaybackInfo waitForExternalPlaybackToBecomeType:forPlayer:completion:](self, "waitForExternalPlaybackToBecomeType:forPlayer:completion:", 0, v8, v9);
  objc_msgSend(v8, "setAllowsExternalPlayback:", 0);

}

uint64_t __78__VUIMultiviewPlaybackInfo__waitForExternalPlaybackToEndForPlayer_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)_enabledAudioTrackForPlayer:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(a3, "avPlayer", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tracks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    v9 = *MEMORY[0x1E0C8A7A0];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v11, "assetTrack");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "mediaType");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "isEqualToString:", v9))
        {
          v14 = objc_msgSend(v11, "isEnabled");

          if ((v14 & 1) != 0)
          {
            v15 = v11;
            goto LABEL_13;
          }
        }
        else
        {

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }
  v15 = 0;
LABEL_13:

  return v15;
}

- (id)_audioTrackForPlayer:(id)a3 withIdentifier:(int)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(a3, "avPlayer", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tracks");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v12, "assetTrack");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "trackID");

        if (v14 == a4)
        {
          v15 = v12;
          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v9)
        continue;
      break;
    }
  }
  v15 = 0;
LABEL_11:

  return v15;
}

- (void)swapActiveAudioWithPlaybackInfo:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  void (**v22)(_QWORD);
  id v23;
  id location;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  objc_msgSend(v6, "player");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "playerViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMultiviewPlaybackInfo player](self, "player");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMultiviewPlaybackInfo playerViewController](self, "playerViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[VUIMultiviewPlaybackInfo _audioContainsAirPlayRoute](self, "_audioContainsAirPlayRoute"))
  {
    objc_msgSend(v8, "pause");
    objc_initWeak(&location, self);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __71__VUIMultiviewPlaybackInfo_swapActiveAudioWithPlaybackInfo_completion___block_invoke;
    v17[3] = &unk_1E9F9CE70;
    v18 = v8;
    objc_copyWeak(&v23, &location);
    v19 = v9;
    v20 = v10;
    v21 = v11;
    v22 = v7;
    -[VUIMultiviewPlaybackInfo _waitForExternalPlaybackToEndForPlayer:completion:](self, "_waitForExternalPlaybackToEndForPlayer:completion:", v18, v17);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(v8, "setAllowsExternalPlayback:", 0);
    objc_msgSend(v9, "setUpdatesNowPlayingInfoCenter:", 0);
    objc_msgSend(v9, "playerController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAllowsAudioPlayback:", 0);

    objc_msgSend(v8, "setMuted:", 1);
    -[VUIMultiviewPlaybackInfo _enabledAudioTrackForPlayer:](self, "_enabledAudioTrackForPlayer:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setEnabled:", 0);
    objc_msgSend(v10, "setAllowsExternalPlayback:", 1);
    objc_msgSend(v11, "setUpdatesNowPlayingInfoCenter:", 1);
    objc_msgSend(v11, "playerController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAllowsAudioPlayback:", 1);

    objc_msgSend(v10, "setMuted:", 0);
    -[VUIMultiviewPlaybackInfo _audioTrackForPlayer:withIdentifier:](self, "_audioTrackForPlayer:withIdentifier:", v10, -[VUIMultiviewPlaybackInfo disabledAudioTrackId](self, "disabledAudioTrackId"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setEnabled:", 1);
    objc_msgSend(v13, "assetTrack");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIMultiviewPlaybackInfo setDisabledAudioTrackId:](self, "setDisabledAudioTrackId:", objc_msgSend(v16, "trackID"));

    objc_msgSend(v9, "setPreferredPlaybackControlsSupplementalSubtitleDisplayOption:", 0);
    objc_msgSend(v11, "setPreferredPlaybackControlsSupplementalSubtitleDisplayOption:", 4);
    if (v7)
      v7[2](v7);

  }
}

void __71__VUIMultiviewPlaybackInfo_swapActiveAudioWithPlaybackInfo_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "setMuted:", 1);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(WeakRetained, "_enabledAudioTrackForPlayer:", *(_QWORD *)(a1 + 32));
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setEnabled:", 0);
  objc_msgSend(*(id *)(a1 + 40), "playerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAllowsAudioPlayback:", 0);

  objc_msgSend(*(id *)(a1 + 32), "play");
  objc_msgSend(*(id *)(a1 + 48), "pause");
  objc_msgSend(*(id *)(a1 + 48), "setAllowsExternalPlayback:", 1);
  objc_msgSend(*(id *)(a1 + 48), "setMuted:", 0);
  v4 = objc_loadWeakRetained((id *)(a1 + 72));
  v5 = *(_QWORD *)(a1 + 48);
  v6 = v4;
  objc_msgSend(v6, "_audioTrackForPlayer:withIdentifier:", v5, objc_msgSend(v6, "disabledAudioTrackId"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setEnabled:", 1);
  objc_msgSend(*(id *)(a1 + 56), "playerController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAllowsAudioPlayback:", 1);

  objc_msgSend(*(id *)(a1 + 48), "play");
  v9 = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(v12, "assetTrack");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDisabledAudioTrackId:", objc_msgSend(v10, "trackID"));

  objc_msgSend(*(id *)(a1 + 40), "setPreferredPlaybackControlsSupplementalSubtitleDisplayOption:", 0);
  objc_msgSend(*(id *)(a1 + 56), "setPreferredPlaybackControlsSupplementalSubtitleDisplayOption:", 4);
  v11 = *(_QWORD *)(a1 + 64);
  if (v11)
    (*(void (**)(void))(v11 + 16))();

}

- (VUIPlayer)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_player, a3);
}

- (AVPlayerViewController)playerViewController
{
  return self->_playerViewController;
}

- (void)setPlayerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_playerViewController, a3);
}

- (int64_t)context
{
  return self->_context;
}

- (void)setContext:(int64_t)a3
{
  self->_context = a3;
}

- (BOOL)playsFromStart
{
  return self->_playsFromStart;
}

- (NSString)broadcastLocale
{
  return self->_broadcastLocale;
}

- (BOOL)pausedDueToInterruption
{
  return self->_pausedDueToInterruption;
}

- (void)setPausedDueToInterruption:(BOOL)a3
{
  self->_pausedDueToInterruption = a3;
}

- (NSDate)resumeDate
{
  return self->_resumeDate;
}

- (void)setResumeDate:(id)a3
{
  objc_storeStrong((id *)&self->_resumeDate, a3);
}

- (TVPPlaybackState)backgroundPlayerState
{
  return self->_backgroundPlayerState;
}

- (void)setBackgroundPlayerState:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundPlayerState, a3);
}

- (id)notificationToken
{
  return self->_notificationToken;
}

- (void)setNotificationToken:(id)a3
{
  objc_storeStrong(&self->_notificationToken, a3);
}

- (int)disabledAudioTrackId
{
  return self->_disabledAudioTrackId;
}

- (void)setDisabledAudioTrackId:(int)a3
{
  self->_disabledAudioTrackId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_notificationToken, 0);
  objc_storeStrong((id *)&self->_backgroundPlayerState, 0);
  objc_storeStrong((id *)&self->_resumeDate, 0);
  objc_storeStrong((id *)&self->_broadcastLocale, 0);
  objc_storeStrong((id *)&self->_playerViewController, 0);
  objc_storeStrong((id *)&self->_player, 0);
}

@end
