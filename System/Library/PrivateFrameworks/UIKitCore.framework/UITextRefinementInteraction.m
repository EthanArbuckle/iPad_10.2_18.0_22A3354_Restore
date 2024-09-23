@implementation UITextRefinementInteraction

- (void)willMoveToView:(id)a3
{
  UIDelayedAction *delayedLoupeAction;
  UIDelayedAction *delayedSelectionAction;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UITextRefinementInteraction;
  -[UITextInteraction willMoveToView:](&v6, sel_willMoveToView_, a3);
  -[UIDelayedAction cancel](self->_delayedLoupeAction, "cancel");
  delayedLoupeAction = self->_delayedLoupeAction;
  self->_delayedLoupeAction = 0;

  -[UIDelayedAction cancel](self->_delayedSelectionAction, "cancel");
  delayedSelectionAction = self->_delayedSelectionAction;
  self->_delayedSelectionAction = 0;

}

- (UITextRefinementInteraction)initWithBehaviorDelegate:(id)a3
{
  id v5;
  UITextRefinementInteraction *v6;
  UITextRefinementInteraction *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UITextRefinementInteraction;
  v6 = -[UITextInteraction init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_behaviorDelegate, a3);
    v8 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v5, "gestureRecognizerClassForLoupeInteraction:", v7)), "initWithTarget:action:", v7, sel_loupeGesture_);
    objc_msgSend(v5, "configureLoupeGestureRecognizer:forTextLoupeInteraction:", v8, v7);

  }
  return v7;
}

- (void)finishSetup
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UITextRefinementInteraction;
  -[UITextInteraction finishSetup](&v7, sel_finishSetup);
  -[UITextRefinementInteraction behaviorDelegate](self, "behaviorDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "adjustVariableDelaySettingsForLoupeInteraction:", self);

  -[UITextRefinementInteraction setupGestureExclusionRequirements](self, "setupGestureExclusionRequirements");
  -[UITextInteraction _textInput](self, "_textInput");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UITextLoupeResponderProxy _proxyWithResponder:](_UITextLoupeResponderProxy, "_proxyWithResponder:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextRefinementInteraction setResponderProxy:](self, "setResponderProxy:", v5);

  -[UITextRefinementInteraction responderProxy](self, "responderProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", self);

}

- (void)didMoveToView:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UITextRefinementInteraction;
  v4 = a3;
  -[UITextInteraction didMoveToView:](&v6, sel_didMoveToView_, v4);
  -[UITextGestureTuning setContainerCoordinateSpace:](self->_gestureTuning, "setContainerCoordinateSpace:", v4, v6.receiver, v6.super_class);

  -[UITextRefinementInteraction behaviorDelegate](self, "behaviorDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "adjustVariableDelaySettingsForLoupeInteraction:", self);

  self->_inheritedGranularity = -1;
}

- (UITextRefinementInteractionBehaviorDelegate)behaviorDelegate
{
  return self->_behaviorDelegate;
}

- (void)setupGestureExclusionRequirements
{
  id v3;

  -[UITextRefinementInteraction behaviorDelegate](self, "behaviorDelegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configureGestureExclusionRequirementsForTextLoupeInteraction:", self);

}

- (void)setResponderProxy:(id)a3
{
  objc_storeStrong((id *)&self->_responderProxy, a3);
}

- (_UITextLoupeResponderProxy)responderProxy
{
  return self->_responderProxy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responderProxy, 0);
  objc_storeStrong((id *)&self->_behaviorDelegate, 0);
  objc_storeStrong((id *)&self->_gestureTuning, 0);
  objc_storeStrong((id *)&self->_delayedSelectionAction, 0);
  objc_storeStrong((id *)&self->_delayedLoupeAction, 0);
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  return 0;
}

- (void)updateInitialPoint:(CGPoint)a3
{
  self->_hasPerformedInteraction = 1;
  self->_initialPointFromPreviousInteraction = a3;
  -[UITextGestureTuning setStrongerBiasAgainstUp:](self->_gestureTuning, "setStrongerBiasAgainstUp:", 1);
}

