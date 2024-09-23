@implementation UITextSelectionInteraction

- (void)didMoveToView:(id)a3
{
  id v4;
  char v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UITextSelectionInteraction;
  v4 = a3;
  -[UITextInteraction didMoveToView:](&v6, sel_didMoveToView_, v4);
  -[UITextGestureTuning setContainerCoordinateSpace:](self->_gestureTuning, "setContainerCoordinateSpace:", v4, v6.receiver, v6.super_class);
  v5 = objc_msgSend(v4, "conformsToProtocol:", &unk_1EDE22B80);

  self->_viewConformsToTextInput = v5;
}

- (void)finishSetup
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _QWORD v19[2];
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)UITextSelectionInteraction;
  -[UITextInteraction finishSetup](&v18, sel_finishSetup);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v19[0] = 0x1E1778880;
  v19[1] = 0x1E17788A0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v7);
        -[UITextInteraction root](self, "root");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "recognizerForName:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(v10, "_pairedGestureIdentifiers");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", 0x1E17787A0);

          objc_msgSend(v10, "_pairedGestureIdentifiers");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", 0x1E17787E0);

          objc_msgSend(v10, "_pairedGestureIdentifiers");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", 0x1E17787C0);

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v5);
  }

}

- (void)_applyTransientState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  CGPoint *p_lastTapLocation;
  CGFloat v11;
  CGFloat v12;
  id v13;

  v4 = a3;
  if (v4)
  {
    v13 = v4;
    objc_msgSend(v4, "objectForKey:", CFSTR("lastTapTimestamp"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "doubleValue");
      self->_lastTapTimestamp = v7;
    }
    objc_msgSend(v13, "objectForKey:", CFSTR("lastTapLocation"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      p_lastTapLocation = &self->_lastTapLocation;
      objc_msgSend(v8, "CGPointValue");
      p_lastTapLocation->x = v11;
      p_lastTapLocation->y = v12;
    }

    v4 = v13;
  }

}

- (UITextSelectionInteraction)initWithMode:(int64_t)a3 indirect:(BOOL)a4
{
  _BOOL4 v4;
  UITextSelectionInteraction *v6;
  UITextSelectionInteraction *v7;
  char *v8;
  UITapAndAHalfRecognizer *v9;
  UITextMultiTapRecognizer *v10;
  UITextMultiTapRecognizer *v11;
  double v12;
  uint64_t *v13;
  void *v14;
  double v15;
  CGSize v16;
  objc_super v18;

  v4 = a4;
  v18.receiver = self;
  v18.super_class = (Class)UITextSelectionInteraction;
  v6 = -[UITextInteraction init](&v18, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_indirectSelectionType = v4;
    v8 = 0;
    switch(a3)
    {
      case 0:
        v8 = sel__handleMultiTapGesture_;
        goto LABEL_4;
      case 1:
        v8 = sel_oneFingerTapSelectsAll_;
        goto LABEL_8;
      case 2:
        v8 = sel_confirmMarkedText_;
        if (!sel_confirmMarkedText_)
          goto LABEL_15;
        goto LABEL_9;
      case 3:
LABEL_4:
        if (v4)
        {
LABEL_8:
          if (!v8)
            goto LABEL_15;
        }
        else
        {
          v9 = -[UITapAndAHalfRecognizer initWithTarget:action:]([UITapAndAHalfRecognizer alloc], "initWithTarget:action:", v6, sel_tapAndAHalf_);
          -[UIGestureRecognizer setName:](v9, "setName:", CFSTR("com.apple.UIKit.textTapAndAHalf"));
          -[UITapAndAHalfRecognizer setAllowableMovement:](v9, "setAllowableMovement:", 60.0);
          -[UITextInteraction addGestureRecognizer:withName:](v7, "addGestureRecognizer:withName:", v9, 0x1E17787E0);

          if (!v8)
            goto LABEL_15;
        }
LABEL_9:
        v10 = -[UITextMultiTapRecognizer initWithTarget:tapAction:]([UITextMultiTapRecognizer alloc], "initWithTarget:tapAction:", v7, v8);
        v11 = v10;
        if (v4)
        {
          -[UITextMultiTapRecognizer setRequiredButtonMask:](v10, "setRequiredButtonMask:", 1);
          -[UITextMultiTapRecognizer setRecognizesOnSubsequentTouchDowns:](v11, "setRecognizesOnSubsequentTouchDowns:", 1);
          v12 = 10.0;
        }
        else
        {
          v12 = 60.0;
        }
        -[UITextMultiTapRecognizer setAllowableMovement:](v11, "setAllowableMovement:", v12);
        -[UIGestureRecognizer setDelaysTouchesEnded:](v11, "setDelaysTouchesEnded:", 0);
        v13 = &UITextInteractionNameIndirectSingleTap;
        if (!v4)
          v13 = &UITextInteractionNameSingleTap;
        -[UITextInteraction addGestureRecognizer:withName:](v7, "addGestureRecognizer:withName:", v11, *v13);

LABEL_15:
        objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "systemUptime");
        v7->_lastTapTimestamp = v15 + -0.5;

        v16 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
        v7->_originalCaretRect.origin = (CGPoint)*MEMORY[0x1E0C9D648];
        v7->_originalCaretRect.size = v16;
        v7->_granularityToHandOff = -1;
        v7->_isCharacterGranularityOnMarkedTextPresenceEnabled = _os_feature_enabled_impl();
        break;
      default:
        goto LABEL_15;
    }
  }
  return v7;
}

- (id)_transientState
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("lastTapTimestamp");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_lastTapTimestamp);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("lastTapLocation");
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", self->_lastTapLocation.x, self->_lastTapLocation.y);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_grabberSuppressionAssertion, 0);
  objc_storeStrong((id *)&self->_activeSelectionController, 0);
  objc_storeStrong((id *)&self->_activeLoupeSession, 0);
  objc_storeStrong((id *)&self->_gestureTuning, 0);
}

- (UITextSelectionInteraction)initWithMode:(int64_t)a3
{
  return -[UITextSelectionInteraction initWithMode:indirect:](self, "initWithMode:indirect:", a3, 0);
}

- (BOOL)_shouldAllowEnforcedTouchTypeForTouch:(id)a3 forGestureRecognizer:(id)a4
{
  BOOL v4;

  v4 = !self->_indirectSelectionType;
  return objc_msgSend(a3, "_isPointerTouch") ^ v4;
}

