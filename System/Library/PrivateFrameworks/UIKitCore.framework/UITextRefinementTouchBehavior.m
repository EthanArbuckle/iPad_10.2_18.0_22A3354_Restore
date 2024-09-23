@implementation UITextRefinementTouchBehavior

- (void)configureGestureExclusionRequirementsForTextLoupeInteraction:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  objc_msgSend(v3, "root");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recognizerForName:", 0x1E17787A0);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "_pairedGestureIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", 0x1E17788A0);

  objc_msgSend(v3, "root");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "recognizerForName:", 0x1E17787E0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "_pairedGestureIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", 0x1E17788A0);

}

- (void)adjustVariableDelaySettingsForLoupeInteraction:(id)a3
{
  id v3;
  void *v4;
  int v5;
  double v6;
  id v7;

  v3 = a3;
  objc_msgSend(v3, "_textInput");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recognizerForName:", 0x1E17788A0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setTextView:", v7);
  if (v7)
  {
    v5 = objc_msgSend(v7, "isEditing");
    v6 = 0.5;
    if (v5)
      v6 = 0.0;
  }
  else
  {
    v6 = 0.0;
  }
  objc_msgSend(v4, "setDelay:", v6);

}

- (Class)gestureRecognizerClassForLoupeInteraction:(id)a3
{
  return (Class)objc_opt_class();
}

- (void)configureLoupeGestureRecognizer:(id)a3 forTextLoupeInteraction:(id)a4
{
  id v5;
  int v6;
  double v7;
  id v8;

  v8 = a3;
  v5 = a4;
  objc_msgSend(v8, "setNumberOfTouchesRequired:", 1);
  objc_msgSend(v8, "setDelaysTouchesEnded:", 0);
  v6 = _UIInternalPreferenceUsesDefault_1(&_UIInternalPreference_TextRefinement_AllowableMovement, (uint64_t)CFSTR("TextRefinement_AllowableMovement"));
  v7 = *(double *)&qword_1ECD75E88;
  if (v6)
    v7 = 8.0;
  objc_msgSend(v8, "setAllowableMovement:", v7);
  objc_msgSend(v8, "setAllowedTouchTypes:", &unk_1E1A933B0);
  objc_msgSend(v5, "addGestureRecognizer:withName:", v8, 0x1E17788A0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_grabberHandleSuppressionAssertion, 0);
  objc_storeStrong((id *)&self->_loupeSession, 0);
  objc_storeStrong((id *)&self->_activeSelectionController, 0);
  objc_storeStrong((id *)&self->_originalTextRange, 0);
}

- (BOOL)shouldAllowEnforcedTouchTypeForTouch:(id)a3 forGestureRecognizer:(id)a4
{
  return objc_msgSend(a3, "_originatesFromPointerEvent") ^ 1;
}

- (BOOL)loupeGestureRecognizerShouldBegin:(id)a3 forTextLoupeInteraction:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "locationInView:", v7);
  v9 = v8;
  v11 = v10;

  LOBYTE(v6) = objc_msgSend(v5, "currentSelectionContainsPoint:", v9, v11);
  return v6 ^ 1;
}

- (BOOL)usesTouchAlignment
{
  return 1;
}

- (BOOL)_allowsPaintSelectionForLoupeInteraction:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "_textInput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEditable") ^ 1;

  return v4;
}

- (BOOL)triggeredByLongPressGesture:(id)a3
{
  id v3;
  char v4;
  unint64_t v6;
  NSObject *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  objc_class *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_2;
  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      goto LABEL_9;
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412290;
    v13 = v10;
    _os_log_fault_impl(&dword_185066000, v8, OS_LOG_TYPE_FAULT, "Gesture recognizer is type %@, but it should be a UIVariableDelayLoupeGesture", (uint8_t *)&v12, 0xCu);
LABEL_8:

LABEL_9:
    goto LABEL_2;
  }
  v6 = triggeredByLongPressGesture____s_category;
  if (!triggeredByLongPressGesture____s_category)
  {
    v6 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v6, (unint64_t *)&triggeredByLongPressGesture____s_category);
  }
  v7 = *(NSObject **)(v6 + 8);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8 = v7;
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412290;
    v13 = v10;
    _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "Gesture recognizer is type %@, but it should be a UIVariableDelayLoupeGesture", (uint8_t *)&v12, 0xCu);
    goto LABEL_8;
  }
