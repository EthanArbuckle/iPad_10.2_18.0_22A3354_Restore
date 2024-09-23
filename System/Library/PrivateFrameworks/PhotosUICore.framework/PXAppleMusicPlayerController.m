@implementation PXAppleMusicPlayerController

uint64_t __58___PXAppleMusicPlayerController__handleItemPlaybackDidEnd__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIsAtEnd:", 1);
}

void __62___PXAppleMusicPlayerController__handlePlaybackStateDidChange__block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD v3[4];
  id v4[2];

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "playbackState") == 1)
    v2 = 2;
  else
    v2 = 1;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __62___PXAppleMusicPlayerController__handlePlaybackStateDidChange__block_invoke_2;
  v3[3] = &unk_1E51447A0;
  objc_copyWeak(v4, (id *)(a1 + 40));
  v4[1] = (id)v2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
  objc_destroyWeak(v4);
}

void __62___PXAppleMusicPlayerController__handlePlaybackStateDidChange__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;

  v1 = *(_QWORD *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setPlaybackState:", v1);

}

uint64_t __44___PXAppleMusicPlayerController_setIsAtEnd___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 185) = *(_BYTE *)(a1 + 40);
  return objc_msgSend(*(id *)(a1 + 32), "signalChange:", 2);
}

uint64_t __50___PXAppleMusicPlayerController_setPlaybackState___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 192) = *(_QWORD *)(a1 + 40);
  return objc_msgSend(*(id *)(a1 + 32), "signalChange:", 1);
}

void __78___PXAppleMusicPlayerController__handleDidPrepareToPlayWithExpectation_error___block_invoke(uint64_t a1)
{
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "fulfill");
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_queue_handleDidPrepareToPlayWithError:", *(_QWORD *)(a1 + 40));

}

void __43___PXAppleMusicPlayerController_setVolume___block_invoke(uint64_t a1)
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
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  PLAudioPlaybackGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128);
    NSStringFromSelector(sel_setRelativeVolume_);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543874;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_ERROR, "%{public}@ will have no effect because %@ does not respond to %@", (uint8_t *)&v6, 0x20u);

  }
}

void __68___PXAppleMusicPlayerController_prepareToPlayWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 32);
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(v5);
  v7 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_queue_handlePreparationExpectationFulfilled:success:error:", v7, a2, v6);

}

void __68___PXAppleMusicPlayerController_prepareToPlayWithCompletionHandler___block_invoke_34(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id v5;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v5 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleDidPrepareToPlayWithExpectation:error:", v5, v4);

}

double __39___PXAppleMusicPlayerController_volume__block_invoke(uint64_t a1)
{
  double result;

  result = *(float *)(*(_QWORD *)(a1 + 32) + 136);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

double __49___PXAppleMusicPlayerController_fetchCurrentTime__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  Float64 v4;
  double result;
  CMTime v6;

  if (+[_PXAppleMusicPlayerController canApplyWorkaroundFor80278485](_PXAppleMusicPlayerController, "canApplyWorkaroundFor80278485"))
  {
    +[PXAudioSettings sharedInstance](PXAudioSettings, "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "workaround80278485");

    if (v3)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "setServerTimeSnapshot:", 0);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "currentPlaybackTime");
  CMTimeMakeWithSeconds(&v6, v4, PXAudioDefaultCMTimeScale);
  result = *(double *)&v6.value;
  *(CMTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = v6;
  return result;
}

void __108___PXAppleMusicPlayerController_clientIdentifier_becomeCurrentClientIfNeeded_performAsyncPlayerTransaction___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  int v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 56))
    goto LABEL_2;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 112);
  v3 = *(id *)(a1 + 40);
  if (v2 == v3)
  {

    goto LABEL_2;
  }
  v4 = v3;
  v5 = v2;
  v6 = objc_msgSend(v5, "isEqualToString:", v4);

  if (v6)
  {
LABEL_2:
    objc_msgSend(*(id *)(a1 + 32), "_queue_setCurrentClientIdentifier:", *(_QWORD *)(a1 + 40));
    (*(void (**)(_QWORD, _QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), 1, 0);
    return;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:debugDescription:", CFSTR("PXAppleMusicPlayerControllerErrorDomain"), 1, CFSTR("Transaction client identifier is %@, but the current client identifier is %@"), *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  PLAudioPlaybackGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v11 = *(_QWORD *)(v9 + 112);
    *(_DWORD *)buf = 138543874;
    v13 = v9;
    v14 = 2114;
    v15 = v10;
    v16 = 2114;
    v17 = v11;
    _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignoring player transaction from non-current client with identifier %{public}@. Current client: %{public}@", buf, 0x20u);
  }

}

void __46___PXAppleMusicPlayerController_windowSceneID__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 120));
}

uint64_t __50___PXAppleMusicPlayerController_setWindowSceneID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setWindowSceneID:", *(_QWORD *)(a1 + 40));
}

void __56___PXAppleMusicPlayerController_currentClientIdentifier__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 112));
}

uint64_t __60___PXAppleMusicPlayerController_setCurrentClientIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setCurrentClientIdentifier:", *(_QWORD *)(a1 + 40));
}

void __38___PXAppleMusicPlayerController__init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handlePlaybackStateDidChange");

}

void __38___PXAppleMusicPlayerController__init__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleItemPlaybackDidEnd");

}

uint64_t __62___PXAppleMusicPlayerController_canApplyWorkaroundFor80278485__block_invoke()
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0CC2480], "instancesRespondToSelector:", sel_setServerTimeSnapshot_);
  canApplyWorkaroundFor80278485_canApply = result;
  return result;
}

@end
