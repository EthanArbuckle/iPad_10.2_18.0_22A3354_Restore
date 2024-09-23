@implementation UIKeyboardTextSelectionInteraction

uint64_t __53___UIKeyboardTextSelectionInteraction_registerOwner___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 128);
  *(_QWORD *)(v2 + 128) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "detach");
}

void __108___UIKeyboardTextSelectionInteraction_indirectCursorPanGestureWithState_withTranslation_withFlickDirection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[5];

  v3 = a2;
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 40);
  switch(v5)
  {
    case 3:
      v6 = *(void **)(a1 + 32);
      if (*(_QWORD *)(a1 + 64))
      {
        v7 = objc_msgSend(*(id *)(a1 + 32), "layoutDirectionFromFlickDirection:");
        v8 = *(void **)(a1 + 32);
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __108___UIKeyboardTextSelectionInteraction_indirectCursorPanGestureWithState_withTranslation_withFlickDirection___block_invoke_2;
        v11[3] = &unk_1E16BAF98;
        v11[4] = v8;
        objc_msgSend(v4, "childWithContinuation:", v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "handleTwoFingerFlickInDirection:executionContext:", v7, v9);
      }
      else
      {
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __108___UIKeyboardTextSelectionInteraction_indirectCursorPanGestureWithState_withTranslation_withFlickDirection___block_invoke_3;
        v10[3] = &unk_1E16BAF98;
        v10[4] = v6;
        objc_msgSend(v3, "childWithContinuation:", v10);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "updateTwoFingerPanWithTranslation:executionContext:", v9, *(double *)(a1 + 48), *(double *)(a1 + 56));
      }

      break;
    case 2:
      objc_msgSend(*(id *)(a1 + 32), "updateTwoFingerPanWithTranslation:executionContext:", v3, *(double *)(a1 + 48), *(double *)(a1 + 56));
      break;
    case 1:
      objc_msgSend(*(id *)(a1 + 32), "beginTwoFingerCursorPanWithTranslation:executionContext:", v3, *(double *)(a1 + 48), *(double *)(a1 + 56));
      break;
    default:
      objc_msgSend(*(id *)(a1 + 32), "cancelTwoFingerPanWithExecutionContext:", v3);
      break;
  }

}

uint64_t __108___UIKeyboardTextSelectionInteraction_indirectCursorPanGestureWithState_withTranslation_withFlickDirection___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "endTwoFingerPanWithExecutionContext:", a2);
}

uint64_t __108___UIKeyboardTextSelectionInteraction_indirectCursorPanGestureWithState_withTranslation_withFlickDirection___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "endTwoFingerPanWithExecutionContext:", a2);
}

void __88___UIKeyboardTextSelectionInteraction_indirectBlockPanGestureWithState_withTranslation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  v3 = a2;
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 40);
  switch(v5)
  {
    case 3:
      v6 = *(void **)(a1 + 32);
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __88___UIKeyboardTextSelectionInteraction_indirectBlockPanGestureWithState_withTranslation___block_invoke_2;
      v8[3] = &unk_1E16BAF98;
      v8[4] = v6;
      objc_msgSend(v3, "childWithContinuation:", v8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "updateIndirectBlockPanWithTranslation:executionContext:", v7, *(double *)(a1 + 48), *(double *)(a1 + 56));

      break;
    case 2:
      objc_msgSend(*(id *)(a1 + 32), "updateIndirectBlockPanWithTranslation:executionContext:", v3, *(double *)(a1 + 48), *(double *)(a1 + 56));
      break;
    case 1:
      objc_msgSend(*(id *)(a1 + 32), "beginIndirectBlockPanWithTranslation:executionContext:", v3, *(double *)(a1 + 48), *(double *)(a1 + 56));
      break;
    default:
      objc_msgSend(*(id *)(a1 + 32), "endIndirectBlockPanWithExecutionContext:", v3);
      break;
  }

}

uint64_t __88___UIKeyboardTextSelectionInteraction_indirectBlockPanGestureWithState_withTranslation___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "endIndirectBlockPanWithExecutionContext:", a2);
}

void __93___UIKeyboardTextSelectionInteraction_beginIndirectBlockPanWithTranslation_executionContext___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v2, "selectionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "beginSelection");

  objc_msgSend(v4, "returnExecutionToParent");
}

