@implementation UIKeyboardBasedNonEditableTextSelectionInteraction

id __73___UIKeyboardBasedNonEditableTextSelectionInteraction_oneFingerForcePan___block_invoke(id *a1)
{
  id v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  _BOOL4 isViewKeyboardLayoutPresent;
  __CFString **v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[6];
  _QWORD v19[7];

  v19[6] = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  objc_msgSend(a1[5], "textInputView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_translationInView:", v3);
  v5 = v4;
  v7 = v6;

  v19[0] = CFSTR("KeyboardTextSelection");
  v18[0] = CFSTR("KeyboardEventType");
  v18[1] = CFSTR("Operation");
  UIKBAnalyticsSelectionTypeForGranularity(objc_msgSend(a1[6], "previousRepeatedGranularity"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v8;
  v18[2] = CFSTR("TriggerType");
  objc_msgSend(a1[4], "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  isViewKeyboardLayoutPresent = _isViewKeyboardLayoutPresent(v9);
  v11 = UIKBAnalyticsGestureIsOnKeyboard;
  if (!isViewKeyboardLayoutPresent)
    v11 = UIKBAnalyticsGestureIsOnCanvas;
  objc_msgSend(CFSTR("Force pan"), "stringByAppendingString:", *v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v12;
  v18[3] = CFSTR("GestureState");
  _UIGestureRecognizerStateString(objc_msgSend(a1[4], "state"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v13;
  v18[4] = CFSTR("CursorLocationX");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v14;
  v18[5] = CFSTR("CursorLocationY");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[5] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

uint64_t __73___UIKeyboardBasedNonEditableTextSelectionInteraction_oneFingerForcePan___block_invoke_2(uint64_t a1)
{
  double y;
  void *v3;
  CGRect v5;

  if (*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 32), "restartSelection");
    objc_msgSend(*(id *)(a1 + 32), "selectedRectInLineWithPoint:", *(double *)(a1 + 48), *(double *)(a1 + 56));
    y = v5.origin.y;
    objc_msgSend(*(id *)(a1 + 40), "gestureTuning", CGRectGetMidY(v5));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "assertInitialPositionFromTopOfCaret:distanceFromCaret:", *(double *)(a1 + 56) - y, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));

  }
  return objc_msgSend(*(id *)(a1 + 32), "beginRangedMagnifierAtPoint:", *(double *)(a1 + 48), *(double *)(a1 + 56));
}

void __75___UIKeyboardBasedNonEditableTextSelectionInteraction_oneFingerForcePress___block_invoke_2(uint64_t a1)
{
  double y;
  id v3;
  CGRect v4;

  if (*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 32), "restartSelection");
    objc_msgSend(*(id *)(a1 + 32), "selectedRectInLineWithPoint:", *(double *)(a1 + 48), *(double *)(a1 + 56));
    y = v4.origin.y;
    objc_msgSend(*(id *)(a1 + 40), "gestureTuning", CGRectGetMidY(v4));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "assertInitialPositionFromTopOfCaret:distanceFromCaret:", *(double *)(a1 + 56) - y, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));

  }
}

id __75___UIKeyboardBasedNonEditableTextSelectionInteraction_oneFingerForcePress___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  _BOOL4 isViewKeyboardLayoutPresent;
  __CFString **v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  _QWORD v11[5];

  v11[4] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("KeyboardTextSelection");
  v10[0] = CFSTR("KeyboardEventType");
  v10[1] = CFSTR("Operation");
  UIKBAnalyticsSelectionTypeForGranularity(objc_msgSend(*(id *)(a1 + 32), "previousRepeatedGranularity"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v2;
  v10[2] = CFSTR("TriggerType");
  objc_msgSend(*(id *)(a1 + 40), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  isViewKeyboardLayoutPresent = _isViewKeyboardLayoutPresent(v3);
  v5 = UIKBAnalyticsGestureIsOnKeyboard;
  if (!isViewKeyboardLayoutPresent)
    v5 = UIKBAnalyticsGestureIsOnCanvas;
  objc_msgSend(CFSTR("Force press"), "stringByAppendingString:", *v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v6;
  v10[3] = CFSTR("GestureState");
  _UIGestureRecognizerStateString(objc_msgSend(*(id *)(a1 + 40), "state"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
