@implementation _UIKeyboardBasedTextSelectionInteraction

- (void)didMoveToView:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIKeyboardBasedTextSelectionInteraction;
  v4 = a3;
  -[UITextInteraction didMoveToView:](&v5, sel_didMoveToView_, v4);
  -[UITextGestureTuning setContainerCoordinateSpace:](self->_gestureTuning, "setContainerCoordinateSpace:", v4, v5.receiver, v5.super_class);

}

- (id)owner
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIKeyboardBasedTextSelectionInteraction;
  -[_UIKeyboardTextSelectionInteraction owner](&v3, sel_owner);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)dealloc
{
  UITextGestureTuning *gestureTuning;
  objc_super v4;

  gestureTuning = self->_gestureTuning;
  self->_gestureTuning = 0;

  v4.receiver = self;
  v4.super_class = (Class)_UIKeyboardBasedTextSelectionInteraction;
  -[_UIKeyboardTextSelectionInteraction dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gestureTuning, 0);
}

- (void)_createGestureTuningIfNecessary
{
  void *v3;
  void *v4;
  int v5;
  UITextGestureTuning *v6;
  UITextGestureTuning *gestureTuning;
  void *v8;

  if (!self->_gestureTuning)
  {
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "preferencesActions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLForPreferenceKey:", CFSTR("YukonMagnifiersDisabled"));

    if (v5)
    {
      v6 = objc_alloc_init(UITextGestureTuning);
      gestureTuning = self->_gestureTuning;
      self->_gestureTuning = v6;

      -[UITextInteraction view](self, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextGestureTuning setContainerCoordinateSpace:](self->_gestureTuning, "setContainerCoordinateSpace:", v8);

      -[UITextGestureTuning setShouldUseLineThreshold:](self->_gestureTuning, "setShouldUseLineThreshold:", 1);
      -[UITextGestureTuning setIncludeTipProjection:](self->_gestureTuning, "setIncludeTipProjection:", 1);
      -[UITextGestureTuning setStrongerBiasAgainstUp:](self->_gestureTuning, "setStrongerBiasAgainstUp:", 1);
    }
  }
}

- (void)_processGestureForCustomHighlighter:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  long double v15;
  double v16;
  long double v17;
  id v18;
  BOOL v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int v23;
  char v24;
  id v25;
  uint64_t v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  double v34;
  double v35;
  uint64_t v36;
  id v37;

  v4 = a3;
  -[_UIKeyboardBasedTextSelectionInteraction owner](self, "owner");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInteraction _textInput](self, "_textInput");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textInputView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v7);
  v9 = v8;
  v11 = v10;

  -[UITextInteraction _textInput](self, "_textInput");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "textInputView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_translationInView:", v13);
  v15 = v14;
  v17 = v16;

  if (!objc_msgSend(v4, "didLongPress"))
    goto LABEL_8;
  v18 = v4;
  if (objc_msgSend(v18, "state") != 3 && objc_msgSend(v18, "state") != 4)
  {
    v20 = objc_msgSend(v18, "state");

    if (v20 != 5
      && !-[_UIKeyboardBasedTextSelectionInteraction enclosingScrollViewIsScrolling](self, "enclosingScrollViewIsScrolling"))
    {
      v34 = hypot(v15, v17);
      +[_UITextSelectionSettings sharedInstance](_UITextSelectionSettings, "sharedInstance");
      v18 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "allowableForceMovement");
      v19 = v34 > v35;
      goto LABEL_5;
    }
LABEL_8:
    v19 = 1;
    goto LABEL_9;
  }
  v19 = 1;
LABEL_5:

