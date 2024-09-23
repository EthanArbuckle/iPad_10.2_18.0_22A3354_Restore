@implementation UITextRefinementCursorBehavior

- (Class)gestureRecognizerClassForLoupeInteraction:(id)a3
{
  return (Class)objc_opt_class();
}

- (void)configureGestureExclusionRequirementsForTextLoupeInteraction:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  objc_msgSend(v3, "recognizerForName:", 0x1E1778880);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "root");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "recognizerForName:", 0x1E17788C0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v6, "requireGestureRecognizerToFail:", v5);

}

- (void)configureLoupeGestureRecognizer:(id)a3 forTextLoupeInteraction:(id)a4
{
  id v5;
  id v6;

  v6 = a3;
  v5 = a4;
  objc_msgSend(v6, "_setHysteresis:", 8.0);
  objc_msgSend(v5, "addGestureRecognizer:withName:", v6, 0x1E1778880);

}

- (BOOL)shouldAllowEnforcedTouchTypeForTouch:(id)a3 forGestureRecognizer:(id)a4
{
  return objc_msgSend(a3, "_isPointerTouch");
}

- (BOOL)loupeGestureRecognizerShouldBegin:(id)a3 forTextLoupeInteraction:(id)a4
{
  return 1;
}

- (BOOL)usesTouchAlignment
{
  return 0;
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
  int v9;
  double (**v13)(_QWORD);
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  int v23;
  void *v24;
  int v25;
  _UIKeyboardTextSelectionController *v26;
  _UIKeyboardTextSelectionController *activeSelectionController;
  void *v28;
  id grabberHandleSuppressionAssertion;
  char v30;
  _UIKeyboardTextSelectionController *v31;
  void *v32;
  _UIKeyboardTextSelectionController *v33;
  id v34;
  _UIKeyboardTextSelectionController *v35;
  id v36;

  v9 = a8;
  v36 = a3;
  v13 = (double (**)(_QWORD))a5;
  objc_msgSend(v36, "cancelLinkInteractionSession");
  v14 = v13[2](v13);
  v16 = v15;

  objc_msgSend(v36, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "_textInput");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "assistantDelegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 == 1)
  {
    objc_msgSend(v36, "root");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "interactionWithGestureForName:", 0x1E17787C0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v36, "setInheritedGranularity:", objc_msgSend(v21, "handOffGranularity"));
  }
  if (objc_msgSend(v36, "inheritedGranularity") == -1)
    v22 = 0;
  else
    v22 = objc_msgSend(v36, "inheritedGranularity");
  v23 = objc_msgSend(v18, "_usesAsynchronousProtocol");
  if ((v9 & 0x20000) != 0)
  {
    v25 = 1;
  }
  else
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "isShiftKeyBeingHeld");

  }
  if (a4 == 1)
  {
    objc_msgSend(v36, "setInGesture:", 1);
    objc_msgSend(v19, "setNeedsGestureUpdate:", objc_msgSend(v36, "_textInputIsInteractive") ^ 1);
    objc_msgSend(v19, "setFirstResponderIfNecessary");
    objc_msgSend(v19, "activeSelectionController");
    v26 = (_UIKeyboardTextSelectionController *)objc_claimAutoreleasedReturnValue();
    activeSelectionController = self->_activeSelectionController;
    self->_activeSelectionController = v26;

    if (objc_msgSend(v36, "_textInputIsInteractive"))
    {
      objc_msgSend(v19, "obtainSelectionGrabberSuppressionAssertion");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      grabberHandleSuppressionAssertion = self->_grabberHandleSuppressionAssertion;
      self->_grabberHandleSuppressionAssertion = v28;

      objc_msgSend(v19, "willBeginSelectionInteraction");
      objc_msgSend(v36, "_cancelRecognizerWithName:", 0x1E17787A0);
      -[_UIKeyboardTextSelectionController beginSelection](self->_activeSelectionController, "beginSelection");
      if ((v25 & 1) == 0 && objc_msgSend(v36, "inheritedGranularity") == -1)
      {
        v35 = self->_activeSelectionController;
        if (v23)
          -[_UIKeyboardTextSelectionController selectTextWithGranularity:atPoint:executionContext:](v35, "selectTextWithGranularity:atPoint:executionContext:", 0, 0, v14, v16);
        else
          -[_UIKeyboardTextSelectionController selectPositionAtPoint:executionContext:](v35, "selectPositionAtPoint:executionContext:", 0, v14, v16);
      }
      else
      {
        -[_UIKeyboardTextSelectionController updateSelectionWithExtentPoint:withBoundary:executionContext:](self->_activeSelectionController, "updateSelectionWithExtentPoint:withBoundary:executionContext:", v22, 0, v14, v16);
      }
      -[_UIKeyboardTextSelectionController restartSelection](self->_activeSelectionController, "restartSelection");
    }
    else if (a9)
    {
      *a9 = 1;
    }
    objc_msgSend(v19, "_editMenuAssistant");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "hideSelectionCommands");

    objc_msgSend(v19, "resetWillHandoffLoupeMagnifier");
  }
  else if (a4 == 2)
  {
    if (v22)
      v30 = 1;
    else
      v30 = v23;
    v31 = self->_activeSelectionController;
    if ((v30 & 1) != 0)
      -[_UIKeyboardTextSelectionController updateSelectionWithExtentPoint:withBoundary:executionContext:](v31, "updateSelectionWithExtentPoint:withBoundary:executionContext:", v22, 0, v14, v16);
    else
      -[_UIKeyboardTextSelectionController updateSelectionWithExtentPoint:executionContext:](v31, "updateSelectionWithExtentPoint:executionContext:", 0, v14, v16);
    objc_msgSend(v19, "startAutoscroll:", v14, v16);
  }
  else if ((unint64_t)(a4 - 3) <= 1)
  {
    if (v25)
      -[_UIKeyboardTextSelectionController updateSelectionWithExtentPoint:executionContext:](self->_activeSelectionController, "updateSelectionWithExtentPoint:executionContext:", 0, v14, v16);
    -[_UIKeyboardTextSelectionController endSelection](self->_activeSelectionController, "endSelection");
    objc_msgSend(v19, "didEndSelectionInteraction");
    objc_msgSend(v19, "cancelAutoscroll");
    objc_msgSend(v36, "setInGesture:", 0);
    v33 = self->_activeSelectionController;
    self->_activeSelectionController = 0;

    objc_msgSend(v19, "setGrabberSuppressionAssertion:", self->_grabberHandleSuppressionAssertion);
    v34 = self->_grabberHandleSuppressionAssertion;
    self->_grabberHandleSuppressionAssertion = 0;

    objc_msgSend(v36, "setInheritedGranularity:", -1);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_grabberHandleSuppressionAssertion, 0);
  objc_storeStrong((id *)&self->_activeSelectionController, 0);
}

@end
