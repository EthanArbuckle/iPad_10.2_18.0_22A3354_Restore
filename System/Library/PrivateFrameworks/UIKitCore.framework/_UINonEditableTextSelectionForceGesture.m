@implementation _UINonEditableTextSelectionForceGesture

- (_UINonEditableTextSelectionForceGesture)initWithTextInput:(id)a3
{
  id v4;
  _UINonEditableTextSelectionForceGesture *v5;
  _UIKeyboardTextSelectionController *v6;
  _UIKeyboardTextSelectionController *textSelectionController;
  _UIKeyboardBasedNonEditableTextSelectionGestureController *v8;
  _UIKeyboardTextSelectionGestureController *gestureController;
  objc_super v11;

  v4 = a3;
  if (v4)
  {
    v11.receiver = self;
    v11.super_class = (Class)_UINonEditableTextSelectionForceGesture;
    v5 = -[UIGestureRecognizer init](&v11, sel_init);
    if (v5)
    {
      v6 = -[_UIKeyboardTextSelectionController initWithInputDelegate:]([_UIKeyboardTextSelectionController alloc], "initWithInputDelegate:", v4);
      textSelectionController = v5->_textSelectionController;
      v5->_textSelectionController = v6;

      v8 = objc_alloc_init(_UIKeyboardBasedNonEditableTextSelectionGestureController);
      gestureController = v5->_gestureController;
      v5->_gestureController = &v8->super.super;

      -[_UIKeyboardTextSelectionGestureController setDelegate:](v5->_gestureController, "setDelegate:", v5);
      -[_UIKeyboardTextSelectionGestureController configureOneFingerForcePressRecognizer:](v5->_gestureController, "configureOneFingerForcePressRecognizer:", v5);
    }
  }
  else
  {

    v5 = 0;
  }

  return v5;
}

- (void)dealloc
{
  _UIKeyboardTextSelectionController *textSelectionController;
  _UIKeyboardTextSelectionGestureController *gestureController;
  objc_super v5;

  -[_UIKeyboardTextSelectionGestureController willRemoveSelectionController](self->_gestureController, "willRemoveSelectionController");
  textSelectionController = self->_textSelectionController;
  self->_textSelectionController = 0;

  -[_UIKeyboardTextSelectionGestureController didRemoveSelectionController](self->_gestureController, "didRemoveSelectionController");
  -[_UIKeyboardTextSelectionGestureController setDelegate:](self->_gestureController, "setDelegate:", 0);
  gestureController = self->_gestureController;
  self->_gestureController = 0;

  v5.receiver = self;
  v5.super_class = (Class)_UINonEditableTextSelectionForceGesture;
  -[UIGestureRecognizer dealloc](&v5, sel_dealloc);
}

- (UIKeyboardTaskQueue)taskQueue
{
  return 0;
}

- (BOOL)_shouldDelayUntilForceLevelRequirementIsMet
{
  return 0;
}

- (void)willBeginGesture
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  id v7;

  -[_UINonEditableTextSelectionForceGesture forceGestureDelegate](self, "forceGestureDelegate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[_UINonEditableTextSelectionForceGesture forceGestureDelegate](self, "forceGestureDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[_UINonEditableTextSelectionForceGesture forceGestureDelegate](self, "forceGestureDelegate");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "willBeginGesture");

    }
  }
}

- (_UINonEditableTextSelectionForceGestureDelegate)forceGestureDelegate
{
  return (_UINonEditableTextSelectionForceGestureDelegate *)objc_loadWeakRetained((id *)&self->forceGestureDelegate);
}

- (void)setForceGestureDelegate:(id)a3
{
  objc_storeWeak((id *)&self->forceGestureDelegate, a3);
}

- (_UIKeyboardTextSelectionController)textSelectionController
{
  return self->_textSelectionController;
}

- (void)setTextSelectionController:(id)a3
{
  objc_storeStrong((id *)&self->_textSelectionController, a3);
}

- (_UIKeyboardTextSelectionGestureController)gestureController
{
  return self->_gestureController;
}

- (void)setGestureController:(id)a3
{
  objc_storeStrong((id *)&self->_gestureController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gestureController, 0);
  objc_storeStrong((id *)&self->_textSelectionController, 0);
  objc_destroyWeak((id *)&self->forceGestureDelegate);
}

@end
