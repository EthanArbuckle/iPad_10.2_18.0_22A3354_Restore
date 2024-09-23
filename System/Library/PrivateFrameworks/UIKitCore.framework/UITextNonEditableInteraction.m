@implementation UITextNonEditableInteraction

- (UITextNonEditableInteraction)initWithMode:(int64_t)a3
{
  UITextNonEditableInteraction *v4;
  UITextNonEditableInteraction *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UITextNonEditableInteraction;
  v4 = -[UITextInteraction init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_mode = a3;
    if (a3 == 2)
    {
      -[UITextInteraction defaultTapRecognizerWithAction:](v4, "defaultTapRecognizerWithAction:", sel_oneFingerTapInUneditableAccelerated_);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextInteraction addGestureRecognizer:withName:](v5, "addGestureRecognizer:withName:", v6, 0x1E17787A0);

LABEL_5:
      -[UITextInteraction defaultDoubleTapRecognizerWithAction:](v5, "defaultDoubleTapRecognizerWithAction:", sel_doubleTapInUneditable_);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextInteraction addGestureRecognizer:withName:](v5, "addGestureRecognizer:withName:", v8, 0x1E1778820);

      return v5;
    }
    -[UITextInteraction defaultTapRecognizerWithAction:](v4, "defaultTapRecognizerWithAction:", sel_oneFingerTapInUneditable_);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextInteraction addGestureRecognizer:withName:](v5, "addGestureRecognizer:withName:", v7, 0x1E17787A0);

    if (a3 != 1)
      goto LABEL_5;
  }
  return v5;
}

- (BOOL)_shouldAllowEnforcedTouchTypeForTouch:(id)a3 forGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  int v11;

  v6 = a3;
  v7 = a4;
  -[UITextInteraction recognizerForName:](self, "recognizerForName:", 0x1E1778820);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[UITextInteraction recognizerForName:](self, "recognizerForName:", 0x1E17787A0);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v7 || v9 == v7)
    v11 = objc_msgSend(v6, "_originatesFromPointerEvent") ^ 1;
  else
    LOBYTE(v11) = 1;

  return v11;
}

- (BOOL)_shouldAllowOneFingerTapInUneditable:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;

  -[UITextInteraction linkInteractionSession](self, "linkInteractionSession", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = 1;
  }
  else
  {
    -[UITextInteraction assistantDelegate](self, "assistantDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextInteraction _textInput](self, "_textInput");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "viewCouldBecomeEditable:", v7) & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      -[UITextInteraction assistantDelegate](self, "assistantDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isFirstResponder"))
      {
        -[UITextInteraction assistantDelegate](self, "assistantDelegate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "view");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "_responderWindow");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "isKeyWindow"))
        {
          -[UITextInteraction assistantDelegate](self, "assistantDelegate");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "activeSelection");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "selectedRange");
          v17 = v10;
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v5 = objc_msgSend(v14, "_isRanged");

          v10 = v17;
        }
        else
        {
          v5 = 1;
        }

      }
      else
      {
        v5 = 1;
      }

    }
  }

  return v5;
}