- (BOOL)_shouldAllowEnforcedTouchTypeForTouch:(id)a3 forGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;

  v6 = a4;
  v7 = a3;
  -[UITextRefinementInteraction behaviorDelegate](self, "behaviorDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "shouldAllowEnforcedTouchTypeForTouch:forGestureRecognizer:", v7, v6);

  return v9;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  char v8;
  id v9;
  void *v11;
  char isKindOfClass;
  void *v13;
  id v14;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)UITextRefinementInteraction;
  if (-[UITextInteraction gestureRecognizer:shouldRecognizeSimultaneouslyWithGestureRecognizer:](&v15, sel_gestureRecognizer_shouldRecognizeSimultaneouslyWithGestureRecognizer_, v6, v7))
  {
    v8 = 1;
  }
  else
  {
    -[UITextInteraction recognizerForName:](self, "recognizerForName:", 0x1E1778880);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (v9 != v6)
      goto LABEL_4;
    if (!-[UITextInteraction inGesture](self, "inGesture"))
    {
      v8 = objc_msgSend(v7, "_isGestureType:", 0);
      goto LABEL_5;
    }
    objc_msgSend(v7, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v7, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "panGestureRecognizer");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      v8 = v14 == v7;

    }
    else
    {
LABEL_4:
      v8 = 0;
    }
  }
LABEL_5:

  return v8;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  id v8;
  BOOL v9;

  v6 = a4;
  v7 = a3;
  -[UITextInteraction recognizerForName:](self, "recognizerForName:", 0x1E1778880);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  if (v8 == v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = 1;
  }

  return v9;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  id v8;
  char v9;
  BOOL v10;

  v6 = a3;
  v7 = a4;
  -[UITextInteraction recognizerForName:](self, "recognizerForName:", 0x1E1778880);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 != v6)
  {

LABEL_5:
    v10 = 0;
    goto LABEL_6;
  }
  v9 = objc_msgSend(v7, "_isGestureType:", 10);

  if ((v9 & 1) == 0)
    goto LABEL_5;
  v10 = 1;
LABEL_6:

  return v10;
}

- (BOOL)interaction_gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[UITextRefinementInteraction behaviorDelegate](self, "behaviorDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v5, "loupeGestureRecognizerShouldBegin:forTextLoupeInteraction:", v4, self);

  return (char)self;
}

- (void)loupeGesture:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[4];
  id v23;
  UITextRefinementInteraction *v24;
  char v25;

  v4 = a3;
  v25 = 0;
  -[UITextRefinementInteraction updateVisibilityOffsetForGesture:](self, "updateVisibilityOffsetForGesture:", v4);
  -[UITextInteraction root](self, "root");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = objc_msgSend(v4, "modifierFlags");
    objc_msgSend(v4, "_activeEventOfType:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "_containsHIDPointerEvent") ? 3 : 0;
    v10 = objc_msgSend(v6, "_shouldBeginCustomHighlighterActionForTouchType:modifierFlags:", v9, v7);

    if (!v10)
      goto LABEL_8;
  }
  -[UITextInteraction root](self, "root");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    -[UITextRefinementInteraction _processGestureForCustomHighlighter:](self, "_processGestureForCustomHighlighter:", v4);
  }
  else
  {
LABEL_8:
    -[UITextRefinementInteraction behaviorDelegate](self, "behaviorDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextRefinementInteraction setTriggeredByLongPress:](self, "setTriggeredByLongPress:", objc_msgSend(v14, "triggeredByLongPressGesture:", v4));

    v15 = objc_msgSend(v4, "state");
    v16 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __44__UITextRefinementInteraction_loupeGesture___block_invoke;
    v22[3] = &unk_1E16C6EB8;
    v23 = v4;
    v24 = self;
    v20[0] = v16;
    v20[1] = 3221225472;
    v20[2] = __44__UITextRefinementInteraction_loupeGesture___block_invoke_2;
    v20[3] = &unk_1E16C6EB8;
    v20[4] = self;
    v21 = v23;
    v18[0] = v16;
    v18[1] = 3221225472;
    v18[2] = __44__UITextRefinementInteraction_loupeGesture___block_invoke_3;
    v18[3] = &unk_1E16C6EB8;
    v18[4] = self;
    v17 = v21;
    v19 = v17;
    -[UITextRefinementInteraction loupeGestureWithState:location:translation:velocity:modifierFlags:shouldCancel:](self, "loupeGestureWithState:location:translation:velocity:modifierFlags:shouldCancel:", v15, v22, v20, v18, 0, &v25);
    if (v17 && v25 && (v17[1] & 0x200000000) != 0)
      objc_msgSend(v17, "setState:", 5);

  }
}