LABEL_9:
  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "preferencesActions");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "BOOLForPreferenceKey:", CFSTR("YukonMagnifiersDisabled"));

  if (v23)
  {
    if (objc_msgSend(v5, "panGestureState"))
      v24 = 1;
    else
      v24 = v19;
    if ((v24 & 1) == 0)
    {
      objc_msgSend(v5, "setPanGestureState:", 6);
      -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "willBeginHighlighterGesture");

      -[UITextInteraction root](self, "root");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "_playFeedbackForCursorMovement");

      v26 = 1;
      goto LABEL_22;
    }
    if (objc_msgSend(v5, "panGestureState") == 6)
    {
      v25 = v4;
      if (objc_msgSend(v25, "state") == 3 || objc_msgSend(v25, "state") == 4)
      {

      }
      else
      {
        v36 = objc_msgSend(v25, "state");

        if (v36 != 5)
        {
          v26 = 2;
LABEL_19:
          -[UITextGestureTuning touchAlignedPointForPoint:translation:](self->_gestureTuning, "touchAlignedPointForPoint:translation:", v9, v11, (double)v15, (double)v17);
          if (v26)
          {
            v9 = v27;
            v11 = v28;
LABEL_22:
            -[UITextInteraction root](self, "root");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "delegate");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "_performHighlighterActionWithGestureState:location:", v26, v9, v11);

            goto LABEL_23;
          }
          goto LABEL_23;
        }
      }
      v26 = objc_msgSend(v25, "state");
      goto LABEL_19;
    }
  }
LABEL_23:
  v37 = v4;
  if (objc_msgSend(v37, "state") == 3 || objc_msgSend(v37, "state") == 4)
  {

  }
  else
  {
    v33 = objc_msgSend(v37, "state");

    if (v33 != 5)
      goto LABEL_27;
  }
  objc_msgSend(v5, "setDidLongForcePress:", 0);
  objc_msgSend(v5, "setDidFloatCursor:", 0);
  objc_msgSend(v5, "setDelayForceMagnify:", 0);
  objc_msgSend(v5, "setPreviousForcePressCount:", 0);
  objc_msgSend(v5, "setPanGestureState:", 0);
  objc_msgSend(v37, "setShouldFailWithoutForce:", objc_msgSend(v5, "oneFingerForcePressShouldFailWithoutForce"));
LABEL_27:

}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v6 = a4;
  objc_msgSend(a3, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "locationInView:", v7);
  v9 = v8;
  v11 = v10;

  return !-[UITextInteraction currentSelectionContainsPoint:](self, "currentSelectionContainsPoint:", v9, v11);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return objc_msgSend(a4, "_isGestureType:", 1);
}

- (BOOL)enclosingScrollViewIsScrolling
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  -[_UIKeyboardBasedTextSelectionInteraction owner](self, "owner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textSelectionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return 0;
  -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textInputView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_scroller");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v9 = objc_msgSend(v8, "isDragging");
  else
    v9 = 0;

  return v9;
}

- (void)transitionFromBlockMagnifyToBlockSelectWithLocation:(CGPoint)a3 viaDrag:(BOOL)a4
{
  _BOOL4 v4;
  double y;
  double x;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD *v17;
  id v18;
  _QWORD v19[8];
  _QWORD v20[8];

  v4 = a4;
  y = a3.y;
  x = a3.x;
  -[_UIKeyboardBasedTextSelectionInteraction owner](self, "owner");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "delayForceMagnify");
  -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    objc_msgSend(v10, "beginLoupeMagnifierAtPoint:", x, y);

    objc_msgSend(v8, "setDelayForceMagnify:", 0);
  }
  else
  {
    objc_msgSend(v10, "willHandoffLoupeMagnifier");

  }
  -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setRangedSelectionShouldShowGrabbers:", 1);

  objc_msgSend(v8, "setDidSuppressSelectionGrabbers:", 0);
  objc_msgSend(v8, "setPreviousRepeatedGranularity:", 1);
  -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "endSelection");

  -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "switchToRangedSelection");

  objc_msgSend(v8, "setPanGestureState:", 2);
  objc_msgSend(v8, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "taskQueue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __104___UIKeyboardBasedTextSelectionInteraction_transitionFromBlockMagnifyToBlockSelectWithLocation_viaDrag___block_invoke;
    v20[3] = &unk_1E16BB350;
    *(double *)&v20[6] = x;
    *(double *)&v20[7] = y;
    v20[4] = self;
    v20[5] = v8;
    v17 = v20;
  }
  else
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __104___UIKeyboardBasedTextSelectionInteraction_transitionFromBlockMagnifyToBlockSelectWithLocation_viaDrag___block_invoke_3;
    v19[3] = &unk_1E16BB350;
    v19[4] = self;
    v19[5] = v8;
    *(double *)&v19[6] = x;
    *(double *)&v19[7] = y;
    v17 = v19;
  }
  v18 = v8;
  objc_msgSend(v16, "addTask:", v17);

}

