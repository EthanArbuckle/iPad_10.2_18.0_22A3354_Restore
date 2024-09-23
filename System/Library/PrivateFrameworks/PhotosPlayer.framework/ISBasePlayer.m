@implementation ISBasePlayer

- (void)removeOutput:(id)a3
{
  id v4;

  v4 = a3;
  -[ISBasePlayer willRemoveOutput:](self, "willRemoveOutput:", v4);
  -[NSHashTable removeObject:](self->_outputs, "removeObject:", v4);

}

- (void)willRemoveOutput:(id)a3
{
  objc_msgSend(a3, "setContent:", 0);
}

- (ISBehavior)activeBehavior
{
  return self->_activeBehavior;
}

- (ISWrappedAVPlayer)videoPlayer
{
  return self->_videoPlayer;
}

- (void)dealloc
{
  ISBehavior *activeBehavior;
  ISWrappedAVPlayer *v4;
  ISWrappedAVPlayer *v5;
  id WeakRetained;
  void *v7;
  objc_super v8;

  -[ISBehavior setDelegate:](self->_activeBehavior, "setDelegate:", 0);
  activeBehavior = self->_activeBehavior;
  self->_activeBehavior = 0;

  v4 = self->_videoPlayer;
  v5 = v4;
  if (self->__videoWillPlayToEndObserver)
    -[ISWrappedAVPlayer removeTimeObserver:](v4, "removeTimeObserver:");
  -[ISWrappedAVPlayer cancelPendingPrerolls](v5, "cancelPendingPrerolls");
  if (self->_videoPlayer)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "playerWillRelinquishVideoPlayer:", self->_videoPlayer);

  }
  +[ISDeferredDealloc sharedInstance](ISDeferredDealloc, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_performDeferredDealloc:", v5);

  v8.receiver = self;
  v8.super_class = (Class)ISBasePlayer;
  -[ISBasePlayer dealloc](&v8, sel_dealloc);
}

- (void)behavior:(id)a3 didSetOutputInfo:(id)a4 withTransitionOptions:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[ISBasePlayer activeBehavior](self, "activeBehavior");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (v14 == v10)
  {
    -[ISBasePlayer applyOutputInfo:fromBehavior:withTransitionOptions:completion:](self, "applyOutputInfo:fromBehavior:withTransitionOptions:completion:", v11, v10, v12, v13);
  }
  else
  {
    ISGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v16 = 138412290;
      v17 = v10;
      _os_log_debug_impl(&dword_1D2DCA000, v15, OS_LOG_TYPE_DEBUG, "Ignoring output from behavior that is not active: %@", (uint8_t *)&v16, 0xCu);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceReclamationController, 0);
  objc_storeStrong((id *)&self->__outputContent, 0);
  objc_storeStrong((id *)&self->_lastAppliedLayoutInfo, 0);
  objc_storeStrong(&self->__videoWillPlayToPhotoObserver, 0);
  objc_storeStrong(&self->__videoWillPlayToEndObserver, 0);
  objc_storeStrong((id *)&self->_activeBehavior, 0);
  objc_storeStrong((id *)&self->_videoPlayer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_playerItem, 0);
  objc_storeStrong((id *)&self->_apertureMode, 0);
  objc_storeStrong((id *)&self->_outputs, 0);
  objc_storeStrong((id *)&self->_outputQueue, 0);
  objc_storeStrong((id *)&self->_providedAVPlayer, 0);
}

- (ISBasePlayer)init
{
  return -[ISBasePlayer initWithVideoPlayer:](self, "initWithVideoPlayer:", 0);
}

- (ISBasePlayer)initWithVideoPlayer:(id)a3
{
  id v5;
  ISBasePlayer *v6;
  ISBasePlayer *v7;
  uint64_t v8;
  NSHashTable *outputs;
  uint64_t v10;
  PXAVResourceReclamationController *v11;
  PXAVResourceReclamationController *resourceReclamationController;
  ISDefaultBehavior *v13;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ISBasePlayer;
  v6 = -[ISObservable init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_audioVolume = 1.0;
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v8 = objc_claimAutoreleasedReturnValue();
    outputs = v7->_outputs;
    v7->_outputs = (NSHashTable *)v8;

    objc_storeStrong((id *)&v7->_providedAVPlayer, a3);
    v10 = MEMORY[0x1E0CA2E30];
    *(_OWORD *)&v7->value = *MEMORY[0x1E0CA2E30];
    v7->epoch = *(_QWORD *)(v10 + 16);
    v7->_lastAppliedScale = 1.0;
    v7->_audioEnabled = 1;
    objc_storeStrong((id *)&v7->_apertureMode, (id)*MEMORY[0x1E0C8AE18]);
    v11 = (PXAVResourceReclamationController *)objc_alloc_init(MEMORY[0x1E0D78240]);
    resourceReclamationController = v7->_resourceReclamationController;
    v7->_resourceReclamationController = v11;

    -[PXAVResourceReclamationController registerObserver:](v7->_resourceReclamationController, "registerObserver:", v7);
    v13 = objc_alloc_init(ISDefaultBehavior);
    -[ISBasePlayer setActiveBehavior:](v7, "setActiveBehavior:", v13);

  }
  return v7;
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  $92C2792916B7BF6B4F62333F5B4D57C0 *p_delegateRespondsTo;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    p_delegateRespondsTo = &self->_delegateRespondsTo;
    p_delegateRespondsTo->wrappedVideoPlayerForPlayer = objc_opt_respondsToSelector() & 1;
    p_delegateRespondsTo->videoPlayerForPlayer = objc_opt_respondsToSelector() & 1;
    p_delegateRespondsTo->playerWillRelinquishVideoPlayer = objc_opt_respondsToSelector() & 1;
  }

}

- (void)setPlayerItem:(id)a3
{
  ISPlayerItem *v4;
  ISPlayerItem *v5;
  _QWORD v6[5];
  ISPlayerItem *v7;

  v4 = (ISPlayerItem *)a3;
  v5 = v4;
  if (self->_playerItem != v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __30__ISBasePlayer_setPlayerItem___block_invoke;
    v6[3] = &unk_1E9454180;
    v6[4] = self;
    v7 = v4;
    -[ISObservable performChanges:](self, "performChanges:", v6);

  }
}

- (void)playerItemDidChange
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __35__ISBasePlayer_playerItemDidChange__block_invoke;
  v2[3] = &unk_1E9454220;
  v2[4] = self;
  -[ISObservable performChanges:](self, "performChanges:", v2);
}

- (void)statusDidChange
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __31__ISBasePlayer_statusDidChange__block_invoke;
  v2[3] = &unk_1E9454220;
  v2[4] = self;
  -[ISObservable performChanges:](self, "performChanges:", v2);
}

