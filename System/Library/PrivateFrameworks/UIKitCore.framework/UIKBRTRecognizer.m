@implementation UIKBRTRecognizer

uint64_t __26___UIKBRTRecognizer_reset__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  double v9;
  int v10;
  double v11;
  uint64_t result;
  double v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "copy", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "logTouchInfo:withPhase:", v7, 4);
        objc_msgSend(v7, "invalidateTimer");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "removeAllObjects");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "removeAllObjects");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "removeAllObjects");
  v8 = *(_QWORD *)(a1 + 32);
  if (_UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference__UIKBRT_HorizontalRestScaleValue, (uint64_t)CFSTR("_UIKBRT_HorizontalRestScaleValue")))v9 = 2.0;
  else
    v9 = *(double *)&qword_1EDDA7E58;
  v10 = _UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference__UIKBRT_VerticalRestScaleValue, (uint64_t)CFSTR("_UIKBRT_VerticalRestScaleValue"));
  v11 = *(double *)&qword_1EDDA7E48;
  if (v10)
    v11 = 0.666666667;
  *(double *)(v8 + 136) = v9;
  *(double *)(v8 + 144) = v11;
  result = _UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference__UIKBRT_MaximumNonRestMovePercent, (uint64_t)CFSTR("_UIKBRT_MaximumNonRestMovePercent"));
  v13 = *(double *)&qword_1EDDA7E68;
  if ((_DWORD)result)
    v13 = 0.333333333;
  *(double *)(*(_QWORD *)(a1 + 32) + 56) = v13;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = 0;
  return result;
}

double __45___UIKBRTRecognizer_setStandardKeyPixelSize___block_invoke(uint64_t a1)
{
  uint64_t v2;
  double v3;
  int v4;
  double v5;
  double v6;
  double v7;
  int v8;
  double v9;
  double v10;
  int v11;
  double v12;
  double result;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(double *)(a1 + 40);
  v4 = _UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference__UIKBRT_HorizontalRestScaleValue, (uint64_t)CFSTR("_UIKBRT_HorizontalRestScaleValue"));
  v5 = *(double *)&qword_1EDDA7E58;
  if (v4)
    v5 = 2.0;
  v6 = v3 * v5;
  v7 = *(double *)(a1 + 48);
  v8 = _UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference__UIKBRT_VerticalRestScaleValue, (uint64_t)CFSTR("_UIKBRT_VerticalRestScaleValue"));
  v9 = *(double *)&qword_1EDDA7E48;
  if (v8)
    v9 = 0.666666667;
  *(double *)(v2 + 136) = v6;
  *(double *)(v2 + 144) = v7 * v9;
  v10 = *(double *)(a1 + 48);
  v11 = _UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference__UIKBRT_MaximumNonRestMovePercent, (uint64_t)CFSTR("_UIKBRT_MaximumNonRestMovePercent"));
  v12 = *(double *)&qword_1EDDA7E68;
  if (v11)
    v12 = 0.333333333;
  result = v10 * v12;
  *(double *)(*(_QWORD *)(a1 + 32) + 56) = result;
  return result;
}

uint64_t __45___UIKBRTRecognizer_setDisableHomeRowReturn___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 9) = *(_BYTE *)(result + 40);
  return result;
}

BOOL __48___UIKBRTRecognizer__doBeginTouchWithTouchInfo___block_invoke(uint64_t a1, void *a2)
{
  double v2;
  double v3;

  v2 = *(double *)(a1 + 32);
  objc_msgSend(a2, "originalTimestamp");
  return v2 < v3;
}

uint64_t __48___UIKBRTRecognizer__doBeginTouchWithTouchInfo___block_invoke_2()
{
  return +[_UIKeyboardUsageTracking restAndTypeTriggered](_UIKeyboardUsageTracking, "restAndTypeTriggered");
}

uint64_t __48___UIKBRTRecognizer__doBeginTouchWithTouchInfo___block_invoke_3()
{
  return +[_UIKeyboardUsageTracking restAndTypeTriggered](_UIKeyboardUsageTracking, "restAndTypeTriggered");
}

void __48___UIKBRTRecognizer__doBeginTouchWithTouchInfo___block_invoke_4(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  int v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "letRulesModifyPendingTouchInfo:", v6);
    v5 = objc_msgSend(v6, "currentTouchState");
    if ((v5 - 1) < 3)
    {
      objc_msgSend(v4, "kbStatusMessage:", CFSTR("Resting touch on %@"), v6);
    }
    else
    {
      if ((v5 - 6) < 2)
      {
        objc_msgSend(v4, "kbStatusMessage:", CFSTR("Rested touch on %@"), v6);
        goto LABEL_10;
      }
      if (v5)
        goto LABEL_10;
      if (objc_msgSend(v4, "makeTouchActive:", v6))
      {
        objc_msgSend(v4, "kbStatusMessage:", CFSTR("Activating touch on %@"), v6);
        goto LABEL_10;
      }
      objc_msgSend(v4, "kbStatusMessage:", CFSTR("Deactiving beginning touch on %@"), v6);
    }
    objc_msgSend(v4, "makeTouchIgnored:force:", v6, 1);
  }
