@implementation _UIKeyboardBasedNonEditableTextSelectionInteraction

- (void)_synchronousGranularityExpandingGestureWithTimeInterval:(double)a3 timeGranularity:(double)a4 isMidPan:(BOOL)a5
{
  void *v9;
  BOOL IsNull;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  char v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  int64_t v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  id v33;
  CGRect v34;

  -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "caretRectForCursorPosition");
  IsNull = CGRectIsNull(v34);

  if (!IsNull)
  {
    -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "caretRectForCursorPosition");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;

    if (a3 >= a4)
    {
      -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v21, "hasRangedSelection");

    }
    else
    {
      v20 = 0;
    }
    if (a5)
    {
      -[_UIKeyboardBasedTextSelectionInteraction owner](self, "owner");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "previousRepeatedGranularity");
    }
    else
    {
      -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "selectionGranularity");
    }
    v24 = v23;

    if ((v20 & 1) != 0)
      v25 = 0;
    else
      v25 = +[UITextInteractionAssistant _nextGranularityInCycle:forTouchType:](UITextInteractionAssistant, "_nextGranularityInCycle:forTouchType:", v24, 0);
    v26 = v17 * 0.5;
    v27 = v19 * 0.5;
    -[_UIKeyboardBasedTextSelectionInteraction owner](self, "owner");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setPreviousRepeatedGranularity:", v25);

    if (!a5)
    {
      -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "beginSelection");

    }
    v30 = v13 + v26;
    -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (v25)
      objc_msgSend(v31, "selectTextWithGranularity:atPoint:executionContext:", v25, 0, v30, v15 + v27);
    else
      objc_msgSend(v31, "selectPositionAtPoint:executionContext:", 0, v30, v15 + v27);

    -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
    v33 = (id)objc_claimAutoreleasedReturnValue();
    if (a5)
      objc_msgSend(v33, "restartSelection");
    else
      objc_msgSend(v33, "endSelection");

  }
}

- (void)transitionFromBlockMagnifyToBlockSelectWithLocation:(CGPoint)a3 viaDrag:(BOOL)a4
{
  _BOOL4 v4;
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a4;
  y = a3.y;
  x = a3.x;
  -[_UIKeyboardBasedTextSelectionInteraction owner](self, "owner");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRangedSelectionShouldShowGrabbers:", 1);

  objc_msgSend(v12, "setDidSuppressSelectionGrabbers:", 0);
  objc_msgSend(v12, "setPreviousRepeatedGranularity:", 1);
  objc_msgSend(v12, "setPanGestureState:", 6);
  -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v4)
  {
    objc_msgSend(v9, "beginSelection");

    -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "updateSelectionWithExtentPoint:withBoundary:executionContext:", objc_msgSend(v12, "previousRepeatedGranularity"), 0, x, y);
  }
  else
  {
    objc_msgSend(v9, "selectTextWithGranularity:atPoint:executionContext:", objc_msgSend(v12, "previousRepeatedGranularity"), 0, x, y);

    -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "beginSelection");
  }

}

- (void)oneFingerForcePan:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  long double v15;
  double v16;
  long double v17;
  id v18;
  _BOOL4 v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  _BOOL4 v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  uint64_t v44;
  void *v45;
  double v46;
  double v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  void *v52;
  uint64_t v53;
  void *v54;
  int v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t);
  void *v60;
  id v61;
  _UIKeyboardBasedNonEditableTextSelectionInteraction *v62;
  double v63;
  double v64;
  char v65;
  _QWORD v66[4];
  id v67;
  id v68;
  id v69;

  v4 = a3;
  -[_UIKeyboardBasedTextSelectionInteraction owner](self, "owner");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textInputView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v8);
  v10 = v9;
  v12 = v11;

  objc_msgSend(v7, "textInputView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_translationInView:", v13);
  v15 = v14;
  v17 = v16;

  if (objc_msgSend(v4, "didLongPress"))
  {
    v18 = v4;
    if (objc_msgSend(v18, "state") == 3 || objc_msgSend(v18, "state") == 4)
    {
      v19 = 0;
LABEL_5:

      goto LABEL_9;
    }
    v20 = objc_msgSend(v18, "state");

    if (v20 != 5
      && !-[_UIKeyboardBasedTextSelectionInteraction enclosingScrollViewIsScrolling](self, "enclosingScrollViewIsScrolling"))
    {
      v46 = hypot(v15, v17);
      +[_UITextSelectionSettings sharedInstance](_UITextSelectionSettings, "sharedInstance");
      v18 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "allowableForceMovement");
      v19 = v46 <= v47;
      goto LABEL_5;
    }
  }
  v19 = 0;
