@implementation IMAVPlayer

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id WeakRetained;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  uint64_t v40;
  float v41;
  NSObject *v42;
  uint64_t v43;
  const __CFString *v44;
  void *v45;
  uint64_t v46;
  NSObject *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  NSObject *v51;
  void *v52;
  NSObject *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  double v61;
  double v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  float v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  id v73;
  NSObject *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const __CFString *v78;
  uint64_t v79;
  void *v80;
  uint64_t (**v81)(_QWORD, _QWORD, _QWORD);
  void *v82;
  char v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  _BOOL4 v89;
  id v90;
  objc_super v91;
  _QWORD v92[5];
  _QWORD v93[5];
  _QWORD v94[5];
  _QWORD v95[5];
  const __CFString *v96;
  void *v97;
  _QWORD v98[2];
  _QWORD v99[2];
  uint8_t buf[4];
  uint64_t v101;
  __int16 v102;
  uint64_t v103;
  __int16 v104;
  const __CFString *v105;
  uint64_t v106;
  _QWORD v107[4];

  v107[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("currentItem")))
  {
    objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      -[AVPlayer currentItem](self->_player, "currentItem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMAVPlayer currentItem](self, "currentItem");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "title");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v101 = (uint64_t)v14;
      v102 = 2112;
      v103 = (uint64_t)v16;
      _os_log_impl(&dword_1DA478000, v13, OS_LOG_TYPE_DEFAULT, "currentItem changed: %@. Title: %@", buf, 0x16u);

    }
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0CB2CC8]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        -[IMAVPlayer stopObservingPlayerItem:](self, "stopObservingPlayerItem:", v17);
    }
    if ((*(_WORD *)&self->_delegateFlags & 0x40) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "playerCurrentItemChanged:", self);

    }
    -[AVPlayer currentItem](self->_player, "currentItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      v20 = (void *)objc_opt_class();
      v95[0] = MEMORY[0x1E0C809B0];
      v95[1] = 3221225472;
      v95[2] = __61__IMAVPlayer_observeValueForKeyPath_ofObject_change_context___block_invoke;
      v95[3] = &unk_1EA0C4FB0;
      v95[4] = self;
      objc_msgSend(v20, "performOnMainQueue:", v95);
      -[AVPlayer currentItem](self->_player, "currentItem");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addObserver:forKeyPath:options:context:", self, CFSTR("status"), 6, 0);

      -[AVPlayer currentItem](self->_player, "currentItem");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addObserver:forKeyPath:options:context:", self, CFSTR("playbackLikelyToKeepUp"), 0, 0);

      -[AVPlayer currentItem](self->_player, "currentItem");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addObserver:forKeyPath:options:context:", self, CFSTR("playbackBufferEmpty"), 0, 0);

      -[AVPlayer currentItem](self->_player, "currentItem");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addObserver:forKeyPath:options:context:", self, CFSTR("loadedTimeRanges"), 0, 0);

      -[AVPlayer currentItem](self->_player, "currentItem");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addObserver:forKeyPath:options:context:", self, CFSTR("presentationSize"), 0, 0);

      -[AVPlayer currentItem](self->_player, "currentItem");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "willChangeValueForKey:", CFSTR("status"));

      -[AVPlayer currentItem](self->_player, "currentItem");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "didChangeValueForKey:", CFSTR("status"));

      -[AVPlayer currentItem](self->_player, "currentItem");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "willChangeValueForKey:", CFSTR("playbackLikelyToKeepUp"));

      -[AVPlayer currentItem](self->_player, "currentItem");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "didChangeValueForKey:", CFSTR("playbackLikelyToKeepUp"));

      -[AVPlayer currentItem](self->_player, "currentItem");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "willChangeValueForKey:", CFSTR("playbackBufferEmpty"));

      -[AVPlayer currentItem](self->_player, "currentItem");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "didChangeValueForKey:", CFSTR("playbackBufferEmpty"));

      -[AVPlayer currentItem](self->_player, "currentItem");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "willChangeValueForKey:", CFSTR("loadedTimeRanges"));

      -[AVPlayer currentItem](self->_player, "currentItem");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "didChangeValueForKey:", CFSTR("loadedTimeRanges"));

      -[AVPlayer currentItem](self->_player, "currentItem");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "willChangeValueForKey:", CFSTR("presentationSize"));

      -[AVPlayer currentItem](self->_player, "currentItem");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "didChangeValueForKey:", CFSTR("presentationSize"));

      -[IMPlayerItem duration](self->_currentItem, "duration");
      -[IMAVPlayer setDurationBeforeItemLoaded:](self, "setDurationBeforeItemLoaded:");
      -[AVPlayer currentItem](self->_player, "currentItem");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "asset");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v94[0] = MEMORY[0x1E0C809B0];
      v94[1] = 3221225472;
      v94[2] = __61__IMAVPlayer_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
      v94[3] = &unk_1EA0C4FB0;
      v94[4] = self;
      objc_msgSend(v37, "loadValuesAsynchronouslyForKeys:completionHandler:", &unk_1EA0F6490, v94);

    }
    goto LABEL_21;
  }
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("rate")))
  {
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0CB2CC8]);
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = v38;
    if (v38)
    {
      v40 = -[NSObject longValue](v38, "longValue");
      -[AVPlayer rate](self->_player, "rate");
      if (v40 == (uint64_t)v41)
        goto LABEL_20;
    }
    goto LABEL_19;
  }
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("timeControlStatus")))
  {
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0CB2CC8]);
    v42 = objc_claimAutoreleasedReturnValue();
    v39 = v42;
    if (v42)
    {
      v43 = -[NSObject longValue](v42, "longValue");
      if (v43 == -[AVPlayer timeControlStatus](self->_player, "timeControlStatus"))
        goto LABEL_20;
    }
LABEL_19:
    -[IMAVPlayer _updateForCurrentRateAndTimeControlStatus](self, "_updateForCurrentRateAndTimeControlStatus");
LABEL_20:

    goto LABEL_21;
  }
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("volume")))
  {
    if (self->_fadeOutTimer || -[IMAVPlayer isScanning](self, "isScanning"))
      goto LABEL_21;
    v44 = CFSTR("IMAVPlayerNotification_PlayerVolumeDidChange");
LABEL_26:
    -[IMAVPlayer _postNotificationName:userInfo:](self, "_postNotificationName:userInfo:", v44, 0);
    goto LABEL_21;
  }
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("status")))
  {
    -[AVPlayer currentItem](self->_player, "currentItem");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v45)
      goto LABEL_21;
    v46 = *MEMORY[0x1E0CB2CC8];
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0CB2CC8]);
    v47 = objc_claimAutoreleasedReturnValue();
    v39 = v47;
    if (v47)
    {
      v48 = -[NSObject longValue](v47, "longValue");
      -[AVPlayer currentItem](self->_player, "currentItem");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v49, "status");

      if (v48 == v50)
      {
        objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v101 = -[NSObject longValue](v39, "longValue");
          _os_log_impl(&dword_1DA478000, v51, OS_LOG_TYPE_DEFAULT, "ignoring item status KVO because it is unchanged: %ld", buf, 0xCu);
        }
        goto LABEL_75;
      }
    }
    v90 = v11;
    objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      v54 = -[NSObject longValue](v39, "longValue");
      -[AVPlayer currentItem](self->_player, "currentItem");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218240;
      v101 = v54;
      v102 = 2048;
      v103 = objc_msgSend(v55, "status");
      _os_log_impl(&dword_1DA478000, v53, OS_LOG_TYPE_DEFAULT, "item status changed from: %ld to: %ld", buf, 0x16u);

    }
    if (v39)
    {
      v106 = v46;
      v107[0] = v39;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v107, &v106, 1);
      v51 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v51 = 0;
    }
    -[IMAVPlayer _postNotificationName:userInfo:](self, "_postNotificationName:userInfo:", CFSTR("IMAVPlayerNotification_MediaItemStatusDidChange"), v51);
    -[AVPlayer currentItem](self->_player, "currentItem");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = objc_msgSend(v69, "status");

    if (v70 == 1)
    {
      -[IMAVPlayer currentItem](self, "currentItem");
      v84 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v84)
      {
LABEL_75:

        goto LABEL_20;
      }
      v96 = CFSTR("IMAVPlayerNotificationKey_CurrentMediaItem");
      -[IMAVPlayer currentItem](self, "currentItem");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v97 = v72;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v97, &v96, 1);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMAVPlayer _postNotificationName:userInfo:](self, "_postNotificationName:userInfo:", CFSTR("IMAVPlayerNotification_PlayerItemReadyToPlay"), v85);
    }
    else
    {
      if (v70 != 2)
        goto LABEL_75;
      -[AVPlayer currentItem](self->_player, "currentItem");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "error");
      v72 = (void *)objc_claimAutoreleasedReturnValue();

      v89 = -[IMAVPlayer isPlaybackRequested](self, "isPlaybackRequested");
      if ((*(_WORD *)&self->_delegateFlags & 2) != 0)
      {
        v73 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v73, "playerErrorDidOccur:error:", self, v72);

      }
      objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
      v74 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
      {
        v75 = objc_msgSend(v72, "code");
        objc_msgSend(v72, "domain");
        v76 = objc_claimAutoreleasedReturnValue();
        v77 = (void *)v76;
        v78 = CFSTR("no");
        *(_DWORD *)buf = 134218498;
        v101 = v75;
        v102 = 2112;
        if (v89)
          v78 = CFSTR("yes");
        v103 = v76;
        v104 = 2112;
        v105 = v78;
        _os_log_impl(&dword_1DA478000, v74, OS_LOG_TYPE_ERROR, "Player error encountered, code %ld domain: %@, was playing: %@. Invalidating asset.", buf, 0x20u);

      }
      if (v89)
      {
        -[IMAVPlayer playbackErrorFallback](self, "playbackErrorFallback");
        v79 = objc_claimAutoreleasedReturnValue();
        if (v79)
        {
          v80 = (void *)v79;
          -[IMAVPlayer playbackErrorFallback](self, "playbackErrorFallback");
          v81 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          -[IMAVPlayer currentItem](self, "currentItem");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          v83 = ((uint64_t (**)(_QWORD, void *, void *))v81)[2](v81, v82, v72);

          if ((v83 & 1) != 0)
          {
            v11 = v90;
LABEL_74:

            goto LABEL_75;
          }
        }
      }
      if (objc_msgSend(v72, "code") != -11819)
      {
        v86 = (void *)objc_opt_class();
        v93[0] = MEMORY[0x1E0C809B0];
        v93[1] = 3221225472;
        v93[2] = __61__IMAVPlayer_observeValueForKeyPath_ofObject_change_context___block_invoke_183;
        v93[3] = &unk_1EA0C4FB0;
        v93[4] = self;
        objc_msgSend(v86, "performOnMainQueue:", v93);
      }
      -[IMAVPlayer currentItem](self, "currentItem");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "cleanupAfterError");

      v99[0] = v72;
      v98[0] = CFSTR("IMAVPlayerNotificationKey_Error");
      v98[1] = CFSTR("IMAVPlayerNotificationKey_PlaybackInterrupted");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v89);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v99[1] = v85;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v99, v98, 2);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMAVPlayer _postNotificationName:userInfo:](self, "_postNotificationName:userInfo:", CFSTR("IMAVPlayerNotification_ErrorDidOccur"), v88);

      v11 = v90;
    }

    goto LABEL_74;
  }
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("externalPlaybackActive"))
    && objc_msgSend(MEMORY[0x1E0D7F278], "platformSupportsVideo"))
  {
    -[IMAVPlayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("airPlayVideoActive"));
    -[IMAVPlayer _postNotificationName:userInfo:](self, "_postNotificationName:userInfo:", CFSTR("IMAVPlayerNotification_AirplayActiveDidChange"), 0);
    -[IMAVPlayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("airPlayVideoActive"));
    goto LABEL_21;
  }
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("playbackBufferEmpty")))
  {
    -[IMAVPlayer _postNotificationName:userInfo:](self, "_postNotificationName:userInfo:", CFSTR("IMAVPlayerNotification_BufferEmptyChanged"), 0);
    objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      -[AVPlayer currentItem](self->_player, "currentItem");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109120;
      LODWORD(v101) = objc_msgSend(v52, "isPlaybackBufferEmpty");
      _os_log_impl(&dword_1DA478000, v39, OS_LOG_TYPE_DEFAULT, "playbackBufferEmpty: %d", buf, 8u);

    }
    goto LABEL_20;
  }
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("playbackLikelyToKeepUp")))
  {
    -[AVPlayer currentItem](self->_player, "currentItem");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "isPlaybackLikelyToKeepUp");

    -[IMAVPlayer currentItem](self, "currentItem");
    v39 = objc_claimAutoreleasedReturnValue();
    -[IMAVPlayer currentItem](self, "currentItem");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "isVideo");
    kdebug_trace();

    goto LABEL_20;
  }
  if (!objc_msgSend(v10, "isEqualToString:", CFSTR("loadedTimeRanges")))
  {
    if (!objc_msgSend(v10, "isEqualToString:", CFSTR("presentationSize")))
    {
      v91.receiver = self;
      v91.super_class = (Class)IMAVPlayer;
      -[IMAVPlayer observeValueForKeyPath:ofObject:change:context:](&v91, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
      goto LABEL_21;
    }
    v44 = CFSTR("IMAVPlayerNotification_MediaItemPresentationSizeDidChange");
    goto LABEL_26;
  }
  objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
  v58 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA478000, v58, OS_LOG_TYPE_INFO, "loadedTimeRanges did change", buf, 2u);
  }

  -[IMAVPlayer _postNotificationName:userInfo:](self, "_postNotificationName:userInfo:", CFSTR("IMAVPlayerNotification_LoadedDurationDidChange"), 0);
  if ((*(_WORD *)&self->_delegateFlags & 0x200) != 0)
  {
    -[IMAVPlayer delegate](self, "delegate");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "playerLoadedDurationChanged:", self);

  }
  if (-[IMAVPlayer loadState](self, "loadState") == 2)
  {
    -[IMAVPlayer currentItem](self, "currentItem");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "playhead");
    v62 = floor(v61);

    -[IMAVPlayer player](self, "player");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "currentItem");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "loadedTimeRanges");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v92[0] = MEMORY[0x1E0C809B0];
    v92[1] = 3221225472;
    v92[2] = __61__IMAVPlayer_observeValueForKeyPath_ofObject_change_context___block_invoke_186;
    v92[3] = &__block_descriptor_40_e24_B32__0__NSValue_8Q16_B24l;
    *(double *)&v92[4] = v62;
    v66 = objc_msgSend(v65, "indexOfObjectPassingTest:", v92);

    if (v66 != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[IMAVPlayer requestedRate](self, "requestedRate");
      if (v67 > 0.0)
      {
        -[IMAVPlayer player](self, "player");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMAVPlayer requestedRate](self, "requestedRate");
        objc_msgSend(v68, "playImmediatelyAtRate:");

      }
    }
  }
LABEL_21:

}

- (double)duration
{
  void *v2;
  double v3;
  double v4;

  -[IMAVPlayer currentItem](self, "currentItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "duration");
  v4 = v3;

  return v4;
}

- (BOOL)isScanning
{
  float v2;

  -[IMAVPlayer scanRate](self, "scanRate");
  return v2 != 0.0;
}

- (float)scanRate
{
  return self->_scanRate;
}

- (void)_updateForCurrentRateAndTimeControlStatus
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_opt_class();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__IMAVPlayer__updateForCurrentRateAndTimeControlStatus__block_invoke;
  v4[3] = &unk_1EA0C4FB0;
  v4[4] = self;
  objc_msgSend(v3, "performOnMainQueue:", v4);
}

- (void)setDurationBeforeItemLoaded:(double)a3
{
  self->_durationBeforeItemLoaded = a3;
}

- (void)triggerTimeObserverAt:(id)a3
{
  id v4;
  void *v5;
  double Seconds;
  NSObject *v7;
  id WeakRetained;
  CMTime time;
  uint8_t buf[4];
  double v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "CMTimeValue");
  else
    memset(&time, 0, sizeof(time));
  Seconds = CMTimeGetSeconds(&time);
  -[IMAVPlayer setupChapterAtTime:](self, "setupChapterAtTime:");
  -[IMAVPlayer _postNotificationName:userInfo:](self, "_postNotificationName:userInfo:", CFSTR("IMAVPlayerNotification_DidCrossTimeBoundry"), 0);
  if ((*(_WORD *)&self->_delegateFlags & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v11 = Seconds;
      _os_log_impl(&dword_1DA478000, v7, OS_LOG_TYPE_INFO, "triggerTimeObserver %f", buf, 0xCu);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "player:callbackForTime:", self, Seconds);

  }
}

- (void)_durationAvailable
{
  NSObject *v3;
  __int16 delegateFlags;
  id WeakRetained;
  id v6;
  uint8_t v7[16];

  objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1DA478000, v3, OS_LOG_TYPE_DEFAULT, "_durationAvailable", v7, 2u);
  }

  delegateFlags = (__int16)self->_delegateFlags;
  if ((delegateFlags & 4) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "playerMediaTypeAvailable:", self);

    delegateFlags = (__int16)self->_delegateFlags;
  }
  if ((delegateFlags & 8) != 0)
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v6, "playerDurationAvailable:", self);

  }
  -[IMAVPlayer _postNotificationName:userInfo:](self, "_postNotificationName:userInfo:", CFSTR("IMAVPlayerNotification_DurationAvailable"), 0);
  -[IMAVPlayer sendDurationLoadedCoreAnalyticsEvents](self, "sendDurationLoadedCoreAnalyticsEvents");
}

- (void)manifestCurrentItemDidChange
{
  void *v3;
  id v4;

  -[IMAVPlayer manifest](self, "manifest");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMAVPlayer setCurrentItem:](self, "setCurrentItem:", v3);

}

