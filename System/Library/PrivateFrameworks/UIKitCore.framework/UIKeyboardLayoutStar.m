@implementation UIKeyboardLayoutStar

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UIKeyboardLayoutStar;
  -[UIView layoutSubviews](&v10, sel_layoutSubviews);
  -[UIView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[UIView setFrame:](self->_keyplaneTransformationAreaView, "setFrame:");
  if (+[UIKeyboard resizable](UIKeyboard, "resizable"))
  {
    -[UIView frame](self->_keyplaneView, "frame");
    if (v8 != v4 || v7 != v6)
      -[UIKeyboardLayoutStar resizeKeyplaneAndRedraw:](self, "resizeKeyplaneAndRedraw:", 0);
  }
}

- (BOOL)_shouldInheritScreenScaleAsContentScaleFactor
{
  return 1;
}

- (void)didMoveToWindow
{
  void *v3;
  UIKeyboardPathEffectView *pathEffectView;
  objc_super v5;

  -[UIView _rootInputWindowController](self, "_rootInputWindowController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIKeyboardLayoutStar removePathEffectViewConstraintsIfNeeded](self, "removePathEffectViewConstraintsIfNeeded");
    pathEffectView = self->_pathEffectView;
    self->_pathEffectView = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardLayoutStar;
  -[UIKeyboardLayout didMoveToWindow](&v5, sel_didMoveToWindow);
}

- (void)willMoveToWindow:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (!v4
    && -[UIKeyboardLayoutStar shouldDeactivateWithoutWindow](self, "shouldDeactivateWithoutWindow")
    && !+[UIKeyboard resizable](UIKeyboard, "resizable"))
  {
    -[UIKeyboardLayoutStar deactivateActiveKeys](self, "deactivateActiveKeys");
  }
  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardLayoutStar;
  -[UIKeyboardLayout willMoveToWindow:](&v5, sel_willMoveToWindow_, v4);

}

- (void)removePathEffectViewConstraintsIfNeeded
{
  NSArray *pathEffectViewConstraints;

  if (self->_pathEffectViewConstraints)
  {
    objc_msgSend(MEMORY[0x1E0D156E0], "deactivateConstraints:");
    pathEffectViewConstraints = self->_pathEffectViewConstraints;
    self->_pathEffectViewConstraints = 0;

  }
}

uint64_t __75__UIKeyboardLayoutStar_ContinuousPath__transitionToPunctuationKeysVisible___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "removeFromSuperview");
  return result;
}

uint64_t __75__UIKeyboardLayoutStar_ContinuousPath__transitionToPunctuationKeysVisible___block_invoke(uint64_t a1)
{
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  v2 = 48;
  if (!*(_BYTE *)(a1 + 64))
    v2 = 56;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 696), "dimKeys:", *(_QWORD *)(a1 + v2));
}

uint64_t __69__UIKeyboardLayoutStar_setReturnKeyEnabled_withDisplayName_withType___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setReturnKeyEnabled:withDisplayName:withType:", *(unsigned __int8 *)(a1 + 52), *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48));
}

- (void)updateStateForKey:(id)a3
{
  void *v3;
  uint64_t v5;
  uint64_t v6;
  UIKeyboardLayoutStar *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  int v13;
  id v14;

  v14 = a3;
  if (objc_msgSend(v14, "displayType") == 23 || objc_msgSend(v14, "displayType") == 51)
  {
    v5 = -[UIKeyboardLayoutStar stateForShiftKey:](self, "stateForShiftKey:", v14);
LABEL_4:
    v6 = v5;
    v7 = self;
LABEL_5:
    -[UIKeyboardLayoutStar setState:forKey:](v7, "setState:forKey:", v6, v14);
    goto LABEL_6;
  }
  if (objc_msgSend(v14, "displayType") == 14)
  {
    v5 = -[UIKeyboardLayoutStar stateForKeyplaneSwitchKey:](self, "stateForKeyplaneSwitchKey:", v14);
    goto LABEL_4;
  }
  if (objc_msgSend(v14, "displayType") == 11)
  {
    v7 = self;
    v6 = 4;
    goto LABEL_5;
  }
  if (objc_msgSend(v14, "interactionType") == 21)
  {
    v5 = -[UIKeyboardLayoutStar stateForMultitapReverseKey:](self, "stateForMultitapReverseKey:", v14);
    goto LABEL_4;
  }
  if (objc_msgSend(v14, "interactionType") == 41)
  {
    v5 = -[UIKeyboardLayoutStar stateForMultitapForwardKey:](self, "stateForMultitapForwardKey:", v14);
    goto LABEL_4;
  }
  if ((objc_msgSend(v14, "disabled") & 1) != 0
    || objc_msgSend(v14, "interactionType") == 20
    && !-[UIDelayedAction scheduled](self->_multitapAction, "scheduled"))
  {
    goto LABEL_18;
  }
  if (objc_msgSend(v14, "displayType") == 1)
  {
    v5 = -[UIKeyboardLayoutStar stateForCandidateListKey:](self, "stateForCandidateListKey:", v14);
    goto LABEL_4;
  }
  if (objc_msgSend(v14, "interactionType") == 44)
  {
LABEL_24:
    v7 = self;
    v6 = 2;
    goto LABEL_5;
  }
  if (objc_msgSend(v14, "displayType") == 4)
  {
    v5 = -[UIKeyboardLayoutStar stateForDictationKey:](self, "stateForDictationKey:", v14);
    goto LABEL_4;
  }
  if (objc_msgSend(v14, "displayType") == 39
    || objc_msgSend(v14, "displayType") == 40
    || objc_msgSend(v14, "displayType") == 41
    || objc_msgSend(v14, "displayType") == 49)
  {
    v5 = -[UIKeyboardLayoutStar stateForStylingKey:](self, "stateForStylingKey:", v14);
    goto LABEL_4;
  }
  if (objc_msgSend(v14, "displayType") == 42
    || objc_msgSend(v14, "displayType") == 43
    || objc_msgSend(v14, "displayType") == 44
    || objc_msgSend(v14, "displayType") == 45
    || objc_msgSend(v14, "displayType") == 46
    || objc_msgSend(v14, "interactionType") == 17
    || objc_msgSend(v14, "interactionType") == 12)
  {
    v5 = -[UIKeyboardLayoutStar stateForManipulationKey:](self, "stateForManipulationKey:", v14);
    goto LABEL_4;
  }
  if (objc_msgSend(v14, "displayType") != 36 && objc_msgSend(v14, "displayType") != 37)
  {
    if (objc_msgSend(v14, "interactionType") != 9)
      goto LABEL_54;
    objc_msgSend(v14, "representedString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("NonASCII"));
    if ((v10 & 1) == 0)
    {
      objc_msgSend(v14, "representedString");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ASCIICapable")) & 1) == 0)
      {

        goto LABEL_54;
      }
    }
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "textInputTraits");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "loadKeyboardsForSiriLanguage");

    if ((v10 & 1) != 0)
    {

      if (!v13)
        goto LABEL_54;
    }
    else
    {

      if ((v13 & 1) == 0)
      {
LABEL_54:
        if (objc_msgSend(v14, "displayType") == 50)
        {
          v7 = self;
          v6 = 0;
          goto LABEL_5;
        }
        goto LABEL_24;
      }
    }
LABEL_18:
    v7 = self;
    v6 = 1;
    goto LABEL_5;
  }
  -[UIKeyboardLayoutStar setState:forKey:](self, "setState:forKey:", 2, v14);
  -[UIKeyboardLayoutStar viewForKey:](self, "viewForKey:", v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "setHitTestResponder:", self);

LABEL_6:
  if (objc_msgSend(v14, "displayType") != 8)
    objc_msgSend(v14, "setOverrideDisplayString:", 0);
  objc_msgSend(v14, "setFlickDirection:", -3);

}

- (void)setState:(int)a3 forKey:(id)a4
{
  uint64_t v4;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  if (v6)
  {
    v10 = v6;
    if (-[UIKeyboardLayoutStar useCrescendoLayout](self, "useCrescendoLayout"))
    {
      v7 = objc_msgSend(v10, "state");
      -[TUIKeyplaneView setState:forKey:](self->_liveKeyplaneView, "setState:forKey:", v4, v10);
      -[UIKeyboardLayoutStar viewForKey:](self, "viewForKey:", v10);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "displayTypeHint") == 10)
      {
        -[UIKeyboardLayoutStar keyViewAnimator](self, "keyViewAnimator");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "transitionKeyView:fromState:toState:completion:", v8, v7, v4, 0);

      }
    }
    else
    {
      -[UIKBKeyplaneView setState:forKey:](self->_keyplaneView, "setState:forKey:", v4, v10);
    }
    v6 = v10;
  }

}

- (BOOL)useCrescendoLayout
{
  return self->_layoutSupportsCrescendo;
}

- (BOOL)shouldHitTestKey:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = objc_msgSend(v4, "visible")
    && (!objc_msgSend(v4, "ghost") || self->_ghostKeysEnabled)
    && objc_msgSend(v4, "displayType") != 12;

  return v5;
}

- (BOOL)pinchDetected
{
  return -[UIKeyboardPinchGestureRecognizer pinchDetected](self->_pinchGestureRecognizer, "pinchDetected");
}

- (BOOL)showsDedicatedEmojiKeyAlongsideGlobeButton
{
  int64_t v3;
  unint64_t v4;
  id v6;
  unint64_t v7;
  id v8;
  uint64_t v9;

  v3 = -[UITextInputTraits keyboardType](self->super._inputTraits, "keyboardType");
  if (v3 == 122)
    v4 = 2;
  else
    v4 = 3;
  if (-[UIKBScreenTraits idiom](self->super._screenTraits, "idiom"))
    return 0;
  if (!self->_externalDictationAndInternationalKeys)
    return 0;
  v6 = (id)UIKeyboardActiveUserSelectableInputModes;
  v7 = objc_msgSend(v6, "count");

  if (v7 < v4)
    return 0;
  v8 = (id)UIKeyboardActiveUserSelectableInputModes;
  v9 = objc_msgSend(v8, "indexOfObjectPassingTest:", &__block_literal_global_548_0);

  return v9 != 0x7FFFFFFFFFFFFFFFLL || v3 == 122;
}

- (void)setRenderConfig:(id)a3
{
  -[UIKeyboardLayoutStar setRenderConfig:updateKeyplane:](self, "setRenderConfig:updateKeyplane:", a3, 1);
}

- (BOOL)shouldMergeAssistantBarWithKeyboardLayout
{
  _BOOL4 v3;
  void *v4;
  _BOOL4 v5;

  if (-[UITextInputTraits keyboardType](self->super._inputTraits, "keyboardType") == 122
    || -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") != 1)
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    v3 = -[UIKeyboardLayoutStar hasCandidateKeys](self, "hasCandidateKeys");
    if (v3)
    {
      -[UIKBTree firstCachedKeyWithName:](self->_keyplane, "firstCachedKeyWithName:", CFSTR("Handwriting-Input"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        LOBYTE(v5) = 1;
LABEL_13:

        return v5;
      }
    }
    if (+[UIKeyboard isRemoteEmojiCollectionViewEnabled](UIKeyboard, "isRemoteEmojiCollectionViewEnabled")&& -[UIKeyboardLayoutStar isEmojiKeyplane](self, "isEmojiKeyplane")&& !-[UIKeyboardLayout isFloating](self, "isFloating"))
    {
      v5 = !-[UIKBScreenTraits isSplit](self->super._screenTraits, "isSplit");
      if (!v3)
        return v5;
      goto LABEL_12;
    }
    LOBYTE(v5) = 0;
    if (v3)
    {
LABEL_12:
      v4 = 0;
      goto LABEL_13;
    }
  }
  return v5;
}

- (BOOL)isResizing
{
  return -[UIKBResizingKeyplaneCoordinator isResizing](self->_resizingKeyplaneCoordinator, "isResizing");
}

- (void)refreshForDictationAvailablityDidChange
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  if (-[UIKeyboardLayoutStar shouldShowDictationKey](self, "shouldShowDictationKey"))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isDictationPopoverPresented") & 1) != 0)
    {
LABEL_7:

      return;
    }
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "inputDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[UIKBTree firstCachedKeyWithName:](self->_keyplane, "firstCachedKeyWithName:", CFSTR("Dictation-Key"));
      v5 = objc_claimAutoreleasedReturnValue();
      if (v5
        || (-[UIKBTree firstCachedKeyWithName:](self->_keyplane, "firstCachedKeyWithName:", CFSTR("NumberPad-Dictation")), (v5 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v6 = (id)v5;
        -[UIKeyboardLayoutStar setState:forKey:](self, "setState:forKey:", -[UIKeyboardLayoutStar stateForDictationKey:](self, "stateForDictationKey:", v5), v5);
        goto LABEL_7;
      }
    }
  }
}

- (int)stateForDictationKey:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  int v8;
  void *v9;
  char v10;

  +[UIDictationController activeInstance](UIDictationController, "activeInstance", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 1;
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enabledDictationLanguages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "count")
    || !+[UIDictationController dictationIsFunctional](UIDictationController, "dictationIsFunctional"))
  {

    return 1;
  }
  v6 = +[UIDictationController fetchCurrentInputModeSupportsDictation](UIDictationController, "fetchCurrentInputModeSupportsDictation");

  if (!v6)
    return 1;
  if (!+[UIDictationController isRunning](UIDictationController, "isRunning"))
    return 2;
  if (!+[UIDictationController isRunning](UIDictationController, "isRunning"))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isDictationPopoverPresented");

    if (!v8)
      return 2;
  }
  +[UIKeyboardInputMode dictationInputMode](UIKeyboardInputMode, "dictationInputMode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isCurrentDictationLanguageOnDevice");

  if ((v10 & 1) != 0 || +[UIDictationController viewMode](UIDictationController, "viewMode") == 1)
    return 4;
  else
    return 2;
}

- (void)updateKeyCentroids
{
  NSMutableSet *v3;
  NSMutableSet *leftKeySet;
  NSMutableSet *v5;
  NSMutableSet *rightKeySet;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  NSMutableSet *v11;
  NSMutableSet *v12;
  CGPoint v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  double MinY;
  double v35;
  double MinX;
  double v37;
  double v38;
  BOOL v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  uint64_t v47;
  const __CFString *v48;
  char v49;
  int v50;
  int v51;
  double *v52;
  void *v53;
  double v54;
  id v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;

  self->_ghostKeysEnabled = CFAbsoluteTimeGetCurrent() - self->_prevTouchUpTime < 1.0;
  if (-[UIKeyboardLayout supportsVirtualDrift](self, "supportsVirtualDrift")
    || -[UIKeyboardLayout isReachableDevice](self, "isReachableDevice"))
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    leftKeySet = self->_leftKeySet;
    self->_leftKeySet = v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    rightKeySet = self->_rightKeySet;
    self->_rightKeySet = v5;

    -[UIKeyboardLayoutStar divideKeysIntoLeft:right:](self, "divideKeysIntoLeft:right:", self->_leftKeySet, self->_rightKeySet);
    -[UIKeyboardLayout leftVirtualDriftOffset](self, "leftVirtualDriftOffset");
    self->_leftDriftOffset.x = v7;
    self->_leftDriftOffset.y = v8;
    -[UIKeyboardLayout rightVirtualDriftOffset](self, "rightVirtualDriftOffset");
    self->_rightDriftOffset.x = v9;
    self->_rightDriftOffset.y = v10;
  }
  else
  {
    v11 = self->_leftKeySet;
    self->_leftKeySet = 0;

    v12 = self->_rightKeySet;
    self->_rightKeySet = 0;

    v13 = (CGPoint)*MEMORY[0x1E0C9D538];
    self->_leftDriftOffset = (CGPoint)*MEMORY[0x1E0C9D538];
    self->_rightDriftOffset = v13;
  }
  -[UIKBTree keys](self->_keyplane, "keys");
  v55 = (id)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v55, "count");
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBDC30]), "initWithCapacity:", v14);
  objc_msgSend(v15, "setUsesTwoHands:", -[UIKeyboardLayout supportsVirtualDrift](self, "supportsVirtualDrift"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v15, "setShifted:", -[UIKBTree isShiftKeyplane](self->_keyplane, "isShiftKeyplane"));
  if (v14)
  {
    v16 = 0;
    v17 = *MEMORY[0x1E0C9D628];
    v18 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v19 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v20 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    v54 = *MEMORY[0x1E0C9D628];
    do
    {
      objc_msgSend(v55, "objectAtIndex:", v16, *(_QWORD *)&v54);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "paddedFrame");
      v23 = v22;
      v25 = v24;
      v27 = v26;
      v29 = v28;
      if ((objc_msgSend(v21, "isExemptFromInputManagerLayout") & 1) != 0
        || !-[UIKeyboardLayoutStar shouldHitTestKey:](self, "shouldHitTestKey:", v21))
      {
        objc_msgSend(v15, "addKeyWithString:frame:", &stru_1E16EDF20, v17, v18, v19, v20);
      }
      else
      {
        if (objc_msgSend(v21, "interactionType") == 15 && self->_showDictationKey)
        {
          -[UIKBTree firstCachedKeyWithName:](self->_keyplane, "firstCachedKeyWithName:", CFSTR("More-Key"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v30, "interactionType");

          if (v31 != 10)
          {
            -[UIKBTree firstCachedKeyWithName:](self->_keyplane, "firstCachedKeyWithName:", CFSTR("Dictation-Key"));
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "shape");
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v21, "paddedFrame");
            MinY = CGRectGetMinY(v56);
            objc_msgSend(v33, "paddedFrame");
            if (MinY == CGRectGetMinY(v57)
              && (objc_msgSend(v21, "paddedFrame"),
                  v35 = CGRectGetMinX(v58),
                  objc_msgSend(v33, "paddedFrame"),
                  v35 > CGRectGetMaxX(v59)))
            {
              objc_msgSend(v21, "paddedFrame");
              MinX = CGRectGetMinX(v60);
              objc_msgSend(v33, "paddedFrame");
              v37 = MinX - CGRectGetMaxX(v61);
              objc_msgSend(v33, "paddedFrame");
              v39 = v37 < v38;
              v17 = v54;
              if (v39)
              {
                objc_msgSend(v21, "shape");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                +[UIKBShape shapeByCombining:withShape:](UIKBShape, "shapeByCombining:withShape:", v40, v33);
                v41 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v41, "paddedFrame");
                v23 = v42;
                v25 = v43;
                v27 = v44;
                v29 = v45;

              }
            }
            else
            {
              v17 = v54;
            }

          }
        }
        objc_msgSend(v21, "representedString");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v21, "displayType") == 7
          && (objc_msgSend(v21, "supportsSupplementalDisplayString") & 1) == 0)
        {
          -[UIKeyboardLayoutStar currentRepresentedStringForDualDisplayKey:](self, "currentRepresentedStringForDualDisplayKey:", v21);
          v47 = objc_claimAutoreleasedReturnValue();

          v46 = (void *)v47;
        }
        v48 = CFSTR("undo");
        if (objc_msgSend(v21, "interactionType") == 12
          || (v48 = CFSTR("international"), objc_msgSend(v21, "interactionType") == 9)
          || (v48 = CFSTR("delete"), objc_msgSend(v21, "interactionType") == 4))
        {

          v46 = (void *)v48;
        }
        v49 = -[NSMutableSet containsObject:](self->_leftKeySet, "containsObject:", v21);
        v50 = 1224;
        if ((v49 & 1) != 0
          || (v51 = -[NSMutableSet containsObject:](self->_rightKeySet, "containsObject:", v21), v50 = 1240, v51))
        {
          v52 = (double *)((char *)self + v50);
          v23 = v23 + *v52;
          v25 = v25 + v52[1];
        }
        objc_msgSend(v15, "addKeyWithString:frame:", v46, v23, v25, v27, v29);

      }
      ++v16;
    }
    while (v14 != v16);
  }
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setLayoutForKeyHitTest:", v15);

}

- (void)updateCachedKeyplaneKeycaps
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  BOOL v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[NSMutableSet removeAllObjects](self->_allKeyplaneKeycaps, "removeAllObjects");
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLocale");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[UIKBTree keys](self->_keyplane, "keys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v8, "displayString");
        v9 = objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = (void *)v9;
          v11 = objc_msgSend(v8, "interactionType");

          if (v11 != 10)
          {
            v12 = +[UIKeyboardLayout _showSmallDisplayKeyplane](UIKeyboardLayout, "_showSmallDisplayKeyplane");
            objc_msgSend(v8, "displayString");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = v13;
            if (!v12)
            {
              objc_msgSend(v13, "uppercaseStringWithLocale:", v16);
              v15 = objc_claimAutoreleasedReturnValue();

              v14 = (void *)v15;
            }
            -[NSMutableSet addObject:](self->_allKeyplaneKeycaps, "addObject:", v14);

          }
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v5);
  }

}

- (void)divideKeysIntoLeft:(id)a3 right:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  uint64_t v16;
  double v17;
  double v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint64_t *v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  _QWORD v32[6];
  uint64_t v33;
  double *v34;
  uint64_t v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  double *v40;
  uint64_t v41;
  void *v42;
  __int128 v43;
  __int128 v44;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    -[UIKBTree subtrees](self->_keyplane, "subtrees");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v39 = 0;
    v40 = (double *)&v39;
    v41 = 0x4010000000;
    v42 = &unk_18685B0AF;
    v11 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    v43 = *MEMORY[0x1E0C9D628];
    v44 = v11;
    v33 = 0;
    v34 = (double *)&v33;
    v35 = 0x4010000000;
    v36 = &unk_18685B0AF;
    v37 = v43;
    v38 = v11;
    objc_msgSend(v10, "keys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __49__UIKeyboardLayoutStar_divideKeysIntoLeft_right___block_invoke;
    v32[3] = &unk_1E16D43C8;
    v32[4] = &v39;
    v32[5] = &v33;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v32);

    v14 = v40[4];
    v15 = v40[5];
    v17 = v40[6];
    v16 = *((_QWORD *)v40 + 7);
    v18 = v34[6];
    -[UIKBTree keys](self->_keyplane, "keys");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v13;
    v20[1] = 3221225472;
    v20[2] = __49__UIKeyboardLayoutStar_divideKeysIntoLeft_right___block_invoke_2;
    v20[3] = &unk_1E16D43F0;
    v24 = v14 + v18 * -0.5;
    v25 = v15 + 0.0;
    v26 = v17 * 0.5 - (v18 * -0.5 + 0.0);
    v27 = v16;
    v23 = &v39;
    v21 = v6;
    v28 = v17 * 0.5 + 0.0;
    v29 = v15 + 0.0;
    v30 = v26;
    v31 = v16;
    v22 = v8;
    objc_msgSend(v19, "enumerateObjectsUsingBlock:", v20);

    _Block_object_dispose(&v33, 8);
    _Block_object_dispose(&v39, 8);

  }
}

- (unsigned)getHandRestRecognizerState
{
  void *v3;
  char v4;
  unsigned __int8 v5;
  void *v7;

  if (qword_1ECD79820 != -1)
    dispatch_once(&qword_1ECD79820, &__block_literal_global_880);
  if (!_MergedGlobals_79)
    return 0;
  if (-[UIKBTree isSplit](self->_keyplane, "isSplit"))
    return 0;
  +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isUndocked");

  if ((v4 & 1) != 0)
    return 0;
  -[UIKBTree objectForProperty:](self->_keyplane, "objectForProperty:", CFSTR("restable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v7, "isEqualToString:", CFSTR("nohomerow")) & 1) != 0)
  {
    v5 = 2;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v7, "BOOLValue") & 1) != 0;
  }

  return v5;
}

void __49__UIKeyboardLayoutStar_divideKeysIntoLeft_right___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  _BOOL4 IsNull;
  CGRect *v12;
  CGFloat *v13;
  CGRect v14;

  objc_msgSend(a2, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  IsNull = CGRectIsNull(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32));
  v12 = *(CGRect **)(*(_QWORD *)(a1 + 32) + 8);
  if (IsNull)
  {
    v12[1].origin.x = v4;
    v12[1].origin.y = v6;
    v12[1].size.width = v8;
    v12[1].size.height = v10;
    v13 = *(CGFloat **)(*(_QWORD *)(a1 + 40) + 8);
    v13[4] = v4;
    v13[5] = v6;
    v13[6] = v8;
    v13[7] = v10;
  }
  else
  {
    v14.origin.x = v4;
    v14.origin.y = v6;
    v14.size.width = v8;
    v14.size.height = v10;
    *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = CGRectUnion(v12[1], v14);
  }
}

- (void)updateGlobeKeyDisplayString
{
  void *v3;
  _BOOL4 v4;
  int64_t v5;
  uint64_t v6;

  -[UIKBTree firstCachedKeyWithName:](self->_keyplane, "firstCachedKeyWithName:", CFSTR("International-Key"));
  v6 = objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend((id)UIKeyboardActiveUserSelectableInputModes, "count") < 2
    || !-[UIKeyboardLayoutStar supportsEmoji](self, "supportsEmoji"))
  {
    v5 = -[UITextInputTraits keyboardType](self->super._inputTraits, "keyboardType");
    v3 = (void *)v6;
    if (v5 != 122)
      goto LABEL_8;
LABEL_7:
    objc_msgSend(v3, "setOverrideDisplayString:", CFSTR("emoji"));
    v3 = (void *)v6;
    goto LABEL_8;
  }
  v3 = (void *)v6;
  if (v6)
  {
    v4 = -[UIKeyboardLayoutStar globeKeyDisplaysAsEmojiKey](self, "globeKeyDisplaysAsEmojiKey");
    v3 = (void *)v6;
    if (v4)
      goto LABEL_7;
  }
LABEL_8:

}

- (BOOL)supportsEmoji
{
  return 1;
}

- (void)updateUndoKeyState
{
  void *v3;
  id v4;

  -[UIKBTree firstCachedKeyWithName:](self->_keyplane, "firstCachedKeyWithName:", CFSTR("Undo-Key"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
    -[UIKeyboardLayoutStar setState:forKey:](self, "setState:forKey:", -[UIKeyboardLayoutStar stateForManipulationKey:](self, "stateForManipulationKey:", v4), v4);
  -[UIKBTree firstCachedKeyWithName:](self->_keyplane, "firstCachedKeyWithName:", CFSTR("Redo-Key"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    -[UIKeyboardLayoutStar setState:forKey:](self, "setState:forKey:", -[UIKeyboardLayoutStar stateForManipulationKey:](self, "stateForManipulationKey:", v3), v3);

}

- (void)mergeKeysIfNeeded
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("UIKeyboardNeedsUpdatingKeyboardDockViewVisibilityNotification"), 0, 0);

  -[UIKeyboardLayoutStar _addExtraControlKeysIfNecessary](self, "_addExtraControlKeysIfNecessary");
  -[UIKeyboardLayoutStar annotateWriteboardDisplayTypeHintForKeyIfNeeded](self, "annotateWriteboardDisplayTypeHintForKeyIfNeeded");
  -[UIKeyboardLayoutStar updateMoreAndInternationalKeys](self, "updateMoreAndInternationalKeys");
  -[UIKeyboardLayoutStar _swapGlobeAndMoreKeysIfNecessary](self, "_swapGlobeAndMoreKeysIfNecessary");
  -[UIKeyboardLayoutStar relayoutForWriteboardKey](self, "relayoutForWriteboardKey");
  -[UIKeyboardLayoutStar updateReturnKeysIfNeeded](self, "updateReturnKeysIfNeeded");
  -[UIKeyboardLayoutStar transitionToModalContinuousPathKeyplane](self, "transitionToModalContinuousPathKeyplane");
  -[UIKeyboardLayoutStar _transformFloatingKeyboardIfNecessary](self, "_transformFloatingKeyboardIfNecessary");
  -[UIKeyboardLayoutStar _transformCarPlayIfNecessary](self, "_transformCarPlayIfNecessary");
}

- (void)updateReturnKeysIfNeeded
{
  UIKBTree *keyplane;
  void *v4;
  void *v5;
  id v6;

  -[UIKBTree cachedKeysByKeyName:](self->_keyplane, "cachedKeysByKeyName:", CFSTR("Return-Key"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v6, "count") >= 2)
  {
    keyplane = self->_keyplane;
    objc_msgSend(v6, "objectAtIndex:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndex:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBTree mergeReturnKey:withReturnKey:](keyplane, "mergeReturnKey:withReturnKey:", v4, v5);

  }
}

- (void)updateMoreAndInternationalKeys
{
  int v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  _BOOL4 v25;
  void *v26;
  _BOOL4 showIntlKey;
  _BOOL4 showDictationKey;
  int v29;
  void *v30;
  char v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v3 = +[UIKeyboardImpl canShowInternationalKey](UIKeyboardImpl, "canShowInternationalKey");
  if (v3)
  {
    if (-[UITextInputTraits isSecureTextEntry](self->super._inputTraits, "isSecureTextEntry"))
      LOBYTE(v3) = UIKeyboardHasMultipleActiveSecureInputModes();
    else
      LOBYTE(v3) = (unint64_t)objc_msgSend((id)UIKeyboardActiveUserSelectableInputModes, "count") > 1;
  }
  self->_showIntlKey = v3;
  self->_showDictationKey = -[UIKeyboardLayoutStar shouldShowDictationKey](self, "shouldShowDictationKey");
  -[UIKBTree keysForMergeConditions](self->_keyplane, "keysForMergeConditions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v42 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          objc_msgSend(v11, "setVisible:", 1);
          if (-[UIKeyboardLayoutStar shouldMergeKey:](self, "shouldMergeKey:", v11))
          {
            objc_msgSend(v11, "name");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v12);

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
      }
      while (v8);
    }

    -[UIKBTree mergeKeyNames:inRightToLeft:](self->_keyplane, "mergeKeyNames:inRightToLeft:", v5, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v38;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v38 != v16)
            objc_enumerationMutation(v13);
          -[UIKBTree firstCachedKeyWithName:](self->_keyplane, "firstCachedKeyWithName:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setVisible:", 0);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
      }
      while (v15);
    }
    objc_msgSend(v5, "objectsPassingTest:", &__block_literal_global_755);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "count") == 2)
    {
      v32 = v4;
      -[UIKBTree cachedKeysByKeyName:](self->_keyplane, "cachedKeysByKeyName:", CFSTR("More-Key"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v34;
        do
        {
          for (k = 0; k != v22; ++k)
          {
            if (*(_QWORD *)v34 != v23)
              objc_enumerationMutation(v20);
            objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * k), "setObject:forProperty:", &unk_1E1A985C8, CFSTR("More-Key-Merged"));
          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
        }
        while (v22);
      }

      v4 = v32;
    }
    if (-[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 2)
    {
      v25 = -[UIKBScreenTraits isLinear](self->super._screenTraits, "isLinear");
      -[UIKeyboardLayoutStar recenterMonolithKeyplaneSwitchKeys](self, "recenterMonolithKeyplaneSwitchKeys");
      if (v25)
      {
        if (+[UIKeyboardCache enabled](UIKeyboardCache, "enabled"))
        {
          +[UIKeyboardCache sharedInstance](UIKeyboardCache, "sharedInstance");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "purge");

        }
      }
    }

    goto LABEL_42;
  }
  showIntlKey = self->_showIntlKey;
  showDictationKey = self->_showDictationKey;
  if (-[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 1
    || -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 24
    || -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 25
    || -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 26)
  {
    v29 = 4;
  }
  else
  {
    v29 = 4 * (-[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 23);
  }
  -[UIKBTree name](self->_keyboard, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "_containsSubstring:", CFSTR("LandscapeChoco")))
  {
LABEL_42:

    goto LABEL_43;
  }
  -[UIKBTree name](self->_keyboard, "name");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "_containsSubstring:", CFSTR("LandscapeTruffle"));

  if ((v31 & 1) == 0)
    -[UIKBTree updateMoreAndInternationalKeysWithOptions:](self->_keyplane, "updateMoreAndInternationalKeysWithOptions:", showIntlKey | (2 * showDictationKey) | v29);
LABEL_43:

}

- (BOOL)shouldMergeKey:(id)a3
{
  id v4;
  int v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  BOOL v10;
  void *v11;
  int v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  int64_t v18;
  int64_t v19;
  int64_t v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  int64_t v27;
  void *v28;
  void *v29;
  BOOL v30;
  int64_t v31;

  v4 = a3;
  v5 = objc_msgSend(v4, "interactionType");
  LOBYTE(v6) = 0;
  if (v5 > 37)
  {
    if (v5 == 38)
    {
      -[UIKeyboardLayoutStar inputModeToMergeCapsLockKey](self, "inputModeToMergeCapsLockKey");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v6) = v9 != 0;

      goto LABEL_19;
    }
    if (v5 == 42)
    {
      LOBYTE(v6) = +[UIKeyboard isRemoteEmojiCollectionViewEnabled](UIKeyboard, "isRemoteEmojiCollectionViewEnabled");
      goto LABEL_19;
    }
    if (v5 != 44)
      goto LABEL_19;
    goto LABEL_10;
  }
  if (v5 == 5)
  {
LABEL_10:
    if (self->_externalDictationAndInternationalKeys)
    {
      LOBYTE(v6) = 1;
      goto LABEL_19;
    }
    v10 = -[UIKeyboardLayoutStar shouldShowDictationKey](self, "shouldShowDictationKey");
LABEL_18:
    LOBYTE(v6) = !v10;
    goto LABEL_19;
  }
  if (v5 == 9)
  {
    objc_msgSend(v4, "representedString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("ASCIICapable")) & 1) != 0)
    {
      v8 = 1;
    }
    else
    {
      objc_msgSend(v4, "representedString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v11, "isEqualToString:", CFSTR("NonASCII"));

    }
    if (self->_externalDictationAndInternationalKeys)
    {
      v10 = -[UIKeyboardLayoutStar showsDedicatedEmojiKeyAlongsideGlobeButton](self, "showsDedicatedEmojiKeyAlongsideGlobeButton");
      goto LABEL_18;
    }
    if (-[UITextInputTraits keyboardType](self->super._inputTraits, "keyboardType") == 122)
      v13 = v8;
    else
      v13 = 1;
    if (v13 == 1)
    {
      +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "normalizedEnabledInputModeIdentifiers");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = objc_msgSend(v15, "containsObject:", CFSTR("emoji"));
      if (objc_msgSend(v15, "count") == 2)
        v17 = v16;
      else
        v17 = 0;
      v18 = -[UITextInputTraits keyboardType](self->super._inputTraits, "keyboardType");
      v19 = v18;
      if (v17 == 1 && v18 == 122
        || (v20 = -[UITextInputTraits keyboardType](self->super._inputTraits, "keyboardType"), (v8 & 1) == 0)
        && (v27 = v20, -[UIKeyboardLayoutStar globeKeyDisplaysAsEmojiKey](self, "globeKeyDisplaysAsEmojiKey"))
        && v27 == 13)
      {
        LOBYTE(v6) = 1;
      }
      else
      {
        v31 = v19;
        +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "representedString");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v21, "identifierIsValidSystemInputMode:", v22);

        if (v23)
        {
          objc_msgSend(v4, "representedString");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          +[UIKeyboardInputMode keyboardInputModeWithIdentifier:](UIKeyboardInputMode, "keyboardInputModeWithIdentifier:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v4, "representedString");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v24) = objc_msgSend(v26, "containsString:", CFSTR("emoji"));

          if ((_DWORD)v24)
          {
            if (((v17 | v16 ^ 1) & 1) != 0)
            {
              LOBYTE(v6) = 1;
            }
            else
            {
              v30 = -[UITextInputTraits isSecureTextEntry](self->super._inputTraits, "isSecureTextEntry");
              LOBYTE(v6) = v31 == 122 || v30;
            }
          }
          else
          {
            +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "activeInputModes");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v6) = objc_msgSend(v29, "containsObject:", v25);

          }
        }
        else if (v8)
        {
          -[UIKeyboardLayoutStar inputModeToMergeCapsLockKey](self, "inputModeToMergeCapsLockKey");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v6) = v25 == 0;
        }
        else
        {
          +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = objc_msgSend(v25, "shouldShowInternationalKey") ^ 1;
        }

      }
    }
    else
    {
      LOBYTE(v6) = 0;
    }
  }
LABEL_19:

  return v6;
}

- (void)transitionToModalContinuousPathKeyplane
{
  NSMutableSet *keyplaneTransformations;
  void *v4;
  UIKBTree *keyplane;
  void *v6;
  UIKBTree *v7;
  UIKBTree *v8;
  NSMutableSet *v9;
  id v10;

  if (self->_showsPunctuationKeysOnPrimaryKeyplane)
  {
    keyplaneTransformations = self->_keyplaneTransformations;
    +[UIKBContinuousPathModalKeysTransformation transformationIdentifier](UIKBContinuousPathModalKeysTransformation, "transformationIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(keyplaneTransformations) = -[NSMutableSet containsObject:](keyplaneTransformations, "containsObject:", v4);

    if ((keyplaneTransformations & 1) == 0)
    {
      keyplane = self->_keyplane;
      -[UIKeyboardLayoutStar _currentKeyplaneTransformationContext](self, "_currentKeyplaneTransformationContext");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIKBContinuousPathModalKeysTransformation transformKeyplane:withTransformationContext:](UIKBContinuousPathModalKeysTransformation, "transformKeyplane:withTransformationContext:", keyplane, v6);
      v7 = (UIKBTree *)objc_claimAutoreleasedReturnValue();
      v8 = self->_keyplane;
      self->_keyplane = v7;

      v9 = self->_keyplaneTransformations;
      +[UIKBContinuousPathModalKeysTransformation transformationIdentifier](UIKBContinuousPathModalKeysTransformation, "transformationIdentifier");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet addObject:](v9, "addObject:", v10);

    }
  }
}

- (BOOL)shouldShowDictationKey
{
  uint64_t v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  uint64_t v8;
  void *v9;
  void *v10;
  BOOL v11;
  _QWORD v12[5];

  if (-[UITextInputTraits isSecureTextEntry](self->super._inputTraits, "isSecureTextEntry")
    || -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 3
    || -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 4)
  {
    goto LABEL_14;
  }
  -[UIKBTree firstCachedKeyWithName:](self->_keyplane, "firstCachedKeyWithName:", CFSTR("Dictation-Key"));
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = +[UIDictationController checkTraitsSupportDictation:](UIDictationController, "checkTraitsSupportDictation:", self->super._inputTraits);

    if (v5)
      goto LABEL_6;
LABEL_14:
    LOBYTE(v9) = 0;
    return (char)v9;
  }
  -[UIKBTree firstCachedKeyWithName:](self->_keyplane, "firstCachedKeyWithName:", CFSTR("NumberPad-Dictation"));
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
  }
  else
  {
    -[UIKBTree firstCachedKeyWithName:](self->_keyplane, "firstCachedKeyWithName:", CFSTR("TenKey-Dictation-Key"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
      return (char)v9;
  }
  v11 = +[UIDictationController checkTraitsSupportDictation:](UIDictationController, "checkTraitsSupportDictation:", self->super._inputTraits);

  if (!v11)
    goto LABEL_14;
LABEL_6:
  +[UIDictationController activeInstance](UIDictationController, "activeInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    return +[UIDictationController fetchCurrentInputModeSupportsDictation](UIDictationController, "fetchCurrentInputModeSupportsDictation");
  LOBYTE(v9) = 1;
  if (!self->_pendingDictationReload)
  {
    self->_pendingDictationReload = 1;
    +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __46__UIKeyboardLayoutStar_shouldShowDictationKey__block_invoke;
    v12[3] = &unk_1E16B1B28;
    v12[4] = self;
    objc_msgSend(v10, "queueDelayedTask:", v12);

  }
  return (char)v9;
}

- (void)relayoutForWriteboardKey
{
  BOOL v3;
  _BOOL4 v4;
  int v5;
  void *v6;
  id v7;

  v3 = (unint64_t)(-[UIKeyboardLayout orientation](self, "orientation") - 3) >= 2
    && -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") != 1
    && -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") != 24
    && -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") != 25
    && -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") != 26
    && -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") != 23
    || -[UIKeyboardLayout isFloating](self, "isFloating")
    || -[UIKeyboardLayoutStar useDismissForMessagesWriteboard](self, "useDismissForMessagesWriteboard")
    || -[UIKeyboardLayoutStar useUndoForMessagesWriteboard](self, "useUndoForMessagesWriteboard")
    || -[UIKeyboardLayoutStar ignoreWriteboard](self, "ignoreWriteboard");
  v4 = -[UIKeyboardLayoutStar canAddRomanSwitchKey](self, "canAddRomanSwitchKey");
  v5 = -[UITextInputTraits keyboardType](self->super._inputTraits, "keyboardType") == 126 || v4;
  if (v5 == 1
    && !v3
    && !-[UIKBTree addMessagesWriteboardKeyOrRomanSwitch:](self->_keyplane, "addMessagesWriteboardKeyOrRomanSwitch:", !v4))
  {
    -[UIKBTree name](self->_keyboard, "name");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[UIKBTree name](self->_keyplane, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Can not add Writeboard key for keyboard: %@ keyplane: %@"), v7, v6);

  }
}

- (void)annotateWriteboardDisplayTypeHintForKeyIfNeeded
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[UIKBTree cachedKeysByKeyName:](self->_keyplane, "cachedKeysByKeyName:", CFSTR("Dismiss-Key"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v22;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v7);
        if (-[UITextInputTraits keyboardType](self->super._inputTraits, "keyboardType") == 126
          && -[UIKeyboardLayoutStar useDismissForMessagesWriteboard](self, "useDismissForMessagesWriteboard"))
        {
          v9 = 11;
        }
        else
        {
          v9 = 0;
        }
        objc_msgSend(v8, "setDisplayTypeHint:", v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v5);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[UIKBTree cachedKeysByKeyName:](self->_keyplane, "cachedKeysByKeyName:", CFSTR("Undo-Key"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v14);
        if (-[UITextInputTraits keyboardType](self->super._inputTraits, "keyboardType") == 126
          && -[UIKeyboardLayoutStar useUndoForMessagesWriteboard](self, "useUndoForMessagesWriteboard"))
        {
          v16 = 11;
        }
        else
        {
          v16 = 0;
        }
        objc_msgSend(v15, "setDisplayTypeHint:", v16);
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v12);
  }

}

- (void)_transformFloatingKeyboardIfNecessary
{
  UIKBTree *keyplane;
  void *v4;
  UIKBTree *v5;
  UIKBTree *v6;
  NSMutableSet *keyplaneTransformations;
  id v8;

  if (-[UIKeyboardLayout isFloating](self, "isFloating"))
  {
    keyplane = self->_keyplane;
    -[UIKeyboardLayoutStar _currentKeyplaneTransformationContext](self, "_currentKeyplaneTransformationContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKBFloatingKeyplaneTransformation transformKeyplane:withTransformationContext:](UIKBFloatingKeyplaneTransformation, "transformKeyplane:withTransformationContext:", keyplane, v4);
    v5 = (UIKBTree *)objc_claimAutoreleasedReturnValue();
    v6 = self->_keyplane;
    self->_keyplane = v5;

    keyplaneTransformations = self->_keyplaneTransformations;
    +[UIKBFloatingKeyplaneTransformation transformationIdentifier](UIKBFloatingKeyplaneTransformation, "transformationIdentifier");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet addObject:](keyplaneTransformations, "addObject:", v8);

  }
}

- (void)_swapGlobeAndMoreKeysIfNecessary
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  if (-[UIKeyboardLayoutStar _shouldSwapGlobeAndMore](self, "_shouldSwapGlobeAndMore"))
  {
    -[UIKBTree firstCachedKeyWithName:](self->_keyplane, "firstCachedKeyWithName:", CFSTR("More-Key"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBTree firstCachedKeyWithName:](self->_keyplane, "firstCachedKeyWithName:", CFSTR("International-Key"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "frame");
    v6 = v5;
    objc_msgSend(v4, "frame");
    if (vabdd_f64(v6, v7) < 0.00000011920929)
    {
      objc_msgSend(v3, "shape");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v8, "copy");

      objc_msgSend(v4, "shape");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v10, "copy");

      if (-[UIKBScreenTraits isSplit](self->super._screenTraits, "isSplit"))
      {
        -[UIKBScreenTraits screen](self->super._screenTraits, "screen");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "scale");
        +[UIKBShapeOperator operatorWithScale:](UIKBShapeOperator, "operatorWithScale:");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "frame");
        v15 = v14;
        v16 = v14 * 0.5;
        v28[0] = v11;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = -(v15 * 0.5);
        objc_msgSend(v13, "shapesByRepositioningShapes:withOffset:", v17, v18, 0.0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "firstObject");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v27 = v20;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "shapesByResizingShapes:withOffset:", v21, v16, 0.0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "firstObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v26 = v9;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "shapesByResizingShapes:withOffset:", v23, v18, 0.0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "firstObject");
        v25 = objc_claimAutoreleasedReturnValue();

        v9 = (void *)v25;
      }
      objc_msgSend(v3, "setShape:", v11);
      objc_msgSend(v4, "setShape:", v9);

    }
  }
}

- (BOOL)_shouldSwapGlobeAndMore
{
  uint64_t v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  BOOL v11;
  void *v13;
  char v14;
  uint64_t v15;
  BOOL v16;
  char v17;

  v3 = UIKeyboardComputeKeyboardIdiomFromScreenTraits(self->super._screenTraits, -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom"), 0);
  if (!-[UIKeyboardLayoutStar useCrescendoLayout](self, "useCrescendoLayout"))
  {
    if (v3 == 23)
    {
      if (-[UIKeyboardLayout isFloating](self, "isFloating"))
        goto LABEL_23;
    }
    else if (v3 == 24 || v3 == 26 && !+[UIDevice _hasHomeButton](UIDevice, "_hasHomeButton"))
    {
      goto LABEL_23;
    }
    if ((unint64_t)(-[UIKBScreenTraits orientation](self->super._screenTraits, "orientation") - 3) > 1)
      return 0;
    if (self->_externalDictationAndInternationalKeys || (unint64_t)(v3 - 21) > 1)
      return 0;
    -[UIKBTree name](self->_keyboard, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "_containsSubstring:", CFSTR("HWR"));

    if ((v14 & 1) == 0)
      return 0;
LABEL_23:
    -[UIKBTree firstCachedKeyWithName:](self->_keyplane, "firstCachedKeyWithName:", CFSTR("More-Key"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBTree firstCachedKeyWithName:](self->_keyplane, "firstCachedKeyWithName:", CFSTR("International-Key"));
    v15 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v15;
    if (v8)
      v16 = v15 == 0;
    else
      v16 = 1;
    if (!v16 && objc_msgSend(v8, "visible"))
    {
      v17 = objc_msgSend(v9, "visible");
LABEL_31:

      return v17;
    }
LABEL_30:
    v17 = 0;
    goto LABEL_31;
  }
  if (v3 != 26)
  {
    if ((unint64_t)(v3 - 23) < 2 && -[UIKeyboardLayout isFloating](self, "isFloating"))
      goto LABEL_23;
    return 0;
  }
  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferencesActions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rivenSizeFactor:", 1.0);
  v7 = v6;

  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferencesActions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rivenSizeFactor:", 1.0);
  if (v10 > 1.0)
  {

    goto LABEL_23;
  }
  if (v7 <= 1.0)
    goto LABEL_30;
  v11 = -[UIKeyboardLayout isFloating](self, "isFloating");

  if (v11)
    goto LABEL_23;
  return 0;
}

- (void)_addExtraControlKeysIfNecessary
{
  UIKBTree *keyplane;
  void *v4;
  UIKBTree *v5;
  UIKBTree *v6;
  NSMutableSet *keyplaneTransformations;
  id v8;

  if (-[UIKeyboardLayoutStar _shouldAttemptToAddSupplementaryControlKeys](self, "_shouldAttemptToAddSupplementaryControlKeys"))
  {
    keyplane = self->_keyplane;
    -[UIKeyboardLayoutStar _currentKeyplaneTransformationContext](self, "_currentKeyplaneTransformationContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardSupplementaryControlKeyTransformation transformKeyplane:withTransformationContext:](UIKeyboardSupplementaryControlKeyTransformation, "transformKeyplane:withTransformationContext:", keyplane, v4);
    v5 = (UIKBTree *)objc_claimAutoreleasedReturnValue();
    v6 = self->_keyplane;
    self->_keyplane = v5;

    keyplaneTransformations = self->_keyplaneTransformations;
    +[UIKeyboardSupplementaryControlKeyTransformation transformationIdentifier](UIKeyboardSupplementaryControlKeyTransformation, "transformationIdentifier");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet addObject:](keyplaneTransformations, "addObject:", v8);

  }
}

- (unint64_t)textEditingKeyMask
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v8;
  void *v9;

  -[UIKBTree firstCachedKeyWithName:](self->_keyplane, "firstCachedKeyWithName:", CFSTR("Cut-Key"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    || (-[UIKBTree firstCachedKeyWithName:](self->_keyplane, "firstCachedKeyWithName:", CFSTR("Copy-Key")),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

  }
  else
  {
    -[UIKBTree firstCachedKeyWithName:](self->_keyplane, "firstCachedKeyWithName:", CFSTR("Paste-Key"));
    v4 = objc_claimAutoreleasedReturnValue();

    if (!v4)
      goto LABEL_5;
  }
  v4 = 2;
LABEL_5:
  -[UIKBTree firstCachedKeyWithName:](self->_keyplane, "firstCachedKeyWithName:", CFSTR("Bold-Key"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    || (-[UIKBTree firstCachedKeyWithName:](self->_keyplane, "firstCachedKeyWithName:", CFSTR("Italic-Key")),
        (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    || (-[UIKBTree firstCachedKeyWithName:](self->_keyplane, "firstCachedKeyWithName:", CFSTR("Underline-Key")),
        (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

  }
  else
  {
    -[UIKBTree firstCachedKeyWithName:](self->_keyplane, "firstCachedKeyWithName:", CFSTR("BIU-Key"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      goto LABEL_10;
  }
  v4 |= 4uLL;
LABEL_10:
  -[UIKBTree firstCachedKeyWithName:](self->_keyplane, "firstCachedKeyWithName:", CFSTR("RTL-Left-Arrow-Key"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6
    || (-[UIKBTree firstCachedKeyWithName:](self->_keyplane, "firstCachedKeyWithName:", CFSTR("Left-Arrow-Key")),
        (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    || (-[UIKBTree firstCachedKeyWithName:](self->_keyplane, "firstCachedKeyWithName:", CFSTR("RTL-Right-Arrow-Key")),
        (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

  }
  else
  {
    -[UIKBTree firstCachedKeyWithName:](self->_keyplane, "firstCachedKeyWithName:", CFSTR("Right-Arrow_key"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      return v4;
  }
  v4 |= 1uLL;
  return v4;
}

- (BOOL)isTrackpadMode
{
  return self->_isTrackpadMode;
}

- (BOOL)canAddRomanSwitchKey
{
  BOOL v3;
  void *v5;
  void *v6;
  void *v7;

  if (-[NSString containsString:](self->_keyboardName, "containsString:", CFSTR("Kana"))
    || (-[UIKBTree visualStyling](self->_keyplane, "visualStyling") & 0x3F) != 0x18
    && (-[UIKBTree visualStyling](self->_keyplane, "visualStyling") & 0x3F) != 0x17
    || -[UIKeyboardLayout isFloating](self, "isFloating"))
  {
    return 0;
  }
  -[UIKeyboardLayoutStar inputModeToMergeCapsLockKey](self, "inputModeToMergeCapsLockKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[UIKBTree scriptSwitchKey](self->_keyplane, "scriptSwitchKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v3 = 0;
    }
    else
    {
      -[UIKBTree firstCachedKeyWithName:](self->_keyplane, "firstCachedKeyWithName:", CFSTR("Tab-Key"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v7 == 0;

    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)setRenderConfig:(id)a3 updateKeyplane:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  _BOOL4 v12;
  int v13;
  UIKBRenderConfig *passcodeRenderConfig;
  UIKBRenderConfig *v15;
  UIKBRenderConfig *renderConfig;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  NSString *v22;
  void *v23;
  NSString *v24;
  NSString *dictationReplacementKeycap;
  int *v26;
  void *v27;
  int v28;
  void *v29;
  UIKBRenderConfig *v30;

  v4 = a4;
  v30 = (UIKBRenderConfig *)a3;
  -[UIKeyboardLayoutStar delegate](self, "delegate");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    -[UIKeyboardLayoutStar delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      -[UIKeyboardLayoutStar delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "keyboardLayout:willChangeRenderConfig:", self, v30);
      v11 = objc_claimAutoreleasedReturnValue();

      v30 = (UIKBRenderConfig *)v11;
    }
  }
  if (!-[UIKBRenderConfig isEqual:](self->_renderConfig, "isEqual:", v30))
  {
    if (v4)
    {
      v12 = -[UIKBRenderConfig lightKeyboard](self->_renderConfig, "lightKeyboard");
      v13 = v12 ^ -[UIKBRenderConfig lightKeyboard](v30, "lightKeyboard");
    }
    else
    {
      v13 = 0;
    }
    if ((-[UIKBTree visualStyling](self->_keyplane, "visualStyling") & 0xFF00) != 0x7F00
      || (passcodeRenderConfig = self->_passcodeRenderConfig) == 0)
    {
      passcodeRenderConfig = v30;
    }
    v15 = passcodeRenderConfig;
    renderConfig = self->_renderConfig;
    self->_renderConfig = v15;

    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "delegateAsResponder");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "inputAssistantItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_dictationReplacementAction");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
      v21 = v13;
    else
      v21 = 0;
    if ((v21 & 1) != 0
      || (v22 = self->_dictationReplacementKeycap,
          objc_msgSend(v20, "title"),
          v23 = (void *)objc_claimAutoreleasedReturnValue(),
          LOBYTE(v22) = -[NSString isEqualToString:](v22, "isEqualToString:", v23),
          v23,
          (v22 & 1) == 0))
    {
      objc_msgSend(v20, "title");
      v24 = (NSString *)objc_claimAutoreleasedReturnValue();
      dictationReplacementKeycap = self->_dictationReplacementKeycap;
      self->_dictationReplacementKeycap = v24;

      -[UIKBRenderConfig overrideKeycapWithSymbol:forDisplayType:](self->_renderConfig, "overrideKeycapWithSymbol:forDisplayType:", self->_dictationReplacementKeycap, 4);
      -[UIKBRenderConfig overrideKeycapWithSymbol:forDisplayType:](self->_renderConfig, "overrideKeycapWithSymbol:forDisplayType:", self->_dictationReplacementKeycap, 56);
    }
    if (-[UIKeyboardLayoutStar useCrescendoLayout](self, "useCrescendoLayout"))
    {
      v26 = &OBJC_IVAR___UIKeyboardLayoutStar__liveKeyplaneView;
    }
    else
    {
      -[UIKBKeyplaneView setRenderConfig:](self->_keyplaneView, "setRenderConfig:", self->_renderConfig);
      v26 = &OBJC_IVAR___UIKeyboardLayoutStar__resizingKeyplaneCoordinator;
      -[UIKBBackgroundView setRenderConfig:](self->_backgroundView, "setRenderConfig:", self->_renderConfig);
    }
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + *v26), "setRenderConfig:", self->_renderConfig);
    +[UIInputSwitcherView activeInstance](UIInputSwitcherView, "activeInstance");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "isVisible");

    if (v28)
    {
      +[UIInputSwitcherView activeInstance](UIInputSwitcherView, "activeInstance");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setRenderConfig:", v30);

    }
    if (v13)
      -[UIKeyboardLayoutStar didTriggerDestructiveRenderConfigChange](self, "didTriggerDestructiveRenderConfigChange");

  }
}

- (UIKeyboardLayoutStarDelegate)delegate
{
  return (UIKeyboardLayoutStarDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)hasCandidateKeys
{
  void *v2;
  BOOL v3;

  -[UIKBTree cachedKeysByKeyName:](self->_keyplane, "cachedKeysByKeyName:", CFSTR("Candidate-Selection"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

void __49__UIKeyboardLayoutStar_divideKeysIntoLeft_right___block_invoke_2(uint64_t a1, void *a2)
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  double MaxX;
  double v12;
  double v13;
  double v14;
  double v15;
  double MinX;
  id v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  v17 = a2;
  objc_msgSend(v17, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v22.origin.x = v3;
  v22.origin.y = v5;
  v22.size.width = v7;
  v22.size.height = v9;
  if (CGRectIntersectsRect(*(CGRect *)(a1 + 56), v22))
    goto LABEL_4;
  v23.origin.x = v4;
  v23.origin.y = v6;
  v23.size.width = v8;
  v23.size.height = v10;
  if (CGRectIntersectsRect(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32), v23))
  {
    MaxX = CGRectGetMaxX(*(CGRect *)(a1 + 56));
    v18.origin.x = v4;
    v18.origin.y = v6;
    v18.size.width = v8;
    v18.size.height = v10;
    v12 = MaxX - CGRectGetMinX(v18);
    v19.origin.x = v4;
    v19.origin.y = v6;
    v19.size.width = v8;
    v19.size.height = v10;
    v13 = CGRectGetMaxX(v19);
    if (v12 > v13 - CGRectGetMaxX(*(CGRect *)(a1 + 56)))
LABEL_4:
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v17);
  }
  v24.origin.x = v4;
  v24.origin.y = v6;
  v24.size.width = v8;
  v24.size.height = v10;
  if (CGRectIntersectsRect(*(CGRect *)(a1 + 88), v24))
    goto LABEL_8;
  v25.origin.x = v4;
  v25.origin.y = v6;
  v25.size.width = v8;
  v25.size.height = v10;
  if (CGRectIntersectsRect(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32), v25))
  {
    v20.origin.x = v4;
    v20.origin.y = v6;
    v20.size.width = v8;
    v20.size.height = v10;
    v14 = CGRectGetMaxX(v20);
    v15 = v14 - CGRectGetMinX(*(CGRect *)(a1 + 88));
    MinX = CGRectGetMinX(*(CGRect *)(a1 + 88));
    v21.origin.x = v4;
    v21.origin.y = v6;
    v21.size.width = v8;
    v21.size.height = v10;
    if (v15 > MinX - CGRectGetMinX(v21))
LABEL_8:
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v17);
  }

}

- (void)setKeyboardName:(id)a3 appearance:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  BOOL v12;
  void *v13;
  void *v14;
  NSNumber *homeRowHint;
  NSString *v16;
  NSString *keyboardName;
  UIKBTree *keyplane;
  char v19;
  int v20;
  int64_t v21;
  id v22;

  v6 = a3;
  v22 = v6;
  if (v6)
  {
    -[UIKeyboardLayoutStar keyForKeyboardName:screenTraits:](self, "keyForKeyboardName:screenTraits:", v6, self->super._screenTraits);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_keyboards, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend((id)objc_opt_class(), "keyboardWithName:screenTraits:", v22, self->super._screenTraits);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8)
        goto LABEL_23;
    }
    UIKeyboardGetCurrentInputMode();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardLayoutStar localizedInputMode](self, "localizedInputMode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 == v10)
      v11 = 0;
    else
      v11 = objc_msgSend(v9, "isEqual:", v10) ^ 1;
    v21 = a4;
    if (objc_msgSend(v22, "isEqualToString:", self->_keyboardName)
      && self->_appearance == a4
      && -[UITextInputTraits keyboardType](self->super._inputTraits, "keyboardType") != 126
      && -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") != 3)
    {
      v19 = (char)-[UIKBTree visualStyling](self->_keyplane, "visualStyling");
      v12 = (v19 & 0x3F) == 3;
      if ((v19 & 0x3F) == 3)
        v20 = 1;
      else
        v20 = v11;
      if (v20 != 1)
      {
LABEL_20:
        if (!+[UIKeyboardImpl rivenPreference](UIKeyboardImpl, "rivenPreference")
          || self->_transitionView)
        {
LABEL_22:

LABEL_23:
          goto LABEL_24;
        }
LABEL_14:
        homeRowHint = self->_homeRowHint;
        self->_homeRowHint = 0;

        -[NSMutableDictionary setObject:forKey:](self->_keyboards, "setObject:forKey:", v8, v7);
        -[NSMutableDictionary removeAllObjects](self->_allKeyplaneViews, "removeAllObjects");
        -[NSMutableSet removeAllObjects](self->_keysUnderIndicator, "removeAllObjects");
        -[UIKBTree clearManualAddedKey](self->_keyplane, "clearManualAddedKey");
        v16 = (NSString *)objc_msgSend(v22, "copy");
        keyboardName = self->_keyboardName;
        self->_keyboardName = v16;

        objc_storeStrong((id *)&self->_keyboard, v8);
        keyplane = self->_keyplane;
        self->_keyplane = 0;

        -[UIView setOpaque:](self, "setOpaque:", 0);
        -[NSMutableSet removeAllObjects](self->_validInputStrings, "removeAllObjects");
        -[UIKeyboardLayoutStar setKeyboardAppearance:](self, "setKeyboardAppearance:", v21);
        -[UIKeyboardLayoutStar clearAllTouchInfo](self, "clearAllTouchInfo");
        if (+[UIKeyboardImpl rivenInstalled](UIKeyboardImpl, "rivenInstalled"))
          -[UIKeyboardLayoutStar refreshForRivenPreferences](self, "refreshForRivenPreferences");
        goto LABEL_22;
      }
    }
    else
    {
      v12 = 1;
    }
    -[UIKeyboardLayoutStar setLocalizedInputKey:](self, "setLocalizedInputKey:", &stru_1E16EDF20);
    -[UIKeyboardLayoutStar cancelMultitapTimer](self, "cancelMultitapTimer");
    -[UIKeyboardLayoutStar cancelModalDoubleConsonantKeysTimer](self, "cancelModalDoubleConsonantKeysTimer");
    -[NSMutableDictionary allValues](self->_allKeyplaneViews, "allValues");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "makeObjectsPerformSelector:", sel_purgeSubviews);

    -[NSMutableDictionary allValues](self->_allKeyplaneViews, "allValues");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "makeObjectsPerformSelector:", sel_purgeFactory);

    -[NSMutableSet removeAllObjects](self->_accentInfo, "removeAllObjects");
    -[NSMutableSet removeAllObjects](self->_hasAccents, "removeAllObjects");
    if (v12)
      goto LABEL_14;
    goto LABEL_20;
  }
  NSLog(CFSTR("attempt to set keyboard name with nil name"));
LABEL_24:

}

- (void)setLocalizedInputKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 792);
}

- (void)setKeyboardAppearance:(int64_t)appearance
{
  int v4;
  int v5;
  UIKBTree *keyboard;
  uint64_t v7;
  uint64_t v8;

  if (appearance == -1)
    appearance = self->_appearance;
  self->_appearance = appearance;
  if (-[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 1
    || -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 24
    || -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 25
    || -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 26
    || -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 23)
  {
    v4 = !-[UIKeyboardLayout isFloating](self, "isFloating");
  }
  else
  {
    v4 = 0;
  }
  if (-[UIKBTree visualStyle](self->_keyboard, "visualStyle") != 101
    && -[UIKBTree visualStyle](self->_keyboard, "visualStyle") != 4
    && -[UIKBTree visualStyle](self->_keyboard, "visualStyle") != 108
    && -[UIKBTree visualStyle](self->_keyboard, "visualStyle") != 301
    && -[UIKBTree visualStyle](self->_keyboard, "visualStyle") != 109)
  {
    v5 = self->_appearance;
    switch(v5)
    {
      case 0:
      case 2:
        keyboard = self->_keyboard;
        if (v4)
          goto LABEL_19;
        goto LABEL_24;
      case 1:
      case 9:
        keyboard = self->_keyboard;
        if (v4)
LABEL_19:
          v7 = 102;
        else
          v7 = 3;
        goto LABEL_27;
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
      case 10:
        goto LABEL_28;
      case 11:
        goto LABEL_21;
      case 12:
        keyboard = self->_keyboard;
LABEL_24:
        v7 = 1;
        goto LABEL_27;
      default:
        if (v5 == 127)
        {
LABEL_21:
          keyboard = self->_keyboard;
          if (v4)
            v7 = 105;
          else
            v7 = 5;
LABEL_27:
          -[UIKBTree setVisualStyle:](keyboard, "setVisualStyle:", v7);
        }
LABEL_28:
        if (-[UIKBTree dynamicLayout](self->_keyboard, "dynamicLayout")
          && !-[UIKBTree visualStyle](self->_keyboard, "visualStyle"))
        {
          if (v4)
            v8 = 102;
          else
            v8 = 1;
          -[UIKBTree setVisualStyle:](self->_keyboard, "setVisualStyle:", v8);
        }
        break;
    }
  }
  if (-[UIKBScreenTraits supportsSplit](self->super._screenTraits, "supportsSplit"))
  {
    -[UIKBTree setVisualStyle:](self->_keyboard, "setVisualStyle:", -[UIKeyboardLayoutStar visualStyleForKeyboardIfSplit:](self, "visualStyleForKeyboardIfSplit:", -[UIKBScreenTraits isSplit](self->super._screenTraits, "isSplit")));
    -[UIKBTree setVisualStyle:](self->_keyplane, "setVisualStyle:", -[UIKBTree visualStyle](self->_keyboard, "visualStyle"));
    -[UIKeyboardLayoutStar updateBackgroundIfNeeded](self, "updateBackgroundIfNeeded");
  }
  else
  {
    -[UIKBTree setVisualStyle:](self->_keyplane, "setVisualStyle:", -[UIKBTree visualStyle](self->_keyboard, "visualStyle"));
  }
}

- (void)cancelModalDoubleConsonantKeysTimer
{
  UIDelayedAction *dismissModalDoubleConsonantKeys;

  -[UIDelayedAction cancel](self->_dismissModalDoubleConsonantKeys, "cancel");
  dismissModalDoubleConsonantKeys = self->_dismissModalDoubleConsonantKeys;
  self->_dismissModalDoubleConsonantKeys = 0;

}

- (NSString)localizedInputMode
{
  NSString *localizedInputKey;
  void *v3;
  void *v4;

  localizedInputKey = self->_localizedInputKey;
  if (localizedInputKey)
  {
    -[NSString componentsSeparatedByString:](localizedInputKey, "componentsSeparatedByString:", CFSTR("^"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectAtIndex:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

- (id)keyForKeyboardName:(id)a3 screenTraits:(id)a4
{
  void *v5;
  id v6;
  void *v7;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a3;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@_%ld"), v6, objc_msgSend(a4, "idiom"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)cancelMultitapTimer
{
  UIDelayedAction *multitapAction;

  -[UIDelayedAction cancel](self->_multitapAction, "cancel");
  multitapAction = self->_multitapAction;
  self->_multitapAction = 0;

}

- (void)deactivateActiveKeys
{
  void *v3;
  objc_super v4;

  -[UIKeyboardLayoutStar deactivateActiveKeysClearingTouchInfo:clearingDimming:](self, "deactivateActiveKeysClearingTouchInfo:clearingDimming:", 1, 1);
  -[UIKeyboardLayoutStar slideBehaviour](self, "slideBehaviour");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deactivate");

  -[UIKeyboardLayoutStar setSlideBehaviour:](self, "setSlideBehaviour:", 0);
  if (self->_lastInputIsGestureKey)
  {
    +[_UIKeyboardUsageTracking panAlternateKeyFlickDownCount](_UIKeyboardUsageTracking, "panAlternateKeyFlickDownCount");
    self->_lastInputIsGestureKey = 0;
  }
  if (self->_isTrackpadMode)
    -[UIKeyboardLayoutStar didEndIndirectSelectionGesture:](self, "didEndIndirectSelectionGesture:", 0);
  v4.receiver = self;
  v4.super_class = (Class)UIKeyboardLayoutStar;
  -[UIKeyboardLayout deactivateActiveKeys](&v4, sel_deactivateActiveKeys);
}

- (void)deactivateActiveKeysClearingTouchInfo:(BOOL)a3 clearingDimming:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v7;
  id touchInfo;
  void *v9;
  void *v10;
  id v11;

  if (!self->_suppressDeactivateKeys)
  {
    v4 = a4;
    v5 = a3;
    if (self->_liveKeyplaneView)
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "clearLongPressTimer");

      -[TUIKeyplaneView deactivateKeys](self->_liveKeyplaneView, "deactivateKeys");
    }
    -[UIKBKeyplaneView deactivateKeys](self->_keyplaneView, "deactivateKeys");
    if (v5)
    {
      -[UIKeyboardLayoutStar clearAllTouchInfo](self, "clearAllTouchInfo");
      -[UIKeyboardLayoutStar handleDismissFlickView:](self, "handleDismissFlickView:", 0);
      touchInfo = self->_touchInfo;
      self->_touchInfo = 0;

      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stopAutoDelete");

      -[UIKeyboardLayoutStar setPreTouchKeyplaneName:](self, "setPreTouchKeyplaneName:", 0);
    }
    -[UIKeyboardLayoutStar setActiveKey:](self, "setActiveKey:", 0);
    if (v4)
    {
      if (!self->_isTrackpadMode)
        -[UIKeyboardLayoutStar setKeyboardDim:](self, "setKeyboardDim:", 0);
      +[UIKeyboardSplitControlMenu activeInstance](UIKeyboardSplitControlMenu, "activeInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "hide");

      +[UIKeyboardDictationMenu activeInstance](UIKeyboardDictationMenu, "activeInstance");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "hide");

    }
  }
}

- (void)setActiveKey:(id)a3
{
  objc_storeStrong((id *)&self->_activeKey, a3);
}

- (void)clearAllTouchInfo
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary allValues](self->_extendedTouchInfoMap, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[UIKeyboardLayoutStar cancelTouchIfNecessaryForInfo:forResting:](self, "cancelTouchIfNecessaryForInfo:forResting:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), 0);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
  -[NSMutableDictionary removeAllObjects](self->_extendedTouchInfoMap, "removeAllObjects");

}

- (void)handleDismissFlickView:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v5 = v4;
  if (self->_inDealloc)
  {
    -[UIKeyboardLayoutStar handleDismissFlickView](self, "handleDismissFlickView");
  }
  else
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __82__UIKeyboardLayoutStar_UIKeyboardLayoutJapanese50OnFlick__handleDismissFlickView___block_invoke;
    v6[3] = &unk_1E16B1B50;
    v6[4] = self;
    v7 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], v6);

  }
}

- (UISelectionFeedbackGenerator)slideBehaviour
{
  return self->_slideBehaviour;
}

- (void)setSlideBehaviour:(id)a3
{
  objc_storeStrong((id *)&self->_slideBehaviour, a3);
}

- (void)setPreTouchKeyplaneName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 904);
}

- (void)setKeyboardDim:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  TUIKeyplaneView *liveKeyplaneView;
  _QWORD v16[3];
  _QWORD v17[4];

  v3 = a3;
  v17[3] = *MEMORY[0x1E0C80C00];
  v5 = (-[UIKBTree visualStyling](self->_keyplane, "visualStyling") & 0xFF00) != 0x7F00 && v3;
  if (v5)
  {
    -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom");
    v6 = 0.55;
    v7 = 0.15;
    v8 = 0.55;
  }
  else
  {
    v6 = 1.0;
    if (-[UIKeyboardLayoutStar isDeveloperGestureKeybaord](self, "isDeveloperGestureKeybaord"))
      v8 = 0.25;
    else
      v8 = 1.0;
    v7 = 0.0;
  }
  v16[0] = &unk_1E1A98538;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v9;
  v16[1] = &unk_1E1A98550;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v10;
  v16[2] = &unk_1E1A984F0;
  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[UIKeyboardLayoutStar renderConfig](self, "renderConfig");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lightKeycapOpacity");
  objc_msgSend(v11, "numberWithDouble:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  liveKeyplaneView = self->_liveKeyplaneView;
  if (liveKeyplaneView)
    -[TUIKeyplaneView dimKeys:](liveKeyplaneView, "dimKeys:", v14);
  -[UIKBKeyplaneView dimKeys:](self->_keyplaneView, "dimKeys:", v14);
  -[UIKBResizingKeyplaneCoordinator dimKeys:](self->_resizingKeyplaneCoordinator, "dimKeys:", v14);
  if (!v5)
    -[UIKeyboardLayoutStar setKeyboardDim:amount:withDuration:](self, "setKeyboardDim:amount:withDuration:", 0, v6, v7);

}

- (BOOL)isDeveloperGestureKeybaord
{
  return (-[UIKBTree visualStyling](self->_keyplane, "visualStyling") & 0x3F) != 0x17
      && -[UITextInputTraits keyboardType](self->super._inputTraits, "keyboardType") == 12;
}

- (void)setKeyboardDim:(BOOL)a3 amount:(double)a4 withDuration:(double)a5
{
  _BOOL4 v7;
  _BOOL4 v9;
  UIView *dimKeyboardImageView;
  UIKBDimmingView *v11;
  void *v12;
  UIView *v13;
  UIView *v14;
  void *v15;
  UIView *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  BOOL v20;
  _QWORD v21[6];
  BOOL v22;

  v7 = a3;
  v9 = (-[UIKBTree visualStyling](self->_keyplane, "visualStyling") & 0xFF00) != 0x7F00 && v7;
  dimKeyboardImageView = self->_dimKeyboardImageView;
  if (v9)
  {
    if (!dimKeyboardImageView)
    {
      v11 = [UIKBDimmingView alloc];
      -[UIView superview](self, "superview");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bounds");
      v13 = -[UIKBDimmingView initWithFrame:](v11, "initWithFrame:");
      v14 = self->_dimKeyboardImageView;
      self->_dimKeyboardImageView = v13;

      -[UIView setAlpha:](self->_dimKeyboardImageView, "setAlpha:", 0.0);
      -[UIView setHidden:](self->_dimKeyboardImageView, "setHidden:", 1);
      -[UIView superview](self, "superview");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addSubview:", self->_dimKeyboardImageView);

      dimKeyboardImageView = self->_dimKeyboardImageView;
    }
  }
  else if (!dimKeyboardImageView)
  {
    return;
  }
  -[UIView setScreenTraits:](dimKeyboardImageView, "setScreenTraits:", self->super._screenTraits);
  -[UIView refreshStyleForKeyplane:](self->_dimKeyboardImageView, "refreshStyleForKeyplane:", self->_keyplane);
  v16 = self->_dimKeyboardImageView;
  if (v16 && self->_keyboardImageViewIsDim != v9)
  {
    -[UIView superview](self, "superview");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bounds");
    -[UIView setFrame:](v16, "setFrame:");

    -[UIView setNeedsDisplay](self->_dimKeyboardImageView, "setNeedsDisplay");
    if (v9)
    {
      if (-[UIView isHidden](self->_dimKeyboardImageView, "isHidden"))
      {
        -[UIView setAlpha:](self->_dimKeyboardImageView, "setAlpha:", 0.0);
        -[UIView setHidden:](self->_dimKeyboardImageView, "setHidden:", 0);
      }
    }
    -[UIView superview](self, "superview");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bringSubviewToFront:", self->_dimKeyboardImageView);

    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __94__UIKeyboardLayoutStar_UIKeyboardLayoutJapanese50OnFlick__setKeyboardDim_amount_withDuration___block_invoke;
    v21[3] = &unk_1E16BFE60;
    v21[4] = self;
    v22 = v9;
    *(double *)&v21[5] = a4;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __94__UIKeyboardLayoutStar_UIKeyboardLayoutJapanese50OnFlick__setKeyboardDim_amount_withDuration___block_invoke_2;
    v19[3] = &unk_1E16B7F38;
    v19[4] = self;
    v20 = v9;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 117440512, v21, v19, a5, 0.0);
    self->_keyboardImageViewIsDim = v9;
  }
}

- (void)restoreDefaultsForAllKeys
{
  -[UIKeyboardLayoutStar restoreDefaultsForKey:](self, "restoreDefaultsForKey:", CFSTR("_keyid_space_"));
  -[UIKeyboardLayoutStar restoreDefaultsForKey:](self, "restoreDefaultsForKey:", CFSTR("_keyid_return_"));
}

- (void)restoreDefaultsForKey:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  int *v6;
  int *v7;
  int *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;

  v4 = (__CFString *)a3;
  v11 = v4;
  if (CFSTR("_keyid_space_") == v4)
  {
    -[UIKeyboardLayoutStar setLabel:forKey:](self, "setLabel:forKey:", 0, v4);
    v6 = &OBJC_IVAR___UIKeyboardLayoutStar__spaceTarget;
    goto LABEL_5;
  }
  -[UIKeyboardLayoutStar setLabel:forKey:](self, "setLabel:forKey:", 0, v4);
  v5 = v11;
  if (CFSTR("_keyid_return_") == v11)
  {
    v6 = &OBJC_IVAR___UIKeyboardLayoutStar__returnTarget;
LABEL_5:
    v7 = v6 + 4;
    v8 = v6 + 2;
    v9 = *v6;
    v10 = *(Class *)((char *)&self->super.super.super.super.isa + v9);
    *(Class *)((char *)&self->super.super.super.super.isa + v9) = 0;

    *(Class *)((char *)&self->super.super.super.super.isa + *v8) = 0;
    *(Class *)((char *)&self->super.super.super.super.isa + *v7) = 0;
    v5 = v11;
  }

}

- (void)setLabel:(id)a3 forKey:(id)a4
{
  __CFString *v6;
  __CFString *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  __CFString *v20;
  BOOL v21;
  _BOOL4 v22;
  char v23;
  __CFString *v24;
  __CFString *v25;
  __CFString *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  char v35;
  void *v36;
  __CFString *v37;

  v37 = (__CFString *)a3;
  v6 = (__CFString *)a4;
  v7 = v6;
  if (!self->_isTrackpadMode)
  {
    if (CFSTR("_keyid_space_") != v6)
    {
      if (CFSTR("_keyid_return_") == v6)
      {
        -[UIKBTree cache](self->_keyplane, "cache");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        v19 = CFSTR("Return-Key");
      }
      else
      {
        if (CFSTR("_keyid_accent_") != v6)
        {
          if (CFSTR("_keyid_facemark_") == v6)
            v8 = CFSTR("Facemark");
          else
            v8 = v6;
          -[UIKBTree keysWithString:](self->_keyplane, "keysWithString:", v8);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_18;
        }
        -[UIKBTree cache](self->_keyplane, "cache");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        v19 = CFSTR("Latin-Accents");
      }
      objc_msgSend(v17, "objectForKey:", v19);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_18;
    }
    -[UIKBTree cache](self->_keyplane, "cache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("Space-Key"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v10, "count");
    -[UIKBTree cache](self->_keyplane, "cache");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", CFSTR("Unlabeled-Space-Key"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {

      if (!objc_msgSend(v13, "count"))
        goto LABEL_11;
      objc_msgSend(v10, "arrayByAddingObjectsFromArray:", v13);
      v12 = v13;
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v14 = v13;

    v13 = v12;
    v10 = v14;
LABEL_11:

    if (!objc_msgSend(v10, "count"))
    {
      -[UIKBTree cache](self->_keyplane, "cache");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKey:", CFSTR("Ideographic-Space-Key"));
      v16 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v16;
    }
LABEL_18:
    if (!objc_msgSend(v10, "count"))
    {
LABEL_55:

      goto LABEL_56;
    }
    v20 = v37;
    v21 = CFSTR("_keyid_space_") == v7 && CFSTR("UI-Space") == v37;
    if (v21
      && ((-[UIKBTree visualStyling](self->_keyplane, "visualStyling") & 0x3F) == 1
       && (-[UIKBTree visualStyling](self->_keyplane, "visualStyling") & 0x80) == 0
       && (-[UIKBTree visualStyling](self->_keyplane, "visualStyling") & 0xFF0000) != 0xB0000
       && !-[UIKeyboardLayoutStar isHandwritingPlane](self, "isHandwritingPlane")
       || (-[UIKBTree visualStyling](self->_keyplane, "visualStyling") & 0x80) != 0
       && !-[UIKeyboardLayoutStar hasCandidateKeys](self, "hasCandidateKeys")
       || (v22 = -[UIKeyboardLayoutStar useCrescendoLayout](self, "useCrescendoLayout"), v20 = v37, v22)
       && (v23 = (char)-[UIKBTree visualStyling](self->_keyplane, "visualStyling"), v20 = v37, (v23 & 0x3F) == 1)))
    {
      v24 = &stru_1E16EDF20;
    }
    else
    {
      UIKeyboardLocalizedString(v20, 0, 0, 0);
      v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v25)
        v26 = v25;
      else
        v26 = v37;
      v24 = v26;

    }
    objc_msgSend(v10, "objectAtIndex:", 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (CFSTR("_keyid_space_") == v7
      && (unint64_t)objc_msgSend(v10, "count") >= 2
      && -[UIKBTree isSplit](self->_keyplane, "isSplit"))
    {
      objc_msgSend(v10, "objectAtIndex:", 1);
      v28 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (CFSTR("_keyid_return_") != v7)
        goto LABEL_46;
      if ((unint64_t)objc_msgSend(v10, "count") < 2)
        goto LABEL_46;
      objc_msgSend(v27, "shape");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "concaveCorner");

      if (!v30)
        goto LABEL_46;
      objc_msgSend(v10, "lastObject");
      v28 = objc_claimAutoreleasedReturnValue();
    }
    v31 = (void *)v28;

    v27 = v31;
LABEL_46:
    objc_msgSend(v27, "overrideDisplayString");
    v32 = objc_claimAutoreleasedReturnValue();
    if ((__CFString *)v32 == v24)
    {

    }
    else
    {
      v33 = (void *)v32;
      objc_msgSend(v27, "overrideDisplayString");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "isEqualToString:", v24);

      if ((v35 & 1) == 0)
      {
        objc_msgSend(v27, "setOverrideDisplayString:", v24);
        -[UIKeyboardLayoutStar viewForKey:](self, "viewForKey:", v27);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (v36)
        {
          -[UIKeyboardLayoutStar setState:forKey:](self, "setState:forKey:", -[UIKeyboardLayoutStar stateForKey:](self, "stateForKey:", v27), v27);
        }
        else
        {
          objc_msgSend(v27, "frame");
          -[UIView setNeedsDisplayInRect:](self, "setNeedsDisplayInRect:");
        }

        if (CFSTR("_keyid_return_") == v7)
          -[UIKeyboardLayoutStar updateTransitionWithFlags:](self, "updateTransitionWithFlags:", 5);
      }
    }

    goto LABEL_55;
  }
LABEL_56:

}

- (BOOL)isAlphabeticPlane
{
  return -[UIKBTree BOOLForProperty:](self->_keyplane, "BOOLForProperty:", CFSTR("is-alphabetic-plane"));
}

- (void)updateLocalizedKeys:(BOOL)a3
{
  _BOOL8 v3;
  UIKBTree *keyplane;

  if (self->_keyplaneName)
  {
    v3 = a3;
    keyplane = self->_keyplane;
    if (keyplane)
      -[UIKeyboardLayoutStar updateLocalizedKeysForKeyplane:updateAllKeyplanes:](self, "updateLocalizedKeysForKeyplane:updateAllKeyplanes:", keyplane, v3);
  }
}

- (BOOL)isShiftKeyBeingHeld
{
  return self->_holdingShift && self->super._shiftKeyTouchUUID != 0;
}

- (BOOL)usesAutoShift
{
  return -[UIKBTree BOOLForProperty:](self->_keyplane, "BOOLForProperty:", CFSTR("autoshift"));
}

- (void)setMultitapReverseKeyState
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  UIKeyboardLayoutStar *v7;
  id v8;

  -[UIKBTree firstCachedKeyWithName:](self->_keyplane, "firstCachedKeyWithName:", CFSTR("Multitap-Reverse-Key"));
  v4 = objc_claimAutoreleasedReturnValue();
  -[UIKBTree firstCachedKeyWithName:](self->_keyplane, "firstCachedKeyWithName:", CFSTR("Multitap-Forward-Key"));
  v3 = objc_claimAutoreleasedReturnValue();
  if (v4 | v3)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __50__UIKeyboardLayoutStar_setMultitapReverseKeyState__block_invoke;
    v5[3] = &unk_1E16B47A8;
    v6 = (id)v4;
    v7 = self;
    v8 = (id)v3;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v5);

  }
}

- (void)setAutoshift:(BOOL)a3
{
  if (!self->_settingShift)
  {
    self->_settingShift = 1;
    self->_autoshift = a3;
    -[UIKeyboardLayoutStar updateShiftKeyState](self, "updateShiftKeyState");
    self->_settingShift = 0;
  }
}

- (CGSize)sizeForKeyplane:(id)a3
{
  id v4;
  TUIKeyplaneView *liveKeyplaneView;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  CGSize result;

  v4 = a3;
  if (-[UIKeyboardLayoutStar useCrescendoLayout](self, "useCrescendoLayout")
    && (liveKeyplaneView = self->_liveKeyplaneView) != 0)
  {
    -[TUIKeyplaneView bounds](liveKeyplaneView, "bounds");
    v7 = v6;
    v9 = v8;
  }
  else
  {
    if (!_UIApplicationIsStickerPickerService())
      goto LABEL_7;
    -[UIView superview](self, "superview");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!v10)
      goto LABEL_7;
    v11 = (void *)v10;
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "inputDelegateManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "keyInputDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      -[UIView superview](self, "superview");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "bounds");
      v7 = v32;
      v9 = v33;

    }
    else
    {
LABEL_7:
      UIKeyboardGetCurrentInputMode();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      UIKeyboardGetDerivedKeyboard(v15, self->super._screenTraits, -[UITextInputTraits keyboardType](self->super._inputTraits, "keyboardType"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "subtrees");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "count");

      if (v18)
      {
        objc_msgSend(v4, "frame");
        v7 = v19;
        v9 = v20;
        if (-[UIKeyboardLayoutStar currentHandBias](self, "currentHandBias"))
        {
          -[UIKBScreenTraits keyboardWidth](self->super._screenTraits, "keyboardWidth");
          v7 = v21;
        }
        else if (!+[UIKeyboard resizable](UIKeyboard, "resizable") && v16)
        {
          objc_msgSend(v16, "keyboardSize");
          if (v27 != -1.0)
          {
            objc_msgSend(v16, "keyboardSize");
            v7 = v28;
          }
          objc_msgSend(v16, "keyboardSize");
          if (v29 != -1.0
            && (-[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 1
             || -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 24
             || -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 25
             || -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 26
             || -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 23
             || -[UIKeyboardLayoutStar allKeyplanesHaveSameHeight](self, "allKeyplanesHaveSameHeight")))
          {
            objc_msgSend(v16, "keyboardSize");
            v9 = v30;
          }
        }
      }
      else
      {
        -[UIKeyboardLayout sizeDelegate](self, "sizeDelegate");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "defaultSizeForInterfaceOrientation:", -[UIKeyboardLayout orientation](self, "orientation"));
        v7 = v23;
        v9 = v24;

      }
    }
  }

  v25 = v7;
  v26 = v9;
  result.height = v26;
  result.width = v25;
  return result;
}

+ (Class)_subclassForScreenTraits:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  UIKeyboardComputeKeyboardIdiomFromScreenTraits(v4, objc_msgSend(v4, "idiom"), objc_msgSend(v4, "isSplit"));
  if (objc_msgSend(v4, "idiom") == 3
    && ((objc_msgSend(v4, "knobInput") & 1) != 0 || objc_msgSend(v4, "touchpadInput")))
  {
    objc_opt_class();
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = a1;
  }
  v6 = v5;

  return (Class)v6;
}

+ (CGSize)keyboardSizeForInputMode:(id)a3 screenTraits:(id)a4 keyboardType:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t);
  void *v35;
  id v36;
  id v37;
  CGSize result;

  v8 = a3;
  v9 = a4;
  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "preferencesActions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "inputModeSupportsCrescendo:", v8);

  if (v12)
  {
    objc_msgSend(getTUIKeyplaneViewClass(), "keyplaneSizeForLayout:screenTraits:keyboardType:", v8, v9, a5);
    v14 = v13;
    v16 = v15;
  }
  else
  {
    UIKeyboardGetKBStarName(v8, v9, a5, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "keyboardWithName:screenTraits:", v17, v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setIsFloating:", objc_msgSend(v9, "isFloating"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v18, "frame");
      v14 = v19;
      v16 = v20;
    }
    else
    {
      v21 = (double *)MEMORY[0x1E0C9D820];
      v32 = MEMORY[0x1E0C809B0];
      v33 = 3221225472;
      v34 = __75__UIKeyboardLayoutStar_keyboardSizeForInputMode_screenTraits_keyboardType___block_invoke;
      v35 = &unk_1E16B1B50;
      v22 = v17;
      v36 = v22;
      v23 = v18;
      v37 = v23;
      if (keyboardSizeForInputMode_screenTraits_keyboardType__once_0 != -1)
      {
        dispatch_once(&keyboardSizeForInputMode_screenTraits_keyboardType__once_0, &v32);
        v22 = v36;
        v23 = v37;
      }
      v14 = *v21;
      v16 = v21[1];

    }
    UIKeyboardGetDerivedKeyboard(v8, v9, a5);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v24)
    {
      objc_msgSend(v24, "keyboardSize");
      if (v26 != -1.0)
      {
        objc_msgSend(v25, "keyboardSize");
        v16 = v27;
      }
      objc_msgSend(v25, "keyboardSize", v32, v33, v34, v35);
      if (v28 != -1.0)
      {
        objc_msgSend(v25, "keyboardSize");
        v14 = v29;
      }
    }

  }
  v30 = v14;
  v31 = v16;
  result.height = v31;
  result.width = v30;
  return result;
}

+ (id)keyboardWithName:(id)a3 screenTraits:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = (void *)MEMORY[0x186DC9484]();
    objc_msgSend(a1, "keyboardFromFactoryWithName:screenTraits:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "hasSuffix:", CFSTR("PasscodePad"))
      && objc_msgSend(v6, "hasPrefix:", CFSTR("Wildcat-")))
    {
      objc_msgSend(a1, "keyboardFromFactoryWithName:screenTraits:", CFSTR("iPhone-Portrait-NumberPad"), v7);
      v10 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v10;
    }
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __54__UIKeyboardLayoutStar_keyboardWithName_screenTraits___block_invoke;
    v14[3] = &unk_1E16D4000;
    v16 = a1;
    v15 = v7;
    v11 = _Block_copy(v14);
    v12 = v11;
    if (!v9)
    {
      (*((void (**)(void *, id))v11 + 2))(v11, v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_autoreleasePoolPop(v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)keyboardFromFactoryWithName:(id)a3 screenTraits:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(v6, "screen");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKBGraphCache graphCacheForScreen:](UIKBGraphCache, "graphCacheForScreen:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "graphCache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v7, "idiom"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "hasPrefix:", CFSTR("Dynamic")))
    {
      objc_msgSend(v13, "stringByAppendingString:", CFSTR("_Dynamic"));
      v14 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v14;
    }
    objc_msgSend(v10, "objectForKey:", v13);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v10, "setObject:forKey:", v15, v13);
    }
    v22 = 0;
    v23 = &v22;
    v24 = 0x2050000000;
    v16 = (void *)getTUIKeyboardLayoutFactoryClass_softClass;
    v25 = getTUIKeyboardLayoutFactoryClass_softClass;
    if (!getTUIKeyboardLayoutFactoryClass_softClass)
    {
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __getTUIKeyboardLayoutFactoryClass_block_invoke_1;
      v21[3] = &unk_1E16B14C0;
      v21[4] = &v22;
      __getTUIKeyboardLayoutFactoryClass_block_invoke_1((uint64_t)v21);
      v16 = (void *)v23[3];
    }
    v17 = objc_retainAutorelease(v16);
    _Block_object_dispose(&v22, 8);
    objc_msgSend(v17, "sharedKeyboardFactory");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "keyboardWithName:inCache:", v5, v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (NSString)keyplaneName
{
  return self->_keyplaneName;
}

- (void)updateAllKeyStates
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id obj;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if (-[UIKBTree dynamicLayout](self->_keyboard, "dynamicLayout"))
  {
    -[UIKBTree subtreeWithType:](self->_keyplane, "subtreeWithType:", 3);
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(obj, "keys");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v38;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v38 != v6)
            objc_enumerationMutation(v3);
          -[UIKeyboardLayoutStar updateStateForKey:](self, "updateStateForKey:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v7++));
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
      }
      while (v5);
    }

  }
  else
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    -[UIKBTree subtrees](self->_keyplane, "subtrees");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
    if (v24)
    {
      v23 = *(_QWORD *)v34;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v34 != v23)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v8);
          v29 = 0u;
          v30 = 0u;
          v31 = 0u;
          v32 = 0u;
          objc_msgSend(v9, "keySet");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "subtrees");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v30;
            do
            {
              v15 = 0;
              do
              {
                if (*(_QWORD *)v30 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v15);
                v25 = 0u;
                v26 = 0u;
                v27 = 0u;
                v28 = 0u;
                objc_msgSend(v16, "subtrees");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
                if (v18)
                {
                  v19 = v18;
                  v20 = *(_QWORD *)v26;
                  do
                  {
                    v21 = 0;
                    do
                    {
                      if (*(_QWORD *)v26 != v20)
                        objc_enumerationMutation(v17);
                      -[UIKeyboardLayoutStar updateStateForKey:](self, "updateStateForKey:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v21++));
                    }
                    while (v19 != v21);
                    v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
                  }
                  while (v19);
                }

                ++v15;
              }
              while (v15 != v13);
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
            }
            while (v13);
          }

          ++v8;
        }
        while (v8 != v24);
        v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
      }
      while (v24);
    }
  }

}

void __82__UIKeyboardLayoutStar_UIKeyboardLayoutJapanese50OnFlick__handleDismissFlickView___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1120))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v5 = WeakRetained;
    if (WeakRetained)
      objc_msgSend(WeakRetained, "handleDismissFlickView");

    v3 = v6;
  }
  objc_msgSend(v3, "returnExecutionToParent");

}

- (void)handleDismissFlickView
{
  NSTimer *flickPopuptimer;
  UIView *flickPopupView;

  -[NSTimer invalidate](self->_flickPopuptimer, "invalidate");
  flickPopuptimer = self->_flickPopuptimer;
  self->_flickPopuptimer = 0;

  -[UIView removeFromSuperview](self->_flickPopupView, "removeFromSuperview");
  flickPopupView = self->_flickPopupView;
  self->_flickPopupView = 0;

}

- (BOOL)isKanaPlane
{
  return -[UIKBTree isKanaPlane](self->_keyplane, "isKanaPlane");
}

- (BOOL)hasAccentKey
{
  void *v2;
  BOOL v3;

  -[UIKBTree cachedKeysByKeyName:](self->_keyplane, "cachedKeysByKeyName:", CFSTR("Latin-Accents"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)diacriticForwardCompose
{
  return -[UIKBTree BOOLForProperty:](self->_keyplane, "BOOLForProperty:", CFSTR("diacritic-forward-compose"));
}

- (BOOL)canMultitap
{
  void *v3;
  BOOL v4;
  void *v5;

  -[UIKeyboardLayoutStar multitapCompleteKeys](self, "multitapCompleteKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = 1;
  }
  else
  {
    -[UIKeyboardLayoutStar multitapForwardKeys](self, "multitapForwardKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
      v4 = 1;
    else
      v4 = -[UIKBTree supportsMultitap](self->_keyplane, "supportsMultitap");

  }
  return v4;
}

- (id)multitapForwardKeys
{
  return -[UIKBTree cachedKeysByKeyName:](self->_keyplane, "cachedKeysByKeyName:", CFSTR("Multitap-Forward-Key"));
}

- (id)multitapCompleteKeys
{
  return -[UIKBTree cachedKeysByKeyName:](self->_keyplane, "cachedKeysByKeyName:", CFSTR("Multitap-Complete-Key"));
}

- (void)updateLayoutTags
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  BOOL v11;
  _BOOL4 v12;
  int *v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  UIKBTree *keyboard;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  char v33;
  _QWORD v34[5];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[5];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if (!self->_isTrackpadMode)
  {
    -[UIKeyboardLayoutStar layoutTag](self, "layoutTag");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    -[UIKBTree cachedKeysByKeyName:](self->_keyplane, "cachedKeysByKeyName:", CFSTR("Adaptive-Key"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    if (v5)
    {
      v6 = v5;
      v33 = 0;
      v7 = *(_QWORD *)v41;
      while (1)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v41 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          if (objc_msgSend(v9, "hasLayoutTag:", v3))
          {
            objc_msgSend(v9, "layoutTag");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v10, "isEqualToString:", v3))
            {
              v11 = -[UIKeyboardLayoutStar shouldMergeKey:](self, "shouldMergeKey:", v9);

              if (!v11)
              {
LABEL_15:
                v39[0] = MEMORY[0x1E0C809B0];
                v39[1] = 3221225472;
                v39[2] = __40__UIKeyboardLayoutStar_updateLayoutTags__block_invoke;
                v39[3] = &unk_1E16D4048;
                v39[4] = self;
                objc_msgSend(v9, "setLayoutTag:passingKeyTest:", v3, v39);
                objc_msgSend(v9, "setVisible:", 1);
                v14 = -[UIKeyboardLayoutStar stateForKey:](self, "stateForKey:", v9);
                if (v14)
                  v15 = v14;
                else
                  v15 = 2;
                -[UIKeyboardLayoutStar setState:forKey:](self, "setState:forKey:", v15, v9);
                continue;
              }
            }
            else
            {

            }
            v12 = -[UIKeyboardLayoutStar useCrescendoLayout](self, "useCrescendoLayout");
            v13 = &OBJC_IVAR___UIKeyboardLayoutStar__keyplaneView;
            if (v12)
              v13 = &OBJC_IVAR___UIKeyboardLayoutStar__liveKeyplaneView;
            objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + *v13), "deactivateAdaptiveKey:", v9);
            v33 = 1;
            goto LABEL_15;
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
        if (!v6)
          goto LABEL_23;
      }
    }
    v33 = 0;
LABEL_23:

    -[UIKBTree gestureKeyplaneName](self->_keyplane, "gestureKeyplaneName");
    v16 = objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = (void *)v16;
      +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "preferencesActions");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "BOOLForPreferenceKey:", CFSTR("GesturesEnabled"));

      if (v20)
      {
        keyboard = self->_keyboard;
        -[UIKBTree gestureKeyplaneName](self->_keyplane, "gestureKeyplaneName");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIKBTree subtreeWithName:](keyboard, "subtreeWithName:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        v37 = 0u;
        v38 = 0u;
        v35 = 0u;
        v36 = 0u;
        v32 = v23;
        objc_msgSend(v23, "cachedKeysByKeyName:", CFSTR("Adaptive-Key"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
        if (v25)
        {
          v26 = v25;
          v27 = *(_QWORD *)v36;
          do
          {
            for (j = 0; j != v26; ++j)
            {
              if (*(_QWORD *)v36 != v27)
                objc_enumerationMutation(v24);
              v29 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
              if (objc_msgSend(v29, "hasLayoutTag:", v3))
              {
                objc_msgSend(v29, "layoutTag");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                v31 = objc_msgSend(v30, "isEqualToString:", v3);

                if ((v31 & 1) == 0)
                {
                  v34[0] = MEMORY[0x1E0C809B0];
                  v34[1] = 3221225472;
                  v34[2] = __40__UIKeyboardLayoutStar_updateLayoutTags__block_invoke_2;
                  v34[3] = &unk_1E16D4048;
                  v34[4] = self;
                  objc_msgSend(v29, "setLayoutTag:passingKeyTest:", v3, v34);
                  v33 = 1;
                }
              }
            }
            v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
          }
          while (v26);
        }

      }
    }
    if ((v33 & 1) != 0)
      -[UIKBTree updateFlickKeycapOnKeys](self->_keyplane, "updateFlickKeycapOnKeys");

  }
}

- (NSString)layoutTag
{
  return self->_layoutTag;
}

- (void)setKeyplaneName:(id)a3
{
  NSString *v4;
  void *v5;
  void *v6;
  int v7;
  TUIKeyplaneView *liveKeyplaneView;
  UIKBTree **p_keyplane;
  _BOOL4 v10;
  NSString *keyplaneName;
  UITextInputTraits *inputTraits;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  void *v41;
  void *v42;
  UIKBTree *keyboard;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t j;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  unsigned int v63;
  UIKBTree *v64;
  void *v65;
  void *v66;
  void *v67;
  unsigned int v68;
  UIKBTree *v69;
  void *v70;
  id v71;
  void *v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  void *v79;
  double v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  double v85;
  double v86;
  double v87;
  double v88;
  NSString *v89;
  NSString *v90;
  void *v91;
  void *v92;
  UIKBKeyplaneView *v93;
  NSString *v94;
  UIKBTree *v95;
  UIKBBackgroundView *backgroundView;
  _BOOL4 v97;
  UIKBTree *v98;
  void *v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  void *v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  void *v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  void *v126;
  double v127;
  double v128;
  void *v129;
  double v130;
  double v131;
  double v132;
  double v133;
  void *v134;
  double v135;
  double v136;
  double v137;
  int64_t v138;
  void *v139;
  void *v140;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  void *v146;
  id v147;
  void *v148;
  void *v149;
  double v150;
  double *v151;
  _BOOL4 v152;
  double v153;
  double v154;
  double v155;
  double v156;
  double v157;
  double v158;
  double v159;
  double v160;
  double v161;
  double v162;
  double v163;
  double v164;
  double v165;
  double v166;
  UIKBTree *v167;
  void *v168;
  double v169;
  UIKBTree *v170;
  double v171;
  double v172;
  double v173;
  uint64_t v174;
  void *v175;
  void *v176;
  void *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t k;
  void *v182;
  void *v183;
  void *v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t m;
  double v189;
  double v190;
  double v191;
  uint64_t v192;
  UIKeyboardLayoutStar *v193;
  double v194;
  double v195;
  void *v196;
  uint64_t v197;
  void *v198;
  uint64_t v199;
  void *v200;
  void *v201;
  void *v202;
  id *v203;
  void *v204;
  uint64_t v205;
  void *v206;
  uint64_t v207;
  void *v208;
  void *v209;
  char v210;
  void *v211;
  void *v212;
  uint64_t v213;
  id v214;
  id v215;
  double v216;
  double v217;
  double v218;
  double v219;
  double v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  UIKBBackgroundView *v225;
  void *v226;
  void *v227;
  id *p_isa;
  void *v229;
  double v230;
  double v231;
  id *v232;
  void *v233;
  void *v234;
  void *v235;
  uint64_t v236;
  void *v237;
  id v238;
  void *v239;
  void *v240;
  void *v241;
  UIKBKeyplaneView *v242;
  id v243;
  void *v244;
  double v245;
  uint64_t v246;
  char v247;
  int v248;
  unsigned int v249;
  unsigned int v250;
  void *v251;
  _BOOL4 v252;
  _BOOL4 v253;
  _BOOL4 v254;
  void *v255;
  UIKBKeyplaneView **p_keyplaneView;
  void *v257;
  void *v258;
  NSString *v259;
  NSString *v260;
  UIKBTree **v261;
  id obj;
  uint64_t v263;
  UIKeyboardLayoutStar *v264;
  uint64_t v265;
  uint64_t v266;
  void *v267;
  id v268;
  id v269;
  __int128 v270;
  __int128 v271;
  __int128 v272;
  __int128 v273;
  __int128 v274;
  __int128 v275;
  __int128 v276;
  __int128 v277;
  __int128 v278;
  __int128 v279;
  __int128 v280;
  __int128 v281;
  _QWORD v282[5];
  __int128 v283;
  __int128 v284;
  __int128 v285;
  __int128 v286;
  __int128 v287;
  __int128 v288;
  __int128 v289;
  __int128 v290;
  _BYTE v291[128];
  _BYTE v292[128];
  _BYTE v293[128];
  _BYTE v294[128];
  _BYTE v295[128];
  uint64_t v296;

  v296 = *MEMORY[0x1E0C80C00];
  v4 = (NSString *)a3;
  if (!self->_isTrackpadMode)
  {
    if (!self->_isContinuousPathUnderway)
      -[UIKeyboardLayoutStar transitionToPunctuationKeysVisible:](self, "transitionToPunctuationKeysVisible:", 0);
    if (-[UIKBTree dynamicLayout](self->_keyboard, "dynamicLayout"))
    {
      +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "preferencesActions");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "crescendoEnabled");

      if (v7)
      {
        self->_layoutSupportsCrescendo = 1;
        -[UIKeyboardLayoutStar createLayoutFromName:](self, "createLayoutFromName:", v4);
        goto LABEL_209;
      }
    }
    self->_layoutSupportsCrescendo = 0;
    if (self->_liveKeyplaneView)
    {
      -[UIKeyboardLayoutStar flushKeyCache:](self, "flushKeyCache:", 0);
      -[TUIKeyplaneView removeFromSuperview](self->_liveKeyplaneView, "removeFromSuperview");
      liveKeyplaneView = self->_liveKeyplaneView;
      self->_liveKeyplaneView = 0;

      objc_msgSend(MEMORY[0x1E0D156E0], "deactivateConstraints:", self->_liveKeyplaneConstraints);
      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
    }
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v258 = (void *)objc_claimAutoreleasedReturnValue();
    v253 = -[UIKeyboardLayoutStar _allowPaddle](self, "_allowPaddle");
    +[_UIKeyboardUsageTracking showCharacterPreviewPreference:](_UIKeyboardUsageTracking, "showCharacterPreviewPreference:");
    if (self->_lastInputIsGestureKey)
    {
      +[_UIKeyboardUsageTracking panAlternateKeyFlickDownCount](_UIKeyboardUsageTracking, "panAlternateKeyFlickDownCount");
      self->_lastInputIsGestureKey = 0;
    }
    self->_dictationUsingServerManualEndpointing = 0;
    p_keyplane = &self->_keyplane;
    v10 = -[UIKBTree isFloating](self->_keyplane, "isFloating");
    if (v10 == -[UIKeyboardLayout isFloating](self, "isFloating"))
    {
      keyplaneName = self->_keyplaneName;
      if (keyplaneName == v4
        || v4
        && keyplaneName
        && -[NSString caseInsensitiveCompare:](keyplaneName, "caseInsensitiveCompare:", v4) == NSOrderedSame)
      {
        inputTraits = self->super._inputTraits;
        objc_msgSend(v258, "textInputTraits");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[UITextInputTraits publicTraitsMatchTraits:](inputTraits, "publicTraitsMatchTraits:", v13)
          && -[UIKeyboardLayoutStar canReuseKeyplaneView](self, "canReuseKeyplaneView")
          && -[UIKeyboardLayoutStar shouldAllowCurrentKeyplaneReload](self, "shouldAllowCurrentKeyplaneReload"))
        {
          -[UIView bounds](self, "bounds");
          v15 = v14;
          v17 = v16;
          -[UIView bounds](self->_keyplaneView, "bounds");
          v19 = v18;
          v21 = v20;

          if (v15 == v19 && v17 == v21)
          {
            objc_msgSend(v258, "setShouldSkipCandidateSelection:", -[UIKBTree shouldSkipCandidateSelection](*p_keyplane, "shouldSkipCandidateSelection"));
            objc_msgSend(v258, "updateReturnKey:", 0);
            -[UIKeyboardLayoutStar updateKeyCentroids](self, "updateKeyCentroids");
            -[UIKBKeyplaneView factory](self->_keyplaneView, "factory");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "setAllowsPaddles:", v253);

            v23 = -[UIKeyboardLayoutStar keyplaneShiftState](self, "keyplaneShiftState");
            -[UIKBKeyplaneView factory](self->_keyplaneView, "factory");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "renderingContext");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "setShiftState:", v23);

            UIKeyboardGetCurrentInputMode();
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = UIKeyboardUIPreferStringOverImageForInputMode(v26);
            -[UIKBKeyplaneView factory](self->_keyplaneView, "factory");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "setPreferStringKeycapOverImage:", v27);

            -[UIView superview](self, "superview");
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            if (v29)
            {
              -[UIView bounds](self, "bounds");
              +[UIKBKeyplaneChangeContext keyplaneChangeContextWithSize:](UIKBKeyplaneChangeContext, "keyplaneChangeContextWithSize:", v30, v31);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              -[UIKeyboardLayoutStar _didChangeKeyplaneWithContext:](self, "_didChangeKeyplaneWithContext:", v32);

            }
            -[UIKeyboardLayout updateTouchProcessingForKeyplaneChange](self, "updateTouchProcessingForKeyplaneChange");
            v33 = v258;
            goto LABEL_208;
          }
        }
        else
        {

        }
      }
    }
    -[UIKBResizingKeyplaneCoordinator stopResizing](self->_resizingKeyplaneCoordinator, "stopResizing");
    self->_externalDictationAndInternationalKeys = -[UIKeyboardLayoutStar showsGlobeAndDictationKeysInDockView](self, "showsGlobeAndDictationKeysInDockView");
    -[UIKeyboardLayoutStar candidateList](self, "candidateList");
    v251 = (void *)objc_claimAutoreleasedReturnValue();

    v252 = -[UIKeyboardLayoutStar isShiftKeyPlaneChooser](self, "isShiftKeyPlaneChooser");
    v254 = -[NSString hasSuffix:](self->_keyplaneName, "hasSuffix:", CFSTR("split"));
    HIDWORD(v246) = -[UIKBScreenTraits isSplit](self->super._screenTraits, "isSplit");
    self->_inputTraitsPreventInitialReuse = 0;
    -[UIKeyboardLayoutStar keyViewAnimator](self, "keyViewAnimator");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setDisabled:", 1);

    -[UIKeyboardLayoutStar deactivateActiveKeysClearingTouchInfo:clearingDimming:](self, "deactivateActiveKeysClearingTouchInfo:clearingDimming:", 0, 1);
    p_keyplaneView = &self->_keyplaneView;
    -[UIKBKeyplaneView purgeKeyViews](self->_keyplaneView, "purgeKeyViews");
    v289 = 0u;
    v290 = 0u;
    v287 = 0u;
    v288 = 0u;
    -[UIKBTree keys](*p_keyplane, "keys");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v287, v295, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v288;
      do
      {
        for (i = 0; i != v37; ++i)
        {
          if (*(_QWORD *)v288 != v38)
            objc_enumerationMutation(v35);
          v40 = *(void **)(*((_QWORD *)&v287 + 1) + 8 * i);
          objc_msgSend(v40, "setGestureKey:", 0);
          if (objc_msgSend(v40, "displayTypeHint") == 10
            && objc_msgSend(v40, "displayType") != 7)
          {
            objc_msgSend(v40, "setSecondaryDisplayStrings:", 0);
            objc_msgSend(v40, "setSecondaryRepresentedStrings:", 0);
          }
          if (objc_msgSend(v40, "displayType") == 21)
            objc_msgSend(v40, "setVisible:", 1);
        }
        v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v287, v295, 16);
      }
      while (v37);
    }

    -[UIKeyboardLayoutStar defaultNameForKeyplaneName:](self, "defaultNameForKeyplaneName:", v4);
    v255 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBTree subtreeWithName:](self->_keyboard, "subtreeWithName:");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "gestureKeyplaneName");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    v264 = self;
    v261 = &self->_keyplane;
    if (v42)
    {
      v259 = v4;
      keyboard = self->_keyboard;
      v44 = v41;
      objc_msgSend(v41, "gestureKeyplaneName");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKBTree subtreeWithName:](keyboard, "subtreeWithName:", v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIKeyboardLayoutStar setCurrencyKeysForCurrentLocaleOnKeyplane:](self, "setCurrencyKeysForCurrentLocaleOnKeyplane:", v46);
      -[UIKeyboardLayoutStar setPercentSignKeysForCurrentLocaleOnKeyplane:](self, "setPercentSignKeysForCurrentLocaleOnKeyplane:", v46);
      -[UIKeyboardLayoutStar layoutTag](self, "layoutTag");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v283 = 0u;
      v284 = 0u;
      v285 = 0u;
      v286 = 0u;
      objc_msgSend(v46, "cachedKeysByKeyName:", CFSTR("Adaptive-Key"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v283, v294, 16);
      if (v49)
      {
        v50 = v49;
        v51 = *(_QWORD *)v284;
        v52 = MEMORY[0x1E0C809B0];
        do
        {
          for (j = 0; j != v50; ++j)
          {
            if (*(_QWORD *)v284 != v51)
              objc_enumerationMutation(v48);
            v54 = *(void **)(*((_QWORD *)&v283 + 1) + 8 * j);
            v282[0] = v52;
            v282[1] = 3221225472;
            v282[2] = __40__UIKeyboardLayoutStar_setKeyplaneName___block_invoke;
            v282[3] = &unk_1E16D4048;
            v282[4] = self;
            objc_msgSend(v54, "setLayoutTag:passingKeyTest:", v47, v282);
          }
          v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v283, v294, 16);
        }
        while (v50);
      }

      -[UIKeyboardLayoutStar updateAutolocalizedKeysForKeyplane:](self, "updateAutolocalizedKeysForKeyplane:", v46);
      objc_msgSend(v46, "subtrees");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "firstObject");
      v56 = (void *)objc_claimAutoreleasedReturnValue();

      v41 = v44;
      objc_msgSend(v44, "subtrees");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "firstObject");
      v58 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v58, "setCachedGestureLayout:", v56);
      if (objc_msgSend(v44, "intForProperty:", CFSTR("shift-rendering")) != 31)
      {
        objc_msgSend(v44, "subtrees");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v59, "count") <= 1)
        {

          v58 = 0;
        }
        else
        {
          objc_msgSend(v44, "subtrees");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "objectAtIndexedSubscript:", 1);
          v61 = (id)objc_claimAutoreleasedReturnValue();

          if (v61)
          {
            objc_msgSend(v61, "setCachedGestureLayout:", v56);
            v58 = v61;
          }
          else
          {
            v58 = 0;
          }
          v4 = v259;
          self = v264;
        }
      }

      p_keyplane = v261;
    }
    -[UIKBTree firstCachedKeyWithName:](*p_keyplane, "firstCachedKeyWithName:", CFSTR("Shift-Key"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend(v62, "behavesAsShiftKey");

    v64 = self->_keyboard;
    -[UIKBTree shiftAlternateKeyplaneName](*p_keyplane, "shiftAlternateKeyplaneName");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBTree subtreeWithName:](v64, "subtreeWithName:", v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v41, "firstCachedKeyWithName:", CFSTR("Shift-Key"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v65) = objc_msgSend(v67, "behavesAsShiftKey");

    if ((_DWORD)v65)
    {
      if (v66 == v41)
        v68 = v63;
      else
        v68 = 0;
    }
    else
    {
      v68 = 0;
    }
    -[UIKBTree clearManualAddedKey](*p_keyplane, "clearManualAddedKey");
    self->_splitTransitionNeedsRebuild = 0;
    if (!v4
      || !-[UIKBScreenTraits supportsSplit](self->super._screenTraits, "supportsSplit")
      || -[UIKBTree visualStyle](self->_keyboard, "visualStyle") - 101 > 8)
    {
LABEL_73:
      if (!v41)
      {
        -[UIKeyboardLayoutStar keyViewAnimator](self, "keyViewAnimator");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "setDisabled:", 0);

        -[UIKBKeyplaneView removeFromSuperview](*p_keyplaneView, "removeFromSuperview");
        v93 = *p_keyplaneView;
        *p_keyplaneView = 0;

        v94 = self->_keyplaneName;
        self->_keyplaneName = 0;

        v95 = *p_keyplane;
        *p_keyplane = 0;

        -[UIView removeFromSuperview](self->_backgroundView, "removeFromSuperview");
        backgroundView = self->_backgroundView;
        self->_backgroundView = 0;

        -[UIKeyboardLayout updateTouchProcessingForKeyplaneChange](self, "updateTouchProcessingForKeyplaneChange");
        v33 = v258;
LABEL_207:

LABEL_208:
        goto LABEL_209;
      }
      -[UIKBTree frameForKeylayoutName:](*p_keyplane, "frameForKeylayoutName:");
      v86 = v85;
      -[UIKBTree frameForKeylayoutName:](*p_keyplane, "frameForKeylayoutName:");
      v88 = v87;
      -[UIKBTree clearManualAddedKey](*p_keyplane, "clearManualAddedKey");
      v89 = (NSString *)-[NSString copy](v4, "copy");
      v90 = self->_keyplaneName;
      self->_keyplaneName = v89;

      objc_storeStrong((id *)p_keyplane, v41);
      objc_msgSend(v41, "setVisualStyle:", -[UIKBTree visualStyle](self->_keyboard, "visualStyle"));
      objc_msgSend(v41, "cacheNativeIdiomIfNecessaryForScreenTraits:", self->super._screenTraits);
      -[UIKBTree layoutName](self->_keyboard, "layoutName");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "precacheLayoutName:", v91);

      v250 = v68;
      if (-[UIKeyboardLayoutStar canReuseKeyplaneView](self, "canReuseKeyplaneView"))
        LODWORD(v246) = -[UIKBKeyplaneView validForKeyplane:withVisualStyle:](*p_keyplaneView, "validForKeyplane:withVisualStyle:", *p_keyplane, -[UIKBTree visualStyle](self->_keyboard, "visualStyle"));
      else
        LODWORD(v246) = 0;
      v257 = v41;
      -[UIKeyboardLayoutStar rollbackKeyplaneTransformations](self, "rollbackKeyplaneTransformations", v246);
      if (-[UIKBScreenTraits isInPopover](self->super._screenTraits, "isInPopover"))
        v97 = -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 0;
      else
        v97 = 0;
      v260 = v4;
      if (-[UIKeyboardLayout isFloating](self, "isFloating"))
        goto LABEL_82;
      if (-[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 3)
      {
        if (!v97)
        {
LABEL_102:
          -[UIKBScreenTraits bounds](self->super._screenTraits, "bounds");
          v137 = v136;
          v138 = -[UIKeyboardLayout orientation](self, "orientation");
          +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
          v139 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v139, "currentInputMode");
          v140 = (void *)objc_claimAutoreleasedReturnValue();
          +[UIKeyboardImpl deviceSpecificPaddingForInterfaceOrientation:inputMode:](UIKeyboardImpl, "deviceSpecificPaddingForInterfaceOrientation:inputMode:", v138, v140);
          v142 = v141;
          v144 = v143;

          v145 = v137 - (v142 + v144);
          if (-[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 3)
          {
            -[UIView window](self, "window");
            v146 = (void *)objc_claimAutoreleasedReturnValue();
            if (v146)
            {
              v147 = v146;

            }
            else
            {
              +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
              v148 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v148, "window");
              v147 = (id)objc_claimAutoreleasedReturnValue();

              if (!v147)
                goto LABEL_108;
            }
            objc_msgSend(v147, "safeAreaLayoutGuide");
            v149 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v149, "layoutFrame");
            v145 = v150;

          }
LABEL_108:
          v151 = (double *)MEMORY[0x1E0C9D538];
          if (-[UIKeyboardLayoutStar currentHandBias](self, "currentHandBias"))
          {
            v152 = -[UIKBTree containsKeyThatIgnoresHandBias](*p_keyplane, "containsKeyThatIgnoresHandBias");
            -[UIKeyboardLayoutStar biasedKeyboardWidthRatio](self, "biasedKeyboardWidthRatio");
            v154 = v145 * v153;
            if (-[UIKeyboardLayoutStar currentHandBias](self, "currentHandBias") == 1)
              v155 = v145 - v154;
            else
              v155 = 0.0;
            if (!v152)
              v145 = v154;
          }
          else
          {
            v152 = 0;
            v155 = *v151;
            v154 = 0.0;
          }
          -[UIKBTree frame](self->_keyboard, "frame");
          v157 = v145 / v156;
          -[UIKBTree frame](self->_keyboard, "frame");
          v159 = v158;
          if (-[UIKeyboardLayout hasPreferredHeight](self, "hasPreferredHeight"))
          {
            v160 = v157 * v159;
            -[UIKeyboardLayout preferredHeight](self, "preferredHeight");
            if (v160 - v161 > 5.0)
            {
              -[UIKeyboardLayout preferredHeight](self, "preferredHeight");
              v157 = v157 * (v162 / v160);
            }
          }
          if (-[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 3)
          {
            v163 = 1.0;
            if (v157 >= 1.0)
            {
              v164 = 1.0;
              if (!-[UIKBScreenTraits knobInput](self->super._screenTraits, "knobInput"))
                goto LABEL_127;
            }
            v164 = 1.0;
          }
          else
          {
            if (!-[UIKeyboardLayoutStar stretchKeyboardToFit](self, "stretchKeyboardToFit"))
            {
              v163 = v157;
              v164 = v157;
              goto LABEL_127;
            }
            -[UIKeyboardLayoutStar stretchFactorHeight](self, "stretchFactorHeight");
            v164 = v165;
          }
          v163 = v157;
LABEL_127:
          v166 = v151[1];
          v167 = *p_keyplane;
          -[UIKBScreenTraits screen](self->super._screenTraits, "screen");
          v168 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v168, "scale");
          if (v152)
          {
            -[UIKBTree elaborateLayoutWithSize:scale:](v167, "elaborateLayoutWithSize:scale:", v163, v164, v169);

            -[UIKBTree frame](self->_keyboard, "frame");
            v170 = *p_keyplane;
            v172 = v154 / v171;
            -[UIKBScreenTraits screen](self->super._screenTraits, "screen");
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v99, "scale");
            -[UIKBTree elaborateLayoutWithSize:scale:origin:](v170, "elaborateLayoutWithSize:scale:origin:", v172, v164, v173, v155, v166);
            goto LABEL_129;
          }
          -[UIKBTree elaborateLayoutWithSize:scale:origin:](v167, "elaborateLayoutWithSize:scale:origin:", v163, v164, v169, v155, v166);

LABEL_131:
          -[UIKeyboardLayoutStar _setBiasEscapeButtonVisible:](self, "_setBiasEscapeButtonVisible:", -[UIKeyboardLayoutStar currentHandBias](self, "currentHandBias") != 0);
          v280 = 0u;
          v281 = 0u;
          v278 = 0u;
          v279 = 0u;
          -[UIKBTree subtrees](*p_keyplane, "subtrees");
          obj = (id)objc_claimAutoreleasedReturnValue();
          v265 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v278, v293, 16);
          if (v265)
          {
            v263 = *(_QWORD *)v279;
            do
            {
              v174 = 0;
              do
              {
                if (*(_QWORD *)v279 != v263)
                  objc_enumerationMutation(obj);
                v266 = v174;
                v175 = *(void **)(*((_QWORD *)&v278 + 1) + 8 * v174);
                v274 = 0u;
                v275 = 0u;
                v276 = 0u;
                v277 = 0u;
                objc_msgSend(v175, "keySet");
                v176 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v176, "subtrees");
                v177 = (void *)objc_claimAutoreleasedReturnValue();

                v268 = v177;
                v178 = objc_msgSend(v177, "countByEnumeratingWithState:objects:count:", &v274, v292, 16);
                if (v178)
                {
                  v179 = v178;
                  v180 = *(_QWORD *)v275;
                  do
                  {
                    for (k = 0; k != v179; ++k)
                    {
                      if (*(_QWORD *)v275 != v180)
                        objc_enumerationMutation(v268);
                      v182 = *(void **)(*((_QWORD *)&v274 + 1) + 8 * k);
                      objc_msgSend(v182, "numberForProperty:", CFSTR("KBdisplayRowHint"));
                      v183 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v183)
                      {
                        v272 = 0u;
                        v273 = 0u;
                        v270 = 0u;
                        v271 = 0u;
                        objc_msgSend(v182, "subtrees");
                        v184 = (void *)objc_claimAutoreleasedReturnValue();
                        v185 = objc_msgSend(v184, "countByEnumeratingWithState:objects:count:", &v270, v291, 16);
                        if (v185)
                        {
                          v186 = v185;
                          v187 = *(_QWORD *)v271;
                          do
                          {
                            for (m = 0; m != v186; ++m)
                            {
                              if (*(_QWORD *)v271 != v187)
                                objc_enumerationMutation(v184);
                              objc_msgSend(*(id *)(*((_QWORD *)&v270 + 1) + 8 * m), "setDisplayRowHint:", objc_msgSend(v183, "intValue"));
                            }
                            v186 = objc_msgSend(v184, "countByEnumeratingWithState:objects:count:", &v270, v291, 16);
                          }
                          while (v186);
                        }

                      }
                    }
                    v179 = objc_msgSend(v268, "countByEnumeratingWithState:objects:count:", &v274, v292, 16);
                  }
                  while (v179);
                }

                v174 = v266 + 1;
              }
              while (v266 + 1 != v265);
              v265 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v278, v293, 16);
            }
            while (v265);
          }

          -[UIKBTree frameForKeylayoutName:](*v261, "frameForKeylayoutName:", CFSTR("split-left"));
          v190 = v189;
          -[UIKBTree frameForKeylayoutName:](*v261, "frameForKeylayoutName:", CFSTR("split-right"));
          v192 = 1;
          if (v190 == v86)
          {
            v4 = v260;
            v193 = v264;
            v33 = v258;
            if (v191 == v88)
            {
              if (UIKeyboardDeviceSupportsSplit())
                v192 = UIKeyboardSupportsSplit() ^ 1;
              else
                v192 = 0;
            }
          }
          else
          {
            v4 = v260;
            v193 = v264;
            v33 = v258;
          }
          -[UIKeyboardLayoutStar _addResizeTransformationsIfNecessary](v193, "_addResizeTransformationsIfNecessary");
          -[UIKeyboardLayoutStar updateKeyboardForKeyplane:](v193, "updateKeyboardForKeyplane:", v257);
          -[UIView bounds](v193, "bounds");
          +[UIKBKeyplaneChangeContext keyplaneChangeContextWithSize:](UIKBKeyplaneChangeContext, "keyplaneChangeContextWithSize:", v194, v195);
          v196 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v196, "setSplitWidthsChanged:", v192);
          objc_msgSend(v196, "setUpdateAssistantView:", 1);
          v197 = (v193->_setKeyplaneViewCount + 1) % 100;
          v193->_setKeyplaneViewCount = v197;
          -[UIKeyboardLayoutStar _didChangeKeyplaneWithContext:](v193, "_didChangeKeyplaneWithContext:", v196);
          if (v197 != v193->_setKeyplaneViewCount)
          {
            -[UIKeyboardLayoutStar keyViewAnimator](v193, "keyViewAnimator");
            v198 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v198, "setDisabled:", 0);
LABEL_206:

            v41 = v257;
            goto LABEL_207;
          }
          -[UIKeyboardLayoutStar setKeyboardAppearance:](v193, "setKeyboardAppearance:", v193->_appearance);
          -[UIKeyboardLayoutStar cacheTokenForKeyplane:caseAlternates:](v193, "cacheTokenForKeyplane:caseAlternates:", *v261, 0);
          v198 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v198, "setTransformationIdentifiers:", v193->_keyplaneTransformations);
          -[UIKeyboardLayoutStar defaultKeyplaneForKeyplane:](v193, "defaultKeyplaneForKeyplane:", *v261);
          v199 = objc_claimAutoreleasedReturnValue();
          -[UIKeyboardLayoutStar cacheTokenForKeyplane:caseAlternates:](v193, "cacheTokenForKeyplane:caseAlternates:", v199, v250);
          v200 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIKeyboardLayoutStar renderConfig](v193, "renderConfig");
          v201 = (void *)objc_claimAutoreleasedReturnValue();
          +[UIKBRenderingContext renderingContextForRenderConfig:](UIKBRenderingContext, "renderingContextForRenderConfig:", v201);
          v202 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v202, "setShiftState:", -[UIKeyboardLayoutStar keyplaneShiftState](v193, "keyplaneShiftState"));
          objc_msgSend(v202, "setKeyboardType:", -[UITextInputTraits keyboardType](v193->super._inputTraits, "keyboardType"));
          objc_msgSend(v202, "setHandBias:", -[UIKeyboardLayoutStar currentHandBias](v193, "currentHandBias"));
          if (-[UIKeyboardLayout isFloating](v193, "isFloating"))
            objc_msgSend(v202, "setIsFloating:", 1);
          v203 = (id *)p_keyplaneView;
          if (-[UIKeyboardLayoutStar isDeveloperGestureKeybaord](v264, "isDeveloperGestureKeybaord")
            && _UIIsPrivateMainBundle())
          {
            +[UIKBRenderFactory lightweightFactoryForVisualStyle:renderingContext:](UIKBRenderFactory, "lightweightFactoryForVisualStyle:renderingContext:", -[UIKBTree visualStyling](*v261, "visualStyling"), v202);
            v204 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIKeyboardLayoutStar clearKeyAnnotationsIfNecessary](v264, "clearKeyAnnotationsIfNecessary");
            if (objc_msgSend(v204, "supportsInputTraits:forKeyplane:", v264->super._inputTraits, *v261))
            {
              objc_msgSend(v198, "annotateWithInt:", -[UITextInputTraits keyboardType](v264->super._inputTraits, "keyboardType"));
              objc_msgSend(v200, "annotateWithInt:", -[UITextInputTraits keyboardType](v264->super._inputTraits, "keyboardType"));
              -[UIKeyboardLayoutStar annotateKeysWithDeveloperPunctuation](v264, "annotateKeysWithDeveloperPunctuation");
            }

            v203 = (id *)p_keyplaneView;
          }
          v205 = -[UIKBScreenTraits idiom](v264->super._screenTraits, "idiom");
          if (v205 == 3)
            v205 = objc_msgSend(v198, "annotateWithBool:", UIKeyboardCarPlayIsRightHandDrive());
          if ((v247 & 1) == 0)
            v205 = objc_msgSend(*v203, "purgeKeyViews");
          v206 = (void *)MEMORY[0x186DC9484](v205);
          -[UIKeyboardLayoutStar mergeKeysIfNeeded](v264, "mergeKeysIfNeeded");
          -[UIKeyboardLayoutStar updateLocalizedKeys:](v264, "updateLocalizedKeys:", 0);
          -[UIKeyboardLayoutStar delegate](v264, "delegate");
          v207 = objc_claimAutoreleasedReturnValue();
          if (v207)
          {
            v208 = (void *)v207;
            -[UIKeyboardLayoutStar delegate](v264, "delegate");
            v209 = (void *)objc_claimAutoreleasedReturnValue();
            v210 = objc_opt_respondsToSelector();

            v203 = (id *)p_keyplaneView;
            if ((v210 & 1) != 0)
            {
              -[UIKeyboardLayoutStar delegate](v264, "delegate");
              v211 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v211, "keyboardLayout:didSwitchToKeyplane:", v264, *v261);

            }
          }
          objc_autoreleasePoolPop(v206);
          objc_msgSend(*v203, "removeFromSuperview");
          objc_msgSend(v198, "stringForSplitState:handBias:", -[UIKBTree isSplit](*v261, "isSplit"), -[UIKeyboardLayoutStar currentHandBias](v264, "currentHandBias"));
          v212 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIKeyboardLayoutStar cacheIdentifierForKeyplaneNamed:](v264, "cacheIdentifierForKeyplaneNamed:", v212);
          v213 = objc_claimAutoreleasedReturnValue();

          if (v213)
          {
            -[NSMutableDictionary objectForKey:](v264->_allKeyplaneViews, "objectForKey:", v213);
            v214 = (id)objc_claimAutoreleasedReturnValue();
            objc_storeStrong(v203, v214);
          }
          else
          {
            v214 = *v203;
            *v203 = 0;
          }

          v215 = *v203;
          -[UIView bounds](v264, "bounds");
          v220 = v218;
          if (v215)
          {
            objc_msgSend(*v203, "setFrame:", v216, v217, v218, v219);
            objc_msgSend(*v203, "setKeyplane:", *v261);
            objc_msgSend(*v203, "setDefaultKeyplane:", v199);
            objc_msgSend(*v203, "setDefaultKeyplaneCacheToken:", v200);
            objc_msgSend(*v203, "setOverrideScreenTraits:", v264->super._screenTraits);
            objc_msgSend(*v203, "purgeSubviews");
          }
          else
          {
            v242 = -[UIKBKeyplaneView initWithFrame:keyplane:]([UIKBKeyplaneView alloc], "initWithFrame:keyplane:", *v261, v216, v217, v218, v219);
            v243 = *v203;
            *v203 = v242;

            objc_msgSend(*v203, "setDelegate:", v264);
            -[UIKeyboardLayoutStar keyViewAnimator](v264, "keyViewAnimator");
            v244 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*v203, "setKeyViewAnimator:", v244);

            objc_msgSend(*v203, "setCacheToken:", v198);
            objc_msgSend(*v203, "setDefaultKeyplane:", v199);
            objc_msgSend(*v203, "setDefaultKeyplaneCacheToken:", v200);
            objc_msgSend(*v203, "setOverrideScreenTraits:", v264->super._screenTraits);
            if (v213)
            {
              -[UIKBScreenTraits keyboardWidth](v264->super._screenTraits, "keyboardWidth");
              if (v245 == v220)
                -[NSMutableDictionary setObject:forKey:](v264->_allKeyplaneViews, "setObject:forKey:", *v203, v213);
            }
          }
          objc_msgSend(*v203, "keyViewAnimator");
          v221 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v221, "reset");

          objc_msgSend(*v203, "emojiKeyManager");
          v222 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v222)
          {
            if (!-[UIKeyboardLayoutStar isEmojiKeyplane](v264, "isEmojiKeyplane"))
            {
LABEL_185:
              v269 = v202;
              objc_msgSend(*v203, "setRenderingContext:", v202);
              -[UIKeyboardLayoutStar renderConfig](v264, "renderConfig");
              v223 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*v203, "setRenderConfig:", v223);

              if (!-[UIKeyboardPinchGestureRecognizer pinchDetected](v264->_pinchGestureRecognizer, "pinchDetected"))
                objc_msgSend(*v203, "setHidden:", 0);
              v267 = (void *)v213;
              v224 = v200;
              v225 = v264->_backgroundView;
              if (v225
                && (-[UIView superview](v225, "superview"),
                    v226 = (void *)objc_claimAutoreleasedReturnValue(),
                    v226,
                    v226))
              {
                v227 = (void *)v199;
                p_isa = (id *)&v264->super.super.super.super.isa;
                -[UIView insertSubview:above:](v264, "insertSubview:above:", *v203, v264->_backgroundView);
              }
              else
              {
                v227 = (void *)v199;
                p_isa = (id *)&v264->super.super.super.super.isa;
                -[UIView insertSubview:atIndex:](v264, "insertSubview:atIndex:", *v203, 0);
              }
              objc_msgSend(p_isa, "updateBackgroundIfNeeded");
              objc_msgSend(*v203, "prepareForDisplay");
              objc_msgSend(*v203, "setNeedsDisplay");
              objc_msgSend(p_isa[53], "screen");
              v229 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v229, "scale");
              v231 = v230;
              objc_msgSend(*v203, "factory");
              v232 = v203;
              v233 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v233, "setScale:", v231);

              objc_msgSend(*v232, "factory");
              v234 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v234, "setAllowsPaddles:", v253);

              UIKeyboardGetCurrentInputMode();
              v235 = (void *)objc_claimAutoreleasedReturnValue();
              v236 = UIKeyboardUIPreferStringOverImageForInputMode(v235);
              objc_msgSend(*v232, "factory");
              v237 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v237, "setPreferStringKeycapOverImage:", v236);

              objc_msgSend(p_isa, "updateAllKeyStates");
              objc_msgSend(p_isa, "_updateSupplementaryKeys");
              objc_msgSend(p_isa, "updateLayoutTags");
              objc_msgSend(p_isa, "updateCachedKeyplaneKeycaps");
              objc_msgSend(p_isa, "updateGlobeKeyDisplayString");
              objc_msgSend(p_isa[169], "reloadResizingOffset");
              objc_msgSend(p_isa[169], "updateGestureRecognizers");
              v238 = p_isa[169];
              objc_msgSend(p_isa, "renderConfig");
              v239 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v238, "setRenderConfig:", v239);

              objc_msgSend(p_isa[169], "updateGrabber");
              if (-[UIKBTree shouldSkipCandidateSelection](*v261, "shouldSkipCandidateSelection"))
              {
                v33 = v258;
                objc_msgSend(v258, "setShouldSkipCandidateSelection:", 1);
              }
              else
              {
                v33 = v258;
                objc_msgSend(v258, "setShouldSkipCandidateSelection:", 0);
                if (((objc_msgSend(p_isa, "isRotating") | v254 ^ v248) & 1) == 0)
                  objc_msgSend(v258, "acceptCurrentCandidateIfSelected");
              }
              objc_msgSend(v33, "setUsesCandidateSelection:", -[UIKBTree notUseCandidateSelection](*v261, "notUseCandidateSelection") ^ 1);
              -[UIKeyboardLayoutStar candidateList](v264, "candidateList");
              v240 = (void *)objc_claimAutoreleasedReturnValue();

              if ((v254 ^ -[NSString hasSuffix:](v264->_keyplaneName, "hasSuffix:", CFSTR("split"))) == 1
                || (v251 != 0) == (v240 == 0))
              {
                objc_msgSend(v33, "removeAutocorrectPromptAndCandidateList");
                objc_msgSend(v33, "updateCandidateDisplay");
              }
              -[UIKeyboardLayoutStar refreshForDictationAvailablityDidChange](v264, "refreshForDictationAvailablityDidChange");
              objc_msgSend(v33, "updateReturnKey:", 1);
              -[UIKeyboardLayoutStar updateKeyCentroids](v264, "updateKeyCentroids");
              if (v252 != -[UIKeyboardLayoutStar isShiftKeyPlaneChooser](v264, "isShiftKeyPlaneChooser"))
                objc_msgSend(v33, "clearShiftState");
              if (-[UIKeyboardLayout disableInteraction](v264, "disableInteraction"))
                -[UIKeyboardLayoutStar setKeyboardDim:](v264, "setKeyboardDim:", 1);
              else
                -[UIView setUserInteractionEnabled:](v264, "setUserInteractionEnabled:", 1);
              -[UIKeyboardLayoutStar keyViewAnimator](v264, "keyViewAnimator");
              v241 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v241, "setDisabled:", 0);

              if (!v264->_settingShift)
                -[UIKeyboardLayout updateTouchProcessingForKeyplaneChange](v264, "updateTouchProcessingForKeyplaneChange");

              v4 = v260;
              goto LABEL_206;
            }
            -[UIKeyboardLayoutStar emojiKeyManager](v264, "emojiKeyManager");
            v222 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*v203, "setEmojiKeyManager:", v222);
          }

          goto LABEL_185;
        }
      }
      else if (-[UIKeyboardLayoutStar stretchKeyboardToFit](self, "stretchKeyboardToFit") && !v97)
      {
        goto LABEL_102;
      }
LABEL_82:
      if (-[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 2
        && -[UIKBScreenTraits isLinear](self->super._screenTraits, "isLinear"))
      {
        v98 = *p_keyplane;
        -[UIKBScreenTraits screen](self->super._screenTraits, "screen");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v99, "scale");
        -[UIKBTree elaborateLayoutWithSize:scale:](v98, "elaborateLayoutWithSize:scale:", 1.0, 1.0, v100);
LABEL_129:

        goto LABEL_131;
      }
      -[UIKBTree zipGeometrySet](*p_keyplane, "zipGeometrySet");
      if (-[UIKeyboardLayoutStar currentHandBias](self, "currentHandBias"))
      {
        v101 = *(double *)(MEMORY[0x1E0C9D538] + 8);
        -[UIKeyboardLayoutStar biasedKeyboardWidthRatio](self, "biasedKeyboardWidthRatio");
        v103 = v102;
        v104 = 0.0;
        if (-[UIKeyboardLayoutStar currentHandBias](self, "currentHandBias") == 1)
        {
          objc_msgSend(v257, "frame");
          v104 = (1.0 - v103) * v105;
        }
        -[UIKBScreenTraits screen](self->super._screenTraits, "screen");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v106, "scale");
        objc_msgSend(v257, "elaborateLayoutWithSize:scale:origin:", v103, 1.0, v107, v104, v101);

      }
      if (-[UIKeyboardLayout isFloating](self, "isFloating")
        && +[UIKeyboardImpl floatingIdiom](UIKeyboardImpl, "floatingIdiom") == 1)
      {
        +[UIKeyboardImpl floatingWidth](UIKeyboardImpl, "floatingWidth");
        v109 = v108;
        +[UIKeyboardImpl floatingHeight](UIKeyboardImpl, "floatingHeight");
        v111 = v110;
        objc_msgSend(v257, "frame");
        v113 = v109 / v112;
        objc_msgSend(v257, "frame");
        v115 = v111 / v114;
        -[UIKBScreenTraits screen](self->super._screenTraits, "screen");
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v116, "scale");
        objc_msgSend(v257, "elaborateLayoutWithSize:scale:", v113, v115, v117);

        objc_msgSend(v257, "setIsFloating:", 1);
      }
      if (v97)
      {
        -[UIKBScreenTraits preferredContentSizeInPopover](self->super._screenTraits, "preferredContentSizeInPopover");
        v119 = v118;
        v121 = v120;
        objc_msgSend(v257, "frame");
        v123 = v119 / v122;
        objc_msgSend(v257, "frame");
        v125 = v121 / v124;
        -[UIKBScreenTraits screen](self->super._screenTraits, "screen");
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v126, "bounds");
        v128 = v127;
        -[UIKBScreenTraits screen](self->super._screenTraits, "screen");
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v129, "bounds");
        v131 = v130;

        v132 = fmin(v125, 1.0);
        if (v128 <= v131)
          v133 = v125;
        else
          v133 = v132;
        -[UIKBScreenTraits screen](self->super._screenTraits, "screen");
        v134 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v134, "scale");
        objc_msgSend(v257, "elaborateLayoutWithSize:scale:", v123, v133, v135);

      }
      -[UIKBTree clearManualAddedKey](*p_keyplane, "clearManualAddedKey");
      goto LABEL_131;
    }
    v249 = v68;
    v69 = self->_keyboard;
    -[UIKeyboardLayoutStar splitNameForKeyplaneName:](self, "splitNameForKeyplaneName:", v4);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBTree subtreeWithName:](v69, "subtreeWithName:", v70);
    v71 = (id)objc_claimAutoreleasedReturnValue();

    if (!v71)
    {
      -[UIKeyboardLayoutStar splitNameForKeyplane:](self, "splitNameForKeyplane:", v41);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKBTree subtreeWithName:](self->_keyboard, "subtreeWithName:", v72);
      v71 = (id)objc_claimAutoreleasedReturnValue();

      if (!v71)
      {
        if (-[UIKeyboardLayoutStar stretchKeyboardToFitKeyplane:](self, "stretchKeyboardToFitKeyplane:", v41))
        {
          -[UIKBScreenTraits bounds](self->super._screenTraits, "bounds");
          v74 = v73;
          -[UIKBTree frame](self->_keyboard, "frame");
          v76 = v74 / v75;
          -[UIKeyboardLayoutStar stretchFactorHeight](self, "stretchFactorHeight");
          v78 = v77;
          -[UIKBScreenTraits screen](self->super._screenTraits, "screen");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "scale");
          objc_msgSend(v41, "elaborateLayoutWithSize:scale:", v76, v78, v80);

        }
        else
        {
          objc_msgSend(v41, "zipGeometrySet");
        }
        objc_msgSend((id)objc_opt_class(), "sharedRivenKeyplaneGenerator");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "generateRivenKeyplaneFromKeyplane:forKeyboard:", v41, self->_keyboard);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = v82;
        if (!v82)
          goto LABEL_71;
        objc_msgSend(v82, "setIsGenerated:", 1);
        objc_msgSend(v41, "layoutName");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "precacheLayoutName:", v83);

        -[UIKBTree subtrees](self->_keyboard, "subtrees");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "addObject:", v71);

      }
    }
    if (!-[UIKBScreenTraits isSplit](self->super._screenTraits, "isSplit")
      || !-[UITextInputTraits acceptsSplitKeyboard](self->super._inputTraits, "acceptsSplitKeyboard"))
    {
      goto LABEL_72;
    }
    v71 = v71;

    objc_msgSend(v71, "name");
    v81 = v4;
    v41 = v71;
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
LABEL_71:

LABEL_72:
    self->_splitTransitionNeedsRebuild = 1;

    v68 = v249;
    goto LABEL_73;
  }
LABEL_209:

}

- (int64_t)currentHandBias
{
  UIKBScreenTraits *screenTraits;
  uint64_t currentHandBias;
  TUIKeyplaneView *liveKeyplaneView;
  void *v7;
  int v8;

  if (-[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") != 3)
  {
    screenTraits = self->super._screenTraits;
    if (!screenTraits || !screenTraits->_isStickerPickerServiceCollectionView)
    {
      liveKeyplaneView = self->_liveKeyplaneView;
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "allowsReachableKeyboard");
      if (liveKeyplaneView)
      {
        if (v8)
        {
          currentHandBias = -[TUIKeyplaneView currentHandBias](self->_liveKeyplaneView, "currentHandBias");
LABEL_12:

          return currentHandBias;
        }
      }
      else if (v8)
      {
        currentHandBias = self->_currentHandBias;
        goto LABEL_12;
      }
      currentHandBias = 0;
      goto LABEL_12;
    }
  }
  return 0;
}

- (BOOL)keyplaneSupportsResizingGesture
{
  _BOOL4 v3;

  v3 = -[UIKeyboardLayoutStar keyplaneUsesResizingOffset](self, "keyplaneUsesResizingOffset");
  if (v3)
    LOBYTE(v3) = -[UIKeyboardLayoutStar isHandwritingPlane](self, "isHandwritingPlane");
  return v3;
}

- (BOOL)keyplaneUsesResizingOffset
{
  char v3;
  void *v5;
  void *v6;

  if (-[UIKBScreenTraits resizeKeyboardHeight](self->super._screenTraits, "resizeKeyboardHeight"))
    return 1;
  if (-[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 1
    || -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 24
    || -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 25
    || -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 26
    || -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 23)
  {
    return 0;
  }
  -[UIKBTree name](self->_keyboard, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "_containsSubstring:", CFSTR("HWR")))
  {
    -[UIKBTree name](self->_keyplane, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v6, "containsString:", CFSTR("Portrait"));

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (CGRect)frameForKeylayoutName:(id)a3
{
  id v4;
  int v5;
  TUIKeyplaneView *liveKeyplaneView;
  double v7;
  double v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
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
  double v24;
  double v25;
  double v26;
  double v27;
  CGRect v28;
  CGRect result;

  v4 = a3;
  if (-[UIKeyboardLayoutStar useCrescendoLayout](self, "useCrescendoLayout"))
  {
    v5 = objc_msgSend(v4, "hasSuffix:", CFSTR("right"));
    liveKeyplaneView = self->_liveKeyplaneView;
    if (v5)
      -[TUIKeyplaneView rightSplitSize](liveKeyplaneView, "rightSplitSize");
    else
      -[TUIKeyplaneView leftSplitSize](liveKeyplaneView, "leftSplitSize");
    v15 = v7 + 10.0;
    v17 = v8 + 10.0;
    v13 = 0.0;
    v11 = 0.0;
  }
  else
  {
    -[UIKBTree name](self->_keyplane, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardLayoutStar frameForKeylayoutName:onKeyplaneName:](self, "frameForKeylayoutName:onKeyplaneName:", v4, v9);
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;

    v28.origin.x = v11;
    v28.origin.y = v13;
    v28.size.width = v15;
    v28.size.height = v17;
    if (CGRectEqualToRect(v28, *MEMORY[0x1E0C9D648]))
    {
      -[UIKBTree name](self->_keyplane, "name");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardLayoutStar splitNameForKeyplaneName:](self, "splitNameForKeyplaneName:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIKeyboardLayoutStar frameForKeylayoutName:onKeyplaneName:](self, "frameForKeylayoutName:onKeyplaneName:", v4, v19);
      v11 = v20;
      v13 = v21;
      v15 = v22;
      v17 = v23;

    }
  }

  v24 = v11;
  v25 = v13;
  v26 = v15;
  v27 = v17;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (CGRect)frameForKeylayoutName:(id)a3 onKeyplaneName:(id)a4
{
  UIKBTree *keyboard;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  keyboard = self->_keyboard;
  v6 = a3;
  -[UIKBTree subtreeWithName:](keyboard, "subtreeWithName:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frameForKeylayoutName:", v6);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (id)splitNameForKeyplaneName:(id)a3
{
  void *v3;
  void *v4;

  -[UIKeyboardLayoutStar defaultNameForKeyplaneName:](self, "defaultNameForKeyplaneName:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", CFSTR("-split"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)defaultNameForKeyplaneName:(id)a3
{
  return (id)objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-split"), &stru_1E16EDF20);
}

- (id)candidateList
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[UIKBTree cachedKeysByKeyName:](self->_keyplane, "cachedKeysByKeyName:", CFSTR("Candidate-Selection"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndex:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "candidateController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (UIKBRenderConfig)renderConfig
{
  return self->_renderConfig;
}

- (id)keyViewAnimator
{
  UIKBKeyViewAnimator *keyViewAnimator;
  _BOOL4 v4;
  __objc2_class **v5;
  UIKBKeyViewAnimator *v6;
  UIKBKeyViewAnimator *v7;

  keyViewAnimator = self->_keyViewAnimator;
  if (!keyViewAnimator)
  {
    v4 = -[UIKeyboardLayoutStar isDeveloperGestureKeybaord](self, "isDeveloperGestureKeybaord");
    v5 = off_1E167AB00;
    if (!v4)
      v5 = off_1E167AAF8;
    v6 = (UIKBKeyViewAnimator *)objc_alloc_init(*v5);
    v7 = self->_keyViewAnimator;
    self->_keyViewAnimator = v6;

    keyViewAnimator = self->_keyViewAnimator;
  }
  return keyViewAnimator;
}

- (BOOL)stretchKeyboardToFit
{
  return -[UIKeyboardLayoutStar stretchKeyboardToFitKeyplane:](self, "stretchKeyboardToFitKeyplane:", self->_keyplane);
}

- (BOOL)stretchKeyboardToFitKeyplane:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  _BOOL4 v8;

  v4 = a3;
  -[UIKBTree frame](self->_keyboard, "frame");
  v6 = v5;
  -[UIKBScreenTraits keyboardWidth](self->super._screenTraits, "keyboardWidth");
  if (v6 == v7
    || -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 1
    && -[UITextInputTraits keyboardType](self->super._inputTraits, "keyboardType") == 127
    || -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 2
    || objc_msgSend(v4, "isSplit") && (objc_msgSend(v4, "isGenerated") & 1) != 0)
  {
    LOBYTE(v8) = 0;
  }
  else
  {
    v8 = !-[UIKeyboardLayoutStar _shouldAttemptToAddSupplementaryControlKeys](self, "_shouldAttemptToAddSupplementaryControlKeys");
  }

  return v8;
}

- (BOOL)_shouldAttemptToAddSupplementaryControlKeys
{
  BOOL v4;
  BOOL v5;
  void *v6;
  char v7;
  unint64_t v8;
  BOOL v9;
  void *v10;
  void *v11;

  if (-[UITextInputTraits keyboardType](self->super._inputTraits, "keyboardType") == 127)
    return 0;
  if (self->_layoutSupportsCrescendo)
    return 0;
  v4 = +[UIDevice _hasHomeButton](UIDevice, "_hasHomeButton");
  if (UIKeyboardComputeKeyboardIdiomFromScreenTraits(self->super._screenTraits, -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom"), 0) != 24)return 0;
  if (v4)
    return 0;
  v5 = -[UIKeyboardLayoutStar isEmojiKeyplane](self, "isEmojiKeyplane");
  -[UIKBTree name](self->_keyboard, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_containsSubstring:", CFSTR("Kana"));

  v8 = -[UIKBTree numberOfRows](self->_keyplane, "numberOfRows");
  v9 = -[UIKeyboardLayoutStar isHandwritingPlane](self, "isHandwritingPlane");
  if (-[UIKBTree isFloating](self->_keyboard, "isFloating")
    || (v7 & 1) != 0
    || v5
    || !v9 && (v8 & 0xFFFFFFFFFFFFFFFELL) != 4)
  {
    return 0;
  }
  UIKeyboardGetCurrentInputMode();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  UIKeyboardGetDerivedKeyboard(v10, self->super._screenTraits, -[UITextInputTraits keyboardType](self->super._inputTraits, "keyboardType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v10) = objc_msgSend(v11, "addsSupplementaryControlKeys");
  return (char)v10;
}

- (id)cacheTokenForKeyplane:(id)a3 caseAlternates:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  UIKBTree *keyboard;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  uint64_t v17;
  UIKBTree *v18;
  void *v19;
  void *v20;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (!v6)
  {
    v16 = 0;
    goto LABEL_16;
  }
  keyboard = self->_keyboard;
  objc_msgSend(v6, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardLayoutStar defaultNameForKeyplaneName:](self, "defaultNameForKeyplaneName:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBTree subtreeWithName:](keyboard, "subtreeWithName:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v7, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "hasPrefix:", v13);

    if ((v14 & 1) != 0)
    {
      if (v4)
      {
        if ((objc_msgSend(v11, "looksLikeShiftAlternate") & 1) == 0)
          goto LABEL_12;
      }
      else if (!objc_msgSend(v11, "looksExactlyLikeShiftAlternate"))
      {
LABEL_12:
        v15 = v11;
        goto LABEL_13;
      }
      if (objc_msgSend(v11, "isShiftKeyplane"))
      {
        v17 = objc_msgSend(v11, "visualStyle");
        v18 = self->_keyboard;
        objc_msgSend(v11, "shiftAlternateKeyplaneName");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIKBTree subtreeWithName:](v18, "subtreeWithName:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v20, "setVisualStyle:", v17);
        v11 = v20;
      }
      goto LABEL_12;
    }
  }
  v15 = v7;
LABEL_13:
  +[UIKBCacheToken tokenForKeyplane:](UIKBCacheToken, "tokenForKeyplane:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 3)
  {
    -[UIView contentScaleFactor](self, "contentScaleFactor");
    objc_msgSend(v16, "setScale:");
  }

LABEL_16:
  return v16;
}

- (void)_setReturnKeyEnabled:(BOOL)a3 withDisplayName:(id)a4 withType:(int)a5
{
  uint64_t v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  _BOOL8 v20;
  void *v21;
  char v22;
  int v23;
  int v24;
  int v25;
  uint64_t v26;
  BOOL v27;
  void *v28;
  UIKeyboardLayoutStar *v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v5 = *(_QWORD *)&a5;
  v6 = a3;
  v36 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  -[UIKBTree cache](self->_keyplane, "cache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("Return-Key"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v28 = v10;
    v12 = v10;
    v30 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (!v30)
      goto LABEL_29;
    v13 = *(_QWORD *)v32;
    v29 = self;
    while (1)
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v32 != v13)
          objc_enumerationMutation(v12);
        v15 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        if ((objc_msgSend(v11, "containsObject:", v15) & 1) == 0)
        {
          if (objc_msgSend(v15, "displayTypeHint") == (_DWORD)v5)
          {
            objc_msgSend(v15, "displayString");
            v16 = v13;
            v17 = v11;
            v18 = v5;
            v19 = v12;
            v20 = v6;
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v8, "isEqualToString:", v21);

            v6 = v20;
            v12 = v19;
            v5 = v18;
            v11 = v17;
            v13 = v16;
            self = v29;
            if ((v22 & 1) != 0)
            {
              v23 = 0;
              goto LABEL_13;
            }
          }
          objc_msgSend(v11, "addObject:", v15);
        }
        v23 = 1;
LABEL_13:
        objc_msgSend(v15, "setDisplayString:", v8);
        objc_msgSend(v15, "setDisplayTypeHint:", v5);
        v24 = -[UIKeyboardLayoutStar stateForKey:](self, "stateForKey:", v15);
        if (v6)
        {
          if (v24 == 1)
            v25 = 1;
          else
            v25 = v23;
          if (v25 == 1)
          {
            v26 = 2;
LABEL_26:
            -[UIKeyboardLayoutStar setState:forKey:](self, "setState:forKey:", v26, v15);
            continue;
          }
        }
        else if ((v23 & 1) != 0 || (v24 != 2 ? (v27 = v24 == 4) : (v27 = 1), v27))
        {
          v26 = 1;
          goto LABEL_26;
        }
      }
      v30 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      if (!v30)
      {
LABEL_29:

        -[UIKeyboardLayoutStar updateTransitionWithFlags:](self, "updateTransitionWithFlags:", 5);
        v10 = v28;
        break;
      }
    }
  }

}

- (void)updateShiftKeyState
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  BOOL v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (!self->_isTrackpadMode)
  {
    v3 = (void *)updateShiftKeyState_shiftKeyNames;
    if (!updateShiftKeyState_shiftKeyNames)
    {
      v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("Shift-Key"), CFSTR("Caps-Lock-Key"), 0);
      v5 = (void *)updateShiftKeyState_shiftKeyNames;
      updateShiftKeyState_shiftKeyNames = v4;

      v3 = (void *)updateShiftKeyState_shiftKeyNames;
    }
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v6 = v3;
    v21 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v21)
    {
      v7 = 0;
      v20 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v29 != v20)
            objc_enumerationMutation(v6);
          v9 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
          -[UIKBTree cache](self->_keyplane, "cache");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKey:", v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            v22 = v11;
            v23 = i;
            v26 = 0u;
            v27 = 0u;
            v24 = 0u;
            v25 = 0u;
            v12 = v11;
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
            if (v13)
            {
              v14 = v13;
              v15 = *(_QWORD *)v25;
              do
              {
                for (j = 0; j != v14; ++j)
                {
                  if (*(_QWORD *)v25 != v15)
                    objc_enumerationMutation(v12);
                  v17 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j);
                  if (-[UIKeyboardLayoutStar stateForKey:](self, "stateForKey:", v17) != 1)
                  {
                    v18 = -[UIKeyboardLayoutStar stateForShiftKey:](self, "stateForShiftKey:", v17);
                    if (-[UIKeyboardLayoutStar stateForKey:](self, "stateForKey:", v17) != (_DWORD)v18)
                    {
                      -[UIKeyboardLayoutStar setState:forKey:](self, "setState:forKey:", v18, v17);
                      if ((_DWORD)v18 == 8)
                      {
                        -[UIKBTree firstCachedKeyWithName:](self->_keyplane, "firstCachedKeyWithName:", CFSTR("Caps-Lock-Key"));
                        v19 = (void *)objc_claimAutoreleasedReturnValue();
                        -[UIKeyboardLayoutStar setState:forKey:](self, "setState:forKey:", 8, v19);

                      }
                      v7 = -[UIKBScreenTraits supportsSplit](self->super._screenTraits, "supportsSplit");
                    }
                  }
                }
                v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
              }
              while (v14);
            }

            v11 = v22;
            i = v23;
          }

        }
        v21 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v21);

      if (v7)
        -[UIKeyboardLayoutStar updateTransitionWithFlags:](self, "updateTransitionWithFlags:", 6);
    }
    else
    {

    }
  }
}

- (int)stateForKey:(id)a3
{
  id v4;
  _BOOL4 v5;
  int *v6;
  int v7;

  v4 = a3;
  v5 = -[UIKeyboardLayoutStar useCrescendoLayout](self, "useCrescendoLayout");
  v6 = &OBJC_IVAR___UIKeyboardLayoutStar__keyplaneView;
  if (v5)
    v6 = &OBJC_IVAR___UIKeyboardLayoutStar__liveKeyplaneView;
  v7 = objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + *v6), "stateForKey:", v4);

  return v7;
}

- (int)stateForShiftKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;

  v4 = a3;
  -[UIKBTree firstCachedKeyWithName:](self->_keyplane, "firstCachedKeyWithName:", CFSTR("Caps-Lock-Key"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    if (!objc_msgSend(v4, "behavesAsShiftKey"))
    {
      v8 = 2;
      goto LABEL_19;
    }
    v7 = 0;
    goto LABEL_9;
  }
  v7 = objc_msgSend(v5, "visible");
  if ((objc_msgSend(v4, "behavesAsShiftKey") & 1) != 0)
  {
LABEL_9:
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isShiftLocked");

    if (v12)
    {
      if (v7)
        v8 = 2;
      else
        v8 = 8;
    }
    else if (self->_autoshift)
    {
      v8 = 64;
    }
    else if (self->_shift)
    {
      v8 = 32;
    }
    else
    {
      v8 = 2;
    }
    goto LABEL_19;
  }
  v8 = 2;
  if (v7)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isShiftLocked");

    if (v10)
      v8 = 8;
    else
      v8 = 2;
  }
LABEL_19:
  -[UIKBTree shiftAlternateKeyplaneName](self->_keyplane, "shiftAlternateKeyplaneName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardLayoutStar activeTouchInfoForShift](self, "activeTouchInfoForShift");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14 && objc_msgSend(v4, "behavesAsShiftKey"))
  {
    -[UIKeyboardLayoutStar preTouchKeyplaneName](self, "preTouchKeyplaneName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "isEqualToString:", self->_keyplaneName))
    {

LABEL_25:
      v8 |= 4u;
      goto LABEL_26;
    }
    -[UIKeyboardLayoutStar preTouchKeyplaneName](self, "preTouchKeyplaneName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqualToString:", v13);

    if (v17)
      goto LABEL_25;
  }
  else
  {

  }
LABEL_26:

  return v8;
}

- (id)activeTouchInfoForShift
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSUUID *shiftKeyTouchUUID;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSMutableDictionary allKeys](self->_extendedTouchInfoMap, "allKeys", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        -[NSMutableDictionary objectForKey:](self->_extendedTouchInfoMap, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v7));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "key");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "interactionType") == 14)
        {
          shiftKeyTouchUUID = self->super._shiftKeyTouchUUID;

          if (shiftKeyTouchUUID)
            goto LABEL_13;
        }
        else
        {

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  v8 = 0;
LABEL_13:

  return v8;
}

- (void)updateTransitionWithFlags:(unint64_t)a3
{
  if (-[UIKBScreenTraits supportsSplit](self->super._screenTraits, "supportsSplit")
    && !-[UIKBScreenTraits isFloating](self->super._screenTraits, "isFloating")
    && !-[UIKeyboardLayoutStar useCrescendoLayout](self, "useCrescendoLayout"))
  {
    -[UIKeyboardSplitTransitionView rebuildControlKeys:](self->_transitionView, "rebuildControlKeys:", a3);
  }
}

- (void)updateLocalizedKeysForKeyplane:(id)a3 updateAllKeyplanes:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  NSString *v13;
  int v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v4 = a4;
  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  UIKeyboardGetCurrentInputMode();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLocale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localeIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v6, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBScreenTraits keyboardWidth](self->super._screenTraits, "keyboardWidth");
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@^%@^%@^%d"), v7, v9, v11, (int)v12);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (v13 == self->_localizedInputKey)
  {
    v14 = 0;
  }
  else
  {
    v14 = -[NSString isEqual:](v13, "isEqual:") ^ 1;
    if ((v14 & 1) != 0)
      goto LABEL_6;
  }
  if (!v4)
    goto LABEL_18;
LABEL_6:
  if (!v4)
  {
    -[UIKeyboardLayoutStar updateLocalizedKeysOnKeyplane:](self, "updateLocalizedKeysOnKeyplane:", v6);
    if (!v14)
      goto LABEL_18;
LABEL_17:
    -[UIKeyboardLayoutStar setLocalizedInputKey:](self, "setLocalizedInputKey:", v13);
    goto LABEL_18;
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[UIKBTree subtrees](self->_keyboard, "subtrees");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        -[UIKeyboardLayoutStar updateLocalizedKeysOnKeyplane:](self, "updateLocalizedKeysOnKeyplane:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i));
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v17);
  }

  if (v14)
    goto LABEL_17;
LABEL_18:

}

- (void)setShift:(BOOL)a3
{
  void *v3;
  int v5;
  BOOL v6;
  _BOOL4 shift;
  int v8;
  UIKBTree *keyplane;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  UIKBTree *keyboard;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  if (!self->_gestureKeyboardIntroduction)
  {
    v5 = a3;
    if (!-[UIKeyboardLayoutStar isEmojiKeyplane](self, "isEmojiKeyplane"))
    {
      v6 = -[UIKeyboardLayout ignoringKeyplaneChange](self, "ignoringKeyplaneChange");
      if (!self->_settingShift && !v6)
      {
        self->_settingShift = 1;
        if ((v5 & 1) == 0)
          -[UIKeyboardLayout setShiftKeyTouchUUID:](self, "setShiftKeyTouchUUID:", 0);
        shift = self->_shift;
        self->_shift = v5;
        v8 = -[UIKBTree isShiftKeyplane](self->_keyplane, "isShiftKeyplane");
        keyplane = self->_keyplane;
        if (v8 != v5)
        {
          -[UIKBTree shiftAlternateKeyplaneName](keyplane, "shiftAlternateKeyplaneName");
          v10 = objc_claimAutoreleasedReturnValue();
LABEL_20:
          v16 = (void *)v10;
LABEL_21:
          if (!self->_isContinuousPathUnderway && v16)
            -[UIKeyboardLayoutStar setKeyplaneName:](self, "setKeyplaneName:", v16);
          goto LABEL_31;
        }
        -[UIKBTree firstCachedKeyWithName:](keyplane, "firstCachedKeyWithName:", CFSTR("Caps-Lock-Key"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = 0;
        }
        else
        {
          -[UIKBTree firstCachedKeyWithName:](self->_keyplane, "firstCachedKeyWithName:", CFSTR("Non-Roman-to-Roman-Switch-Key"));
          v13 = objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            v3 = (void *)v13;
            v12 = 0;
          }
          else
          {
            -[UIKBTree firstCachedKeyWithName:](self->_keyplane, "firstCachedKeyWithName:", CFSTR("Roman-to-Non-Roman-Switch-Key"));
            v17 = objc_claimAutoreleasedReturnValue();
            if (!v17)
              goto LABEL_26;
            v23 = (void *)v17;
            v3 = 0;
            v12 = 1;
          }
        }
        +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isShiftLocked");

        if (v12)
        if (v11)
        {

          if (v15)
            goto LABEL_19;
        }
        else
        {

          if ((v15 & 1) != 0)
          {
LABEL_19:
            -[UIKBTree name](self->_keyplane, "name");
            v10 = objc_claimAutoreleasedReturnValue();
            goto LABEL_20;
          }
        }
LABEL_26:
        if (self->_shift == shift)
        {
          v16 = 0;
        }
        else
        {
          -[UIKBTree name](self->_keyplane, "name");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            keyboard = self->_keyboard;
            -[UIKBTree shiftAlternateKeyplaneName](self->_keyplane, "shiftAlternateKeyplaneName");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIKBTree subtreeWithName:](keyboard, "subtreeWithName:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "name");
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            -[UIKBTree name](self->_keyplane, "name");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v19) = objc_msgSend(v21, "isEqualToString:", v22);

            if ((_DWORD)v19)
            {
              -[UIKBTree shiftAlternateKeyplaneName](self->_keyplane, "shiftAlternateKeyplaneName");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v16 = 0;
            }

            goto LABEL_21;
          }
        }
LABEL_31:
        -[UIKeyboardLayoutStar updateShiftKeyState](self, "updateShiftKeyState");
        self->_settingShift = 0;

      }
    }
  }
  -[UIKeyboardLayoutStar setMultitapReverseKeyState](self, "setMultitapReverseKeyState", a3);
}

- (BOOL)isShiftKeyPlaneChooser
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  if (!-[UIKBTree isShiftKeyplane](self->_keyplane, "isShiftKeyplane"))
    goto LABEL_10;
  -[UIKBTree firstCachedKeyWithName:](self->_keyplane, "firstCachedKeyWithName:", CFSTR("Shift-Key"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3 || !self->_multitapKey)
  {
LABEL_9:

    goto LABEL_10;
  }
  -[UIKBTree keys](self->_keyplane, "keys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "containsObject:", self->_multitapKey)
    || !-[UIDelayedAction scheduled](self->_multitapAction, "scheduled"))
  {

    goto LABEL_9;
  }
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isShiftLocked");

  if ((v6 & 1) == 0)
  {
    self->_unshiftAfterMultitap = 1;
    return 1;
  }
LABEL_10:
  if (-[UIKeyboardLayoutStar supportsSupplementalDisplayString](self, "supportsSupplementalDisplayString")
    && self->_dismissModalDoubleConsonantKeys)
  {
    return 1;
  }
  return -[UIKBTree isShiftKeyPlaneChooser](self->_keyplane, "isShiftKeyPlaneChooser");
}

- (BOOL)isEmojiKeyplane
{
  const __CFString *v3;
  void *v4;

  if (_UIApplicationIsStickerPickerService())
    v3 = CFSTR("Emoji-InputView-Key");
  else
    v3 = CFSTR("Emoji-International-Key");
  -[UIKBTree firstCachedKeyWithName:](self->_keyplane, "firstCachedKeyWithName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4 != 0;
}

- (double)stretchFactorHeight
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  -[UIKBTree frame](self->_keyboard, "frame");
  v4 = v3;
  UIKeyboardGetCurrentInputMode();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  UIKeyboardGetDerivedKeyboard(v5, self->super._screenTraits, -[UITextInputTraits keyboardType](self->super._inputTraits, "keyboardType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "keyboardSize");
    if (v7 != -1.0)
    {
      objc_msgSend(v6, "keyboardSize");
      v4 = v8;
    }
  }
  -[UIKBTree frame](self->_keyboard, "frame");
  if (v9 == 0.0)
  {
    objc_msgSend(v6, "keyboardSizeBasis");
    v9 = v10;
  }
  v11 = 1.0;
  if (v9 > 0.0 && vabdd_f64(v4, v9) > 0.00000011920929)
    v11 = v4 / v9;

  return v11;
}

- (void)_didChangeKeyplaneWithContext:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (objc_msgSend(v4, "sizeDidChange"))
  {
    objc_msgSend(v4, "size");
    -[UIView setSize:](self, "setSize:");
  }
  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardLayoutStar;
  -[UIView _didChangeKeyplaneWithContext:](&v5, sel__didChangeKeyplaneWithContext_, v4);

}

- (void)rollbackKeyplaneTransformations
{
  NSMutableSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  UIKBTree *keyplane;
  void *v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = self->_keyplaneTransformations;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        +[UIKBContinuousPathModalKeysTransformation transformationIdentifier](UIKBContinuousPathModalKeysTransformation, "transformationIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8 == v9 && (objc_opt_respondsToSelector() & 1) != 0)
        {
          keyplane = self->_keyplane;
          -[UIKeyboardLayoutStar _currentKeyplaneTransformationContext](self, "_currentKeyplaneTransformationContext");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = +[UIKBContinuousPathModalKeysTransformation rollbackKeyplane:withTransformationContext:](UIKBContinuousPathModalKeysTransformation, "rollbackKeyplane:withTransformationContext:", keyplane, v11);

        }
      }
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  -[NSMutableSet removeAllObjects](self->_keyplaneTransformations, "removeAllObjects");
}

- (BOOL)isRotating
{
  return self->_preRotateKeyplaneName != 0;
}

- (id)defaultKeyplaneForKeyplane:(id)a3
{
  UIKBTree *keyboard;
  void *v5;
  void *v6;
  void *v7;

  keyboard = self->_keyboard;
  objc_msgSend(a3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardLayoutStar defaultNameForKeyplaneName:](self, "defaultNameForKeyplaneName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBTree subtreeWithName:](keyboard, "subtreeWithName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)canReuseKeyplaneView
{
  int HasMultipleActiveSecureInputModes;
  char v4;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  NSString *v13;

  if (self->_externalDictationAndInternationalKeys != +[UIKeyboardImpl showsGlobeAndDictationKeysExternally](UIKeyboardImpl, "showsGlobeAndDictationKeysExternally"))return 0;
  HasMultipleActiveSecureInputModes = +[UIKeyboardImpl canShowInternationalKey](UIKeyboardImpl, "canShowInternationalKey");
  if (HasMultipleActiveSecureInputModes)
  {
    if (-[UITextInputTraits isSecureTextEntry](self->super._inputTraits, "isSecureTextEntry"))
      HasMultipleActiveSecureInputModes = UIKeyboardHasMultipleActiveSecureInputModes();
    else
      HasMultipleActiveSecureInputModes = (unint64_t)objc_msgSend((id)UIKeyboardActiveUserSelectableInputModes, "count") > 1;
  }
  if (HasMultipleActiveSecureInputModes != self->_showIntlKey
    || self->_showDictationKey != -[UIKeyboardLayoutStar shouldShowDictationKey](self, "shouldShowDictationKey")
    || self->_inputTraitsPreventInitialReuse)
  {
    return 0;
  }
  v6 = -[UIKeyboardLayoutStar useCrescendoLayout](self, "useCrescendoLayout") ? 1456 : 696;
  if (!*(Class *)((char *)&self->super.super.super.super.isa + v6)
    || !-[NSMutableDictionary count](self->_allKeyplaneViews, "count"))
  {
    return 0;
  }
  v7 = (void *)MEMORY[0x1E0CB3940];
  UIKeyboardGetCurrentInputMode();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localeIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBTree name](self->_keyplane, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBScreenTraits keyboardWidth](self->super._screenTraits, "keyboardWidth");
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@^%@^%@^%d"), v8, v10, v11, (int)v12);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (v13 == self->_localizedInputKey)
    v4 = 1;
  else
    v4 = -[NSString isEqual:](v13, "isEqual:");

  return v4;
}

- (void)_updateSupplementaryKeys
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t j;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t k;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (!-[UIKeyboardLayoutStar _shouldAttemptToAddSupplementaryControlKeys](self, "_shouldAttemptToAddSupplementaryControlKeys"))
  {
    if (-[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") != 3)
      return;
    -[UIKeyboardLayoutStar _currentKeyplaneTransformationContext](self, "_currentKeyplaneTransformationContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKBPhoneToCarPlayTransformation cachedKeysForTransformationContext:](UIKBPhoneToCarPlayTransformation, "cachedKeysForTransformationContext:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v4 = v16;
    v17 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v22 != v19)
            objc_enumerationMutation(v4);
          -[UIKeyboardLayoutStar setState:forKey:](self, "setState:forKey:", 2, *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i), (_QWORD)v21);
        }
        v18 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
      }
      while (v18);
    }
    goto LABEL_26;
  }
  -[UIKeyboardLayoutStar _currentKeyplaneTransformationContext](self, "_currentKeyplaneTransformationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardSupplementaryControlKeyTransformation cachedControlKeySetsForTransformationContext:](UIKeyboardSupplementaryControlKeyTransformation, "cachedControlKeySetsForTransformationContext:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v4 = v4;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v30;
      do
      {
        for (j = 0; j != v6; ++j)
        {
          if (*(_QWORD *)v30 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
          v25 = 0u;
          v26 = 0u;
          v27 = 0u;
          v28 = 0u;
          objc_msgSend(v9, "subtrees");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v26;
            do
            {
              for (k = 0; k != v12; ++k)
              {
                if (*(_QWORD *)v26 != v13)
                  objc_enumerationMutation(v10);
                -[UIKeyboardLayoutStar setState:forKey:](self, "setState:forKey:", 2, *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * k));
              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
            }
            while (v12);
          }

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
      }
      while (v6);
    }
LABEL_26:

  }
}

- (void)_transformCarPlayIfNecessary
{
  UIKBTree *keyplane;
  void *v4;
  UIKBTree *v5;
  UIKBTree *v6;
  NSMutableSet *keyplaneTransformations;
  id v8;

  if (-[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 3)
  {
    keyplane = self->_keyplane;
    -[UIKeyboardLayoutStar _currentKeyplaneTransformationContext](self, "_currentKeyplaneTransformationContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKBPhoneToCarPlayTransformation transformKeyplane:withTransformationContext:](UIKBPhoneToCarPlayTransformation, "transformKeyplane:withTransformationContext:", keyplane, v4);
    v5 = (UIKBTree *)objc_claimAutoreleasedReturnValue();
    v6 = self->_keyplane;
    self->_keyplane = v5;

    keyplaneTransformations = self->_keyplaneTransformations;
    +[UIKBPhoneToCarPlayTransformation transformationIdentifier](UIKBPhoneToCarPlayTransformation, "transformationIdentifier");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet addObject:](keyplaneTransformations, "addObject:", v8);

  }
}

- (void)_setBiasEscapeButtonVisible:(BOOL)a3
{
  _BOOL4 v3;
  int64_t v5;
  UIButton *biasEscapeButton;
  UIButton *v7;
  UIButton *v8;
  UIButton *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  char v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  NSLayoutConstraint *biasEscapeButtonLeftConstraint;
  void *v32;
  void *v33;
  NSLayoutConstraint *v34;
  NSLayoutConstraint *v35;
  void *v36;
  NSLayoutConstraint *biasEscapeButtonRightConstraint;
  double v38;
  void *v39;
  void *v40;
  NSLayoutConstraint *v41;
  NSLayoutConstraint *v42;
  id v43;

  v3 = a3;
  v5 = -[UIKeyboardLayoutStar currentHandBias](self, "currentHandBias");
  biasEscapeButton = self->_biasEscapeButton;
  if (!v3 || !v5)
  {
    -[UIView setHidden:](biasEscapeButton, "setHidden:", 1);
    return;
  }
  if (!biasEscapeButton)
  {
    v7 = [UIButton alloc];
    v8 = -[UIButton initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v9 = self->_biasEscapeButton;
    self->_biasEscapeButton = v8;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_biasEscapeButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setContentMode:](self->_biasEscapeButton, "setContentMode:", 4);
    -[UIControl addTarget:action:forControlEvents:](self->_biasEscapeButton, "addTarget:action:forControlEvents:", self, sel__didTapBiasEscapeButton_, 64);
    -[UIView addSubview:](self, "addSubview:", self->_biasEscapeButton);
    -[UIView centerYAnchor](self->_biasEscapeButton, "centerYAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerYAnchor](self, "centerYAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setActive:", 1);

    biasEscapeButton = self->_biasEscapeButton;
  }
  -[UIView setHidden:](biasEscapeButton, "setHidden:", 0);
  -[UIView frame](self, "frame");
  v14 = v13;
  -[UIKeyboardLayoutStar biasedKeyboardWidthRatio](self, "biasedKeyboardWidthRatio");
  v16 = v14 * (1.0 - v15);
  v17 = v16 * 0.25 + -15.0;
  +[UIColor whiteColor](UIColor, "whiteColor");
  v43 = (id)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardLayoutStar renderConfig](self, "renderConfig");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "lightKeyboard");

  if ((v19 & 1) == 0)
  {
    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.353, 1.0);
    v20 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (-[UIKeyboardLayoutStar isHandwritingPlane](self, "isHandwritingPlane")
    || -[UIKeyboardLayoutStar isEmojiKeyplane](self, "isEmojiKeyplane"))
  {
    +[UIColor blackColor](UIColor, "blackColor");
    v20 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v21 = (void *)v20;

    v43 = v21;
  }
  +[UIImage kitImageNamed:](UIImage, "kitImageNamed:", CFSTR("bias_escape_chevron.png"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "_flatImageWithColor:", v43);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIKBTree frame](self->_keyplane, "frame");
  v25 = v24;
  objc_msgSend(v23, "size");
  v27 = (v25 - v26) * 0.5 + -15.0;
  objc_msgSend(v23, "size");
  v29 = v16 * 3.0 / 5.0 - (v17 + v28 + 15.0);
  if (v29 <= 15.0)
    v30 = v29;
  else
    v30 = 15.0;
  if (v5 == 1)
  {
    -[UIButton setImage:forState:](self->_biasEscapeButton, "setImage:forState:", v23, 0);
    -[UIButton setContentEdgeInsets:](self->_biasEscapeButton, "setContentEdgeInsets:", v27, 15.0, v27, v30);
    biasEscapeButtonLeftConstraint = self->_biasEscapeButtonLeftConstraint;
    if (!biasEscapeButtonLeftConstraint)
    {
      -[UIView leftAnchor](self->_biasEscapeButton, "leftAnchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView leftAnchor](self, "leftAnchor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "constraintEqualToAnchor:constant:", v33, v17);
      v34 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      v35 = self->_biasEscapeButtonLeftConstraint;
      self->_biasEscapeButtonLeftConstraint = v34;

      biasEscapeButtonLeftConstraint = self->_biasEscapeButtonLeftConstraint;
    }
    -[NSLayoutConstraint setConstant:](biasEscapeButtonLeftConstraint, "setConstant:", v17);
    -[NSLayoutConstraint setActive:](self->_biasEscapeButtonLeftConstraint, "setActive:", 1);
    -[NSLayoutConstraint setActive:](self->_biasEscapeButtonRightConstraint, "setActive:", 0);
  }
  else
  {
    objc_msgSend(v23, "imageWithHorizontallyFlippedOrientation");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setImage:forState:](self->_biasEscapeButton, "setImage:forState:", v36, 0);
    -[UIButton setContentEdgeInsets:](self->_biasEscapeButton, "setContentEdgeInsets:", v27, v30, v27, 15.0);
    biasEscapeButtonRightConstraint = self->_biasEscapeButtonRightConstraint;
    if (biasEscapeButtonRightConstraint)
    {
      v38 = -v17;
    }
    else
    {
      -[UIView rightAnchor](self->_biasEscapeButton, "rightAnchor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView rightAnchor](self, "rightAnchor");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = -v17;
      objc_msgSend(v39, "constraintEqualToAnchor:constant:", v40, v38);
      v41 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      v42 = self->_biasEscapeButtonRightConstraint;
      self->_biasEscapeButtonRightConstraint = v41;

      biasEscapeButtonRightConstraint = self->_biasEscapeButtonRightConstraint;
    }
    -[NSLayoutConstraint setConstant:](biasEscapeButtonRightConstraint, "setConstant:", v38);
    -[NSLayoutConstraint setActive:](self->_biasEscapeButtonRightConstraint, "setActive:", 1);
    -[NSLayoutConstraint setActive:](self->_biasEscapeButtonLeftConstraint, "setActive:", 0);

  }
}

- (BOOL)_allowPaddle
{
  void *v3;
  void *v4;
  BOOL v5;

  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferencesActions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_msgSend(v4, "BOOLForPreferenceKey:", *MEMORY[0x1E0DBE1B0]) & 1) != 0
    || -[UITextInputTraits isSecureTextEntry](self->super._inputTraits, "isSecureTextEntry");

  return v5;
}

- (void)_addResizeTransformationsIfNecessary
{
  UIKBTree *keyplane;
  void *v4;
  UIKBTree *v5;
  UIKBTree *v6;
  NSMutableSet *keyplaneTransformations;
  __objc2_class *v8;
  UIKBTree *v9;
  void *v10;
  UIKBTree *v11;
  UIKBTree *v12;
  id v13;

  if (-[UIKeyboardLayoutStar keyplaneUsesResizingOffset](self, "keyplaneUsesResizingOffset"))
  {
    keyplane = self->_keyplane;
    -[UIKeyboardLayoutStar _currentKeyplaneTransformationContext](self, "_currentKeyplaneTransformationContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKBResizingOffsetKeyplaneTransformation transformKeyplane:withTransformationContext:](UIKBResizingOffsetKeyplaneTransformation, "transformKeyplane:withTransformationContext:", keyplane, v4);
    v5 = (UIKBTree *)objc_claimAutoreleasedReturnValue();
    v6 = self->_keyplane;
    self->_keyplane = v5;

    keyplaneTransformations = self->_keyplaneTransformations;
    v8 = UIKBResizingOffsetKeyplaneTransformation;
LABEL_6:
    -[__objc2_class transformationIdentifier](v8, "transformationIdentifier");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet addObject:](keyplaneTransformations, "addObject:");

    return;
  }
  if (+[UIKeyboard resizable](UIKeyboard, "resizable")
    || _UIApplicationIsStickerPickerService())
  {
    v9 = self->_keyplane;
    -[UIKeyboardLayoutStar _currentKeyplaneTransformationContext](self, "_currentKeyplaneTransformationContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKBResizableKeyplaneTransformation transformKeyplane:withTransformationContext:](UIKBResizableKeyplaneTransformation, "transformKeyplane:withTransformationContext:", v9, v10);
    v11 = (UIKBTree *)objc_claimAutoreleasedReturnValue();
    v12 = self->_keyplane;
    self->_keyplane = v11;

    keyplaneTransformations = self->_keyplaneTransformations;
    v8 = UIKBResizableKeyplaneTransformation;
    goto LABEL_6;
  }
}

uint64_t __54__UIKeyboardLayoutStar_updateMoreAndInternationalKeys__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("International-Key")) & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("Dictation-Key"));

  return v3;
}

- (void)updateLocalizedKeysOnKeyplane:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t m;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t n;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  objc_msgSend(v4, "cachedKeysByKeyName:", CFSTR("Shift-Key"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v64;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v64 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
        objc_msgSend(v10, "setDisplayTypeHint:", -[UIKeyboardLayoutStar displayTypeHintForShiftKey](self, "displayTypeHintForShiftKey"));
        UIKBShiftKeyStringForActiveInputMode(v10);
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)v11;
        if (v11)
          v13 = (const __CFString *)v11;
        else
          v13 = CFSTR("shift");
        objc_msgSend(v10, "setDisplayString:", v13);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
    }
    while (v7);
  }

  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  objc_msgSend(v4, "cachedKeysByKeyName:", CFSTR("More-Key"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v60;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v60 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * j);
        if (objc_msgSend(v19, "interactionType") == 11)
        {
          objc_msgSend(v19, "setDisplayTypeHint:", -[UIKeyboardLayoutStar displayTypeHintForMoreKey](self, "displayTypeHintForMoreKey"));
          UIKBMoreKeyStringForActiveInputMode(self->_keyboard, v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setDisplayString:", v20);

        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
    }
    while (v16);
  }

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  objc_msgSend(v4, "cachedKeysByKeyName:", CFSTR("Return-Key"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v55, v69, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v56;
    do
    {
      for (k = 0; k != v23; ++k)
      {
        if (*(_QWORD *)v56 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * k);
        UIKeyboardLocalizedReturnKeyName((int)objc_msgSend(v26, "displayTypeHint"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setDisplayString:", v27);

      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v55, v69, 16);
    }
    while (v23);
  }

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  objc_msgSend(v4, "cachedKeysByKeyName:", CFSTR("Dictation-Key"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v51, v68, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v52;
    do
    {
      for (m = 0; m != v30; ++m)
      {
        if (*(_QWORD *)v52 != v31)
          objc_enumerationMutation(v28);
        objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * m), "setDisplayTypeHint:", (unint64_t)objc_msgSend((id)UIKeyboardActiveUserSelectableInputModes, "count") > 1);
      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v51, v68, 16);
    }
    while (v30);
  }

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  objc_msgSend(v4, "cachedKeysByKeyName:", CFSTR("NumberPad-More"), 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v47, v67, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v48;
    do
    {
      for (n = 0; n != v35; ++n)
      {
        if (*(_QWORD *)v48 != v36)
          objc_enumerationMutation(v33);
        v38 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * n);
        objc_msgSend(v38, "setDisplayTypeHint:", -[UIKeyboardLayoutStar displayTypeHintForMoreKey](self, "displayTypeHintForMoreKey"));
        UIKBMoreKeyStringForActiveInputMode(self->_keyboard, v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setDisplayString:", v39);

      }
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v47, v67, 16);
    }
    while (v35);
  }

  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "inputModeThatInvokeEmoji");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v41;
  if (v41)
  {
    v43 = v41;
  }
  else
  {
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "textInputTraits");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "nextInputModeInPreferenceListForTraits:updatePreference:", v46, 0);
    v43 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[UIKeyboardLayoutStar updateLocalizedDisplayStringOnEmojiInternationalWithKeyplane:withInputMode:](self, "updateLocalizedDisplayStringOnEmojiInternationalWithKeyplane:withInputMode:", v4, v43);
  -[UIKeyboardLayoutStar updateInputModeLocalizedKeysForKeyplane:](self, "updateInputModeLocalizedKeysForKeyplane:", v4);

}

- (void)updateLocalizedDisplayStringOnEmojiInternationalWithKeyplane:(id)a3 withInputMode:(id)a4
{
  id v6;
  id v7;
  unsigned int v8;
  BOOL v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = -[UITextInputTraits keyboardType](self->super._inputTraits, "keyboardType");
  v9 = v8 > 0xB || ((1 << v8) & 0x930) == 0;
  if (v9 && v8 != 127)
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(v6, "cachedKeysByKeyName:", CFSTR("Emoji-International-Key"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (!v18)
      goto LABEL_13;
    v19 = v18;
    v27 = v6;
    v20 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v29 != v20)
          objc_enumerationMutation(v10);
        v22 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v7, "normalizedIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "rangeOfString:", CFSTR("HWR"));

        if (v24 == 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v7, "identifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          UIKeyboardLocalizedString(CFSTR("UI-ABC"), v25, 0, CFSTR("ABC"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setDisplayString:", v26);

        }
        else
        {
          objc_msgSend(v22, "setDisplayString:", CFSTR(""));
        }
      }
      v19 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v19);
    goto LABEL_12;
  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend(v6, "cachedKeysByKeyName:", CFSTR("NumberPad-International"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v11)
  {
    v12 = v11;
    v27 = v6;
    v13 = *(_QWORD *)v33;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v33 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * j);
        objc_msgSend(v7, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        UIKeyboardLocalizedString(CFSTR("UI-Numbers"), v16, 0, CFSTR("123"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setDisplayString:", v17);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v12);
LABEL_12:
    v6 = v27;
  }
LABEL_13:

}

- (void)updateInputModeLocalizedKeysForKeyplane:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t m;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t n;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t ii;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  void *v95;
  _BYTE v96[128];
  _BYTE v97[128];
  _BYTE v98[128];
  _BYTE v99[128];
  _BYTE v100[128];
  _BYTE v101[128];
  uint64_t v102;

  v102 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UIKeyboardLayoutStar updateAutolocalizedKeysForKeyplane:](self, "updateAutolocalizedKeysForKeyplane:", v4);
  UIKeyboardGetCurrentInputMode();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  UIKeyboardInputModeGetDecimalSeparator(v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  v94 = 0u;
  v68 = v4;
  objc_msgSend(v4, "cachedKeysByKeyName:", CFSTR("NumberPad-Dot"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v91, v101, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v92;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v92 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * i);
        objc_msgSend(v12, "setDisplayString:", v6);
        objc_msgSend(v12, "setRepresentedString:", v6);
        -[UIKeyboardLayoutStar setState:forKey:](self, "setState:forKey:", 2, v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v91, v101, 16);
    }
    while (v9);
  }
  v66 = (void *)v6;

  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  objc_msgSend(v68, "cachedKeysByKeyName:", CFSTR("Primary-Tag-Symbol"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v87, v100, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v88;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v88 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * j);
        UIKeyboardLocalizedString(CFSTR("UI-PrimaryTagSymbol"), v5, 0, CFSTR("@"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setDisplayString:", v19);
        objc_msgSend(v18, "setRepresentedString:", v19);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v87, v100, 16);
    }
    while (v15);
  }

  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  objc_msgSend(v68, "cachedKeysByKeyName:", CFSTR("Alternate-Tag-Symbol"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v83, v99, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v84;
    do
    {
      for (k = 0; k != v22; ++k)
      {
        if (*(_QWORD *)v84 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * k);
        UIKeyboardLocalizedString(CFSTR("UI-AlternateTagSymbol"), v5, 0, CFSTR("#"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setDisplayString:", v26);
        objc_msgSend(v25, "setRepresentedString:", v26);

      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v83, v99, 16);
    }
    while (v22);
  }
  v70 = v5;

  objc_msgSend(v68, "cachedKeysByKeyName:", CFSTR("Top-Level-Domain-Key"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v67, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLocale");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "localeIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    UIKeyboardTopLevelDomainVariants(v28, 3);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectForKey:", CFSTR("Strings"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "lastObject");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
      goto LABEL_25;
    UIKeyboardTopLevelDomainVariants(0, 3);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v32, "objectForKey:", CFSTR("Strings"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "lastObject");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = v32;
    if (v31)
    {
LABEL_25:
      v81 = 0u;
      v82 = 0u;
      v79 = 0u;
      v80 = 0u;
      v34 = v67;
      v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v79, v98, 16);
      if (v35)
      {
        v36 = v35;
        v37 = *(_QWORD *)v80;
        do
        {
          for (m = 0; m != v36; ++m)
          {
            if (*(_QWORD *)v80 != v37)
              objc_enumerationMutation(v34);
            v39 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * m);
            objc_msgSend(v39, "setDisplayString:", v31);
            objc_msgSend(v39, "setRepresentedString:", v31);
          }
          v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v79, v98, 16);
        }
        while (v36);
      }

    }
  }
  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  objc_msgSend(v68, "cachedKeysByKeyName:", CFSTR("Single-Domain-Key"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v75, v97, 16);
  if (v69)
  {
    v41 = *(_QWORD *)v76;
    while (2)
    {
      for (n = 0; n != v69; ++n)
      {
        if (*(_QWORD *)v76 != v41)
          objc_enumerationMutation(v40);
        v43 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * n);
        UIKeyboardTopLevelDomainVariants(0, 3);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "objectForKey:", CFSTR("Strings"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = v45;
        if (!v45 || (unint64_t)objc_msgSend(v45, "count") < 3)
        {

          goto LABEL_53;
        }
        if (objc_msgSend(v43, "intForProperty:", CFSTR("popup-bias")) == 2)
          v47 = -2;
        else
          v47 = -1;
        if (objc_msgSend(v43, "intForProperty:", CFSTR("popup-bias")) == 29)
          v47 = -3;
        objc_msgSend(v46, "objectAtIndex:", v47 + objc_msgSend(v46, "count"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[UIKeyboardLayoutStar shouldMatchCaseForDomainKeys](self, "shouldMatchCaseForDomainKeys")
          && objc_msgSend(v68, "isShiftKeyplane"))
        {
          objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLocale");
          v49 = v41;
          v50 = v40;
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "uppercaseStringWithLocale:", v51);
          v52 = objc_claimAutoreleasedReturnValue();

          v40 = v50;
          v41 = v49;
          v48 = (void *)v52;
        }
        objc_msgSend(v43, "setDisplayString:", v48);
        objc_msgSend(v43, "setRepresentedString:", v48);

      }
      v69 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v75, v97, 16);
      if (v69)
        continue;
      break;
    }
  }
LABEL_53:

  -[UIKeyboardLayoutStar setCurrencyKeysForCurrentLocaleOnKeyplane:](self, "setCurrencyKeysForCurrentLocaleOnKeyplane:", v68);
  -[UIKeyboardLayoutStar setPercentSignKeysForCurrentLocaleOnKeyplane:](self, "setPercentSignKeysForCurrentLocaleOnKeyplane:", v68);
  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  objc_msgSend(v68, "cachedKeysByKeyName:", CFSTR("Space-Key"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v71, v96, 16);
  v55 = v70;
  if (v54)
  {
    v56 = v54;
    v57 = *(_QWORD *)v72;
    do
    {
      for (ii = 0; ii != v56; ++ii)
      {
        if (*(_QWORD *)v72 != v57)
          objc_enumerationMutation(v53);
        v59 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * ii);
        if (_os_feature_enabled_impl())
        {
          +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "currentInputMode");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "_iconLabelForMultilingualSet");
          v62 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v62, "length"))
          {
            objc_msgSend(v59, "setDisplayString:", CFSTR(" "));
            v95 = v62;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v95, 1);
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "setSecondaryDisplayStrings:", v63);

          }
          else
          {
            objc_msgSend(v59, "name");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v64, "containsString:", CFSTR("Unlabeled-Space-Key")))
            {
              objc_msgSend(v59, "setDisplayString:", 0);
            }
            else
            {
              UIKeyboardLocalizedString(CFSTR("UI-Space"), 0, 0, 0);
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v59, "setDisplayString:", v65);

            }
            objc_msgSend(v59, "setSecondaryDisplayStrings:", 0);
          }

          v55 = v70;
        }
      }
      v56 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v71, v96, 16);
    }
    while (v56);
  }

}

- (void)updateAutolocalizedKeysForKeyplane:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(a3, "autolocalizedKeyCacheIterator", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[UIKeyboardLayoutStar updateLocalizedDisplayStringsForKeys:](self, "updateLocalizedDisplayStringsForKeys:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)updateLocalizedDisplayStringsForKeys:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int64_t v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  id obj;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  void *v50;
  void *v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  UIKeyboardGetCurrentInputMode();
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v47;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v47 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v7);
        if (objc_msgSend(v8, "displayType") != 23
          || (objc_msgSend(v8, "displayString"),
              v9 = (void *)objc_claimAutoreleasedReturnValue(),
              v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("shift")),
              v9,
              v10))
        {
          objc_msgSend(v8, "localizationKey");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "hasPrefix:", CFSTR("Localized-Number-")))
          {
            objc_msgSend(v11, "substringFromIndex:", objc_msgSend(CFSTR("Localized-Number-"), "length"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = -[UITextInputTraits keyboardType](self->super._inputTraits, "keyboardType");
            if (v13 == 127
              || (objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLocale"),
                  v14 = (void *)objc_claimAutoreleasedReturnValue(),
                  v15 = UIKeyboardInputModeLanguageMatchesLocaleLanguage((uint64_t)v43, v14),
                  v14,
                  v15))
            {
              UIKeyboardGetNumberFormatterForPreferredLocale();
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v12, "integerValue"));
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "stringFromNumber:", v17);
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v8, "setDisplayString:", v18);
              if (v13 == 127)
                v19 = v12;
              else
                v19 = v18;
              objc_msgSend(v8, "setRepresentedString:", v19);

            }
            else
            {
              objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = UIKeyboardInputModeLanguageMatchesLocaleLanguage((uint64_t)v43, v33);

              if (v34)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", CFSTR("%ld"), objc_msgSend(v12, "integerValue"));
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "setDisplayString:", v35);
                objc_msgSend(v8, "setRepresentedString:", v35);

              }
              else
              {
                objc_msgSend(v8, "setDisplayString:", v12);
                objc_msgSend(v8, "setRepresentedString:", v12);
              }
            }
            if (objc_msgSend(v8, "displayType") == 20)
            {
              if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI")
                && (+[UIDevice currentDevice](UIDevice, "currentDevice"),
                    v20 = (void *)objc_claimAutoreleasedReturnValue(),
                    v21 = objc_msgSend(v20, "userInterfaceIdiom"),
                    v20,
                    v21 == 6))
              {
                objc_msgSend(v8, "setSecondaryDisplayStrings:", &unk_1E1A93BD8);
                objc_msgSend(v8, "setSecondaryRepresentedStrings:", &unk_1E1A93BF0);
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UI-NumberPad-%u"), objc_msgSend(v12, "integerValue"));
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                UIKeyboardLocalizedString(v29, v43, 0, 0);
                v30 = (void *)objc_claimAutoreleasedReturnValue();

                if (v30)
                {
                  v51 = v30;
                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1);
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v8, "setSecondaryDisplayStrings:", v31);

                  v50 = v30;
                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v8, "setSecondaryRepresentedStrings:", v32);

                }
              }
            }
          }
          else if (objc_msgSend(v8, "interactionType") == 9)
          {
            objc_msgSend(v8, "representedString");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v12, "isEqualToString:", CFSTR("NonASCII")) & 1) != 0
              || objc_msgSend(v12, "isEqualToString:", CFSTR("ASCIICapable")))
            {
              -[UIKeyboardLayoutStar inputModeToMergeCapsLockKey](self, "inputModeToMergeCapsLockKey");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "identifier");
              v23 = (void *)objc_claimAutoreleasedReturnValue();

              if (v23)
              {
                v24 = v23;

                v12 = v24;
              }

            }
            UIKeyboardLocalizedString(v11, v12, 0, 0);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setDisplayString:", v25);

          }
          else
          {
            if (-[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 2
              && objc_msgSend(v11, "hasSuffix:", CFSTR("TV")))
            {
              UIKeyboardLocalizedString(v11, 0, 0, 0);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "setDisplayString:", v26);

              objc_msgSend(v8, "displayString");
              v27 = (void *)objc_claimAutoreleasedReturnValue();

              v28 = 0;
              if (!v27)
              {
                objc_msgSend(v11, "substringToIndex:", objc_msgSend(v11, "length") - objc_msgSend(CFSTR("TV"), "length"));
                v28 = objc_claimAutoreleasedReturnValue();
              }

              v11 = (void *)v28;
            }
            if (objc_msgSend(v11, "hasSuffix:", CFSTR("Caps")))
            {
              objc_msgSend(v11, "substringToIndex:", objc_msgSend(v11, "length") - objc_msgSend(CFSTR("Caps"), "length"));
              v36 = (void *)objc_claimAutoreleasedReturnValue();

              UIKeyboardLocalizedString(v36, 0, 0, 0);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLocale");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "uppercaseStringWithLocale:", v37);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "setDisplayString:", v38);

              v11 = v36;
            }
            else
            {
              if (objc_msgSend(v8, "displayType") == 20
                && objc_msgSend(v8, "interactionType") == 14
                && objc_msgSend(v11, "isEqualToString:", CFSTR("UI-Numbers"))
                && (objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLocale"),
                    v39 = (void *)objc_claimAutoreleasedReturnValue(),
                    v40 = UIKeyboardInputModeLanguageMatchesLocaleLanguage((uint64_t)v43, v39),
                    v39,
                    v40))
              {
                UIKeyboardGetNumbersStringForPreferredLocale();
                v41 = objc_claimAutoreleasedReturnValue();
              }
              else
              {
                if (!v11)
                  goto LABEL_48;
                UIKeyboardLocalizedString(v11, 0, 0, 0);
                v41 = objc_claimAutoreleasedReturnValue();
              }
              v12 = (void *)v41;
              objc_msgSend(v8, "setDisplayString:", v41);
            }
          }

        }
LABEL_48:
        ++v7;
      }
      while (v5 != v7);
      v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
      v5 = v42;
    }
    while (v42);
  }

}

- (void)setPercentSignKeysForCurrentLocaleOnKeyplane:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  __CFString *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  _QWORD v36[4];
  id v37;
  __CFString *v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  UIKeyboardGetCurrentInputMode();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  UIKeyboardInputModeGetNumericLocale(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "cache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("Localized-Percent-Sign"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count"))
  {
    v35 = v3;
    if (qword_1ECD79818 != -1)
      dispatch_once(&qword_1ECD79818, &__block_literal_global_709);
    v9 = v6;
    v34 = v6;
    if (qword_1ECD79850 && objc_msgSend((id)qword_1ECD79848, "isEqualToString:", v9))
    {
      v10 = (__CFString *)(id)qword_1ECD79850;
    }
    else
    {
      v11 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setLocale:", v12);

      objc_msgSend(v11, "percentSymbol");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v13;
      if (v13)
        v15 = (__CFString *)v13;
      else
        v15 = CFSTR("%");
      v10 = v15;

      v16 = objc_msgSend(v9, "copy");
      v17 = (void *)qword_1ECD79848;
      qword_1ECD79848 = v16;

      objc_storeStrong((id *)&qword_1ECD79850, v15);
    }

    objc_msgSend((id)qword_1ECD79810, "addObject:", v10);
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v33 = v8;
    v18 = v8;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v41 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          if (objc_msgSend(v23, "displayType", v33) == 7)
          {
            v24 = (void *)qword_1ECD79810;
            objc_msgSend(v23, "representedString");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v24) = objc_msgSend(v24, "containsObject:", v25);

            if ((_DWORD)v24)
            {
              objc_msgSend(v23, "setDisplayString:", v10);
              objc_msgSend(v23, "setRepresentedString:", v10);
            }
            objc_msgSend(v23, "secondaryRepresentedStrings");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = (void *)objc_msgSend(v26, "mutableCopy");

            objc_msgSend(v23, "secondaryDisplayStrings");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = (void *)objc_msgSend(v28, "mutableCopy");

            objc_msgSend(v23, "secondaryRepresentedStrings");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v36[0] = MEMORY[0x1E0C809B0];
            v36[1] = 3221225472;
            v36[2] = __69__UIKeyboardLayoutStar_setPercentSignKeysForCurrentLocaleOnKeyplane___block_invoke_2;
            v36[3] = &unk_1E16D4108;
            v37 = v27;
            v38 = v10;
            v39 = v29;
            v31 = v29;
            v32 = v27;
            objc_msgSend(v30, "enumerateObjectsUsingBlock:", v36);

            objc_msgSend(v23, "setSecondaryRepresentedStrings:", v32);
            objc_msgSend(v23, "setSecondaryDisplayStrings:", v31);

          }
          else
          {
            objc_msgSend(v23, "setDisplayString:", v10);
            objc_msgSend(v23, "setRepresentedString:", v10);
          }
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      }
      while (v20);
    }

    v6 = v34;
    v3 = v35;
    v8 = v33;
  }

}

- (void)setCurrencyKeysForCurrentLocaleOnKeyplane:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  UIKeyboardGetCurrentInputMode();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localeIdentifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("$"), CFSTR("€"), CFSTR("£"), CFSTR("¥"), CFSTR("₩"), 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("Primary-Currency-Sign"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    UIKeyboardLocalizedObject(CFSTR("UI-PrimaryCurrencySign"), v32, 0, 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      UIKeyboardLocalizedString(CFSTR("UI-PrimaryCurrencySign"), v31, 0, CFSTR("$"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v38 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          if (objc_msgSend(v14, "displayType") == 7)
          {
            -[UIKeyboardLayoutStar updateCurrencySymbolForKey:withCurrencyString:](self, "updateCurrencySymbolForKey:withCurrencyString:", v14, v8);
          }
          else
          {
            objc_msgSend(v14, "setDisplayString:", v8);
            objc_msgSend(v14, "setRepresentedString:", v8);
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      }
      while (v11);
    }

  }
  v29 = v7;
  v15 = 0;
  do
  {
    objc_msgSend(v4, "cache");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v15 + 1;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Alternate-Currency-Sign-%d"), v15 + 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKey:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      v20 = UIKeyboardStringAlternateCurrencySign[v15];
      UIKeyboardLocalizedObject(v20, v32, 0, 0, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v21)
      {
        objc_msgSend(v30, "objectAtIndex:", v15 + 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        UIKeyboardLocalizedString(v20, v31, 0, v22);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v23 = v19;
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v34;
        do
        {
          for (j = 0; j != v25; ++j)
          {
            if (*(_QWORD *)v34 != v26)
              objc_enumerationMutation(v23);
            v28 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * j);
            if (objc_msgSend(v28, "displayType") == 7)
            {
              -[UIKeyboardLayoutStar updateCurrencySymbolForKey:withCurrencyString:](self, "updateCurrencySymbolForKey:withCurrencyString:", v28, v21);
            }
            else
            {
              objc_msgSend(v28, "setDisplayString:", v21);
              objc_msgSend(v28, "setRepresentedString:", v21);
            }
          }
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
        }
        while (v25);
      }

    }
    v15 = v17;
  }
  while (v17 != 4);

}

- (int)displayTypeHintForShiftKey
{
  int v2;
  int result;

  v2 = -[UIKBTree intForProperty:](self->_keyplane, "intForProperty:", CFSTR("shift-rendering")) - 22;
  result = 2;
  switch(v2)
  {
    case 0:
      result = 1;
      break;
    case 2:
      result = 7;
      break;
    case 4:
      return result;
    case 9:
      result = 3;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (int)displayTypeHintForMoreKey
{
  int result;
  int v3;

  result = -[UIKBTree intForProperty:](self->_keyplane, "intForProperty:", CFSTR("more-rendering"));
  if (result <= 25)
  {
    if (result != 6)
    {
      if (result == 8)
        return 5;
      else
        return result == 22;
    }
  }
  else
  {
    v3 = result - 26;
    result = 2;
    switch(v3)
    {
      case 0:
        return result;
      case 1:
        result = 4;
        break;
      case 5:
        result = 3;
        break;
      case 9:
        result = 8;
        break;
      default:
        return 0;
    }
  }
  return result;
}

- (BOOL)globeKeyDisplaysAsEmojiKey
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  char IsASCIICapable;
  void *v22;
  int v23;
  uint64_t v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentInputMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "normalizedIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("emoji"));

  if ((v6 & 1) == 0)
  {
    objc_msgSend(v3, "normalizedEnabledInputModeIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "activeUserSelectableInputModeIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "containsObject:", CFSTR("emoji")))
    {
      if (objc_msgSend(v9, "count") == 2)
      {
        if (UIKeyboardHas10KeyChineseKeyboard())
        {
          objc_msgSend(v3, "currentInputMode");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "identifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          TIInputModeGetLanguage();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = objc_msgSend(v12, "isEqualToString:", CFSTR("zh"));

LABEL_26:
          goto LABEL_27;
        }
LABEL_8:
        v7 = 1;
        goto LABEL_26;
      }
      if (-[UIKeyboardLayoutStar showsDedicatedEmojiKeyAlongsideGlobeButton](self, "showsDedicatedEmojiKeyAlongsideGlobeButton"))
      {
        goto LABEL_8;
      }
      if (objc_msgSend(v9, "count") == 3
        && ((-[UIKBTree visualStyling](self->_keyplane, "visualStyling") & 0x3F) == 0x18
         || (-[UIKBTree visualStyling](self->_keyplane, "visualStyling") & 0x3F) == 0x17))
      {
        v29 = 0u;
        v30 = 0u;
        v27 = 0u;
        v28 = 0u;
        objc_msgSend(v3, "activeUserSelectableInputModes");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        if (v13)
        {
          v14 = v13;
          v25 = 0;
          v15 = *(_QWORD *)v28;
LABEL_14:
          v16 = 0;
          while (1)
          {
            if (*(_QWORD *)v28 != v15)
              objc_enumerationMutation(obj);
            v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v16);
            if ((objc_msgSend(v17, "isExtensionInputMode", v25) & 1) != 0)
              break;
            objc_msgSend(v17, "normalizedIdentifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("emoji"));

            if ((v19 & 1) == 0)
            {
              objc_msgSend(v17, "normalizedIdentifier");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              IsASCIICapable = UIKeyboardLayoutDefaultTypeForInputModeIsASCIICapable(v20);

              if ((IsASCIICapable & 1) != 0)
              {
                LODWORD(v25) = 1;
              }
              else
              {
                objc_msgSend(v17, "normalizedIdentifier");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = UIKeyboardLayoutSupportsASCIIToggleKey(v22);

                HIDWORD(v25) |= v23;
              }
            }
            if (v14 == ++v16)
            {
              v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
              if (v14)
                goto LABEL_14;
              break;
            }
          }
        }
        else
        {
          v25 = 0;
        }

        v7 = v25 & BYTE4(v25);
        goto LABEL_26;
      }
    }
    v7 = 0;
    goto LABEL_26;
  }
  v7 = 0;
LABEL_27:

  return v7 & 1;
}

- (void)setReturnKeyEnabled:(BOOL)a3 withDisplayName:(id)a4 withType:(int)a5
{
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  int v12;
  BOOL v13;

  v8 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69__UIKeyboardLayoutStar_setReturnKeyEnabled_withDisplayName_withType___block_invoke;
  v10[3] = &unk_1E16D4070;
  v13 = a3;
  v10[4] = self;
  v11 = v8;
  v12 = a5;
  v9 = v8;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v10);

}

- (void)setTextEditingTraits:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  objc_super v43;
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v43.receiver = self;
  v43.super_class = (Class)UIKeyboardLayoutStar;
  -[UIKeyboardLayout setTextEditingTraits:](&v43, sel_setTextEditingTraits_, a3);
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  -[UIKBTree subtrees](self->_keyplane, "subtrees");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v40;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v40 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(v9, "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "_containsSubstring:", CFSTR("Assist"));

        if (v11)
        {
          v12 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
      if (v6)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v29 = v12;
  objc_msgSend(v12, "keySet");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "subtrees");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v14;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v36;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v36 != v17)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        objc_msgSend(v19, "subtrees");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v32;
          do
          {
            v24 = 0;
            do
            {
              if (*(_QWORD *)v32 != v23)
                objc_enumerationMutation(v20);
              v25 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v24);
              if (objc_msgSend(v25, "displayType") == 39
                || objc_msgSend(v25, "displayType") == 40
                || objc_msgSend(v25, "displayType") == 41
                || objc_msgSend(v25, "displayType") == 49)
              {
                objc_msgSend(v25, "setSelectedVariantIndex:", 0x7FFFFFFFFFFFFFFFLL);
                -[UIKeyboardLayoutStar highlightedVariantListForStylingKey:](self, "highlightedVariantListForStylingKey:", v25);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "setHighlightedVariantsList:", v26);

                v27 = -[UIKeyboardLayoutStar stateForStylingKey:](self, "stateForStylingKey:", v25);
LABEL_26:
                -[UIKeyboardLayoutStar setState:forKey:](self, "setState:forKey:", v27, v25);
                goto LABEL_27;
              }
              if (objc_msgSend(v25, "displayType") == 42
                || objc_msgSend(v25, "displayType") == 43
                || objc_msgSend(v25, "displayType") == 44
                || objc_msgSend(v25, "displayType") == 45
                || objc_msgSend(v25, "displayType") == 46)
              {
                v27 = -[UIKeyboardLayoutStar stateForManipulationKey:](self, "stateForManipulationKey:", v25);
                goto LABEL_26;
              }
LABEL_27:
              ++v24;
            }
            while (v22 != v24);
            v28 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
            v22 = v28;
          }
          while (v28);
        }

      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
    }
    while (v16);
  }

}

- (id)cacheIdentifierForKeyplaneNamed:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = -[UIKeyboardLayoutStar showsInternationalKey](self, "showsInternationalKey");
  LODWORD(self) = -[UIKeyboardLayoutStar showsDictationKey](self, "showsDictationKey");
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localeIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingFormat:", CFSTR("-%d-%d-%@"), v5, self, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)showsInternationalKey
{
  return self->_showIntlKey;
}

- (BOOL)showsDictationKey
{
  return self->_showDictationKey;
}

void __82__UIKeyboardLayoutStar_UIKeyboardLayoutJapanese50OnFlick__handleDismissFlickView___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;
  id v8;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "taskQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __82__UIKeyboardLayoutStar_UIKeyboardLayoutJapanese50OnFlick__handleDismissFlickView___block_invoke_2;
  v5[3] = &unk_1E16D41C0;
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v7 = v4;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v2, "addTask:", v5);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)didClearInput
{
  objc_super v3;

  -[UIKeyboardLayoutStar clearHandwritingStrokesIfNeededAndNotify:](self, "clearHandwritingStrokesIfNeededAndNotify:", 0);
  v3.receiver = self;
  v3.super_class = (Class)UIKeyboardLayoutStar;
  -[UIKeyboardLayout didClearInput](&v3, sel_didClearInput);
}

- (void)clearHandwritingStrokesIfNeededAndNotify:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  if (-[UIKeyboardLayoutStar isHandwritingPlane](self, "isHandwritingPlane"))
  {
    -[UIKBTree cachedKeysByKeyName:](self->_keyplane, "cachedKeysByKeyName:", CFSTR("Handwriting-Input"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    -[UIKeyboardLayoutStar viewForKey:](self, "viewForKey:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clearAndNotify:", v3);
    objc_msgSend(v6, "clearTouches");

  }
}

- (BOOL)isHandwritingPlane
{
  void *v3;
  void *v4;
  char v5;

  -[UIKBTree name](self->_keyboard, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "_containsSubstring:", CFSTR("HWR")))
  {
    -[UIKBTree name](self->_keyplane, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "_containsSubstring:", CFSTR("Letters"));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)updateBackgroundIfNeeded
{
  uint64_t v3;
  void *v4;
  int64_t v5;
  UIKBBackgroundView *v6;
  UIKBBackgroundView *v7;
  UIKBBackgroundView *backgroundView;
  void *v9;

  -[UIView superview](self->_keyplaneView, "superview");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3, v5 = -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom"), v4, v5 != 2))
  {
    if (!self->_backgroundView)
    {
      v6 = [UIKBBackgroundView alloc];
      -[UIView bounds](self, "bounds");
      v7 = -[UIKBBackgroundView initWithFrame:](v6, "initWithFrame:");
      backgroundView = self->_backgroundView;
      self->_backgroundView = v7;

    }
    -[UIView setHidden:](self->_backgroundView, "setHidden:", -[UIKeyboardLayoutStar isEmojiKeyplane](self, "isEmojiKeyplane"));
    -[UIView bounds](self, "bounds");
    -[UIView setFrame:](self->_backgroundView, "setFrame:");
    -[UIKBBackgroundView setScreenTraits:](self->_backgroundView, "setScreenTraits:", self->super._screenTraits);
    -[UIKeyboardLayoutStar renderConfig](self, "renderConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBBackgroundView setRenderConfig:](self->_backgroundView, "setRenderConfig:", v9);

    -[UIKBBackgroundView refreshStyleForKeyplane:inputTraits:](self->_backgroundView, "refreshStyleForKeyplane:inputTraits:", self->_keyplane, self->super._inputTraits);
    if (!-[UIKeyboardPinchGestureRecognizer pinchDetected](self->_pinchGestureRecognizer, "pinchDetected"))
      -[UIView setHidden:](self->_backgroundView, "setHidden:", 0);
    -[UIView setOpaque:](self, "setOpaque:", 0);
  }
  else
  {
    -[UIView setHidden:](self->_backgroundView, "setHidden:", 1);
  }
}

- (UIKeyboardLayoutStar)initWithFrame:(CGRect)a3
{
  UIKeyboardLayoutStar *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *keyboards;
  NSMutableDictionary *v6;
  NSMutableDictionary *allKeyplaneViews;
  NSMutableSet *v8;
  NSMutableSet *allKeyplaneKeycaps;
  NSMutableSet *v10;
  NSMutableSet *keysUnderIndicator;
  NSMutableDictionary *v12;
  NSMutableDictionary *extendedTouchInfoMap;
  UIKBResizingKeyplaneCoordinator *v14;
  UIKBResizingKeyplaneCoordinator *resizingKeyplaneCoordinator;
  UIKBKeyplaneView *keyplaneView;
  UIKBBackgroundView *backgroundView;
  NSString *localizedInputKey;
  NSTimer *flickPopuptimer;
  UIView *flickPopupView;
  NSMutableDictionary *v21;
  NSMutableDictionary *compositeImages;
  void *v23;
  _UIKeyboardTypingSpeedLogger *v24;
  _UIKeyboardTypingSpeedLogger *typingSpeedLogger;
  NSMutableSet *v26;
  NSMutableSet *keyplaneTransformations;
  uint64_t v28;
  NSDate *prevProgressiveCandidateRequestTime;
  NSTimer *progressiveCandidateUpdateTimer;
  void *v31;
  UIKeyboardLayoutStar *v32;
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)UIKeyboardLayoutStar;
  v3 = -[UIKeyboardLayout initWithFrame:](&v34, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v3->_lastTwoFingerTapTimestamp = CFAbsoluteTimeGetCurrent();
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    keyboards = v3->_keyboards;
    v3->_keyboards = v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    allKeyplaneViews = v3->_allKeyplaneViews;
    v3->_allKeyplaneViews = v6;

    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    allKeyplaneKeycaps = v3->_allKeyplaneKeycaps;
    v3->_allKeyplaneKeycaps = v8;

    v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    keysUnderIndicator = v3->_keysUnderIndicator;
    v3->_keysUnderIndicator = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    extendedTouchInfoMap = v3->_extendedTouchInfoMap;
    v3->_extendedTouchInfoMap = v12;

    v14 = objc_alloc_init(UIKBResizingKeyplaneCoordinator);
    resizingKeyplaneCoordinator = v3->_resizingKeyplaneCoordinator;
    v3->_resizingKeyplaneCoordinator = v14;

    -[UIKBResizingKeyplaneCoordinator setDelegate:](v3->_resizingKeyplaneCoordinator, "setDelegate:", v3);
    -[UIKeyboardLayoutStar installGestureRecognizers](v3, "installGestureRecognizers");
    keyplaneView = v3->_keyplaneView;
    v3->_keyplaneView = 0;

    backgroundView = v3->_backgroundView;
    v3->_backgroundView = 0;

    localizedInputKey = v3->_localizedInputKey;
    v3->_localizedInputKey = 0;

    flickPopuptimer = v3->_flickPopuptimer;
    v3->_flickPopuptimer = 0;

    flickPopupView = v3->_flickPopupView;
    v3->_flickPopupView = 0;

    v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    compositeImages = v3->_compositeImages;
    v3->_compositeImages = v21;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObserver:selector:name:object:", v3, sel_refreshForDictationAvailablityDidChange, CFSTR("UIKeyboardDictationAvailabilityDidChangeNotification"), 0);
    objc_msgSend(v23, "addObserver:selector:name:object:", v3, sel_refreshForDictationAvailablityDidChange, CFSTR("UIDictationControllerDictationDidFinish"), 0);
    objc_msgSend(v23, "addObserver:selector:name:object:", v3, sel_nextToUseInputModeDidChange_, CFSTR("UITextInputNextInputModeInputModeDidChangeNotification"), 0);
    objc_msgSend(v23, "addObserver:selector:name:object:", v3, sel_didTriggerDestructiveRenderConfigChange, CFSTR("UIAccessibilityBoldTextStatusDidChangeNotification"), 0);
    v24 = objc_alloc_init(_UIKeyboardTypingSpeedLogger);
    typingSpeedLogger = v3->_typingSpeedLogger;
    v3->_typingSpeedLogger = v24;

    v26 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    keyplaneTransformations = v3->_keyplaneTransformations;
    v3->_keyplaneTransformations = v26;

    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v28 = objc_claimAutoreleasedReturnValue();
    prevProgressiveCandidateRequestTime = v3->_prevProgressiveCandidateRequestTime;
    v3->_prevProgressiveCandidateRequestTime = (NSDate *)v28;

    progressiveCandidateUpdateTimer = v3->_progressiveCandidateUpdateTimer;
    v3->_progressiveCandidateUpdateTimer = 0;

    -[UIKeyboardLayout typingStyleEstimator](v3, "typingStyleEstimator");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setDelegate:", v3);

    objc_storeWeak(&currentInstance, v3);
    v32 = v3;

  }
  return v3;
}

- (void)installGestureRecognizers
{
  UISwipeGestureRecognizer *v3;
  UISwipeGestureRecognizer *upSwipeRecognizer;
  UISwipeGestureRecognizer *v5;
  UISwipeGestureRecognizer *v6;
  UIKeyboardPinchGestureRecognizer *v7;
  UIKeyboardPinchGestureRecognizer *pinchGestureRecognizer;

  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v3 = -[UISwipeGestureRecognizer initWithTarget:action:]([UISwipeGestureRecognizer alloc], "initWithTarget:action:", self, sel_swipeDetected_);
    upSwipeRecognizer = self->_upSwipeRecognizer;
    self->_upSwipeRecognizer = v3;

    -[UIGestureRecognizer setDelaysTouchesBegan:](self->_upSwipeRecognizer, "setDelaysTouchesBegan:", 0);
    -[UIGestureRecognizer setCancelsTouchesInView:](self->_upSwipeRecognizer, "setCancelsTouchesInView:", 0);
    -[UIGestureRecognizer setDelaysTouchesEnded:](self->_upSwipeRecognizer, "setDelaysTouchesEnded:", 0);
    -[UISwipeGestureRecognizer setDirection:](self->_upSwipeRecognizer, "setDirection:", 4);
    v5 = self->_upSwipeRecognizer;
    if (v5)
    {
      v5->_minimumPrimaryMovement = 40.0;
      v6 = self->_upSwipeRecognizer;
    }
    else
    {
      v6 = 0;
    }
    -[UIGestureRecognizer setDelegate:](v6, "setDelegate:", self);
    -[UIView addGestureRecognizer:](self, "addGestureRecognizer:", self->_upSwipeRecognizer);
    v7 = -[UIKeyboardPinchGestureRecognizer initWithTarget:action:]([UIKeyboardPinchGestureRecognizer alloc], "initWithTarget:action:", self, sel_pinchHandler_);
    pinchGestureRecognizer = self->_pinchGestureRecognizer;
    self->_pinchGestureRecognizer = v7;

    -[UIGestureRecognizer setDelaysTouchesBegan:](self->_pinchGestureRecognizer, "setDelaysTouchesBegan:", 0);
    -[UIGestureRecognizer setCancelsTouchesInView:](self->_pinchGestureRecognizer, "setCancelsTouchesInView:", 0);
    -[UIGestureRecognizer setDelaysTouchesEnded:](self->_pinchGestureRecognizer, "setDelaysTouchesEnded:", 0);
    -[UIKeyboardPinchGestureRecognizer setPinchDelegate:](self->_pinchGestureRecognizer, "setPinchDelegate:", self);
    -[UIGestureRecognizer setDelegate:](self->_pinchGestureRecognizer, "setDelegate:", self);
    -[UIView addGestureRecognizer:](self, "addGestureRecognizer:", self->_pinchGestureRecognizer);
  }
}

- (void)showKeyboardWithInputTraits:(id)a3 screenTraits:(id)a4 splitTraits:(id)a5
{
  -[UIKeyboardLayoutStar showKeyboardWithInputMode:renderConfig:inputTraits:screenTraits:splitTraits:reload:](self, "showKeyboardWithInputMode:renderConfig:inputTraits:screenTraits:splitTraits:reload:", 0, 0, a3, a4, a5, 0);
}

- (id)initialKeyplaneNameWithKBStarName:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  _BOOL4 shift;
  int v12;
  int v13;
  void *v14;
  uint64_t v15;
  NSString *preRotateKeyplaneName;
  NSString *v17;
  void *v18;
  uint64_t v19;
  NSString *v20;
  void *v21;
  void *v22;
  void *v23;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v25 = a3;
  -[UIKBTree subtrees](self->_keyboard, "subtrees");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (!v5)
  {
    v7 = 0;
    goto LABEL_21;
  }
  v6 = v5;
  v7 = 0;
  v8 = *(_QWORD *)v27;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v27 != v8)
        objc_enumerationMutation(v4);
      if (!v7)
      {
        v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        if (objc_msgSend(v10, "supportsType:", -[UITextInputTraits keyboardType](self->super._inputTraits, "keyboardType")))
        {
          objc_msgSend(v10, "name");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          shift = self->_shift;
          v12 = objc_msgSend(v10, "BOOLForProperty:", CFSTR("autoshift"));
          if (shift)
            v13 = v12;
          else
            v13 = 0;
          if (v13 != objc_msgSend(v10, "isShiftKeyplane"))
          {
            objc_msgSend(v10, "firstCachedKeyWithName:", CFSTR("Emoji-International-Key"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v14)
            {
              if (-[UIKeyboardLayoutStar shouldUseDefaultShiftStateFromLayout](self, "shouldUseDefaultShiftStateFromLayout"))
              {
                continue;
              }
              objc_msgSend(v10, "shiftAlternateKeyplaneName");
              v15 = objc_claimAutoreleasedReturnValue();
              v14 = v7;
              v7 = (void *)v15;
            }

          }
        }
        else
        {
          v7 = 0;
        }
      }
    }
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  }
  while (v6);
LABEL_21:

  preRotateKeyplaneName = self->_preRotateKeyplaneName;
  if (preRotateKeyplaneName)
  {
    v17 = preRotateKeyplaneName;
    -[UIKBTree subtreeWithName:](self->_keyboard, "subtreeWithName:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      -[UIKeyboardLayoutStar defaultNameForKeyplaneName:](self, "defaultNameForKeyplaneName:", self->_preRotateKeyplaneName);
      v19 = objc_claimAutoreleasedReturnValue();

      v17 = (NSString *)v19;
    }
    -[UIKBTree subtreeWithName:](self->_keyboard, "subtreeWithName:", v17);
    v20 = (NSString *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      if (v17 && v17 != self->_preRotateKeyplaneName)
      {
        v20 = v17;

        v17 = self->_preRotateKeyplaneName;
        self->_preRotateKeyplaneName = 0;
        v7 = v20;
        goto LABEL_28;
      }
    }
    else
    {
LABEL_28:

      v17 = v20;
    }
    v21 = v25;

    if (!v7)
    {
LABEL_30:
      -[UIKBTree subtrees](self->_keyboard, "subtrees");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectAtIndex:", 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      NSLog(CFSTR("Can't find keyplane that supports type %ld for keyboard %@; using %@"),
        -[UITextInputTraits keyboardType](self->super._inputTraits, "keyboardType"),
        v21,
        v7);
    }
  }
  else
  {
    v21 = v25;
    if (!v7)
      goto LABEL_30;
  }

  return v7;
}

- (void)showKeyboardWithInputMode:(id)a3 renderConfig:(id)a4 inputTraits:(id)a5 screenTraits:(id)a6 splitTraits:(id)a7 reload:(BOOL)a8
{
  _BOOL4 v8;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  UITextInputTraits *inputTraits;
  BOOL v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  _BOOL8 v31;
  void *v32;
  objc_super v33;

  v8 = a8;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  if (self->_isTrackpadMode)
    -[UIKeyboardLayoutStar didEndIndirectSelectionGesture:](self, "didEndIndirectSelectionGesture:", 0);
  -[UIKeyboardLayoutStar cleanupPreviousKeyboardWithNewInputTraits:](self, "cleanupPreviousKeyboardWithNewInputTraits:", v16);
  inputTraits = self->super._inputTraits;
  if (inputTraits)
    v20 = !-[UITextInputTraits publicTraitsMatchTraits:](inputTraits, "publicTraitsMatchTraits:", v16);
  else
    v20 = 0;
  self->_inputTraitsPreventInitialReuse = v20;
  v33.receiver = self;
  v33.super_class = (Class)UIKeyboardLayoutStar;
  -[UIKeyboardLayout showKeyboardWithInputTraits:screenTraits:splitTraits:](&v33, sel_showKeyboardWithInputTraits_screenTraits_splitTraits_, v16, v17, v18);
  if (!v14)
  {
    UIKeyboardGetCurrentInputMode();
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "allowsReachableKeyboard");

  if (v22)
  {
    objc_msgSend(v17, "idiom");
    objc_msgSend(v17, "orientation");
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "preferencesActions");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    self->_currentHandBias = objc_msgSend(v24, "handBias");

  }
  UIKeyboardGetKBStarName(v14, v17, objc_msgSend(v16, "keyboardType"), 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardLayoutStar setKeyboardName:appearance:](self, "setKeyboardName:appearance:", v25, objc_msgSend(v16, "keyboardAppearance"));
  if (self->_keyboard)
  {
    -[UIKeyboardLayoutStar stretchFactor](self, "stretchFactor");
    -[UIKBScreenTraits setStretchFactor:](self->super._screenTraits, "setStretchFactor:");
    if (!v15)
    {
      -[UIView _inheritedRenderConfig](self, "_inheritedRenderConfig");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if (v26)
      {
        v28 = v26;
      }
      else
      {
        +[UIKBRenderConfig defaultConfig](UIKBRenderConfig, "defaultConfig");
        v28 = (id)objc_claimAutoreleasedReturnValue();
      }
      v15 = v28;

    }
    -[UIKeyboardLayoutStar setRenderConfig:updateKeyplane:](self, "setRenderConfig:updateKeyplane:", v15, 0, v15);
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    self->_shift = objc_msgSend(v29, "isShifted");

    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    self->_autoshift = objc_msgSend(v30, "isAutoShifted");

    -[UIKeyboardLayoutStar setLayoutTag:](self, "setLayoutTag:", CFSTR("Default"));
    if (v8)
      -[UIKeyboardLayoutStar setKeyboardName:](self, "setKeyboardName:", 0);
    -[UIKeyboardLayoutStar setToInitialKeyplane](self, "setToInitialKeyplane");
    if (-[UIKeyboardLayoutStar shouldUseDefaultShiftStateFromLayout](self, "shouldUseDefaultShiftStateFromLayout"))
    {
      self->_shift = -[UIKBTree isShiftKeyplane](self->_keyplane, "isShiftKeyplane");
      self->_autoshift = 0;
    }
    -[UIKeyboardLayout reloadKeyboardGestureRecognition](self, "reloadKeyboardGestureRecognition");
    v15 = v32;
    if (+[UIKeyboardImpl rivenPreference](UIKeyboardImpl, "rivenPreference"))
      v31 = -[UIKeyboardLayoutStar pinchSplitGestureEnabled](self, "pinchSplitGestureEnabled");
    else
      v31 = 0;
    -[UIGestureRecognizer setEnabled:](self->_pinchGestureRecognizer, "setEnabled:", v31);
  }

}

- (BOOL)shouldUseDefaultShiftStateFromLayout
{
  return 0;
}

- (CGSize)stretchFactor
{
  double v3;
  void *v4;
  int64_t v5;
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
  double v16;
  double v17;
  double v18;
  CGSize result;

  v3 = 1.0;
  if (-[UIKeyboardLayoutStar stretchKeyboardToFit](self, "stretchKeyboardToFit"))
  {
    if (self->_keyboard)
    {
      -[UIKeyboardLayout sizeDelegate](self, "sizeDelegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -[UIKeyboardLayout orientation](self, "orientation");
      +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "currentInputMode");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "deviceSpecificPaddingForInterfaceOrientation:inputMode:", v5, v7);
      v9 = v8;
      v11 = v10;

      -[UIKBScreenTraits bounds](self->super._screenTraits, "bounds");
      v13 = v12;
      -[UIKBTree frame](self->_keyboard, "frame");
      if (v14 > 0.0)
      {
        -[UIKBTree frame](self->_keyboard, "frame");
        v3 = (v13 - (v9 + v11)) / v15;
      }
    }
  }
  -[UIKeyboardLayoutStar stretchFactorHeight](self, "stretchFactorHeight");
  v17 = v16;
  v18 = v3;
  result.height = v17;
  result.width = v18;
  return result;
}

- (void)updateKeyboardForKeyplane:(id)a3
{
  void *v4;
  void *v5;
  NSNumber *homeRowHint;
  id v7;

  -[UIKeyboardLayoutStar sizeForKeyplane:](self, "sizeForKeyplane:", a3);
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentInputMode");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[UIKeyboardLayout sizeDelegate](self, "sizeDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceSpecificStaticHitBufferForInterfaceOrientation:inputMode:", -[UIKeyboardLayout orientation](self, "orientation"), v7);

  -[UIView frame](self, "frame");
  -[UIView setFrame:](self, "setFrame:");
  homeRowHint = self->_homeRowHint;
  self->_homeRowHint = 0;

}

- (void)setToInitialKeyplane
{
  void *v3;
  id v4;

  -[UIKBTree name](self->_keyboard, "name");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardLayoutStar initialKeyplaneNameWithKBStarName:](self, "initialKeyplaneNameWithKBStarName:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardLayoutStar setKeyplaneName:](self, "setKeyplaneName:", v3);

}

- (void)setLayoutTag:(id)a3
{
  objc_storeStrong((id *)&self->_layoutTag, a3);
  -[UIKeyboardLayoutStar updateLayoutTags](self, "updateLayoutTags");
  -[UIKeyboardLayoutStar updateCachedKeyplaneKeycaps](self, "updateCachedKeyplaneKeycaps");
}

- (unint64_t)keyplaneShiftState
{
  void *v3;
  char v4;
  void *v6;
  char v7;
  void *v8;
  char v9;

  -[UIKBTree name](self->_keyplane, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsString:", CFSTR("Uncased"));

  if ((v4 & 1) != 0)
    return 4;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isAutoShifted");

  if ((v7 & 1) != 0)
    return 2;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isShiftLocked");

  if ((v9 & 1) != 0)
    return 3;
  else
    return self->_shift;
}

- (void)cleanupPreviousKeyboardWithNewInputTraits:(id)a3
{
  UIKBKeyViewAnimator *keyViewAnimator;
  id v5;

  v5 = a3;
  keyViewAnimator = self->_keyViewAnimator;
  self->_keyViewAnimator = 0;

  if (-[UIKeyboardLayoutStar isEmojiKeyplane](self, "isEmojiKeyplane"))
    +[UIKeyboardEmojiKeyDisplayController writeEmojiDefaultsAndReleaseActiveInputView](UIKeyboardEmojiKeyDisplayController, "writeEmojiDefaultsAndReleaseActiveInputView");
  if (-[UIKeyboardLayoutStar isDeveloperGestureKeybaord](self, "isDeveloperGestureKeybaord")
    && objc_msgSend(v5, "keyboardType") != 12)
  {
    -[UIKeyboardLayoutStar clearKeyAnnotationsIfNecessary](self, "clearKeyAnnotationsIfNecessary");
  }

}

- (unint64_t)targetEdgesForScreenGestureRecognition
{
  return 4 * (-[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 1);
}

- (void)transitionToPunctuationKeysVisible:(BOOL)a3
{
  _BOOL4 v3;
  UIView *v5;
  UIView *v6;
  UIView *keyplaneTransformationAreaView;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  BOOL v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  UIKeyboardLayoutStar *v25;
  id v26;
  id v27;
  BOOL v28;
  _QWORD v29[3];
  _QWORD v30[3];
  _QWORD v31[3];
  _QWORD v32[3];
  _QWORD v33[3];
  _QWORD v34[5];

  v3 = a3;
  v34[3] = *MEMORY[0x1E0C80C00];
  if (!self->_keyplaneTransformationAreaView)
  {
    v5 = [UIView alloc];
    -[UIView bounds](self, "bounds");
    v6 = -[UIView initWithFrame:](v5, "initWithFrame:");
    keyplaneTransformationAreaView = self->_keyplaneTransformationAreaView;
    self->_keyplaneTransformationAreaView = v6;

    -[UIView setUserInteractionEnabled:](self->_keyplaneTransformationAreaView, "setUserInteractionEnabled:", 0);
    -[UIView addSubview:](self, "addSubview:", self->_keyplaneTransformationAreaView);
  }
  v20 = v3;
  if (-[UIKeyboardLayoutStar _continuousPathModalPunctuationPlaneEnabled](self, "_continuousPathModalPunctuationPlaneEnabled")&& self->_showsPunctuationKeysOnPrimaryKeyplane != v3)
  {
    -[UIKeyboardLayoutStar cancelModalDoubleConsonantKeysTimer](self, "cancelModalDoubleConsonantKeysTimer");
    -[UIView _rootInputWindowController](self, "_rootInputWindowController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "inputViewSnapshotOfView:afterScreenUpdates:", self->_keyplaneView, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIView addSubview:](self->_keyplaneTransformationAreaView, "addSubview:", v8);
    self->_showsPunctuationKeysOnPrimaryKeyplane = v3;
    -[UIKeyboardLayoutStar reloadCurrentKeyplane](self, "reloadCurrentKeyplane");
    -[UIView forceDisplayIfNeeded](self->_keyplaneView, "forceDisplayIfNeeded");
  }
  else
  {
    v8 = 0;
  }
  v33[0] = &unk_1E1A985E0;
  v33[1] = &unk_1E1A985B0;
  v34[0] = &unk_1E1A95AC0;
  v34[1] = &unk_1E1A95AA0;
  v33[2] = &unk_1E1A984F0;
  v34[2] = &unk_1E1A95AC0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = &unk_1E1A985E0;
  v31[1] = &unk_1E1A985B0;
  v32[0] = &unk_1E1A95AA0;
  v32[1] = &unk_1E1A95AA0;
  v31[2] = &unk_1E1A984F0;
  v32[2] = &unk_1E1A95AA0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = &unk_1E1A985E0;
  v29[1] = &unk_1E1A985B0;
  v30[0] = &unk_1E1A95AC0;
  v30[1] = &unk_1E1A95AC0;
  v29[2] = &unk_1E1A984F0;
  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[UIKeyboardLayoutStar renderConfig](self, "renderConfig");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lightKeycapOpacity");
  objc_msgSend(v12, "numberWithDouble:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __75__UIKeyboardLayoutStar_ContinuousPath__transitionToPunctuationKeysVisible___block_invoke;
  v23[3] = &unk_1E16BD778;
  v24 = v8;
  v25 = self;
  v28 = v20;
  v26 = v10;
  v27 = v15;
  v21[0] = v16;
  v21[1] = 3221225472;
  v21[2] = __75__UIKeyboardLayoutStar_ContinuousPath__transitionToPunctuationKeysVisible___block_invoke_2;
  v21[3] = &unk_1E16B3FD8;
  v22 = v24;
  v17 = v24;
  v18 = v15;
  v19 = v10;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 6, v23, v21, 0.23, 0.0);

}

- (BOOL)_continuousPathModalPunctuationPlaneEnabled
{
  void *v2;
  void *v3;
  char v4;
  void *v6;

  UIKeyboardGetCurrentInputMode();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  KBStarLayoutString(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Korean")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("Korean-With-QWERTY")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("Thai")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DBDCA8], "sharedPreferencesController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v6, "BOOLForPreferenceKey:", *MEMORY[0x1E0DBE200]);

  }
  return v4;
}

void __50__UIKeyboardLayoutStar_getHandRestRecognizerState__block_invoke()
{
  int v0;
  int v1;
  void *v2;
  double v3;
  id v4;

  if (_UIInternalPreferencesRevisionOnce != -1)
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_4_20);
  v0 = _UIInternalPreferencesRevisionVar;
  if (_UIInternalPreferencesRevisionVar < 1)
    goto LABEL_4;
  v1 = _UIInternalPreference__UIRestablePadKeyboardsEnabled;
  if (_UIInternalPreferencesRevisionVar == _UIInternalPreference__UIRestablePadKeyboardsEnabled)
    goto LABEL_4;
  while (v0 >= v1)
  {
    _UIInternalPreferenceSync(v0, &_UIInternalPreference__UIRestablePadKeyboardsEnabled, (uint64_t)CFSTR("_UIRestablePadKeyboardsEnabled"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
    v1 = _UIInternalPreference__UIRestablePadKeyboardsEnabled;
    if (v0 == _UIInternalPreference__UIRestablePadKeyboardsEnabled)
      goto LABEL_4;
  }
  if (!byte_1ECD7669C)
  {
LABEL_4:
    _MergedGlobals_79 = 0;
  }
  else
  {
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferencesActions");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "rivenSizeFactor:", 1.0);
    _MergedGlobals_79 = v3 <= 1.0;

  }
}

- (void)dismissGestureKeyboardIntroduction
{
  UIGestureKeyboardIntroduction *gestureKeyboardIntroduction;
  UIGestureKeyboardIntroduction *v4;

  gestureKeyboardIntroduction = self->_gestureKeyboardIntroduction;
  if (gestureKeyboardIntroduction)
  {
    -[UIGestureKeyboardIntroduction dismissGestureKeyboardIntroduction](gestureKeyboardIntroduction, "dismissGestureKeyboardIntroduction");
    v4 = self->_gestureKeyboardIntroduction;
    self->_gestureKeyboardIntroduction = 0;

  }
}

- (BOOL)shouldDeactivateWithoutWindow
{
  return 1;
}

- (BOOL)_allowContinuousPathUI
{
  BOOL v3;
  void *v4;
  char v5;
  _BOOL8 v6;
  void *v7;

  v3 = (-[UIKeyboardLayoutStar isAlphabeticPlane](self, "isAlphabeticPlane")
     || -[UIKeyboardLayoutStar supportsContinuousPath](self, "supportsContinuousPath"))
    && (-[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 1
     && -[UIKeyboardLayout isFloating](self, "isFloating")
     || !-[UIKBScreenTraits idiom](self->super._screenTraits, "idiom")
     || -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 4);
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "usesContinuousPath"))
  {
    v5 = v3 & ~-[UITextInputTraits isSecureTextEntry](self->super._inputTraits, "isSecureTextEntry");

    if ((v5 & 1) != 0)
    {
      v6 = 1;
      goto LABEL_16;
    }
  }
  else
  {

  }
  if (-[UIKeyboardLayoutStar shouldIgnoreContinuousPathRequirements](self, "shouldIgnoreContinuousPathRequirements"))
    v6 = -[UIKeyboardLayoutStar isAlphabeticPlane](self, "isAlphabeticPlane");
  else
    v6 = 0;
LABEL_16:
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLayoutAllowsContinuousPath:", v6);

  return v6;
}

- (id)accessibilityIdentifier
{
  return CFSTR("UIKeyboardLayoutStar Preview");
}

- (void)dealloc
{
  void *v3;
  UIKBTree *multitapKey;
  void *v5;
  void *v6;
  void *v7;
  UIKeyboardSplitTransitionView *transitionView;
  UIKeyboardSplitTransitionView *v9;
  UIKBRenderConfig *passcodeRenderConfig;
  NSMutableSet *accentInfo;
  NSMutableSet *hasAccents;
  NSTimer *flickPopuptimer;
  objc_super v14;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  self->_inDealloc = 1;
  +[UIInputSwitcherView activeInstance](UIInputSwitcherView, "activeInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLayout:", 0);

  objc_storeWeak(&currentInstance, 0);
  -[UIKeyboardLayoutStar uninstallGestureRecognizers](self, "uninstallGestureRecognizers");
  -[UIKeyboardLayoutStar deactivateActiveKeys](self, "deactivateActiveKeys");
  multitapKey = self->_multitapKey;
  self->_multitapKey = 0;

  -[UIKeyboardLayoutStar cancelMultitapTimer](self, "cancelMultitapTimer");
  -[UIKeyboardLayoutStar cancelModalDoubleConsonantKeysTimer](self, "cancelModalDoubleConsonantKeysTimer");
  -[UIKeyboardLayoutStar rollbackKeyplaneTransformations](self, "rollbackKeyplaneTransformations");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = CFSTR("UIKeyboardDictationAvailabilityDidChangeNotification");
  v15[1] = CFSTR("UITextInputNextInputModeInputModeDidChangeNotification");
  v15[2] = CFSTR("UIAccessibilityBoldTextStatusDidChangeNotification");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNotificationCenter _uiRemoveObserver:names:](v5, self, v6);

  if (self->_transitionView)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObserver:", self->_transitionView);

    transitionView = self->_transitionView;
  }
  else
  {
    transitionView = 0;
  }
  -[UIKeyboardSplitTransitionView setSplitTransitionDataSource:](transitionView, "setSplitTransitionDataSource:", 0);
  v9 = self->_transitionView;
  self->_transitionView = 0;

  objc_storeWeak((id *)&self->_splitKeyplaneTransitionDelegate, 0);
  passcodeRenderConfig = self->_passcodeRenderConfig;
  self->_passcodeRenderConfig = 0;

  accentInfo = self->_accentInfo;
  self->_accentInfo = 0;

  hasAccents = self->_hasAccents;
  self->_hasAccents = 0;

  -[UIKeyboardLayoutStar dismissGestureKeyboardIntroduction](self, "dismissGestureKeyboardIntroduction");
  -[NSTimer invalidate](self->_flickPopuptimer, "invalidate");
  flickPopuptimer = self->_flickPopuptimer;
  self->_flickPopuptimer = 0;

  -[NSTimer invalidate](self->_progressiveCandidateUpdateTimer, "invalidate");
  -[_UIKeyboardTypingSpeedLogger logToAggregate](self->_typingSpeedLogger, "logToAggregate");
  -[UIKeyboardLayoutStar removePathEffectViewConstraintsIfNeeded](self, "removePathEffectViewConstraintsIfNeeded");
  v14.receiver = self;
  v14.super_class = (Class)UIKeyboardLayoutStar;
  -[UIKeyboardLayout dealloc](&v14, sel_dealloc);
}

- (void)accessibilitySensitivityChanged
{
  -[NSMutableDictionary removeAllObjects](self->_allKeyplaneViews, "removeAllObjects");
}

+ (void)accessibilitySensitivityChanged
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(&currentInstance);
  objc_msgSend(WeakRetained, "accessibilitySensitivityChanged");

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  objc_super v5;

  if (self->_gestureKeyboardIntroduction)
    return 0;
  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardLayoutStar;
  -[UIView hitTest:withEvent:](&v5, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)clearUnusedObjects:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  UIKeyboardSplitTransitionView *transitionView;
  UIKeyboardSplitTransitionView *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  NSString *keyplaneName;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v3 = a3;
  v32 = *MEMORY[0x1E0C80C00];
  -[UIKeyboardLayoutStar clearTransientState](self, "clearTransientState");
  -[UIKeyboardLayoutStar deactivateActiveKeys](self, "deactivateActiveKeys");
  if (self->_transitionView)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:", self->_transitionView);

    transitionView = self->_transitionView;
  }
  else
  {
    transitionView = 0;
  }
  -[UIKeyboardSplitTransitionView setSplitTransitionDataSource:](transitionView, "setSplitTransitionDataSource:", 0);
  -[UIView removeFromSuperview](self->_transitionView, "removeFromSuperview");
  v7 = self->_transitionView;
  self->_transitionView = 0;

  v8 = objc_storeWeak((id *)&self->_splitKeyplaneTransitionDelegate, 0);
  v9 = (void *)MEMORY[0x186DC9484](v8);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[NSMutableDictionary keyEnumerator](self->_keyboards, "keyEnumerator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(v10);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "_containsSubstring:", CFSTR("Emoji")))
        {
          +[UIKeyboardEmojiKeyDisplayController writeEmojiDefaultsAndReleaseActiveInputView](UIKeyboardEmojiKeyDisplayController, "writeEmojiDefaultsAndReleaseActiveInputView");
          goto LABEL_14;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_14:

  if (v3)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[NSMutableDictionary objectEnumerator](self->_allKeyplaneViews, "objectEnumerator", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v23;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v23 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * j);
          objc_msgSend(v20, "purgeSubviews");
          objc_msgSend(v20, "purgeKeyViews");
          objc_msgSend(v20, "purgeLayerContents");
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      }
      while (v17);
    }

  }
  objc_autoreleasePoolPop(v9);
  keyplaneName = self->_keyplaneName;
  self->_keyplaneName = 0;

}

- (void)clearTransientState
{
  void *v3;
  void *v4;
  TUIKeyplaneView *liveKeyplaneView;

  -[UIKeyboardLayoutStar modalDisplayView](self, "modalDisplayView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIKeyboardLayoutStar modalDisplayView](self, "modalDisplayView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

    -[UIKeyboardLayoutStar setModalDisplayView:](self, "setModalDisplayView:", 0);
    liveKeyplaneView = self->_liveKeyplaneView;
    if (liveKeyplaneView)
      -[TUIKeyplaneView setHidden:](liveKeyplaneView, "setHidden:", 0);
    if (!-[UIKeyboardLayoutStar useCrescendoLayout](self, "useCrescendoLayout"))
      -[UIView setHidden:](self->_keyplaneView, "setHidden:", 0);
  }
}

- (void)removeFromSuperview
{
  objc_super v3;

  -[UIKeyboardLayoutStar clearTransientState](self, "clearTransientState");
  -[UIKeyboardLayoutStar deactivateActiveKeys](self, "deactivateActiveKeys");
  -[UIKeyboardLayoutStar cancelDelayedCentroidUpdate](self, "cancelDelayedCentroidUpdate");
  -[UIKeyboardSplitTransitionView setCompletionBlock:](self->_transitionView, "setCompletionBlock:", 0);
  -[UIKeyboardLayoutStar cancelMultitapTimer](self, "cancelMultitapTimer");
  -[UIKeyboardLayoutStar cancelModalDoubleConsonantKeysTimer](self, "cancelModalDoubleConsonantKeysTimer");
  -[UIKeyboardLayoutStar rollbackKeyplaneTransformations](self, "rollbackKeyplaneTransformations");
  -[UIKeyboardLayoutStar dismissGestureKeyboardIntroduction](self, "dismissGestureKeyboardIntroduction");
  v3.receiver = self;
  v3.super_class = (Class)UIKeyboardLayoutStar;
  -[UIView removeFromSuperview](&v3, sel_removeFromSuperview);
}

- (void)flushKeyCache:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  NSTimer *flickPopuptimer;
  NSTimer *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  if (v15)
  {
    if (+[UIView _isInAnimationBlock](UIView, "_isInAnimationBlock"))
      goto LABEL_9;
    objc_msgSend(v15, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("UIKeyboardChangedAccessoryOnly"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue");

    if ((v6 & 1) != 0)
      goto LABEL_9;
    if (!-[UIKeyboardPinchGestureRecognizer pinchDetected](self->_pinchGestureRecognizer, "pinchDetected"))
    {
      -[UIKeyboardLayoutStar clearAllTouchInfo](self, "clearAllTouchInfo");
      -[UIKeyboardLayoutStar handleDismissFlickView:](self, "handleDismissFlickView:", 0);
    }
  }
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stopAutoDelete");

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cancelAllKeyEvents");

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "clearLongPressTimer");

  flickPopuptimer = self->_flickPopuptimer;
  if (flickPopuptimer)
  {
    -[NSTimer invalidate](flickPopuptimer, "invalidate");
    v11 = self->_flickPopuptimer;
    self->_flickPopuptimer = 0;

  }
  -[UIKeyboardLayoutStar deactivateActiveKeysClearingTouchInfo:clearingDimming:](self, "deactivateActiveKeysClearingTouchInfo:clearingDimming:", 0, 0);
  +[UIInputSwitcherView activeInstance](UIInputSwitcherView, "activeInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "hide");

  +[UIKeyboardSplitControlMenu activeInstance](UIKeyboardSplitControlMenu, "activeInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "hide");

  +[UIKeyboardDictationMenu activeInstance](UIKeyboardDictationMenu, "activeInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "hide");

  -[UIKeyboardLayoutStar setActiveKey:](self, "setActiveKey:", 0);
  -[UIKeyboardLayoutStar setPreTouchKeyplaneName:](self, "setPreTouchKeyplaneName:", 0);
LABEL_9:

}

- (SEL)handlerForNotification:(id)a3
{
  return 0;
}

id __54__UIKeyboardLayoutStar_keyboardWithName_screenTraits___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  while (1)
  {
    v4 = objc_msgSend(v3, "rangeOfString:options:", CFSTR("-"), 4);
    if (v4 == 0x7FFFFFFFFFFFFFFFLL)
      break;
    objc_msgSend(v3, "substringToIndex:", v4);
    v5 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "keyboardFromFactoryWithName:screenTraits:", v5, *(_QWORD *)(a1 + 32));
    v6 = objc_claimAutoreleasedReturnValue();
    v3 = (id)v5;
    if (v6)
    {
      v7 = (void *)v6;
      v3 = (id)v5;
      goto LABEL_6;
    }
  }
  v7 = 0;
LABEL_6:

  return v7;
}

void __75__UIKeyboardLayoutStar_keyboardSizeForInputMode_screenTraits_keyboardType___block_invoke(uint64_t a1)
{
  unint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = currentInstance_block_invoke___s_category;
  if (!currentInstance_block_invoke___s_category)
  {
    v2 = __UILogCategoryGetNode("Warning", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v2, (unint64_t *)&currentInstance_block_invoke___s_category);
  }
  v3 = *(NSObject **)(v2 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = 138412546;
    v7 = v4;
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_ERROR, "Error: LayoutStar keyboardName %@ resulted in %@", (uint8_t *)&v6, 0x16u);
  }
}

- (id)splitNameForKeyplane:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "stringForProperty:", CFSTR("split-alternate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(v4, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardLayoutStar splitNameForKeyplaneName:](self, "splitNameForKeyplaneName:", v8);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (CGRect)dragGestureRectInView:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double x;
  double v13;
  double y;
  double v15;
  double width;
  double v17;
  double height;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  objc_super v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect result;

  v36.receiver = self;
  v36.super_class = (Class)UIKeyboardLayoutStar;
  v4 = a3;
  -[UIKeyboardLayout dragGestureRectInView:](&v36, sel_dragGestureRectInView_, v4);
  v6 = v5;
  v8 = v7;
  -[UIKBTree keysWithString:](self->_keyplane, "keysWithString:", CFSTR("Dismiss"), v36.receiver, v36.super_class);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lastObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  x = v11;
  y = v13;
  width = v15;
  height = v17;

  if (self->_flickPopuptimer)
  {
    -[UIView bounds](self, "bounds");
    v20 = v19;
    v37.origin.x = x;
    v37.origin.y = y;
    v37.size.width = width;
    v37.size.height = height;
    v21 = v20 - CGRectGetMaxX(v37);
    if (x < v21)
      v21 = x;
    v22 = -v21;
    v38.origin.x = x;
    v38.origin.y = y;
    v38.size.width = width;
    v38.size.height = height;
    v39 = CGRectInset(v38, v22, v22);
    x = v39.origin.x;
    y = v39.origin.y;
    width = v39.size.width;
    height = v39.size.height;
  }
  if (width >= v6)
    v23 = v6;
  else
    v23 = width;
  -[UIView convertRect:toView:](self, "convertRect:toView:", v4, width * 0.5 + x - v23 * 0.5, height * 0.5 + y - v8 * 0.5);
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;

  v32 = v25;
  v33 = v27;
  v34 = v29;
  v35 = v31;
  result.size.height = v35;
  result.size.width = v34;
  result.origin.y = v33;
  result.origin.x = v32;
  return result;
}

- (void)tearDownSplitTransitionView
{
  UIKeyboardSplitTransitionView *transitionView;
  void *v4;
  UIKeyboardSplitTransitionView *v5;

  transitionView = self->_transitionView;
  if (transitionView)
  {
    -[UIKeyboardSplitTransitionView setSplitTransitionDataSource:](transitionView, "setSplitTransitionDataSource:", 0);
    -[UIView removeFromSuperview](self->_transitionView, "removeFromSuperview");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:", self->_transitionView);

    v5 = self->_transitionView;
    self->_transitionView = 0;

  }
  objc_storeWeak((id *)&self->_splitKeyplaneTransitionDelegate, 0);
}

- (void)refreshForRivenPreferences
{
  char isKindOfClass;
  UIKeyboardSplitTransitionView *v4;
  UIKeyboardSplitTransitionView *transitionView;
  id v6;

  if (!-[UIKeyboardLayoutStar useCrescendoLayout](self, "useCrescendoLayout"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (-[UIKBScreenTraits supportsSplit](self->super._screenTraits, "supportsSplit"))
    {
      UIKeyboardSplitTransitionViewClass();
      isKindOfClass = objc_opt_isKindOfClass();
      if (!self->_transitionView || (isKindOfClass & 1) == 0)
      {
        -[UIKeyboardLayoutStar tearDownSplitTransitionView](self, "tearDownSplitTransitionView");
        v4 = (UIKeyboardSplitTransitionView *)objc_msgSend(objc_alloc((Class)UIKeyboardSplitTransitionViewClass()), "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        transitionView = self->_transitionView;
        self->_transitionView = v4;

        -[UIView setHidden:](self->_transitionView, "setHidden:", 1);
        -[UIKeyboardSplitTransitionView setSplitTransitionDataSource:](self->_transitionView, "setSplitTransitionDataSource:", self);
        -[UIView addSubview:](self, "addSubview:", self->_transitionView);
      }
    }
    else
    {
      -[UIKeyboardLayoutStar tearDownSplitTransitionView](self, "tearDownSplitTransitionView");
    }
    -[UIView addGestureRecognizer:](self, "addGestureRecognizer:", self->_upSwipeRecognizer);
    objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("UIKeyboardDidHideNotification"), 0);
    objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("UIKeyboardDidShowNotification"), 0);

  }
}

- (int)visualStyleForKeyboardIfSplit:(BOOL)a3
{
  _BOOL4 v3;
  int v5;
  int v6;
  int v8;
  int v9;

  v3 = a3;
  v5 = -[UIKBTree visualStyle](self->_keyboard, "visualStyle");
  v6 = -[UIKBTree visualStyle](self->_keyboard, "visualStyle");
  if (v3)
  {
    if (v6 == 102)
      return 106;
    v8 = 109;
    v9 = 108;
  }
  else
  {
    if (v6 == 106 || -[UIKBTree visualStyle](self->_keyboard, "visualStyle") == 107)
      return 102;
    v8 = 108;
    v9 = 109;
  }
  if (-[UIKBTree visualStyle](self->_keyboard, "visualStyle") == v9)
    return v8;
  else
    return v5;
}

- (BOOL)allKeyplanesHaveSameHeight
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t i;
  double v8;
  void *v9;
  double Height;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;
  CGRect v19;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[UIKBTree subtrees](self->_keyboard, "subtrees", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    v6 = -1.0;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        v8 = v6;
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v9, "type") == 2)
        {
          objc_msgSend(v9, "originalFrame");
          Height = CGRectGetHeight(v19);
          v6 = Height;
          if (v8 >= 0.0)
          {
            v6 = v8;
            if (Height != v8)
            {
              v11 = 0;
              goto LABEL_13;
            }
          }
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }
  v11 = 1;
LABEL_13:

  return v11;
}

- (UIEdgeInsets)keyplanePadding
{
  TUIKeyplaneView *liveKeyplaneView;
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v8;
  UIEdgeInsets result;

  if (-[UIKeyboardLayoutStar useCrescendoLayout](self, "useCrescendoLayout")
    && (liveKeyplaneView = self->_liveKeyplaneView) != 0)
  {
    -[TUIKeyplaneView keyplaneInsets](liveKeyplaneView, "keyplaneInsets");
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UIKeyboardLayoutStar;
    -[UIKeyboardLayout keyplanePadding](&v8, sel_keyplanePadding);
  }
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (double)lastTouchUpTimestamp
{
  return self->_prevTouchUpTime;
}

- (double)lastTouchDownTimestamp
{
  return self->_prevTouchDownTime;
}

- (BOOL)hasActiveKeys
{
  void *v2;
  void *v3;
  BOOL v4;

  -[UIKeyboardLayoutStar currentKeyplaneView](self, "currentKeyplaneView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeKeyViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (BOOL)canProduceString:(id)a3
{
  id v4;
  NSMutableSet *validInputStrings;
  NSMutableSet *v6;
  NSMutableSet *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  NSMutableSet *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSMutableSet *v25;
  void *v26;
  void *v27;
  void *v28;
  __CFString *v29;
  __CFString *v30;
  char v31;
  id v33;
  id obj;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  validInputStrings = self->_validInputStrings;
  if (!validInputStrings)
  {
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v7 = self->_validInputStrings;
    self->_validInputStrings = v6;

    validInputStrings = self->_validInputStrings;
  }
  if (!-[NSMutableSet count](validInputStrings, "count"))
  {
    v33 = v4;
    UIKeyboardGetCurrentInputMode();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    -[UIKBTree subtrees](self->_keyboard, "subtrees");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    if (v36)
    {
      v35 = *(_QWORD *)v45;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v45 != v35)
            objc_enumerationMutation(obj);
          v37 = v8;
          v9 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v8);
          -[UIKeyboardLayoutStar setCurrencyKeysForCurrentLocaleOnKeyplane:](self, "setCurrencyKeysForCurrentLocaleOnKeyplane:", v9);
          v42 = 0u;
          v43 = 0u;
          v40 = 0u;
          v41 = 0u;
          objc_msgSend(v9, "keys");
          v38 = (id)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v41;
            do
            {
              for (i = 0; i != v11; ++i)
              {
                if (*(_QWORD *)v41 != v12)
                  objc_enumerationMutation(v38);
                v14 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
                objc_msgSend(v14, "representedString");
                v15 = (void *)objc_claimAutoreleasedReturnValue();

                if (v15)
                {
                  v16 = self->_validInputStrings;
                  objc_msgSend(v14, "fullRepresentedString");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSMutableSet addObject:](v16, "addObject:", v17);

                  objc_msgSend(v14, "representedString");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v14, "displayType") == 7)
                  {
                    objc_msgSend(v14, "secondaryRepresentedStrings");
                    v19 = (void *)objc_claimAutoreleasedReturnValue();
                    v20 = objc_msgSend(v19, "count");

                    if (v20)
                    {
                      objc_msgSend(v14, "secondaryRepresentedStrings");
                      v21 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v21, "firstObject");
                      v22 = (void *)objc_claimAutoreleasedReturnValue();

                      -[NSMutableSet addObject:](self->_validInputStrings, "addObject:", v22);
                      objc_msgSend(v18, "stringByAppendingString:", v22);
                      v23 = objc_claimAutoreleasedReturnValue();

                      v18 = (void *)v23;
                    }
                  }
                  if (objc_msgSend(v14, "variantType") == 3)
                  {
                    -[UIKeyboardLayoutStar _variantsOfCurrencyKey:language:](self, "_variantsOfCurrencyKey:language:", v14, v39);
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    v25 = self->_validInputStrings;
                    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("Strings"));
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSMutableSet addObjectsFromArray:](v25, "addObjectsFromArray:", v26);

                  }
                  UIKeyboardRomanAccentVariants((uint64_t)v18, v39, 7);
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v27, "objectForKey:", CFSTR("Strings"));
                  v28 = (void *)objc_claimAutoreleasedReturnValue();

                  -[NSMutableSet addObjectsFromArray:](self->_validInputStrings, "addObjectsFromArray:", v28);
                }
              }
              v11 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
            }
            while (v11);
          }

          v8 = v37 + 1;
        }
        while (v37 + 1 != v36);
        v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      }
      while (v36);
    }

    v4 = v33;
  }
  v29 = (__CFString *)v4;
  if ((-[__CFString _isDelete](v29, "_isDelete") & 1) != 0)
  {
    v30 = CFSTR("Delete");
LABEL_30:

    goto LABEL_31;
  }
  v30 = v29;
  if (-[__CFString _isNewlineOrReturn](v29, "_isNewlineOrReturn"))
  {
    v30 = CFSTR("\n");
    goto LABEL_30;
  }
LABEL_31:
  v31 = -[NSMutableSet containsObject:](self->_validInputStrings, "containsObject:", v30);

  return v31;
}

- (id)internationalKeyDisplayStringOnEmojiKeyboard
{
  void *v3;
  void *v4;

  if (-[UIKeyboardLayoutStar showsDedicatedEmojiKeyAlongsideGlobeButton](self, "showsDedicatedEmojiKeyAlongsideGlobeButton"))
  {
    v3 = 0;
  }
  else
  {
    -[UIKBTree firstCachedKeyWithName:](self->_keyplane, "firstCachedKeyWithName:", CFSTR("Emoji-International-Key"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)nextToUseInputModeDidChange:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("UITextInputNextInputModeInputModeDidChangeKey"));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[UIKeyboardLayoutStar updateLocalizedDisplayStringOnEmojiInternationalWithKeyplane:withInputMode:](self, "updateLocalizedDisplayStringOnEmojiInternationalWithKeyplane:withInputMode:", self->_keyplane, v6);
  -[UIKBTree firstCachedKeyWithName:](self->_keyplane, "firstCachedKeyWithName:", CFSTR("Emoji-International-Key"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRendering:", 38);
  -[UIKeyboardLayoutStar setState:forKey:](self, "setState:forKey:", 2, v5);

}

- (BOOL)shouldMatchCaseForDomainKeys
{
  return 0;
}

- (void)rebuildSplitTransitionView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int64_t v8;
  id v9;
  void *v10;
  UIKBTree *keyboard;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;

  if (!-[UIKeyboardLayoutStar useCrescendoLayout](self, "useCrescendoLayout") && !self->_isRebuilding)
  {
    -[UIKBTree name](self->_keyplane, "name");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardLayoutStar defaultNameForKeyplaneName:](self, "defaultNameForKeyplaneName:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardLayoutStar keyplaneNamed:](self, "keyplaneNamed:", v4);
    v15 = objc_claimAutoreleasedReturnValue();

    -[UIKBTree name](self->_keyplane, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardLayoutStar splitNameForKeyplaneName:](self, "splitNameForKeyplaneName:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardLayoutStar keyplaneNamed:](self, "keyplaneNamed:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    if (v15 | v7 && !-[UIKeyboardLayoutStar isRotating](self, "isRotating") && self->_transitionView)
    {
      v8 = -[UIKeyboardLayout orientation](self, "orientation");
      v9 = (id)v15;
      v10 = v9;
      if (objc_msgSend(v9, "looksLikeShiftAlternate"))
      {
        v10 = v9;
        if (objc_msgSend(v9, "isShiftKeyplane"))
        {
          keyboard = self->_keyboard;
          objc_msgSend(v9, "shiftAlternateKeyplaneName");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIKBTree subtreeWithName:](keyboard, "subtreeWithName:", v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

        }
      }
      if (!objc_msgSend(v10, "visualStyle"))
        objc_msgSend(v10, "setVisualStyle:", -[UIKBTree visualStyle](self->_keyboard, "visualStyle"));
      -[UIKeyboardLayoutStar cacheTokenForKeyplane:caseAlternates:](self, "cacheTokenForKeyplane:caseAlternates:", v9, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardLayoutStar cacheTokenForKeyplane:caseAlternates:](self, "cacheTokenForKeyplane:caseAlternates:", v7, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!self->_isRebuilding)
      {
        self->_isRebuilding = 1;
        -[UIKeyboardLayoutStar showSplitTransitionView:](self, "showSplitTransitionView:", 0);
        self->_splitTransitionNeedsRebuild = 0;
        -[UIKeyboardSplitTransitionView rebuildFromKeyplane:toKeyplane:startToken:endToken:keyboardType:orientation:](self->_transitionView, "rebuildFromKeyplane:toKeyplane:startToken:endToken:keyboardType:orientation:", v10, v7, v13, v14, -[UITextInputTraits keyboardType](self->super._inputTraits, "keyboardType"), v8);
        self->_isRebuilding = 0;
      }

    }
  }
}

- (CGImage)cachedCompositeImageWithCacheKey:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const void *v20;
  _QWORD v22[6];

  v22[5] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  objc_msgSend(v4, "arrayWithCapacity:", 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardLayoutStar renderConfig](self, "renderConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBRenderingContext renderingContextForRenderConfig:](UIKBRenderingContext, "renderingContextForRenderConfig:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIKBRenderFactory cacheKeyForString:withRenderFlags:renderingContext:](UIKBRenderFactory, "cacheKeyForString:withRenderFlags:renderingContext:", v5, 2, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v9);

  +[UIKBRenderFactory cacheKeyForString:withRenderFlags:renderingContext:](UIKBRenderFactory, "cacheKeyForString:withRenderFlags:renderingContext:", v5, 1, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v10);

  +[UIKBRenderFactory cacheKeyForString:withRenderFlags:renderingContext:](UIKBRenderFactory, "cacheKeyForString:withRenderFlags:renderingContext:", v5, 3, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v11);

  +[UIKBRenderFactory cacheKeyForString:withRenderFlags:renderingContext:](UIKBRenderFactory, "cacheKeyForString:withRenderFlags:renderingContext:", v5, 6, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v12);

  +[UIKBRenderFactory cacheKeyForString:withRenderFlags:renderingContext:](UIKBRenderFactory, "cacheKeyForString:withRenderFlags:renderingContext:", v5, 4, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addObject:", v13);
  v14 = (void *)MEMORY[0x1E0CB37E8];
  -[UIKeyboardLayoutStar renderConfig](self, "renderConfig", &unk_1E1A98508);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "keycapOpacity");
  objc_msgSend(v14, "numberWithDouble:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v16;
  v22[2] = &unk_1E1A98508;
  v22[3] = &unk_1E1A98508;
  v22[4] = &unk_1E1A98508;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIKeyboardCache sharedInstance](UIKeyboardCache, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBTree layoutName](self->_keyplane, "layoutName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (const void *)objc_msgSend(v18, "cachedCompositeImageForCacheKeys:fromLayout:opacities:", v6, v19, v17);

  if (v20)
    CFAutorelease(v20);

  return (CGImage *)v20;
}

- (CGImage)renderedImageWithStateFallbacksForToken:(id)a3
{
  id v4;
  void *v5;
  CGImage *v6;
  CGImage *v7;
  void *v8;
  CGImage *v9;

  v4 = a3;
  objc_msgSend(v4, "stringForState:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[UIKeyboardLayoutStar cachedCompositeImageWithCacheKey:](self, "cachedCompositeImageWithCacheKey:", v5);
  if (!v6)
  {
    objc_msgSend(v4, "stringForState:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = -[UIKeyboardLayoutStar cachedCompositeImageWithCacheKey:](self, "cachedCompositeImageWithCacheKey:", v8);
    if (v9)
    {
      v7 = v9;
      v5 = v8;
      goto LABEL_5;
    }
    objc_msgSend(v4, "stringForState:", 4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = -[UIKeyboardLayoutStar cachedCompositeImageWithCacheKey:](self, "cachedCompositeImageWithCacheKey:", v5);
  }
  v7 = v6;
LABEL_5:

  return v7;
}

- (CGImage)renderedImageWithToken:(id)a3
{
  id v4;
  UIKBTree *keyplane;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  CGImage *v10;
  uint64_t v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  objc_msgSend(v4, "setStyling:", objc_msgSend(v4, "styling") & 0xFFFFFFFFFFFF00FFLL | ((unint64_t)((unsigned __int16)-[UIKBTree visualStyling](self->_keyplane, "visualStyling") >> 8) << 8));
  keyplane = self->_keyplane;
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBTree keysByKeyName:](keyplane, "keysByKeyName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((int)objc_msgSend(v4, "emptyFields") >= 2 && (objc_msgSend(v4, "hasKey") & 1) != 0
    || objc_msgSend(v4, "emptyFields") == 1 && !objc_msgSend(v7, "count"))
  {
    v10 = -[UIKeyboardLayoutStar renderedImageWithStateFallbacksForToken:](self, "renderedImageWithStateFallbacksForToken:", v4);
    goto LABEL_22;
  }
  if (!objc_msgSend(v7, "count"))
  {
    v8 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v7, "objectAtIndex:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
LABEL_12:
    v9 = 2;
    goto LABEL_13;
  }
  v9 = -[UIKeyboardLayoutStar stateForKey:](self, "stateForKey:", v8);
  if (v9 == 4)
  {
    if (objc_msgSend(v8, "displayType") != 14)
    {
      v11 = 2;
      goto LABEL_14;
    }
    v9 = 4;
  }
LABEL_13:
  v11 = v9 & 0xFFFFFFFB;
LABEL_14:
  objc_msgSend(v8, "paddedFrame");
  objc_msgSend(v4, "setSize:", v12, v13);
  objc_msgSend(v4, "resetAnnotations");
  if (objc_msgSend(v8, "isRightToLeftSensitive"))
  {
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "currentLinguisticInputMode");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "annotateWithBool:", objc_msgSend(v15, "isDefaultRightToLeft"));

  }
  if (objc_msgSend(v8, "displayTypeHint") == 10 && objc_msgSend(v8, "displayType") == 7)
    objc_msgSend(v4, "annotateWithBool:", -[UIKBTree isShiftKeyplane](self->_keyplane, "isShiftKeyplane"));
  if (-[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 3)
    objc_msgSend(v4, "annotateWithBool:", UIKeyboardCarPlayIsRightHandDrive());
  objc_msgSend(v4, "stringForKey:state:", v8, v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[UIKeyboardLayoutStar cachedCompositeImageWithCacheKey:](self, "cachedCompositeImageWithCacheKey:", v16);

LABEL_22:
  return v10;
}

- (CGImage)renderedKeyplaneWithToken:(id)a3 split:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  CGImage *v8;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "stringForSplitState:handBias:", v4, -[UIKeyboardLayoutStar currentHandBias](self, "currentHandBias"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[UIKeyboardLayoutStar cachedCompositeImageWithCacheKey:](self, "cachedCompositeImageWithCacheKey:", v7);
  return v8;
}

+ (id)sharedRivenKeyplaneGenerator
{
  if (qword_1ECD79808 != -1)
    dispatch_once(&qword_1ECD79808, &__block_literal_global_329);
  return (id)qword_1ECD79800;
}

void __52__UIKeyboardLayoutStar_sharedRivenKeyplaneGenerator__block_invoke()
{
  UIKBSplitKeyplaneGenerator *v0;
  void *v1;

  v0 = objc_alloc_init(UIKBSplitKeyplaneGenerator);
  v1 = (void *)qword_1ECD79800;
  qword_1ECD79800 = (uint64_t)v0;

}

- (void)traitCollectionDidChange
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[UIView _inheritedRenderConfig](self, "_inheritedRenderConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    -[UIKeyboardLayoutStar setRenderConfig:](self, "setRenderConfig:", v3);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[NSMutableDictionary objectEnumerator](self->_allKeyplaneViews, "objectEnumerator", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v9, "purgeFactory");
        if (v3)
          objc_msgSend(v9, "setRenderConfig:", v3);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  -[UIKeyboardLayoutStar reloadCurrentKeyplane](self, "reloadCurrentKeyplane");
}

- (void)didTriggerDestructiveRenderConfigChange
{
  if (-[UIKeyboardLayoutStar useCrescendoLayout](self, "useCrescendoLayout"))
  {
    -[TUIKeyplaneView setRenderConfig:](self->_liveKeyplaneView, "setRenderConfig:", self->_renderConfig);
  }
  else
  {
    -[UIKBKeyplaneView purgeFactory](self->_keyplaneView, "purgeFactory");
    -[UIKeyboardLayoutStar reloadCurrentKeyplane](self, "reloadCurrentKeyplane");
  }
}

- (void)setPasscodeOutlineAlpha:(double)a3
{
  UIKBRenderConfig *passcodeRenderConfig;
  void *v6;
  UIKBRenderConfig *v7;
  UIKBRenderConfig *v8;
  int *v9;
  UIKBRenderConfig **p_renderConfig;

  passcodeRenderConfig = self->_passcodeRenderConfig;
  if (!passcodeRenderConfig)
  {
    +[UIKBRenderConfig darkConfig](UIKBRenderConfig, "darkConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (UIKBRenderConfig *)objc_msgSend(v6, "copy");
    v8 = self->_passcodeRenderConfig;
    self->_passcodeRenderConfig = v7;

    passcodeRenderConfig = self->_passcodeRenderConfig;
  }
  -[UIKBRenderConfig setKeycapOpacity:](passcodeRenderConfig, "setKeycapOpacity:", a3 * 0.5);
  if ((-[UIKBTree visualStyling](self->_keyplane, "visualStyling") & 0xFF00) == 0x7F00)
  {
    v9 = &OBJC_IVAR___UIKeyboardLayoutStar__liveKeyplaneView;
    p_renderConfig = &self->_renderConfig;
    objc_storeStrong((id *)&self->_renderConfig, self->_passcodeRenderConfig);
    if (!-[UIKeyboardLayoutStar useCrescendoLayout](self, "useCrescendoLayout"))
    {
      -[UIKBKeyplaneView setRenderConfig:](self->_keyplaneView, "setRenderConfig:", *p_renderConfig);
      v9 = &OBJC_IVAR___UIKeyboardLayoutStar__backgroundView;
    }
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + *v9), "setRenderConfig:", *p_renderConfig);
  }
}

- (void)willBeginIndirectSelectionGesture
{
  -[UIKeyboardLayoutStar willBeginIndirectSelectionGesture:](self, "willBeginIndirectSelectionGesture:", 1);
}

- (void)willBeginIndirectSelectionGesture:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardLayoutStar;
  -[UIKeyboardLayout willBeginIndirectSelectionGesture](&v5, sel_willBeginIndirectSelectionGesture);
  -[UIKeyboardLayoutStar setTrackpadMode:animated:](self, "setTrackpadMode:animated:", 1, v3);
}

- (void)cancelTouchesForTwoFingerTapGesture:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIKeyboardLayoutStar;
  -[UIKeyboardLayout cancelTouchesForTwoFingerTapGesture:](&v4, sel_cancelTouchesForTwoFingerTapGesture_, a3);
  -[UIKeyboardLayoutStar deactivateActiveKeysClearingTouchInfo:clearingDimming:](self, "deactivateActiveKeysClearingTouchInfo:clearingDimming:", 1, 1);
}

- (void)didEndIndirectSelectionGesture
{
  -[UIKeyboardLayoutStar didEndIndirectSelectionGesture:](self, "didEndIndirectSelectionGesture:", 1);
}

- (void)didEndIndirectSelectionGesture:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardLayoutStar;
  -[UIKeyboardLayout didEndIndirectSelectionGesture](&v5, sel_didEndIndirectSelectionGesture);
  -[UIKeyboardLayoutStar setTrackpadMode:animated:](self, "setTrackpadMode:animated:", 0, v3);
}

- (void)willBeginTrackpadModeForServerSideDictation
{
  -[UIKeyboardLayoutStar setTrackpadMode:animated:](self, "setTrackpadMode:animated:", 1, 0);
}

- (void)didEndTrackpadModeForServerSideDictation
{
  -[UIKeyboardLayoutStar setTrackpadMode:animated:](self, "setTrackpadMode:animated:", 0, 0);
}

- (void)setTrackpadMode:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD aBlock[5];
  id v26;
  _QWORD v27[3];
  _QWORD v28[3];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[3];

  v4 = a4;
  v32[2] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    self->_isTrackpadMode = 0;
    +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTypingEnabled:", 1);

    LODWORD(v14) = -[UIKeyboardLayoutStar isDeveloperGestureKeybaord](self, "isDeveloperGestureKeybaord");
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "preferencesActions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "BOOLForPreferenceKey:", CFSTR("GesturesEnabled")) | v14)
      v17 = 0.25;
    else
      v17 = 1.0;

    v28[0] = &unk_1E1A95AC0;
    v27[0] = &unk_1E1A98538;
    v27[1] = &unk_1E1A98550;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v12;
    v27[2] = &unk_1E1A984F0;
    v18 = (void *)MEMORY[0x1E0CB37E8];
    -[UIKeyboardLayoutStar renderConfig](self, "renderConfig");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "lightKeycapOpacity");
    objc_msgSend(v18, "numberWithDouble:");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v28[2] = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 3);
    v13 = objc_claimAutoreleasedReturnValue();

    goto LABEL_11;
  }
  -[UIKeyboardLayoutStar cancelModalDoubleConsonantKeysTimer](self, "cancelModalDoubleConsonantKeysTimer");
  self->_isTrackpadMode = a3;
  +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTypingEnabled:", 0);

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clearLanguageIndicator");

  -[UIKeyboardLayoutStar deactivateActiveKeysClearingTouchInfo:clearingDimming:](self, "deactivateActiveKeysClearingTouchInfo:clearingDimming:", 1, 0);
  -[UIKeyboardLayoutStar clearHandwritingStrokesIfNeededAndNotify:](self, "clearHandwritingStrokesIfNeededAndNotify:", 1);
  -[UIKeyboardLayoutStar renderConfig](self, "renderConfig");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "lightKeyboard"))
    v10 = 0.5;
  else
    v10 = 0.6;

  v32[0] = &unk_1E1A95AA0;
  v31[0] = &unk_1E1A98520;
  v31[1] = &unk_1E1A984F0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[UIKeyboardLayoutStar isEmojiKeyplane](self, "isEmojiKeyplane"))
  {
    v29[0] = &unk_1E1A98520;
    v29[1] = &unk_1E1A984F0;
    v30[0] = &unk_1E1A95AB0;
    v30[1] = &unk_1E1A95AB0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_11:

    v12 = (void *)v13;
  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__UIKeyboardLayoutStar_setTrackpadMode_animated___block_invoke;
  aBlock[3] = &unk_1E16B1B50;
  aBlock[4] = self;
  v21 = v12;
  v26 = v21;
  v22 = _Block_copy(aBlock);
  v23 = v22;
  if (v4)
  {
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 50331648, v22, 0, 0.2, 0.0);
    if (a3)
      goto LABEL_17;
    goto LABEL_16;
  }
  (*((void (**)(void *))v22 + 2))(v22);
  if (!a3)
  {
LABEL_16:
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "updateKeyboardConfigurations");

    -[UIKeyboardLayoutStar clearContinuousPathView](self, "clearContinuousPathView");
  }
LABEL_17:

}

void __49__UIKeyboardLayoutStar_setTrackpadMode_animated___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  id *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;

  v2 = objc_msgSend(*(id *)(a1 + 32), "useCrescendoLayout");
  v4 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    v5 = (id *)(v4 + 1456);
  }
  else
  {
    objc_msgSend(*(id *)(v4 + 696), "dimKeys:", v3);
    v3 = *(_QWORD *)(a1 + 40);
    v5 = (id *)(*(_QWORD *)(a1 + 32) + 1352);
  }
  objc_msgSend(*v5, "dimKeys:", v3);
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "usesCandidateSelection");

  if (v7)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "candidateController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dimKeys:", *(_QWORD *)(a1 + 40));

  }
}

- (void)updateBackgroundCorners
{
  if (-[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 1
    || -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 24
    || -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 25
    || -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 26
    || -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 23)
  {
    -[UIKeyboardLayoutStar updateBackgroundIfNeeded](self, "updateBackgroundIfNeeded");
  }
}

void __46__UIKeyboardLayoutStar_shouldShowDictationKey__block_invoke(uint64_t a1)
{
  id v2;
  BOOL v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 664);
  if (v2)
  {
    v8 = v2;
    v3 = +[UIDictationController fetchCurrentInputModeSupportsDictation](UIDictationController, "fetchCurrentInputModeSupportsDictation");
    v4 = *(void **)(a1 + 32);
    if (v3)
    {
      objc_msgSend(v4, "refreshForDictationAvailablityDidChange");
LABEL_6:
      v2 = v8;
      goto LABEL_7;
    }
    objc_msgSend(v4, "setKeyplaneName:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setKeyplaneName:", v8);
    objc_msgSend(*(id *)(a1 + 32), "candidateList");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    v2 = v8;
    if ((v6 & 1) != 0)
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "generateCandidates");

      goto LABEL_6;
    }
  }
LABEL_7:
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1320) = 0;

}

- (BOOL)isResized
{
  double v3;

  -[UIKBResizingKeyplaneCoordinator resizingOffset](self->_resizingKeyplaneCoordinator, "resizingOffset");
  return v3 != 0.0 && -[UIKeyboardLayoutStar keyplaneUsesResizingOffset](self, "keyplaneUsesResizingOffset");
}

- (BOOL)shouldAllowSelectionGestures:(BOOL)a3 atPoint:(CGPoint)a4 toBegin:(BOOL)a5
{
  _BOOL4 v5;
  double y;
  double x;
  _BOOL8 v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  int64_t v24;
  BOOL v25;
  void *v26;
  int v27;
  objc_super v29;

  v5 = a5;
  y = a4.y;
  x = a4.x;
  v8 = a3;
  v29.receiver = self;
  v29.super_class = (Class)UIKeyboardLayoutStar;
  if (-[UIKeyboardLayout shouldAllowSelectionGestures:atPoint:toBegin:](&v29, sel_shouldAllowSelectionGestures_atPoint_toBegin_)&& -[UIView isUserInteractionEnabled](self, "isUserInteractionEnabled"))
  {
    if (-[UIKeyboardLayoutStar isHandwritingPlane](self, "isHandwritingPlane"))
    {
      -[UIKBTree cachedKeysByKeyName:](self->_keyplane, "cachedKeysByKeyName:", CFSTR("Handwriting-Input"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndex:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIKeyboardLayoutStar viewForKey:](self, "viewForKey:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v8 || (UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
        && (objc_msgSend(v12, "numberOfStrokes") > (unint64_t)v5
         || (objc_msgSend(v12, "shouldAllowSelectionGestures:", v8) & 1) == 0))
      {

LABEL_37:
        v25 = 0;
LABEL_38:

        return v25;
      }

    }
    -[UIKeyboardLayoutStar keyHitTestClosestToPoint:](self, "keyHitTestClosestToPoint:", x, y);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v13;
    if (!v8)
    {
      if (objc_msgSend(v13, "interactionType") == 14
        || objc_msgSend(v11, "interactionType") == 11
        || objc_msgSend(v11, "interactionType") == 4
        || objc_msgSend(v11, "interactionType") == 10
        || objc_msgSend(v11, "interactionType") == 9
        || objc_msgSend(v11, "interactionType") == 5
        || objc_msgSend(v11, "interactionType") == 44)
      {
        goto LABEL_37;
      }
      goto LABEL_40;
    }
    -[UIKeyboardLayoutStar activeKey](self, "activeKey");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (void *)v14;
      -[UIKeyboardLayoutStar activeKey](self, "activeKey");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "interactionType") == 1)
      {
LABEL_14:

        goto LABEL_15;
      }
      -[UIKeyboardLayoutStar activeKey](self, "activeKey");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "interactionType") == 2)
      {

        goto LABEL_14;
      }
      -[UIKeyboardLayoutStar activeKey](self, "activeKey");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "interactionType");

      if (v27 == 16)
      {
LABEL_15:
        -[UIKeyboardLayoutStar activeKey](self, "activeKey");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[UIKeyboardLayoutStar downActionFlagsForKey:](self, "downActionFlagsForKey:", v18);

        -[UIKeyboardLayoutStar activeKey](self, "activeKey");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v20, "state") == 16)
        {
          -[UIKeyboardLayoutStar activeKey](self, "activeKey");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "selectedVariantIndex");
          -[UIKeyboardLayoutStar activeKey](self, "activeKey");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = -[UIKeyboardLayoutStar defaultSelectedVariantIndexForKey:withActions:](self, "defaultSelectedVariantIndexForKey:withActions:", v23, v19);

          if (v22 != v24)
            goto LABEL_37;
        }
        else
        {

        }
      }
    }
    if (objc_msgSend(v11, "interactionType") == 14
      || objc_msgSend(v11, "interactionType") == 11
      || objc_msgSend(v11, "interactionType") == 4
      || objc_msgSend(v11, "interactionType") == 5
      || objc_msgSend(v11, "interactionType") == 9
      || objc_msgSend(v11, "interactionType") == 44
      || -[UIKeyboardLayoutStar hasActiveContinuousPathInput](self, "hasActiveContinuousPathInput"))
    {
      goto LABEL_37;
    }
LABEL_40:
    v25 = 1;
    goto LABEL_38;
  }
  return 0;
}

uint64_t __66__UIKeyboardLayoutStar_showsDedicatedEmojiKeyAlongsideGlobeButton__block_invoke()
{
  void *v0;
  uint64_t v1;

  TIInputModeGetNormalizedIdentifier();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isEqualToString:", CFSTR("emoji"));

  return v1;
}

- (BOOL)shouldAllowCurrentKeyplaneReload
{
  BOOL v3;

  v3 = -[NSString hasSuffix:](self->_keyplaneName, "hasSuffix:", CFSTR("split"));
  return v3 ^ -[UIKBScreenTraits isSplit](self->super._screenTraits, "isSplit") ^ 1;
}

- (BOOL)_allowStartingContinuousPathForTouchInfo:(id)a3 alreadyActiveKeyExisting:(BOOL)a4
{
  id v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  BOOL v20;
  void *v21;
  int64_t v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  CGFloat Width;
  CGPoint v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  v6 = a3;
  objc_msgSend(v6, "initialDragPoint");
  v8 = v7;
  v10 = v9;
  objc_msgSend(v6, "key");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  if ((objc_msgSend(v11, "allowsStartingContinuousPath") & 1) != 0
    || (v20 = 0, objc_msgSend(v11, "allowsDelayedTapForContinuousPathDisambiguation")) && !a4)
  {
    if (objc_msgSend(v11, "allowsDelayedTapForContinuousPathDisambiguation"))
      objc_msgSend(v6, "setDelayed:", 1);
    if (objc_msgSend(v11, "interactionType") != 15)
      goto LABEL_8;
    -[UIKeyboardLayout sizeDelegate](self, "sizeDelegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[UIKeyboardLayout orientation](self, "orientation");
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "currentInputMode");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "deviceSpecificPaddingForInterfaceOrientation:inputMode:", v22, v24);
    v26 = v25;

    if (v26 == 0.0)
    {
      v30.origin.x = v13;
      v30.origin.y = v15;
      v30.size.width = v17;
      v30.size.height = v19;
      Width = CGRectGetWidth(v30);
      v31.origin.x = v13;
      v31.origin.y = v15;
      v31.size.width = v17;
      v31.size.height = v19;
      v32.size.height = CGRectGetHeight(v31) * 0.7;
      v32.origin.x = v13;
      v32.origin.y = v15;
      v32.size.width = Width;
      v29.x = v8;
      v29.y = v10;
      v20 = CGRectContainsPoint(v32, v29);
    }
    else
    {
LABEL_8:
      v20 = 1;
    }
  }

  return v20;
}

- (BOOL)shouldIgnoreContinuousPathRequirements
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  BOOL v7;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inputManagerState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 0;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inputManagerState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "performSelector:", sel_ignoreContinuousPathRequirements) != 0;

  return v7;
}

- (void)reloadCurrentKeyplane
{
  id v3;

  v3 = (id)-[NSString copy](self->_keyplaneName, "copy");
  if (!-[UIKeyboardLayoutStar useCrescendoLayout](self, "useCrescendoLayout"))
    -[UIKeyboardLayoutStar setKeyplaneName:](self, "setKeyplaneName:", 0);
  -[UIKeyboardLayoutStar setKeyplaneName:](self, "setKeyplaneName:", v3);

}

- (void)createLayoutFromName:(id)a3
{
  NSString *v4;
  UIKBKeyplaneView *keyplaneView;
  UIKBKeyplaneView *v6;
  UIKBBackgroundView *backgroundView;
  UIKBBackgroundView *v8;
  void *v9;
  _BOOL8 v10;
  UIKBTree **p_keyplane;
  _BOOL4 v12;
  NSString *keyplaneName;
  UITextInputTraits *inputTraits;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  TUIKeyplaneView *v36;
  TUIKeyplaneView *v37;
  _BOOL4 v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  UIKBTree *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t i;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  TUIKeyplaneView *liveKeyplaneView;
  NSString *v63;
  UIKBTree *v64;
  void *v65;
  UIKBTree *keyboard;
  void *v67;
  void *v68;
  NSString *v69;
  NSString *v70;
  void *v71;
  void *v72;
  _BOOL8 v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  char v84;
  void *v85;
  TUIKeyplaneView *v86;
  id v87;
  void *v88;
  TUIKeyplaneView *v89;
  id v90;
  NSArray *liveKeyplaneConstraints;
  UIKeyboardLayoutStar *v92;
  unint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  NSArray *v109;
  NSArray *v110;
  TUIKeyplaneView *v111;
  void *v112;
  void *v113;
  double v114;
  double v115;
  void *v116;
  void *v117;
  void *v118;
  uint64_t v119;
  void *v120;
  double v121;
  double v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  _BOOL4 v145;
  void *v146;
  void *v147;
  _BOOL4 v148;
  NSString *v149;
  void *v150;
  void *v151;
  _QWORD v152[5];
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  _QWORD v157[4];
  _QWORD v158[4];
  _QWORD v159[2];
  _BYTE v160[128];
  uint64_t v161;

  v161 = *MEMORY[0x1E0C80C00];
  v4 = (NSString *)a3;
  if (-[UIKeyboardLayoutStar useCrescendoLayout](self, "useCrescendoLayout"))
  {
    keyplaneView = self->_keyplaneView;
    if (keyplaneView)
    {
      -[UIKBKeyplaneView removeFromSuperview](keyplaneView, "removeFromSuperview");
      v6 = self->_keyplaneView;
      self->_keyplaneView = 0;

    }
    backgroundView = self->_backgroundView;
    if (backgroundView)
    {
      -[UIView removeFromSuperview](backgroundView, "removeFromSuperview");
      v8 = self->_backgroundView;
      self->_backgroundView = 0;

    }
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[UIKeyboardLayoutStar _allowPaddle](self, "_allowPaddle");
    +[_UIKeyboardUsageTracking showCharacterPreviewPreference:](_UIKeyboardUsageTracking, "showCharacterPreviewPreference:", v10);
    if (self->_lastInputIsGestureKey)
    {
      +[_UIKeyboardUsageTracking panAlternateKeyFlickDownCount](_UIKeyboardUsageTracking, "panAlternateKeyFlickDownCount");
      self->_lastInputIsGestureKey = 0;
    }
    self->_dictationUsingServerManualEndpointing = 0;
    p_keyplane = &self->_keyplane;
    v12 = -[UIKBTree isFloating](self->_keyplane, "isFloating");
    if (v12 == -[UIKeyboardLayout isFloating](self, "isFloating"))
    {
      keyplaneName = self->_keyplaneName;
      if (keyplaneName == v4
        || v4
        && keyplaneName
        && -[NSString caseInsensitiveCompare:](keyplaneName, "caseInsensitiveCompare:", v4) == NSOrderedSame)
      {
        inputTraits = self->super._inputTraits;
        objc_msgSend(v9, "textInputTraits");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[UITextInputTraits publicTraitsMatchTraits:](inputTraits, "publicTraitsMatchTraits:", v15)
          && -[UIKeyboardLayoutStar canReuseKeyplaneView](self, "canReuseKeyplaneView")
          && -[UIKeyboardLayoutStar shouldAllowCurrentKeyplaneReload](self, "shouldAllowCurrentKeyplaneReload"))
        {
          -[UIView bounds](self, "bounds");
          v17 = v16;
          v19 = v18;
          -[TUIKeyplaneView bounds](self->_liveKeyplaneView, "bounds");
          v21 = v20;
          v23 = v22;

          if (v17 == v21 && v19 == v23)
          {
            objc_msgSend(v9, "setShouldSkipCandidateSelection:", -[UIKBTree shouldSkipCandidateSelection](*p_keyplane, "shouldSkipCandidateSelection"));
            objc_msgSend(v9, "updateReturnKey:", 0);
            -[UIKeyboardLayoutStar updateKeyCentroids](self, "updateKeyCentroids");
            -[TUIKeyplaneView factory](self->_liveKeyplaneView, "factory");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "setAllowsPaddles:", v10);

            v25 = -[UIKeyboardLayoutStar keyplaneShiftState](self, "keyplaneShiftState");
            -[TUIKeyplaneView factory](self->_liveKeyplaneView, "factory");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "renderingContext");
            v27 = v9;
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "setShiftState:", v25);

            UIKeyboardGetCurrentInputMode();
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = UIKeyboardUIPreferStringOverImageForInputMode(v29);
            -[TUIKeyplaneView factory](self->_liveKeyplaneView, "factory");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "setPreferStringKeycapOverImage:", v30);

            v9 = v27;
            -[TUIKeyplaneView prepareForDisplay](self->_liveKeyplaneView, "prepareForDisplay");
            -[UIView superview](self, "superview");
            v32 = (void *)objc_claimAutoreleasedReturnValue();

            if (v32)
            {
              -[UIView bounds](self, "bounds");
              +[UIKBKeyplaneChangeContext keyplaneChangeContextWithSize:](UIKBKeyplaneChangeContext, "keyplaneChangeContextWithSize:", v33, v34);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              -[UIKeyboardLayoutStar _didChangeKeyplaneWithContext:](self, "_didChangeKeyplaneWithContext:", v35);

            }
            goto LABEL_63;
          }
        }
        else
        {

        }
      }
    }
    v148 = v10;
    self->_externalDictationAndInternationalKeys = -[UIKeyboardLayoutStar showsGlobeAndDictationKeysInDockView](self, "showsGlobeAndDictationKeysInDockView");
    v38 = -[UIKeyboardLayoutStar isShiftKeyPlaneChooser](self, "isShiftKeyPlaneChooser");
    self->_inputTraitsPreventInitialReuse = 0;
    -[UIKeyboardLayoutStar deactivateActiveKeysClearingTouchInfo:clearingDimming:](self, "deactivateActiveKeysClearingTouchInfo:clearingDimming:", 0, 1);
    -[UIKeyboardLayoutStar defaultNameForKeyplaneName:](self, "defaultNameForKeyplaneName:", v4);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBTree subtreeWithName:](self->_keyboard, "subtreeWithName:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v40;
    if (!v40)
    {
      -[UIKeyboardLayoutStar keyViewAnimator](self, "keyViewAnimator");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "setDisabled:", 0);

      -[TUIKeyplaneView removeFromSuperview](self->_liveKeyplaneView, "removeFromSuperview");
      liveKeyplaneView = self->_liveKeyplaneView;
      self->_liveKeyplaneView = 0;

      v63 = self->_keyplaneName;
      self->_keyplaneName = 0;

      v64 = *p_keyplane;
      *p_keyplane = 0;

LABEL_62:
LABEL_63:

      goto LABEL_64;
    }
    v145 = v38;
    v146 = v39;
    v147 = v9;
    objc_msgSend(v40, "gestureKeyplaneName");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    v149 = v4;
    v150 = v41;
    if (!v42)
    {
LABEL_41:
      -[UIKBTree firstCachedKeyWithName:](*p_keyplane, "firstCachedKeyWithName:", CFSTR("Shift-Key"));
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "behavesAsShiftKey");

      keyboard = self->_keyboard;
      -[UIKBTree shiftAlternateKeyplaneName](*p_keyplane, "shiftAlternateKeyplaneName");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKBTree subtreeWithName:](keyboard, "subtreeWithName:", v67);

      objc_msgSend(v41, "firstCachedKeyWithName:", CFSTR("Shift-Key"));
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "behavesAsShiftKey");

      v69 = (NSString *)-[NSString copy](v4, "copy");
      v70 = self->_keyplaneName;
      self->_keyplaneName = v69;

      objc_storeStrong((id *)p_keyplane, v41);
      objc_msgSend(v41, "setVisualStyle:", -[UIKBTree visualStyle](self->_keyboard, "visualStyle"));
      objc_msgSend(v41, "cacheNativeIdiomIfNecessaryForScreenTraits:", self->super._screenTraits);
      -[UIKBTree layoutName](self->_keyboard, "layoutName");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "precacheLayoutName:", v71);

      -[UIKBTree applyDynamicAttributes](*p_keyplane, "applyDynamicAttributes");
      -[UIKBTree updateKeysForType:](*p_keyplane, "updateKeysForType:", -[UITextInputTraits keyboardType](self->super._inputTraits, "keyboardType"));
      -[UIKBTree firstCachedKeyWithName:](*p_keyplane, "firstCachedKeyWithName:", CFSTR("Dictation-Key"));
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v144, "setVisible:", -[UIKeyboardLayoutStar shouldMergeKey:](self, "shouldMergeKey:", v144) ^ 1);
      -[UIKBTree firstCachedKeyWithName:](*p_keyplane, "firstCachedKeyWithName:", CFSTR("International-Key"));
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = !-[UIKeyboardLayoutStar shouldMergeKey:](self, "shouldMergeKey:", v72)
         && +[UIKeyboardImpl canShowInternationalKey](UIKeyboardImpl, "canShowInternationalKey");
      v143 = v72;
      objc_msgSend(v72, "setVisible:", v73);
      -[UIKeyboardLayoutStar setKeyboardAppearance:](self, "setKeyboardAppearance:", self->_appearance);
      -[UIKeyboardLayoutStar cacheTokenForKeyplane:caseAlternates:](self, "cacheTokenForKeyplane:caseAlternates:", *p_keyplane, 0);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "setTransformationIdentifiers:", self->_keyplaneTransformations);
      -[UIKeyboardLayoutStar defaultKeyplaneForKeyplane:](self, "defaultKeyplaneForKeyplane:", *p_keyplane);
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardLayoutStar cacheTokenForKeyplane:caseAlternates:](self, "cacheTokenForKeyplane:caseAlternates:");
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardLayoutStar renderConfig](self, "renderConfig");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIKBRenderingContext renderingContextForRenderConfig:](UIKBRenderingContext, "renderingContextForRenderConfig:", v75);
      v76 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v76, "setShiftState:", -[UIKeyboardLayoutStar keyplaneShiftState](self, "keyplaneShiftState"));
      objc_msgSend(v76, "setKeyboardType:", -[UITextInputTraits keyboardType](self->super._inputTraits, "keyboardType"));
      objc_msgSend(v76, "setHandBias:", -[UIKeyboardLayoutStar currentHandBias](self, "currentHandBias"));
      if (-[UIKeyboardLayoutStar _shouldSwapGlobeAndMore](self, "_shouldSwapGlobeAndMore"))
      {
        -[UIKBTree subtreeWithType:](*p_keyplane, "subtreeWithType:", 3);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v159[0] = CFSTR("More-Key");
        v159[1] = CFSTR("International-Key");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v159, 2);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "swapToggleKeys:", v78);

      }
      if (-[UIKeyboardLayout isFloating](self, "isFloating"))
        objc_msgSend(v76, "setIsFloating:", 1);
      v79 = -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom");
      if (v79 == 3)
        v79 = objc_msgSend(v74, "annotateWithBool:", UIKeyboardCarPlayIsRightHandDrive());
      v80 = (void *)MEMORY[0x186DC9484](v79);
      -[UIKeyboardLayoutStar updateLocalizedKeys:](self, "updateLocalizedKeys:", 0);
      -[UIKeyboardLayoutStar delegate](self, "delegate");
      v81 = objc_claimAutoreleasedReturnValue();
      if (v81)
      {
        v82 = (void *)v81;
        -[UIKeyboardLayoutStar delegate](self, "delegate");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = objc_opt_respondsToSelector();

        if ((v84 & 1) != 0)
        {
          -[UIKeyboardLayoutStar delegate](self, "delegate");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v85, "keyboardLayout:didSwitchToKeyplane:", self, *p_keyplane);

        }
      }
      objc_autoreleasePoolPop(v80);
      v86 = self->_liveKeyplaneView;
      if (!v86)
      {
        v87 = objc_alloc((Class)getTUIKeyplaneViewClass());
        -[UIView bounds](self, "bounds");
        v88 = (void *)objc_msgSend(v87, "initWithFrame:keyplane:", *p_keyplane);
        objc_msgSend(v88, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        v89 = self->_liveKeyplaneView;
        self->_liveKeyplaneView = (TUIKeyplaneView *)v88;
        v90 = v88;

        liveKeyplaneConstraints = self->_liveKeyplaneConstraints;
        self->_liveKeyplaneConstraints = 0;

        v86 = self->_liveKeyplaneView;
      }
      -[TUIKeyplaneView superview](v86, "superview");
      v92 = (UIKeyboardLayoutStar *)objc_claimAutoreleasedReturnValue();

      v93 = 0x1E0D15000uLL;
      v140 = v76;
      if (v92 != self)
      {
        -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_liveKeyplaneView, 0);
        v128 = (void *)MEMORY[0x1E0D156E0];
        -[TUIKeyplaneView topAnchor](self->_liveKeyplaneView, "topAnchor");
        v138 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView topAnchor](self, "topAnchor");
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v138, "constraintEqualToAnchor:", v136);
        v134 = (void *)objc_claimAutoreleasedReturnValue();
        v158[0] = v134;
        -[TUIKeyplaneView leadingAnchor](self->_liveKeyplaneView, "leadingAnchor");
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView leadingAnchor](self, "leadingAnchor");
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v132, "constraintEqualToAnchor:", v130);
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        v158[1] = v94;
        -[UIView bottomAnchor](self, "bottomAnchor");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        -[TUIKeyplaneView bottomAnchor](self->_liveKeyplaneView, "bottomAnchor");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v95, "constraintEqualToAnchor:", v96);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        v158[2] = v97;
        -[UIView trailingAnchor](self, "trailingAnchor");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        -[TUIKeyplaneView trailingAnchor](self->_liveKeyplaneView, "trailingAnchor");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "constraintEqualToAnchor:", v99);
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        v158[3] = v100;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v158, 4);
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v128, "activateConstraints:", v101);

        v93 = 0x1E0D15000;
        v41 = v150;

        v4 = v149;
        v76 = v140;

      }
      if (!self->_liveKeyplaneConstraints)
      {
        -[UIView topAnchor](self, "topAnchor");
        v137 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView superview](self, "superview");
        v139 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v139, "topAnchor");
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v137, "constraintEqualToAnchor:", v135);
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        v157[0] = v133;
        -[UIView leadingAnchor](self, "leadingAnchor");
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView superview](self, "superview");
        v131 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v131, "leadingAnchor");
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v129, "constraintEqualToAnchor:", v127);
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        v157[1] = v126;
        -[UIView superview](self, "superview");
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v125, "bottomAnchor");
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView bottomAnchor](self, "bottomAnchor");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "constraintEqualToAnchor:", v103);
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        v157[2] = v104;
        -[UIView superview](self, "superview");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v105, "trailingAnchor");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView trailingAnchor](self, "trailingAnchor");
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v106, "constraintEqualToAnchor:", v107);
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        v157[3] = v108;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v157, 4);
        v109 = (NSArray *)objc_claimAutoreleasedReturnValue();
        v110 = self->_liveKeyplaneConstraints;
        self->_liveKeyplaneConstraints = v109;

        v41 = v150;
        v93 = 0x1E0D15000uLL;

        v4 = v149;
        v76 = v140;

      }
      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(*(id *)(v93 + 1760), "activateConstraints:", self->_liveKeyplaneConstraints);
      -[TUIKeyplaneView setRenderingContext:](self->_liveKeyplaneView, "setRenderingContext:", v76);
      v111 = self->_liveKeyplaneView;
      -[UIKeyboardLayoutStar renderConfig](self, "renderConfig");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUIKeyplaneView setRenderConfig:](v111, "setRenderConfig:", v112);

      -[TUIKeyplaneView setOverrideScreenTraits:](self->_liveKeyplaneView, "setOverrideScreenTraits:", self->super._screenTraits);
      -[UIKBScreenTraits screen](self->super._screenTraits, "screen");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v113, "scale");
      v115 = v114;
      -[TUIKeyplaneView factory](self->_liveKeyplaneView, "factory");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v116, "setScale:", v115);

      -[TUIKeyplaneView factory](self->_liveKeyplaneView, "factory");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "setAllowsPaddles:", v148);

      UIKeyboardGetCurrentInputMode();
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      v119 = UIKeyboardUIPreferStringOverImageForInputMode(v118);
      -[TUIKeyplaneView factory](self->_liveKeyplaneView, "factory");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v120, "setPreferStringKeycapOverImage:", v119);

      -[TUIKeyplaneView setKeyplane:](self->_liveKeyplaneView, "setKeyplane:", self->_keyplane);
      -[TUIKeyplaneView setNeedsDisplay](self->_liveKeyplaneView, "setNeedsDisplay");
      -[UIKeyboardLayoutStar updateKeyboardForKeyplane:](self, "updateKeyboardForKeyplane:", v41);
      -[TUIKeyplaneView bounds](self->_liveKeyplaneView, "bounds");
      +[UIKBKeyplaneChangeContext keyplaneChangeContextWithSize:](UIKBKeyplaneChangeContext, "keyplaneChangeContextWithSize:", v121, v122);
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v123, "setSplitWidthsChanged:", -[TUIKeyplaneView isSplit](self->_liveKeyplaneView, "isSplit"));
      objc_msgSend(v123, "setUpdateAssistantView:", 1);
      objc_msgSend(v123, "setIsDynamicLayout:", 1);
      -[UIKeyboardLayoutStar _didChangeKeyplaneWithContext:](self, "_didChangeKeyplaneWithContext:", v123);
      -[UIKeyboardLayoutStar _setBiasEscapeButtonVisible:](self, "_setBiasEscapeButtonVisible:", 0);
      -[UIKeyboardLayoutStar updateAllKeyStates](self, "updateAllKeyStates");
      -[UIKeyboardLayoutStar updateLayoutTags](self, "updateLayoutTags");
      -[UIKeyboardLayoutStar updateCachedKeyplaneKeycaps](self, "updateCachedKeyplaneKeycaps");
      -[UIKeyboardLayoutStar updateGlobeKeyDisplayString](self, "updateGlobeKeyDisplayString");
      -[UIKeyboardLayoutStar keyViewAnimator](self, "keyViewAnimator");
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v124, "reset");

      v9 = v147;
      if (v145 != -[UIKeyboardLayoutStar isShiftKeyPlaneChooser](self, "isShiftKeyPlaneChooser"))
        objc_msgSend(v147, "clearShiftState");

      v39 = v146;
      goto LABEL_62;
    }
    v43 = self->_keyboard;
    objc_msgSend(v41, "gestureKeyplaneName");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBTree subtreeWithName:](v43, "subtreeWithName:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIKeyboardLayoutStar setCurrencyKeysForCurrentLocaleOnKeyplane:](self, "setCurrencyKeysForCurrentLocaleOnKeyplane:", v45);
    -[UIKeyboardLayoutStar setPercentSignKeysForCurrentLocaleOnKeyplane:](self, "setPercentSignKeysForCurrentLocaleOnKeyplane:", v45);
    -[UIKeyboardLayoutStar layoutTag](self, "layoutTag");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v153 = 0u;
    v154 = 0u;
    v155 = 0u;
    v156 = 0u;
    v151 = v45;
    objc_msgSend(v45, "cachedKeysByKeyName:", CFSTR("Adaptive-Key"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v153, v160, 16);
    if (v48)
    {
      v49 = v48;
      v50 = *(_QWORD *)v154;
      v51 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v49; ++i)
        {
          if (*(_QWORD *)v154 != v50)
            objc_enumerationMutation(v47);
          v53 = *(void **)(*((_QWORD *)&v153 + 1) + 8 * i);
          v152[0] = v51;
          v152[1] = 3221225472;
          v152[2] = __45__UIKeyboardLayoutStar_createLayoutFromName___block_invoke;
          v152[3] = &unk_1E16D4048;
          v152[4] = self;
          objc_msgSend(v53, "setLayoutTag:passingKeyTest:", v46, v152);
        }
        v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v153, v160, 16);
      }
      while (v49);
    }

    -[UIKeyboardLayoutStar updateAutolocalizedKeysForKeyplane:](self, "updateAutolocalizedKeysForKeyplane:", v151);
    objc_msgSend(v151, "subtrees");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "firstObject");
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v41, "subtrees");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "firstObject");
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v57, "setCachedGestureLayout:", v55);
    if (objc_msgSend(v41, "intForProperty:", CFSTR("shift-rendering")) != 31)
    {
      objc_msgSend(v41, "subtrees");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v58, "count") <= 1)
      {

      }
      else
      {
        objc_msgSend(v41, "subtrees");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "objectAtIndexedSubscript:", 1);
        v60 = (void *)objc_claimAutoreleasedReturnValue();

        if (v60)
        {
          objc_msgSend(v60, "setCachedGestureLayout:", v55);
          v57 = v60;
          goto LABEL_40;
        }
      }
      v57 = 0;
    }
LABEL_40:
    p_keyplane = &self->_keyplane;
    v4 = v149;

    goto LABEL_41;
  }
  v36 = self->_liveKeyplaneView;
  if (v36)
  {
    -[TUIKeyplaneView removeFromSuperview](v36, "removeFromSuperview");
    v37 = self->_liveKeyplaneView;
    self->_liveKeyplaneView = 0;

  }
  self->_layoutSupportsCrescendo = 0;
LABEL_64:

}

uint64_t __45__UIKeyboardLayoutStar_createLayoutFromName___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "shouldMergeKey:", a2) ^ 1;
}

uint64_t __40__UIKeyboardLayoutStar_setKeyplaneName___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "shouldMergeKey:", a2) ^ 1;
}

- (void)annotateKeysWithDeveloperPunctuation
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  unint64_t *v24;
  unint64_t v25;
  unint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  id obj;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _QWORD v45[3];
  _QWORD v46[5];

  v46[3] = *MEMORY[0x1E0C80C00];
  v45[0] = &unk_1E1A98508;
  v45[1] = &unk_1E1A98568;
  v46[0] = &unk_1E1A93CF8;
  v46[1] = &unk_1E1A93DE8;
  v45[2] = &unk_1E1A98580;
  v46[2] = &unk_1E1A93EA8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0;
  v42 = 0;
  v40 = 0;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[UIKBTree subtrees](self->_keyplane, "subtrees");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v37;
    v28 = *(_QWORD *)v37;
    do
    {
      v8 = 0;
      v29 = v5;
      do
      {
        if (*(_QWORD *)v37 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v8);
        objc_msgSend(v9, "name", v28);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "rangeOfString:", CFSTR("Letters"));
        v31 = v8;
        if (((v11 == 0x7FFFFFFFFFFFFFFFLL) & v6) == 1)
        {
          objc_msgSend(v9, "name");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "rangeOfString:", CFSTR("Punctuation"));

          if (v13 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v6 = 1;
            goto LABEL_31;
          }
        }
        else
        {
          v14 = v11;

          if (v14 == 0x7FFFFFFFFFFFFFFFLL)
            goto LABEL_31;
        }
        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        objc_msgSend(v9, "keys");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v43, 16);
        if (!v16)
          goto LABEL_30;
        v17 = v16;
        v18 = *(_QWORD *)v33;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v33 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v20, "displayRowHint"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "objectForKeyedSubscript:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            v23 = objc_msgSend(v20, "displayRowHint");
            switch(v23)
            {
              case 1:
                v24 = (unint64_t *)&v42;
                break;
              case 3:
                v24 = (unint64_t *)&v40;
                break;
              case 2:
                v24 = (unint64_t *)&v41;
                break;
              default:
                goto LABEL_28;
            }
            v25 = *v24;
            v26 = objc_msgSend(v22, "count");
            v27 = (void *)MEMORY[0x1E0C9AA60];
            if (v25 < v26)
            {
              objc_msgSend(v22, "objectAtIndexedSubscript:", *v24);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              ++*v24;
            }
            if (objc_msgSend(v20, "visible"))
            {
              if (objc_msgSend(v27, "count"))
              {
                objc_msgSend(v20, "setSecondaryDisplayStrings:", v27);
                objc_msgSend(v20, "setSecondaryRepresentedStrings:", v27);
              }
              objc_msgSend(v20, "setDisplayTypeHint:", 10);
            }

LABEL_28:
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v43, 16);
        }
        while (v17);
LABEL_30:

        v6 = 1;
        v7 = v28;
        v5 = v29;
LABEL_31:
        v8 = v31 + 1;
      }
      while (v31 + 1 != v5);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    }
    while (v5);
  }

}

- (BOOL)ignoreWriteboard
{
  return -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") != 1
      && -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") != 24
      && -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") != 25
      && -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") != 26
      && -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") != 23
      && (unint64_t)(-[UIKeyboardLayout orientation](self, "orientation") - 3) <= 1
      && -[UIKeyboardLayoutStar isEmojiKeyplane](self, "isEmojiKeyplane");
}

- (BOOL)useDismissForMessagesWriteboard
{
  void *v3;
  void *v4;
  void *v5;
  double MidX;
  double v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  BOOL v12;
  double v13;
  double MinX;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  if (-[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") != 1
    && -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") != 24
    && -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") != 25
    && -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") != 26
    && -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") != 23
    || -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") != 1
    && -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") != 24
    && -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") != 25
    && -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") != 26
    && -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") != 23)
  {
    return 0;
  }
  -[UIKBTree rightSpaceKey](self->_keyplane, "rightSpaceKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBTree cachedKeysByKeyName:](self->_keyplane, "cachedKeysByKeyName:", CFSTR("More-Key"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v4, "count") < 2)
  {
    if ((unint64_t)objc_msgSend(v4, "count") <= 1)
    {
      -[UIKBTree firstKeyplaneSwitchKey](self->_keyplane, "firstKeyplaneSwitchKey");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v12 = 0;
      }
      else
      {
        -[UIKBTree firstCachedKeyWithName:](self->_keyplane, "firstCachedKeyWithName:", CFSTR("Handwriting-Input"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = v20 == 0;
      }

      v8 = 0;
      goto LABEL_26;
    }
    v8 = 0;
    goto LABEL_23;
  }
  objc_msgSend(v4, "objectAtIndex:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  MidX = CGRectGetMidX(v22);
  -[UIKBScreenTraits keyboardWidth](self->super._screenTraits, "keyboardWidth");
  objc_msgSend(v4, "objectAtIndex:", MidX <= v7 * 0.5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[UIKBTree isSplit](self->_keyplane, "isSplit");
  -[UIKBTree firstCachedKeyWithName:](self->_keyplane, "firstCachedKeyWithName:", CFSTR("Modify-For-Writeboard-Key"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {

LABEL_23:
    v12 = 0;
    goto LABEL_26;
  }
  if (v9)
    v13 = 4.0;
  else
    v13 = 3.0;
  objc_msgSend(v8, "frame");
  MinX = CGRectGetMinX(v23);
  objc_msgSend(v3, "frame");
  v15 = vabdd_f64(MinX, CGRectGetMaxX(v24));
  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "preferencesActions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "rivenSizeFactor:", v13);
  v19 = v18;

  if (v15 <= v19)
    goto LABEL_23;
  v12 = 1;
LABEL_26:

  return v12;
}

- (BOOL)useUndoForMessagesWriteboard
{
  _BOOL4 v3;
  BOOL v4;
  void *v5;
  BOOL result;

  v3 = -[UIKeyboardLayoutStar is10KeyRendering](self, "is10KeyRendering");
  if (-[UIKBScreenTraits idiom](self->super._screenTraits, "idiom"))
    v4 = 1;
  else
    v4 = !v3;
  result = 0;
  if (!v4)
  {
    -[UIKBTree firstCachedKeyWithName:](self->_keyplane, "firstCachedKeyWithName:", CFSTR("Undo-Key"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      return 1;
  }
  return result;
}

- (void)clearKeyAnnotationsIfNecessary
{
  uint64_t i;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t j;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t k;
  void *v15;
  id obj;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[UIKBTree subtrees](self->_keyboard, "subtrees");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v18)
  {
    v17 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v28 != v17)
          objc_enumerationMutation(obj);
        v3 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        objc_msgSend(v3, "subtrees");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
        if (v5)
        {
          v6 = v5;
          v7 = *(_QWORD *)v24;
          do
          {
            for (j = 0; j != v6; ++j)
            {
              if (*(_QWORD *)v24 != v7)
                objc_enumerationMutation(v4);
              v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
              v19 = 0u;
              v20 = 0u;
              v21 = 0u;
              v22 = 0u;
              objc_msgSend(v9, "keys");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v31, 16);
              if (v11)
              {
                v12 = v11;
                v13 = *(_QWORD *)v20;
                do
                {
                  for (k = 0; k != v12; ++k)
                  {
                    if (*(_QWORD *)v20 != v13)
                      objc_enumerationMutation(v10);
                    v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * k);
                    if (objc_msgSend(v15, "displayTypeHint") == 10)
                    {
                      if (objc_msgSend(v15, "displayType") != 7)
                      {
                        objc_msgSend(v15, "setSecondaryDisplayStrings:", 0);
                        objc_msgSend(v15, "setSecondaryRepresentedStrings:", 0);
                      }
                      objc_msgSend(v15, "setDisplayTypeHint:", 0);
                    }
                  }
                  v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v31, 16);
                }
                while (v12);
              }

            }
            v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
          }
          while (v6);
        }

      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    }
    while (v18);
  }

}

- (BOOL)_stringContainsCurrencyCharacters:(id)a3
{
  id v3;
  uint64_t v4;
  char v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v3 = a3;
  if (_stringContainsCurrencyCharacters__onceToken != -1)
    dispatch_once(&_stringContainsCurrencyCharacters__onceToken, &__block_literal_global_688_0);
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v4 = objc_msgSend(v3, "length");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__UIKeyboardLayoutStar__stringContainsCurrencyCharacters___block_invoke_2;
  v7[3] = &unk_1E16D4098;
  v7[4] = &v8;
  objc_msgSend(v3, "_enumerateLongCharactersInRange:usingBlock:", 0, v4, v7);
  v5 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return v5;
}

uint64_t __58__UIKeyboardLayoutStar__stringContainsCurrencyCharacters___block_invoke()
{
  uint64_t result;
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[1] = 0;
  objc_msgSend(CFSTR("[\\p{Sc}]"), "getCharacters:", (char *)v1 - ((2 * objc_msgSend(CFSTR("[\\p{Sc}]"), "length") + 15) & 0x3FFFFFFF0));
  result = uset_openPattern();
  _stringContainsCurrencyCharacters__currencySet = result;
  return result;
}

uint64_t __58__UIKeyboardLayoutStar__stringContainsCurrencyCharacters___block_invoke_2(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = MEMORY[0x186DCA2B8](_stringContainsCurrencyCharacters__currencySet);
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (void)updateCurrencySymbolForKey:(id)a3 withCurrencyString:(id)a4
{
  id v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;

  v17 = a3;
  v6 = a4;
  objc_msgSend(v17, "representedString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[UIKeyboardLayoutStar _stringContainsCurrencyCharacters:](self, "_stringContainsCurrencyCharacters:", v7);

  if (v8)
  {
    objc_msgSend(v17, "setDisplayString:", v6);
    objc_msgSend(v17, "setRepresentedString:", v6);
  }
  objc_msgSend(v17, "secondaryRepresentedStrings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v17, "secondaryDisplayStrings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  objc_msgSend(v17, "secondaryRepresentedStrings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __70__UIKeyboardLayoutStar_updateCurrencySymbolForKey_withCurrencyString___block_invoke;
  v18[3] = &unk_1E16D40C0;
  v18[4] = self;
  v19 = v10;
  v20 = v6;
  v21 = v12;
  v14 = v12;
  v15 = v6;
  v16 = v10;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v18);

  objc_msgSend(v17, "setSecondaryRepresentedStrings:", v16);
  objc_msgSend(v17, "setSecondaryDisplayStrings:", v14);

}

uint64_t __70__UIKeyboardLayoutStar_updateCurrencySymbolForKey_withCurrencyString___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_stringContainsCurrencyCharacters:", a2);
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 40), "replaceObjectAtIndex:withObject:", a3, *(_QWORD *)(a1 + 48));
    result = objc_msgSend(*(id *)(a1 + 56), "replaceObjectAtIndex:withObject:", a3, *(_QWORD *)(a1 + 48));
    *a4 = 1;
  }
  return result;
}

void __69__UIKeyboardLayoutStar_setPercentSignKeysForCurrentLocaleOnKeyplane___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:", CFSTR("⁒"), 0);
  v1 = (void *)qword_1ECD79810;
  qword_1ECD79810 = v0;

}

uint64_t __69__UIKeyboardLayoutStar_setPercentSignKeysForCurrentLocaleOnKeyplane___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = objc_msgSend((id)qword_1ECD79810, "containsObject:", a2);
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 32), "replaceObjectAtIndex:withObject:", a3, *(_QWORD *)(a1 + 40));
    return objc_msgSend(*(id *)(a1 + 48), "replaceObjectAtIndex:withObject:", a3, *(_QWORD *)(a1 + 40));
  }
  return result;
}

- (int)stateForMultitapReverseKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;

  v4 = a3;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "markedText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_lastGrapheme");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_multitapKey
    || objc_msgSend(v7, "length")
    && (-[UIKeyboardLayoutStar keyWithRepresentedString:](self, "keyWithRepresentedString:", v7),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
    v8 = 2;
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (int)stateForCandidateListKey:(id)a3
{
  return 2;
}

- (BOOL)supportStylingWithKey:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (-[UIKBTextEditingTraits supportStyling](self->super._textEditingTraits, "supportStyling")
    && (objc_msgSend(v4, "interactionType") != 28
     || -[UIKBTextEditingTraits canToggleBoldface](self->super._textEditingTraits, "canToggleBoldface"))
    && (objc_msgSend(v4, "interactionType") != 29
     || -[UIKBTextEditingTraits canToggleItalics](self->super._textEditingTraits, "canToggleItalics"))
    && (objc_msgSend(v4, "interactionType") != 30
     || -[UIKBTextEditingTraits canToggleUnderline](self->super._textEditingTraits, "canToggleUnderline")))
  {
    v5 = objc_msgSend(v4, "displayType") != 49
      || -[UIKBTextEditingTraits canToggleBoldface](self->super._textEditingTraits, "canToggleBoldface")
      || -[UIKBTextEditingTraits canToggleItalics](self->super._textEditingTraits, "canToggleItalics")
      || -[UIKBTextEditingTraits canToggleUnderline](self->super._textEditingTraits, "canToggleUnderline");
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (int)stateForStylingKey:(id)a3
{
  id v4;
  int v5;

  v4 = a3;
  if (-[UIKeyboardLayoutStar supportStylingWithKey:](self, "supportStylingWithKey:", v4))
  {
    if (objc_msgSend(v4, "interactionType") == 28
      && -[UIKBTextEditingTraits isBold](self->super._textEditingTraits, "isBold")
      || objc_msgSend(v4, "interactionType") == 29
      && -[UIKBTextEditingTraits isItalicized](self->super._textEditingTraits, "isItalicized")
      || objc_msgSend(v4, "interactionType") == 30
      && -[UIKBTextEditingTraits isUnderlined](self->super._textEditingTraits, "isUnderlined"))
    {
      v5 = 4;
    }
    else if (objc_msgSend(v4, "state") == 16)
    {
      v5 = 16;
    }
    else
    {
      v5 = 2;
    }
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (id)highlightedVariantListForStylingKey:(id)a3
{
  void *v4;

  if (objc_msgSend(a3, "variantType") == 9)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[UIKBTextEditingTraits isBold](self->super._textEditingTraits, "isBold"))
      objc_msgSend(v4, "addObject:", &unk_1E1A98598);
    if (-[UIKBTextEditingTraits isItalicized](self->super._textEditingTraits, "isItalicized"))
      objc_msgSend(v4, "addObject:", &unk_1E1A984F0);
    if (-[UIKBTextEditingTraits isUnderlined](self->super._textEditingTraits, "isUnderlined"))
      objc_msgSend(v4, "addObject:", &unk_1E1A985B0);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (int)stateForManipulationKey:(id)a3
{
  id v4;
  int v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  if ((objc_msgSend(v4, "interactionType") != 31
     || !-[UIKBTextEditingTraits canCut](self->super._textEditingTraits, "canCut"))
    && (objc_msgSend(v4, "interactionType") != 32
     || !-[UIKBTextEditingTraits canCopy](self->super._textEditingTraits, "canCopy"))
    && (objc_msgSend(v4, "interactionType") != 33
     || !-[UIKBTextEditingTraits canPaste](self->super._textEditingTraits, "canPaste"))
    && (objc_msgSend(v4, "interactionType") != 34
     || !-[UIKBTextEditingTraits canMoveCursorLeft](self->super._textEditingTraits, "canMoveCursorLeft"))
    && (objc_msgSend(v4, "interactionType") != 35
     || !-[UIKBTextEditingTraits canMoveCursorRight](self->super._textEditingTraits, "canMoveCursorRight")))
  {
    if (objc_msgSend(v4, "interactionType") != 17
      && objc_msgSend(v4, "interactionType") != 12)
    {
      v5 = 1;
      goto LABEL_12;
    }
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "delegateAsResponder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_responderForEditing");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "undoManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v4, "interactionType") == 17)
    {
      if ((objc_msgSend(v10, "canUndo") & 1) != 0)
        goto LABEL_20;
    }
    else if ((objc_msgSend(v10, "canRedo") & 1) != 0)
    {
      goto LABEL_20;
    }
    if (objc_msgSend(v4, "displayTypeHint") != 11)
    {
      v5 = 1;
      goto LABEL_23;
    }
LABEL_20:
    v5 = 2;
LABEL_23:

    goto LABEL_12;
  }
  v5 = 2;
LABEL_12:

  return v5;
}

- (int)stateForKeyplaneSwitchKey:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;

  v4 = a3;
  -[UIKBTree name](self->_keyboard, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "rangeOfString:", CFSTR("QWERTY-Japanese"));

  v7 = 2;
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSString lowercaseString](self->_keyplaneName, "lowercaseString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "representedString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lowercaseString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "rangeOfString:", v10) == 0x7FFFFFFFFFFFFFFFLL)
      v7 = 2;
    else
      v7 = 4;
    if (-[UIKBTree visualStyle](self->_keyboard, "visualStyle") == 101
      || -[UIKeyboardLayoutStar is10KeyRendering](self, "is10KeyRendering"))
    {
      objc_msgSend(v8, "componentsSeparatedByString:", CFSTR("-"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "componentsSeparatedByString:", CFSTR("-"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndex:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndex:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "isEqualToString:", v14);

      if (v15)
        v7 = 4;

    }
  }

  return v7;
}

- (id)keylistContainingKey:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  char v17;
  id v18;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[UIKBTree subtrees](self->_keyplane, "subtrees");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v21)
  {
    v6 = *(_QWORD *)v27;
    v20 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v27 != v6)
          objc_enumerationMutation(v5);
        v8 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        objc_msgSend(v8, "keySet", v20);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "subtrees");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v23;
          while (2)
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v23 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * j);
              objc_msgSend(v15, "subtrees");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v16, "containsObject:", v4);

              if ((v17 & 1) != 0)
              {
                v18 = v15;

                goto LABEL_19;
              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
            if (v12)
              continue;
            break;
          }
        }

        v6 = v20;
      }
      v18 = 0;
      v21 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v21);
  }
  else
  {
    v18 = 0;
  }
LABEL_19:

  return v18;
}

- (id)_currentKeyplaneTransformationContext
{
  UIKBKeyplaneTransformationContext *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  v3 = objc_alloc_init(UIKBKeyplaneTransformationContext);
  -[UIKeyboardLayoutStar keyplaneName](self, "keyplaneName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBKeyplaneTransformationContext setCurrentKeyplaneName:](v3, "setCurrentKeyplaneName:", v4);

  -[UIKBKeyplaneTransformationContext setScreenTraits:](v3, "setScreenTraits:", self->super._screenTraits);
  -[UIKeyboardLayoutStar inputModeToMergeCapsLockKey](self, "inputModeToMergeCapsLockKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBKeyplaneTransformationContext setUsesScriptSwitch:](v3, "setUsesScriptSwitch:", v5 != 0);

  -[UIKBKeyplaneTransformationContext setActiveKeyboard:](v3, "setActiveKeyboard:", self->_keyboard);
  -[UIKBKeyplaneTransformationContext setActiveKeyplane:](v3, "setActiveKeyplane:", self->_keyplane);
  if (+[UIKeyboard resizable](UIKeyboard, "resizable"))
  {
    -[UIView superview](self, "superview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    -[UIKBKeyplaneTransformationContext setKeyboardSize:](v3, "setKeyboardSize:", v7, v8);

  }
  else
  {
    -[UIKeyboardLayoutStar sizeForKeyplane:](self, "sizeForKeyplane:", self->_keyplane);
    -[UIKBKeyplaneTransformationContext setKeyboardSize:](v3, "setKeyboardSize:");
  }
  if (-[UIKBScreenTraits resizeKeyboardHeight](self->super._screenTraits, "resizeKeyboardHeight"))
    -[UIKBScreenTraits keyboardHeightAdjustment](self->super._screenTraits, "keyboardHeightAdjustment");
  else
    -[UIKBResizingKeyplaneCoordinator resizingOffset](self->_resizingKeyplaneCoordinator, "resizingOffset");
  -[UIKBKeyplaneTransformationContext setResizingOffset:](v3, "setResizingOffset:");
  return v3;
}

- (void)recenterMonolithKeyplaneSwitchKeys
{
  void *v3;
  void *v4;
  void *v5;
  UIKBTree *keyplane;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  id v17;

  -[UIKBTree firstCachedKeyWithName:](self->_keyplane, "firstCachedKeyWithName:", CFSTR("Monolith-International-Key"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardLayoutStar keylistContainingKey:](self, "keylistContainingKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subtrees");
  v17 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "sortedArrayUsingComparator:", &__block_literal_global_753);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  keyplane = self->_keyplane;
  -[UIView bounds](self, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[UIKBScreenTraits screen](self->super._screenTraits, "screen");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "scale");
  -[UIKBTree centerKeys:inRect:scale:](keyplane, "centerKeys:inRect:scale:", v5, v8, v10, v12, v14, v16);

}

uint64_t __58__UIKeyboardLayoutStar_recenterMonolithKeyplaneSwitchKeys__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  objc_msgSend(a2, "frame");
  v6 = v5;
  objc_msgSend(v4, "frame");
  v8 = v7;

  if (v6 - v8 < 0.0)
    return -1;
  else
    return v6 - v8 > 0.0;
}

- (id)inputModeToMergeCapsLockKey
{
  void *v3;
  void *v4;

  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inputModeForASCIIToggleWithTraits:", self->super._inputTraits);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)keyplaneFactory
{
  _BOOL4 v3;
  int *v4;

  v3 = -[UIKeyboardLayoutStar useCrescendoLayout](self, "useCrescendoLayout");
  v4 = &OBJC_IVAR___UIKeyboardLayoutStar__keyplaneView;
  if (v3)
    v4 = &OBJC_IVAR___UIKeyboardLayoutStar__liveKeyplaneView;
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + *v4), "factory");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)viewForKey:(id)a3
{
  id v4;
  _BOOL4 v5;
  int *v6;
  void *v7;

  v4 = a3;
  v5 = -[UIKeyboardLayoutStar useCrescendoLayout](self, "useCrescendoLayout");
  v6 = &OBJC_IVAR___UIKeyboardLayoutStar__keyplaneView;
  if (v5)
    v6 = &OBJC_IVAR___UIKeyboardLayoutStar__liveKeyplaneView;
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + *v6), "viewForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)updateState:(int)a3 forKey:(id)a4
{
  uint64_t v4;
  id v6;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  -[UIKeyboardLayoutStar setActiveKey:](self, "setActiveKey:", v6);
  -[UIKeyboardLayoutStar setState:forKey:](self, "setState:forKey:", v4, v6);

}

- (UIKeyboardEmojiKeyDisplayController)emojiKeyManager
{
  UIKeyboardEmojiKeyDisplayController *emojiKeyManager;
  UIKeyboardEmojiKeyDisplayController *v4;
  UIKeyboardEmojiKeyDisplayController *v5;

  emojiKeyManager = self->_emojiKeyManager;
  if (!emojiKeyManager)
  {
    v4 = objc_alloc_init(UIKeyboardEmojiKeyDisplayController);
    v5 = self->_emojiKeyManager;
    self->_emojiKeyManager = v4;

    emojiKeyManager = self->_emojiKeyManager;
  }
  return emojiKeyManager;
}

- (void)showKeyboardWithInputMode:(id)a3 renderConfig:(id)a4 inputTraits:(id)a5 screenTraits:(id)a6 splitTraits:(id)a7
{
  -[UIKeyboardLayoutStar showKeyboardWithInputMode:renderConfig:inputTraits:screenTraits:splitTraits:reload:](self, "showKeyboardWithInputMode:renderConfig:inputTraits:screenTraits:splitTraits:reload:", a3, a4, a5, a6, a7, 0);
}

- (void)reloadKeyboardWithInputTraits:(id)a3 screenTraits:(id)a4 splitTraits:(id)a5
{
  -[UIKeyboardLayoutStar showKeyboardWithInputMode:renderConfig:inputTraits:screenTraits:splitTraits:reload:](self, "showKeyboardWithInputMode:renderConfig:inputTraits:screenTraits:splitTraits:reload:", 0, 0, a3, a4, a5, 1);
}

- (void)deactivateActiveKey
{
  void *v3;
  void *v4;

  -[UIKeyboardLayoutStar activeKey](self, "activeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIKeyboardLayoutStar activeKey](self, "activeKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardLayoutStar setState:forKey:](self, "setState:forKey:", 2, v4);

    -[UIKeyboardLayoutStar setActiveKey:](self, "setActiveKey:", 0);
  }
}

- (void)prepareSliderBehaviorFeedback
{
  void *v3;
  UISelectionFeedbackGenerator *v4;
  id v5;

  -[UIKeyboardLayoutStar slideBehaviour](self, "slideBehaviour");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(UISelectionFeedbackGenerator);
    -[UIKeyboardLayoutStar setSlideBehaviour:](self, "setSlideBehaviour:", v4);

    -[UIKeyboardLayoutStar slideBehaviour](self, "slideBehaviour");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userInteractionStarted");

  }
}

- (void)provideSliderBehaviorFeedback
{
  id v2;

  -[UIKeyboardLayoutStar slideBehaviour](self, "slideBehaviour");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectionChanged");

}

- (void)finishSliderBehaviorFeedback
{
  void *v3;

  -[UIKeyboardLayoutStar slideBehaviour](self, "slideBehaviour");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userInteractionEnded");

  -[UIKeyboardLayoutStar setSlideBehaviour:](self, "setSlideBehaviour:", 0);
}

- (id)keyViewHitTestForPoint:(CGPoint)a3
{
  void *v3;
  CGFloat y;
  CGFloat x;
  void *v6;
  uint64_t v7;
  void *i;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  void *v18;
  BOOL v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;
  CGPoint v27;
  CGRect v28;

  v26 = *MEMORY[0x1E0C80C00];
  if (self->_liveKeyplaneView)
  {
    v3 = 0;
  }
  else
  {
    y = a3.y;
    x = a3.x;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    -[UIKBKeyplaneView activeKeyViews](self->_keyplaneView, "activeKeyViews", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v3)
    {
      v7 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v3; i = (char *)i + 1)
        {
          if (*(_QWORD *)v22 != v7)
            objc_enumerationMutation(v6);
          v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v9, "variantFrame");
          v11 = v10;
          v13 = v12;
          v15 = v14;
          v17 = v16;
          objc_msgSend(v9, "key");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v18, "state") == 16)
          {
            v28.origin.x = v11;
            v28.origin.y = v13;
            v28.size.width = v15;
            v28.size.height = v17;
            v27.x = x;
            v27.y = y;
            v19 = CGRectContainsPoint(v28, v27);

            if (v19)
            {
              objc_msgSend(v9, "key");
              v3 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_14;
            }
          }
          else
          {

          }
        }
        v3 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v3);
    }
LABEL_14:

  }
  return v3;
}

- (id)keyHitTestContainingPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;
  CGPoint v20;
  CGRect v21;

  y = a3.y;
  x = a3.x;
  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[UIKBTree keys](self->_keyplane, "keys", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (-[UIKeyboardLayoutStar shouldHitTestKey:](self, "shouldHitTestKey:", v11))
        {
          objc_msgSend(v11, "frame");
          v20.x = x;
          v20.y = y;
          if (CGRectContainsPoint(v21, v20))
          {
            v12 = v11;
            goto LABEL_12;
          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_12:

  return v12;
}

- (id)keyHitTestClosestToPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;

  y = a3.y;
  x = a3.x;
  -[UIKBTree keys](self->_keyplane, "keys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardLayoutStar keyHitTestClosestToPoint:inKeys:](self, "keyHitTestClosestToPoint:inKeys:", v6, x, y);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)keyHitTestClosestToPoint:(CGPoint)a3 inKeys:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t i;
  void *v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  double v20;
  double v21;
  id v22;
  id v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  y = a3.y;
  x = a3.x;
  v30 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    v8 = 0;
    goto LABEL_21;
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (!v10)
  {

    v8 = 0;
LABEL_18:
    if (-[UIKeyboardLayoutStar shouldIgnoreDistantKey](self, "shouldIgnoreDistantKey", (_QWORD)v25))
    {
      v23 = 0;
LABEL_20:

      v8 = v23;
    }
    goto LABEL_21;
  }
  v11 = v10;
  v8 = 0;
  v12 = *(_QWORD *)v26;
  v13 = 1.79769313e308;
  while (2)
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v26 != v12)
        objc_enumerationMutation(v9);
      v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
      if (-[UIKeyboardLayoutStar shouldHitTestKey:](self, "shouldHitTestKey:", v15, (_QWORD)v25))
      {
        objc_msgSend(v15, "frame");
        UIDistanceBetweenPointAndRect(x, y, v16, v17, v18, v19);
        v21 = v20;
        if (fabs(v20) < 2.22044605e-16)
        {
          v23 = v15;

          goto LABEL_20;
        }
        if (v20 < v13)
        {
          v22 = v15;

          v8 = v22;
          v13 = v21;
        }
      }
    }
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v11)
      continue;
    break;
  }

  if (v13 > 17.0)
    goto LABEL_18;
LABEL_21:

  return v8;
}

- (id)keyHitTestWithoutCharging:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  BOOL v7;
  void *v8;
  CGPoint v10;
  CGRect v11;

  y = a3.y;
  x = a3.x;
  if (self->_inactiveLanguageIndicator
    && (-[UIKeyboardLayoutStar viewForKey:](self, "viewForKey:"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "frame"),
        v10.x = x,
        v10.y = y,
        v7 = CGRectContainsPoint(v11, v10),
        v6,
        v7))
  {
    v8 = 0;
  }
  else
  {
    -[UIKeyboardLayoutStar keyViewHitTestForPoint:](self, "keyViewHitTestForPoint:", x, y);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      -[UIKeyboardLayoutStar keyHitTestContainingPoint:](self, "keyHitTestContainingPoint:", x, y);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        -[UIKeyboardLayoutStar keyHitTestClosestToPoint:](self, "keyHitTestClosestToPoint:", x, y);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  return v8;
}

- (id)keyHitTest:(CGPoint)a3
{
  double y;
  double x;
  _BOOL4 v6;
  void *v7;

  if (self->_keyboard && self->_keyplane)
  {
    y = a3.y;
    x = a3.x;
    v6 = -[UIKeyboardLayoutStar pointInside:withEvent:](self, "pointInside:withEvent:", 0);
    v7 = 0;
    if (v6)
    {
      -[UIKeyboardLayoutStar keyHitTestWithoutCharging:](self, "keyHitTestWithoutCharging:", x, y);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (BOOL)isGeometricShiftOrMoreKeyForTouch:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;

  v4 = a3;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locationInView:", v6);
    v8 = v7;
    v10 = v9;

    -[UIKeyboardLayoutStar keyHitTest:](self, "keyHitTest:", v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v5) = objc_msgSend(v11, "displayType") == 23
              || objc_msgSend(v11, "displayType") == 18;

  }
  return (char)v5;
}

- (BOOL)shouldPreventInputManagerHitTestingForKey:(id)a3
{
  return objc_msgSend(a3, "isExemptFromInputManagerHitTesting");
}

- (BOOL)shouldIgnoreDistantKey
{
  double v3;
  void *v5;
  char v6;

  -[UIKBResizingKeyplaneCoordinator resizingOffset](self->_resizingKeyplaneCoordinator, "resizingOffset");
  if (v3 > 0.0 && -[UIKeyboardLayoutStar keyplaneUsesResizingOffset](self, "keyplaneUsesResizingOffset"))
    return 1;
  -[UIKBTree name](self->_keyplane, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsString:", CFSTR("Korean10KeySplit-Keyboard"));

  return v6;
}

- (int)keycodeForKey:(id)a3
{
  UIKBTree *keyplane;
  id v4;
  void *v5;
  int v6;

  keyplane = self->_keyplane;
  v4 = a3;
  -[UIKBTree keys](keyplane, "keys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  return v6;
}

- (id)unprocessedTouchEventsForTouchInfo:(id)a3 touchStage:(int)a4 forcedKeyCode:(int)a5
{
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  unint64_t v32;
  void *v33;

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "processedTouchCount");
  objc_msgSend(v7, "touchHistory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v9 < v11)
  {
    do
    {
      objc_msgSend(v7, "touchHistory");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndexedSubscript:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        if (a4 == 1
          || (objc_msgSend(v7, "touchHistory"),
              v14 = (void *)objc_claimAutoreleasedReturnValue(),
              v15 = objc_msgSend(v14, "count"),
              v14,
              v9 + 1 < v15))
        {
          v16 = 1;
        }
        else
        {
          v16 = 2;
        }
      }
      else
      {
        v16 = 0;
      }
      v17 = (void *)MEMORY[0x1E0DBDC78];
      objc_msgSend(v13, "locationInView:", self);
      v19 = v18;
      v21 = v20;
      objc_msgSend(v13, "pathMajorRadius");
      v23 = v22;
      objc_msgSend(v13, "timestamp");
      v25 = v24;
      v26 = objc_msgSend(v13, "pathIndex");
      v27 = objc_msgSend(v7, "fingerID");
      v28 = objc_msgSend(v7, "continuousPathState") - 1;
      if (v28 < 6)
        v29 = (v28 + 1);
      else
        v29 = 0;
      objc_msgSend(v17, "touchEventWithStage:location:radius:timestamp:pathIndex:fingerID:forcedKeyCode:continuousPathState:", v16, v26, v27, a5, v29, v19, v21, v23, v25);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v30);

      ++v9;
      objc_msgSend(v7, "touchHistory");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "count");

    }
    while (v9 < v32);
  }
  objc_msgSend(v7, "touchHistory");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProcessedTouchCount:", objc_msgSend(v33, "count"));

  return v8;
}

- (void)playKeyFeedbackIfNecessaryForTouchDownOnKey:(id)a3 touchInfo:(id)a4
{
  id v6;
  int v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = -[UIKeyboardLayoutStar downActionFlagsForKey:](self, "downActionFlagsForKey:", v8);
  if (!objc_msgSend(v6, "didPlayKeyFeedback") && (v7 & 4) != 0 && (v7 & 0x40000000) == 0)
  {
    if (!_AXSZoomTouchEnabled())
    {
      if (+[UIKeyboardImpl rivenPreference](UIKeyboardImpl, "rivenPreference")
        && -[UIKeyboardLayoutStar playKeyClickSoundOn](self, "playKeyClickSoundOn"))
      {
        -[UIKeyboardLayoutStar performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_playKeyClickSoundOnDownForKey_, v8, 0.05);
      }
      else
      {
        -[UIKeyboardLayoutStar playKeyClickSoundOnDownForKey:](self, "playKeyClickSoundOnDownForKey:", v8);
      }
    }
    objc_msgSend(v6, "setDidPlayKeyFeedback:", 1);
  }

}

- (void)performHitTestForTouchInfo:(id)a3 touchStage:(int)a4 executionContextPassingUIKBTree:(id)a5
{
  uint64_t v6;
  id v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  int v22;
  double v23;
  void *v24;
  id v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  void *v33;
  id v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  int v47;
  char v48;
  _QWORD v49[5];
  id v50;
  id v51;
  SEL v52;
  int v53;
  CGPoint v54;
  CGPoint v55;
  CGRect v56;
  CGRect v57;

  v6 = *(_QWORD *)&a4;
  v9 = a3;
  v10 = a5;
  v11 = v10;
  if (v9)
  {
    objc_msgSend(v9, "touch");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "locationInView:", self);
    v14 = v13;
    v16 = v15;
    objc_msgSend(v12, "timestamp");
    v18 = v17;
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[UIKeyboardLayoutStar pointInside:withEvent:](self, "pointInside:withEvent:", 0, v14, v16);
    -[UIKeyboardLayoutStar keyHitTest:](self, "keyHitTest:", v14, v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!(_DWORD)v6)
      -[UIKeyboardLayoutStar playKeyFeedbackIfNecessaryForTouchDownOnKey:touchInfo:](self, "playKeyFeedbackIfNecessaryForTouchDownOnKey:touchInfo:", v21, v9);
    if (objc_msgSend(v19, "canHandleKeyHitTest"))
      v22 = objc_msgSend(v19, "containsView:", self);
    else
      v22 = 0;
    if (-[UIKeyboardLayoutStar shouldPreventInputManagerHitTestingForKey:](self, "shouldPreventInputManagerHitTestingForKey:", v21))
    {
      if (objc_msgSend(v21, "interactionType") == 5
        && CFAbsoluteTimeGetCurrent() - self->_prevTouchUpTime < 0.325)
      {
        objc_msgSend(v21, "frame");
        -[UIKeyboardLayoutStar keyHitTest:](self, "keyHitTest:", v14 + v23, v16);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[UIKeyboardLayoutStar shouldPreventInputManagerHitTestingForKey:](self, "shouldPreventInputManagerHitTestingForKey:", v24))
        {
          v25 = v24;

          v21 = v25;
        }
      }
      else
      {
        if (self->_isTrackpadMode)
        {
          if (!v22)
            goto LABEL_52;
          goto LABEL_49;
        }
        if (objc_msgSend(v21, "interactionType") != 18)
        {
          objc_msgSend(v21, "parentKey");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = objc_msgSend(v46, "interactionType");

          if (v47 == 18)
            v48 = 0;
          else
            v48 = v22;
          if ((v48 & 1) == 0)
            goto LABEL_52;
LABEL_49:
          if ((objc_msgSend(v21, "isExemptFromInputManagerLayout") & 1) != 0)
          {
LABEL_52:
            objc_msgSend(v11, "returnExecutionToParentWithInfo:", v21);
            goto LABEL_53;
          }
          objc_msgSend(v9, "setStage:", v6);
          -[UIKeyboardLayoutStar unprocessedTouchEventsForTouchInfo:touchStage:forcedKeyCode:](self, "unprocessedTouchEventsForTouchInfo:touchStage:forcedKeyCode:", v9, v6, -[UIKeyboardLayoutStar keycodeForKey:](self, "keycodeForKey:", v21));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "skipHitTestForTouchEvents:", v24);
LABEL_51:

          goto LABEL_52;
        }
        -[UIKeyboardLayoutStar viewForKey:](self, "viewForKey:", v21);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "frame");
        v55.x = v14;
        v55.y = v16;
        if (CGRectContainsPoint(v57, v55))
        {
          -[UIView convertPoint:toView:](self, "convertPoint:toView:", v24, v14, v16);
          objc_msgSend(v24, "subTreeHitTest:");
          v36 = objc_claimAutoreleasedReturnValue();
          if (v36)
          {
            v37 = (void *)v36;

            v21 = v37;
            goto LABEL_51;
          }
        }
      }

      if ((v22 & 1) == 0)
        goto LABEL_52;
      goto LABEL_49;
    }
    if (-[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") != 1
      && -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") != 24
      && -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") != 25
      && -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") != 26
      && -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") != 23
      || -[UIKBTree usesKeyCharging](self->_keyplane, "usesKeyCharging")
      || (objc_msgSend(v21, "frame"),
          v56.origin.x = v26 + -20.0,
          v56.size.width = v27 + 40.0,
          v56.origin.y = v28 + -20.0,
          v56.size.height = v29 + 40.0,
          v54.x = v14,
          v54.y = v16,
          CGRectContainsPoint(v56, v54)))
    {
      if (!v22)
        goto LABEL_52;
      v30 = objc_msgSend(v9, "continuousPathState");
      if (v30 == 4)
        v31 = 4294967294;
      else
        v31 = 0xFFFFFFFFLL;
      v32 = v30 == 4 || v20;
      if (v32 == 1)
      {
        -[UIKeyboardLayoutStar unprocessedTouchEventsForTouchInfo:touchStage:forcedKeyCode:](self, "unprocessedTouchEventsForTouchInfo:touchStage:forcedKeyCode:", v9, v6, v31);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v49[0] = MEMORY[0x1E0C809B0];
        v49[1] = 3221225472;
        v49[2] = __94__UIKeyboardLayoutStar_performHitTestForTouchInfo_touchStage_executionContextPassingUIKBTree___block_invoke;
        v49[3] = &unk_1E16D4170;
        v52 = a2;
        v49[4] = self;
        v50 = v9;
        v53 = v6;
        v34 = v19;
        v51 = v34;
        objc_msgSend(v11, "childWithContinuation:", v49);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "performHitTestForTouchEvents:executionContextPassingNSNumber:", v33, v35);

LABEL_53:
        goto LABEL_54;
      }
      if ((_DWORD)v6 == 1)
      {
        objc_msgSend(v9, "setStage:", 3);
        -[UIKeyboardLayoutStar _transitionToContinuousPathState:forTouchInfo:](self, "_transitionToContinuousPathState:forTouchInfo:", 6, v9);
        v38 = (void *)MEMORY[0x1E0DBDC78];
        objc_msgSend(v12, "pathMajorRadius");
        v40 = v39;
        v41 = objc_msgSend(v12, "pathIndex");
        v42 = objc_msgSend(v9, "fingerID");
        v43 = objc_msgSend(v9, "continuousPathState") - 1;
        if (v43 < 6)
          v44 = (v43 + 1);
        else
          v44 = 0;
        objc_msgSend(v38, "touchEventWithStage:location:radius:timestamp:pathIndex:fingerID:forcedKeyCode:continuousPathState:", 3, v41, v42, (int)v31, v44, v14, v16, v40, v18);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "skipHitTestForTouchEvent:", v45);
        objc_msgSend(v11, "returnExecutionToParent");

        goto LABEL_53;
      }
    }
    objc_msgSend(v11, "returnExecutionToParent");
    goto LABEL_53;
  }
  objc_msgSend(v10, "returnExecutionToParent");
LABEL_54:

}

void __94__UIKeyboardLayoutStar_performHitTestForTouchInfo_touchStage_executionContextPassingUIKBTree___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a2;
  objc_msgSend(v18, "info");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    objc_msgSend(v18, "info");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 56);
      v9 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v18, "info");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, CFSTR("UIKeyboardLayoutStar.m"), 5302, CFSTR("UIKeyboardTask %s expected NSNumber but received %@"), "-[UIKeyboardLayoutStar performHitTestForTouchInfo:touchStage:executionContextPassingUIKBTree:]_block_invoke", v10);

    }
  }
  objc_msgSend(v18, "info");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setStage:", *(unsigned int *)(a1 + 64));
  if (!v11)
    goto LABEL_16;
  v12 = objc_msgSend(v11, "integerValue");
  if (v12 == -2)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "_allowContinuousPathUI")
      && objc_msgSend(*(id *)(a1 + 40), "continuousPathState") == 3)
    {
      objc_msgSend(*(id *)(a1 + 32), "_transitionToContinuousPathState:forTouchInfo:", 4, *(_QWORD *)(a1 + 40));
    }
    if (objc_msgSend(*(id *)(a1 + 32), "_allowContinuousPathUI")
      && objc_msgSend(*(id *)(a1 + 48), "usesCandidateSelection")
      && objc_msgSend(*(id *)(a1 + 40), "continuousPathState") == 4)
    {
      objc_msgSend(*(id *)(a1 + 48), "generateCandidatesWithOptions:", 4);
    }
    goto LABEL_16;
  }
  v13 = v12;
  if (v12 < 0
    || (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 648), "keys"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v14, "count"),
        v14,
        v13 >= v15))
  {
LABEL_16:
    objc_msgSend(v18, "returnExecutionToParent");
    goto LABEL_17;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 648), "keys");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectAtIndex:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "returnExecutionToParentWithInfo:", v17);
LABEL_17:

}

- (BOOL)isDeadkeyInput:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if (-[UIKeyboardLayoutStar diacriticForwardCompose](self, "diacriticForwardCompose")
    && objc_msgSend(v4, "length") == 1)
  {
    v5 = MEMORY[0x186DC8158](objc_msgSend(v4, "_firstLongCharacter"));
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)updatePhysicalKeyboardEvent:(id)a3 withMarkedInput:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v19[5];

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(v6, "set_inputFlags:", objc_msgSend(v6, "_inputFlags") | 2);
    UIKeyboardGetCurrentInputMode();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    UIKeyboardLocalizedObject(CFSTR("CustomDeadkeyComposition"), v8, 0, 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_modifiedInput");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingString:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "objectForKey:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __68__UIKeyboardLayoutStar_updatePhysicalKeyboardEvent_withMarkedInput___block_invoke;
      v19[3] = &unk_1E16D4198;
      v19[4] = self;
      objc_msgSend(v11, "_stringByComposingDiacriticsLogicalOrder:allowedCharacters:", 0, v19);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if ((objc_msgSend(v12, "isEqualToString:", v11) & 1) != 0)
    {
      objc_msgSend(v9, "objectForKey:", v7);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v13;
      if (v13)
        v15 = (void *)v13;
      else
        v15 = v7;
      v16 = v15;

      objc_msgSend(v6, "_modifiedInput");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringByAppendingString:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "set_modifiedInput:", v18);
    }
    else
    {
      objc_msgSend(v6, "set_modifiedInput:", v12);
    }

  }
}

uint64_t __68__UIKeyboardLayoutStar_updatePhysicalKeyboardEvent_withMarkedInput___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "_stringWithUnichar:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "canProduceString:", v3);

  return v4;
}

- (id)currentRepresentedStringForDualDisplayKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v4 = a3;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "secondaryRepresentedStrings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[UIKeyboardLayoutStar isShiftKeyBeingHeld](self, "isShiftKeyBeingHeld")
    && (!self->_shift || (objc_msgSend(v5, "isAutoShifted") & 1) != 0 || (objc_msgSend(v5, "isShiftLocked") & 1) != 0)
    || (UIKeyboardCurrentInputModeIsKoreanEnglishBilingual() & 1) != 0)
  {
    objc_msgSend(v4, "representedString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v9;
    if (!v7)
    {
      objc_msgSend(v9, "substringToIndex:", 1);
      v10 = objc_claimAutoreleasedReturnValue();

      v8 = (id)v10;
    }
  }
  else if (v7)
  {
    v8 = v7;
  }
  else
  {
    objc_msgSend(v4, "representedString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "substringFromIndex:", 1);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)createKeyEventForStringAction:(id)a3 forKey:(id)a4 touchInfo:(id)a5 inputFlags:(int)a6
{
  uint64_t v6;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v6 = *(_QWORD *)&a6;
  v9 = a5;
  v10 = a3;
  objc_msgSend(v9, "key");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardLayoutStar createKeyEventForStringAction:forKey:inputFlags:](self, "createKeyEventForStringAction:forKey:inputFlags:", v10, v11, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v9, "continuousPathState");
  if (v13 >= 4)
    objc_msgSend(v12, "setSource:", 6);
  return v12;
}

- (id)createKeyEventForStringAction:(id)a3 forKey:(id)a4 inputFlags:(int)a5
{
  __CFString *v8;
  id v9;
  _BOOL4 v10;
  UIKBTree *v11;
  UIKBTree *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  UIKBTree *v18;
  void *v19;
  void *v20;
  UIKBTree *keyboard;
  void *v22;
  UIKBTree *v23;
  int v24;
  unsigned int v25;
  uint64_t v26;
  void *v27;
  void *v28;
  int v29;
  uint64_t v30;
  void *v31;
  int v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v40;
  UIKBTree *v41;
  _BOOL4 v42;

  v8 = (__CFString *)a3;
  v9 = a4;
  if (!v9)
  {
    -[UIKeyboardLayoutStar activeKey](self, "activeKey");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = (a5 & 2) != 0
     && -[UIKBTree shouldSkipCandidateSelectionForVariants](self->_keyplane, "shouldSkipCandidateSelectionForVariants");
  v11 = (UIKBTree *)v9;
  v12 = self->_keyplane;
  -[UIKBTree gestureKey](v11, "gestureKey");
  v13 = objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    v18 = v11;
    goto LABEL_17;
  }
  v14 = (void *)v13;
  v42 = v10;
  -[UIKBTree gestureKeyplaneName](self->_keyplane, "gestureKeyplaneName");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    -[UIKBTree representedString](v11, "representedString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[__CFString isEqualToString:](v8, "isEqualToString:", v17))
    {

      v18 = v11;
    }
    else
    {
      v41 = v12;
      -[UIKBTree gestureKey](v11, "gestureKey");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "representedString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = -[__CFString isEqualToString:](v8, "isEqualToString:", v20);

      if (!v40)
      {
        v18 = v11;
        v12 = v41;
        goto LABEL_16;
      }
      -[UIKBTree gestureKey](v11, "gestureKey");
      v18 = (UIKBTree *)objc_claimAutoreleasedReturnValue();

      keyboard = self->_keyboard;
      -[UIKBTree gestureKeyplaneName](self->_keyplane, "gestureKeyplaneName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKBTree subtreeWithName:](keyboard, "subtreeWithName:", v14);
      v12 = (UIKBTree *)objc_claimAutoreleasedReturnValue();
      v16 = v41;
    }

  }
  else
  {
    v18 = v11;
  }

LABEL_16:
  v10 = v42;
LABEL_17:
  -[UIKBTree objectForProperty:](v18, "objectForProperty:", CFSTR("shouldskipcandidateselection"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
    v23 = v18;
  else
    v23 = v12;
  if (v10 | -[UIKBTree shouldSkipCandidateSelection](v23, "shouldSkipCandidateSelection"))
    v24 = 8;
  else
    v24 = 0;
  v25 = v24 | a5;
  if (-[__CFString _containsEmoji](v8, "_containsEmoji"))
    v26 = v25 | 2;
  else
    v26 = v25;
  if (-[UIKeyboardLayoutStar isLongPressedKey:](self, "isLongPressedKey:", v11))
  {
    -[UIKBTree name](v11, "name");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v27, "hasPrefix:", CFSTR("NumberPad-")))
    {
LABEL_30:

      goto LABEL_31;
    }
    -[UIKBTree name](v11, "name");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "hasSuffix:", CFSTR("-0-Plus"));

    if (v29)
    {
      v27 = v8;
      v8 = CFSTR("+");
      goto LABEL_30;
    }
  }
LABEL_31:
  if ((a5 & 0x102) == 0 && -[UIKBTree displayType](v11, "displayType") == 7)
  {
    -[UIKeyboardLayoutStar currentRepresentedStringForDualDisplayKey:](self, "currentRepresentedStringForDualDisplayKey:", v11);
    v30 = objc_claimAutoreleasedReturnValue();

    v8 = (__CFString *)v30;
  }
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v31, "isShiftLocked"))
  {
    v32 = -[UIKBTree displayType](v11, "displayType");

    if (v32 != 7)
      goto LABEL_38;
    objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLocale");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString uppercaseStringWithLocale:](v8, "uppercaseStringWithLocale:", v31);
    v33 = objc_claimAutoreleasedReturnValue();

    v8 = (__CFString *)v33;
  }

LABEL_38:
  +[UIPhysicalKeyboardEvent _eventWithInput:inputFlags:](UIPhysicalKeyboardEvent, "_eventWithInput:inputFlags:", v8, v26);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setSource:", 1);
  -[UIKBTree stringForProperty:](v11, "stringForProperty:", CFSTR("KBhint"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "set_hint:", v35);

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v36, "usesCandidateSelection") & 1) == 0)
  {
    if (-[UIKeyboardLayoutStar isDeadkeyInput:](self, "isDeadkeyInput:", v8))
    {
      objc_msgSend(v34, "set_inputFlags:", objc_msgSend(v34, "_inputFlags") | 0x10);
      objc_msgSend(v34, "_modifiedInput");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "set_markedInput:", v37);

      objc_msgSend(v34, "set_modifiedInput:", &stru_1E16EDF20);
    }
    objc_msgSend(v36, "inputForMarkedText");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v38, "length"))
      -[UIKeyboardLayoutStar updatePhysicalKeyboardEvent:withMarkedInput:](self, "updatePhysicalKeyboardEvent:withMarkedInput:", v34, v38);

  }
  return v34;
}

- (void)deleteHandwritingStrokesAtIndexes:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (-[UIKeyboardLayoutStar isHandwritingPlane](self, "isHandwritingPlane"))
  {
    -[UIKBTree cachedKeysByKeyName:](self->_keyplane, "cachedKeysByKeyName:", CFSTR("Handwriting-Input"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndex:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIKeyboardLayoutStar viewForKey:](self, "viewForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deleteStrokesAtIndexes:", v7);

  }
}

- (void)logHandwritingData
{
  void *v3;
  void *v4;
  id v5;

  if (-[UIKeyboardLayoutStar isHandwritingPlane](self, "isHandwritingPlane"))
  {
    -[UIKBTree cachedKeysByKeyName:](self->_keyplane, "cachedKeysByKeyName:", CFSTR("Handwriting-Input"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectAtIndex:", 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();

    -[UIKeyboardLayoutStar viewForKey:](self, "viewForKey:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "log");

  }
}

- (id)activeMultitapCompleteKey
{
  void *v3;
  uint64_t v4;
  UIKBTree *multitapKey;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[UIKeyboardLayoutStar multitapCompleteKeys](self, "multitapCompleteKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  multitapKey = self->_multitapKey;
  if (v4 != 1)
  {
    if (multitapKey)
    {
      -[UIKBTree frame](multitapKey, "frame");
      v8 = v7;
      -[UIKBTree frame](self->_keyboard, "frame");
      v10 = v9;
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v11 = v3;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v12)
      {
        v13 = v12;
        v14 = v10 * 0.5;
        v15 = *(_QWORD *)v23;
LABEL_7:
        v16 = 0;
        while (1)
        {
          if (*(_QWORD *)v23 != v15)
            objc_enumerationMutation(v11);
          v17 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v16);
          objc_msgSend(v17, "frame", (_QWORD)v22);
          v19 = v18;
          -[UIKBTree frame](self->_keyboard, "frame");
          if (v8 < v14 != v19 >= v20 * 0.5)
            break;
          if (v13 == ++v16)
          {
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
            if (v13)
              goto LABEL_7;
            goto LABEL_13;
          }
        }
        v6 = v17;

        if (v6)
          goto LABEL_16;
      }
      else
      {
LABEL_13:

      }
    }
    goto LABEL_15;
  }
  if (!-[UIKBTree forceMultitap](multitapKey, "forceMultitap"))
  {
LABEL_15:
    objc_msgSend(v3, "firstObject", (_QWORD)v22);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  v6 = 0;
LABEL_16:

  return v6;
}

- (void)multitapInterrupted
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[UIKeyboardLayoutStar cancelMultitapTimer](self, "cancelMultitapTimer");
  self->_multitapCount = 0;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[UIKeyboardLayoutStar multitapCompleteKeys](self, "multitapCompleteKeys", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v8, "state") != 1)
          -[UIKeyboardLayoutStar setState:forKey:](self, "setState:forKey:", 1, v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  if (self->_unshiftAfterMultitap)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setShift:", 0);

    -[UIKeyboardLayoutStar setShift:](self, "setShift:", 0);
    self->_unshiftAfterMultitap = 0;
  }
}

- (void)endMultitapForKey:(id)a3
{
  if (a3)
    -[UIKeyboardLayoutStar setState:forKey:](self, "setState:forKey:", 2, a3);
}

- (void)multitapExpired
{
  UIKBTree *multitapKey;

  -[UIKeyboardLayoutStar multitapInterrupted](self, "multitapInterrupted");
  -[UIKeyboardLayoutStar endMultitapForKey:](self, "endMultitapForKey:", self->_multitapKey);
  multitapKey = self->_multitapKey;
  self->_multitapKey = 0;

}

- (void)handleMultitapTimerFired
{
  UIDelayedAction *v3;
  void *v4;
  UIDelayedAction *v5;
  _QWORD v6[4];
  UIDelayedAction *v7;
  UIKeyboardLayoutStar *v8;
  id v9;
  id location;

  v3 = self->_multitapAction;
  objc_initWeak(&location, self);
  -[UIKeyboardLayout taskQueue](self, "taskQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__UIKeyboardLayoutStar_handleMultitapTimerFired__block_invoke;
  v6[3] = &unk_1E16D41C0;
  v5 = v3;
  v7 = v5;
  v8 = self;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v4, "addTask:", v6);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __48__UIKeyboardLayoutStar_handleMultitapTimerFired__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1080))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v5 = WeakRetained;
    if (WeakRetained)
      objc_msgSend(WeakRetained, "multitapExpired");

    v3 = v6;
  }
  objc_msgSend(v3, "returnExecutionToParent");

}

- (BOOL)isMultitapKey:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  char v8;

  v4 = a3;
  if (-[UIKeyboardLayoutStar canMultitap](self, "canMultitap"))
  {
    objc_msgSend(v4, "fullRepresentedString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");
    objc_msgSend(v4, "representedString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 <= objc_msgSend(v7, "length"))
      v8 = objc_msgSend(v4, "forceMultitap");
    else
      v8 = 1;

  }
  else
  {
    v8 = objc_msgSend(v4, "forceMultitap");
  }

  return v8;
}

- (void)touchMultitapTimer
{
  UIDelayedAction *multitapAction;
  UIDelayedAction *v4;
  UIDelayedAction *v5;
  uint64_t v6;
  int v7;
  id v8;

  multitapAction = self->_multitapAction;
  if (multitapAction)
  {
    -[UIDelayedAction touch](multitapAction, "touch");
  }
  else
  {
    v4 = -[UIDelayedAction initWithTarget:action:userInfo:delay:]([UIDelayedAction alloc], "initWithTarget:action:userInfo:delay:", self, sel_handleMultitapTimerFired, 0, 1.0);
    v5 = self->_multitapAction;
    self->_multitapAction = v4;

  }
  -[UIKeyboardLayoutStar activeMultitapCompleteKey](self, "activeMultitapCompleteKey");
  v6 = objc_claimAutoreleasedReturnValue();
  v8 = (id)v6;
  if (v6)
  {
    v7 = -[UIKeyboardLayoutStar stateForKey:](self, "stateForKey:", v6);
    v6 = (uint64_t)v8;
    if (v7 != 2)
    {
      self->_multitapCount = 0;
      self->_unshiftAfterMultitap = 0;
    }
  }
  -[UIKeyboardLayoutStar setState:forKey:](self, "setState:forKey:", 2, v6);

}

uint64_t __40__UIKeyboardLayoutStar_updateLayoutTags__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "shouldMergeKey:", a2) ^ 1;
}

uint64_t __40__UIKeyboardLayoutStar_updateLayoutTags__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "shouldMergeKey:", a2) ^ 1;
}

- (void)setTarget:(id)a3 forKey:(id)a4
{
  __CFString *v7;
  __CFString *v8;
  int *v9;
  id v10;

  v10 = a3;
  v7 = (__CFString *)a4;
  v8 = v7;
  if (CFSTR("_keyid_space_") == v7)
  {
    v9 = &OBJC_IVAR___UIKeyboardLayoutStar__spaceTarget;
    goto LABEL_5;
  }
  if (CFSTR("_keyid_return_") == v7)
  {
    v9 = &OBJC_IVAR___UIKeyboardLayoutStar__returnTarget;
LABEL_5:
    objc_storeStrong((id *)((char *)&self->super.super.super.super.isa + *v9), a3);
  }

}

- (void)setAction:(SEL)a3 forKey:(id)a4
{
  int *v4;

  if (CFSTR("_keyid_space_") == a4)
  {
    v4 = &OBJC_IVAR___UIKeyboardLayoutStar__spaceAction;
LABEL_6:
    *(Class *)((char *)&self->super.super.super.super.isa + *v4) = (Class)a3;
    return;
  }
  if (CFSTR("_keyid_return_") == a4)
  {
    v4 = &OBJC_IVAR___UIKeyboardLayoutStar__returnAction;
    goto LABEL_6;
  }
}

- (void)setLongPressAction:(SEL)a3 forKey:(id)a4
{
  int *v4;

  if (CFSTR("_keyid_space_") == a4)
  {
    v4 = &OBJC_IVAR___UIKeyboardLayoutStar__spaceLongAction;
LABEL_6:
    *(Class *)((char *)&self->super.super.super.super.isa + *v4) = (Class)a3;
    return;
  }
  if (CFSTR("_keyid_return_") == a4)
  {
    v4 = &OBJC_IVAR___UIKeyboardLayoutStar__returnLongAction;
    goto LABEL_6;
  }
}

- (BOOL)supportsSupplementalDisplayString
{
  void *v3;
  char v4;
  void *v5;

  -[UIKBTree name](self->_keyboard, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "containsString:", CFSTR("Korean")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[UIKBTree name](self->_keyboard, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "containsString:", CFSTR("Thai"));

  }
  return v4;
}

- (BOOL)isLongPressedKey:(id)a3
{
  id v4;
  void *v5;
  int v6;
  char v8;
  void *v9;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "interactionType");
    if (self->_showDictationKey && v6 == 5)
    {
      v8 = 1;
      goto LABEL_10;
    }
    if ((-[UIKeyboardLayoutStar downActionFlagsForKey:](self, "downActionFlagsForKey:", v5) & 0x80) != 0)
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v9, "isLongPress");

      goto LABEL_10;
    }
  }
  v8 = 0;
LABEL_10:

  return v8;
}

- (BOOL)showsGlobeAndDictationKeysInDockView
{
  return +[UIKeyboardImpl showsGlobeAndDictationKeysExternally](UIKeyboardImpl, "showsGlobeAndDictationKeysExternally");
}

- (BOOL)shouldShowInternationalMenuForKey:(id)a3
{
  id v4;
  _BOOL4 v5;

  v4 = a3;
  if (objc_msgSend(v4, "interactionType") == 9 && objc_msgSend(v4, "displayType") == 13)
    v5 = !-[UIKeyboardLayoutStar showsDedicatedEmojiKeyAlongsideGlobeButton](self, "showsDedicatedEmojiKeyAlongsideGlobeButton");
  else
    LOBYTE(v5) = 0;

  return v5;
}

- (void)showMenu:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a4;
  v9 = a3;
  -[UIKeyboardLayoutStar viewForKey:](self, "viewForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPopupMenu:", v9);

  -[UIKeyboardLayoutStar renderConfig](self, "renderConfig");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRenderConfig:", v8);

  objc_msgSend(v9, "showAsPopupForKey:inLayout:", v6, self);
}

- (void)longPressAction
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  unint64_t v7;
  void *v8;
  id *v9;
  int v10;
  int v11;
  void *v12;
  void *v13;
  int *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  char v23;
  void *v24;
  char v25;
  uint64_t v26;
  id deleteTarget;
  const char *v28;
  void *v29;
  CGFloat v30;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  double MaxX;
  double v39;
  CGFloat v40;
  double MaxY;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  _BOOL4 v55;
  double v56;
  void *v57;
  int v58;
  int v59;
  _QWORD v60[4];
  id v61;
  id v62;
  _QWORD v63[4];
  id v64;
  id v65;
  id v66[2];
  id location;
  _QWORD block[5];
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;

  -[UIKeyboardLayoutStar activeKey](self, "activeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UIKeyboardLayoutStar touchInfoForKey:](self, "touchInfoForKey:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "touch");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[UIKeyboardLayout _hasRelatedTouchesForTouchState:](self, "_hasRelatedTouchesForTouchState:", v5);

    if (v6 || objc_msgSend(v4, "continuousPathState") == 4 || objc_msgSend(v4, "continuousPathState") == 3)
    {
      -[UIKeyboardLayoutStar deactivateActiveKey](self, "deactivateActiveKey");
LABEL_6:

      goto LABEL_7;
    }
    if (objc_msgSend(v3, "interactionType") == 4
      && -[UIKeyboardLayoutStar isHandwritingPlane](self, "isHandwritingPlane"))
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __39__UIKeyboardLayoutStar_longPressAction__block_invoke;
      block[3] = &unk_1E16B1B28;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
    if (!-[UIKeyboardLayoutStar isLongPressedKey:](self, "isLongPressedKey:", v3)
      && !objc_msgSend(v4, "delayed"))
    {
      goto LABEL_6;
    }
    self->_didLongPress = 1;
    v7 = -[UIKeyboardLayoutStar downActionFlagsForKey:](self, "downActionFlagsForKey:", v3);
    if (objc_msgSend(v4, "delayed")
      && (objc_msgSend(v3, "interactionType") == 4
       || objc_msgSend(v3, "interactionType") == 14))
    {
      objc_initWeak(&location, self);
      -[UIKeyboardLayout taskQueue](self, "taskQueue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v63[0] = MEMORY[0x1E0C809B0];
      v63[1] = 3221225472;
      v63[2] = __39__UIKeyboardLayoutStar_longPressAction__block_invoke_2;
      v63[3] = &unk_1E16D41E8;
      objc_copyWeak(v66, &location);
      v64 = v4;
      v65 = v3;
      v66[1] = (id)v7;
      objc_msgSend(v8, "addTask:", v63);

      v9 = v66;
LABEL_17:
      objc_destroyWeak(v9);
      objc_destroyWeak(&location);
      goto LABEL_6;
    }
    v10 = objc_msgSend(v3, "interactionType");
    if ((v7 & 0x1000F8000) != 0)
    {
      -[UIKeyboardLayoutStar showPopupVariantsForKey:](self, "showPopupVariantsForKey:", v3);
      if (self->_swipeDetected
        && (-[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 1
         || -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 24
         || -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 25
         || -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 26
         || -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 23))
      {
        if (objc_msgSend(v3, "displayType") == 7)
          +[_UIKeyboardUsageTracking dualStringsKeyFlickUpCount](_UIKeyboardUsageTracking, "dualStringsKeyFlickUpCount");
        else
          +[_UIKeyboardUsageTracking singleStringKeyFlickUpCount](_UIKeyboardUsageTracking, "singleStringKeyFlickUpCount");
      }
      goto LABEL_6;
    }
    v11 = v10;
    if ((v7 & 0x100000) != 0)
    {
      if (v10 == 4)
      {
        v26 = 888;
        deleteTarget = self->_deleteTarget;
      }
      else
      {
        if (v10 == 15)
        {
          v14 = &OBJC_IVAR___UIKeyboardLayoutStar__spaceTarget;
        }
        else
        {
          if (v10 != 13)
            goto LABEL_6;
          v14 = &OBJC_IVAR___UIKeyboardLayoutStar__returnTarget;
        }
        deleteTarget = *(Class *)((char *)&self->super.super.super.super.isa + *v14);
        v26 = v14[4];
      }
      v28 = *(const char **)((char *)&self->super.super.super.super.isa + v26);
      if (dyld_program_sdk_at_least())
        objc_msgSend(deleteTarget, v28);
      else
        objc_msgSend(deleteTarget, sel_performSelector_, v28);
      goto LABEL_6;
    }
    if ((v7 & 0x40000000) != 0)
    {
      if (+[UIDictationController isRunning](UIDictationController, "isRunning"))
      {
        +[UIDictationController activeInstance](UIDictationController, "activeInstance");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "cancelDictation");

        +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isDictationPopoverPresented");

        if (v17)
        {
          +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "dismissDictationPopover");

        }
      }
      if (v11 != 5 || -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 3)
        goto LABEL_6;
      +[UIDictationConnectionPreferences sharedInstance](UIDictationConnectionPreferences, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v12, "dictationIsEnabled") & 1) == 0)
        goto LABEL_67;
      +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "enabledDictationLanguages");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "count");

      if (v21 < 2)
        goto LABEL_6;
      +[UIInputSwitcherView sharedInstance](UIInputSwitcherView, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v12, "isVisible") & 1) != 0
        || (+[UIKeyboardSplitControlMenu activeInstance](UIKeyboardSplitControlMenu, "activeInstance"),
            v22 = (void *)objc_claimAutoreleasedReturnValue(),
            v23 = objc_msgSend(v22, "isVisible"),
            v22,
            (v23 & 1) != 0))
      {
LABEL_67:

        goto LABEL_6;
      }
LABEL_85:
      -[UIKeyboardLayoutStar showMenu:forKey:](self, "showMenu:forKey:", v12, v3);
      goto LABEL_67;
    }
    if (v10 == 38)
    {
      objc_initWeak(&location, self);
      -[UIKeyboardLayout taskQueue](self, "taskQueue");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v60[0] = MEMORY[0x1E0C809B0];
      v60[1] = 3221225472;
      v60[2] = __39__UIKeyboardLayoutStar_longPressAction__block_invoke_3;
      v60[3] = &unk_1E16BBBE0;
      objc_copyWeak(&v62, &location);
      v61 = v3;
      objc_msgSend(v29, "addTask:", v60);

      v9 = &v62;
      goto LABEL_17;
    }
    if (v10 == 9 && objc_msgSend(v3, "displayType") == 13)
    {
      if (-[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 3
        || !-[UIKeyboardLayoutStar shouldShowInternationalMenuForKey:](self, "shouldShowInternationalMenuForKey:", v3))
      {
        goto LABEL_6;
      }
      +[UIInputSwitcherView sharedInstance](UIInputSwitcherView, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v12, "isVisible") & 1) != 0)
        goto LABEL_67;
      +[UIKeyboardSplitControlMenu activeInstance](UIKeyboardSplitControlMenu, "activeInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "isVisible"))
      {

        goto LABEL_67;
      }
      v58 = -[UIKeyboardLayoutStar stateForKey:](self, "stateForKey:", v3);

      if (v58 != 4)
        goto LABEL_67;
      goto LABEL_85;
    }
    if (!+[UIKeyboardImpl rivenTranslationPreference](UIKeyboardImpl, "rivenTranslationPreference")
      || self->_swipeDetected)
    {
      if (v11 == 6)
      {
        -[UIView window](self, "window");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "_isTextEffectsWindow") ^ 1;

      }
      else
      {
        v25 = 0;
      }
      if ((v25 & 1) != 0 || v11 == 3)
        goto LABEL_6;
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setShift:", 1);
      objc_msgSend(v12, "forceShiftUpdate");
      -[UIKeyboardLayoutStar setState:forKey:](self, "setState:forKey:", 4, v3);
      goto LABEL_67;
    }
    if (v11 == 6)
    {
      objc_msgSend(v3, "paddedFrame");
    }
    else
    {
      v35 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v34 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      v37 = *MEMORY[0x1E0C9D648];
      v36 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      if (!-[UIKeyboardLayoutStar isHandwritingPlane](self, "isHandwritingPlane") || v11 != 3)
      {
LABEL_74:
        v72.origin.x = v37;
        v72.origin.y = v36;
        v72.size.width = v35;
        v72.size.height = v34;
        if (CGRectIsEmpty(v72))
          goto LABEL_6;
        +[UIKeyboardSplitControlMenu sharedInstance](UIKeyboardSplitControlMenu, "sharedInstance");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIKeyboardLayoutStar touchInfoForKey:](self, "touchInfoForKey:", v3);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "touch");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "locationInView:", self);
        v51 = v50;
        v53 = v52;

        -[UIView bounds](self, "bounds");
        if (v51 >= v54 + -60.0)
        {
          -[UIView bounds](self, "bounds");
          v55 = v53 >= v56 + -60.0;
        }
        else
        {
          v55 = 0;
        }
        if ((objc_msgSend(v47, "isVisible") & 1) == 0)
        {
          +[UIInputSwitcherView activeInstance](UIInputSwitcherView, "activeInstance");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v57, "isVisible"))
          {
            if (-[UIKeyboardLayoutStar isHandwritingPlane](self, "isHandwritingPlane") && v55 && v11 == 3)
            {

            }
            else
            {
              v59 = -[UIKeyboardLayoutStar stateForKey:](self, "stateForKey:", v3);

              if (v59 != 4)
                goto LABEL_88;
            }
            -[UIKeyboardLayoutStar showMenu:forKey:](self, "showMenu:forKey:", v47, v3);
            goto LABEL_88;
          }

        }
LABEL_88:

        goto LABEL_6;
      }
      objc_msgSend(v3, "paddedFrame");
      MaxX = CGRectGetMaxX(v69);
      objc_msgSend(v3, "paddedFrame");
      v40 = MaxX - v39 * 0.25;
      objc_msgSend(v3, "paddedFrame");
      MaxY = CGRectGetMaxY(v70);
      objc_msgSend(v3, "paddedFrame");
      v43 = MaxY + v42 * -0.15;
      objc_msgSend(v3, "paddedFrame");
      v45 = v44 * 0.25;
      objc_msgSend(v3, "paddedFrame");
      v71.size.height = v46 * 0.25;
      v71.origin.x = v40;
      v71.origin.y = v43;
      v71.size.width = v45;
      *(CGRect *)&v30 = CGRectIntegral(v71);
    }
    v37 = v30;
    v36 = v31;
    v35 = v32;
    v34 = v33;
    goto LABEL_74;
  }
LABEL_7:

}

uint64_t __39__UIKeyboardLayoutStar_longPressAction__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "clearHandwritingStrokesIfNeededAndNotify:", 1);
}

void __39__UIKeyboardLayoutStar_longPressAction__block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_transitionToContinuousPathState:forTouchInfo:", 6, *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "setDelayed:", 0);
    objc_msgSend(v4, "completeCommitTouchesPrecedingTouchDownWithKey:withActions:executionContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), v5);
  }

}

void __39__UIKeyboardLayoutStar_longPressAction__block_invoke_3(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "playKeyClickSoundForKey:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v4, "completeCommitTouchesPrecedingTouchDownWithKey:withActions:executionContext:", *(_QWORD *)(a1 + 32), 0x400000000, v5);
  }

}

- (id)_keyboardLongPressInteractionRegions
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[UIKBTree cache](self->_keyplane, "cache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("Space-Key"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "frame", (_QWORD)v12);
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_keyplaneVariantsKeyForString:(id)a3
{
  UIKBTree *keyplane;
  id v4;
  void *v5;
  void *v6;

  keyplane = self->_keyplane;
  v4 = a3;
  -[UIKBTree componentName](keyplane, "componentName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingFormat:", CFSTR("-%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_appendingSecondaryStringToVariantsTop:(id)a3 secondaryString:(id)a4 withDirection:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;

  v7 = a4;
  v8 = a5;
  v9 = (void *)objc_msgSend(a3, "mutableCopy");
  v10 = objc_msgSend(v9, "indexOfObject:", v7);
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v9, "removeObjectAtIndex:", v10);
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("left")))
    objc_msgSend(v9, "addObject:", v7);
  else
    objc_msgSend(v9, "insertObject:atIndex:", v7, 0);

  return v9;
}

- (id)_variantsByAppendingDualStringKey:(id)a3 toVariants:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v25;
  id v26;
  _QWORD v27[3];
  _QWORD v28[4];

  v28[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "displayType") == 7)
  {
    objc_msgSend(v6, "secondaryDisplayStrings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v26 = v9;
    }
    else
    {
      objc_msgSend(v6, "displayString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "substringFromIndex:", 1);
      v26 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v6, "secondaryRepresentedStrings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndex:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v25 = v13;
    }
    else
    {
      objc_msgSend(v6, "representedString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "substringFromIndex:", 1);
      v25 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v7, "objectForKey:", CFSTR("Keycaps"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("Strings"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("Direction"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardLayoutStar _appendingSecondaryStringToVariantsTop:secondaryString:withDirection:](self, "_appendingSecondaryStringToVariantsTop:secondaryString:withDirection:", v16, v26, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "objectForKey:", CFSTR("Direction"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardLayoutStar _appendingSecondaryStringToVariantsTop:secondaryString:withDirection:](self, "_appendingSecondaryStringToVariantsTop:secondaryString:withDirection:", v17, v25, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v27[0] = CFSTR("Direction");
    objc_msgSend(v7, "objectForKey:", CFSTR("Direction"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v22;
    v28[1] = v19;
    v27[1] = CFSTR("Keycaps");
    v27[2] = CFSTR("Strings");
    v28[2] = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 3);
    v23 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v23;
  }

  return v7;
}

- (id)_variantsOfCurrencyKey:(id)a3 language:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "representedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[UIKBTree visualStyling](self->_keyplane, "visualStyling") & 0x3F;
  UIKeyboardCurrencyVariants((uint64_t)v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10 && v9 == 23)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(v6, "secondaryRepresentedStrings", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(v11);
          UIKeyboardCurrencyVariants(*(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i), v7);
          v16 = objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            v10 = (void *)v16;
            goto LABEL_13;
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v13)
          continue;
        break;
      }
    }
    v10 = 0;
LABEL_13:

  }
  if (!v10)
  {
    UIKeyboardGetCurrentInputMode();
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    UIKeyboardCurrencyVariants((uint64_t)v8, v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v17;
  }
  if (v9 == 23)
  {
    -[UIKeyboardLayoutStar _variantsByAppendingDualStringKey:toVariants:](self, "_variantsByAppendingDualStringKey:toVariants:", v6, v10);
    v18 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v18;
  }

  return v10;
}

- (void)preparePopupVariantsForKey:(id)a3 onKeyplane:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (-[UIKeyboardLayoutStar useCrescendoLayout](self, "useCrescendoLayout")
    && os_variant_has_internal_diagnostics())
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[TUIKeyplaneView updateVariantSelectorFramesForKey:](self->_liveKeyplaneView, "updateVariantSelectorFramesForKey:", v9);
  }
  else
  {
    -[UIKBKeyplaneView factory](self->_keyplaneView, "factory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v7, "traitsForKey:onKeyplane:", v9, v6);

  }
}

- (void)showPopupVariantsForKey:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  UISelectionFeedbackGenerator *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  unint64_t v42;
  void *v43;
  int v44;
  void *v45;
  const __CFString *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  int v56;
  id v57;
  void *v58;
  id v59;
  id v60;
  id v61;
  void *v62;
  BOOL v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  int v71;
  void *v72;
  int v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t i;
  char v79;
  char v80;
  double v81;
  double v82;
  double v83;
  __CFString *v84;
  __CFString *v85;
  __CFString *v86;
  __CFString *v87;
  void *v88;
  UISelectionFeedbackGenerator *v89;
  void *v90;
  void *v91;
  void *v92;
  uint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  id v97;
  void *v98;
  uint64_t v99;
  void *v100;
  id v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  char v106;
  void *v107;
  void *v108;
  void *v109;
  __CFString *v110;
  int v111;
  unint64_t v112;
  void *v113;
  int v114;
  void *v115;
  void *v116;
  unsigned int v117;
  UIKeyboardLayoutStar *v118;
  unint64_t v119;
  uint64_t v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int16 v131;
  _BYTE v132[128];
  _QWORD v133[3];

  v133[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4 && -[UIKeyboardLayoutStar stateForKey:](self, "stateForKey:", v4) != 16)
  {
    objc_msgSend(v4, "representedString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    UIKeyboardGetCurrentUILanguage();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLocale");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    v119 = -[UIKeyboardLayoutStar downActionFlagsForKey:](self, "downActionFlagsForKey:", v4);
    v13 = UIKeyboardGetCurrentIdiom() == 1
       || UIKeyboardGetCurrentIdiom() == 24
       || UIKeyboardGetCurrentIdiom() == 25
       || UIKeyboardGetCurrentIdiom() == 26
       || UIKeyboardGetCurrentIdiom() == 23;
    v114 = v13;
    v14 = -[UIKBTree visualStyling](self->_keyplane, "visualStyling") & 0x3F;
    v121 = v4;
    v118 = self;
    v108 = v11;
    if ((v119 & 0x8000) == 0)
    {
      if ((v119 & 0x20000) != 0)
      {
        objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLocale");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "localeIdentifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        UIKeyboardTopLevelDomainVariants(v32, 15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v4 = v121;
        v19 = 0;
        v114 = 1;
      }
      else
      {
        if ((v119 & 0x10000) == 0)
        {
          if ((v119 & 0x40000) != 0)
          {
            if (!self->_shift || v14 == 23)
            {
              -[UIKeyboardLayoutStar _variantsOfCurrencyKey:language:](self, "_variantsOfCurrencyKey:language:", v4, v12);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = 0;
            }
            else
            {
              v19 = 0;
              v18 = 0;
            }
            v20 = v12;
            v15 = v119;
          }
          else
          {
            v15 = v119;
            if ((v119 & 0x100000000) != 0)
            {
              v18 = 0;
              v19 = 1;
            }
            else if (objc_msgSend(v4, "variantType") == 9)
            {
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("#BOLD"), CFSTR("#ITALIC"), CFSTR("#UNDERLINE"), 0);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("popup_bold.png"), CFSTR("popup_italic.png"), CFSTR("popup_underline.png"), 0);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v16, CFSTR("Strings"), v17, CFSTR("Keycaps"), CFSTR("right"), CFSTR("Direction"), 0);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v109, "updateStylingTraitsIfNeeded");

              v4 = v121;
              v19 = 0;
            }
            else
            {
              v19 = 0;
              v18 = 0;
            }
            v20 = v12;
          }
LABEL_40:
          objc_msgSend(v18, "objectForKey:", CFSTR("Strings"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKey:", CFSTR("Keycaps"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = v109;
          v38 = v18;
          if ((v19 & 1) != 0 || v18 && objc_msgSend(v35, "count"))
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v35);
            v126 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v36);
            v123 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "objectForKey:", CFSTR("Direction"));
            v39 = objc_claimAutoreleasedReturnValue();
            v40 = (void *)v39;
            v107 = (void *)v39;
            if ((v19 & 1) != 0 || v126 && v123 && v39)
            {
              v106 = v19;
              v102 = v20;
              if ((v15 & 0x20000) != 0)
              {
                v41 = (void *)v39;
                objc_msgSend(v126, "addObject:", CFSTR("."));
                objc_msgSend(v123, "addObject:", CFSTR("."));
                v40 = v41;
              }
              v105 = v38;
              if ((objc_msgSend(v40, "isEqualToString:") & 1) != 0
                || (objc_msgSend(v107, "isEqualToString:", CFSTR("strictly-left")) & 1) != 0
                || objc_msgSend(v107, "isEqualToString:", CFSTR("fixed-left")))
              {
                objc_msgSend(v126, "_kb_reverse");
                objc_msgSend(v123, "_kb_reverse");
              }
              v42 = objc_msgSend(v126, "count");
              if (v42 <= objc_msgSend(v123, "count"))
                v43 = v126;
              else
                v43 = v123;
              v44 = objc_msgSend(v43, "count");
              if ((v44 - 2) > 6)
              {
                v116 = 0;
                v110 = CFSTR("UI-Fullwidth");
                v45 = v108;
              }
              else
              {
                v45 = v108;
                if (objc_msgSend(v108, "_containsFullwidthLettersAndSymbolsOnly"))
                {
                  objc_msgSend(v108, "_stringByConvertingFromFullWidthToHalfWidth");
                  v116 = (void *)objc_claimAutoreleasedReturnValue();
                  v46 = CFSTR("UI-Halfwidth");
                }
                else
                {
                  objc_msgSend(v108, "_stringByConvertingFromHalfWidthToFullWidth");
                  v116 = (void *)objc_claimAutoreleasedReturnValue();
                  v46 = CFSTR("UI-Fullwidth");
                }
                v110 = (__CFString *)v46;
              }
              v103 = v36;
              v104 = v35;
              objc_msgSend(v109, "autocorrectPrompt");
              v47 = (void *)objc_claimAutoreleasedReturnValue();

              if (v47)
                objc_msgSend(v109, "removeAutocorrectPromptAndCandidateList");
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v115 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v109, "smartPunctuationController");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              v111 = objc_msgSend(v49, "smartQuotesEnabled");

              objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("'\"));
              v113 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v4, "displayType") == 27
                || (objc_msgSend(v121, "name"),
                    v50 = (void *)objc_claimAutoreleasedReturnValue(),
                    v51 = objc_msgSend(v50, "_containsSubstring:", CFSTR("Email-Dot-")),
                    v50,
                    v51))
              {
                v117 = 28;
              }
              else
              {
                v117 = 0;
              }
              v52 = v121;
              objc_msgSend(v121, "representedString");
              v124 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v121, "displayType") == 7
                && (unint64_t)objc_msgSend(v45, "length") >= 2)
              {
                v131 = objc_msgSend(v45, "characterAtIndex:", 0);
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", &v131, 1);
                v53 = objc_claimAutoreleasedReturnValue();

                v124 = (void *)v53;
              }
              if (v44 >= 1)
              {
                v54 = 0;
                v120 = v44;
                v112 = 1;
                while (1)
                {
                  objc_msgSend(v126, "objectAtIndex:", v54);
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  v56 = objc_msgSend(v55, "isEqualToString:", v124);

                  objc_msgSend(v123, "objectAtIndex:", v54);
                  v57 = (id)objc_claimAutoreleasedReturnValue();
                  if (-[UIKBTree isShiftKeyplane](self->_keyplane, "isShiftKeyplane")
                    || !+[UIKeyboardLayout _showSmallDisplayKeyplane](UIKeyboardLayout, "_showSmallDisplayKeyplane"))
                  {
                    objc_msgSend(v57, "uppercaseStringWithLocale:", v122);
                    v58 = (void *)objc_claimAutoreleasedReturnValue();
                  }
                  else
                  {
                    objc_msgSend(v57, "lowercaseStringWithLocale:", v122);
                    v58 = (void *)objc_claimAutoreleasedReturnValue();
                  }
                  v59 = v58;

                  v60 = (v15 & 0x40000) != 0 ? v57 : v59;
                  v61 = v60;
                  objc_msgSend(v52, "displayString");
                  v62 = (void *)objc_claimAutoreleasedReturnValue();
                  v125 = v61;
                  if ((objc_msgSend(v62, "isEqual:", v61) & 1) == 0)
                  {
                    v63 = -[NSMutableSet containsObject:](self->_allKeyplaneKeycaps, "containsObject:", v59)&& (v15 & 0x10000) == 0;
                    if (v63 && objc_msgSend(v52, "variantType") != 9)
                      break;
                  }

                  objc_msgSend(v126, "objectAtIndex:", v54);
                  v62 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!v56)
                  {
                    if (objc_msgSend(v116, "isEqualToString:", v62))
                    {
                      UIKeyboardLocalizedString(v110, 0, 0, 0);
                      v64 = (void *)objc_claimAutoreleasedReturnValue();

                      v116 = 0;
                    }
                    else
                    {
LABEL_93:
                      v64 = 0;
                    }
LABEL_95:
                    v65 = (void *)objc_msgSend(v52, "copy");
                    objc_msgSend(v65, "setRepresentedString:", v62);
                    objc_msgSend(v65, "setDisplayString:", v57);
                    if (v64)
                    {
                      v133[0] = v64;
                      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v133, 1);
                      v66 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v65, "setSecondaryDisplayStrings:", v66);

                    }
                    else
                    {
                      objc_msgSend(v65, "setSecondaryDisplayStrings:", 0);
                    }
                    objc_msgSend(v65, "setDisplayType:", v117);
                    v67 = (void *)MEMORY[0x1E0CB3940];
                    objc_msgSend(v52, "name");
                    v68 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v65, "representedString");
                    v69 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v67, "stringWithFormat:", CFSTR("%@/%@"), v68, v69);
                    v70 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v65, "setName:", v70);

                    objc_msgSend(v65, "setOverrideDisplayString:", 0);
                    if (objc_msgSend(v57, "length") != 1
                      || (v71 = objc_msgSend(v57, "characterAtIndex:", 0), v72 = v115, v71 != 170)
                      && (v73 = objc_msgSend(v57, "characterAtIndex:", 0), v72 = v115, v73 != 186))
                    {
                      v72 = v48;
                    }
                    objc_msgSend(v72, "addObject:", v65);

                    v52 = v121;
                    self = v118;
                    v15 = v119;
LABEL_103:

                    goto LABEL_104;
                  }
                  if (!v114)
                  {
                    v64 = 0;
                    v112 = 2;
                    goto LABEL_95;
                  }
                  if ((objc_msgSend(v113, "longCharacterIsMember:", objc_msgSend(v124, "_firstLongCharacter")) & v111 & 1) != 0)goto LABEL_93;
LABEL_104:

                  if (v120 == ++v54)
                    goto LABEL_108;
                }
                objc_msgSend(v52, "displayString");
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v64, "isEqualToString:", v57);
                goto LABEL_103;
              }
              v112 = 1;
LABEL_108:
              v129 = 0u;
              v130 = 0u;
              v127 = 0u;
              v128 = 0u;
              v74 = v115;
              v75 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v127, v132, 16);
              if (v75)
              {
                v76 = v75;
                v77 = *(_QWORD *)v128;
                do
                {
                  for (i = 0; i != v76; ++i)
                  {
                    if (*(_QWORD *)v128 != v77)
                      objc_enumerationMutation(v74);
                    objc_msgSend(v48, "addObject:", *(_QWORD *)(*((_QWORD *)&v127 + 1) + 8 * i));
                  }
                  v76 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v127, v132, 16);
                }
                while (v76);
              }

              v79 = v106;
              if ((v106 & 1) != 0 || objc_msgSend(v48, "count") >= v112)
              {
                v4 = v121;
                objc_msgSend(v121, "updateVariantTypeForActions:", v15);
                if (-[UIKBTree isSplit](self->_keyplane, "isSplit"))
                {
                  v80 = objc_msgSend(v107, "_containsSubstring:", CFSTR("strict"));
                  objc_msgSend(v121, "frame");
                  v82 = v81;
                  -[UIKBTree frame](self->_keyboard, "frame");
                  v84 = CFSTR("right");
                  if (v82 < v83 * 0.5)
                    v84 = CFSTR("left");
                  v85 = v84;

                  if ((v80 & 1) != 0)
                  {
                    objc_msgSend(CFSTR("strictly-"), "stringByAppendingString:", v85);
                    v86 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();

                    v87 = v86;
                  }
                  else
                  {
                    v87 = v85;
                  }
                  v79 = v106;
                  v107 = v87;

                }
                v20 = v102;
                if ((v79 & 1) == 0)
                {
                  objc_msgSend(v121, "setVariantPopupBias:", v107);
                  objc_msgSend(v121, "setSubtrees:", v48);
                }
                -[UIKeyboardLayoutStar slideBehaviour](self, "slideBehaviour");
                v88 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v88)
                {
                  v89 = objc_alloc_init(UISelectionFeedbackGenerator);
                  -[UIKeyboardLayoutStar setSlideBehaviour:](self, "setSlideBehaviour:", v89);

                  -[UIKeyboardLayoutStar slideBehaviour](self, "slideBehaviour");
                  v90 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v90, "userInteractionStarted");

                }
                -[UIKeyboardLayoutStar slideBehaviour](self, "slideBehaviour");
                v91 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v91, "selectionChanged");

                objc_msgSend(v121, "setSelectedVariantIndex:", -[UIKeyboardLayoutStar defaultSelectedVariantIndexForKey:withActions:](self, "defaultSelectedVariantIndexForKey:withActions:", v121, v15));
                -[UIKeyboardLayoutStar highlightedVariantListForStylingKey:](self, "highlightedVariantListForStylingKey:", v121);
                v92 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v121, "setHighlightedVariantsList:", v92);

                -[UIKeyboardLayoutStar setState:forKey:](self, "setState:forKey:", 16, v121);
              }
              else
              {
                v4 = v121;
                v20 = v102;
              }

              v37 = v109;
              v35 = v104;
              v38 = v105;
              v36 = v103;
            }

          }
          goto LABEL_133;
        }
        objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLocale");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "localeIdentifier");
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        UIKeyboardTopLevelDomainVariants(v34, 15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v4 = v121;
        v19 = 0;
      }
      v20 = v12;
      v15 = v119;
      goto LABEL_40;
    }
    UIKeyboardGetCurrentInputMode();
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (self->_swipeDetected)
      v21 = 23;
    else
      v21 = 7;
    v22 = v11;
    v23 = v22;
    if ((v119 & 0x80000) != 0)
    {
      -[UIKeyboardLayoutStar _keyplaneVariantsKeyForString:](self, "_keyplaneVariantsKeyForString:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v24 = v20;
    if (objc_msgSend(v121, "displayType") == 7)
    {
      objc_msgSend(v121, "secondaryRepresentedStrings");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "count");

      if (v26)
      {
        objc_msgSend(v121, "secondaryRepresentedStrings");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "firstObject");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringByAppendingString:", v28);
        v29 = objc_claimAutoreleasedReturnValue();

        v23 = (void *)v29;
      }
      v20 = v24;
    }
    self = v118;
    -[UIKeyboardLayout getRomanAccentVariantsForString:inputMode:keyboardVariantIndludes:](v118, "getRomanAccentVariantsForString:inputMode:keyboardVariantIndludes:", v23, v20, v21);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14 == 23)
    {
      v15 = v119;
      if (objc_msgSend(v121, "displayType") == 7
        && objc_msgSend(v121, "interactionType") == 2)
      {
        if (objc_msgSend(v121, "variantType") != 3)
        {
          if (v118->_shift && !v118->_autoshift)
          {
            objc_msgSend(v121, "secondaryRepresentedStrings");
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v94, "objectAtIndex:", 0);
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            v96 = v95;
            if (v95)
            {
              v97 = v95;
            }
            else
            {
              objc_msgSend(v121, "representedString");
              v98 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v98, "substringFromIndex:", 1);
              v97 = (id)objc_claimAutoreleasedReturnValue();

              v15 = v119;
            }

            self = v118;
            if ((v15 & 0x80000) != 0)
            {
              -[UIKeyboardLayoutStar _keyplaneVariantsKeyForString:](v118, "_keyplaneVariantsKeyForString:", v22);
              v99 = objc_claimAutoreleasedReturnValue();
              v100 = v97;
              v97 = (id)v99;

            }
            UIKeyboardRomanAccentVariants((uint64_t)v97, v24, v21);
            v101 = v97;
            v93 = objc_claimAutoreleasedReturnValue();

            v30 = v101;
            v4 = v121;
          }
          else
          {
            v4 = v121;
            -[UIKeyboardLayoutStar _variantsByAppendingDualStringKey:toVariants:](v118, "_variantsByAppendingDualStringKey:toVariants:", v121, v30);
            v93 = objc_claimAutoreleasedReturnValue();
          }

          v30 = (void *)v93;
          v20 = v24;
          goto LABEL_37;
        }
        v4 = v121;
      }
      else
      {
        v4 = v121;
      }
      v20 = v24;
    }
    else
    {
      v4 = v121;
      v15 = v119;
    }
LABEL_37:

    v19 = 0;
    v18 = v30;
    goto LABEL_40;
  }
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("EmojiPopupKey"));

  if (v6)
  {
    -[UIKeyboardLayoutStar slideBehaviour](self, "slideBehaviour");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v8 = objc_alloc_init(UISelectionFeedbackGenerator);
      -[UIKeyboardLayoutStar setSlideBehaviour:](self, "setSlideBehaviour:", v8);

      -[UIKeyboardLayoutStar slideBehaviour](self, "slideBehaviour");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "userInteractionStarted");

    }
    -[UIKeyboardLayoutStar slideBehaviour](self, "slideBehaviour");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "selectionChanged");

  }
LABEL_133:

}

- (BOOL)shouldShowIndicator
{
  BOOL v3;
  void *v4;

  if (-[UIKBTree noLanguageIndicator](self->_keyplane, "noLanguageIndicator"))
    return 0;
  -[UIKBTree keysByKeyName:](self->_keyplane, "keysByKeyName:", CFSTR("International-Key"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v4, "count") != 0;

  return v3;
}

- (void)setHideKeysUnderIndicator:(BOOL)a3
{
  NSMutableSet *keysUnderIndicator;
  _QWORD v6[4];
  BOOL v7;

  keysUnderIndicator = self->_keysUnderIndicator;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__UIKeyboardLayoutStar_setHideKeysUnderIndicator___block_invoke;
  v6[3] = &__block_descriptor_33_e12_v24__0_8_B16l;
  v7 = a3;
  -[NSMutableSet enumerateObjectsUsingBlock:](keysUnderIndicator, "enumerateObjectsUsingBlock:", v6);
  if (!a3)
    -[NSMutableSet removeAllObjects](self->_keysUnderIndicator, "removeAllObjects");
}

uint64_t __50__UIKeyboardLayoutStar_setHideKeysUnderIndicator___block_invoke(uint64_t a1, void *a2)
{
  double v2;

  v2 = 0.0;
  if (!*(_BYTE *)(a1 + 32))
    v2 = 1.0;
  return objc_msgSend(a2, "setAlpha:", v2);
}

- (id)activationIndicatorView
{
  void *v3;
  uint64_t v4;
  UIKBTree *inactiveLanguageIndicator;
  BOOL v6;
  int v7;
  void *v8;
  void *v9;
  double v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  double v14;
  double v15;
  UIImageView *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  uint64_t v31;
  UIImageView *v32;
  unint64_t v33;
  float v34;
  uint64_t v35;
  double v36;
  float v37;
  unint64_t v38;
  float v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  double v48;
  double v49;
  unint64_t v50;
  uint64_t v51;
  unint64_t v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  double v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  double v64;
  double v65;
  void *v66;
  double v67;
  double v68;
  uint64_t v69;
  void *v70;
  float v71;
  double v72;
  unint64_t v73;
  void *v74;
  int v75;
  double v76;
  double v77;
  CGFloat v78;
  double v79;
  CGFloat v80;
  double v81;
  CGFloat v82;
  double v83;
  CGFloat v84;
  CGFloat v85;
  CGFloat v86;
  CGFloat v87;
  CGFloat v88;
  double x;
  double y;
  double width;
  double height;
  uint64_t v93;
  void *v94;
  double v95;
  float v96;
  double v97;
  double v98;
  CGFloat v99;
  double v100;
  CGFloat v101;
  double v102;
  CGFloat v103;
  double v104;
  CGFloat v105;
  CGFloat v106;
  CGFloat v107;
  CGFloat v108;
  CGFloat v109;
  double *v110;
  double v111;
  double v112;
  double v113;
  double v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  double v121;
  double v122;
  void *v123;
  void *v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  void *v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  float v137;
  int64_t v138;
  void *v139;
  void *v140;
  int64_t v141;
  double v142;
  double v143;
  double v144;
  float v145;
  void *v146;
  void *v147;
  void *v148;
  int v149;
  __CFString **v150;
  __CFString *v151;
  void *v152;
  void *v153;
  double v154;
  void *v155;
  UIImageView *v156;
  void *v157;
  UIImageView *v158;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  double v165;
  void *v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  _BYTE v171[128];
  uint64_t v172;
  CGRect v173;
  CGRect v174;
  CGRect v175;
  CGRect v176;
  CGRect v177;
  CGRect v178;
  CGRect v179;
  CGRect v180;
  CGRect v181;

  v172 = *MEMORY[0x1E0C80C00];
  -[UIKBTree keys](self->_keyplane, "keys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
  {
    v16 = 0;
    return v16;
  }
  inactiveLanguageIndicator = self->_inactiveLanguageIndicator;
  self->_inactiveLanguageIndicator = 0;

  if ((unint64_t)(-[UIKeyboardLayout orientation](self, "orientation") - 3) > 1
    || -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 1
    || -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 24
    || -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 25
    || -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 26
    || -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 23)
  {
    v6 = 0;
  }
  else
  {
    -[UIKBTree cachedKeysByKeyName:](self->_keyplane, "cachedKeysByKeyName:", CFSTR("Handwriting-Input"));
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v160, "count") != 0;

  }
  v7 = -[UIKBTree isSplit](self->_keyplane, "isSplit");
  if (-[UIKeyboardLayoutStar useCrescendoLayout](self, "useCrescendoLayout"))
    v7 = -[TUIKeyplaneView isSplit](self->_liveKeyplaneView, "isSplit");
  UIKeyboardGetCurrentInputMode();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardInputMode keyboardInputModeWithIdentifier:](UIKeyboardInputMode, "keyboardInputModeWithIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "displayName");
  v164 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIView center](self, "center");
  v165 = v10;
  v11 = +[UIApplication _classicMode](UIApplication, "_classicMode");
  v12 = -[UIKeyboardLayout orientation](self, "orientation") - 3;
  v13 = -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom");
  if (v12 > 1)
  {
    if (v13 != 1
      && -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") != 24
      && -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") != 25
      && -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") != 26
      && -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") != 23)
    {
      v15 = 140.0;
      goto LABEL_30;
    }
    v14 = 320.0;
  }
  else
  {
    v14 = 440.0;
    if (v13 != 1
      && -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") != 24
      && -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") != 25
      && -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") != 26
      && -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") != 23)
    {
      v15 = 150.0;
      goto LABEL_30;
    }
  }
  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "preferencesActions");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  v20 = 40.0;
  if (!v11)
    v20 = 0.0;
  v21 = v14 - v20;
  if (v7)
    v21 = 150.0;
  objc_msgSend(v18, "rivenSizeFactor:", v21);
  v15 = v22;

LABEL_30:
  -[UIKBTree keysOrderedByPositionWithoutZip](self->_keyplane, "keysOrderedByPositionWithoutZip");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v23, "count"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v167 = 0u;
  v168 = 0u;
  v169 = 0u;
  v170 = 0u;
  v25 = v23;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v167, v171, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v168;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v168 != v28)
          objc_enumerationMutation(v25);
        v30 = *(void **)(*((_QWORD *)&v167 + 1) + 8 * i);
        if (objc_msgSend(v30, "visible"))
          objc_msgSend(v24, "addObject:", v30);
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v167, v171, 16);
    }
    while (v27);
  }

  v31 = objc_msgSend(v24, "count");
  if (v6)
  {
    v163 = 0;
    v32 = 0;
  }
  else
  {
    v33 = v31;
    v34 = v15;
    objc_msgSend(v24, "lastObject");
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v162, "frame");
    v35 = 0;
    v37 = v36;
    v38 = v33 - 1;
    do
    {
      v39 = v37;
      v40 = v35;
      v41 = v33 + v35;
      v42 = v41 - 1;
      if (v41 == 1)
        break;
      objc_msgSend(v24, "objectAtIndex:", v41 - 2);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "frame");
      v37 = v44;

      v35 = v40 - 1;
    }
    while (v39 >= v37);
    if ((v7 & 1) != 0)
    {
      objc_msgSend(v162, "frame");
      v45 = (CGRectGetMaxX(v173) - v39) * 0.5;
      objc_msgSend(v162, "frame");
      if (v46 > v45)
      {
        do
        {
          objc_msgSend(v24, "objectAtIndex:", --v38);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "frame");
          v49 = v48;

        }
        while (v49 > v45);
      }
      v50 = v38 + 1;
      objc_msgSend(v24, "objectAtIndex:", v38 + 1);
      v51 = objc_claimAutoreleasedReturnValue();
      v52 = ~v38;
      v53 = (void *)v51;
      objc_msgSend(v24, "subarrayWithRange:", v50, v33 + v52);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v33 <= 1)
        v55 = 1;
      else
        v55 = 1 - v40;
      objc_msgSend(v24, "subarrayWithRange:", v42, v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      HIDWORD(v57) = HIDWORD(v165);
      *(float *)&v57 = v165;
      objc_msgSend(v56, "sortedArrayUsingFunction:context:", keyPositionSortByHorizontalDistanceFromPoint, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v57));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_864);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "filteredArrayUsingPredicate:", v59);
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v54, "firstObject");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v60 = (void *)objc_msgSend(v53, "copy");
    objc_msgSend(v60, "setName:", CFSTR("LanguageIndicator"));
    if ((-[UIKBTree visualStyling](self->_keyplane, "visualStyling") & 0xFF00) == 0x7F00)
      v61 = 4;
    else
      v61 = 2;
    objc_msgSend(v60, "setState:", v61);
    objc_msgSend(v53, "shape");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = (void *)objc_msgSend(v62, "copy");
    objc_msgSend(v60, "setShape:", v63);

    objc_msgSend(v60, "setDisplayRowHint:", objc_msgSend(v53, "displayRowHint"));
    objc_msgSend(v60, "setDisplayType:", 25);
    objc_msgSend(v60, "setInteractionType:", 15);
    objc_msgSend(v60, "setGroupNeighbor:", objc_msgSend(v53, "groupNeighbor"));
    objc_msgSend(v60, "setRepresentedString:", &stru_1E16EDF20);
    objc_msgSend(v60, "setOverrideDisplayString:", &stru_1E16EDF20);
    objc_msgSend(v60, "setObject:forProperty:", 0, CFSTR("variant-type"));
    if (objc_msgSend(v53, "rendering"))
      objc_msgSend(v60, "setRendering:", objc_msgSend(v53, "rendering"));
    objc_msgSend(v60, "frame");
    v64 = v165 - CGRectGetMidX(v174);
    if (v64 >= 0.0)
      v65 = v64;
    else
      v65 = -v64;
    -[NSMutableSet removeAllObjects](self->_keysUnderIndicator, "removeAllObjects");
    -[UIKeyboardLayoutStar renderConfig](self, "renderConfig");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "keycapOpacity");
    v68 = v67;

    v163 = v53;
    -[UIKeyboardLayoutStar viewForKey:](self, "viewForKey:", v53);
    v69 = objc_claimAutoreleasedReturnValue();
    v70 = (void *)v69;
    if (v68 < 0.5 && v69)
      -[NSMutableSet addObject:](self->_keysUnderIndicator, "addObject:", v69);
    v161 = v70;
    v71 = v65;
    v72 = v34;
    v73 = 1;
    do
    {
      if (v73 >= objc_msgSend(v54, "count", v161))
        break;
      objc_msgSend(v54, "objectAtIndex:", v73);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v74, "avoidsLanguageIndicator") & 1) != 0
        || objc_msgSend(v74, "rendering") == 34
        && (unint64_t)(-[UIKeyboardLayout orientation](self, "orientation") - 3) <= 1
        && (objc_msgSend(v74, "frame"), v76 < v165))
      {
        ++v73;
        v75 = 8;
      }
      else
      {
        objc_msgSend(v60, "frame");
        v78 = v77;
        v80 = v79;
        v82 = v81;
        v84 = v83;
        objc_msgSend(v74, "frame");
        v180.origin.x = v85;
        v180.origin.y = v86;
        v180.size.width = v87;
        v180.size.height = v88;
        v175.origin.x = v78;
        v175.origin.y = v80;
        v175.size.width = v82;
        v175.size.height = v84;
        v176 = CGRectUnion(v175, v180);
        x = v176.origin.x;
        y = v176.origin.y;
        width = v176.size.width;
        height = v176.size.height;
        -[UIKeyboardLayoutStar viewForKey:](self, "viewForKey:", v74);
        v93 = objc_claimAutoreleasedReturnValue();
        v94 = (void *)v93;
        if (v68 < 0.5 && v93)
          -[NSMutableSet addObject:](self->_keysUnderIndicator, "addObject:", v93);
        v177.origin.x = x;
        v177.origin.y = y;
        v177.size.width = width;
        v177.size.height = height;
        v95 = v165 - CGRectGetMidX(v177);
        if (v95 < 0.0)
          v95 = -v95;
        v96 = v95;
        objc_msgSend(v60, "frame");
        if (v97 < v72 || v71 > v96)
        {
          objc_msgSend(v60, "setFrame:", x, y, width, height);
          objc_msgSend(v60, "paddedFrame");
          v99 = v98;
          v101 = v100;
          v103 = v102;
          v105 = v104;
          objc_msgSend(v74, "paddedFrame");
          v181.origin.x = v106;
          v181.origin.y = v107;
          v181.size.width = v108;
          v181.size.height = v109;
          v178.origin.x = v99;
          v178.origin.y = v101;
          v178.size.width = v103;
          v178.size.height = v105;
          v179 = CGRectUnion(v178, v181);
          objc_msgSend(v60, "setPaddedFrame:", v179.origin.x, v179.origin.y, v179.size.width, v179.size.height);
          v75 = 0;
          ++v73;
          v71 = v96;
        }
        else
        {
          v75 = 9;
        }

      }
    }
    while (v75 != 9);
    if (v73 == 1 && -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") != 3)
      objc_msgSend(v60, "setName:", CFSTR("EnabledLanguageIndicator"));
    else
      objc_storeStrong((id *)&self->_inactiveLanguageIndicator, v60);
    v110 = (double *)UIKBRectsCreate(self->_keyplane, v60, 2);
    v111 = v110[8];
    v112 = v110[9];
    v113 = v110[10];
    v114 = v110[11];
    +[UIKBRenderFactory _graphicsQuality](UIKBRenderFactory, "_graphicsQuality");
    v32 = (UIImageView *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFrame:keyplane:key:screenTraits:", self->_keyplane, v60, self->super._screenTraits, v111, v112, v113, v114);
    -[UIImageView setScreenTraits:](v32, "setScreenTraits:", self->super._screenTraits);
    -[UIImageView setDrawFrame:](v32, "setDrawFrame:", v111, v112, v113, v114);
    -[UIKeyboardLayoutStar renderConfig](self, "renderConfig");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setRenderConfig:](v32, "setRenderConfig:", v115);

    -[UIImageView prepareForDisplay](v32, "prepareForDisplay");
    free(v110);
    -[UIView layer](v32, "layer");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "setAllowsGroupOpacity:", 0);

  }
  -[UIKBTree firstCachedKeyWithName:](self->_keyplane, "firstCachedKeyWithName:", CFSTR("Space-Key"));
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  if (v117
    || (-[UIKBTree firstCachedKeyWithName:](self->_keyplane, "firstCachedKeyWithName:", CFSTR("Unlabeled-Space-Key")),
        (v117 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    || (-[UIKBTree firstCachedKeyWithName:](self->_keyplane, "firstCachedKeyWithName:", CFSTR("Unlabeled-Space-Key")),
        (v117 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    || (-[UIKBTree firstCachedKeyWithName:](self->_keyplane, "firstCachedKeyWithName:", CFSTR("Ideographic-Space-Key")),
        (v117 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[UIKeyboardLayoutStar keyplaneFactory](self, "keyplaneFactory");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "traitsForKey:onKeyplane:", v117, self->_keyplane);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "symbolStyle");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "fontSize");
    v122 = v121;

  }
  else
  {
    v122 = 16.0;
  }
  objc_msgSend(off_1E167A828, "systemFontOfSize:", v122);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v124 = v164;
  objc_msgSend(v164, "_legacy_sizeWithFont:", v123);
  v126 = v125;
  v128 = ceil(v127);
  if (v32 && v122 > 10.0)
  {
    -[UIView frame](v32, "frame");
    if (v128 + 8.0 <= v129)
      goto LABEL_97;
    do
    {
      v130 = v123;
      v122 = v122 + -1.0;
      objc_msgSend(off_1E167A828, "systemFontOfSize:", v122);
      v123 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v164, "_legacy_sizeWithFont:", v123);
      v126 = v131;
      v128 = ceil(v132);
      if (v122 <= 10.0)
        break;
      -[UIView frame](v32, "frame");
    }
    while (v128 + 8.0 > v133);
  }
  if (!v32)
  {
    v138 = -[UIKeyboardLayout orientation](self, "orientation");
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v139, "currentInputMode");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    v141 = v138;
    v124 = v164;
    +[UIKeyboardImpl deviceSpecificPaddingForInterfaceOrientation:inputMode:](UIKeyboardImpl, "deviceSpecificPaddingForInterfaceOrientation:inputMode:", v141, v140);
    v143 = v142;

    v135 = ceil(v165 + v128 * -0.5);
    -[UIView bounds](self, "bounds");
    v137 = floor(v144 - v126 + -8.0 - v143);
    if ((unint64_t)(-[UIKeyboardLayout orientation](self, "orientation") - 3) < 2)
      v137 = v137 + -1.0;
    goto LABEL_100;
  }
LABEL_97:
  -[UIView frame](v32, "frame");
  v135 = (v134 - v128) * 0.5;
  -[UIView frame](v32, "frame");
  v137 = (v136 - v126) * 0.5;
LABEL_100:
  v145 = v135;
  +[UIKBRenderGeometry geometryWithFrame:paddedFrame:](UIKBRenderGeometry, "geometryWithFrame:paddedFrame:", 0.0, 0.0, v128, v126, 0.0, 0.0, v128, v126);
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBRenderTraits traitsWithGeometry:](UIKBRenderTraits, "traitsWithGeometry:");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBTextStyle styleWithFontName:withFontSize:](UIKBTextStyle, "styleWithFontName:withFontSize:", CFSTR("UIKBRenderFactorySystemFontName"), v122);
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v146, "setSymbolStyle:", v147);

  -[UIKeyboardLayoutStar renderConfig](self, "renderConfig");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  v149 = objc_msgSend(v148, "whiteText");
  v150 = UIKBColorWhite;
  if (!v149)
    v150 = UIKBColorBlack;
  v151 = *v150;
  objc_msgSend(v146, "symbolStyle");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v152, "setTextColor:", v151);

  +[UIKBKeyDisplayContents displayContents](UIKBKeyDisplayContents, "displayContents");
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v153, "setDisplayString:", v124);
  v154 = UIKBScale();
  +[UIKBRenderer rendererWithContext:withSize:withScale:opaque:renderFlags:assetIdiom:](UIKBRenderer, "rendererWithContext:withSize:withScale:opaque:renderFlags:assetIdiom:", 0, 0, 255, UIKeyboardGetCurrentIdiom(), v128, v126, v154);
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v155, "renderKeyContents:withTraits:", v153, v146);
  v156 = [UIImageView alloc];
  objc_msgSend(v155, "renderedImage");
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  v158 = -[UIImageView initWithImage:](v156, "initWithImage:", v157);

  -[UIView frame](v158, "frame");
  -[UIImageView setFrame:](v158, "setFrame:", v145, v137, v128, v126);
  if (v32)
    -[UIView addSubview:](v32, "addSubview:", v158);
  else
    v32 = v158;

  v16 = v32;
  return v16;
}

uint64_t __47__UIKeyboardLayoutStar_activationIndicatorView__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "avoidsLanguageIndicator") ^ 1;
}

- (BOOL)handRestRecognizerShouldNeverIgnoreTouchState:(id)a3 fromPoint:(CGPoint)a4 toPoint:(CGPoint)a5 forRestingState:(unint64_t)a6 otherRestedTouchLocations:(id)a7
{
  double y;
  double x;
  double v11;
  double v12;
  id v14;
  id v15;
  int v16;
  void *v17;
  uint64_t v18;
  double v19;
  BOOL (*v20)(uint64_t, void *);
  double *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  unint64_t v25;
  void *v26;
  int v27;
  unint64_t v28;
  void *v29;
  char v30;
  uint64_t v32;
  uint64_t v33;

  y = a5.y;
  x = a5.x;
  v11 = a4.y;
  v12 = a4.x;
  v14 = a3;
  v15 = a7;
  if (v14)
    v16 = objc_msgSend(v14, "phase") == 0;
  else
    v16 = 0;
  -[UIKeyboardLayoutStar keyHitTestClosestToPoint:](self, "keyHitTestClosestToPoint:", v12, v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = 0x21E00FA0F2;
    if (objc_msgSend(v15, "count"))
    {
      -[UIView bounds](self, "bounds");
      if (v12 <= v19 * 0.5)
      {
        v33 = MEMORY[0x1E0C809B0];
        v20 = __130__UIKeyboardLayoutStar_handRestRecognizerShouldNeverIgnoreTouchState_fromPoint_toPoint_forRestingState_otherRestedTouchLocations___block_invoke;
        v21 = (double *)&v33;
      }
      else
      {
        v32 = MEMORY[0x1E0C809B0];
        v20 = __130__UIKeyboardLayoutStar_handRestRecognizerShouldNeverIgnoreTouchState_fromPoint_toPoint_forRestingState_otherRestedTouchLocations___block_invoke_2;
        v21 = (double *)&v32;
      }
      *((_QWORD *)v21 + 1) = 3221225472;
      *((_QWORD *)v21 + 2) = v20;
      *((_QWORD *)v21 + 3) = &__block_descriptor_56_e24_B32__0__NSValue_8Q16_B24l;
      v21[4] = v12;
      v21[5] = v11;
      v21[6] = v19 * 0.5;
      objc_msgSend(v15, "indexesOfObjectsPassingTest:", v32);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectsAtIndexes:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = objc_msgSend(v23, "count");
      if (v24 > 1)
        v18 = 0x21C00FA052;
      if (v14 && v24 >= 2)
      {
        v16 = objc_msgSend(v14, "phase") != 0;
        v18 = 0x21C00FA052;
      }
      if (objc_msgSend(v17, "interactionType") == 15
        || objc_msgSend(v17, "interactionType") == 13)
      {
        v18 |= 1uLL;
      }

    }
    v25 = -[UIKeyboardLayoutStar downActionFlagsForKey:](self, "downActionFlagsForKey:", v17);
    if (objc_msgSend(v17, "interactionType") == 2)
    {
      if (-[UIKeyboardLayoutStar keyHasAccentedVariants:](self, "keyHasAccentedVariants:", v17))
      {
        objc_msgSend(v17, "name");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "hasPrefix:", CFSTR("Assist"));

        if (!v27)
          v25 |= 0x8080uLL;
      }
    }
    v28 = v25 & v18;
    if (a6 != 1 && !v28)
      v28 = -[UIKeyboardLayoutStar upActionFlagsForKey:](self, "upActionFlagsForKey:", v17) & v18;
    if (v28)
      v16 = 1;
    if (objc_msgSend(v17, "displayTypeHint") == 10)
      v16 = 1;
    if (objc_msgSend(v17, "interactionType") == 16)
      v16 |= (objc_msgSend(v17, "state") & 0x10) >> 4;
    if (v14 && a6 != 1 && !v16 && objc_msgSend(v14, "phase"))
    {
LABEL_35:
      -[UIKeyboardLayoutStar keyHitTestClosestToPoint:](self, "keyHitTestClosestToPoint:", x, y);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v16) = v29 == v17;

      goto LABEL_41;
    }
    v30 = v16 ^ 1;
    if (a6 == 2)
      v30 = 1;
    if ((v30 & 1) == 0)
    {
      if (self->_activeKey
        || objc_msgSend(v17, "interactionType") != 1
        && objc_msgSend(v17, "interactionType") != 2)
      {
        LOBYTE(v16) = 1;
        goto LABEL_41;
      }
      goto LABEL_35;
    }
  }
LABEL_41:

  return v16;
}

BOOL __130__UIKeyboardLayoutStar_handRestRecognizerShouldNeverIgnoreTouchState_fromPoint_toPoint_forRestingState_otherRestedTouchLocations___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  double v4;

  objc_msgSend(a2, "CGPointValue");
  return v4 < *(double *)(a1 + 40) && v3 <= *(double *)(a1 + 48);
}

BOOL __130__UIKeyboardLayoutStar_handRestRecognizerShouldNeverIgnoreTouchState_fromPoint_toPoint_forRestingState_otherRestedTouchLocations___block_invoke_2(uint64_t a1, void *a2)
{
  double v3;
  double v4;

  objc_msgSend(a2, "CGPointValue");
  return v4 < *(double *)(a1 + 40) && v3 >= *(double *)(a1 + 48);
}

- (id)getSortedKeysForDisplayRowHint:(int)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  int v12;

  -[UIKBTree keys](self->_keyplane, "keys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __55__UIKeyboardLayoutStar_getSortedKeysForDisplayRowHint___block_invoke;
  v11[3] = &__block_descriptor_36_e25_B32__0__UIKBTree_8Q16_B24l;
  v12 = a3;
  objc_msgSend(v4, "indexesOfObjectsPassingTest:", v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectsAtIndexes:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "indexesOfObjectsPassingTest:", &__block_literal_global_885);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectsAtIndexes:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "sortedArrayUsingComparator:", &__block_literal_global_886);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

BOOL __55__UIKeyboardLayoutStar_getSortedKeysForDisplayRowHint___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "displayRowHint") == *(_DWORD *)(a1 + 32);
}

BOOL __55__UIKeyboardLayoutStar_getSortedKeysForDisplayRowHint___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  _BOOL8 v4;

  v2 = a2;
  if (objc_msgSend(v2, "interactionType") == 1)
  {
    objc_msgSend(v2, "representedString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "length"))
      v4 = 1;
    else
      v4 = objc_msgSend(v2, "interactionType") == 2;

  }
  else
  {
    v4 = objc_msgSend(v2, "interactionType") == 2;
  }

  return v4;
}

uint64_t __55__UIKeyboardLayoutStar_getSortedKeysForDisplayRowHint___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  objc_msgSend(a2, "frame");
  v6 = v5;
  objc_msgSend(v4, "frame");
  v8 = v7;

  if (v6 - v8 < 0.0)
    return -1;
  else
    return v6 - v8 > 0.0;
}

- (id)handRestRecognizerGetHomeRowHint
{
  NSNumber *homeRowHint;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  NSNumber *v11;
  NSNumber *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[4];
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  homeRowHint = self->_homeRowHint;
  if (!homeRowHint)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v18[0] = CFSTR("Caps-Lock-Key");
    v18[1] = CFSTR("Roman-to-Non-Roman-Switch-Key");
    v18[2] = CFSTR("Non-Roman-to-Roman-Switch-Key");
    v18[3] = CFSTR("Return-Key");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 4, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v4);
          -[UIKBTree firstCachedKeyWithName:](self->_keyplane, "firstCachedKeyWithName:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            v10 = v9;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v9, "displayRowHint"));
            v11 = (NSNumber *)objc_claimAutoreleasedReturnValue();
            v12 = self->_homeRowHint;
            self->_homeRowHint = v11;

            goto LABEL_12;
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_12:

    homeRowHint = self->_homeRowHint;
  }
  return homeRowHint;
}

- (CGSize)handRestRecognizerStandardKeyPixelSize
{
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  objc_super v26;
  CGSize result;

  -[UIKeyboardLayoutStar handRestRecognizerGetHomeRowHint](self, "handRestRecognizerGetHomeRowHint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    goto LABEL_6;
  v5 = objc_msgSend(v3, "intValue");
  v6 = v5;
  -[UIKeyboardLayoutStar getSortedKeysForDisplayRowHint:](self, "getSortedKeysForDisplayRowHint:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardLayoutStar getSortedKeysForDisplayRowHint:](self, "getSortedKeysForDisplayRowHint:", (v6 - 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v7, "count") < 5 || (unint64_t)objc_msgSend(v8, "count") <= 3)
  {

LABEL_6:
    v26.receiver = self;
    v26.super_class = (Class)UIKeyboardLayoutStar;
    -[UIKeyboardLayout handRestRecognizerStandardKeyPixelSize](&v26, sel_handRestRecognizerStandardKeyPixelSize);
    v20 = v22;
    v21 = v23;
    goto LABEL_7;
  }
  objc_msgSend(v8, "objectAtIndex:", 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  v11 = v10;

  objc_msgSend(v7, "objectAtIndex:", 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  v14 = v13;
  v16 = v15;

  objc_msgSend(v7, "objectAtIndex:", 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "frame");
  v19 = v18;

  v20 = v19 - v14;
  v21 = v16 - v11;

LABEL_7:
  v24 = v20;
  v25 = v21;
  result.height = v25;
  result.width = v24;
  return result;
}

- (id)handRestRecognizerSilenceNextTouchDown
{
  -[UIKeyboardLayoutStar setMuteNextKeyClickSound:](self, "setMuteNextKeyClickSound:", 1);
  return 0;
}

- (void)handRestRecognizerNotifyRestForBegin:(BOOL)a3 location:(CGPoint)a4 timestamp:(double)a5 pathIndex:(int)a6 touchUUID:(id)a7 context:(id)a8
{
  double y;
  double x;
  _BOOL4 v13;
  id v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;

  y = a4.y;
  x = a4.x;
  v13 = a3;
  v20 = a8;
  v15 = a7;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[UIKeyboardLayout fingerIDForTouchUUID:](self, "fingerIDForTouchUUID:", v15);

  if (v13)
    v18 = 4;
  else
    v18 = 5;
  objc_msgSend(MEMORY[0x1E0DBDC78], "touchEventWithStage:location:radius:timestamp:pathIndex:fingerID:forcedKeyCode:", v18, a6, v17, -1, x, y, 1.0, a5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v16, "performHitTestForTouchEvent:executionContextPassingNSNumber:", v19, v20);
  }
  else
  {
    objc_msgSend(v16, "skipHitTestForTouchEvent:", v19);
    objc_msgSend(v20, "returnExecutionToParent");
  }

}

- (CGPoint)getCenterForKeyUnderLeftIndexFinger
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  CGFloat MidX;
  double v8;
  CGFloat MidY;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  objc_super v21;
  CGPoint result;
  CGRect v23;
  CGRect v24;

  -[UIKeyboardLayoutStar handRestRecognizerGetHomeRowHint](self, "handRestRecognizerGetHomeRowHint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    -[UIKeyboardLayoutStar getSortedKeysForDisplayRowHint:](self, "getSortedKeysForDisplayRowHint:", objc_msgSend(v3, "intValue"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v5, "count") > 6)
    {
      objc_msgSend(v5, "objectAtIndex:", 3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "frame");
      v12 = v11;
      v14 = v13;
      v16 = v15;
      v18 = v17;

      v23.origin.x = v12;
      v23.origin.y = v14;
      v23.size.width = v16;
      v23.size.height = v18;
      MidX = CGRectGetMidX(v23);
      v24.origin.x = v12;
      v24.origin.y = v14;
      v24.size.width = v16;
      v24.size.height = v18;
      MidY = CGRectGetMidY(v24);

      goto LABEL_6;
    }

  }
  v21.receiver = self;
  v21.super_class = (Class)UIKeyboardLayoutStar;
  -[UIKeyboardLayout getCenterForKeyUnderLeftIndexFinger](&v21, sel_getCenterForKeyUnderLeftIndexFinger);
  MidX = v6;
  MidY = v8;
LABEL_6:

  v19 = MidX;
  v20 = MidY;
  result.y = v20;
  result.x = v19;
  return result;
}

- (CGPoint)getCenterForKeyUnderRightIndexFinger
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  CGFloat MidX;
  double v8;
  CGFloat MidY;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  objc_super v21;
  CGPoint result;
  CGRect v23;
  CGRect v24;

  -[UIKeyboardLayoutStar handRestRecognizerGetHomeRowHint](self, "handRestRecognizerGetHomeRowHint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    -[UIKeyboardLayoutStar getSortedKeysForDisplayRowHint:](self, "getSortedKeysForDisplayRowHint:", objc_msgSend(v3, "intValue"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v5, "count") > 6)
    {
      objc_msgSend(v5, "objectAtIndex:", 6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "frame");
      v12 = v11;
      v14 = v13;
      v16 = v15;
      v18 = v17;

      v23.origin.x = v12;
      v23.origin.y = v14;
      v23.size.width = v16;
      v23.size.height = v18;
      MidX = CGRectGetMidX(v23);
      v24.origin.x = v12;
      v24.origin.y = v14;
      v24.size.width = v16;
      v24.size.height = v18;
      MidY = CGRectGetMidY(v24);

      goto LABEL_6;
    }

  }
  v21.receiver = self;
  v21.super_class = (Class)UIKeyboardLayoutStar;
  -[UIKeyboardLayout getCenterForKeyUnderLeftIndexFinger](&v21, sel_getCenterForKeyUnderLeftIndexFinger);
  MidX = v6;
  MidY = v8;
LABEL_6:

  v19 = MidX;
  v20 = MidY;
  result.y = v20;
  result.x = v19;
  return result;
}

- (id)getHorizontalOffsetFromHomeRowForRowRelativeToHomeRow:(int64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  float v20;
  CGFloat v21;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  _QWORD v34[9];
  CGRect v35;
  CGRect v36;

  -[UIKeyboardLayoutStar handRestRecognizerGetHomeRowHint](self, "handRestRecognizerGetHomeRowHint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "intValue");
    -[UIKeyboardLayoutStar getSortedKeysForDisplayRowHint:](self, "getSortedKeysForDisplayRowHint:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      v9 = objc_msgSend(v8, "count");
      if ((unint64_t)(v9 - 1) >= 4)
        v10 = 4;
      else
        v10 = v9 - 1;
      objc_msgSend(v8, "objectAtIndex:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "frame");
      v13 = v12;
      v15 = v14;
      v17 = v16;
      v19 = v18;

      v20 = v17 * 0.05;
      v21 = floorf(v20);
      v35.origin.x = v13;
      v35.origin.y = v15;
      v35.size.width = v17;
      v35.size.height = v19;
      v36 = CGRectInset(v35, v21, 0.0);
      x = v36.origin.x;
      y = v36.origin.y;
      width = v36.size.width;
      height = v36.size.height;
      -[UIKeyboardLayoutStar getSortedKeysForDisplayRowHint:](self, "getSortedKeysForDisplayRowHint:", (v7 + a3));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __78__UIKeyboardLayoutStar_getHorizontalOffsetFromHomeRowForRowRelativeToHomeRow___block_invoke;
      v34[3] = &__block_descriptor_72_e25_B32__0__UIKBTree_8Q16_B24l;
      v34[4] = a3;
      *(CGFloat *)&v34[5] = x;
      *(CGFloat *)&v34[6] = y;
      *(CGFloat *)&v34[7] = width;
      *(CGFloat *)&v34[8] = height;
      objc_msgSend(v26, "indexesOfObjectsPassingTest:", v34);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectsAtIndexes:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v28, "count"))
      {
        v29 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v28, "objectAtIndex:", 0);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "frame");
        objc_msgSend(v29, "numberWithDouble:", v31 - v13);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v32 = 0;
      }

    }
    else
    {
      v32 = 0;
    }

  }
  else
  {
    v32 = 0;
  }

  return v32;
}

BOOL __78__UIKeyboardLayoutStar_getHorizontalOffsetFromHomeRowForRowRelativeToHomeRow___block_invoke(uint64_t a1, void *a2)
{
  CGFloat v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  double v11;
  double v12;
  double MinX;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  objc_msgSend(a2, "frame");
  v7 = v3;
  v8 = v4;
  v9 = v5;
  v10 = v6;
  if ((*(_QWORD *)(a1 + 32) & 0x8000000000000000) != 0)
  {
    MinX = CGRectGetMinX(*(CGRect *)&v3);
    if (MinX <= CGRectGetMinX(*(CGRect *)(a1 + 40)))
    {
      v12 = CGRectGetMinX(*(CGRect *)(a1 + 40));
      goto LABEL_7;
    }
    return 0;
  }
  v11 = CGRectGetMinX(*(CGRect *)(a1 + 40));
  v15.origin.x = v7;
  v15.origin.y = v8;
  v15.size.width = v9;
  v15.size.height = v10;
  if (v11 > CGRectGetMinX(v15))
    return 0;
  v16.origin.x = v7;
  v16.origin.y = v8;
  v16.size.width = v9;
  v16.size.height = v10;
  v12 = CGRectGetMinX(v16);
  v7 = *(double *)(a1 + 40);
  v8 = *(double *)(a1 + 48);
  v9 = *(double *)(a1 + 56);
  v10 = *(double *)(a1 + 64);
LABEL_7:
  v17.origin.x = v7;
  v17.origin.y = v8;
  v17.size.width = v9;
  v17.size.height = v10;
  return v12 <= CGRectGetMaxX(v17);
}

- (BOOL)_handRestRecognizerCancelShouldBeEnd
{
  return -[UIKeyboardPinchGestureRecognizer pinchDetected](self->_pinchGestureRecognizer, "pinchDetected");
}

- (void)setNeedsVirtualDriftUpdate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIKeyboardLayoutStar;
  -[UIKeyboardLayout setNeedsVirtualDriftUpdate](&v3, sel_setNeedsVirtualDriftUpdate);
  if (-[UIKeyboardLayout supportsVirtualDrift](self, "supportsVirtualDrift"))
    -[UIKeyboardLayoutStar updateKeyCentroids](self, "updateKeyCentroids");
}

- (void)resetHRRLayoutState
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIKeyboardLayoutStar;
  -[UIKeyboardLayout resetHRRLayoutState](&v3, sel_resetHRRLayoutState);
  -[UIKeyboardLayoutStar clearAllTouchInfo](self, "clearAllTouchInfo");
}

- (void)calculateReachabilityScoreWithKey:(id)a3 keyError:(CGPoint)a4
{
  double x;
  id v6;
  NSMutableArray *v7;
  NSMutableArray *leftSideReachability;
  NSMutableArray *v9;
  NSMutableArray *rightSideReachability;
  NSMutableArray *v11;
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  double v20;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  double v26;
  double v27;
  double v28;
  double v29;
  double v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  x = a4.x;
  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!self->_leftSideReachability)
  {
    v7 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 20);
    leftSideReachability = self->_leftSideReachability;
    self->_leftSideReachability = v7;

  }
  if (!self->_rightSideReachability)
  {
    v9 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 20);
    rightSideReachability = self->_rightSideReachability;
    self->_rightSideReachability = v9;

  }
  if (-[NSMutableSet containsObject:](self->_leftKeySet, "containsObject:", v6))
  {
    v11 = self->_leftSideReachability;
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", x);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v11, "addObject:", v12);

    goto LABEL_10;
  }
  if (-[NSMutableSet containsObject:](self->_rightKeySet, "containsObject:", v6))
  {
    v11 = self->_rightSideReachability;
    goto LABEL_9;
  }
LABEL_10:
  if ((unint64_t)-[NSMutableArray count](self->_leftSideReachability, "count") < 5
    || (unint64_t)-[NSMutableArray count](self->_rightSideReachability, "count") < 5)
  {
    goto LABEL_42;
  }
  if ((unint64_t)-[NSMutableArray count](self->_leftSideReachability, "count") >= 0x15)
    -[NSMutableArray removeObjectsInRange:](self->_leftSideReachability, "removeObjectsInRange:", 0, -[NSMutableArray count](self->_leftSideReachability, "count") - 20);
  if ((unint64_t)-[NSMutableArray count](self->_rightSideReachability, "count") >= 0x15)
    -[NSMutableArray removeObjectsInRange:](self->_rightSideReachability, "removeObjectsInRange:", 0, -[NSMutableArray count](self->_rightSideReachability, "count") - 20);
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v13 = self->_leftSideReachability;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  v15 = 0.0;
  v16 = 0.0;
  if (v14)
  {
    v17 = v14;
    v18 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v38 != v18)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "doubleValue");
        v16 = v16 + v20;
      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v17);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v21 = self->_rightSideReachability;
  v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v34;
    v15 = 0.0;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v34 != v24)
          objc_enumerationMutation(v21);
        objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * j), "doubleValue", (_QWORD)v33);
        v15 = v15 + v26;
      }
      v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v23);
  }

  v27 = v16 / (double)(unint64_t)-[NSMutableArray count](self->_leftSideReachability, "count");
  v28 = v15 / (double)(unint64_t)-[NSMutableArray count](self->_rightSideReachability, "count");
  v29 = fabs(v28);
  if (v27 > 8.0 && v29 < 8.0)
  {
    v32 = ceil(v27);
    goto LABEL_41;
  }
  if (fabs(v27) < 8.0 && v28 < -8.0)
  {
    v32 = floor(v28);
LABEL_41:
    +[_UIKeyboardUsageTracking keyboardReachabilityDistribution:](_UIKeyboardUsageTracking, "keyboardReachabilityDistribution:", v32, (_QWORD)v33);
  }
LABEL_42:

}

- (double)biasedKeyboardWidthRatio
{
  void *v2;
  double v3;
  double v4;

  +[UIKeyboardImpl keyboardScreen](UIKeyboardImpl, "keyboardScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_unjailedReferenceBounds");
  v4 = v3;

  return 320.0 / v4;
}

- (void)setKeyboardBias:(int64_t)a3
{
  UIKBScreenTraits *screenTraits;
  TUIKeyplaneView *v6;
  int64_t currentHandBias;
  TUIKeyplaneView *liveKeyplaneView;
  id v9;

  screenTraits = self->super._screenTraits;
  if (!screenTraits || !screenTraits->_isStickerPickerServiceCollectionView)
  {
    if (self->_currentHandBias != a3
      || -[UIKeyboardLayoutStar useCrescendoLayout](self, "useCrescendoLayout")
      && (v6 = self->_liveKeyplaneView) != 0
      && (currentHandBias = self->_currentHandBias,
          currentHandBias != -[TUIKeyplaneView currentHandBias](v6, "currentHandBias")))
    {
      self->_currentHandBias = a3;
      if (-[UIKeyboardLayoutStar useCrescendoLayout](self, "useCrescendoLayout"))
      {
        liveKeyplaneView = self->_liveKeyplaneView;
        if (liveKeyplaneView)
          -[TUIKeyplaneView setKeyboardBias:](liveKeyplaneView, "setKeyboardBias:", a3);
      }
      -[UIKeyboardLayoutStar reloadCurrentKeyplane](self, "reloadCurrentKeyplane");
      +[_UIKeyboardUsageTracking countReachableKeyboardHandBiasChangeToBias:](_UIKeyboardUsageTracking, "countReachableKeyboardHandBiasChangeToBias:", a3);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("UIKeyboardHandBiasDidChangeNotification"), 0, 0);

    }
  }
}

- (void)_didTapBiasEscapeButton:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[UIKeyboardLayoutStar setKeyboardBias:](self, "setKeyboardBias:", 0);
  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferencesActions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHandBias:", 0);

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateForHandBiasChange");

}

- (void)resizeKeyplaneAndRedraw:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  TUIKeyplaneView *liveKeyplaneView;
  double v13;
  double v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  _BOOL4 v33;
  id obj;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v3 = a3;
  v53 = *MEMORY[0x1E0C80C00];
  if (-[UIKeyboardLayoutStar keyplaneUsesResizingOffset](self, "keyplaneUsesResizingOffset")
    || +[UIKeyboard resizable](UIKeyboard, "resizable"))
  {
    -[UIKBTree frame](self->_keyplane, "frame");
    v6 = v5;
    v8 = v7;
    -[UIKeyboardLayoutStar _addResizeTransformationsIfNecessary](self, "_addResizeTransformationsIfNecessary");
    -[UIKBTree frame](self->_keyplane, "frame");
    if (v6 != v10 || v8 != v9)
    {
      -[UIKeyboardLayoutStar updateKeyboardForKeyplane:](self, "updateKeyboardForKeyplane:", self->_keyplane);
      if (-[UIKeyboardLayoutStar useCrescendoLayout](self, "useCrescendoLayout"))
      {
        liveKeyplaneView = self->_liveKeyplaneView;
        -[UIView bounds](self, "bounds");
        -[TUIKeyplaneView updateToSize:](liveKeyplaneView, "updateToSize:", v13, v14);
      }
      else
      {
        v33 = v3;
        v48 = 0u;
        v49 = 0u;
        v46 = 0u;
        v47 = 0u;
        -[UIKBTree subtrees](self->_keyplane, "subtrees");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
        if (v36)
        {
          v35 = *(_QWORD *)v47;
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v47 != v35)
                objc_enumerationMutation(obj);
              v37 = v15;
              v16 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v15);
              v42 = 0u;
              v43 = 0u;
              v44 = 0u;
              v45 = 0u;
              objc_msgSend(v16, "keySet");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "subtrees");
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
              if (v19)
              {
                v20 = v19;
                v21 = *(_QWORD *)v43;
                do
                {
                  v22 = 0;
                  do
                  {
                    if (*(_QWORD *)v43 != v21)
                      objc_enumerationMutation(v18);
                    v23 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v22);
                    v38 = 0u;
                    v39 = 0u;
                    v40 = 0u;
                    v41 = 0u;
                    objc_msgSend(v23, "subtrees");
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
                    if (v25)
                    {
                      v26 = v25;
                      v27 = *(_QWORD *)v39;
                      do
                      {
                        v28 = 0;
                        do
                        {
                          if (*(_QWORD *)v39 != v27)
                            objc_enumerationMutation(v24);
                          -[UIKBKeyplaneView updateFrameForKey:](self->_keyplaneView, "updateFrameForKey:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v28++));
                        }
                        while (v26 != v28);
                        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
                      }
                      while (v26);
                    }

                    ++v22;
                  }
                  while (v22 != v20);
                  v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
                }
                while (v20);
              }

              v15 = v37 + 1;
            }
            while (v37 + 1 != v36);
            v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
          }
          while (v36);
        }

        v3 = v33;
      }
      -[UIView bounds](self, "bounds");
      +[UIKBKeyplaneChangeContext keyplaneChangeContextWithSize:](UIKBKeyplaneChangeContext, "keyplaneChangeContextWithSize:", v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[UIKeyboardLayoutStar useCrescendoLayout](self, "useCrescendoLayout"))
      {
        -[UIKBKeyplaneView setSuppressDrawing:](self->_keyplaneView, "setSuppressDrawing:", !v3);
        objc_msgSend(v31, "size");
        -[UIView setSize:](self->_keyplaneView, "setSize:");
        -[UIKBKeyplaneView setSuppressDrawing:](self->_keyplaneView, "setSuppressDrawing:", 0);
      }
      -[UIKeyboardLayoutStar _didChangeKeyplaneWithContext:](self, "_didChangeKeyplaneWithContext:", v31);
      if (v3)
      {
        +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "layoutDidResize");

      }
    }
  }
}

- (CGSize)intrinsicContentSize
{
  TUIKeyplaneView *liveKeyplaneView;
  double v4;
  double v5;
  objc_super v6;
  CGSize result;

  if (-[UIKeyboardLayoutStar useCrescendoLayout](self, "useCrescendoLayout")
    && (liveKeyplaneView = self->_liveKeyplaneView) != 0)
  {
    -[TUIKeyplaneView intrinsicContentSize](liveKeyplaneView, "intrinsicContentSize");
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UIKeyboardLayoutStar;
    -[UIView intrinsicContentSize](&v6, sel_intrinsicContentSize);
  }
  result.height = v5;
  result.width = v4;
  return result;
}

- (id)splitTransitionDelegate
{
  UIKeyboardKeyplaneTransitionDelegate **p_splitKeyplaneTransitionDelegate;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (-[UIKeyboardLayoutStar useCrescendoLayout](self, "useCrescendoLayout"))
  {
    p_splitKeyplaneTransitionDelegate = &self->_splitKeyplaneTransitionDelegate;
    WeakRetained = objc_loadWeakRetained((id *)&self->_splitKeyplaneTransitionDelegate);

    if (!WeakRetained)
    {
      -[UIView window](self, "window");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "screen");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIKeyboardMotionSupport supportForScreen:](UISplitKeyboardSupport, "supportForScreen:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeWeak((id *)p_splitKeyplaneTransitionDelegate, v7);

    }
    v8 = objc_loadWeakRetained((id *)p_splitKeyplaneTransitionDelegate);
  }
  else
  {
    -[UIKeyboardSplitTransitionView splitTransitionDelegate](self->_transitionView, "splitTransitionDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (void)prepareForSplitTransition
{
  void *v3;
  void *v4;
  double v5;
  id v6;

  if (-[UIKeyboardLayoutStar useCrescendoLayout](self, "useCrescendoLayout"))
    -[TUIKeyplaneView prepareForSplitTransition](self->_liveKeyplaneView, "prepareForSplitTransition");
  -[UIKeyboardLayoutStar splitTransitionDelegate](self, "splitTransitionDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "prepareForTransition");

  -[UIKeyboardLayoutStar flushKeyCache:](self, "flushKeyCache:", 0);
  -[UIView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearLanguageIndicator");

  +[UIKeyboardImpl persistentSplitProgress](UIKeyboardImpl, "persistentSplitProgress");
  if (self->_finalSplitProgress != v5)
    self->_initialSplitProgress = v5;
  if (+[UIDictationController isRunning](UIDictationController, "isRunning"))
  {
    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cancelDictation");

  }
}

- (void)showSplitTransitionView:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  _BOOL8 v6;

  v3 = a3;
  if (a3
    && (-[UIView isHidden](self->_transitionView, "isHidden")
     || -[UIKeyboardLayoutStar useCrescendoLayout](self, "useCrescendoLayout")))
  {
    -[UIKeyboardLayoutStar prepareForSplitTransition](self, "prepareForSplitTransition");
  }
  if (-[UIKeyboardLayoutStar pinchSplitGestureEnabled](self, "pinchSplitGestureEnabled"))
  {
    if (self->_isRebuilding && v3)
    {
      if (!-[UIKeyboardSplitTransitionView canDisplayTransition](self->_transitionView, "canDisplayTransition")
        && !-[UIKeyboardLayoutStar useCrescendoLayout](self, "useCrescendoLayout"))
      {
        -[UIKeyboardLayoutStar rebuildSplitTransitionView](self, "rebuildSplitTransitionView");
      }
    }
    else
    {
      -[UIView setHidden:](self->_keyplaneView, "setHidden:", v3);
      -[UIView setHidden:](self->_backgroundView, "setHidden:", v3);
      -[UIView layer](self->_dimKeyboardImageView, "layer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeAllAnimations");

      -[UIView setHidden:](self->_dimKeyboardImageView, "setHidden:", v3);
      v6 = !v3 || -[UIKeyboardLayoutStar useCrescendoLayout](self, "useCrescendoLayout");
      -[UIView setHidden:](self->_transitionView, "setHidden:", v6);
    }
  }
  -[UIView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", v3 ^ 1);
}

- (void)finishSplitWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  UIKeyboardLayoutStar *v12;
  id v13;

  v4 = a3;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __50__UIKeyboardLayoutStar_finishSplitWithCompletion___block_invoke;
  v11 = &unk_1E16B1D18;
  v12 = self;
  v5 = v4;
  v13 = v5;
  v6 = _Block_copy(&v8);
  -[UIKeyboardLayoutStar setPlayKeyClickSoundOn:](self, "setPlayKeyClickSoundOn:", 0, v8, v9, v10, v11, v12);
  if (-[UIKeyboardLayoutStar useCrescendoLayout](self, "useCrescendoLayout"))
    -[TUIKeyplaneView finishSplitTransition](self->_liveKeyplaneView, "finishSplitTransition");
  -[UIKeyboardLayoutStar splitTransitionDelegate](self, "splitTransitionDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "finishTransitionWithCompletion:", v6);

}

uint64_t __50__UIKeyboardLayoutStar_finishSplitWithCompletion___block_invoke(uint64_t a1)
{
  double *v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;

  v2 = *(double **)(a1 + 32);
  if (v2[122] == v2[123])
  {
    objc_msgSend(*(id *)(a1 + 32), "bounds");
    +[UIKBKeyplaneChangeContext keyplaneChangeContextWithSize:](UIKBKeyplaneChangeContext, "keyplaneChangeContextWithSize:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_didChangeKeyplaneWithContext:", v7);
  }
  else
  {
    +[UIKeyboardImpl setPersistentSplitProgress:](UIKeyboardImpl, "setPersistentSplitProgress:");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(v3 + 664);
    if (*(double *)(v3 + 984) <= 0.0)
      objc_msgSend((id)v3, "defaultNameForKeyplaneName:", v4);
    else
      objc_msgSend((id)v3, "splitNameForKeyplaneName:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 640), "subtreeWithName:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "splitNameForKeyplane:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 648));
      v9 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v9;
    }
    objc_msgSend(*(id *)(a1 + 32), "setKeyplaneName:", v7);
    objc_msgSend(*(id *)(a1 + 32), "updateKeyCentroids");
  }

  objc_msgSend(*(id *)(a1 + 32), "showSplitTransitionView:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 960), "resetPinchCalculations");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "postNotificationName:object:", CFSTR("UIKeyboardLayoutDidChangedNotification"), 0);

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "showsCandidateBar");

  if (v12)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "candidateController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "updateStates");

  }
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "forceShiftUpdate");

  objc_msgSend(*(id *)(a1 + 32), "_cleanUpBlinkAssertionIfNecessary");
  +[UIKeyboardSplitControlMenu activeInstance](UIKeyboardSplitControlMenu, "activeInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "didFinishSplitTransition");

  +[UIInputSwitcherView activeInstance](UIInputSwitcherView, "activeInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "didFinishSplitTransition");

  v18 = *(_QWORD *)(a1 + 40);
  if (v18)
    (*(void (**)(void))(v18 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "updateTouchProcessingForKeyplaneChange");
}

- (void)finishSplitTransition
{
  -[UIKeyboardLayoutStar finishSplitTransitionWithCompletion:](self, "finishSplitTransitionWithCompletion:", 0);
}

- (void)finishSplitTransitionWithCompletion:(id)a3
{
  id v4;
  double v5;
  void *v6;
  _BOOL4 v7;
  double finalSplitProgress;
  TUIKeyplaneView *liveKeyplaneView;
  id *v10;
  id v11;
  UIKeyboardSplitTransitionView *transitionView;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];
  id v17;

  v4 = a3;
  if (-[UIKeyboardPinchGestureRecognizer pinchDetected](self->_pinchGestureRecognizer, "pinchDetected"))
  {
    -[UIKeyboardPinchGestureRecognizer finalProgressForInitialProgress:](self->_pinchGestureRecognizer, "finalProgressForInitialProgress:", self->_initialSplitProgress);
    self->_finalSplitProgress = v5;
    if (v5 != self->_initialSplitProgress)
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setRivenSplitLock:", 1);

    }
  }
  v7 = -[UIKeyboardLayoutStar useCrescendoLayout](self, "useCrescendoLayout");
  finalSplitProgress = self->_finalSplitProgress;
  if (v7)
  {
    liveKeyplaneView = self->_liveKeyplaneView;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __60__UIKeyboardLayoutStar_finishSplitTransitionWithCompletion___block_invoke;
    v16[3] = &unk_1E16BC218;
    v10 = &v17;
    v16[4] = self;
    v17 = v4;
    v11 = v4;
    -[TUIKeyplaneView transitionWillFinishWithProgress:completion:](liveKeyplaneView, "transitionWillFinishWithProgress:completion:", v16, finalSplitProgress);
  }
  else
  {
    transitionView = self->_transitionView;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __60__UIKeyboardLayoutStar_finishSplitTransitionWithCompletion___block_invoke_2;
    v14[3] = &unk_1E16B1D18;
    v10 = &v15;
    v14[4] = self;
    v15 = v4;
    v13 = v4;
    -[UIKeyboardSplitTransitionView finishWithProgress:completionBlock:](transitionView, "finishWithProgress:completionBlock:", v14, finalSplitProgress);
  }

}

void __60__UIKeyboardLayoutStar_finishSplitTransitionWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "finishSplitWithCompletion:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "splitTransitionDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(double *)(v3 + 984);
  objc_msgSend(*(id *)(v3 + 1456), "fullHeightForDockedKeyboard");
  v6 = v5;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1456), "leftSplitSize");
  objc_msgSend(v2, "updateProgress:startHeight:endHeight:", v4, v6, v7 + 10.0);

  objc_msgSend(*(id *)(a1 + 32), "splitTransitionDelegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "transitionDidFinish:", 1);

}

uint64_t __60__UIKeyboardLayoutStar_finishSplitTransitionWithCompletion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishSplitWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)finishSplitTransitionWithProgress:(double)a3
{
  self->_finalSplitProgress = a3;
  -[UIKeyboardLayoutStar finishSplitTransition](self, "finishSplitTransition");
}

- (BOOL)pinchSplitGestureEnabled
{
  if (-[UIKeyboardLayoutStar useCrescendoLayout](self, "useCrescendoLayout"))
    return -[TUIKeyplaneView supportsSplit](self->_liveKeyplaneView, "supportsSplit");
  else
    return UIKeyboardSplitTransitionViewSupportsPinch();
}

- (BOOL)pinchCanBeginWithTouches:(id)a3 andScale:(double)a4
{
  id v6;
  BOOL v7;
  _BOOL4 v8;
  BOOL v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (self->_isTrackpadMode
    || -[UIKeyboardLayout isFloating](self, "isFloating")
    || !-[UIView isUserInteractionEnabled](self, "isUserInteractionEnabled")
    || (v7 = -[UIKBScreenTraits isSplit](self->super._screenTraits, "isSplit"), a4 >= 1.0) && v7
    || (v8 = -[UIKBScreenTraits isSplit](self->super._screenTraits, "isSplit"), a4 <= 1.0) && !v8)
  {
    v9 = 0;
  }
  else
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    obj = v6;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v21 != v13)
            objc_enumerationMutation(obj);
          +[UIKBTouchState touchUUIDForTouch:](UIKBTouchState, "touchUUIDForTouch:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIKeyboardLayoutStar infoForTouchUUID:](self, "infoForTouchUUID:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "key");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "interactionType");

          if (v18 == 11)
          {
            v9 = 0;
            goto LABEL_20;
          }
        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v12)
          continue;
        break;
      }
    }
    v9 = 1;
LABEL_20:

  }
  return v9;
}

- (void)didDetectPinchWithSeparation:(double)a3
{
  double v5;
  double v6;
  double initialSplitProgress;
  double v8;

  self->_finalSplitProgress = self->_initialSplitProgress;
  -[UIView frame](self, "frame");
  v6 = v5 * -0.3;
  initialSplitProgress = self->_initialSplitProgress;
  -[UIKeyboardPinchGestureRecognizer initialPinchSeparation](self->_pinchGestureRecognizer, "initialPinchSeparation");
  -[UIKeyboardLayoutStar setSplitProgress:](self, "setSplitProgress:", initialSplitProgress + (v8 - a3) / v6);
}

- (void)pinchDidConsumeTouch:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  +[UIKBTouchState touchUUIDForTouch:](UIKBTouchState, "touchUUIDForTouch:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardLayoutStar infoForTouchUUID:](self, "infoForTouchUUID:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "touch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIKeyboardLayoutStar clearInfoForTouch:](self, "clearInfoForTouch:", v5);
}

- (void)pinchHandler:(id)a3
{
  id v4;
  char v5;
  uint64_t v6;

  v4 = a3;
  if (objc_msgSend(v4, "state") == 5)
  {
    v5 = objc_msgSend(v4, "pinchDetected");

    if ((v5 & 1) == 0)
      return;
LABEL_5:
    -[UIKeyboardLayoutStar finishSplitTransition](self, "finishSplitTransition");
    return;
  }
  v6 = objc_msgSend(v4, "state");

  if (v6 == 3)
    goto LABEL_5;
}

- (void)setSplitProgress:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;

  if (-[UIKeyboardLayoutStar useCrescendoLayout](self, "useCrescendoLayout"))
  {
    v5 = 1.0;
    if (a3 <= 1.0)
      v5 = a3;
    if (a3 >= 0.0)
      v6 = v5;
    else
      v6 = 0.0;
    -[UIKeyboardLayoutStar showSplitTransitionView:](self, "showSplitTransitionView:", 1, v5);
    -[TUIKeyplaneView updateSplitProgress:](self->_liveKeyplaneView, "updateSplitProgress:", v6);
    -[UIKeyboardLayoutStar splitTransitionDelegate](self, "splitTransitionDelegate");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[TUIKeyplaneView fullHeightForDockedKeyboard](self->_liveKeyplaneView, "fullHeightForDockedKeyboard");
    v8 = v7;
    -[TUIKeyplaneView leftSplitSize](self->_liveKeyplaneView, "leftSplitSize");
    objc_msgSend(v10, "updateProgress:startHeight:endHeight:", v6, v8, v9 + 10.0);

  }
  else
  {
    if (self->_splitTransitionNeedsRebuild)
      -[UIKeyboardLayoutStar rebuildSplitTransitionView](self, "rebuildSplitTransitionView");
    -[UIKeyboardSplitTransitionView updateWithProgress:](self->_transitionView, "updateWithProgress:", a3);
    if (-[UIView isHidden](self->_transitionView, "isHidden"))
      -[UIKeyboardLayoutStar showSplitTransitionView:](self, "showSplitTransitionView:", 1);
  }
}

- (void)_autoSplit:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CADisplayLink *displayLink;

  objc_msgSend(a3, "timestamp");
  v5 = v4;
  v6 = (v4 - self->_autoSplitLastUpdate) * 1000.0;
  v7 = 1.0;
  if (v6 > 1.0)
  {
    v8 = v6 / 1000.0 / 0.4 + self->_autoSplitElapsedTime;
    self->_autoSplitElapsedTime = v8;
    v9 = self->_initialSplitProgress + v8 * (self->_finalSplitProgress - self->_initialSplitProgress);
    if (v9 <= 1.0)
      v7 = v9;
    if (v9 >= 0.0)
      v10 = v7;
    else
      v10 = 0.0;
    -[UIKeyboardLayoutStar setSplitProgress:](self, "setSplitProgress:", v10 * v10);
    if (vabdd_f64(v10, self->_finalSplitProgress) < 0.01)
    {
      -[CADisplayLink invalidate](self->_displayLink, "invalidate");
      displayLink = self->_displayLink;
      self->_displayLink = 0;

      -[UIKeyboardLayoutStar finishSplitTransition](self, "finishSplitTransition");
    }
    self->_autoSplitLastUpdate = v5;
  }
}

- (void)setSplit:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  CADisplayLink *displayLink;
  CADisplayLink *v8;
  double v9;
  double v10;
  void *v11;
  CADisplayLink *v12;
  CADisplayLink *v13;
  CADisplayLink *v14;
  void *v15;

  v4 = a4;
  v5 = a3;
  if (-[UIKBScreenTraits supportsSplit](self->super._screenTraits, "supportsSplit"))
  {
    displayLink = self->_displayLink;
    if (displayLink)
    {
      -[CADisplayLink invalidate](displayLink, "invalidate");
      v8 = self->_displayLink;
      self->_displayLink = 0;

    }
    v9 = 0.0;
    if (v5)
      v10 = 1.0;
    else
      v10 = 0.0;
    self->_finalSplitProgress = v10;
    if (!v5)
      v9 = 1.0;
    self->_initialSplitProgress = v9;
    if (v4)
    {
      -[UIKBScreenTraits screen](self->super._screenTraits, "screen");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "displayLinkWithTarget:selector:", self, sel__autoSplit_);
      v12 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
      v13 = self->_displayLink;
      self->_displayLink = v12;

      v14 = self->_displayLink;
      objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[CADisplayLink addToRunLoop:forMode:](v14, "addToRunLoop:forMode:", v15, *MEMORY[0x1E0C99860]);

      self->_autoSplitLastUpdate = CACurrentMediaTime();
      self->_autoSplitElapsedTime = 0.0;
      -[UIKeyboardLayoutStar setSplitProgress:](self, "setSplitProgress:", self->_initialSplitProgress);
    }
    else
    {
      -[UIKeyboardLayoutStar finishSplitTransitionWithProgress:](self, "finishSplitTransitionWithProgress:", self->_finalSplitProgress);
    }
  }
}

- (void)prepareForFloatingTransition:(BOOL)a3
{
  if (a3)
  {
    -[UIKeyboardLayoutStar flushKeyCache:](self, "flushKeyCache:", 0);
    -[UIKeyboardLayoutStar deactivateActiveKeys](self, "deactivateActiveKeys");
    -[UIKeyboardLayout setShiftKeyTouchUUID:](self, "setShiftKeyTouchUUID:", 0);
    -[UIView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
  }
  else
  {
    -[UIView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 1);
    -[UIKeyboardLayout updateTouchProcessingForKeyplaneChange](self, "updateTouchProcessingForKeyplaneChange");
    -[UIKeyboardLayout resetTouchProcessingForKeyboardChange](self, "resetTouchProcessingForKeyboardChange");
    if (-[UIKeyboardLayoutStar useCrescendoLayout](self, "useCrescendoLayout"))
    {
      -[TUIKeyplaneView transitionToKeyplane:](self->_liveKeyplaneView, "transitionToKeyplane:", self->_keyplane);
      -[UIKeyboardLayoutStar updateAllKeyStates](self, "updateAllKeyStates");
    }
  }
}

- (BOOL)_handleTouchForEmojiInputView
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  BOOL v9;

  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentInputMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "normalizedIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("emoji")))
  {
    -[UIKBTree frame](self->_keyplane, "frame");
    v7 = v6;
    -[UIKBScreenTraits keyboardWidth](self->super._screenTraits, "keyboardWidth");
    v9 = v7 < v8;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (CGRect)_paddedKeyUnionFrame
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double x;
  double y;
  double width;
  CGFloat height;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect result;
  CGRect v42;

  -[UIView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIKeyboardLayoutStar hitBuffer](self, "hitBuffer");
  v12 = -v11;
  v35.origin.x = v4;
  v35.origin.y = v6;
  v35.size.width = v8;
  v35.size.height = v10;
  v36 = CGRectInset(v35, 0.0, v12);
  x = v36.origin.x;
  y = v36.origin.y;
  width = v36.size.width;
  height = v36.size.height;
  if (-[UIKeyboardLayoutStar _handleTouchForEmojiInputView](self, "_handleTouchForEmojiInputView"))
  {
    -[UIKBScreenTraits keyboardWidth](self->super._screenTraits, "keyboardWidth");
    v18 = (width - v17) * 0.5;
    v37.origin.x = x;
    v37.origin.y = y;
    v37.size.width = width;
    v37.size.height = height;
    v38 = CGRectInset(v37, v18, 0.0);
    x = v38.origin.x;
    y = v38.origin.y;
    width = v38.size.width;
    height = v38.size.height;
  }
  if (-[UIKeyboardLayoutStar currentHandBias](self, "currentHandBias")
    && !-[UIKeyboardLayoutStar useCrescendoLayout](self, "useCrescendoLayout"))
  {
    -[UIKBTree keyUnionFrame](self->_keyplane, "keyUnionFrame");
    height = v19;
    x = v20 + -25.0;
    width = v21 + 50.0;
    y = v22 + 0.0;
  }
  -[UIKeyboardLayoutStar activeKey](self, "activeKey");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "state");

  if (v24 == 16)
  {
    -[UIKeyboardLayoutStar activeKey](self, "activeKey");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardLayoutStar viewForKey:](self, "viewForKey:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "bounds");
    -[UIView convertRect:fromView:](self, "convertRect:fromView:", v26);
    v42.origin.x = v27;
    v42.origin.y = v28;
    v42.size.width = v29;
    v42.size.height = v30;
    v39.origin.x = x;
    v39.origin.y = y;
    v39.size.width = width;
    v39.size.height = height;
    v40 = CGRectUnion(v39, v42);
    x = v40.origin.x;
    y = v40.origin.y;
    width = v40.size.width;
    height = v40.size.height;

  }
  v31 = x;
  v32 = y;
  v33 = width;
  v34 = height;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

- (double)hitBuffer
{
  double v3;
  double v4;
  double v5;
  double result;
  float v7;

  -[UIKBScreenTraits keyboardBarHeight](self->super._screenTraits, "keyboardBarHeight");
  v4 = v3;
  v5 = CFAbsoluteTimeGetCurrent() - self->_prevTouchDownTime;
  result = 0.0;
  if (v5 < 0.35)
  {
    result = v4 * 0.6;
    if (v5 >= 0.2)
    {
      v7 = (0.35 - v5) / 0.15;
      return result * v7;
    }
  }
  return result;
}

- (BOOL)_pointAllowedInStaticHitBuffer:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat width;
  CGFloat height;
  CGRect v24;
  CGRect v25;

  y = a3.y;
  x = a3.x;
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentInputMode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIKeyboardLayout sizeDelegate](self, "sizeDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deviceSpecificStaticHitBufferForInterfaceOrientation:inputMode:", -[UIKeyboardLayout orientation](self, "orientation"), v7);
  v10 = v9;

  if (v10 <= 0.00000011920929)
    goto LABEL_7;
  -[UIView bounds](self, "bounds");
  v12 = v11 - v10;
  if (-[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 1
    || -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 24
    || -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 25
    || -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 26)
  {
    if (y <= v12)
    {
LABEL_7:
      v13 = 1;
      goto LABEL_8;
    }
  }
  else if (-[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") != 23 || y <= v12)
  {
    goto LABEL_7;
  }
  -[UIKBTree name](self->_keyboard, "name");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "_containsSubstring:", CFSTR("Kana"));

  if ((v17 & 1) != 0)
  {
    v13 = 0;
  }
  else
  {
    -[UIKBTree firstCachedKeyWithName:](self->_keyplane, "firstCachedKeyWithName:", CFSTR("Space-Key"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      objc_msgSend(v18, "paddedFrame");
      v20 = v24.origin.x;
      v21 = v24.origin.y;
      width = v24.size.width;
      height = v24.size.height;
      if (x <= CGRectGetMinX(v24))
      {
        v13 = 0;
      }
      else
      {
        v25.origin.x = v20;
        v25.origin.y = v21;
        v25.size.width = width;
        v25.size.height = height;
        v13 = x < CGRectGetMaxX(v25);
      }
    }
    else
    {
      v13 = 1;
    }

  }
LABEL_8:

  return v13;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  return -[UIKeyboardLayoutStar pointInside:forEvent:](self, "pointInside:forEvent:", objc_msgSend(a4, "_gsEvent"), a3.x, a3.y);
}

- (BOOL)pointInside:(CGPoint)a3 forEvent:(__GSEvent *)a4
{
  double y;
  double x;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  void *v17;
  double Current;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  double v28;
  double v29;
  CGFloat v30;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  BOOL v35;
  double v36;
  char v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  double v49;
  double v50;
  double v51;
  CGFloat v52;
  void *v53;
  void *v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  CGFloat rect;
  CGPoint v63;
  CGPoint v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;

  y = a3.y;
  x = a3.x;
  if (!-[UIKeyboardLayoutStar _pointAllowedInStaticHitBuffer:](self, "_pointAllowedInStaticHitBuffer:", a4))
    goto LABEL_10;
  -[UIView bounds](self, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[UIKeyboardLayoutStar hitBuffer](self, "hitBuffer");
  v16 = -v15;
  v65.origin.x = v8;
  v65.origin.y = v10;
  v65.size.width = v12;
  v65.size.height = v14;
  v66 = CGRectInset(v65, 0.0, v16);
  v63.x = x;
  v63.y = y;
  if (CGRectContainsPoint(v66, v63))
  {
    if (-[UIKBTree isSplit](self->_keyplane, "isSplit"))
    {
      -[UIKeyboardLayoutStar keyViewHitTestForPoint:](self, "keyViewHitTestForPoint:", x, y);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
        Current = CFAbsoluteTimeGetCurrent();
        -[UIKeyboardLayoutStar lastTouchUpTimestamp](self, "lastTouchUpTimestamp");
        if (Current - v19 > 0.25)
        {
          -[UIKeyboardLayoutStar frameForKeylayoutName:](self, "frameForKeylayoutName:", CFSTR("split-left"));
          v21 = v20;
          v23 = v22;
          v25 = v24;
          v27 = v26;
          -[UIKeyboardLayoutStar frameForKeylayoutName:](self, "frameForKeylayoutName:", CFSTR("split-right"));
          rect = v28;
          v30 = v29;
          v32 = v31;
          v34 = v33;
          v67.origin.x = v21;
          v67.origin.y = v23;
          v67.size.width = v25;
          v67.size.height = v27;
          if (!CGRectIsEmpty(v67))
          {
            v68.origin.x = rect;
            v68.origin.y = v30;
            v68.size.width = v32;
            v68.size.height = v34;
            v35 = 1;
            if (!CGRectIsEmpty(v68) && x >= v25 + 24.0)
            {
              -[UIView frame](self, "frame");
              return x > v36 - v32 + -24.0;
            }
            return v35;
          }
        }
      }
      return 1;
    }
    if (-[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 1
      || -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 24
      || -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 25
      || -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 26
      || -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 23)
    {
      +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "preferencesActions");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "rivenSizeFactor:", 1.0);
      v58 = v57;

      if (v58 > 1.0)
      {
        -[UIView bounds](self, "bounds");
        v60 = (v59 - y) * 0.03125;
        if (x * 0.0625 + v60 <= 1.0)
          return 0;
        -[UIView bounds](self, "bounds");
        return v60 + (v61 - x) * 0.0625 > 1.0;
      }
    }
    v37 = 1;
  }
  else
  {
LABEL_10:
    v37 = 0;
  }
  if (-[UIKeyboardLayoutStar _handleTouchForEmojiInputView](self, "_handleTouchForEmojiInputView")
    && (-[UIKBTree firstCachedKeyWithName:](self->_keyplane, "firstCachedKeyWithName:", CFSTR("Emoji-InputView-Key")),
        v38 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v38, "frame"),
        v40 = v39,
        v38,
        y < v40))
  {
    -[UIView bounds](self, "bounds");
    v42 = v41;
    v44 = v43;
    v46 = v45;
    v48 = v47;
    -[UIKBTree frame](self->_keyplane, "frame");
    v50 = v49;
    -[UIKBScreenTraits keyboardWidth](self->super._screenTraits, "keyboardWidth");
    v52 = (v50 - v51) * 0.5;
    v69.origin.x = v42;
    v69.origin.y = v44;
    v69.size.width = v46;
    v69.size.height = v48;
    v70 = CGRectInset(v69, v52, 0.0);
    v64.x = x;
    v64.y = y;
    v35 = CGRectContainsPoint(v70, v64);
    -[UIKeyboardLayoutStar keyViewHitTestForPoint:](self, "keyViewHitTestForPoint:", x, y);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (v53)
      v35 = 1;
  }
  else
  {
    -[UIKeyboardLayoutStar keyViewHitTestForPoint:](self, "keyViewHitTestForPoint:", x, y);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (v53)
      v35 = 1;
    else
      v35 = v37;
  }

  return v35;
}

- (void)touchDown:(id)a3 executionContext:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  _BOOL4 v20;
  _BOOL4 v21;
  void *v22;
  _BOOL4 v23;
  CFAbsoluteTime Current;
  double v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  BOOL v34;
  double v35;
  id v36;
  void *v37;
  _QWORD v38[5];
  id v39;
  SEL v40;
  _QWORD v41[5];
  id v42;
  CGPoint v43;
  CGRect v44;

  v7 = a3;
  v8 = a4;
  -[UIKeyboardLayoutStar activeKey](self, "activeKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[UIKeyboardLayoutStar activeKey](self, "activeKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardLayoutStar touchInfoForKey:](self, "touchInfoForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "delayed")
      && !self->_didLongPress
      && objc_msgSend(v11, "continuousPathState") == 1)
    {
      objc_msgSend(v11, "setDelayed:", 0);
      objc_msgSend(v11, "key");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[UIKeyboardLayoutStar downActionFlagsForKey:](self, "downActionFlagsForKey:", v12);

      -[UIKeyboardLayoutStar _transitionToContinuousPathState:forTouchInfo:](self, "_transitionToContinuousPathState:forTouchInfo:", 6, v11);
      objc_msgSend(v11, "key");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __51__UIKeyboardLayoutStar_touchDown_executionContext___block_invoke;
      v41[3] = &unk_1E16BB0D8;
      v41[4] = self;
      v42 = v7;
      objc_msgSend(v8, "childWithContinuation:", v41);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardLayoutStar completeCommitTouchesPrecedingTouchDownWithKey:withActions:executionContext:](self, "completeCommitTouchesPrecedingTouchDownWithKey:withActions:executionContext:", v14, v13, v15);

LABEL_34:
      goto LABEL_35;
    }

  }
  objc_msgSend(v7, "locationInView:", self);
  v17 = v16;
  v19 = v18;
  v20 = -[UIKeyboardLayoutStar pointInside:forEvent:](self, "pointInside:forEvent:", 0);
  -[UIKeyboardLayoutStar _paddedKeyUnionFrame](self, "_paddedKeyUnionFrame");
  v43.x = v17;
  v43.y = v19;
  v21 = CGRectContainsPoint(v44, v43);
  -[UIKeyboardLayoutStar modalDisplayView](self, "modalDisplayView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = -[UIKeyboardLayoutStar hasActiveContinuousPathInput](self, "hasActiveContinuousPathInput");
  if (v20 && v21 && !v22 && !v23)
  {
    Current = CFAbsoluteTimeGetCurrent();
    -[UIKeyboardLayoutStar lastTwoFingerTapTimestamp](self, "lastTwoFingerTapTimestamp");
    v26 = Current - v25;
    if (v26 >= 0.3 || v26 <= 0.0)
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "forceShiftUpdateIfKeyboardStateChanged");
      v27 = -[NSMutableDictionary count](self->_extendedTouchInfoMap, "count");
      if (+[UIKeyboardImpl rivenPreference](UIKeyboardImpl, "rivenPreference"))
      {
        if (-[UIKeyboardLayoutStar getHandRestRecognizerState](self, "getHandRestRecognizerState"))
        {
          v28 = 0;
        }
        else
        {
          v29 = Current - self->_prevTouchDownTime;
          if (v27 && v29 < 0.05)
            v28 = 2;
          else
            v28 = v29 >= 0.5;
        }
        -[UIKeyboardLayoutStar setPlayKeyClickSoundOn:](self, "setPlayKeyClickSoundOn:", v28);
      }
      self->_prevTouchDownTime = Current;
      self->_hasPeekedGestureKey = 0;
      -[UIKeyboardLayoutStar generateInfoForTouch:](self, "generateInfoForTouch:", v7);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setKeyplane:", self->_keyplane);
      objc_msgSend(v30, "setInitialPoint:", v17, v19);
      objc_msgSend(v7, "touchUUID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setFingerID:", -[UIKeyboardLayout fingerIDForTouchUUID:](self, "fingerIDForTouchUUID:", v31));

      objc_msgSend(v30, "setContinuousPathState:", 0);
      if ((-[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 1
         || -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 24
         || -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 25
         || -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 26
         || -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 23)
        && -[UIKeyboardLayout isFloating](self, "isFloating"))
      {
        -[UIKeyboardLayout currentTouchDownEvent](self, "currentTouchDownEvent");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "allTouches");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = (unint64_t)objc_msgSend(v33, "count") > 1;

      }
      else
      {
        v34 = 0;
      }
      if (-[UIKeyboardLayoutStar _allowContinuousPathUI](self, "_allowContinuousPathUI") && !v34)
      {
        objc_msgSend(v7, "timestamp");
        -[UIKeyboardLayoutStar addContinuousPathPoint:withTimestamp:](self, "addContinuousPathPoint:withTimestamp:", v17, v19, v35);
      }
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __51__UIKeyboardLayoutStar_touchDown_executionContext___block_invoke_2;
      v38[3] = &unk_1E16BB820;
      v39 = v30;
      v40 = a2;
      v38[4] = self;
      v36 = v30;
      objc_msgSend(v8, "childWithContinuation:", v38);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardLayoutStar performHitTestForTouchInfo:touchStage:executionContextPassingUIKBTree:](self, "performHitTestForTouchInfo:touchStage:executionContextPassingUIKBTree:", v36, 0, v37);

      goto LABEL_34;
    }
  }
  objc_msgSend(v8, "returnExecutionToParent");
LABEL_35:

}

uint64_t __51__UIKeyboardLayoutStar_touchDown_executionContext___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "touchDown:executionContext:", *(_QWORD *)(a1 + 40), a2);
}

void __51__UIKeyboardLayoutStar_touchDown_executionContext___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(v12, "info");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    objc_msgSend(v12, "info");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 48);
      v9 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v12, "info");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, CFSTR("UIKeyboardLayoutStar.m"), 7797, CFSTR("UIKeyboardTask %s expected UIKBTree but received %@"), "-[UIKeyboardLayoutStar touchDown:executionContext:]_block_invoke_2", v10);

    }
  }
  objc_msgSend(v12, "info");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setKey:", v11);
  objc_msgSend(*(id *)(a1 + 40), "setInitialKeyState:", objc_msgSend(v11, "state"));
  objc_msgSend(*(id *)(a1 + 32), "completeHitTestForTouchDown:executionContext:", *(_QWORD *)(a1 + 40), v12);

}

- (void)completeHitTestForTouchDown:(id)a3 executionContext:(id)a4
{
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  int *v22;
  double *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NSTimer *flickPopuptimer;
  NSTimer *v37;
  id touchInfo;
  UIView *flickPopupView;
  UIView *v40;
  void *v41;
  void *v42;
  void *v43;
  NSTimer *v44;
  NSTimer *v45;
  id v46;
  CGRect v47;
  CGRect v48;

  v46 = a3;
  v7 = a4;
  objc_msgSend(v46, "touch");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "initialPoint");
  v10 = v9;
  v12 = v11;
  objc_msgSend(v46, "key");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "frame");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v22 = &OBJC_IVAR___UIKeyboardLayoutStar__leftDriftOffset;
  if ((-[NSMutableSet containsObject:](self->_leftKeySet, "containsObject:", v13) & 1) != 0
    || (v22 = &OBJC_IVAR___UIKeyboardLayoutStar__rightDriftOffset,
        -[NSMutableSet containsObject:](self->_rightKeySet, "containsObject:", v13)))
  {
    v23 = (double *)((char *)self + *v22);
  }
  else
  {
    v23 = (double *)MEMORY[0x1E0C9D538];
  }
  v24 = *v23;
  v25 = v23[1];
  v47.origin.x = v15;
  v47.origin.y = v17;
  v47.size.width = v19;
  v47.size.height = v21;
  v26 = v10 - CGRectGetMidX(v47) - v24;
  v48.origin.x = v15;
  v48.origin.y = v17;
  v48.size.width = v19;
  v48.size.height = v21;
  v27 = v12 - CGRectGetMidY(v48) - v25;
  if (-[UIKeyboardLayout supportsVirtualDrift](self, "supportsVirtualDrift"))
  {
    -[UIKeyboardLayoutStar handRestRecognizerGetHomeRowHint](self, "handRestRecognizerGetHomeRowHint");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28
      && (objc_msgSend(v13, "interactionType") == 1
       || objc_msgSend(v13, "interactionType") == 2))
    {
      -[UIKeyboardLayout _updateTouchState:errorVector:rowOffsetFromHomeRow:](self, "_updateTouchState:errorVector:rowOffsetFromHomeRow:", v8, (int)objc_msgSend(v13, "displayRowHint") - objc_msgSend(v28, "integerValue"), v26, v27);
    }
    else
    {
      -[UIKeyboardLayout _ignoreTouchState:](self, "_ignoreTouchState:", v8);
    }

  }
  else if (-[UIKeyboardLayout isReachableDevice](self, "isReachableDevice"))
  {
    -[UIKeyboardLayoutStar calculateReachabilityScoreWithKey:keyError:](self, "calculateReachabilityScoreWithKey:keyError:", v13, v26, v27);
  }
  if (self->_lastInputIsGestureKey)
  {
    if (objc_msgSend(v13, "interactionType") != 4)
      +[_UIKeyboardUsageTracking panAlternateKeyFlickDownCount](_UIKeyboardUsageTracking, "panAlternateKeyFlickDownCount");
    self->_lastInputIsGestureKey = 0;
  }
  if (objc_msgSend(v13, "state") == 1)
    goto LABEL_28;
  -[UIKeyboardLayoutStar activeKey](self, "activeKey");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "parentKey");
  v30 = objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    v31 = (void *)v30;
    -[UIKeyboardLayoutStar activeKey](self, "activeKey");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32 != v13)
    {
      -[UIKeyboardLayoutStar deactivateActiveKey](self, "deactivateActiveKey");
      objc_msgSend(v13, "parentKey");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
        goto LABEL_28;
    }
  }
  else
  {

  }
  -[UIKeyboardLayoutStar activeKey](self, "activeKey");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIKeyboardLayoutStar setActiveKey:](self, "setActiveKey:", v13);
  self->_didLongPress = 0;
  if (!v13)
  {
LABEL_28:
    -[UIKeyboardLayoutStar clearInfoForTouch:](self, "clearInfoForTouch:", v8);
    objc_msgSend(v7, "returnExecutionToParent");
    goto LABEL_42;
  }
  objc_msgSend(v46, "setInitialDragPoint:", v10, v12);
  if (-[UIKeyboardLayoutStar _allowContinuousPathUI](self, "_allowContinuousPathUI")
    && -[UIKeyboardLayoutStar _allowStartingContinuousPathForTouchInfo:alreadyActiveKeyExisting:](self, "_allowStartingContinuousPathForTouchInfo:alreadyActiveKeyExisting:", v46, v34 != 0))
  {
    v35 = 1;
  }
  else
  {
    v35 = 2;
  }
  -[UIKeyboardLayoutStar _transitionToContinuousPathState:forTouchInfo:](self, "_transitionToContinuousPathState:forTouchInfo:", v35, v46);
  -[UIKeyboardPinchGestureRecognizer resetPinchCalculations](self->_pinchGestureRecognizer, "resetPinchCalculations");
  if (objc_msgSend(v13, "interactionType") == 16
    && -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") != 3)
  {
    objc_msgSend(v13, "setFlickDirection:", -3);
    self->_isOutOfBounds = 0;
    -[UIKeyboardLayoutStar setState:forKey:](self, "setState:forKey:", 2, v13);
    -[UIKeyboardLayoutStar setKeyboardDim:](self, "setKeyboardDim:", 0);
    flickPopuptimer = self->_flickPopuptimer;
    if (flickPopuptimer)
    {
      -[NSTimer invalidate](flickPopuptimer, "invalidate");
      v37 = self->_flickPopuptimer;
      self->_flickPopuptimer = 0;

    }
    touchInfo = self->_touchInfo;
    if (touchInfo)
    {
      self->_touchInfo = 0;

    }
    flickPopupView = self->_flickPopupView;
    if (flickPopupView)
    {
      -[UIView removeFromSuperview](flickPopupView, "removeFromSuperview");
      v40 = self->_flickPopupView;
      self->_flickPopupView = 0;

      -[UIKeyboardLayoutStar setKeyboardDim:](self, "setKeyboardDim:", 0);
    }
    objc_msgSend(v13, "displayString");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardLayoutStar flickPopupStringForKey:withString:](self, "flickPopupStringForKey:withString:", v13, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    getFlickPopupInfoArray(v42, CFSTR("Keycaps"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (v43)
    {
      objc_storeStrong(&self->_touchInfo, a3);
      objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_handlePopupView_, 0, 0, 0.375);
      v44 = (NSTimer *)objc_claimAutoreleasedReturnValue();
      v45 = self->_flickPopuptimer;
      self->_flickPopuptimer = v44;

    }
  }
  -[UIKeyboardLayoutStar touchDownWithKey:withTouchInfo:atPoint:executionContext:](self, "touchDownWithKey:withTouchInfo:atPoint:executionContext:", v13, v46, v7, v10, v12);
LABEL_42:

}

- (void)playKeyReleaseSoundForKey:(id)a3
{
  id v4;
  double MidX;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double MidY;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  CGRect v19;
  CGRect v20;

  v4 = a3;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  MidX = CGRectGetMidX(v19);
  objc_msgSend(v4, "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v20.origin.x = v7;
  v20.origin.y = v9;
  v20.size.width = v11;
  v20.size.height = v13;
  MidY = CGRectGetMidY(v20);
  LODWORD(self) = -[UIKeyboardLayoutStar hasActiveContinuousPathInput](self, "hasActiveContinuousPathInput");
  objc_msgSend(v18, "feedbackGenerator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if ((_DWORD)self)
    v17 = 9;
  else
    v17 = 8;
  objc_msgSend(v15, "actionOccurred:atLocation:", v17, MidX, MidY);

}

- (void)playKeyClickSoundForKey:(id)a3
{
  id v4;
  UIKBScreenTraits *screenTraits;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  double MidX;
  id v11;
  CGRect v12;
  CGRect v13;

  v4 = a3;
  screenTraits = self->super._screenTraits;
  if (!screenTraits || !screenTraits->_isFirstPartyStickers)
  {
    v11 = v4;
    if (-[UIKeyboardLayoutStar muteNextKeyClickSound](self, "muteNextKeyClickSound"))
    {
      -[UIKeyboardLayoutStar setMuteNextKeyClickSound:](self, "setMuteNextKeyClickSound:", 0);
LABEL_23:
      v4 = v11;
      goto LABEL_24;
    }
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 3)
    {
      +[UIDevice currentDevice](UIDevice, "currentDevice");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_playSystemSound:", 1123);
LABEL_21:

      goto LABEL_22;
    }
    if (objc_msgSend(v11, "interactionType") == 4)
    {
LABEL_22:

      goto LABEL_23;
    }
    v8 = objc_msgSend(v11, "interactionType");
    v9 = 1;
    if (v8 > 8)
    {
      if (v8 == 9)
      {
        v9 = 6;
        goto LABEL_18;
      }
      if (v8 == 15)
      {
        v9 = 2;
        goto LABEL_18;
      }
      if (v8 != 16)
        goto LABEL_15;
    }
    else if ((v8 - 1) >= 2)
    {
      if (v8 == 4)
      {
        v9 = 3;
        goto LABEL_18;
      }
LABEL_15:
      v9 = 7;
    }
LABEL_18:
    if (-[UITextInputTraits isSecureTextEntry](self->super._inputTraits, "isSecureTextEntry"))
      v9 = 1;
    objc_msgSend(v6, "feedbackGenerator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "frame");
    MidX = CGRectGetMidX(v12);
    objc_msgSend(v11, "frame");
    objc_msgSend(v7, "actionOccurred:atLocation:", v9, MidX, CGRectGetMidY(v13));
    goto LABEL_21;
  }
LABEL_24:

}

- (void)playKeyClickSoundOnDownForKey:(id)a3
{
  id v4;

  v4 = a3;
  if (-[UIKeyboardLayoutStar playKeyClickSoundOn](self, "playKeyClickSoundOn") != 2)
    -[UIKeyboardLayoutStar playKeyClickSoundForKey:](self, "playKeyClickSoundForKey:", v4);

}

- (BOOL)shouldSkipResponseToGlobeKey:(id)a3 atPoint:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint v16;
  CGRect v17;

  y = a4.y;
  x = a4.x;
  -[UIKeyboardLayoutStar viewForKey:](self, "viewForKey:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v17.origin.x = v8 + v12 * 0.15;
  v17.size.width = v12 + v12 * -0.4;
  v17.origin.y = v10 + v14 * 0.15;
  v17.size.height = v14 - v14 * 0.15;
  v16.x = x;
  v16.y = y;
  return !CGRectContainsPoint(v17, v16);
}

- (BOOL)isKeyScriptSwitchKey:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  if (objc_msgSend(v3, "interactionType") == 9)
  {
    objc_msgSend(v3, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hasSuffix:", CFSTR("Switch-Key"));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_cleanUpBlinkAssertionIfNecessary
{
  void *v3;

  -[UIKeyboardLayoutStar blinkAssertion](self, "blinkAssertion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[UIKeyboardLayoutStar setBlinkAssertion:](self, "setBlinkAssertion:", 0);
}

- (void)touchDownWithKey:(id)a3 withTouchInfo:(id)a4 atPoint:(CGPoint)a5 executionContext:(id)a6
{
  double y;
  double x;
  id v11;
  id v12;
  id v13;
  double v14;
  void *v15;
  unsigned int v16;
  double v17;
  dispatch_time_t v18;
  NSObject *v19;
  id v20;
  int v21;
  void *v22;
  void *v23;
  uint64_t v24;
  BOOL v26;
  _BOOL4 v27;
  _BOOL4 v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  void *v41;
  void *v42;
  unint64_t v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  BOOL v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t j;
  void *v58;
  void *v59;
  void *v60;
  int v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  UIKBTree *v67;
  UIKBTree *v68;
  void *v69;
  id v70;
  void *v71;
  UIKBTree *multitapKey;
  void *v73;
  _BOOL4 unshiftAfterMultitap;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  unint64_t v87;
  void *v88;
  _QWORD v89[5];
  id v90;
  unint64_t v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  _QWORD block[5];
  id v101;
  _BYTE v102[128];
  _BYTE v103[128];
  uint64_t v104;

  y = a5.y;
  x = a5.x;
  v104 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = CFAbsoluteTimeGetCurrent() - self->_prevTouchUpTime;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "forceShiftUpdateIfKeyboardStateChanged");
  objc_msgSend(v11, "representedString");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v11, "interactionType");
  v87 = -[UIKeyboardLayoutStar downActionFlagsForKey:](self, "downActionFlagsForKey:", v11);
  if (v16 == 5)
  {
    if (!-[UIKBScreenTraits idiom](self->super._screenTraits, "idiom")
      && +[UIDictationController usingServerManualEndpointingThreshold](UIDictationController, "usingServerManualEndpointingThreshold"))
    {
      self->_dictationUsingServerManualEndpointing = 1;
      +[UIDictationController serverManualEndpointingThreshold](UIDictationController, "serverManualEndpointingThreshold");
      v18 = dispatch_time(0, (uint64_t)(v17 * 1000000000.0));
      v19 = MEMORY[0x1E0C80D38];
      v20 = MEMORY[0x1E0C80D38];
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __80__UIKeyboardLayoutStar_touchDownWithKey_withTouchInfo_atPoint_executionContext___block_invoke;
      block[3] = &unk_1E16B1B50;
      block[4] = self;
      v101 = v11;
      dispatch_after(v18, v19, block);

    }
    objc_msgSend(v15, "touchLongPressTimerWithDelay:", 0.25);
  }
  else
  {
    objc_msgSend(v15, "touchLongPressTimer");
    v21 = objc_msgSend(v11, "interactionType");
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v21 == 4)
      v24 = 6;
    else
      v24 = 0;
    objc_msgSend(v22, "updateIdleDetection:", v24);

  }
  v26 = v14 >= 0.5 || v16 > 0x11 || ((1 << v16) & 0x21040) == 0;
  if (!v26)
    goto LABEL_27;
  v27 = -[UIKeyboardLayoutStar isKeyScriptSwitchKey:](self, "isKeyScriptSwitchKey:", v11);
  v28 = v27;
  if (v16 != 9 || v27)
  {
    if (v16 == 38)
      goto LABEL_26;
  }
  else
  {
    if (v14 < 0.325
      && -[UIKeyboardLayoutStar shouldSkipResponseToGlobeKey:atPoint:](self, "shouldSkipResponseToGlobeKey:atPoint:", v11, x, y))
    {
      goto LABEL_27;
    }
    objc_msgSend(v15, "clearLongPressTimer");
    objc_msgSend(v15, "touchLongPressTimerWithDelay:", 0.3);
  }
  if (!v28 || -[UIKeyboardLayoutStar is10KeyRendering](self, "is10KeyRendering"))
  {
LABEL_29:
    if (objc_msgSend(v12, "delayed"))
    {
      objc_msgSend(v15, "clearLongPressTimer");
      objc_msgSend(v15, "touchLongPressTimerWithDelay:", 0.08);
    }
    if (v16 == 15)
      objc_msgSend(v15, "clearLanguageIndicator");
    -[UIKBTree firstCachedKeyWithName:](self->_keyplane, "firstCachedKeyWithName:", CFSTR("International-Key"));
    v29 = objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      +[UIInputSwitcherView activeInstance](UIInputSwitcherView, "activeInstance");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "hide");

      if ((id)v29 != v11)
      {
        -[UIKeyboardLayoutStar touchInfoForKey:](self, "touchInfoForKey:", v29);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setMaySuppressUpAction:", 1);

      }
    }
    v86 = (void *)v29;
    if (objc_msgSend(v11, "interactionType") == 28
      || objc_msgSend(v11, "interactionType") == 29
      || objc_msgSend(v11, "interactionType") == 30)
    {
      if (objc_msgSend(v11, "interactionType") == 28
        && -[UIKBTextEditingTraits canToggleBoldface](self->super._textEditingTraits, "canToggleBoldface"))
      {
        v32 = v15;
        objc_msgSend(v15, "delegateAsResponder");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "_responderForEditing");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "toggleBoldface:", 0);
LABEL_48:

        v15 = v32;
        goto LABEL_49;
      }
      if (objc_msgSend(v11, "interactionType") == 29
        && -[UIKBTextEditingTraits canToggleItalics](self->super._textEditingTraits, "canToggleItalics"))
      {
        v32 = v15;
        objc_msgSend(v15, "delegateAsResponder");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "_responderForEditing");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "toggleItalics:", 0);
        goto LABEL_48;
      }
      if (objc_msgSend(v11, "interactionType") == 30
        && -[UIKBTextEditingTraits canToggleUnderline](self->super._textEditingTraits, "canToggleUnderline"))
      {
        v32 = v15;
        objc_msgSend(v15, "delegateAsResponder");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "_responderForEditing");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "toggleUnderline:", 0);
        goto LABEL_48;
      }
    }
LABEL_49:
    if ((v87 & 1) != 0
      && (objc_msgSend(v11, "interactionType") == 31
       || objc_msgSend(v11, "interactionType") == 32
       || objc_msgSend(v11, "interactionType") == 33
       || objc_msgSend(v11, "interactionType") == 34
       || objc_msgSend(v11, "interactionType") == 35))
    {
      if (objc_msgSend(v11, "interactionType") == 31)
      {
        objc_msgSend(v15, "cutOperation");
        if (!-[UIKBTextEditingTraits canCut](self->super._textEditingTraits, "canCut"))
          goto LABEL_64;
LABEL_63:
        -[UIKeyboardLayoutStar setState:forKey:](self, "setState:forKey:", 4, v11);
        goto LABEL_64;
      }
      if (objc_msgSend(v11, "interactionType") == 32)
      {
        objc_msgSend(v15, "copyOperation");
        if (-[UIKBTextEditingTraits canCopy](self->super._textEditingTraits, "canCopy"))
          goto LABEL_63;
      }
      else
      {
        if (objc_msgSend(v11, "interactionType") == 33)
        {
          objc_msgSend(v15, "pasteOperation");
          if (!-[UIKBTextEditingTraits canPaste](self->super._textEditingTraits, "canPaste"))
            goto LABEL_64;
          goto LABEL_63;
        }
        if (objc_msgSend(v11, "interactionType") == 34
          && -[UIKBTextEditingTraits canMoveCursorLeft](self->super._textEditingTraits, "canMoveCursorLeft"))
        {
          objc_msgSend(v15, "moveCursorLeftShifted:", objc_msgSend(v15, "isShiftLocked"));
          if (-[UIKBTextEditingTraits canMoveCursorLeft](self->super._textEditingTraits, "canMoveCursorLeft"))
            goto LABEL_63;
        }
        else if (objc_msgSend(v11, "interactionType") == 35)
        {
          if (-[UIKBTextEditingTraits canMoveCursorRight](self->super._textEditingTraits, "canMoveCursorRight"))
          {
            objc_msgSend(v15, "moveCursorRightShifted:", objc_msgSend(v15, "isShiftLocked"));
            if (-[UIKBTextEditingTraits canMoveCursorRight](self->super._textEditingTraits, "canMoveCursorRight"))
              goto LABEL_63;
          }
        }
      }
    }
LABEL_64:
    if ((objc_msgSend(v15, "acceptInputString:", v88) & 1) == 0)
    {
      v98 = 0u;
      v99 = 0u;
      v97 = 0u;
      v96 = 0u;
      objc_msgSend(v11, "secondaryRepresentedStrings");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v96, v103, 16);
      if (v36)
      {
        v37 = v36;
        v38 = *(_QWORD *)v97;
        while (2)
        {
          for (i = 0; i != v37; ++i)
          {
            if (*(_QWORD *)v97 != v38)
              objc_enumerationMutation(v35);
            if (objc_msgSend(v15, "acceptInputString:", *(_QWORD *)(*((_QWORD *)&v96 + 1) + 8 * i)))
            {

              goto LABEL_75;
            }
          }
          v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v96, v103, 16);
          if (v37)
            continue;
          break;
        }
      }

      +[UIDevice currentDevice](UIDevice, "currentDevice");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "_playSystemSound:", 1103);

      goto LABEL_90;
    }
LABEL_75:
    if (v16 == 13 && (objc_msgSend(v15, "returnKeyEnabled") & 1) == 0)
    {
LABEL_90:
      objc_msgSend(v13, "returnExecutionToParent");
LABEL_131:

      goto LABEL_132;
    }
    if (!+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled](UITextSelectionDisplayInteraction, "isModernSelectionViewEnabled"))
    {
      -[UIKeyboardLayoutStar _cleanUpBlinkAssertionIfNecessary](self, "_cleanUpBlinkAssertionIfNecessary");
      objc_msgSend(v15, "_activeAssertionController");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "nonBlinkingAssertionWithReason:", CFSTR("Keyboard Key Press"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardLayoutStar setBlinkAssertion:](self, "setBlinkAssertion:", v42);

    }
    objc_msgSend(v15, "setInputPoint:", x, y);
    v43 = v87;
    if ((v87 & 1) != 0 && objc_msgSend(v11, "state") != 1)
    {
      if (-[UIKeyboardLayoutStar preventPaddlesForPointerTouches](self, "preventPaddlesForPointerTouches"))
      {
        -[UIKeyboardLayoutStar keyplaneFactory](self, "keyplaneFactory");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v44, "allowsPaddles");

        if (v45)
        {
          v46 = v15;
          objc_msgSend(v12, "touch");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "touchUUID");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          +[UIKBTouchState touchForTouchUUID:](UIKBTouchState, "touchForTouchUUID:", v48);
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v49, "_isPointerTouch"))
            objc_msgSend(v11, "setPreventPaddle:", 1);

          v15 = v46;
        }
      }
      if (objc_msgSend(v11, "state") == 16
        || objc_msgSend(v11, "state") == 4 && objc_msgSend(v11, "hasSemiStickyVariant"))
      {
        objc_msgSend(v15, "clearLongPressTimer");
        -[UIKeyboardLayoutStar keyplaneFactory](self, "keyplaneFactory");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = objc_msgSend(v50, "popupKeyUsesCustomKeyContentView:", v11);

        if (v51)
        {
          v52 = -[UIKBKeyplaneView retestSelectedVariantIndexForKey:atPoint:phase:](self->_keyplaneView, "retestSelectedVariantIndexForKey:atPoint:phase:", v11, 0, x, y)|| self->_selectedVariantIndexChanged;
          self->_selectedVariantIndexChanged = v52;
        }
        else
        {
          -[UIKeyboardLayoutStar updateSelectedVariantIndexForKey:withActions:withPoint:](self, "updateSelectedVariantIndexForKey:withActions:withPoint:", v11, v87, x, y);
        }
        v66 = 16;
      }
      else
      {
        v94 = 0u;
        v95 = 0u;
        v92 = 0u;
        v93 = 0u;
        -[UIKBKeyplaneView activeKeyViews](self->_keyplaneView, "activeKeyViews", v15, v13, v12, v11, v86);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v92, v102, 16);
        if (v54)
        {
          v55 = v54;
          v56 = *(_QWORD *)v93;
          do
          {
            for (j = 0; j != v55; ++j)
            {
              if (*(_QWORD *)v93 != v56)
                objc_enumerationMutation(v53);
              v58 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * j);
              objc_msgSend(v58, "key");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v59, "name");
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              v61 = objc_msgSend(v60, "isEqual:", CFSTR("EmojiPopupKey"));

              if (v61)
              {
                objc_msgSend(v58, "removeFromSuperview");
              }
              else
              {
                objc_msgSend(v58, "key");
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v62, "state") == 16)
                {
                  objc_msgSend(v58, "key");
                  v63 = (void *)objc_claimAutoreleasedReturnValue();
                  -[UIKeyboardLayoutStar touchInfoForKey:](self, "touchInfoForKey:", v63);
                  v64 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v64)
                  {
                    objc_msgSend(v58, "key");
                    v65 = (void *)objc_claimAutoreleasedReturnValue();
                    -[UIKeyboardLayoutStar setState:forKey:](self, "setState:forKey:", 2, v65);

                  }
                }
                else
                {

                }
              }
            }
            v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v92, v102, 16);
          }
          while (v55);
        }

        v66 = 4;
        v12 = v84;
        v11 = v85;
        v15 = v82;
        v13 = v83;
        v43 = v87;
      }
      -[UIKeyboardLayoutStar setState:forKey:](self, "setState:forKey:", v66, v11);
      -[UIKeyboardLayoutStar setActiveKey:](self, "setActiveKey:", v11);
      if (self->_multitapKey)
      {
        -[UIKeyboardLayoutStar activeKey](self, "activeKey");
        v67 = (UIKBTree *)objc_claimAutoreleasedReturnValue();
        v68 = v67;
        if (v67 == self->_multitapKey)
        {

          goto LABEL_128;
        }
        -[UIKeyboardLayoutStar activeKey](self, "activeKey");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIKeyboardLayoutStar activeMultitapCompleteKey](self, "activeMultitapCompleteKey");
        v70 = v13;
        v71 = (void *)objc_claimAutoreleasedReturnValue();

        v26 = v69 == v71;
        v13 = v70;
        if (v26)
          goto LABEL_128;
        -[UIKeyboardLayoutStar setState:forKey:](self, "setState:forKey:", 2, self->_multitapKey);
        multitapKey = self->_multitapKey;
        self->_multitapKey = 0;

        -[UIKeyboardLayoutStar activeKey](self, "activeKey");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[UIKeyboardLayoutStar isMultitapKey:](self, "isMultitapKey:", v73))
        {
          unshiftAfterMultitap = self->_unshiftAfterMultitap;

          if (!unshiftAfterMultitap)
            goto LABEL_128;
        }
        else
        {

        }
        -[UIKeyboardLayoutStar multitapInterrupted](self, "multitapInterrupted");
      }
    }
LABEL_128:
    -[UIKeyboardLayoutStar playKeyFeedbackIfNecessaryForTouchDownOnKey:touchInfo:](self, "playKeyFeedbackIfNecessaryForTouchDownOnKey:touchInfo:", v11, v12);
    if (-[UIKeyboardLayoutStar shouldCommitPrecedingTouchesForTouchDownWithActions:](self, "shouldCommitPrecedingTouchesForTouchDownWithActions:", v43))
    {
      -[UIKeyboardLayoutStar touchInfoForKey:](self, "touchInfoForKey:", v11);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "touch");
      v76 = v13;
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "touchUUID");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardLayout touchUUIDsToCommitBeforeTouchUUID:](self, "touchUUIDsToCommitBeforeTouchUUID:", v78);
      v79 = (void *)objc_claimAutoreleasedReturnValue();

      +[UIKBTouchState touchesForTouchUUIDs:](UIKBTouchState, "touchesForTouchUUIDs:", v79);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v89[0] = MEMORY[0x1E0C809B0];
      v89[1] = 3221225472;
      v89[2] = __80__UIKeyboardLayoutStar_touchDownWithKey_withTouchInfo_atPoint_executionContext___block_invoke_2;
      v89[3] = &unk_1E16BB820;
      v89[4] = self;
      v90 = v11;
      v91 = v43;
      objc_msgSend(v76, "childWithContinuation:", v89);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardLayout commitTouches:executionContext:](self, "commitTouches:executionContext:", v80, v81);

      v13 = v76;
    }
    else
    {
      -[UIKeyboardLayoutStar completeCommitTouchesPrecedingTouchDownWithKey:withActions:executionContext:](self, "completeCommitTouchesPrecedingTouchDownWithKey:withActions:executionContext:", v11, v43, v13);
    }
    goto LABEL_131;
  }
LABEL_26:
  objc_msgSend(v15, "clearLongPressTimer");
  if (v14 >= 0.5)
  {
    objc_msgSend(v15, "touchLongPressTimerWithDelay:", 0.01);
    goto LABEL_29;
  }
LABEL_27:
  objc_msgSend(v13, "returnExecutionToParent");
LABEL_132:

}

void __80__UIKeyboardLayoutStar_touchDownWithKey_withTouchInfo_atPoint_executionContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 1336))
  {
    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setReasonType:", 7);

    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "touchInfoForKey:", *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "touch");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "touchUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKBTouchState touchForTouchUUID:](UIKBTouchState, "touchForTouchUUID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "switchToDictationInputModeWithTouch:", v6);

  }
}

uint64_t __80__UIKeyboardLayoutStar_touchDownWithKey_withTouchInfo_atPoint_executionContext___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeCommitTouchesPrecedingTouchDownWithKey:withActions:executionContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2);
}

- (BOOL)shouldCommitPrecedingTouchesForTouchDownWithActions:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if ((a3 & 0x20000012) != 0 || (a3 & 0x800000) != 0 && (a3 & 0x78000) != 0)
  {
    LOBYTE(v5) = 1;
  }
  else if ((a3 & 0x20) == 0
         || (v5 = -[NSMutableDictionary count](self->_extendedTouchInfoMap, "count", v3, v4), v5 != 1))
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

+ (id)sharedPunctuationCharacterSet
{
  if (qword_1ECD79830 != -1)
    dispatch_once(&qword_1ECD79830, &__block_literal_global_922);
  return (id)qword_1ECD79828;
}

void __53__UIKeyboardLayoutStar_sharedPunctuationCharacterSet__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD79828;
  qword_1ECD79828 = v0;

}

- (void)incrementPunctuationIfNeeded:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend((id)objc_opt_class(), "sharedPunctuationCharacterSet");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (qword_1ECD79840 != -1)
      dispatch_once(&qword_1ECD79840, &__block_literal_global_923);
    v4 = objc_msgSend(v6, "characterAtIndex:", 0);
    if ((objc_msgSend(v3, "characterIsMember:", v4) & 1) != 0
      || objc_msgSend((id)qword_1ECD79838, "characterIsMember:", v4))
    {
      UIKeyboardGetCurrentInputMode();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      TIStatisticScalarIncrementInputStringCount();

    }
  }

}

void __53__UIKeyboardLayoutStar_incrementPunctuationIfNeeded___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "symbolCharacterSet");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD79838;
  qword_1ECD79838 = v0;

}

- (void)completeCommitTouchesPrecedingTouchDownWithKey:(id)a3 withActions:(unint64_t)a4 executionContext:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  unint64_t v18;

  v8 = a3;
  v9 = a5;
  -[UIKeyboardLayoutStar touchInfoForKey:](self, "touchInfoForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "delayed"))
  {
    objc_msgSend(v9, "returnExecutionToParent");
  }
  else if ((a4 & 2) != 0)
  {
    objc_msgSend(v8, "representedString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardLayoutStar createKeyEventForStringAction:forKey:touchInfo:inputFlags:](self, "createKeyEventForStringAction:forKey:touchInfo:inputFlags:", v11, v8, v10, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_modifiedInput");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardLayoutStar incrementPunctuationIfNeeded:](self, "incrementPunctuationIfNeeded:", v13);

    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __100__UIKeyboardLayoutStar_completeCommitTouchesPrecedingTouchDownWithKey_withActions_executionContext___block_invoke;
    v16[3] = &unk_1E16BB820;
    v16[4] = self;
    v17 = v8;
    v18 = a4;
    objc_msgSend(v9, "childWithContinuation:", v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_handleKeyEvent:executionContext:", v12, v15);

  }
  else
  {
    -[UIKeyboardLayoutStar completeSendStringActionForTouchDownWithKey:withActions:executionContext:](self, "completeSendStringActionForTouchDownWithKey:withActions:executionContext:", v8, a4, v9);
  }

}

uint64_t __100__UIKeyboardLayoutStar_completeCommitTouchesPrecedingTouchDownWithKey_withActions_executionContext___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeSendStringActionForTouchDownWithKey:withActions:executionContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2);
}

- (id)keyplaneNameForRevertAfterTouch
{
  NSString *v3;

  if (-[UIKBTree isShiftKeyplane](self->_keyplane, "isShiftKeyplane")
    && -[UIKBTree looksLikeShiftAlternate](self->_keyplane, "looksLikeShiftAlternate"))
  {
    -[UIKBTree shiftAlternateKeyplaneName](self->_keyplane, "shiftAlternateKeyplaneName");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = self->_keyplaneName;
  }
  return v3;
}

- (id)synthesizeTouchUpEventForKey:(id)a3
{
  UIKeyboardLayoutStar *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;

  v3 = self;
  -[UIKeyboardLayoutStar touchInfoForKey:](self, "touchInfoForKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "touch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "initialPoint");
  v7 = v6;
  v9 = v8;
  objc_msgSend(v5, "timestamp");
  v11 = v10;
  objc_msgSend(v4, "key");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = -[UIKeyboardLayoutStar keycodeForKey:](v3, "keycodeForKey:", v12);

  v13 = (void *)MEMORY[0x1E0DBDC78];
  objc_msgSend(v5, "pathMajorRadius");
  objc_msgSend(v13, "touchEventWithStage:location:radius:timestamp:pathIndex:forcedKeyCode:", 2, objc_msgSend(v5, "pathIndex"), (int)v3, v7, v9, v14, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (BOOL)shouldShowGestureKeyboardIntroduction
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  int v6;

  if (-[UITextInputTraits keyboardAppearance](self->super._inputTraits, "keyboardAppearance") == 127
    || (+[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController"), v2 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v2, "preferencesActions"), v3 = (void *)objc_claimAutoreleasedReturnValue(), v4 = objc_msgSend(v3, "BOOLForPreferenceKey:", CFSTR("GesturesEnabled")), v3, v2, !v4))
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    +[UIKeyboard keyboardBundleIdentifier](UIKeyboard, "keyboardBundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.purplebuddy")) ^ 1;

  }
  return v6;
}

- (BOOL)showGestureKeyboardIntroductionIfNeeded
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  UIGestureKeyboardIntroduction *v6;
  UIGestureKeyboardIntroduction *v7;
  UIGestureKeyboardIntroduction *gestureKeyboardIntroduction;
  _QWORD v10[5];

  if ((-[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 1
     || -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 24
     || -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 25
     || -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 26
     || -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 23)
    && !-[UIKeyboardLayout isFloating](self, "isFloating")
    && !-[UIKBTree isSplit](self->_keyplane, "isSplit")
    && (-[UIKBTree visualStyling](self->_keyplane, "visualStyling") & 0x3F) != 0x17
    && -[UITextInputTraits keyboardType](self->super._inputTraits, "keyboardType") != 12)
  {
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "preferencesActions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "oneTimeActionCompleted:", CFSTR("DidShowGestureKeyboardIntroduction")))
    {

    }
    else
    {
      v5 = -[UIKeyboardLayoutStar shouldShowGestureKeyboardIntroduction](self, "shouldShowGestureKeyboardIntroduction");

      if (v5)
      {
        v6 = [UIGestureKeyboardIntroduction alloc];
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __63__UIKeyboardLayoutStar_showGestureKeyboardIntroductionIfNeeded__block_invoke;
        v10[3] = &unk_1E16B3FD8;
        v10[4] = self;
        v7 = -[UIGestureKeyboardIntroduction initWithLayoutStar:completion:](v6, "initWithLayoutStar:completion:", self, v10);
        gestureKeyboardIntroduction = self->_gestureKeyboardIntroduction;
        self->_gestureKeyboardIntroduction = v7;

        return -[UIGestureKeyboardIntroduction showGestureKeyboardIntroduction](self->_gestureKeyboardIntroduction, "showGestureKeyboardIntroduction");
      }
    }
  }
  return 0;
}

void __63__UIKeyboardLayoutStar_showGestureKeyboardIntroductionIfNeeded__block_invoke(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  if (a2)
  {
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "preferencesActions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "didTriggerOneTimeAction:", CFSTR("DidShowGestureKeyboardIntroduction"));

  }
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 1328);
  *(_QWORD *)(v5 + 1328) = 0;

}

- (void)completeSendStringActionForTouchDownWithKey:(id)a3 withActions:(unint64_t)a4 executionContext:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  UIKBTree *keyplane;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  _BOOL4 v28;
  UIKBTree *keyboard;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _BOOL4 shift;
  BOOL v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  NSDate *prevTouchMoreKeyTime;
  NSDate *v52;
  NSDate *v53;
  double v54;
  double v55;
  void *v56;
  double v57;
  double v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  _BOOL4 autoshift;
  _QWORD v72[5];
  id v73;
  id v74;
  unint64_t v75;
  uint64_t v76;

  v8 = a3;
  v9 = a5;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((a4 & 0x800000) != 0)
    -[UIKeyboardLayoutStar showPopupVariantsForKey:](self, "showPopupVariantsForKey:", v8);
  -[UIKeyboardLayoutStar preTouchKeyplaneName](self, "preTouchKeyplaneName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    self->_revertKeyplaneAfterTouch = 1;
  if ((a4 & 0x10) != 0)
  {
    -[UIKeyboardLayoutStar transitionToPunctuationKeysVisible:](self, "transitionToPunctuationKeysVisible:", 0);
    -[UIKeyboardLayoutStar keyplaneNameForRevertAfterTouch](self, "keyplaneNameForRevertAfterTouch");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardLayoutStar setPreTouchKeyplaneName:](self, "setPreTouchKeyplaneName:", v12);

    self->_revertKeyplaneAfterTouch = 0;
    -[UIKeyboardLayoutStar downActionShiftWithKey:](self, "downActionShiftWithKey:", v8);
    if (-[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 1)
    {
      if (-[UIKBTree isShiftKeyplane](self->_keyplane, "isShiftKeyplane"))
      {
        UIKeyboardGetCurrentInputMode();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        TIStatisticScalarIncrementInputStringCount();

      }
    }
  }
  if ((a4 & 0x400000000) != 0)
  {
    -[UIKeyboardLayoutStar transitionToPunctuationKeysVisible:](self, "transitionToPunctuationKeysVisible:", 0);
    -[UIKBTree firstCachedKeyWithName:](self->_keyplane, "firstCachedKeyWithName:", CFSTR("Caps-Lock-Key"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isShiftLocked");

    keyplane = self->_keyplane;
    if (v16)
    {
      -[UIKBTree shiftAlternateKeyplaneName](keyplane, "shiftAlternateKeyplaneName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardLayoutStar setKeyplaneName:](self, "setKeyplaneName:", v18);

      -[UIKeyboardLayoutStar keyplaneFactory](self, "keyplaneFactory");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "renderingContext");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setShiftState:", 0);

      objc_msgSend(v10, "setShift:", 0);
      objc_msgSend(v10, "setShiftPreventAutoshift:", 1);
      objc_msgSend(v10, "forceShiftUpdate");
      v21 = 2;
    }
    else
    {
      -[UIKBTree name](keyplane, "name");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardLayoutStar setKeyplaneName:](self, "setKeyplaneName:", v22);

      -[UIKeyboardLayoutStar keyplaneFactory](self, "keyplaneFactory");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "renderingContext");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setShiftState:", 3);

      objc_msgSend(v10, "setShiftLockedForced:", 1);
      -[UIKBTree updateFlickKeycapOnKeys](self->_keyplane, "updateFlickKeycapOnKeys");
      -[UIKeyboardLayoutStar refreshDualStringKeys](self, "refreshDualStringKeys");
      v21 = 8;
    }
    -[UIKeyboardLayoutStar setState:forKey:](self, "setState:forKey:", v21, v14);

  }
  if ((a4 & 0x20) != 0 && -[NSMutableDictionary count](self->_extendedTouchInfoMap, "count") == 1)
  {
    -[UIView bounds](self, "bounds");
    v26 = v25;
    -[UIKeyboardLayoutStar keyplaneNameForRevertAfterTouch](self, "keyplaneNameForRevertAfterTouch");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardLayoutStar setPreTouchKeyplaneName:](self, "setPreTouchKeyplaneName:", v27);

    self->_revertKeyplaneAfterTouch = 0;
    objc_msgSend(v10, "keyActivated");
    self->_suppressShiftKeyplaneAnimation = 1;
    -[UIKeyboardLayoutStar transitionToPunctuationKeysVisible:](self, "transitionToPunctuationKeysVisible:", 0);
    v28 = -[UIKBTree isShiftKeyPlaneChooser](self->_keyplane, "isShiftKeyPlaneChooser");
    keyboard = self->_keyboard;
    -[UIKBTree alternateKeyplaneName](self->_keyplane, "alternateKeyplaneName");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBTree subtreeWithName:](keyboard, "subtreeWithName:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v31, "intForProperty:", CFSTR("shift-rendering")) != 31
      || (TIStatisticGetKey(),
          v32 = (void *)objc_claimAutoreleasedReturnValue(),
          TIStatisticScalarIncrement(),
          v32,
          !-[UIKeyboardLayoutStar showGestureKeyboardIntroductionIfNeeded](self, "showGestureKeyboardIntroductionIfNeeded")))
    {
      -[UIKBTree alternateKeyplaneName](self->_keyplane, "alternateKeyplaneName");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardLayoutStar setKeyplaneName:](self, "setKeyplaneName:", v33);

    }
    if (v28)
    {
      autoshift = self->_autoshift;
      v34 = v31;
      shift = self->_shift;
      objc_msgSend(v10, "forceShiftUpdate");
      v36 = shift == self->_shift;
      v31 = v34;
      if (v36 && autoshift != self->_autoshift)
      {
        -[UIKBTree shiftAlternateKeyplaneName](self->_keyplane, "shiftAlternateKeyplaneName");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIKeyboardLayoutStar setKeyplaneName:](self, "setKeyplaneName:", v37);

      }
    }
    self->_suppressShiftKeyplaneAnimation = 0;
    -[UIKeyboardLayoutStar setActiveKey:](self, "setActiveKey:", 0);
    -[UIView bounds](self, "bounds");
    v39 = v38 - v26;
    -[UIKeyboardLayoutStar touchInfoForKey:](self, "touchInfoForKey:", v8);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "initialDragPoint");
    v42 = v41;
    objc_msgSend(v40, "initialDragPoint");
    objc_msgSend(v40, "setInitialDragPoint:", v42, v39 + v43);
    if (v39 != 0.0)
    {
      -[UIView window](self, "window");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "layoutIfNeeded");

    }
    self->_preferredTrackingChangeCount = objc_msgSend(v10, "changeCount");
    if (-[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 1
      && !-[UIKBTree looksLikeShiftAlternate](self->_keyplane, "looksLikeShiftAlternate"))
    {
      UIKeyboardGetCurrentInputMode();
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      TIStatisticScalarIncrementInputStringCount();

    }
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "timeIntervalSinceDate:", self->_prevTouchMoreKeyTime);
    v48 = v47;

    if (v48 != 0.0 && v48 <= 0.300000012)
    {
      UIKeyboardGetCurrentInputMode();
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      TIStatisticGetKeyForInputMode();
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      TIStatisticScalarIncrement();

    }
    prevTouchMoreKeyTime = self->_prevTouchMoreKeyTime;
    if (prevTouchMoreKeyTime)
    {
      self->_prevTouchMoreKeyTime = 0;

    }
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v52 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v53 = self->_prevTouchMoreKeyTime;
    self->_prevTouchMoreKeyTime = v52;

  }
  if ((a4 & 0x20000000) != 0)
  {
    -[UIView bounds](self, "bounds");
    v55 = v54;
    objc_msgSend(v8, "representedString");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardLayoutStar switchKeyplane:](self, "switchKeyplane:", v56);

    -[UIView bounds](self, "bounds");
    v58 = v57 - v55;
    -[UIKeyboardLayoutStar touchInfoForKey:](self, "touchInfoForKey:", v8);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "initialDragPoint");
    v61 = v60;
    objc_msgSend(v59, "initialDragPoint");
    objc_msgSend(v59, "setInitialDragPoint:", v61, v58 + v62);
    if (v58 != 0.0)
    {
      -[UIView window](self, "window");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "layoutIfNeeded");

    }
    self->_preferredTrackingChangeCount = objc_msgSend(v10, "changeCount");

  }
  if ((a4 & 0x40) != 0)
  {
    -[UIKeyboardLayoutStar touchInfoForKey:](self, "touchInfoForKey:", v8);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "touch");
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v65, "inputSource") == 8)
      v66 = 8;
    else
      v66 = 1;
    objc_msgSend(v65, "touchUUID");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardLayout touchUUIDsToCommitBeforeTouchUUID:](self, "touchUUIDsToCommitBeforeTouchUUID:", v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    +[UIKBTouchState touchesForTouchUUIDs:](UIKBTouchState, "touchesForTouchUUIDs:", v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v72[0] = MEMORY[0x1E0C809B0];
    v72[1] = 3221225472;
    v72[2] = __97__UIKeyboardLayoutStar_completeSendStringActionForTouchDownWithKey_withActions_executionContext___block_invoke;
    v72[3] = &unk_1E16BB870;
    v72[4] = self;
    v73 = v8;
    v74 = v10;
    v75 = a4;
    v76 = v66;
    objc_msgSend(v9, "childWithContinuation:", v72);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardLayout commitTouches:executionContext:](self, "commitTouches:executionContext:", v69, v70);

  }
  else
  {
    -[UIKeyboardLayoutStar completeDeleteActionForTouchDownWithActions:executionContext:](self, "completeDeleteActionForTouchDownWithActions:executionContext:", a4, v9);
  }

}

void __97__UIKeyboardLayoutStar_completeSendStringActionForTouchDownWithKey_withActions_executionContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "keyplaneNameForRevertAfterTouch");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setPreTouchKeyplaneName:", v4);

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 912) = 0;
  objc_msgSend(*(id *)(a1 + 32), "synthesizeTouchUpEventForKey:", *(_QWORD *)(a1 + 40));
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "skipHitTestForTouchEvent:delayed:");
  objc_msgSend(*(id *)(a1 + 32), "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "forceTouchCapability");

  v7 = *(void **)(a1 + 48);
  if (v6 == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "touchInfoForKey:", *(_QWORD *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "touch");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "touchUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKBTouchState touchForTouchUUID:](UIKBTouchState, "touchForTouchUUID:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "force");
    objc_msgSend(v7, "startAutoDeleteTimerForForce:");

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "startAutoDeleteTimer");
  }
  v12 = *(void **)(a1 + 48);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __97__UIKeyboardLayoutStar_completeSendStringActionForTouchDownWithKey_withActions_executionContext___block_invoke_2;
  v18[3] = &unk_1E16C5CA0;
  v19 = v12;
  v20 = v3;
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(_QWORD *)(a1 + 56);
  v15 = *(_QWORD *)(a1 + 64);
  v21 = v13;
  v22 = v14;
  v16 = v3;
  objc_msgSend(v19, "performOperations:withTextInputSource:", v18, v15);

}

void __97__UIKeyboardLayoutStar_completeSendStringActionForTouchDownWithKey_withActions_executionContext___block_invoke_2(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[6];
  _QWORD v9[6];

  v2 = objc_msgSend(*(id *)(a1 + 32), "shouldUseAdaptiveDelete");
  v4 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  if (v2)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __97__UIKeyboardLayoutStar_completeSendStringActionForTouchDownWithKey_withActions_executionContext___block_invoke_3;
    v9[3] = &unk_1E16BBA90;
    v5 = *(_QWORD *)(a1 + 56);
    v9[4] = *(_QWORD *)(a1 + 48);
    v9[5] = v5;
    objc_msgSend(v3, "childWithContinuation:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleDeleteWordWithExecutionContext:", v6);
  }
  else
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __97__UIKeyboardLayoutStar_completeSendStringActionForTouchDownWithKey_withActions_executionContext___block_invoke_4;
    v8[3] = &unk_1E16BBA90;
    v7 = *(_QWORD *)(a1 + 56);
    v8[4] = *(_QWORD *)(a1 + 48);
    v8[5] = v7;
    objc_msgSend(v3, "childWithContinuation:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleDeleteWithExecutionContext:", v6);
  }

}

void __97__UIKeyboardLayoutStar_completeSendStringActionForTouchDownWithKey_withActions_executionContext___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "multitapExpired");
  objc_msgSend(*(id *)(a1 + 32), "completeDeleteActionForTouchDownWithActions:executionContext:", *(_QWORD *)(a1 + 40), v4);

}

void __97__UIKeyboardLayoutStar_completeSendStringActionForTouchDownWithKey_withActions_executionContext___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "multitapExpired");
  objc_msgSend(*(id *)(a1 + 32), "completeDeleteActionForTouchDownWithActions:executionContext:", *(_QWORD *)(a1 + 40), v4);

}

- (void)completeDeleteActionForTouchDownWithActions:(unint64_t)a3 executionContext:(id)a4
{
  int v4;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v10 = a4;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v4 & 0x40000000) != 0)
  {
    v7 = +[UIDictationController viewMode](UIDictationController, "viewMode");
    -[UIKBTree firstCachedKeyWithName:](self->_keyplane, "firstCachedKeyWithName:", CFSTR("Dictation-Key"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 == 1)
    {
      objc_msgSend(v6, "acceptAutocorrectionWithCompletionHandler:", 0);
      +[UIKeyboardDictationMenu sharedInstance](UIKeyboardDictationMenu, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardLayoutStar showMenu:forKey:](self, "showMenu:forKey:", v9, v8);

    }
  }
  objc_msgSend(v10, "returnExecutionToParent");

}

- (BOOL)canForceTouchUUIDCommit:(id)a3 inWindow:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  BOOL v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  -[UIKeyboardLayoutStar infoForTouchUUID:](self, "infoForTouchUUID:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7
    && v8
    && (objc_msgSend(v8, "key"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "modifiesKeyplane"),
        v10,
        (v11 & 1) != 0)
    || objc_msgSend(v9, "continuousPathState") == 4)
  {
    v12 = 0;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)UIKeyboardLayoutStar;
    v12 = -[UIKeyboardLayout canForceTouchUUIDCommit:inWindow:](&v14, sel_canForceTouchUUIDCommit_inWindow_, v6, v7);
  }

  return v12;
}

- (BOOL)touchPassesDragThreshold:(id)a3
{
  id v4;
  float v5;
  void *v6;
  int v7;
  int v8;
  float v9;
  void *v10;
  BOOL v11;
  float v12;
  float v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  float v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  float v26;
  double v27;
  float v28;
  BOOL v29;

  v4 = a3;
  if (objc_msgSend(v4, "dragged"))
    v5 = 12.0;
  else
    v5 = 18.0;
  objc_msgSend(v4, "key");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[UIKeyboardLayoutStar stateForKey:](self, "stateForKey:", v6);

  v8 = -[UIKBTree dragThreshold](self->_keyplane, "dragThreshold");
  if (v7 != 16 && v8 == 41)
  {
    if (objc_msgSend(v4, "dragged"))
      v5 = 36.0;
    else
      v5 = 45.0;
  }
  if (-[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 1
    || -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 24
    || -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 25
    || -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 26
    || (v9 = 5.0, -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 23))
  {
    v9 = 5.0;
    if (!-[UIKeyboardLayout isFloating](self, "isFloating"))
    {
      if (objc_msgSend(v4, "dragged"))
        v5 = 34.0;
      else
        v5 = 42.0;
      v9 = 15.0;
    }
  }
  objc_msgSend(v4, "key");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    v11 = v7 == 16;
  else
    v11 = 0;
  if (v11)
    v12 = v9;
  else
    v12 = 0.0;
  v13 = v5 - v12;
  objc_msgSend(v4, "key");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    objc_msgSend(v4, "key");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "interactionType") == 16)
    {

      if ((v7 & 0x10) != 0)
        v13 = v13 / 3.0;
    }
    else
    {

    }
  }
  +[UIKeyboardSplitControlMenu activeInstance](UIKeyboardSplitControlMenu, "activeInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isVisible");

  if (v18)
    v19 = 0.0;
  else
    v19 = v13;
  objc_msgSend(v4, "touch");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "locationInView:", self);
  v22 = v21;
  v24 = v23;

  objc_msgSend(v4, "initialDragPoint");
  *(float *)&v25 = v22 - v25;
  v26 = fabsf(*(float *)&v25);
  objc_msgSend(v4, "initialDragPoint");
  v28 = v24 - v27;
  v29 = v19 <= fabsf(v28) || v19 <= v26;

  return v29;
}

- (void)touchDragged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UIKeyboardLayoutStar;
  -[UIKeyboardLayout touchDragged:](&v12, sel_touchDragged_, v4);
  +[UIKBTouchState touchUUIDForTouch:](UIKBTouchState, "touchUUIDForTouch:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardLayoutStar infoForTouchUUID:](self, "infoForTouchUUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UIKeyboardLayoutStar _allowContinuousPathUI](self, "_allowContinuousPathUI")
    && objc_msgSend(v6, "continuousPathState") == 4)
  {
    objc_msgSend(v4, "locationInView:", self);
    v8 = v7;
    v10 = v9;
    objc_msgSend(v4, "timestamp");
    -[UIKeyboardLayoutStar addContinuousPathPoint:withTimestamp:](self, "addContinuousPathPoint:withTimestamp:", v8, v10, v11);
  }

}

- (void)touchDragged:(id)a3 executionContext:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  _UNKNOWN **v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  UIKeyboardLayoutStar *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  UIKeyboardLayoutStar *v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  UIKBTree *multitapKey;
  void *v38;
  _BOOL4 v39;
  void *v40;
  void *v41;
  __objc2_class *v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  int v50;
  void *v51;
  int v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  unint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  int v62;
  BOOL v63;
  void *v64;
  double v65;
  CGFloat x;
  double v67;
  CGFloat y;
  double v69;
  CGFloat width;
  double v71;
  CGFloat height;
  void *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t i;
  CGFloat v79;
  CGFloat v80;
  CGFloat v81;
  CGFloat v82;
  void *v83;
  double v84;
  CGFloat v85;
  void *v86;
  double v87;
  CGFloat v88;
  CGFloat v89;
  CGFloat v90;
  CGFloat v91;
  CGFloat v92;
  void *v93;
  void *v94;
  uint64_t v95;
  BOOL v96;
  BOOL v97;
  void *v98;
  BOOL v99;
  id v100;
  void *v101;
  void *v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  void *v108;
  void *v109;
  unint64_t v110;
  void *v111;
  void *v112;
  int v113;
  void *v114;
  void *v115;
  CGFloat v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  void *v130;
  double v131;
  CGFloat v132;
  double v133;
  CGFloat v134;
  double v135;
  CGFloat v136;
  double v137;
  CGFloat v138;
  void *v139;
  void *v140;
  void *v141;
  float v142;
  double v143;
  double v144;
  void *v145;
  void *v146;
  void *v147;
  int v148;
  UIKBKeyplaneView *keyplaneView;
  void *v150;
  BOOL selectedVariantIndexChanged;
  void *v152;
  void *v153;
  int v154;
  void *v155;
  CGFloat r1;
  void *v157;
  CGRect v158;
  void *v159;
  UIKeyboardLayoutStar *v160;
  id v161;
  CGFloat v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  _QWORD v167[2];
  _QWORD v168[2];
  _BYTE v169[128];
  uint64_t v170;
  CGPoint v171;
  CGRect v172;
  CGRect v173;
  CGRect v174;
  CGRect v175;
  CGRect v176;
  CGRect v177;
  CGRect v178;
  CGRect v179;
  CGRect v180;
  CGRect v181;
  CGRect v182;
  CGRect v183;
  CGRect v184;

  v170 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[UIKeyboardLayoutStar infoForTouch:](self, "infoForTouch:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "addTouch:", v7);
    v11 = &off_1E167A000;
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[UIKeyboardLayoutStar touchPassesDragThreshold:](self, "touchPassesDragThreshold:", v10);
    objc_msgSend(v10, "touch");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "locationInView:", self);
    v16 = v15;
    v18 = v17;

    objc_msgSend(v10, "initialDragPoint");
    v20 = v19;
    objc_msgSend(v10, "key");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&v158.origin.x = a2;
    if (objc_msgSend(v21, "displayTypeHint") == 10)
    {
      objc_msgSend(v10, "key");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v22, "state") != 20)
      {
        v23 = self;
        v24 = v7;
        v25 = v8;
        v26 = v12;
        objc_msgSend(v10, "key");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v27, "state") != 2)
        {
          objc_msgSend(v10, "slidOffKey");
          v43 = (void *)objc_claimAutoreleasedReturnValue();

          v12 = v26;
          v8 = v25;
          v7 = v24;
          self = v23;
          v11 = &off_1E167A000;
          if (!v43)
          {
            objc_msgSend(v10, "initialPoint");
            v45 = v44;
            objc_msgSend(v10, "key");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "paddedFrame");
            v48 = v47;

            objc_msgSend(v10, "key");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = objc_msgSend(v49, "state");

            if (v50 != 16 || (v18 - v45) / v48 > 0.25)
            {
              objc_msgSend(v10, "key");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = objc_msgSend(v51, "state");

              if (v52 == 16)
              {
                objc_msgSend(v10, "key");
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                -[UIKeyboardLayoutStar setState:forKey:](self, "setState:forKey:", 4, v53);

              }
              objc_msgSend(v10, "setInitialDragPoint:", v16, v18);
              objc_msgSend(v10, "setDragged:", 1);
              -[UIKeyboardLayoutStar updatePanAlternativesForTouchInfo:](self, "updatePanAlternativesForTouchInfo:", v10);
              goto LABEL_29;
            }
          }
LABEL_8:
          objc_msgSend(v10, "key");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "interactionType");

          if (v29 == 4)
          {
            objc_msgSend(v11[474], "activeInstance");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "touchUUID");
            v31 = self;
            v32 = v7;
            v33 = v8;
            v34 = v12;
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            +[UIKBTouchState touchForTouchUUID:](UIKBTouchState, "touchForTouchUUID:", v35);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "force");
            objc_msgSend(v30, "adjustAutoDeleteTimerForForce:");

            v12 = v34;
            v8 = v33;
            v7 = v32;
            self = v31;

          }
          if (!-[UIKeyboardPinchGestureRecognizer pinchDetected](self->_pinchGestureRecognizer, "pinchDetected") && v13)
          {
            objc_msgSend(v10, "setInitialDragPoint:", v16, v18);
            objc_msgSend(v10, "setDragged:", 1);
            objc_msgSend(v12, "touchLongPressTimer");
            if (v29 != 16
              || (-[UIKeyboardLayoutStar multitapInterrupted](self, "multitapInterrupted"),
                  multitapKey = self->_multitapKey,
                  self->_multitapKey = 0,
                  multitapKey,
                  !-[UIKeyboardLayoutStar handleFlick:](self, "handleFlick:", v10))
              && self->_preTouchKeyplaneName
              && !-[NSString isEqualToString:](self->_keyplaneName, "isEqualToString:"))
            {
              objc_msgSend(v10, "key");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = -[UIKeyboardLayoutStar shouldShowInternationalMenuForKey:](self, "shouldShowInternationalMenuForKey:", v38);

              if (v39)
              {
                +[UIInputSwitcherView sharedInstance](UIInputSwitcherView, "sharedInstance");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                goto LABEL_41;
              }
              if (v29 == 5)
              {
                if (+[UIDictationController viewMode](UIDictationController, "viewMode") == 1)
                {
                  +[UIKeyboardDictationMenu sharedInstance](UIKeyboardDictationMenu, "sharedInstance");
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v41, "isVisible"))
                  {
                    v42 = UIKeyboardDictationMenu;
                    goto LABEL_33;
                  }
LABEL_34:
                  v40 = 0;
                  goto LABEL_35;
                }
                +[UIDictationConnectionPreferences sharedInstance](UIDictationConnectionPreferences, "sharedInstance");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v54, "dictationIsEnabled") & 1) != 0)
                {
                  v55 = v12;
                  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v56, "enabledDictationLanguages");
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  v58 = objc_msgSend(v57, "count");

                  if (v58 < 2)
                  {
                    v40 = 0;
                  }
                  else
                  {
                    +[UIInputSwitcherView sharedInstance](UIInputSwitcherView, "sharedInstance");
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                  }
                  v12 = v55;
LABEL_41:
                  objc_msgSend(v10, "key");
                  v59 = objc_claimAutoreleasedReturnValue();
                  if (v59)
                  {
                    v60 = (void *)v59;
                    objc_msgSend(v10, "key");
                    v61 = (void *)objc_claimAutoreleasedReturnValue();
                    v157 = v12;
                    v62 = -[UIKeyboardLayoutStar stateForKey:](self, "stateForKey:", v61);

                    v63 = v62 == 16;
                    v12 = v157;
                    if (v63 && !v40)
                    {
                      objc_msgSend(v157, "clearLongPressTimer");
                      objc_msgSend(v10, "key");
                      v64 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v64, "frame");
                      x = v65;
                      y = v67;
                      width = v69;
                      height = v71;

                      v165 = 0u;
                      v166 = 0u;
                      v163 = 0u;
                      v164 = 0u;
                      objc_msgSend(v10, "key");
                      v73 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v73, "subtrees");
                      v74 = (void *)objc_claimAutoreleasedReturnValue();

                      v75 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v163, v169, 16);
                      if (v75)
                      {
                        v76 = v75;
                        v77 = *(_QWORD *)v164;
                        do
                        {
                          for (i = 0; i != v76; ++i)
                          {
                            if (*(_QWORD *)v164 != v77)
                              objc_enumerationMutation(v74);
                            objc_msgSend(*(id *)(*((_QWORD *)&v163 + 1) + 8 * i), "frame");
                            v183.origin.x = v79;
                            v183.origin.y = v80;
                            v183.size.width = v81;
                            v183.size.height = v82;
                            v172.origin.x = x;
                            v172.origin.y = y;
                            v172.size.width = width;
                            v172.size.height = height;
                            v173 = CGRectUnion(v172, v183);
                            x = v173.origin.x;
                            y = v173.origin.y;
                            width = v173.size.width;
                            height = v173.size.height;
                          }
                          v76 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v163, v169, 16);
                        }
                        while (v76);
                      }

                      objc_msgSend(v10, "key");
                      v83 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v83, "frame");
                      v85 = v84 * -0.5;
                      objc_msgSend(v10, "key");
                      v86 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v86, "frame");
                      v88 = v87 * -0.5;
                      v174.origin.x = x;
                      v174.origin.y = y;
                      v174.size.width = width;
                      v174.size.height = height;
                      v175 = CGRectInset(v174, v85, v88);
                      v89 = v175.origin.x;
                      v90 = v175.origin.y;
                      v91 = v175.size.width;
                      v92 = v175.size.height;

                      objc_msgSend(v10, "key");
                      v93 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v93, "subtrees");
                      v94 = (void *)objc_claimAutoreleasedReturnValue();
                      v95 = objc_msgSend(v94, "count");

                      if (v95 == 1)
                      {
                        v176.origin.x = v89;
                        v176.origin.y = v90;
                        v176.size.width = v91;
                        v176.size.height = v92;
                        if (v16 < CGRectGetMinX(v176))
                          goto LABEL_88;
                        v177.origin.x = v89;
                        v177.origin.y = v90;
                        v177.size.width = v91;
                        v177.size.height = v92;
                        if (v16 > CGRectGetMaxX(v177))
                          goto LABEL_88;
                      }
                      else
                      {
                        objc_msgSend(v10, "key");
                        v108 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v108, "subtrees");
                        v109 = (void *)objc_claimAutoreleasedReturnValue();
                        v110 = objc_msgSend(v109, "count");

                        if (v110 < 2)
                          goto LABEL_97;
                        objc_msgSend(v10, "key");
                        v111 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v111, "name");
                        v112 = (void *)objc_claimAutoreleasedReturnValue();
                        v113 = objc_msgSend(v112, "isEqual:", CFSTR("EmojiPopupKey"));

                        if (v113)
                        {
                          objc_msgSend(v10, "key");
                          v114 = (void *)objc_claimAutoreleasedReturnValue();
                          -[UIKBKeyplaneView existingVariantsKeyViewForKey:](self->_keyplaneView, "existingVariantsKeyViewForKey:", v114);
                          v115 = (void *)objc_claimAutoreleasedReturnValue();
                          if (v115)
                          {
                            objc_msgSend(v114, "frame");
                            v158.origin.x = v116;
                            r1 = v117;
                            v119 = v118;
                            v121 = v120;
                            objc_msgSend(v115, "frame");
                            v123 = v122;
                            v125 = v124;
                            v127 = v126;
                            v129 = v128;
                            objc_msgSend(v115, "superview");
                            v130 = (void *)objc_claimAutoreleasedReturnValue();
                            -[UIView convertRect:fromView:](self, "convertRect:fromView:", v130, v123, v125, v127, v129);
                            v132 = v131;
                            v134 = v133;
                            v136 = v135;
                            v138 = v137;

                            v178.origin.x = v158.origin.x;
                            v178.origin.y = r1;
                            v178.size.width = v119;
                            v178.size.height = v121;
                            v184.origin.x = v132;
                            v184.origin.y = v134;
                            v184.size.width = v136;
                            v184.size.height = v138;
                            v179 = CGRectUnion(v178, v184);
                            v180 = CGRectInset(v179, v119 * -0.5, v121 * -0.5);
                            v89 = v180.origin.x;
                            v90 = v180.origin.y;
                            v91 = v180.size.width;
                            v92 = v180.size.height;
                          }
                          v181.origin.x = v89;
                          v181.origin.y = v90;
                          v181.size.width = v91;
                          v181.size.height = v92;
                          v171.x = v16;
                          v171.y = v18;
                          if (!CGRectContainsPoint(v181, v171) && (_os_feature_enabled_impl() & 1) != 0)
                          {
                            objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
                            v139 = (void *)objc_claimAutoreleasedReturnValue();
                            v167[0] = CFSTR("key");
                            v167[1] = CFSTR("touch");
                            v168[0] = v114;
                            objc_msgSend(v7, "uiTouch");
                            v140 = (void *)objc_claimAutoreleasedReturnValue();
                            v168[1] = v140;
                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v168, v167, 2);
                            v141 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v139, "postNotificationName:object:userInfo:", CFSTR("UIKeyboardWillCancelEmojiVariants"), self, v141);

                            v12 = v157;
LABEL_88:
                            -[UIKeyboardLayoutStar deactivateActiveKeys](self, "deactivateActiveKeys");
                            if (objc_msgSend(v12, "caretVisible"))
                              -[UIKeyboardLayoutStar _cleanUpBlinkAssertionIfNecessary](self, "_cleanUpBlinkAssertionIfNecessary");
                            if (-[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 1
                              || -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 24
                              || -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 25
                              || -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 26
                              || -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 23)
                            {
                              -[UIKeyboardLayoutStar setKeyboardDim:amount:withDuration:](self, "setKeyboardDim:amount:withDuration:", 0, 0.0, 0.3);
                            }
                            goto LABEL_103;
                          }

LABEL_97:
                          -[UIKeyboardLayoutStar keyplaneFactory](self, "keyplaneFactory");
                          v146 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v10, "key");
                          v147 = (void *)objc_claimAutoreleasedReturnValue();
                          v148 = objc_msgSend(v146, "popupKeyUsesCustomKeyContentView:", v147);

                          if (v148)
                          {
                            keyplaneView = self->_keyplaneView;
                            objc_msgSend(v10, "key");
                            v150 = (void *)objc_claimAutoreleasedReturnValue();
                            selectedVariantIndexChanged = 1;
                            if (!-[UIKBKeyplaneView retestSelectedVariantIndexForKey:atPoint:phase:](keyplaneView, "retestSelectedVariantIndexForKey:atPoint:phase:", v150, 1, v16, v18))selectedVariantIndexChanged = self->_selectedVariantIndexChanged;
                            self->_selectedVariantIndexChanged = selectedVariantIndexChanged;
                          }
                          else
                          {
                            objc_msgSend(v10, "key");
                            v150 = (void *)objc_claimAutoreleasedReturnValue();
                            -[UIKeyboardLayoutStar updateSelectedVariantIndexForKey:withActions:withPoint:](self, "updateSelectedVariantIndexForKey:withActions:withPoint:", v150, 0, v16, v18);
                          }

                          objc_msgSend(v10, "key");
                          v152 = (void *)objc_claimAutoreleasedReturnValue();
                          -[UIKeyboardLayoutStar setState:forKey:](self, "setState:forKey:", 16, v152);

                          goto LABEL_103;
                        }
                      }
                      v182.origin.x = v89;
                      v182.origin.y = v90;
                      v182.size.width = v91;
                      v182.size.height = v92;
                      if (v18 > CGRectGetMaxY(v182))
                        goto LABEL_88;
                      goto LABEL_97;
                    }
                  }
                  if (v40 && -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") != 3)
                  {
                    objc_msgSend(v40, "superview");
                    v102 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v102)
                    {
                      objc_msgSend(v7, "locationInView:", self);
                      -[UIView convertPoint:toView:](self, "convertPoint:toView:", v40);
                      v104 = v103;
                      v106 = v105;
                      objc_msgSend(v40, "size");
                      if (v106 - v107 < 0.0)
                        self->_dictationUsingServerManualEndpointing = 0;
                      objc_msgSend(v40, "updateSelectionWithPoint:", v104, v106);
                      goto LABEL_103;
                    }
                    v142 = v18 - v20;
                    v143 = fabsf(v142);
                    -[UIKeyboardLayout flickDistance](self, "flickDistance");
                    if (v144 < v143 && -[NSMutableDictionary count](self->_extendedTouchInfoMap, "count") == 1)
                    {
                      if (!-[UIKeyboardLayoutStar isHandwritingPlane](self, "isHandwritingPlane") || v29 != 3)
                      {
                        objc_msgSend(v10, "key");
                        v145 = (void *)objc_claimAutoreleasedReturnValue();
                        if (-[UIKeyboardLayoutStar stateForKey:](self, "stateForKey:", v145) == 4)
                        {

                        }
                        else
                        {
                          objc_msgSend(v10, "key");
                          v153 = (void *)objc_claimAutoreleasedReturnValue();
                          v154 = objc_msgSend(v153, "interactionType");

                          if (v154 != 5)
                            goto LABEL_103;
                        }
                      }
                      objc_msgSend(v10, "key");
                      v155 = (void *)objc_claimAutoreleasedReturnValue();
                      -[UIKeyboardLayoutStar showMenu:forKey:](self, "showMenu:forKey:", v40, v155);

                      objc_msgSend(v7, "locationInView:", v40);
                      objc_msgSend(v40, "updateSelectionWithPoint:");
                      self->_dictationUsingServerManualEndpointing = 0;
                    }
                  }
                  else
                  {
                    if (-[UIKeyboardLayoutStar _allowContinuousPathUI](self, "_allowContinuousPathUI")
                      && objc_msgSend(v10, "continuousPathState") == 1)
                    {
                      -[UIKeyboardLayoutStar _transitionToContinuousPathState:forTouchInfo:](self, "_transitionToContinuousPathState:forTouchInfo:", 3, v10);
                    }
                    v96 = objc_msgSend(v10, "continuousPathState") == 3 || objc_msgSend(v10, "continuousPathState") == 4;
                    v97 = -[UIKBTree shouldSuppressDragRetest](self->_keyplane, "shouldSuppressDragRetest");
                    if (!v97 && !v96)
                    {
                      objc_msgSend(v10, "key");
                      v98 = (void *)objc_claimAutoreleasedReturnValue();
                      v99 = -[UIKeyboardLayoutStar shouldRetestTouchDraggedFromKey:](self, "shouldRetestTouchDraggedFromKey:", v98);

                      if (!v99)
                        goto LABEL_103;
LABEL_69:
                      *(_QWORD *)&v158.origin.y = MEMORY[0x1E0C809B0];
                      *(_QWORD *)&v158.size.width = 3221225472;
                      *(_QWORD *)&v158.size.height = __54__UIKeyboardLayoutStar_touchDragged_executionContext___block_invoke;
                      v159 = &unk_1E16BB820;
                      v162 = v158.origin.x;
                      v160 = self;
                      v100 = v10;
                      v161 = v100;
                      objc_msgSend(v8, "childWithContinuation:", &v158.origin.y);
                      v101 = (void *)objc_claimAutoreleasedReturnValue();
                      -[UIKeyboardLayoutStar performHitTestForTouchInfo:touchStage:executionContextPassingUIKBTree:](self, "performHitTestForTouchInfo:touchStage:executionContextPassingUIKBTree:", v100, 1, v101);

LABEL_104:
                      goto LABEL_105;
                    }
                    if (!v97)
                      goto LABEL_69;
                  }
LABEL_103:
                  objc_msgSend(v8, "returnExecutionToParent");
                  goto LABEL_104;
                }

              }
              else if (v29 == 6)
              {
                +[UIKeyboardSplitControlMenu sharedInstance](UIKeyboardSplitControlMenu, "sharedInstance");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v41, "isVisible"))
                {
                  v42 = UIKeyboardSplitControlMenu;
LABEL_33:
                  -[__objc2_class sharedInstance](v42, "sharedInstance");
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_35:

                  goto LABEL_41;
                }
                goto LABEL_34;
              }
              v40 = 0;
              goto LABEL_41;
            }
          }
LABEL_29:
          objc_msgSend(v8, "returnExecutionToParent");
LABEL_105:

          goto LABEL_106;
        }

        v12 = v26;
        v8 = v25;
        v7 = v24;
        self = v23;
        v11 = &off_1E167A000;
      }

    }
    goto LABEL_8;
  }
  objc_msgSend(v8, "returnExecutionToParent");
LABEL_106:

}

void __54__UIKeyboardLayoutStar_touchDragged_executionContext___block_invoke(uint64_t *a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(v12, "info");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    objc_msgSend(v12, "info");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = a1[6];
      v9 = a1[4];
      objc_msgSend(v12, "info");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, CFSTR("UIKeyboardLayoutStar.m"), 8783, CFSTR("UIKeyboardTask %s expected UIKBTree but received %@"), "-[UIKeyboardLayoutStar touchDragged:executionContext:]_block_invoke", v10);

    }
  }
  objc_msgSend(v12, "info");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1[4], "completeHitTestForTouchDragged:hitKey:", a1[5], v11);
  objc_msgSend(v12, "returnExecutionToParent");

}

- (void)completeHitTestForTouchDragged:(id)a3 hitKey:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  int *v21;
  double *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  char v36;
  UIKBTree *keyplane;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t i;
  uint64_t v48;
  void *v49;
  UIKBTree *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  _BOOL4 v55;
  void *v56;
  id v57;
  void *v58;
  int v59;
  UIKBTree *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t j;
  _BOOL4 shift;
  void *v69;
  void *v70;
  void *v71;
  int v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  int v78;
  void *v79;
  void *v80;
  int v81;
  double v82;
  float v83;
  double v84;
  float v85;
  void *v86;
  double v87;
  double v88;
  NSTimer *progressiveCandidateUpdateTimer;
  NSDate *v90;
  NSDate *prevProgressiveCandidateRequestTime;
  void *v92;
  NSTimer *v93;
  NSTimer *v94;
  uint64_t v95;
  void *v96;
  void *v97;
  void *v98;
  int v99;
  void *v100;
  char v101;
  void *v102;
  char v103;
  uint64_t v104;
  uint64_t v105;
  void (*v106)(uint64_t);
  void *v107;
  UIKeyboardLayoutStar *v108;
  id v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  _BYTE v118[128];
  _BYTE v119[128];
  uint64_t v120;
  CGRect v121;
  CGRect v122;

  v120 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "initialDragPoint");
  v9 = v8;
  v11 = v10;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UIKeyboardLayout supportsVirtualDrift](self, "supportsVirtualDrift"))
  {
    objc_msgSend(v7, "frame");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v21 = &OBJC_IVAR___UIKeyboardLayoutStar__leftDriftOffset;
    if ((-[NSMutableSet containsObject:](self->_leftKeySet, "containsObject:", v7) & 1) != 0
      || (v21 = &OBJC_IVAR___UIKeyboardLayoutStar__rightDriftOffset,
          -[NSMutableSet containsObject:](self->_rightKeySet, "containsObject:", v7)))
    {
      v22 = (double *)((char *)self + *v21);
    }
    else
    {
      v22 = (double *)MEMORY[0x1E0C9D538];
    }
    v23 = *v22;
    v24 = v22[1];
    v121.origin.x = v14;
    v121.origin.y = v16;
    v121.size.width = v18;
    v121.size.height = v20;
    v25 = v9 - CGRectGetMidX(v121) - v23;
    v122.origin.x = v14;
    v122.origin.y = v16;
    v122.size.width = v18;
    v122.size.height = v20;
    v26 = v11 - CGRectGetMidY(v122) - v24;
    -[UIKeyboardLayoutStar handRestRecognizerGetHomeRowHint](self, "handRestRecognizerGetHomeRowHint");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "touch");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardLayout _updateTouchState:errorVector:rowOffsetFromHomeRow:](self, "_updateTouchState:errorVector:rowOffsetFromHomeRow:", v28, (int)objc_msgSend(v7, "displayRowHint") - objc_msgSend(v27, "integerValue"), v25, v26);

  }
  objc_msgSend(v6, "key");
  v29 = (id)objc_claimAutoreleasedReturnValue();

  if (v29 == v7)
    goto LABEL_91;
  if (-[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") != 1
    && -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") != 24
    && -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") != 25
    && -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") != 26
    && -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") != 23
    || (objc_msgSend(v12, "usesContinuousPath") & 1) != 0)
  {
    objc_msgSend(v6, "key");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v30, "state") != 1)
    {
      objc_msgSend(v6, "key");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v31, "interactionType") == 11)
      {
LABEL_18:

        goto LABEL_19;
      }
      objc_msgSend(v6, "key");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v32, "interactionType") == 14)
      {

        goto LABEL_18;
      }
      objc_msgSend(v6, "key");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v76, "state") == 4)
      {
        objc_msgSend(v6, "key");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = objc_msgSend(v77, "interactionType");

        if (v78 == 10)
          goto LABEL_20;
      }
      else
      {

      }
      objc_msgSend(v6, "key");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardLayoutStar setState:forKey:](self, "setState:forKey:", 2, v30);
    }
LABEL_19:

LABEL_20:
    objc_msgSend(v6, "key");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if ((-[UIKeyboardLayoutStar upActionFlagsForKey:](self, "upActionFlagsForKey:", v33) & 0x400) != 0)
    {
      shift = self->_shift;

      if (shift)
      {
        objc_msgSend(v12, "setShift:", 0);
        -[UIKeyboardLayoutStar setShift:](self, "setShift:", 0);
      }
    }
    else
    {

    }
    objc_msgSend(v12, "stopAutoDelete");
    if (v7)
    {
      if (objc_msgSend(v7, "interactionType") == 13)
        goto LABEL_91;
      if (objc_msgSend(v7, "interactionType") == 4)
        goto LABEL_91;
      if (objc_msgSend(v7, "displayType") == 49)
        goto LABEL_91;
      if ((-[UIKeyboardLayoutStar upActionFlagsForKey:](self, "upActionFlagsForKey:", v7) & 2) == 0)
        goto LABEL_91;
      self->_revertKeyplaneAfterTouch = 1;
      objc_msgSend(v12, "setInputPoint:", v9, v11);
      -[UIKeyboardLayoutStar setActiveKey:](self, "setActiveKey:", v7);
      objc_msgSend(v6, "key");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setSlidOffKey:", v69);

      objc_msgSend(v6, "setKey:", v7);
      objc_msgSend(v6, "setKeyplane:", self->_keyplane);
      if (-[UIKeyboardLayoutStar _allowContinuousPathUI](self, "_allowContinuousPathUI"))
      {
        if (objc_msgSend(v6, "continuousPathState") != 2)
          goto LABEL_91;
      }
LABEL_70:
      -[UIKeyboardLayoutStar setState:forKey:](self, "setState:forKey:", 4, v7);
      goto LABEL_91;
    }
    -[UIKeyboardLayoutStar setActiveKey:](self, "setActiveKey:", 0);
    objc_msgSend(v6, "key");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSlidOffKey:", v70);

LABEL_90:
    objc_msgSend(v6, "setKey:", 0);
    objc_msgSend(v6, "setKeyplane:", self->_keyplane);
    goto LABEL_91;
  }
  objc_msgSend(v12, "stopAutoDelete");
  objc_msgSend(v6, "key");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSlidOffKey:", v34);

  objc_msgSend(v6, "slidOffKey");
  v35 = (id)objc_claimAutoreleasedReturnValue();
  if ((-[UIKeyboardLayoutStar downActionFlagsForKey:](self, "downActionFlagsForKey:", v35) & 0x10) != 0)
  {
    v36 = -[UIKeyboardLayoutStar downActionFlagsForKey:](self, "downActionFlagsForKey:", v7);

    if ((v36 & 0x10) != 0)
      goto LABEL_33;
    -[UIKeyboardLayout setShiftKeyTouchUUID:](self, "setShiftKeyTouchUUID:", 0);
    keyplane = self->_keyplane;
    objc_msgSend(v6, "slidOffKey");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "name");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBTree keysByKeyName:](keyplane, "keysByKeyName:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "slidOffKey");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = -[UIKeyboardLayoutStar stateForShiftKey:](self, "stateForShiftKey:", v41);

    v116 = 0u;
    v117 = 0u;
    v114 = 0u;
    v115 = 0u;
    v35 = v40;
    v43 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v114, v119, 16);
    if (v43)
    {
      v44 = v43;
      v45 = v42 ^ 4u;
      v46 = *(_QWORD *)v115;
      do
      {
        for (i = 0; i != v44; ++i)
        {
          if (*(_QWORD *)v115 != v46)
            objc_enumerationMutation(v35);
          -[UIKeyboardLayoutStar setState:forKey:](self, "setState:forKey:", v45, *(_QWORD *)(*((_QWORD *)&v114 + 1) + 8 * i));
        }
        v44 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v114, v119, 16);
      }
      while (v44);
    }

  }
LABEL_33:
  objc_msgSend(v6, "key");
  v48 = objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    v49 = (void *)v48;
    -[UIKeyboardLayoutStar preTouchKeyplaneName](self, "preTouchKeyplaneName");
    v50 = (UIKBTree *)objc_claimAutoreleasedReturnValue();
    if (v50
      || (objc_msgSend(v6, "keyplane"), v50 = (UIKBTree *)objc_claimAutoreleasedReturnValue(), v50 == self->_keyplane))
    {

    }
    else
    {
      objc_msgSend(v6, "keyplane");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = objc_msgSend(v71, "looksLikeShiftAlternate");

      if (v72)
      {
        -[UIKeyboardLayoutStar setActiveKey:](self, "setActiveKey:", v7);
        objc_msgSend(v6, "setKey:", v7);
        objc_msgSend(v6, "setKeyplane:", self->_keyplane);
        goto LABEL_70;
      }
    }
  }
  objc_msgSend(v6, "key");
  v51 = objc_claimAutoreleasedReturnValue();
  if (v51)
  {
    v52 = (void *)v51;
    -[UIKeyboardLayoutStar preTouchKeyplaneName](self, "preTouchKeyplaneName");
    v53 = objc_claimAutoreleasedReturnValue();
    if (v53)
    {
      v54 = (void *)v53;
      v55 = -[UIKeyboardLayoutStar isShiftKeyBeingHeld](self, "isShiftKeyBeingHeld");

      if (!v55)
        goto LABEL_39;
    }
    else
    {

    }
    objc_msgSend(v6, "key");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v73, "state") == 1)
      goto LABEL_87;
    objc_msgSend(v6, "key");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v74, "interactionType") != 14)
    {
      objc_msgSend(v6, "key");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v75, "interactionType") != 38)
      {
        objc_msgSend(v6, "key");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v79, "state") == 4)
        {
          objc_msgSend(v6, "key");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          v81 = objc_msgSend(v80, "interactionType");

          if (v81 == 10)
            goto LABEL_88;
        }
        else
        {

        }
        objc_msgSend(v6, "key");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIKeyboardLayoutStar setState:forKey:](self, "setState:forKey:", 2, v73);
LABEL_87:

LABEL_88:
        objc_msgSend(v6, "initialPoint");
        v83 = v9 - v82;
        objc_msgSend(v6, "initialPoint");
        v85 = v11 - v84;
        if ((float)((float)(v83 * v83) + (float)(v85 * v85)) <= 10000.0)
          goto LABEL_91;
        -[UIKeyboardLayoutStar setActiveKey:](self, "setActiveKey:", 0);
        goto LABEL_90;
      }

    }
    goto LABEL_87;
  }
LABEL_39:
  -[UIKeyboardLayoutStar preTouchKeyplaneName](self, "preTouchKeyplaneName");
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  if (v56)
  {
    self->_revertKeyplaneAfterTouch = 1;
    if (objc_msgSend(v7, "interactionType") != 13
      && objc_msgSend(v7, "interactionType") != 4
      && (-[UIKeyboardLayoutStar upActionFlagsForKey:](self, "upActionFlagsForKey:", v7) & 2) != 0)
    {
      objc_msgSend(v12, "setInputPoint:", v9, v11);
      -[UIKeyboardLayoutStar setActiveKey:](self, "setActiveKey:", v7);
      objc_msgSend(v6, "setKey:", v7);
      objc_msgSend(v6, "setKeyplane:", self->_keyplane);
      objc_msgSend(v6, "slidOffKey");
      v57 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v57, "interactionType") != 11)
      {
        objc_msgSend(v6, "slidOffKey");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = objc_msgSend(v58, "interactionType");

        if (v59 == 14)
          goto LABEL_54;
        v60 = self->_keyplane;
        objc_msgSend(v6, "slidOffKey");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "name");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIKBTree keysByKeyName:](v60, "keysByKeyName:", v62);
        v63 = (void *)objc_claimAutoreleasedReturnValue();

        v112 = 0u;
        v113 = 0u;
        v110 = 0u;
        v111 = 0u;
        v57 = v63;
        v64 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v110, v118, 16);
        if (v64)
        {
          v65 = v64;
          v66 = *(_QWORD *)v111;
          do
          {
            for (j = 0; j != v65; ++j)
            {
              if (*(_QWORD *)v111 != v66)
                objc_enumerationMutation(v57);
              -[UIKeyboardLayoutStar setState:forKey:](self, "setState:forKey:", 2, *(_QWORD *)(*((_QWORD *)&v110 + 1) + 8 * j));
            }
            v65 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v110, v118, 16);
          }
          while (v65);
        }

      }
LABEL_54:
      if (objc_msgSend(v6, "continuousPathState") == 4)
        goto LABEL_91;
      goto LABEL_70;
    }
  }
LABEL_91:
  if (objc_msgSend(v12, "usesContinuousPathProgressiveCandidates")
    && objc_msgSend(v6, "continuousPathState") == 4)
  {
    if (self->_prevProgressiveCandidateRequestTime)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "timeIntervalSinceDate:", self->_prevProgressiveCandidateRequestTime);
      v88 = v87;

      if (v88 > 0.2)
      {
        objc_msgSend(v12, "generateCandidatesWithOptions:", 12);
        progressiveCandidateUpdateTimer = self->_progressiveCandidateUpdateTimer;
        if (progressiveCandidateUpdateTimer)
          -[NSTimer invalidate](progressiveCandidateUpdateTimer, "invalidate");
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v90 = (NSDate *)objc_claimAutoreleasedReturnValue();
        prevProgressiveCandidateRequestTime = self->_prevProgressiveCandidateRequestTime;
        self->_prevProgressiveCandidateRequestTime = v90;

      }
    }
    if (!-[NSTimer isValid](self->_progressiveCandidateUpdateTimer, "isValid"))
    {
      v92 = (void *)MEMORY[0x1E0C99E88];
      v104 = MEMORY[0x1E0C809B0];
      v105 = 3221225472;
      v106 = __62__UIKeyboardLayoutStar_completeHitTestForTouchDragged_hitKey___block_invoke;
      v107 = &unk_1E16B2600;
      v108 = self;
      v109 = v12;
      objc_msgSend(v92, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v104, 0.2);
      v93 = (NSTimer *)objc_claimAutoreleasedReturnValue();
      v94 = self->_progressiveCandidateUpdateTimer;
      self->_progressiveCandidateUpdateTimer = v93;

    }
  }
  objc_msgSend(v6, "key", v104, v105, v106, v107, v108);
  v95 = objc_claimAutoreleasedReturnValue();
  if (v95)
  {
    v96 = (void *)v95;
    objc_msgSend(v6, "key");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v97, "interactionType") == 9)
    {

    }
    else
    {
      objc_msgSend(v6, "key");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      v99 = objc_msgSend(v98, "interactionType");

      if (v99 != 5)
      {
        -[UIKeyboardLayoutStar activeKey](self, "activeKey");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v100, "interactionType") == 13)
        {
          v101 = objc_msgSend(v12, "returnKeyEnabled");

          if ((v101 & 1) == 0)
            goto LABEL_110;
        }
        else
        {

        }
        objc_msgSend(v6, "key");
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        v103 = -[UIKeyboardLayoutStar downActionFlagsForKey:](self, "downActionFlagsForKey:", v102);

        if (v103 < 0)
          objc_msgSend(v12, "touchLongPressTimerWithDelay:", 1.5);
      }
    }
  }
LABEL_110:

}

void __62__UIKeyboardLayoutStar_completeHitTestForTouchDragged_hitKey___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 1416))
  {
    objc_msgSend(*(id *)(a1 + 40), "generateCandidatesWithOptions:", 12);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 1296);
    *(_QWORD *)(v3 + 1296) = v2;

  }
}

- (int64_t)defaultSelectedVariantIndexForKey:(id)a3 withActions:(unint64_t)a4
{
  int v4;
  id v6;
  int64_t v7;

  v4 = a4;
  v6 = a3;
  if (objc_msgSend(v6, "variantType") != 10)
  {
    if (objc_msgSend(v6, "variantType") == 11 || objc_msgSend(v6, "variantType") == 13)
    {
      v7 = objc_msgSend(v6, "selectedVariantIndex");
      goto LABEL_6;
    }
    if ((v4 & 0x80000000) == 0
      && (-[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") != 1
       && -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") != 24
       && -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") != 25
       && -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") != 26
       && -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") != 23
       || -[UIKeyboardLayout isFloating](self, "isFloating")
       || objc_msgSend(v6, "displayType") == 7))
    {
      v7 = 0;
      goto LABEL_6;
    }
  }
  v7 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_6:

  return v7;
}

- (void)updateSelectedVariantIndexForKey:(id)a3 withActions:(unint64_t)a4 withPoint:(CGPoint)a5
{
  double y;
  double x;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  float v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  double v24;
  float v25;
  void *v26;
  void *v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;
  CGPoint v35;
  CGRect v36;

  y = a5.y;
  x = a5.x;
  v34 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = objc_msgSend(v9, "selectedVariantIndex");
  objc_msgSend(v9, "setSelectedVariantIndex:", -[UIKeyboardLayoutStar defaultSelectedVariantIndexForKey:withActions:](self, "defaultSelectedVariantIndexForKey:withActions:", v9, a4));
  if (-[UIKeyboardLayoutStar useCrescendoLayout](self, "useCrescendoLayout"))
  {
    -[TUIKeyplaneView changingSelectedVariantForKey:atPoint:isDragging:](self->_liveKeyplaneView, "changingSelectedVariantForKey:atPoint:isDragging:", v9, a4 == 0, x, y);
  }
  else
  {
    if ((a4 & 0x80000000) != 0
      || objc_msgSend(v9, "variantType") == 10
      || objc_msgSend(v9, "variantType") == 12)
    {
      objc_msgSend(v9, "frame");
      v35.x = x;
      v35.y = y;
      if (CGRectContainsPoint(v36, v35))
      {
        objc_msgSend(v9, "setSelectedVariantIndex:", 0x7FFFFFFFFFFFFFFFLL);
        goto LABEL_23;
      }
    }
    v28 = v10;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    objc_msgSend(v9, "subtrees");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v12)
    {
      v13 = v12;
      v14 = 0;
      v15 = *(_QWORD *)v30;
      v16 = 80.0;
LABEL_10:
      v17 = 0;
      v18 = v14;
      while (1)
      {
        if (*(_QWORD *)v30 != v15)
          objc_enumerationMutation(v11);
        v19 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v17);
        if (objc_msgSend(v19, "state") != 1)
        {
          objc_msgSend(v19, "frame");
          UIDistanceBetweenPointAndRect(x, y, v20, v21, v22, v23);
          v25 = v24;
          if (v16 > v25)
          {
            objc_msgSend(v19, "displayString");
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v26)
              NSLog(CFSTR("nil key!"));
            objc_msgSend(v9, "setSelectedVariantIndex:", v18 + v17);
            v16 = v25;
            if (fabsf(v25) < 2.2204e-16)
              break;
          }
        }
        if (v13 == ++v17)
        {
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
          v14 = v18 + v17;
          if (v13)
            goto LABEL_10;
          break;
        }
      }
    }

    v10 = v28;
  }
  if (v10 != objc_msgSend(v9, "selectedVariantIndex"))
  {
    self->_selectedVariantIndexChanged = 1;
    -[UIKeyboardLayoutStar slideBehaviour](self, "slideBehaviour");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "selectionChanged");

  }
LABEL_23:

}

- (void)updatePanAlternativesForTouchInfo:(id)a3
{
  id v4;
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
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  v4 = a3;
  objc_msgSend(v4, "key");
  v30 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "paddedFrame");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "initialDragPoint");
  v10 = v9;
  objc_msgSend(v4, "initialPoint");
  v12 = v10 - v11;
  objc_msgSend(v4, "initialDragPoint");
  v14 = v13;
  objc_msgSend(v4, "initialPoint");
  v16 = v15;

  v17 = v14 - v16;
  v18 = v12 / v6;
  v19 = v17 / v8;
  v20 = 45.0 / v8;
  if (objc_msgSend(v30, "displayType") == 7)
    v20 = 0.6;
  objc_msgSend(v30, "secondaryDisplayStrings");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");

  if (v22 != 1)
  {
    objc_msgSend(v30, "secondaryDisplayStrings");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "count");

    if (v24 != 2)
      goto LABEL_14;
    if (v19 > v20)
    {
      if (v18 <= -0.3)
      {
        v25 = v30;
        v26 = 1;
      }
      else
      {
        if (v18 < 0.3)
          goto LABEL_14;
        v25 = v30;
        v26 = 0;
      }
      goto LABEL_13;
    }
LABEL_12:
    v25 = v30;
    v26 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_13:
    objc_msgSend(v25, "setSelectedVariantIndex:", v26);
    goto LABEL_14;
  }
  if (v19 <= v20)
    goto LABEL_12;
  objc_msgSend(v30, "setSelectedVariantIndex:", 0);
  if (!-[UIKeyboardLayoutStar isDeveloperGestureKeybaord](self, "isDeveloperGestureKeybaord"))
    self->_hasPeekedGestureKey = 1;
LABEL_14:
  if (v19 > 0.25)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "clearLongPressTimer");

  }
  if (self->_keyboardImageViewIsDim && objc_msgSend(v30, "selectedVariantIndex") != 0x7FFFFFFFFFFFFFFFLL)
    -[UIKeyboardLayoutStar setKeyboardDim:](self, "setKeyboardDim:", 0);
  -[UIKeyboardLayoutStar viewForKey:](self, "viewForKey:", v30);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardLayoutStar keyViewAnimator](self, "keyViewAnimator");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "updateTransitionForKeyView:normalizedDragSize:", v28, -v18, v19);

}

- (void)resetPanAlternativesForEndedTouch:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "key");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardLayoutStar viewForKey:](self, "viewForKey:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardLayoutStar keyViewAnimator](self, "keyViewAnimator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endTransitionForKeyView:", v4);

}

- (BOOL)performReturnAction
{
  const char *returnAction;
  id returnTarget;

  returnAction = self->_returnAction;
  if (returnAction)
  {
    returnTarget = self->_returnTarget;
    if (dyld_program_sdk_at_least())
      objc_msgSend(returnTarget, returnAction);
    else
      objc_msgSend(returnTarget, sel_performSelector_, returnAction);
  }
  return returnAction != 0;
}

- (BOOL)performSpaceAction
{
  const char *spaceAction;
  id spaceTarget;

  spaceAction = self->_spaceAction;
  if (spaceAction)
  {
    spaceTarget = self->_spaceTarget;
    if (dyld_program_sdk_at_least())
      objc_msgSend(spaceTarget, spaceAction);
    else
      objc_msgSend(spaceTarget, sel_performSelector_, spaceAction);
  }
  return spaceAction != 0;
}

- (void)refreshGhostKeyState
{
  UIDelayedAction *delayedCentroidUpdate;
  UIDelayedAction *v4;
  UIDelayedAction *v5;

  if (-[UIKBTree isSplit](self->_keyplane, "isSplit"))
  {
    if (!self->_ghostKeysEnabled)
      -[UIKeyboardLayoutStar updateKeyCentroids](self, "updateKeyCentroids");
    delayedCentroidUpdate = self->_delayedCentroidUpdate;
    if (!delayedCentroidUpdate)
    {
      v4 = -[UIDelayedAction initWithTarget:action:userInfo:delay:]([UIDelayedAction alloc], "initWithTarget:action:userInfo:delay:", self, sel_updateKeyCentroids, 0, 1.0);
      v5 = self->_delayedCentroidUpdate;
      self->_delayedCentroidUpdate = v4;

      delayedCentroidUpdate = self->_delayedCentroidUpdate;
    }
    -[UIDelayedAction touch](delayedCentroidUpdate, "touch");
  }
  else if (self->_delayedCentroidUpdate)
  {
    -[UIKeyboardLayoutStar cancelDelayedCentroidUpdate](self, "cancelDelayedCentroidUpdate");
  }
}

- (void)cancelDelayedCentroidUpdate
{
  UIDelayedAction *delayedCentroidUpdate;

  -[UIDelayedAction cancel](self->_delayedCentroidUpdate, "cancel");
  delayedCentroidUpdate = self->_delayedCentroidUpdate;
  self->_delayedCentroidUpdate = 0;

}

- (void)handleDelayedCentroidUpdate
{
  UIDelayedAction *v3;
  void *v4;
  UIDelayedAction *v5;
  _QWORD v6[4];
  UIDelayedAction *v7;
  UIKeyboardLayoutStar *v8;
  id v9;
  id location;

  v3 = self->_delayedCentroidUpdate;
  objc_initWeak(&location, self);
  -[UIKeyboardLayout taskQueue](self, "taskQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__UIKeyboardLayoutStar_handleDelayedCentroidUpdate__block_invoke;
  v6[3] = &unk_1E16D41C0;
  v5 = v3;
  v7 = v5;
  v8 = self;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v4, "addTask:", v6);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __51__UIKeyboardLayoutStar_handleDelayedCentroidUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1024))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v5 = WeakRetained;
    if (WeakRetained)
      objc_msgSend(WeakRetained, "updateKeyCentroids");

    v3 = v6;
  }
  objc_msgSend(v3, "returnExecutionToParent");

}

- (BOOL)shouldRetestTouchUp:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  __objc2_class *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  int v25;
  void *v27;
  void *v28;
  void *v29;
  BOOL v30;

  v4 = a3;
  objc_msgSend(v4, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = 0;
  if (!v4 || !v5)
    goto LABEL_36;
  if (!objc_msgSend(v5, "allowRetestAfterCommittingDownActions"))
  {
LABEL_35:
    v7 = 0;
    goto LABEL_36;
  }
  objc_msgSend(v4, "key");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "displayTypeHint") != 10)
    goto LABEL_9;
  objc_msgSend(v4, "key");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "state") == 20)
  {
LABEL_8:

LABEL_9:
    goto LABEL_10;
  }
  objc_msgSend(v4, "key");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "state") == 2)
  {

    goto LABEL_8;
  }
  objc_msgSend(v4, "slidOffKey");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
    goto LABEL_35;
LABEL_10:
  if (-[UIKeyboardPinchGestureRecognizer pinchDetected](self->_pinchGestureRecognizer, "pinchDetected"))
    goto LABEL_35;
  objc_msgSend(v4, "key");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "interactionType");

  if (v12 != 5)
  {
    if (v12 != 6)
    {
      if (v12 == 9)
      {
        objc_msgSend(v4, "key");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "displayType");

        if (v14 == 13)
          goto LABEL_15;
      }
      goto LABEL_26;
    }
    +[UIKeyboardSplitControlMenu sharedInstance](UIKeyboardSplitControlMenu, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "isVisible"))
    {
      v18 = UIKeyboardSplitControlMenu;
LABEL_23:
      -[__objc2_class sharedInstance](v18, "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_28;
    }
    goto LABEL_27;
  }
  if (+[UIDictationController viewMode](UIDictationController, "viewMode") == 1)
  {
    +[UIKeyboardDictationMenu sharedInstance](UIKeyboardDictationMenu, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "isVisible"))
    {
      v18 = UIKeyboardDictationMenu;
      goto LABEL_23;
    }
LABEL_27:
    v16 = 0;
    goto LABEL_28;
  }
  +[UIDictationConnectionPreferences sharedInstance](UIDictationConnectionPreferences, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v15, "dictationIsEnabled"))
    goto LABEL_27;
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "enabledDictationLanguages");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count");

  if (v21 >= 2)
  {
LABEL_15:
    +[UIInputSwitcherView sharedInstance](UIInputSwitcherView, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
LABEL_28:

    goto LABEL_29;
  }
LABEL_26:
  v16 = 0;
LABEL_29:
  objc_msgSend(v4, "key");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    objc_msgSend(v4, "key");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[UIKeyboardLayoutStar stateForKey:](self, "stateForKey:", v24);

    if (v25 == 16 && !v16)
      goto LABEL_35;
  }
  if (v16 && -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") != 3
    || -[UIKBTree shouldSuppressDragRetest](self->_keyplane, "shouldSuppressDragRetest"))
  {
    goto LABEL_35;
  }
  objc_msgSend(v4, "key");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "slidOffKey");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyplane");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[UIKeyboardLayoutStar shouldRetestKey:slidOffKey:withKeyplane:](self, "shouldRetestKey:slidOffKey:withKeyplane:", v27, v28, v29);

  v7 = v30 || objc_msgSend(v4, "continuousPathState") == 4;
LABEL_36:

  return v7;
}

- (void)touchUp:(id)a3 executionContext:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  CFAbsoluteTime Current;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  _BOOL4 v33;
  void *v34;
  int v35;
  void *v36;
  id touchInfo;
  NSTimer *flickPopuptimer;
  NSTimer *v39;
  id v40;
  void *v41;
  TUIKeyplaneView *liveKeyplaneView;
  void *v43;
  void *v44;
  int v45;
  _QWORD v46[5];
  id v47;
  SEL v48;
  CFAbsoluteTime v49;
  double v50;
  _QWORD v51[5];
  id v52;

  v7 = a3;
  v8 = a4;
  if (v7)
  {
    -[UIKeyboardLayoutStar infoForTouch:](self, "infoForTouch:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[UIKeyboardLayoutStar preventPaddlesForPointerTouches](self, "preventPaddlesForPointerTouches"))
    {
      objc_msgSend(v9, "key");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setPreventPaddle:", 0);

    }
    if (objc_msgSend(v9, "delayed")
      && !self->_didLongPress
      && objc_msgSend(v9, "continuousPathState") == 1)
    {
      objc_msgSend(v9, "key");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[UIKeyboardLayoutStar downActionFlagsForKey:](self, "downActionFlagsForKey:", v11);

      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "clearLongPressTimer");

      objc_msgSend(v9, "setDelayed:", 0);
      objc_msgSend(v9, "key");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v51[0] = MEMORY[0x1E0C809B0];
      v51[1] = 3221225472;
      v51[2] = __49__UIKeyboardLayoutStar_touchUp_executionContext___block_invoke;
      v51[3] = &unk_1E16BB0D8;
      v51[4] = self;
      v52 = v7;
      objc_msgSend(v8, "childWithContinuation:", v51);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardLayoutStar completeCommitTouchesPrecedingTouchDownWithKey:withActions:executionContext:](self, "completeCommitTouchesPrecedingTouchDownWithKey:withActions:executionContext:", v14, v12, v15);

LABEL_51:
      goto LABEL_52;
    }
    objc_msgSend(v9, "addTouch:", v7);
    if (v9)
      goto LABEL_10;
  }
  objc_msgSend(v7, "locationInView:", self);
  v9 = 0;
  if (-[UIKeyboardLayoutStar pointInside:forEvent:](self, "pointInside:forEvent:", 0))
  {
LABEL_10:
    Current = CFAbsoluteTimeGetCurrent();
    v17 = Current - self->_prevTouchUpTime;
    -[_UIKeyboardTypingSpeedLogger recordTypingDelay:](self->_typingSpeedLogger, "recordTypingDelay:", v17);
    if (!-[UIKeyboardLayoutStar hasActiveContinuousPathInput](self, "hasActiveContinuousPathInput")
      && objc_msgSend(v9, "continuousPathState") != 4)
    {
      -[UIKeyboardLayout typingStyleEstimator](self, "typingStyleEstimator");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "tapTypedKey");

      -[UIKeyboardLayoutStar clearContinuousPathView](self, "clearContinuousPathView");
    }
    objc_msgSend(v9, "key");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "interactionType") != 17)
    {
      objc_msgSend(v9, "key");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v20, "interactionType") != 12)
      {
        objc_msgSend(v9, "key");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v21, "interactionType") != 38)
        {
          objc_msgSend(v9, "key");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_msgSend(v36, "interactionType");

          if (v45 != 9)
            self->_prevTouchUpTime = Current;
LABEL_19:
          +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIKeyboardLayoutStar refreshGhostKeyState](self, "refreshGhostKeyState");
          if (_AXSZoomTouchEnabled()
            || -[UIKeyboardLayoutStar playKeyClickSoundOn](self, "playKeyClickSoundOn") == 2)
          {
            objc_msgSend(v9, "key");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "interactionType");

            if (v24 == 13)
            {
              if ((objc_msgSend(v22, "returnKeyEnabled") & 1) == 0)
                goto LABEL_27;
            }
            else if (!v7)
            {
              objc_msgSend(v9, "key");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              -[UIKeyboardLayoutStar playKeyReleaseSoundForKey:](self, "playKeyReleaseSoundForKey:", v27);

              goto LABEL_30;
            }
            objc_msgSend(v9, "key");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIKeyboardLayoutStar playKeyClickSoundForKey:](self, "playKeyClickSoundForKey:", v25);

          }
LABEL_27:
          objc_msgSend(v9, "key");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIKeyboardLayoutStar playKeyReleaseSoundForKey:](self, "playKeyReleaseSoundForKey:", v26);

          if (v7)
          {
LABEL_31:
            objc_msgSend(v22, "setShiftNeedsUpdate");
            -[UIKeyboardLayoutStar slideBehaviour](self, "slideBehaviour");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "userInteractionEnded");

            -[UIKeyboardLayoutStar setSlideBehaviour:](self, "setSlideBehaviour:", 0);
            objc_msgSend(v9, "key");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v30, "interactionType");

            if (v31 == 16)
            {
              if ((objc_msgSend(v9, "dragged") & 1) == 0)
              {
                objc_msgSend(v9, "key");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v32, "flickDirection") == -3)
                {
                  v33 = -[UIKeyboardLayoutStar touchPassesDragThreshold:](self, "touchPassesDragThreshold:", v9);

                  if (v33)
                    -[UIKeyboardLayoutStar handleFlick:](self, "handleFlick:", v9);
                }
                else
                {

                }
              }
              touchInfo = self->_touchInfo;
              if (touchInfo)
              {
                self->_touchInfo = 0;

              }
              -[UIKeyboardLayoutStar setKeyboardDim:](self, "setKeyboardDim:", 0);
              flickPopuptimer = self->_flickPopuptimer;
              if (flickPopuptimer)
              {
                -[NSTimer invalidate](flickPopuptimer, "invalidate");
                v39 = self->_flickPopuptimer;
                self->_flickPopuptimer = 0;

              }
            }
            else
            {
              objc_msgSend(v9, "key");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = objc_msgSend(v34, "displayTypeHint");

              if (v35 == 10)
                -[UIKeyboardLayoutStar resetPanAlternativesForEndedTouch:](self, "resetPanAlternativesForEndedTouch:", v9);
            }
            if (-[UIKeyboardLayoutStar shouldRetestTouchUp:](self, "shouldRetestTouchUp:", v9))
            {
              v46[0] = MEMORY[0x1E0C809B0];
              v46[1] = 3221225472;
              v46[2] = __49__UIKeyboardLayoutStar_touchUp_executionContext___block_invoke_2;
              v46[3] = &unk_1E16D4330;
              v48 = a2;
              v46[4] = self;
              v40 = v9;
              v47 = v40;
              v49 = Current;
              v50 = v17;
              objc_msgSend(v8, "childWithContinuation:", v46);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              -[UIKeyboardLayoutStar performHitTestForTouchInfo:touchStage:executionContextPassingUIKBTree:](self, "performHitTestForTouchInfo:touchStage:executionContextPassingUIKBTree:", v40, 1, v41);

            }
            else
            {
              if ((objc_opt_respondsToSelector() & 1) != 0)
              {
                liveKeyplaneView = self->_liveKeyplaneView;
                objc_msgSend(v9, "key");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v9, "touch");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v44, "locationInView:", self);
                -[TUIKeyplaneView finishedSelectingVariantForKey:atPoint:](liveKeyplaneView, "finishedSelectingVariantForKey:atPoint:", v43);

              }
              -[UIKeyboardLayoutStar completeRetestForTouchUp:timestamp:interval:executionContext:](self, "completeRetestForTouchUp:timestamp:interval:executionContext:", v9, v8, Current, v17);
            }

            goto LABEL_51;
          }
LABEL_30:
          -[UIKeyboardLayoutStar activeKey](self, "activeKey");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIKeyboardLayoutStar setState:forKey:](self, "setState:forKey:", 2, v28);

          -[UIKeyboardLayoutStar setActiveKey:](self, "setActiveKey:", 0);
          goto LABEL_31;
        }

      }
    }

    goto LABEL_19;
  }
  objc_msgSend(v8, "returnExecutionToParent");
LABEL_52:

}

uint64_t __49__UIKeyboardLayoutStar_touchUp_executionContext___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "touchUp:executionContext:", *(_QWORD *)(a1 + 40), a2);
}

void __49__UIKeyboardLayoutStar_touchUp_executionContext___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  id v21;

  v21 = a2;
  objc_msgSend(v21, "info");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    objc_msgSend(v21, "info");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 48);
      v9 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v21, "info");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, CFSTR("UIKeyboardLayoutStar.m"), 9295, CFSTR("UIKeyboardTask %s expected UIKBTree but received %@"), "-[UIKeyboardLayoutStar touchUp:executionContext:]_block_invoke_2", v10);

    }
  }
  objc_msgSend(v21, "info");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "activeTouchInfoForShift");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v13 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "key");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setState:forKey:", 2, v14);

  }
  objc_msgSend(*(id *)(a1 + 32), "preTouchKeyplaneName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *(void **)(a1 + 40);
  if (v15)
  {
    objc_msgSend(v16, "key");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "modifiesKeyplane") && (objc_msgSend(v11, "modifiesKeyplane") & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "slidOffKey");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setMaySuppressUpAction:", v18 == 0);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "setMaySuppressUpAction:", 0);
    }

  }
  else
  {
    objc_msgSend(v16, "setMaySuppressUpAction:", 0);
  }

  objc_msgSend(*(id *)(a1 + 40), "key");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "interactionType") == 11)
  {
    v20 = objc_msgSend(v11, "interactionType");

    if (v20 == 6)
      goto LABEL_18;
  }
  else
  {

  }
  objc_msgSend(*(id *)(a1 + 40), "setKey:", v11);
LABEL_18:
  objc_msgSend(*(id *)(a1 + 40), "setKeyplane:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 648));
  objc_msgSend(*(id *)(a1 + 32), "completeRetestForTouchUp:timestamp:interval:executionContext:", *(_QWORD *)(a1 + 40), v21, *(double *)(a1 + 56), *(double *)(a1 + 64));

}

- (void)handleKeyboardMenusForTouch:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  id v26;
  CGPoint v27;
  CGPoint v28;
  CGRect v29;
  CGRect v30;

  v26 = a3;
  objc_msgSend(v26, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "interactionType");

  objc_msgSend(v26, "key");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "interactionType") == 9)
  {
    objc_msgSend(v26, "key");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "displayType") == 13 && objc_msgSend(v26, "dragged"))
    {

      goto LABEL_7;
    }

  }
  if (v5 != 5)
  {
    v9 = 0;
    goto LABEL_14;
  }
LABEL_7:
  +[UIInputSwitcherView sharedInstance](UIInputSwitcherView, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  self->_dictationUsingServerManualEndpointing = 0;
  if (v8)
  {
    objc_msgSend(v8, "superview");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v26, "touch");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "key");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardLayoutStar viewForKey:](self, "viewForKey:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "locationInView:", v13);
      v15 = v14;
      v17 = v16;
      objc_msgSend(v11, "locationInView:", v9);
      v19 = v18;
      v21 = v20;
      if (v5 == 5 && (objc_msgSend(v9, "bounds"), v27.x = v19, v27.y = v21, !CGRectContainsPoint(v29, v27)))
      {
        objc_msgSend(v13, "bounds");
        v28.x = v15;
        v28.y = v17;
        if (CGRectContainsPoint(v30, v28))
        {
          v23 = +[UIDictationController specificReasonTypeMicButtonOnKeyboard](UIDictationController, "specificReasonTypeMicButtonOnKeyboard");
          +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setReasonType:", v23);

          +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "switchToDictationInputModeWithTouch:", 0);

        }
      }
      else
      {
        objc_msgSend(v9, "selectItemAtPoint:", v19, v21);
      }
      objc_msgSend(v26, "key");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardLayoutStar setState:forKey:](self, "setState:forKey:", 2, v22);

    }
  }
LABEL_14:

}

- (BOOL)shouldSendTouchUpToInputManager:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  int v8;
  BOOL v9;

  v3 = a3;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "canHandleKeyHitTest"))
    goto LABEL_4;
  objc_msgSend(v3, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isExemptFromInputManagerLayout");

  if ((v6 & 1) != 0
    || (objc_msgSend(v3, "key"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "interactionType"),
        v7,
        v8 == 4))
  {
LABEL_4:
    v9 = 0;
  }
  else
  {
    v9 = !objc_msgSend(v4, "canHandleKeyHitTest")
      || !objc_msgSend(v3, "stage")
      || objc_msgSend(v3, "stage") == 1;
  }

  return v9;
}

- (void)_recordKeystrokeStatisticForKeyPress
{
  if (-[UIKeyboardLayoutStar currentHandBias](self, "currentHandBias"))
    +[_UIKeyboardUsageTracking countKeystrokeForReachableKeyboardWithBias:](_UIKeyboardUsageTracking, "countKeystrokeForReachableKeyboardWithBias:", -[UIKeyboardLayoutStar currentHandBias](self, "currentHandBias"));
}

- (void)completeRetestForTouchUp:(id)a3 timestamp:(double)a4 interval:(double)a5 executionContext:(id)a6
{
  id v10;
  _UNKNOWN **v11;
  void *v12;
  void *v13;
  _BOOL4 didLongPress;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  int v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  unint64_t v43;
  int v44;
  void *v45;
  uint64_t v46;
  int *v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  double v54;
  CGFloat v55;
  double v56;
  CGFloat v57;
  double v58;
  CGFloat v59;
  double v60;
  CGFloat v61;
  void *v62;
  BOOL v63;
  void *v64;
  _BOOL4 v65;
  void *v66;
  void *v67;
  BOOL v68;
  void *v69;
  void *v70;
  UIKBScreenTraits *screenTraits;
  _BOOL4 isFirstPartyStickers;
  void *v73;
  UIKBTree *v74;
  UIKBTree *keyplane;
  void *v76;
  char v77;
  void *v78;
  int v79;
  int *v80;
  void *v81;
  int v82;
  void *v83;
  void *v84;
  _BOOL4 v85;
  _UNKNOWN **v86;
  unint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  unint64_t v96;
  int v97;
  uint64_t v98;
  void *v99;
  void *v100;
  id deleteTarget;
  uint64_t v102;
  const char *v103;
  void *v104;
  int v105;
  uint64_t v106;
  void *v107;
  int v108;
  UIView *flickPopupView;
  void *v110;
  void *v111;
  void *v112;
  _BOOL4 v113;
  void *v114;
  void *v115;
  UIKBTree *v116;
  UIKBTree *v117;
  char v118;
  int v119;
  void *v120;
  int v121;
  char v122;
  _UNKNOWN **v123;
  void *v124;
  int v125;
  uint64_t v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  int v131;
  void *v132;
  void *v133;
  unint64_t v134;
  void *v135;
  void *v136;
  void *v137;
  id v138;
  void *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  unint64_t v143;
  void *v144;
  int v145;
  uint64_t v146;
  unint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  void *v152;
  void *v153;
  void *v154;
  unint64_t v155;
  void *v156;
  __CFString *v157;
  void *v158;
  __CFString *v159;
  int v160;
  void *v161;
  void *v162;
  unint64_t v163;
  unint64_t v164;
  __CFString *v165;
  uint64_t v166;
  _BOOL4 v167;
  __CFString *v168;
  void *v169;
  void *v170;
  unint64_t v171;
  void *v172;
  int v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  int v179;
  void *v180;
  void *v181;
  void *v182;
  __CFString *v183;
  void *v184;
  int v185;
  void *v186;
  void *v187;
  int v188;
  void *v189;
  uint64_t v190;
  void *v191;
  void *v192;
  __CFString *v193;
  void *v194;
  __CFString *v195;
  int v196;
  void *v197;
  void *v198;
  int64_t v199;
  void *v200;
  uint64_t v201;
  uint64_t v202;
  unint64_t v203;
  void *v204;
  void *v205;
  uint64_t v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  uint64_t v217;
  uint64_t v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  char v223;
  void *v224;
  void *v225;
  unint64_t v226;
  unint64_t v227;
  void *v228;
  BOOL v229;
  UIKBTree *v230;
  UIKBTree *multitapKey;
  void *v232;
  void *v233;
  __CFString *v234;
  int v235;
  void *v236;
  void *v237;
  void *v238;
  int v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  uint64_t v244;
  int64_t v245;
  int v246;
  int v247;
  uint64_t v248;
  uint64_t v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  void *v255;
  uint64_t v256;
  uint64_t v257;
  void *v258;
  void *v259;
  void *v260;
  void *v261;
  void *v262;
  void *v263;
  void *v264;
  uint64_t v265;
  void *v266;
  uint64_t v267;
  uint64_t v268;
  void *v269;
  void *v270;
  void *v271;
  void *v272;
  UIKBKeyplaneView *keyplaneView;
  BOOL v274;
  BOOL v275;
  char v276;
  char v277;
  void *v278;
  void *v279;
  void *v280;
  void *v281;
  void *v282;
  void *v283;
  __CFString *v284;
  int v285;
  _BOOL4 v286;
  _BOOL4 v287;
  void *v288;
  unint64_t prevUpActions;
  unint64_t v290;
  unint64_t v291;
  unint64_t v292;
  void *v293;
  void *v294;
  void *v295;
  id v296;
  _QWORD v297[4];
  id v298;
  UIKeyboardLayoutStar *v299;
  uint64_t v300;
  unint64_t v301;
  double v302;
  double v303;
  unint64_t v304;
  BOOL v305;
  CGPoint v306;
  CGRect v307;

  v10 = a3;
  v296 = a6;
  v11 = &off_1E167A000;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "touch");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  didLongPress = self->_didLongPress;
  self->_didLongPress = 0;
  objc_msgSend(v12, "stopAutoDelete");
  -[UIKeyboardLayoutStar _cleanUpBlinkAssertionIfNecessary](self, "_cleanUpBlinkAssertionIfNecessary");
  objc_msgSend(v10, "key");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "continuousPathState") == 4)
  {
    -[UIKeyboardLayoutStar _transitionToContinuousPathState:forTouchInfo:](self, "_transitionToContinuousPathState:forTouchInfo:", 5, v10);
    goto LABEL_4;
  }
  if (v15)
  {
LABEL_4:
    if (-[UIKeyboardLayoutStar shouldSendTouchUpToInputManager:](self, "shouldSendTouchUpToInputManager:", v10))
    {
      objc_msgSend(v13, "locationInView:", self);
      v17 = v16;
      v19 = v18;
      objc_msgSend(v13, "timestamp");
      v21 = v20;
      if (objc_msgSend(v10, "continuousPathState") == 5)
      {
        v22 = -2;
      }
      else
      {
        objc_msgSend(v10, "key");
        v24 = objc_claimAutoreleasedReturnValue();
        if (v24
          && (v25 = (void *)v24,
              objc_msgSend(v10, "key"),
              v26 = (void *)objc_claimAutoreleasedReturnValue(),
              v27 = objc_msgSend(v26, "interactionType"),
              v26,
              v25,
              v27 != 11))
        {
          objc_msgSend(v10, "key");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = -[UIKeyboardLayoutStar keycodeForKey:](self, "keycodeForKey:", v28);

        }
        else
        {
          v22 = -1;
        }
      }
      v29 = (void *)MEMORY[0x1E0DBDC78];
      objc_msgSend(v13, "pathMajorRadius");
      v31 = v30;
      v32 = objc_msgSend(v13, "pathIndex");
      v33 = v13;
      v34 = objc_msgSend(v10, "fingerID");
      v35 = objc_msgSend(v10, "continuousPathState") - 1;
      if (v35 < 6)
        v36 = (v35 + 1);
      else
        v36 = 0;
      v37 = v34;
      v13 = v33;
      objc_msgSend(v29, "touchEventWithStage:location:radius:timestamp:pathIndex:fingerID:forcedKeyCode:continuousPathState:", 2, v32, v37, v22, v36, v17, v19, v31, v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setStage:", 2);
    }
    else
    {
      v23 = 0;
    }
    if (objc_msgSend(v10, "continuousPathState") == 5)
    {
      objc_msgSend(v12, "skipHitTestForTouchEvent:", v23);
      if (objc_msgSend(v12, "usesContinuousPathProgressiveCandidates"))
        v38 = 0x1000000000;
      else
        v38 = 0x1001000000;
      -[UIKeyboardLayoutStar completeSendStringActionForTouchUp:withActions:timestamp:interval:didLongPress:prevActions:executionContext:](self, "completeSendStringActionForTouchUp:withActions:timestamp:interval:didLongPress:prevActions:executionContext:", v10, v38, didLongPress, 0, v296, a4, a5);
      goto LABEL_219;
    }
    objc_msgSend(v10, "key");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = -[UIKeyboardLayoutStar stateForKey:](self, "stateForKey:", v39);

    objc_msgSend(v10, "key");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "subtrees");
    v288 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "key");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = -[UIKeyboardLayoutStar upActionFlagsForKey:](self, "upActionFlagsForKey:", v42);

    prevUpActions = self->_prevUpActions;
    self->_prevUpActions = v43;
    v285 = v40;
    v287 = didLongPress;
    if (v40 != 16 || (v43 & 0x2080000000) == 0)
      goto LABEL_57;
    v44 = objc_msgSend(v10, "initialKeyState");
    objc_msgSend(v10, "key");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "selectedVariantIndex");

    v47 = &OBJC_IVAR____UIDocumentCarouselView__items;
    if (v44 != 16)
    {
      if (v46 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v43 &= 0xFFFFFFFFFFFFFFF5;
        v11 = &off_1E167A000;
      }
      else
      {
        v11 = &off_1E167A000;
        if ((v43 & 0x2000000000) != 0 && !self->_selectedVariantIndexChanged)
          v43 &= 0xFFFFFFFFFFFFFFF5;
      }
      goto LABEL_56;
    }
    if (v46 == 0x7FFFFFFFFFFFFFFFLL)
      v43 &= ~2uLL;
    v290 = v43;
    objc_msgSend(v10, "touch");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "locationInView:", self);
    v50 = v49;
    v52 = v51;

    objc_msgSend(v10, "key");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "frame");
    v55 = v54;
    v57 = v56;
    v59 = v58;
    v61 = v60;

    objc_msgSend(v10, "key");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v62, "variantType") == 9)
    {
      v307.origin.x = v55;
      v307.origin.y = v57;
      v307.size.width = v59;
      v307.size.height = v61;
      v306.x = v50;
      v306.y = v52;
      v63 = CGRectContainsPoint(v307, v306);

      if (!v63)
      {
        v43 &= ~8uLL;
        goto LABEL_52;
      }
    }
    else
    {

    }
    v293 = v23;
    objc_msgSend(v10, "key");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v64, "variantType") == 10)
    {
      v65 = 1;
    }
    else
    {
      v278 = v13;
      objc_msgSend(v10, "key");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v66, "variantType") == 12)
      {
        v65 = 1;
      }
      else
      {
        objc_msgSend(v10, "key");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = objc_msgSend(v67, "variantType") == 13;

      }
      v13 = v278;
    }

    if (v65)
    {
      v68 = v46 == 0x7FFFFFFFFFFFFFFFLL;
      didLongPress = v287;
      v23 = v293;
      v11 = &off_1E167A000;
      v47 = &OBJC_IVAR____UIDocumentCarouselView__items;
      if (!v68)
        goto LABEL_56;
      v43 &= ~8uLL;
      if (-[UIKeyboardEmojiKeyDisplayController userHasSelectedSkinToneEmoji](self->_emojiKeyManager, "userHasSelectedSkinToneEmoji"))
      {
        -[UIKeyboardLayoutStar keyplaneFactory](self, "keyplaneFactory");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "key");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v69, "popupKeyUsesCustomKeyContentView:", v70))
        {

          goto LABEL_53;
        }
        v291 = v290 & 0xFFFFFFFFFFFFFFF7;
        screenTraits = self->super._screenTraits;
        if (screenTraits)
        {
          isFirstPartyStickers = screenTraits->_isFirstPartyStickers;

          if (isFirstPartyStickers)
          {
            v43 = v291;
LABEL_53:
            v47 = &OBJC_IVAR____UIDocumentCarouselView__items;
LABEL_56:
            *((_BYTE *)&self->super.super.super.super.isa + v47[570]) = 0;
LABEL_57:
            if ((v43 & 8) != 0)
            {
              objc_msgSend(v10, "keyplane");
              v74 = (UIKBTree *)objc_claimAutoreleasedReturnValue();
              keyplane = self->_keyplane;

              if (v74 == keyplane)
              {
                objc_msgSend(v10, "key");
                v81 = (void *)objc_claimAutoreleasedReturnValue();
                v82 = objc_msgSend(v81, "interactionType");

                if (v82 == 44)
                {
                  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
                  v83 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v83, "responder");
                  v84 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v84, "inputAssistantItem");
                  v282 = v12;
                  v85 = didLongPress;
                  v86 = v11;
                  v87 = v43;
                  v88 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v88, "_dictationReplacementAction");
                  v294 = v23;
                  v89 = v13;
                  v90 = (void *)objc_claimAutoreleasedReturnValue();

                  v43 = v87;
                  v11 = v86;
                  didLongPress = v85;
                  v12 = v282;

                  objc_msgSend(v90, "sender");
                  v91 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v90, "performWithSender:target:", v91, 0);

                  v13 = v89;
                  v23 = v294;
                }
                if (!didLongPress)
                  goto LABEL_281;
                objc_msgSend(v10, "key");
                v92 = (void *)objc_claimAutoreleasedReturnValue();
                if (-[UIKeyboardLayoutStar shouldShowInternationalMenuForKey:](self, "shouldShowInternationalMenuForKey:", v92))
                {

                  goto LABEL_59;
                }
                objc_msgSend(v10, "key");
                v95 = (void *)objc_claimAutoreleasedReturnValue();
                v96 = v43;
                v97 = objc_msgSend(v95, "interactionType");

                v68 = v97 == 5;
                v43 = v96;
                v11 = &off_1E167A000;
                if (!v68)
                {
LABEL_281:
                  if (-[UIKeyboardLayoutStar useCrescendoLayout](self, "useCrescendoLayout"))
                    v98 = 1456;
                  else
                    v98 = 696;
                  v99 = *(Class *)((char *)&self->super.super.super.super.isa + v98);
                  objc_msgSend(v10, "key");
                  v100 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v99, "addKeyToDelayedDeactivationSet:", v100);

                  if (-[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 1
                    || -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 24
                    || -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 25
                    || -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 26)
                  {
                    if (v285 != 16)
                      goto LABEL_59;
                    goto LABEL_87;
                  }
                  v245 = -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom");
                  if (v285 == 16 && v245 == 23)
LABEL_87:
                    -[UIKeyboardLayoutStar setKeyboardDim:amount:withDuration:](self, "setKeyboardDim:amount:withDuration:", 0, 0.0, 0.3);
                }
              }
            }
LABEL_59:
            objc_msgSend(v10, "key");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v76, "interactionType") == 13)
            {
              v77 = objc_msgSend(v12, "returnKeyEnabled");

              if ((v77 & 1) == 0)
              {
                objc_msgSend(v12, "skipHitTestForTouchEvent:", v23);
                objc_msgSend(v12, "clearLongPressTimer");
                objc_msgSend(v10, "setDragged:", 0);
                -[UIKeyboardLayoutStar setActiveKey:](self, "setActiveKey:", 0);
                -[UIKeyboardLayoutStar clearInfoForTouch:](self, "clearInfoForTouch:", v13);
                objc_msgSend(v296, "returnExecutionToParent");
LABEL_218:

LABEL_219:
                goto LABEL_220;
              }
            }
            else
            {

            }
            if (!didLongPress && (v43 & 0x100000) != 0 && (objc_msgSend(v10, "maySuppressUpAction") & 1) == 0)
            {
              objc_msgSend(v12, "skipHitTestForTouchEvent:", v23);

              objc_msgSend(v10, "key");
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              v79 = objc_msgSend(v78, "interactionType");

              v23 = 0;
              if (v79 > 14)
              {
                if (v79 == 15)
                {
                  v80 = &OBJC_IVAR___UIKeyboardLayoutStar__spaceTarget;
                  goto LABEL_90;
                }
                if (v79 == 42)
                {
                  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
                  v93 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v93, "systemInputAssistantViewController");
                  v94 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v94, "showEmojiSearch:", 1);

LABEL_94:
                  v23 = 0;
                }
              }
              else
              {
                if (v79 == 4)
                {
                  deleteTarget = self->_deleteTarget;
                  v102 = 880;
                  goto LABEL_91;
                }
                if (v79 == 13)
                {
                  v80 = &OBJC_IVAR___UIKeyboardLayoutStar__returnTarget;
LABEL_90:
                  deleteTarget = *(Class *)((char *)&self->super.super.super.super.isa + *v80);
                  v102 = v80[2];
LABEL_91:
                  v103 = *(const char **)((char *)&self->super.super.super.super.isa + v102);
                  if (dyld_program_sdk_at_least())
                    objc_msgSend(deleteTarget, v103);
                  else
                    objc_msgSend(deleteTarget, sel_performSelector_, v103);
                  goto LABEL_94;
                }
              }
            }
            if ((v43 & 0x200000000) != 0
              && !objc_msgSend(v12, "handleTabWithShift:", -[UIKeyboardLayoutStar isShiftKeyBeingHeld](self, "isShiftKeyBeingHeld")))
            {
              v43 |= 2uLL;
            }
            v292 = v43;
            objc_msgSend(v10, "key");
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            v105 = objc_msgSend(v104, "interactionType");

            v295 = v23;
            if (v105 != 16)
              goto LABEL_125;
            v106 = 1104;
            if (self->_flickPopupView)
            {
              objc_msgSend(v10, "key");
              v107 = (void *)objc_claimAutoreleasedReturnValue();
              v108 = objc_msgSend(v107, "state");

              if (v108 == 16)
              {
                -[UIView removeFromSuperview](self->_flickPopupView, "removeFromSuperview");
                flickPopupView = self->_flickPopupView;
                self->_flickPopupView = 0;

              }
            }
            objc_msgSend(v10, "key");
            v110 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v110, "state") & 0x10) != 0)
            {

            }
            else
            {
              objc_msgSend(v10, "key");
              v111 = (void *)objc_claimAutoreleasedReturnValue();
              v106 = objc_msgSend(v111, "flickDirection");

              if (v106 != -1)
              {
                objc_msgSend(v10, "key");
                v112 = (void *)objc_claimAutoreleasedReturnValue();
                v113 = -[UIKeyboardLayoutStar isMultitapKey:](self, "isMultitapKey:", v112);

                if (v113)
                {
                  -[UIKeyboardLayoutStar multitapCompleteKeys](self, "multitapCompleteKeys");
                  v114 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!objc_msgSend(v114, "count"))
                  {
                    objc_msgSend(v10, "key");
                    v115 = (void *)objc_claimAutoreleasedReturnValue();
                    if (!objc_msgSend(v115, "forceMultitap"))
                    {
                      v229 = -[UIKBTree supportsMultitap](self->_keyplane, "supportsMultitap");

                      if (!v229)
                      {
                        v119 = 0;
                        v118 = 0;
                        self->_multitapCount = 0;
LABEL_225:
                        objc_msgSend(v10, "key");
                        v230 = (UIKBTree *)objc_claimAutoreleasedReturnValue();
                        multitapKey = self->_multitapKey;
                        self->_multitapKey = v230;

                        v11 = &off_1E167A000;
                        if (v119)
                        {
                          objc_msgSend(v10, "key");
                          v232 = (void *)objc_claimAutoreleasedReturnValue();
                          -[UIKeyboardLayoutStar setState:forKey:](self, "setState:forKey:", 8, v232);

                          -[UIKeyboardLayoutStar touchMultitapTimer](self, "touchMultitapTimer");
                        }
                        v122 = v118;
LABEL_126:
                        objc_msgSend(v10, "key");
                        v129 = (void *)objc_claimAutoreleasedReturnValue();
                        if (objc_msgSend(v129, "interactionType") == 41)
                        {

                        }
                        else
                        {
                          objc_msgSend(v10, "key");
                          v130 = (void *)objc_claimAutoreleasedReturnValue();
                          v131 = objc_msgSend(v130, "interactionType");

                          if (v131 != 21)
                          {
                            v153 = 0;
                            v143 = prevUpActions;
                            goto LABEL_146;
                          }
                        }
                        v283 = v12;
                        objc_msgSend(v11[474], "activeInstance");
                        v132 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v132, "inputDelegate");
                        v133 = (void *)objc_claimAutoreleasedReturnValue();
                        v134 = objc_msgSend(v133, "_selectedRangeWithinMarkedText");

                        objc_msgSend(v11[474], "activeInstance");
                        v135 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v135, "markedText");
                        v136 = (void *)objc_claimAutoreleasedReturnValue();

                        if (v134 && v134 != 0x7FFFFFFFFFFFFFFFLL && v134 <= objc_msgSend(v136, "length"))
                        {
                          objc_msgSend(v136, "substringToIndex:", v134);
                          v154 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v154, "_lastGrapheme");
                          v137 = (void *)objc_claimAutoreleasedReturnValue();

                        }
                        else
                        {
                          objc_msgSend(v136, "_lastGrapheme");
                          v137 = (void *)objc_claimAutoreleasedReturnValue();
                        }
                        if (objc_msgSend(v137, "length")
                          && (-[UIKeyboardLayoutStar keyWithRepresentedString:](self, "keyWithRepresentedString:", v137),
                              v138 = (id)objc_claimAutoreleasedReturnValue(),
                              v138,
                              v138))
                        {
                          v280 = v13;
                          objc_msgSend(v138, "fullRepresentedString");
                          v139 = (void *)objc_claimAutoreleasedReturnValue();
                          v140 = objc_msgSend(v139, "rangeOfString:", v137);
                          v142 = v141;
                          v143 = prevUpActions;
                          if (objc_msgSend(v139, "length"))
                          {
                            objc_msgSend(v10, "key");
                            v144 = (void *)objc_claimAutoreleasedReturnValue();
                            v276 = v122;
                            v145 = objc_msgSend(v144, "interactionType");

                            v146 = objc_msgSend(v139, "length");
                            v147 = objc_msgSend(v139, "length");
                            if (v145 == 41)
                              v148 = v142;
                            else
                              v148 = -v142;
                            v149 = v140 + v146;
                            v143 = prevUpActions;
                            v150 = objc_msgSend(v139, "rangeOfComposedCharacterSequenceAtIndex:", (v148 + v149) % v147);
                            objc_msgSend(v139, "substringWithRange:", v150, v151);
                            v152 = (void *)objc_claimAutoreleasedReturnValue();
                            -[UIKeyboardLayoutStar createKeyEventForStringAction:forKey:touchInfo:inputFlags:](self, "createKeyEventForStringAction:forKey:touchInfo:inputFlags:", v152, v138, v10, 6);
                            v153 = (void *)objc_claimAutoreleasedReturnValue();

                            v122 = v276;
                          }
                          else
                          {
                            v153 = 0;
                          }

                          v13 = v280;
                        }
                        else
                        {
                          v153 = 0;
                          v143 = prevUpActions;
                        }

                        v12 = v283;
LABEL_146:
                        v155 = v292;
                        if ((v292 & 2) == 0 || (objc_msgSend(v10, "maySuppressUpAction") & 1) != 0)
                        {
LABEL_207:
                          if ((v155 & 0x20000000) == 0)
                          {
LABEL_209:
                            +[UIKBAnalyticsDispatcher sharedInstance](UIKBAnalyticsDispatcher, "sharedInstance");
                            v216 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v216, "setAnalyticsSkipDidKeyPress:", 0);

                            v217 = objc_msgSend(v13, "inputSource");
                            if (v153)
                            {
                              objc_msgSend(v153, "setSource:", v217);
                              objc_msgSend(v153, "_modifiedInput");
                              v218 = objc_claimAutoreleasedReturnValue();
                              -[UIKeyboardLayoutStar incrementPunctuationIfNeeded:](self, "incrementPunctuationIfNeeded:", v218);

                              objc_msgSend(v12, "skipHitTestForTouchEvent:delayed:", v295, 1);
                              v297[0] = MEMORY[0x1E0C809B0];
                              v297[1] = 3221225472;
                              v297[2] = __85__UIKeyboardLayoutStar_completeRetestForTouchUp_timestamp_interval_executionContext___block_invoke;
                              v297[3] = &unk_1E16D4358;
                              v298 = v10;
                              v299 = self;
                              v300 = v217;
                              v301 = v155;
                              v302 = a4;
                              v303 = a5;
                              v305 = v287;
                              v304 = v143;
                              objc_msgSend(v296, "childWithContinuation:", v297);
                              v219 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v12, "_handleKeyEvent:executionContext:", v153, v219);

                              -[UIKeyboardLayoutStar delegate](self, "delegate");
                              v220 = (void *)objc_claimAutoreleasedReturnValue();
                              LOBYTE(v218) = objc_opt_respondsToSelector();

                              if ((v218 & 1) != 0)
                              {
                                -[UIKeyboardLayoutStar delegate](self, "delegate");
                                v221 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v221, "handleKeyUIEvent:dismiss:", v153, 1);

                              }
                              v23 = v295;
                            }
                            else
                            {
                              if (objc_msgSend(v10, "continuousPathState") != 5)
                              {
                                +[UIKBAnalyticsDispatcher sharedInstance](UIKBAnalyticsDispatcher, "sharedInstance");
                                v222 = (void *)objc_claimAutoreleasedReturnValue();
                                v223 = objc_msgSend(v222, "analyticsSkipDidKeyPress");

                                if ((v223 & 1) == 0)
                                {
                                  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
                                  v224 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v224, "_textInputSessionAnalytics");
                                  v225 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v10, "key");
                                  v226 = v143;
                                  v227 = v155;
                                  v228 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v225, "didKeyPress:inputSource:", v228, v217);

                                  v155 = v227;
                                  v143 = v226;
                                  v153 = 0;

                                }
                              }
                              v23 = v295;
                              objc_msgSend(v12, "skipHitTestForTouchEvent:", v295);
                              -[UIKeyboardLayoutStar completeSendStringActionForTouchUp:withActions:timestamp:interval:didLongPress:prevActions:executionContext:](self, "completeSendStringActionForTouchUp:withActions:timestamp:interval:didLongPress:prevActions:executionContext:", v10, v155, v287, v143, v296, a4, a5);
                            }

                            goto LABEL_218;
                          }
LABEL_208:
                          objc_msgSend(v10, "key");
                          v214 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v214, "representedString");
                          v215 = (void *)objc_claimAutoreleasedReturnValue();
                          -[UIKeyboardLayoutStar switchKeyplane:](self, "switchKeyplane:", v215);

                          goto LABEL_209;
                        }
                        v277 = v122;
                        objc_msgSend(v10, "key");
                        v156 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v156, "representedString");
                        v157 = (__CFString *)objc_claimAutoreleasedReturnValue();

                        if (v285 != 16)
                        {
                          objc_msgSend(v10, "key");
                          v158 = (void *)objc_claimAutoreleasedReturnValue();
                          v159 = v157;
                          v160 = objc_msgSend(v158, "displayTypeHint");

                          v68 = v160 == 10;
                          v157 = v159;
                          if (!v68)
                          {
                            v167 = 0;
                            v286 = 0;
                            goto LABEL_167;
                          }
                        }
                        v281 = v13;
                        v161 = v12;
                        objc_msgSend(v10, "key");
                        v162 = (void *)objc_claimAutoreleasedReturnValue();
                        v163 = objc_msgSend(v162, "selectedVariantIndex");

                        if ((v163 & 0x8000000000000000) != 0)
                        {
                          v166 = 0;
                          v167 = 0;
                          v286 = 0;
                        }
                        else
                        {
                          v164 = objc_msgSend(v288, "count");
                          if (v285 == 16 && v163 < v164)
                          {
                            objc_msgSend(v288, "objectAtIndex:", v163);
                            v165 = (__CFString *)objc_claimAutoreleasedReturnValue();
                            -[__CFString representedString](v165, "representedString");
                            v166 = objc_claimAutoreleasedReturnValue();
                            v286 = 0;
                            v167 = 1;
                          }
                          else
                          {
                            v168 = v157;
                            objc_msgSend(v10, "key");
                            v169 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v169, "secondaryRepresentedStrings");
                            v170 = (void *)objc_claimAutoreleasedReturnValue();
                            v171 = objc_msgSend(v170, "count");

                            if (v163 >= v171)
                            {
                              v167 = 0;
                              if (!self->_hasPeekedGestureKey)
                              {
                                v286 = 0;
                                goto LABEL_162;
                              }
                              v166 = 0;
                              v286 = 0;
                              v157 = v168;
                              goto LABEL_160;
                            }
                            objc_msgSend(v10, "key");
                            v172 = (void *)objc_claimAutoreleasedReturnValue();
                            v173 = objc_msgSend(v172, "displayTypeHint");
                            v167 = v173 != 10;
                            v286 = v173 == 10;

                            objc_msgSend(v10, "key");
                            v174 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v174, "secondaryRepresentedStrings");
                            v175 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v175, "objectAtIndex:", v163);
                            v166 = objc_claimAutoreleasedReturnValue();

                            objc_msgSend(v10, "key");
                            v176 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v176, "gestureKey");
                            v177 = (void *)objc_claimAutoreleasedReturnValue();

                            if (!v177)
                            {
LABEL_161:
                              v168 = (__CFString *)v166;
LABEL_162:
                              objc_msgSend(v10, "key");
                              v178 = (void *)objc_claimAutoreleasedReturnValue();
                              v179 = objc_msgSend(v178, "displayTypeHint");

                              if (v179 == 10)
                              {
                                if (v163 != 0x7FFFFFFFFFFFFFFFLL)
                                  self->_lastInputIsGestureKey = 1;
                              }
                              else
                              {
                                objc_msgSend(v10, "key");
                                v180 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v180, "setDisplayTypeHint:", 0);

                              }
                              v12 = v161;
                              v13 = v281;
                              v157 = v168;
LABEL_167:
                              +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
                              v181 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v181, "preferencesActions");
                              v182 = (void *)objc_claimAutoreleasedReturnValue();
                              if (objc_msgSend(v182, "BOOLForPreferenceKey:", CFSTR("GesturesEnabled"))
                                && v157
                                && !self->_lastInputIsGestureKey)
                              {
                                v183 = v157;
                                v199 = -[UIKBTree intForProperty:](self->_keyplane, "intForProperty:", CFSTR("shift-rendering"));

                                if (v199 != 8)
                                  +[_UIKeyboardUsageTracking normalPunctuationKeyCount](_UIKeyboardUsageTracking, "normalPunctuationKeyCount");
                              }
                              else
                              {
                                v183 = v157;

                              }
                              objc_msgSend(v10, "key");
                              v184 = (void *)objc_claimAutoreleasedReturnValue();
                              v185 = objc_msgSend(v184, "displayTypeHint");

                              v155 = v292;
                              if (v185 == 10)
                              {
                                objc_msgSend(v10, "key");
                                v186 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v186, "setSelectedVariantIndex:", 0x7FFFFFFFFFFFFFFFLL);

                              }
                              objc_msgSend(v10, "key");
                              v187 = (void *)objc_claimAutoreleasedReturnValue();
                              v188 = objc_msgSend(v187, "variantType");

                              if (v188 == 9)
                              {

                                objc_msgSend(v10, "key");
                                v189 = (void *)objc_claimAutoreleasedReturnValue();
                                v190 = objc_msgSend(v189, "selectedVariantIndex");

                                if (v190 == 2)
                                {
                                  v143 = prevUpActions;
                                  if (!-[UIKBTextEditingTraits canToggleUnderline](self->super._textEditingTraits, "canToggleUnderline"))goto LABEL_203;
                                  objc_msgSend(v12, "delegateAsResponder");
                                  v191 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v191, "_responderForEditing");
                                  v192 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v192, "toggleUnderline:", 0);
                                  goto LABEL_195;
                                }
                                v143 = prevUpActions;
                                if (v190 == 1)
                                {
                                  if (!-[UIKBTextEditingTraits canToggleItalics](self->super._textEditingTraits, "canToggleItalics"))goto LABEL_203;
                                  objc_msgSend(v12, "delegateAsResponder");
                                  v191 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v191, "_responderForEditing");
                                  v192 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v192, "toggleItalics:", 0);
                                  goto LABEL_195;
                                }
                                if (!v190
                                  && -[UIKBTextEditingTraits canToggleBoldface](self->super._textEditingTraits, "canToggleBoldface"))
                                {
                                  objc_msgSend(v12, "delegateAsResponder");
                                  v191 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v191, "_responderForEditing");
                                  v192 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v192, "toggleBoldface:", 0);
LABEL_195:

LABEL_196:
                                  goto LABEL_203;
                                }
                                goto LABEL_203;
                              }
                              v193 = v183;
                              if (v183 == CFSTR("UIButtonBarKeyboardCut.png"))
                              {

                                objc_msgSend(v12, "cutOperation");
                                v143 = prevUpActions;
                                goto LABEL_203;
                              }
                              v143 = prevUpActions;
                              if (v193 == CFSTR("UIButtonBarKeyboardCopy.png"))
                              {

                                objc_msgSend(v12, "copyOperation");
                                goto LABEL_203;
                              }
                              if (v193 == CFSTR("UIButtonBarKeyboardPaste.png"))
                              {

                                objc_msgSend(v12, "pasteOperation");
                                goto LABEL_203;
                              }
                              if (v193 == CFSTR("UIButtonBarKeyboardUndo.png"))
                                goto LABEL_186;
                              if (-[__CFString isEqualToString:](v193, "isEqualToString:", CFSTR("undo")))
                              {
                                objc_msgSend(v10, "key");
                                v194 = (void *)objc_claimAutoreleasedReturnValue();
                                v195 = v193;
                                v196 = objc_msgSend(v194, "displayTypeHint");

                                v68 = v196 == 10;
                                v193 = v195;
                                v143 = prevUpActions;
                                if (v68)
                                {
LABEL_186:

                                  objc_msgSend(v12, "delegateAsResponder");
                                  v197 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v197, "_responderForEditing");
                                  v198 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v198, "undoManager");
                                  v191 = (void *)objc_claimAutoreleasedReturnValue();

                                  if (objc_msgSend(v191, "canUndo"))
                                    objc_msgSend(v191, "undo");
                                  goto LABEL_196;
                                }
                              }
                              if (-[__CFString isEqualToString:](v193, "isEqualToString:", CFSTR("redo")))
                              {
                                objc_msgSend(v10, "key");
                                v233 = (void *)objc_claimAutoreleasedReturnValue();
                                v234 = v193;
                                v235 = objc_msgSend(v233, "displayTypeHint");

                                v68 = v235 == 10;
                                v193 = v234;
                                v143 = prevUpActions;
                                if (v68)
                                {

                                  objc_msgSend(v12, "delegateAsResponder");
                                  v236 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v236, "_responderForEditing");
                                  v237 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v237, "undoManager");
                                  v191 = (void *)objc_claimAutoreleasedReturnValue();

                                  if (objc_msgSend(v191, "canRedo"))
                                    objc_msgSend(v191, "redo");
                                  goto LABEL_196;
                                }
                              }
                              if (!v193)
                              {
LABEL_203:
                                objc_msgSend(v10, "key");
                                v205 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v205, "displayImage");
                                v206 = objc_claimAutoreleasedReturnValue();
                                if (v206)
                                {
                                  v207 = (void *)v206;
                                  objc_msgSend(v10, "key");
                                  v208 = v205;
                                  v209 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v209, "parentKey");
                                  v210 = (void *)objc_claimAutoreleasedReturnValue();

                                  if (!v210)
                                  {
                                    v143 = prevUpActions;
                                    if ((v292 & 0x20000000) == 0)
                                      goto LABEL_209;
                                    goto LABEL_208;
                                  }
                                  objc_msgSend(v10, "key");
                                  v211 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v211, "parentKey");
                                  v212 = (void *)objc_claimAutoreleasedReturnValue();
                                  -[UIKeyboardLayoutStar viewForKey:](self, "viewForKey:", v212);
                                  v205 = (void *)objc_claimAutoreleasedReturnValue();

                                  objc_msgSend(v10, "key");
                                  v213 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v205, "didInputSubTree:", v213);

                                  v143 = prevUpActions;
                                }
                                goto LABEL_206;
                              }
                              v284 = v193;
                              objc_msgSend(v10, "key");
                              v238 = (void *)objc_claimAutoreleasedReturnValue();
                              v239 = objc_msgSend(v238, "interactionType");

                              if (v239 == 16)
                              {
                                if (!-[UIKeyboardLayoutStar shouldSendStringForFlick:](self, "shouldSendStringForFlick:", v10))goto LABEL_253;
                                v240 = v12;
                                objc_msgSend(v10, "key");
                                v241 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v10, "key");
                                v242 = (void *)objc_claimAutoreleasedReturnValue();
                                -[UIKeyboardLayoutStar flickStringForInputKey:direction:](self, "flickStringForInputKey:direction:", v241, objc_msgSend(v242, "flickDirection"));
                                v243 = (void *)objc_claimAutoreleasedReturnValue();

                                if (!objc_msgSend(v243, "length"))
                                {
LABEL_252:

                                  v12 = v240;
                                  v155 = v292;
LABEL_253:
                                  if (v153)
                                  {
                                    objc_msgSend(v10, "key");
                                    v250 = (void *)objc_claimAutoreleasedReturnValue();
                                    objc_msgSend(v250, "parentKey");
                                    v251 = (void *)objc_claimAutoreleasedReturnValue();

                                    if (v251)
                                    {
                                      objc_msgSend(v10, "key");
                                      v252 = (void *)objc_claimAutoreleasedReturnValue();
                                      objc_msgSend(v252, "parentKey");
                                      v253 = (void *)objc_claimAutoreleasedReturnValue();
                                      -[UIKeyboardLayoutStar viewForKey:](self, "viewForKey:", v253);
                                      v254 = (void *)objc_claimAutoreleasedReturnValue();

                                      objc_msgSend(v10, "key");
                                      v255 = (void *)objc_claimAutoreleasedReturnValue();
                                      v256 = objc_msgSend(v254, "didInputSubTree:", v255);

                                      if (v256 == 1)
                                      {
                                        if (-[UIKeyboardLayoutStar useCrescendoLayout](self, "useCrescendoLayout"))
                                          v257 = 1456;
                                        else
                                          v257 = 696;
                                        v258 = *(Class *)((char *)&self->super.super.super.super.isa + v257);
                                        objc_msgSend(v10, "key");
                                        v259 = (void *)objc_claimAutoreleasedReturnValue();
                                        objc_msgSend(v258, "addKeyToDelayedDeactivationSet:", v259);

                                        objc_msgSend(v10, "key");
                                        v260 = (void *)objc_claimAutoreleasedReturnValue();
                                        -[UIKeyboardLayoutStar presentModalDisplayForKey:](self, "presentModalDisplayForKey:", v260);

                                      }
                                    }
                                  }
                                  -[UIKeyboardLayoutStar _recordKeystrokeStatisticForKeyPress](self, "_recordKeystrokeStatisticForKeyPress");
                                  v205 = v284;
LABEL_206:

                                  goto LABEL_207;
                                }
                                if ((v277 & 1) != 0)
                                {
                                  v244 = 6;
                                }
                                else
                                {
                                  objc_msgSend(v10, "key");
                                  v261 = (void *)objc_claimAutoreleasedReturnValue();
                                  if (objc_msgSend(v261, "flickDirection") <= -2)
                                    v244 = 2;
                                  else
                                    v244 = 66;

                                }
                                objc_msgSend(v10, "key");
                                v262 = (void *)objc_claimAutoreleasedReturnValue();
                                -[UIKeyboardLayoutStar createKeyEventForStringAction:forKey:touchInfo:inputFlags:](self, "createKeyEventForStringAction:forKey:touchInfo:inputFlags:", v243, v262, v10, v244);
                                v249 = objc_claimAutoreleasedReturnValue();

                                if (!TIStatisticShouldSample()
                                  || (UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
                                {
LABEL_251:
                                  v153 = (void *)v249;
                                  goto LABEL_252;
                                }
                                UIKeyboardGetCurrentInputMode();
                                v263 = (void *)objc_claimAutoreleasedReturnValue();
                                UIKeyboardInputModeGetIdentifierWithKeyboardLayouts(v263);
                                v153 = (void *)objc_claimAutoreleasedReturnValue();

                                objc_msgSend(v10, "key");
                                v264 = (void *)objc_claimAutoreleasedReturnValue();
                                v265 = objc_msgSend(v264, "flickDirection");

                                if ((v265 & 0x8000000000000000) == 0)
                                {
                                  objc_msgSend((id)objc_opt_class(), "sharedPunctuationCharacterSet");
                                  v266 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v243, "rangeOfCharacterFromSet:", v266);
                                  v268 = v267;

                                  if (v268)
                                  {
                                    TIStatisticGetKeyForTenKeyFlickPunctuation();
                                    v269 = (void *)objc_claimAutoreleasedReturnValue();
                                    TIStatisticScalarIncrement();

                                  }
                                  TIStatisticGetKeyForTenKeyFlick();
                                  v270 = (void *)objc_claimAutoreleasedReturnValue();
                                  TIStatisticScalarIncrement();

                                }
                                if (-[NSString length](self->_keyplaneName, "length"))
                                {
                                  -[UIKBTree componentName](self->_keyplane, "componentName");
                                  v271 = (void *)objc_claimAutoreleasedReturnValue();
                                  TIStatisticGetKeyForTenKeyKeyTappedInKeyplane();
                                  v272 = (void *)objc_claimAutoreleasedReturnValue();
                                  TIStatisticScalarIncrement();

                                }
                              }
                              else
                              {
                                v240 = v12;
                                if (v167)
                                  v246 = 2;
                                else
                                  v246 = 0;
                                if (v286)
                                  v247 = 256;
                                else
                                  v247 = 0;
                                v248 = v247 | v246;
                                objc_msgSend(v10, "key");
                                v243 = (void *)objc_claimAutoreleasedReturnValue();
                                -[UIKeyboardLayoutStar createKeyEventForStringAction:forKey:touchInfo:inputFlags:](self, "createKeyEventForStringAction:forKey:touchInfo:inputFlags:", v284, v243, v10, v248);
                                v249 = objc_claimAutoreleasedReturnValue();
                              }

                              goto LABEL_251;
                            }
                            objc_msgSend(v10, "key");
                            v165 = (__CFString *)objc_claimAutoreleasedReturnValue();
                            -[__CFString gestureKey](v165, "gestureKey");
                            v157 = (__CFString *)objc_claimAutoreleasedReturnValue();
                            v292 = -[UIKeyboardLayoutStar upActionFlagsForKey:](self, "upActionFlagsForKey:", v157);
                          }

                          v157 = v165;
                        }
LABEL_160:

                        goto LABEL_161;
                      }
LABEL_109:
                      v116 = self->_multitapKey;
                      objc_msgSend(v10, "key");
                      v117 = (UIKBTree *)objc_claimAutoreleasedReturnValue();

                      if (v116 == v117)
                      {
                        -[UIKBTree fullRepresentedString](self->_multitapKey, "fullRepresentedString");
                        v200 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v200, "rangeOfComposedCharacterSequenceAtIndex:", self->_multitapCount);
                        v202 = v201;

                        v203 = v202 + self->_multitapCount;
                        -[UIKBTree fullRepresentedString](self->_multitapKey, "fullRepresentedString");
                        v204 = (void *)objc_claimAutoreleasedReturnValue();
                        self->_multitapCount = v203 % objc_msgSend(v204, "length");

                        v119 = 1;
                        v118 = 1;
                      }
                      else
                      {
                        if (self->_multitapKey)
                          -[UIKeyboardLayoutStar setState:forKey:](self, "setState:forKey:", 2);
                        v118 = 0;
                        self->_multitapCount = 0;
                        v119 = 1;
                      }
                      goto LABEL_225;
                    }

                  }
                  goto LABEL_109;
                }
LABEL_125:
                v122 = 0;
                goto LABEL_126;
              }
            }
            if (!didLongPress)
              goto LABEL_282;
            v279 = v13;
            objc_msgSend(v10, "key");
            v120 = (void *)objc_claimAutoreleasedReturnValue();
            v121 = objc_msgSend(v120, "interactionType");
            if (v121 == 9)
            {
              objc_msgSend(v10, "key");
              v106 = objc_claimAutoreleasedReturnValue();
              if (objc_msgSend((id)v106, "displayType") == 13)
              {

                v122 = 0;
                v13 = v279;
                goto LABEL_126;
              }
            }
            v123 = v11;
            objc_msgSend(v10, "key");
            v124 = (void *)objc_claimAutoreleasedReturnValue();
            v125 = objc_msgSend(v124, "interactionType");

            if (v121 == 9)
            v13 = v279;
            v11 = v123;
            if (v125 != 5)
            {
LABEL_282:
              if (-[UIKeyboardLayoutStar useCrescendoLayout](self, "useCrescendoLayout"))
                v126 = 1456;
              else
                v126 = 696;
              v127 = *(Class *)((char *)&self->super.super.super.super.isa + v126);
              objc_msgSend(v10, "key");
              v128 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v127, "addKeyToDelayedDeactivationSet:", v128);

            }
            goto LABEL_125;
          }
        }
        else
        {

        }
        keyplaneView = self->_keyplaneView;
        objc_msgSend(v10, "key");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v274 = -[UIKBKeyplaneView retestSelectedVariantIndexForKey:atPoint:phase:](keyplaneView, "retestSelectedVariantIndexForKey:atPoint:phase:", v73, 3, v50, v52);
        v47 = &OBJC_IVAR____UIDocumentCarouselView__items;
        v275 = v274 || self->_selectedVariantIndexChanged;
        v43 = v291;
        self->_selectedVariantIndexChanged = v275;
      }
      else
      {
        objc_msgSend(v10, "key");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIKeyboardLayoutStar presentModalDisplayForKey:](self, "presentModalDisplayForKey:", v73);
      }

      goto LABEL_56;
    }
    didLongPress = v287;
    v23 = v293;
LABEL_52:
    v11 = &off_1E167A000;
    goto LABEL_53;
  }
  objc_msgSend(v12, "clearLongPressTimer");
  objc_msgSend(v10, "setDragged:", 0);
  -[UIKeyboardLayoutStar setPreTouchKeyplaneName:](self, "setPreTouchKeyplaneName:", 0);
  -[UIKeyboardLayoutStar clearInfoForTouch:](self, "clearInfoForTouch:", v13);
  objc_msgSend(v296, "returnExecutionToParent");
LABEL_220:

}

void __85__UIKeyboardLayoutStar_completeRetestForTouchUp_timestamp_interval_executionContext___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "continuousPathState") != 5)
  {
    +[UIKBAnalyticsDispatcher sharedInstance](UIKBAnalyticsDispatcher, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "analyticsSkipDidKeyPress");

    if ((v4 & 1) == 0)
    {
      +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_textInputSessionAnalytics");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "key");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "didKeyPress:inputSource:", v7, *(_QWORD *)(a1 + 48));

    }
  }
  objc_msgSend(*(id *)(a1 + 40), "completeSendStringActionForTouchUp:withActions:timestamp:interval:didLongPress:prevActions:executionContext:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 88), *(_QWORD *)(a1 + 80), v8, *(double *)(a1 + 64), *(double *)(a1 + 72));

}

- (void)presentModalDisplayForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  UIView *v7;
  UIView *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  UIKeyboardLayoutStar *v17;
  id v18;

  v4 = a3;
  objc_msgSend(v4, "parentKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardLayoutStar viewForKey:](self, "viewForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = [UIView alloc];
  -[UIView bounds](self, "bounds");
  v8 = -[UIView initWithFrame:](v7, "initWithFrame:");
  -[UIKeyboardLayoutStar setModalDisplayView:](self, "setModalDisplayView:", v8);

  -[UIKeyboardLayoutStar modalDisplayView](self, "modalDisplayView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addSubview:](self, "addSubview:", v9);

  -[TUIKeyplaneView setHidden:](self->_liveKeyplaneView, "setHidden:", 1);
  -[UIView setHidden:](self->_keyplaneView, "setHidden:", 1);
  -[UIKeyboardLayoutStar viewForKey:](self, "viewForKey:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[UIKeyboardLayoutStar modalDisplayView](self, "modalDisplayView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __50__UIKeyboardLayoutStar_presentModalDisplayForKey___block_invoke;
    v16 = &unk_1E16B1B50;
    v17 = self;
    v12 = v10;
    v18 = v12;
    objc_msgSend(v6, "willDisplayModalActionView:withSubTreeKeyView:completion:", v11, v12, &v13);

    objc_msgSend(v12, "setHidden:", 1, v13, v14, v15, v16, v17);
  }

}

uint64_t __50__UIKeyboardLayoutStar_presentModalDisplayForKey___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "modalDisplayView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

  objc_msgSend(*(id *)(a1 + 32), "setModalDisplayView:", 0);
  if (objc_msgSend(*(id *)(a1 + 32), "useCrescendoLayout"))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1456), "setHidden:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 696), "setHidden:", 0);
  return objc_msgSend(*(id *)(a1 + 40), "setHidden:", 0);
}

- (BOOL)shouldYieldToControlCenterForFlickWithInitialPoint:(CGPoint)a3 finalPoint:(CGPoint)a4
{
  double y;
  double v5;
  void *v7;
  int v8;
  double Height;
  void *v10;
  double v11;
  double v12;
  CGRect v14;

  y = a4.y;
  v5 = a3.y;
  +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance", a3.x, a3.y, a4.x);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "_isCoordinatingWithSystemGestures");

  if (!v8)
    return 0;
  -[UIView bounds](self, "bounds");
  Height = CGRectGetHeight(v14);
  +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ambiguousControlCenterActivationMargin");
  v12 = v11;

  return y < Height - v12 && v5 > Height + -30.0;
}

- (BOOL)shouldSendStringForFlick:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  BOOL v15;

  v4 = a3;
  objc_msgSend(v4, "initialPoint");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "touch");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "locationInView:", self);
  v11 = v10;
  v13 = v12;

  objc_msgSend(v4, "key");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v14, "state") == 16)
  {
    v15 = isFlickOutOfBounds(v6, v8, v11, v13);

    if (v15)
      return 0;
  }
  else
  {

  }
  return !-[UIKeyboardLayoutStar shouldYieldToControlCenterForFlickWithInitialPoint:finalPoint:](self, "shouldYieldToControlCenterForFlickWithInitialPoint:finalPoint:", v6, v8, v11, v13);
}

- (void)completeSendStringActionForTouchUp:(id)a3 withActions:(unint64_t)a4 timestamp:(double)a5 interval:(double)a6 didLongPress:(BOOL)a7 prevActions:(unint64_t)a8 executionContext:(id)a9
{
  id v16;
  id v17;
  void *v18;
  int v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void (**v24)(void *, void *);
  void *v25;
  void *v26;
  _BOOL4 v27;
  uint64_t v28;
  void *v29;
  NSString *v30;
  NSString *lastInputMode;
  NSString *v32;
  void *v33;
  void *v34;
  NSString *v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  UIKeyboardLayoutStar *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  BOOL v57;
  void *v58;
  UIKeyboardLayoutStar *v59;
  void *v60;
  void (**v61)(void *, void *);
  void *v62;
  _QWORD v63[5];
  id v64;
  id v65;
  unint64_t v66;
  double v67;
  double v68;
  unint64_t v69;
  BOOL v70;
  _QWORD v71[5];
  _QWORD v72[4];
  id v73;
  id v74;
  _QWORD v75[4];
  id v76;
  id v77;
  char v78;
  _QWORD v79[4];
  id v80;
  id v81;
  id v82;
  _QWORD v83[4];
  id v84;
  id v85;
  _QWORD aBlock[4];
  id v87;
  id v88;
  id v89;

  v16 = a3;
  v17 = a9;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v16, "dragged");
  v20 = MEMORY[0x1E0C809B0];
  if (v19)
  {
    -[UIKeyboardLayoutStar preTouchKeyplaneName](self, "preTouchKeyplaneName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
      goto LABEL_6;
  }
  if ((a4 & 0x20) != 0)
  {
    -[UIKBTree alternateKeyplaneName](self->_keyplane, "alternateKeyplaneName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardLayoutStar setKeyplaneName:](self, "setKeyplaneName:", v22);

    self->_preferredTrackingChangeCount = objc_msgSend(v18, "changeCount");
  }
  if ((a4 & 0x1000) == 0)
  {
LABEL_6:
    v23 = 0;
    v24 = 0;
    goto LABEL_21;
  }
  +[UIInputSwitcherView sharedInstance](UIInputSwitcherView, "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "key");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "displayType") == 21
     && -[UITextInputTraits keyboardType](self->super._inputTraits, "keyboardType") == 122
     && -[UITextInputTraits returnKeyType](self->super._inputTraits, "returnKeyType") == 9;
  v60 = v26;
  v62 = v25;
  if (-[UIKeyboardLayoutStar stateForKey:](self, "stateForKey:", v26) != 4
    || -[NSMutableDictionary count](self->_extendedTouchInfoMap, "count") != 1)
  {
    v24 = 0;
    self->_prevTouchUpTime = a5 - a6;
    goto LABEL_17;
  }
  if (objc_msgSend(v25, "mode") != 1)
  {
    objc_msgSend(v16, "key");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = self;
    if (-[UIKeyboardLayoutStar isKeyScriptSwitchKey:](self, "isKeyScriptSwitchKey:", v41)
      || -[UIKeyboardLayoutStar showsDedicatedEmojiKeyAlongsideGlobeButton](self, "showsDedicatedEmojiKeyAlongsideGlobeButton"))
    {

      goto LABEL_32;
    }
    objc_msgSend(v16, "key");
    v47 = objc_claimAutoreleasedReturnValue();
    v48 = self;
    v49 = (void *)v47;
    v57 = -[UIKeyboardLayoutStar isLongPressedKey:](v48, "isLongPressedKey:", v47);

    if (!v57)
    {
LABEL_32:
      HIDWORD(v55) = v27;
      +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "key");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "representedString");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v42, "identifierIsValidSystemInputMode:", v44);

      if (v56)
      {
        v28 = MEMORY[0x1E0C809B0];
        v83[0] = MEMORY[0x1E0C809B0];
        v83[1] = 3221225472;
        v83[2] = __132__UIKeyboardLayoutStar_completeSendStringActionForTouchUp_withActions_timestamp_interval_didLongPress_prevActions_executionContext___block_invoke_2;
        v83[3] = &unk_1E16BB0D8;
        v84 = v16;
        v85 = v18;
        v24 = (void (**)(void *, void *))_Block_copy(v83);

        self = v59;
        goto LABEL_18;
      }
      objc_msgSend(v16, "key");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "representedString");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v46, "isEqualToString:", CFSTR("ASCIICapable")))
      {

      }
      else
      {
        objc_msgSend(v16, "key");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "representedString");
        v58 = v45;
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v55) = objc_msgSend(v51, "isEqualToString:", CFSTR("NonASCII"));

        if (!(_DWORD)v55)
        {
          self = v59;
          if (__PAIR64__(HIDWORD(v55), 0) == -[UIKeyboardLayoutStar globeKeyDisplaysAsEmojiKey](v59, "globeKeyDisplaysAsEmojiKey"))
          {
            v28 = MEMORY[0x1E0C809B0];
            v72[0] = MEMORY[0x1E0C809B0];
            v72[1] = 3221225472;
            v72[2] = __132__UIKeyboardLayoutStar_completeSendStringActionForTouchUp_withActions_timestamp_interval_didLongPress_prevActions_executionContext___block_invoke_6;
            v72[3] = &unk_1E16BB0D8;
            v73 = v16;
            v74 = v18;
            v24 = (void (**)(void *, void *))_Block_copy(v72);

            v29 = v73;
          }
          else
          {
            v54 = MEMORY[0x1E0C809B0];
            v75[0] = MEMORY[0x1E0C809B0];
            v75[1] = 3221225472;
            v75[2] = __132__UIKeyboardLayoutStar_completeSendStringActionForTouchUp_withActions_timestamp_interval_didLongPress_prevActions_executionContext___block_invoke_4;
            v75[3] = &unk_1E16BB010;
            v76 = v16;
            v78 = BYTE4(v55);
            v28 = v54;
            v77 = v18;
            v24 = (void (**)(void *, void *))_Block_copy(v75);

            v29 = v76;
          }
          goto LABEL_15;
        }
      }
      self = v59;
      -[UIKeyboardLayoutStar inputModeToMergeCapsLockKey](v59, "inputModeToMergeCapsLockKey", v55);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = MEMORY[0x1E0C809B0];
      v79[0] = MEMORY[0x1E0C809B0];
      v79[1] = 3221225472;
      v79[2] = __132__UIKeyboardLayoutStar_completeSendStringActionForTouchUp_withActions_timestamp_interval_didLongPress_prevActions_executionContext___block_invoke_3;
      v79[3] = &unk_1E16BB128;
      v80 = v16;
      v81 = v18;
      v82 = v52;
      v53 = v52;
      v24 = (void (**)(void *, void *))_Block_copy(v79);

      goto LABEL_18;
    }
    v24 = 0;
    self = v59;
LABEL_17:
    v28 = MEMORY[0x1E0C809B0];
    goto LABEL_18;
  }
  v28 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __132__UIKeyboardLayoutStar_completeSendStringActionForTouchUp_withActions_timestamp_interval_didLongPress_prevActions_executionContext___block_invoke;
  aBlock[3] = &unk_1E16BB128;
  v87 = v16;
  v88 = v18;
  v89 = v25;
  v24 = (void (**)(void *, void *))_Block_copy(aBlock);

  v29 = v87;
LABEL_15:

LABEL_18:
  v71[0] = v28;
  v71[1] = 3221225472;
  v71[2] = __132__UIKeyboardLayoutStar_completeSendStringActionForTouchUp_withActions_timestamp_interval_didLongPress_prevActions_executionContext___block_invoke_7;
  v71[3] = &unk_1E16B1B28;
  v71[4] = self;
  v23 = _Block_copy(v71);
  if (!self->_lastInputMode)
  {
    UIKeyboardGetCurrentInputMode();
    v30 = (NSString *)objc_claimAutoreleasedReturnValue();
    lastInputMode = self->_lastInputMode;
    self->_lastInputMode = v30;

  }
  v20 = MEMORY[0x1E0C809B0];
LABEL_21:
  if (self->_prevUpActions != 4104)
  {
    v61 = v24;
    v32 = self->_lastInputMode;
    UIKeyboardGetCurrentInputMode();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v32) = -[NSString isEqualToString:](v32, "isEqualToString:", v33);

    if ((_DWORD)v32)
    {
      TIStatisticGetKeyForInputMode();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      TIStatisticScalarIncrement();

    }
    v35 = self->_lastInputMode;
    self->_lastInputMode = 0;

    v24 = v61;
    v20 = MEMORY[0x1E0C809B0];
  }
  v63[0] = v20;
  v63[1] = 3221225472;
  v63[2] = __132__UIKeyboardLayoutStar_completeSendStringActionForTouchUp_withActions_timestamp_interval_didLongPress_prevActions_executionContext___block_invoke_8;
  v63[3] = &unk_1E16D43A0;
  v36 = v23;
  v63[4] = self;
  v64 = v16;
  v65 = v36;
  v66 = a4;
  v67 = a5;
  v68 = a6;
  v70 = a7;
  v69 = a8;
  v37 = v16;
  v38 = _Block_copy(v63);
  v39 = v38;
  if (v24)
  {
    objc_msgSend(v17, "childWithContinuation:", v38);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v24[2](v24, v40);

  }
  else
  {
    (*((void (**)(void *, id))v38 + 2))(v38, v17);
  }

}

void __132__UIKeyboardLayoutStar_completeSendStringActionForTouchUp_withActions_timestamp_interval_didLongPress_prevActions_executionContext___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "maySuppressUpAction"))
  {
    objc_msgSend(v5, "returnExecutionToParent");
  }
  else
  {
    v3 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "selectedInputMode");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setInputMode:userInitiated:updateIndicator:executionContext:", v4, 1, 0, v5);

  }
}

void __132__UIKeyboardLayoutStar_completeSendStringActionForTouchUp_withActions_timestamp_interval_didLongPress_prevActions_executionContext___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "maySuppressUpAction"))
  {
    objc_msgSend(v12, "returnExecutionToParent");
  }
  else
  {
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentInputMode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "updateLastUsedInputMode:", v5);

    v6 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "key");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "representedString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setInputMode:userInitiated:updateIndicator:executionContext:", v8, 1, 0, v12);

    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "currentInputMode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateLastUsedInputMode:", v11);

  }
}

void __132__UIKeyboardLayoutStar_completeSendStringActionForTouchUp_withActions_timestamp_interval_didLongPress_prevActions_executionContext___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "maySuppressUpAction"))
  {
    objc_msgSend(v12, "returnExecutionToParent");
  }
  else
  {
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentInputMode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "updateLastUsedInputMode:", v5);

    v6 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setInputMode:userInitiated:updateIndicator:executionContext:", v7, 1, 1, v12);

    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLastInputModeSwitchTriggeredByASCIIToggle:", 1);

    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "currentInputMode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateLastUsedInputMode:", v11);

  }
}

void __132__UIKeyboardLayoutStar_completeSendStringActionForTouchUp_withActions_timestamp_interval_didLongPress_prevActions_executionContext___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "maySuppressUpAction"))
  {
    objc_msgSend(v17, "returnExecutionToParent");
  }
  else
  {
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentInputMode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "updateLastUsedInputMode:", v5);

    if (*(_BYTE *)(a1 + 48))
    {
      objc_msgSend(*(id *)(a1 + 40), "inputDelegateManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "delegateRespectingForwardingDelegate:", 0);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_msgSend(*(id *)(a1 + 40), "selectionWillChange:", v7);
        objc_msgSend(*(id *)(a1 + 40), "selectionDidChange:", v7);
      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("UITextInputDidSwitchFromEmojiSearchNotification"), 0, 0);

      objc_msgSend(v17, "returnExecutionToParent");
    }
    else
    {
      +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "activeInputModeIdentifiers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "indexOfObjectPassingTest:", &__block_literal_global_954);

      if (v11 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v7 = CFSTR("emoji");
      }
      else
      {
        +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "activeInputModeIdentifiers");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectAtIndex:", v11);
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "currentInputMode");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setInputModeThatInvokeEmoji:", v15);

      objc_msgSend(*(id *)(a1 + 40), "setInputMode:userInitiated:updateIndicator:executionContext:", v7, 1, 0, v17);
    }

  }
}

uint64_t __132__UIKeyboardLayoutStar_completeSendStringActionForTouchUp_withActions_timestamp_interval_didLongPress_prevActions_executionContext___block_invoke_5()
{
  void *v0;
  uint64_t v1;

  TIInputModeGetNormalizedIdentifier();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isEqualToString:", CFSTR("emoji"));

  return v1;
}

void __132__UIKeyboardLayoutStar_completeSendStringActionForTouchUp_withActions_timestamp_interval_didLongPress_prevActions_executionContext___block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "maySuppressUpAction"))
  {
    objc_msgSend(v7, "returnExecutionToParent");
  }
  else
  {
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "inputModeThatInvokeEmoji");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = *(void **)(a1 + 40);
    if (v4)
    {
      objc_msgSend(v4, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setInputMode:userInitiated:updateIndicator:executionContext:", v6, 1, 0, v7);

    }
    else
    {
      objc_msgSend(v5, "setInputModeToNextInPreferredListWithExecutionContext:", v7);
    }

  }
}

uint64_t __132__UIKeyboardLayoutStar_completeSendStringActionForTouchUp_withActions_timestamp_interval_didLongPress_prevActions_executionContext___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setActiveKey:", 0);
}

void __132__UIKeyboardLayoutStar_completeSendStringActionForTouchUp_withActions_timestamp_interval_didLongPress_prevActions_executionContext___block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
    (*(void (**)(void))(v3 + 16))();
  objc_msgSend(*(id *)(a1 + 32), "continueFromInternationalActionForTouchUp:withActions:timestamp:interval:didLongPress:prevActions:executionContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 88), *(_QWORD *)(a1 + 80), v4, *(double *)(a1 + 64), *(double *)(a1 + 72));

}

- (void)continueFromInternationalActionForTouchUp:(id)a3 withActions:(unint64_t)a4 timestamp:(double)a5 interval:(double)a6 didLongPress:(BOOL)a7 prevActions:(unint64_t)a8 executionContext:(id)a9
{
  uint64_t v9;
  int v11;
  _BOOL4 v12;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  char v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _BOOL8 v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  char v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  char v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  int64_t v55;
  unint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  unsigned int v62;
  double v63;
  void *v64;
  int v65;
  id v66;

  v11 = a8;
  v12 = a7;
  v66 = a3;
  v17 = a9;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "touch");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v66, "dragged"))
  {
    -[UIKeyboardLayoutStar preTouchKeyplaneName](self, "preTouchKeyplaneName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
      goto LABEL_25;
  }
  if ((a4 & 0x2000000) != 0
    || (v21 = -[UIKeyboardLayoutStar isHandwritingPlane](self, "isHandwritingPlane"), (a4 & 0x80) != 0) && v21)
  {
    +[UIKeyboardSplitControlMenu activeInstance](UIKeyboardSplitControlMenu, "activeInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (a6 > 0.5 || (v11 & 0x2000000) != 0)
    {
      if (v12 && objc_msgSend(v22, "isVisible"))
      {
        objc_msgSend(v19, "locationInView:", v23);
        objc_msgSend(v23, "selectItemAtPoint:");
      }
      else
      {
        v31 = objc_msgSend(v23, "isVisible");
        if ((a4 & 0x2000000) != 0
          && (v31 & 1) == 0
          && -[NSMutableDictionary count](self->_extendedTouchInfoMap, "count") == 1)
        {
          if (-[UITextInputTraits keyboardType](self->super._inputTraits, "keyboardType") == 126
            && -[UIKeyboardLayoutStar useDismissForMessagesWriteboard](self, "useDismissForMessagesWriteboard"))
          {
            objc_msgSend(v18, "lookUpResponderChainForCustomInputView");
          }
          else
          {
            objc_msgSend(v18, "dismissKeyboard");
          }
        }
      }
    }
    else
    {
      self->_prevTouchUpTime = a5 - a6;
    }
    objc_msgSend(v23, "hide");
    goto LABEL_10;
  }
  -[UIKeyboardLayoutStar preTouchKeyplaneName](self, "preTouchKeyplaneName");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    -[UIKeyboardLayoutStar preTouchKeyplaneName](self, "preTouchKeyplaneName");
    v9 = objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend((id)v9, "isEqualToString:", self->_keyplaneName);
    if ((a4 & 0x800000000) == 0 || (v47 & 1) == 0)
    {

LABEL_10:
      goto LABEL_11;
    }
  }
  else if ((a4 & 0x800000000) == 0)
  {
    goto LABEL_11;
  }
  v55 = -[UITextInputTraits keyboardType](self->super._inputTraits, "keyboardType");
  if (v23)
  {

  }
  if (v55 == 126)
    objc_msgSend(v18, "lookUpResponderChainForCustomInputView");
LABEL_11:
  if ((a4 & 0x8000000) == 0
    || a6 <= 0.5 && (v11 & 0x8000000) == 0
    || (objc_msgSend(v66, "key"),
        v24 = (void *)objc_claimAutoreleasedReturnValue(),
        v25 = -[UIKeyboardLayoutStar stateForKey:](self, "stateForKey:", v24),
        v24,
        v25 != 4))
  {
LABEL_18:
    if ((a4 & 0x10000000) == 0)
      goto LABEL_19;
    goto LABEL_81;
  }
  if (-[UITextInputTraits keyboardType](self->super._inputTraits, "keyboardType") == 126
    && -[UIKeyboardLayoutStar useUndoForMessagesWriteboard](self, "useUndoForMessagesWriteboard"))
  {
    objc_msgSend(v18, "lookUpResponderChainForCustomInputView");
    goto LABEL_18;
  }
  +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "firstResponder");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "undoManager");
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v9, "undo");

  +[_UIKeyboardUsageTracking undoKeyCount](_UIKeyboardUsageTracking, "undoKeyCount");
  +[UIKBAnalyticsDispatcher analyticsDispatchEventTextEditingOperation:trigger:](UIKBAnalyticsDispatcher, "analyticsDispatchEventTextEditingOperation:trigger:", CFSTR("Undo"), CFSTR("SWKeyboard"));
  +[UIUndoGestureInteraction presentProductivityGestureTutorialInlineWithCompletion:](UIUndoGestureInteraction, "presentProductivityGestureTutorialInlineWithCompletion:", 0);
  if ((a4 & 0x10000000) == 0)
  {
LABEL_19:
    if ((a4 & 0x2000) == 0)
      goto LABEL_20;
    goto LABEL_82;
  }
LABEL_81:
  +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "firstResponder");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "undoManager");
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v9, "redo");

  +[_UIKeyboardUsageTracking redoKeyCount](_UIKeyboardUsageTracking, "redoKeyCount");
  +[UIKBAnalyticsDispatcher analyticsDispatchEventTextEditingOperation:trigger:](UIKBAnalyticsDispatcher, "analyticsDispatchEventTextEditingOperation:trigger:", CFSTR("Redo"), CFSTR("SWKeyboard"));
  +[UIUndoGestureInteraction presentProductivityGestureTutorialInlineWithCompletion:](UIUndoGestureInteraction, "presentProductivityGestureTutorialInlineWithCompletion:", 0);
  if ((a4 & 0x2000) == 0)
  {
LABEL_20:
    if ((a4 & 0x4000) == 0)
      goto LABEL_21;
    goto LABEL_83;
  }
LABEL_82:
  objc_msgSend(v18, "revealHiddenCandidates");
  if ((a4 & 0x4000) == 0)
  {
LABEL_21:
    if ((a4 & 0x200000) == 0)
      goto LABEL_22;
    goto LABEL_84;
  }
LABEL_83:
  objc_msgSend(v18, "showNextCandidates");
  if ((a4 & 0x200000) == 0)
  {
LABEL_22:
    if ((a4 & 0x1000000) == 0)
      goto LABEL_23;
LABEL_85:
    objc_msgSend(v18, "acceptAutocorrectionAndEndComposition");
    if ((a4 & 0x4000000) == 0)
      goto LABEL_25;
    goto LABEL_24;
  }
LABEL_84:
  objc_msgSend(v18, "showPreviousCandidate");
  if ((a4 & 0x1000000) != 0)
    goto LABEL_85;
LABEL_23:
  if ((a4 & 0x4000000) != 0)
  {
LABEL_24:
    objc_msgSend(v66, "key");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "representedString");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardLayoutStar setLayoutTag:](self, "setLayoutTag:", v27);

    -[UIKeyboardLayoutStar updateKeyCentroids](self, "updateKeyCentroids");
  }
LABEL_25:
  if ((a4 & 0x100) == 0
    || -[UIKBTree supportsType:](self->_keyplane, "supportsType:", -[UITextInputTraits keyboardType](self->super._inputTraits, "keyboardType"))|| (objc_msgSend(v66, "key"), v28 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v28, "representedString"), v29 = (void *)objc_claimAutoreleasedReturnValue(), v9 = objc_msgSend(v29, "isEqualToString:", CFSTR("-")), v29, v28, (v9 & 1) != 0))
  {
    v30 = 0;
    if ((a4 & 0x400) == 0)
      goto LABEL_45;
  }
  else
  {
    objc_msgSend(v66, "key");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "representedString");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v49, "_isSpaceOrReturn");

    if ((_DWORD)v9)
      ++self->_preferredTrackingChangeCount;
    if ((int)objc_msgSend(v18, "changeCount") > self->_preferredTrackingChangeCount)
    {
      -[UIKBTree alternateKeyplaneName](self->_keyplane, "alternateKeyplaneName");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardLayoutStar setKeyplaneName:](self, "setKeyplaneName:", v50);

      -[UIKeyboardLayoutStar setShift:](self, "setShift:", -[UIKBTree isShiftKeyplane](self->_keyplane, "isShiftKeyplane"));
    }
    v30 = 1;
    if ((a4 & 0x400) == 0)
      goto LABEL_45;
  }
  if (self->_shift)
  {
    if ((v30 & 1) != 0)
      goto LABEL_45;
LABEL_44:
    objc_msgSend(v18, "setShift:", 0);
    -[UIKeyboardLayoutStar setShift:](self, "setShift:", 0);
    -[UIKeyboardLayoutStar setAutoshift:](self, "setAutoshift:", 0);
    goto LABEL_45;
  }
  if (!self->_autoshift)
    v30 = 1;
  if ((v30 & 1) == 0)
    goto LABEL_44;
LABEL_45:
  if ((a4 & 0x400000) != 0)
  {
    objc_msgSend(v18, "toggleShift");
    objc_msgSend(v18, "setShiftPreventAutoshift:", 1);
    -[UIKeyboardLayoutStar setShift:](self, "setShift:", objc_msgSend(v18, "isShifted"));
    -[UIKeyboardLayoutStar setAutoshift:](self, "setAutoshift:", 0);
    goto LABEL_49;
  }
  v32 = v66;
  if ((a4 & 0x10) != 0)
  {
    -[UIKeyboardLayoutStar upActionShift](self, "upActionShift");
LABEL_49:
    v32 = v66;
  }
  if (self->_revertKeyplaneAfterTouch)
  {
    -[UIKeyboardLayoutStar preTouchKeyplaneName](self, "preTouchKeyplaneName");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v66;
    if (v33)
    {
      objc_msgSend(v66, "key");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v34, "modifiesKeyplane"))
      {

      }
      else
      {
        objc_msgSend(v66, "slidOffKey");
        v9 = objc_claimAutoreleasedReturnValue();

        v32 = v66;
        if (!v9)
          goto LABEL_61;
      }
      -[UIKeyboardLayoutStar preTouchKeyplaneName](self, "preTouchKeyplaneName");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardLayoutStar setKeyplaneName:](self, "setKeyplaneName:", v35);

      v36 = -[UIKBTree isShiftKeyplane](self->_keyplane, "isShiftKeyplane");
      if (v36 != objc_msgSend(v18, "isShifted") || self->_shift != v36)
      {
        objc_msgSend(v18, "setShift:", v36);
        objc_msgSend(v18, "setShiftPreventAutoshift:", 1);
        -[UIKeyboardLayoutStar setShift:](self, "setShift:", v36);
      }
      -[UIKBTree firstCachedKeyWithName:](self->_keyplane, "firstCachedKeyWithName:", CFSTR("Caps-Lock-Key"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (v37)
      {
        -[UIKBTree name](self->_keyplane, "name");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIKeyboardLayoutStar setKeyplaneName:](self, "setKeyplaneName:", v38);

      }
      self->_revertKeyplaneAfterTouch = 0;
      v32 = v66;
    }
  }
LABEL_61:
  objc_msgSend(v32, "key");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if ((a4 & 0x40000000) != 0)
  {
    v9 = (uint64_t)&off_1E167A000;
    if (+[UIDictationController viewMode](UIDictationController, "viewMode") == 1)
    {
      if (a6 > 3.0 && v12)
      {
        +[UIKeyboardDictationMenu activeInstance](UIKeyboardDictationMenu, "activeInstance");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "hide");
LABEL_93:

      }
    }
    else
    {
      +[UIInputSwitcherView activeInstance](UIInputSwitcherView, "activeInstance");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "isVisible");

      if ((v42 & 1) == 0)
      {
        if (!+[UIDictationController isRunning](UIDictationController, "isRunning"))
        {
          v56 = +[UIDictationController specificReasonTypeMicButtonOnKeyboard](UIDictationController, "specificReasonTypeMicButtonOnKeyboard");
          +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "setReasonType:", v56);

          +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "switchToDictationInputModeWithTouch:", 0);
          goto LABEL_93;
        }
        +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setReasonType:", 1);

        +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "stopDictation");

        +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(v45, "isDictationPopoverPresented");

        if (v46)
        {
          +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "dismissDictationPopover");
          goto LABEL_93;
        }
      }
    }
  }
  if (!self->_multitapKey && objc_msgSend(v39, "state") == 20)
    -[UIKeyboardLayoutStar setMultitapReverseKeyState](self, "setMultitapReverseKeyState");
  if ((a4 & 0x200) != 0)
    -[UIKeyboardLayoutStar multitapExpired](self, "multitapExpired");
  -[UIKeyboardLayoutStar handleKeyboardMenusForTouch:](self, "handleKeyboardMenusForTouch:", v66);
  if ((a4 & 0x1000000000) != 0)
    objc_msgSend(v18, "generateCandidatesWithOptions:", 4);
  objc_msgSend(v18, "clearLongPressTimer");
  objc_msgSend(v66, "setInitialDragPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  objc_msgSend(v66, "setDragged:", 0);
  if (!self->_revertKeyplaneAfterTouch)
    -[UIKeyboardLayoutStar setPreTouchKeyplaneName:](self, "setPreTouchKeyplaneName:", 0);
  -[UIKeyboardLayoutStar activeKey](self, "activeKey");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "parentKey");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  if (v59
    || (-[UIKeyboardLayoutStar activeKey](self, "activeKey"),
        v9 = objc_claimAutoreleasedReturnValue(),
        (objc_msgSend((id)v9, "hasSemiStickyVariant") & 1) != 0))
  {
    -[UIKeyboardLayoutStar activeKey](self, "activeKey");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "parentKey");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = (v61 != 0) & (a4 >> 3);

    if (v59)
    {

      if (!v62)
        goto LABEL_112;
    }
    else
    {

      if ((v62 & 1) == 0)
        goto LABEL_112;
    }
  }
  else
  {

  }
  -[UIKeyboardLayoutStar setActiveKey:](self, "setActiveKey:", 0);
LABEL_112:
  self->_prevTouchUpFinishedTime = CFAbsoluteTimeGetCurrent();
  -[UIKeyboardLayoutStar clearInfoForTouch:](self, "clearInfoForTouch:", v19);
  objc_msgSend(v18, "deleteWordLastDelete");
  if (v63 > 0.0
    && (objc_msgSend(v66, "key"),
        v64 = (void *)objc_claimAutoreleasedReturnValue(),
        v65 = objc_msgSend(v64, "interactionType"),
        v64,
        v65 == 4))
  {
    objc_msgSend(v18, "setDeleteWordLastDelete:", 0.0);
    objc_msgSend(v18, "handleDeleteWithExecutionContext:", v17);
  }
  else
  {
    objc_msgSend(v17, "returnExecutionToParent");
  }

}

- (void)touchCancelled:(id)a3 executionContext:(id)a4
{
  -[UIKeyboardLayoutStar touchCancelled:forResting:executionContext:](self, "touchCancelled:forResting:executionContext:", a3, 0, a4);
}

- (void)touchCancelled:(id)a3 forResting:(BOOL)a4 executionContext:(id)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  id v37;

  v6 = a4;
  v37 = a3;
  v8 = a5;
  -[UIKeyboardLayoutStar infoForTouch:](self, "infoForTouch:", v37);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addTouch:", v37);
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "initialKeyState") != 16
    || !_os_feature_enabled_impl()
    || (objc_msgSend(v9, "key"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "variantType"),
        v11,
        (v12 - 10) >= 4))
  {
    objc_msgSend(v9, "key");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      objc_msgSend(v9, "key");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "interactionType");

      if (v16 != 18)
      {
        objc_msgSend(v9, "key");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIKeyboardLayoutStar setState:forKey:](self, "setState:forKey:", 2, v17);

      }
    }
    objc_msgSend(v9, "key");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "interactionType");

    if (v19 == 9)
    {
      +[UIInputSwitcherView activeInstance](UIInputSwitcherView, "activeInstance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "hide");

    }
    objc_msgSend(v9, "key");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "interactionType");

    if (v22 == 4)
      objc_msgSend(v10, "stopAutoDelete");
    objc_msgSend(v10, "clearLongPressTimer");
    if (self->_keyboardImageViewIsDim)
      -[UIKeyboardLayoutStar setKeyboardDim:](self, "setKeyboardDim:", 0);
    objc_msgSend(v9, "key");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "interactionType") == 6)
    {

    }
    else
    {
      objc_msgSend(v9, "key");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "interactionType");

      if (v25 != 3)
        -[UIKeyboardLayoutStar clearHandwritingStrokesIfNeededAndNotify:](self, "clearHandwritingStrokesIfNeededAndNotify:", 0);
    }
    -[UIKeyboardLayoutStar clearInfoForTouch:forResting:](self, "clearInfoForTouch:forResting:", v37, v6);
    -[UIKeyboardLayoutStar preTouchKeyplaneName](self, "preTouchKeyplaneName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      if (objc_msgSend(v37, "tapCount") == 1
        && self->_prevTouchMoreKeyTime
        && (objc_msgSend(MEMORY[0x1E0C99D68], "date"),
            v27 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v27, "timeIntervalSinceDate:", self->_prevTouchMoreKeyTime),
            v29 = v28,
            v27,
            v29 <= 0.25))
      {
        -[UIKeyboardLayoutStar preTouchKeyplaneName](self, "preTouchKeyplaneName");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIKeyboardLayoutStar setKeyplaneName:](self, "setKeyplaneName:", v36);

      }
      else
      {
        -[UIKeyboardLayoutStar updateShiftKeyState](self, "updateShiftKeyState");
      }
    }
    -[UIKeyboardLayoutStar setPreTouchKeyplaneName:](self, "setPreTouchKeyplaneName:", 0);
    -[UIKeyboardLayoutStar handleDismissFlickView:](self, "handleDismissFlickView:", 0);
    if (+[UIDictationController isRunning](UIDictationController, "isRunning"))
    {
      +[UIKeyboardInputMode dictationInputMode](UIKeyboardInputMode, "dictationInputMode");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "usingTypeAndTalk");

      if ((v31 & 1) == 0)
      {
        +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "cancelDictation");

        +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "isDictationPopoverPresented");

        if (v34)
        {
          +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "dismissDictationPopover");

        }
      }
    }
    -[UIKeyboardLayoutStar _cleanUpBlinkAssertionIfNecessary](self, "_cleanUpBlinkAssertionIfNecessary");
  }
  objc_msgSend(v8, "returnExecutionToParent");

}

- (void)touchChanged:(id)a3 executionContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  -[UIKeyboardLayoutStar infoForTouch:](self, "infoForTouch:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "key");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "interactionType");

  if (v9 == 4)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "touchUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKBTouchState touchForTouchUUID:](UIKBTouchState, "touchForTouchUUID:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "force");
    objc_msgSend(v10, "adjustAutoDeleteTimerForForce:");

  }
  objc_msgSend(v6, "returnExecutionToParent");

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  UISwipeGestureRecognizer *v4;
  UISwipeGestureRecognizer *v5;
  char v6;
  void *v7;
  void *v8;

  v4 = (UISwipeGestureRecognizer *)a3;
  v5 = v4;
  if (self->_rightSwipeRecognizer == v4 || self->_leftSwipeRecognizer == v4)
  {
    -[UIKBTree firstCachedKeyWithName:](self->_keyplane, "firstCachedKeyWithName:", CFSTR("Space-Key"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardLayoutStar viewForKey:](self, "viewForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[UISwipeGestureRecognizer locationInView:](v5, "locationInView:", v8);
      v6 = objc_msgSend(v8, "pointInside:withEvent:", 0);
    }
    else
    {
      v6 = 0;
    }
    goto LABEL_11;
  }
  if (self->_upSwipeRecognizer == v4)
  {
    if (-[UIKeyboardLayoutStar _allowContinuousPathUI](self, "_allowContinuousPathUI"))
    {
      v6 = 0;
      goto LABEL_12;
    }
    -[UIKeyboardLayoutStar keyHitTestContainingPoint:](self, "keyHitTestContainingPoint:", -[UISwipeGestureRecognizer startPoint]((double *)self->_upSwipeRecognizer));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v8 != 0;
LABEL_11:

    goto LABEL_12;
  }
  v6 = 1;
LABEL_12:

  return v6;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  int v4;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;

  if (self->_upSwipeRecognizer == a3)
  {
    v6 = a4;
    objc_msgSend(v6, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "locationInView:", v7);
    v9 = v8;
    v11 = v10;

    -[UIKeyboardLayoutStar keyHitTestContainingPoint:](self, "keyHitTestContainingPoint:", v9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v12, "behavesAsShiftKey") ^ 1;

  }
  else
  {
    LOBYTE(v4) = 1;
  }
  return v4;
}

- (void)_gestureRecognizerFailed:(id)a3
{
  if (self->_pinchGestureRecognizer == a3)
    -[UIKeyboardLayoutStar pinchHandler:](self, "pinchHandler:");
}

- (void)uninstallGestureRecognizers
{
  UISwipeGestureRecognizer *upSwipeRecognizer;
  void *v4;
  UISwipeGestureRecognizer *v5;
  UIKeyboardPinchGestureRecognizer *pinchGestureRecognizer;
  void *v7;
  UIKeyboardPinchGestureRecognizer *v8;
  UISwipeGestureRecognizer *rightSwipeRecognizer;
  void *v10;
  UISwipeGestureRecognizer *v11;
  UISwipeGestureRecognizer *leftSwipeRecognizer;
  void *v13;
  UISwipeGestureRecognizer *v14;

  upSwipeRecognizer = self->_upSwipeRecognizer;
  if (upSwipeRecognizer)
  {
    -[UIGestureRecognizer view](upSwipeRecognizer, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      -[UIView removeGestureRecognizer:](self, "removeGestureRecognizer:", self->_upSwipeRecognizer);
    v5 = self->_upSwipeRecognizer;
    self->_upSwipeRecognizer = 0;

  }
  pinchGestureRecognizer = self->_pinchGestureRecognizer;
  if (pinchGestureRecognizer)
  {
    -[UIGestureRecognizer view](pinchGestureRecognizer, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      -[UIView removeGestureRecognizer:](self, "removeGestureRecognizer:", self->_pinchGestureRecognizer);
    v8 = self->_pinchGestureRecognizer;
    self->_pinchGestureRecognizer = 0;

  }
  rightSwipeRecognizer = self->_rightSwipeRecognizer;
  if (rightSwipeRecognizer)
  {
    -[UIGestureRecognizer view](rightSwipeRecognizer, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      -[UIView removeGestureRecognizer:](self, "removeGestureRecognizer:", self->_rightSwipeRecognizer);
    v11 = self->_rightSwipeRecognizer;
    self->_rightSwipeRecognizer = 0;

  }
  leftSwipeRecognizer = self->_leftSwipeRecognizer;
  if (leftSwipeRecognizer)
  {
    -[UIGestureRecognizer view](leftSwipeRecognizer, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      -[UIView removeGestureRecognizer:](self, "removeGestureRecognizer:", self->_leftSwipeRecognizer);
    v14 = self->_leftSwipeRecognizer;
    self->_leftSwipeRecognizer = 0;

  }
  -[UIKBResizingKeyplaneCoordinator uninstallGestureRecognizers](self->_resizingKeyplaneCoordinator, "uninstallGestureRecognizers");
}

- (void)swipeDetected:(id)a3
{
  void *v4;
  int v5;
  void *v6;

  if ((objc_msgSend(a3, "direction") & 4) != 0)
  {
    -[UIKeyboardLayoutStar activeKey](self, "activeKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "interactionType");

    if (v5 != 6)
    {
      self->_swipeDetected = 1;
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "longPressAction");

      self->_swipeDetected = 0;
    }
  }
}

- (id)infoForTouchUUID:(id)a3
{
  if (!a3)
    return 0;
  -[NSMutableDictionary objectForKey:](self->_extendedTouchInfoMap, "objectForKey:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)infoForTouch:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "touchUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardLayoutStar infoForTouchUUID:](self, "infoForTouchUUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)generateInfoForTouch:(id)a3
{
  id v4;
  UIKeyboardTouchInfo *v5;
  void *v6;
  NSMutableDictionary *extendedTouchInfoMap;
  void *v8;

  v4 = a3;
  v5 = objc_alloc_init(UIKeyboardTouchInfo);
  -[UIKeyboardTouchInfo addTouch:](v5, "addTouch:", v4);
  -[UIKeyboardTouchInfo setStage:](v5, "setStage:", 3);
  objc_msgSend(v4, "touchUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    extendedTouchInfoMap = self->_extendedTouchInfoMap;
    objc_msgSend(v4, "touchUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](extendedTouchInfoMap, "setObject:forKey:", v5, v8);

  }
  return v5;
}

- (void)cancelTouchIfNecessaryForInfo:(id)a3 forResting:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  UIKeyboardLayoutStar *v14;
  id v15;
  BOOL v16;

  v6 = a3;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "key");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "interactionType");

    if (v9 != 4)
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "canHandleKeyHitTest"))
      {
        objc_msgSend(v10, "clearLongPressTimer");
        objc_msgSend(v10, "taskQueue");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __65__UIKeyboardLayoutStar_cancelTouchIfNecessaryForInfo_forResting___block_invoke;
        v12[3] = &unk_1E16BB088;
        v13 = v7;
        v14 = self;
        v16 = a4;
        v15 = v10;
        objc_msgSend(v11, "addTask:", v12);

      }
    }
  }

}

void __65__UIKeyboardLayoutStar_cancelTouchIfNecessaryForInfo_forResting___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  double v12;
  void *v13;
  id v14;

  v14 = a2;
  if (!objc_msgSend(*(id *)(a1 + 32), "stage")
    || objc_msgSend(*(id *)(a1 + 32), "stage") == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "setStage:", 3);
    objc_msgSend(*(id *)(a1 + 32), "touch");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "locationInView:", *(_QWORD *)(a1 + 40));
    v5 = v4;
    v7 = v6;
    objc_msgSend(v3, "timestamp");
    v9 = v8;
    v10 = (void *)MEMORY[0x1E0DBDC78];
    if (*(_BYTE *)(a1 + 56))
      v11 = 4;
    else
      v11 = 3;
    objc_msgSend(v3, "pathMajorRadius");
    objc_msgSend(v10, "touchEventWithStage:location:radius:timestamp:pathIndex:fingerID:forcedKeyCode:", v11, objc_msgSend(v3, "pathIndex"), objc_msgSend(*(id *)(a1 + 32), "fingerID"), -1, v5, v7, v12, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "skipHitTestForTouchEvent:", v13);

  }
  objc_msgSend(v14, "returnExecutionToParent");

}

- (void)clearInfoForTouch:(id)a3
{
  -[UIKeyboardLayoutStar clearInfoForTouch:forResting:](self, "clearInfoForTouch:forResting:", a3, 0);
}

- (void)clearInfoForTouch:(id)a3 forResting:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  NSMutableDictionary *extendedTouchInfoMap;
  void *v9;
  id v10;

  v4 = a4;
  v10 = a3;
  -[UIKeyboardLayoutStar infoForTouch:](self, "infoForTouch:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardLayoutStar cancelTouchIfNecessaryForInfo:forResting:](self, "cancelTouchIfNecessaryForInfo:forResting:", v6, v4);
  if (!v4)
  {
    objc_msgSend(v10, "touchUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      extendedTouchInfoMap = self->_extendedTouchInfoMap;
      objc_msgSend(v10, "touchUUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary removeObjectForKey:](extendedTouchInfoMap, "removeObjectForKey:", v9);

    }
  }

}

- (id)touchInfoForKey:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NSMutableDictionary allKeys](self->_extendedTouchInfoMap, "allKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v8)
        objc_enumerationMutation(v5);
      -[NSMutableDictionary objectForKey:](self->_extendedTouchInfoMap, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "key");
      v11 = (id)objc_claimAutoreleasedReturnValue();

      if (v11 == v4)
        break;

      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v10 = 0;
  }

  return v10;
}

- (BOOL)hasActiveContinuousPathInput
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSMutableDictionary allKeys](self->_extendedTouchInfoMap, "allKeys", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        -[NSMutableDictionary objectForKey:](self->_extendedTouchInfoMap, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "continuousPathState");

        if (v9 == 4)
        {
          v10 = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (BOOL)keyHasAccentedVariants:(id)a3
{
  id v4;
  void *v5;
  char v6;
  char v7;
  NSMutableSet *v9;
  NSMutableSet *accentInfo;
  NSMutableSet *v11;
  NSMutableSet *hasAccents;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];

  v4 = a3;
  if (-[UIKBTree visualStyle](self->_keyboard, "visualStyle") == 301
    || (objc_msgSend(v4, "name"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "hasPrefix:", CFSTR("NumberPad")),
        v5,
        (v6 & 1) != 0)
    || -[UIKBTree visualStyle](self->_keyboard, "visualStyle") == 101)
  {
    v7 = 0;
  }
  else
  {
    if (!self->_accentInfo)
    {
      v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      accentInfo = self->_accentInfo;
      self->_accentInfo = v9;

      v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      hasAccents = self->_hasAccents;
      self->_hasAccents = v11;

    }
    objc_msgSend(v4, "representedString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "variantType") == 8)
    {
      -[UIKeyboardLayoutStar _keyplaneVariantsKeyForString:](self, "_keyplaneVariantsKeyForString:", v13);
      v14 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v14;
    }
    if (objc_msgSend(v4, "displayType") == 7)
    {
      objc_msgSend(v4, "secondaryRepresentedStrings");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count");

      if (v16)
      {
        objc_msgSend(v4, "secondaryRepresentedStrings");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "firstObject");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringByAppendingString:", v18);
        v19 = objc_claimAutoreleasedReturnValue();

        v13 = (void *)v19;
      }
    }
    if (v13 && (-[NSMutableSet containsObject:](self->_accentInfo, "containsObject:", v13) & 1) == 0)
    {
      -[NSMutableSet addObject:](self->_accentInfo, "addObject:", v13);
      UIKeyboardGetCurrentInputMode();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardLayout getRomanAccentVariantsForString:inputMode:keyboardVariantIndludes:](self, "getRomanAccentVariantsForString:inputMode:keyboardVariantIndludes:", v13, v20, 7);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v21, "objectForKey:", CFSTR("Strings"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __47__UIKeyboardLayoutStar_keyHasAccentedVariants___block_invoke;
      v25[3] = &unk_1E16CCDA8;
      v25[4] = self;
      objc_msgSend(v22, "indexesOfObjectsPassingTest:", v25);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectsAtIndexes:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v24, "count"))
        -[NSMutableSet addObject:](self->_hasAccents, "addObject:", v13);

    }
    v7 = -[NSMutableSet containsObject:](self->_hasAccents, "containsObject:", v13);

  }
  return v7;
}

uint64_t __47__UIKeyboardLayoutStar_keyHasAccentedVariants___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 776), "containsObject:", a2) ^ 1;
}

- (unint64_t)downActionFlagsForKey:(id)a3
{
  id v4;
  unint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  void *v24;
  void *v25;
  int v26;
  int v27;

  v4 = a3;
  if (!objc_msgSend(v4, "visible") || -[UIKeyboardLayoutStar stateForKey:](self, "stateForKey:", v4) == 1)
  {
    v5 = 0;
    goto LABEL_53;
  }
  v6 = objc_msgSend(v4, "interactionType");
  v7 = objc_msgSend(v4, "variantType");
  if (v6 == 4)
  {
    if (self->_deleteTarget)
    {
      if (self->_deleteLongAction)
        v9 = 1048773;
      else
        v9 = 69;
    }
    else
    {
      v9 = 69;
    }
  }
  else
  {
    if (v6 == 13)
    {
      if (self->_returnTarget)
      {
        v8 = 864;
LABEL_15:
        v10 = *(Class *)((char *)&self->super.super.super.super.isa + v8) == 0;
        v11 = 1048709;
        v12 = 5;
LABEL_16:
        if (v10)
          v9 = v12;
        else
          v9 = v11;
        goto LABEL_46;
      }
    }
    else
    {
      if (v6 != 15)
      {
        if ((v6 - 1) > 1)
        {
          v9 = 5;
          switch(v6)
          {
            case 3:
            case 38:
              v9 = 128;
              break;
            case 5:
              v27 = +[UIDictationController viewMode](UIDictationController, "viewMode");
              v11 = 1073741829;
              v12 = 1073741957;
              v10 = v27 == 1;
              goto LABEL_16;
            case 6:
              if (+[UIKeyboardImpl rivenTranslationPreference](UIKeyboardImpl, "rivenTranslationPreference"))
              {
                v9 = 133;
              }
              else
              {
                v9 = 5;
              }
              break;
            case 7:
              v9 = 1048581;
              break;
            case 9:
              v9 = 4229;
              break;
            case 10:
              v9 = 536870916;
              break;
            case 11:
              v9 = 36;
              break;
            case 12:
            case 16:
            case 17:
            case 20:
            case 21:
            case 24:
            case 25:
            case 26:
            case 27:
            case 31:
            case 32:
            case 33:
            case 34:
            case 35:
            case 36:
            case 37:
            case 40:
            case 41:
              goto LABEL_46;
            case 14:
              v9 = 20;
              break;
            case 28:
            case 29:
            case 30:
              v9 = 4;
              break;
            case 44:
              v9 = 1;
              break;
            default:
              v9 = 0;
              break;
          }
        }
        else
        {
          v13 = v7;
          if ((-[UIKBTree visualStyling](self->_keyplane, "visualStyling") & 0x3F) == 0x17)
          {
            v14 = objc_msgSend(v4, "displayType");
            if (v13 != 3 && v14 == 7)
              v16 = 32901;
            else
              v16 = 5;
          }
          else
          {
            v16 = 5;
          }
          v9 = 32901;
          switch(v13)
          {
            case 1:
              break;
            case 3:
              v17 = 262272;
              goto LABEL_40;
            case 4:
              v17 = 131200;
              goto LABEL_40;
            case 5:
            case 10:
            case 12:
              v17 = 8421376;
              goto LABEL_40;
            case 7:
              v17 = 65664;
              goto LABEL_40;
            case 8:
              v9 = 557189;
              break;
            case 9:
              v17 = 2155872261;
              goto LABEL_40;
            case 11:
            case 13:
              v17 = 0x100000080;
LABEL_40:
              v9 = v16 | v17;
              break;
            default:
              +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v24, "isLongPress")
                && -[UIKeyboardLayoutStar keyHasAccentedVariants:](self, "keyHasAccentedVariants:", v4))
              {
                objc_msgSend(v4, "name");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                v26 = objc_msgSend(v25, "hasPrefix:", CFSTR("Assist"));

                if (v26)
                  v9 = v16;
                else
                  v9 = 32901;
              }
              else
              {

                v9 = v16;
              }
              break;
          }
          objc_msgSend(v4, "name");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v18, "hasPrefix:", CFSTR("NumberPad-")) & 1) != 0)
          {
            objc_msgSend(v4, "name");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "hasSuffix:", CFSTR("-0-Plus"));

            if (v20)
              v9 |= 0x80uLL;
          }
          else
          {

          }
        }
        goto LABEL_46;
      }
      if (self->_spaceTarget)
      {
        v8 = 840;
        goto LABEL_15;
      }
    }
    v9 = 5;
  }
LABEL_46:
  if (-[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") != 2
    && -[UITextInputTraits keyboardType](self->super._inputTraits, "keyboardType") == 7)
  {
    objc_msgSend(v4, "representedString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("@"));

    if (v22)
      v9 &= 0x1FFFF7F7FuLL;
  }
  if (-[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") == 3)
    v5 = v9 & 0xFFFFFFFFFFFFFF7FLL;
  else
    v5 = v9;
LABEL_53:

  return v5;
}

- (unint64_t)upActionFlagsForKey:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = a3;
  if (objc_msgSend(v4, "visible") && -[UIKeyboardLayoutStar stateForKey:](self, "stateForKey:", v4) != 1)
  {
    if (objc_msgSend(v4, "BOOLForProperty:", CFSTR("more-after")))
      v7 = 256;
    else
      v7 = 0;
    if (objc_msgSend(v4, "BOOLForProperty:", CFSTR("shift-after")))
      v8 = v7 | 0x400000;
    else
      v8 = v7;
    v5 = v8;
    switch(objc_msgSend(v4, "interactionType"))
    {
      case 1u:
      case 2u:
      case 0x10u:
        if (objc_msgSend(v4, "variantType") == 9
          || objc_msgSend(v4, "variantType") == 10
          || objc_msgSend(v4, "variantType") == 12
          || objc_msgSend(v4, "variantType") == 13)
        {
          v9 = 2147483658;
          goto LABEL_48;
        }
        v5 = v8 | 0xA;
        if (objc_msgSend(v4, "variantType") == 11 && _os_feature_enabled_impl())
          v5 = v8 | 0x200000000ALL;
        break;
      case 3u:
        v5 = v8 | 0x80;
        break;
      case 4u:
        v5 = v8 | 0x808;
        if (self->_deleteTarget && self->_deleteAction)
        {
          v10 = v8 & 0x400000 | 0x808;
          goto LABEL_40;
        }
        break;
      case 5u:
        v5 = v8 | 0x40000000;
        break;
      case 6u:
        v9 = 33554440;
        goto LABEL_48;
      case 9u:
        v9 = 4104;
        goto LABEL_48;
      case 0xBu:
        if (-[UIKBTree isShiftKeyPlaneChooser](self->_keyplane, "isShiftKeyPlaneChooser"))
          v5 = v8 | 0x400;
        else
          v5 = v8;
        break;
      case 0xCu:
        v9 = 268435464;
        goto LABEL_48;
      case 0xDu:
        v5 = v8 | 0xA;
        if (self->_returnTarget && self->_returnAction)
          goto LABEL_39;
        if (-[UITextInputTraits keyboardType](self->super._inputTraits, "keyboardType") == 122
          && -[UITextInputTraits returnKeyType](self->super._inputTraits, "returnKeyType") == 9)
        {
          v5 = v8 | 0x100A;
        }
        break;
      case 0xEu:
        v5 = v8 | 0x10;
        break;
      case 0xFu:
        v5 = v8 | 0xA;
        if (self->_spaceTarget && self->_spaceAction)
        {
LABEL_39:
          v10 = v5 & 0x400008;
LABEL_40:
          v5 = v10 | 0x100000;
        }
        break;
      case 0x11u:
        v9 = 134217736;
        goto LABEL_48;
      case 0x14u:
      case 0x15u:
      case 0x29u:
        v9 = 520;
        goto LABEL_48;
      case 0x18u:
        v9 = 8200;
        goto LABEL_48;
      case 0x19u:
        v9 = 16392;
        goto LABEL_48;
      case 0x1Au:
        v9 = 2097160;
        goto LABEL_48;
      case 0x1Bu:
        v9 = 16777736;
        goto LABEL_48;
      case 0x1Fu:
      case 0x20u:
      case 0x21u:
      case 0x22u:
      case 0x23u:
      case 0x2Cu:
        v5 = v8 | 8;
        break;
      case 0x24u:
        v9 = 67108872;
        goto LABEL_48;
      case 0x25u:
        v9 = 0x200000008;
LABEL_48:
        v5 = v8 | v9;
        break;
      case 0x28u:
        v5 = v8 | 0x800000008;
        break;
      case 0x2Au:
        v5 = v8 | 0x100000;
        break;
      default:
        break;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)refreshDualStringKeys
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[UIKBTree keys](self->_keyplane, "keys", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v8, "displayType") == 7)
          -[UIKeyboardLayoutStar setState:forKey:](self, "setState:forKey:", objc_msgSend(v8, "state"), v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)downActionShiftWithKey:(id)a3
{
  void *v4;
  double Current;
  double v6;
  BOOL v7;
  _BOOL8 holdingShift;
  _BOOL8 v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  Current = CFAbsoluteTimeGetCurrent();
  v6 = Current;
  if (!self->_shiftLockReady
    || Current - self->_shiftLockFirstTapTime >= 0.3
    || !objc_msgSend(v4, "shiftLockedEnabled")
    || -[UIKeyboardLayoutStar ignoresShiftState](self, "ignoresShiftState"))
  {
    self->_shiftLockReady = 1;
    self->_shiftLockFirstTapTime = v6;
    self->_wasShifted = objc_msgSend(v4, "isShifted");
    self->_holdingShift = 1;
    if (self->_wasShifted)
    {
      v7 = -[UIKBTree looksLikeShiftAlternate](self->_keyplane, "looksLikeShiftAlternate");
      objc_msgSend(v4, "setShiftLocked:", 0);
      if (!v7)
      {
        holdingShift = self->_holdingShift;
LABEL_10:
        objc_msgSend(v4, "setShift:", holdingShift);
        v9 = 1;
        objc_msgSend(v4, "setShiftPreventAutoshift:", 1);
        if ((objc_msgSend(v4, "isShifted") & 1) == 0)
          v9 = self->_holdingShift;
        -[UIKeyboardLayoutStar setShift:](self, "setShift:", v9);
        -[UIKeyboardLayoutStar touchInfoForKey:](self, "touchInfoForKey:", v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "touch");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "touchUUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIKeyboardLayout setShiftKeyTouchUUID:](self, "setShiftKeyTouchUUID:", v12);

        self->_shiftTrackingChangeCount = objc_msgSend(v4, "changeCount");
        goto LABEL_13;
      }
    }
    else
    {
      objc_msgSend(v4, "setShiftLocked:", 0);
    }
    holdingShift = 1;
    goto LABEL_10;
  }
  self->_shiftLockReady = 0;
  objc_msgSend(v4, "setShiftLocked:", 1);
  -[UIKBTree updateFlickKeycapOnKeys](self->_keyplane, "updateFlickKeycapOnKeys");
  -[UIKeyboardLayoutStar refreshDualStringKeys](self, "refreshDualStringKeys");
  -[UIKeyboardLayout setShiftKeyTouchUUID:](self, "setShiftKeyTouchUUID:", 0);
  -[UIKeyboardLayoutStar setShift:](self, "setShift:", 1);
  if (!-[UIKBTree isShiftKeyPlaneChooser](self->_keyplane, "isShiftKeyPlaneChooser"))
    -[UIKeyboardLayoutStar setState:forKey:](self, "setState:forKey:", 8, v13);
LABEL_13:
  -[UIKeyboardLayoutStar setActiveKey:](self, "setActiveKey:", 0);

}

- (void)upActionShift
{
  void *v3;
  int shiftTrackingChangeCount;
  void *v5;
  uint64_t v6;
  id v7;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  self->_holdingShift = 0;
  shiftTrackingChangeCount = self->_shiftTrackingChangeCount;
  v7 = v3;
  if (shiftTrackingChangeCount == objc_msgSend(v3, "changeCount"))
  {
    v5 = v7;
    if (self->_wasShifted)
    {
      v6 = objc_msgSend(v7, "isShiftLocked");
      v5 = v7;
    }
    else
    {
      v6 = 1;
    }
    objc_msgSend(v5, "setShift:", v6);
    objc_msgSend(v7, "setShiftPreventAutoshift:", 1);
    -[UIKeyboardLayoutStar setShift:](self, "setShift:", objc_msgSend(v7, "isShifted"));
    self->_revertKeyplaneAfterTouch = 0;
  }
  else
  {
    objc_msgSend(v7, "setShift:", 0);
    objc_msgSend(v7, "setShiftPreventAutoshift:", 1);
    -[UIKeyboardLayoutStar setShift:](self, "setShift:", objc_msgSend(v7, "isShifted"));
  }

}

- (BOOL)ignoresShiftState
{
  return -[UIKBTree BOOLForProperty:](self->_keyplane, "BOOLForProperty:", CFSTR("ignore-shift-state"));
}

- (BOOL)supportsContinuousPath
{
  return -[UIKBTree BOOLForProperty:](self->_keyplane, "BOOLForProperty:", CFSTR("supports-continuous-path"));
}

uint64_t __50__UIKeyboardLayoutStar_setMultitapReverseKeyState__block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = result;
  if (*(_QWORD *)(result + 32))
    result = objc_msgSend(*(id *)(result + 40), "setState:forKey:", objc_msgSend(*(id *)(result + 40), "stateForMultitapReverseKey:"), *(_QWORD *)(result + 32));
  if (*(_QWORD *)(v1 + 48))
    return objc_msgSend(*(id *)(v1 + 40), "setState:forKey:", objc_msgSend(*(id *)(v1 + 40), "stateForMultitapForwardKey:"), *(_QWORD *)(v1 + 48));
  return result;
}

- (void)willRotate:(int64_t)a3
{
  NSString *v5;
  NSString *preRotateKeyplaneName;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  self->_preRotateShift = self->_shift;
  v5 = (NSString *)-[NSString copy](self->_keyplaneName, "copy");
  preRotateKeyplaneName = self->_preRotateKeyplaneName;
  self->_preRotateKeyplaneName = v5;

  -[UIKeyboardLayoutStar modalDisplayView](self, "modalDisplayView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[UIKeyboardLayoutStar modalDisplayView](self, "modalDisplayView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeFromSuperview");

    -[UIKeyboardLayoutStar setModalDisplayView:](self, "setModalDisplayView:", 0);
    -[UIView setHidden:](self->_keyplaneView, "setHidden:", 0);
  }
  if (self->_isTrackpadMode)
  {
    -[UIKeyboardLayoutStar didEndIndirectSelectionGesture:](self, "didEndIndirectSelectionGesture:", 0);
    self->_preRotateTrackpadMode = 1;
  }
  if (-[UIKeyboardLayoutStar useCrescendoLayout](self, "useCrescendoLayout"))
  {
    if (self->_liveKeyplaneView)
    {
      +[UIKeyboardImpl keyboardScreen](UIKeyboardImpl, "keyboardScreen");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIKBScreenTraits traitsWithScreen:orientation:ignoreRemoteKeyboard:](UIKBScreenTraits, "traitsWithScreen:orientation:ignoreRemoteKeyboard:", v9, a3, 1);
      v10 = (id)objc_claimAutoreleasedReturnValue();

      -[TUIKeyplaneView setOverrideScreenTraits:](self->_liveKeyplaneView, "setOverrideScreenTraits:", v10);
    }
  }
}

- (void)didRotate
{
  NSString *preRotateKeyplaneName;
  NSString *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char v10;
  NSString *v11;

  preRotateKeyplaneName = self->_preRotateKeyplaneName;
  if (preRotateKeyplaneName)
  {
    v4 = preRotateKeyplaneName;
    -[UIKBTree subtreeWithName:](self->_keyboard, "subtreeWithName:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      -[UIKeyboardLayoutStar defaultNameForKeyplaneName:](self, "defaultNameForKeyplaneName:", self->_preRotateKeyplaneName);
      v6 = objc_claimAutoreleasedReturnValue();

      v4 = (NSString *)v6;
    }
    -[UIKBTree subtreeWithName:](self->_keyboard, "subtreeWithName:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      -[UIKeyboardLayoutStar initialKeyplaneNameWithKBStarName:](self, "initialKeyplaneNameWithKBStarName:", 0);
      v8 = objc_claimAutoreleasedReturnValue();

      v4 = (NSString *)v8;
    }
    if (!-[UIKeyboardLayout isFloating](self, "isFloating")
      || (-[UIKeyboardLayoutStar keyplaneName](self, "keyplaneName"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v9, "isEqualToString:", v4),
          v9,
          (v10 & 1) == 0))
    {
      -[UIKeyboardLayoutStar setKeyplaneName:](self, "setKeyplaneName:", v4);
    }
    v11 = self->_preRotateKeyplaneName;
    self->_preRotateKeyplaneName = 0;

  }
  -[UIKeyboardLayoutStar deactivateActiveKeys](self, "deactivateActiveKeys");
  -[UIKeyboardLayoutStar updateShiftKeyState](self, "updateShiftKeyState");
  if (self->_preRotateShift)
    -[UIKeyboardLayoutStar setAutoshift:](self, "setAutoshift:", 1);
  if (self->_preRotateTrackpadMode)
  {
    -[UIKeyboardLayoutStar willBeginIndirectSelectionGesture:](self, "willBeginIndirectSelectionGesture:", 0);
    self->_preRotateTrackpadMode = 0;
  }
  -[UIKeyboardLayoutStar rebuildSplitTransitionView](self, "rebuildSplitTransitionView");
}

- (BOOL)shouldRetestTouchDraggedFromKey:(id)a3
{
  return objc_msgSend(a3, "allowRetestAfterCommittingDownActions");
}

- (BOOL)shouldRetestKey:(id)a3 slidOffKey:(id)a4 withKeyplane:(id)a5
{
  id v8;
  UIKBTree *v9;
  BOOL v10;
  void *v12;

  v8 = a3;
  v9 = (UIKBTree *)a5;
  v10 = 0;
  if (objc_msgSend(v8, "interactionType") != 4 && self->_keyplane != v9)
  {
    if (!objc_msgSend(v8, "modifiesKeyplane")
      || objc_msgSend(v8, "interactionType") != 10
      && (-[UIKeyboardLayoutStar preTouchKeyplaneName](self, "preTouchKeyplaneName"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v12,
          a4)
      && v12)
    {
      v10 = 1;
    }
  }

  return v10;
}

- (id)baseKeyForString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  char v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t k;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t m;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t n;
  id v44;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UIKeyboardLayoutStar keyboard](self, "keyboard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subtrees");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v7 = v6;
  v53 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v71, v79, 16);
  if (v53)
  {
    v8 = *(_QWORD *)v72;
    v52 = *(_QWORD *)v72;
    do
    {
      for (i = 0; i != v53; ++i)
      {
        if (*(_QWORD *)v72 != v8)
          objc_enumerationMutation(v7);
        v10 = v7;
        v11 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
        v67 = 0u;
        v68 = 0u;
        v69 = 0u;
        v70 = 0u;
        objc_msgSend(v11, "keys");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v67, v78, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v68;
          while (2)
          {
            for (j = 0; j != v14; ++j)
            {
              if (*(_QWORD *)v68 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * j);
              objc_msgSend(v17, "representedString");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v18, "isEqualToString:", v4);

              if ((v19 & 1) != 0)
              {
                v44 = v17;

                v7 = v10;
                v23 = v10;
                goto LABEL_46;
              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v67, v78, 16);
            if (v14)
              continue;
            break;
          }
        }

        v7 = v10;
        v8 = v52;
      }
      v53 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v71, v79, 16);
    }
    while (v53);
  }

  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v20 = v7;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v63, v77, 16);
  if (v21)
  {
    v22 = v21;
    v23 = 0;
    v24 = *(_QWORD *)v64;
    v49 = v7;
    v50 = v20;
    v46 = *(_QWORD *)v64;
    do
    {
      for (k = 0; k != v22; ++k)
      {
        if (*(_QWORD *)v64 != v24)
          objc_enumerationMutation(v20);
        v26 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * k);
        v59 = 0u;
        v60 = 0u;
        v61 = 0u;
        v62 = 0u;
        objc_msgSend(v26, "keys");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v59, v76, 16);
        if (v51)
        {
          v28 = *(_QWORD *)v60;
          v47 = v22;
          v48 = *(_QWORD *)v60;
          v54 = v27;
          do
          {
            for (m = 0; m != v51; ++m)
            {
              if (*(_QWORD *)v60 != v28)
                objc_enumerationMutation(v27);
              v30 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * m);
              objc_msgSend(v30, "representedString");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v30, "displayType") == 7)
              {
                objc_msgSend(v30, "secondaryRepresentedStrings");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v33 = objc_msgSend(v32, "count");

                if (v33)
                {
                  objc_msgSend(v30, "secondaryRepresentedStrings");
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v34, "firstObject");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v31, "stringByAppendingString:", v35);
                  v36 = objc_claimAutoreleasedReturnValue();

                  v31 = (void *)v36;
                }
              }
              UIKeyboardGetCurrentInputMode();
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              UIKeyboardRomanAccentVariants((uint64_t)v31, v37, 7);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "objectForKey:", CFSTR("Strings"));
              v39 = (void *)objc_claimAutoreleasedReturnValue();

              v57 = 0u;
              v58 = 0u;
              v55 = 0u;
              v56 = 0u;
              v23 = v39;
              v40 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v55, v75, 16);
              if (v40)
              {
                v41 = v40;
                v42 = *(_QWORD *)v56;
                while (2)
                {
                  for (n = 0; n != v41; ++n)
                  {
                    if (*(_QWORD *)v56 != v42)
                      objc_enumerationMutation(v23);
                    if ((objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * n), "isEqualToString:", v4) & 1) != 0)
                    {
                      v44 = v30;

                      v7 = v49;
                      goto LABEL_46;
                    }
                  }
                  v41 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v55, v75, 16);
                  if (v41)
                    continue;
                  break;
                }
              }

              v27 = v54;
              v28 = v48;
            }
            v20 = v50;
            v24 = v46;
            v22 = v47;
            v51 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v59, v76, 16);
          }
          while (v51);
        }

      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v63, v77, 16);
      v7 = v49;
    }
    while (v22);
  }
  else
  {
    v23 = 0;
  }

  NSLog(CFSTR("Couldn't find key for string: %@"), v4);
  v44 = 0;
LABEL_46:

  return v44;
}

- (id)keyplaneForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[UIKeyboardLayoutStar keyboard](self, "keyboard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyplaneForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)keyplaneNamed:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[UIKeyboardLayoutStar keyboard](self, "keyboard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subtreeWithName:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)changeToKeyplane:(id)a3
{
  void *v4;
  _BOOL8 v5;
  id v6;

  objc_msgSend(a3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardLayoutStar setKeyplaneName:](self, "setKeyplaneName:", v4);

  v5 = -[UIKBTree isShiftKeyplane](self->_keyplane, "isShiftKeyplane");
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 != objc_msgSend(v6, "isShifted"))
  {
    objc_msgSend(v6, "setShift:", v5);
    objc_msgSend(v6, "setShiftPreventAutoshift:", 1);
    objc_msgSend(v6, "forceShiftUpdate");
  }

}

- (void)switchKeyplane:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[UIKeyboardLayoutStar keyplaneNameForRevertAfterTouch](self, "keyplaneNameForRevertAfterTouch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardLayoutStar setPreTouchKeyplaneName:](self, "setPreTouchKeyplaneName:", v5);

  self->_revertKeyplaneAfterTouch = 0;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "keyActivated");

  -[UIKeyboardLayoutStar setKeyplaneName:](self, "setKeyplaneName:", v4);
  -[UIKeyboardLayoutStar setActiveKey:](self, "setActiveKey:", 0);
}

- (CGPoint)applyError:(CGPoint)a3 toKey:(id)a4
{
  double y;
  double x;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double MinX;
  uint64_t v14;
  double MaxX;
  double MinY;
  uint64_t v20;
  double MaxY;
  double v25;
  double v26;
  CGPoint result;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  y = a3.y;
  x = a3.x;
  objc_msgSend(a4, "frame");
  v11 = x + v8 + v7 * 0.5;
  v12 = y + v10 + v9 * 0.5;
  -[UIView bounds](self, "bounds");
  MinX = CGRectGetMinX(v28);
  -[UIView bounds](self, "bounds");
  if (v11 >= MinX)
  {
    if (v11 <= CGRectGetMaxX(*(CGRect *)&v14))
      goto LABEL_6;
    -[UIView bounds](self, "bounds");
    MaxX = CGRectGetMaxX(v29);
  }
  else
  {
    MaxX = CGRectGetMinX(*(CGRect *)&v14);
  }
  v11 = MaxX;
LABEL_6:
  -[UIView bounds](self, "bounds");
  MinY = CGRectGetMinY(v30);
  -[UIView bounds](self, "bounds");
  if (v12 < MinY)
  {
    MaxY = CGRectGetMinY(*(CGRect *)&v20);
LABEL_10:
    v12 = MaxY;
    goto LABEL_11;
  }
  if (v12 > CGRectGetMaxY(*(CGRect *)&v20))
  {
    -[UIView bounds](self, "bounds");
    MaxY = CGRectGetMaxY(v31);
    goto LABEL_10;
  }
LABEL_11:
  v25 = v11;
  v26 = v12;
  result.y = v26;
  result.x = v25;
  return result;
}

- (id)simulateTouch:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  __CFString *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double Current;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  y = a3.y;
  x = a3.x;
  -[UIKeyboardLayoutStar keyHitTestContainingPoint:](self, "keyHitTestContainingPoint:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "representedString");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = CFSTR("<no key>");
  }
  -[UIView convertPoint:toView:](self, "convertPoint:toView:", 0, x, y);
  v10 = v9;
  v12 = v11;
  Current = CFAbsoluteTimeGetCurrent();
  -[UIView window](self, "window");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardSyntheticTouch syntheticTouchWithPoint:timestamp:window:](UIKeyboardSyntheticTouch, "syntheticTouchWithPoint:timestamp:window:", v14, v10, v12, Current);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardLayout touchesBegan:withEvent:](self, "touchesBegan:withEvent:", v16, 0);

  objc_msgSend(v15, "setPhase:", 3);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardLayout touchesEnded:withEvent:](self, "touchesEnded:withEvent:", v17, 0);

  return v8;
}

- (id)simulateTouchForCharacter:(id)a3 errorVector:(CGPoint)a4 shouldTypeVariants:(BOOL)a5 baseKeyForVariants:(BOOL)a6
{
  double y;
  double x;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  __CFString *v17;
  void *v18;
  char v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double Current;
  void *v32;
  void *v33;
  void *v34;
  void *v35;

  y = a4.y;
  x = a4.x;
  v11 = a3;
  -[UIKeyboardLayoutStar baseKeyForString:](self, "baseKeyForString:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
    goto LABEL_9;
  if (!a5)
  {
    objc_msgSend(v12, "representedString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isEqualToString:", v11);

    if ((v19 & 1) != 0)
      goto LABEL_7;
LABEL_9:
    v17 = 0;
    goto LABEL_12;
  }
  if (!a6)
  {
    objc_msgSend(v12, "representedString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", v11);

    if ((v15 & 1) == 0)
    {
      NSLog(CFSTR("inserting variant string: %@"), v11);
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addInputString:withFlags:", v11, 2);

      v17 = (__CFString *)v11;
      goto LABEL_12;
    }
  }
LABEL_7:
  -[UIKeyboardLayoutStar keyplaneForKey:](self, "keyplaneForKey:", v13);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardLayoutStar changeToKeyplane:](self, "changeToKeyplane:", v20);
  -[UIKeyboardLayoutStar applyError:toKey:](self, "applyError:toKey:", v13, x, y);
  v22 = v21;
  v24 = v23;
  -[UIKeyboardLayoutStar keyHitTestContainingPoint:](self, "keyHitTestContainingPoint:");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v25)
  {
    objc_msgSend(v25, "representedString");
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = CFSTR("<no key>");
  }
  -[UIView convertPoint:toView:](self, "convertPoint:toView:", 0, v22, v24);
  v28 = v27;
  v30 = v29;
  Current = CFAbsoluteTimeGetCurrent();
  -[UIView window](self, "window");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardSyntheticTouch syntheticTouchWithPoint:timestamp:window:](UIKeyboardSyntheticTouch, "syntheticTouchWithPoint:timestamp:window:", v32, v28, v30, Current);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardLayout touchesBegan:withEvent:](self, "touchesBegan:withEvent:", v34, 0);

  objc_msgSend(v33, "setPhase:", 3);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v33);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardLayout touchesEnded:withEvent:](self, "touchesEnded:withEvent:", v35, 0);

LABEL_12:
  return v17;
}

- (void)fadeWithInvocation:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;
  _QWORD v7[5];

  v6 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__UIKeyboardLayoutStar_fadeWithInvocation___block_invoke;
  v7[3] = &unk_1E16B1B28;
  v7[4] = self;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__UIKeyboardLayoutStar_fadeWithInvocation___block_invoke_2;
  v5[3] = &unk_1E16B2218;
  v5[4] = self;
  v4 = v6;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 117571584, v7, v5, 0.2, 0.0);

}

uint64_t __43__UIKeyboardLayoutStar_fadeWithInvocation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __43__UIKeyboardLayoutStar_fadeWithInvocation___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(a1 + 40), "start");
}

- (id)currentKeyplane
{
  return self->_keyplane;
}

- (id)currentKeyplaneView
{
  return self->_keyplaneView;
}

- (void)updateGlobeKeyAndLayoutOriginBeforeSnapshotForInputView:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double MinX;
  double v8;
  double v9;
  id v10;
  CGRect v11;
  CGRect v12;
  CGRect v13;

  v10 = a3;
  if (-[UIView isDescendantOfView:](self, "isDescendantOfView:"))
  {
    -[UIKeyboardLayoutStar activeKey](self, "activeKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardLayoutStar setState:forKey:](self, "setState:forKey:", 2, v4);

    objc_msgSend(v10, "size");
    v6 = v5;
    -[UIView frame](self, "frame");
    if (v6 != CGRectGetMaxY(v11))
    {
      -[UIView frame](self, "frame");
      MinX = CGRectGetMinX(v12);
      objc_msgSend(v10, "size");
      v9 = v8;
      -[UIView frame](self, "frame");
      -[UIView setFrameOrigin:](self, "setFrameOrigin:", MinX, v9 - CGRectGetMaxY(v13));
    }
  }

}

- (BOOL)keyplaneContainsDismissKey
{
  void *v2;
  BOOL v3;

  -[UIKBTree firstCachedKeyWithName:](self->_keyplane, "firstCachedKeyWithName:", CFSTR("Dismiss-Key"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)keyplaneContainsEmojiKey
{
  _BOOL4 v3;
  void *v4;

  if (-[UIKeyboardLayoutStar showsDedicatedEmojiKeyAlongsideGlobeButton](self, "showsDedicatedEmojiKeyAlongsideGlobeButton"))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    -[UIKBTree firstCachedKeyWithName:](self->_keyplane, "firstCachedKeyWithName:", CFSTR("Emoji"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v3 = !-[UIKeyboardLayoutStar shouldMergeKey:](self, "shouldMergeKey:", v4);
    else
      LOBYTE(v3) = 0;

  }
  return v3;
}

- (BOOL)is10KeyRendering
{
  return (-[UIKBTree visualStyling](self->_keyplane, "visualStyling") & 0xFF0000) == 0x10000
      || (-[UIKBTree visualStyling](self->_keyplane, "visualStyling") & 0xFF0000) == 0x210000
      || (-[UIKBTree visualStyling](self->_keyplane, "visualStyling") & 0xFF0000) == 2228224;
}

- (void)triggerSpaceKeyplaneSwitchIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (!self->_isContinuousPathUnderway)
  {
    -[UIKeyboardLayoutStar currentKeyplane](self, "currentKeyplane");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstCachedKeyWithName:", CFSTR("Space-Key"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((-[UIKeyboardLayoutStar upActionFlagsForKey:](self, "upActionFlagsForKey:", v3) & 0x100) != 0
      && (objc_msgSend(v6, "supportsType:", -[UITextInputTraits keyboardType](self->super._inputTraits, "keyboardType")) & 1) == 0)
    {
      objc_msgSend(v6, "alternateKeyplaneName");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardLayoutStar setKeyplaneName:](self, "setKeyplaneName:", v4);

      -[UIKeyboardLayoutStar keyplane](self, "keyplane");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardLayoutStar setShift:](self, "setShift:", objc_msgSend(v5, "isShiftKeyplane"));

    }
  }
}

- (void)typingStyleEstimator:(id)a3 didChangeTypingStyleEstimate:(unint64_t)a4
{
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (-[UIKeyboardLayoutStar _allowPaddle](self, "_allowPaddle", a3))
  {
    -[UIKeyboardLayoutStar keyplaneFactory](self, "keyplaneFactory");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (a4 != 3) == objc_msgSend(v10, "allowsPaddles");
    v7 = v10;
    if (!v6)
    {
      objc_msgSend(v10, "setAllowsPaddles:", a4 != 3);
      -[UIKeyboardLayoutStar activeKey](self, "activeKey");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardLayoutStar touchInfoForKey:](self, "touchInfoForKey:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v9, "delayed") || objc_msgSend(v8, "interactionType") != 4)
        -[UIKBKeyplaneView purgeActiveKeyViews](self->_keyplaneView, "purgeActiveKeyViews");

      v7 = v10;
    }

  }
}

- (UIKBTree)keyboard
{
  return self->_keyboard;
}

- (UIKBTree)keyplane
{
  return self->_keyplane;
}

- (NSString)keyboardName
{
  return self->_keyboardName;
}

- (void)setKeyboardName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 656);
}

- (UIKBTree)activeKey
{
  return self->_activeKey;
}

- (BOOL)shift
{
  return self->_shift;
}

- (BOOL)autoShift
{
  return self->_autoshift;
}

- (void)setAutoShift:(BOOL)a3
{
  self->_autoshift = a3;
}

- (BOOL)didLongPress
{
  return self->_didLongPress;
}

- (void)setDidLongPress:(BOOL)a3
{
  self->_didLongPress = a3;
}

- (NSString)localizedInputKey
{
  return self->_localizedInputKey;
}

- (int)playKeyClickSoundOn
{
  return self->playKeyClickSoundOn;
}

- (void)setPlayKeyClickSoundOn:(int)a3
{
  self->playKeyClickSoundOn = a3;
}

- (NSString)preTouchKeyplaneName
{
  return self->_preTouchKeyplaneName;
}

- (UIView)modalDisplayView
{
  return self->_modalDisplayView;
}

- (void)setModalDisplayView:(id)a3
{
  objc_storeStrong((id *)&self->_modalDisplayView, a3);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (double)lastTwoFingerTapTimestamp
{
  return self->_lastTwoFingerTapTimestamp;
}

- (void)setLastTwoFingerTapTimestamp:(double)a3
{
  self->_lastTwoFingerTapTimestamp = a3;
}

- (BOOL)preventPaddlesForPointerTouches
{
  return self->_preventPaddlesForPointerTouches;
}

- (void)setPreventPaddlesForPointerTouches:(BOOL)a3
{
  self->_preventPaddlesForPointerTouches = a3;
}

- (BOOL)muteNextKeyClickSound
{
  return self->_muteNextKeyClickSound;
}

- (void)setMuteNextKeyClickSound:(BOOL)a3
{
  self->_muteNextKeyClickSound = a3;
}

- (UITextCursorAssertion)blinkAssertion
{
  return self->_blinkAssertion;
}

- (void)setBlinkAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_blinkAssertion, a3);
}

- (UIKeyboardKeyplaneTransitionDelegate)splitKeyplaneTransitionDelegate
{
  return (UIKeyboardKeyplaneTransitionDelegate *)objc_loadWeakRetained((id *)&self->_splitKeyplaneTransitionDelegate);
}

- (void)setSplitKeyplaneTransitionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_splitKeyplaneTransitionDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_splitKeyplaneTransitionDelegate);
  objc_storeStrong((id *)&self->_blinkAssertion, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_slideBehaviour, 0);
  objc_storeStrong((id *)&self->_modalDisplayView, 0);
  objc_storeStrong((id *)&self->_renderConfig, 0);
  objc_storeStrong((id *)&self->_liveKeyplaneConstraints, 0);
  objc_storeStrong((id *)&self->_liveKeyplaneView, 0);
  objc_storeStrong((id *)&self->_dictationReplacementKeycap, 0);
  objc_storeStrong((id *)&self->_keyplaneTransformationAreaView, 0);
  objc_storeStrong((id *)&self->_pathEffectViewConstraints, 0);
  objc_storeStrong((id *)&self->_pathEffectView, 0);
  objc_storeStrong((id *)&self->_pathEffectGlowView, 0);
  objc_storeStrong((id *)&self->_keyplaneTransformations, 0);
  objc_storeStrong((id *)&self->_biasEscapeButtonRightConstraint, 0);
  objc_storeStrong((id *)&self->_biasEscapeButtonLeftConstraint, 0);
  objc_storeStrong((id *)&self->_biasEscapeButton, 0);
  objc_storeStrong((id *)&self->_resizingKeyplaneCoordinator, 0);
  objc_storeStrong((id *)&self->_extendedTouchInfoMap, 0);
  objc_storeStrong((id *)&self->_gestureKeyboardIntroduction, 0);
  objc_storeStrong((id *)&self->_lastInputMode, 0);
  objc_storeStrong((id *)&self->_progressiveCandidateUpdateTimer, 0);
  objc_storeStrong((id *)&self->_prevProgressiveCandidateRequestTime, 0);
  objc_storeStrong((id *)&self->_prevTouchMoreKeyTime, 0);
  objc_storeStrong((id *)&self->_homeRowHint, 0);
  objc_storeStrong((id *)&self->_rightSideReachability, 0);
  objc_storeStrong((id *)&self->_leftSideReachability, 0);
  objc_storeStrong((id *)&self->_rightKeySet, 0);
  objc_storeStrong((id *)&self->_leftKeySet, 0);
  objc_storeStrong((id *)&self->_passcodeRenderConfig, 0);
  objc_storeStrong((id *)&self->_typingSpeedLogger, 0);
  objc_storeStrong((id *)&self->_keysUnderIndicator, 0);
  objc_storeStrong((id *)&self->_dismissModalDoubleConsonantKeys, 0);
  objc_storeStrong((id *)&self->_dimKeyboardImageView, 0);
  objc_storeStrong(&self->_touchInfo, 0);
  objc_storeStrong((id *)&self->_flickPopuptimer, 0);
  objc_storeStrong((id *)&self->_compositeImages, 0);
  objc_storeStrong((id *)&self->_flickPopupView, 0);
  objc_storeStrong((id *)&self->_multitapKey, 0);
  objc_storeStrong((id *)&self->_multitapAction, 0);
  objc_storeStrong((id *)&self->_preRotateKeyplaneName, 0);
  objc_storeStrong((id *)&self->_layoutTag, 0);
  objc_storeStrong((id *)&self->_delayedCentroidUpdate, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_transitionView, 0);
  objc_storeStrong((id *)&self->_pinchGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_upSwipeRecognizer, 0);
  objc_storeStrong((id *)&self->_leftSwipeRecognizer, 0);
  objc_storeStrong((id *)&self->_rightSwipeRecognizer, 0);
  objc_storeStrong((id *)&self->_preTouchKeyplaneName, 0);
  objc_storeStrong(&self->_deleteTarget, 0);
  objc_storeStrong(&self->_returnTarget, 0);
  objc_storeStrong(&self->_spaceTarget, 0);
  objc_storeStrong((id *)&self->_hasAccents, 0);
  objc_storeStrong((id *)&self->_accentInfo, 0);
  objc_storeStrong((id *)&self->_localizedInputKey, 0);
  objc_storeStrong((id *)&self->_validInputStrings, 0);
  objc_storeStrong((id *)&self->_allKeyplaneKeycaps, 0);
  objc_storeStrong((id *)&self->_allKeyplaneViews, 0);
  objc_storeStrong((id *)&self->_keyboards, 0);
  objc_storeStrong((id *)&self->_emojiKeyManager, 0);
  objc_storeStrong((id *)&self->_keyViewAnimator, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_keyplaneView, 0);
  objc_storeStrong((id *)&self->_inactiveLanguageIndicator, 0);
  objc_storeStrong((id *)&self->_activeKey, 0);
  objc_storeStrong((id *)&self->_keyplaneName, 0);
  objc_storeStrong((id *)&self->_keyboardName, 0);
  objc_storeStrong((id *)&self->_keyplane, 0);
  objc_storeStrong((id *)&self->_keyboard, 0);
}

- (id)keyWithRepresentedString:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[UIKBTree keys](self->_keyplane, "keys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "interactionType") == 16)
        {
          objc_msgSend(v9, "fullRepresentedString");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "_containsSubstring:", v4);

          if ((v11 & 1) != 0)
            goto LABEL_12;
        }
        objc_msgSend(v9, "representedString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v4);

        if ((v13 & 1) != 0)
        {
LABEL_12:
          v6 = v9;
          goto LABEL_13;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_13:

  return v6;
}

- (CGRect)frameForKeyWithRepresentedString:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  char v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;
  CGRect result;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  -[UIView subviews](self->_keyplaneView, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v43 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        objc_msgSend(v10, "key");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "representedString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v12, "isEqualToString:", v4) & 1) != 0)
        {
          objc_msgSend(v10, "superview");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            objc_msgSend(v10, "bounds");
            -[UIView convertRect:fromView:](self, "convertRect:fromView:", v10);
            v23 = v22;
            v25 = v24;
            v27 = v26;
            v29 = v28;

            goto LABEL_22;
          }
        }
        else
        {

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    }
    while (v7);
  }

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[UIKBTree keys](self->_keyplane, "keys", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v39;
    while (2)
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v39 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * j);
        objc_msgSend(v19, "representedString");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "isEqualToString:", v4);

        if ((v21 & 1) != 0)
        {
          objc_msgSend(v19, "frame");
          v23 = v30;
          v25 = v31;
          v27 = v32;
          v29 = v33;

          goto LABEL_22;
        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
      if (v16)
        continue;
      break;
    }
  }

  v23 = *MEMORY[0x1E0C9D628];
  v25 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v27 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v29 = *(double *)(MEMORY[0x1E0C9D628] + 24);
LABEL_22:

  v34 = v23;
  v35 = v25;
  v36 = v27;
  v37 = v29;
  result.size.height = v37;
  result.size.width = v36;
  result.origin.y = v35;
  result.origin.x = v34;
  return result;
}

- (CGRect)frameForLastKeyWithRepresentedString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  char v13;
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
  double v24;
  double v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;
  CGRect result;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[UIKBTree keys](self->_keyplane, "keys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reverseObjectEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v11, "representedString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v4);

        if ((v13 & 1) != 0)
        {
          objc_msgSend(v11, "frame");
          v14 = v18;
          v15 = v19;
          v16 = v20;
          v17 = v21;

          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v8)
        continue;
      break;
    }
  }

  v14 = *MEMORY[0x1E0C9D628];
  v15 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v16 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v17 = *(double *)(MEMORY[0x1E0C9D628] + 24);
LABEL_11:

  v22 = v14;
  v23 = v15;
  v24 = v16;
  v25 = v17;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (id)popupKeyViews
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[UIView subviews](self->_keyplaneView, "subviews", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v9, "superview");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "window");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10 == v11)
        {
          objc_msgSend(v9, "window");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "_isTextEffectsWindow");

          if (v13)
            objc_msgSend(v3, "addObject:", v9);
        }
        else
        {

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)setKeyForTouchInfo:(id)a3 key:(id)a4
{
  objc_msgSend(a3, "setKey:", a4);
}

- (id)flickPopupStringForKey:(id)a3 withString:(id)a4
{
  id v6;
  int v7;
  void *v8;

  v6 = a4;
  v7 = objc_msgSend(a3, "variantType");
  v8 = v6;
  if (v7 == 8)
  {
    -[UIKeyboardLayoutStar _keyplaneVariantsKeyForString:](self, "_keyplaneVariantsKeyForString:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)flickStringForInputKey:(id)a3 direction:(int64_t)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "state");
    if ((unint64_t)(a4 + 3) > 1 || v8 == 16)
    {
      objc_msgSend(v7, "displayString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardLayoutStar flickPopupStringForKey:withString:](self, "flickPopupStringForKey:withString:", v7, v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      getFlickString(v13, a4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v7, "fullRepresentedString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "length"))
      {
        v10 = objc_msgSend(v9, "rangeOfComposedCharacterSequenceAtIndex:", self->_multitapCount % (unint64_t)objc_msgSend(v9, "length"));
        objc_msgSend(v9, "substringWithRange:", v10, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = 0;
      }
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)populateFlickPopupsForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  int v20;
  int v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;

  v4 = a3;
  if (v4)
  {
    v34 = v4;
    objc_msgSend(v4, "displayString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardLayoutStar flickPopupStringForKey:withString:](self, "flickPopupStringForKey:withString:", v34, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      UIKeyboardGetCurrentInputMode();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      TIInputModeGetNormalizedIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      UIKeyboardRomanAccentVariants((uint64_t)v6, v8, 38);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", CFSTR("Direction"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("flick"));

      if (v11)
        v12 = v9;
      else
        v12 = 0;

    }
    else
    {
      v12 = 0;
    }

    if (v12)
    {
      objc_msgSend(v12, "objectForKey:", CFSTR("Strings"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");

      if (v14)
      {
        objc_msgSend(v12, "objectForKey:", CFSTR("Strings"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKey:", CFSTR("Keycaps"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKey:", CFSTR("Direction"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v15, "count");
        if (v18 <= objc_msgSend(v16, "count"))
          v19 = v15;
        else
          v19 = v16;
        v20 = objc_msgSend(v19, "count");
        if (v15 && v16 && v17)
        {
          v21 = v20;
          v32 = v17;
          v33 = v12;
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21 >= 1)
          {
            v23 = 0;
            v24 = v21;
            do
            {
              objc_msgSend(v16, "objectAtIndex:", v23);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v25, "length"))
              {
                v26 = (void *)objc_msgSend(v34, "copy");
                objc_msgSend(v26, "setState:", 2);
                objc_msgSend(v15, "objectAtIndex:", v23);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "setRepresentedString:", v27);

                objc_msgSend(v26, "setDisplayString:", v25);
                objc_msgSend(v26, "setDisplayType:", 0);
                v28 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend(v34, "name");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "representedString");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "stringWithFormat:", CFSTR("%@/%@"), v29, v30);
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "setName:", v31);

                objc_msgSend(v26, "setOverrideDisplayString:", 0);
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
              }
              objc_msgSend(v22, "addObject:", v26);

              ++v23;
            }
            while (v24 != v23);
          }
          objc_msgSend(v34, "setSubtrees:", v22);

          v17 = v32;
          v12 = v33;
        }

      }
    }

    v4 = v34;
  }

}

- (BOOL)handleFlick:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSTimer *flickPopuptimer;
  NSTimer *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  char v30;
  TUIKeyplaneView *liveKeyplaneView;
  uint64_t v32;
  UIView *flickPopupView;
  UIView *v34;

  v4 = a3;
  objc_msgSend(v4, "touch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(self->_touchInfo, "touch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6 && -[UIKBScreenTraits idiom](self->super._screenTraits, "idiom") != 3)
  {
    objc_msgSend(v4, "key");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "displayString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "initialPoint");
    v12 = v11;
    v14 = v13;
    objc_msgSend(v4, "touch");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "locationInView:", self);
    v17 = v16;
    v19 = v18;

    v20 = UIKBGetFlickDirection(v12, v14, v17, v19);
    if (v20 == -3)
    {
      self->_isOutOfBounds = 0;
      if (objc_msgSend(v9, "state") == 16)
      {
        -[UIKeyboardLayoutStar flickPopupStringForKey:withString:](self, "flickPopupStringForKey:withString:", v9, v10);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        getFlickPopupInfoArray(v21, CFSTR("Keycaps"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        -[UIKeyboardLayoutStar showPopupView:withKey:popupInfo:force:](self, "showPopupView:withKey:popupInfo:force:", -1, v9, v22, 0);
      }
      else
      {
        if (objc_msgSend(v9, "state") != 20)
          goto LABEL_35;
        v32 = objc_msgSend(v9, "flickDirection") >= 0 ? -1 : -3;
        objc_msgSend(v9, "setFlickDirection:", v32);
        -[UIKeyboardLayoutStar setState:forKey:](self, "setState:forKey:", 8, v9);
        flickPopupView = self->_flickPopupView;
        if (!flickPopupView)
          goto LABEL_35;
        -[UIView removeFromSuperview](flickPopupView, "removeFromSuperview");
        v22 = self->_flickPopupView;
        self->_flickPopupView = 0;
      }
LABEL_34:

LABEL_35:
      v7 = 1;
      goto LABEL_4;
    }
    v23 = v20;
    flickPopuptimer = self->_flickPopuptimer;
    if (flickPopuptimer)
    {
      -[NSTimer invalidate](flickPopuptimer, "invalidate");
      v25 = self->_flickPopuptimer;
      self->_flickPopuptimer = 0;

    }
    -[UIKeyboardLayoutStar flickPopupStringForKey:withString:](self, "flickPopupStringForKey:withString:", v9, v10);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    getFlickString(v26, v23);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "state") == 16)
    {
      -[UIKeyboardLayoutStar flickPopupStringForKey:withString:](self, "flickPopupStringForKey:withString:", v9, v10);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      getFlickPopupInfoArray(v27, CFSTR("Keycaps"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      self->_isOutOfBounds = isFlickOutOfBounds(v12, v14, v17, v19);
      if (-[UIKeyboardLayoutStar useCrescendoLayout](self, "useCrescendoLayout") && self->_liveKeyplaneView)
      {
        v29 = objc_msgSend(v9, "selectedVariantIndex");
        v30 = objc_opt_respondsToSelector();
        liveKeyplaneView = self->_liveKeyplaneView;
        if ((v30 & 1) != 0)
          -[TUIKeyplaneView changingSelectedVariantForKey:atPoint:isDragging:](liveKeyplaneView, "changingSelectedVariantForKey:atPoint:isDragging:", v9, 1, v17, v19);
        else
          -[TUIKeyplaneView changingSelectedVariantForKey:atPoint:](liveKeyplaneView, "changingSelectedVariantForKey:atPoint:", v9, v17, v19);
        if (objc_msgSend(v9, "selectedVariantIndex") != v29)
          self->_selectedVariantIndexChanged = 1;
      }
      if (!v22 || !objc_msgSend(v22, "length"))
        v23 = -1;
      -[UIKeyboardLayoutStar showPopupView:withKey:popupInfo:force:](self, "showPopupView:withKey:popupInfo:force:", v23, v9, v28, 0);
    }
    else if (v22 && objc_msgSend(v22, "length"))
    {
      objc_msgSend(v4, "key");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardLayoutStar showFlickView:withKey:flickString:](self, "showFlickView:withKey:flickString:", v23, v28, v22);
    }
    else
    {
      objc_msgSend(v9, "setFlickDirection:", -3);
      -[UIKeyboardLayoutStar setState:forKey:](self, "setState:forKey:", 2, v9);
      v34 = self->_flickPopupView;
      if (!v34)
        goto LABEL_34;
      -[UIView removeFromSuperview](v34, "removeFromSuperview");
      v28 = self->_flickPopupView;
      self->_flickPopupView = 0;
    }

    goto LABEL_34;
  }
  v7 = 0;
LABEL_4:

  return v7;
}

- (void)showFlickView:(int64_t)a3 withKey:(id)a4 flickString:(id)a5
{
  id v7;

  v7 = a4;
  if (objc_msgSend(v7, "flickDirection") != a3)
  {
    -[UIKeyboardLayoutStar populateFlickPopupsForKey:](self, "populateFlickPopupsForKey:", v7);
    objc_msgSend(v7, "setFlickDirection:", a3);
    -[UIKeyboardLayoutStar setState:forKey:](self, "setState:forKey:", 20, v7);
  }

}

- (void)handlePopupView:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  UIKeyboardLayoutStar *v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[UIKeyboardLayout taskQueue](self, "taskQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __75__UIKeyboardLayoutStar_UIKeyboardLayoutJapanese50OnFlick__handlePopupView___block_invoke;
  v7[3] = &unk_1E16D41C0;
  v6 = v4;
  v8 = v6;
  v9 = self;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v5, "addTask:", v7);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __75__UIKeyboardLayoutStar_UIKeyboardLayoutJapanese50OnFlick__handlePopupView___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1120))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v5 = WeakRetained;
    if (WeakRetained)
      objc_msgSend(WeakRetained, "handlePopupView");

    v3 = v6;
  }
  objc_msgSend(v3, "returnExecutionToParent");

}

- (void)handlePopupView
{
  NSTimer *flickPopuptimer;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[NSTimer invalidate](self->_flickPopuptimer, "invalidate");
  flickPopuptimer = self->_flickPopuptimer;
  self->_flickPopuptimer = 0;

  objc_msgSend(self->_touchInfo, "key");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardLayoutStar flickPopupStringForKey:withString:](self, "flickPopupStringForKey:withString:", v7, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  getFlickPopupInfoArray(v5, CFSTR("Keycaps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    -[UIKeyboardLayoutStar showPopupView:withKey:popupInfo:force:](self, "showPopupView:withKey:popupInfo:force:", -1, v7, v6, 1);

}

uint64_t __94__UIKeyboardLayoutStar_UIKeyboardLayoutJapanese50OnFlick__setKeyboardDim_amount_withDuration___block_invoke(uint64_t a1)
{
  double v1;

  if (*(_BYTE *)(a1 + 48))
    v1 = *(double *)(a1 + 40);
  else
    v1 = 0.0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1136), "setAlpha:", v1);
}

uint64_t __94__UIKeyboardLayoutStar_UIKeyboardLayoutJapanese50OnFlick__setKeyboardDim_amount_withDuration___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1136), "setHidden:", *(_BYTE *)(a1 + 40) == 0);
}

- (void)setDisableInteraction:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardLayoutStar;
  -[UIKeyboardLayout setDisableInteraction:](&v5, sel_setDisableInteraction_);
  -[UIKeyboardLayoutStar setKeyboardDim:](self, "setKeyboardDim:", v3);
}

- (void)setPreferredHeight:(double)a3
{
  _BOOL4 v5;
  double v6;
  double v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  NSString *keyplaneName;
  NSString *v15;
  objc_super v16;

  v5 = -[UIKeyboardLayout hasPreferredHeight](self, "hasPreferredHeight");
  -[UIKeyboardLayout preferredHeight](self, "preferredHeight");
  v7 = v6;
  v16.receiver = self;
  v16.super_class = (Class)UIKeyboardLayoutStar;
  -[UIKeyboardLayout setPreferredHeight:](&v16, sel_setPreferredHeight_, a3);
  -[UIView window](self, "window");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[UIKeyboardLayoutStar keyplane](self, "keyplane");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardLayoutStar currentKeyplaneView](self, "currentKeyplaneView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "keyplane");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 == v12)
    {
      if (v5 != -[UIKeyboardLayout hasPreferredHeight](self, "hasPreferredHeight")
        || v5 && (-[UIKeyboardLayout preferredHeight](self, "preferredHeight"), v7 != v13))
      {
        keyplaneName = self->_keyplaneName;
        self->_keyplaneName = 0;
        v15 = keyplaneName;

        -[UIKeyboardLayoutStar setKeyplaneName:](self, "setKeyplaneName:", v15);
      }
    }
  }
}

- (void)showPopupView:(int64_t)a3 withKey:(id)a4 popupInfo:(id)a5 force:(BOOL)a6
{
  id v10;
  void *v11;
  UISelectionFeedbackGenerator *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a4;
  v10 = a5;
  if (self->_isOutOfBounds)
    a3 = -2;
  if (a6 || objc_msgSend(v15, "flickDirection") != a3)
  {
    -[UIKeyboardLayoutStar slideBehaviour](self, "slideBehaviour");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v12 = objc_alloc_init(UISelectionFeedbackGenerator);
      -[UIKeyboardLayoutStar setSlideBehaviour:](self, "setSlideBehaviour:", v12);

      -[UIKeyboardLayoutStar slideBehaviour](self, "slideBehaviour");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "userInteractionStarted");

    }
    -[UIKeyboardLayoutStar slideBehaviour](self, "slideBehaviour");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "selectionChanged");

    -[UIKeyboardLayoutStar populateFlickPopupsForKey:](self, "populateFlickPopupsForKey:", v15);
    objc_msgSend(v15, "setFlickDirection:", a3);
    -[UIKeyboardLayoutStar setKeyboardDim:](self, "setKeyboardDim:", 1);
    -[UIKeyboardLayoutStar setState:forKey:](self, "setState:forKey:", 16, v15);
  }

}

- (id)keyplaneView:(id)a3 containingViewForActiveKey:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  -[UIKeyboardLayoutStar delegate](self, "delegate");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8
    && (v9 = (void *)v8,
        -[UIKeyboardLayoutStar delegate](self, "delegate"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_opt_respondsToSelector(),
        v10,
        v9,
        (v11 & 1) != 0))
  {
    -[UIKeyboardLayoutStar delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "keyboardLayout:containingViewForActiveKey:inKeyplaneView:", self, v7, v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)_continuousPathSpotlightEffectEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0DBDCA8], "sharedPreferencesController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForPreferenceKey:", *MEMORY[0x1E0DBE208]);

  return v3;
}

- (UIKeyboardPathEffectView)pathEffectView
{
  void *v3;
  void *v4;
  UIKeyboardPathEffectView *v5;
  UIKeyboardPathEffectView *pathEffectView;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSArray *v37;
  NSArray *pathEffectViewConstraints;
  void *v39;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[9];

  v44[8] = *MEMORY[0x1E0C80C00];
  if (!self->_pathEffectView)
  {
    -[UIView _rootInputWindowController](self, "_rootInputWindowController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[UIView _rootInputWindowController](self, "_rootInputWindowController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_pathEffectView");
      v5 = (UIKeyboardPathEffectView *)objc_claimAutoreleasedReturnValue();
      pathEffectView = self->_pathEffectView;
      self->_pathEffectView = v5;

      -[UIKeyboardLayoutStar removePathEffectViewConstraintsIfNeeded](self, "removePathEffectViewConstraintsIfNeeded");
      -[UIView topAnchor](self->_pathEffectView, "topAnchor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView topAnchor](self, "topAnchor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "constraintEqualToAnchor:constant:", v8, -100.0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIView leftAnchor](self->_pathEffectView, "leftAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView leftAnchor](self, "leftAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, -100.0);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIView bottomAnchor](self->_pathEffectView, "bottomAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView bottomAnchor](self, "bottomAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "constraintEqualToAnchor:constant:", v13, 100.0);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIView rightAnchor](self->_pathEffectView, "rightAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView rightAnchor](self, "rightAnchor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, 100.0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = v9;
      LODWORD(v18) = 1132068864;
      objc_msgSend(v9, "setPriority:", v18);
      LODWORD(v19) = 1132068864;
      objc_msgSend(v43, "setPriority:", v19);
      LODWORD(v20) = 1132068864;
      objc_msgSend(v42, "setPriority:", v20);
      LODWORD(v21) = 1132068864;
      objc_msgSend(v16, "setPriority:", v21);
      -[UIView topAnchor](self->_pathEffectView, "topAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView window](self, "window");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "topAnchor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "constraintGreaterThanOrEqualToAnchor:", v24);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIView leftAnchor](self->_pathEffectView, "leftAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView window](self, "window");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "leftAnchor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "constraintGreaterThanOrEqualToAnchor:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIView bottomAnchor](self->_pathEffectView, "bottomAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView window](self, "window");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "bottomAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "constraintLessThanOrEqualToAnchor:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIView rightAnchor](self->_pathEffectView, "rightAnchor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView window](self, "window");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "rightAnchor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "constraintLessThanOrEqualToAnchor:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      v44[0] = v17;
      v44[1] = v43;
      v44[2] = v42;
      v44[3] = v16;
      v44[4] = v41;
      v44[5] = v28;
      v44[6] = v32;
      v44[7] = v36;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 8);
      v37 = (NSArray *)objc_claimAutoreleasedReturnValue();
      pathEffectViewConstraints = self->_pathEffectViewConstraints;
      self->_pathEffectViewConstraints = v37;

      objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", self->_pathEffectViewConstraints);
      -[UIView window](self, "window");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "layoutIfNeeded");

    }
  }
  return self->_pathEffectView;
}

- (void)setPathEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_pathEffectView, a3);
}

- (void)_transitionToContinuousPathState:(int64_t)a3 forTouchInfo:(id)a4
{
  _BOOL4 v6;
  void *v7;
  UIKeyboardLayoutStar *v8;
  uint64_t v9;
  id v10;

  v10 = a4;
  v6 = -[UIKeyboardLayoutStar _allowContinuousPathUI](self, "_allowContinuousPathUI");
  v7 = v10;
  if (!v6)
    goto LABEL_10;
  objc_msgSend(v10, "setContinuousPathState:", a3);
  if (a3 == 6)
  {
    v8 = self;
    v9 = 1;
LABEL_8:
    -[UIKeyboardLayoutStar finishContinuousPathView:](v8, "finishContinuousPathView:", v9);
    goto LABEL_9;
  }
  if (a3 == 5)
  {
    v8 = self;
    v9 = 0;
    goto LABEL_8;
  }
  v7 = v10;
  if (a3 == 4)
  {
    -[UIKeyboardLayoutStar didBeginContinuousPath](self, "didBeginContinuousPath");
LABEL_9:
    v7 = v10;
  }
LABEL_10:

}

- (void)didBeginContinuousPath
{
  TUIKeyplaneView *liveKeyplaneView;
  void *v4;
  _BOOL4 shift;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  UIImageView *v11;
  UIImageView *pathEffectGlowView;
  void *v13;
  uint64_t v14;
  UIImageView *v15;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[5];

  liveKeyplaneView = self->_liveKeyplaneView;
  if (liveKeyplaneView)
    -[TUIKeyplaneView deactivateKeys](liveKeyplaneView, "deactivateKeys");
  if (-[UIKeyboardLayoutStar supportsSupplementalDisplayString](self, "supportsSupplementalDisplayString"))
  {
    -[UIKBTree name](self->_keyboard, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "containsString:", CFSTR("Thai")))
    {
      shift = self->_shift;

      if (shift)
      {
        +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setShift:", 0);

        -[UIKeyboardLayoutStar setShift:](self, "setShift:", 0);
      }
    }
    else
    {

    }
    -[UIKeyboardLayoutStar cancelModalDoubleConsonantKeysTimer](self, "cancelModalDoubleConsonantKeysTimer");
  }
  -[UIKBKeyplaneView activeKeyViews](self->_keyplaneView, "activeKeyViews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    -[UIKBKeyplaneView deactivateKeys](self->_keyplaneView, "deactivateKeys");
  -[UIKeyboardLayout typingStyleEstimator](self, "typingStyleEstimator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "beganContinuousPath");

  v9 = -[UIKeyboardLayoutStar pathEffectView](self, "pathEffectView");
  self->_isContinuousPathUnderway = 1;
  -[UIKeyboardLayoutStar transitionToPunctuationKeysVisible:](self, "transitionToPunctuationKeysVisible:", 1);
  if (self->_pathEffectGlowView)
    goto LABEL_15;
  if (-[UIKeyboardLayoutStar _continuousPathSpotlightEffectEnabled](self, "_continuousPathSpotlightEffectEnabled"))
  {
    +[UIImage kitImageNamed:](UIImage, "kitImageNamed:", CFSTR("UIKeyboardContinuousPathEffectGlow.png"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[UIImageView initWithImage:]([UIImageView alloc], "initWithImage:", v10);
    pathEffectGlowView = self->_pathEffectGlowView;
    self->_pathEffectGlowView = v11;

    -[UIView setUserInteractionEnabled:](self->_pathEffectGlowView, "setUserInteractionEnabled:", 0);
  }
  if (self->_pathEffectGlowView)
  {
LABEL_15:
    -[UIKBKeyplaneView keyplaneMaskView](self->_keyplaneView, "keyplaneMaskView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", self->_pathEffectGlowView);

  }
  v14 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __62__UIKeyboardLayoutStar_ContinuousPath__didBeginContinuousPath__block_invoke;
  v18[3] = &unk_1E16B1B28;
  v18[4] = self;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 50331648, v18, 0, 0.2, 0.0);
  v15 = self->_pathEffectGlowView;
  if (v15)
  {
    -[UIView setAlpha:](v15, "setAlpha:", 0.0);
    v17[0] = v14;
    v17[1] = 3221225472;
    v17[2] = __62__UIKeyboardLayoutStar_ContinuousPath__didBeginContinuousPath__block_invoke_2;
    v17[3] = &unk_1E16B1B28;
    v17[4] = self;
    v16 = _Block_copy(v17);
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 50331648, v16, 0, 0.45, 0.0);

  }
}

void __62__UIKeyboardLayoutStar_ContinuousPath__didBeginContinuousPath__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  double v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "renderConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "lightKeyboard");

  objc_msgSend(*(id *)(a1 + 32), "pathEffectView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v5 = 0.4;
  if (!v3)
    v5 = 0.5;
  objc_msgSend(v4, "setAlpha:", v5);

}

uint64_t __62__UIKeyboardLayoutStar_ContinuousPath__didBeginContinuousPath__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_continuousPathSpotlightEffectEnabled");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1392), "setAlpha:", 1.0);
  return result;
}

- (void)addContinuousPathPoint:(CGPoint)a3 withTimestamp:(double)a4
{
  double y;
  double x;
  void *v7;
  void *v8;
  _QWORD v9[7];
  int64x2_t v10;

  y = a3.y;
  x = a3.x;
  if (self->_pathEffectGlowView)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __77__UIKeyboardLayoutStar_ContinuousPath__addContinuousPathPoint_withTimestamp___block_invoke;
    v9[3] = &unk_1E16B20D8;
    v9[4] = self;
    *(double *)&v9[5] = a3.x + -150.0;
    *(double *)&v9[6] = a3.y + -150.0;
    v10 = vdupq_n_s64(0x4072C00000000000uLL);
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v9, 0.1);
  }
  -[UIKeyboardLayoutStar pathEffectView](self, "pathEffectView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardLayoutStar pathEffectView](self, "pathEffectView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView convertPoint:toView:](self, "convertPoint:toView:", v8, x, y);
  objc_msgSend(v7, "addPoint:force:timestamp:");

}

uint64_t __77__UIKeyboardLayoutStar_ContinuousPath__addContinuousPathPoint_withTimestamp___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1392), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)clearContinuousPathView
{
  void *v3;
  _QWORD v4[5];

  self->_isContinuousPathUnderway = 0;
  -[UIKeyboardLayoutStar transitionToPunctuationKeysVisible:](self, "transitionToPunctuationKeysVisible:", 0);
  -[UIKeyboardLayoutStar pathEffectView](self, "pathEffectView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "buildOut");

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__UIKeyboardLayoutStar_ContinuousPath__clearContinuousPathView__block_invoke;
  v4[3] = &unk_1E16B1B28;
  v4[4] = self;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v4, 0.2);
}

void __63__UIKeyboardLayoutStar_ContinuousPath__clearContinuousPathView__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "pathEffectView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

- (void)finishContinuousPathView:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[3];
  _QWORD v17[4];

  v3 = a3;
  v17[3] = *MEMORY[0x1E0C80C00];
  -[UIKeyboardLayout typingStyleEstimator](self, "typingStyleEstimator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
    objc_msgSend(v5, "cancelContinuousPath");
  else
    objc_msgSend(v5, "endedContinuousPath");

  if (self->_isContinuousPathUnderway)
  {
    self->_isContinuousPathUnderway = 0;
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateChangeTimeAndIncrementCount");

    -[UIKeyboardLayoutStar touchModalDoubleConsonantKeysTimer](self, "touchModalDoubleConsonantKeysTimer");
    -[UIKeyboardLayoutStar pathEffectView](self, "pathEffectView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "buildOut");

    v16[0] = &unk_1E1A985E0;
    v16[1] = &unk_1E1A985B0;
    v17[0] = &unk_1E1A95AC0;
    v17[1] = &unk_1E1A95AC0;
    v16[2] = &unk_1E1A984F0;
    v9 = (void *)MEMORY[0x1E0CB37E8];
    -[UIKeyboardLayoutStar renderConfig](self, "renderConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lightKeycapOpacity");
    objc_msgSend(v9, "numberWithDouble:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[2] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __65__UIKeyboardLayoutStar_ContinuousPath__finishContinuousPathView___block_invoke;
    v14[3] = &unk_1E16B1B50;
    v14[4] = self;
    v15 = v12;
    v13 = v12;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v14, 0.3);

  }
}

uint64_t __65__UIKeyboardLayoutStar_ContinuousPath__finishContinuousPathView___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 696), "dimKeys:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1392), "setAlpha:", 0.0);
}

- (void)touchModalDoubleConsonantKeysTimer
{
  UIDelayedAction *dismissModalDoubleConsonantKeys;
  void *v4;
  void *v5;
  double v6;
  double v7;
  UIDelayedAction *v8;
  UIDelayedAction *v9;

  dismissModalDoubleConsonantKeys = self->_dismissModalDoubleConsonantKeys;
  if (!dismissModalDoubleConsonantKeys)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("UIContinuousPathGuideTimer"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v5, "doubleValue");
      if (v6 == 0.0)
      {
        -[UIKeyboardLayoutStar handleDoubleConsonantKeysTimerFired](self, "handleDoubleConsonantKeysTimerFired");
LABEL_8:

        dismissModalDoubleConsonantKeys = self->_dismissModalDoubleConsonantKeys;
        goto LABEL_9;
      }
      v7 = v6;
    }
    else
    {
      v7 = 2.0;
    }
    v8 = -[UIDelayedAction initWithTarget:action:userInfo:delay:]([UIDelayedAction alloc], "initWithTarget:action:userInfo:delay:", self, sel_handleDoubleConsonantKeysTimerFired, 0, v7);
    v9 = self->_dismissModalDoubleConsonantKeys;
    self->_dismissModalDoubleConsonantKeys = v8;

    goto LABEL_8;
  }
LABEL_9:
  -[UIDelayedAction touch](dismissModalDoubleConsonantKeys, "touch");
}

- (void)handleDoubleConsonantKeysTimerFired
{
  UIDelayedAction *v3;
  void *v4;
  UIDelayedAction *v5;
  _QWORD v6[4];
  UIDelayedAction *v7;
  UIKeyboardLayoutStar *v8;
  id v9;
  id location;

  v3 = self->_dismissModalDoubleConsonantKeys;
  objc_initWeak(&location, self);
  -[UIKeyboardLayout taskQueue](self, "taskQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __75__UIKeyboardLayoutStar_ContinuousPath__handleDoubleConsonantKeysTimerFired__block_invoke;
  v6[3] = &unk_1E16D41C0;
  v5 = v3;
  v7 = v5;
  v8 = self;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v4, "addTask:", v6);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __75__UIKeyboardLayoutStar_ContinuousPath__handleDoubleConsonantKeysTimerFired__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1152))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v5 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "transitionToPunctuationKeysVisible:", 0);
      objc_msgSend(v5, "cancelModalDoubleConsonantKeysTimer");
    }

    v3 = v6;
  }
  objc_msgSend(v3, "returnExecutionToParent");

}

@end