- (void)toggleSelectionCommands
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;

  -[UITextInteraction assistantDelegate](self, "assistantDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_editMenuAssistant");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_editMenuIsVisibleOrDismissedRecently");

  -[UITextInteraction assistantDelegate](self, "assistantDelegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_editMenuAssistant");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
    objc_msgSend(v6, "hideSelectionCommands");
  else
    objc_msgSend(v6, "showSelectionCommands");

}

- (void)_showSelectionCommandsIfApplicableAfterDelay:(double)a3
{
  void *v5;
  void *v6;
  id v7;

  if (!-[UITextSelectionInteraction _usesIndirectSelectionBehavior](self, "_usesIndirectSelectionBehavior"))
  {
    -[UITextInteraction assistantDelegate](self, "assistantDelegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_editMenuAssistant");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (a3 == 0.0)
      objc_msgSend(v5, "showSelectionCommands");
    else
      objc_msgSend(v5, "showSelectionCommandsAfterDelay:", a3);

  }
}

- (BOOL)_usesIndirectSelectionBehavior
{
  return self->_indirectSelectionType;
}

- (BOOL)_usesPencilSelectionBehaviorForGesture:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(a3, "touchesForTap", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "type") == 2)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (BOOL)_isShiftKeyBeingHeldForGesture:(id)a3
{
  void *v3;
  char v4;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isShiftKeyBeingHeld");

  return v4;
}

- (BOOL)_isNowWithinRepeatedTapTime
{
  return -[UITextSelectionInteraction _isWithinRepeatedTapTimeForTouch:](self, "_isWithinRepeatedTapTimeForTouch:", 0);
}

- (BOOL)_isWithinRepeatedTapTimeForTouch:(id)a3
{
  double v4;
  double v5;
  void *v6;
  double v7;

  if (a3)
  {
    objc_msgSend(a3, "timestamp");
    v5 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "systemUptime");
    v5 = v7;

  }
  return v5 - self->_lastTapTimestamp <= 0.35;
}

- (BOOL)_isRepeatedTap:(id)a3 gestureLocationOut:(CGPoint *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  unint64_t v19;

  v6 = a3;
  -[UITextInteraction _textInput](self, "_textInput");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "superview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "locationInView:", v9);
  v11 = v10;
  v13 = v12;
  objc_msgSend(v7, "textInputView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "convertPoint:toView:", v14, v11, v13);
  v16 = v15;
  v18 = v17;

  if (a4)
  {
    a4->x = v16;
    a4->y = v18;
  }
  v19 = objc_msgSend(v6, "tapCount");

  return v19 > 1;
}

- (int64_t)handOffGranularity
{
  int64_t granularityToHandOff;

  granularityToHandOff = self->_granularityToHandOff;
  self->_granularityToHandOff = -1;
  return granularityToHandOff;
}

- (int64_t)_textGranularityForNumberOfTaps:(unint64_t)a3
{
  if (a3 >= 2 && -[UITextInteraction _shouldObscureTextInput](self, "_shouldObscureTextInput"))
    return 5;
  if (a3 > 2)
    return 3;
  return qword_1866846E0[a3];
}

- (void)_checkForRepeatedTap:(id)a3 gestureLocationOut:(CGPoint *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  _UIKeyboardTextSelectionController *v14;
  _UIKeyboardTextSelectionController *activeSelectionController;
  void *v16;
  _BOOL4 v17;
  int64_t v18;
  void *v19;
  _BOOL4 v20;
  uint64_t v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  uint64_t v25;
  void *v26;
  void *v27;
  int v28;
  _BOOL4 v29;
  _BOOL4 v30;
  _BOOL4 v31;
  uint64_t v32;
  void *v33;
  _QWORD v34[5];
  id v35;
  _QWORD v36[5];
  id v37;
  _QWORD v38[5];
  id v39;
  CGPoint v40;

  v6 = a3;
  -[UITextInteraction view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInteraction assistantDelegate](self, "assistantDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "activeSelectionController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "selection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = (CGPoint)0;
  v11 = -[UITextSelectionInteraction _isRepeatedTap:gestureLocationOut:](self, "_isRepeatedTap:gestureLocationOut:", v6, &v40);
  if (objc_msgSend(v6, "state") == 1)
  {
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "clearAnimationStyleForUserDrivenPresentation");

    objc_msgSend(v8, "setFirstResponderIfNecessary");
    objc_msgSend(v8, "setSelectionHighlightMode:", 0);
  }
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "updateIdleDetection:", 4);

  -[UITextInteraction _beginSelectionChange](self, "_beginSelectionChange");
  if (objc_msgSend(v6, "state") == 1)
  {
    objc_msgSend(v8, "activeSelectionController");
    v14 = (_UIKeyboardTextSelectionController *)objc_claimAutoreleasedReturnValue();
    activeSelectionController = self->_activeSelectionController;
    self->_activeSelectionController = v14;

    objc_msgSend(v8, "_editMenuAssistant");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "hideSelectionCommands");

  }
  -[UITextSelectionInteraction willUpdateSelectionWithGesture:](self, "willUpdateSelectionWithGesture:", v6);
  v17 = -[UITextSelectionInteraction _isShiftKeyBeingHeldForGesture:](self, "_isShiftKeyBeingHeldForGesture:", v6);
  if (v11)
  {
    v18 = -[UITextSelectionInteraction _textGranularityForNumberOfTaps:](self, "_textGranularityForNumberOfTaps:", objc_msgSend(v6, "tapCount"));
    self->_granularityToHandOff = v18;
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __70__UITextSelectionInteraction__checkForRepeatedTap_gestureLocationOut___block_invoke;
    v38[3] = &unk_1E16B1B50;
    v38[4] = self;
    v39 = v6;
    -[UITextSelectionInteraction tappedToSelectTextWithGesture:atPoint:granularity:completionHandler:](self, "tappedToSelectTextWithGesture:atPoint:granularity:completionHandler:", v39, v18, v38, v40);
    v19 = v39;
LABEL_17:

    goto LABEL_18;
  }
  v20 = v17;
  if (-[UITextInteraction _shouldObscureTextInput](self, "_shouldObscureTextInput"))
  {
    v21 = 5;
  }
  else if (self->_isCharacterGranularityOnMarkedTextPresenceEnabled)
  {
    -[UITextInteraction _textInput](self, "_textInput");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "markedTextRange");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v23 == 0;

  }
  else
  {
    v21 = 1;
  }
  v24 = -[UITextSelectionInteraction _usesPencilSelectionBehaviorForGesture:](self, "_usesPencilSelectionBehaviorForGesture:", v6);
  if (-[UITextSelectionInteraction _usesIndirectSelectionBehavior](self, "_usesIndirectSelectionBehavior") || v24)
    v25 = 0;
  else
    v25 = v21;
  if (v20)
  {
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __70__UITextSelectionInteraction__checkForRepeatedTap_gestureLocationOut___block_invoke_2;
    v36[3] = &unk_1E16B1B50;
    v36[4] = self;
    v37 = v6;
    -[UITextSelectionInteraction tappedToUpdateSelectionWithGesture:atPoint:granularity:completionHandler:](self, "tappedToUpdateSelectionWithGesture:atPoint:granularity:completionHandler:", v37, 0, v36, v40);
    v19 = v37;
    goto LABEL_17;
  }
  v32 = v25;
  v33 = v7;
  -[UITextInteraction _textInput](self, "_textInput");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "selectedTextRange");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "isEmpty");

  v29 = -[UITextInteraction containerChangesSelectionOnOneFingerTap](self, "containerChangesSelectionOnOneFingerTap");
  v30 = self->_wasOriginallyFirstResponder
     && -[UITextInteraction _textInputLivesInKeyWindow](self, "_textInputLivesInKeyWindow");
  v31 = -[UITextInteraction selection:containsPoint:](self, "selection:containsPoint:", v10, v40);
  if ((((-[UITextSelectionInteraction _usesIndirectSelectionBehavior](self, "_usesIndirectSelectionBehavior") || v24) | v28) & 1) != 0
    || !v31)
  {
    if (v29)
    {
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __70__UITextSelectionInteraction__checkForRepeatedTap_gestureLocationOut___block_invoke_3;
      v34[3] = &unk_1E16B1B50;
      v34[4] = self;
      v35 = v6;
      -[UITextSelectionInteraction tappedToPositionCursorWithGesture:atPoint:granularity:completionHandler:](self, "tappedToPositionCursorWithGesture:atPoint:granularity:completionHandler:", v35, v32, v34, v40);

    }
    else
    {
      -[UITextSelectionInteraction didUpdateSelectionWithGesture:](self, "didUpdateSelectionWithGesture:", v6);
    }
    v7 = v33;
  }
  else
  {
    v7 = v33;
    if (v30)
      -[UITextSelectionInteraction toggleSelectionCommands](self, "toggleSelectionCommands");
  }