LABEL_10:

}

uint64_t __58___UIKBRTRecognizer_touchDown_withIdentifier_canLogTouch___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_doBeginTouchWithTouchInfo:", *(_QWORD *)(a1 + 40));
}

uint64_t __49___UIKBRTRecognizer_touchDragged_withIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_doMovedTouchWithTouchInfo:", *(_QWORD *)(a1 + 40));
}

uint64_t __48___UIKBRTRecognizer__doEndedTouchWithTouchInfo___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "removeObject:", *(_QWORD *)(a1 + 40));
}

uint64_t __44___UIKBRTRecognizer_touchUp_withIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_doEndedTouchWithTouchInfo:", *(_QWORD *)(a1 + 40));
}

uint64_t __52___UIKBRTRecognizer__doCancelledTouchWithTouchInfo___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "removeObject:", *(_QWORD *)(a1 + 40));
}

uint64_t __51___UIKBRTRecognizer_touchCancelled_withIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_doCancelledTouchWithTouchInfo:", *(_QWORD *)(a1 + 40));
}

uint64_t __56___UIKBRTRecognizer__doMarkTouchProcessedWithTouchInfo___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "removeObject:", *(_QWORD *)(a1 + 40));
}

uint64_t __55___UIKBRTRecognizer_markTouchProcessed_withIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_doMarkTouchProcessedWithTouchInfo:", *(_QWORD *)(a1 + 40));
}

uint64_t __58___UIKBRTRecognizer_explicitlyIgnoreTouch_withIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_doIgnoreTouchWithTouchInfo:", *(_QWORD *)(a1 + 40));
}

uint64_t __83___UIKBRTRecognizer_updateIgnoredTouchesForTouchInfo_whenTouchInfo_changesStateTo___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "containsObject:", *(_QWORD *)(a1 + 40));
  if ((_DWORD)result)
  {
    for (result = objc_msgSend(*(id *)(a1 + 40), "currentTouchState");
          result == 3;
    if ((char)result <= 5 && (char)result != 3)
      return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "removeObject:", *(_QWORD *)(a1 + 40));
  }
  return result;
}

uint64_t __42___UIKBRTRecognizer_addedToActiveTouches___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 88), "containsObject:", a1[5]);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = result ^ 1;
  if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
    return objc_msgSend(*(id *)(a1[4] + 88), "addObject:", a1[5]);
  return result;
}

uint64_t __46___UIKBRTRecognizer_removedFromActiveTouches___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 88), "containsObject:", a1[5]);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
    return objc_msgSend(*(id *)(a1[4] + 88), "removeObject:", a1[5]);
  return result;
}