double __44__UITextRefinementInteraction_loupeGesture___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;

  if (objc_msgSend(*(id *)(a1 + 32), "state") == 1)
  {
    objc_msgSend(*(id *)(a1 + 40), "behaviorDelegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "startPointForLoupeGesture:", *(_QWORD *)(a1 + 32));
    v4 = v3;
    v6 = v5;

    objc_msgSend(*(id *)(a1 + 32), "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_textInput");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "textInputView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "convertPoint:toView:", v9, v4, v6);
    v11 = v10;

  }
  else
  {
    v12 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "_textInput");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textInputView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "locationInView:", v8);
    v11 = v13;
  }

  return v11;
}

double __44__UITextRefinementInteraction_loupeGesture___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  objc_msgSend(*(id *)(a1 + 32), "behaviorDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_textInput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textInputView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "translationInView:forLoupeGesture:", v4, *(_QWORD *)(a1 + 40));
  v6 = v5;

  return v6;
}

double __44__UITextRefinementInteraction_loupeGesture___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  objc_msgSend(*(id *)(a1 + 32), "behaviorDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_textInput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textInputView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "velocityInView:forLoupeGesture:", v4, *(_QWORD *)(a1 + 40));
  v6 = v5;

  return v6;
}

- (void)_processGestureForCustomHighlighter:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;

  v31 = a3;
  -[UITextInteraction _textInput](self, "_textInput");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textInputView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  -[UITextRefinementInteraction behaviorDelegate](self, "behaviorDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInteraction _textInput](self, "_textInput");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "textInputView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "translationInView:forLoupeGesture:", v12, v31);
  v14 = v13;
  v16 = v15;

  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "preferencesActions");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = objc_msgSend(v18, "BOOLForPreferenceKey:", CFSTR("YukonMagnifiersDisabled"));

  if ((_DWORD)v12)
  {
    if (objc_msgSend(v31, "state") == 1)
    {
      -[UITextRefinementInteraction updateInitialPoint:](self, "updateInitialPoint:", v7, v9);
      -[UITextInteraction root](self, "root");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "_playFeedbackForCursorMovement");
LABEL_4:

      goto LABEL_10;
    }
    if (objc_msgSend(v31, "state") == 2)
    {
      -[UITextRefinementInteraction touchAlignedPointForPoint:translation:](self, "touchAlignedPointForPoint:translation:", v7, v9, v14, v16);
      v7 = v20;
      v9 = v21;
      goto LABEL_10;
    }
    if (objc_msgSend(v31, "state") == 3 || objc_msgSend(v31, "state") == 4)
    {
      -[UITextRefinementInteraction pointIfPlacedCarefully:](self, "pointIfPlacedCarefully:", v7, v9);
      -[UITextRefinementInteraction touchAlignedPointForPoint:translation:](self, "touchAlignedPointForPoint:translation:");
      v7 = v22;
      v9 = v23;
      v24 = _UIGetTextRefinement_AllowableMovement();
      -[UITextInteraction _textInput](self, "_textInput");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "isEditable");

      if ((v26 & 1) == 0)
      {
        -[UITextInteraction assistantDelegate](self, "assistantDelegate");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v29;
        if (v14 * v14 + v16 * v16 <= v24 * v24)
        {
          objc_msgSend(v29, "_editMenuAssistant");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "showSelectionCommands");

        }
        objc_msgSend(v19, "setNeedsSelectionDisplayUpdate");
        goto LABEL_4;
      }
    }
  }