- (void)beginOneFingerSelectWithTranslation:(CGPoint)a3 executionContext:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v7)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __97___UIKeyboardBasedTextSelectionInteraction_beginOneFingerSelectWithTranslation_executionContext___block_invoke;
      v13[3] = &unk_1E16BAF98;
      v13[4] = self;
      objc_msgSend(v7, "childWithContinuation:", v13);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "selectPositionAtPoint:executionContext:", v11, x, y);

    }
    else
    {
      objc_msgSend(v9, "selectPositionAtPoint:executionContext:", 0, x, y);

      -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "beginSelection");

    }
  }
  else
  {
    objc_msgSend(v7, "returnExecutionToParent");
  }

}

- (void)updateOneFingerSelectWithTranslation:(CGPoint)a3 executionContext:(id)a4
{
  double y;
  double x;
  void *v7;
  void *v8;
  id v9;

  y = a3.y;
  x = a3.x;
  v9 = a4;
  -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateSelectionWithExtentPoint:executionContext:", v9, x, y);

  }
  else
  {
    objc_msgSend(v9, "returnExecutionToParent");
  }

}

- (void)endOneFingerSelectWithExecutionContext:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endSelection");

  objc_msgSend(v5, "returnExecutionToParent");
}

- (void)oneFingerForcePan:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
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
  void *v30;
  void *v31;
  char v32;
  _BOOL4 v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  uint64_t v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  double v51;
  long double v52;
  double v53;
  long double v54;
  double v55;
  double v56;
  uint64_t v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  double v63;
  double v64;
  double v65;
  double v66;
  _BOOL4 IsEnded;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  _QWORD *v73;
  uint64_t v74;
  void *v75;
  _QWORD v76[5];
  id v77;
  double v78;
  double v79;
  _QWORD v80[5];
  id v81;
  double v82;
  double v83;
  _QWORD v84[7];
  _QWORD v85[7];
  _QWORD v86[5];
  id v87;
  double v88;
  double v89;
  _QWORD v90[5];
  id v91;
  id v92;
  double v93;
  double v94;

  v4 = a3;
  -[_UIKeyboardBasedTextSelectionInteraction owner](self, "owner");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textInputView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v7);
  v9 = v8;
  v11 = v10;

  -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "textInputView");
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
      -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "textInputView");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "_translationInView:", v50);
      v52 = v51;
      v54 = v53;

      v55 = hypot(v52, v54);
      +[_UITextSelectionSettings sharedInstance](_UITextSelectionSettings, "sharedInstance");
      v18 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "allowableForceMovement");
      v19 = v55 <= v56;
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
    objc_msgSend(v26, "touchAlignedPointForPoint:translation:", v9, v11, v15, v17);
    v9 = v27;
    v11 = v28;

  }
  if ((objc_msgSend(v5, "didLongForcePress") & 1) == 0
    && objc_msgSend(v4, "didLongPress")
    && objc_msgSend(v5, "panGestureState") == 5)
  {
    v29 = v4;
    if (objc_msgSend(v29, "state") == 3 || objc_msgSend(v29, "state") == 4)
    {

    }
    else
    {
      v57 = objc_msgSend(v29, "state");

      if (v57 != 5)
      {
        if (!v19)
          -[_UIKeyboardBasedTextSelectionInteraction transitionFromBlockMagnifyToBlockSelectWithLocation:viaDrag:](self, "transitionFromBlockMagnifyToBlockSelectWithLocation:viaDrag:", 1, v9, v11);
        objc_msgSend(v5, "setDidLongForcePress:", 1);
        objc_msgSend(v29, "view");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        +[_UIKeyboardUsageTracking keyboardGestureOneFingerForcePan:](_UIKeyboardUsageTracking, "keyboardGestureOneFingerForcePan:", _isViewKeyboardLayoutPresent(v58));

        objc_msgSend(MEMORY[0x1E0DAFEC0], "sharedInstance");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v90[0] = MEMORY[0x1E0C809B0];
        v90[1] = 3221225472;
        v90[2] = __62___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePan___block_invoke;
        v90[3] = &unk_1E16B9488;
        v90[4] = self;
        v93 = v15;
        v94 = v17;
        v91 = v5;
        v92 = v29;
        objc_msgSend(v59, "logBlock:domain:", v90, CFSTR("com.apple.keyboard.UIKit"));

      }
    }
  }
  -[UITextInteraction root](self, "root");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "delegate");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_opt_respondsToSelector();

  if ((v32 & 1) != 0)
  {
    -[_UIKeyboardBasedTextSelectionInteraction _processGestureForCustomHighlighter:](self, "_processGestureForCustomHighlighter:", v4);
    goto LABEL_41;
  }
  if (objc_msgSend(v5, "panGestureState"))
    v33 = 0;
  else
    v33 = v19;
  if (v33)
  {
    objc_msgSend(v5, "setPanGestureState:", 1);
    -[_UIKeyboardTextSelectionInteraction disableEnclosingScrollViewScrolling](self, "disableEnclosingScrollViewScrolling");
    -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "beginLoupeGestureAtPoint:translation:", v9, v11, v15, v17);
