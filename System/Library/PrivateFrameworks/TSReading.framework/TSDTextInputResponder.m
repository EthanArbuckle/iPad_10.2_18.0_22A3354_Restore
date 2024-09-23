@implementation TSDTextInputResponder

- (int64_t)keyboardType
{
  return 0;
}

- (TSDTextInputResponder)initWithNextResponder:(id)a3
{
  TSDTextInputResponder *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TSDTextInputResponder;
  v4 = -[TSDTextInputResponder init](&v9, sel_init);
  if (v4)
  {
    v4->_nextResponder = (UIResponder *)a3;
    v4->_preferredEndPosition = NAN;
    v4->_preferredStartPosition = NAN;
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "addObserver:selector:name:object:", v4, sel_p_editorSelectionWasForciblyChangedNotification_, CFSTR("TSDEditorControllerSelectionWasForciblyChanged"), 0);
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "addObserver:selector:name:object:", v4, sel_p_editorWillClearSelectionNotification_, CFSTR("TSDEditorControllerTextEditorWillClearSelection"), 0);
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "addObserver:selector:name:object:", v4, sel_p_editorWillStyleTextNotification_, CFSTR("TSDEditorControllerTextEditorWillStyleText"), 0);
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "addObserver:selector:name:object:", v4, sel_p_editorWillHandleTapNotification_, CFSTR("TSDEditorControllerTextEditorWillHandleTap"), 0);
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "addObserver:selector:name:object:", v4, sel_p_editorDidInsertTextNotification_, CFSTR("TSDEditorControllerTextEditorDidInsertText"), 0);
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "addObserver:selector:name:object:", v4, sel_p_willShowPopoverNotification_, CFSTR("TSKPopoverControllerWillShowPopoverNotification"), 0);
    v5 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, sel_p_willUndoChangeNotification_, *MEMORY[0x24BDD13D0], 0);
    v6 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v6, "addObserver:selector:name:object:", v4, sel_p_didUndoRedoChangeNotification_, *MEMORY[0x24BDD13B8], 0);
    v7 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v7, "addObserver:selector:name:object:", v4, sel_p_didUndoRedoChangeNotification_, *MEMORY[0x24BDD13B0], 0);
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "addObserver:selector:name:object:", v4, sel_p_startDynamicOperation_, CFSTR("TSDEditorControllerTextEditorStartDynamicOperation"), 0);
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "addObserver:selector:name:object:", v4, sel_p_finishDynamicOperation_, CFSTR("TSDEditorControllerTextEditorFinishDynamicOperation"), 0);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:", self);

  v3.receiver = self;
  v3.super_class = (Class)TSDTextInputResponder;
  -[TSDTextInputResponder dealloc](&v3, sel_dealloc);
}

- (BOOL)isResigning
{
  return self->_isResigning;
}

- (BOOL)_disableAutomaticKeyboardUI
{
  return 1;
}

- (void)p_setEditor:(id)a3
{
  void *v5;
  uint64_t v6;
  TSDTextInput *v7;
  char v8;
  id v9;
  BOOL v10;
  double v11;
  id v12;

  if (a3 && self->_editor == a3)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDTextInputResponder p_setEditor:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTextInputResponder.m"), 241, CFSTR("Editor validation should have happened through the public setEditor method."));
  }
  v12 = -[TSDTextInputResponder inputView](self, "inputView");
  -[TSDTextInputResponder willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("inputView"));
  v7 = self->_editor;
  self->_editor = (TSDTextInput *)a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v8 = objc_opt_respondsToSelector();
  else
    v8 = 0;
  self->_editorRespondsToRawArrowKeySelectors = v8 & 1;
  if (!a3)
  {
    if (!-[TSDTextInputResponder p_isExecutingUITextInput](self, "p_isExecutingUITextInput"))
    {
      objc_msgSend(objc_loadWeak((id *)&self->_inputDelegate), "selectionWillChange:", self);
      objc_msgSend(objc_loadWeak((id *)&self->_inputDelegate), "selectionDidChange:", self);
    }
    -[TSDTextInputResponder p_textChanged](self, "p_textChanged");
  }
  -[TSDTextInputResponder didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("inputView"));
  v9 = -[TSDTextInputResponder inputView](self, "inputView");
  if (self->_editor)
    v10 = v9 == v12;
  else
    v10 = 1;
  if (!v10)
  {
    if (v9 && (objc_msgSend(v9, "frame"), v11 == 0.0))
    {
      -[TSDTextInputResponder performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_reloadInputViews, 0, 0.0);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_reloadInputViews, 0);
      -[TSDTextInputResponder reloadInputViews](self, "reloadInputViews");
    }
  }

}

- (BOOL)p_requiresFirstResponderChangeForEditor:(id)a3
{
  char v4;

  v4 = -[TSDTextInputResponder isFirstResponder](self, "isFirstResponder");
  return v4 ^ objc_msgSend(a3, "wantsKeyboard");
}

- (void)p_setFirstResponderAfterDelay
{
  -[TSDTextInputResponder p_setFirstResponder:](self, "p_setFirstResponder:", self->_pendingFirstResponderObject);
  self->_pendingFirstResponderObject = 0;
}

- (void)p_setFirstResponder:(id)a3
{
  int v5;
  id v6;
  void *v7;
  TSDTextInputResponder *v8;
  UIResponder *nextResponder;

  if (-[TSDTextInputResponder p_requiresFirstResponderChangeForEditor:](self, "p_requiresFirstResponderChangeForEditor:"))
  {
    v5 = objc_msgSend(a3, "wantsKeyboard");
    v6 = -[TSDTextInputResponder p_ICC](self, "p_ICC");
    if (v5
      && ((objc_msgSend(v6, "delegate"), v7 = (void *)TSUProtocolCast(), (objc_opt_respondsToSelector() & 1) == 0)
       || objc_msgSend(v7, "allowTextEditingToBegin")))
    {
      v8 = self;
    }
    else
    {
      nextResponder = self->_nextResponder;
      if (!nextResponder)
      {
LABEL_10:
        -[TSDTextInputResponder p_resignFirstResponder](self, "p_resignFirstResponder");
        return;
      }
      while (!-[UIResponder canBecomeFirstResponder](nextResponder, "canBecomeFirstResponder"))
      {
        nextResponder = -[UIResponder nextResponder](nextResponder, "nextResponder");
        if (!nextResponder)
          goto LABEL_10;
      }
      v8 = (TSDTextInputResponder *)nextResponder;
    }
    -[TSDTextInputResponder becomeFirstResponder](v8, "becomeFirstResponder");
  }
}

- (void)p_setFirstResponderAndEditor:(id)a3
{
  self->_pendingEditorChange = 0;

  self->_pendingEditor = 0;
  if (a3 && objc_msgSend(a3, "wantsKeyboard"))
  {
    -[TSDTextInputResponder p_setEditor:](self, "p_setEditor:", a3);
    -[TSDTextInputResponder p_setFirstResponder:](self, "p_setFirstResponder:", a3);
  }
  else
  {
    -[TSDTextInputResponder p_setFirstResponder:](self, "p_setFirstResponder:", a3);
    -[TSDTextInputResponder p_setEditor:](self, "p_setEditor:", a3);
  }
}

- (void)p_setFirstResponderAndEditorAfterDelay
{
  void *v3;
  uint64_t v4;
  TSDTextInput *v5;

  if (!self->_pendingEditorChange)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDTextInputResponder p_setFirstResponderAndEditorAfterDelay]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTextInputResponder.m"), 378, CFSTR("Unexpectedly being asked to update the first responder when there's nothing to switch to."));
  }
  self->_pendingEditorChange = 0;
  v5 = self->_pendingEditor;
  -[TSDTextInputResponder p_setFirstResponderAndEditor:](self, "p_setFirstResponderAndEditor:", v5);

}

- (void)setEditor:(id)a3
{
  -[TSDTextInputResponder cancelDelayedResponderChange](self, "cancelDelayedResponderChange");

  self->_pendingEditor = 0;
  self->_pendingEditorChange = 0;
  if (self->_editor != a3)
  {
    if (self->_isResigning
      || !-[TSDTextInputResponder p_requiresFirstResponderChangeForEditor:](self, "p_requiresFirstResponderChangeForEditor:", a3))
    {
      -[TSDTextInputResponder p_setEditor:](self, "p_setEditor:", a3);
    }
    else if (-[TSDTextInputResponder isFirstResponder](self, "isFirstResponder")
           && (objc_msgSend(a3, "wantsKeyboard") & 1) == 0)
    {
      self->_pendingEditor = (TSDTextInput *)a3;
      self->_pendingEditorChange = 1;
      -[TSDTextInputResponder performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_p_setFirstResponderAndEditorAfterDelay, 0, 0.25);
    }
    else
    {
      -[TSDTextInputResponder p_setFirstResponderAndEditor:](self, "p_setFirstResponderAndEditor:", a3);
    }
  }
}