- (void)addOutput:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  id v10;
  id from;
  id location;

  v4 = a3;
  -[NSHashTable addObject:](self->_outputs, "addObject:", v4);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_initWeak(&location, self);
    objc_initWeak(&from, v4);
    v5 = MEMORY[0x1E0C809B0];
    v6 = 3221225472;
    v7 = __26__ISBasePlayer_addOutput___block_invoke;
    v8 = &unk_1E94533F0;
    objc_copyWeak(&v9, &location);
    objc_copyWeak(&v10, &from);
    objc_msgSend(v4, "setVideoLayerReadyForDisplayChangeHandler:", &v5);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  -[ISBasePlayer didAddOutput:](self, "didAddOutput:", v4, v5, v6, v7, v8);

}

- (void)_outputVideoReadyForDisplayDidChange:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__ISBasePlayer__outputVideoReadyForDisplayDidChange___block_invoke;
  v6[3] = &unk_1E9454130;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  is_dispatch_on_main_queue(v6);

}

- (BOOL)videoLayersReadyForDisplay
{
  NSHashTable *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = self->_outputs;
  v3 = -[NSHashTable countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0
          && !objc_msgSend(v7, "isVideoReadyForDisplay", (_QWORD)v10))
        {
          v8 = 0;
          goto LABEL_12;
        }
      }
      v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
  v8 = 1;
LABEL_12:

  return v8;
}

- (void)_videoDidPlayToEnd
{
  id v2;

  -[ISBasePlayer activeBehavior](self, "activeBehavior");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "videoDidPlayToEnd");

}

- (void)_videoWillPlayToPhoto
{
  id v2;

  -[ISBasePlayer activeBehavior](self, "activeBehavior");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "videoWillPlayToPhoto");

}

- (void)_videoWillPlayToEnd
{
  id v2;

  -[ISBasePlayer activeBehavior](self, "activeBehavior");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "videoWillPlayToEnd");

}

- (double)videoWillPlayToEndInterval
{
  return 0.065;
}

- (double)videoWillPlayToPhotoInterval
{
  return 0.065;
}

- (void)setAudioEnabled:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  if (self->_audioEnabled != a3)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __32__ISBasePlayer_setAudioEnabled___block_invoke;
    v3[3] = &unk_1E9453A58;
    v3[4] = self;
    v4 = a3;
    -[ISObservable performChanges:](self, "performChanges:", v3);
  }
}

- (void)setAudioVolume:(float)a3
{
  _QWORD v3[5];
  float v4;

  if (self->_audioVolume != a3)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __31__ISBasePlayer_setAudioVolume___block_invoke;
    v3[3] = &unk_1E9453710;
    v3[4] = self;
    v4 = a3;
    -[ISObservable performChanges:](self, "performChanges:", v3);
  }
}

- (void)setActiveBehavior:(id)a3
{
  ISBehavior *v5;
  ISBehavior **p_activeBehavior;
  ISBehavior *activeBehavior;
  NSObject *v8;
  int v9;
  ISBehavior *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = (ISBehavior *)a3;
  p_activeBehavior = &self->_activeBehavior;
  activeBehavior = self->_activeBehavior;
  if (activeBehavior != v5)
  {
    -[ISBehavior setDelegate:](activeBehavior, "setDelegate:", 0);
    -[ISBehavior resignActive](*p_activeBehavior, "resignActive");
    ISGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v9 = 138412290;
      v10 = v5;
      _os_log_debug_impl(&dword_1D2DCA000, v8, OS_LOG_TYPE_DEBUG, "ACTIVE BEHAVIOR: %@", (uint8_t *)&v9, 0xCu);
    }

    objc_storeStrong((id *)&self->_activeBehavior, a3);
    -[ISBehavior setDelegate:](*p_activeBehavior, "setDelegate:", self);
    -[ISBehavior becomeActive](*p_activeBehavior, "becomeActive");
    -[ISBasePlayer activeBehaviorDidChange](self, "activeBehaviorDidChange");
  }

}

- (void)applyScale:(double)a3 withTransitionOptions:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  dispatch_group_t v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _BYTE *v17;
  _QWORD v18[4];
  NSObject *v19;
  id v20;
  _BYTE *v21;
  double v22;
  _BYTE buf[24];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  ISGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = a3;
    *(_WORD *)&buf[22] = 2112;
    v24 = v8;
    _os_log_debug_impl(&dword_1D2DCA000, v10, OS_LOG_TYPE_DEBUG, "%@: will apply scale %.2f\n\toptions: %@", buf, 0x20u);
  }

  -[ISBasePlayer _setLastAppliedScale:](self, "_setLastAppliedScale:", a3);
  v11 = dispatch_group_create();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  LOBYTE(v24) = 1;
  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __60__ISBasePlayer_applyScale_withTransitionOptions_completion___block_invoke;
  v18[3] = &unk_1E9453418;
  v13 = v11;
  v19 = v13;
  v22 = a3;
  v14 = v8;
  v20 = v14;
  v21 = buf;
  -[ISBasePlayer enumerateOutputsWithBlock:](self, "enumerateOutputsWithBlock:", v18);
  if (v9)
  {
    v15[0] = v12;
    v15[1] = 3221225472;
    v15[2] = __60__ISBasePlayer_applyScale_withTransitionOptions_completion___block_invoke_3;
    v15[3] = &unk_1E9453DD0;
    v16 = v9;
    v17 = buf;
    dispatch_group_notify(v13, MEMORY[0x1E0C80D38], v15);

  }
  _Block_object_dispose(buf, 8);

}

- (void)applyOutputInfo:(id)a3 fromBehavior:(id)a4 withTransitionOptions:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  dispatch_group_t v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _BYTE *v22;
  _QWORD v23[4];
  NSObject *v24;
  id v25;
  id v26;
  _BYTE *v27;
  _BYTE buf[24];
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  ISGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2112;
    v29 = v10;
    v30 = 2112;
    v31 = v12;
    _os_log_debug_impl(&dword_1D2DCA000, v14, OS_LOG_TYPE_DEBUG, "%@: will apply output info: %@ - %@\n\toptions: %@", buf, 0x2Au);
  }

  -[ISBasePlayer _setLastAppliedLayoutInfo:](self, "_setLastAppliedLayoutInfo:", v10);
  v15 = dispatch_group_create();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  LOBYTE(v29) = 1;
  v16 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __78__ISBasePlayer_applyOutputInfo_fromBehavior_withTransitionOptions_completion___block_invoke;
  v23[3] = &unk_1E9453468;
  v17 = v15;
  v24 = v17;
  v18 = v10;
  v25 = v18;
  v19 = v12;
  v26 = v19;
  v27 = buf;
  -[ISBasePlayer enumerateOutputsWithBlock:](self, "enumerateOutputsWithBlock:", v23);
  if (v13)
  {
    v20[0] = v16;
    v20[1] = 3221225472;
    v20[2] = __78__ISBasePlayer_applyOutputInfo_fromBehavior_withTransitionOptions_completion___block_invoke_4;
    v20[3] = &unk_1E9453DD0;
    v21 = v13;
    v22 = buf;
    dispatch_group_notify(v17, MEMORY[0x1E0C80D38], v20);

  }
  _Block_object_dispose(buf, 8);

}

