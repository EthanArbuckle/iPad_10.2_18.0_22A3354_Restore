@implementation UIKBFeedbackGenerator

uint64_t __54___UIKBFeedbackGenerator_activateWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __54___UIKBFeedbackGenerator__usesCoreHapticsForAudioOnly__block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  _MergedGlobals_1009 = result;
  return result;
}

void __42___UIKBFeedbackGenerator__performOnQueue___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    WeakRetained = v3;
  }

}

void __37___UIKBFeedbackGenerator__updateMode__block_invoke(uint64_t a1, _BYTE *a2)
{
  _BYTE *v2;

  a2[76] = *(_QWORD *)(a1 + 32) == 0;
  a2[77] = *(_QWORD *)(a1 + 32) == 1;
  v2 = a2;
  v2[78] = +[_UIKBFeedbackGenerator _usesCoreHapticsForAudioOnly]();

}

void __30___UIKBFeedbackGenerator_init__block_invoke(uint64_t a1)
{
  void **WeakRetained;
  void **v2;
  _BOOL4 isRingerSwitch;
  NSObject *v4;
  const char *v5;
  int v6;
  NSObject *v7;
  void **v8;
  uint8_t buf[4];
  void **v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  WeakRetained = (void **)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v8 = WeakRetained;
    isRingerSwitch = -[_UIKBFeedbackGenerator _isRingerSwitchOn]((uint64_t)WeakRetained);
    _UIKBFeedbackLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = "off";
      if (isRingerSwitch)
        v5 = "on";
      *(_DWORD *)buf = 138412546;
      v10 = v8;
      v11 = 2080;
      v12 = v5;
      _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_DEFAULT, "%@: Ringer switch changed. Ringer is now %s.", buf, 0x16u);
    }

    v6 = -[_UIKBFeedbackGenerator _areKeyClicksEnabled](v8[2]);
    v2 = v8;
    if (v6)
    {
      _UIKBFeedbackLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v10 = v8;
        _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_DEFAULT, "%@: Resetting the generator. Key clicks are enabled and the ringer switch changed.", buf, 0xCu);
      }

      -[_UIKBFeedbackGenerator _resetWithReason:](v8, CFSTR("ringer switch changed"));
      v2 = v8;
    }
  }

}

void __33___UIKBFeedbackGenerator_dealloc__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _UIKBFeedbackLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v9 = 134218240;
    v10 = v3;
    v11 = 2048;
    v12 = v4;
    _os_log_impl(&dword_185066000, v2, OS_LOG_TYPE_DEFAULT, "Worker queue now setting engine %p and players %p to nil.", (uint8_t *)&v9, 0x16u);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

}

void __41___UIKBFeedbackGenerator__performOnMain___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    WeakRetained = v3;
  }

}