- (void)setCurrentItem:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  IMPlayerItem *currentItem;
  NSObject *v9;
  void *v10;
  IMPlayerItem *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  IMPlayerItem *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v17 = v6;
    _os_log_impl(&dword_1DA478000, v5, OS_LOG_TYPE_INFO, "setCurrentItem trace: %@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    currentItem = self->_currentItem;
    *(_DWORD *)buf = 138412546;
    v17 = v4;
    v18 = 2112;
    v19 = currentItem;
    _os_log_impl(&dword_1DA478000, v7, OS_LOG_TYPE_DEFAULT, "setCurrentItem: %@, old: %@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMPlayerItem title](self->_currentItem, "title");
    v11 = (IMPlayerItem *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v17 = v10;
    v18 = 2112;
    v19 = v11;
    _os_log_impl(&dword_1DA478000, v9, OS_LOG_TYPE_DEFAULT, "setCurrentItemTitle: %@, old: %@", buf, 0x16u);

  }
  v12 = (void *)objc_opt_class();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __29__IMAVPlayer_setCurrentItem___block_invoke;
  v14[3] = &unk_1EA0C5098;
  v14[4] = self;
  v15 = v4;
  v13 = v4;
  objc_msgSend(v12, "performOnMainQueue:", v14);

}

void __26__IMAVPlayer_sharedPlayer__block_invoke()
{
  IMAVPlayer *v0;
  void *v1;

  v0 = objc_alloc_init(IMAVPlayer);
  v1 = (void *)_IMAVPlayer;
  _IMAVPlayer = (uint64_t)v0;

}

- (IMAVPlayer)init
{
  return -[IMAVPlayer initWithCommandCenter:infoCenter:audioSession:](self, "initWithCommandCenter:infoCenter:audioSession:", 0, 0, 0);
}

- (IMAVPlayer)initWithCommandCenter:(id)a3 infoCenter:(id)a4 audioSession:(id)a5
{
  id v8;
  id v9;
  id v10;
  IMAVPlayer *v11;
  IMAVPlayer *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  IMAVPlayerVideoViewController *v22;
  void *v23;
  _QWORD v25[4];
  IMAVPlayer *v26;
  objc_super v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v27.receiver = self;
  v27.super_class = (Class)IMAVPlayer;
  v11 = -[IMAVPlayer init](&v27, sel_init);
  v12 = v11;
  if (!v11)
    goto LABEL_13;
  v11->_loops = 0;
  v11->_state = 0;
  if (v10)
  {
    -[IMAVPlayer setAudioSession:](v11, "setAudioSession:", v10);
    if (v9)
      goto LABEL_4;
LABEL_7:
    v14 = objc_alloc(MEMORY[0x1E0CC24A8]);
    objc_msgSend((id)objc_opt_class(), "playerID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithPlayerID:", v15);
    -[IMAVPlayer setInfoCenter:](v12, "setInfoCenter:", v16);

    if (v8)
      goto LABEL_5;
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMAVPlayer setAudioSession:](v12, "setAudioSession:", v13);

  if (!v9)
    goto LABEL_7;
LABEL_4:
  -[IMAVPlayer setInfoCenter:](v12, "setInfoCenter:", v9);
  if (v8)
  {
LABEL_5:
    -[IMAVPlayer setCommandCenter:](v12, "setCommandCenter:", v8);
    goto LABEL_9;
  }
LABEL_8:
  v17 = objc_alloc(MEMORY[0x1E0CC24D0]);
  objc_msgSend((id)objc_opt_class(), "playerID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v17, "initWithPlayerID:", v18);
  -[IMAVPlayer setCommandCenter:](v12, "setCommandCenter:", v19);

LABEL_9:
  -[IMAVPlayer infoCenter](v12, "infoCenter");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setPlaybackState:", 2);

  -[IMAVPlayer setChapterMetadataMode:](v12, "setChapterMetadataMode:", 0);
  LODWORD(v21) = 0;
  -[IMAVPlayer setScanRate:](v12, "setScanRate:", v21);
  if (objc_msgSend(MEMORY[0x1E0D7F278], "platformSupportsVideo"))
  {
    v12->_videoScale = 0;
    -[IMAVPlayer setProvidesVideoView:](v12, "setProvidesVideoView:", objc_msgSend(MEMORY[0x1E0D7F278], "isRunningOnTV") ^ 1);
    if ((os_feature_enabled_red_sun() & 1) == 0)
    {
      v22 = -[IMAVPlayerVideoViewController initWithPlayer:]([IMAVPlayerVideoViewController alloc], "initWithPlayer:", v12);
      -[IMAVPlayer setVideoViewController:](v12, "setVideoViewController:", v22);

    }
  }
  v23 = (void *)objc_opt_class();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __60__IMAVPlayer_initWithCommandCenter_infoCenter_audioSession___block_invoke;
  v25[3] = &unk_1EA0C4FB0;
  v26 = v12;
  objc_msgSend(v23, "performOnMainQueue:", v25);

LABEL_13:
  return v12;
}

+ (id)playerID
{
  if (os_feature_enabled_bluemoon())
    return CFSTR("Podcasts-Legacy");
  else
    return CFSTR("Podcasts");
}

- (void)setChapterMetadataMode:(unint64_t)a3
{
  self->_chapterMetadataMode = a3;
}

- (void)setScanRate:(float)a3
{
  self->_scanRate = a3;
}

- (void)setProvidesVideoView:(BOOL)a3
{
  self->_providesVideoView = a3;
}

- (void)setInfoCenter:(id)a3
{
  objc_storeStrong((id *)&self->_infoCenter, a3);
}

- (void)setCommandCenter:(id)a3
{
  objc_storeStrong((id *)&self->_commandCenter, a3);
}

- (void)setAudioSession:(id)a3
{
  objc_storeStrong((id *)&self->_audioSession, a3);
}

- (void)setPlaybackSpeed:(unint64_t)a3
{
  unint64_t playbackSpeed;
  void *v6;
  int v7;
  int v8;
  void *v9;
  double v10;

  playbackSpeed = self->_playbackSpeed;
  self->_playbackSpeed = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInteger:forKey:", a3, CFSTR("IMAVPlayerPlaybackSpeedUserDefaultKey"));

  if (-[IMAVPlayer wasInterrupted](self, "wasInterrupted"))
  {
    -[IMAVPlayer play](self, "play");
  }
  else
  {
    -[IMAVPlayer updateRateForCurrentState](self, "updateRateForCurrentState");
    if (playbackSpeed != a3 && !-[IMAVPlayer state](self, "state"))
      -[IMAVPlayer updateNowPlayingDurationSnapshot](self, "updateNowPlayingDurationSnapshot");
  }
  objc_msgSend((id)objc_opt_class(), "rateForPlaybackSpeed:", a3);
  v8 = v7;
  -[IMAVPlayer player](self, "player");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = v8;
  objc_msgSend(v9, "setDefaultRate:", v10);

  -[IMAVPlayer _postNotificationName:userInfo:](self, "_postNotificationName:userInfo:", CFSTR("IMAVPlayerNotification_PlaybackSpeedChanged"), 0);
}

- (void)setVolume:(float)a3
{
  float v3;
  double v4;
  void *v5;
  double v6;
  id v7;

  if (a3 >= 1.0)
  {
    if (a3 > 1.0)
      a3 = 1.0;
    if (a3 >= 0.0)
      v3 = a3;
    else
      v3 = 0.0;
    *(float *)&v4 = v3;
    -[AVPlayer setVolume:](self->_player, "setVolume:", v4);
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v6 = v3;
    objc_msgSend(v5, "setFloat:forKey:", CFSTR("IMAVPlayerVolumeUserDefaultKey"), v6);

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBool:forKey:", 1, CFSTR("IMAVPlayerHasStoredVolumeDefaultKey"));

  }
}

- (void)_updatePlayerTimeCompleted:(double)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  NSObject *v7;
  double currentTime;
  void *v9;
  void *v10;
  Float64 Seconds;
  double v12;
  dispatch_time_t v13;
  _QWORD block[5];
  void (**v15)(_QWORD);
  CMTime time;
  uint8_t buf[4];
  double v18;
  __int16 v19;
  double v20;
  __int16 v21;
  Float64 v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(_QWORD))a4;
  objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    currentTime = self->_currentTime;
    -[IMAVPlayer playerItem](self, "playerItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
      objc_msgSend(v9, "currentTime");
    else
      memset(&time, 0, sizeof(time));
    Seconds = CMTimeGetSeconds(&time);
    *(_DWORD *)buf = 134218496;
    v18 = a3;
    v19 = 2048;
    v20 = currentTime;
    v21 = 2048;
    v22 = Seconds;
    _os_log_impl(&dword_1DA478000, v7, OS_LOG_TYPE_DEFAULT, "_updatePlayerTimeCompleted set time %f, currentTime %f, playerTime: %f", buf, 0x20u);

  }
  if (vabdd_f64(self->_currentTime, a3) >= 1.0)
  {
    v13 = dispatch_time(0, 500000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__IMAVPlayer__updatePlayerTimeCompleted_completion___block_invoke;
    block[3] = &unk_1EA0C5048;
    block[4] = self;
    v15 = v6;
    dispatch_after(v13, MEMORY[0x1E0C80D38], block);

  }
  else
  {
    -[IMAVPlayer setIsUpdatingCurrentTime:](self, "setIsUpdatingCurrentTime:", 0);
    -[IMAVPlayer forceTriggerTimeObserverAt:](self, "forceTriggerTimeObserverAt:", a3);
    if (!-[IMAVPlayer isPlaybackActive](self, "isPlaybackActive"))
    {
      -[IMAVPlayer duration](self, "duration");
      -[IMAVPlayer sendPeriodicTimeEvent:duration:finished:](self, "sendPeriodicTimeEvent:duration:finished:", 0, a3, v12);
    }
    if (v6)
      v6[2](v6);
  }

}

- (BOOL)isPlaybackActive
{
  float v2;

  -[IMAVPlayer actualRate](self, "actualRate");
  return v2 > 0.00000011921;
}

- (float)actualRate
{
  float result;

  if (-[AVPlayer timeControlStatus](self->_player, "timeControlStatus") != AVPlayerTimeControlStatusPlaying)
    return 0.0;
  -[AVPlayer rate](self->_player, "rate");
  return result;
}

- (void)setCurrentTime:(double)a3 fromMediaRemote:(BOOL)a4
{
  _BOOL8 v4;
  NSObject *v7;
  double v8;
  double v9;
  double v10;
  double currentTime;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[3];
  _QWORD v21[3];
  uint8_t buf[4];
  double v23;
  __int16 v24;
  _BOOL4 v25;
  uint64_t v26;

  v4 = a4;
  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v23 = a3;
    v24 = 1024;
    v25 = v4;
    _os_log_impl(&dword_1DA478000, v7, OS_LOG_TYPE_DEFAULT, "setCurrentTime %f fromMediaRemote %d", buf, 0x12u);
  }

  v8 = 0.0;
  if (a3 >= 0.0)
  {
    if (-[IMAVPlayer isDurationReady](self, "isDurationReady"))
    {
      -[IMAVPlayer duration](self, "duration");
      v8 = a3;
      if (v9 < a3)
      {
        -[IMAVPlayer duration](self, "duration");
        v8 = v10;
      }
    }
    else
    {
      v8 = a3;
    }
  }
  v20[0] = CFSTR("IMAVPlayerNotificationKey_OldPlayheadTime");
  currentTime = self->_currentTime;
  *(float *)&currentTime = currentTime;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", currentTime, CFSTR("IMAVPlayerNotificationKey_OldPlayheadTime"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v12;
  v20[1] = CFSTR("IMAVPlayerNotificationKey_NewPlayheadTime");
  *(float *)&v13 = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v14;
  v20[2] = CFSTR("IMAVPlayerNotificationKey_FromMediaRemote");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "mutableCopy");

  -[IMAVPlayer currentItem](self, "currentItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[IMAVPlayer currentItem](self, "currentItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", v19, CFSTR("IMAVPlayerNotificationKey_CurrentMediaItem"));

  }
  -[IMAVPlayer _postNotificationName:userInfo:](self, "_postNotificationName:userInfo:", CFSTR("IMAVPlayerNotification_PlayerHeadWillChange"), v17);
  self->_currentTime = v8;
  if (!-[IMAVPlayer isUpdatingCurrentTime](self, "isUpdatingCurrentTime"))
  {
    -[IMAVPlayer setIsUpdatingCurrentTime:](self, "setIsUpdatingCurrentTime:", 1);
    -[IMAVPlayer _updatePlayerToCurrentTime:](self, "_updatePlayerToCurrentTime:", 0);
  }
  -[IMAVPlayer _postNotificationName:userInfo:](self, "_postNotificationName:userInfo:", CFSTR("IMAVPlayerNotification_PlayerHeadDidChange"), v17);

}

- (void)setIsUpdatingCurrentTime:(BOOL)a3
{
  self->_isUpdatingCurrentTime = a3;
}

- (BOOL)isUpdatingCurrentTime
{
  return self->_isUpdatingCurrentTime;
}

+ (float)rateForPlaybackSpeed:(unint64_t)a3
{
  float result;

  result = 0.0;
  if (a3 <= 5)
    return flt_1DA676F18[a3];
  return result;
}

- (void)sendPeriodicTimeEvent:(double)a3 duration:(double)a4 finished:(BOOL)a5
{
  _BOOL8 v5;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  Float64 Seconds;
  double currentTime;
  id WeakRetained;
  __int16 delegateFlags;
  id v18;
  double v19;
  void *v20;
  CMTime time;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  double v25;
  __int16 v26;
  double v27;
  __int16 v28;
  Float64 v29;
  __int16 v30;
  double v31;
  uint64_t v32;

  v5 = a5;
  v32 = *MEMORY[0x1E0C80C00];
  if (!-[IMAVPlayer isUpdatingCurrentTime](self, "isUpdatingCurrentTime"))
  {
    objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      -[IMAVPlayer currentItem](self, "currentItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "title");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMAVPlayer player](self, "player");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
        objc_msgSend(v12, "currentTime");
      else
        memset(&time, 0, sizeof(time));
      Seconds = CMTimeGetSeconds(&time);
      currentTime = self->_currentTime;
      *(_DWORD *)buf = 138413314;
      v23 = v11;
      v24 = 2048;
      v25 = a3;
      v26 = 2048;
      v27 = a4;
      v28 = 2048;
      v29 = Seconds;
      v30 = 2048;
      v31 = currentTime;
      _os_log_impl(&dword_1DA478000, v9, OS_LOG_TYPE_INFO, "sendPeriodicTimeEvent for episode: %@, time: %f, duration: %f, playerTime: %f, storedTime: %f", buf, 0x34u);

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      delegateFlags = (__int16)self->_delegateFlags;

      if ((delegateFlags & 0x20) != 0)
      {
        v18 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v18, "playerPeriodicUpdate:elapsed:duration:isFinished:", self, v5, a3, a4);

      }
    }
    -[IMAVPlayer autoStopMediaTime](self, "autoStopMediaTime");
    if (a3 + -2.0 >= v19)
      -[IMAVPlayer enforceAutoStopForMode:](self, "enforceAutoStopForMode:", 4);
    self->_currentTime = a3;
    -[IMAVPlayer currentItem](self, "currentItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setPlayhead:", a3);

    -[IMAVPlayer _postNotificationName:userInfo:](self, "_postNotificationName:userInfo:", CFSTR("IMAVPlayerNotification_PeriodicUpdate"), 0);
  }
}

- (BOOL)isDurationReady
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[IMAVPlayer currentItem](self, "currentItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isAssetLoaded"))
  {
    -[IMAVPlayer currentItem](self, "currentItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "asset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "statusOfValueForKey:error:", CFSTR("duration"), 0) == 2;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (double)autoStopMediaTime
{
  return self->_autoStopMediaTime;
}

- (void)_updatePlayerToCurrentTime:(id)a3
{
  id v4;
  void *v5;
  double currentTime;
  void *v7;
  void *v8;
  double Seconds;
  NSObject *v10;
  void *v11;
  __int128 v12;
  uint64_t v13;
  _QWORD v14[5];
  id v15;
  double v16;
  CMTime v17;
  CMTime time;
  _BYTE buf[24];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IMAVPlayer playerItem](self, "playerItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  currentTime = self->_currentTime;
  if (v5)
  {
    -[IMAVPlayer playerItem](self, "playerItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      objc_msgSend(v7, "currentTime");
    else
      memset(&time, 0, sizeof(time));
    Seconds = CMTimeGetSeconds(&time);

    if (vabdd_f64(Seconds, currentTime) <= 0.5)
    {
      -[IMAVPlayer _updatePlayerTimeCompleted:completion:](self, "_updatePlayerTimeCompleted:completion:", v4, currentTime);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        *(double *)&buf[4] = currentTime;
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = Seconds;
        _os_log_impl(&dword_1DA478000, v10, OS_LOG_TYPE_DEFAULT, "_updatePlayerToTime: %f currentTime: %f", buf, 0x16u);
      }

      -[IMAVPlayer playerItem](self, "playerItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      CMTimeMakeWithSeconds(&v17, currentTime, 1000000000);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __41__IMAVPlayer__updatePlayerToCurrentTime___block_invoke;
      v14[3] = &unk_1EA0C51F8;
      v16 = currentTime;
      v14[4] = self;
      v15 = v4;
      *(_OWORD *)buf = *MEMORY[0x1E0CA2E68];
      *(_QWORD *)&buf[16] = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
      v12 = *(_OWORD *)buf;
      v13 = *(_QWORD *)&buf[16];
      objc_msgSend(v11, "seekToTime:toleranceBefore:toleranceAfter:completionHandler:", &v17, buf, &v12, v14);

    }
  }
  else
  {
    -[IMAVPlayer _updatePlayerTimeCompleted:completion:](self, "_updatePlayerTimeCompleted:completion:", v4, self->_currentTime);
    -[IMAVPlayer updateNowPlayingDurationSnapshot](self, "updateNowPlayingDurationSnapshot");
  }

}

- (void)sendDurationLoadedCoreAnalyticsEvents
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  id v19;

  v19 = (id)objc_opt_new();
  -[IMAVPlayer currentItem](self, "currentItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "paidSubscriptionActive");

  if ((v4 & 1) == 0)
  {
    v5 = (void *)MEMORY[0x1E0D7F270];
    -[IMAVPlayer currentItem](self, "currentItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "episodeStoreId");
    -[IMAVPlayer currentItem](self, "currentItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "duration");
    objc_msgSend(v5, "episodeDurationComparisonWithEpisodeAdamId:duration:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "sendEvent:", v9);

  }
  -[IMAVPlayer currentItem](self, "currentItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "playhead");
  if (v11 != 0.0)
    goto LABEL_6;
  -[IMAVPlayer currentItem](self, "currentItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "playCount");

  if (!v13)
  {
    v14 = (void *)MEMORY[0x1E0D7F270];
    -[IMAVPlayer durationBeforeItemLoaded](self, "durationBeforeItemLoaded");
    v16 = v15;
    -[IMAVPlayer currentItem](self, "currentItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "duration");
    objc_msgSend(v14, "episodeDurationComparisonWithMapiProvidedDuration:playerItemDuration:", v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "sendEvent:", v18);

LABEL_6:
  }

}

- (void)setupChapterTimeObservers
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  -[IMAVPlayer _assertMainThread](self, "_assertMainThread");
  -[IMAVPlayer removeAllTimeObservers](self, "removeAllTimeObservers");
  -[IMAVPlayer currentItem](self, "currentItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "chapters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = 0;
    do
    {
      -[IMAVPlayer currentItem](self, "currentItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "chapters");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndex:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(v9, "assetTimeRange");
      }
      else
      {
        v14 = 0u;
        v15 = 0u;
        v13 = 0u;
      }
      v16 = v13;
      v17 = v14;
      -[IMAVPlayer addCMTimeObserver:](self, "addCMTimeObserver:", &v16, v13, v14, v15);

      ++v6;
      -[IMAVPlayer currentItem](self, "currentItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "chapters");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

    }
    while (v6 < v12);
  }
  -[IMAVPlayer updateTimeObservers](self, "updateTimeObservers");
}

- (void)addCMTimeObserver:(id *)a3
{
  NSMutableArray *v5;
  NSMutableArray *observingTimes;
  void *v7;
  __int128 v8;
  int64_t var3;

  if ((a3->var2 & 1) != 0)
  {
    if (!self->_observingTimes)
    {
      v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      observingTimes = self->_observingTimes;
      self->_observingTimes = v5;

    }
    v8 = *(_OWORD *)&a3->var0;
    var3 = a3->var3;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCMTime:", &v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](self->_observingTimes, "addObject:", v7);
    self->_timeObserverNeedsUpdate = 1;

  }
}

- (void)setupChapterAtTime:(double)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  double Seconds;
  double v13;
  void *v15;
  void *v16;
  uint64_t v17;
  void (**v18)(_QWORD);
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  _QWORD v24[5];
  id v25;
  __int128 v26;
  _OWORD v27[2];
  CMTime v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  CMTime time;

  if (!-[IMAVPlayer scrubbing](self, "scrubbing"))
  {
    -[IMAVPlayer currentItem](self, "currentItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "chapters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      v8 = 0;
      do
      {
        -[IMAVPlayer currentItem](self, "currentItem");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "chapters");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectAtIndex:", v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v11, "assetTimeRange");
          *(_OWORD *)&time.value = v29;
          time.epoch = v30;
          Seconds = CMTimeGetSeconds(&time);
          objc_msgSend(v11, "assetTimeRange");
        }
        else
        {
          v30 = 0u;
          v31 = 0u;
          v29 = 0u;
          memset(&time, 0, sizeof(time));
          Seconds = CMTimeGetSeconds(&time);
          v26 = 0u;
          memset(v27, 0, sizeof(v27));
        }
        v28 = *(CMTime *)((char *)v27 + 8);
        v13 = Seconds + CMTimeGetSeconds(&v28);
        if (Seconds + -0.001 < a3 && v13 > a3)
        {
          if (!objc_msgSend(v11, "type", v13, Seconds + -0.001))
          {
            -[IMAVPlayer currentItem](self, "currentItem");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "timeChapters");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "indexOfObject:", v11);

            if (v17 != 0x7FFFFFFFFFFFFFFFLL)
              -[IMAVPlayer _setChapterIndex:](self, "_setChapterIndex:", v17);
            -[IMAVPlayer updateNowPlayingMetadataIncludingArtwork:](self, "updateNowPlayingMetadataIncludingArtwork:", 1);
          }
          if ((*(_WORD *)&self->_delegateFlags & 0x400) != 0)
          {
            v24[0] = MEMORY[0x1E0C809B0];
            v24[1] = 3221225472;
            v24[2] = __33__IMAVPlayer_setupChapterAtTime___block_invoke;
            v24[3] = &unk_1EA0C5098;
            v24[4] = self;
            v25 = v11;
            v18 = (void (**)(_QWORD))_Block_copy(v24);
            objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3978], "mainThread");
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (v19 == v20)
              v18[2](v18);
            else
              dispatch_sync(MEMORY[0x1E0C80D38], v18);

          }
        }

        ++v8;
        -[IMAVPlayer currentItem](self, "currentItem");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "chapters");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "count");

      }
      while (v8 < v23);
    }
  }
}