- (void)enumerateOutputsWithBlock:(id)a3
{
  void (**v4)(id, _QWORD);
  NSHashTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_outputs;
  v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_configureNewOutput:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[ISBasePlayer _outputContent](self, "_outputContent");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContent:", v6);
  -[ISBasePlayer lastAppliedLayoutInfo](self, "lastAppliedLayoutInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applyOutputInfo:withTransitionOptions:completion:", v5, 0, 0);

}

- (void)_invalidateContentFromPlayerItem
{
  self->_isValid.contentFromPlayerItem = 0;
}

- (void)_updateContentFromPlayerItemIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  ISPlayerOutputContent *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  ISPlayerOutputContent *v15;
  unsigned int v16;
  id v17;

  if (!self->_isValid.contentFromPlayerItem)
  {
    self->_isValid.contentFromPlayerItem = 1;
    -[ISBasePlayer playerItem](self, "playerItem");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "playerContent");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
      v16 = objc_msgSend(v3, "photoIsOriginal");
    else
      v16 = 1;
    -[ISBasePlayer videoPlayer](self, "videoPlayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "videoPlayerItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISBasePlayer apertureMode](self, "apertureMode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "asset");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "asset");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 == v10)
    {
      objc_msgSend(v7, "setVideoApertureMode:", v8);
    }
    else
    {
      objc_msgSend(v6, "setVideoApertureMode:", v8);
      objc_msgSend(v5, "replaceCurrentItemWithPlayerItem:", v6);
    }
    v11 = [ISPlayerOutputContent alloc];
    v12 = objc_msgSend(v4, "photo");
    v13 = objc_msgSend(v4, "photoEXIFOrientation");
    objc_msgSend(v17, "contentAspectRatio");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[ISPlayerOutputContent initWithPhoto:photoIsOriginal:photoEXIFOrientation:videoPlayer:aspectRatio:](v11, "initWithPhoto:photoIsOriginal:photoEXIFOrientation:videoPlayer:aspectRatio:", v12, v16, v13, v5, v14);

    -[ISBasePlayer _setOutputContent:](self, "_setOutputContent:", v15);
  }
}

- (void)_setOutputContent:(id)a3
{
  ISPlayerOutputContent *v5;
  _QWORD v6[4];
  ISPlayerOutputContent *v7;

  v5 = (ISPlayerOutputContent *)a3;
  if (self->__outputContent != v5)
  {
    objc_storeStrong((id *)&self->__outputContent, a3);
    -[ISBasePlayer _invalidateWillPlayToPhotoObserver](self, "_invalidateWillPlayToPhotoObserver");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __34__ISBasePlayer__setOutputContent___block_invoke;
    v6[3] = &unk_1E9453490;
    v7 = v5;
    -[ISBasePlayer enumerateOutputsWithBlock:](self, "enumerateOutputsWithBlock:", v6);

  }
}

- (void)_invalidateWillPlayToEndObserver
{
  self->_isValid.willPlayToEndObserver = 0;
}

- (void)_updateWillPlayToEndObserverIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  Float64 v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  Float64 Seconds;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id location;
  CMTime rhs;
  CMTime v22;
  CMTime v23;
  void *v24;
  CMTime lhs;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (!self->_isValid.willPlayToEndObserver)
  {
    self->_isValid.willPlayToEndObserver = 1;
    -[ISBasePlayer videoPlayer](self, "videoPlayer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      memset(&v23, 0, sizeof(v23));
      -[ISBasePlayer _videoForwardPlaybackEndTime](self, "_videoForwardPlaybackEndTime");
      if ((unsigned __int128)0 >> 96 != 1)
      {
        -[ISBasePlayer playerItem](self, "playerItem");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "playerContent");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v5;
        if (v5)
          objc_msgSend(v5, "videoDuration");
        else
          memset(&v22, 0, sizeof(v22));
        v23 = v22;

      }
      -[ISBasePlayer _videoWillPlayToEndObserver](self, "_videoWillPlayToEndObserver");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        -[ISBasePlayer _videoWillPlayToEndObserver](self, "_videoWillPlayToEndObserver");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "removeTimeObserver:", v8);

      }
      memset(&v22, 0, sizeof(v22));
      -[ISBasePlayer videoWillPlayToEndInterval](self, "videoWillPlayToEndInterval");
      CMTimeMakeWithSeconds(&rhs, v9, 600);
      lhs = v23;
      CMTimeSubtract(&v22, &lhs, &rhs);
      ISGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        lhs = v22;
        Seconds = CMTimeGetSeconds(&lhs);
        LODWORD(lhs.value) = 138412546;
        *(CMTimeValue *)((char *)&lhs.value + 4) = (CMTimeValue)self;
        LOWORD(lhs.flags) = 2048;
        *(Float64 *)((char *)&lhs.flags + 2) = Seconds;
        _os_log_debug_impl(&dword_1D2DCA000, v10, OS_LOG_TYPE_DEBUG, "%@: will add video observer for will-end time: %f", (uint8_t *)&lhs, 0x16u);
      }

      objc_initWeak(&location, self);
      lhs = v22;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCMTime:", &lhs);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = MEMORY[0x1E0C809B0];
      v16 = 3221225472;
      v17 = __52__ISBasePlayer__updateWillPlayToEndObserverIfNeeded__block_invoke;
      v18 = &unk_1E9453BF8;
      objc_copyWeak(&v19, &location);
      objc_msgSend(v3, "addBoundaryTimeObserverForTimes:queue:usingBlock:", v12, 0, &v15);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      -[ISBasePlayer _setVideoWillPlayToEndObserver:](self, "_setVideoWillPlayToEndObserver:", v13, v15, v16, v17, v18);
      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }

  }
}

- (void)_invalidateWillPlayToPhotoObserver
{
  self->_isValid.willPlayToPhotoObserver = 0;
}

- (void)_updateWillPlayToPhotoObserverIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  Float64 v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  Float64 Seconds;
  _QWORD v16[4];
  id v17;
  CMTime time2;
  CMTime time1;
  CMTime rhs;
  CMTime v21;
  CMTime v22;
  void *v23;
  CMTime lhs;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (!self->_isValid.willPlayToPhotoObserver)
  {
    self->_isValid.willPlayToPhotoObserver = 1;
    -[ISBasePlayer videoPlayer](self, "videoPlayer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISBasePlayer _videoWillPlayToPhotoObserver](self, "_videoWillPlayToPhotoObserver");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[ISBasePlayer _videoWillPlayToPhotoObserver](self, "_videoWillPlayToPhotoObserver");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "removeTimeObserver:", v5);

    }
    -[ISBasePlayer playerItem](self, "playerItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      memset(&v22, 0, sizeof(v22));
      -[ISBasePlayer playerItem](self, "playerItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "playerContent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
        objc_msgSend(v8, "photoTime");
      else
        memset(&v22, 0, sizeof(v22));

      memset(&v21, 0, sizeof(v21));
      -[ISBasePlayer videoWillPlayToPhotoInterval](self, "videoWillPlayToPhotoInterval");
      CMTimeMakeWithSeconds(&rhs, v10, 600);
      lhs = v22;
      CMTimeSubtract(&v21, &lhs, &rhs);
      time1 = v21;
      time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
      CMTimeMaximum(&lhs, &time1, &time2);
      v21 = lhs;
      ISGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        lhs = v21;
        Seconds = CMTimeGetSeconds(&lhs);
        LODWORD(lhs.value) = 138412546;
        *(CMTimeValue *)((char *)&lhs.value + 4) = (CMTimeValue)self;
        LOWORD(lhs.flags) = 2048;
        *(Float64 *)((char *)&lhs.flags + 2) = Seconds;
        _os_log_debug_impl(&dword_1D2DCA000, v11, OS_LOG_TYPE_DEBUG, "%@: will add video observer for will-play-to-photo time: %f", (uint8_t *)&lhs, 0x16u);
      }

      objc_initWeak((id *)&time1, self);
      lhs = v21;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCMTime:", &lhs);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __54__ISBasePlayer__updateWillPlayToPhotoObserverIfNeeded__block_invoke;
      v16[3] = &unk_1E9453BF8;
      objc_copyWeak(&v17, (id *)&time1);
      objc_msgSend(v3, "addBoundaryTimeObserverForTimes:queue:usingBlock:", v13, 0, v16);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      -[ISBasePlayer _setVideoWillPlayToPhotoObserver:](self, "_setVideoWillPlayToPhotoObserver:", v14);
      objc_destroyWeak(&v17);
      objc_destroyWeak((id *)&time1);
    }

  }
}

- (void)_invalidateStatus
{
  self->_isValid.status = 0;
}

- (void)_updateStatusIfNeeded
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[6];

  if (!self->_isValid.status)
  {
    self->_isValid.status = 1;
    -[ISBasePlayer playerItem](self, "playerItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "status");
    -[ISBasePlayer videoPlayer](self, "videoPlayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "currentItemStatus");
    if (v4 == 1 || (v7 = v6, objc_msgSend(v5, "status") == 2))
    {
      -[ISBasePlayer _handleErrorsIfNeeded](self, "_handleErrorsIfNeeded");
      v8 = 3;
    }
    else
    {
      v8 = 2 * (v7 == 1);
    }
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __37__ISBasePlayer__updateStatusIfNeeded__block_invoke;
    v9[3] = &unk_1E94541D0;
    v9[4] = self;
    v9[5] = v8;
    -[ISObservable performChanges:](self, "performChanges:", v9);

  }
}

- (void)_setStatus:(int64_t)a3
{
  if (self->_status != a3)
  {
    self->_status = a3;
    -[ISBasePlayer statusDidChange](self, "statusDidChange");
    -[ISObservable signalChange:](self, "signalChange:", 2);
  }
}

- (void)_setForwardPlaybackEndTime:(id *)a3
{
  _QWORD v3[5];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43__ISBasePlayer__setForwardPlaybackEndTime___block_invoke;
  v3[3] = &unk_1E94534B8;
  v3[4] = self;
  v4 = *a3;
  -[ISObservable performChanges:](self, "performChanges:", v3);
}

- (float)videoVolume
{
  return self->_videoVolume;
}

- (void)setVideoVolume:(float)a3
{
  if (self->_videoVolume != a3)
  {
    self->_videoVolume = a3;
    -[ISBasePlayer _invalidateVideoPlayerVolume](self, "_invalidateVideoPlayerVolume");
  }
}

- (void)setApertureMode:(id)a3
{
  NSString *v4;
  NSString *v5;
  BOOL v6;
  NSString *v7;
  NSString *apertureMode;
  NSString *v9;

  v4 = (NSString *)a3;
  v5 = v4;
  if (self->_apertureMode != v4)
  {
    v9 = v4;
    v6 = -[NSString isEqualToString:](v4, "isEqualToString:");
    v5 = v9;
    if (!v6)
    {
      v7 = (NSString *)-[NSString copy](v9, "copy");
      apertureMode = self->_apertureMode;
      self->_apertureMode = v7;

      -[ISBasePlayer _invalidateContentFromPlayerItem](self, "_invalidateContentFromPlayerItem");
      v5 = v9;
    }
  }

}

- (id)apertureMode
{
  return self->_apertureMode;
}

- (void)didPerformChanges
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ISBasePlayer;
  -[ISObservable didPerformChanges](&v3, sel_didPerformChanges);
  -[ISBasePlayer _updateIfNeeded](self, "_updateIfNeeded");
}

- (BOOL)_needsUpdate
{
  return !self->_isValid.status
      || !self->_isValid.contentFromPlayerItem
      || !self->_isValid.videoPlayer
      || !self->_isValid.videoPlayerVolume
      || !self->_isValid.willPlayToEndObserver
      || !self->_isValid.willPlayToPhotoObserver;
}

- (void)_updateIfNeeded
{
  if (-[ISBasePlayer _needsUpdate](self, "_needsUpdate"))
  {
    -[ISBasePlayer _updateVideoPlayerIfNeeded](self, "_updateVideoPlayerIfNeeded");
    -[ISBasePlayer _updateStatusIfNeeded](self, "_updateStatusIfNeeded");
    -[ISBasePlayer _updateVideoPlayerVolumeIfNeeded](self, "_updateVideoPlayerVolumeIfNeeded");
    -[ISBasePlayer _updateContentFromPlayerItemIfNeeded](self, "_updateContentFromPlayerItemIfNeeded");
    -[ISBasePlayer _updateWillPlayToEndObserverIfNeeded](self, "_updateWillPlayToEndObserverIfNeeded");
    -[ISBasePlayer _updateWillPlayToPhotoObserverIfNeeded](self, "_updateWillPlayToPhotoObserverIfNeeded");
  }
}

- (void)_invalidateVideoPlayerVolume
{
  self->_isValid.videoPlayerVolume = 0;
}

- (void)_updateVideoPlayerVolumeIfNeeded
{
  double v3;
  float v4;
  float v5;
  float v6;
  id v7;

  if (!self->_isValid.videoPlayerVolume)
  {
    self->_isValid.videoPlayerVolume = 1;
    -[ISBasePlayer videoPlayer](self, "videoPlayer");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v4 = 0.0;
    if (-[ISBasePlayer isAudioEnabled](self, "isAudioEnabled"))
    {
      -[ISBasePlayer videoVolume](self, "videoVolume");
      v6 = v5;
      -[ISBasePlayer audioVolume](self, "audioVolume");
      v4 = v6 * *(float *)&v3;
    }
    *(float *)&v3 = v4;
    objc_msgSend(v7, "setVolume:", v3);
    objc_msgSend(v7, "setIsAudioEnabled:", v4 > 0.0);

  }
}