void __65___UIKBFeedbackGenerator__createEngineAndPlayersOnQueueWithMode___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  objc_class *v21;
  id v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  const __CFString *v28;
  id v29;
  void *v30;
  uint64_t *v31;
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  id *v36;
  id v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  NSObject *v43;
  id v44;
  id location;
  id v46;
  _BYTE buf[24];
  void *v48;
  uint64_t *v49;
  id v50[3];

  v50[1] = *(id *)MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v39 = 0;
  v40 = (uint64_t)&v39;
  v41 = 0x2050000000;
  v9 = (void *)qword_1ECD7D620;
  v42 = (void *)qword_1ECD7D620;
  if (!qword_1ECD7D620)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getCHHapticPatternClass_block_invoke;
    v48 = &unk_1E16B14C0;
    v49 = &v39;
    __getCHHapticPatternClass_block_invoke((uint64_t)buf);
    v9 = *(void **)(v40 + 24);
  }
  v10 = objc_retainAutorelease(v9);
  _Block_object_dispose(&v39, 8);
  v38 = 0;
  objc_msgSend(v10, "patternForKey:error:", v8, &v38);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v38;
  if (v12)
  {
    v13 = v12;
    _UIKBFeedbackLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v26 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v26;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v13;
      _os_log_error_impl(&dword_185066000, v14, OS_LOG_TYPE_ERROR, "%@: Error creating CHHapticPattern: %@", buf, 0x16u);
    }

  }
  else
  {
    v15 = *(_QWORD *)(a1 + 32);
    v16 = *(void **)(v15 + 80);
    if (v16)
      goto LABEL_26;
    objc_msgSend(v11, "configurationDictionary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = *(id **)(a1 + 48);
    v18 = v17;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v15 + 8));
    if (*(_BYTE *)(v15 + 76))
    {
      _UIKBFeedbackLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v15;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[_UIKBFeedbackGenerator _createEngineOnQueueWithOptions:mode:]";
        _os_log_error_impl(&dword_185066000, v19, OS_LOG_TYPE_ERROR, "%@: %s called when feedback is disabled.", buf, 0x16u);
      }
    }
    else
    {
      v39 = 0;
      v40 = (uint64_t)&v39;
      v41 = 0x2050000000;
      v20 = (void *)qword_1ECD7D638;
      v42 = (void *)qword_1ECD7D638;
      if (!qword_1ECD7D638)
      {
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __getCHHapticEngineClass_block_invoke;
        v48 = &unk_1E16B14C0;
        v49 = &v39;
        __getCHHapticEngineClass_block_invoke((uint64_t)buf);
        v20 = *(void **)(v40 + 24);
      }
      v21 = objc_retainAutorelease(v20);
      _Block_object_dispose(&v39, 8);
      v22 = [v21 alloc];
      v46 = 0;
      v23 = objc_msgSend(v22, "initWithAudioSession:sessionIsShared:options:error:", 0, 0, v18, &v46);
      v19 = v46;
      v24 = *(void **)(v15 + 80);
      *(_QWORD *)(v15 + 80) = v23;

      if (v19)
      {
        _UIKBFeedbackLog();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v15;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v19;
          _os_log_error_impl(&dword_185066000, v25, OS_LOG_TYPE_ERROR, "%@: Error creating CHHapticEngine: %@", buf, 0x16u);
        }
      }
      else
      {
        objc_msgSend(*(id *)(v15 + 80), "setFollowAudioRoute:", 1);
        _UIKBFeedbackLog();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          if ((unint64_t)v36 - 1 > 2)
            v28 = CFSTR("none");
          else
            v28 = off_1E16C3110[(_QWORD)v36 - 1];
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v15;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v28;
          _os_log_impl(&dword_185066000, v27, OS_LOG_TYPE_DEFAULT, "%@: Creating engine with mode: %@.", buf, 0x16u);
        }

        objc_msgSend(*(id *)(v15 + 80), "setPlaysHapticsOnly:", v36 == (id *)2);
        objc_msgSend(*(id *)(v15 + 80), "setPlaysAudioOnly:", v36 == (id *)1);
        if (v36 == (id *)1)
        {
          objc_msgSend(*(id *)(v15 + 80), "setAutoShutdownEnabled:", 1);
          objc_msgSend(*(id *)(v15 + 80), "setAutoShutdownTimeout:", 2.0);
        }
        v29 = *(id *)(v15 + 8);
        objc_initWeak(&location, (id)v15);
        v30 = *(void **)(v15 + 80);
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __63___UIKBFeedbackGenerator__createEngineOnQueueWithOptions_mode___block_invoke;
        v48 = &unk_1E16C2EB0;
        v31 = (uint64_t *)v29;
        v49 = v31;
        objc_copyWeak(v50, &location);
        objc_msgSend(v30, "setStoppedHandler:", buf);
        v32 = *(void **)(v15 + 80);
        v39 = MEMORY[0x1E0C809B0];
        v40 = 3221225472;
        v41 = (uint64_t)__63___UIKBFeedbackGenerator__createEngineOnQueueWithOptions_mode___block_invoke_3;
        v42 = &unk_1E16C2ED8;
        v25 = v31;
        v43 = v25;
        objc_copyWeak(&v44, &location);
        objc_msgSend(v32, "setResetHandler:", &v39);
        objc_destroyWeak(&v44);

        objc_destroyWeak(v50);
        objc_destroyWeak(&location);
      }

    }
    v16 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
    if (v16)
    {
LABEL_26:
      v37 = 0;
      objc_msgSend(v16, "createPlayerWithPattern:error:", v11, &v37);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v37;
      if (v34)
      {
        _UIKBFeedbackLog();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v34;
          _os_log_error_impl(&dword_185066000, v35, OS_LOG_TYPE_ERROR, "Error creating CHHapticEngine: %@", buf, 0xCu);
        }

      }
      else
      {
        objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v33, v7);
      }

    }
    else
    {
      *a4 = 1;
    }
  }

}

