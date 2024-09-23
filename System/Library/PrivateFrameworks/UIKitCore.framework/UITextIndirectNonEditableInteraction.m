@implementation UITextIndirectNonEditableInteraction

- (void)finishSetup
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UITextIndirectNonEditableInteraction;
  -[UITextInteraction finishSetup](&v4, sel_finishSetup);
  -[UITextInteraction view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextIndirectNonEditableInteraction _setupControllersIfNecessaryWithView:](self, "_setupControllersIfNecessaryWithView:", v3);

}

- (UITextIndirectNonEditableInteraction)initWithView:(id)a3
{
  id v4;
  UITextIndirectNonEditableInteraction *v5;
  UITextIndirectNonEditableInteraction *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UITextIndirectNonEditableInteraction;
  v5 = -[UITextInteraction init](&v8, sel_init);
  v6 = v5;
  if (v4 && v5)
    -[UITextIndirectNonEditableInteraction _setupControllersIfNecessaryWithView:](v5, "_setupControllersIfNecessaryWithView:", v4);

  return v6;
}

- (void)_setupControllersIfNecessaryWithView:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  __objc2_class **v12;
  _UIKeyboardTextSelectionController *v13;
  _UIKeyboardTextSelectionController *textSelectionController;
  _UIKeyboardBasedNonEditableTextSelectionGestureController *v15;
  _UIKeyboardTextSelectionGestureController *textSelectionGestureController;
  id v17;

  v4 = a3;
  if (!self->_textSelectionController || !self->super._textSelectionGestureController)
  {
    v17 = v4;
    if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EDE22B80))
    {
      v5 = v17;
      if (!v5)
        goto LABEL_12;
    }
    else
    {
      -[UITextInteraction root](self, "root");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "textInput");
      v5 = (id)objc_claimAutoreleasedReturnValue();

      if (!v5)
      {
LABEL_12:

        v4 = v17;
        goto LABEL_13;
      }
    }
    objc_msgSend(v5, "inputDelegate");
    v7 = objc_claimAutoreleasedReturnValue();
    if (!v7)
      goto LABEL_9;
    v8 = (void *)v7;
    objc_msgSend(v5, "inputDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 == v10)
    {
LABEL_9:
      v11 = objc_msgSend(v17, "_usesAsynchronousProtocol");
      v12 = off_1E167C830;
      if (!v11)
        v12 = off_1E167C860;
      v13 = (_UIKeyboardTextSelectionController *)objc_msgSend(objc_alloc(*v12), "initWithInputDelegate:", v5);
      textSelectionController = self->_textSelectionController;
      self->_textSelectionController = v13;

      v15 = objc_alloc_init(_UIKeyboardBasedNonEditableTextSelectionGestureController);
      textSelectionGestureController = self->super._textSelectionGestureController;
      self->super._textSelectionGestureController = &v15->super.super;

      -[_UIKeyboardTextSelectionGestureController setDelegate:](self->super._textSelectionGestureController, "setDelegate:", self);
    }
    goto LABEL_12;
  }
LABEL_13:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textSelectionController, 0);
}

- (void)dealloc
{
  UITextIndirectNonEditableInteraction *v3;
  _UIKeyboardTextSelectionController *textSelectionController;
  objc_super v5;

  -[_UIKeyboardTextSelectionGestureController delegate](self->super._textSelectionGestureController, "delegate");
  v3 = (UITextIndirectNonEditableInteraction *)objc_claimAutoreleasedReturnValue();

  if (v3 == self)
    -[_UIKeyboardTextSelectionGestureController setDelegate:](self->super._textSelectionGestureController, "setDelegate:", 0);
  textSelectionController = self->_textSelectionController;
  self->_textSelectionController = 0;

  v5.receiver = self;
  v5.super_class = (Class)UITextIndirectNonEditableInteraction;
  -[UITextIndirectNonEditableInteraction dealloc](&v5, sel_dealloc);
}

- (UIKeyboardTaskQueue)taskQueue
{
  void *v2;
  void *v3;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "taskQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIKeyboardTaskQueue *)v3;
}

- (_UIKeyboardTextSelectionController)textSelectionController
{
  return self->_textSelectionController;
}

- (void)willBeginGesture
{
  UITextIndirectNonEditableInteraction *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = self;
  -[UITextInteraction assistantDelegate](v2, "assistantDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[UITextInteraction inGesture](v2, "inGesture");
  -[UITextInteraction setInGesture:](v2, "setInGesture:", 1);
  objc_msgSend(v5, "checkEditabilityAndSetFirstResponderIfNecessary");
  objc_msgSend(v5, "_editMenuAssistant");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hideSelectionCommands");

  -[UITextInteraction setInGesture:](v2, "setInGesture:", v3);
}

- (void)didEndGesture
{
  void *v3;
  int v4;
  id v5;

  -[UITextInteraction assistantDelegate](self, "assistantDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "needsGestureUpdate"))
  {
    -[UITextInteraction _textInput](self, "_textInput");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isFirstResponder");

    if (v4)
    {
      objc_msgSend(v5, "setGestureRecognizers");
      objc_msgSend(v5, "setNeedsGestureUpdate:", 0);
    }
  }

}

- (BOOL)shouldAllowWithTouchTypes:(id)a3 atPoint:(CGPoint)a4 toBegin:(BOOL)a5
{
  uint64_t v5;
  double y;
  double x;
  id v9;
  void *v10;

  v5 = a5;
  y = a4.y;
  x = a4.x;
  v9 = a3;
  -[UITextInteraction root](self, "root");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v10, "shouldAllowWithTouchTypes:atPoint:toBegin:", v9, v5, x, y);

  return v5;
}

- (BOOL)shouldAllowSelectionGestures:(BOOL)a3 atPoint:(CGPoint)a4 toBegin:(BOOL)a5
{
  _BOOL4 v5;
  double y;
  double x;
  uint64_t v9;

  v5 = a5;
  y = a4.y;
  x = a4.x;
  if ((objc_opt_respondsToSelector() & 1) == 0)
    return 1;
  if (v5)
    v9 = 1;
  else
    v9 = 2;
  return -[_UIKeyboardTextSelectionController shouldAllowSelectionGestureWithTouchType:atPoint:toProgressToState:](self->_textSelectionController, "shouldAllowSelectionGestureWithTouchType:atPoint:toProgressToState:", 0, v9, x, y);
}

@end