- (void)_invalidateVideoPlayer
{
  self->_isValid.videoPlayer = 0;
}

- (void)_updateVideoPlayerIfNeeded
{
  void *v3;
  id v4;

  if (!self->_isValid.videoPlayer)
  {
    self->_isValid.videoPlayer = 1;
    -[ISBasePlayer playerItem](self, "playerItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      if (!self->_videoPlayer)
      {
        v4 = -[ISBasePlayer _newWrappedPlayer](self, "_newWrappedPlayer");
        -[ISBasePlayer _setVideoPlayer:](self, "_setVideoPlayer:", v4);

      }
    }
    else
    {
      -[ISBasePlayer _setVideoPlayer:](self, "_setVideoPlayer:", 0);
    }
  }
}

- (void)_handleErrorsIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[ISBasePlayer playerItem](self, "playerItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "error");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[ISBasePlayer videoPlayer](self, "videoPlayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "error");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      -[ISBasePlayer videoPlayer](self, "videoPlayer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "currentItemError");
      v6 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  -[ISBasePlayer _setError:](self, "_setError:", v6);

}

- (void)_setError:(id)a3
{
  NSError *v4;
  NSError *v5;
  _QWORD v6[5];
  NSError *v7;

  v4 = (NSError *)a3;
  v5 = v4;
  if (self->_error != v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __26__ISBasePlayer__setError___block_invoke;
    v6[3] = &unk_1E9454180;
    v6[4] = self;
    v7 = v4;
    -[ISObservable performChanges:](self, "performChanges:", v6);

  }
}