void __63___UIKBFeedbackGenerator__createEngineOnQueueWithOptions_mode___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  _QWORD v4[4];
  id v5[2];

  v3 = *(NSObject **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63___UIKBFeedbackGenerator__createEngineOnQueueWithOptions_mode___block_invoke_2;
  v4[3] = &unk_1E16C0530;
  objc_copyWeak(v5, (id *)(a1 + 40));
  v5[1] = a2;
  dispatch_async(v3, v4);
  objc_destroyWeak(v5);
}

void __63___UIKBFeedbackGenerator__createEngineOnQueueWithOptions_mode___block_invoke_2(uint64_t a1)
{
  dispatch_queue_t *WeakRetained;
  uint64_t v3;
  NSObject *v4;
  dispatch_queue_t *v5;
  uint8_t buf[4];
  dispatch_queue_t *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = *(_QWORD *)(a1 + 40);
    v5 = WeakRetained;
    dispatch_assert_queue_V2(WeakRetained[1]);
    _UIKBFeedbackLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v7 = v5;
      v8 = 2048;
      v9 = v3;
      _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_DEFAULT, "%@: Engine stopped with reason: %ld", buf, 0x16u);
    }

    -[_UIKBFeedbackGenerator _setIsEngineRunning:]((uint64_t)v5, 0);
    -[_UIKBFeedbackGenerator _performOnMain:](v5, &__block_literal_global_81_1);
    WeakRetained = v5;
  }

}

void __63___UIKBFeedbackGenerator__createEngineOnQueueWithOptions_mode___block_invoke_3(uint64_t a1)
{
  NSObject *v1;
  _QWORD block[4];
  id v3;

  v1 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63___UIKBFeedbackGenerator__createEngineOnQueueWithOptions_mode___block_invoke_4;
  block[3] = &unk_1E16B3F40;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  dispatch_async(v1, block);
  objc_destroyWeak(&v3);
}

void __63___UIKBFeedbackGenerator__createEngineOnQueueWithOptions_mode___block_invoke_4(uint64_t a1)
{
  uint64_t updated;
  dispatch_queue_t *WeakRetained;

  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(WeakRetained[1]);
    updated = -[_UIKBFeedbackGenerator _updateMode]((uint64_t)WeakRetained);
    -[_UIKBFeedbackGenerator _recreateEngineAndPlayersOnQueueWithMode:reason:](WeakRetained, updated, CFSTR("engine reset handler"));
  }

}

uint64_t __65___UIKBFeedbackGenerator__engineStoppedHandlerOnQueueWithReason___block_invoke(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(a2 + 28) = 0;
  return objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", a2, sel__stopEngineDueToIdle, 0);
}

void __43___UIKBFeedbackGenerator__resetWithReason___block_invoke(uint64_t a1)
{
  id WeakRetained;
  _QWORD v3[4];
  id v4;
  char v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43___UIKBFeedbackGenerator__resetWithReason___block_invoke_2;
  v3[3] = &unk_1E16C2F20;
  v5 = *(_BYTE *)(a1 + 48);
  v4 = *(id *)(a1 + 32);
  -[_UIKBFeedbackGenerator _performOnMain:](WeakRetained, v3);

}

void __43___UIKBFeedbackGenerator__resetWithReason___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  -[_UIKBFeedbackGenerator _updateMode]((uint64_t)v3);
  if (*(_BYTE *)(a1 + 40))
  {
    _UIKBFeedbackLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138412546;
      v7 = v3;
      v8 = 2112;
      v9 = v5;
      _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_DEFAULT, "%@: Reactivating for reason: %@", (uint8_t *)&v6, 0x16u);
    }

    objc_msgSend(v3, "activateWithCompletionBlock:", 0);
  }

}