- (IMPlayerItem)currentItem
{
  return self->_currentItem;
}

- (BOOL)scrubbing
{
  return self->_scrubbing;
}

- (void)updateNowPlayingMetadataIncludingArtwork:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unint64_t currentChapterIndex;
  void *v15;
  void *v16;
  unint64_t v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;

  v3 = a3;
  -[IMAVPlayer currentItem](self, "currentItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return;
  -[IMAVPlayer currentItem](self, "currentItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMAVPlayer currentItem](self, "currentItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "album");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = v7;
  v10 = v9;
  -[IMAVPlayer currentItem](self, "currentItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeChapters");
  v12 = objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v18 = v10;
    v19 = v34;
LABEL_15:

    goto LABEL_16;
  }
  v13 = (void *)v12;
  currentChapterIndex = self->_currentChapterIndex;
  -[IMAVPlayer currentItem](self, "currentItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "timeChapters");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  v18 = v10;
  v19 = v34;
  if (currentChapterIndex < v17)
  {
    -[IMAVPlayer currentItem](self, "currentItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "timeChapters");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectAtIndexedSubscript:", self->_currentChapterIndex);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "title");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[IMAVPlayer currentItem](self, "currentItem");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "title");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = v10;
    v19 = v34;
    if (objc_msgSend(v11, "length"))
    {
      v25 = -[IMAVPlayer chapterMetadataMode](self, "chapterMetadataMode");
      v26 = objc_msgSend(v24, "length");
      if (v25 == 1)
      {
        v19 = v34;
        if (v26)
        {
          v19 = v24;

        }
        v18 = v11;
        v27 = v10;
        goto LABEL_13;
      }
      v18 = v10;
      v19 = v34;
      if (v26)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ - %@"), v11, v24);
        v19 = (id)objc_claimAutoreleasedReturnValue();
        v27 = v34;
        v18 = v10;
LABEL_13:

      }
    }

    goto LABEL_15;
  }
LABEL_16:
  -[IMAVPlayer currentItem](self, "currentItem");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "contentItem");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-%lu"), -[IMAVPlayer currentChapterIndex](self, "currentChapterIndex"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMAVPlayer currentItem](self, "currentItem");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "artworkIdentifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "stringByAppendingString:", v30);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v29, "setArtworkIdentifier:", v33);
    objc_msgSend(v29, "invalidateArtwork");

  }
  objc_msgSend(v29, "setTitle:", v19);
  objc_msgSend(v29, "setAlbumName:", v18);

}

- (unint64_t)currentChapterIndex
{
  return self->_currentChapterIndex;
}

- (unint64_t)chapterMetadataMode
{
  return self->_chapterMetadataMode;
}

- (void)_setChapterIndex:(unint64_t)a3
{
  if (self->_currentChapterIndex < a3)
    -[IMAVPlayer enforceAutoStopForMode:](self, "enforceAutoStopForMode:", 2);
  self->_currentChapterIndex = a3;
  -[IMAVPlayer _postNotificationName:userInfo:](self, "_postNotificationName:userInfo:", CFSTR("IMAVPlayerNotification_CurrentChapterDidChange"), 0);
}

- (double)durationBeforeItemLoaded
{
  return self->_durationBeforeItemLoaded;
}

- (void)_createPlayer
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C8B2E8]);
  -[IMAVPlayer setPlayer:](self, "setPlayer:", v3);

  -[IMAVPlayer audioSession](self, "audioSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[IMAVPlayer audioSession](self, "audioSession");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMAVPlayer player](self, "player");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAudioSession:", v5);

  }
  -[IMAVPlayer player](self, "player");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActionAtItemEnd:", 2);

}

- (void)setPlayer:(id)a3
{
  AVPlayer *v5;
  AVPlayer *player;
  AVPlayer *v7;

  v5 = (AVPlayer *)a3;
  if (self->_player != v5)
  {
    v7 = v5;
    -[IMAVPlayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("player"));
    if (self->_player)
    {
      -[IMAVPlayer stopObservingPlayer:](self, "stopObservingPlayer:");
      -[IMAVPlayer setPlayerItem:](self, "setPlayerItem:", 0);
    }
    -[IMAVPlayer removePeriodicTimeObservers](self, "removePeriodicTimeObservers");
    -[IMAVPlayer clearTimeObservers](self, "clearTimeObservers");
    objc_storeStrong((id *)&self->_player, a3);
    player = self->_player;
    if (player)
    {
      -[AVPlayer setAppliesMediaSelectionCriteriaAutomatically:](player, "setAppliesMediaSelectionCriteriaAutomatically:", 1);
      -[AVPlayer setAudiovisualBackgroundPlaybackPolicy:](self->_player, "setAudiovisualBackgroundPlaybackPolicy:", 3);
      if (objc_msgSend(MEMORY[0x1E0D7F278], "platformSupportsVideo"))
        -[AVPlayer addObserver:forKeyPath:options:context:](self->_player, "addObserver:forKeyPath:options:context:", self, CFSTR("externalPlaybackActive"), 4, 0);
      -[AVPlayer addObserver:forKeyPath:options:context:](self->_player, "addObserver:forKeyPath:options:context:", self, CFSTR("currentItem"), 6, 0);
      -[AVPlayer addObserver:forKeyPath:options:context:](self->_player, "addObserver:forKeyPath:options:context:", self, CFSTR("rate"), 6, 0);
      -[AVPlayer addObserver:forKeyPath:options:context:](self->_player, "addObserver:forKeyPath:options:context:", self, CFSTR("timeControlStatus"), 6, 0);
      -[AVPlayer addObserver:forKeyPath:options:context:](self->_player, "addObserver:forKeyPath:options:context:", self, CFSTR("volume"), 6, 0);
    }
    -[IMAVPlayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("player"));
    v5 = v7;
  }

}

- (void)removeAllTimeObservers
{
  NSMutableArray *observingTimes;

  -[IMAVPlayer clearTimeObservers](self, "clearTimeObservers");
  -[NSMutableArray removeAllObjects](self->_observingTimes, "removeAllObjects");
  observingTimes = self->_observingTimes;
  self->_observingTimes = 0;

}

- (void)clearTimeObservers
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSMutableArray *timeObservers;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_timeObservers;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        -[AVPlayer removeTimeObserver:](self->_player, "removeTimeObserver:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7++), (_QWORD)v9);
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  -[NSMutableArray removeAllObjects](self->_timeObservers, "removeAllObjects");
  timeObservers = self->_timeObservers;
  self->_timeObservers = 0;

}

- (void)addPeriodicTimeObservers
{
  void *v3;
  AVPlayer *player;
  void *v5;
  void *v6;
  AVPlayer *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  CMTime v11;
  _QWORD v12[4];
  id v13;
  CMTime v14;
  id location;

  if (self->_player)
  {
    objc_initWeak(&location, self);
    -[IMAVPlayer periodicTimeObserver](self, "periodicTimeObserver");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      player = self->_player;
      CMTimeMakeWithSeconds(&v14, 1.0, 1000000000);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __38__IMAVPlayer_addPeriodicTimeObservers__block_invoke;
      v12[3] = &unk_1EA0C5220;
      objc_copyWeak(&v13, &location);
      -[AVPlayer addPeriodicTimeObserverForInterval:queue:usingBlock:](player, "addPeriodicTimeObserverForInterval:queue:usingBlock:", &v14, 0, v12);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMAVPlayer setPeriodicTimeObserver:](self, "setPeriodicTimeObserver:", v5);

      objc_destroyWeak(&v13);
    }
    -[IMAVPlayer nowPlayingInfoPeriodicTimeObserver](self, "nowPlayingInfoPeriodicTimeObserver");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v7 = self->_player;
      CMTimeMakeWithSeconds(&v11, 10.0, 1000000000);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __38__IMAVPlayer_addPeriodicTimeObservers__block_invoke_2;
      v9[3] = &unk_1EA0C5220;
      objc_copyWeak(&v10, &location);
      -[AVPlayer addPeriodicTimeObserverForInterval:queue:usingBlock:](v7, "addPeriodicTimeObserverForInterval:queue:usingBlock:", &v11, 0, v9);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMAVPlayer setNowPlayingInfoPeriodicTimeObserver:](self, "setNowPlayingInfoPeriodicTimeObserver:", v8);

      objc_destroyWeak(&v10);
    }
    objc_destroyWeak(&location);
  }
}

- (void)removePeriodicTimeObservers
{
  void *v3;
  AVPlayer *player;
  void *v5;
  void *v6;
  AVPlayer *v7;
  void *v8;

  -[IMAVPlayer periodicTimeObserver](self, "periodicTimeObserver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    player = self->_player;
    -[IMAVPlayer periodicTimeObserver](self, "periodicTimeObserver");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlayer removeTimeObserver:](player, "removeTimeObserver:", v5);

    -[IMAVPlayer setPeriodicTimeObserver:](self, "setPeriodicTimeObserver:", 0);
  }
  -[IMAVPlayer nowPlayingInfoPeriodicTimeObserver](self, "nowPlayingInfoPeriodicTimeObserver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = self->_player;
    -[IMAVPlayer nowPlayingInfoPeriodicTimeObserver](self, "nowPlayingInfoPeriodicTimeObserver");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlayer removeTimeObserver:](v7, "removeTimeObserver:", v8);

    -[IMAVPlayer setNowPlayingInfoPeriodicTimeObserver:](self, "setNowPlayingInfoPeriodicTimeObserver:", 0);
  }
}

- (id)periodicTimeObserver
{
  return self->_periodicTimeObserver;
}

- (id)nowPlayingInfoPeriodicTimeObserver
{
  return self->_nowPlayingInfoPeriodicTimeObserver;
}

- (void)setPeriodicTimeObserver:(id)a3
{
  objc_storeStrong(&self->_periodicTimeObserver, a3);
}

- (void)setNowPlayingInfoPeriodicTimeObserver:(id)a3
{
  objc_storeStrong(&self->_nowPlayingInfoPeriodicTimeObserver, a3);
}

- (void)_updatePlayerForCurrentItem
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  AVPlayer *player;
  void *v21;
  _QWORD v22[5];
  _QWORD v23[5];
  id v24;
  char v25;
  id buf[2];

  objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1DA478000, v3, OS_LOG_TYPE_DEFAULT, "updatePlayerForCurrentItem", (uint8_t *)buf, 2u);
  }

  -[IMAVPlayer setIsUpdatingCurrentTime:](self, "setIsUpdatingCurrentTime:", 0);
  -[IMAVPlayer removePeriodicTimeObservers](self, "removePeriodicTimeObservers");
  -[IMAVPlayer removeAllTimeObservers](self, "removeAllTimeObservers");
  -[IMAVPlayer currentItem](self, "currentItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[IMAVPlayer currentItem](self, "currentItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isVideo");

    -[AVPlayer setAllowsExternalPlayback:](self->_player, "setAllowsExternalPlayback:", v6);
    -[AVPlayer setUsesExternalPlaybackWhileExternalScreenIsActive:](self->_player, "setUsesExternalPlaybackWhileExternalScreenIsActive:", v6);
    objc_initWeak(buf, self);
    if (objc_msgSend(MEMORY[0x1E0D7F278], "platformSupportsVideo")
      && -[IMAVPlayer providesVideoView](self, "providesVideoView"))
    {
      v7 = (void *)objc_opt_class();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __41__IMAVPlayer__updatePlayerForCurrentItem__block_invoke;
      v23[3] = &unk_1EA0C50C0;
      v23[4] = self;
      v25 = v6;
      objc_copyWeak(&v24, buf);
      objc_msgSend(v7, "performOnMainQueue:", v23);
      objc_destroyWeak(&v24);
    }
    v8 = (void *)MEMORY[0x1E0C8B300];
    -[IMAVPlayer currentItem](self, "currentItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "asset");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "playerItemWithAsset:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMAVPlayer setPlayerItem:](self, "setPlayerItem:", v11);

    -[IMAVPlayer playerItem](self, "playerItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAudioTimePitchAlgorithm:", *MEMORY[0x1E0C89F08]);

    -[IMAVPlayer playerItem](self, "playerItem");
    if ((_DWORD)v6)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setAllowedAudioSpatializationFormats:", 7);
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setAllowedAudioSpatializationFormats:", 4);
    }

    -[IMAVPlayer currentItem](self, "currentItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "playhead");
    -[IMAVPlayer setCurrentTime:](self, "setCurrentTime:");

    -[IMAVPlayer playerItem](self, "playerItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setPreferredForwardBufferDuration:", 0.0);

    -[IMAVPlayer playerItem](self, "playerItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setPlaybackLikelyToKeepUpTrigger:", 1);

    -[IMAVPlayer currentItem](self, "currentItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isPlayable");

    if ((v18 & 1) == 0 && -[IMAVPlayer isPlaybackRequested](self, "isPlaybackRequested"))
    {
      v19 = (void *)objc_opt_class();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __41__IMAVPlayer__updatePlayerForCurrentItem__block_invoke_2;
      v22[3] = &unk_1EA0C4FB0;
      v22[4] = self;
      objc_msgSend(v19, "performOnMainQueue:", v22);
    }
    objc_destroyWeak(buf);
  }
  else
  {
    -[IMAVPlayer setPlayerItem:](self, "setPlayerItem:", 0);
    if (-[IMAVPlayer autoStop](self, "autoStop"))
      -[IMAVPlayer enforceAutoStopForMode:](self, "enforceAutoStopForMode:", -[IMAVPlayer autoStop](self, "autoStop"));
    -[IMAVPlayer _pause](self, "_pause");
  }
  player = self->_player;
  -[IMAVPlayer playerItem](self, "playerItem");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlayer replaceCurrentItemWithPlayerItem:](player, "replaceCurrentItemWithPlayerItem:", v21);

  -[IMAVPlayer addPeriodicTimeObservers](self, "addPeriodicTimeObservers");
  -[IMAVPlayer updateRateForCurrentState](self, "updateRateForCurrentState");
  -[IMAVPlayer updateNowPlayingDurationSnapshot](self, "updateNowPlayingDurationSnapshot");
}

- (void)updateRateForCurrentState
{
  -[IMAVPlayer updateRateForCurrentState:](self, "updateRateForCurrentState:", 0);
}

- (void)updateRateForCurrentState:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__IMAVPlayer_updateRateForCurrentState___block_invoke;
  v7[3] = &unk_1EA0C5048;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performOnMainQueue:", v7);

}

void __60__IMAVPlayer_initWithCommandCenter_infoCenter_audioSession___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  objc_msgSend(*(id *)(a1 + 32), "_createPlayer");
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setPlaybackSpeed:", objc_msgSend(v2, "integerForKey:", CFSTR("IMAVPlayerPlaybackSpeedUserDefaultKey")));

  objc_msgSend(*(id *)(a1 + 32), "storedVolume");
  objc_msgSend(*(id *)(a1 + 32), "setVolume:");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v5 = *MEMORY[0x1E0C896F0];
  objc_msgSend(v4, "audioSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", v4, sel_handleAudioSessionInterruption_, v5, v6);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 32);
  v9 = *MEMORY[0x1E0C89870];
  objc_msgSend(v8, "audioSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", v8, sel_onRouteChange_, v9, v10);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_resetPlayer_, *MEMORY[0x1E0C89738], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_handlePlayerInterruption_, *MEMORY[0x1E0C8AC88], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_playerItemDidReachEnd_, *MEMORY[0x1E0C8AC48], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__failedToPlayToEndNotification_, *MEMORY[0x1E0C8AC58], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_onChaptersLoaded_, CFSTR("IMMediaItemDidLoadChaptersNotification"), 0);

}

- (void)_postNotificationName:(id)a3 userInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  IMAVPlayer *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_class();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __45__IMAVPlayer__postNotificationName_userInfo___block_invoke;
  v11[3] = &unk_1EA0C51D0;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "performOnMainQueue:", v11);

}

+ (void)performOnMainQueue:(id)a3
{
  void *v3;
  void (**block)(void);

  v3 = (void *)MEMORY[0x1E0CB3978];
  block = (void (**)(void))a3;
  if (objc_msgSend(v3, "isMainThread"))
    block[2]();
  else
    dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __45__IMAVPlayer__postNotificationName_userInfo___block_invoke(_QWORD *a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", a1[4], a1[5], a1[6]);

}

- (AVAudioSession)audioSession
{
  return self->_audioSession;
}

void __40__IMAVPlayer_updateRateForCurrentState___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  double v4;
  double v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA478000, v2, OS_LOG_TYPE_DEFAULT, "updateRateForCurrentState", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "cancelFadeOut");
  v3 = objc_msgSend(*(id *)(a1 + 32), "state");
  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "cancelSeek");
    objc_msgSend(*(id *)(a1 + 32), "endBackgroundTask");
    objc_msgSend(*(id *)(a1 + 32), "_pauseAutoStopTimer");
    LODWORD(v5) = 0;
    objc_msgSend(*(id *)(a1 + 32), "setRequestedRate:", v5);
LABEL_8:
    v6 = *(_QWORD *)(a1 + 40);
    if (v6)
      (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, 0);
    return;
  }
  if (v3 != 1)
  {
    if (v3 != 2)
      return;
    objc_msgSend(*(id *)(a1 + 32), "cancelSeek");
    objc_msgSend(*(id *)(a1 + 32), "endBackgroundTask");
    objc_msgSend(*(id *)(a1 + 32), "_pauseAutoStopTimer");
    LODWORD(v4) = 0;
    objc_msgSend(*(id *)(a1 + 32), "setRequestedRate:", v4);
    objc_msgSend(*(id *)(a1 + 32), "updateNowPlayingDurationSnapshot");
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA478000, v7, OS_LOG_TYPE_DEFAULT, "Activate session begin", buf, 2u);
  }

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __40__IMAVPlayer_updateRateForCurrentState___block_invoke_123;
  v9[3] = &unk_1EA0C50E8;
  v8 = *(void **)(a1 + 40);
  v10 = *(id *)(a1 + 32);
  v11 = v8;
  objc_msgSend(v10, "configureAudioSessionAndSetActive:withCompletion:", 1, v9);

}

- (void)setRequestedRate:(float)a3
{
  float v5;
  void *v6;
  float v7;
  float v8;
  NSObject *v9;
  void *v10;
  float v11;
  void *v12;
  double v13;
  int v14;
  double v15;
  __int16 v16;
  double v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (-[IMAVPlayer isScanning](self, "isScanning"))
  {
    -[IMAVPlayer scanRate](self, "scanRate");
    a3 = v5;
  }
  else if (self->_seekTimer && self->_seekForward)
  {
    a3 = 2.0;
  }
  -[IMAVPlayer player](self, "player");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rate");
  v8 = v7;

  if (v8 != a3)
  {
    objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[IMAVPlayer player](self, "player");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "rate");
      v14 = 134218240;
      v15 = a3;
      v16 = 2048;
      v17 = v11;
      _os_log_impl(&dword_1DA478000, v9, OS_LOG_TYPE_DEFAULT, "setRate: %f, old: %f", (uint8_t *)&v14, 0x16u);

    }
    -[IMAVPlayer player](self, "player");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v13 = a3;
    objc_msgSend(v12, "setRate:", v13);

  }
}