- (void)_mainQueue_handleMediaServicesReset
{
  void *v2;
  dispatch_time_t v3;
  _QWORD block[4];
  id v5[2];
  id location;

  v2 = (void *)(self->_mainQueue_mediaServicesResetCounter + 1);
  self->_mainQueue_mediaServicesResetCounter = (int64_t)v2;
  objc_initWeak(&location, self);
  v3 = dispatch_time(0, 100000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__ISBasePlayer__mainQueue_handleMediaServicesReset__block_invoke;
  block[3] = &unk_1E9453D60;
  objc_copyWeak(v5, &location);
  v5[1] = v2;
  dispatch_after(v3, MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(v5);
  objc_destroyWeak(&location);
}

- (void)_mainQueue_resetAVObjectsWithResetCount:(int64_t)a3
{
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  if (self->_mainQueue_mediaServicesResetCounter == a3)
  {
    objc_initWeak(&location, self);
    -[ISBasePlayer videoPlayer](self, "videoPlayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __56__ISBasePlayer__mainQueue_resetAVObjectsWithResetCount___block_invoke;
    v5[3] = &unk_1E9453BF8;
    objc_copyWeak(&v6, &location);
    objc_msgSend(v4, "replaceCurrentItemWithPlayerItem:thenCall:", 0, v5);

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (void)_finishResettingAVObjects
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = -[ISBasePlayer _newWrappedPlayer](self, "_newWrappedPlayer");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__ISBasePlayer__finishResettingAVObjects__block_invoke;
  v5[3] = &unk_1E9454180;
  v5[4] = self;
  v6 = v3;
  v4 = v3;
  -[ISObservable performChanges:](self, "performChanges:", v5);

}

- (id)_newWrappedPlayer
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  if (self->_delegateRespondsTo.videoPlayerForPlayer)
  {
    -[ISBasePlayer delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "videoPlayerForPlayer:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = -[ISWrappedAVPlayer _initWithAVPlayer:]([ISWrappedAVPlayer alloc], "_initWithAVPlayer:", v4);
  }
  else
  {
    if (!self->_delegateRespondsTo.wrappedVideoPlayerForPlayer)
      return objc_alloc_init(ISWrappedAVPlayer);
    -[ISBasePlayer delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "wrappedVideoPlayerForPlayer:", self);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  if (v6)
    return v6;
  return objc_alloc_init(ISWrappedAVPlayer);
}

- (void)_setVideoPlayer:(id)a3
{
  ISWrappedAVPlayer *v5;
  ISWrappedAVPlayer **p_videoPlayer;
  ISWrappedAVPlayer *videoPlayer;
  ISBasePlayer *v8;
  ISWrappedAVPlayer *v9;
  void *v10;
  void *v11;
  ISWrappedAVPlayer *v12;
  ISWrappedAVPlayer *v13;

  v5 = (ISWrappedAVPlayer *)a3;
  p_videoPlayer = &self->_videoPlayer;
  videoPlayer = self->_videoPlayer;
  if (videoPlayer != v5)
  {
    v13 = v5;
    if (videoPlayer)
    {
      -[ISWrappedAVPlayer delegate](videoPlayer, "delegate");
      v8 = (ISBasePlayer *)objc_claimAutoreleasedReturnValue();

      if (v8 == self)
        -[ISWrappedAVPlayer setDelegate:](*p_videoPlayer, "setDelegate:", 0);
      -[ISWrappedAVPlayer unregisterChangeObserver:context:](*p_videoPlayer, "unregisterChangeObserver:context:", self, ISWrappedAVPlayerObservableContext);
      v9 = *p_videoPlayer;
      +[ISDeferredDealloc sharedInstance](ISDeferredDealloc, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_performDeferredDealloc:", v9);

      if (self->_delegateRespondsTo.playerWillRelinquishVideoPlayer)
      {
        -[ISBasePlayer delegate](self, "delegate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "playerWillRelinquishVideoPlayer:", *p_videoPlayer);

      }
      v12 = *p_videoPlayer;
      *p_videoPlayer = 0;

    }
    objc_storeStrong((id *)&self->_videoPlayer, a3);
    -[ISWrappedAVPlayer setDelegate:](*p_videoPlayer, "setDelegate:", self);
    -[ISWrappedAVPlayer registerChangeObserver:context:](*p_videoPlayer, "registerChangeObserver:context:", self, ISWrappedAVPlayerObservableContext);
    -[ISBasePlayer _invalidateContentFromPlayerItem](self, "_invalidateContentFromPlayerItem");
    -[ISBasePlayer _invalidateVideoPlayerVolume](self, "_invalidateVideoPlayerVolume");
    -[ISBasePlayer _invalidateWillPlayToEndObserver](self, "_invalidateWillPlayToEndObserver");
    -[ISBasePlayer _invalidateWillPlayToPhotoObserver](self, "_invalidateWillPlayToPhotoObserver");
    -[ISObservable signalChange:](self, "signalChange:", 4);
    v5 = v13;
  }

}

- (void)behavior:(id)a3 setVideoPlayRate:(float)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  double v10;
  int v11;
  ISBasePlayer *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[ISBasePlayer activeBehavior](self, "activeBehavior");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6)
  {
    ISGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v11 = 138412802;
      v12 = self;
      v13 = 2112;
      v14 = v6;
      v15 = 2048;
      v16 = a4;
      _os_log_debug_impl(&dword_1D2DCA000, v8, OS_LOG_TYPE_DEBUG, "%@: will set video rate: %@ - %f", (uint8_t *)&v11, 0x20u);
    }

    -[ISBasePlayer videoPlayer](self, "videoPlayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v10 = a4;
    objc_msgSend(v9, "setRate:", v10);

  }
}

- (float)videoPlayRate
{
  void *v2;
  float v3;
  float v4;

  -[ISBasePlayer videoPlayer](self, "videoPlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rate");
  v4 = v3;

  return v4;
}

- (BOOL)behavior:(id)a3 seekVideoPlayerToTime:(id *)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  CMTime v17;
  CMTime time1;
  CMTime v19;
  CMTime v20;

  v8 = a3;
  v9 = a5;
  -[ISBasePlayer videoPlayer](self, "videoPlayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currentItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&v20, 0, sizeof(v20));
  CMTimeMake(&v20, 20, 600);
  objc_msgSend(v11, "videoComposition");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    memset(&v19, 0, sizeof(v19));
    objc_msgSend(v11, "videoComposition");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
      objc_msgSend(v13, "frameDuration");
    else
      memset(&v19, 0, sizeof(v19));

    if ((v19.flags & 1) != 0)
    {
      time1 = v19;
      v17 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
      if (CMTimeCompare(&time1, &v17))
        v20 = v19;
    }
  }
  v19 = (CMTime)*a4;
  time1 = v20;
  v17 = v20;
  v15 = -[ISBasePlayer behavior:seekVideoPlayerToTime:toleranceBefore:toleranceAfter:completionHandler:](self, "behavior:seekVideoPlayerToTime:toleranceBefore:toleranceAfter:completionHandler:", v8, &v19, &time1, &v17, v9);

  return v15;
}

- (BOOL)behavior:(id)a3 seekVideoPlayerToTime:(id *)a4 toleranceBefore:(id *)a5 toleranceAfter:(id *)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  double v20;
  NSObject *v21;
  Float64 v23;
  Float64 Seconds;
  __int128 v25;
  int64_t v26;
  __int128 v27;
  int64_t v28;
  _QWORD v29[5];
  id v30;
  id v31;
  __int128 v32;
  int64_t var3;
  CMTime time;
  Float64 v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a7;
  -[ISBasePlayer activeBehavior](self, "activeBehavior");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (v14 == v12)
  {
    -[ISBasePlayer videoPlayer](self, "videoPlayer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "currentItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17 && objc_msgSend(v17, "status") == 1)
    {
      ISGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        time = (CMTime)*a4;
        Seconds = CMTimeGetSeconds(&time);
        LODWORD(time.value) = 138412802;
        *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)self;
        LOWORD(time.flags) = 2112;
        *(_QWORD *)((char *)&time.flags + 2) = v12;
        HIWORD(time.epoch) = 2048;
        v35 = Seconds;
        _os_log_debug_impl(&dword_1D2DCA000, v19, OS_LOG_TYPE_DEBUG, "%@: will seek video to time: %@ - %f", (uint8_t *)&time, 0x20u);
      }

      LODWORD(v20) = 0;
      objc_msgSend(v16, "setRate:", v20);
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __96__ISBasePlayer_behavior_seekVideoPlayerToTime_toleranceBefore_toleranceAfter_completionHandler___block_invoke;
      v29[3] = &unk_1E94534E0;
      v29[4] = self;
      v30 = v12;
      v32 = *(_OWORD *)&a4->var0;
      var3 = a4->var3;
      v31 = v13;
      time = (CMTime)*a4;
      v27 = *(_OWORD *)&a5->var0;
      v28 = a5->var3;
      v25 = *(_OWORD *)&a6->var0;
      v26 = a6->var3;
      objc_msgSend(v16, "seekToTime:toleranceBefore:toleranceAfter:completionHandler:", &time, &v27, &v25, v29);

      v15 = 1;
    }
    else
    {
      ISGetLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        time = (CMTime)*a4;
        v23 = CMTimeGetSeconds(&time);
        LODWORD(time.value) = 138412802;
        *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)self;
        LOWORD(time.flags) = 2112;
        *(_QWORD *)((char *)&time.flags + 2) = v12;
        HIWORD(time.epoch) = 2048;
        v35 = v23;
        _os_log_debug_impl(&dword_1D2DCA000, v21, OS_LOG_TYPE_DEBUG, "%@: unable to seek video to time: %@ - %f", (uint8_t *)&time, 0x20u);
      }

      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)behavior:(id)a3 prerollVideoAtRate:(float)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  BOOL v11;
  NSObject *v12;
  void *v13;
  void *v14;
  double v15;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  ISBasePlayer *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  double v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  -[ISBasePlayer activeBehavior](self, "activeBehavior");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v8)
  {
    ISGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v20 = self;
      v21 = 2112;
      v22 = v8;
      v23 = 2048;
      v24 = a4;
      _os_log_debug_impl(&dword_1D2DCA000, v12, OS_LOG_TYPE_DEBUG, "%@: will set video preroll rate: %@ - %f", buf, 0x20u);
    }

    -[ISBasePlayer videoPlayer](self, "videoPlayer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "currentItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v14 != 0;

    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __62__ISBasePlayer_behavior_prerollVideoAtRate_completionHandler___block_invoke;
    v17[3] = &unk_1E9453608;
    v18 = v9;
    *(float *)&v15 = a4;
    objc_msgSend(v13, "prerollAtRate:completionHandler:", v17, v15);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)behavior:(id)a3 setVideoForwardPlaybackEndTime:(id *)a4
{
  id v6;
  id v7;
  NSObject *v8;
  Float64 Seconds;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10;
  Float64 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[ISBasePlayer activeBehavior](self, "activeBehavior");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6)
  {
    ISGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v10 = *a4;
      Seconds = CMTimeGetSeconds((CMTime *)&v10);
      LODWORD(v10.var0) = 138412802;
      *(int64_t *)((char *)&v10.var0 + 4) = (int64_t)self;
      LOWORD(v10.var2) = 2112;
      *(_QWORD *)((char *)&v10.var2 + 2) = v6;
      HIWORD(v10.var3) = 2048;
      v11 = Seconds;
      _os_log_debug_impl(&dword_1D2DCA000, v8, OS_LOG_TYPE_DEBUG, "%@: will set video end time: %@ - %f", (uint8_t *)&v10, 0x20u);
    }

    v10 = *a4;
    -[ISBasePlayer _setForwardPlaybackEndTime:](self, "_setForwardPlaybackEndTime:", &v10);
  }

}