- (void)beginIgnoringKeyboardInput
{
  int *p_ignoreKeyboardInputCount;
  unsigned int v3;

  p_ignoreKeyboardInputCount = &self->_ignoreKeyboardInputCount;
  do
    v3 = __ldaxr((unsigned int *)p_ignoreKeyboardInputCount);
  while (__stlxr(v3 + 1, (unsigned int *)p_ignoreKeyboardInputCount));
}

- (void)endIgnoringKeyboardInput
{
  int *p_ignoreKeyboardInputCount;
  int v3;
  void *v4;
  uint64_t v5;

  p_ignoreKeyboardInputCount = &self->_ignoreKeyboardInputCount;
  do
    v3 = __ldaxr((unsigned int *)p_ignoreKeyboardInputCount);
  while (__stlxr(v3 - 1, (unsigned int *)p_ignoreKeyboardInputCount));
  if (v3 <= 0)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDTextInputResponder endIgnoringKeyboardInput]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTextInputResponder.m"), 430, CFSTR("Unbalanced calls to -beginIgnoringKeyboardInput and -endIgnoringKeyboardInput"));
  }
}

- (void)clearEditorAndResignFirstResponder
{
  -[TSDTextInputResponder acceptAutocorrection](self, "acceptAutocorrection");

  self->_editor = 0;
  -[TSDTextInputResponder p_setFirstResponder:](self, "p_setFirstResponder:", 0);
}

- (void)resumeEditing
{
  -[TSDTextInputResponder p_setFirstResponder:](self, "p_setFirstResponder:", self->_editor);
}

- (void)cancelDelayedResponderChange
{
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_p_setFirstResponderAfterDelay, 0);
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_p_setFirstResponderAndEditorAfterDelay, 0);
  self->_pendingFirstResponderObject = 0;

  self->_pendingEditor = 0;
  self->_pendingEditorChange = 0;
}

- (void)forceDelayedResponderChange
{
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_p_setFirstResponderAfterDelay, 0);
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_p_setFirstResponderAndEditorAfterDelay, 0);
  self->_pendingFirstResponderObject = 0;
  if (self->_pendingEditorChange)
    -[TSDTextInputResponder p_setFirstResponderAndEditorAfterDelay](self, "p_setFirstResponderAndEditorAfterDelay");
}

- (id)editingTextReps
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (!self->_editor)
    return 0;
  v3 = -[TSDTextInputResponder nextResponder](self, "nextResponder");
  if (!v3)
    return 0;
  v4 = v3;
  do
  {
    objc_opt_class();
    v5 = (void *)TSUDynamicCast();
    v6 = objc_msgSend(v4, "nextResponder");
    v4 = (void *)v6;
    if (v5)
      v7 = 1;
    else
      v7 = v6 == 0;
  }
  while (!v7);
  if (!v5)
    return v5;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "controller", 0), "canvas"), "allReps");
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (!v9)
    return 0;
  v10 = v9;
  v5 = 0;
  v11 = *(_QWORD *)v16;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v16 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
      if (objc_msgSend(v13, "canEditWithEditor:", self->_editor))
      {
        if (!v5)
          v5 = (void *)objc_msgSend(MEMORY[0x24BDBCEF0], "set");
        objc_msgSend(v5, "addObject:", v13);
      }
    }
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  }
  while (v10);
  return v5;
}

- (id)editingTextRep
{
  return (id)objc_msgSend(-[TSDTextInputResponder editingTextReps](self, "editingTextReps"), "anyObject");
}

- (void)acceptAutocorrection
{
  if (!self->_inDynamicOperation && -[TSDTextInputResponder autocorrectionType](self, "autocorrectionType") != 1)
  {
    if (!-[TSDTextInputResponder p_isExecutingUITextInput](self, "p_isExecutingUITextInput"))
    {
      objc_msgSend(objc_loadWeak((id *)&self->_inputDelegate), "selectionWillChange:", self);
      objc_msgSend(objc_loadWeak((id *)&self->_inputDelegate), "selectionDidChange:", self);
    }
    -[TSDTextInput clearMarkedRange](self->_editor, "clearMarkedRange");
    -[TSDTextInputResponder p_textChanged](self, "p_textChanged");
  }
}

- (id)nextResponder
{
  return self->_nextResponder;
}

- (BOOL)canBecomeFirstResponder
{
  return self->_editor != 0;
}

- (BOOL)becomeFirstResponder
{
  _BOOL4 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSDTextInputResponder;
  v3 = -[TSDTextInputResponder becomeFirstResponder](&v5, sel_becomeFirstResponder);
  if (v3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("TSDTextInputResponderDidBecomeFirstResponder"), self);
  return v3;
}

- (BOOL)canResignFirstResponder
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[TSDTextInput canResignFirstResponder](self->_editor, "canResignFirstResponder");
  else
    return 1;
}

- (BOOL)p_resignFirstResponder
{
  _BOOL4 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSDTextInputResponder;
  v3 = -[TSDTextInputResponder resignFirstResponder](&v5, sel_resignFirstResponder);
  if (v3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("TSDTextInputResponderDidResignFirstResponder"), self);
  return v3;
}

- (BOOL)resignFirstResponder
{
  _BOOL4 v3;

  v3 = -[TSDTextInputResponder canResignFirstResponder](self, "canResignFirstResponder");
  if (v3)
  {
    self->_isResigning = 1;
    if (-[TSDTextInput wantsKeyboard](self->_editor, "wantsKeyboard"))
    {
      -[TSDTextInputResponder acceptAutocorrection](self, "acceptAutocorrection");
      -[TSDTextInput endEditing](self->_editor, "endEditing");
    }
    if (-[TSDTextInputResponder isFirstResponder](self, "isFirstResponder"))
      LOBYTE(v3) = -[TSDTextInputResponder p_resignFirstResponder](self, "p_resignFirstResponder");
    else
      LOBYTE(v3) = 1;
    self->_isResigning = 0;
  }
  return v3;
}

- (BOOL)p_didEnterUITextInput
{
  int ignoreKeyboardInputCount;

  ignoreKeyboardInputCount = self->_ignoreKeyboardInputCount;
  if (!ignoreKeyboardInputCount)
    ++self->_respondingToUITextInput;
  return ignoreKeyboardInputCount == 0;
}

- (void)p_willExitUITextInput
{
  int respondingToUITextInput;
  void *v4;
  uint64_t v5;

  respondingToUITextInput = self->_respondingToUITextInput;
  if (respondingToUITextInput <= 0)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDTextInputResponder p_willExitUITextInput]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTextInputResponder.m"), 663, CFSTR("UITextInput counter is going negative"));
    respondingToUITextInput = self->_respondingToUITextInput;
  }
  self->_respondingToUITextInput = respondingToUITextInput - 1;
}

- (BOOL)p_isExecutingUITextInput
{
  return self->_respondingToUITextInput > 0;
}

- (UITextRange)selectedTextRange
{
  TSDTextRange *v3;
  TSDTextRange *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;

  if (-[TSDTextInputResponder p_wantRawArrowKeys](self, "p_wantRawArrowKeys")
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = (TSDTextRange *)-[TSDTextInput selectionForArrowKeys](self->_editor, "selectionForArrowKeys");
  }
  else
  {
    v3 = (TSDTextRange *)-[TSDTextInput textInputSelection](self->_editor, "textInputSelection");
  }
  v4 = v3;
  if (v3)
  {
    v5 = -[TSDTextRange range](v3, "range");
    if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v4 = 0;
    }
    else
    {
      v7 = v5;
      v8 = v6;
      v9 = -[TSDTextRange isAtEndOfLine](v4, "isAtEndOfLine");
      *(float *)&v10 = self->_preferredStartPosition;
      *(float *)&v11 = self->_preferredEndPosition;
      v4 = +[TSDTextRange textRangeWithRange:eolAffinity:preferredStartPosition:preferredEndPosition:](TSDTextRange, "textRangeWithRange:eolAffinity:preferredStartPosition:preferredEndPosition:", v7, v8, v9, v10, v11);
      if (v7 + v8 > (unint64_t)-[TSDTextInput textLength](self->_editor, "textLength"))
      {
        v12 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDTextInputResponder selectedTextRange]");
        objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTextInputResponder.m"), 694, CFSTR("Bad selected text range"));
      }
    }
  }
  if (-[TSDTextInputResponder p_wantRawArrowKeys](self, "p_wantRawArrowKeys"))
    return (UITextRange *)-[TSDTextInputResponder arrow_augmentTextRange:](self, "arrow_augmentTextRange:", v4);
  else
    return &v4->super;
}

