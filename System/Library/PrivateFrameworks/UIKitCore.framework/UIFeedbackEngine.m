@implementation UIFeedbackEngine

uint64_t __32___UIFeedbackEngine__deactivate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internal_deactivate");
}

uint64_t __35___UIFeedbackEngine__setSuspended___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internal_setSuspended:", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __31___UIFeedbackEngine__setState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stats_stateDidChangeFrom:to:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __57___UIFeedbackEngine__internal_deactivateEngineIfPossible__block_invoke_2(uint64_t a1, unsigned int a2)
{
  unint64_t v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!_UIFeedbackLoggingDisabled)
  {
    v4 = _UIInternalPreference_EnableStatisticOnAllDevices_block_invoke___s_category;
    if (!_UIInternalPreference_EnableStatisticOnAllDevices_block_invoke___s_category)
    {
      v4 = __UILogCategoryGetNode("Feedback", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v4, (unint64_t *)&_UIInternalPreference_EnableStatisticOnAllDevices_block_invoke___s_category);
    }
    v5 = *(NSObject **)(v4 + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138412546;
      v8 = v6;
      v9 = 2048;
      v10 = a2;
      _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "_internal_deactivateEngineIfPossible %@ tearedDown: %ld", (uint8_t *)&v7, 0x16u);
    }
  }
  if (a2)
    objc_msgSend(*(id *)(a1 + 40), "_setState:", 2 * (objc_msgSend(*(id *)(a1 + 40), "prewarmCount") > 0));
}

uint64_t __45___UIFeedbackEngine__internal_activateEngine__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v4 = *(void **)(a1 + 32);
  if ((_DWORD)a2)
  {
    v5 = 4;
LABEL_8:
    objc_msgSend(v4, "_setState:", v5);
    return objc_msgSend(*(id *)(a1 + 32), "_internal_serviceBlocksForState:withSuccess:", 4, a2);
  }
  v6 = objc_msgSend(v4, "prewarmCount");
  v4 = *(void **)(a1 + 32);
  if (v6 < 1)
  {
    v5 = 0;
    goto LABEL_8;
  }
  v7 = objc_msgSend(v4, "_state");
  v8 = *(void **)(a1 + 32);
  if (!v7)
  {
    objc_msgSend(v8, "_internal_prewarmEngine");
    return objc_msgSend(*(id *)(a1 + 32), "_internal_serviceBlocksForState:withSuccess:", 4, a2);
  }
  if (objc_msgSend(v8, "_state") == 3)
  {
    v4 = *(void **)(a1 + 32);
    v5 = 2;
    goto LABEL_8;
  }
  return objc_msgSend(*(id *)(a1 + 32), "_internal_serviceBlocksForState:withSuccess:", 4, a2);
}

uint64_t __44___UIFeedbackEngine__internal_prewarmEngine__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  if (objc_msgSend(*(id *)(a1 + 32), "_state") == 1)
  {
    if ((_DWORD)a2)
      v4 = 2;
    else
      v4 = 0;
    objc_msgSend(*(id *)(a1 + 32), "_setState:", v4);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_internal_serviceBlocksForState:withSuccess:", 2, a2);
}

void __54___UIFeedbackEngine__prewarm_andPerformWhenPrewarmed___block_invoke(uint64_t a1, char a2)
{
  _QWORD v3[4];
  id v4;
  char v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __54___UIFeedbackEngine__prewarm_andPerformWhenPrewarmed___block_invoke_2;
  v3[3] = &unk_1E16BFB78;
  v4 = *(id *)(a1 + 32);
  v5 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);

}

void __53___UIFeedbackEngine__activate_andPerformWhenRunning___block_invoke(uint64_t a1, char a2)
{
  _QWORD v3[4];
  id v4;
  char v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53___UIFeedbackEngine__activate_andPerformWhenRunning___block_invoke_2;
  v3[3] = &unk_1E16BFB78;
  v4 = *(id *)(a1 + 32);
  v5 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);

}