uint64_t __74___UIKBFeedbackGenerator__recreateEngineAndPlayersOnQueueWithMode_reason___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
    return objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", a2, sel__stopEngineDueToIdle, 0);
  return result;
}

void __62___UIKBFeedbackGenerator__prewarmEngineOnQueueWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _UIKBFeedbackLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_error_impl(&dword_185066000, v5, OS_LOG_TYPE_ERROR, "Error prewarming: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(void **)(a1 + 32);
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "%@: Done preheating CoreHaptics.", (uint8_t *)&v8, 0xCu);
  }

  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, BOOL))(v7 + 16))(v7, v3 == 0);

}

void __46___UIKBFeedbackGenerator__setIsEngineRunning___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  _QWORD *v8;

  v3 = a2;
  if (*(_BYTE *)(a1 + 40))
  {
    ++v3[6];
    v8 = v3;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v8[4];
    v8[4] = v4;
LABEL_5:

    v3 = v8;
    goto LABEL_6;
  }
  if (v3[4])
  {
    v8 = v3;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceDate:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
    *((double *)v8 + 5) = v7 + *((double *)v8 + 5);

    v5 = (void *)v8[4];
    v8[4] = 0;
    goto LABEL_5;
  }
LABEL_6:

}

uint64_t __65___UIKBFeedbackGenerator__startEngineOnQueueWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  *(_BYTE *)(a2 + 28) = *(_BYTE *)(a1 + 40);
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

void __91___UIKBFeedbackGenerator__stopEngineIfNecessaryOnQueueAndReleaseResources_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  char v10;
  uint8_t buf[4];
  _QWORD *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  _UIKBFeedbackLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v12 = WeakRetained;
      v13 = 2112;
      v14 = v3;
      _os_log_error_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "%@: Error stopping CHHapticEngine: %@", buf, 0x16u);
    }

    v7 = *(_QWORD *)(a1 + 32);
    if (v7)
      (*(void (**)(void))(v7 + 16))();
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = WeakRetained;
      _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_DEFAULT, "%@: Engine stopped.", buf, 0xCu);
    }

    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __91___UIKBFeedbackGenerator__stopEngineIfNecessaryOnQueueAndReleaseResources_completionBlock___block_invoke_98;
    v8[3] = &unk_1E16C2FB8;
    v10 = *(_BYTE *)(a1 + 48);
    v9 = *(id *)(a1 + 32);
    -[_UIKBFeedbackGenerator _performOnQueue:](WeakRetained, v8);

  }
}

void __91___UIKBFeedbackGenerator__stopEngineIfNecessaryOnQueueAndReleaseResources_completionBlock___block_invoke_98(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;

  v3 = a2;
  -[_UIKBFeedbackGenerator _setIsEngineRunning:]((uint64_t)v3, 0);
  if (*(_BYTE *)(a1 + 40))
    -[_UIKBFeedbackGenerator _releaseEngineAndPlayersOnQueue]((uint64_t)v3);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __91___UIKBFeedbackGenerator__stopEngineIfNecessaryOnQueueAndReleaseResources_completionBlock___block_invoke_2;
  v4[3] = &unk_1E16C2FE0;
  v5 = *(id *)(a1 + 32);
  -[_UIKBFeedbackGenerator _performOnMain:](v3, v4);

}

uint64_t __91___UIKBFeedbackGenerator__stopEngineIfNecessaryOnQueueAndReleaseResources_completionBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  *(_BYTE *)(a2 + 28) = 0;
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __46___UIKBFeedbackGenerator__stopEngineDueToIdle__block_invoke(uint64_t a1, uint64_t a2)
{
  -[_UIKBFeedbackGenerator _stopEngineIfNecessaryOnQueueAndReleaseResources:completionBlock:](a2, 0, 0);
}

void __57___UIKBFeedbackGenerator__dictationDidBeginNotification___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  id *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = v2[10];
  _UIKBFeedbackLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = v2;
      _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "%@: Unmute haptics for dictation audio recording.", (uint8_t *)&v6, 0xCu);
    }

    objc_msgSend(v2[10], "setMuteHapticsWhileRecordingAudio:", 0);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v2;
      _os_log_error_impl(&dword_185066000, v5, OS_LOG_TYPE_ERROR, "%@: Couldn't update haptics muting for dictation audio recording. No engine.", (uint8_t *)&v6, 0xCu);
    }

  }
}