- (void)p_setSelectedTextRange:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  float preferredStartPosition;
  float preferredEndPosition;
  uint64_t v14;
  uint64_t v15;
  float v16;
  float v17;
  void *v18;
  uint64_t v19;

  v5 = -[TSDTextInputResponder p_ICC](self, "p_ICC");
  objc_msgSend(v5, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend((id)objc_msgSend(v5, "delegate"), "selectableWordLimit"))
  {
    v6 = -[TSDTextInputResponder _nsrangeForTextRange:](self, "_nsrangeForTextRange:", a3);
    v8 = +[TSDRangeClamper clampSelectedRange:inFullString:toWordLimit:](TSDRangeClamper, "clampSelectedRange:inFullString:toWordLimit:", v6, v7, -[TSDTextInput unfilteredText](self->_editor, "unfilteredText"), objc_msgSend((id)objc_msgSend(v5, "delegate"), "selectableWordLimit"));
    a3 = -[TSDTextInputResponder _textRangeFromNSRange:](self, "_textRangeFromNSRange:", v8, v9);
  }
  if (-[TSDTextInputResponder p_wantRawArrowKeys](self, "p_wantRawArrowKeys"))
  {
    -[TSDTextInputResponder arrow_setSelectedTextRange:](self, "arrow_setSelectedTextRange:", a3);
  }
  else
  {
    objc_opt_class();
    v10 = TSUDynamicCast();
    if (v10)
    {
      v11 = (void *)v10;
      -[TSDTextInputResponder acceptAutocorrection](self, "acceptAutocorrection");
      preferredStartPosition = self->_preferredStartPosition;
      preferredEndPosition = self->_preferredEndPosition;
      self->_isSettingSelectedTextRange = 1;
      objc_msgSend(v11, "range");
      -[TSDTextInput editRange](self->_editor, "editRange");
      v14 = TSUIntersectionRangeWithEdge();
      if (v14 != 0x7FFFFFFFFFFFFFFFLL)
        -[TSDTextInput setSelectionWithRange:endOfLine:](self->_editor, "setSelectionWithRange:endOfLine:", v14, v15, objc_msgSend(v11, "isAtEndOfLine"));
      objc_msgSend(v11, "preferredStartPosition");
      if (preferredStartPosition == v16)
        self->_preferredStartPosition = preferredStartPosition;
      objc_msgSend(v11, "preferredEndPosition");
      if (preferredEndPosition == v17)
        self->_preferredEndPosition = preferredEndPosition;
      self->_isSettingSelectedTextRange = 0;
    }
    else
    {
      v18 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v19 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDTextInputResponder p_setSelectedTextRange:]");
      objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTextInputResponder.m"), 728, CFSTR("bad textRange"));
    }
  }
}

- (void)setSelectedTextRange:(id)a3
{
  if (-[TSDTextInputResponder p_didEnterUITextInput](self, "p_didEnterUITextInput"))
  {
    if (a3)
    {
      -[TSDTextInputResponder p_setSelectedTextRange:](self, "p_setSelectedTextRange:", a3);
      -[TSDTextInputResponder p_willExitUITextInput](self, "p_willExitUITextInput");
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[TSDTextInput clearSelection](self->_editor, "clearSelection");
    }
  }
}

- (UITextRange)markedTextRange
{
  uint64_t v3;
  uint64_t v4;
  TSDTextRange *v5;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  if (-[TSDTextInputResponder p_wantRawArrowKeys](self, "p_wantRawArrowKeys"))
    return 0;
  v3 = -[TSDTextInput markedRange](self->_editor, "markedRange");
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v7 = v3;
  v8 = v4;
  v5 = +[TSDTextRange textRangeWithRange:](TSDTextRange, "textRangeWithRange:", v3, v4);
  if (v7 + v8 > (unint64_t)-[TSDTextInput textLength](self->_editor, "textLength"))
  {
    v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDTextInputResponder markedTextRange]");
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTextInputResponder.m"), 797, CFSTR("Bad marked text range"));
  }
  return &v5->super;
}

- (void)setMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;

  length = a4.length;
  location = a4.location;
  if (-[TSDTextInputResponder p_didEnterUITextInput](self, "p_didEnterUITextInput"))
  {
    -[TSDTextInput setMarkedText:selectedRange:](self->_editor, "setMarkedText:selectedRange:", a3, location, length);
    -[TSDTextInputResponder p_willExitUITextInput](self, "p_willExitUITextInput");
  }
}

- (void)p_unmarkText
{
  -[TSDTextInput clearMarkedRange](self->_editor, "clearMarkedRange");
}

- (void)unmarkText
{
  if (-[TSDTextInputResponder p_didEnterUITextInput](self, "p_didEnterUITextInput"))
  {
    -[TSDTextInputResponder p_unmarkText](self, "p_unmarkText");
    -[TSDTextInputResponder p_willExitUITextInput](self, "p_willExitUITextInput");
  }
}

- (UITextPosition)beginningOfDocument
{
  TSDTextPosition *v3;

  v3 = +[TSDTextPosition textPositionWithCharIndex:](TSDTextPosition, "textPositionWithCharIndex:", -[TSDTextInput editRange](self->_editor, "editRange"));
  if (-[TSDTextInputResponder p_wantRawArrowKeys](self, "p_wantRawArrowKeys"))
    return (UITextPosition *)-[TSDTextInputResponder arrow_augmentBeginningOfDocument:](self, "arrow_augmentBeginningOfDocument:", v3);
  else
    return &v3->super;
}

- (UITextPosition)endOfDocument
{
  uint64_t v3;
  uint64_t v4;
  TSDTextPosition *v5;

  v3 = -[TSDTextInput editRange](self->_editor, "editRange");
  v5 = +[TSDTextPosition textPositionWithCharIndex:](TSDTextPosition, "textPositionWithCharIndex:", v3 + v4);
  if (-[TSDTextInputResponder p_wantRawArrowKeys](self, "p_wantRawArrowKeys"))
    return (UITextPosition *)-[TSDTextInputResponder arrow_augmentEndOfDocument:](self, "arrow_augmentEndOfDocument:", v5);
  else
    return &v5->super;
}

- (id)textInRange:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  TSDTextInput *editor;
  uint64_t v10;
  uint64_t v11;

  objc_opt_class();
  v5 = TSUDynamicCast();
  v6 = (void *)v5;
  if (a3 && !v5)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDTextInputResponder textInRange:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTextInputResponder.m"), 874, CFSTR("bad textRange"));
LABEL_5:
    editor = self->_editor;
    v10 = objc_msgSend(v6, "range");
    return (id)-[TSDTextInput textInRange:](editor, "textInRange:", v10, v11);
  }
  if (a3)
    goto LABEL_5;
  return &stru_24D82FEB0;
}

- (void)replaceRange:(id)a3 withText:(id)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  void *v16;
  uint64_t v17;

  if (-[TSDTextInputResponder p_didEnterUITextInput](self, "p_didEnterUITextInput"))
  {
    if (-[TSDTextInputResponder p_wantRawArrowKeys](self, "p_wantRawArrowKeys"))
    {
      -[TSDTextInputResponder insertText:](self, "insertText:", a4);
    }
    else
    {
      objc_opt_class();
      v6 = (void *)TSUDynamicCast();
      if (!v6)
      {
        v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDTextInputResponder replaceRange:withText:]");
        objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTextInputResponder.m"), 892, CFSTR("bad textRange"));
      }
      v9 = -[TSDTextInput editRange](self->_editor, "editRange");
      if (v6)
      {
        v11 = v9;
        v12 = v10;
        v14 = objc_msgSend(v6, "range");
        if (v11 <= v14 && v11 + v12 >= v14 + v13)
        {
          -[TSDTextInput replaceRange:withText:](self->_editor, "replaceRange:withText:", v14, v13, a4);
        }
        else
        {
          v16 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", v14);
          v17 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDTextInputResponder replaceRange:withText:]");
          objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTextInputResponder.m"), 900, CFSTR("Input range is bad."));
        }
      }
    }
    -[TSDTextInputResponder p_willExitUITextInput](self, "p_willExitUITextInput");
  }
}