void __88___UIKeyboardTextSelectionInteraction_handleTwoFingerFlickInDirection_executionContext___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "selectionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = *(unsigned __int8 *)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 32), "selectionController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = *(_QWORD *)(a1 + 48);
    v7 = *(_QWORD *)(a1 + 56);
    v8 = *(_QWORD *)(a1 + 40);
    if (v3)
      objc_msgSend(v4, "selectPositionAtBoundary:inDirection:executionContext:", v6, v7, v8);
    else
      objc_msgSend(v4, "selectImmediatePositionAtBoundary:inDirection:executionContext:", v6, v7, v8);

    objc_msgSend(*(id *)(a1 + 32), "selectionController");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "scrollSelectionToVisible");

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "returnExecutionToParent");
  }
}

void __70___UIKeyboardTextSelectionInteraction_clearKeyboardTouchesForGesture___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v2, "cancelTouchesForTwoFingerTapGesture:", v3);
  objc_msgSend(v4, "returnExecutionToParent");

}

void __109___UIKeyboardTextSelectionInteraction__granularityExpandingGestureWithTimeInterval_timeGranularity_isMidPan___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _BOOL4 IsNull;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  char v18;
  uint64_t v19;
  int64_t v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  char v30;
  _QWORD v31[5];
  char v32;
  CGRect v33;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "selectionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "caretRectForCursorPosition");
  IsNull = CGRectIsNull(v33);

  if (IsNull)
  {
LABEL_19:
    objc_msgSend(v3, "returnExecutionToParent");
    goto LABEL_22;
  }
  objc_msgSend(*(id *)(a1 + 32), "selectionController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "caretRectForCursorPosition");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = *(double *)(a1 + 48);
  v16 = *(double *)(a1 + 56);
  if (v15 < v16)
  {
    v18 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "selectionController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "hasRangedSelection");

  }
  if (!*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 32), "selectionController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v21, "selectionGranularity");

    if ((v18 & 1) != 0)
      goto LABEL_7;
LABEL_9:
    v20 = +[UITextInteractionAssistant _nextGranularityInCycle:forTouchType:](UITextInteractionAssistant, "_nextGranularityInCycle:forTouchType:", v19, 0);
    goto LABEL_10;
  }
  v19 = objc_msgSend(*(id *)(a1 + 40), "previousRepeatedGranularity");
  if ((v18 & 1) == 0)
    goto LABEL_9;
LABEL_7:
  v20 = 0;
LABEL_10:
  if (v15 < v16 && !*(_BYTE *)(a1 + 64) && !objc_msgSend(*(id *)(a1 + 40), "previousRepeatedGranularity"))
    v20 = 2;
  objc_msgSend(*(id *)(a1 + 40), "setPreviousRepeatedGranularity:", v20);
  objc_msgSend(*(id *)(a1 + 32), "selectionController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
    goto LABEL_19;
  v23 = v12 * 0.5;
  v24 = v14 * 0.5;
  if (!*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 32), "selectionController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "beginSelection");

  }
  v26 = v8 + v23;
  objc_msgSend(*(id *)(a1 + 32), "selectionController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __109___UIKeyboardTextSelectionInteraction__granularityExpandingGestureWithTimeInterval_timeGranularity_isMidPan___block_invoke_3;
    v29[3] = &unk_1E16BBCF8;
    v30 = *(_BYTE *)(a1 + 64);
    v29[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "childWithContinuation:", v29);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "selectTextWithGranularity:atPoint:executionContext:", v20, v28, v26, v10 + v24);
  }
  else
  {
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __109___UIKeyboardTextSelectionInteraction__granularityExpandingGestureWithTimeInterval_timeGranularity_isMidPan___block_invoke_2;
    v31[3] = &unk_1E16BBCF8;
    v32 = *(_BYTE *)(a1 + 64);
    v31[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "childWithContinuation:", v31);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "selectPositionAtPoint:executionContext:", v28, v26, v10 + v24);
  }

LABEL_22:
}

void __109___UIKeyboardTextSelectionInteraction__granularityExpandingGestureWithTimeInterval_timeGranularity_isMidPan___block_invoke_2(uint64_t a1, void *a2)
{
  int v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(unsigned __int8 *)(a1 + 40);
  v3 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v3, "selectionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v2)
    objc_msgSend(v4, "restartSelection");
  else
    objc_msgSend(v4, "endSelection");

  objc_msgSend(v6, "returnExecutionToParent");
}

