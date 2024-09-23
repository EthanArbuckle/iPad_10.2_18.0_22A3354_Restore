@implementation VUIBackgroundMediaController

- (VUIMediaInfo)currentMediaInfo
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;

  v3 = -[VUIBackgroundMediaController mediaInfoIndex](self, "mediaInfoIndex");
  -[VUIBackgroundMediaController mediaInfos](self, "mediaInfos");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v3 >= v5)
  {
    v7 = 0;
  }
  else
  {
    -[VUIBackgroundMediaController mediaInfos](self, "mediaInfos");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndex:", -[VUIBackgroundMediaController mediaInfoIndex](self, "mediaInfoIndex"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (VUIMediaInfo *)v7;
}

- (NSArray)mediaInfos
{
  void *v2;
  void *v3;

  -[VUIBackgroundMediaController mediaInfoFetchController](self, "mediaInfoFetchController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaInfos");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (VUIMediaInfoFetchController)mediaInfoFetchController
{
  return self->_mediaInfoFetchController;
}

- (unint64_t)mediaInfoIndex
{
  return self->_mediaInfoIndex;
}

void __96__VUIBackgroundMediaController__animateTransitionFromView_toView_duration_direction_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(WeakRetained, "setProxyImageWidthConstraint:", *(_QWORD *)(a1 + 32));
  objc_msgSend(WeakRetained, "setProxyImageHeightConstraint:", *(_QWORD *)(a1 + 40));
  objc_msgSend(WeakRetained, "setProxyImageCenterXConstraint:", *(_QWORD *)(a1 + 48));
  objc_msgSend(WeakRetained, "setProxyImageCenterYConstraint:", *(_QWORD *)(a1 + 56));
  v2 = *(_QWORD *)(a1 + 64);
  if (v2)
    (*(void (**)(void))(v2 + 16))();

}

void __96__VUIBackgroundMediaController__animateTransitionFromView_toView_duration_direction_completion___block_invoke_2(id *a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (objc_msgSend(WeakRetained, "imageSwappingAnimationType") == 1)
  {
    objc_msgSend(a1[4], "setVuiAlpha:", 0.0);
    objc_msgSend(a1[5], "setVuiAlpha:", 1.0);
  }
  objc_msgSend(WeakRetained, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "vui_setNeedsLayout");

  objc_msgSend(WeakRetained, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vui_layoutIfNeeded");

}

void __96__VUIBackgroundMediaController__animateTransitionFromView_toView_duration_direction_completion___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;

  v2 = (id *)(a1 + 88);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  v4 = objc_msgSend(WeakRetained, "imageSwappingAnimationType");
  if (v4 == 3)
  {
    objc_msgSend(*(id *)(a1 + 32), "setConstant:", 0.0);
    objc_msgSend(*(id *)(a1 + 40), "setConstant:", 0.0);
    v9 = *(_QWORD *)(a1 + 96);
    if (v9 == 2)
    {
      objc_msgSend(WeakRetained, "proxyImageCenterXConstraint");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v10 = *(double *)(a1 + 104);
      v11 = -0.25;
    }
    else
    {
      if (v9 != 1)
        goto LABEL_13;
      objc_msgSend(WeakRetained, "proxyImageCenterXConstraint");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v10 = *(double *)(a1 + 104);
      v11 = 0.25;
    }
    v8 = v10 * v11;
    goto LABEL_12;
  }
  if (v4 == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setConstant:", 0.0);
    v5 = *(_QWORD *)(a1 + 96);
    if (v5 == 2)
    {
      objc_msgSend(WeakRetained, "proxyImageCenterXConstraint");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = -*(double *)(a1 + 104);
      goto LABEL_12;
    }
    if (v5 == 1)
    {
      objc_msgSend(WeakRetained, "proxyImageCenterXConstraint");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = *(double *)(a1 + 104);
LABEL_12:
      objc_msgSend(v6, "setConstant:", v8);

    }
  }
LABEL_13:
  v12 = (void *)MEMORY[0x1E0DC3F10];
  v13 = *(double *)(a1 + 112);
  v14 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __96__VUIBackgroundMediaController__animateTransitionFromView_toView_duration_direction_completion___block_invoke_2;
  v22[3] = &unk_1E9F99000;
  objc_copyWeak(&v25, v2);
  v23 = *(id *)(a1 + 48);
  v24 = *(id *)(a1 + 56);
  v15[0] = v14;
  v15[1] = 3221225472;
  v15[2] = __96__VUIBackgroundMediaController__animateTransitionFromView_toView_duration_direction_completion___block_invoke_3;
  v15[3] = &unk_1E9FA5410;
  objc_copyWeak(&v21, v2);
  v16 = *(id *)(a1 + 40);
  v17 = *(id *)(a1 + 64);
  v18 = *(id *)(a1 + 32);
  v19 = *(id *)(a1 + 72);
  v20 = *(id *)(a1 + 80);
  objc_msgSend(v12, "vui_animateWithDuration:animations:completion:", v22, v15, v13);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&v25);

}

void __84__VUIBackgroundMediaController__transitionToNewImage_animated_direction_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  VUIDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 134218242;
    v10 = WeakRetained;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) showing background image now.", (uint8_t *)&v9, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "setVuiAlpha:", 1.0);
  objc_msgSend(WeakRetained, "playbackContainerController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setVuiAlpha:", 0.0);

  objc_msgSend(WeakRetained, "currentMediaInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v7, "showsSecondaryVideoView");

  if ((_DWORD)v6)
  {
    objc_msgSend(WeakRetained, "secondaryVideoView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setVuiAlpha:", 0.0);

  }
}

__CFString *__61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_9(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  __CFString *v21;
  __CFString *v22;
  id v24;
  id v25;
  id v26;
  _QWORD v27[5];
  id v28;
  id v29;
  char v30;
  char v31;

  v9 = a2;
  v26 = a3;
  v25 = a4;
  v24 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "prefetchPlayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(WeakRetained, "currentMediaInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "tvpPlaylist");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "prefetchPlayer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "playlist");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(WeakRetained, "_playlist:contentMatchesPlaylist:", v13, v15))
      v16 = objc_msgSend(WeakRetained, "prefetchesVideoFrame");
    else
      v16 = 0;

  }
  else
  {
    v16 = 0;
  }

  objc_msgSend(WeakRetained, "prefetchPlayer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "state");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DB1958], "paused");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18 == v19)
    v20 = 0;
  else
    v20 = objc_msgSend(WeakRetained, "isVideoFrameFallbackEnabled");

  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_10;
  v27[3] = &unk_1E9FA55F0;
  objc_copyWeak(&v29, (id *)(a1 + 40));
  v30 = v16;
  v27[4] = WeakRetained;
  v28 = *(id *)(a1 + 32);
  v31 = v20;
  objc_msgSend(v9, "executeBlockAfterCurrentStateTransition:", v27);
  if ((v16 & (v20 ^ 1)) != 0)
    v21 = CFSTR("Loading playback");
  else
    v21 = CFSTR("Waiting for player to start loading");
  v22 = v21;

  objc_destroyWeak(&v29);
  return v22;
}

void __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_6(uint64_t a1, void *a2, int a3)
{
  id *v5;
  id v6;
  id WeakRetained;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t);
  void *v29;
  id v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = (id *)(a1 + 72);
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  v8 = objc_msgSend(WeakRetained, "_currentMediaInfoImagesMatchesNewMediaInfoImage:", *(_QWORD *)(a1 + 32));
  v9 = *(void **)(a1 + 40);
  if (v9)
  {
    v10 = (void *)objc_msgSend(v9, "mutableCopy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v6, CFSTR("ImageKey"));

  objc_msgSend(WeakRetained, "proxyImageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "image");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if ((a3 & v8) == 1)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
    v16 = v15;

    if (*(_BYTE *)(a1 + 80) && v13 && (v17 = 5.0 - v16, v17 > 0.0))
    {
      v18 = (void *)MEMORY[0x1E0C99E88];
      v26 = MEMORY[0x1E0C809B0];
      v27 = 3221225472;
      v28 = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_7;
      v29 = &unk_1E9FA5550;
      v30 = *(id *)(a1 + 56);
      v31 = v11;
      objc_msgSend(v18, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v26, v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "imageDelayTimer", v26, v27, v28, v29);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "invalidate");

      objc_msgSend(WeakRetained, "setImageDelayTimer:", 0);
      objc_msgSend(WeakRetained, "setImageDelayTimer:", v19);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 56), "postEvent:withContext:userInfo:", CFSTR("Show image"), 0, v11);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "imageProxies");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v21)
    {
      objc_msgSend(*(id *)(a1 + 32), "tvpPlaylist");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        VUIDefaultLogObject();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          v24 = *(void **)(a1 + 64);
          objc_msgSend(v24, "name");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          v33 = v24;
          v34 = 2112;
          v35 = v25;
          _os_log_impl(&dword_1D96EE000, v23, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) there're no imageProxies but have playlist; loading it.",
            buf,
            0x16u);

        }
        objc_msgSend(*(id *)(a1 + 56), "postEvent:withContext:userInfo:", CFSTR("Show image"), 0, v11);
      }

    }
  }

}

void __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_5(id *a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD aBlock[4];
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  char v20;

  v2 = a1 + 6;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "currentMediaInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "currentMediaInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "shouldDelayLoadingImage");

  }
  else
  {
    v6 = 0;
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "currentMediaInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_6;
  aBlock[3] = &unk_1E9FA5578;
  objc_copyWeak(&v19, v2);
  v9 = v8;
  v14 = v9;
  v15 = a1[4];
  v10 = v7;
  v16 = v10;
  v20 = v6;
  v17 = a1[5];
  v18 = WeakRetained;
  v11 = _Block_copy(aBlock);
  objc_msgSend(WeakRetained, "imageDelayTimer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "invalidate");

  objc_msgSend(WeakRetained, "setImageDelayTimer:", 0);
  objc_msgSend(WeakRetained, "_loadImage:", v11);

  objc_destroyWeak(&v19);
}

uint64_t __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "postEvent:withContext:userInfo:", CFSTR("Load image"), 0, *(_QWORD *)(a1 + 40));
}

void __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_10(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  id v19;
  uint64_t v20;
  uint8_t buf[4];
  NSObject *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(WeakRetained, "prefetchPlayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:forKeyPath:context:", v3, CFSTR("avPlayer"), __PlayerAVPlayerKVOContext_1);

    objc_msgSend(v3, "prefetchPlayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "prefetchPlayerViewController");
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAvPlayerViewController:", v6);
    VUIDefaultLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(NSObject **)(a1 + 32);
      -[NSObject name](v8, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v22 = v8;
      v23 = 2112;
      v24 = v9;
      v25 = 2112;
      v26 = v5;
      _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) loading playback with prefetch player %@", buf, 0x20u);

    }
  }
  else
  {
    objc_msgSend(WeakRetained, "mediaInfoFetchController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "loadPlayerAtIndex:", objc_msgSend(v3, "mediaInfoIndex"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "playbackInitiatorForRTCReporting");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setReportingValueWithString:forKey:", v11, CFSTR("initiator"));

    VUIDefaultLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    objc_msgSend(*(id *)(a1 + 32), "name");
    v7 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v22 = v7;
    v23 = 2112;
    v24 = v5;
    _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) loading playback with new player", buf, 0x16u);
  }

LABEL_7:
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (*(_BYTE *)(a1 + 56))
  {
    if (!*(_BYTE *)(a1 + 57))
    {
      v12 = *(void **)(a1 + 32);
      v15 = MEMORY[0x1E0C809B0];
      v16 = 3221225472;
      v17 = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_275;
      v18 = &unk_1E9F98FD8;
      v13 = v5;
      v14 = *(_QWORD *)(a1 + 32);
      v19 = v13;
      v20 = v14;
      objc_msgSend(v12, "_swapActiveMedia:animated:completion:", 0, 0, &v15);

    }
    objc_msgSend(v3, "setPrefetchPlayer:", 0, v15, v16, v17, v18);
    objc_msgSend(v3, "setPrefetchPlayerViewController:", 0);
  }

}

void __45__VUIBackgroundMediaController_initWithName___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id WeakRetained;

  v11 = (id *)(a1 + 32);
  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  WeakRetained = objc_loadWeakRetained(v11);
  objc_msgSend(WeakRetained, "_stateDidChangeFromState:toState:onEvent:context:userInfo:", v16, v15, v14, v13, v12);

}

void __43__VUIBackgroundMediaController__loadImage___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  void (*v5)(void);
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  dispatch_time_t v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  if (*(_BYTE *)(a1 + 64))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    v3 = WeakRetained;
    if (*(_QWORD *)(a1 + 32) || !*(_QWORD *)(a1 + 40))
    {
      VUIDefaultLogObject();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        __43__VUIBackgroundMediaController__loadImage___block_invoke_3_cold_1(v3, (uint64_t *)(a1 + 32), v4);

      v5 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    }
    else
    {
      objc_msgSend(WeakRetained, "alphaImageProxy");
      v6 = objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v7 = (void *)v6;
        objc_msgSend(v3, "alphaProxyImageView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "image");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v9)
        {
          v10 = dispatch_time(0, 100000000);
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __43__VUIBackgroundMediaController__loadImage___block_invoke_4;
          block[3] = &unk_1E9FA1900;
          objc_copyWeak(&v14, (id *)(a1 + 56));
          v13 = *(id *)(a1 + 48);
          v12 = *(id *)(a1 + 40);
          dispatch_after(v10, MEMORY[0x1E0C80D38], block);

          objc_destroyWeak(&v14);
          goto LABEL_7;
        }
      }
      v5 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    }
    v5();
LABEL_7:

    return;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __43__VUIBackgroundMediaController__loadImage___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));
  return result;
}

void __43__VUIBackgroundMediaController__loadImage___block_invoke(uint64_t a1, void *a2, void *a3, char a4)
{
  id v7;
  id v8;
  id *v9;
  id WeakRetained;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  char v28;
  _QWORD aBlock[4];
  id v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  VUIDefaultLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    VUIBoolLogString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v32 = WeakRetained;
    v33 = 2112;
    v34 = v12;
    v35 = 2112;
    v36 = v7;
    v37 = 2112;
    v38 = v13;
    _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) completed loading image: [%@], finished: [%@]", buf, 0x2Au);

  }
  v14 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __43__VUIBackgroundMediaController__loadImage___block_invoke_237;
  aBlock[3] = &unk_1E9FA5488;
  v30 = *(id *)(a1 + 32);
  v15 = _Block_copy(aBlock);
  v20 = v14;
  v21 = 3221225472;
  v22 = __43__VUIBackgroundMediaController__loadImage___block_invoke_3;
  v23 = &unk_1E9FA54B0;
  v28 = a4;
  objc_copyWeak(&v27, v9);
  v16 = v8;
  v24 = v16;
  v17 = v7;
  v25 = v17;
  v18 = v15;
  v26 = v18;
  v19 = &v20;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", v20, v21))
    v22((uint64_t)v19);
  else
    dispatch_async(MEMORY[0x1E0C80D38], v19);

  objc_destroyWeak(&v27);
}

- (void)vui_viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  VUIBackgroundMediaController *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  VUIDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[VUIBackgroundMediaController name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v9 = "-[VUIBackgroundMediaController vui_viewWillAppear:]";
    v10 = 2048;
    v11 = self;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::%s (%p: %@)", buf, 0x20u);

  }
  v7.receiver = self;
  v7.super_class = (Class)VUIBackgroundMediaController;
  -[VUIBackgroundMediaController vui_viewWillAppear:](&v7, sel_vui_viewWillAppear_, v3);
  -[VUIBackgroundMediaController setHasViewAppeared:](self, "setHasViewAppeared:", 1);
}

- (void)vui_viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VUIBackgroundMediaController;
  -[VUIBackgroundMediaController vui_viewDidLoad](&v5, sel_vui_viewDidLoad);
  -[VUIBackgroundMediaController vuiView](self, "vuiView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setVuiClipsToBounds:", 1);

  -[VUIBackgroundMediaController proxyImageView](self, "proxyImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIBackgroundMediaController _addProxyImageView:](self, "_addProxyImageView:", v4);

  -[VUIBackgroundMediaController _observeModalNavigationControllerNotifications](self, "_observeModalNavigationControllerNotifications");
}

- (NSString)videoGravity
{
  return self->_videoGravity;
}

- (BOOL)updatesNowPlayingInfoCenter
{
  return self->_updatesNowPlayingInfoCenter;
}

- (void)updateFrames
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[VUIBackgroundMediaController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  VUIDefaultLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 134218240;
    v21 = v5;
    v22 = 2048;
    v23 = v7;
    _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController: updateFrames for bounds %f x %f", (uint8_t *)&v20, 0x16u);
  }

  -[VUIBackgroundMediaController _playbackContainerViewFrame:hasSecondaryVideoView:](self, "_playbackContainerViewFrame:hasSecondaryVideoView:", -[VUIBackgroundMediaController isBackgrounded](self, "isBackgrounded"), -[VUIBackgroundMediaController _hasSecondaryView](self, "_hasSecondaryView"));
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[VUIBackgroundMediaController playbackContainerController](self, "playbackContainerController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFrame:", v10, v12, v14, v16);

  if (-[VUIBackgroundMediaController _shouldShowSecondaryView](self, "_shouldShowSecondaryView"))
  {
    if (-[VUIBackgroundMediaController _hasSecondaryView](self, "_hasSecondaryView"))
    {
      -[VUIBackgroundMediaController secondaryVideoView](self, "secondaryVideoView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIBackgroundMediaController _secondaryVideoViewFrame:](self, "_secondaryVideoViewFrame:", 1);
      objc_msgSend(v19, "setFrame:");

    }
  }
}

- (NSString)titleForLogging
{
  return self->_titleForLogging;
}

- (BOOL)supportsMediaSharing
{
  return self->_supportsMediaSharing;
}

- (unint64_t)state
{
  return self->_state;
}

- (TVPStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (BOOL)showsVideoControls
{
  return self->_showsVideoControls;
}

- (BOOL)showsPlaybackControlsInForeground
{
  return self->_showsPlaybackControlsInForeground;
}

- (void)showAlphaImage:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  BOOL v17;
  _QWORD v18[5];
  BOOL v19;

  v4 = a4;
  -[VUIBackgroundMediaController alphaProxyImageView](self, "alphaProxyImageView");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v15 = (id)v7;
    -[VUIBackgroundMediaController alphaProxyImageView](self, "alphaProxyImageView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "superview");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      -[VUIBackgroundMediaController alphaProxyImageView](self, "alphaProxyImageView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "image");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v13 = (void *)MEMORY[0x1E0DC3F10];
        if (v4)
        {
          -[VUIBackgroundMediaController view](self, "view");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v18[0] = MEMORY[0x1E0C809B0];
          v18[1] = 3221225472;
          v18[2] = __56__VUIBackgroundMediaController_showAlphaImage_animated___block_invoke;
          v18[3] = &unk_1E9F9A5F8;
          v18[4] = self;
          v19 = a3;
          objc_msgSend(v13, "vui_transitionWithView:duration:options:animations:completion:", v14, 5242880, v18, 0, 0.3);

        }
        else
        {
          v16[0] = MEMORY[0x1E0C809B0];
          v16[1] = 3221225472;
          v16[2] = __56__VUIBackgroundMediaController_showAlphaImage_animated___block_invoke_2;
          v16[3] = &unk_1E9F9A5F8;
          v16[4] = self;
          v17 = a3;
          objc_msgSend(MEMORY[0x1E0DC3F10], "vui_performWithoutAnimation:", v16);
        }
      }
    }
    else
    {

    }
  }
}

- (BOOL)shouldPauseAtEnd
{
  return self->_shouldPauseAtEnd;
}

- (void)setVpafPlaybackStopReason:(unint64_t)a3
{
  self->_vpafPlaybackStopReason = a3;
}

- (void)setVpafPlaybackStartReason:(unint64_t)a3
{
  self->_vpafPlaybackStartReason = a3;
}

- (void)setVolumeTransitionAnimationDuration:(double)a3
{
  self->_volumeTransitionAnimationDuration = a3;
}

- (void)setVideoSwappingAnimationType:(unint64_t)a3
{
  self->_videoSwappingAnimationType = a3;
}

- (void)setUseForegroundAudioSessionInBackgroundMode:(BOOL)a3
{
  self->_useForegroundAudioSessionInBackgroundMode = a3;
  -[VUIBackgroundMediaController _configureAudioSession](self, "_configureAudioSession");
}

- (void)setStopPlayerWhenViewDisappears:(BOOL)a3
{
  self->_stopPlayerWhenViewDisappears = a3;
}

- (void)setStopPlayerWhenExitingFullScreen:(BOOL)a3
{
  self->_stopPlayerWhenExitingFullScreen = a3;
}

- (void)setState:(unint64_t)a3
{
  id v5;

  -[VUIBackgroundMediaController willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("state"));
  self->_state = a3;
  -[VUIBackgroundMediaController didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("state"));
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("VUIBackgroundMediaControllerDidChangeStateNotification"), self);

}

- (void)setShowsVideoControls:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v3 = a3;
  self->_showsVideoControls = a3;
  -[VUIBackgroundMediaController showAlphaImage:animated:](self, "showAlphaImage:animated:", !a3, 1);
  -[VUIBackgroundMediaController avPlayerViewController](self, "avPlayerViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserInteractionEnabled:", v3);

  if (self->_keepVideoGravityUnchangedByVideoControlsVisibility || !v3)
  {
    -[VUIBackgroundMediaController videoGravity](self, "videoGravity");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (id)*MEMORY[0x1E0C8A6D8];
  }
  v7 = v6;
  objc_msgSend(v8, "setVideoGravity:", v6);

  -[VUIBackgroundMediaController setControlsVisible:](self, "setControlsVisible:", v3);
}

- (void)setShowsPlaybackControlsInForeground:(BOOL)a3
{
  self->_showsPlaybackControlsInForeground = a3;
}

- (void)setShouldShowImageAndStopAfterPausingAtEnd:(BOOL)a3
{
  self->_shouldShowImageAndStopAfterPausingAtEnd = a3;
}

- (void)setShouldPauseAtEnd:(BOOL)a3
{
  self->_shouldPauseAtEnd = a3;
}

- (void)setSecondaryVideoView:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryVideoView, a3);
}

- (void)setProxyImageWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_proxyImageWidthConstraint, a3);
}

- (void)setProxyImageView:(id)a3
{
  objc_storeStrong((id *)&self->_proxyImageView, a3);
}

- (void)setProxyImageHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_proxyImageHeightConstraint, a3);
}

- (void)setProxyImageCenterYConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_proxyImageCenterYConstraint, a3);
}

- (void)setProxyImageCenterXConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_proxyImageCenterXConstraint, a3);
}

- (void)setPreloadPlaybackEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  VUIBackgroundMediaController *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  _BOOL4 v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  VUIDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[VUIBackgroundMediaController name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIBackgroundMediaController mediaInfoFetchController](self, "mediaInfoFetchController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 134218754;
    v10 = self;
    v11 = 2112;
    v12 = v6;
    v13 = 1024;
    v14 = v3;
    v15 = 2048;
    v16 = v7;
    _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) setPreloadPlaybackEnabled = %d, mediaInfoFetch: %p", (uint8_t *)&v9, 0x26u);

  }
  self->_preloadPlaybackEnabled = v3;
  -[VUIBackgroundMediaController mediaInfoFetchController](self, "mediaInfoFetchController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPreloadPlaybackEnabled:", v3);

}

- (void)setPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_player, a3);
}

- (void)setPlaybackStartDelay:(double)a3
{
  self->_playbackStartDelay = a3;
}

- (void)setPlaybackLoadingStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_playbackLoadingStartDate, a3);
}

- (void)setPlaybackEnabled:(BOOL)a3 imageVideoSwapBehavior:(unint64_t)a4
{
  _BOOL4 v5;
  NSObject *v7;
  void *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  BOOL v30;
  NSObject *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  _BOOL4 v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(uint64_t);
  void *v49;
  id v50;
  id v51;
  _QWORD v52[2];
  _QWORD v53[2];
  uint8_t buf[4];
  VUIBackgroundMediaController *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  _QWORD v59[3];

  v5 = a3;
  v59[2] = *MEMORY[0x1E0C80C00];
  VUIDefaultLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[VUIBackgroundMediaController name](self, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v55 = self;
    v56 = 2112;
    v57 = v8;
    v58 = 1024;
    LODWORD(v59[0]) = v5;
    WORD2(v59[0]) = 2048;
    *(_QWORD *)((char *)v59 + 6) = a4;
    _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) setPlaybackEnabled = %d, imageVideoSwapBehavior = %lu", buf, 0x26u);

  }
  v9 = -[VUIBackgroundMediaController _autoPlayEnabled](self, "_autoPlayEnabled");
  if (!v9)
  {
    VUIDefaultLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      -[VUIBackgroundMediaController name](self, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v55 = self;
      v56 = 2112;
      v57 = v11;
      _os_log_impl(&dword_1D96EE000, v10, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) accessibility video autoplay is disabled", buf, 0x16u);

    }
  }
  +[VUIFeaturesConfiguration sharedInstance](VUIFeaturesConfiguration, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "autoPlayConfig");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "disableBackgroundMediaPlayback");

  VUIDefaultLogObject();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    -[VUIBackgroundMediaController name](self, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v55 = self;
    v56 = 2112;
    v57 = v16;
    v58 = 1024;
    LODWORD(v59[0]) = v14;
    _os_log_impl(&dword_1D96EE000, v15, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) is playback disabled by defaults %d.", buf, 0x1Cu);

  }
  self->_playbackEnabled = v5 & (v14 ^ 1);
  -[VUIBackgroundMediaController player](self, "player");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    if (self->_playbackEnabled)
    {
LABEL_11:
      VUIDefaultLogObject();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        -[VUIBackgroundMediaController name](self, "name");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIBackgroundMediaController stateMachine](self, "stateMachine");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "currentState");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v55 = self;
        v56 = 2112;
        v57 = v19;
        v58 = 2112;
        v59[0] = v21;
        _os_log_impl(&dword_1D96EE000, v18, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@, machine state: %@) playback is enabled and we have a stale player, perform cleanup and start reloading.", buf, 0x20u);

      }
      -[VUIBackgroundMediaController _cleanUpEverythingPlaybackRelated](self, "_cleanUpEverythingPlaybackRelated");
      if (v9)
      {
        -[VUIBackgroundMediaController stateMachine](self, "stateMachine");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "postEvent:", CFSTR("Replay"));

      }
      goto LABEL_39;
    }
    -[VUIBackgroundMediaController player](self, "player");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "state");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DB1958], "stopped");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v28 == v29;

    if (v30)
    {
      if (self->_playbackEnabled)
        goto LABEL_11;
      VUIDefaultLogObject();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        -[VUIBackgroundMediaController name](self, "name");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v55 = self;
        v56 = 2112;
        v57 = v35;
        _os_log_impl(&dword_1D96EE000, v34, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) cleanup everything playback related in defensive case", buf, 0x16u);

      }
      -[VUIBackgroundMediaController _cleanUpEverythingPlaybackRelated](self, "_cleanUpEverythingPlaybackRelated");
    }
    else if (a4 == 1)
    {
      VUIDefaultLogObject();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        -[VUIBackgroundMediaController name](self, "name");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v55 = self;
        v56 = 2112;
        v57 = v32;
        _os_log_impl(&dword_1D96EE000, v31, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) pausing playback, will show image and then stop.", buf, 0x16u);

      }
      -[VUIBackgroundMediaController stateMachine](self, "stateMachine");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "postEvent:", CFSTR("Pause show image and stop"));

    }
    else
    {
      v52[0] = CFSTR("PlaybackStopReasonKey");
      v52[1] = CFSTR("ImageVideoSwapBehaviorKey");
      v53[0] = &unk_1EA0BAAF8;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v53[1] = v36;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 2);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      LODWORD(v36) = a4 == 3;
      VUIDefaultLogObject();
      v38 = objc_claimAutoreleasedReturnValue();
      v39 = os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT);
      if ((_DWORD)v36)
      {
        if (v39)
        {
          -[VUIBackgroundMediaController name](self, "name");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          v55 = self;
          v56 = 2112;
          v57 = v40;
          _os_log_impl(&dword_1D96EE000, v38, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) showing image and then will stop playback.", buf, 0x16u);

        }
        objc_initWeak((id *)buf, self);
        v46 = MEMORY[0x1E0C809B0];
        v47 = 3221225472;
        v48 = __74__VUIBackgroundMediaController_setPlaybackEnabled_imageVideoSwapBehavior___block_invoke;
        v49 = &unk_1E9F9A938;
        objc_copyWeak(&v51, (id *)buf);
        v50 = v37;
        -[VUIBackgroundMediaController _swapActiveMedia:animated:completion:](self, "_swapActiveMedia:animated:completion:", 1, 1, &v46);

        objc_destroyWeak(&v51);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        if (v39)
        {
          -[VUIBackgroundMediaController name](self, "name");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          v55 = self;
          v56 = 2112;
          v57 = v41;
          _os_log_impl(&dword_1D96EE000, v38, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) stopping playback.", buf, 0x16u);

        }
        -[VUIBackgroundMediaController stateMachine](self, "stateMachine");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "postEvent:withContext:userInfo:", CFSTR("Stop"), 0, v37);

      }
    }
  }
  else
  {
    v23 = !v9;
    if (!self->_playbackEnabled)
      v23 = 1;
    if ((v23 & 1) != 0)
    {
      -[VUIBackgroundMediaController _cleanUpPlaybackTimers](self, "_cleanUpPlaybackTimers");
    }
    else
    {
      VUIDefaultLogObject();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        -[VUIBackgroundMediaController name](self, "name");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v55 = self;
        v56 = 2112;
        v57 = v25;
        _os_log_impl(&dword_1D96EE000, v24, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) playback is enabled but we don't have a player, start reloading.", buf, 0x16u);

      }
      -[VUIBackgroundMediaController stateMachine](self, "stateMachine");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "postEvent:", CFSTR("Replay"));

    }
  }
LABEL_39:
  if (!self->_playbackEnabled)
  {
    -[VUIBackgroundMediaController prefetchPlayer](self, "prefetchPlayer");
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (v43)
    {
      -[VUIBackgroundMediaController prefetchPlayer](self, "prefetchPlayer");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "stop");

      -[VUIBackgroundMediaController prefetchPlayer](self, "prefetchPlayer");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "invalidate");

      -[VUIBackgroundMediaController setPrefetchPlayer:](self, "setPrefetchPlayer:", 0);
    }
    -[VUIBackgroundMediaController setPrefetchPlayerViewController:](self, "setPrefetchPlayerViewController:", 0, v46, v47, v48, v49);
  }
}

- (void)setPlaybackEnabled:(BOOL)a3
{
  -[VUIBackgroundMediaController setPlaybackEnabled:imageVideoSwapBehavior:](self, "setPlaybackEnabled:imageVideoSwapBehavior:", a3, 0);
}

- (void)setPlaybackContainerController:(id)a3
{
  objc_storeStrong((id *)&self->_playbackContainerController, a3);
}

- (void)setObservingInitialMediaItemHasCompletedInitialLoading:(BOOL)a3
{
  self->_observingInitialMediaItemHasCompletedInitialLoading = a3;
}

- (void)setNumberOfVolumeIncrements:(unint64_t)a3
{
  self->_numberOfVolumeIncrements = a3;
}

- (void)setMutePlaybackInBackground:(BOOL)a3
{
  if (self->_mutePlaybackInBackground != a3)
  {
    -[VUIBackgroundMediaController willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("mutePlaybackInBackground"));
    self->_mutePlaybackInBackground = a3;
    -[VUIBackgroundMediaController _updatePlayerMuteStateForBackgroundPlaybackWithReason:](self, "_updatePlayerMuteStateForBackgroundPlaybackWithReason:", CFSTR("VUIBackgroundMediaControllerPlaybackMuteReasonAssigned"));
    -[VUIBackgroundMediaController didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("mutePlaybackInBackground"));
  }
}

- (void)setMediaInfos:(id)a3 selectedIndex:(unint64_t)a4 animated:(BOOL)a5
{
  uint64_t v5;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;

  v5 = a5;
  v18 = a3;
  if (objc_msgSend(v18, "count") > a4)
  {
    if (objc_msgSend(v18, "count") > a4)
    {
      -[VUIBackgroundMediaController currentMediaInfo](self, "currentMediaInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_msgSend(v18, "objectAtIndex:", a4);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "imageProxies");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "firstObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIBackgroundMediaController currentMediaInfo](self, "currentMediaInfo");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "imageProxies");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "firstObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v11, "isEqual:", v14) ^ 1;

      }
    }
    self->_mediaInfoIndex = a4;
    self->_lastMediaInfoIndex = a4;
    -[VUIBackgroundMediaController mediaInfoFetchController](self, "mediaInfoFetchController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
      v16 = v18;
    else
      v16 = (id)MEMORY[0x1E0C9AA60];
    objc_msgSend(v15, "setMediaInfos:", v16);

    -[VUIBackgroundMediaController currentMediaInfo](self, "currentMediaInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIBackgroundMediaController _updateWithMediaInfo:withDirection:imageVideoSwapBehavior:animated:](self, "_updateWithMediaInfo:withDirection:imageVideoSwapBehavior:animated:", v17, 0, 0, v5);

  }
}

- (void)setMediaInfos:(id)a3 animated:(BOOL)a4
{
  -[VUIBackgroundMediaController setMediaInfos:selectedIndex:animated:](self, "setMediaInfos:selectedIndex:animated:", a3, 0, a4);
}

- (void)setMediaInfoIndex:(unint64_t)a3 imageVideoSwapBehavior:(unint64_t)a4 animated:(BOOL)a5 forwardAnimation:(BOOL)a6
{
  _BOOL8 v7;
  void *v11;
  uint64_t v12;
  unint64_t lastMediaInfoIndex;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  NSObject *v17;
  void *v18;
  unint64_t mediaInfoIndex;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  int v25;
  VUIBackgroundMediaController *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  unint64_t v30;
  __int16 v31;
  unint64_t v32;
  uint64_t v33;

  v7 = a5;
  v33 = *MEMORY[0x1E0C80C00];
  -[VUIBackgroundMediaController currentMediaInfo](self, "currentMediaInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (a6)
  {
    v12 = 2;
    goto LABEL_12;
  }
  lastMediaInfoIndex = self->_lastMediaInfoIndex;
  if (lastMediaInfoIndex == a3)
  {
    v12 = 0;
    goto LABEL_12;
  }
  if (lastMediaInfoIndex >= a3)
    goto LABEL_8;
  -[VUIBackgroundMediaController mediaInfos](self, "mediaInfos");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "count") - 1 == a3)
  {

LABEL_8:
    v12 = 1;
    goto LABEL_12;
  }
  v15 = self->_lastMediaInfoIndex;

  if (v15)
    v12 = 1;
  else
    v12 = 2;
LABEL_12:
  v16 = -[VUIBackgroundMediaController _flippedDirection:isRTL:](self, "_flippedDirection:isRTL:", v12, -[VUIBackgroundMediaController vuiIsRTL](self, "vuiIsRTL"));
  VUIDefaultLogObject();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    -[VUIBackgroundMediaController name](self, "name");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    mediaInfoIndex = self->_mediaInfoIndex;
    v25 = 134218754;
    v26 = self;
    v27 = 2112;
    v28 = v18;
    v29 = 2048;
    v30 = mediaInfoIndex;
    v31 = 2048;
    v32 = a3;
    _os_log_impl(&dword_1D96EE000, v17, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) mediaInfo oldIndex:[%lu] newIndex:[%lu]", (uint8_t *)&v25, 0x2Au);

  }
  self->_mediaInfoIndex = a3;
  self->_lastMediaInfoIndex = a3;
  -[VUIBackgroundMediaController mediaInfoFetchController](self, "mediaInfoFetchController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setIndex:", a3);

  -[VUIBackgroundMediaController mediaInfos](self, "mediaInfos");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v21, "count"))
    goto LABEL_20;
  -[VUIBackgroundMediaController mediaInfos](self, "mediaInfos");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "count");

  if (v23 > a3)
  {
    -[VUIBackgroundMediaController mediaInfos](self, "mediaInfos");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectAtIndex:", a3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!-[VUIBackgroundMediaController _mediaInfo:contentMatchesMediaInfo:](self, "_mediaInfo:contentMatchesMediaInfo:", v11, v21))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[VUIBackgroundMediaController setAutomaticPlaybackStart:](self, "setAutomaticPlaybackStart:", 1);
        -[VUIBackgroundMediaController setVpafPlaybackStartReason:](self, "setVpafPlaybackStartReason:", objc_msgSend(v21, "playbackStartReason"));
        -[VUIBackgroundMediaController setVpafPlaybackStopReason:](self, "setVpafPlaybackStopReason:", objc_msgSend(v21, "playbackStopReason"));
      }
      -[VUIBackgroundMediaController _updateWithMediaInfo:withDirection:imageVideoSwapBehavior:animated:](self, "_updateWithMediaInfo:withDirection:imageVideoSwapBehavior:animated:", v21, v16, a4, v7);
    }