LABEL_2:
  v4 = objc_msgSend(v3, "isLongPress");

  return v4;
}

- (CGPoint)startPointForLoupeGesture:(id)a3
{
  double v3;
  double v4;
  CGPoint result;

  objc_msgSend(a3, "startPoint");
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)translationInView:(id)a3 forLoupeGesture:(id)a4
{
  double v4;
  double v5;
  CGPoint result;

  objc_msgSend(a4, "_translationInView:", a3);
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGPoint)velocityInView:(id)a3 forLoupeGesture:(id)a4
{
  double v4;
  double v5;
  CGPoint result;

  objc_msgSend(a4, "velocityInView:", a3);
  result.y = v5;
  result.x = v4;
  return result;
}

- (void)textLoupeInteraction:(id)a3 gestureChangedWithState:(int64_t)a4 location:(id)a5 translation:(id)a6 velocity:(id)a7 modifierFlags:(int64_t)a8 shouldCancel:(BOOL *)a9
{
  double (**v13)(_QWORD);
  double (**v14)(_QWORD);
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  BOOL v23;
  void *v24;
  void *v25;
  UITextRange *v26;
  UITextRange *originalTextRange;
  void *v28;
  double v29;
  double v30;
  _UIKeyboardTextSelectionController *v31;
  _UIKeyboardTextSelectionController *activeSelectionController;
  double v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  uint64_t v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  int64_t v66;
  void *v67;
  char v68;
  void *v69;
  _UIInvalidatable *grabberHandleSuppressionAssertion;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  void *v82;
  int v83;
  void *v84;
  int64_t activeSelectionMode;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  UITextLoupeSession *v91;
  UITextLoupeSession *loupeSession;
  void *v93;
  uint64_t v94;
  void *v95;
  int v96;
  UITextLoupeSession *v97;
  double v98;
  double v99;
  double v100;
  double v101;
  id v102;
  _UIKeyboardTextSelectionController *v103;
  UITextRange *v104;
  void *v105;
  int v106;
  void *v107;
  int v108;
  void *v109;
  void *v110;
  double v111;
  double v112;
  double v113;
  double v114;
  CGFloat v115;
  CGFloat v116;
  CGFloat v117;
  CGFloat v118;
  void *v119;
  double v120;
  double v121;
  int v122;
  double v123;
  void *v124;
  UITextLoupeSession *v125;
  double v126;
  double v127;
  id v128;

  v128 = a3;
  v13 = (double (**)(_QWORD))a5;
  v14 = (double (**)(_QWORD))a6;
  objc_msgSend(v128, "cancelLinkInteractionSession");
  objc_msgSend(v128, "_textInput");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "assistantDelegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "activeSelectionController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "selection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = -[UITextRefinementTouchBehavior _allowsPaintSelectionForLoupeInteraction:](self, "_allowsPaintSelectionForLoupeInteraction:", v128);
  if (a4 != 2)
  {
    if (a4 == 1)
    {
      v20 = v19;
      objc_msgSend(v128, "root");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "_createFeedbackIfNecessary");

      objc_msgSend(v128, "root");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "_prepareFeedbackForGesture");

      objc_msgSend(v16, "stashCurrentSelection");
      objc_msgSend(v16, "setAutoscrolled:", 0);
      objc_msgSend(v128, "setInGesture:", 1);
      objc_msgSend(v16, "setGrabberSuppressionAssertion:", 0);
      v23 = 0;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v23 = objc_msgSend(v15, "keyboardType") == 122;
      if ((objc_msgSend(v15, "isEditing") & 1) == 0 && !v23)
      {
        +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "vendKeyboardSuppressionAssertionForReason:", CFSTR("Loupe gesture"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setKeyboardSuppressionAssertion:", v25);

      }
      objc_msgSend(v15, "selectedTextRange");
      v26 = (UITextRange *)objc_claimAutoreleasedReturnValue();
      originalTextRange = self->_originalTextRange;
      self->_originalTextRange = v26;

      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      self->_isShiftKeyBeingHeld = objc_msgSend(v28, "isShiftKeyBeingHeld");

      v29 = *MEMORY[0x1E0C9D538];
      v30 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      objc_msgSend(v16, "setLoupeGestureEndPoint:", *MEMORY[0x1E0C9D538], v30);
      objc_msgSend(v16, "setNeedsGestureUpdate:", objc_msgSend(v128, "_textInputIsInteractive") ^ 1);
      objc_msgSend(v16, "setFirstResponderIfNecessary");
      objc_msgSend(v16, "activeSelectionController");
      v31 = (_UIKeyboardTextSelectionController *)objc_claimAutoreleasedReturnValue();
      activeSelectionController = self->_activeSelectionController;
      self->_activeSelectionController = v31;

      if (objc_msgSend(v128, "_textInputIsInteractive"))
      {
        objc_msgSend(v128, "disableClearsOnInsertion");
        objc_msgSend(v16, "willBeginSelectionInteraction");
        objc_msgSend(v128, "_beginSelectionChange");
        v33 = v13[2](v13);
        v35 = v34;
        objc_msgSend(v18, "selectedRange");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "convertPointToRenderSpace:textRange:", v36, v33, v35);
        v38 = v37;
        v40 = v39;

        objc_msgSend(v128, "updateInitialPoint:", v38, v40);
        objc_msgSend(v18, "caretRect");
        v42 = v41;
        v44 = v43;
        v46 = v45;
        v48 = v47;
        v126 = v40;
        v127 = v38;
        UIDistanceBetweenPointAndRect(v38, v40, v41, v43, v45, v47);
        v50 = v49;
        if (_UIInternalPreferenceUsesDefault_1(&_UIInternalPreference_TextRefinement_NearCaretDistance, (uint64_t)CFSTR("TextRefinement_NearCaretDistance")))v51 = 40.0;
        else
          v51 = *(double *)&qword_1EDDA7DC0;
        if (objc_msgSend(v15, "isEditing") && v50 < v51)
        {
          self->_activeSelectionMode = 0;
          v53 = v126;
          v52 = v127;
          objc_msgSend(v128, "gestureTuning");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "assertInitialPositionFromTopOfCaret:distanceFromCaret:", v126 - v44, v127 - (v42 + v46 * 0.5), v126 - (v44 + v48 * 0.5));
          v55 = 0;
        }
        else
        {
          if (v20)
            self->_activeSelectionMode = 2;
          objc_msgSend(v128, "root");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v84, "_playFeedbackForCursorMovement");

          objc_msgSend(v128, "_cancelRecognizerWithName:", 0x1E17787A0);
          objc_msgSend(v128, "gestureTuning");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "assertInitialPositionFromTopOfCaret:distanceFromCaret:", 0.0, v29, v30);
          v55 = 1;
          v53 = v126;
          v52 = v127;
        }

        activeSelectionMode = self->_activeSelectionMode;
        if ((unint64_t)(activeSelectionMode - 1) >= 2)
        {
          if (!activeSelectionMode)
          {
            -[_UIKeyboardTextSelectionController selectPositionAtPoint:executionContext:](self->_activeSelectionController, "selectPositionAtPoint:executionContext:", 0, v52, v53);
            objc_msgSend(v16, "willBeginFloatingCursor:", 0);
            objc_msgSend(v16, "beginFloatingCursorAtPoint:", v52, v53);
          }
        }
        else
        {
          objc_msgSend(v128, "setStrongerBiasAgainstUp:", 1);
          -[_UIKeyboardTextSelectionController beginSelection](self->_activeSelectionController, "beginSelection");
          -[_UIKeyboardTextSelectionController selectTextWithGranularity:atPoint:executionContext:](self->_activeSelectionController, "selectTextWithGranularity:atPoint:executionContext:", v55, 0, v52, v53);
          -[_UIKeyboardTextSelectionController restartSelection](self->_activeSelectionController, "restartSelection");
        }
        objc_msgSend(v16, "_editMenuAssistant");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "hideSelectionCommands");

        objc_msgSend(v16, "resetWillHandoffLoupeMagnifier");
        if (objc_msgSend(v128, "triggeredByLongPress"))
        {
          objc_msgSend(v128, "root");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v87, "_playFeedbackForCursorMovement");

        }
        if (objc_msgSend(v16, "shouldDisplayLoupeSessionForTouchType:", 0))
        {
          objc_msgSend(v16, "_caretView");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v128, "view");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "textInputView");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          +[UITextLoupeSession _beginLoupeSessionAtPoint:fromSelectionWidgetView:inView:orientation:](UITextLoupeSession, "_beginLoupeSessionAtPoint:fromSelectionWidgetView:inView:orientation:", v88, v90, objc_msgSend(v16, "loupeOrientation"), v52, v53);
          v91 = (UITextLoupeSession *)objc_claimAutoreleasedReturnValue();
          loupeSession = self->_loupeSession;
          self->_loupeSession = v91;

          objc_msgSend(v128, "gestureTuning");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          -[UITextLoupeSession setGestureTuning:](self->_loupeSession, "setGestureTuning:", v93);

        }
      }
      else if (a9)
      {
        *a9 = 1;
      }
    }
    else if ((unint64_t)(a4 - 3) <= 1)
    {
      objc_msgSend(v128, "setInGesture:", 0);
      objc_msgSend(v128, "root");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "_cleanUpFeedbackForGesture");

      objc_msgSend(v128, "cancelDelayedLoupeActionIfNecessary");
      objc_msgSend(v16, "setKeyboardSuppressionAssertion:", 0);
      grabberHandleSuppressionAssertion = self->_grabberHandleSuppressionAssertion;
      self->_grabberHandleSuppressionAssertion = 0;

      if (objc_msgSend(v128, "_textInputIsInteractive"))
      {
        v71 = v13[2](v13);
        v73 = v72;
        v74 = v14[2](v14);
        v76 = v75;
        objc_msgSend(v128, "pointIfPlacedCarefully:", v71, v73);
        objc_msgSend(v128, "touchAlignedPointForPoint:translation:");
        v78 = v77;
        v80 = v79;
        if (_UIInternalPreferenceUsesDefault_1(&_UIInternalPreference_TextRefinement_AllowableMovement, (uint64_t)CFSTR("TextRefinement_AllowableMovement")))v81 = 8.0;
        else
          v81 = *(double *)&qword_1ECD75E88;
        if ((objc_msgSend(v16, "autoscrolled") & 1) == 0)
        {
          objc_msgSend(v16, "setLoupeGestureEndPoint:", v78, v80);
          objc_msgSend(v15, "selectedTextRange");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          v83 = objc_msgSend(v82, "isEmpty");

          if (v83)
          {
            -[_UIKeyboardTextSelectionController selectPositionAtPoint:executionContext:](self->_activeSelectionController, "selectPositionAtPoint:executionContext:", 0, v78, v80);
          }
          else if (objc_msgSend(v15, "conformsToProtocol:", &unk_1EE0CE288))
          {
            v102 = v15;
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              objc_msgSend(v102, "updateSelectionWithExtentPoint:boundary:completionHandler:", 1, &__block_literal_global_191, v78, v80);
            }
            else if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              objc_msgSend(v102, "updateSelectionWithExtentPoint:withBoundary:completionHandler:", 1, &__block_literal_global_330_0, v78, v80);
            }

          }
          else if (objc_msgSend(v15, "conformsToProtocol:", &unk_1EE0CE648))
          {
            objc_msgSend(v15, "updateSelectionWithExtentPoint:withBoundary:completionHandler:", 1, &__block_literal_global_387, v78, v80);
          }
          else if (self->_activeSelectionMode == 2)
          {
            -[_UIKeyboardTextSelectionController updateSelectionWithExtentPoint:executionContext:](self->_activeSelectionController, "updateSelectionWithExtentPoint:executionContext:", 0, v78, v80);
          }
        }
        -[_UIKeyboardTextSelectionController endSelection](self->_activeSelectionController, "endSelection");
        v103 = self->_activeSelectionController;
        self->_activeSelectionController = 0;

        objc_msgSend(v128, "_endSelectionChange");
        objc_msgSend(v16, "didEndSelectionInteraction");
        objc_msgSend(v16, "cancelAutoscroll");
        if (objc_msgSend(v16, "needsGestureUpdate")
          && (objc_msgSend(v16, "willHandoffLoupeMagnifier") & 1) == 0)
        {
          objc_msgSend(v16, "setGestureRecognizers");
        }
        v104 = self->_originalTextRange;
        objc_msgSend(v15, "selectedTextRange");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        v106 = -[UITextRange isEqual:](v104, "isEqual:", v105);

        objc_msgSend(v15, "selectedTextRange");
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        v108 = objc_msgSend(v107, "isEmpty");

        if (v108 && v74 * v74 + v76 * v76 > v81 * v81 && !self->_isShiftKeyBeingHeld)
        {
          objc_msgSend(v16, "setSelectionHighlightMode:", 0);
        }
        else if (v106)
        {
          objc_msgSend(v16, "_editMenuAssistant");
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v109, "showSelectionCommands");

        }
        if ((objc_msgSend(v15, "isEditable") & 1) == 0)
        {
          objc_msgSend(v16, "_editMenuAssistant");
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v110, "showSelectionCommands");

        }
        objc_msgSend(v16, "updateDisplayedSelection");
        objc_msgSend(v18, "caretRect");
        if (v106)
        {
          v115 = v111;
          v116 = v112;
          v117 = v113;
          v118 = v114;
          objc_msgSend(v15, "selectedTextRange");
          v119 = (void *)objc_claimAutoreleasedReturnValue();

          if (v119)
          {
            UIDistanceBetweenPointAndRect(v78, v80, v115, v116, v117, v118);
            v121 = v120;
            v122 = _UIInternalPreferenceUsesDefault_1(&_UIInternalPreference_TextRefinement_NearCaretDistance, (uint64_t)CFSTR("TextRefinement_NearCaretDistance"));
            v123 = *(double *)&qword_1EDDA7DC0;
            if (v122)
              v123 = 40.0;
            if (v121 < v123)
            {
              objc_msgSend(v16, "_editMenuAssistant");
              v124 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v124, "showSelectionCommandsAfterDelay:", 0.2);

            }
          }
        }
      }
      -[UITextLoupeSession invalidate](self->_loupeSession, "invalidate");
      v125 = self->_loupeSession;
      self->_loupeSession = 0;

      objc_msgSend(v16, "endFloatingCursor");
      objc_msgSend(v16, "clearStashedSelection");
    }
    goto LABEL_77;
  }
  if (!objc_msgSend(v128, "inGesture"))
    goto LABEL_77;
  v56 = v13[2](v13);
  v58 = v57;
  v59 = v14[2](v14);
  v61 = v60;
  objc_msgSend(v128, "touchAlignedPointForPoint:translation:", v56, v58, v59, v60);
  v63 = v62;
  v65 = v64;
  v66 = self->_activeSelectionMode;
  if (v66 == 2)
  {
    objc_msgSend(v15, "selectedTextRange");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend(v67, "isEmpty");

    if ((v68 & 1) == 0)
    {
      -[_UIKeyboardTextSelectionController updateSelectionWithExtentPoint:withBoundary:executionContext:](self->_activeSelectionController, "updateSelectionWithExtentPoint:withBoundary:executionContext:", 1, 0, v63, v65);
      goto LABEL_44;
    }
    v66 = self->_activeSelectionMode;
  }
  if (v66)
  {
    if (v66 == 1)
    {
      -[_UIKeyboardTextSelectionController selectTextWithGranularity:atPoint:executionContext:](self->_activeSelectionController, "selectTextWithGranularity:atPoint:executionContext:", 1, 0, v63, v65);
LABEL_44:
      v94 = 0;
      goto LABEL_47;
    }
  }
  else
  {
    -[_UIKeyboardTextSelectionController selectPositionAtPoint:executionContext:](self->_activeSelectionController, "selectPositionAtPoint:executionContext:", 0, v63, v65);
  }
  v94 = 1;
LABEL_47:
  objc_msgSend(v16, "startAutoscroll:", v63, v65);
  objc_msgSend(v128, "updateOrCancelDelayedLoupeActionWithPoint:translation:", v63, v65, v59, v61);
  objc_msgSend(v128, "gestureTuning");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = objc_msgSend(v95, "shouldUseLineThreshold");

  if (v96)
  {
    objc_msgSend(v16, "updateFloatingCursorAtPoint:animated:", 0, v63, v65);
    v97 = self->_loupeSession;
    objc_msgSend(v18, "caretRect");
    -[UITextLoupeSession moveToPoint:withCaretRect:trackingCaret:](v97, "moveToPoint:withCaretRect:trackingCaret:", v94, v63, v65, v98, v99, v100, v101);
  }
LABEL_77:

}

@end