- (void)behavior:(id)a3 setVideoVolume:(float)a4
{
  id v6;
  id v7;
  NSObject *v8;
  double v9;
  int v10;
  ISBasePlayer *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[ISBasePlayer activeBehavior](self, "activeBehavior");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6)
  {
    ISGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v10 = 138412802;
      v11 = self;
      v12 = 2112;
      v13 = v6;
      v14 = 2048;
      v15 = a4;
      _os_log_debug_impl(&dword_1D2DCA000, v8, OS_LOG_TYPE_DEBUG, "%@: will set video volume: %@ - %f", (uint8_t *)&v10, 0x20u);
    }

    *(float *)&v9 = a4;
    -[ISBasePlayer setVideoVolume:](self, "setVideoVolume:", v9);
  }

}

- (id)behavior:(id)a3 addBoundaryTimeObserverForTimes:(id)a4 queue:(id)a5 usingBlock:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  -[ISBasePlayer videoPlayer](self, "videoPlayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addBoundaryTimeObserverForTimes:queue:usingBlock:", v11, v10, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)behavior:(id)a3 removeTimeObserver:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[ISBasePlayer videoPlayer](self, "videoPlayer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeTimeObserver:", v5);

}

- (void)behavior:(id)a3 playVideoToTime:(id *)a4 initialRate:(float)a5 overDuration:(double)a6 progressHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  __int128 v16;
  int64_t var3;

  v12 = a7;
  v13 = a3;
  -[ISBasePlayer activeBehavior](self, "activeBehavior");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (v14 == v13)
  {
    -[ISBasePlayer videoPlayer](self, "videoPlayer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
    objc_msgSend(v15, "playToTime:withInitialRate:overDuration:progressHandler:", &v16, v12, COERCE_DOUBLE(__PAIR64__(DWORD1(v16), LODWORD(a5))), a6);

  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  _QWORD v5[7];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__ISBasePlayer_observable_didChange_context___block_invoke;
  v5[3] = &unk_1E9453508;
  v5[4] = self;
  v5[5] = a5;
  v5[6] = a4;
  is_dispatch_on_main_queue(v5);
}

- (void)resourceReclamationEventDidOccur:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__ISBasePlayer_resourceReclamationEventDidOccur___block_invoke;
  block[3] = &unk_1E9453F48;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (ISPlayerItem)playerItem
{
  return self->_playerItem;
}

- (int64_t)status
{
  return self->_status;
}

- (NSError)error
{
  return self->_error;
}

- (float)audioVolume
{
  return self->_audioVolume;
}

- (BOOL)isAudioEnabled
{
  return self->_audioEnabled;
}

- (ISBasePlayerDelegate)delegate
{
  return (ISBasePlayerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (id)_videoWillPlayToEndObserver
{
  return self->__videoWillPlayToEndObserver;
}

- (void)_setVideoWillPlayToEndObserver:(id)a3
{
  objc_storeStrong(&self->__videoWillPlayToEndObserver, a3);
}

- (id)_videoWillPlayToPhotoObserver
{
  return self->__videoWillPlayToPhotoObserver;
}

- (void)_setVideoWillPlayToPhotoObserver:(id)a3
{
  objc_storeStrong(&self->__videoWillPlayToPhotoObserver, a3);
}

- (ISPlayerState)lastAppliedLayoutInfo
{
  return self->_lastAppliedLayoutInfo;
}

- (void)_setLastAppliedLayoutInfo:(id)a3
{
  objc_storeStrong((id *)&self->_lastAppliedLayoutInfo, a3);
}

- (ISPlayerOutputContent)_outputContent
{
  return self->__outputContent;
}

- (double)lastAppliedScale
{
  return self->_lastAppliedScale;
}

- (void)_setLastAppliedScale:(double)a3
{
  self->_lastAppliedScale = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_videoForwardPlaybackEndTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 256);
  return self;
}

- (void)_setVideoForwardPlaybackEndTime:(id *)a3
{
  int64_t var3;

  var3 = a3->var3;
  *(_OWORD *)&self->value = *(_OWORD *)&a3->var0;
  self->epoch = var3;
}

- (PXAVResourceReclamationController)resourceReclamationController
{
  return self->_resourceReclamationController;
}

- (void)setResourceReclamationController:(id)a3
{
  objc_storeStrong((id *)&self->_resourceReclamationController, a3);
}

uint64_t __49__ISBasePlayer_resourceReclamationEventDidOccur___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mainQueue_handleMediaServicesReset");
}

uint64_t __45__ISBasePlayer_observable_didChange_context___block_invoke(uint64_t a1)
{
  _QWORD v2[7];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __45__ISBasePlayer_observable_didChange_context___block_invoke_2;
  v2[3] = &unk_1E9453940;
  v2[6] = *(_QWORD *)(a1 + 48);
  return objc_msgSend(*(id *)(a1 + 32), "performChanges:", v2);
}

void __45__ISBasePlayer_observable_didChange_context___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4 == ISPlayerItemObservableContext)
  {
    v6 = *(_QWORD *)(a1 + 48);
    v7 = v3;
    if ((v6 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "_invalidateStatus");
      v3 = v7;
      v6 = *(_QWORD *)(a1 + 48);
    }
    if ((v6 & 2) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "_invalidateContentFromPlayerItem");
      goto LABEL_11;
    }
  }
  else if (v4 == ISWrappedAVPlayerObservableContext)
  {
    v5 = *(_QWORD *)(a1 + 48);
    v7 = v3;
    if ((v5 & 0x15) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "_invalidateStatus");
      v3 = v7;
      v5 = *(_QWORD *)(a1 + 48);
    }
    if ((v5 & 0x800) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "_invalidateWillPlayToEndObserver");
LABEL_11:
      v3 = v7;
    }
  }

}

uint64_t __62__ISBasePlayer_behavior_prerollVideoAtRate_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __96__ISBasePlayer_behavior_seekVideoPlayerToTime_toleranceBefore_toleranceAfter_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  CMTimeValue v4;
  uint64_t v5;
  Float64 Seconds;
  CMTime v7;
  Float64 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  ISGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v7 = *(CMTime *)(a1 + 56);
    Seconds = CMTimeGetSeconds(&v7);
    LODWORD(v7.value) = 138412802;
    *(CMTimeValue *)((char *)&v7.value + 4) = v4;
    LOWORD(v7.flags) = 2112;
    *(_QWORD *)((char *)&v7.flags + 2) = v5;
    HIWORD(v7.epoch) = 2048;
    v8 = Seconds;
    _os_log_debug_impl(&dword_1D2DCA000, v2, OS_LOG_TYPE_DEBUG, "%@: did seek video to time: %@ - %f", (uint8_t *)&v7, 0x20u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __41__ISBasePlayer__finishResettingAVObjects__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_setVideoPlayer:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "playerItem");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetAVObjects");

}

void __56__ISBasePlayer__mainQueue_resetAVObjectsWithResetCount___block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__ISBasePlayer__mainQueue_resetAVObjectsWithResetCount___block_invoke_2;
  block[3] = &unk_1E9453BF8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v2);
}

void __56__ISBasePlayer__mainQueue_resetAVObjectsWithResetCount___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_finishResettingAVObjects");

}