LABEL_20:

  }
}

- (void)setMediaInfoIndex:(unint64_t)a3 imageVideoSwapBehavior:(unint64_t)a4 animated:(BOOL)a5
{
  -[VUIBackgroundMediaController setMediaInfoIndex:imageVideoSwapBehavior:animated:forwardAnimation:](self, "setMediaInfoIndex:imageVideoSwapBehavior:animated:forwardAnimation:", a3, a4, a5, 0);
}

- (void)setLegibleContentInsets:(UIEdgeInsets)a3
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  VUIBackgroundMediaController *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;
  UIEdgeInsets v21;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v20 = *MEMORY[0x1E0C80C00];
  self->_legibleContentInsets = a3;
  VUIDefaultLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[VUIBackgroundMediaController name](self, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v21.top = top;
    v21.left = left;
    v21.bottom = bottom;
    v21.right = right;
    NSStringFromPlatformEdgeInsets(v21);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 134218498;
    v15 = self;
    v16 = 2112;
    v17 = v9;
    v18 = 2112;
    v19 = v10;
    _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) set legibleContentInsets: %@", (uint8_t *)&v14, 0x20u);

  }
  -[VUIBackgroundMediaController avPlayerViewController](self, "avPlayerViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[VUIBackgroundMediaController stateMachine](self, "stateMachine");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "currentState");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIBackgroundMediaController _updateVideoPlayerLegibleContentInsets:](self, "_updateVideoPlayerLegibleContentInsets:", -[VUIBackgroundMediaController _shouldApplyLegibleContentInsetForState:](self, "_shouldApplyLegibleContentInsetForState:", v13));

  }
}

- (void)setImageVideoTransitionAnimationDuration:(double)a3
{
  self->_imageVideoTransitionAnimationDuration = a3;
}

- (void)setImageSwappingAnimationType:(unint64_t)a3
{
  self->_imageSwappingAnimationType = a3;
}

- (void)setImageDelayTimer:(id)a3
{
  objc_storeWeak((id *)&self->_imageDelayTimer, a3);
}

- (void)setHasViewAppeared:(BOOL)a3
{
  self->_hasViewAppeared = a3;
}

- (void)setForegroundVolume:(float)a3
{
  self->_foregroundVolume = a3;
}

- (void)setDidWeCreatePlayer:(BOOL)a3
{
  self->_didWeCreatePlayer = a3;
}

- (void)setControlsVisible:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  VUIBackgroundMediaController *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  -[VUIBackgroundMediaController avPlayerViewController](self, "avPlayerViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  VUIDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[VUIBackgroundMediaController name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    VUIBoolLogString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIBackgroundMediaController showsPlaybackControlsInForeground](self, "showsPlaybackControlsInForeground");
    VUIBoolLogString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 134218754;
    v12 = self;
    v13 = 2112;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) setControlsVisible %@ showsPlaybackControlsInForeground %@", (uint8_t *)&v11, 0x2Au);

  }
  if (-[VUIBackgroundMediaController showsPlaybackControlsInForeground](self, "showsPlaybackControlsInForeground"))
  {
    objc_msgSend(v5, "setShowsPlaybackControls:", v3);
    if (v3)
      objc_msgSend(v5, "flashPlaybackControlsWithDuration:", 5.0);
  }
  objc_msgSend(v5, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setUserInteractionEnabled:", v3);

}

- (void)setBackgroundVolume:(float)a3
{
  self->_backgroundVolume = a3;
}

- (void)setAvPlayerViewController:(id)a3
{
  AVPlayerViewController *avPlayerViewController;
  void *v6;
  id v7;

  v7 = a3;
  avPlayerViewController = self->_avPlayerViewController;
  if (avPlayerViewController)
    -[AVPlayerViewController removeObserver:forKeyPath:context:](avPlayerViewController, "removeObserver:forKeyPath:context:", self, CFSTR("videoBounds"), __PlayerAVPlayerViewControllerDisplaySizeKVOContext_0);
  objc_storeStrong((id *)&self->_avPlayerViewController, a3);
  v6 = v7;
  if (v7)
  {
    objc_msgSend(v7, "addObserver:forKeyPath:options:context:", self, CFSTR("videoBounds"), 0, __PlayerAVPlayerViewControllerDisplaySizeKVOContext_0);
    v6 = v7;
  }

}

- (void)setAnimateImageChange:(BOOL)a3
{
  self->_animateImageChange = a3;
}

- (void)setAlphaProxyImageView:(id)a3
{
  objc_storeStrong((id *)&self->_alphaProxyImageView, a3);
}

- (TVPVideoView)secondaryVideoView
{
  return self->_secondaryVideoView;
}

- (VUIImageView)proxyImageView
{
  return self->_proxyImageView;
}

- (BOOL)prefetchesVideoFrame
{
  return self->_prefetchesVideoFrame;
}

- (TVPPlayer)prefetchPlayer
{
  return self->_prefetchPlayer;
}

- (NSNumber)prefersAudioDescriptions
{
  return self->_prefersAudioDescriptions;
}

- (NSString)preferredAudioLanguageCode
{
  return self->_preferredAudioLanguageCode;
}

- (TVPPlayer)player
{
  return self->_player;
}

- (NSTimer)playbackLoadingTimer
{
  return (NSTimer *)objc_loadWeakRetained((id *)&self->_playbackLoadingTimer);
}

- (NSTimer)playbackDelayTimer
{
  return (NSTimer *)objc_loadWeakRetained((id *)&self->_playbackDelayTimer);
}

- (UIViewController)playbackContainerController
{
  return self->_playbackContainerController;
}

- (BOOL)observingInitialMediaItemHasCompletedInitialLoading
{
  return self->_observingInitialMediaItemHasCompletedInitialLoading;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((void *)__PlayerAVPlayerKVOContext_1 == a6)
  {
    -[VUIBackgroundMediaController _updateAVPlayerViewControllerWithAVPlayerForPlayer:](self, "_updateAVPlayerViewControllerWithAVPlayerForPlayer:", v11);
    goto LABEL_12;
  }
  if ((void *)__PlayerPreferredAudioLanguageCode == a6)
  {
    objc_msgSend(v11, "preferredAudioLanguageCode");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIBackgroundMediaController setPreferredAudioLanguageCode:](self, "setPreferredAudioLanguageCode:", v13);
LABEL_11:

    goto LABEL_12;
  }
  if ((void *)__PlayerPrefersAudioDescriptions == a6)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v11, "prefersAudioDescriptions"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIBackgroundMediaController setPrefersAudioDescriptions:](self, "setPrefersAudioDescriptions:", v13);
    goto LABEL_11;
  }
  if ((void *)__PlayerInitialMediaItemHasCompletedInitialLoadingKVOContext_0 == a6)
  {
    if (objc_msgSend(v11, "initialMediaItemHasCompletedInitialLoading"))
    {
      objc_msgSend(v11, "currentMediaItem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1D28]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15 && (objc_msgSend(v15, "complete") & 1) == 0)
      {
        objc_msgSend(v15, "addEndEventWithName:", *MEMORY[0x1E0DB1F10]);
        objc_msgSend(v15, "addSingleShotEventWithName:value:", *MEMORY[0x1E0DB1EF0], *MEMORY[0x1E0DB1F40]);
      }

    }
  }
  else if ((void *)__PlayerAVPlayerViewControllerDisplaySizeKVOContext_0 == a6)
  {
    -[VUIBackgroundMediaController _notifyAVPlayerViewControllerDisplaySize](self, "_notifyAVPlayerViewControllerDisplaySize");
  }
  else if ((void *)__PIPingPlayerMutedKVOContext == a6)
  {
    -[VUIBackgroundMediaController _pipPlaybackDidChangeMutedState](self, "_pipPlaybackDidChangeMutedState");
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)VUIBackgroundMediaController;
    -[VUIBackgroundMediaController observeValueForKeyPath:ofObject:change:context:](&v16, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }
LABEL_12:

}

- (NSString)name
{
  return self->_name;
}

- (BOOL)mutePlaybackInBackground
{
  return self->_mutePlaybackInBackground;
}

- (BOOL)loadsPlayerWithFullscreenPlayback
{
  return self->_loadsPlayerWithFullscreenPlayback;
}

- (void)loadAlphaImageProxy
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, void *);
  void *v12;
  id v13;
  id location;

  -[VUIBackgroundMediaController alphaImageProxy](self, "alphaImageProxy");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[VUIBackgroundMediaController alphaProxyImageView](self, "alphaProxyImageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "image");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      objc_initWeak(&location, self);
      -[VUIBackgroundMediaController alphaImageProxy](self, "alphaImageProxy");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = MEMORY[0x1E0C809B0];
      v10 = 3221225472;
      v11 = __51__VUIBackgroundMediaController_loadAlphaImageProxy__block_invoke;
      v12 = &unk_1E9FA3DE8;
      objc_copyWeak(&v13, &location);
      objc_msgSend(v7, "setCompletionHandler:", &v9);

      -[VUIBackgroundMediaController alphaImageProxy](self, "alphaImageProxy", v9, v10, v11, v12);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "load");

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }
}

- (UIEdgeInsets)legibleContentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_legibleContentInsets.top;
  left = self->_legibleContentInsets.left;
  bottom = self->_legibleContentInsets.bottom;
  right = self->_legibleContentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)isPlaybackEnabled
{
  return self->_playbackEnabled;
}

- (BOOL)isMuted
{
  return self->_muted;
}

- (BOOL)isForeground
{
  void *v2;
  void *v3;
  char v4;

  -[VUIBackgroundMediaController stateMachine](self, "stateMachine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("Showing playback in foreground"));

  return v4;
}

- (BOOL)isBackgrounded
{
  void *v3;
  void *v5;

  -[VUIBackgroundMediaController avPlayerViewController](self, "avPlayerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return !-[VUIBackgroundMediaController showsVideoControls](self, "showsVideoControls");
  -[VUIBackgroundMediaController currentMediaInfo](self, "currentMediaInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5 != 0;
}

- (VUIBackgroundMediaController)initWithName:(id)a3
{
  id v4;
  VUIBackgroundMediaController *v5;
  VUIBackgroundMediaController *v6;
  VUIImageView *v7;
  VUIImageView *proxyImageView;
  VUIMediaInfoFetchController *v9;
  VUIMediaInfoFetchController *mediaInfoFetchController;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  NSString *name;
  id v15;
  NSString *v16;
  uint64_t v17;
  TVPStateMachine *stateMachine;
  TVPStateMachine *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSString *v23;
  _QWORD v25[4];
  id v26;
  id location;
  objc_super v28;
  uint8_t buf[4];
  VUIBackgroundMediaController *v30;
  __int16 v31;
  NSString *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)VUIBackgroundMediaController;
  v5 = -[VUIBackgroundMediaController initWithNibName:bundle:](&v28, sel_initWithNibName_bundle_, 0, 0);
  v6 = v5;
  if (v5)
  {
    v5->_shouldAnimateOverlayView = 1;
    v5->_stopPlayerWhenViewDisappears = 1;
    v5->_stopPlayerWhenExitingFullScreen = 1;
    v5->_exitsFullscreenWhenPlaybackEnds = 1;
    v5->_clearPreviousImageBeforeLoading = 1;
    v5->_stopWhenAnotherMediaControllerStarts = 1;
    v5->_loadsPlayerWithFullscreenPlayback = 0;
    v5->_muted = 0;
    v5->_mutePlaybackInBackground = 1;
    v5->_useForegroundAudioSessionInBackgroundMode = 0;
    v5->_didAVPlayerControllerEnterFullscreen = 0;
    v5->_animateImageChange = 1;
    v5->_animateVideoChange = 1;
    v5->_shouldPauseAtEnd = 0;
    v5->_shouldShowImageAndStopAfterPausingAtEnd = 0;
    v5->_imageSwappingAnimationType = 1;
    v5->_videoSwappingAnimationType = 1;
    v5->_playbackStopDelayReasons = 0;
    v5->_playbackStopDelay = 0.5;
    v5->_prefetchesVideoFrame = 0;
    v5->_videoAudioRampDuration = 0.0;
    v5->_allowsExternalPlayback = 0;
    v5->_playbackStartDelay = 5.0;
    v5->_imageAnimationDuration = 0.75;
    v5->_imageTransitionAnimationDuration = 0.5;
    v5->_imageVideoTransitionAnimationDuration = 0.5;
    v5->_backgroundVolume = -1.0;
    v5->_foregroundVolume = -1.0;
    v5->_volumeTransitionAnimationDuration = 2.0;
    v5->_numberOfVolumeIncrements = 5;
    v5->_fullscreenTransitionVolumeAnimationChanges = -1.0;
    v5->_imageAnimationOptions = 5243008;
    v5->_state = 0;
    v7 = (VUIImageView *)objc_alloc_init(MEMORY[0x1E0DC6A20]);
    proxyImageView = v6->_proxyImageView;
    v6->_proxyImageView = v7;

    v6->_preloadPlaybackEnabled = 0;
    v9 = objc_alloc_init(VUIMediaInfoFetchController);
    mediaInfoFetchController = v6->_mediaInfoFetchController;
    v6->_mediaInfoFetchController = v9;

    v6->_mediaInfoIndex = 0;
    v6->_lastMediaInfoIndex = 0;
    v6->_imageContentMode = 2;
    v6->_shouldShowFullScreenButton = 1;
    v6->_hasViewAppeared = 0;
    v6->_forceAutoPlay = 0;
    v6->_autoPlayInSharePlay = 0;
    v6->_stopsPlaybackWhenInactive = 1;
    v6->_allowsPictureInPicturePlayback = 0;
    v6->_prefersAudioOverPictureInPicture = 0;
    objc_storeStrong((id *)&v6->_playbackInitiatorForRTCReporting, CFSTR("background"));
    v6->_recordPausedMediaEventAsStop = 1;
    v6->_supportsMediaSharing = 0;
    v11 = *(_OWORD *)(MEMORY[0x1E0DC49E8] + 16);
    *(_OWORD *)&v6->_legibleContentInsets.top = *MEMORY[0x1E0DC49E8];
    *(_OWORD *)&v6->_legibleContentInsets.bottom = v11;
    v6->_shouldDisableSubtitle = 0;
    v6->_disableSupplementalSubtitle = 0;
    v6->_showsPlaybackControlsInForeground = 0;
    objc_storeStrong((id *)&v6->_videoGravity, (id)*MEMORY[0x1E0C8A6E0]);
    v6->_updatesNowPlayingInfoCenter = 0;
    -[VUIBackgroundMediaController _registerForApplicationStateNotifications](v6, "_registerForApplicationStateNotifications");
    -[VUIBackgroundMediaController _registerPlaybackManagerNotification](v6, "_registerPlaybackManagerNotification");
    -[VUIBackgroundMediaController _registerAudioSessionNotification](v6, "_registerAudioSessionNotification");
    objc_initWeak(&location, v6);
    v12 = initWithName__instanceNumber_0++;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@(%ld)"), v4, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    name = v6->_name;
    v6->_name = (NSString *)v13;

    v15 = objc_alloc(MEMORY[0x1E0DB1978]);
    v16 = v6->_name;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __45__VUIBackgroundMediaController_initWithName___block_invoke;
    v25[3] = &unk_1E9F9BD50;
    objc_copyWeak(&v26, &location);
    v17 = objc_msgSend(v15, "initWithName:initialState:mode:stateChangeHandler:", v16, CFSTR("Not doing anything"), 0, v25);
    stateMachine = v6->_stateMachine;
    v6->_stateMachine = (TVPStateMachine *)v17;

    v19 = v6->_stateMachine;
    VUIDefaultLogObject();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVPStateMachine setLogObject:](v19, "setLogObject:", v20);

    -[TVPStateMachine setCallsStateChangeHandlerSynchronously:](v6->_stateMachine, "setCallsStateChangeHandlerSynchronously:", 1);
    -[VUIBackgroundMediaController _registerStateMachineHandlers](v6, "_registerStateMachineHandlers");
    -[TVPStateMachine setShouldAcceptEvents:](v6->_stateMachine, "setShouldAcceptEvents:", 1);
    +[VUIPlaybackManager sharedInstance](VUIPlaybackManager, "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v19) = objc_msgSend(v21, "isPIPing");

    if ((_DWORD)v19)
      -[VUIBackgroundMediaController updateAudioMuteWithPIPingPlayback](v6, "updateAudioMuteWithPIPingPlayback");
    VUIDefaultLogObject();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = v6->_name;
      *(_DWORD *)buf = 134218242;
      v30 = v6;
      v31 = 2112;
      v32 = v23;
      _os_log_impl(&dword_1D96EE000, v22, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) finished creating media controller.", buf, 0x16u);
    }

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (double)imageTransitionAnimationDuration
{
  return self->_imageTransitionAnimationDuration;
}

- (unint64_t)imageSwappingAnimationType
{
  return self->_imageSwappingAnimationType;
}

- (NSTimer)imageDelayTimer
{
  return (NSTimer *)objc_loadWeakRetained((id *)&self->_imageDelayTimer);
}

- (unint64_t)imageContentMode
{
  return self->_imageContentMode;
}

- (BOOL)forceAutoPlay
{
  return self->_forceAutoPlay;
}

- (BOOL)exitsFullscreenWhenPlaybackEnds
{
  return self->_exitsFullscreenWhenPlaybackEnds;
}

- (BOOL)didWeCreatePlayer
{
  return self->_didWeCreatePlayer;
}

- (AVPlayerViewController)avPlayerViewController
{
  return self->_avPlayerViewController;
}

- (BOOL)animateImageChange
{
  return self->_animateImageChange;
}

- (VUIImageView)alphaProxyImageView
{
  return self->_alphaProxyImageView;
}

- (VUIImageProxy)alphaImageProxy
{
  return self->_alphaImageProxy;
}

- (BOOL)allowsPictureInPicturePlayback
{
  return self->_allowsPictureInPicturePlayback;
}

- (BOOL)allowsExternalPlayback
{
  return self->_allowsExternalPlayback;
}

- (void)_updateWithMediaInfo:(id)a3 withDirection:(unint64_t)a4 imageVideoSwapBehavior:(unint64_t)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSString *v18;
  NSString *name;
  void *v20;
  void *v21;
  void *v22;
  NSString *v23;
  NSString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  _QWORD v32[5];

  v6 = a6;
  v32[4] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  if (v10)
  {
    -[VUIBackgroundMediaController _addContentViewIfNeeded](self, "_addContentViewIfNeeded");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v10, "tvpPlaylist");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIBackgroundMediaController setVpafPlaybackStartReason:](self, "setVpafPlaybackStartReason:", objc_msgSend(v10, "playbackStartReason"));
      -[VUIBackgroundMediaController setVpafPlaybackStopReason:](self, "setVpafPlaybackStopReason:", objc_msgSend(v10, "playbackStopReason"));
    }
    else
    {
      v11 = 0;
    }
    -[VUIBackgroundMediaController titleForLogging](self, "titleForLogging");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "length"))
    {
      -[VUIBackgroundMediaController name](self, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "rangeOfString:", v12);
      v16 = v15;

      if (v14 != 0x7FFFFFFFFFFFFFFFLL)
      {
        -[VUIBackgroundMediaController name](self, "name");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringByReplacingCharactersInRange:withString:", v14, v16, &stru_1E9FF3598);
        v18 = (NSString *)objc_claimAutoreleasedReturnValue();
        name = self->_name;
        self->_name = v18;

        -[VUIBackgroundMediaController setTitleForLogging:](self, "setTitleForLogging:", 0);
      }
    }
    objc_msgSend(v11, "currentMediaItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1CC8]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v21, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@)"), v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIBackgroundMediaController setTitleForLogging:](self, "setTitleForLogging:", v22);
      -[NSString stringByAppendingString:](self->_name, "stringByAppendingString:", v22);
      v23 = (NSString *)objc_claimAutoreleasedReturnValue();
      v24 = self->_name;
      self->_name = v23;

    }
    objc_msgSend(v10, "alphaImageProxy");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIBackgroundMediaController _setAlphaImageProxy:](self, "_setAlphaImageProxy:", v25);

    v31[0] = CFSTR("DirectionKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v26;
    v31[1] = CFSTR("AnimatedKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = v27;
    v31[2] = CFSTR("ImageVideoSwapBehaviorKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v31[3] = CFSTR("PlaybackStopReasonKey");
    v32[2] = v28;
    v32[3] = &unk_1EA0BAB10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 4);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    -[VUIBackgroundMediaController stateMachine](self, "stateMachine");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "postEvent:withContext:userInfo:", CFSTR("Set media info"), 0, v29);

  }
}

- (void)_updateVideoPlayerLegibleContentInsets:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  VUIBackgroundMediaController *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  _BOOL4 v38;
  uint64_t v39;
  UIEdgeInsets v40;

  v3 = a3;
  v39 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    -[VUIBackgroundMediaController legibleContentInsets](self, "legibleContentInsets");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    if (-[VUIBackgroundMediaController _shouldShowSecondaryView](self, "_shouldShowSecondaryView"))
    {
      -[VUIBackgroundMediaController _secondaryVideoViewHeight](self, "_secondaryVideoViewHeight");
      v10 = v10 - v13;
    }
    if ((objc_msgSend(MEMORY[0x1E0DC69D0], "isTV") & 1) != 0
      || objc_msgSend(MEMORY[0x1E0DC69D0], "isMac"))
    {
      -[VUIBackgroundMediaController avPlayerViewController](self, "avPlayerViewController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "vuiIsViewLoaded");

      if (v15)
      {
        -[VUIBackgroundMediaController avPlayerViewController](self, "avPlayerViewController");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "vuiView");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "frame");
        v19 = v18;
        v21 = v20;

        v22 = 0.0;
        if (-[VUIBackgroundMediaController _shouldShowSecondaryView](self, "_shouldShowSecondaryView"))
        {
          -[VUIBackgroundMediaController _secondaryVideoViewHeight](self, "_secondaryVideoViewHeight");
          v22 = v23;
        }
        v6 = v6 - v19;
        -[VUIBackgroundMediaController vuiView](self, "vuiView");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "bounds");
        v26 = v25 - v22;

        v10 = v10 + v19 + v21 - v26;
      }
    }
    if (v6 < 0.0)
      v6 = 0.0;
    if (v10 < 0.0)
      v10 = 0.0;
  }
  else
  {
    v6 = *MEMORY[0x1E0DC49E8];
    v8 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v10 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v12 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  }
  VUIDefaultLogObject();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    -[VUIBackgroundMediaController name](self, "name");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v40.top = v6;
    v40.left = v8;
    v40.bottom = v10;
    v40.right = v12;
    NSStringFromPlatformEdgeInsets(v40);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 134218754;
    v32 = self;
    v33 = 2112;
    v34 = v28;
    v35 = 2112;
    v36 = v29;
    v37 = 1024;
    v38 = v3;
    _os_log_impl(&dword_1D96EE000, v27, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) update video's legibleContentInsets: %@, shouldApplyLegibleContentInset=%d", (uint8_t *)&v31, 0x26u);

  }
  -[VUIBackgroundMediaController avPlayerViewController](self, "avPlayerViewController");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setLegibleContentInsets:", v6, v8, v10, v12);

}

- (void)_updatePlayerMuteStateForBackgroundPlaybackWithReason:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  VUIBackgroundMediaController *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[VUIBackgroundMediaController currentMediaInfo](self, "currentMediaInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "intent"))
    goto LABEL_2;
  -[VUIBackgroundMediaController player](self, "player");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_3;
  v7 = -[VUIBackgroundMediaController isBackgrounded](self, "isBackgrounded");
  VUIDefaultLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[VUIBackgroundMediaController name](self, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    VUIBoolLogString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIBackgroundMediaController mutePlaybackInBackground](self, "mutePlaybackInBackground");
    VUIBoolLogString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIBackgroundMediaController isMuted](self, "isMuted");
    VUIBoolLogString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 134219010;
    v22 = self;
    v23 = 2112;
    v24 = v9;
    v25 = 2112;
    v26 = v10;
    v27 = 2112;
    v28 = v11;
    v29 = 2112;
    v30 = v12;
    _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) isBackgrounded:<%@>, mutePlaybackInBackground<%@>, isMuted:<%@>", (uint8_t *)&v21, 0x34u);

  }
  if (v7)
    v7 = -[VUIBackgroundMediaController mutePlaybackInBackground](self, "mutePlaybackInBackground")
      || -[VUIBackgroundMediaController isMuted](self, "isMuted");
  -[VUIBackgroundMediaController player](self, "player");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setMuted:", v7);

  +[VUIPlaybackManager sharedInstance](VUIPlaybackManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isPIPing")
    || -[VUIBackgroundMediaController mutePlaybackInBackground](self, "mutePlaybackInBackground"))
  {
LABEL_2:

  }
  else
  {
    v14 = objc_msgSend(v4, "isEqualToString:", CFSTR("VUIBackgroundMediaControllerPlaybackMuteReasonAssigned"));

    if (v14)
    {
      +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "groupActivitiesManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isSessionActive");

      +[VUIPlaybackManager sharedInstance](VUIPlaybackManager, "sharedInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "activePlayer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v17)
        objc_msgSend(v19, "setMuted:", 1);
      else
        objc_msgSend(v19, "pause");

    }
  }
LABEL_3:

}

- (void)_updateAVPlayerViewControllerWithAVPlayerForPlayer:(id)a3
{
  id v4;
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD block[4];
  id v19;
  id v20;
  void *v21;
  uint8_t buf[4];
  VUIBackgroundMediaController *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[VUIBackgroundMediaController player](self, "player");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    VUIDefaultLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      -[VUIBackgroundMediaController name](self, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v23 = self;
      v24 = 2112;
      v25 = v11;
      v26 = 2112;
      v27 = v4;
      _os_log_impl(&dword_1D96EE000, v10, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) setting player on main %@", buf, 0x20u);

    }
    -[VUIBackgroundMediaController avPlayerViewController](self, "avPlayerViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[VUIBackgroundMediaController prefetchPlayer](self, "prefetchPlayer");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 != v4)
      goto LABEL_18;
    VUIDefaultLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[VUIBackgroundMediaController name](self, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v23 = self;
      v24 = 2112;
      v25 = v8;
      v26 = 2112;
      v27 = v4;
      _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) setting player on prefetch %@", buf, 0x20u);

    }
    -[VUIBackgroundMediaController prefetchPlayerViewController](self, "prefetchPlayerViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12 = v9;
  if (v9)
  {
    objc_msgSend(v9, "player");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __83__VUIBackgroundMediaController__updateAVPlayerViewControllerWithAVPlayerForPlayer___block_invoke;
      block[3] = &unk_1E9F98FD8;
      v19 = v12;
      v20 = v4;
      dispatch_async(MEMORY[0x1E0C80D38], block);

      v14 = v19;
    }
    else
    {
      objc_msgSend(v4, "avPlayer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setPlayer:", v14);
    }

    objc_msgSend(v4, "currentMediaItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[VUIBackgroundMediaController supportsMediaSharing](self, "supportsMediaSharing")
      && +[VUIMediaShareCoordinator shouldShowShareForMediaItem:](VUIMediaShareCoordinator, "shouldShowShareForMediaItem:", v15))
    {
      +[VUIMediaShareControlButton shareControlItemForMediaItem:inPlayerViewController:](VUIMediaShareControlButton, "shareControlItemForMediaItem:inPlayerViewController:", v15, v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setCustomControlItems:", v17);

    }
    else
    {
      objc_msgSend(v12, "setCustomControlItems:", MEMORY[0x1E0C9AA60]);
    }

  }
LABEL_18:

}

- (void)_transitionToNewImage:(id)a3 animated:(BOOL)a4 direction:(unint64_t)a5 completion:(id)a6
{
  _BOOL4 v8;
  id v10;
  void (**v11)(_QWORD);
  void *v12;
  uint64_t v13;
  id v14;
  void (**v15)(_QWORD);
  id v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t);
  void *v29;
  id v30;
  void (**v31)(_QWORD);
  void (**v32)(_QWORD);
  _QWORD aBlock[4];
  id v34;
  id v35;
  id location;

  v8 = a4;
  v10 = a3;
  v11 = (void (**)(_QWORD))a6;
  objc_initWeak(&location, self);
  -[VUIBackgroundMediaController proxyImageView](self, "proxyImageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__VUIBackgroundMediaController__transitionToNewImage_animated_direction_completion___block_invoke;
  aBlock[3] = &unk_1E9F9A938;
  objc_copyWeak(&v35, &location);
  v14 = v12;
  v34 = v14;
  v15 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (v8 && -[VUIBackgroundMediaController animateImageChange](self, "animateImageChange"))
  {
    v16 = objc_alloc_init(MEMORY[0x1E0DC6A20]);
    -[VUIBackgroundMediaController _configMirroredImageForBackgroundImage:](self, "_configMirroredImageForBackgroundImage:", v16);
    objc_msgSend(v10, "uiImage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setImage:", v17);

    objc_msgSend(v16, "setVuiContentMode:", objc_msgSend(v14, "vuiContentMode"));
    -[VUIBackgroundMediaController view](self, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "vui_insertSubview:belowSubview:oldView:", v16, v14, 0);

    objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[VUIBackgroundMediaController proxyImageView](self, "proxyImageView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setVuiAlpha:", 1.0);

    -[VUIBackgroundMediaController setProxyImageView:](self, "setProxyImageView:", v16);
    -[VUIBackgroundMediaController imageTransitionAnimationDuration](self, "imageTransitionAnimationDuration");
    v21 = v20;
    v26 = v13;
    v27 = 3221225472;
    v28 = __84__VUIBackgroundMediaController__transitionToNewImage_animated_direction_completion___block_invoke_235;
    v29 = &unk_1E9FA5460;
    v31 = v15;
    v30 = v14;
    v32 = v11;
    -[VUIBackgroundMediaController _animateTransitionFromView:toView:duration:direction:completion:](self, "_animateTransitionFromView:toView:duration:direction:completion:", v30, v16, a5, &v26, v21);

  }
  else
  {
    -[VUIBackgroundMediaController proxyImageView](self, "proxyImageView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIBackgroundMediaController _configMirroredImageForBackgroundImage:](self, "_configMirroredImageForBackgroundImage:", v22);

    -[VUIBackgroundMediaController proxyImageView](self, "proxyImageView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "uiImage");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setImage:", v24);

    v15[2](v15);
    if (v11)
      v11[2](v11);
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", v26, v27, v28, v29);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "postNotificationName:object:", CFSTR("VUIBackgroundMediaControllerImageLoadedNotification"), self);

  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);

}

- (void)_stateDidChangeFromState:(id)a3 toState:(id)a4 onEvent:(id)a5 context:(id)a6 userInfo:(id)a7
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  char *v21;
  VUIBackgroundMediaController *v22;
  uint64_t v23;
  int v24;
  VUIBackgroundMediaController *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  VUIDefaultLogObject();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    -[VUIBackgroundMediaController name](self, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 134219010;
    v25 = self;
    v26 = 2112;
    v27 = v14;
    v28 = 2112;
    v29 = v12;
    v30 = 2112;
    v31 = v10;
    v32 = 2112;
    v33 = v11;
    _os_log_impl(&dword_1D96EE000, v13, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) event:%@, fromState:%@, toState:%@", (uint8_t *)&v24, 0x34u);

  }
  if (v10 && v11)
  {
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("waiting for timeout while paused")))
    {
      VUIDefaultLogObject();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        -[VUIBackgroundMediaController name](self, "name");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 134218242;
        v25 = self;
        v26 = 2112;
        v27 = v16;
        _os_log_impl(&dword_1D96EE000, v15, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) invalidating waiting for timeout timer in paused state.", (uint8_t *)&v24, 0x16u);

      }
      -[VUIBackgroundMediaController pauseStateTimeoutTimer](self, "pauseStateTimeoutTimer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "invalidate");

      -[VUIBackgroundMediaController setPauseStateTimeoutTimer:](self, "setPauseStateTimeoutTimer:", 0);
      goto LABEL_23;
    }
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("Loading image")))
    {
      objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:", self);
    }
    else
    {
      if (!objc_msgSend(v10, "isEqualToString:", CFSTR("Showing image")))
      {
        if (objc_msgSend(v10, "isEqualToString:", CFSTR("waiting to stop playback")))
        {
          VUIDefaultLogObject();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            -[VUIBackgroundMediaController name](self, "name");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = 134218498;
            v25 = self;
            v26 = 2112;
            v27 = v19;
            v28 = 2112;
            v29 = v11;

          }
          v20 = (void *)MEMORY[0x1E0DE7910];
          v21 = sel_stop;
          v22 = self;
          v23 = 0;
        }
        else
        {
          if (objc_msgSend(v10, "isEqualToString:", CFSTR("Showing playback in foreground")))
          {
            v20 = (void *)MEMORY[0x1E0DE7910];
            v21 = sel__updatePlayerVolume_;
            v23 = MEMORY[0x1E0C9AAB0];
          }
          else
          {
            if (!objc_msgSend(v10, "isEqualToString:", CFSTR("Showing playback in background")))
              goto LABEL_23;
            v20 = (void *)MEMORY[0x1E0DE7910];
            v21 = sel__updatePlayerVolume_;
            v23 = MEMORY[0x1E0C9AAA0];
          }
          v22 = self;
        }
        objc_msgSend(v20, "cancelPreviousPerformRequestsWithTarget:selector:object:", v22, v21, v23);
        goto LABEL_23;
      }
      -[VUIBackgroundMediaController _cleanUpPlaybackTimers](self, "_cleanUpPlaybackTimers");
    }
LABEL_23:
    -[VUIBackgroundMediaController _configureAudioSessionForState:](self, "_configureAudioSessionForState:", v11);
    -[VUIBackgroundMediaController _configureLegibleContentInsetFromState:toState:](self, "_configureLegibleContentInsetFromState:toState:", v10, v11);
  }

}

- (BOOL)_shouldShowSecondaryView
{
  void *v3;
  void *v4;
  char v5;

  -[VUIBackgroundMediaController currentMediaInfo](self, "currentMediaInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[VUIBackgroundMediaController currentMediaInfo](self, "currentMediaInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "showsSecondaryVideoView");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_shouldApplyLegibleContentInsetForState:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("Showing playback in foreground")) ^ 1;
}

- (void)_setAlphaImageProxy:(id)a3
{
  VUIImageProxy **p_alphaImageProxy;
  void *v6;
  id v7;

  p_alphaImageProxy = &self->_alphaImageProxy;
  v7 = a3;
  if ((-[VUIImageProxy isEqual:](*p_alphaImageProxy, "isEqual:") & 1) == 0)
  {
    -[VUIImageProxy cancel](*p_alphaImageProxy, "cancel");
    -[VUIBackgroundMediaController alphaProxyImageView](self, "alphaProxyImageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setImage:", 0);

    objc_storeStrong((id *)&self->_alphaImageProxy, a3);
    -[VUIBackgroundMediaController loadAlphaImageProxy](self, "loadAlphaImageProxy");
    -[VUIBackgroundMediaController _addAlphaProxyImageViewIfNeeded](self, "_addAlphaProxyImageViewIfNeeded");
  }

}