- (id)textRangeFromPosition:(id)a3 toPosition:(id)a4
{
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  int v20;
  int v21;
  double v22;
  double v23;
  TSDTextRange *v24;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;

  objc_opt_class();
  v7 = (void *)TSUDynamicCast();
  objc_opt_class();
  v8 = (void *)TSUDynamicCast();
  v9 = v8;
  if (!v7)
  {
    v26 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v27 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDTextInputResponder textRangeFromPosition:toPosition:]");
    objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v27, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTextInputResponder.m"), 930, CFSTR("bad textPosition"));
    if (v9)
      return 0;
LABEL_13:
    v28 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v29 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDTextInputResponder textRangeFromPosition:toPosition:]");
    objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v29, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTextInputResponder.m"), 931, CFSTR("bad textPosition"));
    return 0;
  }
  if (!v8)
    goto LABEL_13;
  v10 = objc_msgSend(v8, "charIndex");
  v11 = objc_msgSend(v7, "charIndex");
  if (v10 <= v11)
    v12 = v9;
  else
    v12 = v7;
  if (v10 <= v11)
    v13 = v7;
  else
    v13 = v9;
  v14 = objc_msgSend(v12, "charIndex");
  v15 = objc_msgSend(v13, "charIndex");
  v16 = objc_msgSend(v12, "charIndex");
  if (v14 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v17 = v15 - v16;
  v18 = objc_msgSend(v7, "endOfLineAffinity");
  objc_msgSend(v7, "preferredPosition");
  v20 = v19;
  objc_msgSend(v9, "preferredPosition");
  LODWORD(v22) = v21;
  LODWORD(v23) = v20;
  v24 = +[TSDTextRange textRangeWithRange:eolAffinity:preferredStartPosition:preferredEndPosition:](TSDTextRange, "textRangeWithRange:eolAffinity:preferredStartPosition:preferredEndPosition:", v14, v17, v18, v23, v22);
  if (-[TSDTextInputResponder p_wantRawArrowKeys](self, "p_wantRawArrowKeys"))
    return (id)-[TSDTextInputResponder arrow_augmentTextRange:fromPosition:toPosition:](self, "arrow_augmentTextRange:fromPosition:toPosition:", v24, a3, a4);
  return v24;
}

- (int64_t)comparePosition:(id)a3 toPosition:(id)a4
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;

  if (-[TSDTextInputResponder p_wantRawArrowKeys](self, "p_wantRawArrowKeys"))
    return -[TSDTextInputResponder arrow_comparePosition:toPosition:](self, "arrow_comparePosition:toPosition:", a3, a4);
  objc_opt_class();
  v8 = (void *)TSUDynamicCast();
  objc_opt_class();
  v9 = TSUDynamicCast();
  v10 = v9;
  if (!v8)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDTextInputResponder comparePosition:toPosition:]");
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTextInputResponder.m"), 962, CFSTR("bad textPosition"));
    if (v10)
      return objc_msgSend(v8, "compare:", v10);
LABEL_7:
    v13 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v14 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDTextInputResponder comparePosition:toPosition:]");
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTextInputResponder.m"), 963, CFSTR("bad textPosition"));
    return objc_msgSend(v8, "compare:", v10);
  }
  if (!v9)
    goto LABEL_7;
  return objc_msgSend(v8, "compare:", v10);
}

- (int64_t)offsetFromPosition:(id)a3 toPosition:(id)a4
{
  int64_t result;
  void *v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;

  if (-[TSDTextInputResponder p_wantRawArrowKeys](self, "p_wantRawArrowKeys"))
    return -[TSDTextInputResponder arrow_offsetFromPosition:toPosition:](self, "arrow_offsetFromPosition:toPosition:", a3, a4);
  objc_opt_class();
  v8 = (void *)TSUDynamicCast();
  objc_opt_class();
  v9 = TSUDynamicCast();
  v10 = (void *)v9;
  if (!v8)
  {
    v12 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDTextInputResponder offsetFromPosition:toPosition:]");
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTextInputResponder.m"), 983, CFSTR("bad textPosition"));
    if (v10)
      goto LABEL_5;
LABEL_11:
    v14 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v15 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDTextInputResponder offsetFromPosition:toPosition:]");
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTextInputResponder.m"), 984, CFSTR("bad textPosition"));
    goto LABEL_5;
  }
  if (!v9)
    goto LABEL_11;
LABEL_5:
  v11 = -[TSDTextInput textLength](self->_editor, "textLength");
  result = 0;
  if (v8 && v10)
  {
    if (objc_msgSend(v10, "charIndex") <= v11 && objc_msgSend(v8, "charIndex") <= v11)
    {
      v16 = objc_msgSend(v10, "charIndex");
      return v16 - objc_msgSend(v8, "charIndex");
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (id)positionFromPosition:(id)a3 inDirection:(int64_t)a4 offset:(int64_t)a5
{
  TSDTextPosition *cachedPosition;
  void *v11;
  uint64_t v12;
  _BOOL4 v13;
  int v14;
  int64_t v15;
  int64_t referenceOffset;
  int64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  float v21;
  uint64_t v22;
  uint64_t v23;
  double *v24;
  uint64_t v25;
  double v26;
  TSDTextPosition *v27;
  TSDTextPosition *v28;
  BOOL v29;
  int64_t v30;
  TSDTextPosition *v31;
  TSDTextPosition *v33;
  double v34;

  if (-[TSDTextInputResponder p_wantRawArrowKeys](self, "p_wantRawArrowKeys"))
    return (id)-[TSDTextInputResponder arrow_positionFromPosition:inDirection:offset:](self, "arrow_positionFromPosition:inDirection:offset:", a3, a4, a5);
  objc_opt_class();
  cachedPosition = (TSDTextPosition *)TSUDynamicCast();
  if (cachedPosition)
  {
    if (-[TSDTextInput textIsVerticalAtCharIndex:](-[TSDTextInputResponder editor](self, "editor"), "textIsVerticalAtCharIndex:", -[TSDTextPosition charIndex](cachedPosition, "charIndex"))&& (unint64_t)(a4 - 2) <= 3)
    {
      a4 = qword_217C2A060[a4 - 2];
    }
    if (a5 == 0x7FFFFFFFFFFFFFFFLL)
      return 0;
    if (-[TSDTextPosition charIndex](cachedPosition, "charIndex") == 0x7FFFFFFFFFFFFFFFLL)
    {
      v11 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDTextInputResponder positionFromPosition:inDirection:offset:]");
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTextInputResponder.m"), 1054, CFSTR("bad charIndex"));
    }
    v13 = (a4 & 0xFFFFFFFFFFFFFFFELL) == 4;
    if (-[TSDTextPosition charIndex](cachedPosition, "charIndex") > 0x7FFFFFFFFFFFFFFELL)
    {
      return 0;
    }
    else
    {
      v14 = objc_msgSend(a3, "isEqual:", self->_referencePosition);
      if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 4 && v14)
      {
        if (a4 == 4)
          v15 = -a5;
        else
          v15 = a5;
        referenceOffset = self->_referenceOffset;
        if (a4 == 4)
          a4 = 5;
        v17 = v15 - referenceOffset;
        if (v15 - referenceOffset >= 0)
          v18 = v15 - referenceOffset;
        else
          v18 = referenceOffset - v15;
        if (a5 >= 0)
          v19 = a5;
        else
          v19 = -a5;
        if (v18 >= v19)
        {

          self->_referencePosition = 0;
          self->_cachedPosition = 0;
        }
        else
        {
          cachedPosition = self->_cachedPosition;
          v15 = v17;
        }
      }
      else
      {
        v15 = a5;
      }
      if (v15 < 0)
      {
        v15 = -v15;
        switch(a4)
        {
          case 2:
            a4 = 3;
            break;
          case 3:
            a4 = 2;
            break;
          case 4:
            a4 = 5;
            break;
          case 5:
            a4 = 4;
            break;
          default:
            break;
        }
      }
      v33 = (TSDTextPosition *)a3;
      LODWORD(v20) = -[TSDTextPosition endOfLineAffinity](cachedPosition, "endOfLineAffinity");
      -[TSDTextPosition preferredPosition](cachedPosition, "preferredPosition");
      v34 = v21;
      if (v15)
      {
        v22 = 0;
        v23 = 4 * v13;
        if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 4)
          v20 = v20;
        else
          v20 = 0;
        do
        {
          if (v22)
            v24 = 0;
          else
            v24 = &v34;
          v25 = -[TSDTextInput charIndexByMovingPosition:toBoundary:inDirection:preferPosition:](self->_editor, "charIndexByMovingPosition:toBoundary:inDirection:preferPosition:", cachedPosition, v23, a4, v24);
          cachedPosition = 0;
          if (v25 != 0x7FFFFFFFFFFFFFFFLL)
          {
            HIDWORD(v26) = HIDWORD(v34);
            *(float *)&v26 = v34;
            cachedPosition = +[TSDTextPosition textPositionWithCharIndex:eolAffinity:preferredPosition:isPreferredStart:](TSDTextPosition, "textPositionWithCharIndex:eolAffinity:preferredPosition:isPreferredStart:", v25, v20, 1, v26);
          }
          --v22;
        }
        while (v15 + 1 + v22 > 1);
      }
      v27 = self->_cachedPosition;
      if (cachedPosition)
      {
        if (!-[TSDTextPosition isEqual:](cachedPosition, "isEqual:", v27)
          || !-[TSDTextPosition isEqual:](self->_referencePosition, "isEqual:", v33))
        {
          v28 = v33;

          self->_referencePosition = v33;
          v29 = a4 == 2 || a4 == 5;
          v30 = a5;
          if (!v29)
            v30 = -a5;
          self->_referenceOffset = v30;
          v31 = cachedPosition;

          self->_cachedPosition = cachedPosition;
        }
      }
      else if (v15 != 1 || v27 == 0)
      {
        return v33;
      }
      else
      {
        return self->_cachedPosition;
      }
    }
  }
  return cachedPosition;
}