- (void)endBackgroundTask
{
  void *v3;
  NSObject *v4;
  uint8_t v5[8];
  _QWORD v6[5];

  if (self->_backgroundTask)
  {
    v3 = (void *)objc_opt_class();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __31__IMAVPlayer_endBackgroundTask__block_invoke;
    v6[3] = &unk_1EA0C4FB0;
    v6[4] = self;
    objc_msgSend(v3, "performOnMainQueue:", v6);
    objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1DA478000, v4, OS_LOG_TYPE_DEFAULT, "endBackgroundTask", v5, 2u);
    }

  }
}

- (void)cancelSeek
{
  NSTimer *seekTimer;

  -[NSTimer invalidate](self->_seekTimer, "invalidate");
  seekTimer = self->_seekTimer;
  self->_seekTimer = 0;

}

- (void)cancelFadeOut
{
  NSObject *fadeOutTimer;
  OS_dispatch_source *v4;

  fadeOutTimer = self->_fadeOutTimer;
  if (fadeOutTimer)
  {
    dispatch_source_cancel(fadeOutTimer);
    v4 = self->_fadeOutTimer;
    self->_fadeOutTimer = 0;

  }
}

- (void)_pauseAutoStopTimer
{
  NSObject *v3;
  double v4;
  uint8_t v5[16];

  objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1DA478000, v3, OS_LOG_TYPE_INFO, "_pauseAutoStopTimer", v5, 2u);
  }

  -[IMAVPlayer autoStopTimeRemaining](self, "autoStopTimeRemaining");
  -[IMAVPlayer setAutoStopTimerPausedTime:](self, "setAutoStopTimerPausedTime:", v4 + -2.0);
  -[IMAVPlayer _clearAutoStopTimmer](self, "_clearAutoStopTimmer");
}

- (void)setAutoStopTimerPausedTime:(double)a3
{
  self->_autoStopTimerPausedTime = a3;
}

- (double)autoStopTimeRemaining
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double result;

  switch(-[IMAVPlayer autoStop](self, "autoStop"))
  {
    case 1uLL:
      -[IMAVPlayer autoStopTimerPausedTime](self, "autoStopTimerPausedTime");
      if (v3 > 0.0)
      {
        -[IMAVPlayer autoStopTimerPausedTime](self, "autoStopTimerPausedTime");
        v5 = v4;
        return v5 + 2.0;
      }
      -[IMAVPlayer autoStopTimer](self, "autoStopTimer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        -[IMAVPlayer autoStopTimer](self, "autoStopTimer");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "fireDate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "timeIntervalSinceReferenceDate");
        v21 = v20;
        objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
        v5 = v21 - v22;

        return v5 + 2.0;
      }
      -[IMAVPlayer autoStopTimerTime](self, "autoStopTimerTime");
      return result;
    case 2uLL:
      -[IMAVPlayer currentChapter](self, "currentChapter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "time");
      v9 = v8;
      -[IMAVPlayer currentChapter](self, "currentChapter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "duration");
      v12 = v9 + v11;
      -[IMAVPlayer currentTime](self, "currentTime");
      v6 = v12 - v13;

      return v6;
    case 3uLL:
      -[IMAVPlayer duration](self, "duration");
      goto LABEL_8;
    case 4uLL:
      -[IMAVPlayer autoStopMediaTime](self, "autoStopMediaTime");
LABEL_8:
      v15 = v14;
      -[IMAVPlayer currentTime](self, "currentTime");
      return v15 - v16;
    default:
      return 0.0;
  }
}

- (unint64_t)autoStop
{
  return self->_autoStop;
}

- (void)_clearAutoStopTimmer
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  -[IMAVPlayer autoStopTimer](self, "autoStopTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1DA478000, v4, OS_LOG_TYPE_INFO, "_clearAutoStopTimmer", v6, 2u);
    }

    -[IMAVPlayer autoStopTimer](self, "autoStopTimer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidate");

    -[IMAVPlayer setAutoStopTimer:](self, "setAutoStopTimer:", 0);
  }
}

- (NSTimer)autoStopTimer
{
  return self->_autoStopTimer;
}

- (void)updateTimeObservers
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[IMAVPlayer _assertMainThread](self, "_assertMainThread");
  if (self->_timeObserverNeedsUpdate)
  {
    -[IMAVPlayer clearTimeObservers](self, "clearTimeObservers");
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v3 = self->_observingTimes;
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          -[IMAVPlayer setupTimeObserver:](self, "setupTimeObserver:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * i), (_QWORD)v8);
        }
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

    self->_timeObserverNeedsUpdate = 0;
    -[IMAVPlayer currentTime](self, "currentTime");
    -[IMAVPlayer forceTriggerTimeObserverAt:](self, "forceTriggerTimeObserverAt:");
  }
}

- (void)setupTimeObserver:(id)a3
{
  id v4;
  NSObject *v5;
  IMAVPlayer *v6;
  AVPlayer *player;
  void *v8;
  id v9;
  void *v10;
  NSMutableArray *timeObservers;
  NSMutableArray *v12;
  NSMutableArray **p_timeObservers;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  id v19;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  IMAVPlayer *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IMAVPlayer _assertMainThread](self, "_assertMainThread");
  objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_1DA478000, v5, OS_LOG_TYPE_INFO, "add BoundaryTimeObserver timeValue %@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  v6 = self;
  v25 = v6;
  player = v6->_player;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __32__IMAVPlayer_setupTimeObserver___block_invoke;
  v18 = &unk_1EA0C5248;
  p_buf = &buf;
  v9 = v4;
  v19 = v9;
  -[AVPlayer addBoundaryTimeObserverForTimes:queue:usingBlock:](player, "addBoundaryTimeObserverForTimes:queue:usingBlock:", v8, 0, &v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  timeObservers = v6->_timeObservers;
  if (!timeObservers)
  {
    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v14 = v6->_timeObservers;
    p_timeObservers = &v6->_timeObservers;
    *p_timeObservers = v12;

    timeObservers = *p_timeObservers;
  }
  -[NSMutableArray addObject:](timeObservers, "addObject:", v10, v15, v16, v17, v18);

  _Block_object_dispose(&buf, 8);
}

uint64_t __55__IMAVPlayer__updateForCurrentRateAndTimeControlStatus__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  float v4;
  double v5;
  void *v6;
  void *v7;
  float v8;
  float v9;
  void *v10;
  void *v11;
  float v12;
  float v13;
  void *v14;
  void *v15;
  float v16;
  float v17;
  NSObject *v18;
  int v19;
  int v20;
  int v21;
  char v23;
  int v24;
  _BYTE v25[10];
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "player");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "rate");
    v5 = v4;
    objc_msgSend(*(id *)(a1 + 32), "player");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 134218240;
    *(double *)v25 = v5;
    *(_WORD *)&v25[8] = 2048;
    v26 = objc_msgSend(v6, "timeControlStatus");
    _os_log_impl(&dword_1DA478000, v2, OS_LOG_TYPE_DEFAULT, "rate changed: %f. timeControlStatus: %lu", (uint8_t *)&v24, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "player");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rate");
  v9 = fabsf(v8);

  if (v9 < 0.00000011921)
  {
    objc_msgSend(*(id *)(a1 + 32), "playerItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "status") != 1
      || (objc_msgSend(*(id *)(a1 + 32), "isStalled") & 1) != 0
      || objc_msgSend(*(id *)(a1 + 32), "isAtEnd"))
    {

    }
    else
    {
      v23 = objc_msgSend(*(id *)(a1 + 32), "wasInterrupted");

      if ((v23 & 1) == 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "_pause");
        goto LABEL_15;
      }
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "player");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "rate");
  v13 = v12;

  v14 = *(void **)(a1 + 32);
  if (v13 <= 0.00000011921)
  {
    objc_msgSend(v14, "player");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "rate");
    v17 = fabsf(v16);

    if (v17 < 0.00000011921)
    {
      objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = objc_msgSend(*(id *)(a1 + 32), "isStalled");
        v20 = objc_msgSend(*(id *)(a1 + 32), "isAtEnd");
        v21 = objc_msgSend(*(id *)(a1 + 32), "wasInterrupted");
        v24 = 67109632;
        *(_DWORD *)v25 = v19;
        *(_WORD *)&v25[4] = 1024;
        *(_DWORD *)&v25[6] = v20;
        LOWORD(v26) = 1024;
        *(_DWORD *)((char *)&v26 + 2) = v21;
        _os_log_impl(&dword_1DA478000, v18, OS_LOG_TYPE_DEFAULT, "rate change to 0 did not result in a pause.  isStalled: %d, isAtEnd: %d, wasInterrupted: %d", (uint8_t *)&v24, 0x14u);
      }

    }
  }
  else if (!objc_msgSend(v14, "state"))
  {
    objc_msgSend(*(id *)(a1 + 32), "play");
  }
LABEL_15:
  objc_msgSend(*(id *)(a1 + 32), "_postNotificationName:userInfo:", CFSTR("IMAVPlayerNotification_RateChanged"), 0);
  return objc_msgSend(*(id *)(a1 + 32), "updateNowPlayingDurationSnapshot");
}

- (AVPlayer)player
{
  return self->_player;
}

- (void)updateInfoCenterPlaybackState
{
  unint64_t v3;
  uint64_t v4;
  id v5;

  v3 = -[IMAVPlayer state](self, "state");
  if (v3)
  {
    if (v3 == 2)
      v4 = 3;
    else
      v4 = v3 == 1;
  }
  else if (-[IMAVPlayer wasInterrupted](self, "wasInterrupted"))
  {
    v4 = 4;
  }
  else if (-[IMAVPlayer wasInterruptedEarly](self, "wasInterruptedEarly"))
  {
    v4 = 4;
  }
  else
  {
    v4 = 2;
  }
  -[IMAVPlayer infoCenter](self, "infoCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPlaybackState:", v4);

}

- (MPNowPlayingInfoCenter)infoCenter
{
  return self->_infoCenter;
}

- (BOOL)wasInterrupted
{
  return self->_wasInterrupted;
}

- (BOOL)wasInterruptedEarly
{
  return self->_wasInterruptedEarly;
}

- (void)updateNowPlayingDurationSnapshot
{
  int v3;
  int v4;
  float v5;
  float v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double Seconds;
  void *v12;
  void *v13;
  double v14;
  float v15;
  float v16;
  double v17;
  double v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  CMTime time;
  _QWORD v34[2];
  _QWORD v35[2];
  uint8_t buf[4];
  double v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  double v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "rateForPlaybackSpeed:", -[IMAVPlayer playbackSpeed](self, "playbackSpeed"));
  v4 = v3;
  v5 = 0.0;
  if (-[IMAVPlayer isPlaybackRequested](self, "isPlaybackRequested"))
  {
    -[IMAVPlayer actualRate](self, "actualRate");
    v5 = v6;
    if (self->_seekTimer)
    {
      if (!self->_seekForward)
        v5 = -v6;
    }
  }
  -[IMAVPlayer playerItem](self, "playerItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "status") == 1)
  {
    -[IMAVPlayer playerItem](self, "playerItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      objc_msgSend(v8, "currentTime");
    else
      memset(&time, 0, sizeof(time));
    Seconds = CMTimeGetSeconds(&time);

  }
  else
  {
    -[IMAVPlayer currentTime](self, "currentTime");
    Seconds = v10;
  }

  if (Seconds <= 0.00000011920929)
    Seconds = 0.1;
  -[IMAVPlayer currentItem](self, "currentItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "contentItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v14) = v4;
  objc_msgSend(v13, "setDefaultPlaybackRate:", v14);
  -[IMAVPlayer duration](self, "duration");
  objc_msgSend(v13, "setDuration:");
  objc_msgSend(v13, "playbackRate");
  v16 = vabds_f32(v15, v5);
  objc_msgSend(v13, "elapsedTime");
  HIDWORD(v18) = 872415232;
  if (v16 > 0.00000011921 || (v18 = 0.5, vabdd_f64(v17, Seconds) > 0.5))
  {
    *(float *)&v18 = v5;
    objc_msgSend(v13, "setElapsedTime:playbackRate:", Seconds, v18);
    objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      -[IMAVPlayer duration](self, "duration");
      *(_DWORD *)buf = 134218496;
      v37 = Seconds;
      v38 = 2048;
      v39 = v20;
      v40 = 2048;
      v41 = v5;
      _os_log_impl(&dword_1DA478000, v19, OS_LOG_TYPE_INFO, "Updated MPNowPlayingContentItem snapshot: elapsedTime: %f, duration: %f, playbackRate: %f", buf, 0x20u);
    }

  }
  -[IMAVPlayer manifest](self, "manifest");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    -[IMAVPlayer manifest](self, "manifest");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "currentIndex") == 0x7FFFFFFFFFFFFFFFLL)
    {
      v23 = 0;
    }
    else
    {
      -[IMAVPlayer manifest](self, "manifest");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v24, "currentIndex");

    }
  }
  else
  {
    v23 = 0;
  }

  -[IMAVPlayer manifest](self, "manifest");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    -[IMAVPlayer manifest](self, "manifest");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "count");

  }
  else
  {
    v27 = 1;
  }

  v34[0] = *MEMORY[0x1E0D4CAD0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v23);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v28;
  v34[1] = *MEMORY[0x1E0D4CB58];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v29;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "updateNowPlayingInfoIfNeeded:", v30);
  -[IMAVPlayer currentItem](self, "currentItem");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v31, "isPlaceholder") & 1) != 0)
  {
    v32 = 1;
  }
  else if (-[IMAVPlayer isPlaybackRequested](self, "isPlaybackRequested"))
  {
    v32 = -[IMAVPlayer isPlaybackActive](self, "isPlaybackActive") ^ 1;
  }
  else
  {
    v32 = 0;
  }

  if ((_DWORD)v32 != objc_msgSend(v13, "isLoading"))
    objc_msgSend(v13, "setLoading:", v32);
  -[IMAVPlayer updateInfoCenterPlaybackState](self, "updateInfoCenterPlaybackState");

}

- (IMPlayerManifest)manifest
{
  return self->_manifest;
}

- (BOOL)isPlaybackRequested
{
  return -[IMAVPlayer state](self, "state") == 1;
}

- (unint64_t)state
{
  return self->_state;
}

- (AVPlayerItem)playerItem
{
  return self->_playerItem;
}

- (double)currentTime
{
  return self->_currentTime;
}

- (unint64_t)playbackSpeed
{
  return self->_playbackSpeed;
}

- (BOOL)isStalled
{
  return -[IMAVPlayer loadState](self, "loadState") == 2;
}

- (unint64_t)loadState
{
  void *v2;
  uint64_t v3;
  unint64_t v4;

  -[IMAVPlayer player](self, "player");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "timeControlStatus");

  v4 = 2;
  if (!v3)
    v4 = 3;
  if (v3 == 2)
    return 1;
  else
    return v4;
}

- (BOOL)isAtEnd
{
  double v3;
  double v4;
  double v5;

  -[IMAVPlayer duration](self, "duration");
  v4 = v3;
  -[IMAVPlayer currentTime](self, "currentTime");
  return v4 - v5 < 0.5;
}

- (void)forceTriggerTimeObserverAt:(double)a3
{
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double Seconds;
  CMTime time;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = self->_observingTimes;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v16;
    while (2)
    {
      v10 = 0;
      v11 = v8 + v7;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v5);
        v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
        if (v12)
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "CMTimeValue");
        else
          memset(&time, 0, sizeof(time));
        Seconds = CMTimeGetSeconds(&time);
        if (Seconds > a3)
        {
          v11 = v8 + v10;
          goto LABEL_16;
        }
        if (Seconds == a3)
          goto LABEL_18;
        ++v10;
      }
      while (v7 != v10);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v8 = v11;
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    v11 = 0;
  }
LABEL_16:

  if (v11)
  {
    -[NSMutableArray objectAtIndex:](self->_observingTimes, "objectAtIndex:", v11 - 1);
    v12 = objc_claimAutoreleasedReturnValue();
    v5 = (NSMutableArray *)v12;
LABEL_18:
    -[IMAVPlayer triggerTimeObserverAt:](self, "triggerTimeObserverAt:", v12);

  }
}

uint64_t __61__IMAVPlayer_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateTimeObservers");
}

void __41__IMAVPlayer__updatePlayerForCurrentItem__block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  id WeakRetained;

  v2 = *(unsigned __int8 *)(a1 + 48);
  if (*(_BYTE *)(a1 + 48))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "player");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "videoViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPlayer:", v3);

  if (v2)
  {

  }
}

- (IMAVPlayerVideoViewController)videoViewController
{
  return self->_videoViewController;
}

void __31__IMAVPlayer_onChaptersLoaded___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "currentItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setupChapterTimeObservers");
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "currentTime");
    objc_msgSend(v3, "setupChapterAtTime:");
  }
}

- (float)storedVolume
{
  void *v2;
  int v3;
  void *v4;
  float v5;
  float v6;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("IMAVPlayerHasStoredVolumeDefaultKey"));

  if (!v3)
    return 1.0;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatForKey:", CFSTR("IMAVPlayerVolumeUserDefaultKey"));
  v6 = v5;

  return v6;
}

- (void)setPlayerItem:(id)a3
{
  AVPlayerItem *v4;
  void *v5;
  void *v6;
  AVPlayerItem *playerItem;

  v4 = (AVPlayerItem *)a3;
  -[IMAVPlayer playerItem](self, "playerItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[IMAVPlayer playerItem](self, "playerItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMAVPlayer stopObservingPlayerItem:](self, "stopObservingPlayerItem:", v6);

  }
  playerItem = self->_playerItem;
  self->_playerItem = v4;

}

- (void)setCurrentTime:(double)a3
{
  -[IMAVPlayer setCurrentTime:fromMediaRemote:](self, "setCurrentTime:fromMediaRemote:", 0, a3);
}

- (BOOL)providesVideoView
{
  return self->_providesVideoView;
}

- (void)onChaptersLoaded:(id)a3
{
  IMPlayerItem *v4;
  IMPlayerItem *currentItem;
  void *v6;
  _QWORD v7[5];

  objc_msgSend(a3, "object");
  v4 = (IMPlayerItem *)objc_claimAutoreleasedReturnValue();
  currentItem = self->_currentItem;

  if (v4 == currentItem)
  {
    v6 = (void *)objc_opt_class();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __31__IMAVPlayer_onChaptersLoaded___block_invoke;
    v7[3] = &unk_1EA0C4FB0;
    v7[4] = self;
    objc_msgSend(v6, "performOnMainQueue:", v7);
  }
}

void __29__IMAVPlayer_setCurrentItem___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void (**v25)(_QWORD);
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t);
  void *v31;
  uint64_t v32;
  id v33;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
  if (v3 != v2 && (objc_msgSend(v3, "isEqual:") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "currentItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("IMAVPlayerNotificationKey_OldMediaItem"));
    v6 = *(_QWORD *)(a1 + 40);
    if (v6)
      objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("IMAVPlayerNotificationKey_NewMediaItem"));
    v7 = objc_msgSend(*(id *)(a1 + 32), "autoStop") == 3;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("IMAVPlayerNotificationKey_DidSleepAtAssetEnd"));

    v9 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 32), "currentTime");
    *(float *)&v10 = v10;
    objc_msgSend(v9, "numberWithFloat:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("IMAVPlayerNotificationKey_CurrentPlayheadTime"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "state"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(*(id *)(a1 + 32), "state");
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("IMAVPlayerNotificationKey_CurrentPlayerState"));
    v14 = *(void **)(a1 + 32);
    if (v5 && v13 == 1)
    {
      objc_msgSend(v14, "causalityObserver");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_opt_respondsToSelector();

      if ((v16 & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "causalityObserver");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "player:willStopWithReason:initiator:", *(_QWORD *)(a1 + 32), 2, 1);

      }
      objc_msgSend(*(id *)(a1 + 32), "_postNotificationName:userInfo:", CFSTR("IMMediaPlayerNotification_MediaItemWillChange"), v4);
      objc_msgSend(*(id *)(a1 + 32), "_primitiveSetCurrentItem:", *(_QWORD *)(a1 + 40));
      objc_msgSend(v5, "invalidateAsset");
      objc_msgSend(*(id *)(a1 + 32), "_updatePlayerForCurrentItem");
      objc_msgSend(*(id *)(a1 + 32), "causalityObserver");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_opt_respondsToSelector();

      if ((v19 & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "causalityObserver");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "player:didStopWithReason:initiator:", *(_QWORD *)(a1 + 32), 2, 1);

      }
    }
    else
    {
      objc_msgSend(v14, "_postNotificationName:userInfo:", CFSTR("IMMediaPlayerNotification_MediaItemWillChange"), v4);
      objc_msgSend(*(id *)(a1 + 32), "_primitiveSetCurrentItem:", *(_QWORD *)(a1 + 40));
      objc_msgSend(v5, "invalidateAsset");
      objc_msgSend(*(id *)(a1 + 32), "_updatePlayerForCurrentItem");
    }
    objc_msgSend(*(id *)(a1 + 32), "_postNotificationName:userInfo:", CFSTR("IMMediaPlayerNotification_MediaItemDidChange"), v4);
    v21 = objc_msgSend(*(id *)(a1 + 40), "isVideo") ^ 1;
    objc_msgSend(*(id *)(a1 + 32), "commandCenter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setPlaybackSessionCommand");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setEnabled:", v21);

    if ((objc_msgSend(*(id *)(a1 + 32), "delegateFlags") & 0x800) != 0)
    {
      v28 = MEMORY[0x1E0C809B0];
      v29 = 3221225472;
      v30 = __29__IMAVPlayer_setCurrentItem___block_invoke_2;
      v31 = &unk_1EA0C5098;
      v24 = *(void **)(a1 + 40);
      v32 = *(_QWORD *)(a1 + 32);
      v33 = v24;
      v25 = (void (**)(_QWORD))_Block_copy(&v28);
      objc_msgSend(MEMORY[0x1E0CB3978], "currentThread", v28, v29, v30, v31, v32);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "mainThread");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26 == v27)
        v25[2](v25);
      else
        dispatch_sync(MEMORY[0x1E0C80D38], v25);

    }
  }
}