- (void)oneFingerTapInUneditable:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  uint64_t v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  id v26;

  v26 = a3;
  -[UITextInteraction linkInteractionSession](self, "linkInteractionSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "tapOnLinkWithGesture:", v26);

  v6 = v26;
  if ((v5 & 1) == 0)
  {
    objc_msgSend(v26, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "superview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "locationInView:", v8);
    v10 = v9;
    v12 = v11;
    -[UITextInteraction assistantDelegate](self, "assistantDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "activeSelection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextInteraction view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextInteraction _textInput](self, "_textInput");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setNeedsGestureUpdate:", objc_msgSend(v16, "isFirstResponder") ^ 1);
    if (objc_msgSend(v13, "viewCouldBecomeEditable:", v16)
      && (objc_msgSend(v14, "selectedRange"),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          v18 = objc_msgSend(v17, "_isRanged"),
          v17,
          (v18 & 1) == 0))
    {
      +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "updateChangeTimeAndIncrementCount");

      v19 = 1;
      objc_msgSend(v15, "setEditable:", 1);
      objc_msgSend(v13, "setFirstResponderIfNecessaryActivatingSelection:", 0);
      objc_msgSend(v13, "setGestureRecognizers");
    }
    else
    {
      objc_msgSend(v13, "setFirstResponderIfNecessaryActivatingSelection:", 0);
      v19 = 0;
    }
    -[UITextInteraction _performPreemtiveLayoutToEnsureNoMoreLayoutWhileSelecting:](self, "_performPreemtiveLayoutToEnsureNoMoreLayoutWhileSelecting:", v16);
    objc_msgSend(v16, "textInputView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "convertPoint:toView:", v21, v10, v12);
    v23 = v22;
    v25 = v24;

    -[UITextNonEditableInteraction _oneFingerTapInUneditableActionAtLocation:textInput:canReplaceText:modifierFlags:](self, "_oneFingerTapInUneditableActionAtLocation:textInput:canReplaceText:modifierFlags:", v16, v19, objc_msgSend(v26, "modifierFlags"), v23, v25);
    if (objc_msgSend(v13, "needsGestureUpdate") && objc_msgSend(v16, "isFirstResponder"))
      objc_msgSend(v13, "setGestureRecognizers");
    objc_msgSend(v13, "notifyKeyboardSelectionChanged");

    v6 = v26;
  }

}

- (void)oneFingerTapInUneditableAccelerated:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  id v11;

  v4 = a3;
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "superview");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "locationInView:", v11);
  v7 = v6;
  v9 = v8;

  -[UITextInteraction _textInput](self, "_textInput");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextNonEditableInteraction _oneFingerTapInUneditableAcceleratedActionAtLocation:textInput:canReplaceText:](self, "_oneFingerTapInUneditableAcceleratedActionAtLocation:textInput:canReplaceText:", v10, 0, v7, v9);

}

- (void)_oneFingerTapInUneditableActionAtLocation:(CGPoint)a3 textInput:(id)a4 canReplaceText:(BOOL)a5 modifierFlags:(int64_t)a6
{
  double y;
  double x;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char v13;
  char v14;
  void *v15;
  char v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  _QWORD v25[6];
  _QWORD v26[6];

  y = a3.y;
  x = a3.x;
  v23 = a4;
  -[UITextInteraction assistantDelegate](self, "assistantDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setGrabberSuppressionAssertion:", 0);
  objc_msgSend(v9, "activeSelection");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (uint64_t)v23;
  v12 = (void *)v10;
  if (!v23)
  {
    -[UITextInteraction _textInput](self, "_textInput");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v24 = (id)v11;
  if (!objc_msgSend(v9, "viewCouldBecomeEditable:", v11))
    goto LABEL_14;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v13 = objc_msgSend(v24, "_usesAsynchronousProtocol");
    if ((WebThreadIsEnabled() & 1) != 0)
    {
      v14 = v13 ^ 1;
LABEL_9:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 || (v14 & 1) == 0)
        goto LABEL_14;
      goto LABEL_13;
    }
    if ((v13 & 1) != 0)
      goto LABEL_14;
  }
  else if (WebThreadIsEnabled())
  {
    v14 = 1;
    goto LABEL_9;
  }
LABEL_13:
  objc_msgSend(v12, "selectedRange");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "_isRanged");

  if ((v16 & 1) == 0)
  {
    -[UITextInteraction assistantDelegate](self, "assistantDelegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "activeSelectionController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "beginSelection");
    objc_msgSend(v17, "selectPositionAtPoint:granularity:completionHandler:", 1, 0, x, y);
    objc_msgSend(v17, "endSelection");
    objc_msgSend(v9, "_editMenuAssistant");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "hideSelectionCommands");

    objc_msgSend(MEMORY[0x1E0DAFEC0], "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __113__UITextNonEditableInteraction__oneFingerTapInUneditableActionAtLocation_textInput_canReplaceText_modifierFlags___block_invoke;
    v26[3] = &__block_descriptor_48_e5__8__0l;
    *(double *)&v26[4] = x;
    *(double *)&v26[5] = y;
    objc_msgSend(v21, "logBlock:domain:", v26, CFSTR("com.apple.keyboard.UIKit"));

    goto LABEL_22;
  }