LABEL_9:
  -[_UIKeyboardBasedTextSelectionInteraction _createGestureTuningIfNecessary](self, "_createGestureTuningIfNecessary");
  -[_UIKeyboardBasedTextSelectionInteraction gestureTuning](self, "gestureTuning");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[_UIKeyboardBasedTextSelectionInteraction gestureTuning](self, "gestureTuning");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v4, "touches");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setWithArray:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "updateWithTouches:gestureState:", v25, objc_msgSend(v4, "state"));

    -[_UIKeyboardBasedTextSelectionInteraction gestureTuning](self, "gestureTuning");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "touchAlignedPointForPoint:translation:", v10, v12, (double)v15, (double)v17);
    v10 = v27;
    v12 = v28;

  }
  if ((objc_msgSend(v5, "didLongForcePress") & 1) == 0
    && objc_msgSend(v4, "didLongPress")
    && objc_msgSend(v5, "panGestureState") == 5)
  {
    v29 = v4;
    if (objc_msgSend(v29, "state") != 3 && objc_msgSend(v29, "state") != 4)
    {
      v30 = objc_msgSend(v29, "state");

      if (v30 == 5)
        goto LABEL_21;
      if (!v19)
        -[_UIKeyboardBasedNonEditableTextSelectionInteraction transitionFromBlockMagnifyToBlockSelectWithLocation:viaDrag:](self, "transitionFromBlockMagnifyToBlockSelectWithLocation:viaDrag:", 1, v10, v12);
      objc_msgSend(v5, "setDidLongForcePress:", 1);
      objc_msgSend(v29, "view");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      +[_UIKeyboardUsageTracking keyboardGestureOneFingerForcePan:](_UIKeyboardUsageTracking, "keyboardGestureOneFingerForcePan:", _isViewKeyboardLayoutPresent(v31));

      objc_msgSend(MEMORY[0x1E0DAFEC0], "sharedInstance");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v66[0] = MEMORY[0x1E0C809B0];
      v66[1] = 3221225472;
      v66[2] = __73___UIKeyboardBasedNonEditableTextSelectionInteraction_oneFingerForcePan___block_invoke;
      v66[3] = &unk_1E16D8B58;
      v67 = v29;
      v68 = v7;
      v69 = v5;
      objc_msgSend(v32, "logBlock:domain:", v66, CFSTR("com.apple.keyboard.UIKit"));

      v29 = v67;
    }

  }