uint64_t __53___UIFeedbackEngine__activate_andPerformWhenRunning___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

uint64_t __44___UIFeedbackEngine__startWarmingFeedbacks___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internal_startWarmingFeedbacks:", *(_QWORD *)(a1 + 40));
}

uint64_t __62___UIFeedbackEngine__playFeedback_atTime_withCompletionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __54___UIFeedbackEngine__prewarm_andPerformWhenPrewarmed___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internal_prewarm:andPerformWhenPrewarmed:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

uint64_t __53___UIFeedbackEngine__activate_andPerformWhenRunning___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internal_activate:andPerformWhenRunning:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

uint64_t __54___UIFeedbackEngine__prewarm_andPerformWhenPrewarmed___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void __62___UIFeedbackEngine__playFeedback_atTime_withCompletionBlock___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  double v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(double *)(a1 + 72);
  v4 = *(_QWORD *)(a1 + 80);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62___UIFeedbackEngine__playFeedback_atTime_withCompletionBlock___block_invoke_2;
  v7[3] = &unk_1E16C5D08;
  v8 = *(id *)(a1 + 64);
  objc_msgSend(v1, "_internal_playFeedbackData:atTime:feedback:effectiveFeedbackType:existingPlayer:withCompletionBlock:", v2, v5, v4, v6, v7, v3);

}

void __62___UIFeedbackEngine__playFeedback_atTime_withCompletionBlock___block_invoke_2(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  char v16;

  v7 = a3;
  v8 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62___UIFeedbackEngine__playFeedback_atTime_withCompletionBlock___block_invoke_3;
  v12[3] = &unk_1E16C5CE0;
  v9 = *(id *)(a1 + 32);
  v14 = v8;
  v15 = v9;
  v16 = a2;
  v13 = v7;
  v10 = v8;
  v11 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v12);

}

void __121___UIFeedbackEngine__internal_playFeedbackData_atTime_feedback_effectiveFeedbackType_existingPlayer_withCompletionBlock___block_invoke(double *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  double v5;
  id v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;

  v3 = *((_QWORD *)a1 + 4);
  v4 = *((_QWORD *)a1 + 5);
  v5 = a1[7];
  v6 = a2;
  if ((objc_msgSend(v6, "_internal_playFeedbackData:forFeedback:atTime:", v3, v4, v5) & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v8 = CFSTR("unable to play feedback data");
    if (!v6)
      v8 = CFSTR("no player");
    v7 = v8;
  }
  v9 = v7;
  (*(void (**)(void))(*((_QWORD *)a1 + 6) + 16))();

}

void __39___UIFeedbackEngine_engineForFeedback___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)UIApp, "_isSpringBoard"))
    objc_msgSend(v0, "addObject:", objc_opt_class());
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v3, 7);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObjectsFromArray:", v1, v3, v4, v5, v6, v7, v8);

  v2 = (void *)qword_1ECD7B848;
  qword_1ECD7B848 = (uint64_t)v0;

}

uint64_t __47___UIFeedbackEngine__internal_updateSuspension__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internal_activateEngine");
}

uint64_t __62___UIFeedbackEngine__internal_activate_andPerformWhenRunning___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_state");
  if (result == 2)
    return objc_msgSend(*(id *)(a1 + 32), "_internal_activateEngine");
  return result;
}

uint64_t __57___UIFeedbackEngine__internal_deactivateEngineIfPossible__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internal_deactivateEngineIfPossible");
}

uint64_t __43___UIFeedbackEngine__stopWarmingFeedbacks___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internal_stopWarmingFeedbacks:", *(_QWORD *)(a1 + 40));
}

uint64_t __30___UIFeedbackEngine__cooldown__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internal_cooldown");
}

uint64_t __55___UIFeedbackEngine__internal_cooldownEngineIfPossible__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internal_cooldownEngineIfPossible");
}