LABEL_18:
  objc_msgSend(v8, "notifyKeyboardSelectionChanged");
  -[UITextInteraction _endSelectionChange](self, "_endSelectionChange");
  if (a4)
    *a4 = v40;

}

uint64_t __70__UITextSelectionInteraction__checkForRepeatedTap_gestureLocationOut___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didUpdateSelectionWithGesture:", *(_QWORD *)(a1 + 40));
}

uint64_t __70__UITextSelectionInteraction__checkForRepeatedTap_gestureLocationOut___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didUpdateSelectionWithGesture:", *(_QWORD *)(a1 + 40));
}

uint64_t __70__UITextSelectionInteraction__checkForRepeatedTap_gestureLocationOut___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didUpdateSelectionWithGesture:", *(_QWORD *)(a1 + 40));
}

- (void)tappedToUpdateSelectionWithGesture:(id)a3 atPoint:(CGPoint)a4 granularity:(int64_t)a5 completionHandler:(id)a6
{
  double y;
  double x;
  _UIKeyboardTextSelectionController *activeSelectionController;
  void *v10;
  void (**v11)(void);

  y = a4.y;
  x = a4.x;
  activeSelectionController = self->_activeSelectionController;
  v11 = (void (**)(void))a6;
  -[_UIKeyboardTextSelectionController initialSelection](activeSelectionController, "initialSelection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    -[_UIKeyboardTextSelectionController beginSelection](self->_activeSelectionController, "beginSelection");
  -[_UIKeyboardTextSelectionController modifySelectionWithExtentPoint:executionContext:](self->_activeSelectionController, "modifySelectionWithExtentPoint:executionContext:", 0, x, y);
  v11[2]();

}

- (BOOL)_hasTextAlternativesAtLocation:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  char v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;

  y = a3.y;
  x = a3.x;
  -[UITextInteraction _textInput](self, "_textInput");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectedTextRange");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "_isRanged");

  if ((v8 & 1) != 0)
    return 0;
  -[UITextInteraction _textInput](self, "_textInput");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "closestPositionToPoint:", x, y);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  -[UITextInteraction rangeWithTextAlternatives:atPosition:](self, "rangeWithTextAlternatives:atPosition:", &v14, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v12 != 0;

  return v9;
}

- (BOOL)_hasMarkedTextAtLocation:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;
  CGPoint v27;
  CGRect v28;
  CGRect v29;

  y = a3.y;
  x = a3.x;
  v26 = *MEMORY[0x1E0C80C00];
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v6, "hasInlineCompletionAsMarkedText");

  if ((_DWORD)v7)
  {
    -[UITextInteraction _textInput](self, "_textInput");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "markedTextRange");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[UITextInteraction _textInput](self, "_textInput");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "selectionRectsForRange:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v12 = v11;
      v7 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v7)
      {
        v13 = *(_QWORD *)v22;
        while (2)
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v22 != v13)
              objc_enumerationMutation(v12);
            v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
            objc_msgSend(v15, "rect", (_QWORD)v21);
            v17 = fmin((v16 + -44.0) * 0.5, 0.0);
            objc_msgSend(v15, "rect");
            v19 = fmin((v18 + -44.0) * 0.5, 0.0);
            objc_msgSend(v15, "rect");
            v29 = CGRectInset(v28, v17, v19);
            v27.x = x;
            v27.y = y;
            if (CGRectContainsPoint(v29, v27))
            {
              LOBYTE(v7) = 1;
              goto LABEL_13;
            }
          }
          v7 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
          if (v7)
            continue;
          break;
        }
      }
LABEL_13:

    }
    else
    {
      LOBYTE(v7) = 0;
    }

  }
  return v7;
}