LABEL_21:
  -[UITextInteraction root](self, "root");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "delegate");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_opt_respondsToSelector();

  if ((v35 & 1) != 0)
  {
    -[_UIKeyboardBasedTextSelectionInteraction _processGestureForCustomHighlighter:](self, "_processGestureForCustomHighlighter:", v4);
    goto LABEL_72;
  }
  if (objc_msgSend(v5, "panGestureState"))
    v36 = 0;
  else
    v36 = v19;
  if (v36)
  {
    objc_msgSend(v5, "setPanGestureState:", 1);
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    self->_isShiftKeyBeingHeld = objc_msgSend(v37, "isShiftKeyBeingHeld");

    -[UITextInteraction root](self, "root");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "_createFeedbackIfNecessary");

    -[UITextInteraction root](self, "root");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "_prepareFeedbackForGesture");

    self->_isShiftKeyBeingHeld = 1;
    objc_msgSend(v5, "setPanGestureState:", 6);
    objc_msgSend(v5, "setPreviousRepeatedGranularity:", 1);
    if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v6, "willBeginGesture");
    -[_UIKeyboardTextSelectionInteraction disableEnclosingScrollViewScrolling](self, "disableEnclosingScrollViewScrolling");
    objc_msgSend(v7, "willBeginHighlighterGesture");
    -[UITextInteraction root](self, "root");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "_playFeedbackForCursorMovement");

    objc_msgSend(v7, "beginSelection");
    objc_msgSend(v7, "setRangedSelectionShouldShowGrabbers:", 1);
    objc_msgSend(v5, "setDidSuppressSelectionGrabbers:", 1);
    v57 = MEMORY[0x1E0C809B0];
    v58 = 3221225472;
    v59 = __73___UIKeyboardBasedNonEditableTextSelectionInteraction_oneFingerForcePan___block_invoke_2;
    v60 = &unk_1E16D8A00;
    v65 = 1;
    v63 = v10;
    v64 = v12;
    v61 = v7;
    v62 = self;
    objc_msgSend(v61, "selectTextWithGranularity:atPoint:completionHandler:", 1, &v57, v10, v12);

    goto LABEL_62;
  }
  if (objc_msgSend(v5, "panGestureState") == 1)
  {
    v41 = v4;
    if (objc_msgSend(v41, "state") == 3 || objc_msgSend(v41, "state") == 4)
    {

LABEL_35:
      objc_msgSend(v5, "setDidFloatCursor:", 0);
      objc_msgSend(v7, "endRangedMagnifierAtPoint:", v10, v12);
      objc_msgSend(v7, "selectTextWithGranularity:atPoint:executionContext:", 1, 0, v10, v12);
LABEL_41:
      objc_msgSend(v5, "setPanGestureState:", 0);
      goto LABEL_62;
    }
    v48 = objc_msgSend(v41, "state");

    if (v48 == 5)
      goto LABEL_35;
    objc_msgSend(v7, "updateRangedMagnifierAtPoint:", v10, v12);
    v45 = v7;
    v44 = 1;
    goto LABEL_52;
  }
  if (objc_msgSend(v5, "panGestureState") != 3)
  {
    if (objc_msgSend(v5, "panGestureState") != 5)
    {
      if (objc_msgSend(v5, "panGestureState") == 6)
      {
        if (_gestureIsEnded(v4))
        {
          -[_UIKeyboardBasedTextSelectionInteraction endOneFingerSelectWithExecutionContext:](self, "endOneFingerSelectWithExecutionContext:", 0);
          objc_msgSend(v5, "setPanGestureState:", 0);
          objc_msgSend(v7, "endRangedMagnifierAtPoint:", v10, v12);
          objc_msgSend(v5, "setDidFloatCursor:", 0);
        }
        else
        {
          objc_msgSend(v7, "updateSelectionWithExtentPoint:withBoundary:executionContext:", objc_msgSend(v5, "previousRepeatedGranularity"), 0, v10, v12);
          objc_msgSend(v7, "updateRangedMagnifierAtPoint:", v10, v12);
        }
      }
      goto LABEL_62;
    }
    v43 = v4;
    if (objc_msgSend(v43, "state") == 3 || objc_msgSend(v43, "state") == 4)
    {

    }
    else
    {
      v50 = objc_msgSend(v43, "state");

      if (v50 != 5)
      {
        if ((objc_msgSend(v5, "delayForceMagnify") & 1) == 0)
          objc_msgSend(v7, "updateRangedMagnifierAtPoint:", v10, v12);
        goto LABEL_48;
      }
    }
    objc_msgSend(v5, "setDidFloatCursor:", 0);
    if ((objc_msgSend(v5, "delayForceMagnify") & 1) == 0)
      objc_msgSend(v7, "endRangedMagnifierAtPoint:", v10, v12);
LABEL_48:
    v44 = objc_msgSend(v5, "previousRepeatedGranularity");
    v45 = v7;
LABEL_52:
    objc_msgSend(v45, "selectTextWithGranularity:atPoint:executionContext:", v44, 0, v10, v12);
    goto LABEL_62;
  }
  v42 = v4;
  if (objc_msgSend(v42, "state") == 3 || objc_msgSend(v42, "state") == 4)
  {

LABEL_40:
    objc_msgSend(v5, "setDidFloatCursor:", 0);
    objc_msgSend(v7, "endSelection");
    objc_msgSend(v7, "endRangedMagnifierAtPoint:", v10, v12);
    goto LABEL_41;
  }
  v49 = objc_msgSend(v42, "state");

  if (v49 == 5)
    goto LABEL_40;
  objc_msgSend(v7, "updateRangedMagnifierAtPoint:", v10, v12);
  objc_msgSend(v7, "updateSelectionWithExtentPoint:executionContext:", 0, v10, v12);
