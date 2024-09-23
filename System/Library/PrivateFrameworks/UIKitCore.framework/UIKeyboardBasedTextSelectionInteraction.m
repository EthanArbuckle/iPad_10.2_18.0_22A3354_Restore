@implementation UIKeyboardBasedTextSelectionInteraction

void __104___UIKeyboardBasedTextSelectionInteraction_transitionFromBlockMagnifyToBlockSelectWithLocation_viaDrag___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "selectionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "selectionController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "beginSelection");

    objc_msgSend(*(id *)(a1 + 32), "selectionController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(*(id *)(a1 + 40), "previousRepeatedGranularity");
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __104___UIKeyboardBasedTextSelectionInteraction_transitionFromBlockMagnifyToBlockSelectWithLocation_viaDrag___block_invoke_2;
    v9[3] = &unk_1E16BAF98;
    v10 = *(id *)(a1 + 40);
    objc_msgSend(v3, "childWithContinuation:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateSelectionWithExtentPoint:withBoundary:executionContext:", v7, v8, *(double *)(a1 + 48), *(double *)(a1 + 56));

  }
  else
  {
    objc_msgSend(v3, "returnExecutionToParent");
  }

}

void __104___UIKeyboardBasedTextSelectionInteraction_transitionFromBlockMagnifyToBlockSelectWithLocation_viaDrag___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "setPanGestureState:", 6);
  objc_msgSend(v3, "returnExecutionToParent");

}

void __104___UIKeyboardBasedTextSelectionInteraction_transitionFromBlockMagnifyToBlockSelectWithLocation_viaDrag___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  uint64_t v15;
  __int128 v16;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "selectionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "selectionController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(*(id *)(a1 + 40), "previousRepeatedGranularity");
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __104___UIKeyboardBasedTextSelectionInteraction_transitionFromBlockMagnifyToBlockSelectWithLocation_viaDrag___block_invoke_4;
    v13 = &unk_1E16BB350;
    v7 = *(id *)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 32);
    v14 = v7;
    v15 = v8;
    v16 = *(_OWORD *)(a1 + 48);
    objc_msgSend(v3, "childWithContinuation:", &v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "selectTextWithGranularity:atPoint:executionContext:", v6, v9, *(double *)(a1 + 48), *(double *)(a1 + 56), v10, v11, v12, v13);

  }
  else
  {
    objc_msgSend(v3, "returnExecutionToParent");
  }

}

void __104___UIKeyboardBasedTextSelectionInteraction_transitionFromBlockMagnifyToBlockSelectWithLocation_viaDrag___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v3, "setPanGestureState:", 6);
  objc_msgSend(*(id *)(a1 + 40), "selectionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "beginSelection");

  objc_msgSend(*(id *)(a1 + 40), "selectionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginLoupeMagnifierAtPoint:", *(double *)(a1 + 48), *(double *)(a1 + 56));

  objc_msgSend(v6, "returnExecutionToParent");
}

void __97___UIKeyboardBasedTextSelectionInteraction_beginOneFingerSelectWithTranslation_executionContext___block_invoke(uint64_t a1, void *a2)
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

id __62___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePan___block_invoke(uint64_t a1)
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

void __62___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePan___block_invoke_2(uint64_t a1, void *a2)
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  uint64_t v13;
  __int128 v14;

  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __62___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePan___block_invoke_3;
  v11 = &unk_1E16BB350;
  v4 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v12 = v5;
  v13 = v6;
  v14 = *(_OWORD *)(a1 + 48);
  objc_msgSend(a2, "childWithContinuation:", &v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endOneFingerSelectWithExecutionContext:", v7, v8, v9, v10, v11);

}

void __62___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePan___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v3, "setPanGestureState:", 0);
  objc_msgSend(*(id *)(a1 + 40), "selectionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endLoupeMagnifierAtPoint:", *(double *)(a1 + 48), *(double *)(a1 + 56));

  objc_msgSend(*(id *)(a1 + 32), "setDidFloatCursor:", 0);
  objc_msgSend(v5, "returnExecutionToParent");

}

void __62___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePan___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _QWORD v5[5];
  __int128 v6;

  v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePan___block_invoke_5;
  v5[3] = &unk_1E16BBA40;
  v5[4] = v3;
  v6 = *(_OWORD *)(a1 + 40);
  objc_msgSend(a2, "childWithContinuation:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateOneFingerSelectWithTranslation:executionContext:", v4, *(double *)(a1 + 40), *(double *)(a1 + 48));

}

void __62___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePan___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v3, "selectionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateLoupeMagnifierAtPoint:", *(double *)(a1 + 40), *(double *)(a1 + 48));

  objc_msgSend(v5, "returnExecutionToParent");
}

void __62___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePan___block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "selectionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "selectionController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "selectTextWithGranularity:atPoint:executionContext:", 1, v5, *(double *)(a1 + 40), *(double *)(a1 + 48));

  }
  else
  {
    objc_msgSend(v5, "returnExecutionToParent");
  }

}