- (MPRemoteCommandCenter)commandCenter
{
  return self->_commandCenter;
}

- ($A179B7F90EACB6BD9E7D7430050708F9)delegateFlags
{
  return ($A179B7F90EACB6BD9E7D7430050708F9)self->_delegateFlags;
}

- (void)_primitiveSetCurrentItem:(id)a3
{
  objc_storeStrong((id *)&self->_currentItem, a3);
}

uint64_t __61__IMAVPlayer_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_durationAvailable");
}

- (void)registerAVSessionCategoryAndMode
{
  -[IMAVPlayer _configureAudioSessionWithCompletion:](self, "_configureAudioSessionWithCompletion:", 0);
}

- (void)setCausalityObserver:(id)a3
{
  objc_storeWeak((id *)&self->_causalityObserver, a3);
}

void __51__IMAVPlayer__configureAudioSessionWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  void *v5;
  void *v6;
  id *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v2 = *MEMORY[0x1E0C89690];
  v3 = *MEMORY[0x1E0C89768];
  v4 = objc_msgSend(MEMORY[0x1E0D7F278], "isRunningOnHomepod");
  objc_msgSend(*(id *)(a1 + 32), "audioSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    v13 = 0;
    v7 = (id *)&v13;
    v8 = objc_msgSend(v5, "setCategory:mode:options:error:", v2, v3, 0, &v13);
  }
  else
  {
    v12 = 0;
    v7 = (id *)&v12;
    v8 = objc_msgSend(v5, "setCategory:mode:routeSharingPolicy:options:error:", v2, v3, 1, 0, &v12);
  }
  v9 = v8;
  v10 = *v7;

  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(uint64_t, uint64_t, id))(v11 + 16))(v11, v9, v10);

}

+ (id)sharedPlayer
{
  void *v2;
  int v3;
  NSObject *v4;
  uint8_t v6[16];

  if (objc_msgSend(MEMORY[0x1E0D7F278], "isRunningOnHomepod")
    && (objc_msgSend(MEMORY[0x1E0D4C638], "currentSettings"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        v3 = objc_msgSend(v2, "isMultiplayerHost"),
        v2,
        v3))
  {
    objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1DA478000, v4, OS_LOG_TYPE_FAULT, "HomePod attempted to access the shared IMAVPlayer", v6, 2u);
    }

    return 0;
  }
  else
  {
    os_feature_enabled_bluemoon();
    if (sharedPlayer_onceToken != -1)
      dispatch_once(&sharedPlayer_onceToken, &__block_literal_global_3);
    return (id)_IMAVPlayer;
  }
}

- (void)setManifest:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(_QWORD);
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  void (**v15)(_QWORD);

  v7 = a3;
  v8 = (void (**)(_QWORD))a4;
  if (!objc_msgSend(v7, "isEqual:", self->_manifest)
    || (objc_msgSend(v7, "currentItem"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        -[IMAVPlayer currentItem](self, "currentItem"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v9, "isEqual:", v10),
        v10,
        v9,
        (v11 & 1) == 0))
  {
    if (self->_manifest)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeObserver:name:object:", self, CFSTR("IMPlayerManifestCurrentItemDidChange"), self->_manifest);

    }
    -[IMAVPlayer _postNotificationName:userInfo:](self, "_postNotificationName:userInfo:", CFSTR("IMAVPlayerNotification_ManifestWillChange"), 0);
    objc_storeStrong((id *)&self->_manifest, a3);
    -[IMAVPlayer _postNotificationName:userInfo:](self, "_postNotificationName:userInfo:", CFSTR("IMAVPlayerNotification_ManifestDidChange"), 0);
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObserver:selector:name:object:", self, sel_manifestCurrentItemDidChange, CFSTR("IMPlayerManifestCurrentItemDidChange"), self->_manifest);

      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __37__IMAVPlayer_setManifest_completion___block_invoke;
      v14[3] = &unk_1EA0C5070;
      v15 = v8;
      objc_msgSend(v7, "load:", v14);

      goto LABEL_10;
    }
    -[IMAVPlayer setCurrentItem:](self, "setCurrentItem:", 0);
  }
  if (v8)
    v8[2](v8);
LABEL_10:

}

- (void)becomeActiveMediaPlayer
{
  id v3;
  id v4;

  v3 = (id)objc_msgSend(MEMORY[0x1E0CC24A8], "defaultCenter");
  v4 = (id)objc_msgSend(MEMORY[0x1E0CC24D0], "sharedCommandCenter");
  -[MPNowPlayingInfoCenter becomeActive](self->_infoCenter, "becomeActive");
}

- (void)_configureAudioSessionWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__IMAVPlayer__configureAudioSessionWithCompletion___block_invoke;
  v7[3] = &unk_1EA0C5048;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performOnAvSessionQueue:", v7);

}

+ (void)performOnAvSessionQueue:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  v3 = performOnAvSessionQueue__onceToken;
  v4 = a3;
  v6 = v4;
  if (v3 == -1)
  {
    v5 = v4;
  }
  else
  {
    dispatch_once(&performOnAvSessionQueue__onceToken, &__block_literal_global_229);
    v5 = v6;
  }
  dispatch_async((dispatch_queue_t)performOnAvSessionQueue__IMAVSessionConfigurationQueue, v5);

}

void __38__IMAVPlayer_performOnAvSessionQueue___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("IMAVPlayer.avsession_queue", v2);
  v1 = (void *)performOnAvSessionQueue__IMAVSessionConfigurationQueue;
  performOnAvSessionQueue__IMAVSessionConfigurationQueue = (uint64_t)v0;

}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  NSTimer *hdcpTimer;
  NSTimer *seekTimer;
  objc_super v8;

  -[IMAVPlayer playerItem](self, "playerItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMAVPlayer stopObservingPlayerItem:](self, "stopObservingPlayerItem:", v3);

  -[IMAVPlayer player](self, "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMAVPlayer stopObservingPlayer:](self, "stopObservingPlayer:", v4);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  -[IMAVPlayer removeAllTimeObservers](self, "removeAllTimeObservers");
  -[IMAVPlayer removePeriodicTimeObservers](self, "removePeriodicTimeObservers");
  -[NSTimer invalidate](self->_hdcpTimer, "invalidate");
  hdcpTimer = self->_hdcpTimer;
  self->_hdcpTimer = 0;

  -[NSTimer invalidate](self->_seekTimer, "invalidate");
  seekTimer = self->_seekTimer;
  self->_seekTimer = 0;

  v8.receiver = self;
  v8.super_class = (Class)IMAVPlayer;
  -[IMAVPlayer dealloc](&v8, sel_dealloc);
}

- (void)configureAudioSessionAndSetActive:(BOOL)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  BOOL v10;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__IMAVPlayer_configureAudioSessionAndSetActive_withCompletion___block_invoke;
  v8[3] = &unk_1EA0C5020;
  v10 = a3;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[IMAVPlayer _configureAudioSessionWithCompletion:](self, "_configureAudioSessionWithCompletion:", v8);

}

void __63__IMAVPlayer_configureAudioSessionAndSetActive_withCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  char v9;
  char v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  char v24;
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (!a2)
  {
    objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = objc_msgSend(v6, "code");
      objc_msgSend(v6, "domain");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "userInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "description");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v27 = v12;
      v28 = 2112;
      v29 = v13;
      v30 = 2112;
      v31 = v15;
      v16 = "Error setting AVAudioSession Category to Playback: [%ld %@] %@";
LABEL_8:
      _os_log_impl(&dword_1DA478000, v11, OS_LOG_TYPE_ERROR, v16, buf, 0x20u);

    }
LABEL_9:

    v10 = 0;
    goto LABEL_10;
  }

  objc_msgSend(*(id *)(a1 + 32), "audioSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(unsigned __int8 *)(a1 + 48);
  v25 = 0;
  v9 = objc_msgSend(v7, "setActive:error:", v8, &v25);
  v6 = v25;

  if ((v9 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v17 = objc_msgSend(v6, "code");
      objc_msgSend(v6, "domain");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "userInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "description");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v27 = v17;
      v28 = 2112;
      v29 = v13;
      v30 = 2112;
      v31 = v15;
      v16 = "Error setting AVAudioSession to Active: [%ld %@] %@";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v10 = 1;
LABEL_10:
  v18 = (void *)objc_opt_class();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __63__IMAVPlayer_configureAudioSessionAndSetActive_withCompletion___block_invoke_111;
  v21[3] = &unk_1EA0C4FF8;
  v19 = *(id *)(a1 + 40);
  v24 = v10;
  v22 = v6;
  v23 = v19;
  v20 = v6;
  objc_msgSend(v18, "performOnMainQueue:", v21);

}

uint64_t __63__IMAVPlayer_configureAudioSessionAndSetActive_withCompletion___block_invoke_111(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)nextMediaItem
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_opt_class();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __27__IMAVPlayer_nextMediaItem__block_invoke;
  v4[3] = &unk_1EA0C4FB0;
  v4[4] = self;
  objc_msgSend(v3, "performOnMainQueue:", v4);
}

uint64_t __27__IMAVPlayer_nextMediaItem__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v5[16];

  objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1DA478000, v2, OS_LOG_TYPE_DEFAULT, "nextMediaItem", v5, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "manifest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "next");

  return objc_msgSend(*(id *)(a1 + 32), "enforceAutoStopForMode:", 3);
}

- (void)previousMediaItem
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_opt_class();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __31__IMAVPlayer_previousMediaItem__block_invoke;
  v4[3] = &unk_1EA0C4FB0;
  v4[4] = self;
  objc_msgSend(v3, "performOnMainQueue:", v4);
}

void __31__IMAVPlayer_previousMediaItem__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DA478000, v2, OS_LOG_TYPE_DEFAULT, "previousMediaItem", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "manifest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "previous");

}

uint64_t __37__IMAVPlayer_setManifest_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __29__IMAVPlayer_setCurrentItem___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "player:currentManifestItemChanged:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __41__IMAVPlayer__updatePlayerForCurrentItem__block_invoke_2(uint64_t a1)
{
  void *v2;
  char v3;
  NSObject *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  uint8_t v11[16];

  objc_msgSend(*(id *)(a1 + 32), "currentItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "notifyUserIsNotPlayable");

  if ((v3 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1DA478000, v4, OS_LOG_TYPE_DEFAULT, "Pausing: episode is not playable", v11, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "causalityObserver");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "causalityObserver");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "player:willStopWithReason:initiator:", *(_QWORD *)(a1 + 32), 10, 2);

    }
    objc_msgSend(*(id *)(a1 + 32), "_pause");
    objc_msgSend(*(id *)(a1 + 32), "causalityObserver");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "causalityObserver");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "player:didStopWithReason:initiator:", *(_QWORD *)(a1 + 32), 10, 2);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "nextMediaItem");
  }
}

uint64_t __40__IMAVPlayer_updateRateForCurrentState___block_invoke_123(uint64_t a1, int a2)
{
  NSObject *v4;
  uint64_t result;
  uint64_t (*v6)(void);
  uint8_t v7[16];

  objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1DA478000, v4, OS_LOG_TYPE_DEFAULT, "Session active", v7, 2u);
  }

  if (objc_msgSend(*(id *)(a1 + 32), "state") != 1)
  {
    result = *(_QWORD *)(a1 + 40);
    if (!result)
      return result;
    v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "becomeActiveMediaPlayer");
  objc_msgSend(*(id *)(a1 + 32), "beginBackgroundTask");
  objc_msgSend(*(id *)(a1 + 32), "_setupAutoStopTimer");
  objc_msgSend(*(id *)(a1 + 32), "updateTimeObservers");
  objc_msgSend((id)objc_opt_class(), "rateForPlaybackSpeed:", objc_msgSend(*(id *)(a1 + 32), "playbackSpeed"));
  objc_msgSend(*(id *)(a1 + 32), "setRequestedRate:");
  result = *(_QWORD *)(a1 + 40);
  if (result)
  {
    v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  return result;
}

- (BOOL)nextRemote
{
  void *v3;
  int v4;
  NSObject *v5;
  NSObject *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  int v16;
  unint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[IMAVPlayer manifest](self, "manifest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasNext");

  objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v16) = 0;
    _os_log_impl(&dword_1DA478000, v5, OS_LOG_TYPE_DEFAULT, "nextRemote", (uint8_t *)&v16, 2u);
  }

  if (-[IMAVPlayer hasChapters](self, "hasChapters"))
  {
    objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = -[IMAVPlayer currentChapterIndex](self, "currentChapterIndex");
      -[IMAVPlayer currentItem](self, "currentItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "timeChapters");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");
      v16 = 134218240;
      v17 = v7;
      v18 = 2048;
      v19 = v10;
      _os_log_impl(&dword_1DA478000, v6, OS_LOG_TYPE_DEFAULT, "Current Chapter Index: %lu, Chapter Count: %lu", (uint8_t *)&v16, 0x16u);

    }
    v11 = -[IMAVPlayer currentChapterIndex](self, "currentChapterIndex");
    -[IMAVPlayer currentItem](self, "currentItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeChapters");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count") - 1;

    if (v11 < v14)
    {
      -[IMAVPlayer nextChapter](self, "nextChapter");
      return 1;
    }
  }
  if (v4)
  {
    -[IMAVPlayer nextMediaItem](self, "nextMediaItem");
    return 1;
  }
  return 0;
}

- (BOOL)previousRemote
{
  return -[IMAVPlayer previousRemote:](self, "previousRemote:", 0);
}

- (BOOL)previousRemote:(BOOL)a3
{
  void *v5;
  int v6;
  NSObject *v7;
  double Seconds;
  NSObject *v9;
  CMTimeValue v10;
  CMTimeValue v11;
  CMTimeValue v12;
  double v13;
  double v14;
  double v15;
  CMTime time;
  CMTimeRange buf;
  CMTimeRange range;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[IMAVPlayer manifest](self, "manifest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasPrevious");

  objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf.start.value) = 0;
    _os_log_impl(&dword_1DA478000, v7, OS_LOG_TYPE_DEFAULT, "previousRemote", (uint8_t *)&buf, 2u);
  }

  memset(&buf, 0, sizeof(buf));
  -[IMAVPlayer _skipToPreviousThreshold](self, "_skipToPreviousThreshold");
  range = buf;
  CMTimeRangeGetEnd(&time, &range);
  Seconds = CMTimeGetSeconds(&time);
  objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[IMAVPlayer currentTime](self, "currentTime");
    v11 = v10;
    *(_OWORD *)&range.start.value = *(_OWORD *)&buf.start.value;
    range.start.epoch = buf.start.epoch;
    *(double *)&v12 = CMTimeGetSeconds(&range.start);
    LODWORD(range.start.value) = 134218496;
    *(CMTimeValue *)((char *)&range.start.value + 4) = v11;
    LOWORD(range.start.flags) = 2048;
    *(double *)((char *)&range.start.flags + 2) = Seconds;
    HIWORD(range.start.epoch) = 2048;
    range.duration.value = v12;
    _os_log_impl(&dword_1DA478000, v9, OS_LOG_TYPE_DEFAULT, "previousRemote: %f, %f, %f", (uint8_t *)&range, 0x20u);
  }

  if (!a3)
  {
    -[IMAVPlayer currentTime](self, "currentTime");
    if (v13 > Seconds)
    {
      *(_OWORD *)&range.start.value = *(_OWORD *)&buf.start.value;
      range.start.epoch = buf.start.epoch;
      v14 = CMTimeGetSeconds(&range.start);
      v15 = 0.0;
      if (v14 >= 0.0)
      {
        *(_OWORD *)&range.start.value = *(_OWORD *)&buf.start.value;
        range.start.epoch = buf.start.epoch;
        v15 = CMTimeGetSeconds(&range.start);
      }
      -[IMAVPlayer setCurrentTime:](self, "setCurrentTime:", v15);
      return 1;
    }
  }
  if (-[IMAVPlayer hasChapters](self, "hasChapters") && -[IMAVPlayer currentChapterIndex](self, "currentChapterIndex"))
  {
    -[IMAVPlayer previousChapter](self, "previousChapter");
    return 1;
  }
  if (v6)
  {
    -[IMAVPlayer previousMediaItem](self, "previousMediaItem");
    return 1;
  }
  return 0;
}

- ($FE7ED0E05F0D31DE1948BDABFA0192D4)_skipToPreviousThreshold
{
  void *v5;
  void *v6;
  CMTime *p_duration;
  __int128 v8;
  $FE7ED0E05F0D31DE1948BDABFA0192D4 *result;
  __int128 v10;
  CMTime v11;
  CMTime start;
  CMTime duration;
  CMTimeRange v14;

  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  if (-[IMAVPlayer hasChapters](self, "hasChapters"))
  {
    -[IMAVPlayer currentChapter](self, "currentChapter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
      objc_msgSend(v5, "mediaTimeRange");
    else
      memset(&v14, 0, sizeof(v14));
    v8 = *(_OWORD *)&v14.start.epoch;
    *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&v14.start.value;
    *(_OWORD *)&retstr->var0.var3 = v8;
    *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&v14.duration.timescale;

    CMTimeMakeWithSeconds(&duration, 4.0, retstr->var1.var1);
    start = (CMTime)retstr->var0;
    p_duration = &duration;
  }
  else
  {
    CMTimeMakeWithSeconds(&v11, 4.0, 600);
    start = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
    p_duration = &v11;
  }
  result = ($FE7ED0E05F0D31DE1948BDABFA0192D4 *)CMTimeRangeMake(&v14, &start, p_duration);
  v10 = *(_OWORD *)&v14.start.epoch;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&v14.start.value;
  *(_OWORD *)&retstr->var0.var3 = v10;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&v14.duration.timescale;
  return result;
}

- (void)setCurrentTimeRemote:(double)a3
{
  -[IMAVPlayer setCurrentTime:fromMediaRemote:](self, "setCurrentTime:fromMediaRemote:", 1, a3);
}

- (void)hdcpTimer:(id)a3
{
  void *v4;
  _QWORD v5[5];

  v4 = (void *)objc_opt_class();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __24__IMAVPlayer_hdcpTimer___block_invoke;
  v5[3] = &unk_1EA0C4FB0;
  v5[4] = self;
  objc_msgSend(v4, "performOnMainQueue:", v5);
}

uint64_t __24__IMAVPlayer_hdcpTimer___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t result;

  if (objc_msgSend(*(id *)(a1 + 32), "isPlaybackRequested"))
  {
    objc_msgSend(*(id *)(a1 + 32), "player");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "currentItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "_isExternalProtectionRequiredForPlayback");

    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "player");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "_externalProtectionStatus");

      if (v6)
      {
        objc_msgSend(*(id *)(a1 + 32), "_pause");
        if ((objc_msgSend(*(id *)(a1 + 32), "delegateFlags") & 2) != 0)
        {
          v7 = (void *)MEMORY[0x1E0CB35C8];
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("HDCP error"), *MEMORY[0x1E0CB2D50], 0);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("IMAVPlayer"), -1, v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(a1 + 32), "delegate");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "playerErrorDidOccur:error:", *(_QWORD *)(a1 + 32), v9);

        }
      }
    }
  }
  result = objc_msgSend(*(id *)(a1 + 32), "shouldEnforceHDCP");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "setShouldEnforceHDCP:", 1);
  return result;
}