- (double)_secondaryVideoViewHeight
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;

  -[VUIBackgroundMediaController currentMediaInfo](self, "currentMediaInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "primaryVideoAspectRatio");
  v5 = v4;

  if (v5 <= 0.0)
    return 300.0;
  -[VUIBackgroundMediaController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;

  -[VUIBackgroundMediaController currentMediaInfo](self, "currentMediaInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "primaryVideoAspectRatio");
  v13 = v8 / v12;

  return fmax(v10 - v13, 0.0);
}

- (CGRect)_secondaryVideoViewFrame:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  v3 = a3;
  -[VUIBackgroundMediaController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  -[VUIBackgroundMediaController _secondaryVideoViewHeight](self, "_secondaryVideoViewHeight");
  v9 = v8;

  -[VUIBackgroundMediaController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v12 = v11;
  v14 = v13;

  if (v3)
  {
    -[VUIBackgroundMediaController _secondaryVideoViewHeight](self, "_secondaryVideoViewHeight");
    v14 = v14 - v15;
  }
  v16 = v7 - v9;
  v17 = 0.0;
  v18 = v14;
  v19 = v12;
  result.size.height = v16;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (void)_registerStateMachineHandlers
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
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
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
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
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  id v55;
  void *v56;
  id v57;
  void *v58;
  id v59;
  void *v60;
  id v61;
  _QWORD v62[4];
  id v63;
  _QWORD v64[4];
  id v65;
  id v66;
  _QWORD v67[4];
  id v68;
  id v69;
  _QWORD v70[4];
  id v71;
  id v72;
  _QWORD v73[4];
  id v74;
  id v75;
  id v76;
  _QWORD v77[4];
  id v78;
  id v79;
  _QWORD v80[4];
  id v81;
  _QWORD v82[4];
  id v83;
  _QWORD v84[4];
  id v85;
  _QWORD v86[4];
  id v87;
  _QWORD v88[4];
  id v89;
  _QWORD v90[4];
  id v91;
  _QWORD v92[4];
  id v93;
  _QWORD v94[4];
  id v95;
  _QWORD v96[4];
  id v97;
  _QWORD v98[4];
  id v99;
  _QWORD v100[4];
  id v101;
  _QWORD v102[4];
  id v103;
  _QWORD v104[4];
  id v105;
  _QWORD v106[4];
  id v107;
  _QWORD v108[4];
  id v109;
  _QWORD v110[4];
  id v111;
  _QWORD v112[4];
  id v113;
  _QWORD v114[4];
  id v115;
  _QWORD v116[4];
  id v117;
  id v118;
  _QWORD v119[4];
  id v120;
  id v121;
  _QWORD v122[4];
  id v123;
  _QWORD v124[4];
  id v125;
  _QWORD v126[4];
  id v127;
  _QWORD v128[4];
  id v129;
  id v130;
  _QWORD v131[4];
  id v132;
  _QWORD v133[4];
  id v134;
  _QWORD v135[4];
  id v136;
  _QWORD v137[4];
  id v138;
  _QWORD v139[4];
  id v140;
  _QWORD v141[4];
  id v142;
  id v143;
  _QWORD aBlock[4];
  id v145;
  id location;
  _QWORD v147[2];
  _QWORD v148[2];
  _QWORD v149[3];
  _QWORD v150[2];
  _QWORD v151[4];
  _QWORD v152[2];
  _QWORD v153[4];
  _QWORD v154[2];
  _QWORD v155[2];
  _QWORD v156[5];
  _QWORD v157[4];

  v157[2] = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  v3 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke;
  aBlock[3] = &unk_1E9FA5528;
  objc_copyWeak(&v145, &location);
  v4 = _Block_copy(aBlock);
  v141[0] = v3;
  v141[1] = 3221225472;
  v141[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_252;
  v141[3] = &unk_1E9F9A060;
  objc_copyWeak(&v143, &location);
  v5 = v4;
  v142 = v5;
  v60 = _Block_copy(v141);
  v139[0] = v3;
  v139[1] = 3221225472;
  v139[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_253;
  v139[3] = &unk_1E9F99C98;
  objc_copyWeak(&v140, &location);
  v6 = _Block_copy(v139);
  -[VUIBackgroundMediaController stateMachine](self, "stateMachine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v157[0] = CFSTR("Showing playback in foreground");
  v157[1] = CFSTR("Showing playback in background");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v157, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v137[0] = v3;
  v137[1] = 3221225472;
  v137[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_255;
  v137[3] = &unk_1E9F9B8C0;
  objc_copyWeak(&v138, &location);
  objc_msgSend(v7, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Set media info"), v8, v137);

  -[VUIBackgroundMediaController stateMachine](self, "stateMachine");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v135[0] = v3;
  v135[1] = 3221225472;
  v135[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_259;
  v135[3] = &unk_1E9F9B8C0;
  objc_copyWeak(&v136, &location);
  objc_msgSend(v9, "registerDefaultHandlerForEvent:withBlock:", CFSTR("Set media info"), v135);

  -[VUIBackgroundMediaController stateMachine](self, "stateMachine");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v156[0] = CFSTR("Not doing anything");
  v156[1] = CFSTR("Loading image");
  v156[2] = CFSTR("Showing image");
  v156[3] = CFSTR("Finished playback");
  v156[4] = CFSTR("Waiting to stop after showing image");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v156, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v133[0] = v3;
  v133[1] = 3221225472;
  v133[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_4_262;
  v133[3] = &unk_1E9F9B8C0;
  objc_copyWeak(&v134, &location);
  objc_msgSend(v10, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Load image"), v11, v133);

  -[VUIBackgroundMediaController stateMachine](self, "stateMachine");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v155[0] = CFSTR("Showing playback in background");
  v155[1] = CFSTR("Showing playback in foreground");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v155, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v131[0] = v3;
  v131[1] = 3221225472;
  v131[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_263;
  v131[3] = &unk_1E9F9B8C0;
  objc_copyWeak(&v132, &location);
  objc_msgSend(v12, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Load image"), v13, v131);

  -[VUIBackgroundMediaController stateMachine](self, "stateMachine");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v128[0] = v3;
  v128[1] = 3221225472;
  v128[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_3_265;
  v128[3] = &unk_1E9F9B898;
  objc_copyWeak(&v130, &location);
  v59 = v6;
  v129 = v59;
  objc_msgSend(v14, "registerHandlerForEvent:onState:withBlock:", CFSTR("Show image"), CFSTR("Loading image"), v128);

  -[VUIBackgroundMediaController stateMachine](self, "stateMachine");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v126[0] = v3;
  v126[1] = 3221225472;
  v126[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_3_270;
  v126[3] = &unk_1E9F9B8C0;
  objc_copyWeak(&v127, &location);
  objc_msgSend(v15, "registerHandlerForEvent:onState:withBlock:", CFSTR("Show image"), CFSTR("Finished playback"), v126);

  -[VUIBackgroundMediaController stateMachine](self, "stateMachine");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v124[0] = v3;
  v124[1] = 3221225472;
  v124[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_5_272;
  v124[3] = &unk_1E9F9B8C0;
  objc_copyWeak(&v125, &location);
  objc_msgSend(v16, "registerHandlerForEvent:onState:withBlock:", CFSTR("Show image"), CFSTR("Waiting to stop after showing image"), v124);

  -[VUIBackgroundMediaController stateMachine](self, "stateMachine");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v154[0] = CFSTR("Showing playback in foreground");
  v154[1] = CFSTR("Showing playback in background");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v154, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v122[0] = v3;
  v122[1] = 3221225472;
  v122[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_8;
  v122[3] = &unk_1E9F9B8C0;
  objc_copyWeak(&v123, &location);
  objc_msgSend(v17, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Show image"), v18, v122);

  -[VUIBackgroundMediaController stateMachine](self, "stateMachine");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v153[0] = CFSTR("Not doing anything");
  v153[1] = CFSTR("Showing image");
  v153[2] = CFSTR("Loading image");
  v153[3] = CFSTR("Loading playback");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v153, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v119[0] = v3;
  v119[1] = 3221225472;
  v119[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_9;
  v119[3] = &unk_1E9F9B898;
  objc_copyWeak(&v121, &location);
  v21 = v5;
  v120 = v21;
  objc_msgSend(v19, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Load playback"), v20, v119);

  -[VUIBackgroundMediaController stateMachine](self, "stateMachine");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v152[0] = CFSTR("Showing playback in foreground");
  v152[1] = CFSTR("Showing playback in background");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v152, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v116[0] = v3;
  v116[1] = 3221225472;
  v116[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_2_276;
  v116[3] = &unk_1E9F9B898;
  objc_copyWeak(&v118, &location);
  v24 = v21;
  v117 = v24;
  objc_msgSend(v22, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Load playback"), v23, v116);

  -[VUIBackgroundMediaController stateMachine](self, "stateMachine");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v114[0] = v3;
  v114[1] = 3221225472;
  v114[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_2_278;
  v114[3] = &unk_1E9F9B8C0;
  objc_copyWeak(&v115, &location);
  objc_msgSend(v25, "registerHandlerForEvent:onState:withBlock:", CFSTR("Show playback"), CFSTR("Loading playback"), v114);

  -[VUIBackgroundMediaController stateMachine](self, "stateMachine");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v112[0] = v3;
  v112[1] = 3221225472;
  v112[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_5_281;
  v112[3] = &unk_1E9F9B8C0;
  objc_copyWeak(&v113, &location);
  objc_msgSend(v26, "registerHandlerForEvent:onState:withBlock:", CFSTR("Show playback"), CFSTR("Showing image"), v112);

  -[VUIBackgroundMediaController stateMachine](self, "stateMachine");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v110[0] = v3;
  v110[1] = 3221225472;
  v110[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_8_284;
  v110[3] = &unk_1E9F9B8C0;
  objc_copyWeak(&v111, &location);
  objc_msgSend(v27, "registerHandlerForEvent:onState:withBlock:", CFSTR("Player state changed"), CFSTR("Waiting for player to start loading"), v110);

  -[VUIBackgroundMediaController stateMachine](self, "stateMachine");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v108[0] = v3;
  v108[1] = 3221225472;
  v108[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_286;
  v108[3] = &unk_1E9F9B8C0;
  objc_copyWeak(&v109, &location);
  objc_msgSend(v28, "registerHandlerForEvent:onState:withBlock:", CFSTR("Player state changed"), CFSTR("Loading playback"), v108);

  -[VUIBackgroundMediaController stateMachine](self, "stateMachine");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v151[0] = CFSTR("waiting for timeout while paused");
  v151[1] = CFSTR("Showing playback in background");
  v151[2] = CFSTR("Showing playback in foreground");
  v151[3] = CFSTR("waiting to stop playback");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v151, 4);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v106[0] = v3;
  v106[1] = 3221225472;
  v106[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_287;
  v106[3] = &unk_1E9F9B8C0;
  objc_copyWeak(&v107, &location);
  objc_msgSend(v29, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Player state changed"), v30, v106);

  -[VUIBackgroundMediaController stateMachine](self, "stateMachine");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v104[0] = v3;
  v104[1] = 3221225472;
  v104[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_2_288;
  v104[3] = &unk_1E9F9B8C0;
  objc_copyWeak(&v105, &location);
  objc_msgSend(v31, "registerHandlerForEvent:onState:withBlock:", CFSTR("Player state changed"), CFSTR("Waiting to stop after showing image"), v104);

  -[VUIBackgroundMediaController stateMachine](self, "stateMachine");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v102[0] = v3;
  v102[1] = 3221225472;
  v102[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_3_289;
  v102[3] = &unk_1E9F9B8C0;
  objc_copyWeak(&v103, &location);
  objc_msgSend(v32, "registerDefaultHandlerForEvent:withBlock:", CFSTR("Finished playback"), v102);

  -[VUIBackgroundMediaController stateMachine](self, "stateMachine");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v100[0] = v3;
  v100[1] = 3221225472;
  v100[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_5_292;
  v100[3] = &unk_1E9F9B8C0;
  objc_copyWeak(&v101, &location);
  objc_msgSend(v33, "registerDefaultHandlerForEvent:withBlock:", CFSTR("Playback error occurred"), v100);

  -[VUIBackgroundMediaController stateMachine](self, "stateMachine");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v98[0] = v3;
  v98[1] = 3221225472;
  v98[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_7_294;
  v98[3] = &unk_1E9F9B8C0;
  objc_copyWeak(&v99, &location);
  objc_msgSend(v34, "registerHandlerForEvent:onState:withBlock:", CFSTR("Transition to foreground"), CFSTR("Loading image"), v98);

  -[VUIBackgroundMediaController stateMachine](self, "stateMachine");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v150[0] = CFSTR("Showing playback in background");
  v150[1] = CFSTR("waiting for timeout while paused");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v150, 2);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v96[0] = v3;
  v96[1] = 3221225472;
  v96[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_8_295;
  v96[3] = &unk_1E9F9B8C0;
  objc_copyWeak(&v97, &location);
  objc_msgSend(v35, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Transition to foreground"), v36, v96);

  -[VUIBackgroundMediaController stateMachine](self, "stateMachine");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v94[0] = v3;
  v94[1] = 3221225472;
  v94[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_298;
  v94[3] = &unk_1E9F9B8C0;
  objc_copyWeak(&v95, &location);
  objc_msgSend(v37, "registerHandlerForEvent:onState:withBlock:", CFSTR("Transition background"), CFSTR("Loading image"), v94);

  -[VUIBackgroundMediaController stateMachine](self, "stateMachine");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v92[0] = v3;
  v92[1] = 3221225472;
  v92[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_2_299;
  v92[3] = &unk_1E9F9B8C0;
  objc_copyWeak(&v93, &location);
  objc_msgSend(v38, "registerHandlerForEvent:onState:withBlock:", CFSTR("Transition background"), CFSTR("Loading playback"), v92);

  -[VUIBackgroundMediaController stateMachine](self, "stateMachine");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v90[0] = v3;
  v90[1] = 3221225472;
  v90[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_3_300;
  v90[3] = &unk_1E9F9B8C0;
  objc_copyWeak(&v91, &location);
  objc_msgSend(v39, "registerHandlerForEvent:onState:withBlock:", CFSTR("Transition background"), CFSTR("Showing playback in foreground"), v90);

  -[VUIBackgroundMediaController stateMachine](self, "stateMachine");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v149[0] = CFSTR("Showing playback in background");
  v149[1] = CFSTR("Showing playback in foreground");
  v149[2] = CFSTR("Loading playback");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v149, 3);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v88[0] = v3;
  v88[1] = 3221225472;
  v88[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_5_302;
  v88[3] = &unk_1E9F9B8C0;
  objc_copyWeak(&v89, &location);
  objc_msgSend(v40, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Play"), v41, v88);

  -[VUIBackgroundMediaController stateMachine](self, "stateMachine");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v148[0] = CFSTR("waiting for timeout while paused");
  v148[1] = CFSTR("waiting to stop playback");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v148, 2);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v86[0] = v3;
  v86[1] = 3221225472;
  v86[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_303;
  v86[3] = &unk_1E9F9B8C0;
  objc_copyWeak(&v87, &location);
  objc_msgSend(v42, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Play"), v43, v86);

  -[VUIBackgroundMediaController stateMachine](self, "stateMachine");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v84[0] = v3;
  v84[1] = 3221225472;
  v84[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_3_305;
  v84[3] = &unk_1E9F9B8C0;
  objc_copyWeak(&v85, &location);
  objc_msgSend(v44, "registerHandlerForEvent:onState:withBlock:", CFSTR("Pause"), CFSTR("Showing playback in background"), v84);

  -[VUIBackgroundMediaController stateMachine](self, "stateMachine");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v82[0] = v3;
  v82[1] = 3221225472;
  v82[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_308;
  v82[3] = &unk_1E9F9B8C0;
  objc_copyWeak(&v83, &location);
  objc_msgSend(v45, "registerHandlerForEvent:onState:withBlock:", CFSTR("Pause show image and stop"), CFSTR("Showing playback in background"), v82);

  -[VUIBackgroundMediaController stateMachine](self, "stateMachine");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v80[0] = v3;
  v80[1] = 3221225472;
  v80[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_3_310;
  v80[3] = &unk_1E9F9B8C0;
  objc_copyWeak(&v81, &location);
  objc_msgSend(v46, "registerDefaultHandlerForEvent:withBlock:", CFSTR("Stop"), v80);

  -[VUIBackgroundMediaController stateMachine](self, "stateMachine");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v77[0] = v3;
  v77[1] = 3221225472;
  v77[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_4_311;
  v77[3] = &unk_1E9F9B898;
  objc_copyWeak(&v79, &location);
  v48 = v59;
  v78 = v48;
  objc_msgSend(v47, "registerHandlerForEvent:onState:withBlock:", CFSTR("Replay"), CFSTR("Not doing anything"), v77);

  -[VUIBackgroundMediaController stateMachine](self, "stateMachine");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v73[0] = v3;
  v73[1] = 3221225472;
  v73[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_313;
  v73[3] = &unk_1E9F9C0A8;
  objc_copyWeak(&v76, &location);
  v50 = v48;
  v74 = v50;
  v61 = v60;
  v75 = v61;
  objc_msgSend(v49, "registerHandlerForEvent:onState:withBlock:", CFSTR("Replay"), CFSTR("Showing image"), v73);

  -[VUIBackgroundMediaController stateMachine](self, "stateMachine");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v147[0] = CFSTR("Waiting for player to start loading");
  v147[1] = CFSTR("Loading playback");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v147, 2);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v70[0] = v3;
  v70[1] = 3221225472;
  v70[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_315;
  v70[3] = &unk_1E9F9B898;
  objc_copyWeak(&v72, &location);
  v53 = v50;
  v71 = v53;
  objc_msgSend(v51, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Replay"), v52, v70);

  -[VUIBackgroundMediaController stateMachine](self, "stateMachine");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v67[0] = v3;
  v67[1] = 3221225472;
  v67[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_316;
  v67[3] = &unk_1E9F9B898;
  objc_copyWeak(&v69, &location);
  v55 = v24;
  v68 = v55;
  objc_msgSend(v54, "registerHandlerForEvent:onState:withBlock:", CFSTR("Restore avPlayerViewController"), CFSTR("Not doing anything"), v67);

  -[VUIBackgroundMediaController stateMachine](self, "stateMachine");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v64[0] = v3;
  v64[1] = 3221225472;
  v64[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_3_318;
  v64[3] = &unk_1E9F9B898;
  objc_copyWeak(&v66, &location);
  v57 = v55;
  v65 = v57;
  objc_msgSend(v56, "registerDefaultHandlerForEvent:withBlock:", CFSTR("Restore avPlayerViewController"), v64);

  -[VUIBackgroundMediaController stateMachine](self, "stateMachine");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v62[0] = v3;
  v62[1] = 3221225472;
  v62[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_5_320;
  v62[3] = &unk_1E9F9B8C0;
  objc_copyWeak(&v63, &location);
  objc_msgSend(v58, "registerHandlerForEvent:onState:withBlock:", CFSTR("AvPlayerViewController did exit fullscreen presentation"), CFSTR("Showing playback in foreground"), v62);

  objc_destroyWeak(&v63);
  objc_destroyWeak(&v66);

  objc_destroyWeak(&v69);
  objc_destroyWeak(&v72);

  objc_destroyWeak(&v76);
  objc_destroyWeak(&v79);
  objc_destroyWeak(&v81);
  objc_destroyWeak(&v83);
  objc_destroyWeak(&v85);
  objc_destroyWeak(&v87);
  objc_destroyWeak(&v89);
  objc_destroyWeak(&v91);
  objc_destroyWeak(&v93);
  objc_destroyWeak(&v95);
  objc_destroyWeak(&v97);
  objc_destroyWeak(&v99);
  objc_destroyWeak(&v101);
  objc_destroyWeak(&v103);
  objc_destroyWeak(&v105);
  objc_destroyWeak(&v107);
  objc_destroyWeak(&v109);
  objc_destroyWeak(&v111);
  objc_destroyWeak(&v113);
  objc_destroyWeak(&v115);

  objc_destroyWeak(&v118);
  objc_destroyWeak(&v121);
  objc_destroyWeak(&v123);
  objc_destroyWeak(&v125);
  objc_destroyWeak(&v127);

  objc_destroyWeak(&v130);
  objc_destroyWeak(&v132);
  objc_destroyWeak(&v134);
  objc_destroyWeak(&v136);
  objc_destroyWeak(&v138);

  objc_destroyWeak(&v140);
  objc_destroyWeak(&v143);

  objc_destroyWeak(&v145);
  objc_destroyWeak(&location);
}

- (void)_registerPlayerNotifications
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  VUIBackgroundMediaController *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  VUIDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[VUIBackgroundMediaController name](self, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 134218242;
    v16 = self;
    v17 = 2112;
    v18 = v4;
    _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) register player notifications and add observers", (uint8_t *)&v15, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0DB1F58];
  -[VUIBackgroundMediaController player](self, "player");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__playbackStateChanged_, v6, v7);

  v8 = *MEMORY[0x1E0DB1E48];
  -[VUIBackgroundMediaController player](self, "player");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__playbackErrorDidOccur_, v8, v9);

  v10 = *MEMORY[0x1E0DB1F70];
  -[VUIBackgroundMediaController player](self, "player");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__playbackStateWillChange_, v10, v11);

  v12 = *MEMORY[0x1E0DB1F90];
  -[VUIBackgroundMediaController player](self, "player");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__externalPlaybackStateChanged_, v12, v13);

  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__mediaControllerStartedPlayback_, CFSTR("VUIBackgroundMediaControllerWillStartPlaybackNotification"), 0);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__mediaControllerStartedPlayback_, CFSTR("VUIBackgroundMediaControllerDidStartPlaybackNotification"), 0);
  if (!-[VUIBackgroundMediaController observingInitialMediaItemHasCompletedInitialLoading](self, "observingInitialMediaItemHasCompletedInitialLoading"))
  {
    -[VUIBackgroundMediaController player](self, "player");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:forKeyPath:options:context:", self, CFSTR("initialMediaItemHasCompletedInitialLoading"), 0, __PlayerInitialMediaItemHasCompletedInitialLoadingKVOContext_0);

    -[VUIBackgroundMediaController setObservingInitialMediaItemHasCompletedInitialLoading:](self, "setObservingInitialMediaItemHasCompletedInitialLoading:", 1);
  }

}

- (void)_registerPlaybackManagerNotification
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_playBackManagerFullscreenPlaybackUIDidChangeNotification_, VUIPlaybackManagerFullscreenPlaybackUIDidChangeNotification[0], 0);
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_playbackManagerShowingExtrasDidChangeNotification_, VUIPlaybackManagerShowingExtrasDidChangeNotification[0], 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_updateAudioMuteWithPIPingPlayback, VUIPlaybackManagerIsPIPingDidChangeNotification[0], 0);

}

- (void)_registerForApplicationStateNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleApplicationWillResignActiveNotification_, *MEMORY[0x1E0DC6AC8], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleApplicationDidEnterBackgroundNotification_, *MEMORY[0x1E0DC6AB8], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleApplicationDidBecomeActiveNotification_, *MEMORY[0x1E0DC6AB0], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__applicationWillAddDeactivationReason_, *MEMORY[0x1E0DC5760], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__applicationDidRemoveDeactivationReason_, *MEMORY[0x1E0DC5718], 0);

}

- (void)_registerAudioSessionNotification
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__audioSessionSilentSecondaryAudioDidChange_, *MEMORY[0x1E0C89890], 0);

}

- (BOOL)_playlist:(id)a3 contentMatchesPlaylist:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  int v16;
  char v17;
  char v18;
  char v19;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "currentMediaItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0DB1C98];
  objc_msgSend(v7, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1C98]);
  v9 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "currentMediaItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "mediaItemMetadataForProperty:", v8);
  v11 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "currentMediaItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "mediaItemMetadataForProperty:", CFSTR("VUIMediaItemMetadataClipId"));
  v13 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "currentMediaItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "mediaItemMetadataForProperty:", CFSTR("VUIMediaItemMetadataClipId"));
  v15 = objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v6, "isEqualToPlaylist:", v5);
  if (v9 | v11)
    v17 = objc_msgSend((id)v9, "isEqualToDate:", v11);
  else
    v17 = 1;
  if (!(v13 | v15))
  {
    v18 = 1;
    if (!v16)
      goto LABEL_6;
LABEL_8:
    v19 = v17 & v18;
    goto LABEL_9;
  }
  v18 = objc_msgSend((id)v13, "isEqualToString:", v15);
  if (v16)
    goto LABEL_8;
LABEL_6:
  v19 = 0;
LABEL_9:

  return v19;
}

- (void)_playbackStateChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  _QWORD v35[3];
  _QWORD v36[3];
  uint8_t buf[4];
  VUIBackgroundMediaController *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0DB1F60]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0DB1F68]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  VUIDefaultLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[VUIBackgroundMediaController name](self, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIBackgroundMediaController player](self, "player");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    v38 = self;
    v39 = 2112;
    v40 = v10;
    v41 = 2048;
    v42 = v11;
    v43 = 2112;
    v44 = v6;
    v45 = 2112;
    v46 = v8;
    _os_log_impl(&dword_1D96EE000, v9, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) playback state changed (%p), new state %@, old state %@", buf, 0x34u);

  }
  objc_msgSend(MEMORY[0x1E0DB1958], "playing");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v12)
  {
    v35[0] = CFSTR("VUIBackgroundMediaControllerIsForegroundedKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[VUIBackgroundMediaController isBackgrounded](self, "isBackgrounded") ^ 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v16;
    v35[1] = CFSTR("VUIBackgroundMediaControllerIsAutomaticPlaybackStartKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VUIBackgroundMediaController isAutomaticPlaybackStart](self, "isAutomaticPlaybackStart"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = v17;
    v35[2] = CFSTR("VUIBackgroundMediaControllerPlaybackStartReasonKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[VUIBackgroundMediaController vpafPlaybackStartReason](self, "vpafPlaybackStartReason"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v36[2] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[VUIBackgroundMediaController _updateCurrentPlaybackViewFrameForPlaybackInBackground:animated:](self, "_updateCurrentPlaybackViewFrameForPlaybackInBackground:animated:", -[VUIBackgroundMediaController isBackgrounded](self, "isBackgrounded"), 0);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIBackgroundMediaController setPlaybackStartDate:](self, "setPlaybackStartDate:", v20);

    -[VUIBackgroundMediaController _recordBgAutoPlayMediaEventForPlaybackState:](self, "_recordBgAutoPlayMediaEventForPlaybackState:", v6);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "postNotificationName:object:userInfo:", CFSTR("VUIBackgroundMediaControllerDidStartPlaybackNotification"), self, v19);

LABEL_16:
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x1E0DB1958], "paused");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v6 == (void *)v13)
  {

  }
  else
  {
    v14 = (void *)v13;
    objc_msgSend(MEMORY[0x1E0DB1958], "stopped");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 != v15)
      goto LABEL_17;
  }
  -[VUIBackgroundMediaController player](self, "player");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "cachedElapsedTime");
  v24 = v23;

  -[VUIBackgroundMediaController player](self, "player");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "duration");
  v27 = v26;
  v28 = *MEMORY[0x1E0DB1990];

  if (v24 > 0.0 && -[VUIBackgroundMediaController recordPausedMediaEventAsStop](self, "recordPausedMediaEventAsStop")
    || v27 == v28
    || (objc_msgSend(MEMORY[0x1E0DB1958], "stopped"),
        v29 = (void *)objc_claimAutoreleasedReturnValue(),
        v29,
        v6 == v29))
  {
    -[VUIBackgroundMediaController _recordBgAutoPlayMediaEventForPlaybackState:](self, "_recordBgAutoPlayMediaEventForPlaybackState:", v6);
  }
  objc_msgSend(MEMORY[0x1E0DB1958], "paused");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v30)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "postNotificationName:object:userInfo:", CFSTR("VUIBackgroundMediaControllerDidPausePlaybackNotification"), self, 0);
    goto LABEL_16;
  }
LABEL_17:
  -[VUIBackgroundMediaController stateMachine](self, "stateMachine");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = CFSTR("PlaybackStateKey");
  v34 = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "postEvent:withContext:userInfo:", CFSTR("Player state changed"), 0, v32);

}

- (CGRect)_playbackContainerViewFrame:(BOOL)a3 hasSecondaryVideoView:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  v4 = a4;
  v5 = a3;
  -[VUIBackgroundMediaController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  if (v5 && v4)
  {
    -[VUIBackgroundMediaController _secondaryVideoViewHeight](self, "_secondaryVideoViewHeight");
    v15 = v15 - v16;
  }
  v17 = v9;
  v18 = v11;
  v19 = v13;
  v20 = v15;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (void)_observeModalNavigationControllerNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleNavigationControllerDidShow, *MEMORY[0x1E0DC6B68], 0);

}

- (void)_notifyAVPlayerViewControllerDisplaySize
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v9;
  CFDictionaryRef DictionaryRepresentation;
  void *v11;
  void *v12;
  id v13;
  CGSize v14;

  -[VUIBackgroundMediaController avPlayerViewController](self, "avPlayerViewController");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v13, "videoDisplaySize");
  v6 = v5;
  v7 = v4;
  if (v5 != *MEMORY[0x1E0C9D820] || v4 != *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    objc_msgSend(v13, "videoDisplayScale");
    v14.height = round(v7) * v9;
    v14.width = round(v6) * v9;
    DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(v14);
    objc_msgSend(v3, "vui_setObjectIfNotNil:forKey:", DictionaryRepresentation, CFSTR("VUIBackgroundMediaControllerDisplaySizeKey"));
    -[VUIBackgroundMediaController player](self, "player");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "vui_setObjectIfNotNil:forKey:", v11, CFSTR("VUIBackgroundMediaControllerPlayerKey"));

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "postNotificationName:object:userInfo:", CFSTR("VUIBackgroundMediaControllerVideoDisplaySizeDidChangeNotification"), self, v3);

  }
}

- (BOOL)_mediaInfo:(id)a3 contentMatchesMediaInfo:(id)a4
{
  BOOL v4;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  BOOL v16;

  v4 = 0;
  if (a3 && a4)
  {
    v7 = a4;
    v8 = a3;
    objc_msgSend(v8, "imageProxies");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "imageProxies");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "tvpPlaylist");
    v13 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "tvpPlaylist");
    v14 = objc_claimAutoreleasedReturnValue();

    if (v10 | v12)
      v15 = objc_msgSend((id)v10, "isEqual:", v12);
    else
      v15 = 1;
    if (v13 | v14)
      v16 = -[VUIBackgroundMediaController _playlist:contentMatchesPlaylist:](self, "_playlist:contentMatchesPlaylist:", v13, v14);
    else
      v16 = 1;
    v4 = v15 & v16;

  }
  return v4;
}

- (void)_loadImage:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[VUIBackgroundMediaController mediaInfoFetchController](self, "mediaInfoFetchController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[VUIBackgroundMediaController mediaInfoIndex](self, "mediaInfoIndex");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__VUIBackgroundMediaController__loadImage___block_invoke;
  v8[3] = &unk_1E9F9E918;
  objc_copyWeak(&v10, &location);
  v7 = v4;
  v9 = v7;
  objc_msgSend(v5, "loadImageAtIndex:completion:", v6, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

- (BOOL)_isViewInTopMostVisibleView
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  int v10;
  VUIBackgroundMediaController *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  +[VUIApplicationRouter topMostVisibleViewController](VUIApplicationRouter, "topMostVisibleViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vuiView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  VUIDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[VUIBackgroundMediaController name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 134218498;
    v11 = self;
    v12 = 2112;
    v13 = v6;
    v14 = 2112;
    v15 = v3;
    _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) topMostVisibleViewController: %@", (uint8_t *)&v10, 0x20u);

  }
  if (v4)
  {
    -[VUIBackgroundMediaController vuiView](self, "vuiView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isDescendantOfView:", v4);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_hasSecondaryView
{
  void *v2;
  BOOL v3;

  -[VUIBackgroundMediaController secondaryVideoView](self, "secondaryVideoView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (unint64_t)_flippedDirection:(unint64_t)a3 isRTL:(BOOL)a4
{
  unint64_t v4;
  unint64_t v5;

  v4 = 1;
  v5 = 2;
  if (a3 != 1)
    v5 = a3;
  if (a3 != 2)
    v4 = v5;
  if (a4)
    return v4;
  else
    return a3;
}

- (void)_externalPlaybackStateChanged:(id)a3
{
  id v4;

  objc_msgSend(a3, "object");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (-[VUIBackgroundMediaController prefetchesVideoFrame](self, "prefetchesVideoFrame"))
    -[VUIBackgroundMediaController _populatePlayerWithMediaItemsIfNeeded:](self, "_populatePlayerWithMediaItemsIfNeeded:", v4);

}

- (BOOL)_currentMediaInfoImagesMatchesNewMediaInfoImage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  -[VUIBackgroundMediaController currentMediaInfo](self, "currentMediaInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageProxies");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "imageProxies");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0;
  if (v7 && v9)
    v10 = objc_msgSend(v7, "isEqual:", v9);

  return v10;
}

- (id)_createPlayerViewController
{
  void *v3;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B448]), "initWithNibName:bundle:", 0, 0);
  -[VUIBackgroundMediaController _configurePlayerViewController:](self, "_configurePlayerViewController:", v3);
  return v3;
}

- (void)_constrainToView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];

  v23[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "widthAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIBackgroundMediaController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "widthAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "heightAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIBackgroundMediaController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "heightAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "centerXAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIBackgroundMediaController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "centerXAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "centerYAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[VUIBackgroundMediaController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "centerYAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)MEMORY[0x1E0CB3718];
  v23[0] = v8;
  v23[1] = v12;
  v23[2] = v16;
  v23[3] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "activateConstraints:", v22);

}

- (void)_configurePlayerViewController:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  v4 = a3;
  objc_msgSend(v4, "setUpdatesNowPlayingInfoCenter:", -[VUIBackgroundMediaController updatesNowPlayingInfoCenter](self, "updatesNowPlayingInfoCenter"));
  objc_msgSend(v4, "setAllowsPictureInPicturePlayback:", -[VUIBackgroundMediaController allowsPictureInPicturePlayback](self, "allowsPictureInPicturePlayback"));
  objc_msgSend(v4, "setCanIncludePlaybackControlsWhenInline:", 0);
  objc_msgSend(v4, "setCanPausePlaybackWhenExitingFullScreen:", 0);
  objc_msgSend(v4, "setShowsMinimalPlaybackControlsWhenEmbeddedInline:", 1);
  objc_msgSend(v4, "setDelegate:", self);
  -[VUIBackgroundMediaController videoGravity](self, "videoGravity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setVideoGravity:", v5);

  objc_msgSend(v4, "setExitsFullScreenWhenPlaybackEnds:", -[VUIBackgroundMediaController exitsFullscreenWhenPlaybackEnds](self, "exitsFullscreenWhenPlaybackEnds"));
  objc_msgSend(v4, "setShowsPlaybackControls:", 0);
  if (-[VUIBackgroundMediaController disableSupplementalSubtitle](self, "disableSupplementalSubtitle"))
    objc_msgSend(v4, "setPreferredPlaybackControlsSupplementalSubtitleDisplayOption:", 0);
  objc_msgSend(v4, "setAllowsVideoFrameAnalysis:", 0);
  VUIDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::setAllowInfoMetadataSubpanel: NO", v9, 2u);
  }

  objc_msgSend(v4, "setAllowInfoMetadataSubpanel:", 0);
  objc_msgSend(v4, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIBackgroundMediaController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  objc_msgSend(v7, "setFrame:");

}

- (void)_configureLegibleContentInsetFromState:(id)a3 toState:(id)a4
{
  id v6;
  _BOOL4 v7;
  _BOOL8 v8;
  NSObject *v9;
  void *v10;
  int v11;
  VUIBackgroundMediaController *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = -[VUIBackgroundMediaController _shouldApplyLegibleContentInsetForState:](self, "_shouldApplyLegibleContentInsetForState:", a3);
  v8 = -[VUIBackgroundMediaController _shouldApplyLegibleContentInsetForState:](self, "_shouldApplyLegibleContentInsetForState:", v6);

  if (v7 != v8)
  {
    VUIDefaultLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[VUIBackgroundMediaController name](self, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 134218242;
      v12 = self;
      v13 = 2112;
      v14 = v10;
      _os_log_impl(&dword_1D96EE000, v9, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) Video changes between background & foreground, update legibleContentInsets", (uint8_t *)&v11, 0x16u);

    }
    -[VUIBackgroundMediaController _updateVideoPlayerLegibleContentInsets:](self, "_updateVideoPlayerLegibleContentInsets:", v8);
  }
}

- (void)_configureAudioSession
{
  void *v3;
  id v4;

  -[VUIBackgroundMediaController stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentState");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  -[VUIBackgroundMediaController _configureAudioSessionForState:](self, "_configureAudioSessionForState:", v4);
}

- (void)_configureAudioSessionForState:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  VUIBackgroundMediaController *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("Showing playback in background")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("Showing playback in foreground")) & 1) != 0)
  {
    VUIDefaultLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[VUIBackgroundMediaController name](self, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIBackgroundMediaController isBackgrounded](self, "isBackgrounded");
      VUIBoolLogString();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      VUIBoolLogString();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 134218754;
      v12 = self;
      v13 = 2112;
      v14 = v6;
      v15 = 2112;
      v16 = v7;
      v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) isBackgrounded:[%@] usingPlaybackCategory:[%@]", (uint8_t *)&v11, 0x2Au);

    }
    +[VUIPlaybackManager sharedInstance](VUIPlaybackManager, "sharedInstance");
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject configureAudioSessionForBackgroundPlayback:usingPlaybackCategory:isMultiview:](v9, "configureAudioSessionForBackgroundPlayback:usingPlaybackCategory:isMultiview:", -[VUIBackgroundMediaController isBackgrounded](self, "isBackgrounded"), self->_useForegroundAudioSessionInBackgroundMode, 0);
  }
  else
  {
    VUIDefaultLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[VUIBackgroundMediaController name](self, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 134218498;
      v12 = self;
      v13 = 2112;
      v14 = v10;
      v15 = 2112;
      v16 = v4;
      _os_log_impl(&dword_1D96EE000, v9, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) state = %@, video isn't playing, skip audio session configuration", (uint8_t *)&v11, 0x20u);

    }
  }

}