LABEL_10:
  -[UITextInteraction root](self, "root");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "delegate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "_performHighlighterActionWithGestureState:location:", objc_msgSend(v31, "state"), v7, v9);

}

- (void)loupeGestureWithState:(int64_t)a3 location:(id)a4 translation:(id)a5 velocity:(id)a6 modifierFlags:(int64_t)a7 shouldCancel:(BOOL *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;

  v14 = a6;
  v15 = a5;
  v16 = a4;
  -[UITextRefinementInteraction behaviorDelegate](self, "behaviorDelegate");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "textLoupeInteraction:gestureChangedWithState:location:translation:velocity:modifierFlags:shouldCancel:", self, a3, v16, v15, v14, a7, a8);

}

- (void)willBeginExternalGesture
{
  UITextGestureTuning *gestureTuning;

  gestureTuning = self->_gestureTuning;
  self->_gestureTuning = 0;

}

- (CGPoint)pointIfPlacedCarefully:(CGPoint)result
{
  UITextGestureTuning *gestureTuning;

  gestureTuning = self->_gestureTuning;
  if (gestureTuning)
    -[UITextGestureTuning pointIfPlacedCarefully:](gestureTuning, "pointIfPlacedCarefully:", result.x, result.y);
  return result;
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
    }
  }
}

- (BOOL)shouldUseLineThreshold
{
  return -[UITextGestureTuning shouldUseLineThreshold](self->_gestureTuning, "shouldUseLineThreshold");
}

- (void)setShouldUseLineThreshold:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[UITextRefinementInteraction _createGestureTuningIfNecessary](self, "_createGestureTuningIfNecessary");
  -[UITextGestureTuning setShouldUseLineThreshold:](self->_gestureTuning, "setShouldUseLineThreshold:", v3);
}

- (BOOL)strongerBiasAgainstUp
{
  return -[UITextGestureTuning strongerBiasAgainstUp](self->_gestureTuning, "strongerBiasAgainstUp");
}

- (void)setStrongerBiasAgainstUp:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[UITextRefinementInteraction _createGestureTuningIfNecessary](self, "_createGestureTuningIfNecessary");
  -[UITextGestureTuning setStrongerBiasAgainstUp:](self->_gestureTuning, "setStrongerBiasAgainstUp:", v3);
}

- (void)updateVisibilityOffsetForGesture:(id)a3
{
  id v4;
  UITextGestureTuning *gestureTuning;
  uint64_t v6;
  id v7;

  v4 = a3;
  -[UITextRefinementInteraction _createGestureTuningIfNecessary](self, "_createGestureTuningIfNecessary");
  gestureTuning = self->_gestureTuning;
  objc_msgSend(v4, "_allActiveTouches");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "state");

  -[UITextGestureTuning updateWithTouches:gestureState:](gestureTuning, "updateWithTouches:gestureState:", v7, v6);
}