void __109___UIKeyboardTextSelectionInteraction__granularityExpandingGestureWithTimeInterval_timeGranularity_isMidPan___block_invoke_3(uint64_t a1, void *a2)
{
  int v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(unsigned __int8 *)(a1 + 40);
  v3 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v3, "selectionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v2)
    objc_msgSend(v4, "restartSelection");
  else
    objc_msgSend(v4, "endSelection");

  objc_msgSend(v6, "returnExecutionToParent");
}

void __92___UIKeyboardTextSelectionInteraction_longPressGestureWithState_withTranslation_touchCount___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _QWORD v12[5];
  __int128 v13;
  uint64_t v14;
  _QWORD v15[5];
  __int128 v16;
  uint64_t v17;
  _QWORD v18[5];
  __int128 v19;
  uint64_t v20;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  v11 = v3;
  if (v4 == 3)
  {
    objc_msgSend(*(id *)(a1 + 32), "endLongPressWithExecutionContext:", v3);
    objc_msgSend(MEMORY[0x1E0DAFEC0], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[2] = __92___UIKeyboardTextSelectionInteraction_longPressGestureWithState_withTranslation_touchCount___block_invoke_3;
    v15[3] = &unk_1E16D8A50;
    v9 = *(_QWORD *)(a1 + 40);
    v15[4] = *(_QWORD *)(a1 + 32);
    v15[1] = 3221225472;
    v16 = *(_OWORD *)(a1 + 48);
    v17 = v9;
    v8 = v15;
LABEL_8:
    objc_msgSend(v5, "logBlock:domain:", v8, CFSTR("com.apple.keyboard.UIKit"));

    goto LABEL_9;
  }
  if (v4 != 2)
  {
    if (v4 == 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "beginLongPressWithTranslation:touchCount:executionContext:", *(_QWORD *)(a1 + 64), v3, *(double *)(a1 + 48), *(double *)(a1 + 56));
      objc_msgSend(MEMORY[0x1E0DAFEC0], "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v18[0] = MEMORY[0x1E0C809B0];
      v18[2] = __92___UIKeyboardTextSelectionInteraction_longPressGestureWithState_withTranslation_touchCount___block_invoke_2;
      v18[3] = &unk_1E16D8A50;
      v7 = *(_QWORD *)(a1 + 40);
      v18[4] = *(_QWORD *)(a1 + 32);
      v18[1] = 3221225472;
      v19 = *(_OWORD *)(a1 + 48);
      v20 = v7;
      v8 = v18;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "cancelLongPressWithExecutionContext:", v3);
      objc_msgSend(MEMORY[0x1E0DAFEC0], "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[2] = __92___UIKeyboardTextSelectionInteraction_longPressGestureWithState_withTranslation_touchCount___block_invoke_4;
      v12[3] = &unk_1E16D8A50;
      v10 = *(_QWORD *)(a1 + 40);
      v12[4] = *(_QWORD *)(a1 + 32);
      v12[1] = 3221225472;
      v13 = *(_OWORD *)(a1 + 48);
      v14 = v10;
      v8 = v12;
    }
    goto LABEL_8;
  }
  objc_msgSend(*(id *)(a1 + 32), "updateLongPressWithTranslation:executionContext:", v3, *(double *)(a1 + 48), *(double *)(a1 + 56));
LABEL_9:

}