void __55___UIKBFeedbackGenerator__dictationDidEndNotification___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  id *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = v2[10];
  _UIKBFeedbackLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = v2;
      _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "%@: Muting haptics for audio recording.", (uint8_t *)&v6, 0xCu);
    }

    objc_msgSend(v2[10], "setMuteHapticsWhileRecordingAudio:", 1);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v2;
      _os_log_error_impl(&dword_185066000, v5, OS_LOG_TYPE_ERROR, "%@: Couldn't update haptics muting for dictation audio recording. No engine.", (uint8_t *)&v6, 0xCu);
    }

  }
}

void __64___UIKBFeedbackGenerator__stopEngineForApplicationNotification___block_invoke(uint64_t a1, uint64_t a2)
{
  -[_UIKBFeedbackGenerator _stopEngineIfNecessaryOnQueueAndReleaseResources:completionBlock:](a2, 1, 0);
}

uint64_t __64___UIKBFeedbackGenerator__effectiveVolumeDidChangeNotification___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a2 + 64), "getVolume:forCategory:", a2 + 72, *(_QWORD *)(a1 + 32));
}

void __54___UIKBFeedbackGenerator_activateWithCompletionBlock___block_invoke_110(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  __int128 buf;
  void (*v15)(uint64_t, void *);
  void *v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 48);
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a2;
  objc_msgSend(v4, "stringWithUTF8String:", "-[_UIKBFeedbackGenerator activateWithCompletionBlock:]_block_invoke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIKBFeedbackGenerator _recreateEngineAndPlayersIfNecessaryOnQueueWithMode:reason:]((uint64_t)v5, v3, v6);

  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __54___UIKBFeedbackGenerator_activateWithCompletionBlock___block_invoke_2;
  v12[3] = &unk_1E16B1BA0;
  v8 = *(_QWORD *)(a1 + 32);
  v13 = *(id *)(a1 + 40);
  v9 = v12;
  if (v8)
  {
    _UIKBFeedbackLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_DEFAULT, "%@: Preheating CoreHaptics.", (uint8_t *)&buf, 0xCu);
    }

    v11 = *(void **)(v8 + 80);
    *(_QWORD *)&buf = v7;
    *((_QWORD *)&buf + 1) = 3221225472;
    v15 = __62___UIKBFeedbackGenerator__prewarmEngineOnQueueWithCompletion___block_invoke;
    v16 = &unk_1E16C2F70;
    v17 = v8;
    v18 = v9;
    objc_msgSend(v11, "prewarmWithCompletionHandler:", &buf);

  }
}

void __54___UIKBFeedbackGenerator_activateWithCompletionBlock___block_invoke_2(uint64_t a1, char a2)
{
  _QWORD v3[4];
  id v4;
  char v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __54___UIKBFeedbackGenerator_activateWithCompletionBlock___block_invoke_3;
  v3[3] = &unk_1E16BFB78;
  v4 = *(id *)(a1 + 32);
  v5 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);

}