- (void)tappedToPositionCursorWithGesture:(id)a3 atPoint:(CGPoint)a4 granularity:(int64_t)a5 completionHandler:(id)a6
{
  double y;
  double x;
  id v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  id v27;

  y = a4.y;
  x = a4.x;
  v10 = a6;
  -[UITextInteraction assistantDelegate](self, "assistantDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInteraction _textInput](self, "_textInput");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isFirstResponder");

  -[UITextInteraction _textInput](self, "_textInput");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "selectedTextRange");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "_isRanged");

  -[UITextInteraction _textInput](self, "_textInput");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "closestPositionToPoint:", x, y);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0;
  v20 = 0;
  if (v16 || !v13)
    goto LABEL_9;
  v27 = 0;
  -[UITextInteraction rangeWithTextAlternatives:atPosition:](self, "rangeWithTextAlternatives:atPosition:", &v27, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v27;
  if (v21)
  {
    v19 = v21;
    objc_msgSend(v11, "scheduleDictationReplacementsForAlternatives:range:", v21, v20);
    goto LABEL_12;
  }
  -[UITextInteraction _textInput](self, "_textInput");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "textRangeFromPosition:toPosition:", v18, v18);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!+[UITextSelectionDisplayInteraction isTextAccelerationUIEnabled](UITextSelectionDisplayInteraction, "isTextAccelerationUIEnabled")|| (objc_msgSend(v11, "_textChoicesAssistant"), v24 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v24, "rangeForTextChoicesAtPosition:", v18), v19 = (void *)objc_claimAutoreleasedReturnValue(), v24, !v19))
  {
    objc_msgSend(v11, "rangeForTextReplacement:", v23);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25 = objc_msgSend(v11, "scheduleReplacementsForRange:withOptions:", v19, 47);

  if ((v25 & 1) == 0)
  {
LABEL_9:
    if ((objc_msgSend(v19, "isEmpty") & 1) == 0)
    {
      objc_msgSend(v11, "_textChoicesAssistant");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "clearUnderlinesInRange:animated:", v19, 1);

    }
    -[_UIKeyboardTextSelectionController beginSelection](self->_activeSelectionController, "beginSelection");
    -[_UIKeyboardTextSelectionController selectPositionAtPoint:granularity:completionHandler:](self->_activeSelectionController, "selectPositionAtPoint:granularity:completionHandler:", a5, v10, x, y);
    -[_UIKeyboardTextSelectionController endSelection](self->_activeSelectionController, "endSelection");
  }
LABEL_12:

}

- (void)tappedToSelectTextWithGesture:(id)a3 atPoint:(CGPoint)a4 granularity:(int64_t)a5 completionHandler:(id)a6
{
  double y;
  double x;
  _UIKeyboardTextSelectionController *activeSelectionController;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;

  y = a4.y;
  x = a4.x;
  activeSelectionController = self->_activeSelectionController;
  v11 = a6;
  -[_UIKeyboardTextSelectionController beginSelection](activeSelectionController, "beginSelection");
  -[_UIKeyboardTextSelectionController selectTextWithGranularity:atPoint:completionHandler:](self->_activeSelectionController, "selectTextWithGranularity:atPoint:completionHandler:", a5, v11, x, y);

  -[UITextInteraction assistantDelegate](self, "assistantDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(activeSelectionController) = objc_msgSend(v12, "didPerformLoupeSelectionHandoff");

  if ((activeSelectionController & 1) == 0)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "inputDelegateManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "hasAsyncCapableInputDelegate");

    if ((v15 & 1) == 0)
      -[_UIKeyboardTextSelectionController endSelection](self->_activeSelectionController, "endSelection");
  }
}

- (void)oneFingerTapSelectsAll:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[UITextInteraction assistantDelegate](self, "assistantDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UITextSelectionInteraction _usesIndirectSelectionBehavior](self, "_usesIndirectSelectionBehavior"))
  {
    -[UITextInteraction view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      -[UITextSelectionInteraction tappedToSelectTextWithGesture:atPoint:granularity:completionHandler:](self, "tappedToSelectTextWithGesture:atPoint:granularity:completionHandler:", v8, 5, 0, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  }
  else
  {
    objc_msgSend(v4, "setSelectionHighlightMode:", 0);
    objc_msgSend(v4, "setFirstResponderIfNecessary");
    objc_msgSend(v4, "activeSelectionController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "selection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[UITextSelectionInteraction tappedToSelectTextWithGesture:atPoint:granularity:completionHandler:](self, "tappedToSelectTextWithGesture:atPoint:granularity:completionHandler:", v8, 5, 0, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
    objc_msgSend(v7, "commit");
    objc_msgSend(v4, "notifyKeyboardSelectionChanged");

  }
}

- (void)_handleMultiTapGesture:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _UIKeyboardTextSelectionController *v13;
  _UIKeyboardTextSelectionController *activeSelectionController;
  _UIInvalidatable *v15;
  _UIInvalidatable *grabberSuppressionAssertion;
  dispatch_time_t v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  char v24;
  double v25;
  double v26;
  _QWORD block[5];
  id v28;

  v4 = a3;
  v5 = objc_msgSend(v4, "state") == 1 || objc_msgSend(v4, "state") == 2 || objc_msgSend(v4, "state") == 4;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasInlineCompletionAsMarkedText");

  if (!v7)
  {
    if (!v5)
      goto LABEL_16;
LABEL_10:
    -[UITextInteraction cancelLinkInteractionSession](self, "cancelLinkInteractionSession");
    -[UITextInteraction _textInput](self, "_textInput");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextInteraction _performPreemtiveLayoutToEnsureNoMoreLayoutWhileSelecting:](self, "_performPreemtiveLayoutToEnsureNoMoreLayoutWhileSelecting:", v9);

    -[UITextInteraction assistantDelegate](self, "assistantDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextInteraction _textInput](self, "_textInput");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_editMenuAssistant");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "state") == 1)
    {
      objc_msgSend(v10, "activeSelectionController");
      v13 = (_UIKeyboardTextSelectionController *)objc_claimAutoreleasedReturnValue();
      activeSelectionController = self->_activeSelectionController;
      self->_activeSelectionController = v13;

    }
    if (objc_msgSend(v4, "state") != 1)
      goto LABEL_25;
    if (-[UITextSelectionInteraction _usesIndirectSelectionBehavior](self, "_usesIndirectSelectionBehavior"))
    {
      objc_msgSend(v10, "obtainSelectionGrabberSuppressionAssertion");
      v15 = (_UIInvalidatable *)objc_claimAutoreleasedReturnValue();
      grabberSuppressionAssertion = self->_grabberSuppressionAssertion;
      self->_grabberSuppressionAssertion = v15;

      objc_msgSend(v12, "hideSelectionCommands");
      v17 = dispatch_time(0, 750000000);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __53__UITextSelectionInteraction__handleMultiTapGesture___block_invoke;
      block[3] = &unk_1E16B1B50;
      block[4] = self;
      v28 = v10;
      dispatch_after(v17, MEMORY[0x1E0C80D38], block);

      goto LABEL_25;
    }
    objc_msgSend(v10, "grabberSuppressionAssertion");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v10, "setGrabberSuppressionAssertion:", 0);
      objc_msgSend(v11, "selectedTextRange");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isEmpty");

      if ((v21 & 1) != 0)
      {
LABEL_25:
        if ((objc_msgSend(v10, "viewCouldBecomeEditable:", v11) & 1) != 0)
        {
          v25 = 0.0;
          v26 = 0.0;
          -[UITextSelectionInteraction _checkForRepeatedTap:gestureLocationOut:](self, "_checkForRepeatedTap:gestureLocationOut:", v4, &v25);
          -[UITextSelectionInteraction _updateTapGestureHistoryWithLocation:](self, "_updateTapGestureHistoryWithLocation:", v25, v26);
        }
        else
        {
          -[UITextInteraction setInGesture:](self, "setInGesture:", 1);
          v25 = 0.0;
          v26 = 0.0;
          -[UITextSelectionInteraction _checkForRepeatedTap:gestureLocationOut:](self, "_checkForRepeatedTap:gestureLocationOut:", v4, &v25);
          -[UITextSelectionInteraction _updateTapGestureHistoryWithLocation:](self, "_updateTapGestureHistoryWithLocation:", v25, v26);
          -[UITextInteraction setInGesture:](self, "setInGesture:", 0);
        }
        goto LABEL_28;
      }
      objc_msgSend(v10, "_textChoicesAssistant");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "dismissWithoutSelection");

    }
    else
    {
      if (!-[UITextInteraction _textInputIsInteractive](self, "_textInputIsInteractive"))
        goto LABEL_25;
      if (objc_msgSend(v10, "selectionHighlightMode") != 1)
        goto LABEL_25;
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "_shouldSuppressSoftwareKeyboardByDictation");

      if ((v24 & 1) != 0)
        goto LABEL_25;
      objc_msgSend(v10, "setSelectionHighlightMode:", 0);
    }
    objc_msgSend(v12, "showSelectionCommands");