LABEL_62:
  v51 = v4;
  if (objc_msgSend(v51, "state") == 3 || objc_msgSend(v51, "state") == 4)
  {

  }
  else
  {
    v56 = objc_msgSend(v51, "state");

    if (v56 != 5)
      goto LABEL_72;
  }
  objc_msgSend(v5, "setDidLongForcePress:", 0, v57, v58, v59, v60);
  objc_msgSend(v5, "setDidFloatCursor:", 0);
  objc_msgSend(v5, "setPreviousForcePressCount:", 0);
  objc_msgSend(v5, "setPanGestureState:", 0);
  -[UITextInteraction root](self, "root");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "_cleanUpFeedbackForGesture");

  objc_msgSend(v6, "textSelectionController");
  v53 = objc_claimAutoreleasedReturnValue();
  if (v53)
  {
    v54 = (void *)v53;
    v55 = objc_msgSend(v5, "didSuppressSelectionGrabbers");

    if (v55)
    {
      objc_msgSend(v7, "setRangedSelectionShouldShowGrabbers:", 1);
      objc_msgSend(v5, "setDidSuppressSelectionGrabbers:", 0);
    }
  }
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "didEndGesture");
  objc_msgSend(v7, "showSelectionCommands");
LABEL_72:

}

- (void)oneFingerForcePress:(id)a3
{
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  long double v13;
  double v14;
  long double v15;
  double v16;
  int v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  unint64_t v23;
  char v24;
  double Current;
  double v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  _BOOL8 isViewKeyboardLayoutPresent;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  int v36;
  void *v37;
  uint64_t v38;
  _QWORD v39[4];
  id v40;
  _QWORD *v41;
  _QWORD v42[4];
  id v43;
  _UIKeyboardBasedNonEditableTextSelectionInteraction *v44;
  double v45;
  double v46;
  char v47;

  v4 = a3;
  -[_UIKeyboardBasedTextSelectionInteraction owner](self, "owner");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    objc_msgSend(v6, "textSelectionController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v7, "textInputView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "velocityInView:", v11);
      v13 = v12;
      v15 = v14;

      v16 = hypot(v13, v15);
      LOBYTE(v17) = 0;
      if (objc_msgSend(v5, "panGestureState") && v16 > 65.0)
        v17 = objc_msgSend(v4, "touchEclipsesVelocity") ^ 1;
      objc_msgSend(v7, "textInputView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "locationInView:", v18);
      v20 = v19;
      v22 = v21;

      if (objc_msgSend(v4, "currentPreviewForceState") >= 1)
      {
        v23 = v4 ? v4[18] : 0;
        v24 = v23 <= (int)objc_msgSend(v5, "previousForcePressCount") ? 1 : v17;
        if ((v24 & 1) == 0)
        {
          Current = CFAbsoluteTimeGetCurrent();
          objc_msgSend(v5, "lastPressTimestamp");
          v27 = v26;
          if (objc_msgSend(v5, "panGestureState") == 6)
          {
            if (Current - v27 <= 0.8)
              -[_UIKeyboardBasedNonEditableTextSelectionInteraction _synchronousGranularityExpandingGestureWithTimeInterval:timeGranularity:isMidPan:](self, "_synchronousGranularityExpandingGestureWithTimeInterval:timeGranularity:isMidPan:", 1, Current - v27);
            else
              objc_msgSend(v7, "endRangedMagnifierAtPoint:", v20, v22);
          }
          v28 = objc_msgSend(v5, "panGestureState");
          v29 = MEMORY[0x1E0C809B0];
          if (v28
            || -[_UIKeyboardBasedTextSelectionInteraction enclosingScrollViewIsScrolling](self, "enclosingScrollViewIsScrolling")|| (objc_opt_respondsToSelector() & 1) != 0&& (objc_msgSend(v4, "view"), v35 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v4, "locationInView:", v35), v36 = objc_msgSend(v6, "shouldAllowSelectionGestures:atPoint:toBegin:", 1, 1), v35, !v36))
          {
            if (objc_msgSend(v5, "panGestureState") == 1 || objc_msgSend(v5, "panGestureState") == 5)
              -[_UIKeyboardBasedNonEditableTextSelectionInteraction transitionFromBlockMagnifyToBlockSelectWithLocation:viaDrag:](self, "transitionFromBlockMagnifyToBlockSelectWithLocation:viaDrag:", 0, v20, v22);
          }
          else
          {
            objc_msgSend(v5, "setPanGestureState:", 5);
            self->_isShiftKeyBeingHeld = 1;
            objc_msgSend(v5, "setPanGestureState:", 6);
            objc_msgSend(v5, "setPreviousRepeatedGranularity:", 1);
            if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v6, "willBeginGesture");
            -[_UIKeyboardTextSelectionInteraction disableEnclosingScrollViewScrolling](self, "disableEnclosingScrollViewScrolling");
            objc_msgSend(v7, "willBeginHighlighterGesture");
            -[UITextInteraction root](self, "root");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "_playFeedbackForCursorMovement");

            objc_msgSend(v7, "beginSelection");
            objc_msgSend(v7, "setRangedSelectionShouldShowGrabbers:", 1);
            objc_msgSend(v5, "setDidSuppressSelectionGrabbers:", 0);
            v38 = objc_msgSend(v5, "previousRepeatedGranularity");
            v42[0] = v29;
            v42[1] = 3221225472;
            v42[2] = __75___UIKeyboardBasedNonEditableTextSelectionInteraction_oneFingerForcePress___block_invoke_2;
            v42[3] = &unk_1E16D8A00;
            v47 = 1;
            v45 = v20;
            v46 = v22;
            v43 = v7;
            v44 = self;
            objc_msgSend(v43, "selectTextWithGranularity:atPoint:completionHandler:", v38, v42, v20, v22);

          }
          objc_msgSend(v5, "setLastPressTimestamp:", Current);
          objc_msgSend(v4, "view");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          isViewKeyboardLayoutPresent = _isViewKeyboardLayoutPresent(v30);
          if (v4)
            v32 = *((unsigned int *)v4 + 36);
          else
            v32 = 0;
          +[_UIKeyboardUsageTracking keyboardGestureOneFingerForcePress:withPressCount:](_UIKeyboardUsageTracking, "keyboardGestureOneFingerForcePress:withPressCount:", isViewKeyboardLayoutPresent, v32);

          objc_msgSend(MEMORY[0x1E0DAFEC0], "sharedInstance");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v39[0] = v29;
          v39[1] = 3221225472;
          v39[2] = __75___UIKeyboardBasedNonEditableTextSelectionInteraction_oneFingerForcePress___block_invoke_3;
          v39[3] = &unk_1E16B9460;
          v40 = v5;
          v41 = v4;
          objc_msgSend(v33, "logBlock:domain:", v39, CFSTR("com.apple.keyboard.UIKit"));

        }
      }
      if (v4)
        v34 = *((unsigned int *)v4 + 36);
      else
        v34 = 0;
      objc_msgSend(v5, "setPreviousForcePressCount:", v34);
    }
  }

}

@end