id __92___UIKeyboardTextSelectionInteraction_longPressGestureWithState_withTranslation_touchCount___block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  _QWORD *v10;
  void *v11;
  _BOOL4 isViewKeyboardLayoutPresent;
  __CFString **v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[6];
  _QWORD v21[7];

  v21[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "cursorLocationForTranslation:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  v3 = v2;
  v5 = v4;
  v21[0] = CFSTR("KeyboardTextSelection");
  v20[0] = CFSTR("KeyboardEventType");
  v20[1] = CFSTR("Operation");
  objc_msgSend(*(id *)(a1 + 32), "owner");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textSelectionController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasRangedSelection");
  v10 = (_QWORD *)MEMORY[0x1E0DBE960];
  if (!v9)
    v10 = (_QWORD *)MEMORY[0x1E0DBE968];
  v21[1] = *v10;
  v20[2] = CFSTR("TriggerType");
  objc_msgSend(*(id *)(a1 + 32), "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  isViewKeyboardLayoutPresent = _isViewKeyboardLayoutPresent(v11);
  v13 = UIKBAnalyticsGestureIsOnKeyboard;
  if (!isViewKeyboardLayoutPresent)
    v13 = UIKBAnalyticsGestureIsOnCanvas;
  objc_msgSend(CFSTR("Two fingers"), "stringByAppendingString:", *v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v14;
  v20[3] = CFSTR("CursorLocationX");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v15;
  v20[4] = CFSTR("CursorLocationY");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[4] = v16;
  v20[5] = CFSTR("GestureState");
  _UIGestureRecognizerStateString(*(_QWORD *)(a1 + 56));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[5] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

id __92___UIKeyboardTextSelectionInteraction_longPressGestureWithState_withTranslation_touchCount___block_invoke_3(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  _QWORD *v10;
  void *v11;
  _BOOL4 isViewKeyboardLayoutPresent;
  __CFString **v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[6];
  _QWORD v21[7];

  v21[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "cursorLocationForTranslation:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  v3 = v2;
  v5 = v4;
  v21[0] = CFSTR("KeyboardTextSelection");
  v20[0] = CFSTR("KeyboardEventType");
  v20[1] = CFSTR("Operation");
  objc_msgSend(*(id *)(a1 + 32), "owner");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textSelectionController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasRangedSelection");
  v10 = (_QWORD *)MEMORY[0x1E0DBE960];
  if (!v9)
    v10 = (_QWORD *)MEMORY[0x1E0DBE968];
  v21[1] = *v10;
  v20[2] = CFSTR("TriggerType");
  objc_msgSend(*(id *)(a1 + 32), "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  isViewKeyboardLayoutPresent = _isViewKeyboardLayoutPresent(v11);
  v13 = UIKBAnalyticsGestureIsOnKeyboard;
  if (!isViewKeyboardLayoutPresent)
    v13 = UIKBAnalyticsGestureIsOnCanvas;
  objc_msgSend(CFSTR("Two fingers"), "stringByAppendingString:", *v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v14;
  v20[3] = CFSTR("CursorLocationX");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v15;
  v20[4] = CFSTR("CursorLocationY");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[4] = v16;
  v20[5] = CFSTR("GestureState");
  _UIGestureRecognizerStateString(*(_QWORD *)(a1 + 56));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[5] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

id __92___UIKeyboardTextSelectionInteraction_longPressGestureWithState_withTranslation_touchCount___block_invoke_4(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  _BOOL4 isViewKeyboardLayoutPresent;
  __CFString **v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[6];
  _QWORD v16[7];

  v16[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "cursorLocationForTranslation:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  v3 = v2;
  v5 = v4;
  v15[0] = CFSTR("KeyboardEventType");
  v15[1] = CFSTR("Operation");
  v16[0] = CFSTR("KeyboardTextSelection");
  v16[1] = CFSTR("Cancel cursor");
  v15[2] = CFSTR("TriggerType");
  objc_msgSend(*(id *)(a1 + 32), "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  isViewKeyboardLayoutPresent = _isViewKeyboardLayoutPresent(v6);
  v8 = UIKBAnalyticsGestureIsOnKeyboard;
  if (!isViewKeyboardLayoutPresent)
    v8 = UIKBAnalyticsGestureIsOnCanvas;
  objc_msgSend(CFSTR("Two fingers"), "stringByAppendingString:", *v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v9;
  v15[3] = CFSTR("CursorLocationX");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v10;
  v15[4] = CFSTR("CursorLocationY");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[4] = v11;
  v15[5] = CFSTR("GestureState");
  _UIGestureRecognizerStateString(*(_QWORD *)(a1 + 56));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[5] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void __122___UIKeyboardTextSelectionInteraction_indirectPanGestureWithState_withTranslation_withFlickDirection_isShiftKeyBeingHeld___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  _QWORD v12[5];

  v3 = a2;
  v4 = v3;
  switch(*(_QWORD *)(a1 + 40))
  {
    case 0:
      goto LABEL_4;
    case 1:
      objc_msgSend(*(id *)(a1 + 32), "owner");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "didFloatCursor");

      if (v6)
        objc_msgSend(v4, "returnExecutionToParent");
      else
LABEL_4:
        objc_msgSend(*(id *)(a1 + 32), "beginTwoFingerPanWithTranslation:isShiftKeyBeingHeld:executionContext:", *(unsigned __int8 *)(a1 + 72), v4, *(double *)(a1 + 48), *(double *)(a1 + 56));
      break;
    case 2:
      objc_msgSend(*(id *)(a1 + 32), "updateTwoFingerPanWithTranslation:executionContext:", v3, *(double *)(a1 + 48), *(double *)(a1 + 56));
      break;
    case 3:
      v7 = *(void **)(a1 + 32);
      if (*(_QWORD *)(a1 + 64))
      {
        v8 = objc_msgSend(*(id *)(a1 + 32), "layoutDirectionFromFlickDirection:");
        v9 = *(void **)(a1 + 32);
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __122___UIKeyboardTextSelectionInteraction_indirectPanGestureWithState_withTranslation_withFlickDirection_isShiftKeyBeingHeld___block_invoke_2;
        v12[3] = &unk_1E16BAF98;
        v12[4] = v9;
        objc_msgSend(v4, "childWithContinuation:", v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "handleTwoFingerFlickInDirection:executionContext:", v8, v10);
      }
      else
      {
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __122___UIKeyboardTextSelectionInteraction_indirectPanGestureWithState_withTranslation_withFlickDirection_isShiftKeyBeingHeld___block_invoke_3;
        v11[3] = &unk_1E16BAF98;
        v11[4] = v7;
        objc_msgSend(v3, "childWithContinuation:", v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "updateTwoFingerPanWithTranslation:executionContext:", v10, *(double *)(a1 + 48), *(double *)(a1 + 56));
      }

      break;
    default:
      objc_msgSend(*(id *)(a1 + 32), "cancelTwoFingerPanWithExecutionContext:", v3);
      break;
  }

}

uint64_t __122___UIKeyboardTextSelectionInteraction_indirectPanGestureWithState_withTranslation_withFlickDirection_isShiftKeyBeingHeld___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "endTwoFingerPanWithExecutionContext:", a2);
}

uint64_t __122___UIKeyboardTextSelectionInteraction_indirectPanGestureWithState_withTranslation_withFlickDirection_isShiftKeyBeingHeld___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "endTwoFingerPanWithExecutionContext:", a2);
}

id __57___UIKeyboardTextSelectionInteraction_oneFingerForcePan___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  _BOOL4 isViewKeyboardLayoutPresent;
  __CFString **v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[6];
  _QWORD v17[7];

  v17[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "cursorLocationForTranslation:", *(double *)(a1 + 56), *(double *)(a1 + 64));
  v3 = v2;
  v5 = v4;
  v17[0] = CFSTR("KeyboardTextSelection");
  v16[0] = CFSTR("KeyboardEventType");
  v16[1] = CFSTR("Operation");
  UIKBAnalyticsSelectionTypeForGranularity(objc_msgSend(*(id *)(a1 + 40), "previousRepeatedGranularity"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v6;
  v16[2] = CFSTR("TriggerType");
  objc_msgSend(*(id *)(a1 + 48), "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  isViewKeyboardLayoutPresent = _isViewKeyboardLayoutPresent(v7);
  v9 = UIKBAnalyticsGestureIsOnKeyboard;
  if (!isViewKeyboardLayoutPresent)
    v9 = UIKBAnalyticsGestureIsOnCanvas;
  objc_msgSend(CFSTR("Force pan"), "stringByAppendingString:", *v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v10;
  v16[3] = CFSTR("CursorLocationX");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v11;
  v16[4] = CFSTR("CursorLocationY");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = v12;
  v16[5] = CFSTR("GestureState");
  _UIGestureRecognizerStateString(objc_msgSend(*(id *)(a1 + 48), "state"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[5] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

id __57___UIKeyboardTextSelectionInteraction_oneFingerForcePan___block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[6];
  _QWORD v10[7];

  v10[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "cursorLocationForTranslation:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  v3 = v2;
  v9[0] = CFSTR("KeyboardEventType");
  v9[1] = CFSTR("Operation");
  v10[0] = CFSTR("KeyboardTextSelection");
  v10[1] = CFSTR("End selection gesture");
  v10[2] = CFSTR("Force pan");
  v9[2] = CFSTR("TriggerType");
  v9[3] = CFSTR("CursorLocationX");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v4;
  v9[4] = CFSTR("CursorLocationY");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[4] = v5;
  v9[5] = CFSTR("GestureState");
  _UIGestureRecognizerStateString(objc_msgSend(*(id *)(a1 + 40), "state"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[5] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __52___UIKeyboardTextSelectionInteraction_twoFingerTap___block_invoke(uint64_t a1)
{
  void *v2;
  __CFString **v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("KeyboardTextSelection");
  v8[0] = CFSTR("KeyboardEventType");
  v8[1] = CFSTR("Operation");
  UIKBAnalyticsSelectionTypeForGranularity(objc_msgSend(*(id *)(a1 + 32), "previousRepeatedGranularity"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v2;
  v8[2] = CFSTR("TriggerType");
  v3 = UIKBAnalyticsGestureIsOnKeyboard;
  if (!*(_BYTE *)(a1 + 48))
    v3 = UIKBAnalyticsGestureIsOnCanvas;
  objc_msgSend(CFSTR("Two fingers"), "stringByAppendingString:", *v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v4;
  v8[3] = CFSTR("GestureState");
  _UIGestureRecognizerStateString(objc_msgSend(*(id *)(a1 + 40), "state"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[4] = CFSTR("Count");
  v9[3] = v5;
  v9[4] = &unk_1E1A991F8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __52___UIKeyboardTextSelectionInteraction_twoFingerTap___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  _BOOL4 isViewKeyboardLayoutPresent;
  __CFString **v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  _QWORD v12[6];

  v12[5] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("KeyboardTextSelection");
  v11[0] = CFSTR("KeyboardEventType");
  v11[1] = CFSTR("Operation");
  UIKBAnalyticsSelectionTypeForGranularity(objc_msgSend(*(id *)(a1 + 32), "previousRepeatedGranularity"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v2;
  v11[2] = CFSTR("TriggerType");
  objc_msgSend(*(id *)(a1 + 40), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  isViewKeyboardLayoutPresent = _isViewKeyboardLayoutPresent(v3);
  v5 = UIKBAnalyticsGestureIsOnKeyboard;
  if (!isViewKeyboardLayoutPresent)
    v5 = UIKBAnalyticsGestureIsOnCanvas;
  objc_msgSend(CFSTR("Two fingers"), "stringByAppendingString:", *v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v6;
  v11[3] = CFSTR("GestureState");
  _UIGestureRecognizerStateString(objc_msgSend(*(id *)(a1 + 40), "state"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v7;
  v11[4] = CFSTR("Count");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 48));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[4] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __54___UIKeyboardTextSelectionInteraction_panningGesture___block_invoke(uint64_t a1)
{
  id v2;
  __CFString **v3;
  char GestureKeyboardFlag;
  void *v5;
  _BOOL4 isViewKeyboardLayoutPresent;
  __CFString **v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[7];
  _QWORD v18[8];

  v18[7] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  if (objc_msgSend(*(id *)(a1 + 32), "isSpacePan"))
  {
    v3 = UIKBAnalyticsSpaceBarPan;
  }
  else
  {
    GestureKeyboardFlag = _getGestureKeyboardFlag(*(void **)(a1 + 40));
    v3 = UIKBAnalyticsOneFingerTap;
    if ((GestureKeyboardFlag & 4) == 0)
      v3 = UIKBAnalyticsTwoFingerTap;
  }
  objc_msgSend(v2, "appendString:", *v3);
  objc_msgSend(*(id *)(a1 + 40), "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  isViewKeyboardLayoutPresent = _isViewKeyboardLayoutPresent(v5);
  v7 = UIKBAnalyticsGestureIsOnKeyboard;
  if (!isViewKeyboardLayoutPresent)
    v7 = UIKBAnalyticsGestureIsOnCanvas;
  objc_msgSend(v2, "appendString:", *v7);

  v18[0] = CFSTR("TextEditing");
  v17[0] = CFSTR("KeyboardEventType");
  v17[1] = CFSTR("Operation");
  UIKBAnalyticsSelectionTypeForGranularity(objc_msgSend(*(id *)(a1 + 32), "previousRepeatedGranularity"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v8;
  v18[2] = v2;
  v17[2] = CFSTR("TriggerType");
  v17[3] = CFSTR("GestureState");
  _UIGestureRecognizerStateString(objc_msgSend(*(id *)(a1 + 40), "state"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v9;
  v17[4] = CFSTR("CursorLocationX");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[4] = v10;
  v17[5] = CFSTR("CursorLocationY");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 56));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[5] = v11;
  v17[6] = CFSTR("UsingShiftKey");
  v12 = (void *)MEMORY[0x1E0CB37E8];
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "numberWithBool:", objc_msgSend(v13, "isShiftKeyBeingHeld"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[6] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id __54___UIKeyboardTextSelectionInteraction_panningGesture___block_invoke_2(uint64_t a1)
{
  id v2;
  __CFString **v3;
  char GestureKeyboardFlag;
  void *v5;
  _BOOL4 isViewKeyboardLayoutPresent;
  __CFString **v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[7];
  _QWORD v18[8];

  v18[7] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  if (objc_msgSend(*(id *)(a1 + 32), "isSpacePan"))
  {
    v3 = UIKBAnalyticsSpaceBarPan;
  }
  else
  {
    GestureKeyboardFlag = _getGestureKeyboardFlag(*(void **)(a1 + 40));
    v3 = UIKBAnalyticsOneFingerTap;
    if ((GestureKeyboardFlag & 4) == 0)
      v3 = UIKBAnalyticsTwoFingerTap;
  }
  objc_msgSend(v2, "appendString:", *v3);
  objc_msgSend(*(id *)(a1 + 40), "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  isViewKeyboardLayoutPresent = _isViewKeyboardLayoutPresent(v5);
  v7 = UIKBAnalyticsGestureIsOnKeyboard;
  if (!isViewKeyboardLayoutPresent)
    v7 = UIKBAnalyticsGestureIsOnCanvas;
  objc_msgSend(v2, "appendString:", *v7);

  v18[0] = CFSTR("TextEditing");
  v17[0] = CFSTR("KeyboardEventType");
  v17[1] = CFSTR("Operation");
  UIKBAnalyticsSelectionTypeForGranularity(objc_msgSend(*(id *)(a1 + 32), "previousRepeatedGranularity"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v8;
  v18[2] = v2;
  v17[2] = CFSTR("TriggerType");
  v17[3] = CFSTR("GestureState");
  _UIGestureRecognizerStateString(objc_msgSend(*(id *)(a1 + 40), "state"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v9;
  v17[4] = CFSTR("CursorLocationX");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[4] = v10;
  v17[5] = CFSTR("CursorLocationY");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 56));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[5] = v11;
  v17[6] = CFSTR("UsingShiftKey");
  v12 = (void *)MEMORY[0x1E0CB37E8];
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "numberWithBool:", objc_msgSend(v13, "isShiftKeyBeingHeld"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[6] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

void __54___UIKeyboardTextSelectionInteraction_panningGesture___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "recognizerForName:", CFSTR("_UIKeyboardTextSelectionGestureForcePress"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setShouldFailWithoutForce:", objc_msgSend(*(id *)(a1 + 40), "oneFingerForcePressShouldFailWithoutForce"));
  objc_msgSend(*(id *)(a1 + 32), "_didEndIndirectSelectionGesture:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "_clearTouchPadCallback");

}

void __73___UIKeyboardTextSelectionInteraction__startTouchPadTimerWithCompletion___block_invoke(uint64_t a1)
{
  void (**v2)(void);

  objc_msgSend(*(id *)(a1 + 32), "_cancelTouchPadTimer");
  v2 = (void (**)(void))_Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 152));
  objc_msgSend(*(id *)(a1 + 32), "_clearTouchPadCallback");
  v2[2]();

}

id __59___UIKeyboardTextSelectionInteraction_oneFingerForcePress___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[7];
  _QWORD v16[8];

  v16[7] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "cursorLocationForTranslation:", *(double *)(a1 + 56), *(double *)(a1 + 64));
  v3 = v2;
  v5 = v4;
  v16[0] = CFSTR("KeyboardTextSelection");
  v15[0] = CFSTR("KeyboardEventType");
  v15[1] = CFSTR("Operation");
  UIKBAnalyticsSelectionTypeForGranularity(objc_msgSend(*(id *)(a1 + 40), "previousRepeatedGranularity"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v6;
  v16[2] = CFSTR("Force press");
  v15[2] = CFSTR("TriggerType");
  v15[3] = CFSTR("Count");
  v7 = *(_QWORD *)(a1 + 48);
  if (v7)
    v8 = *(_QWORD *)(v7 + 144);
  else
    v8 = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v9;
  v15[4] = CFSTR("GestureState");
  UIKBAnalyticsSelectionTypeForGestureState(objc_msgSend(*(id *)(a1 + 40), "panGestureState"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[4] = v10;
  v15[5] = CFSTR("CursorLocationX");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[5] = v11;
  v15[6] = CFSTR("CursorLocationY");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[6] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