uint64_t __55___UIFeedbackEngine__internal_cooldownEngineIfPossible__block_invoke_2(uint64_t result, int a2)
{
  uint64_t v2;

  if (a2)
  {
    v2 = result;
    result = objc_msgSend(*(id *)(result + 32), "_state");
    if (result == 2)
      return objc_msgSend(*(id *)(v2 + 32), "_setState:", 0);
  }
  return result;
}

void __121___UIFeedbackEngine__internal_playFeedbackData_atTime_feedback_effectiveFeedbackType_existingPlayer_withCompletionBlock___block_invoke_87(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  NSObject *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!_UIFeedbackLoggingDisabled)
  {
    v4 = _UIInternalPreference_EnableStatisticOnAllDevices_block_invoke_2___s_category;
    if (!_UIInternalPreference_EnableStatisticOnAllDevices_block_invoke_2___s_category)
    {
      v4 = __UILogCategoryGetNode("Feedback", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v4, (unint64_t *)&_UIInternalPreference_EnableStatisticOnAllDevices_block_invoke_2___s_category);
    }
    v5 = *(NSObject **)(v4 + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      v7 = *(id *)(a1 + 32);
      v8 = v5;
      objc_msgSend(v6, "stringWithFormat:", CFSTR("<%s: %p>"), object_getClassName(v7), v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = (void *)MEMORY[0x1E0CB3940];
      v11 = v3;
      v12 = v9;
      objc_msgSend(v10, "stringWithFormat:", CFSTR("<%s: %p>"), object_getClassName(v11), v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138412546;
      v25 = v9;
      v26 = 2112;
      v27 = v13;
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_DEFAULT, "player dequeue finished for feedback %@ with player %@", buf, 0x16u);

    }
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "removeObjectForKey:", *(_QWORD *)(a1 + 32));
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v14 = *(id *)(a1 + 48);
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(v14);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i) + 16))();
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v16);
  }

}

void __71___UIFeedbackEngine__dequeueReusableFeedbackPlayerWithCompletionBlock___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __71___UIFeedbackEngine__dequeueReusableFeedbackPlayerWithCompletionBlock___block_invoke_2;
  v2[3] = &unk_1E16C5DA8;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "_internal_dequeueReusableFeedbackPlayerWithCompletionBlock:", v2);

}

void __71___UIFeedbackEngine__dequeueReusableFeedbackPlayerWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71___UIFeedbackEngine__dequeueReusableFeedbackPlayerWithCompletionBlock___block_invoke_3;
  v6[3] = &unk_1E16B2F48;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __71___UIFeedbackEngine__dequeueReusableFeedbackPlayerWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __55___UIFeedbackEngine__internal_willPlayFeedback_atTime___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  id v5;

  v2 = *(double *)(a1 + 48);
  v3 = 0.0;
  if (v2 > 0.0)
  {
    objc_msgSend(*(id *)(a1 + 32), "currentTime");
    v3 = v2 - v4;
  }
  +[_UIFeedbackVisualizer sharedVisualizer](_UIFeedbackVisualizer, "sharedVisualizer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "showVisualForFeedback:withDelay:", *(_QWORD *)(a1 + 40), v3);

}

void __50___UIFeedbackEngine__internal_willCancelFeedback___block_invoke(uint64_t a1)
{
  id v2;

  +[_UIFeedbackVisualizer sharedVisualizer](_UIFeedbackVisualizer, "sharedVisualizer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelVisualForFeedback:", *(_QWORD *)(a1 + 32));

}