LABEL_28:

    goto LABEL_29;
  }
  objc_msgSend(v4, "location");
  if (-[UITextSelectionInteraction _hasMarkedTextAtLocation:](self, "_hasMarkedTextAtLocation:"))
  {
    if (objc_msgSend(v4, "state") == 3)
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "acceptInlineCompletionWithCompletionHandler:", 0);

    }
    goto LABEL_16;
  }
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "removeInlineTextCompletionPrompt");

  if (v5)
    goto LABEL_10;
LABEL_16:
  if (objc_msgSend(v4, "state") == 3)
    self->_granularityToHandOff = -1;
LABEL_29:

}

void __53__UITextSelectionInteraction__handleMultiTapGesture___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 224))
  {
    objc_msgSend(*(id *)(a1 + 40), "setGrabberSuppressionAssertion:");
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(v2 + 224);
    *(_QWORD *)(v2 + 224) = 0;

  }
}

- (void)willUpdateSelectionWithGesture:(id)a3
{
  CGRect *p_originalCaretRect;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;

  p_originalCaretRect = &self->_originalCaretRect;
  -[_UIKeyboardTextSelectionController caretRectForCursorPosition](self->_activeSelectionController, "caretRectForCursorPosition", a3);
  p_originalCaretRect->origin.x = v4;
  p_originalCaretRect->origin.y = v5;
  p_originalCaretRect->size.width = v6;
  p_originalCaretRect->size.height = v7;
}

- (void)didUpdateSelectionWithGesture:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  BOOL v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  int v21;
  void *v22;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  _BOOL4 v27;
  void *v28;
  void *v29;
  void *v31;
  __int128 v32;
  CGRect v33;
  CGRect v34;

  v4 = a3;
  -[UITextInteraction cancelLinkInteractionSession](self, "cancelLinkInteractionSession");
  -[UITextInteraction _textInput](self, "_textInput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInteraction _performPreemtiveLayoutToEnsureNoMoreLayoutWhileSelecting:](self, "_performPreemtiveLayoutToEnsureNoMoreLayoutWhileSelecting:", v5);

  -[UITextInteraction assistantDelegate](self, "assistantDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activeSelectionController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[UITextInteraction view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInteraction _textInput](self, "_textInput");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = *MEMORY[0x1E0C9D538];
  -[UITextInteraction _textInput](self, "_textInput");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "selectedTextRange");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "isEmpty");
  v13 = -[UITextSelectionInteraction _isShiftKeyBeingHeldForGesture:](self, "_isShiftKeyBeingHeldForGesture:", v4);
  LODWORD(v7) = -[UITextInteraction selection:containsPoint:](self, "selection:containsPoint:", v8, v32);
  v14 = -[UITextSelectionInteraction _isRepeatedTap:gestureLocationOut:](self, "_isRepeatedTap:gestureLocationOut:", v4, &v32);
  -[UITextSelectionInteraction _usesPencilSelectionBehaviorForGesture:](self, "_usesPencilSelectionBehaviorForGesture:", v4);

  if ((_DWORD)v7 && !v13 && !v14)
  {
    -[UITextSelectionInteraction toggleSelectionCommands](self, "toggleSelectionCommands");
    -[UITextInteraction root](self, "root");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "assistantDelegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setGrabberSuppressionAssertion:", 0);

    goto LABEL_33;
  }
  if ((v12 & 1) != 0)
  {
    -[UITextInteraction assistantDelegate](self, "assistantDelegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_editMenuAssistant");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = self->_wasOriginallyFirstResponder
       && -[UITextInteraction _textInputLivesInKeyWindow](self, "_textInputLivesInKeyWindow");
    if (objc_msgSend(v18, "_editMenuIsVisibleOrDismissedRecently"))
      v21 = objc_msgSend(v18, "_hasTextReplacements");
    else
      v21 = 1;
    -[UITextInteraction _performPreemtiveLayoutToEnsureNoMoreLayoutWhileSelecting:](self, "_performPreemtiveLayoutToEnsureNoMoreLayoutWhileSelecting:", v31);
    if (!v19)
      goto LABEL_20;
    -[UITextInteraction disableClearsOnInsertion](self, "disableClearsOnInsertion");
    if (!-[UITextSelectionInteraction _usesIndirectSelectionBehavior](self, "_usesIndirectSelectionBehavior"))
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "showKeyboardIfNeeded");

    }
    if (v21
      && (-[_UIKeyboardTextSelectionController caretRectForCursorPosition](self->_activeSelectionController, "caretRectForCursorPosition"), x = v33.origin.x, y = v33.origin.y, width = v33.size.width, height = v33.size.height, !CGRectIsEmpty(v33)))
    {
      v34.origin.x = x;
      v34.origin.y = y;
      v34.size.width = width;
      v34.size.height = height;
      v27 = CGRectEqualToRect(v34, self->_originalCaretRect);
    }
    else
    {
LABEL_20:
      v27 = 0;
    }
    -[UITextInteraction root](self, "root");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "recognizerForName:", 0x1E17788A0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v29, "state") == 5)
    {
      if (!v27)
        goto LABEL_29;
    }
    else if (objc_msgSend(v29, "state") != 4 || !v27)
    {
LABEL_29:
      if (!v19 && -[UITextInteraction _textInputIsInteractive](self, "_textInputIsInteractive"))
      {
        -[UITextSelectionInteraction _updateTapGestureHistoryWithLocation:](self, "_updateTapGestureHistoryWithLocation:", v32);
        objc_msgSend(v6, "setGestureRecognizers");
      }

      goto LABEL_33;
    }
    -[UITextSelectionInteraction _showSelectionCommandsIfApplicableAfterDelay:](self, "_showSelectionCommandsIfApplicableAfterDelay:", 0.2);
    goto LABEL_29;
  }
  objc_msgSend(v6, "_editMenuAssistant");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "showSelectionCommands");

  if (self->_wasOriginallyFirstResponder
    && -[UITextInteraction _textInputLivesInKeyWindow](self, "_textInputLivesInKeyWindow"))
  {
    -[UITextInteraction disableClearsOnInsertion](self, "disableClearsOnInsertion");
  }