- (void)setShouldEnforceHDCP:(BOOL)a3
{
  _BOOL4 v3;
  NSTimer *hdcpTimer;
  NSTimer *v6;
  NSTimer *v7;

  v3 = a3;
  -[NSTimer invalidate](self->_hdcpTimer, "invalidate");
  hdcpTimer = self->_hdcpTimer;
  self->_hdcpTimer = 0;

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_hdcpTimer_, 0, 0, 3.0);
    v6 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    v7 = self->_hdcpTimer;
    self->_hdcpTimer = v6;

  }
}

- (BOOL)shouldEnforceHDCP
{
  return self->_hdcpTimer != 0;
}

- (float)requestedRate
{
  float result;

  -[AVPlayer rate](self->_player, "rate");
  return result;
}

- (float)volume
{
  float result;

  if (self->_fadeOutTimer || -[IMAVPlayer isScanning](self, "isScanning"))
    -[IMAVPlayer storedVolume](self, "storedVolume");
  else
    -[AVPlayer volume](self->_player, "volume");
  return result;
}

+ (unint64_t)playbackSpeedForRate:(float)a3
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (a3 <= 0.75)
    return 1;
  v3 = 4;
  v4 = 2;
  v5 = 3;
  if (a3 < 2.0)
    v5 = 5;
  if (a3 >= 1.75)
    v4 = v5;
  if (a3 >= 1.5)
    v3 = v4;
  if (a3 >= 1.25)
    return v3;
  else
    return 0;
}

+ (id)avPlaybackSpeedForSpeed:(unint64_t)a3
{
  int v3;
  int v4;
  id v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  double v14;
  void *v15;

  objc_msgSend((id)objc_opt_class(), "rateForPlaybackSpeed:", a3);
  v4 = v3;
  v5 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  objc_msgSend(v5, "setMaximumFractionDigits:", 2);
  objc_msgSend(v5, "setMinimumFractionDigits:", 0);
  objc_msgSend(v5, "setNumberStyle:", 1);
  LODWORD(v6) = v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromNumber:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("MENU_PLAYBACK_SPEED"), &stru_1EA0D7620, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringWithFormat:", v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_alloc(MEMORY[0x1E0C8B438]);
  LODWORD(v14) = v4;
  v15 = (void *)objc_msgSend(v13, "initWithRate:localizedName:", v12, v14);

  return v15;
}

+ (NSArray)availableSpeeds
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[7];

  v10[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "avPlaybackSpeedForSpeed:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v2;
  objc_msgSend((id)objc_opt_class(), "avPlaybackSpeedForSpeed:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v3;
  objc_msgSend((id)objc_opt_class(), "avPlaybackSpeedForSpeed:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v4;
  objc_msgSend((id)objc_opt_class(), "avPlaybackSpeedForSpeed:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v5;
  objc_msgSend((id)objc_opt_class(), "avPlaybackSpeedForSpeed:", 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[4] = v6;
  objc_msgSend((id)objc_opt_class(), "avPlaybackSpeedForSpeed:", 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v8;
}

+ (unint64_t)incrementPlaybackSpeed:(unint64_t)a3
{
  if (a3 > 5)
    return 0;
  else
    return qword_1DA676F30[a3];
}

+ (unint64_t)decrementPlaybackSpeed:(unint64_t)a3
{
  if (a3 > 5)
    return 0;
  else
    return qword_1DA676F60[a3];
}

+ (BOOL)isMaxSpeed:(unint64_t)a3
{
  return a3 == 3;
}

+ (BOOL)isMinSpeed:(unint64_t)a3
{
  return a3 == 1;
}

- (BOOL)play
{
  _BOOL4 v3;

  v3 = -[IMAVPlayer _validatePlay](self, "_validatePlay");
  if (v3)
    -[IMAVPlayer setState:](self, "setState:", 1);
  return v3;
}

- (void)play:(id)a3 interruptionEvent:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  BOOL v16;
  id location;
  _QWORD v18[4];
  id v19;

  v4 = a4;
  v6 = a3;
  if (v4 && !self->_stateChangeInterruptionFlag)
  {
    objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location) = 0;
      _os_log_impl(&dword_1DA478000, v9, OS_LOG_TYPE_DEFAULT, "Dropping play command because it was the result of an interruption event", (uint8_t *)&location, 2u);
    }

    v10 = (void *)objc_opt_class();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __37__IMAVPlayer_play_interruptionEvent___block_invoke;
    v18[3] = &unk_1EA0C5070;
    v19 = v6;
    objc_msgSend(v10, "performOnMainQueue:", v18);
    v8 = v19;
    goto LABEL_10;
  }
  if (!-[IMAVPlayer _validatePlay](self, "_validatePlay"))
  {
    if (!v6)
      goto LABEL_11;
    -[IMAVPlayer setStateChangeInterruptionFlag:](self, "setStateChangeInterruptionFlag:", v4);
    v7 = (void *)objc_opt_class();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __37__IMAVPlayer_play_interruptionEvent___block_invoke_3;
    v11[3] = &unk_1EA0C5070;
    v12 = v6;
    objc_msgSend(v7, "performOnMainQueue:", v11);
    v8 = v12;
LABEL_10:

    goto LABEL_11;
  }
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __37__IMAVPlayer_play_interruptionEvent___block_invoke_2;
  v13[3] = &unk_1EA0C5110;
  objc_copyWeak(&v15, &location);
  v16 = v4;
  v14 = v6;
  -[IMAVPlayer setState:additionalUserInfo:completion:](self, "setState:additionalUserInfo:completion:", 1, 0, v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
LABEL_11:

}

uint64_t __37__IMAVPlayer_play_interruptionEvent___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __37__IMAVPlayer_play_interruptionEvent___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  id WeakRetained;
  uint64_t result;

  v4 = *(unsigned __int8 *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setStateChangeInterruptionFlag:", v4);

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

uint64_t __37__IMAVPlayer_play_interruptionEvent___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)_validatePlay
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  _QWORD v17[5];
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[IMAVPlayer currentItem](self, "currentItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPlayable");

  if ((v4 & 1) != 0)
  {
    -[IMAVPlayer currentItem](self, "currentItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "asset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMAVPlayer playerItem](self, "playerItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "asset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 != v8)
      -[IMAVPlayer _updatePlayerForCurrentItem](self, "_updatePlayerForCurrentItem");
    objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DA478000, v9, OS_LOG_TYPE_DEFAULT, "play", buf, 2u);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      -[IMAVPlayer currentItem](self, "currentItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "title");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMAVPlayer currentItem](self, "currentItem");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = &stru_1EA0D7620;
      if (!v13)
        v14 = CFSTR(" - currentItem is nil");
      *(_DWORD *)buf = 138412546;
      v19 = v12;
      v20 = 2112;
      v21 = v14;
      _os_log_impl(&dword_1DA478000, v10, OS_LOG_TYPE_ERROR, "play validation failed for %@%@", buf, 0x16u);

    }
    v15 = (void *)objc_opt_class();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __27__IMAVPlayer__validatePlay__block_invoke;
    v17[3] = &unk_1EA0C4FB0;
    v17[4] = self;
    objc_msgSend(v15, "performOnMainQueue:", v17);
    -[IMAVPlayer currentItem](self, "currentItem");
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject invalidateAsset](v9, "invalidateAsset");
  }

  return v4;
}

void __27__IMAVPlayer__validatePlay__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "currentItem");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "notifyUserIsNotPlayable");

}

- (BOOL)pauseWithInitiator:(unint64_t)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __33__IMAVPlayer_pauseWithInitiator___block_invoke;
  v4[3] = &unk_1EA0C5138;
  v4[4] = self;
  return -[IMAVPlayer _stopWithReason:initiator:stopBlock:](self, "_stopWithReason:initiator:stopBlock:", 3, a3, v4);
}

uint64_t __33__IMAVPlayer_pauseWithInitiator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "pause");
}

- (BOOL)pauseWithInitiator:(unint64_t)a3 interruptionEvent:(BOOL)a4
{
  _QWORD v5[5];
  BOOL v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__IMAVPlayer_pauseWithInitiator_interruptionEvent___block_invoke;
  v5[3] = &unk_1EA0C5160;
  v5[4] = self;
  v6 = a4;
  return -[IMAVPlayer _stopWithReason:initiator:stopBlock:](self, "_stopWithReason:initiator:stopBlock:", 3, a3, v5);
}

uint64_t __51__IMAVPlayer_pauseWithInitiator_interruptionEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pause:", *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)stopWithReason:(unint64_t)a3 initiator:(unint64_t)a4
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__IMAVPlayer_stopWithReason_initiator___block_invoke;
  v5[3] = &unk_1EA0C5138;
  v5[4] = self;
  return -[IMAVPlayer _stopWithReason:initiator:stopBlock:](self, "_stopWithReason:initiator:stopBlock:", a3, a4, v5);
}

uint64_t __39__IMAVPlayer_stopWithReason_initiator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stop");
}

- (BOOL)_stopWithReason:(unint64_t)a3 initiator:(unint64_t)a4 stopBlock:(id)a5
{
  uint64_t (**v8)(_QWORD);
  void *v9;
  char v10;
  void *v11;
  int v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  char v17;

  v8 = (uint64_t (**)(_QWORD))a5;
  -[IMAVPlayer causalityObserver](self, "causalityObserver");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[IMAVPlayer causalityObserver](self, "causalityObserver");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "player:willStopWithReason:initiator:", self, a3, a4);

  }
  v12 = v8[2](v8);
  if (v12)
  {
    -[IMAVPlayer causalityObserver](self, "causalityObserver");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) != 0)
    {
      -[IMAVPlayer causalityObserver](self, "causalityObserver");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "player:didStopWithReason:initiator:", self, a3, a4);
LABEL_8:

      goto LABEL_9;
    }
  }
  -[IMAVPlayer causalityObserver](self, "causalityObserver");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_opt_respondsToSelector();

  if ((v17 & 1) != 0)
  {
    -[IMAVPlayer causalityObserver](self, "causalityObserver");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "player:failedToStopWithReason:initiator:", self, a3, a4);
    goto LABEL_8;
  }
LABEL_9:

  return v12;
}

- (BOOL)pause
{
  NSObject *v3;
  uint8_t v5[16];

  objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1DA478000, v3, OS_LOG_TYPE_DEFAULT, "pause", v5, 2u);
  }

  -[IMAVPlayer setWasInterruptedEarly:](self, "setWasInterruptedEarly:", 0);
  return -[IMAVPlayer _pause](self, "_pause");
}

- (BOOL)_pause
{
  if (-[IMAVPlayer state](self, "state") != 2)
    -[IMAVPlayer setState:](self, "setState:", 0);
  return 1;
}

- (BOOL)_pause:(BOOL)a3
{
  BOOL result;
  NSObject *v6;
  uint8_t v7[16];

  if (a3 && !self->_stateChangeInterruptionFlag)
  {
    objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1DA478000, v6, OS_LOG_TYPE_DEFAULT, "Dropping pause command because it was the result of an interruption event", v7, 2u);
    }

    result = 0;
  }
  else
  {
    result = -[IMAVPlayer pause](self, "pause");
  }
  self->_stateChangeInterruptionFlag = a3;
  return result;
}

- (BOOL)stop
{
  NSObject *v3;
  double currentTime;
  void *v5;
  void *v6;
  uint8_t v8[8];
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1DA478000, v3, OS_LOG_TYPE_DEFAULT, "stop", v8, 2u);
  }

  v9 = CFSTR("IMAVPlayerNotificationKey_OldPlayheadTime");
  currentTime = self->_currentTime;
  *(float *)&currentTime = currentTime;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", currentTime);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMAVPlayer setCurrentTime:](self, "setCurrentTime:", 0.0);
  -[IMAVPlayer setState:additionalUserInfo:completion:](self, "setState:additionalUserInfo:completion:", 2, v6, 0);

  return 1;
}

- (BOOL)togglePlayPause
{
  NSObject *v3;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = -[IMAVPlayer isPlaybackRequested](self, "isPlaybackRequested");
    _os_log_impl(&dword_1DA478000, v3, OS_LOG_TYPE_DEFAULT, "togglePlayPause: %d", (uint8_t *)v5, 8u);
  }

  if (-[IMAVPlayer isPlaybackRequested](self, "isPlaybackRequested"))
    return -[IMAVPlayer pause](self, "pause");
  else
    return -[IMAVPlayer play](self, "play");
}

- (void)toggleVideoAspectScaleMode
{
  -[IMAVPlayer setVideoScale:](self, "setVideoScale:", -[IMAVPlayer videoScale](self, "videoScale") == 0);
}

- (void)sleep
{
  NSObject *v3;
  _QWORD v4[5];
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA478000, v3, OS_LOG_TYPE_DEFAULT, "sleep", buf, 2u);
  }

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __19__IMAVPlayer_sleep__block_invoke;
  v4[3] = &unk_1EA0C4FB0;
  v4[4] = self;
  -[IMAVPlayer fadeOutWithDuration:completion:](self, "fadeOutWithDuration:completion:", v4, 2.0);
}

uint64_t __19__IMAVPlayer_sleep__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "pauseWithInitiator:", 2);
}

- (void)fadeOut
{
  -[IMAVPlayer fadeOutWithDuration:](self, "fadeOutWithDuration:", 2.0);
}

- (void)fadeOutWithDuration:(double)a3
{
  -[IMAVPlayer fadeOutWithDuration:completion:](self, "fadeOutWithDuration:completion:", 0, a3);
}

- (void)fadeOutWithDuration:(double)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  float v11;
  OS_dispatch_source *v12;
  OS_dispatch_source *fadeOutTimer;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  _QWORD handler[5];
  _QWORD aBlock[5];
  void (**v19)(_QWORD);
  __int128 *p_buf;
  float v21;
  unsigned int v22;
  __int128 buf;
  uint64_t v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(_QWORD))a4;
  objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(double *)((char *)&buf + 4) = a3;
    _os_log_impl(&dword_1DA478000, v7, OS_LOG_TYPE_DEFAULT, "fadeOutWithDuration: %f", (uint8_t *)&buf, 0xCu);
  }

  if (self->_fadeOutTimer)
  {
    objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1DA478000, v8, OS_LOG_TYPE_DEFAULT, "fadeOutWithDuration: skipping!", (uint8_t *)&buf, 2u);
    }

    goto LABEL_16;
  }
  -[AVPlayer currentItem](self->_player, "currentItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && -[IMAVPlayer isPlaybackActive](self, "isPlaybackActive"))
  {

    if (a3 > 2.22044605e-16)
    {
      objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1DA478000, v10, OS_LOG_TYPE_DEFAULT, "fadeOutWithDuration: starting!", (uint8_t *)&buf, 2u);
      }

      v11 = 0.05 / a3;
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v24 = 0x2020000000;
      v25 = 0;
      v12 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
      fadeOutTimer = self->_fadeOutTimer;
      self->_fadeOutTimer = v12;

      dispatch_source_set_timer((dispatch_source_t)self->_fadeOutTimer, 0, 0x2FAF080uLL, 0);
      v14 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __45__IMAVPlayer_fadeOutWithDuration_completion___block_invoke;
      aBlock[3] = &unk_1EA0C5188;
      v21 = v11;
      aBlock[4] = self;
      p_buf = &buf;
      v22 = vcvtps_s32_f32(1.0 / v11);
      v19 = v6;
      v15 = _Block_copy(aBlock);
      dispatch_source_set_event_handler((dispatch_source_t)self->_fadeOutTimer, v15);
      v16 = self->_fadeOutTimer;
      handler[0] = v14;
      handler[1] = 3221225472;
      handler[2] = __45__IMAVPlayer_fadeOutWithDuration_completion___block_invoke_2;
      handler[3] = &unk_1EA0C4FB0;
      handler[4] = self;
      dispatch_source_set_cancel_handler(v16, handler);
      dispatch_resume((dispatch_object_t)self->_fadeOutTimer);

      _Block_object_dispose(&buf, 8);
      goto LABEL_16;
    }
  }
  else
  {

  }
  if (v6)
    v6[2](v6);
LABEL_16:

}

void __45__IMAVPlayer_fadeOutWithDuration_completion___block_invoke(uint64_t a1)
{
  void *v2;
  float v3;
  float v4;
  float v5;
  double v6;
  void *v7;
  double v8;
  uint64_t v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "player");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "volume");
  v4 = v3;

  v5 = v4 - *(float *)(a1 + 56);
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (v5 <= 0.00000011921 || *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) >= *(_DWORD *)(a1 + 60))
  {
    objc_msgSend(*(id *)(a1 + 32), "player");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = 0;
    objc_msgSend(v7, "setVolume:", v8);

    v9 = *(_QWORD *)(a1 + 40);
    if (v9)
      (*(void (**)(void))(v9 + 16))();
    objc_msgSend(*(id *)(a1 + 32), "cancelFadeOut");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "player");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    *(float *)&v6 = v5;
    objc_msgSend(v10, "setVolume:", v6);

  }
}

void __45__IMAVPlayer_fadeOutWithDuration_completion___block_invoke_2(uint64_t a1)
{
  double v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "player");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v1) = 1.0;
  objc_msgSend(v2, "setVolume:", v1);

}

- (void)setState:(unint64_t)a3
{
  -[IMAVPlayer setState:additionalUserInfo:completion:](self, "setState:additionalUserInfo:completion:", a3, 0, 0);
}

- (void)setState:(unint64_t)a3 additionalUserInfo:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD);
  double v10;
  unint64_t state;
  double currentTime;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id WeakRetained;
  int v22;
  unint64_t v23;
  _QWORD v24[3];
  _QWORD v25[4];

  v25[3] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = (void (**)(id, _QWORD))a5;
  state = self->_state;
  if (state != a3)
  {
    v24[0] = CFSTR("IMAVPlayerNotificationKey_CurrentPlayheadTime");
    currentTime = self->_currentTime;
    *(float *)&currentTime = currentTime;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", currentTime);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v13;
    v24[1] = CFSTR("IMAVPlayerNotificationKey_OldPlayerState");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_state);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v14;
    v24[2] = CFSTR("IMAVPlayerNotificationKey_NewPlayerState");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v25[2] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "mutableCopy");

    -[IMAVPlayer currentItem](self, "currentItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      -[IMAVPlayer currentItem](self, "currentItem");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKey:", v19, CFSTR("IMAVPlayerNotificationKey_CurrentMediaItem"));

    }
    if (v8)
      objc_msgSend(v17, "addEntriesFromDictionary:", v8);
    -[IMAVPlayer _postNotificationName:userInfo:](self, "_postNotificationName:userInfo:", CFSTR("IMAVPlayerNotification_StateWillChange"), v17);
    self->_state = a3;
    objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 134217984;
      v23 = a3;
      _os_log_impl(&dword_1DA478000, v20, OS_LOG_TYPE_DEFAULT, "setState %lu", (uint8_t *)&v22, 0xCu);
    }

    if ((*(_WORD *)&self->_delegateFlags & 1) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "playerStateChanged:", self);

    }
    -[IMAVPlayer _postNotificationName:userInfo:](self, "_postNotificationName:userInfo:", CFSTR("IMAVPlayerNotification_StateDidChange"), v17);
    -[IMAVPlayer updateRateForCurrentState:](self, "updateRateForCurrentState:", v9);

  }
  LODWORD(v10) = 0;
  -[IMAVPlayer scanWithRate:](self, "scanWithRate:", v10);
  -[IMAVPlayer setWasInterrupted:](self, "setWasInterrupted:", 0);
  -[IMAVPlayer setCurrentInterruptionTime:](self, "setCurrentInterruptionTime:", 0.0);
  -[IMAVPlayer setStateChangeInterruptionFlag:](self, "setStateChangeInterruptionFlag:", 0);
  if (v9 && state == a3)
    v9[2](v9, 0);

}