- (void)_cleanUpPlaybackTimers
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  VUIBackgroundMediaController *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[VUIBackgroundMediaController playbackLoadingTimer](self, "playbackLoadingTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    VUIDefaultLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      -[VUIBackgroundMediaController name](self, "name");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 134218242;
      v10 = self;
      v11 = 2112;
      v12 = v5;
      _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) invalidating playlist loading timer.", (uint8_t *)&v9, 0x16u);

    }
    objc_msgSend(v3, "invalidate");
    -[VUIBackgroundMediaController setPlaybackLoadingTimer:](self, "setPlaybackLoadingTimer:", 0);
    -[VUIBackgroundMediaController setPlaybackLoadingStartDate:](self, "setPlaybackLoadingStartDate:", 0);
  }
  -[VUIBackgroundMediaController playbackDelayTimer](self, "playbackDelayTimer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    VUIDefaultLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[VUIBackgroundMediaController name](self, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 134218242;
      v10 = self;
      v11 = 2112;
      v12 = v8;
      _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) invalidating playback timer.", (uint8_t *)&v9, 0x16u);

    }
    objc_msgSend(v6, "invalidate");
    -[VUIBackgroundMediaController setPlaybackDelayTimer:](self, "setPlaybackDelayTimer:", 0);
    -[VUIBackgroundMediaController setPlaybackLoadingStartDate:](self, "setPlaybackLoadingStartDate:", 0);
  }

}

- (BOOL)_autoPlayEnabled
{
  NSObject *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  void *v10;
  int v11;
  _BOOL4 v12;
  _BOOL4 IsVideoAutoplayEnabled;
  NSObject *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  int v19;
  VUIBackgroundMediaController *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  _BOOL4 v24;
  __int16 v25;
  _BOOL4 v26;
  __int16 v27;
  _BOOL4 v28;
  __int16 v29;
  int v30;
  __int16 v31;
  int v32;
  __int16 v33;
  _BOOL4 v34;
  __int16 v35;
  _BOOL4 v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (-[VUIBackgroundMediaController forceAutoPlay](self, "forceAutoPlay"))
  {
    VUIDefaultLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      -[VUIBackgroundMediaController name](self, "name");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 134218242;
      v20 = self;
      v21 = 2112;
      v22 = v4;
      _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) auto play is enabled because forceAutoPlay is YES", (uint8_t *)&v19, 0x16u);

    }
    LOBYTE(v5) = 1;
  }
  else
  {
    +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "groupActivitiesManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isSessionActive");

    v9 = objc_msgSend(MEMORY[0x1E0DC6960], "isFeatureEnabled:", 1);
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isLowPowerModeEnabled");

    v12 = -[VUIBackgroundMediaController _isViewInTopMostVisibleView](self, "_isViewInTopMostVisibleView");
    IsVideoAutoplayEnabled = UIAccessibilityIsVideoAutoplayEnabled();
    VUIDefaultLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      -[VUIBackgroundMediaController name](self, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 134219010;
      v20 = self;
      v21 = 2112;
      v22 = v15;
      v23 = 1024;
      v24 = 0;
      v25 = 1024;
      v26 = 0;
      v27 = 1024;
      v28 = -[VUIBackgroundMediaController loadsPlayerWithFullscreenPlayback](self, "loadsPlayerWithFullscreenPlayback");
      _os_log_impl(&dword_1D96EE000, v14, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) isDisabledBecauseOfFullScreenPlayback=%d, isPlaybackUIBeingShown=%d, loadsPlayerWithFullscreenPlayback=%d", (uint8_t *)&v19, 0x28u);

    }
    v5 = ((!IsVideoAutoplayEnabled | v9 | v11) & 1) == 0
      && (!v8 || -[VUIBackgroundMediaController autoPlayInSharePlay](self, "autoPlayInSharePlay"))
      && v12;
    VUIDefaultLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      -[VUIBackgroundMediaController name](self, "name");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[VUIBackgroundMediaController autoPlayInSharePlay](self, "autoPlayInSharePlay");
      v19 = 134220034;
      v20 = self;
      v21 = 2112;
      v22 = v16;
      v23 = 1024;
      v24 = v5;
      v25 = 1024;
      v26 = IsVideoAutoplayEnabled;
      v27 = 1024;
      v28 = v9;
      v29 = 1024;
      v30 = v11;
      v31 = 1024;
      v32 = v8;
      v33 = 1024;
      v34 = v17;
      v35 = 1024;
      v36 = v12;
      _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) check _autoPlayEnabled=%d, isVideoAutoPlayEnabled=%d, isReduceMotionEnabled=%d,            isLowPowerModeEnabled=%d, isSharePlay=%d, autoPlayInSharePlay=%d, isViewInTopMostVisibleView=%d", (uint8_t *)&v19, 0x40u);

    }
  }

  return v5;
}

- (void)_animateTransitionFromView:(id)a3 toView:(id)a4 duration:(double)a5 direction:(unint64_t)a6 completion:(id)a7
{
  id v11;
  id v12;
  void (**v13)(_QWORD);
  void *v14;
  void *v15;
  double Width;
  void *v17;
  void *v18;
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
  unint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  uint64_t v45;
  void *v46;
  _QWORD block[4];
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  void (**v55)(_QWORD);
  id v56[4];
  id location;
  _QWORD v58[6];
  CGRect v59;

  v58[4] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = (void (**)(_QWORD))a7;
  objc_initWeak(&location, self);
  if (-[VUIBackgroundMediaController animateImageChange](self, "animateImageChange")
    && -[VUIBackgroundMediaController imageSwappingAnimationType](self, "imageSwappingAnimationType"))
  {
    objc_msgSend(v12, "constraints");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeConstraints:", v14);

    -[VUIBackgroundMediaController view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bounds");
    Width = CGRectGetWidth(v59);

    objc_msgSend(v12, "widthAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIBackgroundMediaController view](self, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "widthAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v19);
    v45 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "heightAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIBackgroundMediaController view](self, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "heightAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "centerXAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIBackgroundMediaController view](self, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "centerXAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "centerYAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIBackgroundMediaController view](self, "view");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "centerYAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = -[VUIBackgroundMediaController imageSwappingAnimationType](self, "imageSwappingAnimationType");
    switch(v32)
    {
      case 1uLL:
        -[VUIBackgroundMediaController view](self, "view");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "vui_bringSubviewToFront:", v12);

        objc_msgSend(v11, "setVuiAlpha:", 1.0);
        objc_msgSend(v12, "setVuiAlpha:", 0.0);
        break;
      case 2uLL:
        v35 = v27;
        v36 = Width;
        if (a6 != 2)
        {
          if (a6 != 1)
            break;
          v36 = -Width;
          v35 = v27;
        }
LABEL_17:
        objc_msgSend(v35, "setConstant:", v36, v45);
        break;
      case 3uLL:
        -[VUIBackgroundMediaController view](self, "view");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "vui_bringSubviewToFront:", v12);

        if (a6 == 2)
        {
          objc_msgSend(v27, "setConstant:", Width * 0.5);
          goto LABEL_16;
        }
        if (a6 == 1)
        {
          objc_msgSend(v27, "setConstant:", Width * -0.5);
LABEL_16:
          v36 = -Width;
          v35 = (void *)v45;
          goto LABEL_17;
        }
        break;
    }
    v37 = (void *)MEMORY[0x1E0CB3718];
    v58[0] = v45;
    v58[1] = v23;
    v58[2] = v27;
    v58[3] = v31;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 4, v45);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "activateConstraints:", v38);

    -[VUIBackgroundMediaController view](self, "view");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "vui_setNeedsLayout");

    -[VUIBackgroundMediaController view](self, "view");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "vui_layoutIfNeeded");

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __96__VUIBackgroundMediaController__animateTransitionFromView_toView_duration_direction_completion___block_invoke;
    block[3] = &unk_1E9FA5438;
    objc_copyWeak(v56, &location);
    v56[1] = (id)a6;
    v49 = v27;
    v50 = v46;
    v56[2] = *(id *)&Width;
    v56[3] = *(id *)&a5;
    v51 = v11;
    v52 = v12;
    v53 = v23;
    v54 = v31;
    v55 = v13;
    v41 = v31;
    v42 = v23;
    v43 = v46;
    v44 = v27;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(v56);
    goto LABEL_19;
  }
  if (v13)
    v13[2](v13);
LABEL_19:
  objc_destroyWeak(&location);

}

- (void)_addProxyImageView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "setVuiContentMode:", -[VUIBackgroundMediaController imageContentMode](self, "imageContentMode"));
  v4 = v9;
  if (v9)
  {
    -[VUIBackgroundMediaController currentMediaInfo](self, "currentMediaInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "overlayView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[VUIBackgroundMediaController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
      objc_msgSend(v7, "vui_insertSubview:belowSubview:oldView:", v9, v6, 0);
    else
      objc_msgSend(v7, "vui_addSubview:oldView:", v9, 0);

    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[VUIBackgroundMediaController _constrainToView:](self, "_constrainToView:", v9);
    objc_msgSend(v9, "setVuiAlpha:", 0.0);

    v4 = v9;
  }

}

- (void)_addPlaybackViewControllerForPlayback:(BOOL)a3 restoringAVPlayerViewController:(BOOL)a4
{
  _BOOL8 v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  AVPlayerViewController *avPlayerViewController;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  CGAffineTransform v59;

  v5 = a3;
  -[VUIBackgroundMediaController playbackContainerController](self, "playbackContainerController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setVuiBackgroundColor:", v10);

    -[VUIBackgroundMediaController vui_addChildViewController:](self, "vui_addChildViewController:", v8);
    -[VUIBackgroundMediaController alphaProxyImageView](self, "alphaProxyImageView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[VUIBackgroundMediaController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[VUIBackgroundMediaController alphaProxyImageView](self, "alphaProxyImageView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "vui_insertSubview:belowSubview:oldView:", v13, v14, 0);

    }
    else
    {
      objc_msgSend(v12, "vui_addSubview:oldView:", v13, 0);
    }

    if (-[VUIBackgroundMediaController _shouldShowSecondaryView](self, "_shouldShowSecondaryView"))
    {
      -[VUIBackgroundMediaController _playbackContainerViewFrame:hasSecondaryVideoView:](self, "_playbackContainerViewFrame:hasSecondaryVideoView:", v5, 1);
      v16 = v15;
      v18 = v17;
      v20 = v19;
      v22 = v21;
      objc_msgSend(v8, "view");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setFrame:", v16, v18, v20, v22);

      objc_msgSend(v8, "view");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setVuiClipsToBounds:", 1);

      -[VUIBackgroundMediaController _secondaryVideoViewFrame:](self, "_secondaryVideoViewFrame:", 1);
      v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DB1988]), "initWithFrame:", v25, v26, v27, v28);
      CGAffineTransformMakeScale(&v59, 1.0, -1.0);
      objc_msgSend(v29, "setTransform:", &v59);
      -[VUIBackgroundMediaController player](self, "player");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setPlayer:", v30);

      objc_msgSend(v29, "setVuiAlpha:", 0.0);
      objc_msgSend(v29, "setVideoGravity:", 1);
      -[VUIBackgroundMediaController view](self, "view");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "view");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "vui_insertSubview:aboveSubview:oldView:", v29, v32, 0);

      -[VUIBackgroundMediaController setSecondaryVideoView:](self, "setSecondaryVideoView:", v29);
    }
    else
    {
      -[VUIBackgroundMediaController _playbackContainerViewFrame:hasSecondaryVideoView:](self, "_playbackContainerViewFrame:hasSecondaryVideoView:", v5, 0);
      v34 = v33;
      v36 = v35;
      v38 = v37;
      v40 = v39;
      objc_msgSend(v8, "view");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setFrame:", v34, v36, v38, v40);
    }

    if (!a4)
    {
      objc_msgSend(v8, "view");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setVuiAlpha:", 0.0);

    }
    objc_msgSend(v8, "didMoveToParentViewController:", self);
    avPlayerViewController = self->_avPlayerViewController;
    if (avPlayerViewController)
    {
      -[AVPlayerViewController view](avPlayerViewController, "view");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "view");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addChildViewController:", self->_avPlayerViewController);
      -[VUIBackgroundMediaController currentMediaInfo](self, "currentMediaInfo");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "overlayView");
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      if (v46)
        objc_msgSend(v44, "vui_insertSubview:belowSubview:oldView:", v43, v46, 0);
      else
        objc_msgSend(v44, "addSubview:", v43);
      objc_msgSend(v43, "leadingAnchor");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "leadingAnchor");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "constraintEqualToAnchor:", v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setActive:", 1);

      objc_msgSend(v43, "trailingAnchor");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "trailingAnchor");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "constraintEqualToAnchor:", v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "setActive:", 1);

      objc_msgSend(v43, "topAnchor");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "topAnchor");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "constraintEqualToAnchor:", v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "setActive:", 1);

      objc_msgSend(v43, "bottomAnchor");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "bottomAnchor");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "constraintEqualToAnchor:", v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "setActive:", 1);

      objc_msgSend(v44, "bounds");
      objc_msgSend(v43, "setFrame:");
      -[AVPlayerViewController didMoveToParentViewController:](self->_avPlayerViewController, "didMoveToParentViewController:", v8);

    }
  }

}

- (void)_addContentViewIfNeeded
{
  void *v3;
  void *v4;
  id v5;

  -[VUIBackgroundMediaController currentMediaInfo](self, "currentMediaInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[VUIBackgroundMediaController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "vui_insertSubview:aboveSubview:oldView:", v5, 0, 0);

    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[VUIBackgroundMediaController _constrainToView:](self, "_constrainToView:", v5);
  }

}

- (void)_addAlphaProxyImageViewIfNeeded
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[VUIBackgroundMediaController alphaProxyImageView](self, "alphaProxyImageView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (-[VUIBackgroundMediaController isViewLoaded](self, "isViewLoaded"))
  {
    if (!v9
      || (objc_msgSend(v9, "superview"), v3 = (void *)objc_claimAutoreleasedReturnValue(),
                                         v3,
                                         v4 = v9,
                                         !v3))
    {
      v5 = objc_alloc_init(MEMORY[0x1E0DC6A20]);

      objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v5, "setVuiAlpha:", 0.0);
      objc_msgSend(v5, "vui_isAccessibilityElement:", 1);
      -[VUIBackgroundMediaController currentMediaInfo](self, "currentMediaInfo");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "alphaLayerAccessibilityText");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setAccessibilityLabel:", v7);

      -[VUIBackgroundMediaController view](self, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "vui_addSubview:oldView:", v5, 0);

      -[VUIBackgroundMediaController _constrainToView:](self, "_constrainToView:", v5);
      -[VUIBackgroundMediaController setAlphaProxyImageView:](self, "setAlphaProxyImageView:", v5);
      v4 = v5;
    }
  }
  else
  {
    v4 = v9;
  }

}

- (VUIBackgroundMediaController)init
{
  return -[VUIBackgroundMediaController initWithName:](self, "initWithName:", CFSTR("background media controller"));
}

- (VUIBackgroundMediaController)initWithCoder:(id)a3
{
  return -[VUIBackgroundMediaController initWithName:](self, "initWithName:", CFSTR("background media controller"));
}

- (VUIBackgroundMediaController)initWithNibName:(id)a3 bundle:(id)a4
{
  return -[VUIBackgroundMediaController initWithName:](self, "initWithName:", CFSTR("background media controller"), a4);
}

- (VUIBackgroundMediaController)initWithName:(id)a3 mediaInfoFetchController:(id)a4
{
  id v7;
  VUIBackgroundMediaController *v8;
  VUIBackgroundMediaController *v9;

  v7 = a4;
  v8 = -[VUIBackgroundMediaController initWithName:](self, "initWithName:", a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_mediaInfoFetchController, a4);

  return v9;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  VUIBackgroundMediaController *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[VUIBackgroundMediaController setActivePIPingPlayer:](self, "setActivePIPingPlayer:", 0);
  -[VUIBackgroundMediaController prefetchPlayer](self, "prefetchPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[VUIBackgroundMediaController prefetchPlayer](self, "prefetchPlayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:forKeyPath:context:", self, CFSTR("avPlayer"), __PlayerAVPlayerKVOContext_1);

    -[VUIBackgroundMediaController _cleanupPrefetchPlayback](self, "_cleanupPrefetchPlayback");
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  -[VUIBackgroundMediaController setVideoAudioRampDuration:](self, "setVideoAudioRampDuration:", 0.0);
  -[VUIBackgroundMediaController _cleanUpEverything](self, "_cleanUpEverything");
  VUIDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[VUIBackgroundMediaController name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v10 = self;
    v11 = 2112;
    v12 = v7;
    v13 = 1024;
    v14 = objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
    _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) dealloc cleaning up, isMainThread=%d", buf, 0x1Cu);

  }
  v8.receiver = self;
  v8.super_class = (Class)VUIBackgroundMediaController;
  -[VUIBackgroundMediaController dealloc](&v8, sel_dealloc);
}

- (void)vui_viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  VUIBackgroundMediaController *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  VUIDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[VUIBackgroundMediaController name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v9 = "-[VUIBackgroundMediaController vui_viewWillDisappear:]";
    v10 = 2048;
    v11 = self;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::%s (%p: %@)", buf, 0x20u);

  }
  v7.receiver = self;
  v7.super_class = (Class)VUIBackgroundMediaController;
  -[VUIBackgroundMediaController vui_viewWillDisappear:](&v7, sel_vui_viewWillDisappear_, v3);
  -[VUIBackgroundMediaController setHasViewAppeared:](self, "setHasViewAppeared:", 0);
  -[VUIBackgroundMediaController _handleViewDisappear](self, "_handleViewDisappear");
}

- (void)_handleViewDisappear
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  VUIBackgroundMediaController *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  VUIDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[VUIBackgroundMediaController name](self, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 136315650;
    v6 = "-[VUIBackgroundMediaController _handleViewDisappear]";
    v7 = 2048;
    v8 = self;
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::%s (%p: %@)", (uint8_t *)&v5, 0x20u);

  }
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:", self);
  if (-[VUIBackgroundMediaController shouldStopPlayerWhenViewDisappears](self, "shouldStopPlayerWhenViewDisappears"))
  {
    if (-[VUIBackgroundMediaController isPlaybackEnabled](self, "isPlaybackEnabled"))
      -[VUIBackgroundMediaController setPlaybackEnabled:](self, "setPlaybackEnabled:", 0);
  }
}

- (void)_handleNavigationControllerDidShow
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  VUIBackgroundMediaController *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  VUIDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[VUIBackgroundMediaController name](self, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 136315650;
    v6 = "-[VUIBackgroundMediaController _handleNavigationControllerDidShow]";
    v7 = 2048;
    v8 = self;
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::%s (%p: %@)", (uint8_t *)&v5, 0x20u);

  }
  if (!-[VUIBackgroundMediaController _isViewInTopMostVisibleView](self, "_isViewInTopMostVisibleView"))
    -[VUIBackgroundMediaController _handleViewDisappear](self, "_handleViewDisappear");
}

- (void)setMediaInfos:(id)a3
{
  -[VUIBackgroundMediaController setMediaInfos:animated:](self, "setMediaInfos:animated:", a3, 1);
}

- (void)setMediaInfo:(id)a3 atIndex:(unint64_t)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a5;
  v12 = a3;
  -[VUIBackgroundMediaController mediaInfos](self, "mediaInfos");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9 > a4)
  {
    -[VUIBackgroundMediaController mediaInfoFetchController](self, "mediaInfoFetchController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setMediaInfo:atIndex:", v12, a4);

    -[VUIBackgroundMediaController currentMediaInfo](self, "currentMediaInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIBackgroundMediaController _updateWithMediaInfo:withDirection:imageVideoSwapBehavior:animated:](self, "_updateWithMediaInfo:withDirection:imageVideoSwapBehavior:animated:", v11, 0, 0, v5);

  }
}

- (void)replaceMediaInfo:(id)a3 atIndex:(unint64_t)a4
{
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[VUIBackgroundMediaController mediaInfos](self, "mediaInfos");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 > a4)
  {
    if (-[VUIBackgroundMediaController mediaInfoIndex](self, "mediaInfoIndex") == a4)
    {
      -[VUIBackgroundMediaController setMediaInfo:atIndex:animated:](self, "setMediaInfo:atIndex:animated:", v10, a4, 0);
    }
    else
    {
      -[VUIBackgroundMediaController mediaInfoFetchController](self, "mediaInfoFetchController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setMediaInfo:atIndex:", v10, a4);

      if (-[VUIBackgroundMediaController mediaInfoIndex](self, "mediaInfoIndex") + 1 == a4)
      {
        -[VUIBackgroundMediaController prefetchPlayer](self, "prefetchPlayer");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          -[VUIBackgroundMediaController _cleanupPrefetchPlayback](self, "_cleanupPrefetchPlayback");
          -[VUIBackgroundMediaController _prefetchNextVideo](self, "_prefetchNextVideo");
        }
      }
    }
  }

}

- (void)setMediaInfoIndex:(unint64_t)a3
{
  -[VUIBackgroundMediaController setMediaInfoIndex:imageVideoSwapBehavior:animated:](self, "setMediaInfoIndex:imageVideoSwapBehavior:animated:", a3, 0, 1);
}

- (void)setMediaInfoIndex:(unint64_t)a3 forwardAnimation:(BOOL)a4
{
  -[VUIBackgroundMediaController setMediaInfoIndex:imageVideoSwapBehavior:animated:forwardAnimation:](self, "setMediaInfoIndex:imageVideoSwapBehavior:animated:forwardAnimation:", a3, 0, 1, a4);
}

- (id)createTransitionViewAtIndex:(unint64_t)a3 oldView:(id)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  id v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  void *v23;
  char isKindOfClass;
  id v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  _QWORD v32[5];
  id v33;

  v6 = a4;
  -[VUIBackgroundMediaController mediaInfos](self, "mediaInfos");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 <= a3)
  {
    v14 = 0;
  }
  else
  {
    v9 = -[VUIBackgroundMediaController mediaInfoIndex](self, "mediaInfoIndex") + 1;
    if (-[VUIBackgroundMediaController isVideoFrameFallbackEnabled](self, "isVideoFrameFallbackEnabled"))
    {
      -[VUIBackgroundMediaController prefetchPlayer](self, "prefetchPlayer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "state");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DB1958], "paused");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v11 == v12;

    }
    else
    {
      v13 = 1;
    }
    if (v9 == a3
      && -[VUIBackgroundMediaController prefetchesVideoFrame](self, "prefetchesVideoFrame")
      && (-[VUIBackgroundMediaController mediaInfoFetchController](self, "mediaInfoFetchController"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v16 = objc_msgSend(v15, "mediaInfoContainsPlayerAtIndex:", a3) & v13,
          v15,
          v16 == 1))
    {
      -[VUIBackgroundMediaController mediaInfos](self, "mediaInfos");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectAtIndex:", a3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "tvpPlaylist");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIBackgroundMediaController prefetchPlayer](self, "prefetchPlayer");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "playlist");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[VUIBackgroundMediaController _playlist:contentMatchesPlaylist:](self, "_playlist:contentMatchesPlaylist:", v19, v21);

      if (v22)
      {
        -[VUIBackgroundMediaController prefetchPlayerViewController](self, "prefetchPlayerViewController");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "view");
        v14 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if (v6 && (isKindOfClass & 1) != 0)
      {
        v25 = v6;
        objc_msgSend(v25, "setImage:", 0);
      }
      else
      {
        v26 = objc_alloc(MEMORY[0x1E0DC6A20]);
        -[VUIBackgroundMediaController view](self, "view");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "bounds");
        v25 = (id)objc_msgSend(v26, "initWithFrame:");

      }
      objc_msgSend(v25, "setVuiContentMode:", -[VUIBackgroundMediaController imageContentMode](self, "imageContentMode"));
      -[VUIBackgroundMediaController _configMirroredImageForBackgroundImage:](self, "_configMirroredImageForBackgroundImage:", v25);
      -[VUIBackgroundMediaController mediaInfoFetchController](self, "mediaInfoFetchController");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __68__VUIBackgroundMediaController_createTransitionViewAtIndex_oldView___block_invoke;
      v32[3] = &unk_1E9FA53C0;
      v32[4] = self;
      v29 = v25;
      v33 = v29;
      objc_msgSend(v28, "loadImageAtIndex:completion:", a3, v32);

      v30 = v33;
      v14 = v29;

    }
  }

  return v14;
}

void __68__VUIBackgroundMediaController_createTransitionViewAtIndex_oldView___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[2];
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  VUIDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v5, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    VUIBoolLogString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v16 = v5;
    v17 = 2112;
    v18 = v6;
    v19 = 2112;
    v20 = v3;
    v21 = 2112;
    v22 = v7;
    _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) completed loading transition image: [%@], finished: [%@]", buf, 0x2Au);

  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v11 = __68__VUIBackgroundMediaController_createTransitionViewAtIndex_oldView___block_invoke_169;
  v12 = &unk_1E9F98FD8;
  v13 = v3;
  v14 = *(id *)(a1 + 40);
  v8 = (void *)MEMORY[0x1E0CB3978];
  v9 = v3;
  if (objc_msgSend(v8, "isMainThread", v10[0], 3221225472))
    v11((uint64_t)v10);
  else
    dispatch_async(MEMORY[0x1E0C80D38], v10);

}

void __68__VUIBackgroundMediaController_createTransitionViewAtIndex_oldView___block_invoke_169(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = *(void **)(a1 + 40);
    objc_msgSend(v2, "uiImage");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setImage:", v4);

  }
}

- (void)appendMediaInfos:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VUIBackgroundMediaController mediaInfoFetchController](self, "mediaInfoFetchController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendMediaInfos:", v4);

}

- (void)removeMediaInfoAtIndex:(unint64_t)a3
{
  unint64_t v5;
  id v6;

  if (-[VUIBackgroundMediaController mediaInfoIndex](self, "mediaInfoIndex") > a3)
  {
    v5 = self->_mediaInfoIndex - 1;
    self->_mediaInfoIndex = v5;
    self->_lastMediaInfoIndex = v5;
  }
  -[VUIBackgroundMediaController mediaInfoFetchController](self, "mediaInfoFetchController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeMediaInfoAtIndex:", a3);

}

- (void)play
{
  id v2;

  -[VUIBackgroundMediaController stateMachine](self, "stateMachine");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postEvent:", CFSTR("Play"));

}

- (void)pause
{
  id v2;

  -[VUIBackgroundMediaController stateMachine](self, "stateMachine");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postEvent:", CFSTR("Pause"));

}

- (void)stop
{
  void *v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_stop, 0);
  -[VUIBackgroundMediaController stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = CFSTR("PlaybackStopReasonKey");
  v6[0] = &unk_1EA0BAAE0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postEvent:withContext:userInfo:", CFSTR("Stop"), 0, v4);

}

- (void)setExitsFullscreenWhenPlaybackEnds:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  self->_exitsFullscreenWhenPlaybackEnds = a3;
  -[VUIBackgroundMediaController avPlayerViewController](self, "avPlayerViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[VUIBackgroundMediaController avPlayerViewController](self, "avPlayerViewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setExitsFullScreenWhenPlaybackEnds:", v3);

  }
}

- (void)setMuted:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  -[VUIBackgroundMediaController willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("muted"));
  self->_muted = v3;
  -[VUIBackgroundMediaController player](self, "player");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMuted:", v3);

  -[VUIBackgroundMediaController prefetchPlayer](self, "prefetchPlayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMuted:", v3);

  -[VUIBackgroundMediaController didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("muted"));
}

- (void)setShouldShowFullScreenButton:(BOOL)a3
{
  self->_shouldShowFullScreenButton = a3;
}

- (void)_disableSubtitleIfNeeded
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  VUIBackgroundMediaController *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (-[VUIBackgroundMediaController shouldDisableSubtitle](self, "shouldDisableSubtitle"))
  {
    VUIDefaultLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      -[VUIBackgroundMediaController name](self, "name");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 134218242;
      v7 = self;
      v8 = 2112;
      v9 = v4;
      _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) disable subtitle", (uint8_t *)&v6, 0x16u);

    }
    -[VUIBackgroundMediaController player](self, "player");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSelectedSubtitleOption:setGlobalPreference:", 0, 0);

  }
}

- (void)setUpdatesNowPlayingInfoCenter:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  self->_updatesNowPlayingInfoCenter = a3;
  -[VUIBackgroundMediaController avPlayerViewController](self, "avPlayerViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUpdatesNowPlayingInfoCenter:", v3);

  -[VUIBackgroundMediaController prefetchPlayerViewController](self, "prefetchPlayerViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUpdatesNowPlayingInfoCenter:", v3);

}

void __56__VUIBackgroundMediaController_showAlphaImage_animated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "alphaProxyImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = 1.0;
  if (!*(_BYTE *)(a1 + 40))
    v4 = 0.0;
  objc_msgSend(v2, "setVuiAlpha:", v4);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "alphaProxyImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "vui_bringSubviewToFront:", v5);

}

void __56__VUIBackgroundMediaController_showAlphaImage_animated___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "alphaProxyImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = 1.0;
  if (!*(_BYTE *)(a1 + 40))
    v4 = 0.0;
  objc_msgSend(v2, "setVuiAlpha:", v4);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "alphaProxyImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "vui_bringSubviewToFront:", v5);

}

- (void)transitionToForeground:(BOOL)a3 animated:(BOOL)a4
{
  -[VUIBackgroundMediaController transitionToForeground:withPlaybackControls:animated:](self, "transitionToForeground:withPlaybackControls:animated:", a3, 1, a4);
}

- (void)transitionToForeground:(BOOL)a3 withPlaybackControls:(BOOL)a4 animated:(BOOL)a5
{
  -[VUIBackgroundMediaController transitionToForeground:withPlaybackControls:fullScreenPlayer:animated:](self, "transitionToForeground:withPlaybackControls:fullScreenPlayer:animated:", a3, a4, 0, a5);
}

- (void)transitionToFullScreenAnimated:(BOOL)a3
{
  -[VUIBackgroundMediaController transitionToForeground:withPlaybackControls:fullScreenPlayer:animated:](self, "transitionToForeground:withPlaybackControls:fullScreenPlayer:animated:", 1, 1, 1, a3);
}

- (void)transitionToForeground:(BOOL)a3 withPlaybackControls:(BOOL)a4 fullScreenPlayer:(BOOL)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  _BOOL8 v9;
  float v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  float v16;
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[3];
  _QWORD v20[4];

  v6 = a6;
  v7 = a4;
  v20[3] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v9 = a5;
    -[VUIBackgroundMediaController foregroundVolume](self, "foregroundVolume");
    if (v10 != -1.0)
    {
      objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__updatePlayerVolume_, MEMORY[0x1E0C9AAA0]);
      -[VUIBackgroundMediaController _performPlayerVolumeAnimatedUpdate:](self, "_performPlayerVolumeAnimatedUpdate:", 1);
    }
    -[VUIBackgroundMediaController stateMachine](self, "stateMachine");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = CFSTR("AnimatedKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v12;
    v19[1] = CFSTR("IsFullScreenPlayerKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v13;
    v19[2] = CFSTR("ShowsPlaybackControlsKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20[2] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "postEvent:withContext:userInfo:", CFSTR("Transition to foreground"), 0, v15);

  }
  else
  {
    if (!-[VUIBackgroundMediaController mutePlaybackInBackground](self, "mutePlaybackInBackground", a3, a4, a5))
    {
      -[VUIBackgroundMediaController backgroundVolume](self, "backgroundVolume");
      if (v16 != -1.0)
      {
        objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__updatePlayerVolume_, MEMORY[0x1E0C9AAB0]);
        -[VUIBackgroundMediaController _performPlayerVolumeAnimatedUpdate:](self, "_performPlayerVolumeAnimatedUpdate:", 0);
      }
    }
    -[VUIBackgroundMediaController stateMachine](self, "stateMachine");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = CFSTR("AnimatedKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = CFSTR("ShowsPlaybackControlsKey");
    v18[0] = v12;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "postEvent:withContext:userInfo:", CFSTR("Transition background"), 0, v14);
  }

}

- (id)surrenderCurrentPlayer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[VUIBackgroundMediaController player](self, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[VUIBackgroundMediaController _cleanUpPlaybackTimers](self, "_cleanUpPlaybackTimers");
    -[VUIBackgroundMediaController _unregisterPlayerNotifications](self, "_unregisterPlayerNotifications");
    -[VUIBackgroundMediaController player](self, "player");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:forKeyPath:context:", self, CFSTR("avPlayer"), __PlayerAVPlayerKVOContext_1);

    -[VUIBackgroundMediaController player](self, "player");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("preferredAudioLanguageCode"), __PlayerPreferredAudioLanguageCode);

    -[VUIBackgroundMediaController player](self, "player");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:forKeyPath:context:", self, CFSTR("prefersAudioDescriptions"), __PlayerPrefersAudioDescriptions);

    -[VUIBackgroundMediaController setPlayer:](self, "setPlayer:", 0);
    +[VUIPlayerValidationManager sharedInstance](VUIPlayerValidationManager, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeReferenceForPlayer:stoppingIfNeeded:", v3, 0);

  }
  -[VUIBackgroundMediaController prefetchPlayer](self, "prefetchPlayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[VUIBackgroundMediaController prefetchPlayer](self, "prefetchPlayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObserver:forKeyPath:context:", self, CFSTR("avPlayer"), __PlayerAVPlayerKVOContext_1);

    -[VUIBackgroundMediaController _cleanupPrefetchPlayback](self, "_cleanupPrefetchPlayback");
  }
  -[VUIBackgroundMediaController mediaInfos](self, "mediaInfos");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndex:", -[VUIBackgroundMediaController mediaInfoIndex](self, "mediaInfoIndex"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[VUIBackgroundMediaController setVpafPlaybackStopReason:](self, "setVpafPlaybackStopReason:", objc_msgSend(v11, "playbackStopReason"));
  -[VUIBackgroundMediaController _postWillStopPlaybackNotification](self, "_postWillStopPlaybackNotification");

  return v3;
}

- (void)adoptAVPlayerViewController:(id)a3 player:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  VUIBackgroundMediaController *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  VUIDefaultLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[VUIBackgroundMediaController name](self, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIBackgroundMediaController stateMachine](self, "stateMachine");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "currentState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 134219010;
    v15 = self;
    v16 = 2112;
    v17 = v9;
    v18 = 2112;
    v19 = v6;
    v20 = 2112;
    v21 = v7;
    v22 = 2112;
    v23 = v11;
    _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) adoptAVPlayerViewController avPlayerViewController = %@, player = %@ on state %@", (uint8_t *)&v14, 0x34u);

  }
  if (v6 && v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "vui_setObjectIfNotNil:forKey:", v7, CFSTR("PlayerKey"));
    objc_msgSend(v12, "vui_setObjectIfNotNil:forKey:", v6, CFSTR("AVPlayerViewControllerKey"));
    -[VUIBackgroundMediaController _configurePlayerViewController:](self, "_configurePlayerViewController:", v6);
    -[VUIBackgroundMediaController stateMachine](self, "stateMachine");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "postEvent:withContext:userInfo:", CFSTR("Restore avPlayerViewController"), 0, v12);

  }
}

void __74__VUIBackgroundMediaController_setPlaybackEnabled_imageVideoSwapBehavior___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "stateMachine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postEvent:withContext:userInfo:", CFSTR("Stop"), 0, *(_QWORD *)(a1 + 32));

}

- (void)_handleApplicationWillResignActiveNotification:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[VUIBackgroundMediaController player](self, "player", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[VUIBackgroundMediaController player](self, "player");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "state");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DB1958], "playing");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v7 == (void *)v8)
    {

    }
    else
    {
      v9 = (void *)v8;
      -[VUIBackgroundMediaController player](self, "player");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "state");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DB1958], "loading");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11 != v12)
        return;
    }
    if (-[VUIBackgroundMediaController _shouldPausePlaybackDueToDeactivationReasons](self, "_shouldPausePlaybackDueToDeactivationReasons"))
    {
      -[VUIBackgroundMediaController setShouldPlayAfterAppBecomesActive:](self, "setShouldPlayAfterAppBecomesActive:", 1);
      -[VUIBackgroundMediaController pause](self, "pause");
    }
  }
}

- (void)_handleApplicationDidEnterBackgroundNotification:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  VUIBackgroundMediaController *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (-[VUIBackgroundMediaController stopsPlaybackWhenInactive](self, "stopsPlaybackWhenInactive", a3))
  {
    -[VUIBackgroundMediaController player](self, "player");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      VUIDefaultLogObject();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        -[VUIBackgroundMediaController name](self, "name");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = 134218242;
        v8 = self;
        v9 = 2112;
        v10 = v6;
        _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) AppDidEnterBackground: Try to show the image and stop the video", (uint8_t *)&v7, 0x16u);

      }
      -[VUIBackgroundMediaController setShouldPlayAfterAppBecomesActive:](self, "setShouldPlayAfterAppBecomesActive:", 0);
      -[VUIBackgroundMediaController _swapActiveMedia:animated:completion:](self, "_swapActiveMedia:animated:completion:", 1, 0, 0);
      -[VUIBackgroundMediaController stop](self, "stop");
    }
    -[VUIBackgroundMediaController _clearPreloadPlayback](self, "_clearPreloadPlayback");
  }
  else
  {
    -[VUIBackgroundMediaController setShouldPlayAfterAppBecomesActive:](self, "setShouldPlayAfterAppBecomesActive:", 1);
  }
}