- (CGPoint)touchAlignedPointForPoint:(CGPoint)a3 translation:(CGPoint)a4
{
  double y;
  double x;
  double v6;
  double v7;
  void *v9;
  int v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  if (self->_gestureTuning)
  {
    v6 = a4.y;
    v7 = a4.x;
    -[UITextRefinementInteraction behaviorDelegate](self, "behaviorDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "usesTouchAlignment");

    if (v10)
    {
      -[UITextGestureTuning touchAlignedPointForPoint:translation:](self->_gestureTuning, "touchAlignedPointForPoint:translation:", x, y, v7, v6);
      x = v11;
      y = v12;
    }
  }
  v13 = x;
  v14 = y;
  result.y = v14;
  result.x = v13;
  return result;
}

- (void)setupDelayedLoupeActionWithInitialPoint:(CGPoint)a3
{
  uint64_t v4;
  UIDelayedAction *delayedLoupeAction;
  UIDelayedAction *v6;
  UIDelayedAction *v7;
  UIDelayedAction *delayedSelectionAction;
  UIDelayedAction *v9;
  UIDelayedAction *v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", a3.x, a3.y);
  v4 = objc_claimAutoreleasedReturnValue();
  delayedLoupeAction = self->_delayedLoupeAction;
  v11 = (id)v4;
  if (!delayedLoupeAction)
  {
    v6 = -[UIDelayedAction initWithTarget:action:userInfo:delay:]([UIDelayedAction alloc], "initWithTarget:action:userInfo:delay:", self, sel_delayedLoupeAction_, 0, 0.0);
    v7 = self->_delayedLoupeAction;
    self->_delayedLoupeAction = v6;

    v4 = (uint64_t)v11;
    delayedLoupeAction = self->_delayedLoupeAction;
  }
  -[UIDelayedAction setUserInfo:](delayedLoupeAction, "setUserInfo:", v4);
  -[UIDelayedAction touch](self->_delayedLoupeAction, "touch");
  delayedSelectionAction = self->_delayedSelectionAction;
  if (!delayedSelectionAction)
  {
    v9 = -[UIDelayedAction initWithTarget:action:userInfo:delay:]([UIDelayedAction alloc], "initWithTarget:action:userInfo:delay:", self, sel_delayedSelectionAction_, 0, 0.5);
    v10 = self->_delayedSelectionAction;
    self->_delayedSelectionAction = v9;

    delayedSelectionAction = self->_delayedSelectionAction;
  }
  -[UIDelayedAction setUserInfo:](delayedSelectionAction, "setUserInfo:", v11);
  -[UIDelayedAction touch](self->_delayedSelectionAction, "touch");

}

- (BOOL)translationIsWithinAllowableMovement:(CGPoint)a3
{
  CGFloat v3;
  double v4;

  v3 = a3.x * a3.x + a3.y * a3.y;
  v4 = _UIGetTextRefinement_AllowableMovement();
  return v3 < v4 * v4;
}

- (void)updateOrCancelDelayedLoupeActionWithPoint:(CGPoint)a3 translation:(CGPoint)a4
{
  double y;
  double x;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  y = a3.y;
  x = a3.x;
  v7 = -[UITextRefinementInteraction translationIsWithinAllowableMovement:](self, "translationIsWithinAllowableMovement:", a4.x, a4.y);
  if (self->_delayedLoupeAction)
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", x, y);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDelayedAction setUserInfo:](self->_delayedLoupeAction, "setUserInfo:", v8);

    if (!v7)
    {
      if (-[UIDelayedAction scheduled](self->_delayedLoupeAction, "scheduled"))
      {
        if (-[UITextGestureTuning shouldUseLineThreshold](self->_gestureTuning, "shouldUseLineThreshold"))
        {
          -[UITextInteraction assistantDelegate](self, "assistantDelegate");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "willBeginFloatingCursor:", 0);
          objc_msgSend(v9, "beginFloatingCursorAtPoint:", x, y);

        }
        -[UIDelayedAction cancel](self->_delayedLoupeAction, "cancel");
        +[UITextMagnifierCaret sharedCaretMagnifier](UITextMagnifierCaret, "sharedCaretMagnifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITextInteraction _textInput](self, "_textInput");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "textInputView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "beginMagnifyingTarget:text:magnificationPoint:offset:animated:", v12, v11, 1, x, y, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));

      }
    }
  }
  if (self->_delayedSelectionAction)
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", x, y);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDelayedAction setUserInfo:](self->_delayedSelectionAction, "setUserInfo:", v13);

    if (!v7)
    {
      if (-[UIDelayedAction scheduled](self->_delayedSelectionAction, "scheduled"))
        -[UIDelayedAction cancel](self->_delayedSelectionAction, "cancel");
    }
  }
}