LABEL_33:

}

- (void)_updateTapGestureHistoryWithLocation:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  void *v6;
  double v7;

  y = a3.y;
  x = a3.x;
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "systemUptime");
  self->_lastTapTimestamp = v7;

  self->_lastTapLocation.x = x;
  self->_lastTapLocation.y = y;
}

- (void)confirmMarkedText:(id)a3
{
  id v3;

  if (objc_msgSend(a3, "state") != 4)
  {
    +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "acceptAutocorrectionWithCompletionHandler:", 0);

  }
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
      -[UITextGestureTuning setStrongerBiasAgainstUp:](self->_gestureTuning, "setStrongerBiasAgainstUp:", 1);
    }
  }
}

- (void)tapAndAHalf:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  char v16;
  void *v17;
  UITextGestureTuning *gestureTuning;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  UITextLoupeSession *activeLoupeSession;
  _UIKeyboardTextSelectionController *v25;
  _UIKeyboardTextSelectionController *activeSelectionController;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  _UIInvalidatable *v32;
  _UIInvalidatable *grabberSuppressionAssertion;
  void *v34;
  double v35;
  double v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  UITextLoupeSession *v41;
  UITextLoupeSession *v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  _UIInvalidatable *v47;
  UITextLoupeSession *v48;
  UITextGestureTuning *v49;
  char v50;
  double v51;
  double v52;
  UITextLoupeSession *v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  uint64_t v59;
  void *v60;
  id v61;

  v61 = a3;
  -[UITextInteraction cancelLinkInteractionSession](self, "cancelLinkInteractionSession");
  -[UITextInteraction assistantDelegate](self, "assistantDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITextMagnifierRanged sharedRangedMagnifier](UITextMagnifierRanged, "sharedRangedMagnifier");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInteraction view](self, "view");
  v59 = objc_claimAutoreleasedReturnValue();
  -[UITextInteraction _textInput](self, "_textInput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "touch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textInputView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "locationInView:", v7);
  v9 = v8;
  v11 = v10;

  objc_msgSend(v61, "translationInWindowCoordinates");
  v13 = v12;
  v15 = v14;
  v16 = objc_msgSend(v4, "isDisplayingVerticalSelection");
  objc_msgSend(v4, "setSelectionHighlightMode:", 0);
  objc_msgSend(v4, "_editMenuAssistant");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "cancelDelayedCommandRequests");

  -[UITextSelectionInteraction _createGestureTuningIfNecessary](self, "_createGestureTuningIfNecessary");
  gestureTuning = self->_gestureTuning;
  v19 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v61, "touch");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setWithObject:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextGestureTuning updateWithTouches:gestureState:](gestureTuning, "updateWithTouches:gestureState:", v21, objc_msgSend(v61, "state"));

  objc_msgSend(v61, "name");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v21) = objc_msgSend(v22, "isEqualToString:", 0x1E1778800);

  if ((_DWORD)v21)
    v23 = 3;
  else
    v23 = 1;
  if (self->_activeLoupeSession && !-[UITextInteraction _textInputIsInteractive](self, "_textInputIsInteractive"))
  {
    -[UITextLoupeSession invalidate](self->_activeLoupeSession, "invalidate");
    activeLoupeSession = self->_activeLoupeSession;
    self->_activeLoupeSession = 0;

  }
  if (objc_msgSend(v61, "state") == 1)
  {
    objc_msgSend(v4, "activeSelectionController");
    v25 = (_UIKeyboardTextSelectionController *)objc_claimAutoreleasedReturnValue();
    activeSelectionController = self->_activeSelectionController;
    self->_activeSelectionController = v25;

    objc_msgSend(v5, "textInputView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "locationOfFirstTap");
    objc_msgSend(v27, "convertPoint:fromView:", 0);
    v29 = v28;
    v31 = v30;

    -[UITextInteraction setInGesture:](self, "setInGesture:", 1);
    if (-[UITextSelectionInteraction _usesIndirectSelectionBehavior](self, "_usesIndirectSelectionBehavior"))
    {
      objc_msgSend(v4, "obtainSelectionGrabberSuppressionAssertion");
      v32 = (_UIInvalidatable *)objc_claimAutoreleasedReturnValue();
      grabberSuppressionAssertion = self->_grabberSuppressionAssertion;
      self->_grabberSuppressionAssertion = v32;

      -[UITextInteraction _cancelRecognizerWithName:](self, "_cancelRecognizerWithName:", 0x1E1778880);
      -[UITextSelectionInteraction _updateTapGestureHistoryWithLocation:](self, "_updateTapGestureHistoryWithLocation:", v29, v31);
    }
    objc_msgSend(v4, "setFirstResponderIfNecessary");
    -[_UIKeyboardTextSelectionController selection](self->_activeSelectionController, "selection");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "caretRect");
    v36 = v35;

    -[UITextGestureTuning assertInitialPositionFromTopOfCaret:distanceFromCaret:](self->_gestureTuning, "assertInitialPositionFromTopOfCaret:distanceFromCaret:", v31 - v36, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
    if (-[UITextInteraction _textInputIsInteractive](self, "_textInputIsInteractive"))
    {
      if (!-[UITextSelectionInteraction _usesIndirectSelectionBehavior](self, "_usesIndirectSelectionBehavior"))
      {
        objc_msgSend(v61, "touch");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v4, "shouldDisplayLoupeSessionForTouchType:", objc_msgSend(v37, "type"));

        if (v38)
        {
          objc_msgSend(v4, "_caretView");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "textInputView");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          +[UITextLoupeSession _beginLoupeSessionAtPoint:fromSelectionWidgetView:inView:orientation:](UITextLoupeSession, "_beginLoupeSessionAtPoint:fromSelectionWidgetView:inView:orientation:", v39, v40, objc_msgSend(v4, "loupeOrientation"), v29, v31);
          v41 = (UITextLoupeSession *)objc_claimAutoreleasedReturnValue();
          v42 = self->_activeLoupeSession;
          self->_activeLoupeSession = v41;

          -[UITextLoupeSession setGestureTuning:](self->_activeLoupeSession, "setGestureTuning:", self->_gestureTuning);
        }
      }
      objc_msgSend(v4, "willBeginSelectionInteraction");
      -[UITextInteraction _beginSelectionChange](self, "_beginSelectionChange");
      -[UITextInteraction _cancelRecognizerWithName:](self, "_cancelRecognizerWithName:", 0x1E17787A0);
      -[_UIKeyboardTextSelectionController beginSelection](self->_activeSelectionController, "beginSelection");
      -[_UIKeyboardTextSelectionController selectTextWithGranularity:atPoint:completionHandler:](self->_activeSelectionController, "selectTextWithGranularity:atPoint:completionHandler:", v23, 0, v29, v31);
      -[_UIKeyboardTextSelectionController restartSelection](self->_activeSelectionController, "restartSelection");
    }
    objc_msgSend(v4, "notifyKeyboardSelectionChanged");
    v44 = (void *)v59;
    v43 = v60;
  }
  else if (objc_msgSend(v61, "state") == 2
         && -[UITextInteraction _textInputIsInteractive](self, "_textInputIsInteractive"))
  {
    if (-[UITextSelectionInteraction _usesIndirectSelectionBehavior](self, "_usesIndirectSelectionBehavior"))
    {
      -[_UIKeyboardTextSelectionController updateSelectionWithExtentPoint:withBoundary:executionContext:](self->_activeSelectionController, "updateSelectionWithExtentPoint:withBoundary:executionContext:", v23, 0, v9, v11);
      v45 = v9;
      v46 = v11;
      v43 = v60;
    }
    else
    {
      v49 = self->_gestureTuning;
      if (v49)
        v50 = v16;
      else
        v50 = 1;
      v45 = v9;
      v46 = v11;
      if ((v50 & 1) == 0)
      {
        -[UITextGestureTuning touchAlignedPointForPoint:translation:](v49, "touchAlignedPointForPoint:translation:", v9, v11, v13, v15);
        v45 = v51;
        v46 = v52;
      }
      v43 = v60;
      objc_msgSend(v60, "setMagnificationPoint:", v45, v46);
      -[_UIKeyboardTextSelectionController updateSelectionWithExtentPoint:withBoundary:executionContext:](self->_activeSelectionController, "updateSelectionWithExtentPoint:withBoundary:executionContext:", v23, 0, v45, v46);
      v53 = self->_activeLoupeSession;
      -[_UIKeyboardTextSelectionController selection](self->_activeSelectionController, "selection");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "caretRect");
      -[UITextLoupeSession moveToPoint:withCaretRect:trackingCaret:](v53, "moveToPoint:withCaretRect:trackingCaret:", 0, v9, v11, v55, v56, v57, v58);

    }
    v44 = (void *)v59;
    objc_msgSend(v4, "notifyKeyboardSelectionChanged");
    objc_msgSend(v4, "startAutoscroll:", v45, v46);
  }
  else
  {
    v44 = (void *)v59;
    v43 = v60;
    if ((objc_msgSend(v61, "state") == 3 || objc_msgSend(v61, "state") == 4)
      && -[UITextInteraction _textInputIsInteractive](self, "_textInputIsInteractive"))
    {
      objc_msgSend(v4, "cancelAutoscroll");
      if (self->_grabberSuppressionAssertion)
      {
        objc_msgSend(v4, "setGrabberSuppressionAssertion:");
        v47 = self->_grabberSuppressionAssertion;
        self->_grabberSuppressionAssertion = 0;

      }
      -[UITextLoupeSession invalidate](self->_activeLoupeSession, "invalidate");
      v48 = self->_activeLoupeSession;
      self->_activeLoupeSession = 0;

      -[UITextSelectionInteraction _showSelectionCommandsIfApplicableAfterDelay:](self, "_showSelectionCommandsIfApplicableAfterDelay:", 0.0);
      -[UITextInteraction setInGesture:](self, "setInGesture:", 0);
      objc_msgSend(v4, "setExpectingCommit:", 1);
      -[UITextInteraction _endSelectionChange](self, "_endSelectionChange");
      objc_msgSend(v4, "setExpectingCommit:", 0);
      objc_msgSend(v4, "didEndSelectionInteraction");
      -[_UIKeyboardTextSelectionController endSelection](self->_activeSelectionController, "endSelection");
    }
  }

}