- (void)_handleApplicationDidBecomeActiveNotification:(id)a3
{
  uint64_t v4;
  void *v5;
  _BOOL4 v6;

  -[VUIBackgroundMediaController player](self, "player", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = -[VUIBackgroundMediaController shouldPlayAfterAppBecomesActive](self, "shouldPlayAfterAppBecomesActive");

    if (v6)
    {
      -[VUIBackgroundMediaController setShouldPlayAfterAppBecomesActive:](self, "setShouldPlayAfterAppBecomesActive:", 0);
      -[VUIBackgroundMediaController play](self, "play");
    }
  }
  -[VUIBackgroundMediaController _startPreloadPlaybackIfNeeded](self, "_startPreloadPlaybackIfNeeded");
}

- (void)_clearPreloadPlayback
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  VUIBackgroundMediaController *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  VUIDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[VUIBackgroundMediaController name](self, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 134218242;
    v8 = self;
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) clearPreloadPlayback", (uint8_t *)&v7, 0x16u);

  }
  -[VUIBackgroundMediaController mediaInfoFetchController](self, "mediaInfoFetchController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPreloadPlaybackEnabled:", 0);

  -[VUIBackgroundMediaController mediaInfoFetchController](self, "mediaInfoFetchController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clearPreloadedPlayback");

}

- (void)_startPreloadPlaybackIfNeeded
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  VUIBackgroundMediaController *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  _BOOL4 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  VUIDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[VUIBackgroundMediaController name](self, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 134218498;
    v10 = self;
    v11 = 2112;
    v12 = v4;
    v13 = 1024;
    v14 = -[VUIBackgroundMediaController isPreloadPlaybackEnabled](self, "isPreloadPlaybackEnabled");
    _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) update preloadPlaybackEnabled = %d", (uint8_t *)&v9, 0x1Cu);

  }
  -[VUIBackgroundMediaController mediaInfoFetchController](self, "mediaInfoFetchController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPreloadPlaybackEnabled:", -[VUIBackgroundMediaController isPreloadPlaybackEnabled](self, "isPreloadPlaybackEnabled"));

  if (-[VUIBackgroundMediaController isPlaybackEnabled](self, "isPlaybackEnabled")
    && -[VUIBackgroundMediaController isPreloadPlaybackEnabled](self, "isPreloadPlaybackEnabled"))
  {
    VUIDefaultLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[VUIBackgroundMediaController name](self, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 134218242;
      v10 = self;
      v11 = 2112;
      v12 = v7;
      _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) startPreloadPlayback", (uint8_t *)&v9, 0x16u);

    }
    -[VUIBackgroundMediaController mediaInfoFetchController](self, "mediaInfoFetchController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "preloadPlayback");

  }
}

- (BOOL)_shouldPausePlaybackDueToDeactivationReasons
{
  return (-[VUIBackgroundMediaController deactivationReasons](self, "deactivationReasons") & 0xFFFFEDEA) != 0;
}

- (void)_applicationWillAddDeactivationReason:(id)a3
{
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0DC5710]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  self->_deactivationReasons |= (1 << v6);
}

- (void)_applicationDidRemoveDeactivationReason:(id)a3
{
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0DC5710]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  self->_deactivationReasons &= ~(1 << v6);
}

- (void)playBackManagerFullscreenPlaybackUIDidChangeNotification:(id)a3
{
  void *v4;
  int v5;
  NSObject *v6;
  void *v7;
  dispatch_time_t v8;
  _QWORD block[4];
  id v10;
  uint8_t buf[4];
  VUIBackgroundMediaController *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  +[VUIPlaybackManager sharedInstance](VUIPlaybackManager, "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFullscreenPlaybackUIBeingShown");

  VUIDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[VUIBackgroundMediaController name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v12 = self;
    v13 = 2112;
    v14 = v7;
    v15 = 1024;
    v16 = v5;
    _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) playbackManagerFullScreenUIDidChange: %d", buf, 0x1Cu);

  }
  if (v5)
  {
    -[VUIBackgroundMediaController _handlePlaybackManagerUIDidChange](self, "_handlePlaybackManagerUIDidChange");
  }
  else
  {
    objc_initWeak((id *)buf, self);
    v8 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __89__VUIBackgroundMediaController_playBackManagerFullscreenPlaybackUIDidChangeNotification___block_invoke;
    block[3] = &unk_1E9F99C98;
    objc_copyWeak(&v10, (id *)buf);
    dispatch_after(v8, MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(&v10);
    objc_destroyWeak((id *)buf);
  }
}

void __89__VUIBackgroundMediaController_playBackManagerFullscreenPlaybackUIDidChangeNotification___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handlePlaybackManagerUIDidChange");

}

- (void)playbackManagerShowingExtrasDidChangeNotification:(id)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  VUIBackgroundMediaController *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  VUIDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[VUIBackgroundMediaController name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 134218242;
    v7 = self;
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) playbackManagerShowingExtrasDidChangeNotification", (uint8_t *)&v6, 0x16u);

  }
  -[VUIBackgroundMediaController _handlePlaybackManagerUIDidChange](self, "_handlePlaybackManagerUIDidChange");
}

- (void)_handlePlaybackManagerUIDidChange
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  int v11;
  VUIBackgroundMediaController *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (-[VUIBackgroundMediaController loadsPlayerWithFullscreenPlayback](self, "loadsPlayerWithFullscreenPlayback"))
  {
    VUIDefaultLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      -[VUIBackgroundMediaController name](self, "name");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 134218242;
      v12 = self;
      v13 = 2112;
      v14 = v4;
      _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) _handlePlaybackManagerUIDidChange: skip as loadsPlayerWithFullscreenPlayback=true", (uint8_t *)&v11, 0x16u);

    }
  }
  else
  {
    +[VUIPlaybackManager sharedInstance](VUIPlaybackManager, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isFullscreenPlaybackUIBeingShown");

    +[VUIPlaybackManager sharedInstance](VUIPlaybackManager, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isShowingExtras");

    VUIDefaultLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[VUIBackgroundMediaController name](self, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 134218754;
      v12 = self;
      v13 = 2112;
      v14 = v10;
      v15 = 1024;
      v16 = v6;
      v17 = 1024;
      v18 = v8;
      _os_log_impl(&dword_1D96EE000, v9, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) _handlePlaybackManagerUIDidChange isFullscreenPlaybackUIBeingShown=%d, isShowingExtras=%d", (uint8_t *)&v11, 0x22u);

    }
    if ((v6 | v8) == 1)
      -[VUIBackgroundMediaController _disablePlaybackWhenShowingFullScreenUIIfNeeded](self, "_disablePlaybackWhenShowingFullScreenUIIfNeeded");
    else
      -[VUIBackgroundMediaController _enablePlaybackWhenFullScreenPlaybackEnd](self, "_enablePlaybackWhenFullScreenPlaybackEnd");
  }
}

- (void)_disablePlaybackWhenShowingFullScreenUIIfNeeded
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  void *v12;
  int v13;
  VUIBackgroundMediaController *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[VUIBackgroundMediaController stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("waiting for timeout while paused"));

  -[VUIBackgroundMediaController player](self, "player");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[VUIBackgroundMediaController player](self, "player");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "state");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DB1958], "stopped");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v8 == v9;

  }
  else
  {
    v10 = 0;
  }

  if (((!-[VUIBackgroundMediaController isPlaybackEnabled](self, "isPlaybackEnabled") | v5) & 1) == 0 && !v10)
  {
    VUIDefaultLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[VUIBackgroundMediaController name](self, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 134218242;
      v14 = self;
      v15 = 2112;
      v16 = v12;
      _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) fullscreenPlayback did shown, disable playback", (uint8_t *)&v13, 0x16u);

    }
    -[VUIBackgroundMediaController setShouldPlayAfterFullplaybackUIDidEnd:](self, "setShouldPlayAfterFullplaybackUIDidEnd:", 1);
    -[VUIBackgroundMediaController setPlaybackEnabled:](self, "setPlaybackEnabled:", 0);
  }
}

- (void)_enablePlaybackWhenFullScreenPlaybackEnd
{
  NSObject *v3;
  void *v4;
  int v5;
  VUIBackgroundMediaController *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (-[VUIBackgroundMediaController shouldPlayAfterFullplaybackUIDidEnd](self, "shouldPlayAfterFullplaybackUIDidEnd")
    && -[VUIBackgroundMediaController hasViewAppeared](self, "hasViewAppeared"))
  {
    VUIDefaultLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      -[VUIBackgroundMediaController name](self, "name");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 134218242;
      v6 = self;
      v7 = 2112;
      v8 = v4;
      _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) fullscreenPlayback did end, enable playback", (uint8_t *)&v5, 0x16u);

    }
    -[VUIBackgroundMediaController setShouldPlayAfterFullplaybackUIDidEnd:](self, "setShouldPlayAfterFullplaybackUIDidEnd:", 0);
    -[VUIBackgroundMediaController setPlaybackEnabled:](self, "setPlaybackEnabled:", 1);
  }
}

- (void)updateAudioMuteWithPIPingPlayback
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_27();
  OUTLINED_FUNCTION_0_15(&dword_1D96EE000, v2, v3, "VUIBackgroundMediaController::(%p: %@) isPIPing is true, but no active player", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_9();
}

- (void)setActivePIPingPlayer:(id)a3
{
  VUIPlayer *v5;
  VUIPlayer **p_activePIPingPlayer;
  VUIPlayer *activePIPingPlayer;
  _QWORD *v8;
  void *v9;
  void *v10;
  VUIPlayer *v11;

  v5 = (VUIPlayer *)a3;
  p_activePIPingPlayer = &self->_activePIPingPlayer;
  activePIPingPlayer = self->_activePIPingPlayer;
  if (activePIPingPlayer != v5)
  {
    v11 = v5;
    v8 = (_QWORD *)MEMORY[0x1E0DB1F58];
    if (activePIPingPlayer)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeObserver:name:object:", self, *v8, *p_activePIPingPlayer);

      -[VUIPlayer removeObserver:forKeyPath:context:](*p_activePIPingPlayer, "removeObserver:forKeyPath:context:", self, CFSTR("muted"), __PIPingPlayerMutedKVOContext);
    }
    objc_storeStrong((id *)&self->_activePIPingPlayer, a3);
    v5 = v11;
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObserver:selector:name:object:", self, sel__pipPlaybackStateChanged_, *v8, v11);

      -[VUIPlayer addObserver:forKeyPath:options:context:](v11, "addObserver:forKeyPath:options:context:", self, CFSTR("muted"), 0, __PIPingPlayerMutedKVOContext);
      v5 = v11;
    }
  }

}

- (void)_pipPlaybackStateChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  VUIBackgroundMediaController *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0DB1F60]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0DB1F68]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  VUIDefaultLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[VUIBackgroundMediaController name](self, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 134218754;
    v13 = self;
    v14 = 2112;
    v15 = v10;
    v16 = 2112;
    v17 = v6;
    v18 = 2112;
    v19 = v8;
    _os_log_impl(&dword_1D96EE000, v9, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) PIP playback state changed, new state %@, old state %@", (uint8_t *)&v12, 0x2Au);

  }
  objc_msgSend(MEMORY[0x1E0DB1958], "playing");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v11)
    -[VUIBackgroundMediaController setMutePlaybackInBackground:](self, "setMutePlaybackInBackground:", 1);

}

- (void)_pipPlaybackDidChangeMutedState
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  VUIBackgroundMediaController *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  +[VUIPlaybackManager sharedInstance](VUIPlaybackManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activePlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  VUIDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[VUIBackgroundMediaController name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 134218498;
    v8 = self;
    v9 = 2112;
    v10 = v6;
    v11 = 1024;
    v12 = objc_msgSend(v4, "muted");
    _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) PIP playback did change muted state: %d", (uint8_t *)&v7, 0x1Cu);

  }
  if (v4 && (objc_msgSend(v4, "muted") & 1) == 0)
    -[VUIBackgroundMediaController setMutePlaybackInBackground:](self, "setMutePlaybackInBackground:", 1);

}

- (void)_unregisterPlayerNotifications
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  VUIBackgroundMediaController *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  VUIDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[VUIBackgroundMediaController name](self, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 134218242;
    v16 = self;
    v17 = 2112;
    v18 = v4;
    _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) unregister player notifications and remove observers", (uint8_t *)&v15, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0DB1F58];
  -[VUIBackgroundMediaController player](self, "player");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, v6, v7);

  v8 = *MEMORY[0x1E0DB1E48];
  -[VUIBackgroundMediaController player](self, "player");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, v8, v9);

  v10 = *MEMORY[0x1E0DB1F70];
  -[VUIBackgroundMediaController player](self, "player");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, v10, v11);

  v12 = *MEMORY[0x1E0DB1F90];
  -[VUIBackgroundMediaController player](self, "player");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, v12, v13);

  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("VUIBackgroundMediaControllerWillStartPlaybackNotification"), 0);
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("VUIBackgroundMediaControllerDidStartPlaybackNotification"), 0);
  if (-[VUIBackgroundMediaController observingInitialMediaItemHasCompletedInitialLoading](self, "observingInitialMediaItemHasCompletedInitialLoading"))
  {
    -[VUIBackgroundMediaController player](self, "player");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeObserver:forKeyPath:context:", self, CFSTR("initialMediaItemHasCompletedInitialLoading"), __PlayerInitialMediaItemHasCompletedInitialLoadingKVOContext_0);

    -[VUIBackgroundMediaController setObservingInitialMediaItemHasCompletedInitialLoading:](self, "setObservingInitialMediaItemHasCompletedInitialLoading:", 0);
  }

}

- (BOOL)_canPause
{
  void *v2;
  double v3;
  BOOL v4;

  -[VUIBackgroundMediaController player](self, "player");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "duration");
  v4 = v3 != *MEMORY[0x1E0DB1990];

  return v4;
}

- (BOOL)_currentMediaInfoContentMatchesMediaInfo:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[VUIBackgroundMediaController currentMediaInfo](self, "currentMediaInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[VUIBackgroundMediaController _mediaInfo:contentMatchesMediaInfo:](self, "_mediaInfo:contentMatchesMediaInfo:", v5, v4);

  return (char)self;
}

void __51__VUIBackgroundMediaController_loadAlphaImageProxy__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "uiImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __51__VUIBackgroundMediaController_loadAlphaImageProxy__block_invoke_2;
  v13 = &unk_1E9F9A938;
  objc_copyWeak(&v15, (id *)(a1 + 32));
  v8 = v7;
  v14 = v8;
  v9 = &v10;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", v10, v11))
    v12((uint64_t)v9);
  else
    dispatch_async(MEMORY[0x1E0C80D38], v9);

  objc_destroyWeak(&v15);
}

void __51__VUIBackgroundMediaController_loadAlphaImageProxy__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "alphaProxyImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setImage:", *(_QWORD *)(a1 + 32));

  objc_msgSend(WeakRetained, "proxyImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "image");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    objc_msgSend(WeakRetained, "proxyImageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isHidden");

    if ((v7 & 1) == 0)
      objc_msgSend(WeakRetained, "showAlphaImage:animated:", 1, 1);
  }
  else
  {

  }
}

- (void)_performPlayerVolumeAnimatedUpdate:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  float v6;
  float v7;
  float v8;
  float v9;
  NSObject *v10;
  void *v11;
  BOOL v12;
  float v13;
  float v14;
  double v15;
  double v16;
  double v17;
  NSObject *v18;
  void *v19;
  double v20;
  id v21;
  uint8_t buf[4];
  VUIBackgroundMediaController *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  double v27;
  uint64_t v28;

  v3 = a3;
  v28 = *MEMORY[0x1E0C80C00];
  -[VUIBackgroundMediaController player](self, "player");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "volume");
  v7 = v6;

  if (v3)
    -[VUIBackgroundMediaController foregroundVolume](self, "foregroundVolume");
  else
    -[VUIBackgroundMediaController backgroundVolume](self, "backgroundVolume");
  v9 = v8;
  if (v8 == -1.0)
  {
    VUIDefaultLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      -[VUIBackgroundMediaController name](self, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v23 = self;
      v24 = 2112;
      v25 = v11;
      _os_log_impl(&dword_1D96EE000, v10, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) volume fading is not supported, returning without any volume changes.", buf, 0x16u);

    }
  }
  else
  {
    v12 = v7 < v8;
    if (!v3)
      v12 = v7 > v8;
    if (v12)
    {
      -[VUIBackgroundMediaController fullscreenTransitionVolumeAnimationChanges](self, "fullscreenTransitionVolumeAnimationChanges");
      if (v13 == -1.0)
      {
        if (v3)
          v14 = v9 - v7;
        else
          v14 = v7 - v9;
        *(float *)&v15 = v14
                       / (float)-[VUIBackgroundMediaController numberOfVolumeIncrements](self, "numberOfVolumeIncrements");
        -[VUIBackgroundMediaController setFullscreenTransitionVolumeAnimationChanges:](self, "setFullscreenTransitionVolumeAnimationChanges:", v15);
      }
      -[VUIBackgroundMediaController volumeTransitionAnimationDuration](self, "volumeTransitionAnimationDuration");
      v17 = v16 / (double)-[VUIBackgroundMediaController numberOfVolumeIncrements](self, "numberOfVolumeIncrements");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      -[VUIBackgroundMediaController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__updatePlayerVolume_, v17);

    }
    else
    {
      VUIDefaultLogObject();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        -[VUIBackgroundMediaController name](self, "name");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v23 = self;
        v24 = 2112;
        v25 = v19;
        v26 = 2048;
        v27 = v9;
        _os_log_impl(&dword_1D96EE000, v18, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) reached final volume: [%f].", buf, 0x20u);

      }
      LODWORD(v20) = -1.0;
      -[VUIBackgroundMediaController setFullscreenTransitionVolumeAnimationChanges:](self, "setFullscreenTransitionVolumeAnimationChanges:", v20);
    }
  }
}

- (void)_updatePlayerVolume:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  void *v18;
  double v19;
  NSObject *v20;
  void *v21;
  double v22;
  int v23;
  VUIBackgroundMediaController *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  double v28;
  __int16 v29;
  double v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "BOOLValue");
  else
    v6 = 0;
  -[VUIBackgroundMediaController player](self, "player");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "volume");
  v9 = v8;

  if ((v6 & 1) != 0)
  {
    -[VUIBackgroundMediaController foregroundVolume](self, "foregroundVolume");
    v11 = v10;
    -[VUIBackgroundMediaController fullscreenTransitionVolumeAnimationChanges](self, "fullscreenTransitionVolumeAnimationChanges");
    v13 = v12;
    if (v9 >= v11)
    {
LABEL_17:
      VUIDefaultLogObject();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        -[VUIBackgroundMediaController name](self, "name");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 134218754;
        v24 = self;
        v25 = 2112;
        v26 = v21;
        v27 = 2048;
        v28 = v11;
        v29 = 2048;
        v30 = v13;
        _os_log_impl(&dword_1D96EE000, v20, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) either reached final volume: [%f] or volume changes are invalid: [%f]", (uint8_t *)&v23, 0x2Au);

      }
      LODWORD(v22) = -1.0;
      -[VUIBackgroundMediaController setFullscreenTransitionVolumeAnimationChanges:](self, "setFullscreenTransitionVolumeAnimationChanges:", v22);
      goto LABEL_20;
    }
  }
  else
  {
    -[VUIBackgroundMediaController backgroundVolume](self, "backgroundVolume");
    v11 = v14;
    -[VUIBackgroundMediaController fullscreenTransitionVolumeAnimationChanges](self, "fullscreenTransitionVolumeAnimationChanges");
    v13 = v15;
  }
  if (((v9 <= v11) & ~(_DWORD)v6) != 0 || v13 == -1.0)
    goto LABEL_17;
  v16 = v11 - v9;
  if (!(_DWORD)v6)
    v16 = v9 - v11;
  if (v16 >= v13)
    v16 = v13;
  if (!(_DWORD)v6)
    v16 = -v16;
  v17 = v9 + v16;
  -[VUIBackgroundMediaController player](self, "player");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v19 = v17;
  objc_msgSend(v18, "setVolume:", v19);

  -[VUIBackgroundMediaController _performPlayerVolumeAnimatedUpdate:](self, "_performPlayerVolumeAnimatedUpdate:", v6);
LABEL_20:

}

- (void)_cleanUpEverything
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  VUIBackgroundMediaController *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  VUIDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[VUIBackgroundMediaController name](self, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 134218242;
    v9 = self;
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) cleaning up everything for", (uint8_t *)&v8, 0x16u);

  }
  -[VUIBackgroundMediaController proxyImageView](self, "proxyImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", 0);

  -[VUIBackgroundMediaController proxyImageView](self, "proxyImageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImageProxy:", 0);

  -[VUIBackgroundMediaController alphaImageProxy](self, "alphaImageProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cancel");

  -[VUIBackgroundMediaController _cleanUpEverythingPlaybackRelated](self, "_cleanUpEverythingPlaybackRelated");
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:", self);
}

- (void)_cleanUpEverythingPlaybackRelated
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  BOOL v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD block[4];
  id v32;
  id v33[2];
  uint8_t buf[4];
  VUIBackgroundMediaController *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  VUIDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[VUIBackgroundMediaController name](self, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v35 = self;
    v36 = 2112;
    v37 = v4;
    _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) cleaning up player and playback view controller.", buf, 0x16u);

  }
  -[VUIBackgroundMediaController _cleanUpPlaybackTimers](self, "_cleanUpPlaybackTimers");
  -[VUIBackgroundMediaController _unregisterPlayerNotifications](self, "_unregisterPlayerNotifications");
  -[VUIBackgroundMediaController _removePlaybackViewController](self, "_removePlaybackViewController");
  -[VUIBackgroundMediaController secondaryVideoView](self, "secondaryVideoView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[VUIBackgroundMediaController secondaryVideoView](self, "secondaryVideoView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "superview");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7 == 0;

    if (!v8)
    {
      -[VUIBackgroundMediaController secondaryVideoView](self, "secondaryVideoView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeFromSuperview");

    }
  }
  -[VUIBackgroundMediaController setSecondaryVideoView:](self, "setSecondaryVideoView:", 0);
  -[VUIBackgroundMediaController setAvPlayerViewController:](self, "setAvPlayerViewController:", 0);
  -[VUIBackgroundMediaController setPlaybackContainerController:](self, "setPlaybackContainerController:", 0);
  if (-[VUIBackgroundMediaController didWeCreatePlayer](self, "didWeCreatePlayer"))
  {
    -[VUIBackgroundMediaController player](self, "player");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObserver:forKeyPath:context:", self, CFSTR("avPlayer"), __PlayerAVPlayerKVOContext_1);

    -[VUIBackgroundMediaController player](self, "player");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObserver:forKeyPath:context:", self, CFSTR("preferredAudioLanguageCode"), __PlayerPreferredAudioLanguageCode);

    -[VUIBackgroundMediaController player](self, "player");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObserver:forKeyPath:context:", self, CFSTR("prefersAudioDescriptions"), __PlayerPrefersAudioDescriptions);

    -[VUIBackgroundMediaController videoAudioRampDuration](self, "videoAudioRampDuration");
    v14 = v13;
    if (v13 <= 0.0)
    {
      -[VUIBackgroundMediaController player](self, "player");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setElapsedTime:", 0.0);

    }
    else
    {
      objc_initWeak((id *)buf, self);
      -[VUIBackgroundMediaController player](self, "player");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIBackgroundMediaController rampDownPlayer](self, "rampDownPlayer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        +[VUIPlayerValidationManager sharedInstance](VUIPlayerValidationManager, "sharedInstance");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIBackgroundMediaController rampDownPlayer](self, "rampDownPlayer");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "removeReferenceForPlayer:", v18);

      }
      -[VUIBackgroundMediaController setRampDownPlayer:](self, "setRampDownPlayer:", v15);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __65__VUIBackgroundMediaController__cleanUpEverythingPlaybackRelated__block_invoke;
      block[3] = &unk_1E9FA53E8;
      v32 = v15;
      v33[1] = *(id *)&v14;
      v19 = v15;
      objc_copyWeak(v33, (id *)buf);
      dispatch_async(MEMORY[0x1E0C80D38], block);
      objc_destroyWeak(v33);

      objc_destroyWeak((id *)buf);
    }
  }
  -[VUIBackgroundMediaController player](self, "player");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "state");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DB1958], "stopped");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v22 == v23;

  if (!v24)
  {
    -[VUIBackgroundMediaController videoAudioRampDuration](self, "videoAudioRampDuration");
    if (v25 == 0.0)
    {
      -[VUIBackgroundMediaController player](self, "player");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "stop");

    }
    objc_msgSend(MEMORY[0x1E0DB1958], "stopped");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIBackgroundMediaController _recordBgAutoPlayMediaEventForPlaybackState:](self, "_recordBgAutoPlayMediaEventForPlaybackState:", v27);

  }
  -[VUIBackgroundMediaController player](self, "player");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    +[VUIPlayerValidationManager sharedInstance](VUIPlayerValidationManager, "sharedInstance");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIBackgroundMediaController player](self, "player");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "removeReferenceForPlayer:", v30);

  }
  -[VUIBackgroundMediaController setPlayer:](self, "setPlayer:", 0);
}

void __65__VUIBackgroundMediaController__cleanUpEverythingPlaybackRelated__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  dispatch_time_t v4;
  _QWORD block[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "state");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DB1958], "stopped");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 != v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "pauseWithVolumeRampDuration:", *(double *)(a1 + 48));
    v4 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 48) * 1000000000.0));
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__VUIBackgroundMediaController__cleanUpEverythingPlaybackRelated__block_invoke_2;
    block[3] = &unk_1E9F99C98;
    objc_copyWeak(&v6, (id *)(a1 + 40));
    dispatch_after(v4, MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(&v6);
  }
}

void __65__VUIBackgroundMediaController__cleanUpEverythingPlaybackRelated__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_cleanUpRampDownPlayer");

}

- (void)_cleanUpRampDownPlayer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[VUIBackgroundMediaController rampDownPlayer](self, "rampDownPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[VUIBackgroundMediaController rampDownPlayer](self, "rampDownPlayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stop");

    -[VUIBackgroundMediaController rampDownPlayer](self, "rampDownPlayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setElapsedTime:", 0.0);

    +[VUIPlayerValidationManager sharedInstance](VUIPlayerValidationManager, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIBackgroundMediaController rampDownPlayer](self, "rampDownPlayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeReferenceForPlayer:", v7);

    -[VUIBackgroundMediaController setRampDownPlayer:](self, "setRampDownPlayer:", 0);
  }
}

- (void)_addOverlayViewAnimatedIfNeeded:(BOOL)a3 dismissAfter:(double)a4
{
  _BOOL4 v5;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  id v14;
  void (**v15)(_QWORD);
  void *v16;
  double imageAnimationDuration;
  unint64_t imageAnimationOptions;
  _QWORD v19[4];
  void (**v20)(_QWORD);
  _QWORD v21[4];
  id v22;
  double v23;
  _QWORD aBlock[4];
  id v25;
  id v26[2];
  BOOL v27;
  id location;

  v5 = a3;
  -[VUIBackgroundMediaController currentMediaInfo](self, "currentMediaInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "overlayView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "superview");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend(v8, "vuiAlpha");
      v11 = v10;
      objc_msgSend(v8, "setVuiAlpha:", 0.0);
      -[VUIBackgroundMediaController view](self, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "vui_addSubview:oldView:", v8, 0);

      objc_initWeak(&location, self);
      v13 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __77__VUIBackgroundMediaController__addOverlayViewAnimatedIfNeeded_dismissAfter___block_invoke;
      aBlock[3] = &unk_1E9F9BD78;
      v26[1] = *(id *)&a4;
      objc_copyWeak(v26, &location);
      v14 = v8;
      v25 = v14;
      v27 = v5;
      v15 = (void (**)(_QWORD))_Block_copy(aBlock);
      if (v5)
      {
        v16 = (void *)MEMORY[0x1E0DC3F10];
        imageAnimationDuration = self->_imageAnimationDuration;
        imageAnimationOptions = self->_imageAnimationOptions;
        v21[0] = v13;
        v21[1] = 3221225472;
        v21[2] = __77__VUIBackgroundMediaController__addOverlayViewAnimatedIfNeeded_dismissAfter___block_invoke_3;
        v21[3] = &unk_1E9F9BDA0;
        v22 = v14;
        v23 = v11;
        v19[0] = v13;
        v19[1] = 3221225472;
        v19[2] = __77__VUIBackgroundMediaController__addOverlayViewAnimatedIfNeeded_dismissAfter___block_invoke_4;
        v19[3] = &unk_1E9F98E18;
        v20 = v15;
        objc_msgSend(v16, "vui_animateWithDuration:delay:options:animations:completion:", imageAnimationOptions, v21, v19, imageAnimationDuration, 0.0);

      }
      else
      {
        objc_msgSend(v14, "setVuiAlpha:", v11);
        v15[2](v15);
      }

      objc_destroyWeak(v26);
      objc_destroyWeak(&location);
    }
  }

}

void __77__VUIBackgroundMediaController__addOverlayViewAnimatedIfNeeded_dismissAfter___block_invoke(uint64_t a1)
{
  double v1;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  char v8;

  v1 = *(double *)(a1 + 48);
  if (v1 != 0.0)
  {
    v3 = (void *)MEMORY[0x1E0C99E88];
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __77__VUIBackgroundMediaController__addOverlayViewAnimatedIfNeeded_dismissAfter___block_invoke_2;
    v5[3] = &unk_1E9F9B6E8;
    objc_copyWeak(&v7, (id *)(a1 + 40));
    v6 = *(id *)(a1 + 32);
    v8 = *(_BYTE *)(a1 + 56);
    v4 = (id)objc_msgSend(v3, "scheduledTimerWithTimeInterval:repeats:block:", 0, v5, v1);

    objc_destroyWeak(&v7);
  }
}

void __77__VUIBackgroundMediaController__addOverlayViewAnimatedIfNeeded_dismissAfter___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_removeOverlayView:animated:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));

}

uint64_t __77__VUIBackgroundMediaController__addOverlayViewAnimatedIfNeeded_dismissAfter___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setVuiAlpha:", *(double *)(a1 + 40));
}

uint64_t __77__VUIBackgroundMediaController__addOverlayViewAnimatedIfNeeded_dismissAfter___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_removeOverlayView:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  double imageAnimationDuration;
  unint64_t imageAnimationOptions;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "setVuiAlpha:", 1.0);
    if (v4)
    {
      v8 = (void *)MEMORY[0x1E0DC3F10];
      imageAnimationDuration = self->_imageAnimationDuration;
      imageAnimationOptions = self->_imageAnimationOptions;
      v11 = MEMORY[0x1E0C809B0];
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __60__VUIBackgroundMediaController__removeOverlayView_animated___block_invoke;
      v14[3] = &unk_1E9F98DF0;
      v15 = v7;
      v12[0] = v11;
      v12[1] = 3221225472;
      v12[2] = __60__VUIBackgroundMediaController__removeOverlayView_animated___block_invoke_2;
      v12[3] = &unk_1E9F9B4F8;
      v13 = v15;
      objc_msgSend(v8, "vui_animateWithDuration:delay:options:animations:completion:", imageAnimationOptions, v14, v12, imageAnimationDuration, 0.0);

    }
    else
    {
      objc_msgSend(v7, "setVuiAlpha:", 0.0);
      objc_msgSend(v7, "removeFromSuperview");
    }
  }

}

uint64_t __60__VUIBackgroundMediaController__removeOverlayView_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setVuiAlpha:", 0.0);
}

uint64_t __60__VUIBackgroundMediaController__removeOverlayView_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

uint64_t __84__VUIBackgroundMediaController__transitionToNewImage_animated_direction_completion___block_invoke_235(uint64_t a1)
{
  uint64_t result;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "vui_removeFromSuperView");
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_swapActiveMedia:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  id v8;
  char v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  id *v18;
  id *v19;
  void *v20;
  double v21;
  double v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  _QWORD aBlock[4];
  id v35;
  char v36;
  BOOL v37;
  id location;

  v5 = a4;
  v8 = a5;
  if (a3)
  {
    v9 = 1;
  }
  else
  {
    -[VUIBackgroundMediaController currentMediaInfo](self, "currentMediaInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "isAudioOnly");

  }
  objc_initWeak(&location, self);
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__VUIBackgroundMediaController__swapActiveMedia_animated_completion___block_invoke;
  aBlock[3] = &unk_1E9F9D330;
  objc_copyWeak(&v35, &location);
  v36 = v9;
  v37 = v5;
  v12 = _Block_copy(aBlock);
  if (v5 && -[VUIBackgroundMediaController animateVideoChange](self, "animateVideoChange"))
  {
    v13 = -[VUIBackgroundMediaController videoSwappingAnimationType](self, "videoSwappingAnimationType");
    v14 = (void *)MEMORY[0x1E0DC3F10];
    if (v13)
    {
      -[VUIBackgroundMediaController view](self, "view");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIBackgroundMediaController imageVideoTransitionAnimationDuration](self, "imageVideoTransitionAnimationDuration");
      v17 = v16;
      v28[0] = v11;
      v28[1] = 3221225472;
      v28[2] = __69__VUIBackgroundMediaController__swapActiveMedia_animated_completion___block_invoke_3;
      v28[3] = &unk_1E9F98E68;
      v29 = v12;
      v26[0] = v11;
      v26[1] = 3221225472;
      v26[2] = __69__VUIBackgroundMediaController__swapActiveMedia_animated_completion___block_invoke_4;
      v26[3] = &unk_1E9F98E18;
      v27 = v8;
      objc_msgSend(v14, "vui_transitionWithView:duration:options:animations:completion:", v15, 5242880, v28, v26, v17);
      v18 = &v29;
      v19 = &v27;

    }
    else
    {
      -[VUIBackgroundMediaController imageVideoTransitionAnimationDuration](self, "imageVideoTransitionAnimationDuration");
      v22 = v21;
      v32[0] = v11;
      v32[1] = 3221225472;
      v32[2] = __69__VUIBackgroundMediaController__swapActiveMedia_animated_completion___block_invoke_236;
      v32[3] = &unk_1E9F98E68;
      v33 = v12;
      v30[0] = v11;
      v30[1] = 3221225472;
      v30[2] = __69__VUIBackgroundMediaController__swapActiveMedia_animated_completion___block_invoke_2;
      v30[3] = &unk_1E9F98E18;
      v31 = v8;
      objc_msgSend(v14, "vui_animateWithDuration:delay:options:animations:completion:", 5242912, v32, v30, v22, 0.0);
      v18 = &v33;
      v19 = &v31;
    }

    -[VUIBackgroundMediaController showAlphaImage:animated:](self, "showAlphaImage:animated:", 1, 1);
  }
  else
  {
    v20 = (void *)MEMORY[0x1E0DC3F10];
    v23[0] = v11;
    v23[1] = 3221225472;
    v23[2] = __69__VUIBackgroundMediaController__swapActiveMedia_animated_completion___block_invoke_5;
    v23[3] = &unk_1E9F9BDC8;
    v24 = v12;
    v25 = v8;
    objc_msgSend(v20, "vui_performWithoutAnimation:", v23);
    -[VUIBackgroundMediaController showAlphaImage:animated:](self, "showAlphaImage:animated:", 1, 0);

  }
  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);

}

void __69__VUIBackgroundMediaController__swapActiveMedia_animated_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  id v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = *(unsigned __int8 *)(a1 + 40);
  VUIDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      objc_msgSend(WeakRetained, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(unsigned __int8 *)(a1 + 41);
      v21 = 134218498;
      v22 = WeakRetained;
      v23 = 2112;
      v24 = v6;
      v25 = 1024;
      v26 = v7;
      _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) showing background image now, animated %d", (uint8_t *)&v21, 0x1Cu);

    }
    objc_msgSend(WeakRetained, "proxyImageView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setVuiAlpha:", 1.0);

    objc_msgSend(WeakRetained, "playbackContainerController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setVuiAlpha:", 0.0);

    objc_msgSend(WeakRetained, "currentMediaInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = objc_msgSend(v11, "showsSecondaryVideoView");

    if ((_DWORD)v10)
    {
      objc_msgSend(WeakRetained, "secondaryVideoView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = 0.0;
LABEL_10:
      objc_msgSend(v12, "setVuiAlpha:", v14);

    }
  }
  else
  {
    if (v5)
    {
      objc_msgSend(WeakRetained, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(unsigned __int8 *)(a1 + 41);
      v21 = 134218498;
      v22 = WeakRetained;
      v23 = 2112;
      v24 = v15;
      v25 = 1024;
      v26 = v16;
      _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) showing playback view now, animated %d", (uint8_t *)&v21, 0x1Cu);

    }
    objc_msgSend(WeakRetained, "proxyImageView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setVuiAlpha:", 0.0);

    objc_msgSend(WeakRetained, "playbackContainerController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setVuiAlpha:", 1.0);

    objc_msgSend(WeakRetained, "currentMediaInfo");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v19) = objc_msgSend(v20, "showsSecondaryVideoView");

    if ((_DWORD)v19)
    {
      objc_msgSend(WeakRetained, "secondaryVideoView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = 1.0;
      goto LABEL_10;
    }
  }

}