void __80___UIKBRTRecognizer_queryDelegateToBeginTouch_forBeginState_restartIfNecessary___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  _QWORD v24[4];
  id v25;
  id v26;
  uint64_t v27;
  _QWORD v28[4];
  id v29;
  id v30;
  uint64_t v31;

  if (objc_msgSend(*(id *)(a1 + 32), "addedToActiveTouches:", *(_QWORD *)(a1 + 40)))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(v2 + 16);
    objc_msgSend(*(id *)(a1 + 40), "touchIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "originalTouchPoint");
    v6 = v5;
    v8 = v7;
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __80___UIKBRTRecognizer_queryDelegateToBeginTouch_forBeginState_restartIfNecessary___block_invoke_2;
    v28[3] = &unk_1E16D7F38;
    v9 = *(_QWORD *)(a1 + 64);
    v31 = *(_QWORD *)(a1 + 56);
    v29 = *(id *)(a1 + 40);
    v30 = *(id *)(a1 + 48);
    objc_msgSend(v3, "recognizer:beginTouchDownForTouchWithId:atPoint:forBeginState:whenStateReady:", v2, v4, v9, v28, v6, v8);

    v10 = v29;
LABEL_5:

    return;
  }
  if (*(_BYTE *)(a1 + 72))
  {
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 16);
    objc_msgSend(*(id *)(a1 + 40), "touchIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "originalTimestamp");
    v15 = v14;
    objc_msgSend(*(id *)(a1 + 40), "originalTouchPoint");
    v17 = v16;
    v19 = v18;
    objc_msgSend(*(id *)(a1 + 40), "currentTouchPoint");
    v21 = v20;
    v23 = v22;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __80___UIKBRTRecognizer_queryDelegateToBeginTouch_forBeginState_restartIfNecessary___block_invoke_3;
    v24[3] = &unk_1E16D7F38;
    v27 = *(_QWORD *)(a1 + 56);
    v25 = *(id *)(a1 + 40);
    v26 = *(id *)(a1 + 48);
    objc_msgSend(v12, "recognizer:restartTouchDownForTouchWithId:startingAt:atPoint:currentPoint:whenStateReady:", v11, v13, v24, v15, v17, v19, v21, v23);

    v10 = v25;
    goto LABEL_5;
  }
  if (*(_QWORD *)(a1 + 64) == 2)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void __80___UIKBRTRecognizer_queryDelegateToBeginTouch_forBeginState_restartIfNecessary___block_invoke_2(uint64_t a1, void *a2, char a3)
{
  void *v5;
  id v6;
  char v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v8 = a2;
  objc_msgSend(v5, "touchIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 == v8)
    v7 = a3;
  else
    v7 = 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v7;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __80___UIKBRTRecognizer_queryDelegateToBeginTouch_forBeginState_restartIfNecessary___block_invoke_3(uint64_t a1, void *a2, char a3)
{
  void *v5;
  id v6;
  char v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v8 = a2;
  objc_msgSend(v5, "touchIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 == v8)
    v7 = a3;
  else
    v7 = 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v7;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __53___UIKBRTRecognizer_notifyDelegateOfSuccessfulTouch___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  objc_msgSend(*(id *)(a1 + 40), "touchIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "originalTouchPoint");
  v6 = v5;
  v8 = v7;
  objc_msgSend(*(id *)(a1 + 40), "currentTouchPoint");
  v10 = v9;
  v12 = v11;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __53___UIKBRTRecognizer_notifyDelegateOfSuccessfulTouch___block_invoke_2;
  v14[3] = &unk_1E16D7F88;
  v13 = *(void **)(a1 + 40);
  v14[4] = *(_QWORD *)(a1 + 32);
  v15 = v13;
  v16 = *(id *)(a1 + 48);
  objc_msgSend(v3, "recognizer:releaseTouchToLayoutWithId:startPoint:endPoint:whenReady:", v2, v4, v14, v6, v8, v10, v12);

}

intptr_t __53___UIKBRTRecognizer_notifyDelegateOfSuccessfulTouch___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removedFromActiveTouches:", *(_QWORD *)(a1 + 40));
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void __52___UIKBRTRecognizer_notifyDelegateOfCancelledTouch___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  objc_msgSend(*(id *)(a1 + 40), "touchIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "originalTouchPoint");
  v6 = v5;
  v8 = v7;
  objc_msgSend(*(id *)(a1 + 40), "currentTouchPoint");
  v10 = v9;
  v12 = v11;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __52___UIKBRTRecognizer_notifyDelegateOfCancelledTouch___block_invoke_2;
  v14[3] = &unk_1E16D7F88;
  v13 = *(void **)(a1 + 40);
  v14[4] = *(_QWORD *)(a1 + 32);
  v15 = v13;
  v16 = *(id *)(a1 + 48);
  objc_msgSend(v3, "recognizer:cancelTouchOnLayoutWithId:startPoint:endPoint:whenReady:", v2, v4, v14, v6, v8, v10, v12);

}

intptr_t __52___UIKBRTRecognizer_notifyDelegateOfCancelledTouch___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removedFromActiveTouches:", *(_QWORD *)(a1 + 40));
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void __48___UIKBRTRecognizer_notifyDelegateOfMovedTouch___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t v18;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  objc_msgSend(*(id *)(a1 + 40), "touchIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "originalTimestamp");
  v6 = v5;
  objc_msgSend(*(id *)(a1 + 40), "originalTouchPoint");
  v8 = v7;
  v10 = v9;
  objc_msgSend(*(id *)(a1 + 40), "currentTouchPoint");
  v12 = v11;
  v14 = v13;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __48___UIKBRTRecognizer_notifyDelegateOfMovedTouch___block_invoke_2;
  v15[3] = &unk_1E16D7F38;
  v18 = *(_QWORD *)(a1 + 56);
  v16 = *(id *)(a1 + 40);
  v17 = *(id *)(a1 + 48);
  objc_msgSend(v3, "recognizer:shouldContinueTrackingTouchWithId:startingAt:atPoint:currentPoint:forContinueState:whenStateReady:", v2, v4, 0, v15, v6, v8, v10, v12, v14);

}

void __48___UIKBRTRecognizer_notifyDelegateOfMovedTouch___block_invoke_2(uint64_t a1, void *a2, char a3)
{
  void *v5;
  id v6;
  char v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v8 = a2;
  objc_msgSend(v5, "touchIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 == v8)
    v7 = a3;
  else
    v7 = 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v7;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __55___UIKBRTRecognizer_notifyDelegateOfMovedIgnoredTouch___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  _QWORD v9[4];
  id v10;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  objc_msgSend(*(id *)(a1 + 40), "touchIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "currentTouchPoint");
  v6 = v5;
  v8 = v7;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55___UIKBRTRecognizer_notifyDelegateOfMovedIgnoredTouch___block_invoke_2;
  v9[3] = &unk_1E16D7FB0;
  v10 = *(id *)(a1 + 48);
  objc_msgSend(v3, "recognizer:continueTrackingIgnoredTouchWithId:currentPoint:whenReady:", v2, v4, v9, v6, v8);

}

intptr_t __55___UIKBRTRecognizer_notifyDelegateOfMovedIgnoredTouch___block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __64___UIKBRTRecognizer_queryDelegateOfIgnoringTouch_forOtherTouch___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t v19;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  objc_msgSend(*(id *)(a1 + 40), "touchIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "originalTimestamp");
  v6 = v5;
  objc_msgSend(*(id *)(a1 + 40), "originalTouchPoint");
  v8 = v7;
  v10 = v9;
  objc_msgSend(*(id *)(a1 + 40), "currentTouchPoint");
  v12 = v11;
  v14 = v13;
  if (*(_BYTE *)(a1 + 64))
    v15 = 3;
  else
    v15 = 1;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __64___UIKBRTRecognizer_queryDelegateOfIgnoringTouch_forOtherTouch___block_invoke_2;
  v16[3] = &unk_1E16D7F38;
  v19 = *(_QWORD *)(a1 + 56);
  v17 = *(id *)(a1 + 40);
  v18 = *(id *)(a1 + 48);
  objc_msgSend(v3, "recognizer:shouldContinueTrackingTouchWithId:startingAt:atPoint:currentPoint:forContinueState:whenStateReady:", v2, v4, v15, v16, v6, v8, v10, v12, v14);

}

void __64___UIKBRTRecognizer_queryDelegateOfIgnoringTouch_forOtherTouch___block_invoke_2(uint64_t a1, void *a2, char a3)
{
  void *v5;
  id v6;
  char v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v8 = a2;
  objc_msgSend(v5, "touchIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = a3 ^ 1;
  if (v6 != v8)
    v7 = 1;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v7;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __51___UIKBRTRecognizer_notifyDelegateOfIgnoringTouch___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _QWORD v15[4];
  id v16;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  objc_msgSend(*(id *)(a1 + 40), "touchIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "originalTimestamp");
  v6 = v5;
  objc_msgSend(*(id *)(a1 + 40), "originalTouchPoint");
  v8 = v7;
  v10 = v9;
  objc_msgSend(*(id *)(a1 + 40), "currentTouchPoint");
  v12 = v11;
  v14 = v13;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __51___UIKBRTRecognizer_notifyDelegateOfIgnoringTouch___block_invoke_2;
  v15[3] = &unk_1E16D7FB0;
  v16 = *(id *)(a1 + 48);
  objc_msgSend(v3, "recognizer:willIgnoreTouchWithId:startingAt:atPoint:currentPoint:whenReady:", v2, v4, v15, v6, v8, v10, v12, v14);

}

intptr_t __51___UIKBRTRecognizer_notifyDelegateOfIgnoringTouch___block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __54___UIKBRTRecognizer_cancelTouchOnLayoutWithTouchInfo___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  _QWORD v13[4];
  id v14;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  objc_msgSend(*(id *)(a1 + 40), "touchIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "originalTouchPoint");
  v6 = v5;
  v8 = v7;
  objc_msgSend(*(id *)(a1 + 40), "currentTouchPoint");
  v10 = v9;
  v12 = v11;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __54___UIKBRTRecognizer_cancelTouchOnLayoutWithTouchInfo___block_invoke_2;
  v13[3] = &unk_1E16D7FB0;
  v14 = *(id *)(a1 + 48);
  objc_msgSend(v3, "recognizer:cancelTouchOnLayoutWithId:startPoint:endPoint:whenReady:", v2, v4, v13, v6, v8, v10, v12);

}

intptr_t __54___UIKBRTRecognizer_cancelTouchOnLayoutWithTouchInfo___block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __37___UIKBRTRecognizer_makeTouchActive___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    if (objc_msgSend(WeakRetained, "queryDelegateOfRestingTouch:", v5))
    {
      objc_msgSend(v4, "notifyDelegateOfRestingTouch:", v5);
    }
    else if (objc_msgSend(v5, "currentTouchState") != 5)
    {
      ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 120);
      objc_msgSend(v5, "setCurrentTouchState:", 5);
    }
  }

}

uint64_t __56___UIKBRTRecognizer_makeTouchIgnored_force_withMessage___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "containsObject:", *(_QWORD *)(a1 + 40));
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "addObject:", *(_QWORD *)(a1 + 40));
  return result;
}

@end