void __51__ISBasePlayer__mainQueue_handleMediaServicesReset__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_mainQueue_resetAVObjectsWithResetCount:", *(_QWORD *)(a1 + 40));

}

uint64_t __26__ISBasePlayer__setError___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 176), *(id *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "signalChange:", 8);
}

void __43__ISBasePlayer__setForwardPlaybackEndTime___block_invoke(uint64_t a1)
{
  uint64_t v2;
  CMTime *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  CMTime v7;
  CMTime time2;

  v2 = *(_QWORD *)(a1 + 32) + 256;
  v3 = (CMTime *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 56);
  *(_OWORD *)v2 = *(_OWORD *)(a1 + 40);
  *(_QWORD *)(v2 + 16) = v4;
  objc_msgSend(*(id *)(a1 + 32), "videoPlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "itemForwardPlaybackEndTime");
  else
    memset(&time2, 0, sizeof(time2));
  v7 = *v3;
  if (CMTimeCompare(&v7, &time2))
  {
    v7 = *v3;
    objc_msgSend(v6, "setItemForwardEndPlaybackTime:", &v7);
  }
  objc_msgSend(*(id *)(a1 + 32), "_invalidateWillPlayToEndObserver");

}

uint64_t __37__ISBasePlayer__updateStatusIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setStatus:", *(_QWORD *)(a1 + 40));
}

void __54__ISBasePlayer__updateWillPlayToPhotoObserverIfNeeded__block_invoke(uint64_t a1)
{
  _QWORD v1[4];
  id v2;

  v1[0] = MEMORY[0x1E0C809B0];
  v1[1] = 3221225472;
  v1[2] = __54__ISBasePlayer__updateWillPlayToPhotoObserverIfNeeded__block_invoke_2;
  v1[3] = &unk_1E9453BF8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  is_dispatch_on_main_queue(v1);
  objc_destroyWeak(&v2);
}

void __54__ISBasePlayer__updateWillPlayToPhotoObserverIfNeeded__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_videoWillPlayToPhoto");

}

void __52__ISBasePlayer__updateWillPlayToEndObserverIfNeeded__block_invoke(uint64_t a1)
{
  _QWORD v1[4];
  id v2;

  v1[0] = MEMORY[0x1E0C809B0];
  v1[1] = 3221225472;
  v1[2] = __52__ISBasePlayer__updateWillPlayToEndObserverIfNeeded__block_invoke_2;
  v1[3] = &unk_1E9453BF8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  is_dispatch_on_main_queue(v1);
  objc_destroyWeak(&v2);
}

void __52__ISBasePlayer__updateWillPlayToEndObserverIfNeeded__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_videoWillPlayToEnd");

}

uint64_t __34__ISBasePlayer__setOutputContent___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setContent:", *(_QWORD *)(a1 + 32));
}

void __78__ISBasePlayer_applyOutputInfo_fromBehavior_withTransitionOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;

  v3 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78__ISBasePlayer_applyOutputInfo_fromBehavior_withTransitionOptions_completion___block_invoke_2;
  v7[3] = &unk_1E9453440;
  v8 = v3;
  v9 = *(id *)(a1 + 40);
  v4 = *(id *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v10 = v4;
  v12 = v5;
  v11 = *(id *)(a1 + 32);
  v6 = v3;
  is_dispatch_on_main_queue(v7);

}

uint64_t __78__ISBasePlayer_applyOutputInfo_fromBehavior_withTransitionOptions_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

void __78__ISBasePlayer_applyOutputInfo_fromBehavior_withTransitionOptions_completion___block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  __int128 v5;
  _QWORD v6[4];
  __int128 v7;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __78__ISBasePlayer_applyOutputInfo_fromBehavior_withTransitionOptions_completion___block_invoke_3;
  v6[3] = &unk_1E9453DA8;
  v5 = *(_OWORD *)(a1 + 56);
  v4 = (id)v5;
  v7 = v5;
  objc_msgSend(v1, "applyOutputInfo:withTransitionOptions:completion:", v2, v3, v6);

}

void __78__ISBasePlayer_applyOutputInfo_fromBehavior_withTransitionOptions_completion___block_invoke_3(uint64_t a1, char a2)
{
  uint64_t v2;
  char v3;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v2 + 24))
    v3 = a2;
  else
    v3 = 0;
  *(_BYTE *)(v2 + 24) = v3;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __60__ISBasePlayer_applyScale_withTransitionOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  id v4;
  double v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v3 = *(NSObject **)(a1 + 32);
  v4 = a2;
  dispatch_group_enter(v3);
  v5 = *(double *)(a1 + 56);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__ISBasePlayer_applyScale_withTransitionOptions_completion___block_invoke_2;
  v7[3] = &unk_1E9453DA8;
  v6 = *(_QWORD *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 48);
  v8 = *(id *)(a1 + 32);
  objc_msgSend(v4, "applyScale:withTransitionOptions:completion:", v6, v7, v5);

}

uint64_t __60__ISBasePlayer_applyScale_withTransitionOptions_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

void __60__ISBasePlayer_applyScale_withTransitionOptions_completion___block_invoke_2(uint64_t a1, char a2)
{
  uint64_t v2;
  char v3;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v2 + 24))
    v3 = a2;
  else
    v3 = 0;
  *(_BYTE *)(v2 + 24) = v3;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __31__ISBasePlayer_setAudioVolume___block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 156) = *(_DWORD *)(a1 + 40);
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateVideoPlayerVolume");
}

uint64_t __32__ISBasePlayer_setAudioEnabled___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 152) = *(_BYTE *)(a1 + 40);
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateVideoPlayerVolume");
}

void __53__ISBasePlayer__outputVideoReadyForDisplayDidChange___block_invoke(uint64_t a1)
{
  id v2;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "containsObject:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(*(id *)(a1 + 32), "activeBehavior");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "videoReadyForDisplayDidChange");

  }
}

void __26__ISBasePlayer_addOutput___block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_outputVideoReadyForDisplayDidChange:", v2);

}

uint64_t __31__ISBasePlayer_statusDidChange__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_invalidateWillPlayToEndObserver");
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateWillPlayToPhotoObserver");
}

uint64_t __35__ISBasePlayer_playerItemDidChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateStatus");
}

uint64_t __30__ISBasePlayer_setPlayerItem___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setVideoPlayer:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "unregisterChangeObserver:context:", *(_QWORD *)(a1 + 32), ISPlayerItemObservableContext);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 160), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "registerChangeObserver:context:", *(_QWORD *)(a1 + 32), ISPlayerItemObservableContext);
  objc_msgSend(*(id *)(a1 + 32), "configurePlayerItem");
  objc_msgSend(*(id *)(a1 + 32), "_invalidateVideoPlayer");
  objc_msgSend(*(id *)(a1 + 32), "_invalidateContentFromPlayerItem");
  return objc_msgSend(*(id *)(a1 + 32), "playerItemDidChange");
}

@end