uint64_t __69__VUIBackgroundMediaController__swapActiveMedia_animated_completion___block_invoke_236(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __69__VUIBackgroundMediaController__swapActiveMedia_animated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __69__VUIBackgroundMediaController__swapActiveMedia_animated_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __69__VUIBackgroundMediaController__swapActiveMedia_animated_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __69__VUIBackgroundMediaController__swapActiveMedia_animated_completion___block_invoke_5(uint64_t a1)
{
  uint64_t result;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setImageContentMode:(unint64_t)a3
{
  id v4;

  self->_imageContentMode = a3;
  -[VUIBackgroundMediaController proxyImageView](self, "proxyImageView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setVuiContentMode:", a3);

}

- (void)setVideoGravity:(id)a3
{
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_storeStrong((id *)&self->_videoGravity, a3);
  if (self->_keepVideoGravityUnchangedByVideoControlsVisibility)
  {
    -[VUIBackgroundMediaController avPlayerViewController](self, "avPlayerViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setVideoGravity:", v11);

    -[VUIBackgroundMediaController prefetchPlayerViewController](self, "prefetchPlayerViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setVideoGravity:", v11);
  }
  else
  {
    v7 = -[VUIBackgroundMediaController showsVideoControls](self, "showsVideoControls");
    v8 = (void *)*MEMORY[0x1E0C8A6D8];
    if (!v7)
      v8 = v11;
    v9 = v8;
    -[VUIBackgroundMediaController avPlayerViewController](self, "avPlayerViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setVideoGravity:", v9);

    -[VUIBackgroundMediaController prefetchPlayerViewController](self, "prefetchPlayerViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setVideoGravity:", v9);

  }
}

- (void)setAllowsExternalPlayback:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  self->_allowsExternalPlayback = a3;
  -[VUIBackgroundMediaController player](self, "player");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAllowsExternalPlayback:", v3);

  -[VUIBackgroundMediaController prefetchPlayer](self, "prefetchPlayer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAllowsExternalPlayback:", v3);

}

- (void)_removeProxyImageView
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[VUIBackgroundMediaController proxyImageView](self, "proxyImageView");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[VUIBackgroundMediaController proxyImageView](self, "proxyImageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "superview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[VUIBackgroundMediaController proxyImageView](self, "proxyImageView");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeFromSuperview");

    }
  }
}

void __43__VUIBackgroundMediaController__loadImage___block_invoke_237(uint64_t a1, void *a2, char a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD block[2];
  uint64_t (*v10)(uint64_t);
  void *v11;
  id v12;
  id v13;
  char v14;

  v5 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  v10 = __43__VUIBackgroundMediaController__loadImage___block_invoke_2;
  v11 = &unk_1E9F9DB98;
  v6 = *(id *)(a1 + 32);
  v12 = v5;
  v13 = v6;
  v14 = a3;
  v7 = (void *)MEMORY[0x1E0CB3978];
  v8 = v5;
  if (objc_msgSend(v7, "isMainThread"))
    v10((uint64_t)block);
  else
    dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __43__VUIBackgroundMediaController__loadImage___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    WeakRetained = v3;
  }

}

- (void)_playbackStateWillChange:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DB1F60]);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DB1958], "stopped");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v10;
  if (v10 == v5)
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    -[VUIBackgroundMediaController player](self, "player");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cachedElapsedTime");
    objc_msgSend(v7, "numberWithDouble:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIBackgroundMediaController setElapsedTimeWhenStopped:](self, "setElapsedTimeWhenStopped:", v9);

    v6 = v10;
  }

}

- (void)_playbackErrorDidOccur:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DB1F80]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
  {
    -[VUIBackgroundMediaController player](self, "player");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currentMediaItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1D28]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSingleShotEventWithName:value:", *MEMORY[0x1E0DB1EF0], *MEMORY[0x1E0DB1F38]);

  }
}

- (void)_mediaControllerStartedPlayback:(id)a3
{
  VUIBackgroundMediaController *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  VUIBackgroundMediaController *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "object");
  v4 = (VUIBackgroundMediaController *)objc_claimAutoreleasedReturnValue();
  if (v4 != self)
  {
    -[VUIBackgroundMediaController player](self, "player");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "state");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DB1958], "stopped");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 != v7)
    {
      if (-[VUIBackgroundMediaController shouldStopWhenAnotherMediaControllerStarts](self, "shouldStopWhenAnotherMediaControllerStarts"))
      {
        VUIDefaultLogObject();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          -[VUIBackgroundMediaController name](self, "name");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[VUIBackgroundMediaController name](v4, "name");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = 134218498;
          v12 = self;
          v13 = 2112;
          v14 = v9;
          v15 = 2112;
          v16 = v10;
          _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) received stop event because %@ will start playback.", (uint8_t *)&v11, 0x20u);

        }
        -[VUIBackgroundMediaController setAutomaticPlaybackStop:](self, "setAutomaticPlaybackStop:", 1);
        -[VUIBackgroundMediaController setVpafPlaybackStopReason:](self, "setVpafPlaybackStopReason:", 1);
        -[VUIBackgroundMediaController stop](self, "stop");
      }
    }
  }

}

- (BOOL)didAVPlayerControllerEnterFullscreen
{
  return self->_didAVPlayerControllerEnterFullscreen
      && -[VUIBackgroundMediaController isForeground](self, "isForeground");
}

- (void)_updateCurrentPlaybackViewFrameForPlaybackInBackground:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
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
  double v17;
  double v18;
  double v19;
  double v20;
  __int128 v21;
  char v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  _QWORD aBlock[4];
  id v39[9];
  CGAffineTransform v40;
  BOOL v41;
  char v42;
  id location;
  CGAffineTransform v44;

  v4 = a4;
  v5 = a3;
  if (!-[VUIBackgroundMediaController _hasSecondaryView](self, "_hasSecondaryView"))
    return;
  -[VUIBackgroundMediaController avPlayerViewController](self, "avPlayerViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    return;
  -[VUIBackgroundMediaController _playbackContainerViewFrame:hasSecondaryVideoView:](self, "_playbackContainerViewFrame:hasSecondaryVideoView:", v5, -[VUIBackgroundMediaController _hasSecondaryView](self, "_hasSecondaryView"));
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[VUIBackgroundMediaController player](self, "player");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "currentMediaItemPresentationSize");
  v18 = v17;
  v20 = v19;

  v21 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v44.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v44.c = v21;
  *(_OWORD *)&v44.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v22 = 0;
  if (!objc_msgSend(MEMORY[0x1E0DC69D0], "isTV") || v20 <= 0.0)
  {
LABEL_12:
    v24 = *(double *)&v15;
    v25 = *(double *)&v13;
    v26 = *(double *)&v11;
    v27 = *(double *)&v9;
    goto LABEL_18;
  }
  v23 = v18;
  v24 = *(double *)&v15;
  v25 = *(double *)&v13;
  v26 = *(double *)&v11;
  v27 = *(double *)&v9;
  if (*(double *)&v15 > 0.0)
  {
    if (v5)
    {
      v28 = v23 / v20;
      if (v28 >= *(double *)&v13 / *(double *)&v15)
      {
        v30 = round(*(double *)&v15);
        v32 = round(v30 * v28);
        if (v32 >= *(double *)&v13 * 3.0)
          v25 = *(double *)&v13 * 3.0;
        else
          v25 = v32;
        v31 = v25 / *(double *)&v13;
      }
      else
      {
        v25 = round(*(double *)&v13);
        v29 = round(v25 / v28);
        if (v29 >= *(double *)&v15 * 3.0)
          v29 = *(double *)&v15 * 3.0;
        v30 = v29;
        v31 = v29 / *(double *)&v15;
      }
      CGAffineTransformMakeScale(&v44, v31, v31);
      v24 = v30;
      v26 = (*(double *)&v15 - v30) * 0.5;
      v27 = (*(double *)&v13 - v25) * 0.5;
      v22 = 1;
      goto LABEL_18;
    }
    v22 = 0;
    goto LABEL_12;
  }
LABEL_18:
  v33 = v24;
  -[VUIBackgroundMediaController view](self, "view");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "vui_layoutIfNeeded");

  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __96__VUIBackgroundMediaController__updateCurrentPlaybackViewFrameForPlaybackInBackground_animated___block_invoke;
  aBlock[3] = &unk_1E9FA54D8;
  objc_copyWeak(v39, &location);
  v39[1] = v9;
  v39[2] = v11;
  v39[3] = v13;
  v39[4] = v15;
  v41 = v5;
  v39[5] = *(id *)&v27;
  v39[6] = *(id *)&v26;
  v39[7] = *(id *)&v25;
  v39[8] = *(id *)&v33;
  v40 = v44;
  v42 = v22;
  v35 = _Block_copy(aBlock);
  v36 = v35;
  if (v4)
  {
    if (v5)
      v37 = 0x10000;
    else
      v37 = 0x20000;
    objc_msgSend(MEMORY[0x1E0DC3F10], "vui_animateWithDuration:delay:options:animations:completion:", v37, v35, 0, 0.25, 0.0);
  }
  else
  {
    (*((void (**)(void *))v35 + 2))(v35);
  }

  objc_destroyWeak(v39);
  objc_destroyWeak(&location);
}

void __96__VUIBackgroundMediaController__updateCurrentPlaybackViewFrameForPlaybackInBackground_animated___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  void *v18;
  _OWORD v19[3];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "playbackContainerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));

  objc_msgSend(WeakRetained, "secondaryVideoView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(WeakRetained, "_secondaryVideoViewFrame:", *(unsigned __int8 *)(a1 + 152));
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    objc_msgSend(WeakRetained, "secondaryVideoView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

    objc_msgSend(WeakRetained, "avPlayerViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFrame:", *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
  }
  else
  {
    objc_msgSend(WeakRetained, "avPlayerViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *(_OWORD *)(a1 + 120);
    v19[0] = *(_OWORD *)(a1 + 104);
    v19[1] = v17;
    v19[2] = *(_OWORD *)(a1 + 136);
    objc_msgSend(v16, "setTransform:", v19);
  }

  if (*(_BYTE *)(a1 + 153))
    objc_msgSend(WeakRetained, "_updateVideoPlayerLegibleContentInsets:", *(unsigned __int8 *)(a1 + 152));
  objc_msgSend(WeakRetained, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "vui_layoutIfNeeded");

}

- (void)_removePlaybackViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  VUIBackgroundMediaController *v7;
  void *v8;
  id v9;

  -[VUIBackgroundMediaController avPlayerViewController](self, "avPlayerViewController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "vuiParentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIBackgroundMediaController playbackContainerController](self, "playbackContainerController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == v4)
  {
    objc_msgSend(v9, "vui_willMoveToParentViewController:", 0);
    objc_msgSend(v9, "vuiView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "vui_removeFromSuperView");

    objc_msgSend(v9, "vui_removeFromParentViewController");
  }
  -[VUIBackgroundMediaController playbackContainerController](self, "playbackContainerController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "vuiParentViewController");
  v7 = (VUIBackgroundMediaController *)objc_claimAutoreleasedReturnValue();

  if (v7 == self)
  {
    objc_msgSend(v6, "vui_willMoveToParentViewController:", 0);
    objc_msgSend(v6, "vuiView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "vui_removeFromSuperView");

    objc_msgSend(v6, "vui_removeFromParentViewController");
  }

}

void __83__VUIBackgroundMediaController__updateAVPlayerViewControllerWithAVPlayerForPlayer___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    objc_msgSend(*(id *)(a1 + 40), "avPlayer");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "setPlayer:", v2);

  }
}

- (void)_showPlaybackIfPossible
{
  NSObject *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  uint8_t buf[4];
  VUIBackgroundMediaController *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  double v24;
  __int16 v25;
  double v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (-[VUIBackgroundMediaController isPlaybackEnabled](self, "isPlaybackEnabled")
    && -[VUIBackgroundMediaController _autoPlayEnabled](self, "_autoPlayEnabled"))
  {
    -[VUIBackgroundMediaController playbackLoadingStartDate](self, "playbackLoadingStartDate");
    v3 = objc_claimAutoreleasedReturnValue();
    -[VUIBackgroundMediaController _computedPlaybackDelayInterval](self, "_computedPlaybackDelayInterval");
    v5 = v4;
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "timeIntervalSinceDate:", v3);
      v8 = v7;

      -[VUIBackgroundMediaController setPlaybackLoadingStartDate:](self, "setPlaybackLoadingStartDate:", 0);
    }
    else
    {
      v8 = 0.0;
    }
    VUIDefaultLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      -[VUIBackgroundMediaController name](self, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v20 = self;
      v21 = 2112;
      v22 = v11;
      v23 = 2048;
      v24 = v8;
      v25 = 2048;
      v26 = v5;
      _os_log_impl(&dword_1D96EE000, v10, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) timeTakenToLoad:[%f], playbackDelayInterval:[%f]", buf, 0x2Au);

    }
    if (-[VUIBackgroundMediaController isBackgrounded](self, "isBackgrounded") && (v5 == 0.0 || v8 < v5))
    {
      -[VUIBackgroundMediaController currentMediaInfo](self, "currentMediaInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak((id *)buf, self);
      v14 = (void *)MEMORY[0x1E0C99E88];
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __55__VUIBackgroundMediaController__showPlaybackIfPossible__block_invoke;
      v16[3] = &unk_1E9FA5500;
      objc_copyWeak(&v18, (id *)buf);
      v16[4] = self;
      v12 = v13;
      v17 = v12;
      objc_msgSend(v14, "scheduledTimerWithTimeInterval:repeats:block:", 0, v16, v5 - v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIBackgroundMediaController setPlaybackDelayTimer:](self, "setPlaybackDelayTimer:", v15);

      objc_destroyWeak(&v18);
      objc_destroyWeak((id *)buf);
      goto LABEL_16;
    }
    if (v5 != -1.0)
    {
      -[VUIBackgroundMediaController stateMachine](self, "stateMachine");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "postEvent:withContext:userInfo:", CFSTR("Play"), 0, 0);
LABEL_16:

    }
  }
  else
  {
    VUIDefaultLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      -[VUIBackgroundMediaController name](self, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v20 = self;
      v21 = 2112;
      v22 = v9;
      _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) playback is not enabled yet. Will show playback when it gets enabled.", buf, 0x16u);

    }
  }

}

void __55__VUIBackgroundMediaController__showPlaybackIfPossible__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  VUIDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "isPlaybackEnabled");
    VUIBoolLogString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 134218498;
    v8 = WeakRetained;
    v9 = 2112;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) playback timer fired, isPlaybackEnabled: (%@)", (uint8_t *)&v7, 0x20u);

  }
  objc_msgSend(WeakRetained, "setPlaybackDelayTimer:", 0);
  if (objc_msgSend(WeakRetained, "isPlaybackEnabled")
    && objc_msgSend(*(id *)(a1 + 32), "_autoPlayEnabled")
    && objc_msgSend(WeakRetained, "_currentMediaInfoContentMatchesMediaInfo:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(WeakRetained, "stateMachine");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postEvent:withContext:userInfo:", CFSTR("Play"), 0, 0);

  }
}

- (double)_computedPlaybackDelayInterval
{
  double v3;
  double v4;
  double result;
  double v6;
  double v7;
  double v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;

  -[VUIBackgroundMediaController playbackStartDelay](self, "playbackStartDelay");
  v4 = v3;
  result = -1.0;
  if (v4 != -1.0)
  {
    if (PlaybackDelayTimeIntervalOverride_onceToken_0 != -1)
      dispatch_once(&PlaybackDelayTimeIntervalOverride_onceToken_0, &__block_literal_global_1139);
    v6 = *(double *)&PlaybackDelayTimeIntervalOverride_playbackDelayInterval_0;
    -[VUIBackgroundMediaController playbackStartDelay](self, "playbackStartDelay");
    v8 = v7;
    -[VUIBackgroundMediaController currentMediaInfo](self, "currentMediaInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[VUIBackgroundMediaController currentMediaInfo](self, "currentMediaInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "playbackDelayInterval");
      v13 = v12;

      if (v13 != -1.0)
      {
        -[VUIBackgroundMediaController currentMediaInfo](self, "currentMediaInfo");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "playbackDelayInterval");
        v8 = v15;

      }
    }
    if (v6 <= 0.0)
      return v8;
    else
      return v6;
  }
  return result;
}

- (void)_cleanupPrefetchPlayback
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[VUIBackgroundMediaController prefetchPlayer](self, "prefetchPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[VUIBackgroundMediaController prefetchPlayer](self, "prefetchPlayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stop");

    -[VUIBackgroundMediaController prefetchPlayer](self, "prefetchPlayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidate");

    -[VUIBackgroundMediaController setPrefetchPlayer:](self, "setPrefetchPlayer:", 0);
  }
  -[VUIBackgroundMediaController prefetchPlayerViewController](self, "prefetchPlayerViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    -[VUIBackgroundMediaController setPrefetchPlayerViewController:](self, "setPrefetchPlayerViewController:", 0);
}

- (void)_prefetchNextVideo
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  _QWORD v10[2];
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint8_t buf[4];
  VUIBackgroundMediaController *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[VUIBackgroundMediaController player](self, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[VUIBackgroundMediaController player](self, "player");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "externalPlaybackType");

    if (v5)
    {
      VUIDefaultLogObject();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        -[VUIBackgroundMediaController name](self, "name");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v15 = self;
        v16 = 2112;
        v17 = v7;
        _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) Not prefetching player because external playback is not none", buf, 0x16u);

      }
LABEL_5:

      return;
    }
  }
  if (!-[VUIBackgroundMediaController prefetchesVideoFrame](self, "prefetchesVideoFrame"))
  {
    VUIDefaultLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[VUIBackgroundMediaController name](self, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v15 = self;
      v16 = 2112;
      v17 = v9;
      _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) Not prefetching next video because prefetchesVideoFrame is NO", buf, 0x16u);

    }
    goto LABEL_5;
  }
  objc_initWeak((id *)buf, self);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v11 = __50__VUIBackgroundMediaController__prefetchNextVideo__block_invoke;
  v12 = &unk_1E9F99C98;
  objc_copyWeak(&v13, (id *)buf);
  v8 = v10;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    v11((uint64_t)v8);
  else
    dispatch_async(MEMORY[0x1E0C80D38], v8);

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

void __50__VUIBackgroundMediaController__prefetchNextVideo__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_cleanupPrefetchPlayback");
  objc_msgSend(WeakRetained, "mediaInfoFetchController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "loadPlayerAtIndex:", objc_msgSend(WeakRetained, "mediaInfoIndex") + 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(WeakRetained, "player");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setMuted:", objc_msgSend(v5, "muted"));

  }
  objc_msgSend(WeakRetained, "playbackInitiatorForRTCReporting");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setReportingValueWithString:forKey:", v6, CFSTR("initiator"));

  VUIDefaultLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 134218498;
    v11 = WeakRetained;
    v12 = 2112;
    v13 = v8;
    v14 = 2112;
    v15 = v3;
    _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) Created prefetch player %@", (uint8_t *)&v10, 0x20u);

  }
  objc_msgSend(WeakRetained, "setPrefetchPlayer:", v3);
  objc_msgSend(WeakRetained, "_createPlayerViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setPrefetchPlayerViewController:", v9);

  objc_msgSend(v3, "addObserver:forKeyPath:options:context:", WeakRetained, CFSTR("avPlayer"), 0, __PlayerAVPlayerKVOContext_1);
  objc_msgSend(v3, "pause");

}

- (void)_recordBgAutoPlayMediaEventForPlaybackState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  __CFString *v9;
  __CFString *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  __CFString *v25;
  double v26;
  double v27;
  double v28;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  VUIBackgroundMediaController *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  __CFString *v44;
  __int16 v45;
  int v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[VUIBackgroundMediaController player](self, "player");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "playlist");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "currentMediaItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0DB1958], "playing");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v9 = CFSTR("play");
    if (v8 != v4)
      v9 = CFSTR("stop");
    v10 = v9;

    if (v10 == CFSTR("stop"))
    {
      -[VUIBackgroundMediaController lastMediaEventActionType](self, "lastMediaEventActionType");
      v23 = objc_claimAutoreleasedReturnValue();
      if (!v23)
        goto LABEL_32;
      v24 = (void *)v23;
      -[VUIBackgroundMediaController lastMediaEventActionType](self, "lastMediaEventActionType");
      v25 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (v25 == CFSTR("stop"))
        goto LABEL_32;
    }
    -[VUIBackgroundMediaController setLastMediaEventActionType:](self, "setLastMediaEventActionType:", v10);
    VUIDefaultLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[VUIBackgroundMediaController name](self, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 134218754;
      v40 = self;
      v41 = 2112;
      v42 = v12;
      v43 = 2112;
      v44 = v10;
      v45 = 1024;
      v46 = 0;
      _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) record bg video media event, actionType %@, isAmbientVideo %i", (uint8_t *)&v39, 0x26u);

    }
    objc_msgSend(v7, "mediaItemMetadataForProperty:", CFSTR("VUIMediaItemMetadataClipId"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "length");

    -[VUIBackgroundMediaController player](self, "player");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v14)
    {
      objc_msgSend(v15, "currentMediaItem");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1C98]);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = (void *)MEMORY[0x1E0CB37E8];
      -[VUIBackgroundMediaController player](self, "player");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "playbackDate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "timeIntervalSinceDate:", v18);
      objc_msgSend(v19, "numberWithDouble:");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_31:
      +[VUIMetricsMediaEvent recordBGVideoPlayOfTVPMediaItem:contentPosition:isAmbient:actionType:](VUIMetricsMediaEvent, "recordBGVideoPlayOfTVPMediaItem:contentPosition:isAmbient:actionType:", v7, v22, 0, v10);

      goto LABEL_32;
    }
    objc_msgSend(v15, "duration");
    v27 = v26;
    v28 = *MEMORY[0x1E0DB1990];

    if (v27 == v28)
    {
      objc_msgSend(MEMORY[0x1E0DB1958], "playing");
      v29 = (id)objc_claimAutoreleasedReturnValue();

      if (v29 == v4)
      {
        v22 = &unk_1EA0BBE18;
        goto LABEL_31;
      }
      objc_msgSend(MEMORY[0x1E0DB1958], "stopped");
      v30 = (id)objc_claimAutoreleasedReturnValue();
      if (v30 != v4)
      {
        objc_msgSend(MEMORY[0x1E0DB1958], "paused");
        v31 = (id)objc_claimAutoreleasedReturnValue();
        if (v31 != v4)
        {

LABEL_30:
          v22 = 0;
          goto LABEL_31;
        }
      }
      -[VUIBackgroundMediaController playbackStartDate](self, "playbackStartDate");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30 == v4)
      {
        if (!v35)
          goto LABEL_30;
      }
      else
      {

        if (!v35)
          goto LABEL_30;
      }
      v36 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIBackgroundMediaController playbackStartDate](self, "playbackStartDate");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "timeIntervalSinceDate:", v37);
      objc_msgSend(v36, "numberWithDouble:");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DB1958], "stopped");
      v32 = (id)objc_claimAutoreleasedReturnValue();
      if (v32 == v4)
      {
        -[VUIBackgroundMediaController elapsedTimeWhenStopped](self, "elapsedTimeWhenStopped");
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        if (v38)
        {
          -[VUIBackgroundMediaController elapsedTimeWhenStopped](self, "elapsedTimeWhenStopped");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_31;
        }
      }
      else
      {

      }
      v33 = (void *)MEMORY[0x1E0CB37E8];
      -[VUIBackgroundMediaController player](self, "player");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "cachedElapsedTime");
      objc_msgSend(v33, "numberWithDouble:");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_31;
  }
  VUIDefaultLogObject();
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
    -[VUIBackgroundMediaController _recordBgAutoPlayMediaEventForPlaybackState:].cold.1(self);
LABEL_32:

}

- (void)_didPlayMediaItemToEnd:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _BYTE location[12];
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[VUIBackgroundMediaController player](self, "player");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "playlist");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIBackgroundMediaController player](self, "player");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObserver:name:object:", self, *MEMORY[0x1E0DB1E38], v9);

  }
  if (-[VUIBackgroundMediaController shouldPauseAtEnd](self, "shouldPauseAtEnd"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("VUIBackgroundMediaControllerDidPlayToEndNotification"), self, 0);

    if (-[VUIBackgroundMediaController shouldShowImageAndStopAfterPausingAtEnd](self, "shouldShowImageAndStopAfterPausingAtEnd"))
    {
      objc_initWeak((id *)location, self);
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __55__VUIBackgroundMediaController__didPlayMediaItemToEnd___block_invoke;
      v19[3] = &unk_1E9F99C98;
      objc_copyWeak(&v20, (id *)location);
      -[VUIBackgroundMediaController _swapActiveMedia:animated:completion:](self, "_swapActiveMedia:animated:completion:", 1, 1, v19);
      objc_destroyWeak(&v20);
      objc_destroyWeak((id *)location);
    }
  }
  else
  {
    -[VUIBackgroundMediaController player](self, "player");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "playlist");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "nextMediaItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13 == 0;

    VUIDefaultLogObject();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v16)
      {
        -[VUIBackgroundMediaController name](self, "name");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)location = 134218242;
        *(_QWORD *)&location[4] = self;
        v22 = 2112;
        v23 = v18;
        _os_log_impl(&dword_1D96EE000, v15, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) DidPlayMediaItemToEnd, stop now", location, 0x16u);

      }
      -[VUIBackgroundMediaController stop](self, "stop");
    }
    else
    {
      if (v16)
      {
        -[VUIBackgroundMediaController name](self, "name");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)location = 134218242;
        *(_QWORD *)&location[4] = self;
        v22 = 2112;
        v23 = v17;
        _os_log_impl(&dword_1D96EE000, v15, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) DidPlayMediaItemToEnd, there is next item to play, keep playing", location, 0x16u);

      }
    }
  }

}

void __55__VUIBackgroundMediaController__didPlayMediaItemToEnd___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "stop");

}

- (void)_populatePlayerWithMediaItemsIfNeeded:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  id v8;

  v8 = a3;
  v4 = objc_msgSend(v8, "externalPlaybackType");
  -[VUIBackgroundMediaController mediaInfoFetchController](self, "mediaInfoFetchController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "playlist");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[VUIBackgroundMediaController mediaInfoIndex](self, "mediaInfoIndex");
  if (v4)
  {
    objc_msgSend(v5, "populatePlaylistWithMediaItems:atIndex:", v6, v7);

    objc_msgSend(v8, "setMediaItemEndAction:", 0);
    -[VUIBackgroundMediaController _cleanupPrefetchPlayback](self, "_cleanupPrefetchPlayback");
  }
  else
  {
    objc_msgSend(v5, "removePopulatedMediaItems:atIndex:", v6, v7);

    objc_msgSend(v8, "setMediaItemEndAction:", 1);
  }
}

- (void)_postWillStartPlaybackNotification:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[3];
  _QWORD v11[4];

  v3 = a3;
  v11[3] = *MEMORY[0x1E0C80C00];
  -[VUIBackgroundMediaController setAutomaticPlaybackStop:](self, "setAutomaticPlaybackStop:", 0);
  v10[0] = CFSTR("VUIBackgroundMediaControllerIsForegroundedKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v10[1] = CFSTR("VUIBackgroundMediaControllerIsAutomaticPlaybackStartKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VUIBackgroundMediaController isAutomaticPlaybackStart](self, "isAutomaticPlaybackStart"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  v10[2] = CFSTR("VUIBackgroundMediaControllerPlaybackStartReasonKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[VUIBackgroundMediaController vpafPlaybackStartReason](self, "vpafPlaybackStartReason"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("VUIBackgroundMediaControllerWillStartPlaybackNotification"), self, v8);

}

- (void)_postWillStopPlaybackNotification
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("VUIBackgroundMediaControllerIsAutomaticPlaybackStopKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VUIBackgroundMediaController isAutomaticPlaybackStop](self, "isAutomaticPlaybackStop"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("VUIBackgroundMediaControllerPlaybackStopReasonKey");
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[VUIBackgroundMediaController vpafPlaybackStopReason](self, "vpafPlaybackStopReason"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("VUIBackgroundMediaControllerWillStopPlaybackNotification"), self, v5);

}

- (void)_postDidStopPlaybackNotification
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("VUIBackgroundMediaControllerIsAutomaticPlaybackStopKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VUIBackgroundMediaController isAutomaticPlaybackStop](self, "isAutomaticPlaybackStop"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("VUIBackgroundMediaControllerPlaybackStopReasonKey");
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[VUIBackgroundMediaController vpafPlaybackStopReason](self, "vpafPlaybackStopReason"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("VUIBackgroundMediaControllerDidStopPlaybackNotification"), self, v5);

}

void __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  float v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD *v46;
  void *v47;
  int v48;
  id v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  id v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  VUIDefaultLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "player");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = 134218754;
    v49 = WeakRetained;
    v50 = 2112;
    v51 = v8;
    v52 = 2112;
    v53 = v5;
    v54 = 2112;
    v55 = v9;
    _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) will create a new playback view controller with player [%@], replacing [%@]", (uint8_t *)&v48, 0x2Au);

  }
  if (v5)
  {
    objc_msgSend(v5, "setAllowsConstrainedNetworkUsage:", 0);
    objc_msgSend(v5, "setAllowsExternalPlayback:", objc_msgSend(WeakRetained, "allowsExternalPlayback"));
    objc_msgSend(WeakRetained, "preferredAudioLanguageCode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {

    }
    else
    {
      objc_msgSend(WeakRetained, "prefersAudioDescriptions");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
LABEL_8:
        if ((objc_msgSend(WeakRetained, "mutePlaybackInBackground") & 1) != 0)
          v14 = 1;
        else
          v14 = objc_msgSend(WeakRetained, "isMuted");
        objc_msgSend(v5, "setMuted:", v14);
        if ((objc_msgSend(WeakRetained, "mutePlaybackInBackground") & 1) != 0
          || (objc_msgSend(WeakRetained, "backgroundVolume"), v15 == -1.0))
        {
          objc_msgSend(WeakRetained, "player");

        }
        else
        {
          objc_msgSend(WeakRetained, "backgroundVolume");
          objc_msgSend(v5, "setVolume:");
        }
        +[VUIPlayerValidationManager sharedInstance](VUIPlayerValidationManager, "sharedInstance");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addReferenceForPlayer:", v5);

        objc_msgSend(WeakRetained, "player");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          objc_msgSend(WeakRetained, "_unregisterPlayerNotifications");
          +[VUIPlayerValidationManager sharedInstance](VUIPlayerValidationManager, "sharedInstance");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(WeakRetained, "player");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "removeReferenceForPlayer:stoppingIfNeeded:", v19, a3 ^ 1);

        }
        objc_msgSend(WeakRetained, "setPlayer:", v5);
        objc_msgSend(WeakRetained, "setDidWeCreatePlayer:", 1);
        objc_msgSend(WeakRetained, "_updatePlayerMuteStateForBackgroundPlaybackWithReason:", CFSTR("VUIBackgroundMediaControllerPlaybackMuteReasonInitialSetting"));
        objc_msgSend(WeakRetained, "player");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addObserver:forKeyPath:options:context:", WeakRetained, CFSTR("avPlayer"), 0, __PlayerAVPlayerKVOContext_1);

        objc_msgSend(WeakRetained, "player");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addObserver:forKeyPath:options:context:", WeakRetained, CFSTR("preferredAudioLanguageCode"), 0, __PlayerPreferredAudioLanguageCode);

        objc_msgSend(WeakRetained, "player");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addObserver:forKeyPath:options:context:", WeakRetained, CFSTR("prefersAudioDescriptions"), 0, __PlayerPrefersAudioDescriptions);

        if (objc_msgSend(WeakRetained, "shouldPauseAtEnd"))
          objc_msgSend(v5, "setMediaItemEndAction:", 1);
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = *MEMORY[0x1E0DB1E38];
        objc_msgSend(WeakRetained, "player");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "addObserver:selector:name:object:", WeakRetained, sel__didPlayMediaItemToEnd_, v24, v25);

        goto LABEL_20;
      }
    }
    objc_msgSend(WeakRetained, "preferredAudioLanguageCode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPreferredAudioLanguageCode:", v12);

    objc_msgSend(WeakRetained, "prefersAudioDescriptions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPrefersAudioDescriptions:", objc_msgSend(v13, "BOOLValue"));

    objc_msgSend(v5, "updateAudioSelectionCriteria");
    goto LABEL_8;
  }
LABEL_20:
  objc_msgSend(WeakRetained, "_registerPlayerNotifications");
  objc_msgSend(WeakRetained, "playbackContainerController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v26)
  {
    v27 = (void *)objc_opt_new();
    objc_msgSend(v27, "view");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    objc_msgSend(v27, "view");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setVuiAutoresizingMask:", 18);

    objc_msgSend(WeakRetained, "setPlaybackContainerController:", v27);
    objc_msgSend(WeakRetained, "avPlayerViewController");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v30)
    {
      VUIDefaultLogObject();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(WeakRetained, "name");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = 134218242;
        v49 = WeakRetained;
        v50 = 2112;
        v51 = v32;
        _os_log_impl(&dword_1D96EE000, v31, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) creating avPlayerViewController because none was supplied.", (uint8_t *)&v48, 0x16u);

      }
      objc_msgSend(WeakRetained, "_createPlayerViewController");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(WeakRetained, "didWeCreatePlayer"))
      {
        objc_msgSend(WeakRetained, "player");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "_updateAVPlayerViewControllerWithAVPlayerForPlayer:", v34);

      }
      objc_msgSend(WeakRetained, "setAvPlayerViewController:", v33);
      objc_msgSend(WeakRetained, "setShowsVideoControls:", 0);

    }
    objc_msgSend(WeakRetained, "avPlayerViewController");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "vuiView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "superview");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
    {
      objc_msgSend(WeakRetained, "avPlayerViewController");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "vuiView");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "vui_removeFromSuperView");

      objc_msgSend(WeakRetained, "avPlayerViewController");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "vui_removeFromParentViewController");

      objc_msgSend(WeakRetained, "avPlayerViewController");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "vui_didMoveToParentViewController:", 0);

    }
    objc_msgSend(WeakRetained, "_addPlaybackViewControllerForPlayback:restoringAVPlayerViewController:", 1, a3);
    objc_msgSend(WeakRetained, "_updateVideoPlayerLegibleContentInsets:", 1);

  }
  objc_msgSend(WeakRetained, "player");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "currentMediaItem");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1D28]);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "addSingleShotEventWithName:value:", *MEMORY[0x1E0DB1EE8], CFSTR("Background"));
  objc_msgSend(v44, "addOrReplaceStartEventWithName:date:", *MEMORY[0x1E0DB1F10], v45);
  v46 = (_QWORD *)MEMORY[0x1E0DB1F28];
  objc_msgSend(v44, "addOrReplaceStartEventWithName:date:", *MEMORY[0x1E0DB1F28], v45);
  objc_msgSend(v44, "addEndEventWithName:", *v46);
  if ((a3 & 1) == 0)
  {
    objc_msgSend(WeakRetained, "player");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "pause");

  }
}