- (void)setWasInterrupted:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self->_wasInterrupted != a3)
  {
    v3 = a3;
    objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 67109120;
      v6[1] = v3;
      _os_log_impl(&dword_1DA478000, v5, OS_LOG_TYPE_DEFAULT, "setWasInterrupted: %d", (uint8_t *)v6, 8u);
    }

    self->_wasInterrupted = v3;
    -[IMAVPlayer updateInfoCenterPlaybackState](self, "updateInfoCenterPlaybackState");
  }
}

- (void)setWasInterruptedEarly:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self->_wasInterruptedEarly != a3)
  {
    v3 = a3;
    objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 67109120;
      v6[1] = v3;
      _os_log_impl(&dword_1DA478000, v5, OS_LOG_TYPE_DEFAULT, "setWasInterruptedEarly: %d", (uint8_t *)v6, 8u);
    }

    self->_wasInterruptedEarly = v3;
    -[IMAVPlayer updateInfoCenterPlaybackState](self, "updateInfoCenterPlaybackState");
  }
}

- (void)beginBackgroundTask
{
  void *v3;
  _QWORD v4[5];

  if (!self->_backgroundTask)
  {
    v3 = (void *)objc_opt_class();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __33__IMAVPlayer_beginBackgroundTask__block_invoke;
    v4[3] = &unk_1EA0C4FB0;
    v4[4] = self;
    objc_msgSend(v3, "performOnMainQueue:", v4);
  }
  IMEnsureCanInitiatePlaybackInBackground();
}

void __33__IMAVPlayer_beginBackgroundTask__block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[8];
  _QWORD v8[5];

  if (!objc_msgSend(*(id *)(a1 + 32), "backgroundTask"))
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "backgroundTimeRemaining");
    v4 = v3;

    if (v4 > 1.0)
    {
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __33__IMAVPlayer_beginBackgroundTask__block_invoke_2;
      v8[3] = &unk_1EA0C4FB0;
      v8[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 32), "setBackgroundTask:", objc_msgSend(v5, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("IMAVPlayer"), v8));

      objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_1DA478000, v6, OS_LOG_TYPE_DEFAULT, "beginBackgroundTask", v7, 2u);
      }

    }
  }
}

uint64_t __33__IMAVPlayer_beginBackgroundTask__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "endBackgroundTask");
}

uint64_t __31__IMAVPlayer_endBackgroundTask__block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;

  result = objc_msgSend(*(id *)(a1 + 32), "backgroundTask");
  if (result)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endBackgroundTask:", objc_msgSend(*(id *)(a1 + 32), "backgroundTask"));

    return objc_msgSend(*(id *)(a1 + 32), "setBackgroundTask:", 0);
  }
  return result;
}

- (id)stillFrameAt:(double)a3 maxSize:(CGSize)a4 scale:(double)a5
{
  double height;
  double width;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  uint64_t v15;
  CGImage *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  __int128 v26;
  id v27;
  CMTime v28;
  __int128 v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;

  height = a4.height;
  width = a4.width;
  v9 = (void *)MEMORY[0x1E0C8AFC8];
  -[IMAVPlayer currentItem](self, "currentItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "asset");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assetImageGeneratorWithAsset:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5 < 1.0)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "scale");
    a5 = v14;

  }
  objc_msgSend(v12, "setMaximumSize:", width * a5, height * a5);
  v31 = *MEMORY[0x1E0CA2E30];
  v26 = v31;
  v32 = *(_QWORD *)(MEMORY[0x1E0CA2E30] + 16);
  v15 = v32;
  objc_msgSend(v12, "setRequestedTimeToleranceBefore:", &v31);
  v29 = v26;
  v30 = v15;
  objc_msgSend(v12, "setRequestedTimeToleranceAfter:", &v29);
  CMTimeMakeWithSeconds(&v28, a3, 1000000000);
  v27 = 0;
  v16 = (CGImage *)objc_msgSend(v12, "copyCGImageAtTime:actualTime:error:", &v28, 0, &v27);
  v17 = v27;
  v18 = v17;
  if (v17)
  {
    objc_msgSend(v17, "localizedDescription");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("IMAVPlayer::stillFrameAt error: %@"), v19);

    v20 = 0;
  }
  else
  {
    v21 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "scale");
    v24 = v23;

    objc_msgSend(v21, "imageWithCGImage:scale:orientation:", v16, 0, v24);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  CGImageRelease(v16);

  return v20;
}

- (BOOL)airplayVideoActive
{
  _BOOL4 v3;

  v3 = -[AVPlayer isExternalPlaybackActive](self->_player, "isExternalPlaybackActive");
  if (v3)
    LOBYTE(v3) = -[AVPlayer externalPlaybackType](self->_player, "externalPlaybackType") == 1;
  return v3;
}

- (void)handlePlayerInterruption:(id)a3
{
  NSObject *v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  -[IMAVPlayer setWasInterruptedEarly:](self, "setWasInterruptedEarly:", -[IMAVPlayer isPlaybackRequested](self, "isPlaybackRequested", a3));
  objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = -[IMAVPlayer wasInterruptedEarly](self, "wasInterruptedEarly");
    _os_log_impl(&dword_1DA478000, v4, OS_LOG_TYPE_DEFAULT, "didHandlePlayerInterruption, wasInterruptedEarly %d", (uint8_t *)v5, 8u);
  }

}

- (void)handleAudioSessionInterruption:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _BOOL4 v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  _BOOL8 v14;
  NSObject *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  int v27;
  _BYTE v28[10];
  _BYTE v29[6];
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0C89718]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0C89700]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  v9 = -[IMAVPlayer isPlaybackRequested](self, "isPlaybackRequested");
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0C89708]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntegerValue");

  if (v11 == 1)
  {
    objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v27 = 67109632;
      *(_DWORD *)v28 = v9;
      *(_WORD *)&v28[4] = 1024;
      *(_DWORD *)&v28[6] = -[IMAVPlayer wasInterrupted](self, "wasInterrupted");
      *(_WORD *)v29 = 1024;
      *(_DWORD *)&v29[2] = -[IMAVPlayer wasInterruptedEarly](self, "wasInterruptedEarly");
      _os_log_impl(&dword_1DA478000, v12, OS_LOG_TYPE_DEFAULT, "ignoring wasSuspended interruption, wasPlaying: %d, wasInterrupted: %d, wasInterruptedEarly: %d", (uint8_t *)&v27, 0x14u);
    }

  }
  else if (v6)
  {
    if (v6 == 1)
    {
      objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v27 = 67109376;
        *(_DWORD *)v28 = v9;
        *(_WORD *)&v28[4] = 1024;
        *(_DWORD *)&v28[6] = -[IMAVPlayer wasInterruptedEarly](self, "wasInterruptedEarly");
        _os_log_impl(&dword_1DA478000, v13, OS_LOG_TYPE_DEFAULT, "handleInterruption began, wasPlaying %d, wasInterruptedEarly %d", (uint8_t *)&v27, 0xEu);
      }

      -[IMAVPlayer _pause](self, "_pause");
      v14 = v9 || -[IMAVPlayer wasInterruptedEarly](self, "wasInterruptedEarly");
      -[IMAVPlayer setWasInterrupted:](self, "setWasInterrupted:", v14);
      -[IMAVPlayer currentTime](self, "currentTime");
      -[IMAVPlayer setCurrentInterruptionTime:](self, "setCurrentInterruptionTime:");
      -[IMAVPlayer setWasInterruptedEarly:](self, "setWasInterruptedEarly:", 0);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v27 = 134218496;
      *(_QWORD *)v28 = v8;
      *(_WORD *)&v28[8] = 1024;
      *(_DWORD *)v29 = -[IMAVPlayer wasInterrupted](self, "wasInterrupted");
      *(_WORD *)&v29[4] = 1024;
      v30 = v8 & 1;
      _os_log_impl(&dword_1DA478000, v15, OS_LOG_TYPE_DEFAULT, "handleInterruption ended: %lu wasInterrupted: %d resumable: %d", (uint8_t *)&v27, 0x18u);
    }

    if ((v8 & 1) != 0 && -[IMAVPlayer wasInterrupted](self, "wasInterrupted"))
    {
      if (os_feature_enabled_rewind_on_interruption())
      {
        -[IMAVPlayer currentTime](self, "currentTime");
        v17 = v16;
        -[IMAVPlayer currentInterruptionTime](self, "currentInterruptionTime");
        if (v17 == v18)
        {
          -[IMAVPlayer currentTime](self, "currentTime");
          if (v19 >= 3.0)
          {
            -[IMAVPlayer currentTime](self, "currentTime");
            v21 = v20;
            -[IMAVPlayer previousInterruptionTime](self, "previousInterruptionTime");
            if (v21 < v22 + -3.0
              || (-[IMAVPlayer currentTime](self, "currentTime"),
                  v24 = v23,
                  -[IMAVPlayer previousInterruptionTime](self, "previousInterruptionTime"),
                  v24 > v25 + 3.0))
            {
              -[IMAVPlayer currentTime](self, "currentTime");
              -[IMAVPlayer setPreviousInterruptionTime:](self, "setPreviousInterruptionTime:");
              -[IMAVPlayer currentTime](self, "currentTime");
              -[IMAVPlayer setCurrentTime:](self, "setCurrentTime:", v26 + -3.0);
            }
          }
        }
      }
      -[IMAVPlayer play](self, "play");
    }
    -[IMAVPlayer setWasInterrupted:](self, "setWasInterrupted:", 0);
    -[IMAVPlayer setCurrentInterruptionTime:](self, "setCurrentInterruptionTime:", 0.0);
  }

}

- (void)onRouteChange:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  _QWORD v11[5];
  uint8_t buf[16];

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0C89880]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "integerValue") == 2)
  {
    objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DA478000, v6, OS_LOG_TYPE_DEFAULT, "route change: old device unavailable", buf, 2u);
    }

    v7 = -[IMAVPlayer wasInterrupted](self, "wasInterrupted");
    objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DA478000, v8, OS_LOG_TYPE_DEFAULT, "next endInterruption should NOT be resumable", buf, 2u);
      }

    }
    else
    {
      if (v9)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DA478000, v8, OS_LOG_TYPE_DEFAULT, "pausing: old device is unavailable", buf, 2u);
      }

      v10 = (void *)objc_opt_class();
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __28__IMAVPlayer_onRouteChange___block_invoke;
      v11[3] = &unk_1EA0C4FB0;
      v11[4] = self;
      objc_msgSend(v10, "performOnMainQueue:", v11);
    }
  }

}

uint64_t __28__IMAVPlayer_onRouteChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pause");
}

- (void)stopObservingPlayerItem:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "removeObserver:forKeyPath:", self, CFSTR("status"));
  objc_msgSend(v4, "removeObserver:forKeyPath:", self, CFSTR("playbackLikelyToKeepUp"));
  objc_msgSend(v4, "removeObserver:forKeyPath:", self, CFSTR("playbackBufferEmpty"));
  objc_msgSend(v4, "removeObserver:forKeyPath:", self, CFSTR("loadedTimeRanges"));
  objc_msgSend(v4, "removeObserver:forKeyPath:", self, CFSTR("presentationSize"));

}

- (void)stopObservingPlayer:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "removeObserver:forKeyPath:context:", self, CFSTR("currentItem"), 0);
  objc_msgSend(v4, "removeObserver:forKeyPath:context:", self, CFSTR("rate"), 0);
  objc_msgSend(v4, "removeObserver:forKeyPath:context:", self, CFSTR("timeControlStatus"), 0);
  objc_msgSend(v4, "removeObserver:forKeyPath:context:", self, CFSTR("volume"), 0);
  if (objc_msgSend(MEMORY[0x1E0D7F278], "platformSupportsVideo"))
    objc_msgSend(v4, "removeObserver:forKeyPath:context:", self, CFSTR("externalPlaybackActive"), 0);

}

- (void)resetPlayer:(id)a3
{
  NSObject *v4;
  void *v5;
  _QWORD v6[5];
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x1E0D7F1C0], "player", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA478000, v4, OS_LOG_TYPE_ERROR, "resetPlayer!", buf, 2u);
  }

  v5 = (void *)objc_opt_class();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __26__IMAVPlayer_resetPlayer___block_invoke;
  v6[3] = &unk_1EA0C4FB0;
  v6[4] = self;
  objc_msgSend(v5, "performOnMainQueue:", v6);
}

uint64_t __26__IMAVPlayer_resetPlayer___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;

  objc_msgSend(*(id *)(a1 + 32), "_postNotificationName:userInfo:", CFSTR("IMAVPlayerNotification_MediaServicesWillReset"), 0);
  objc_msgSend(*(id *)(a1 + 32), "setPlayer:", 0);
  objc_msgSend(*(id *)(a1 + 32), "currentItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reset");

  objc_msgSend(*(id *)(a1 + 32), "_pause");
  objc_msgSend(*(id *)(a1 + 32), "_createPlayer");
  objc_msgSend(*(id *)(a1 + 32), "_updatePlayerForCurrentItem");
  objc_msgSend(*(id *)(a1 + 32), "currentTime");
  objc_msgSend(*(id *)(a1 + 32), "setCurrentTime:", v3 + -1.0);
  return objc_msgSend(*(id *)(a1 + 32), "_postNotificationName:userInfo:", CFSTR("IMAVPlayerNotification_MediaServicesDidReset"), 0);
}

uint64_t __61__IMAVPlayer_observeValueForKeyPath_ofObject_change_context___block_invoke_183(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pause");
}

BOOL __61__IMAVPlayer_observeValueForKeyPath_ofObject_change_context___block_invoke_186(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  _BOOL4 v8;
  _BOOL8 v9;
  NSObject *v10;
  _BOOL4 v11;
  CMTimeValue v12;
  const char *v13;
  CMTimeValue v14;
  _OWORD v16[2];
  CMTime time;
  double v18;
  __int16 v19;
  double v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  memset(v16, 0, 24);
  if (v3)
    objc_msgSend(v3, "CMTimeRangeValue");
  *(_OWORD *)&time.value = 0u;
  time.epoch = *(_QWORD *)&v16[0];
  v5 = floor(CMTimeGetSeconds(&time));
  *(_OWORD *)&time.value = *(_OWORD *)((char *)v16 + 8);
  time.epoch = 0;
  v6 = floor(CMTimeGetSeconds(&time));
  v7 = *(double *)(a1 + 32);
  v8 = v7 >= v5;
  if (v7 > v5 + v6)
    v8 = 0;
  v9 = v5 + v6 - v7 > 30.0 && v8;
  objc_msgSend(MEMORY[0x1E0D7F1C0], "player", (unsigned __int128)0, *(_QWORD *)&v16[0]);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      v12 = *(_QWORD *)(a1 + 32);
      LODWORD(time.value) = 134218752;
      *(CMTimeValue *)((char *)&time.value + 4) = v12;
      LOWORD(time.flags) = 2048;
      *(double *)((char *)&time.flags + 2) = v5;
      HIWORD(time.epoch) = 2048;
      v18 = v6;
      v19 = 2048;
      v20 = v5 + v6;
      v13 = "Found resumable time range: playhead %f, start %f, duration %f, end %f";
LABEL_13:
      _os_log_impl(&dword_1DA478000, v10, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&time, 0x2Au);
    }
  }
  else if (v11)
  {
    v14 = *(_QWORD *)(a1 + 32);
    LODWORD(time.value) = 134218752;
    *(CMTimeValue *)((char *)&time.value + 4) = v14;
    LOWORD(time.flags) = 2048;
    *(double *)((char *)&time.flags + 2) = v5;
    HIWORD(time.epoch) = 2048;
    v18 = v6;
    v19 = 2048;
    v20 = v5 + v6;
    v13 = "Time range not resumable: playhead %f, start %f, duration %f, end %f";
    goto LABEL_13;
  }

  return v9;
}

- (void)playerItemDidReachEnd:(id)a3
{
  AVPlayer *player;
  id v5;
  void *v6;
  void *v7;
  int loops;
  BOOL v9;
  int v10;

  player = self->_player;
  v5 = a3;
  -[AVPlayer currentItem](player, "currentItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v7)
  {
    if (self->_loops)
    {
      -[IMAVPlayer setCurrentTime:](self, "setCurrentTime:", 0.0);
      loops = self->_loops;
      v9 = __OFSUB__(loops, 1);
      v10 = loops - 1;
      if (v10 < 0 == v9)
        self->_loops = v10;
    }
    else if (!-[IMAVPlayer scrubbing](self, "scrubbing"))
    {
      -[IMAVPlayer sendItemEndedNotification](self, "sendItemEndedNotification");
    }
  }
}

- (void)sendItemEndedNotification
{
  NSObject *v3;
  double v4;
  double v5;
  double v6;
  id WeakRetained;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  uint8_t v14[16];

  objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_1DA478000, v3, OS_LOG_TYPE_DEFAULT, "sendItemEndedNotification", v14, 2u);
  }

  -[IMAVPlayer duration](self, "duration");
  v5 = v4;
  -[IMAVPlayer duration](self, "duration");
  -[IMAVPlayer sendPeriodicTimeEvent:duration:finished:](self, "sendPeriodicTimeEvent:duration:finished:", 1, v5, v6);
  if ((*(_WORD *)&self->_delegateFlags & 0x100) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "playerCurrentItemEnded:", self);

  }
  -[IMAVPlayer causalityObserver](self, "causalityObserver");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[IMAVPlayer causalityObserver](self, "causalityObserver");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "player:willStopWithReason:initiator:", self, 13, 2);

  }
  -[IMAVPlayer nextMediaItem](self, "nextMediaItem");
  -[IMAVPlayer causalityObserver](self, "causalityObserver");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    -[IMAVPlayer causalityObserver](self, "causalityObserver");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "player:didStopWithReason:initiator:", self, 13, 2);

  }
}

- (void)_failedToPlayToEndNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t v12[8];
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1DA478000, v5, OS_LOG_TYPE_DEFAULT, "_failedToPlayToEndNotification", v12, 2u);
  }

  objc_msgSend(v4, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMAVPlayer playerItem](self, "playerItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v7)
  {
    objc_msgSend(v4, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0C8AC50]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "code") != -11870 && -[IMAVPlayer isPlaybackRequested](self, "isPlaybackRequested"))
    {
      -[IMAVPlayer pause](self, "pause");
      -[IMAVPlayer nextMediaItem](self, "nextMediaItem");
    }
    -[IMAVPlayer currentItem](self, "currentItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cleanupAfterError");

    v13 = CFSTR("IMAVPlayerNotificationKey_Error");
    v14[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMAVPlayer _postNotificationName:userInfo:](self, "_postNotificationName:userInfo:", CFSTR("IMAVPlayerNotification_FailedToPlayToEndTime"), v11);

  }
}

- (void)_setCurrentTime:(double)a3
{
  self->_currentTime = a3;
}

void __41__IMAVPlayer__updatePlayerToCurrentTime___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 48);
    v6 = 134218240;
    v7 = v5;
    v8 = 1024;
    v9 = a2;
    _os_log_impl(&dword_1DA478000, v4, OS_LOG_TYPE_DEFAULT, "_updatePlayerToTime: %f Finished %d", (uint8_t *)&v6, 0x12u);
  }

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_updatePlayerTimeCompleted:completion:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "updateNowPlayingDurationSnapshot");
  }
}

uint64_t __52__IMAVPlayer__updatePlayerTimeCompleted_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePlayerToCurrentTime:", *(_QWORD *)(a1 + 40));
}