- (id)positionFromPosition:(id)a3 offset:(int64_t)a4
{
  void *v8;
  TSDTextInput *editor;
  BOOL v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  double v15;
  unint64_t v16;
  char v17;
  TSDTextInput *v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;

  if (-[TSDTextInputResponder p_wantRawArrowKeys](self, "p_wantRawArrowKeys"))
    return (id)-[TSDTextInputResponder arrow_positionFromPosition:offset:](self, "arrow_positionFromPosition:offset:", a3, a4);
  objc_opt_class();
  v8 = (void *)TSUDynamicCast();
  editor = self->_editor;
  if (editor)
    v10 = v8 == 0;
  else
    v10 = 1;
  if (v10)
    return 0;
  v11 = -[TSDTextInput editRange](editor, "editRange");
  v13 = v12;
  v14 = objc_msgSend(v8, "charIndex");
  v16 = v14;
  if (a4 < 0 && v14 < -a4)
    return 0;
  if (a4)
  {
    v16 = v14 + a4;
    if (v14 + a4 > v11 + v13)
      return 0;
    v17 = objc_opt_respondsToSelector();
    v18 = self->_editor;
    if ((v17 & 1) != 0)
      v19 = (void *)-[TSDTextInput unfilteredText](v18, "unfilteredText");
    else
      v19 = (void *)-[TSDTextInput textInRange:](v18, "textInRange:", 0, -[TSDTextInput textLength](v18, "textLength"));
    if (v16 < v11 + v13)
    {
      v20 = objc_msgSend(v19, "rangeOfComposedCharacterSequenceAtIndex:", v16);
      if (v16 != v20 && v16 >= v20)
      {
        v22 = a4 <= 0 ? 0 : v21;
        v23 = v22 + v20;
        if (v16 - v20 < v21)
          v16 = v23;
      }
    }
  }
  if (v16 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  if (v16 < v11 || (v11 += v13, v16 > v11))
  {
    v16 = v11;
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
      return 0;
  }
  LODWORD(v15) = 2143289344;
  return +[TSDTextPosition textPositionWithCharIndex:eolAffinity:preferredPosition:isPreferredStart:](TSDTextPosition, "textPositionWithCharIndex:eolAffinity:preferredPosition:isPreferredStart:", v16, 0, 1, v15);
}

- (CGRect)firstRectForRange:(id)a3
{
  void *v4;
  TSDTextInput *editor;
  uint64_t v6;
  uint64_t v7;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect v18;
  CGRect v19;
  CGRect result;

  objc_opt_class();
  v4 = (void *)TSUDynamicCast();
  if (v4)
  {
    editor = self->_editor;
    v6 = objc_msgSend(v4, "range");
    -[TSDTextInput firstRectForRange:](editor, "firstRectForRange:", v6, v7);
    v19 = CGRectIntegral(v18);
    x = v19.origin.x;
    y = v19.origin.y;
    width = v19.size.width;
    height = v19.size.height;
  }
  else
  {
    x = *MEMORY[0x24BDBF070];
    y = *(double *)(MEMORY[0x24BDBF070] + 8);
    width = *(double *)(MEMORY[0x24BDBF070] + 16);
    height = *(double *)(MEMORY[0x24BDBF070] + 24);
    v12 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDTextInputResponder firstRectForRange:]");
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTextInputResponder.m"), 1213, CFSTR("bad textRange"));
  }
  v14 = x;
  v15 = y;
  v16 = width;
  v17 = height;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (id)selectionRectsForRange:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  TSDTextInput *editor;
  uint64_t v8;
  uint64_t v9;

  objc_opt_class();
  v4 = (void *)TSUDynamicCast();
  if (!v4)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDTextInputResponder selectionRectsForRange:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTextInputResponder.m"), 1226, CFSTR("bad textRange"));
  }
  editor = self->_editor;
  v8 = objc_msgSend(v4, "range");
  return (id)-[TSDTextInput selectionRectsForRange:](editor, "selectionRectsForRange:", v8, v9);
}

- (CGRect)caretRectForPosition:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect result;

  if (self->_editor)
  {
    objc_opt_class();
    v4 = (void *)TSUDynamicCast();
    if (!v4)
    {
      v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDTextInputResponder caretRectForPosition:]");
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTextInputResponder.m"), 1244, CFSTR("bad text position"));
    }
    -[TSDTextInput firstRectForRange:](self->_editor, "firstRectForRange:", objc_msgSend(v4, "charIndex"), 0);
    x = v15.origin.x;
    y = v15.origin.y;
    width = v15.size.width;
    height = v15.size.height;
    if (!CGRectIsNull(v15))
    {
      v16.origin.x = x;
      v16.origin.y = y;
      v16.size.width = width;
      v16.size.height = height;
      v17.origin.x = round(CGRectGetMidX(v16));
      v17.size.width = 0.0;
      v17.origin.y = y;
      v17.size.height = height;
      v18 = CGRectIntegral(v17);
      x = v18.origin.x;
      y = v18.origin.y;
      width = v18.size.width;
      height = v18.size.height;
    }
  }
  else
  {
    x = *MEMORY[0x24BDBF070];
    y = *(double *)(MEMORY[0x24BDBF070] + 8);
    width = *(double *)(MEMORY[0x24BDBF070] + 16);
    height = *(double *)(MEMORY[0x24BDBF070] + 24);
  }
  v11 = x;
  v12 = y;
  v13 = width;
  v14 = height;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (id)textStylingAtPosition:(id)a3 inDirection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (!a3)
    return 0;
  v5 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  objc_opt_class();
  v6 = (void *)TSUDynamicCast();
  if (!v6)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDTextInputResponder textStylingAtPosition:inDirection:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTextInputResponder.m"), 1272, CFSTR("bad text position"));
  }
  v9 = objc_msgSend(v6, "charIndex");
  v10 = -[TSDTextInput textFontAtCharIndex:](self->_editor, "textFontAtCharIndex:", v9);
  if (v10)
    objc_msgSend(v5, "setObject:forKey:", v10, *MEMORY[0x24BDF65F8]);
  v11 = -[TSDTextInput textColorAtCharIndex:](self->_editor, "textColorAtCharIndex:", v9);
  if (v11)
    objc_msgSend(v5, "setObject:forKey:", v11, *MEMORY[0x24BDF6600]);
  return v5;
}