void __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_252(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  VUIDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 134218242;
    v10 = WeakRetained;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) starting to load the playlist", (uint8_t *)&v9, 0x16u);

  }
  objc_msgSend(WeakRetained, "player");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(WeakRetained, "_postWillStopPlaybackNotification");
    objc_msgSend(WeakRetained, "player");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stop");
  }
  else
  {
    objc_msgSend(WeakRetained, "mediaInfoFetchController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "loadPlayerAtIndex:", objc_msgSend(WeakRetained, "mediaInfoIndex"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "playbackInitiatorForRTCReporting");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setReportingValueWithString:forKey:", v8, CFSTR("initiator"));

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_253(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void (**v3)(_QWORD);
  void *v4;
  int v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_2;
  v17 = &unk_1E9F9A938;
  objc_copyWeak(&v19, v1);
  v18 = WeakRetained;
  v3 = (void (**)(_QWORD))_Block_copy(&v14);
  if ((objc_msgSend(WeakRetained, "loadsPlayerWithFullscreenPlayback", v14, v15, v16, v17) & 1) == 0)
  {
    +[VUIPlaybackManager sharedInstance](VUIPlaybackManager, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isFullscreenPlaybackUIBeingShown");

    if (v5)
    {
      VUIDefaultLogObject();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(WeakRetained, "name");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v21 = WeakRetained;
        v22 = 2112;
        v23 = v7;
        _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) FullScreenPlayback is showing, not loading playback", buf, 0x16u);

      }
LABEL_15:

      goto LABEL_16;
    }
  }
  if (objc_msgSend(WeakRetained, "isBackgrounded"))
  {
    if (!objc_msgSend(WeakRetained, "isPlaybackEnabled"))
    {
      VUIDefaultLogObject();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(WeakRetained, "name");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v21 = WeakRetained;
        v22 = 2112;
        v23 = v13;
        _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) playback is not enabled, not setting loading timer.", buf, 0x16u);

      }
      goto LABEL_15;
    }
    objc_msgSend(WeakRetained, "_cleanUpPlaybackTimers");
    VUIDefaultLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(WeakRetained, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v21 = WeakRetained;
      v22 = 2112;
      v23 = v9;
      _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) playback is enabled, loading playback.", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setPlaybackLoadingStartDate:", v10);

    v3[2](v3);
  }
  else
  {
    VUIDefaultLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(WeakRetained, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v21 = WeakRetained;
      v22 = 2112;
      v23 = v12;
      _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) controller is not backgrounded, loading playback.", buf, 0x16u);

    }
    v3[2](v3);
  }
LABEL_16:

  objc_destroyWeak(&v19);
}

void __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (objc_msgSend(MEMORY[0x1E0DC3470], "vuiIsActive"))
  {
    objc_msgSend(WeakRetained, "currentMediaInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "tvpPlaylist");
    v4 = objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(WeakRetained, "stateMachine");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "postEvent:withContext:userInfo:", CFSTR("Load playback"), 0, 0);

    }
  }
  else
  {
    VUIDefaultLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(void **)(a1 + 32);
      objc_msgSend(v6, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 134218498;
      v9 = v6;
      v10 = 2112;
      v11 = v7;
      v12 = 2048;
      v13 = 0;
      _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) not loading playlist isAppActive:<%ld>.", (uint8_t *)&v8, 0x20u);

    }
  }

}

__CFString *__61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_255(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  char v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v58;
  char v59;
  char v60;
  void *v61;
  char v62;
  void *v63;
  _QWORD v64[4];
  id v65;
  id v66;
  _QWORD v67[4];
  id v68;
  id v69;
  _QWORD v70[5];
  id v71;
  id v72;
  uint64_t v73;
  const __CFString *v74;
  void *v75;
  const __CFString *v76;
  void *v77;
  uint8_t buf[4];
  id v79;
  __int16 v80;
  void *v81;
  __int16 v82;
  void *v83;
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("AnimatedKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ImageVideoSwapBehaviorKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ImageVideoSwapBehaviorKey"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "integerValue");

  }
  else
  {
    v13 = 0;
  }

  objc_msgSend(v7, "currentState");
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "player");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "playlist");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "currentMediaInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "tvpPlaylist");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v13 & 0xFFFFFFFFFFFFFFFDLL) == 0)
  {
    if (objc_msgSend(WeakRetained, "prefetchesVideoFrame"))
    {
      objc_msgSend(WeakRetained, "mediaInfoFetchController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "mediaInfoContainsPlayerAtIndex:", objc_msgSend(WeakRetained, "mediaInfoIndex"));

      if (v20)
      {
        v61 = v10;
        objc_msgSend(WeakRetained, "avPlayerViewController");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = objc_msgSend(v21, "isPictureInPictureActive");

        objc_msgSend(WeakRetained, "prefetchPlayer");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "playlist");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(WeakRetained, "_playlist:contentMatchesPlaylist:", v23, v18);

        LODWORD(v58) = v24;
        if (objc_msgSend(WeakRetained, "isVideoFrameFallbackEnabled"))
        {
          objc_msgSend(WeakRetained, "prefetchPlayer");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "state");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0DB1958], "paused");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v24 ^ 1;
          if (v26 != v27)
            v28 = 1;
          HIDWORD(v58) = v28;

        }
        else
        {
          HIDWORD(v58) = 0;
        }
        v63 = v16;
        objc_msgSend(WeakRetained, "player", v58);
        v44 = objc_claimAutoreleasedReturnValue();
        v10 = v61;
        if (v44)
        {
          v45 = (void *)v44;
          objc_msgSend(WeakRetained, "player");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = objc_msgSend(v46, "externalPlaybackType");

          if (v47)
            v48 = 1;
          else
            v48 = v62;
          if ((v48 & 1) != 0)
            goto LABEL_31;
        }
        else if ((v62 & 1) != 0)
        {
LABEL_31:
          objc_msgSend(WeakRetained, "player");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "playlist");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = objc_msgSend(v50, "activeListIndex");
          v52 = objc_msgSend(WeakRetained, "mediaInfoIndex");

          if (v51 != v52)
          {
            objc_msgSend(WeakRetained, "player");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "changeToMediaAtIndex:reason:", objc_msgSend(WeakRetained, "mediaInfoIndex"), 0);

          }
LABEL_41:
          v16 = v63;
          goto LABEL_42;
        }

        if ((v60 & 1) != 0)
        {
          objc_msgSend(WeakRetained, "_cleanUpEverythingPlaybackRelated");
          if ((v59 & 1) == 0)
          {
            objc_msgSend(WeakRetained, "_cleanupPrefetchPlayback");
            objc_msgSend(WeakRetained, "_swapActiveMedia:animated:completion:", 1, objc_msgSend(v61, "BOOLValue"), 0);
          }
          v67[0] = MEMORY[0x1E0C809B0];
          v67[1] = 3221225472;
          v67[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_3;
          v67[3] = &unk_1E9F98FD8;
          v68 = v7;
          v69 = v8;
          objc_msgSend(v68, "executeBlockAfterCurrentStateTransition:", v67);

          v14 = CFSTR("Loading image");
        }
        else
        {
          v70[0] = MEMORY[0x1E0C809B0];
          v70[1] = 3221225472;
          v70[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_2_256;
          v70[3] = &unk_1E9FA4D78;
          v73 = v13;
          v70[4] = WeakRetained;
          v71 = v7;
          v72 = v8;
          objc_msgSend(v71, "executeBlockAfterCurrentStateTransition:", v70);

          v14 = CFSTR("Loading playback");
        }
        goto LABEL_41;
      }
    }
  }
  if (v13 == 3)
  {
    v33 = v16;
    VUIDefaultLogObject();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(WeakRetained, "name");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v79 = WeakRetained;
      v80 = 2112;
      v81 = v35;
      v82 = 2112;
      v83 = v10;
      _os_log_impl(&dword_1D96EE000, v34, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) set media info SwapBehaviorShowImageAndStop, animated %@", buf, 0x20u);

    }
    objc_msgSend(WeakRetained, "_swapActiveMedia:animated:completion:", 1, objc_msgSend(v10, "BOOLValue"), 0);
    if (v8)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("DirectionKey"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "integerValue");

    }
    else
    {
      v37 = 0;
    }
    objc_msgSend(WeakRetained, "currentMediaInfo");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setPendingMediaInfo:", v38);

    objc_msgSend(WeakRetained, "setPendingMediaInfoDirection:", v37);
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("AnimatedKey"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setPendingAnimated:", v39);

    v76 = CFSTR("PlaybackStopReasonKey");
    v77 = &unk_1EA0BAB28;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v77, &v76, 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postEvent:withContext:userInfo:", CFSTR("Stop"), 0, v40);

    v16 = v33;
  }
  else if (v13 == 1)
  {
    objc_msgSend(WeakRetained, "currentMediaInfo");
    v29 = v16;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setPendingMediaInfo:", v30);

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("AnimatedKey"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setPendingAnimated:", v31);

    objc_msgSend(WeakRetained, "player");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "pause");

    v64[0] = MEMORY[0x1E0C809B0];
    v64[1] = 3221225472;
    v64[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_4;
    v64[3] = &unk_1E9F98FD8;
    v65 = v7;
    v66 = v8;
    v16 = v29;
    objc_msgSend(v65, "executeBlockAfterCurrentStateTransition:", v64);

    v14 = CFSTR("Waiting to stop after showing image");
  }
  else if (v18 && !objc_msgSend(WeakRetained, "_playlist:contentMatchesPlaylist:", v16, v18))
  {
    v41 = v16;
    if (v8)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("DirectionKey"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v42, "integerValue");

    }
    else
    {
      v43 = 0;
    }
    objc_msgSend(WeakRetained, "currentMediaInfo");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setPendingMediaInfo:", v54);

    objc_msgSend(WeakRetained, "setPendingMediaInfoDirection:", v43);
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("AnimatedKey"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setPendingAnimated:", v55);

    v74 = CFSTR("PlaybackStopReasonKey");
    v75 = &unk_1EA0BAB28;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postEvent:withContext:userInfo:", CFSTR("Stop"), 0, v56);

    v16 = v41;
  }
  else
  {
    objc_msgSend(v7, "postEvent:withContext:userInfo:", CFSTR("Load image"), 0, v8);
  }
LABEL_42:

  return v14;
}

uint64_t __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_2_256(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 56);
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "_cleanupPrefetchPlayback");
    objc_msgSend(*(id *)(a1 + 32), "player");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pause");

  }
  else
  {
    objc_msgSend(v3, "_cleanUpEverythingPlaybackRelated");
  }
  return objc_msgSend(*(id *)(a1 + 40), "postEvent:withContext:userInfo:", CFSTR("Load playback"), 0, *(_QWORD *)(a1 + 48));
}

uint64_t __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "postEvent:withContext:userInfo:", CFSTR("Load image"), 0, *(_QWORD *)(a1 + 40));
}

__CFString *__61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_259(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  id WeakRetained;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  char v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  int v25;
  id v26;
  void *v27;
  void *v28;
  _QWORD v30[4];
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  const __CFString *v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v7, "currentState");
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "mediaInfoFetchController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "mediaInfoContainsPlayerAtIndex:", objc_msgSend(WeakRetained, "mediaInfoIndex"))
    && objc_msgSend(WeakRetained, "prefetchesVideoFrame"))
  {
    objc_msgSend(WeakRetained, "prefetchPlayer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "state");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DB1958], "paused");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

LABEL_16:
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_2_260;
      v33[3] = &unk_1E9F98FD8;
      v34 = v7;
      v35 = v8;
      objc_msgSend(v34, "executeBlockAfterCurrentStateTransition:", v33);

      v10 = CFSTR("Loading playback");
      v26 = v34;
      goto LABEL_17;
    }
    v15 = (void *)v14;
    v16 = objc_msgSend(WeakRetained, "isVideoFrameFallbackEnabled");

    if ((v16 & 1) == 0)
      goto LABEL_16;
  }
  else
  {

  }
  objc_msgSend(WeakRetained, "player");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    objc_msgSend(WeakRetained, "player");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "state");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DB1958], "stopped");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20 != v21)
    {
      if (v8)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("DirectionKey"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "integerValue");

      }
      else
      {
        v23 = 0;
      }
      objc_msgSend(WeakRetained, "currentMediaInfo");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "setPendingMediaInfo:", v27);

      objc_msgSend(WeakRetained, "setPendingMediaInfoDirection:", v23);
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("AnimatedKey"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "setPendingAnimated:", v28);

      v36 = CFSTR("PlaybackStopReasonKey");
      v37[0] = &unk_1EA0BAB28;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
      v26 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "postEvent:withContext:userInfo:", CFSTR("Stop"), 0, v26);
      goto LABEL_17;
    }
  }
  objc_msgSend(WeakRetained, "mediaInfoFetchController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "mediaInfoContainsImageAtIndex:", objc_msgSend(WeakRetained, "mediaInfoIndex"));

  if (v25)
  {

    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_3_261;
    v30[3] = &unk_1E9F98FD8;
    v31 = v7;
    v32 = v8;
    objc_msgSend(v31, "executeBlockAfterCurrentStateTransition:", v30);

    v10 = CFSTR("Loading image");
    v26 = v31;
LABEL_17:

  }
  return v10;
}

uint64_t __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_2_260(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "postEvent:withContext:userInfo:", CFSTR("Load playback"), 0, *(_QWORD *)(a1 + 40));
}

uint64_t __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_3_261(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "postEvent:withContext:userInfo:", CFSTR("Load image"), 0, *(_QWORD *)(a1 + 40));
}

__CFString *__61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_4_262(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  __CFString *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_5;
  v18[3] = &unk_1E9F99000;
  objc_copyWeak(&v21, (id *)(a1 + 32));
  v13 = v12;
  v19 = v13;
  v14 = v9;
  v20 = v14;
  objc_msgSend(v14, "executeBlockAfterCurrentStateTransition:", v18);
  objc_msgSend(v14, "currentState");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "isEqualToString:", CFSTR("Waiting to stop after showing image")))
  {
    objc_msgSend(v14, "currentState");
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = CFSTR("Loading image");
  }

  objc_destroyWeak(&v21);
  return v16;
}

uint64_t __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "postEvent:withContext:userInfo:", CFSTR("Show image"), 0, *(_QWORD *)(a1 + 40));
}

id __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_263(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id *v13;
  id WeakRetained;
  void *v15;
  void *v16;
  _QWORD aBlock[4];
  id v19;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_2_264;
  aBlock[3] = &unk_1E9FA55A0;
  objc_copyWeak(&v19, v13);
  v15 = _Block_copy(aBlock);
  objc_msgSend(WeakRetained, "_loadImage:", v15);
  objc_msgSend(v9, "currentState");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v19);
  return v16;
}

void __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_2_264(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v6)
  {
    objc_msgSend(WeakRetained, "proxyImageView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uiImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setImage:", v5);

  }
}

const __CFString *__61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_3_265(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id *v19;
  id WeakRetained;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32[2];
  char v33;
  _QWORD aBlock[5];
  id v35;
  id v36[2];

  v28 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("AnimatedKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v9;
  if (v12)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("AnimatedKey"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "BOOLValue");

  }
  else
  {
    v14 = 1;
  }

  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ImageKey"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("DirectionKey"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("DirectionKey"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "integerValue");

  }
  else
  {
    v18 = 0;
  }

  v19 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setState:", 1);
  v21 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_4_266;
  aBlock[3] = &unk_1E9F99600;
  objc_copyWeak(v36, (id *)(a1 + 40));
  aBlock[4] = WeakRetained;
  v35 = *(id *)(a1 + 32);
  v22 = _Block_copy(aBlock);
  v23 = v22;
  if (v15)
  {
    v29[0] = v21;
    v29[1] = 3221225472;
    v29[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_268;
    v29[3] = &unk_1E9FA55C8;
    objc_copyWeak(v32, v19);
    v24 = v15;
    v33 = v14;
    v30 = v24;
    v32[1] = v18;
    v31 = v23;
    v25 = v28;
    objc_msgSend(v28, "executeBlockAfterCurrentStateTransition:", v29);

    objc_destroyWeak(v32);
  }
  else
  {
    (*((void (**)(void *))v22 + 2))(v22);
    v25 = v28;
  }

  objc_destroyWeak(v36);
  return CFSTR("Showing image");
}

void __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_4_266(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  _QWORD block[6];
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_5_267;
  block[3] = &unk_1E9F99778;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  block[4] = WeakRetained;
  block[5] = v3;
  v6 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_5_267(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "currentMediaInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tvpPlaylist");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    VUIDefaultLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(void **)(a1 + 40);
      objc_msgSend(v5, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 134218242;
      v8 = v5;
      v9 = 2112;
      v10 = v6;
      _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) we have a pending playlist, starting loading timer.", (uint8_t *)&v7, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_268(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(unsigned __int8 *)(a1 + 64);
  v6 = *(_QWORD *)(a1 + 56);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_2_269;
  v7[3] = &unk_1E9F9A060;
  objc_copyWeak(&v9, v2);
  v8 = *(id *)(a1 + 40);
  objc_msgSend(WeakRetained, "_transitionToNewImage:animated:direction:completion:", v4, v5, v6, v7);

  objc_destroyWeak(&v9);
}

void __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_2_269(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_msgSend(WeakRetained, "alphaImageProxy");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2;
    objc_msgSend(WeakRetained, "alphaProxyImageView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "image");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      objc_msgSend(WeakRetained, "showAlphaImage:animated:", 1, 0);
  }

}

const __CFString *__61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_3_270(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  id *v17;
  id WeakRetained;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  char v25;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("AnimatedKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("AnimatedKey"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "BOOLValue");

  }
  else
  {
    v15 = 1;
  }

  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("ImageKey"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v19 = WeakRetained;
  if (v16)
  {
    objc_msgSend(WeakRetained, "proxyImageView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "uiImage");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setImage:", v21);

  }
  objc_msgSend(v19, "setState:", 1);
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_4_271;
  v23[3] = &unk_1E9F9A758;
  objc_copyWeak(&v24, v17);
  v25 = v15;
  objc_msgSend(v9, "executeBlockAfterCurrentStateTransition:", v23);
  objc_destroyWeak(&v24);

  return CFSTR("Showing image");
}

void __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_4_271(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_swapActiveMedia:animated:completion:", 1, *(unsigned __int8 *)(a1 + 40), 0);

}

id __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_5_272(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id *v17;
  id WeakRetained;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t);
  void *v28;
  id v29;
  id v30;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("AnimatedKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("AnimatedKey"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "BOOLValue");

  }
  else
  {
    v15 = 1;
  }

  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("ImageKey"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v19 = WeakRetained;
  if (v16)
  {
    objc_msgSend(WeakRetained, "proxyImageView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "uiImage");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setImage:", v21);

  }
  objc_msgSend(v19, "setState:", 1);
  v25 = MEMORY[0x1E0C809B0];
  v26 = 3221225472;
  v27 = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_6_273;
  v28 = &unk_1E9F9B6C0;
  v22 = v9;
  v29 = v22;
  objc_copyWeak(&v30, v17);
  objc_msgSend(v19, "_swapActiveMedia:animated:completion:", 1, v15, &v25);
  objc_msgSend(v22, "currentState", v25, v26, v27, v28);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v30);

  return v23;
}

void __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_6_273(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_7_274;
  v2[3] = &unk_1E9F99C98;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  objc_msgSend(v1, "executeBlockAfterCurrentStateTransition:", v2);
  objc_destroyWeak(&v3);
}

void __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_7_274(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "player");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stop");

}

id __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  void *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v7 = a2;
  objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("ImageKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v10 = WeakRetained;
  if (v8)
  {
    objc_msgSend(WeakRetained, "proxyImageView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uiImage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setImage:", v12);

    objc_msgSend(v10, "alphaImageProxy");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      objc_msgSend(v10, "alphaProxyImageView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "image");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
        objc_msgSend(v10, "showAlphaImage:animated:", 1, 1);
    }
  }
  objc_msgSend(v7, "currentState");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

uint64_t __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_275(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "videoAudioRampDuration");
  return objc_msgSend(v1, "playWithVolumeRampDuration:");
}

id __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_2_276(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t);
  void *v31;
  id v32;
  id v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_postWillStopPlaybackNotification");
  objc_msgSend(WeakRetained, "prefetchPlayer");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    objc_msgSend(WeakRetained, "currentMediaInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "tvpPlaylist");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "prefetchPlayer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "playlist");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(WeakRetained, "_playlist:contentMatchesPlaylist:", v9, v11))
    {
      v12 = objc_msgSend(WeakRetained, "prefetchesVideoFrame");

      if (v12)
      {
        objc_msgSend(WeakRetained, "prefetchPlayer");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "prefetchPlayerViewController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "setAvPlayerViewController:", v14);
        VUIDefaultLogObject();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(WeakRetained, "name");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218498;
          v35 = WeakRetained;
          v36 = 2112;
          v37 = v16;
          v38 = 2112;
          v39 = v13;
          _os_log_impl(&dword_1D96EE000, v15, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) loading playback with prefetch player %@", buf, 0x20u);

        }
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
        objc_msgSend(WeakRetained, "prefetchPlayer");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "state");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DB1958], "paused");
        v19 = objc_claimAutoreleasedReturnValue();
        if (v18 == (void *)v19)
        {

        }
        else
        {
          v20 = (void *)v19;
          v21 = objc_msgSend(WeakRetained, "isVideoFrameFallbackEnabled");

          if ((v21 & 1) != 0)
            goto LABEL_16;
        }
        v28 = MEMORY[0x1E0C809B0];
        v29 = 3221225472;
        v30 = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_277;
        v31 = &unk_1E9F98FD8;
        v32 = v13;
        v33 = WeakRetained;
        objc_msgSend(WeakRetained, "_swapActiveMedia:animated:completion:", 0, 0, &v28);

LABEL_16:
        objc_msgSend(WeakRetained, "setPrefetchPlayer:", 0, v28, v29, v30, v31);
        objc_msgSend(WeakRetained, "setPrefetchPlayerViewController:", 0);

        goto LABEL_13;
      }
    }
    else
    {

    }
  }
  objc_msgSend(WeakRetained, "mediaInfoFetchController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "loadPlayerAtIndex:", objc_msgSend(WeakRetained, "mediaInfoIndex"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "playbackInitiatorForRTCReporting");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setReportingValueWithString:forKey:", v23, CFSTR("initiator"));

  VUIDefaultLogObject();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "name");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v35 = v25;
    v36 = 2112;
    v37 = v13;
    _os_log_impl(&dword_1D96EE000, v24, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) loading playback with new player", buf, 0x16u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
LABEL_13:
  objc_msgSend(v4, "currentState");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

uint64_t __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_277(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "videoAudioRampDuration");
  return objc_msgSend(v1, "playWithVolumeRampDuration:");
}

__CFString *__61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_2_278(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id WeakRetained;
  void *v13;
  char v14;
  id v15;
  __CFString *v16;
  __CFString *v17;
  _QWORD v19[5];
  id v20;
  char v21;

  v7 = a2;
  v8 = a5;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("AnimatedKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("AnimatedKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "BOOLValue");

  }
  else
  {
    v11 = 1;
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "isBackgrounded"))
  {
    objc_msgSend(WeakRetained, "_postWillStartPlaybackNotification:", 0);
    if ((v11 & 1) == 0)
    {
      objc_msgSend(WeakRetained, "player");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "videoAudioRampDuration");
      objc_msgSend(v13, "playWithVolumeRampDuration:");

    }
    v14 = v11 ^ 1;
    objc_msgSend(WeakRetained, "setState:", 3);
  }
  else
  {
    v14 = 0;
  }
  objc_msgSend(WeakRetained, "_disableSubtitleIfNeeded");
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_3_279;
  v19[3] = &unk_1E9F9C920;
  v21 = v14;
  v19[4] = WeakRetained;
  v20 = v7;
  v15 = v7;
  objc_msgSend(WeakRetained, "_swapActiveMedia:animated:completion:", 0, v11, v19);
  if (objc_msgSend(WeakRetained, "isBackgrounded"))
    v16 = CFSTR("Showing playback in background");
  else
    v16 = CFSTR("Showing playback in foreground");
  v17 = v16;

  return v17;
}

uint64_t __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_3_279(uint64_t a1)
{
  void *v2;

  if (!*(_BYTE *)(a1 + 48) && objc_msgSend(*(id *)(a1 + 32), "isBackgrounded"))
  {
    objc_msgSend(*(id *)(a1 + 32), "player");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "videoAudioRampDuration");
    objc_msgSend(v2, "playWithVolumeRampDuration:");

  }
  return objc_msgSend(*(id *)(a1 + 40), "executeBlockAfterCurrentStateTransition:", &__block_literal_global_163);
}

__CFString *__61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_5_281(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  id *v15;
  id WeakRetained;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  void *v21;
  id v22;
  __CFString *v23;
  __CFString *v24;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  BOOL v31;

  v9 = a2;
  v26 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("AnimatedKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("AnimatedKey"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "BOOLValue") ^ 1;

  }
  else
  {
    v14 = 0;
  }

  v15 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "player");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "state");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DB1958], "playing");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v18 == v19;

  objc_msgSend(WeakRetained, "_disableSubtitleIfNeeded");
  if (!objc_msgSend(WeakRetained, "isBackgrounded"))
    goto LABEL_10;
  if (v18 == v19)
    goto LABEL_8;
  objc_msgSend(WeakRetained, "_postWillStartPlaybackNotification:", 0);
  v20 = 0;
  if (v14)
  {
    objc_msgSend(WeakRetained, "player");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "videoAudioRampDuration");
    objc_msgSend(v21, "playWithVolumeRampDuration:");

LABEL_8:
    v20 = 1;
  }
  objc_msgSend(WeakRetained, "setState:", 3);
LABEL_10:
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_6_282;
  v27[3] = &unk_1E9FA5638;
  v22 = v9;
  v28 = v22;
  objc_copyWeak(&v30, v15);
  v31 = v20;
  v29 = WeakRetained;
  objc_msgSend(WeakRetained, "_swapActiveMedia:animated:completion:", 0, 0, v27);
  if (objc_msgSend(WeakRetained, "isBackgrounded"))
    v23 = CFSTR("Showing playback in background");
  else
    v23 = CFSTR("Showing playback in foreground");
  v24 = v23;
  objc_destroyWeak(&v30);

  return v24;
}

void __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_6_282(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  char v5;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_7_283;
  v3[3] = &unk_1E9F9B698;
  objc_copyWeak(&v4, (id *)(a1 + 48));
  v5 = *(_BYTE *)(a1 + 56);
  v3[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "executeBlockAfterCurrentStateTransition:", v3);
  objc_destroyWeak(&v4);
}

void __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_7_283(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  int v4;
  void *v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (!*(_BYTE *)(a1 + 48))
  {
    v6 = WeakRetained;
    v4 = objc_msgSend(WeakRetained, "isBackgrounded");
    v3 = v6;
    if (v4)
    {
      objc_msgSend(v6, "player");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "videoAudioRampDuration");
      objc_msgSend(v5, "playWithVolumeRampDuration:");

      v3 = v6;
    }
  }

}

__CFString *__61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_8_284(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id *v14;
  id WeakRetained;
  NSObject *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  _BOOL4 v22;
  void *v23;
  _BOOL4 v24;
  NSObject *v25;
  void *v26;
  void *v28;
  _QWORD v29[4];
  id v30;
  const __CFString *v31;
  uint64_t v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PlaybackStateKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  VUIDefaultLogObject();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v34 = WeakRetained;
    v35 = 2112;
    v36 = v17;
    v37 = 2112;
    v38 = v10;
    v39 = 2112;
    v40 = v13;
    _os_log_impl(&dword_1D96EE000, v16, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) event %@, newPlaybackState: %@", buf, 0x2Au);

  }
  objc_msgSend(v9, "currentState");
  v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DB1958], "loading");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v13 == v19;

  if (v20)
  {

LABEL_11:
    v18 = CFSTR("Loading playback");
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0DB1958], "paused");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v13 == v21;

  if (v22)
  {

    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_285;
    v29[3] = &unk_1E9F99C98;
    objc_copyWeak(&v30, v14);
    objc_msgSend(v9, "executeBlockAfterCurrentStateTransition:", v29);
    objc_destroyWeak(&v30);
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0DB1958], "stopped");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v13 == v23;

  if (v24)
  {
    v31 = CFSTR("AnimatedKey");
    v32 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "postEvent:withContext:userInfo:", CFSTR("Finished playback"), 0, v28);

  }
  else
  {
    VUIDefaultLogObject();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(WeakRetained, "name");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v34 = WeakRetained;
      v35 = 2112;
      v36 = v26;
      v37 = 2112;
      v38 = v13;
      _os_log_impl(&dword_1D96EE000, v25, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) StateWaitingForPlayerToStartLoading unhandled newPlaybackState: %@", buf, 0x20u);

    }
  }
LABEL_12:

  return v18;
}

void __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_285(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_showPlaybackIfPossible");

}

id __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_286(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  void *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v17;
  id v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  const __CFString *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("PlaybackStateKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v7, "currentState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DB1958], "paused");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 == v11)
  {
    objc_msgSend(WeakRetained, "_showPlaybackIfPossible");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DB1958], "playing");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 == v12)
    {
      objc_msgSend(v7, "postEvent:", CFSTR("Show playback"));
      objc_msgSend(WeakRetained, "_prefetchNextVideo");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DB1958], "stopped");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8 == v13)
      {
        v23 = CFSTR("AnimatedKey");
        v24[0] = MEMORY[0x1E0C9AAB0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
        v14 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "postEvent:withContext:userInfo:", CFSTR("Finished playback"), 0, v14);
      }
      else
      {
        VUIDefaultLogObject();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(WeakRetained, "name");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = 134218498;
          v18 = WeakRetained;
          v19 = 2112;
          v20 = v15;
          v21 = 2112;
          v22 = v8;
          _os_log_impl(&dword_1D96EE000, v14, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) StateLoadingPlayback unhandled newPlaybackState: %@", (uint8_t *)&v17, 0x20u);

        }
      }

    }
  }

  return v10;
}

id __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_287(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  void *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const __CFString *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a5;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PlaybackStateKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v7, "currentState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DB1958], "stopped");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 == v12)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("AnimatedKey"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("AnimatedKey"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "BOOLValue");

    }
    else
    {
      v19 = 1;
    }

    v23 = CFSTR("AnimatedKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postEvent:withContext:userInfo:", CFSTR("Finished playback"), 0, v21);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DB1958], "paused");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 != v13)
    {
      v14 = objc_msgSend(WeakRetained, "isBackgrounded");
      v15 = CFSTR("Showing playback in foreground");
      if (v14)
        v15 = CFSTR("Showing playback in background");
      v16 = v15;

      v11 = v16;
    }
  }

  return v11;
}

id __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_2_288(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  void *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("PlaybackStateKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v7, "currentState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DB1958], "stopped");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 == v11)
  {
    objc_msgSend(WeakRetained, "setPendingAnimated:", 0);
    v18 = CFSTR("AnimatedKey");
    v19[0] = MEMORY[0x1E0C9AAA0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postEvent:withContext:userInfo:", CFSTR("Finished playback"), 0, v16);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DB1958], "paused");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 != v12)
    {
      v13 = objc_msgSend(WeakRetained, "isBackgrounded");
      v14 = CFSTR("Showing playback in foreground");
      if (v13)
        v14 = CFSTR("Showing playback in background");
      v15 = v14;

      v10 = v15;
    }
  }

  return v10;
}

const __CFString *__61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_3_289(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_4_290;
  v16[3] = &unk_1E9F99000;
  objc_copyWeak(&v19, (id *)(a1 + 32));
  v13 = v12;
  v17 = v13;
  v14 = v9;
  v18 = v14;
  objc_msgSend(v14, "executeBlockAfterCurrentStateTransition:", v16);

  objc_destroyWeak(&v19);
  return CFSTR("Finished playback");
}

void __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_4_290(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = objc_msgSend(WeakRetained, "pendingMediaInfoDirection");
  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("DirectionKey"));

  objc_msgSend(WeakRetained, "pendingAnimated");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("AnimatedKey"));
  if ((objc_msgSend(WeakRetained, "prefetchesVideoFrame") & 1) == 0)
  {
    objc_msgSend(WeakRetained, "_postDidStopPlaybackNotification");
    objc_msgSend(WeakRetained, "_cleanUpEverythingPlaybackRelated");
  }
  if (objc_msgSend(WeakRetained, "popWhenPlayerStops"))
  {
    objc_msgSend(WeakRetained, "vuiNavigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "topViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(WeakRetained, "vuiNavigationController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (id)objc_msgSend(v8, "popViewControllerAnimated:", 1);

    }
    else
    {
      objc_msgSend(WeakRetained, "pendingMediaInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(WeakRetained, "setPendingMediaInfo:", 0);
        objc_msgSend(WeakRetained, "setPendingMediaInfoDirection:", 0);
        objc_msgSend(WeakRetained, "setPendingAnimated:", 0);
        v14 = *(void **)(a1 + 40);
        v15 = CFSTR("Set media info");
      }
      else
      {
        v14 = *(void **)(a1 + 40);
        v15 = CFSTR("Show image");
      }
      objc_msgSend(v14, "postEvent:withContext:userInfo:", v15, 0, v3);
    }

  }
  else
  {
    objc_msgSend(WeakRetained, "pendingMediaInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(WeakRetained, "setPendingMediaInfo:", 0);
      objc_msgSend(WeakRetained, "setPendingMediaInfoDirection:", 0);
      objc_msgSend(WeakRetained, "setPendingAnimated:", 0);
      v11 = *(void **)(a1 + 40);
      v12 = CFSTR("Set media info");
    }
    else
    {
      v11 = *(void **)(a1 + 40);
      v12 = CFSTR("Show image");
    }
    objc_msgSend(v11, "postEvent:withContext:userInfo:", v12, 0, v3);
  }

}

const __CFString *__61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_5_292(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  id WeakRetained;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v7 = a2;
  v8 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setState:", 1);
  objc_msgSend(WeakRetained, "_cleanUpEverythingPlaybackRelated");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_6_293;
  v13[3] = &unk_1E9F98FD8;
  v14 = v7;
  v15 = v8;
  v10 = v8;
  v11 = v7;
  objc_msgSend(v11, "executeBlockAfterCurrentStateTransition:", v13);

  return CFSTR("Finished playback");
}

uint64_t __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_6_293(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "postEvent:withContext:userInfo:", CFSTR("Show image"), 0, *(_QWORD *)(a1 + 40));
}

__CFString *__61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_7_294(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  __CFString *v7;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "currentMediaInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tvpPlaylist");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v3, "postEvent:", CFSTR("Load playback"));
    objc_msgSend(v3, "currentState");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = CFSTR("Showing playback in foreground");
  }

  return v7;
}

const __CFString *__61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_8_295(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id *v19;
  id WeakRetained;
  void *v21;
  id v22;
  _QWORD v24[4];
  id v25;
  id v26;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("AnimatedKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("AnimatedKey"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "BOOLValue");

  }
  else
  {
    v15 = 1;
  }

  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("ShowsPlaybackControlsKey"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("ShowsPlaybackControlsKey"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "BOOLValue");

  }
  else
  {
    v18 = 1;
  }

  v19 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "player");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setPreventsSleepDuringVideoPlayback:", 1);

  objc_msgSend(WeakRetained, "setShowsVideoControls:", v18);
  objc_msgSend(WeakRetained, "_updateCurrentPlaybackViewFrameForPlaybackInBackground:animated:", 0, v15);
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_9_296;
  v24[3] = &unk_1E9F9A938;
  objc_copyWeak(&v26, v19);
  v22 = v12;
  v25 = v22;
  objc_msgSend(v9, "executeBlockAfterCurrentStateTransition:", v24);

  objc_destroyWeak(&v26);
  return CFSTR("Showing playback in foreground");
}

void __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_9_296(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id v21;
  const __CFString *v22;
  uint64_t v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_updatePlayerMuteStateForBackgroundPlaybackWithReason:", CFSTR("VUIBackgroundMediaControllerPlaybackMuteReasonForegrounded"));
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("IsFullScreenPlayerKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("IsFullScreenPlayerKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue");

  }
  else
  {
    v6 = 0;
  }

  VUIDefaultLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v25 = WeakRetained;
    v26 = 2112;
    v27 = v8;
    v28 = 1024;
    v29 = v6;
    _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) handle showPlaybackInForeground: isFullScreenPlayer = %d", buf, 0x1Cu);

  }
  if (v6)
  {
    objc_msgSend(WeakRetained, "avPlayerViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "layoutIfNeeded");

    VUIDefaultLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(WeakRetained, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v25 = WeakRetained;
      v26 = 2112;
      v27 = v12;
      _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) handle showPlaybackInForeground: enterFullScreenWithCompletion", buf, 0x16u);

    }
    objc_msgSend(WeakRetained, "avPlayerViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_297;
    v19 = &unk_1E9F9B6C0;
    v20 = WeakRetained;
    objc_copyWeak(&v21, v2);
    objc_msgSend(v13, "enterFullScreenWithCompletion:", &v16);

    objc_destroyWeak(&v21);
  }
  v22 = CFSTR("VUIBackgroundMediaControllerIsForegroundedKey");
  v23 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1, v16, v17, v18, v19, v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "postNotificationName:object:userInfo:", CFSTR("VUIBackgroundMediaControllerForegroundStateDidChangeNotification"), WeakRetained, v14);

}

void __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_297(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  id WeakRetained;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  VUIDefaultLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 134218242;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1D96EE000, v2, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) playback did enterFullScreen", (uint8_t *)&v6, 0x16u);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setDidAVPlayerControllerEnterFullscreen:", 1);

}