- (void)startSeek:(BOOL)a3
{
  double v5;
  float v6;
  NSTimer *v7;
  NSTimer *seekTimer;
  double v9;

  if (a3)
    v5 = 2.0;
  else
    v5 = 1.0;
  if (!-[IMAVPlayer isSeeking](self, "isSeeking") || (-[IMAVPlayer requestedRate](self, "requestedRate"), v5 != v6))
  {
    -[IMAVPlayer cancelFadeOut](self, "cancelFadeOut");
    -[IMAVPlayer endSeek](self, "endSeek");
    self->_seekForward = a3;
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_onSeekTimer_, 0, 1, 0.8);
    v7 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    seekTimer = self->_seekTimer;
    self->_seekTimer = v7;

    *(float *)&v9 = v5;
    -[IMAVPlayer setRequestedRate:](self, "setRequestedRate:", v9);
    -[IMAVPlayer updateNowPlayingDurationSnapshot](self, "updateNowPlayingDurationSnapshot");
  }
}

- (void)endSeek
{
  -[IMAVPlayer cancelSeek](self, "cancelSeek");
  -[IMAVPlayer updateRateForCurrentState](self, "updateRateForCurrentState");
  -[IMAVPlayer updateNowPlayingDurationSnapshot](self, "updateNowPlayingDurationSnapshot");
}

- (BOOL)isSeeking
{
  return self->_seekTimer != 0;
}

- (void)onSeekTimer:(id)a3
{
  _BOOL4 seekForward;
  double v5;
  double v6;
  double v7;
  double v8;

  seekForward = self->_seekForward;
  -[IMAVPlayer currentTime](self, "currentTime", a3);
  if (seekForward)
  {
    v6 = v5 + 10.0;
  }
  else
  {
    v7 = v5 + -10.0;
    v6 = 0.0;
    if (v7 >= 0.0)
    {
      -[IMAVPlayer currentTime](self, "currentTime", 0.0);
      v6 = v8 + -10.0;
    }
  }
  -[IMAVPlayer setCurrentTime:](self, "setCurrentTime:", v6);
}

- (void)setScrubbing:(BOOL)a3
{
  if (self->_scrubbing != a3)
    self->_scrubbing = a3;
}

- (double)loadedDuration
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t i;
  void *v11;
  double Seconds;
  CMTimeRange v14;
  CMTime time;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[IMAVPlayer playerItem](self, "playerItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0.0;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[IMAVPlayer playerItem](self, "playerItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "loadedTimeRanges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    v9 = 0.0;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (v11)
          objc_msgSend(v11, "CMTimeRangeValue");
        else
          memset(&v14, 0, sizeof(v14));
        CMTimeRangeGetEnd(&time, &v14);
        Seconds = CMTimeGetSeconds(&time);
        if (Seconds > v9)
          v9 = Seconds;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }
  else
  {
    v9 = 0.0;
  }

  return v9;
}

- (BOOL)bufferEmpty
{
  void *v2;
  char v3;

  -[AVPlayer currentItem](self->_player, "currentItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPlaybackBufferEmpty");

  return v3;
}

- (void)scanWithRate:(float)a3
{
  double v5;
  void *v6;
  double v7;
  int v8;
  int v9;
  id v10;

  -[IMAVPlayer scanRate](self, "scanRate");
  if (*(float *)&v5 != a3)
  {
    *(float *)&v5 = a3;
    -[IMAVPlayer setScanRate:](self, "setScanRate:", v5);
    -[IMAVPlayer updateRateForCurrentState](self, "updateRateForCurrentState");
    if (-[IMAVPlayer isScanning](self, "isScanning"))
    {
      -[IMAVPlayer player](self, "player");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v7) = 0;
      v10 = v6;
    }
    else
    {
      -[IMAVPlayer storedVolume](self, "storedVolume");
      v9 = v8;
      -[IMAVPlayer player](self, "player");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v6;
      LODWORD(v7) = v9;
    }
    objc_msgSend(v6, "setVolume:", v7);

  }
}

- (void)addTimeObserver:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  CMTime v6;
  uint64_t v7;
  uint64_t v8;

  if (a3 >= 0.0)
  {
    v7 = v3;
    v8 = v4;
    CMTimeMakeWithSeconds(&v6, a3, 1000000000);
    -[IMAVPlayer addCMTimeObserver:](self, "addCMTimeObserver:", &v6);
  }
}

- (void)removeTimeObserver:(double)a3
{
  CMTime v4;

  CMTimeMakeWithSeconds(&v4, a3, 1000000000);
  -[IMAVPlayer removeCMTimeObserver:](self, "removeCMTimeObserver:", &v4);
}

- (void)removeCMTimeObserver:(id *)a3
{
  NSMutableArray *observingTimes;
  void *v4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5;

  observingTimes = self->_observingTimes;
  v5 = *a3;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCMTime:", &v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObject:](observingTimes, "removeObject:", v4);

}

void __38__IMAVPlayer_addPeriodicTimeObservers__block_invoke(uint64_t a1, CMTime *a2)
{
  id WeakRetained;
  double v4;
  double v5;
  double Seconds;
  CMTime v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "duration");
  v5 = v4;
  v7 = *a2;
  Seconds = CMTimeGetSeconds(&v7);
  if (objc_msgSend(WeakRetained, "isPlaybackActive"))
    objc_msgSend(WeakRetained, "sendPeriodicTimeEvent:duration:finished:", 0, Seconds, v5);

}

void __38__IMAVPlayer_addPeriodicTimeObservers__block_invoke_2(uint64_t a1, CMTime *a2)
{
  NSObject *v4;
  Float64 Seconds;
  id WeakRetained;
  double v7;
  void *v8;
  CMTime v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *a2;
    Seconds = CMTimeGetSeconds(&v9);
    LODWORD(v9.value) = 134217984;
    *(Float64 *)((char *)&v9.value + 4) = Seconds;
    _os_log_impl(&dword_1DA478000, v4, OS_LOG_TYPE_DEFAULT, "periodic time observer: %f", (uint8_t *)&v9, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "isPlaybackActive")
    && (objc_msgSend(WeakRetained, "isUpdatingCurrentTime") & 1) == 0)
  {
    v9 = *a2;
    v7 = CMTimeGetSeconds(&v9);
    objc_msgSend(WeakRetained, "_setCurrentTime:");
    objc_msgSend(WeakRetained, "currentItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPlayhead:", v7);

  }
  objc_msgSend(WeakRetained, "updateNowPlayingDurationSnapshot");

}

uint64_t __32__IMAVPlayer_setupTimeObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "triggerTimeObserverAt:", *(_QWORD *)(a1 + 32));
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  id v5;
  id v6;
  __int16 v7;
  id v8;
  __int16 v9;
  id v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    v5 = objc_storeWeak((id *)&self->_delegate, obj);
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFFE | objc_opt_respondsToSelector() & 1;

    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = 2;
    else
      v7 = 0;
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFFD | v7;

    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = 4;
    else
      v9 = 0;
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFFB | v9;

    v10 = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = 8;
    else
      v11 = 0;
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFF7 | v11;

    v12 = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v13 = 16;
    else
      v13 = 0;
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFEF | v13;

    v14 = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v15 = 32;
    else
      v15 = 0;
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFDF | v15;

    v16 = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v17 = 64;
    else
      v17 = 0;
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFBF | v17;

    v18 = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v19 = 128;
    else
      v19 = 0;
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFF7F | v19;

    v20 = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v21 = 256;
    else
      v21 = 0;
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFEFF | v21;

    v22 = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v23 = 512;
    else
      v23 = 0;
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFDFF | v23;

    v24 = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v25 = 1024;
    else
      v25 = 0;
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFBFF | v25;

    v26 = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v27 = 2048;
    else
      v27 = 0;
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xF7FF | v27;

  }
}

- (BOOL)hasChapters
{
  return -[IMAVPlayer chapterCount](self, "chapterCount") != 0;
}

- (unint64_t)chapterCount
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[IMAVPlayer currentItem](self, "currentItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeChapters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (void)setCurrentChapterIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  CMTime v8;
  CMTime time;

  if (-[IMAVPlayer chapterCount](self, "chapterCount") > a3)
  {
    -[IMAVPlayer _setChapterIndex:](self, "_setChapterIndex:", a3);
    -[IMAVPlayer currentItem](self, "currentItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeChapters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndex:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      objc_msgSend(v7, "assetTimeRange");
    else
      memset(&v8, 0, sizeof(v8));
    time = v8;
    -[IMAVPlayer setCurrentTime:](self, "setCurrentTime:", CMTimeGetSeconds(&time));

  }
}

- (IMPlayerChapterInfo)currentChapter
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t currentChapterIndex;
  unint64_t v9;
  void *v10;

  -[IMAVPlayer currentItem](self, "currentItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeChapters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMAVPlayer currentItem](self, "currentItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeChapters");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {

    goto LABEL_5;
  }
  v7 = (void *)v6;
  currentChapterIndex = self->_currentChapterIndex;
  v9 = objc_msgSend(v4, "count");

  if (currentChapterIndex >= v9)
  {
LABEL_5:
    v10 = 0;
    goto LABEL_6;
  }
  objc_msgSend(v4, "objectAtIndex:", self->_currentChapterIndex);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return (IMPlayerChapterInfo *)v10;
}

void __33__IMAVPlayer_setupChapterAtTime___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "player:chapterStarted:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)nextChapter
{
  NSObject *v3;
  uint8_t v4[16];

  objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DA478000, v3, OS_LOG_TYPE_DEFAULT, "nextChapter", v4, 2u);
  }

  -[IMAVPlayer setCurrentChapterIndex:](self, "setCurrentChapterIndex:", -[IMAVPlayer currentChapterIndex](self, "currentChapterIndex") + 1);
}

- (void)previousChapter
{
  NSObject *v3;
  uint8_t v4[16];

  objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DA478000, v3, OS_LOG_TYPE_DEFAULT, "previousChapter", v4, 2u);
  }

  -[IMAVPlayer setCurrentChapterIndex:](self, "setCurrentChapterIndex:", -[IMAVPlayer currentChapterIndex](self, "currentChapterIndex") - 1);
}

- (void)setAutoStop:(unint64_t)a3
{
  if (self->_autoStop != a3)
  {
    -[IMAVPlayer _clearAutoStop](self, "_clearAutoStop");
    self->_autoStop = a3;
    if (a3 == 1)
      -[IMAVPlayer _setupAutoStopTimer](self, "_setupAutoStopTimer");
  }
}

- (void)setAutoStopTimerTime:(double)a3
{
  self->_autoStopTimerTime = a3;
  -[IMAVPlayer _clearAutoStopTimmer](self, "_clearAutoStopTimmer");
  -[IMAVPlayer _setupAutoStopTimer](self, "_setupAutoStopTimer");
}

- (void)_setupAutoStopTimer
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  const char *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[6];
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA478000, v3, OS_LOG_TYPE_INFO, "_setupAutoStopTimer", buf, 2u);
  }

  if (-[IMAVPlayer autoStop](self, "autoStop") != 1 || !-[IMAVPlayer isPlaybackRequested](self, "isPlaybackRequested"))
  {
    objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v6 = "_setupAutoStopTimer: abort, not timer mode or playing back!";
      goto LABEL_10;
    }
LABEL_11:

    return;
  }
  -[IMAVPlayer autoStopTimer](self, "autoStopTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v6 = "_setupAutoStopTimer: abort, timer exists!";
LABEL_10:
      _os_log_impl(&dword_1DA478000, v5, OS_LOG_TYPE_INFO, v6, buf, 2u);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  -[IMAVPlayer autoStopTimerPausedTime](self, "autoStopTimerPausedTime");
  if (v7 <= 0.0)
  {
    -[IMAVPlayer autoStopTimerTime](self, "autoStopTimerTime");
    if (v10 <= 0.0)
    {
      objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
      v5 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        goto LABEL_11;
      *(_WORD *)buf = 0;
      v6 = "_setupAutoStopTimer: abort, no time!";
      goto LABEL_10;
    }
    -[IMAVPlayer autoStopTimerTime](self, "autoStopTimerTime");
    v9 = v11 + -2.0;
  }
  else
  {
    -[IMAVPlayer autoStopTimerPausedTime](self, "autoStopTimerPausedTime");
    v9 = v8;
  }
  objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA478000, v12, OS_LOG_TYPE_INFO, "_setupAutoStopTimer: created timer!", buf, 2u);
  }

  v13 = (void *)objc_opt_class();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __33__IMAVPlayer__setupAutoStopTimer__block_invoke;
  v14[3] = &unk_1EA0C5270;
  v14[4] = self;
  *(double *)&v14[5] = v9;
  objc_msgSend(v13, "performOnMainQueue:", v14);
}

uint64_t __33__IMAVPlayer__setupAutoStopTimer__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", *(_QWORD *)(a1 + 32), sel__autoStopTimerFired, 0, 0, *(double *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setAutoStopTimer:", v2);

  return objc_msgSend(*(id *)(a1 + 32), "setAutoStopTimerPausedTime:", 0.0);
}

- (void)_autoStopTimerFired
{
  NSObject *v3;
  uint8_t v4[16];

  objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DA478000, v3, OS_LOG_TYPE_INFO, "_autoStopTimerFired", v4, 2u);
  }

  -[IMAVPlayer enforceAutoStopForMode:](self, "enforceAutoStopForMode:", 1);
}

- (void)enforceAutoStopForMode:(unint64_t)a3
{
  NSObject *v5;
  int v6;
  unint64_t v7;
  __int16 v8;
  unint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 134218240;
    v7 = a3;
    v8 = 2048;
    v9 = -[IMAVPlayer autoStop](self, "autoStop");
    _os_log_impl(&dword_1DA478000, v5, OS_LOG_TYPE_INFO, "enforceAutoStopForMode: %lu, withCurrentMode: %lu", (uint8_t *)&v6, 0x16u);
  }

  if (-[IMAVPlayer autoStop](self, "autoStop") == a3)
  {
    if (a3 <= 4 && ((1 << a3) & 0x13) != 0)
      -[IMAVPlayer sleep](self, "sleep");
    else
      -[IMAVPlayer pauseWithInitiator:](self, "pauseWithInitiator:", 2);
    -[IMAVPlayer setAutoStop:](self, "setAutoStop:", 0);
    -[IMAVPlayer _postNotificationName:userInfo:](self, "_postNotificationName:userInfo:", CFSTR("IMAVPlayerNotification_AutoStopModeDidChange"), 0);
  }
}

- (void)_clearAutoStop
{
  NSObject *v3;
  uint8_t v4[16];

  objc_msgSend(MEMORY[0x1E0D7F1C0], "player");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DA478000, v3, OS_LOG_TYPE_INFO, "clearAutoStop", v4, 2u);
  }

  self->_autoStop = 0;
  -[IMAVPlayer setAutoStopTimerPausedTime:](self, "setAutoStopTimerPausedTime:", 0.0);
  -[IMAVPlayer setAutoStopTimerTime:](self, "setAutoStopTimerTime:", 0.0);
  -[IMAVPlayer _clearAutoStopTimmer](self, "_clearAutoStopTimmer");
}

- (IMAVPlaybackCausalityObserver)causalityObserver
{
  return (IMAVPlaybackCausalityObserver *)objc_loadWeakRetained((id *)&self->_causalityObserver);
}

- (IMAVPlayerDelegate)delegate
{
  return (IMAVPlayerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (id)playbackErrorFallback
{
  return self->_playbackErrorFallback;
}

- (void)setPlaybackErrorFallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (double)autoStopTimerTime
{
  return self->_autoStopTimerTime;
}

- (void)setAutoStopMediaTime:(double)a3
{
  self->_autoStopMediaTime = a3;
}

- (unint64_t)videoScale
{
  return self->_videoScale;
}

- (void)setVideoScale:(unint64_t)a3
{
  self->_videoScale = a3;
}

- (void)setVideoViewController:(id)a3
{
  objc_storeStrong((id *)&self->_videoViewController, a3);
}

- (BOOL)externalDisplay
{
  return self->_externalDisplay;
}

- (int)loops
{
  return self->_loops;
}

- (void)setLoops:(int)a3
{
  self->_loops = a3;
}

- (NSURL)lastPlayingURL
{
  return self->_lastPlayingURL;
}

- (void)setLastPlayingURL:(id)a3
{
  objc_storeStrong((id *)&self->_lastPlayingURL, a3);
}

- (unint64_t)backgroundTask
{
  return self->_backgroundTask;
}

- (void)setBackgroundTask:(unint64_t)a3
{
  self->_backgroundTask = a3;
}

- (NSTimer)hdcpTimer
{
  return self->_hdcpTimer;
}

- (void)setHdcpTimer:(id)a3
{
  objc_storeStrong((id *)&self->_hdcpTimer, a3);
}

- (NSTimer)seekTimer
{
  return self->_seekTimer;
}

- (void)setSeekTimer:(id)a3
{
  objc_storeStrong((id *)&self->_seekTimer, a3);
}

- (NSMutableArray)timeObservers
{
  return self->_timeObservers;
}

- (void)setTimeObservers:(id)a3
{
  objc_storeStrong((id *)&self->_timeObservers, a3);
}

- (NSMutableArray)observingTimes
{
  return self->_observingTimes;
}

- (void)setObservingTimes:(id)a3
{
  objc_storeStrong((id *)&self->_observingTimes, a3);
}

- (BOOL)timeObserverNeedsUpdate
{
  return self->_timeObserverNeedsUpdate;
}

- (void)setTimeObserverNeedsUpdate:(BOOL)a3
{
  self->_timeObserverNeedsUpdate = a3;
}

- (BOOL)seekForward
{
  return self->_seekForward;
}

- (void)setSeekForward:(BOOL)a3
{
  self->_seekForward = a3;
}

- (void)setDelegateFlags:(id)a3
{
  self->_delegateFlags = ($2C1CFCBF620F04027A96DCE3CA271CD9)a3;
}

- (OS_dispatch_source)fadeOutTimer
{
  return self->_fadeOutTimer;
}

- (void)setFadeOutTimer:(id)a3
{
  objc_storeStrong((id *)&self->_fadeOutTimer, a3);
}

- (BOOL)stateChangeInterruptionFlag
{
  return self->_stateChangeInterruptionFlag;
}

- (void)setStateChangeInterruptionFlag:(BOOL)a3
{
  self->_stateChangeInterruptionFlag = a3;
}

- (double)currentInterruptionTime
{
  return self->_currentInterruptionTime;
}

- (void)setCurrentInterruptionTime:(double)a3
{
  self->_currentInterruptionTime = a3;
}

- (double)previousInterruptionTime
{
  return self->_previousInterruptionTime;
}

- (void)setPreviousInterruptionTime:(double)a3
{
  self->_previousInterruptionTime = a3;
}

- (void)setAutoStopTimer:(id)a3
{
  objc_storeStrong((id *)&self->_autoStopTimer, a3);
}

- (double)autoStopTimerPausedTime
{
  return self->_autoStopTimerPausedTime;
}

- (AVPlayerLayer)videoLayer
{
  return self->_videoLayer;
}

- (void)setVideoLayer:(id)a3
{
  objc_storeStrong((id *)&self->_videoLayer, a3);
}

- (UIWindow)externalVideoWindow
{
  return self->_externalVideoWindow;
}

- (void)setExternalVideoWindow:(id)a3
{
  objc_storeStrong((id *)&self->_externalVideoWindow, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalVideoWindow, 0);
  objc_storeStrong((id *)&self->_videoLayer, 0);
  objc_storeStrong((id *)&self->_autoStopTimer, 0);
  objc_storeStrong(&self->_nowPlayingInfoPeriodicTimeObserver, 0);
  objc_storeStrong(&self->_periodicTimeObserver, 0);
  objc_storeStrong((id *)&self->_audioSession, 0);
  objc_storeStrong((id *)&self->_fadeOutTimer, 0);
  objc_storeStrong((id *)&self->_observingTimes, 0);
  objc_storeStrong((id *)&self->_timeObservers, 0);
  objc_storeStrong((id *)&self->_seekTimer, 0);
  objc_storeStrong((id *)&self->_hdcpTimer, 0);
  objc_storeStrong((id *)&self->_lastPlayingURL, 0);
  objc_storeStrong((id *)&self->_videoViewController, 0);
  objc_storeStrong(&self->_playbackErrorFallback, 0);
  objc_storeStrong((id *)&self->_currentItem, 0);
  objc_storeStrong((id *)&self->_manifest, 0);
  objc_storeStrong((id *)&self->_playerItem, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_commandCenter, 0);
  objc_storeStrong((id *)&self->_infoCenter, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_causalityObserver);
}

@end