- (id)keyCommands
{
  id v3;
  id v4;

  if (keyCommands_s_globalKeyCommandsOnce != -1)
    dispatch_once(&keyCommands_s_globalKeyCommandsOnce, &__block_literal_global_38);
  v3 = objc_alloc(MEMORY[0x24BDBCEB8]);
  v4 = (id)objc_msgSend(v3, "initWithArray:", keyCommands_s_globalKeyCommands);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "addObjectsFromArray:", -[TSDTextInput keyCommands](self->_editor, "keyCommands"));
  return v4;
}

id __36__TSDTextInputResponder_keyCommands__block_invoke()
{
  uint64_t v0;
  _QWORD v2[6];

  v2[5] = *MEMORY[0x24BDAC8D0];
  v0 = objc_msgSend(MEMORY[0x24BDF6B10], "keyCommandWithInput:modifierFlags:action:", CFSTR("\r"), 0x80000, sel_insertNewlineIgnoringFieldEditor_);
  v2[1] = objc_msgSend(MEMORY[0x24BDF6B10], "keyCommandWithInput:modifierFlags:action:", CFSTR("\r"), 0x100000, sel_endEditingAndSelectParent_, v0);
  v2[2] = objc_msgSend(MEMORY[0x24BDF6B10], "keyCommandWithInput:modifierFlags:action:", CFSTR("\t"), 0x80000, sel_insertTabIgnoringFieldEditor_);
  v2[3] = objc_msgSend(MEMORY[0x24BDF6B10], "keyCommandWithInput:modifierFlags:action:", CFSTR("\t"), 0x20000, sel_insertBacktab_);
  v2[4] = objc_msgSend(MEMORY[0x24BDF6B10], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x24BDF7998], 0, sel_cancelOperation_);
  keyCommands_s_globalKeyCommands = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v2, 5);
  return (id)keyCommands_s_globalKeyCommands;
}

- (void)insertDictationResult:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (-[TSDTextInputResponder p_didEnterUITextInput](self, "p_didEnterUITextInput"))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[TSDTextInput insertDictationResult:](self->_editor, "insertDictationResult:", a3);
    }
    else
    {
      v5 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
      v12 = 0u;
      v13 = 0u;
      v10 = 0u;
      v11 = 0u;
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
      {
        v7 = *(_QWORD *)v11;
        do
        {
          v8 = 0;
          do
          {
            if (*(_QWORD *)v11 != v7)
              objc_enumerationMutation(a3);
            v9 = objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "text");
            if (v9)
              objc_msgSend(v5, "appendString:", v9);
            ++v8;
          }
          while (v6 != v8);
          v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        }
        while (v6);
      }
      if (objc_msgSend(v5, "length"))
        -[TSDTextInputResponder insertText:](self, "insertText:", v5);
    }
    -[TSDTextInputResponder p_willExitUITextInput](self, "p_willExitUITextInput");
  }
}

- (BOOL)p_currentEditorIsNotOnMyCanvas
{
  void *v3;

  v3 = (void *)objc_msgSend(-[TSDTextInputResponder p_ICC](self, "p_ICC"), "editorController");
  if (self->_editor)
    return objc_msgSend((id)objc_msgSend(v3, "currentEditors"), "containsObject:", self->_editor) ^ 1;
  else
    return 0;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  int v7;
  objc_super v9;

  if (-[TSDTextInputResponder p_currentEditorIsNotOnMyCanvas](self, "p_currentEditorIsNotOnMyCanvas")
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = -[TSDTextInput canPerformEditorAction:withSender:](self->_editor, "canPerformEditorAction:withSender:", a3, a4);
    if (v7 == 1)
      return v7;
  }
  else if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[TSDTextInputResponder p_ICC](self, "p_ICC"), "layerHost"), "asiOSCVC"), "canPerformAction:withSender:", a3, a4) & 1) != 0)
  {
    LOBYTE(v7) = 1;
    return v7;
  }
  v7 = -[TSDTextInputResponder p_accessibilityShouldCheckAncestorCanPerformAction:withSender:](self, "p_accessibilityShouldCheckAncestorCanPerformAction:withSender:", a3, a4);
  if (v7)
  {
    v9.receiver = self;
    v9.super_class = (Class)TSDTextInputResponder;
    LOBYTE(v7) = -[TSDTextInputResponder canPerformAction:withSender:](&v9, sel_canPerformAction_withSender_, a3, a4);
  }
  return v7;
}

- (void)selectAll:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0
    && -[TSDTextInput canPerformEditorAction:withSender:](self->_editor, "canPerformEditorAction:withSender:", a2, a3) == 1)
  {
    -[TSDTextInputResponder acceptAutocorrection](self, "acceptAutocorrection");
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6BB0], "sharedMenuController"), "hideMenu");
    -[TSDTextInput selectAll:](self->_editor, "selectAll:", a3);
  }
}

- (void)delete:(id)a3
{
  -[TSDTextInputResponder acceptAutocorrection](self, "acceptAutocorrection");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[TSDTextInput delete:](self->_editor, "delete:", a3);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6BB0], "sharedMenuController"), "hideMenu");
}

- (void)toggleBoldface:(id)a3
{
  if (-[TSDTextInput canPerformEditorAction:withSender:](self->_editor, "canPerformEditorAction:withSender:", a2, a3) == 1)-[TSDTextInput toggleBoldface:](self->_editor, "toggleBoldface:", a3);
}

- (void)toggleItalics:(id)a3
{
  if (-[TSDTextInput canPerformEditorAction:withSender:](self->_editor, "canPerformEditorAction:withSender:", a2, a3) == 1)-[TSDTextInput toggleItalics:](self->_editor, "toggleItalics:", a3);
}

- (void)toggleUnderline:(id)a3
{
  if (-[TSDTextInput canPerformEditorAction:withSender:](self->_editor, "canPerformEditorAction:withSender:", a2, a3) == 1)-[TSDTextInput toggleUnderline:](self->_editor, "toggleUnderline:", a3);
}

- (id)methodSignatureForSelector:(SEL)a3
{
  TSDTextInput *editor;
  objc_super v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TSDTextInputResponder;
  if (-[TSDTextInputResponder respondsToSelector:](&v8, sel_respondsToSelector_))
  {
    v7.receiver = self;
    v7.super_class = (Class)TSDTextInputResponder;
    return -[TSDTextInputResponder methodSignatureForSelector:](&v7, sel_methodSignatureForSelector_, a3);
  }
  else
  {
    if (-[TSDTextInputResponder p_currentEditorIsNotOnMyCanvas](self, "p_currentEditorIsNotOnMyCanvas")
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      editor = self->_editor;
    }
    else
    {
      editor = (TSDTextInput *)objc_msgSend((id)objc_msgSend(-[TSDTextInputResponder p_ICC](self, "p_ICC"), "layerHost"), "asiOSCVC");
    }
    return (id)-[TSDTextInput methodSignatureForSelector:](editor, "methodSignatureForSelector:", a3);
  }
}

- (void)forwardInvocation:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  TSDTextInput *editor;
  id v8;

  v5 = objc_msgSend(a3, "selector");
  v6 = objc_msgSend((id)objc_msgSend(-[TSDTextInputResponder p_ICC](self, "p_ICC"), "layerHost"), "asiOSCVC");
  if (-[TSDTextInputResponder p_currentEditorIsNotOnMyCanvas](self, "p_currentEditorIsNotOnMyCanvas")
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TSDTextInputResponder acceptAutocorrection](self, "acceptAutocorrection");
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6BB0], "sharedMenuController"), "hideMenu");
    editor = self->_editor;
    v8 = a3;
LABEL_6:
    objc_msgSend(v8, "invokeWithTarget:", editor);
    return;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TSDTextInputResponder acceptAutocorrection](self, "acceptAutocorrection");
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6BB0], "sharedMenuController"), "hideMenu");
    v8 = a3;
    editor = (TSDTextInput *)v6;
    goto LABEL_6;
  }
  -[TSDTextInputResponder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", v5);
}

- (void)customAction6:(id)a3
{
  -[TSDTextInput customAction6:](self->_editor, "customAction6:", a3);
}

- (void)customAction7:(id)a3
{
  -[TSDTextInput customAction7:](self->_editor, "customAction7:", a3);
}

- (void)customAction8:(id)a3
{
  -[TSDTextInput customAction8:](self->_editor, "customAction8:", a3);
}

- (int64_t)autocorrectionType
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[TSDTextInput autocorrectionType](self->_editor, "autocorrectionType");
  else
    return 0;
}