__CFString *__61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_298(uint64_t a1, void *a2)
{
  __CFString *v3;
  id WeakRetained;
  uint64_t v5;
  void *v6;
  void *v7;

  objc_msgSend(a2, "currentState");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "player");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(WeakRetained, "avPlayerViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {

      v3 = CFSTR("Showing playback in background");
    }
  }

  return v3;
}

id __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_2_299(uint64_t a1, void *a2)
{
  void *v3;
  id WeakRetained;

  objc_msgSend(a2, "currentState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setShowsVideoControls:", 0);

  return v3;
}

const __CFString *__61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_3_300(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id *v16;
  id WeakRetained;
  void *v18;
  _QWORD v20[4];
  id v21;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("AnimatedKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("AnimatedKey"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "BOOLValue");

  }
  else
  {
    v15 = 1;
  }

  v16 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "player");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setPreventsSleepDuringVideoPlayback:", 0);

  objc_msgSend(WeakRetained, "setShowsVideoControls:", 0);
  objc_msgSend(WeakRetained, "_updateCurrentPlaybackViewFrameForPlaybackInBackground:animated:", 1, v15);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_4_301;
  v20[3] = &unk_1E9F99C98;
  objc_copyWeak(&v21, v16);
  objc_msgSend(v9, "executeBlockAfterCurrentStateTransition:", v20);
  objc_destroyWeak(&v21);

  return CFSTR("Showing playback in background");
}

void __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_4_301(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updatePlayerMuteStateForBackgroundPlaybackWithReason:", CFSTR("VUIBackgroundMediaControllerPlaybackMuteReasonBackgrounded"));
  v4 = CFSTR("VUIBackgroundMediaControllerIsForegroundedKey");
  v5[0] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("VUIBackgroundMediaControllerForegroundStateDidChangeNotification"), WeakRetained, v2);

}

id __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_5_302(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v16;
  id v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  __CFString *v21;
  __int16 v22;
  __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "player");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "state");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DB1958], "playing");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v7)
  {
    objc_msgSend(WeakRetained, "_postWillStartPlaybackNotification:", 0);
    objc_msgSend(v3, "currentState");
    v8 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if ((-[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("Showing playback in background")) & 1) == 0)
    {
      v9 = v8;
      if ((-[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("Showing playback in foreground")) & 1) == 0)
      {
        if (objc_msgSend(WeakRetained, "isBackgrounded"))
          v10 = CFSTR("Showing playback in background");
        else
          v10 = CFSTR("Showing playback in foreground");
        v9 = v10;

      }
    }
    VUIDefaultLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(WeakRetained, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 134218754;
      v17 = WeakRetained;
      v18 = 2112;
      v19 = v12;
      v20 = 2112;
      v21 = v8;
      v22 = 2112;
      v23 = v9;
      _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) configure audioSession before playing video, current: %@, future: %@", (uint8_t *)&v16, 0x2Au);

    }
    objc_msgSend(WeakRetained, "_configureAudioSessionForState:", v9);
    objc_msgSend(WeakRetained, "player");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "videoAudioRampDuration");
    objc_msgSend(v13, "playWithVolumeRampDuration:");

    if (objc_msgSend(WeakRetained, "prefetchesVideoFrame"))
      objc_msgSend(WeakRetained, "_updateVideoPlayerLegibleContentInsets:", 1);

  }
  objc_msgSend(v3, "currentState");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

const __CFString *__61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_303(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_2_304;
  v14[3] = &unk_1E9F99C98;
  objc_copyWeak(&v15, (id *)(a1 + 32));
  objc_msgSend(v9, "executeBlockAfterCurrentStateTransition:", v14);
  objc_destroyWeak(&v15);

  return CFSTR("Showing playback in background");
}

void __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_2_304(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "player");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "state");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DB1958], "playing");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 != v3)
  {
    objc_msgSend(WeakRetained, "player");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "videoAudioRampDuration");
    objc_msgSend(v4, "playWithVolumeRampDuration:");

  }
}

__CFString *__61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_3_305(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id WeakRetained;
  id v14;
  NSObject *v15;
  id v16;
  void *v17;
  __CFString *v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  id v24;
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_4_306;
  v23 = &unk_1E9F9A938;
  objc_copyWeak(&v25, (id *)(a1 + 32));
  v14 = v9;
  v24 = v14;
  objc_msgSend(v14, "executeBlockAfterCurrentStateTransition:", &v20);
  if (objc_msgSend(WeakRetained, "prefetchesVideoFrame", v20, v21, v22, v23))
  {
    VUIDefaultLogObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(WeakRetained, "name");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "currentState");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v27 = WeakRetained;
      v28 = 2112;
      v29 = v16;
      v30 = 2112;
      v31 = v17;
      _os_log_impl(&dword_1D96EE000, v15, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) remaining at %@ for paused state", buf, 0x20u);

    }
    objc_msgSend(v14, "currentState");
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = CFSTR("waiting for timeout while paused");
  }

  objc_destroyWeak(&v25);
  return v18;
}

void __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_4_306(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DB1958], "paused");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 != v6)
  {
    objc_msgSend(WeakRetained, "player");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pause");

    if ((objc_msgSend(WeakRetained, "prefetchesVideoFrame") & 1) == 0)
    {
      objc_msgSend(WeakRetained, "pauseStateTimeoutTimer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "invalidate");

      objc_msgSend(WeakRetained, "setPauseStateTimeoutTimer:", 0);
      v9 = (void *)MEMORY[0x1E0C99E88];
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_5_307;
      v11[3] = &unk_1E9FA5500;
      objc_copyWeak(&v13, v2);
      v11[4] = WeakRetained;
      v12 = *(id *)(a1 + 32);
      objc_msgSend(v9, "scheduledTimerWithTimeInterval:repeats:block:", 0, v11, 480.0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "setPauseStateTimeoutTimer:", v10);

      objc_destroyWeak(&v13);
    }
  }

}

void __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_5_307(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  VUIDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "currentState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 134218498;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) timedout while waiting in pause state, current state %@", (uint8_t *)&v9, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 40), "currentState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("waiting for timeout while paused"));

  if (v8)
  {
    objc_msgSend(WeakRetained, "setAutomaticPlaybackStop:", 1);
    objc_msgSend(WeakRetained, "setVpafPlaybackStopReason:", 4);
    objc_msgSend(*(id *)(a1 + 40), "postEvent:", CFSTR("Stop"));
  }

}

const __CFString *__61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_308(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v7 = a2;
  v8 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "player");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pause");

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_2_309;
  v14[3] = &unk_1E9F98FD8;
  v15 = v7;
  v16 = v8;
  v11 = v8;
  v12 = v7;
  objc_msgSend(v12, "executeBlockAfterCurrentStateTransition:", v14);

  return CFSTR("Waiting to stop after showing image");
}

uint64_t __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_2_309(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "postEvent:withContext:userInfo:", CFSTR("Show image"), 0, *(_QWORD *)(a1 + 40));
}

__CFString *__61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_3_310(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  id WeakRetained;
  __CFString *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t *v22;
  const __CFString **v23;
  const __CFString *v25;
  uint64_t v26;
  const __CFString *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v7, "currentState");
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v8
    && (objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PlaybackStopReasonKey")),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        v11))
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PlaybackStopReasonKey"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "unsignedIntValue");

  }
  else
  {
    v13 = 0;
  }
  v14 = objc_msgSend(WeakRetained, "playbackStopDelayReasons");
  if ((v14 & v13) > 4 || ((1 << (v14 & v13)) & 0x16) == 0)
  {
    objc_msgSend(WeakRetained, "player");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(WeakRetained, "player");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "state");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DB1958], "stopped");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18 != v19)
      {
        objc_msgSend(WeakRetained, "setAutomaticPlaybackStop:", v13 == 0);
        objc_msgSend(WeakRetained, "_postWillStopPlaybackNotification");
        objc_msgSend(WeakRetained, "player");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stop");
LABEL_16:

        goto LABEL_17;
      }
      v27 = CFSTR("AnimatedKey");
      v28[0] = MEMORY[0x1E0C9AAB0];
      v21 = (void *)MEMORY[0x1E0C99D80];
      v22 = v28;
      v23 = &v27;
    }
    else
    {
      v25 = CFSTR("AnimatedKey");
      v26 = MEMORY[0x1E0C9AAB0];
      v21 = (void *)MEMORY[0x1E0C99D80];
      v22 = &v26;
      v23 = &v25;
    }
    objc_msgSend(v21, "dictionaryWithObjects:forKeys:count:", v22, v23, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postEvent:withContext:userInfo:", CFSTR("Finished playback"), 0, v20);
    goto LABEL_16;
  }

  objc_msgSend(WeakRetained, "playbackStopDelay");
  objc_msgSend(WeakRetained, "performSelector:withObject:afterDelay:", sel_stop, 0);
  v10 = CFSTR("waiting to stop playback");
LABEL_17:

  return v10;
}

id __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_4_311(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];
  uint8_t buf[4];
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "currentMediaInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "currentMediaInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tvpPlaylist");
    v8 = objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      if (objc_msgSend(WeakRetained, "isBackgrounded"))
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      }
      else
      {
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_5_312;
        v12[3] = &unk_1E9F98DF0;
        v12[4] = WeakRetained;
        objc_msgSend(v4, "executeBlockAfterCurrentStateTransition:", v12);
      }
      goto LABEL_9;
    }
  }
  else
  {

  }
  VUIDefaultLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v14 = WeakRetained;
    v15 = 2112;
    v16 = v9;
    _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) No playlist has been set; ignoring replay event",
      buf,
      0x16u);

  }
LABEL_9:

  objc_msgSend(v4, "currentState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_5_312(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "stateMachine");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "postEvent:", CFSTR("Load playback"));

}

__CFString *__61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_313(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  __CFString *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v3, "currentState");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "currentMediaInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "currentMediaInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tvpPlaylist");
    v8 = objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      if (objc_msgSend(WeakRetained, "isBackgrounded"))
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      }
      else
      {

        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_2_314;
        v11[3] = &unk_1E9F98E68;
        v12 = *(id *)(a1 + 40);
        objc_msgSend(v3, "executeBlockAfterCurrentStateTransition:", v11);

        v5 = CFSTR("Waiting for player to start loading");
      }
      goto LABEL_9;
    }
  }
  else
  {

  }
  VUIDefaultLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v14 = WeakRetained;
    v15 = 2112;
    v16 = v9;
    _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) No playlist has been set; ignoring replay event",
      buf,
      0x16u);

  }
LABEL_9:

  return v5;
}

uint64_t __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_2_314(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

const __CFString *__61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_315(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "currentMediaInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "currentMediaInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tvpPlaylist");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      if (objc_msgSend(WeakRetained, "isBackgrounded"))
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      goto LABEL_9;
    }
  }
  else
  {

  }
  VUIDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 134218242;
    v10 = WeakRetained;
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) No playlist has been set; ignoring replay event",
      (uint8_t *)&v9,
      0x16u);

  }
  v5 = 0;
LABEL_9:

  return CFSTR("Showing image");
}

const __CFString *__61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_316(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id *v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id v21;

  v7 = (id *)(a1 + 40);
  v8 = a5;
  v9 = a2;
  WeakRetained = objc_loadWeakRetained(v7);
  objc_msgSend(v8, "objectForKey:", CFSTR("AVPlayerViewControllerKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setAvPlayerViewController:", v11);
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PlayerKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "setPlayer:", v12);
  objc_msgSend(WeakRetained, "player");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setPreventsSleepDuringVideoPlayback:", 0);

  objc_msgSend(WeakRetained, "setShowsVideoControls:", 0);
  objc_msgSend(WeakRetained, "transitionToForeground:animated:", 0, 0);
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_2_317;
  v19 = &unk_1E9F99420;
  v14 = *(id *)(a1 + 32);
  v20 = WeakRetained;
  v21 = v14;
  objc_msgSend(v9, "executeBlockAfterCurrentStateTransition:", &v16);

  if (objc_msgSend(WeakRetained, "prefetchesVideoFrame", v16, v17, v18, v19))
  {
    objc_msgSend(WeakRetained, "_prefetchNextVideo");
    objc_msgSend(WeakRetained, "_populatePlayerWithMediaItemsIfNeeded:", v12);
  }

  return CFSTR("Showing playback in background");
}

void __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_2_317(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "player");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, uint64_t))(v1 + 16))(v1, v2, 1);

}

const __CFString *__61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_3_318(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id *v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[5];
  id v17;

  v7 = (id *)(a1 + 40);
  v8 = a5;
  v9 = a2;
  WeakRetained = objc_loadWeakRetained(v7);
  objc_msgSend(WeakRetained, "_cleanUpEverythingPlaybackRelated");
  objc_msgSend(v8, "objectForKey:", CFSTR("AVPlayerViewControllerKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setAvPlayerViewController:", v11);
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PlayerKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "player");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setPreventsSleepDuringVideoPlayback:", 0);

  objc_msgSend(WeakRetained, "setShowsVideoControls:", 0);
  objc_msgSend(WeakRetained, "transitionToForeground:animated:", 0, 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_4_319;
  v16[3] = &unk_1E9F98FD8;
  v16[4] = WeakRetained;
  v17 = v12;
  v14 = v12;
  objc_msgSend(v9, "executeBlockAfterCurrentStateTransition:", v16);

  return CFSTR("Showing playback in background");
}

uint64_t __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_4_319(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_prefetchNextVideo");
  return objc_msgSend(*(id *)(a1 + 32), "_populatePlayerWithMediaItemsIfNeeded:", *(_QWORD *)(a1 + 40));
}

const __CFString *__61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_5_320(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_6_321;
  v14[3] = &unk_1E9F99C98;
  objc_copyWeak(&v15, (id *)(a1 + 32));
  objc_msgSend(v9, "executeBlockAfterCurrentStateTransition:", v14);
  objc_destroyWeak(&v15);

  return CFSTR("Showing playback in foreground");
}

void __61__VUIBackgroundMediaController__registerStateMachineHandlers__block_invoke_6_321(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!objc_msgSend(WeakRetained, "shouldStopPlayerWhenExitingFullScreen"))
  {
    objc_msgSend(WeakRetained, "player");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "state");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DB1958], "playing");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v4 == (void *)v5)
    {

    }
    else
    {
      v6 = (void *)v5;
      objc_msgSend(MEMORY[0x1E0DB1958], "loading");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4 != v7)
      {
        objc_msgSend(WeakRetained, "stop");
        v2 = 1;
LABEL_8:

        goto LABEL_9;
      }
    }
    objc_msgSend(WeakRetained, "transitionToForeground:animated:", 0, 1);
    v2 = 0;
    goto LABEL_8;
  }
  objc_msgSend(WeakRetained, "stop");
  v2 = 1;
LABEL_9:
  objc_msgSend(WeakRetained, "setDidAVPlayerControllerEnterFullscreen:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = CFSTR("VUIBackgroundMediaControllerInfoHasVideoStopped");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("VUIBackgroundMediaControllerDidEndFullscreenPresentationNotification"), WeakRetained, v10);

}

- (void)playerViewController:(id)a3 willEndFullScreenPresentationWithAnimationCoordinator:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  VUIBackgroundMediaController *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  VUIDefaultLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[VUIBackgroundMediaController name](self, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v15 = self;
    v16 = 2112;
    v17 = v9;
    _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) playerViewController willEndFullScreenPresentationWithAnimationCoordinator", buf, 0x16u);

  }
  objc_initWeak((id *)buf, self);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __107__VUIBackgroundMediaController_playerViewController_willEndFullScreenPresentationWithAnimationCoordinator___block_invoke_2;
  v11[3] = &unk_1E9F9CFA0;
  objc_copyWeak(&v13, (id *)buf);
  v10 = v6;
  v12 = v10;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", &__block_literal_global_325, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);

}

void __107__VUIBackgroundMediaController_playerViewController_willEndFullScreenPresentationWithAnimationCoordinator___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id WeakRetained;

  if ((objc_msgSend(a2, "isCancelled") & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "stateMachine");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postEvent:withContext:", CFSTR("AvPlayerViewController did exit fullscreen presentation"), *(_QWORD *)(a1 + 32));

  }
}

- (void)playerViewController:(id)a3 willTransitionToVisibilityOfPlaybackControls:(BOOL)a4 withAnimationCoordinator:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9 = CFSTR("VUIBackgroundMediaControllerControlVisibilityKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("VUIBackgroundMediaControllerControlVisibilityChangedNotification"), self, v7);

}

- (void)playerViewControllerDidStartPictureInPicture:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  VUIBackgroundMediaController *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  VUIDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[VUIBackgroundMediaController name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 134218242;
    v17 = self;
    v18 = 2112;
    v19 = v6;
    _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) did start picture in picture", (uint8_t *)&v16, 0x16u);

  }
  objc_msgSend(v4, "presentedViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIBackgroundMediaController player](self, "player");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "vui_setObjectIfNotNil:forKey:", v9, CFSTR("VUIBackgroundMediaControllerPlayerKey"));

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("VUIBackgroundMediaControllerDidEnterPIPNotification"), self, v11);

  if (-[VUIBackgroundMediaController prefetchesVideoFrame](self, "prefetchesVideoFrame"))
  {
    -[VUIBackgroundMediaController player](self, "player");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "playlist");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[VUIBackgroundMediaController mediaInfoFetchController](self, "mediaInfoFetchController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "playlist");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "populatePlaylistWithMediaItems:atIndex:", v15, -[VUIBackgroundMediaController mediaInfoIndex](self, "mediaInfoIndex"));

      objc_msgSend(v12, "setMediaItemEndAction:", 0);
      -[VUIBackgroundMediaController _cleanupPrefetchPlayback](self, "_cleanupPrefetchPlayback");
    }

  }
}

- (void)playerViewController:(id)a3 failedToStartPictureInPictureWithError:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  VUIBackgroundMediaController *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  VUIDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[VUIBackgroundMediaController name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 134218498;
    v10 = self;
    v11 = 2112;
    v12 = v7;
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) failed to start picture in picture with error %@", (uint8_t *)&v9, 0x20u);

  }
  +[VUIPlaybackManager sharedInstance](VUIPlaybackManager, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundMediaControllerForPIP:", 0);

}

- (void)playerViewControllerDidStopPictureInPicture:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  VUIBackgroundMediaController *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  VUIDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[VUIBackgroundMediaController name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIBackgroundMediaController player](self, "player");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "state");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 134218498;
    v19 = self;
    v20 = 2112;
    v21 = v5;
    v22 = 2112;
    v23 = v7;
    _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) did stop picture in picture %@", (uint8_t *)&v18, 0x20u);

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIBackgroundMediaController player](self, "player");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "vui_setObjectIfNotNil:forKey:", v9, CFSTR("VUIBackgroundMediaControllerPlayerKey"));

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("VUIBackgroundMediaControllerDidStopPIPNotification"), self, v11);

  if (-[VUIBackgroundMediaController prefetchesVideoFrame](self, "prefetchesVideoFrame"))
  {
    -[VUIBackgroundMediaController player](self, "player");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "playlist");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v12, "playlist");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "activeListIndex");

      -[VUIBackgroundMediaController mediaInfoFetchController](self, "mediaInfoFetchController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "playlist");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "removePopulatedMediaItems:atIndex:", v17, v15);

      objc_msgSend(v12, "setMediaItemEndAction:", 1);
    }

  }
  -[VUIBackgroundMediaController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__cleanupPIPPlayback, 0, 1.0);

}

- (void)playerViewController:(id)a3 restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:(id)a4
{
  void (**v5)(id, _QWORD);
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  void (**v15)(id, _QWORD);
  uint8_t buf[4];
  VUIBackgroundMediaController *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, _QWORD))a4;
  VUIDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[VUIBackgroundMediaController name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIBackgroundMediaController player](self, "player");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "state");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v17 = self;
    v18 = 2112;
    v19 = v7;
    v20 = 2112;
    v21 = v9;
    _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "VUIBackgroundMediaController::(%p: %@) restore picture in picture %@", buf, 0x20u);

  }
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__cleanupPIPPlayback, 0);
  -[VUIBackgroundMediaController player](self, "player");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "state");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DB1958], "stopped");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 == v12)
  {
    -[VUIBackgroundMediaController _cleanupPIPPlayback](self, "_cleanupPIPPlayback");
    v5[2](v5, 0);
  }
  else
  {
    +[VUIPlaybackManager sharedInstance](VUIPlaybackManager, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __118__VUIBackgroundMediaController_playerViewController_restoreUserInterfaceForPictureInPictureStopWithCompletionHandler___block_invoke;
    v14[3] = &unk_1E9F98E68;
    v15 = v5;
    objc_msgSend(v13, "restoreBackgroundMediaControllerFromPIP:", v14);

  }
}

uint64_t __118__VUIBackgroundMediaController_playerViewController_restoreUserInterfaceForPictureInPictureStopWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_cleanupPIPPlayback
{
  id v2;

  +[VUIPlaybackManager sharedInstance](VUIPlaybackManager, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundMediaControllerForPIP:", 0);

}

- (void)setDidAVPlayerControllerEnterFullscreen:(BOOL)a3
{
  self->_didAVPlayerControllerEnterFullscreen = a3;
}

- (void)setForceAutoPlay:(BOOL)a3
{
  self->_forceAutoPlay = a3;
}

- (BOOL)autoPlayInSharePlay
{
  return self->_autoPlayInSharePlay;
}

- (void)setAutoPlayInSharePlay:(BOOL)a3
{
  self->_autoPlayInSharePlay = a3;
}

- (void)setPrefetchesVideoFrame:(BOOL)a3
{
  self->_prefetchesVideoFrame = a3;
}

- (double)videoAudioRampDuration
{
  return self->_videoAudioRampDuration;
}

- (void)setVideoAudioRampDuration:(double)a3
{
  self->_videoAudioRampDuration = a3;
}

- (BOOL)recordPausedMediaEventAsStop
{
  return self->_recordPausedMediaEventAsStop;
}

- (void)setRecordPausedMediaEventAsStop:(BOOL)a3
{
  self->_recordPausedMediaEventAsStop = a3;
}

- (BOOL)isVideoFrameFallbackEnabled
{
  return self->_videoFrameFallbackEnabled;
}

- (void)setVideoFrameFallbackEnabled:(BOOL)a3
{
  self->_videoFrameFallbackEnabled = a3;
}

- (void)setSupportsMediaSharing:(BOOL)a3
{
  self->_supportsMediaSharing = a3;
}

- (BOOL)stopsPlaybackWhenInactive
{
  return self->_stopsPlaybackWhenInactive;
}

- (void)setStopsPlaybackWhenInactive:(BOOL)a3
{
  self->_stopsPlaybackWhenInactive = a3;
}

- (void)setLoadsPlayerWithFullscreenPlayback:(BOOL)a3
{
  self->_loadsPlayerWithFullscreenPlayback = a3;
}

- (BOOL)shouldStopPlayerWhenViewDisappears
{
  return self->_stopPlayerWhenViewDisappears;
}

- (BOOL)shouldStopPlayerWhenExitingFullScreen
{
  return self->_stopPlayerWhenExitingFullScreen;
}

- (BOOL)clearPreviousImageBeforeLoading
{
  return self->_clearPreviousImageBeforeLoading;
}

- (void)setClearPreviousImageBeforeLoading:(BOOL)a3
{
  self->_clearPreviousImageBeforeLoading = a3;
}

- (BOOL)animateVideoChange
{
  return self->_animateVideoChange;
}

- (void)setAnimateVideoChange:(BOOL)a3
{
  self->_animateVideoChange = a3;
}

- (BOOL)popWhenPlayerStops
{
  return self->_popWhenPlayerStops;
}

- (void)setPopWhenPlayerStops:(BOOL)a3
{
  self->_popWhenPlayerStops = a3;
}

- (BOOL)prefersAudioOverPictureInPicture
{
  return self->_prefersAudioOverPictureInPicture;
}

- (void)setPrefersAudioOverPictureInPicture:(BOOL)a3
{
  self->_prefersAudioOverPictureInPicture = a3;
}

- (BOOL)shouldUseForegroundAudioSessionInBackgroundMode
{
  return self->_useForegroundAudioSessionInBackgroundMode;
}

- (BOOL)shouldShowFullScreenButton
{
  return self->_shouldShowFullScreenButton;
}

- (float)backgroundVolume
{
  return self->_backgroundVolume;
}

- (float)foregroundVolume
{
  return self->_foregroundVolume;
}

- (double)volumeTransitionAnimationDuration
{
  return self->_volumeTransitionAnimationDuration;
}

- (unint64_t)numberOfVolumeIncrements
{
  return self->_numberOfVolumeIncrements;
}

- (BOOL)shouldStopWhenAnotherMediaControllerStarts
{
  return self->_stopWhenAnotherMediaControllerStarts;
}

- (void)setStopWhenAnotherMediaControllerStarts:(BOOL)a3
{
  self->_stopWhenAnotherMediaControllerStarts = a3;
}

- (unint64_t)playbackStopDelayReasons
{
  return self->_playbackStopDelayReasons;
}

- (void)setPlaybackStopDelayReasons:(unint64_t)a3
{
  self->_playbackStopDelayReasons = a3;
}

- (double)playbackStopDelay
{
  return self->_playbackStopDelay;
}

- (void)setPlaybackStopDelay:(double)a3
{
  self->_playbackStopDelay = a3;
}

- (double)playbackStartDelay
{
  return self->_playbackStartDelay;
}

- (unint64_t)videoSwappingAnimationType
{
  return self->_videoSwappingAnimationType;
}

- (BOOL)shouldShowImageAndStopAfterPausingAtEnd
{
  return self->_shouldShowImageAndStopAfterPausingAtEnd;
}

- (void)setImageTransitionAnimationDuration:(double)a3
{
  self->_imageTransitionAnimationDuration = a3;
}

- (double)imageVideoTransitionAnimationDuration
{
  return self->_imageVideoTransitionAnimationDuration;
}

- (void)setAllowsPictureInPicturePlayback:(BOOL)a3
{
  self->_allowsPictureInPicturePlayback = a3;
}

- (BOOL)keepVideoGravityUnchangedByVideoControlsVisibility
{
  return self->_keepVideoGravityUnchangedByVideoControlsVisibility;
}

- (void)setKeepVideoGravityUnchangedByVideoControlsVisibility:(BOOL)a3
{
  self->_keepVideoGravityUnchangedByVideoControlsVisibility = a3;
}

- (BOOL)shouldDisableSubtitle
{
  return self->_shouldDisableSubtitle;
}

- (void)setShouldDisableSubtitle:(BOOL)a3
{
  self->_shouldDisableSubtitle = a3;
}

- (BOOL)disableSupplementalSubtitle
{
  return self->_disableSupplementalSubtitle;
}

- (void)setDisableSupplementalSubtitle:(BOOL)a3
{
  self->_disableSupplementalSubtitle = a3;
}

- (BOOL)isAutomaticPlaybackStart
{
  return self->_automaticPlaybackStart;
}

- (void)setAutomaticPlaybackStart:(BOOL)a3
{
  self->_automaticPlaybackStart = a3;
}

- (BOOL)isPreloadPlaybackEnabled
{
  return self->_preloadPlaybackEnabled;
}

- (NSString)playbackInitiatorForRTCReporting
{
  return self->_playbackInitiatorForRTCReporting;
}

- (void)setPlaybackInitiatorForRTCReporting:(id)a3
{
  objc_storeStrong((id *)&self->_playbackInitiatorForRTCReporting, a3);
}

- (void)setAlphaImageProxy:(id)a3
{
  objc_storeStrong((id *)&self->_alphaImageProxy, a3);
}

- (NSDate)playbackLoadingStartDate
{
  return self->_playbackLoadingStartDate;
}

- (NSDate)playbackStartDate
{
  return self->_playbackStartDate;
}

- (void)setPlaybackStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_playbackStartDate, a3);
}

- (void)setPlaybackLoadingTimer:(id)a3
{
  objc_storeWeak((id *)&self->_playbackLoadingTimer, a3);
}

- (void)setPlaybackDelayTimer:(id)a3
{
  objc_storeWeak((id *)&self->_playbackDelayTimer, a3);
}

- (VUIMediaInfo)pendingMediaInfo
{
  return self->_pendingMediaInfo;
}

- (void)setPendingMediaInfo:(id)a3
{
  objc_storeStrong((id *)&self->_pendingMediaInfo, a3);
}

- (unint64_t)pendingMediaInfoDirection
{
  return self->_pendingMediaInfoDirection;
}

- (void)setPendingMediaInfoDirection:(unint64_t)a3
{
  self->_pendingMediaInfoDirection = a3;
}

- (NSNumber)pendingAnimated
{
  return self->_pendingAnimated;
}

- (void)setPendingAnimated:(id)a3
{
  objc_storeStrong((id *)&self->_pendingAnimated, a3);
}

- (void)setStateMachine:(id)a3
{
  objc_storeStrong((id *)&self->_stateMachine, a3);
}

- (void)setMediaInfoFetchController:(id)a3
{
  objc_storeStrong((id *)&self->_mediaInfoFetchController, a3);
}

- (unint64_t)imageAnimationOptions
{
  return self->_imageAnimationOptions;
}

- (void)setImageAnimationOptions:(unint64_t)a3
{
  self->_imageAnimationOptions = a3;
}

- (double)imageAnimationDuration
{
  return self->_imageAnimationDuration;
}

- (void)setImageAnimationDuration:(double)a3
{
  self->_imageAnimationDuration = a3;
}

- (double)imageTransitionInterval
{
  return self->_imageTransitionInterval;
}

- (void)setImageTransitionInterval:(double)a3
{
  self->_imageTransitionInterval = a3;
}

- (BOOL)shouldAnimateOverlayView
{
  return self->_shouldAnimateOverlayView;
}

- (void)setShouldAnimateOverlayView:(BOOL)a3
{
  self->_shouldAnimateOverlayView = a3;
}

- (NSTimer)pauseStateTimeoutTimer
{
  return (NSTimer *)objc_loadWeakRetained((id *)&self->_pauseStateTimeoutTimer);
}

- (void)setPauseStateTimeoutTimer:(id)a3
{
  objc_storeWeak((id *)&self->_pauseStateTimeoutTimer, a3);
}

- (unint64_t)vpafPlaybackStartReason
{
  return self->_vpafPlaybackStartReason;
}

- (BOOL)isAutomaticPlaybackStop
{
  return self->_automaticPlaybackStop;
}

- (void)setAutomaticPlaybackStop:(BOOL)a3
{
  self->_automaticPlaybackStop = a3;
}

- (unint64_t)vpafPlaybackStopReason
{
  return self->_vpafPlaybackStopReason;
}

- (BOOL)shouldPlayAfterAppBecomesActive
{
  return self->_shouldPlayAfterAppBecomesActive;
}

- (void)setShouldPlayAfterAppBecomesActive:(BOOL)a3
{
  self->_shouldPlayAfterAppBecomesActive = a3;
}

- (BOOL)shouldPlayAfterFullplaybackUIDidEnd
{
  return self->_shouldPlayAfterFullplaybackUIDidEnd;
}

- (void)setShouldPlayAfterFullplaybackUIDidEnd:(BOOL)a3
{
  self->_shouldPlayAfterFullplaybackUIDidEnd = a3;
}

- (BOOL)hasViewAppeared
{
  return self->_hasViewAppeared;
}

- (BOOL)observingPictureInPictureActive
{
  return self->_observingPictureInPictureActive;
}

- (void)setObservingPictureInPictureActive:(BOOL)a3
{
  self->_observingPictureInPictureActive = a3;
}

- (void)setTitleForLogging:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1336);
}

- (unint64_t)deactivationReasons
{
  return self->_deactivationReasons;
}

- (void)setDeactivationReasons:(unint64_t)a3
{
  self->_deactivationReasons = a3;
}

- (NSNumber)elapsedTimeWhenStopped
{
  return self->_elapsedTimeWhenStopped;
}

- (void)setElapsedTimeWhenStopped:(id)a3
{
  objc_storeStrong((id *)&self->_elapsedTimeWhenStopped, a3);
}

- (float)fullscreenTransitionVolumeAnimationChanges
{
  return self->_fullscreenTransitionVolumeAnimationChanges;
}

- (void)setFullscreenTransitionVolumeAnimationChanges:(float)a3
{
  self->_fullscreenTransitionVolumeAnimationChanges = a3;
}

- (NSLayoutConstraint)proxyImageWidthConstraint
{
  return self->_proxyImageWidthConstraint;
}

- (NSLayoutConstraint)proxyImageHeightConstraint
{
  return self->_proxyImageHeightConstraint;
}

- (NSLayoutConstraint)proxyImageCenterXConstraint
{
  return self->_proxyImageCenterXConstraint;
}

- (NSLayoutConstraint)proxyImageCenterYConstraint
{
  return self->_proxyImageCenterYConstraint;
}

- (VUIPlayer)activePIPingPlayer
{
  return self->_activePIPingPlayer;
}

- (void)setPrefetchPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_prefetchPlayer, a3);
}

- (TVPPlayer)rampDownPlayer
{
  return self->_rampDownPlayer;
}

- (void)setRampDownPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_rampDownPlayer, a3);
}

- (void)setPreferredAudioLanguageCode:(id)a3
{
  objc_storeStrong((id *)&self->_preferredAudioLanguageCode, a3);
}

- (void)setPrefersAudioDescriptions:(id)a3
{
  objc_storeStrong((id *)&self->_prefersAudioDescriptions, a3);
}

- (AVPlayerViewController)prefetchPlayerViewController
{
  return self->_prefetchPlayerViewController;
}

- (void)setPrefetchPlayerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_prefetchPlayerViewController, a3);
}

- (unint64_t)lastMediaInfoIndex
{
  return self->_lastMediaInfoIndex;
}

- (void)setLastMediaInfoIndex:(unint64_t)a3
{
  self->_lastMediaInfoIndex = a3;
}

- (NSString)lastMediaEventActionType
{
  return self->_lastMediaEventActionType;
}

- (void)setLastMediaEventActionType:(id)a3
{
  objc_storeStrong((id *)&self->_lastMediaEventActionType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastMediaEventActionType, 0);
  objc_storeStrong((id *)&self->_prefetchPlayerViewController, 0);
  objc_storeStrong((id *)&self->_prefersAudioDescriptions, 0);
  objc_storeStrong((id *)&self->_preferredAudioLanguageCode, 0);
  objc_storeStrong((id *)&self->_rampDownPlayer, 0);
  objc_storeStrong((id *)&self->_prefetchPlayer, 0);
  objc_storeStrong((id *)&self->_activePIPingPlayer, 0);
  objc_storeStrong((id *)&self->_proxyImageCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_proxyImageCenterXConstraint, 0);
  objc_storeStrong((id *)&self->_proxyImageHeightConstraint, 0);
  objc_storeStrong((id *)&self->_proxyImageWidthConstraint, 0);
  objc_storeStrong((id *)&self->_elapsedTimeWhenStopped, 0);
  objc_storeStrong((id *)&self->_titleForLogging, 0);
  objc_destroyWeak((id *)&self->_pauseStateTimeoutTimer);
  objc_storeStrong((id *)&self->_secondaryVideoView, 0);
  objc_storeStrong((id *)&self->_mediaInfoFetchController, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_pendingAnimated, 0);
  objc_storeStrong((id *)&self->_pendingMediaInfo, 0);
  objc_destroyWeak((id *)&self->_imageDelayTimer);
  objc_destroyWeak((id *)&self->_playbackDelayTimer);
  objc_destroyWeak((id *)&self->_playbackLoadingTimer);
  objc_storeStrong((id *)&self->_playbackStartDate, 0);
  objc_storeStrong((id *)&self->_playbackLoadingStartDate, 0);
  objc_storeStrong((id *)&self->_playbackContainerController, 0);
  objc_storeStrong((id *)&self->_alphaImageProxy, 0);
  objc_storeStrong((id *)&self->_alphaProxyImageView, 0);
  objc_storeStrong((id *)&self->_playbackInitiatorForRTCReporting, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_videoGravity, 0);
  objc_storeStrong((id *)&self->_avPlayerViewController, 0);
  objc_storeStrong((id *)&self->_proxyImageView, 0);
  objc_storeStrong((id *)&self->_player, 0);
}

void __43__VUIBackgroundMediaController__loadImage___block_invoke_3_cold_1(void *a1, uint64_t *a2, NSObject *a3)
{
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *a2;
  v8 = 134218498;
  v9 = a1;
  v10 = 2112;
  v11 = v6;
  v12 = 2112;
  v13 = v7;
  _os_log_error_impl(&dword_1D96EE000, a3, OS_LOG_TYPE_ERROR, "VUIBackgroundMediaController::(%p: %@) failed to load image proxy with error: [%@]", (uint8_t *)&v8, 0x20u);

}

- (void)_recordBgAutoPlayMediaEventForPlaybackState:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_27();
  OUTLINED_FUNCTION_0_15(&dword_1D96EE000, v2, v3, "VUIBackgroundMediaController::(%p: %@) No media item to record media event", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_9();
}

@end
