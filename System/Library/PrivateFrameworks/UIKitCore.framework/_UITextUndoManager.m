@implementation _UITextUndoManager

- (void)setInputController:(id)a3
{
  objc_storeWeak((id *)&self->_inputController, a3);
}

- (void)removeAllActions
{
  UITextInputController **p_inputController;
  id WeakRetained;
  char v5;
  id v6;
  id v7;
  objc_super v8;

  p_inputController = &self->_inputController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  v5 = objc_msgSend(WeakRetained, "dontRemoveAllActions");

  if ((v5 & 1) == 0)
  {
    v6 = objc_loadWeakRetained((id *)p_inputController);
    objc_msgSend(v6, "undoManagerWillRemoveAllActions");

    v7 = objc_loadWeakRetained((id *)p_inputController);
    objc_msgSend(v7, "stopCoalescing");

    v8.receiver = self;
    v8.super_class = (Class)_UITextUndoManager;
    -[_UITextUndoManager removeAllActions](&v8, sel_removeAllActions);
  }
}

- (BOOL)canUndo
{
  UITextInputController **p_inputController;
  id WeakRetained;
  id v5;
  char v6;
  _BOOL4 v7;
  objc_super v9;

  p_inputController = &self->_inputController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);

  if (WeakRetained
    && (v5 = objc_loadWeakRetained((id *)p_inputController),
        v6 = objc_msgSend(v5, "isWritingToolsStreamingReplacements"),
        v5,
        (v6 & 1) == 0))
  {
    if (!+[UIDictationController isRunning](UIDictationController, "isRunning")
      || (v7 = +[UIDictationController canUndoOrRedo](UIDictationController, "canUndoOrRedo")))
    {
      v9.receiver = self;
      v9.super_class = (Class)_UITextUndoManager;
      LOBYTE(v7) = -[_UITextUndoManager canUndo](&v9, sel_canUndo);
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (BOOL)canRedo
{
  UITextInputController **p_inputController;
  id WeakRetained;
  id v5;
  char v6;
  _BOOL4 v7;
  objc_super v9;

  p_inputController = &self->_inputController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);

  if (WeakRetained
    && (v5 = objc_loadWeakRetained((id *)p_inputController),
        v6 = objc_msgSend(v5, "isWritingToolsStreamingReplacements"),
        v5,
        (v6 & 1) == 0))
  {
    if (!+[UIDictationController isRunning](UIDictationController, "isRunning")
      || (v7 = +[UIDictationController canUndoOrRedo](UIDictationController, "canUndoOrRedo")))
    {
      v9.receiver = self;
      v9.super_class = (Class)_UITextUndoManager;
      LOBYTE(v7) = -[_UITextUndoManager canRedo](&v9, sel_canRedo);
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (void)undo
{
  UITextInputController **p_inputController;
  id WeakRetained;
  id v5;
  objc_super v6;

  p_inputController = &self->_inputController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  objc_msgSend(WeakRetained, "unmarkText");

  v6.receiver = self;
  v6.super_class = (Class)_UITextUndoManager;
  -[_UITextUndoManager undo](&v6, sel_undo);
  v5 = objc_loadWeakRetained((id *)p_inputController);
  objc_msgSend(v5, "undoManagerDidFinishUndoRedo");

}

- (void)redo
{
  UITextInputController **p_inputController;
  id WeakRetained;
  id v5;
  objc_super v6;

  p_inputController = &self->_inputController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  objc_msgSend(WeakRetained, "unmarkText");

  v6.receiver = self;
  v6.super_class = (Class)_UITextUndoManager;
  -[_UITextUndoManager redo](&v6, sel_redo);
  v5 = objc_loadWeakRetained((id *)p_inputController);
  objc_msgSend(v5, "undoManagerDidFinishUndoRedo");

}

- (UITextInputController)inputController
{
  return (UITextInputController *)objc_loadWeakRetained((id *)&self->_inputController);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_inputController);
}

@end