LABEL_14:
  objc_msgSend(v12, "selectedRange");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v17, "_isRanged"))
  {
LABEL_22:

    goto LABEL_23;
  }
  v18 = objc_msgSend(v9, "containerAllowsSelectionTintOnly");

  if ((v18 & 1) == 0)
  {
    if (-[UITextInteraction selection:containsPoint:](self, "selection:containsPoint:", v12, x, y))
    {
      -[UITextNonEditableInteraction toggleSelectionCommands](self, "toggleSelectionCommands");
      objc_msgSend(v9, "setGrabberSuppressionAssertion:", 0);
    }
    else if ((objc_msgSend(v9, "viewConformsToAsynchronousInteractionProtocol") & 1) == 0)
    {
      objc_msgSend(v12, "clearSelection");
      objc_msgSend(v12, "commit");
      objc_msgSend(v9, "_editMenuAssistant");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "hideSelectionCommands");

    }
    objc_msgSend(MEMORY[0x1E0DAFEC0], "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __113__UITextNonEditableInteraction__oneFingerTapInUneditableActionAtLocation_textInput_canReplaceText_modifierFlags___block_invoke_2;
    v25[3] = &__block_descriptor_48_e5__8__0l;
    *(double *)&v25[4] = x;
    *(double *)&v25[5] = y;
    objc_msgSend(v17, "logBlock:domain:", v25, CFSTR("com.apple.keyboard.UIKit"));
    goto LABEL_22;
  }
LABEL_23:

}

id __113__UITextNonEditableInteraction__oneFingerTapInUneditableActionAtLocation_textInput_canReplaceText_modifierFlags___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];
  _QWORD v7[6];

  v7[5] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("KeyboardEventType");
  v6[1] = CFSTR("Operation");
  v7[0] = CFSTR("TextEditing");
  v7[1] = CFSTR("Uneditable text interaction");
  v7[2] = CFSTR("One finger");
  v6[2] = CFSTR("TriggerType");
  v6[3] = CFSTR("CursorLocationX");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[3] = v2;
  v6[4] = CFSTR("CursorLocationY");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[4] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __113__UITextNonEditableInteraction__oneFingerTapInUneditableActionAtLocation_textInput_canReplaceText_modifierFlags___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];
  _QWORD v7[6];

  v7[5] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("KeyboardEventType");
  v6[1] = CFSTR("Operation");
  v7[0] = CFSTR("TextEditing");
  v7[1] = CFSTR("Selected uneditable text");
  v7[2] = CFSTR("One finger");
  v6[2] = CFSTR("TriggerType");
  v6[3] = CFSTR("CursorLocationX");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[3] = v2;
  v6[4] = CFSTR("CursorLocationY");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[4] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_oneFingerTapInUneditableAcceleratedActionAtLocation:(CGPoint)a3 textInput:(id)a4 canReplaceText:(BOOL)a5
{
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  y = a3.y;
  x = a3.x;
  v18 = a4;
  -[UITextInteraction view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInteraction assistantDelegate](self, "assistantDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setGrabberSuppressionAssertion:", 0);
  -[UITextInteraction root](self, "root");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "_allowsSelectionCommands");

  objc_msgSend(v9, "setFirstResponderIfNecessary");
  objc_msgSend(v9, "activeSelection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    -[UITextInteraction _textInput](self, "_textInput");
    v18 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v12, "selectedRange");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "_isRanged"))
  {
    v14 = objc_msgSend(v9, "containerAllowsSelectionTintOnly");

    if ((v14 & 1) == 0)
    {
      if (-[UITextInteraction selection:containsPoint:](self, "selection:containsPoint:", v12, x, y))
      {
        if (v11)
        {
          objc_msgSend(v9, "_editMenuAssistant");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "showSelectionCommands");

          -[UITextNonEditableInteraction toggleSelectionCommands](self, "toggleSelectionCommands");
        }
      }
      else
      {
        objc_msgSend(v12, "clearSelection");
        objc_msgSend(v12, "commit");
      }
      goto LABEL_12;
    }
  }
  else
  {

  }
  objc_msgSend(v9, "activeSelection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInteraction _beginSelectionChange](self, "_beginSelectionChange");
  objc_msgSend(v16, "alterSelection:granularity:", 1, x, y);
  objc_msgSend(v16, "commit");
  -[UITextInteraction _endSelectionChange](self, "_endSelectionChange");
  if (v11)
  {
    objc_msgSend(v9, "_editMenuAssistant");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "showSelectionCommands");

  }
  objc_msgSend(v9, "scrollSelectionToVisible");