- (int64_t)returnKeyType
{
  return -[TSDTextInput returnKeyType](self->_editor, "returnKeyType");
}

- (BOOL)isSecureTextEntry
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[TSDTextInput isSecureTextEntry](self->_editor, "isSecureTextEntry");
  else
    return 0;
}

- (BOOL)hasText
{
  return 1;
}

- (UITextInputTokenizer)tokenizer
{
  UITextInputTokenizer *result;

  if (-[TSDTextInputResponder p_wantRawArrowKeys](self, "p_wantRawArrowKeys"))
    return (UITextInputTokenizer *)-[TSDTextInputResponder arrow_tokenizer](self, "arrow_tokenizer");
  result = (UITextInputTokenizer *)self->_tokenizer;
  if (!result)
  {
    result = -[TSDTextInputTokenizer initWithTextInput:]([TSDTextInputTokenizer alloc], "initWithTextInput:", self);
    self->_tokenizer = (TSDTextInputTokenizer *)result;
  }
  return result;
}

- (id)_textRangeFromNSRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  id v5;
  uint64_t v6;
  uint64_t v7;

  length = a3.length;
  location = a3.location;
  v5 = -[TSDTextInputResponder _selectableText](self, "_selectableText");
  v6 = objc_msgSend(v5, "positionFromPosition:offset:", objc_msgSend(v5, "beginningOfDocument"), location);
  if (!v6)
    v6 = objc_msgSend(v5, "endOfDocument");
  v7 = objc_msgSend(v5, "positionFromPosition:offset:", v6, length);
  if (!v7)
    v7 = objc_msgSend(v5, "endOfDocument");
  return (id)objc_msgSend(v5, "textRangeFromPosition:toPosition:", v6, v7);
}

- (int64_t)_indexForTextPosition:(id)a3
{
  id v4;

  v4 = -[TSDTextInputResponder _selectableText](self, "_selectableText");
  return objc_msgSend(v4, "offsetFromPosition:toPosition:", objc_msgSend(v4, "beginningOfDocument"), a3);
}

- (_NSRange)_nsrangeForTextRange:(id)a3
{
  id v5;
  int64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  _NSRange result;

  v5 = -[TSDTextInputResponder _selectableText](self, "_selectableText");
  v6 = -[TSDTextInputResponder _indexForTextPosition:](self, "_indexForTextPosition:", objc_msgSend(a3, "start"));
  v7 = objc_msgSend(v5, "offsetFromPosition:toPosition:", objc_msgSend(a3, "start"), objc_msgSend(a3, "end"));
  v8 = v6;
  result.length = v7;
  result.location = v8;
  return result;
}

- (_NSRange)_selectedNSRange
{
  id v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  _NSRange result;

  v3 = -[TSDTextInputResponder _selectableText](self, "_selectableText");
  if (v3 && (v4 = objc_msgSend(v3, "selectedTextRange")) != 0)
  {
    v5 = -[TSDTextInputResponder _nsrangeForTextRange:](self, "_nsrangeForTextRange:", v4);
  }
  else
  {
    v6 = 0;
    v5 = 0x7FFFFFFFFFFFFFFFLL;
  }
  result.length = v6;
  result.location = v5;
  return result;
}

- (id)inputView
{
  -[TSDTextInputResponder editor](self, "editor");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (id)-[TSDTextInput inputView](-[TSDTextInputResponder editor](self, "editor"), "inputView");
  else
    return 0;
}

- (id)inputAccessoryView
{
  -[TSDTextInputResponder editor](self, "editor");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (id)-[TSDTextInput inputAccessoryView](-[TSDTextInputResponder editor](self, "editor"), "inputAccessoryView");
  else
    return 0;
}

- (id)p_ICC
{
  UIResponder *nextResponder;
  void *v3;
  void *v4;
  uint64_t v5;

  nextResponder = self->_nextResponder;
  if (!nextResponder)
    return 0;
  do
  {
    objc_opt_class();
    v3 = (void *)TSUDynamicCast();
    if (v3)
      v4 = (void *)objc_msgSend(v3, "controller");
    else
      v4 = 0;
    v5 = -[UIResponder nextResponder](nextResponder, "nextResponder");
    if (!v5)
      break;
    nextResponder = (UIResponder *)v5;
  }
  while (!v4);
  return v4;
}

- (void)p_startDynamicOperation:(id)a3
{
  if (-[TSDTextInputResponder isFirstResponder](self, "isFirstResponder", a3))
  {
    -[TSDTextInputResponder acceptAutocorrection](self, "acceptAutocorrection");
    self->_inDynamicOperation = 1;
  }
}

- (void)p_finishDynamicOperation:(id)a3
{
  if (-[TSDTextInputResponder isFirstResponder](self, "isFirstResponder", a3))
    self->_inDynamicOperation = 0;
}

- (BOOL)p_wantRawArrowKeys
{
  TSDTextInput *editor;

  editor = self->_editor;
  if (editor && self->_editorRespondsToRawArrowKeySelectors)
    return -[TSDTextInput wantsRawArrowKeyEvents](editor, "wantsRawArrowKeyEvents");
  else
    return 0;
}

- (void)p_textChanged
{
  if (!-[TSDTextInputResponder p_isExecutingUITextInput](self, "p_isExecutingUITextInput"))
  {
    objc_msgSend(objc_loadWeak((id *)&self->_inputDelegate), "textWillChange:", self);
    objc_msgSend(objc_loadWeak((id *)&self->_inputDelegate), "textDidChange:", self);
  }
}