- (void)twoFingerRangedSelectGesture:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  id v26;

  v26 = a3;
  -[UITextInteraction assistantDelegate](self, "assistantDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFirstResponderIfNecessary");
  objc_msgSend(v4, "setSelectionHighlightMode:", 0);
  objc_msgSend(v26, "touches");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 >= 2)
  {
    objc_msgSend(v26, "touches");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "touches");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndex:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[UITextInteraction view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_proxyTextInput");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "textInputView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "locationInView:", v13);
    v15 = v14;
    v17 = v16;

    objc_msgSend(v11, "_proxyTextInput");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "textInputView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "locationInView:", v19);
    v21 = v20;
    v23 = v22;

    objc_msgSend(v4, "activeSelectionController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "selection");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v25, "setGranularity:", 1);
    objc_msgSend(v25, "setSelectionWithFirstPoint:secondPoint:", v15, v17, v21, v23);
    objc_msgSend(v25, "commit");
    if (objc_msgSend(v26, "state") == 3)
      -[UITextSelectionInteraction _showSelectionCommandsIfApplicableAfterDelay:](self, "_showSelectionCommandsIfApplicableAfterDelay:", 0.0);
    objc_msgSend(v4, "notifyKeyboardSelectionChanged");

  }
}

- (void)setHybridSelectionWithPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;

  y = a3.y;
  x = a3.x;
  -[UITextInteraction assistantDelegate](self, "assistantDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activeSelectionController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selection");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[UITextInteraction view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEditable") & 1) != 0)
  {

LABEL_4:
    objc_msgSend(v10, "setHybridSelectionWithPoint:", x, y);
    goto LABEL_5;
  }
  v9 = objc_msgSend(v10, "hasEditableSelection");

  if ((v9 & 1) != 0)
    goto LABEL_4;
LABEL_5:

}

