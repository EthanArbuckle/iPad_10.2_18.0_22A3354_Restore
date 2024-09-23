@implementation UITextRefinementAcceleratedTouchBehavior

- (Class)gestureRecognizerClassForLoupeInteraction:(id)a3
{
  return (Class)objc_opt_class();
}

- (void)configureGestureExclusionRequirementsForTextLoupeInteraction:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a3, "root");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recognizerForName:", 0x1E17787A0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "_pairedGestureIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", 0x1E17788A0);

}

- (void)configureLoupeGestureRecognizer:(id)a3 forTextLoupeInteraction:(id)a4
{
  id v5;
  id v6;

  v6 = a3;
  v5 = a4;
  objc_msgSend(v6, "setMaximumNumberOfTouches:", 1);
  objc_msgSend(v6, "setMinimumNumberOfTouches:", 1);
  objc_msgSend(v6, "setAllowedTouchTypes:", &unk_1E1A95120);
  objc_msgSend(v5, "addGestureRecognizer:withName:", v6, 0x1E17788A0);

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

- (BOOL)triggeredByLongPressGesture:(id)a3
{
  return 0;
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

  objc_msgSend(a4, "translationInView:", a3);
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
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  UITextRange *v23;
  UITextRange *originalTextRange;
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
  void *v35;
  int v36;
  char v37;
  void *v38;
  int v39;
  UITextLoupeSession *loupeSession;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  UITextLoupeSession *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  _UIKeyboardTextSelectionController *v55;
  void *v56;
  _UIKeyboardTextSelectionController *v57;
  _UIKeyboardTextSelectionController *activeSelectionController;
  double v59;
  double v60;
  double v61;
  void *v62;
  void *v63;
  id v64;

  v64 = a3;
  v13 = (double (**)(_QWORD))a5;
  v14 = (double (**)(_QWORD))a6;
  objc_msgSend(v64, "cancelLinkInteractionSession");
  objc_msgSend(v64, "_textInput");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "assistantDelegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "root");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "_allowsSelectionCommands");

  if (a4 == 2)
  {
    if (objc_msgSend(v64, "inGesture"))
    {
      v25 = v13[2](v13);
      v27 = v26;
      v28 = v14[2](v14);
      v30 = v29;
      objc_msgSend(v64, "touchAlignedPointForPoint:translation:", v25, v27, v28, v29);
      v32 = v31;
      v34 = v33;
      objc_msgSend(v15, "selectedTextRange");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "isEmpty");

      if (!v36)
        -[_UIKeyboardTextSelectionController updateSelectionWithExtentPoint:withBoundary:executionContext:](self->_activeSelectionController, "updateSelectionWithExtentPoint:withBoundary:executionContext:", 1, 0, v32, v34);
      objc_msgSend(v16, "startAutoscroll:", v32, v34);
      objc_msgSend(v64, "updateOrCancelDelayedLoupeActionWithPoint:translation:", v32, v34, v28, v30);
      v37 = objc_msgSend(v64, "translationIsWithinAllowableMovement:", v28, v30);
      objc_msgSend(v64, "gestureTuning");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "shouldUseLineThreshold");

      if (v39 && (v37 & 1) == 0)
      {
        objc_msgSend(v16, "updateFloatingCursorAtPoint:animated:", 1, v32, v34);
        loupeSession = self->_loupeSession;
        objc_msgSend(v16, "activeSelection");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "caretRect");
        -[UITextLoupeSession moveToPoint:withCaretRect:trackingCaret:](loupeSession, "moveToPoint:withCaretRect:trackingCaret:", 1, v25, v27, v42, v43, v44, v45);

      }
    }
  }
  else if (a4 == 1)
  {
    objc_msgSend(v64, "root");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_createFeedbackIfNecessary");

    objc_msgSend(v64, "root");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_prepareFeedbackForGesture");

    objc_msgSend(v16, "stashCurrentSelection");
    objc_msgSend(v16, "setAutoscrolled:", 0);
    objc_msgSend(v64, "setInGesture:", 1);
    objc_msgSend(v16, "setGrabberSuppressionAssertion:", 0);
    +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "vendKeyboardSuppressionAssertionForReason:", CFSTR("Loupe gesture"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setKeyboardSuppressionAssertion:", v22);

    objc_msgSend(v15, "selectedTextRange");
    v23 = (UITextRange *)objc_claimAutoreleasedReturnValue();
    originalTextRange = self->_originalTextRange;
    self->_originalTextRange = v23;

    objc_msgSend(v16, "setLoupeGestureEndPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
    if (v18)
    {
      objc_msgSend(v16, "setNeedsGestureUpdate:", objc_msgSend(v64, "_textInputIsInteractive") ^ 1);
      objc_msgSend(v16, "setFirstResponderIfNecessary");
    }
    else
    {
      objc_msgSend(v16, "setNeedsGestureUpdate:", 1);
    }
    objc_msgSend(v16, "activeSelectionController");
    v57 = (_UIKeyboardTextSelectionController *)objc_claimAutoreleasedReturnValue();
    activeSelectionController = self->_activeSelectionController;
    self->_activeSelectionController = v57;

    if (v18 && !objc_msgSend(v64, "_textInputIsInteractive"))
    {
      if (a9)
        *a9 = 1;
    }
    else
    {
      objc_msgSend(v64, "disableClearsOnInsertion");
      objc_msgSend(v16, "willBeginSelectionInteraction");
      objc_msgSend(v64, "_beginSelectionChange");
      v59 = v13[2](v13);
      v61 = v60;
      objc_msgSend(v64, "updateInitialPoint:");
      objc_msgSend(v64, "root");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "_playFeedbackForCursorMovement");

      objc_msgSend(v64, "_cancelRecognizerWithName:", 0x1E17787A0);
      objc_msgSend(v64, "setStrongerBiasAgainstUp:", 1);
      -[_UIKeyboardTextSelectionController beginSelection](self->_activeSelectionController, "beginSelection");
      -[_UIKeyboardTextSelectionController selectTextWithGranularity:atPoint:executionContext:](self->_activeSelectionController, "selectTextWithGranularity:atPoint:executionContext:", 1, 0, v59, v61);
      -[_UIKeyboardTextSelectionController restartSelection](self->_activeSelectionController, "restartSelection");
      if (v18)
      {
        objc_msgSend(v16, "_editMenuAssistant");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "hideSelectionCommands");

      }
      objc_msgSend(v16, "resetWillHandoffLoupeMagnifier");
    }
  }
  else if ((unint64_t)(a4 - 3) <= 1)
  {
    objc_msgSend(v64, "setInGesture:", 0);
    objc_msgSend(v64, "root");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "_cleanUpFeedbackForGesture");

    objc_msgSend(v64, "cancelDelayedLoupeActionIfNecessary");
    v47 = self->_loupeSession;
    self->_loupeSession = 0;

    objc_msgSend(v16, "setKeyboardSuppressionAssertion:", 0);
    if (objc_msgSend(v64, "_textInputIsInteractive"))
    {
      v48 = v13[2](v13);
      v50 = v49;
      v14[2](v14);
      objc_msgSend(v64, "pointIfPlacedCarefully:", v48, v50);
      objc_msgSend(v64, "touchAlignedPointForPoint:translation:");
      v52 = v51;
      v54 = v53;
      if ((objc_msgSend(v16, "autoscrolled") & 1) == 0)
      {
        objc_msgSend(v16, "setLoupeGestureEndPoint:", v52, v54);
        -[_UIKeyboardTextSelectionController updateSelectionWithExtentPoint:executionContext:](self->_activeSelectionController, "updateSelectionWithExtentPoint:executionContext:", 0, v52, v54);
      }
      -[_UIKeyboardTextSelectionController endSelection](self->_activeSelectionController, "endSelection");
      v55 = self->_activeSelectionController;
      self->_activeSelectionController = 0;

      objc_msgSend(v64, "_endSelectionChange");
      objc_msgSend(v16, "didEndSelectionInteraction");
      objc_msgSend(v16, "cancelAutoscroll");
      if (objc_msgSend(v16, "needsGestureUpdate")
        && (objc_msgSend(v16, "willHandoffLoupeMagnifier") & 1) == 0)
      {
        objc_msgSend(v16, "setGestureRecognizers");
      }
      if (v18)
      {
        objc_msgSend(v16, "_editMenuAssistant");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "showSelectionCommands");

      }
      objc_msgSend(v16, "setNeedsSelectionDisplayUpdate");
    }
    objc_msgSend(v16, "endFloatingCursor");
    objc_msgSend(v16, "clearStashedSelection");
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loupeSession, 0);
  objc_storeStrong((id *)&self->_activeSelectionController, 0);
  objc_storeStrong((id *)&self->_originalTextRange, 0);
}

@end