- (void)cancelDelayedLoupeActionIfNecessary
{
  UIDelayedAction *delayedLoupeAction;
  UIDelayedAction *delayedSelectionAction;

  delayedLoupeAction = self->_delayedLoupeAction;
  if (delayedLoupeAction)
    -[UIDelayedAction cancel](delayedLoupeAction, "cancel");
  delayedSelectionAction = self->_delayedSelectionAction;
  if (delayedSelectionAction)
    -[UIDelayedAction cancel](delayedSelectionAction, "cancel");
}

- (void)delayedLoupeAction:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[UITextGestureTuning shouldUseLineThreshold](self->_gestureTuning, "shouldUseLineThreshold"))
  {
    -[UITextInteraction assistantDelegate](self, "assistantDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "willBeginFloatingCursor:", 0);
    objc_msgSend(v5, "CGPointValue");
    objc_msgSend(v4, "beginFloatingCursorAtPoint:");

  }
}

- (void)delayedSelectionAction:(id)a3
{
  -[UITextInteraction _cancelRecognizerWithName:](self, "_cancelRecognizerWithName:", 0x1E17787A0);
}

- (void)delayedDisplayLoupe:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(a3, "CGPointValue");
  v5 = v4;
  v7 = v6;
  +[UITextMagnifierCaret sharedCaretMagnifier](UITextMagnifierCaret, "sharedCaretMagnifier");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[UITextInteraction _textInput](self, "_textInput");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textInputView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "beginMagnifyingTarget:text:magnificationPoint:offset:animated:", v9, v8, 1, v5, v7, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));

}

- (void)canBeginDragCursor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UITextInteraction assistantDelegate](self, "assistantDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "canBeginDragCursor:", v4);

}

- (void)_performGestureType:(int64_t)a3 state:(int64_t)a4 location:(CGPoint)a5 locationOfFirstTouch:(CGPoint)a6 forTouchType:(int64_t)a7
{
  double y;
  double x;
  double v11;
  double v12;
  id v13;
  _QWORD v14[4];
  CGPoint v15;

  y = a5.y;
  x = a5.x;
  if (a3 == 4)
  {
    v11 = a6.y;
    v12 = a6.x;
    -[UITextInteraction assistantDelegate](self, "assistantDelegate");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lollipopGestureWithState:location:locationOfFirstTouch:forTouchType:", a4, a7, x, y, v12, v11);

  }
  else if (a3 == 3)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __100__UITextRefinementInteraction__performGestureType_state_location_locationOfFirstTouch_forTouchType___block_invoke;
    v14[3] = &__block_descriptor_48_e16__CGPoint_dd_8__0l;
    v15 = a5;
    -[UITextRefinementInteraction loupeGestureWithState:location:translation:velocity:modifierFlags:shouldCancel:](self, "loupeGestureWithState:location:translation:velocity:modifierFlags:shouldCancel:", a4, v14, &__block_literal_global_554, &__block_literal_global_46_1, 0, 0);
  }
}

double __100__UITextRefinementInteraction__performGestureType_state_location_locationOfFirstTouch_forTouchType___block_invoke(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

double __100__UITextRefinementInteraction__performGestureType_state_location_locationOfFirstTouch_forTouchType___block_invoke_2()
{
  return *MEMORY[0x1E0C9D538];
}

double __100__UITextRefinementInteraction__performGestureType_state_location_locationOfFirstTouch_forTouchType___block_invoke_3()
{
  return *MEMORY[0x1E0C9D538];
}

- (BOOL)triggeredByLongPress
{
  return self->_triggeredByLongPress;
}

- (void)setTriggeredByLongPress:(BOOL)a3
{
  self->_triggeredByLongPress = a3;
}

- (UITextGestureTuning)gestureTuning
{
  return self->_gestureTuning;
}

- (int64_t)inheritedGranularity
{
  return self->_inheritedGranularity;
}

- (void)setInheritedGranularity:(int64_t)a3
{
  self->_inheritedGranularity = a3;
}

- (void)setBehaviorDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_behaviorDelegate, a3);
}

@end