uint64_t __54___UIKBFeedbackGenerator_activateWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void __54___UIKBFeedbackGenerator_activateWithCompletionBlock___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_UIKBFeedbackGenerator activateWithCompletionBlock:]_block_invoke_4");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIKBFeedbackGenerator _recreateEngineAndPlayersIfNecessaryOnQueueWithMode:reason:]((uint64_t)v3, v4, v5);

  objc_initWeak(&location, v3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_UIKBFeedbackGenerator activateWithCompletionBlock:]_block_invoke_4");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54___UIKBFeedbackGenerator_activateWithCompletionBlock___block_invoke_5;
  v7[3] = &unk_1E16C3080;
  objc_copyWeak(&v9, &location);
  v8 = *(id *)(a1 + 32);
  -[_UIKBFeedbackGenerator _startEngineIfNecessaryOnQueueWithReason:completionBlock:]((uint64_t)v3, v6, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __54___UIKBFeedbackGenerator_activateWithCompletionBlock___block_invoke_5(uint64_t a1, char a2)
{
  id v4;
  _QWORD v5[4];
  id v6;
  char v7;
  id to;

  objc_copyWeak(&to, (id *)(a1 + 40));
  v4 = objc_loadWeakRetained(&to);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54___UIKBFeedbackGenerator_activateWithCompletionBlock___block_invoke_6;
  v5[3] = &unk_1E16C2FB8;
  v7 = a2;
  v6 = *(id *)(a1 + 32);
  -[_UIKBFeedbackGenerator _performOnMain:](v4, v5);

  objc_destroyWeak(&to);
}

uint64_t __54___UIKBFeedbackGenerator_activateWithCompletionBlock___block_invoke_6(uint64_t a1, _QWORD *a2)
{
  if (*(_BYTE *)(a1 + 40))
    -[_UIKBFeedbackGenerator _resetIdleTimer](a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __36___UIKBFeedbackGenerator_deactivate__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[_UIKBFeedbackGenerator _sendAnalyticsEvent]((uint64_t)WeakRetained);

}

uint64_t __57___UIKBFeedbackGenerator__deactivateWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __57___UIKBFeedbackGenerator__deactivateWithCompletionBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  _QWORD block[4];
  id v6;
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    _UIKBFeedbackLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v8 = a2;
      _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_DEFAULT, "%@: Cooling CoreHaptics.", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a2 + 80), "stopPrewarm");
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57___UIKBFeedbackGenerator__deactivateWithCompletionBlock___block_invoke_3;
  block[3] = &unk_1E16B1BF8;
  v6 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __57___UIKBFeedbackGenerator__deactivateWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __57___UIKBFeedbackGenerator__deactivateWithCompletionBlock___block_invoke_111(uint64_t a1, uint64_t a2)
{
  -[_UIKBFeedbackGenerator _stopEngineIfNecessaryOnQueueAndReleaseResources:completionBlock:](a2, 1, *(void **)(a1 + 32));
}

void __52___UIKBFeedbackGenerator_actionOccurred_atLocation___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  float v9;
  NSObject *v10;
  id *v11;
  void *v12;
  id v13;
  void *v14;
  id *v15;
  void *v16;
  void *v17;
  id v18;
  void **v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  _BYTE buf[24];
  void *v38;
  void **v39;
  void *v40;
  void **v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v3 = *(_QWORD *)(a1 + 32);
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a2 + 8));
    if (!*(_BYTE *)(a2 + 76))
    {
      if (*(_BYTE *)(a2 + 77) && !*(_BYTE *)(a2 + 78))
      {
        v23 = *(void **)(a2 + 96);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v3);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectForKeyedSubscript:", v24);
        v7 = objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          v25 = -[NSObject integerValue](v7, "integerValue");
          v40 = 0;
          v41 = &v40;
          v42 = 0x2020000000;
          v26 = off_1ECD7D640;
          v43 = off_1ECD7D640;
          if (!off_1ECD7D640)
          {
            *(_QWORD *)buf = MEMORY[0x1E0C809B0];
            *(_QWORD *)&buf[8] = 3221225472;
            *(_QWORD *)&buf[16] = __getAudioServicesPlaySystemSoundWithOptionsSymbolLoc_block_invoke;
            v38 = &unk_1E16B14C0;
            v39 = &v40;
            __getAudioServicesPlaySystemSoundWithOptionsSymbolLoc_block_invoke(buf);
            v26 = v41[3];
          }
          _Block_object_dispose(&v40, 8);
          if (!v26)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void __AudioServicesPlaySystemSoundWithOptions(SystemSoundID, CFDictionaryRef, __strong dispatch_block_t)");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "handleFailureInFunction:file:lineNumber:description:", v33, CFSTR("_UIKBFeedbackGenerator.m"), 58, CFSTR("%s"), dlerror());

            goto LABEL_34;
          }
          ((void (*)(uint64_t, _QWORD, _QWORD))v26)(v25, 0, 0);
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_UIKBFeedbackGenerator _actionOccurred:]");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIKBFeedbackGenerator _startEngineIfNecessaryOnQueueWithReason:completionBlock:](a2, v4, 0);

        if (!*(_BYTE *)(a2 + 112))
        {
          _UIKBFeedbackLog();
          v7 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = a2;
            _os_log_error_impl(&dword_185066000, v7, OS_LOG_TYPE_ERROR, "%@: Engine is not running. Can't play feedback.", buf, 0xCu);
          }
          goto LABEL_29;
        }
        v5 = *(void **)(a2 + 88);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v3);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", v6);
        v7 = objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "timeIntervalSinceReferenceDate");

          v9 = *(float *)(a2 + 72);
          objc_msgSend(*(id *)(a2 + 80), "currentTime");
          if ((objc_opt_respondsToSelector() & 1) == 0)
          {
            _UIKBFeedbackLog();
            v10 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = a2;
              _os_log_error_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "%@: CHHapticPatternPlayer does not support immediate parameters.", buf, 0xCu);
            }