void __62___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePan___block_invoke_7(uint64_t a1, void *a2)
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  uint64_t v13;
  __int128 v14;

  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __62___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePan___block_invoke_8;
  v11 = &unk_1E16BB350;
  v4 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v12 = v5;
  v13 = v6;
  v14 = *(_OWORD *)(a1 + 48);
  objc_msgSend(a2, "childWithContinuation:", &v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endOneFingerSelectWithExecutionContext:", v7, v8, v9, v10, v11);

}

void __62___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePan___block_invoke_8(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v3, "setPanGestureState:", 0);
  objc_msgSend(*(id *)(a1 + 40), "selectionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endLoupeMagnifierAtPoint:", *(double *)(a1 + 48), *(double *)(a1 + 56));

  objc_msgSend(*(id *)(a1 + 32), "setDidFloatCursor:", 0);
  objc_msgSend(v5, "returnExecutionToParent");

}

void __62___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePan___block_invoke_9(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  __int128 v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "selectionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "selectionController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(*(id *)(a1 + 40), "previousRepeatedGranularity");
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __62___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePan___block_invoke_10;
    v8[3] = &unk_1E16BBA40;
    v8[4] = *(_QWORD *)(a1 + 32);
    v9 = *(_OWORD *)(a1 + 48);
    objc_msgSend(v3, "childWithContinuation:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateSelectionWithExtentPoint:withBoundary:executionContext:", v6, v7, *(double *)(a1 + 48), *(double *)(a1 + 56));

  }
  else
  {
    objc_msgSend(v3, "returnExecutionToParent");
  }

}

void __62___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePan___block_invoke_10(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v3, "selectionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateLoupeMagnifierAtPoint:", *(double *)(a1 + 40), *(double *)(a1 + 48));

  objc_msgSend(v5, "returnExecutionToParent");
}

void __64___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePress___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *);
  void *v9;
  id v10;
  id v11;
  __int128 v12;

  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __64___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePress___block_invoke_2;
  v9 = &unk_1E16BB350;
  v4 = *(void **)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v11 = *(id *)(a1 + 48);
  v12 = *(_OWORD *)(a1 + 56);
  objc_msgSend(a2, "childWithContinuation:", &v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endOneFingerSelectWithExecutionContext:", v5, v6, v7, v8, v9);

}

void __64___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePress___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "setPanGestureState:", 0);
  objc_msgSend(*(id *)(a1 + 40), "willHandoffLoupeMagnifier");
  objc_msgSend(*(id *)(a1 + 40), "endLoupeMagnifierAtPoint:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  objc_msgSend(v4, "returnExecutionToParent");

}

void __64___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePress___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  __int128 v13;
  char v14;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "selectionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "selectionController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(*(id *)(a1 + 40), "previousRepeatedGranularity");
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __64___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePress___block_invoke_5;
    v10[3] = &unk_1E16D8A28;
    v14 = *(_BYTE *)(a1 + 72);
    v7 = *(id *)(a1 + 48);
    v13 = *(_OWORD *)(a1 + 56);
    v8 = *(_QWORD *)(a1 + 32);
    v11 = v7;
    v12 = v8;
    objc_msgSend(v3, "childWithContinuation:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "selectTextWithGranularity:atPoint:executionContext:", v6, v9, *(double *)(a1 + 56), *(double *)(a1 + 64));

  }
  else
  {
    objc_msgSend(v3, "returnExecutionToParent");
  }

}

void __64___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePress___block_invoke_5(uint64_t a1, void *a2)
{
  double y;
  void *v4;
  id v5;
  CGRect v6;

  v5 = a2;
  if (*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 32), "restartSelection");
    objc_msgSend(*(id *)(a1 + 32), "selectedRectInLineWithPoint:", *(double *)(a1 + 48), *(double *)(a1 + 56));
    y = v6.origin.y;
    objc_msgSend(*(id *)(a1 + 40), "gestureTuning", CGRectGetMidY(v6));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assertInitialPositionFromTopOfCaret:distanceFromCaret:", *(double *)(a1 + 56) - y, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));

  }
  objc_msgSend(v5, "returnExecutionToParent");

}

id __64___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePress___block_invoke_6(uint64_t a1)
{
  void *v2;
  void *v3;
  _BOOL4 isViewKeyboardLayoutPresent;
  __CFString **v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  _QWORD v14[6];

  v14[5] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("KeyboardTextSelection");
  v13[0] = CFSTR("KeyboardEventType");
  v13[1] = CFSTR("Operation");
  UIKBAnalyticsSelectionTypeForGranularity(objc_msgSend(*(id *)(a1 + 32), "previousRepeatedGranularity"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v2;
  v13[2] = CFSTR("TriggerType");
  objc_msgSend(*(id *)(a1 + 40), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  isViewKeyboardLayoutPresent = _isViewKeyboardLayoutPresent(v3);
  v5 = UIKBAnalyticsGestureIsOnKeyboard;
  if (!isViewKeyboardLayoutPresent)
    v5 = UIKBAnalyticsGestureIsOnCanvas;
  objc_msgSend(CFSTR("Force press"), "stringByAppendingString:", *v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v6;
  v13[3] = CFSTR("Count");
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    v8 = *(_QWORD *)(v7 + 144);
  else
    v8 = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v9;
  v13[4] = CFSTR("GestureState");
  _UIGestureRecognizerStateString(objc_msgSend(*(id *)(a1 + 40), "state"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