void __48___UIFeedbackEngine__sb_stuckInNonInactiveState__block_invoke()
{
  unint64_t v0;
  NSObject *v1;
  void *v2;
  objc_class *v3;
  id v4;
  void **v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t buf[8];
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  if (!_UIFeedbackLoggingDisabled)
  {
    v0 = qword_1ECD7B890;
    if (!qword_1ECD7B890)
    {
      v0 = __UILogCategoryGetNode("Feedback", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v0, (unint64_t *)&qword_1ECD7B890);
    }
    v1 = *(NSObject **)(v0 + 8);
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v1, OS_LOG_TYPE_ERROR, "Springboard failed to return to inactive state. Reporting via ABC.", buf, 2u);
    }
  }
  v20 = 0;
  v21 = &v20;
  v22 = 0x2050000000;
  v2 = (void *)qword_1ECD7B8C8;
  v23 = qword_1ECD7B8C8;
  if (!qword_1ECD7B8C8)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = (uint64_t)__getSDRDiagnosticReporterClass_block_invoke_0;
    v18 = &unk_1E16B14C0;
    v19 = &v20;
    __getSDRDiagnosticReporterClass_block_invoke_0((uint64_t)buf);
    v2 = (void *)v21[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v20, 8);
  v4 = objc_alloc_init(v3);
  *(_QWORD *)buf = 0;
  v16 = (uint64_t)buf;
  v17 = 0x2020000000;
  v5 = (void **)qword_1ECD7B8D0;
  v18 = (void *)qword_1ECD7B8D0;
  if (!qword_1ECD7B8D0)
  {
    v6 = SymptomDiagnosticReporterLibrary();
    v5 = (void **)dlsym(v6, "kSymptomDiagnosticTypeEnergy");
    *(_QWORD *)(v16 + 24) = v5;
    qword_1ECD7B8D0 = (uint64_t)v5;
  }
  _Block_object_dispose(buf, 8);
  if (v5)
  {
    v7 = *v5;
    v8 = (void *)MEMORY[0x1E0CB34D0];
    v9 = v7;
    objc_msgSend(v8, "mainBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "signatureWithDomain:type:subType:detectedProcess:triggerThresholdValues:", CFSTR("UIKit"), v9, CFSTR("SpringBoardHapticsFailReturnToIdle"), v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "snapshotWithSignature:delay:events:payload:actions:reply:", v12, 0, 0, 0, 0, 0.0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkSymptomDiagnosticTypeEnergy(void)");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("_UIFeedbackEngine.m"), 36, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

uint64_t __34___UIFeedbackEngine_runWhenReady___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "_deactivate");
}

void __50___UIFeedbackEngine__internal_setupBackgroundTask__block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  id v4;
  NSObject *v5;
  _QWORD block[5];

  objc_msgSend((id)objc_opt_class(), "_internalQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50___UIFeedbackEngine__internal_setupBackgroundTask__block_invoke_2;
  block[3] = &unk_1E16B1B28;
  block[4] = *(_QWORD *)(a1 + 32);
  v3 = v2;
  if (!v2)
  {
    v3 = MEMORY[0x1E0C80D38];
    v4 = MEMORY[0x1E0C80D38];
  }
  v5 = v2;
  dispatch_async(v3, block);

}

uint64_t __50___UIFeedbackEngine__internal_setupBackgroundTask__block_invoke_2(uint64_t a1)
{
  unint64_t v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!_UIFeedbackLoggingDisabled)
  {
    v2 = _UIInternalPreference_EnableStatisticOnAllDevices_block_invoke_4___s_category;
    if (!_UIInternalPreference_EnableStatisticOnAllDevices_block_invoke_4___s_category)
    {
      v2 = __UILogCategoryGetNode("Feedback", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v2, (unint64_t *)&_UIInternalPreference_EnableStatisticOnAllDevices_block_invoke_4___s_category);
    }
    v3 = *(NSObject **)(v2 + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(void **)(a1 + 32);
      v5 = v3;
      v6 = objc_msgSend(v4, "_backgroundTaskIdentifier");
      v7 = (void *)MEMORY[0x1E0CB3940];
      v8 = *(id *)(a1 + 32);
      objc_msgSend(v7, "stringWithFormat:", CFSTR("<%s: %p>"), object_getClassName(v8), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 134218242;
      v12 = v6;
      v13 = 2112;
      v14 = v9;
      _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "background task expired with ID %ld for engine %@", buf, 0x16u);

    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "_internal_deactivateEngineIfPossible");
}

@end