LABEL_28:

            objc_msgSend(*(id *)(a2 + 80), "currentTime");
            *(_QWORD *)(a2 + 104) = v27;
            goto LABEL_29;
          }
          v10 = v7;
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x2020000000;
          v11 = (id *)qword_1ECD7D650;
          v38 = (void *)qword_1ECD7D650;
          if (!qword_1ECD7D650)
          {
            v12 = CoreHapticsLibrary();
            v11 = (id *)dlsym(v12, "CHHapticEventParameterIDAudioVolume");
            *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v11;
            qword_1ECD7D650 = (uint64_t)v11;
          }
          _Block_object_dispose(buf, 8);
          if (v11)
          {
            v13 = *v11;
            v35 = v13;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (v9 + -0.0625) / 0.9375 * 0.4549 + (1.0 - (v9 + -0.0625) / 0.9375) * 0.1757);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = v14;
            *(_QWORD *)buf = 0;
            *(_QWORD *)&buf[8] = buf;
            *(_QWORD *)&buf[16] = 0x2020000000;
            v15 = (id *)qword_1ECD7D658;
            v38 = (void *)qword_1ECD7D658;
            if (!qword_1ECD7D658)
            {
              v16 = CoreHapticsLibrary();
              v15 = (id *)dlsym(v16, "CHHapticEventParameterIDHapticIntensity");
              *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v15;
              qword_1ECD7D658 = (uint64_t)v15;
            }
            _Block_object_dispose(buf, 8);
            if (v15)
            {
              v36 = *v15;
              v17 = (void *)MEMORY[0x1E0CB37E8];
              v18 = v36;
              objc_msgSend(v17, "numberWithDouble:", 1.0);
              v19 = (void **)objc_claimAutoreleasedReturnValue();
              v41 = v19;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v35, 2);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = 0;
              -[NSObject startAtTime:withImmediateParameters:error:](v10, "startAtTime:withImmediateParameters:error:", v20, &v34, 0.0);
              v21 = v34;

              if (v21)
              {
                _UIKBFeedbackLog();
                v22 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  *(_QWORD *)&buf[4] = a2;
                  *(_WORD *)&buf[12] = 2112;
                  *(_QWORD *)&buf[14] = v21;
                  _os_log_error_impl(&dword_185066000, v22, OS_LOG_TYPE_ERROR, "%@: Error starting player: %@", buf, 0x16u);
                }

                v7 = v10;
                goto LABEL_29;
              }
              ++*(_QWORD *)(a2 + 56);
              goto LABEL_28;
            }
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CHHapticEventParameterID getCHHapticEventParameterIDHapticIntensity(void)");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "handleFailureInFunction:file:lineNumber:description:", v31, CFSTR("_UIFeedbackCoreHapticsEngineUtilities.h"), 49, CFSTR("%s"), dlerror());

          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CHHapticEventParameterID getCHHapticEventParameterIDAudioVolume(void)");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v29, CFSTR("_UIFeedbackCoreHapticsEngineUtilities.h"), 57, CFSTR("%s"), dlerror());

          }
LABEL_34:
          __break(1u);
        }
      }
LABEL_29:

    }
  }
}

@end