LABEL_24:

    goto LABEL_37;
  }
  if (objc_msgSend(v5, "panGestureState") == 1)
  {
    v35 = v4;
    if (objc_msgSend(v35, "state") == 3 || objc_msgSend(v35, "state") == 4)
    {

    }
    else
    {
      v60 = objc_msgSend(v35, "state");

      if (v60 != 5)
      {
        -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "textInputView");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "velocityInView:", v62);
        v64 = v63;
        v66 = v65;

        -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "updateLoupeGestureAtPoint:translation:velocity:", v9, v11, v15, v17, v64, v66);
        goto LABEL_24;
      }
    }
    objc_msgSend(v5, "setDidFloatCursor:", 0);
    -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "endLoupeGestureAtPoint:translation:", v9, v11, v15, v17);

    goto LABEL_30;
  }
  if (objc_msgSend(v5, "panGestureState") == 3)
  {
    v37 = v4;
    if (objc_msgSend(v37, "state") == 3 || objc_msgSend(v37, "state") == 4)
    {

LABEL_35:
      objc_msgSend(v5, "delegate");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "taskQueue");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v86[0] = MEMORY[0x1E0C809B0];
      v86[1] = 3221225472;
      v86[2] = __62___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePan___block_invoke_2;
      v86[3] = &unk_1E16BB350;
      v86[4] = self;
      v87 = v5;
      v88 = v9;
      v89 = v11;
      objc_msgSend(v39, "addTask:", v86);

      v40 = v87;
LABEL_36:

      goto LABEL_37;
    }
    v70 = objc_msgSend(v37, "state");

    if (v70 == 5)
      goto LABEL_35;
    objc_msgSend(v5, "delegate");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "taskQueue");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = v71;
    v85[0] = MEMORY[0x1E0C809B0];
    v85[1] = 3221225472;
    v85[2] = __62___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePan___block_invoke_4;
    v85[3] = &unk_1E16BBA40;
    v85[4] = self;
    *(double *)&v85[5] = v9;
    *(double *)&v85[6] = v11;
    v73 = v85;
LABEL_67:
    objc_msgSend(v71, "addTask:", v73);

    goto LABEL_24;
  }
  if (objc_msgSend(v5, "panGestureState") == 5)
  {
    v46 = v4;
    if (objc_msgSend(v46, "state") == 3 || objc_msgSend(v46, "state") == 4)
    {

    }
    else
    {
      v74 = objc_msgSend(v46, "state");

      if (v74 != 5)
      {
        if ((objc_msgSend(v5, "delayForceMagnify") & 1) == 0)
        {
          -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "updateLoupeMagnifierAtPoint:", v9, v11);

        }
        objc_msgSend(v5, "delegate");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "taskQueue");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = v71;
        v84[0] = MEMORY[0x1E0C809B0];
        v84[1] = 3221225472;
        v84[2] = __62___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePan___block_invoke_6;
        v84[3] = &unk_1E16BBA40;
        v84[4] = self;
        *(double *)&v84[5] = v9;
        *(double *)&v84[6] = v11;
        v73 = v84;
        goto LABEL_67;
      }
    }
    objc_msgSend(v5, "setDidFloatCursor:", 0);
    if ((objc_msgSend(v5, "delayForceMagnify") & 1) == 0)
    {
      -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "endLoupeMagnifierAtPoint:", v9, v11);

    }
    -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setRangedSelectionShouldShowGrabbers:", 1);

    objc_msgSend(v5, "setDidSuppressSelectionGrabbers:", 0);