- (void)p_editorWillClearSelectionNotification:(id)a3
{
  if ((TSDTextInput *)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", CFSTR("TSDEditorControllerEditorKey")) == self->_editor)-[TSDTextInputResponder acceptAutocorrection](self, "acceptAutocorrection");
}

- (void)p_editorWillStyleTextNotification:(id)a3
{
  if ((TSDTextInput *)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", CFSTR("TSDEditorControllerEditorKey")) == self->_editor)-[TSDTextInputResponder acceptAutocorrection](self, "acceptAutocorrection");
}

- (void)p_editorWillHandleTapNotification:(id)a3
{
  if ((TSDTextInput *)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", CFSTR("TSDEditorControllerEditorKey")) == self->_editor)-[TSDTextInputResponder acceptAutocorrection](self, "acceptAutocorrection");
}

- (void)p_editorSelectionWasForciblyChangedNotification:(id)a3
{
  if ((TSDTextInput *)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", CFSTR("TSDEditorControllerEditorKey")) == self->_editor)-[TSDTextInputResponder p_textChanged](self, "p_textChanged");
}

- (void)editorDidChangeSelection:(id)a3
{
  -[TSDTextInputResponder editorDidChangeSelection:withFlags:](self, "editorDidChangeSelection:withFlags:", a3, 0);
}

- (void)editorDidChangeSelection:(id)a3 withFlags:(unint64_t)a4
{
  int v5;

  if (!self->_pendingEditorChange && self->_editor == a3)
  {
    v5 = a4;
    -[TSDTextInputResponder cancelDelayedResponderChange](self, "cancelDelayedResponderChange");
    self->_preferredEndPosition = NAN;
    self->_preferredStartPosition = NAN;
    if (!self->_isSettingSelectedTextRange)
    {

      self->_referencePosition = 0;
      self->_cachedPosition = 0;
    }
    if (!-[TSDTextInputResponder p_isExecutingUITextInput](self, "p_isExecutingUITextInput"))
    {
      objc_msgSend(objc_loadWeak((id *)&self->_inputDelegate), "selectionWillChange:", self);
      objc_msgSend(objc_loadWeak((id *)&self->_inputDelegate), "selectionDidChange:", self);
    }
    if ((TSUSupportsTextInteraction() & 1) == 0
      && -[TSDTextInputResponder p_requiresFirstResponderChangeForEditor:](self, "p_requiresFirstResponderChangeForEditor:", self->_editor))
    {
      if (-[TSDTextInputResponder isFirstResponder](self, "isFirstResponder")
        && (-[TSDTextInput wantsKeyboard](self->_editor, "wantsKeyboard") & 1) == 0)
      {
        self->_pendingFirstResponderObject = self->_editor;
        -[TSDTextInputResponder performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_p_setFirstResponderAfterDelay, 0, 0.25);
      }
      else if ((v5 & 0x200000) == 0)
      {
        -[TSDTextInputResponder p_setFirstResponder:](self, "p_setFirstResponder:", self->_editor);
      }
    }
    -[TSDTextInputResponder reloadInputViews](self, "reloadInputViews");
  }
}

- (void)p_willShowPopoverNotification:(id)a3
{
  -[TSDTextInputResponder acceptAutocorrection](self, "acceptAutocorrection", a3);
  -[TSDTextInputResponder p_unmarkText](self, "p_unmarkText");
}

- (void)p_willUndoChangeNotification:(id)a3
{
  if (!-[TSDTextInputResponder p_isExecutingUITextInput](self, "p_isExecutingUITextInput", a3))
  {
    -[TSDTextInputResponder acceptAutocorrection](self, "acceptAutocorrection");
    objc_msgSend(objc_loadWeak((id *)&self->_inputDelegate), "textWillChange:", self);
  }
}

- (void)p_didUndoRedoChangeNotification:(id)a3
{
  if (!-[TSDTextInputResponder p_isExecutingUITextInput](self, "p_isExecutingUITextInput", a3))
    objc_msgSend(objc_loadWeak((id *)&self->_inputDelegate), "textDidChange:", self);
}

- (NSDictionary)markedTextStyle
{
  return 0;
}

- (id)closestPositionToPoint:(CGPoint)a3
{
  double y;
  double x;
  unint64_t v6;
  unint64_t v7;
  double v8;
  unsigned __int8 v10;

  y = a3.y;
  x = a3.x;
  v10 = 0;
  if (TSUSupportsTextInteraction()
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && -[TSDTextInput allowAutomaticTextEditingToBeginWithDifferentEditor](self->_editor, "allowAutomaticTextEditingToBeginWithDifferentEditor"))
  {
    -[TSDTextInput beginAutomaticTextEditingIfNeededForPoint:](self->_editor, "beginAutomaticTextEditingIfNeededForPoint:", x, y);
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
    return 0;
  v6 = -[TSDTextInput textLength](self->_editor, "textLength");
  v7 = -[TSDTextInput closestCharIndexToPoint:isAtEndOfLine:](self->_editor, "closestCharIndexToPoint:isAtEndOfLine:", &v10, x, y);
  if (v7 > v6)
    return 0;
  LODWORD(v8) = 2143289344;
  return +[TSDTextPosition textPositionWithCharIndex:eolAffinity:preferredPosition:isPreferredStart:](TSDTextPosition, "textPositionWithCharIndex:eolAffinity:preferredPosition:isPreferredStart:", v7, v10, 0, v8);
}

- (id)closestPositionToPoint:(CGPoint)a3 withinRange:(id)a4
{
  double y;
  double x;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  double v13;
  void *v16;
  uint64_t v17;
  unsigned __int8 v18;

  y = a3.y;
  x = a3.x;
  v18 = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = -[TSDTextInput textLength](self->_editor, "textLength");
    v8 = -[TSDTextInput closestCharIndexToPoint:isAtEndOfLine:](self->_editor, "closestCharIndexToPoint:isAtEndOfLine:", &v18, x, y);
    if (v8 <= v7)
    {
      v9 = v8;
      objc_opt_class();
      v10 = (void *)TSUDynamicCast();
      if (v10)
      {
        v11 = objc_msgSend(v10, "range");
        if (v9 >= v11 && v9 <= v11 + v12)
        {
          LODWORD(v13) = 2143289344;
          return +[TSDTextPosition textPositionWithCharIndex:eolAffinity:preferredPosition:isPreferredStart:](TSDTextPosition, "textPositionWithCharIndex:eolAffinity:preferredPosition:isPreferredStart:", v9, v18, 0, v13);
        }
      }
      else
      {
        v16 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v17 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDTextInputResponder closestPositionToPoint:withinRange:]");
        objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTextInputResponder.m"), 2017, CFSTR("Bad range in -closestPositionToPoint:withinRange:"));
      }
    }
  }
  return 0;
}

- (id)characterRangeAtPoint:(CGPoint)a3
{
  return 0;
}

- (id)positionWithinRange:(id)a3 farthestInDirection:(int64_t)a4
{
  if (-[TSDTextInputResponder p_wantRawArrowKeys](self, "p_wantRawArrowKeys"))
    return (id)-[TSDTextInputResponder arrow_positionWithinRange:farthestInDirection:](self, "arrow_positionWithinRange:farthestInDirection:", a3, a4);
  else
    return 0;
}

- (id)characterRangeByExtendingPosition:(id)a3 inDirection:(int64_t)a4
{
  if (-[TSDTextInputResponder p_wantRawArrowKeys](self, "p_wantRawArrowKeys"))
    return (id)-[TSDTextInputResponder arrow_characterRangeByExtendingPosition:inDirection:](self, "arrow_characterRangeByExtendingPosition:inDirection:", a3, a4);
  else
    return 0;
}

- (int64_t)baseWritingDirectionForPosition:(id)a3 inDirection:(int64_t)a4
{
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  if (-[TSDTextInputResponder p_wantRawArrowKeys](self, "p_wantRawArrowKeys"))
    return -[TSDTextInputResponder arrow_baseWritingDirectionForPosition:inDirection:](self, "arrow_baseWritingDirectionForPosition:inDirection:", a3, a4);
  objc_opt_class();
  v8 = (void *)TSUDynamicCast();
  if (!v8)
  {
    v11 = objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDTextInputResponder baseWritingDirectionForPosition:inDirection:]");
    v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTextInputResponder.m");
    v14 = CFSTR("Bad text position.");
    v15 = (void *)v11;
    v16 = v12;
    v17 = 2073;
LABEL_16:
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, v13, v17, v14);
    return -1;
  }
  v9 = v8;
  if (a4 == 1)
  {
    if (!objc_msgSend(v8, "charIndex"))
    {
      v18 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v19 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDTextInputResponder baseWritingDirectionForPosition:inDirection:]");
      objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTextInputResponder.m"), 2086, CFSTR("Bad text position for writing direction."));
    }
    if (!objc_msgSend(v9, "charIndex"))
      return -1;
    v10 = objc_msgSend(v9, "charIndex") - 1;
    goto LABEL_12;
  }
  if (a4)
  {
    v20 = objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v21 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDTextInputResponder baseWritingDirectionForPosition:inDirection:]");
    v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTextInputResponder.m");
    v14 = CFSTR("Unknown direction.");
    v15 = (void *)v20;
    v16 = v21;
    v17 = 2095;
    goto LABEL_16;
  }
  v10 = objc_msgSend(v8, "charIndex");
LABEL_12:
  if (v10 != 0x7FFFFFFFFFFFFFFFLL && (objc_opt_respondsToSelector() & 1) != 0)
    return -[TSDTextInput writingDirectionForCharIndex:](self->_editor, "writingDirectionForCharIndex:", v10);
  return -1;
}

- (void)makeTextWritingDirectionLeftToRight:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[TSDTextInput reverseDirection:](self->_editor, "reverseDirection:", a3);
}

- (void)makeTextWritingDirectionRightToLeft:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[TSDTextInput reverseDirection:](self->_editor, "reverseDirection:", a3);
}

- (UIView)textInputView
{
  UIView *v4;
  UIView *v5;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (UIView *)-[TSDTextInput textInputView](self->_editor, "textInputView");
  v4 = -[TSDTextInputResponder nextResponder](self, "nextResponder");
  if (!v4)
    return (UIView *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "keyWindow");
  v5 = v4;
  while (1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      break;
    v5 = (UIView *)-[UIView nextResponder](v5, "nextResponder");
    if (!v5)
      return (UIView *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "keyWindow");
  }
  return v5;
}

- (id)superview
{
  return -[UIView superview](-[TSDTextInputResponder textInputView](self, "textInputView"), "superview");
}

- (TSDTextInput)editor
{
  return self->_editor;
}

- (UITextInputDelegate)inputDelegate
{
  return (UITextInputDelegate *)objc_loadWeak((id *)&self->_inputDelegate);
}

- (void)setInputDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_inputDelegate, a3);
}

- (float)preferredStartPosition
{
  return self->_preferredStartPosition;
}

- (void)setPreferredStartPosition:(float)a3
{
  self->_preferredStartPosition = a3;
}

- (float)preferredEndPosition
{
  return self->_preferredEndPosition;
}

- (void)setPreferredEndPosition:(float)a3
{
  self->_preferredEndPosition = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_inputDelegate);
}

@end