LABEL_12:
}

- (void)doubleTapInUneditable:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  id v25;

  v25 = a3;
  -[UITextInteraction cancelLinkInteractionSession](self, "cancelLinkInteractionSession");
  -[UITextInteraction assistantDelegate](self, "assistantDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSelectionHighlightMode:", 0);
  -[UITextInteraction view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInteraction _textInput](self, "_textInput");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "centroid");
  v9 = v8;
  v11 = v10;
  objc_msgSend(v6, "textInputView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "convertPoint:toView:", v12, v9, v11);
  v14 = v13;
  v16 = v15;

  objc_msgSend(v4, "setFirstResponderIfNecessary");
  objc_msgSend(v4, "setGrabberSuppressionAssertion:", 0);
  if (objc_msgSend(v6, "isFirstResponder"))
  {
    objc_msgSend(v4, "activeSelection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextInteraction _beginSelectionChange](self, "_beginSelectionChange");
    if (-[UITextInteraction _shouldObscureTextInput](self, "_shouldObscureTextInput"))
    {
      v18 = 5;
    }
    else
    {
      -[UITextInteraction recognizerForName:](self, "recognizerForName:", 0x1E1778820);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      if (v19 == v25)
        v18 = 1;
      else
        v18 = 3;

    }
    objc_msgSend(v17, "alterSelection:granularity:", v18, v14, v16);
    objc_msgSend(v17, "commit");
    -[UITextInteraction _endSelectionChange](self, "_endSelectionChange");
    -[UITextInteraction root](self, "root");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "interactionWithGestureForName:", 0x1E17788A0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
      objc_msgSend(v21, "updateInitialPoint:", v14, v16);
    if (self->_mode != 2
      || (-[UITextInteraction root](self, "root"),
          v22 = (void *)objc_claimAutoreleasedReturnValue(),
          v23 = objc_msgSend(v22, "_allowsSelectionCommands"),
          v22,
          v23))
    {
      objc_msgSend(v4, "_editMenuAssistant");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "showSelectionCommands");

    }
    objc_msgSend(v4, "scrollSelectionToVisible");

  }
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

- (void)_performGestureType:(int64_t)a3 state:(int64_t)a4 location:(CGPoint)a5 locationOfFirstTouch:(CGPoint)a6 forTouchType:(int64_t)a7
{
  if (a3 == 1 && a4 == 3)
    -[UITextNonEditableInteraction _oneFingerTapInUneditableActionAtLocation:textInput:canReplaceText:modifierFlags:](self, "_oneFingerTapInUneditableActionAtLocation:textInput:canReplaceText:modifierFlags:", 0, 1, 0, a5.x, a5.y, a6.x, a6.y);
}

- (BOOL)interaction_gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  id v5;
  unsigned __int8 v6;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  if (self->_mode != 2
    && (-[UITextInteraction recognizerForName:](self, "recognizerForName:", 0x1E17787A0),
        v5 = (id)objc_claimAutoreleasedReturnValue(),
        v5,
        v5 == v4))
  {
    v6 = -[UITextNonEditableInteraction _shouldAllowOneFingerTapInUneditable:](self, "_shouldAllowOneFingerTapInUneditable:", v4);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)UITextNonEditableInteraction;
    v6 = -[UITextInteraction interaction_gestureRecognizerShouldBegin:](&v9, sel_interaction_gestureRecognizerShouldBegin_, v4);
  }
  v7 = v6;

  return v7;
}

@end