LABEL_30:
    objc_msgSend(v5, "setPanGestureState:", 0);
    goto LABEL_37;
  }
  if (objc_msgSend(v5, "panGestureState") == 6)
  {
    IsEnded = _gestureIsEnded(v4);
    objc_msgSend(v5, "delegate");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "taskQueue");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    if (IsEnded)
    {
      v80[0] = MEMORY[0x1E0C809B0];
      v80[1] = 3221225472;
      v80[2] = __62___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePan___block_invoke_7;
      v80[3] = &unk_1E16BB350;
      v80[4] = self;
      v81 = v5;
      v82 = v9;
      v83 = v11;
      objc_msgSend(v69, "addTask:", v80);

      v40 = v81;
    }
    else
    {
      v76[0] = MEMORY[0x1E0C809B0];
      v76[1] = 3221225472;
      v76[2] = __62___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePan___block_invoke_9;
      v76[3] = &unk_1E16BB350;
      v76[4] = self;
      v78 = v9;
      v79 = v11;
      v77 = v5;
      objc_msgSend(v69, "addTask:", v76);

      v40 = v77;
    }
    goto LABEL_36;
  }
LABEL_37:
  -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "textInputView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_translationInView:", v42);
  objc_msgSend(v5, "setLastPanTranslation:");

  v43 = v4;
  if (objc_msgSend(v43, "state") == 3 || objc_msgSend(v43, "state") == 4)
  {

  }
  else
  {
    v45 = objc_msgSend(v43, "state");

    if (v45 != 5)
      goto LABEL_41;
  }
  objc_msgSend(v5, "setDidLongForcePress:", 0);
  objc_msgSend(v5, "setDidFloatCursor:", 0);
  objc_msgSend(v5, "setDelayForceMagnify:", 0);
  objc_msgSend(v5, "setPreviousForcePressCount:", 0);
  objc_msgSend(v5, "setPanGestureState:", 0);
  -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "showSelectionCommands");

  objc_msgSend(v43, "setShouldFailWithoutForce:", objc_msgSend(v5, "oneFingerForcePressShouldFailWithoutForce"));
LABEL_41:

}