- (BOOL)interaction_gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _BOOL4 v9;
  uint64_t *v10;
  id v11;
  id v12;
  BOOL v13;
  char v14;
  objc_super v16;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  if (-[UITextSelectionInteraction _usesIndirectSelectionBehavior](self, "_usesIndirectSelectionBehavior"))
  {
    -[UITextInteraction assistantDelegate](self, "assistantDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17.receiver = self;
    v17.super_class = (Class)UITextSelectionInteraction;
    if (!-[UITextInteraction interaction_gestureRecognizer:shouldReceiveTouch:](&v17, sel_interaction_gestureRecognizer_shouldReceiveTouch_, v6, v7))
    {
      v13 = 0;
LABEL_13:

      goto LABEL_14;
    }
    v9 = -[UITextSelectionInteraction _usesIndirectSelectionBehavior](self, "_usesIndirectSelectionBehavior");
    v10 = &UITextInteractionNameIndirectSingleTap;
    if (!v9)
      v10 = &UITextInteractionNameSingleTap;
    v11 = (id)*v10;
    -[UITextInteraction recognizerForName:](self, "recognizerForName:", v11);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (v12 == v6)
    {
      v14 = objc_msgSend(v8, "useGesturesForEditableContent");

      if ((v14 & 1) == 0
        && !-[UITextSelectionInteraction shouldHandleOneFingerTapInUneditable:](self, "shouldHandleOneFingerTapInUneditable:", v6))
      {
        v13 = 0;
        goto LABEL_12;
      }
    }
    else
    {

    }
    v13 = 1;
LABEL_12:

    goto LABEL_13;
  }
  v16.receiver = self;
  v16.super_class = (Class)UITextSelectionInteraction;
  v13 = -[UITextInteraction interaction_gestureRecognizer:shouldReceiveTouch:](&v16, sel_interaction_gestureRecognizer_shouldReceiveTouch_, v6, v7);
LABEL_14:

  return v13;
}

- (BOOL)interaction_gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  uint64_t *v7;
  id v8;
  id v9;
  char v10;
  char v11;
  void *v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  self->_wasOriginallyFirstResponder = -[UITextInteraction _textInputIsInteractive](self, "_textInputIsInteractive");
  -[UITextInteraction assistantDelegate](self, "assistantDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)UITextSelectionInteraction;
  if (-[UITextInteraction interaction_gestureRecognizerShouldBegin:](&v15, sel_interaction_gestureRecognizerShouldBegin_, v4))
  {
    v6 = -[UITextSelectionInteraction _usesIndirectSelectionBehavior](self, "_usesIndirectSelectionBehavior");
    v7 = &UITextInteractionNameIndirectSingleTap;
    if (!v6)
      v7 = &UITextInteractionNameSingleTap;
    v8 = (id)*v7;
    -[UITextInteraction recognizerForName:](self, "recognizerForName:", v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (v9 == v4)
    {
      v11 = objc_msgSend(v5, "useGesturesForEditableContent");

      if ((v11 & 1) == 0
        && !-[UITextSelectionInteraction shouldHandleOneFingerTapInUneditable:](self, "shouldHandleOneFingerTapInUneditable:", v4))
      {
        v10 = 0;
LABEL_17:

        goto LABEL_18;
      }
    }
    else
    {

    }
    if (-[UITextSelectionInteraction _usesIndirectSelectionBehavior](self, "_usesIndirectSelectionBehavior"))
    {
      -[UITextInteraction parent](self, "parent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "recognizerForName:", 0x1E17788C0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        if (objc_msgSend(v13, "state") == 3)
          v10 = 0;
        else
          v10 = -1;
      }
      else
      {
        v10 = 1;
      }

    }
    else
    {
      v10 = 1;
    }
    goto LABEL_17;
  }
  v10 = 0;
LABEL_18:

  return v10 & 1;
}

- (BOOL)shouldHandleOneFingerTapInUneditable:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  BOOL v10;
  uint64_t v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;

  -[UITextInteraction assistantDelegate](self, "assistantDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UITextSelectionInteraction _usesIndirectSelectionBehavior](self, "_usesIndirectSelectionBehavior"))
  {
    -[UITextInteraction recognizerForName:](self, "recognizerForName:", 0x1E17787C0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activeSelectionController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "selection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "selectedRange");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "_isRanged");

    v10 = 1;
    if (v9)
      v11 = 1;
    else
      v11 = 2;
    objc_msgSend(v5, "setMinimumNumberOfTapsRequired:", v11);

  }
  else
  {
    -[UITextInteraction view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v4, "viewCouldBecomeEditable:", v12);

    if ((v13 & 1) != 0)
      goto LABEL_8;
    objc_msgSend(v4, "activeSelectionController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "selection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "selectedRange");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "_isRanged");

    if ((v17 & 1) != 0)
    {
LABEL_8:
      v10 = 1;
    }
    else
    {
      -[UITextInteraction linkInteractionSession](self, "linkInteractionSession");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = v18 != 0;
    }
  }

  return v10;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  id v8;
  int v9;
  int v10;
  BOOL v11;

  v6 = a3;
  v7 = a4;
  -[UITextInteraction recognizerForName:](self, "recognizerForName:", 0x1E17787E0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 != v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    goto LABEL_6;
  }
  v9 = objc_msgSend(v7, "_isForPointer");
  v10 = -[UITextSelectionInteraction _usesIndirectSelectionBehavior](self, "_usesIndirectSelectionBehavior");

  if (v9 != v10)
  {
LABEL_6:
    v11 = 0;
    goto LABEL_7;
  }
  v11 = 1;
LABEL_7:

  return v11;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  -[UITextInteraction recognizerForName:](self, "recognizerForName:", 0x1E17787C0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 == v6 && objc_msgSend(v7, "_isGestureType:", 0))
  {
    if (self->_viewConformsToTextInput)
    {
      objc_msgSend(v7, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextInteraction view](self, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isDescendantOfView:", v10);

    }
    else
    {
      v11 = 1;
    }
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)UITextSelectionInteraction;
    v11 = -[UITextInteraction gestureRecognizer:shouldRecognizeSimultaneouslyWithGestureRecognizer:](&v13, sel_gestureRecognizer_shouldRecognizeSimultaneouslyWithGestureRecognizer_, v6, v7);
  }

  return v11;
}

@end