- (void)oneFingerForcePress:(id)a3
{
  _QWORD *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  long double v13;
  double v14;
  long double v15;
  double v16;
  uint64_t v17;
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
  void *v28;
  void *v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _BOOL8 isViewKeyboardLayoutPresent;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  _QWORD v44[4];
  id v45;
  _QWORD *v46;
  _QWORD v47[5];
  id v48;
  id v49;
  double v50;
  double v51;
  char v52;
  _QWORD v53[5];
  id v54;
  id v55;
  double v56;
  double v57;

  v4 = a3;
  -[_UIKeyboardBasedTextSelectionInteraction owner](self, "owner");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    objc_msgSend(v5, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "textSelectionController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[_UIKeyboardTextSelectionInteraction selectionController](self, "selectionController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "textInputView");
      v17 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "velocityInView:", v17);
      v13 = v12;
      v15 = v14;

      v16 = hypot(v13, v15);
      LOBYTE(v17) = 0;
      if (objc_msgSend(v5, "panGestureState") && v16 > 65.0)
        LODWORD(v17) = objc_msgSend(v4, "touchEclipsesVelocity") ^ 1;
      objc_msgSend(v6, "textInputView");
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
          objc_msgSend(v5, "delegate");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v5, "delegate");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v29, "hasMarkedText");

          }
          else
          {
            v30 = 0;
          }

          v31 = objc_msgSend(v5, "panGestureState");
          v32 = MEMORY[0x1E0C809B0];
          if (v31 == 6)
          {
            v33 = Current - v27;
            if (Current - v27 <= 0.8)
            {
              -[_UIKeyboardTextSelectionInteraction _granularityExpandingGestureWithTimeInterval:timeGranularity:isMidPan:](self, "_granularityExpandingGestureWithTimeInterval:timeGranularity:isMidPan:", 1, v33);
            }
            else
            {
              objc_msgSend(v5, "delegate", v33);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "taskQueue");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v53[0] = v32;
              v53[1] = 3221225472;
              v53[2] = __64___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePress___block_invoke;
              v53[3] = &unk_1E16BB870;
              v53[4] = self;
              v54 = v5;
              v55 = v6;
              v56 = v20;
              v57 = v22;
              objc_msgSend(v35, "addTask:", v53);

            }
          }
          if (objc_msgSend(v5, "panGestureState")
            || ((-[_UIKeyboardBasedTextSelectionInteraction enclosingScrollViewIsScrolling](self, "enclosingScrollViewIsScrolling") | v30) & 1) != 0)
          {
            if (objc_msgSend(v5, "panGestureState") == 1 || objc_msgSend(v5, "panGestureState") == 5)
              -[_UIKeyboardBasedTextSelectionInteraction transitionFromBlockMagnifyToBlockSelectWithLocation:viaDrag:](self, "transitionFromBlockMagnifyToBlockSelectWithLocation:viaDrag:", 0, v20, v22);
          }
          else
          {
            objc_msgSend(v5, "setPanGestureState:", 5);
            objc_msgSend(v5, "setPanGestureState:", 6);
            objc_msgSend(v5, "setPreviousRepeatedGranularity:", 1);
            -[_UIKeyboardTextSelectionInteraction disableEnclosingScrollViewScrolling](self, "disableEnclosingScrollViewScrolling");
            objc_msgSend(v6, "willBeginHighlighterGesture");
            -[UITextInteraction root](self, "root");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "_playFeedbackForCursorMovement");

            objc_msgSend(v6, "beginSelection");
            objc_msgSend(v6, "setRangedSelectionShouldShowGrabbers:", 1);
            objc_msgSend(v5, "setDidSuppressSelectionGrabbers:", 0);
            objc_msgSend(v5, "delegate");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "taskQueue");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v47[0] = v32;
            v47[1] = 3221225472;
            v47[2] = __64___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePress___block_invoke_4;
            v47[3] = &unk_1E16BB8B8;
            v47[4] = self;
            v48 = v5;
            v50 = v20;
            v51 = v22;
            v52 = 1;
            v49 = v6;
            objc_msgSend(v38, "addTask:", v47);

          }
          objc_msgSend(v5, "setLastPressTimestamp:", Current);
          objc_msgSend(v4, "view");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          isViewKeyboardLayoutPresent = _isViewKeyboardLayoutPresent(v39);
          if (v4)
            v41 = *((unsigned int *)v4 + 36);
          else
            v41 = 0;
          +[_UIKeyboardUsageTracking keyboardGestureOneFingerForcePress:withPressCount:](_UIKeyboardUsageTracking, "keyboardGestureOneFingerForcePress:withPressCount:", isViewKeyboardLayoutPresent, v41);

          objc_msgSend(MEMORY[0x1E0DAFEC0], "sharedInstance");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v44[0] = v32;
          v44[1] = 3221225472;
          v44[2] = __64___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePress___block_invoke_6;
          v44[3] = &unk_1E16B9460;
          v45 = v5;
          v46 = v4;
          objc_msgSend(v42, "logBlock:domain:", v44, CFSTR("com.apple.keyboard.UIKit"));

        }
      }
      if (v4)
        v43 = *((unsigned int *)v4 + 36);
      else
        v43 = 0;
      objc_msgSend(v5, "setPreviousForcePressCount:", v43);
    }
  }

}

- (UITextGestureTuning)gestureTuning
{
  return self->_gestureTuning;
}

@end
