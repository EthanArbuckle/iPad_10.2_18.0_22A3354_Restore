@implementation _UITextDocumentInterface

- (void)setForwardingInterface:(id)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UITextDocumentInterface;
  -[UIInputViewControllerInterface setForwardingInterface:](&v6, sel_setForwardingInterface_, a3);
  -[UIInputViewControllerInterface forwardingInterface](self, "forwardingInterface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITextDocumentInterface _controllerState](self, "_controllerState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_handleInputViewControllerState:", v5);

}

- (_UIInputViewControllerState)_controllerState
{
  _UIInputViewControllerState *controllerState;
  _UIInputViewControllerState *v4;
  _UIInputViewControllerState *v5;

  controllerState = self->_controllerState;
  if (!controllerState)
  {
    v4 = objc_alloc_init(_UIInputViewControllerState);
    v5 = self->_controllerState;
    self->_controllerState = v4;

    controllerState = self->_controllerState;
  }
  -[_UIInputViewControllerState createDocumentStateIfNecessary](controllerState, "createDocumentStateIfNecessary");
  return self->_controllerState;
}

- (void)_createControllerOutputIfNecessary
{
  _UIInputViewControllerOutput *v3;
  _UIInputViewControllerOutput *controllerOutput;

  if (!self->_controllerOutput)
  {
    v3 = objc_alloc_init(_UIInputViewControllerOutput);
    controllerOutput = self->_controllerOutput;
    self->_controllerOutput = v3;

    -[_UIInputViewControllerOutput setSource:](self->_controllerOutput, "setSource:", 5);
  }
}

- (_UIInputViewControllerOutput)_controllerOutput
{
  -[_UITextDocumentInterface _createControllerOutputIfNecessary](self, "_createControllerOutputIfNecessary");
  return self->_controllerOutput;
}

- (TIDocumentState)_documentState
{
  void *v2;
  void *v3;

  -[_UITextDocumentInterface _controllerState](self, "_controllerState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "documentState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (TIDocumentState *)v3;
}

- (TITextInputTraits)_textInputTraits
{
  void *v2;
  void *v3;

  -[_UITextDocumentInterface _controllerState](self, "_controllerState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textInputTraits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (TITextInputTraits *)v3;
}

- (int64_t)autocapitalizationType
{
  void *v2;
  int64_t v3;

  -[_UITextDocumentInterface _textInputTraits](self, "_textInputTraits");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "autocapitalizationType");

  return v3;
}

- (int64_t)autocorrectionType
{
  void *v2;
  int64_t v3;

  -[_UITextDocumentInterface _textInputTraits](self, "_textInputTraits");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "autocorrectionType");

  return v3;
}

- (int64_t)spellCheckingType
{
  void *v2;
  int64_t v3;

  -[_UITextDocumentInterface _textInputTraits](self, "_textInputTraits");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "spellCheckingType");

  return v3;
}

- (int64_t)keyboardType
{
  void *v2;
  void *v3;
  int64_t v4;

  v2 = (void *)MEMORY[0x1E0DBDD20];
  -[_UITextDocumentInterface _textInputTraits](self, "_textInputTraits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "translateToPublicKeyboardType:", objc_msgSend(v3, "keyboardType"));

  return v4;
}

- (int64_t)keyboardAppearance
{
  void *v2;
  int64_t v3;

  -[_UITextDocumentInterface _textInputTraits](self, "_textInputTraits");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[UITextInputTraits translateToPublicUIKeyboardAppearance:](UITextInputTraits, "translateToPublicUIKeyboardAppearance:", objc_msgSend(v2, "keyboardAppearance"));

  return v3;
}

- (int64_t)returnKeyType
{
  void *v2;
  int64_t v3;

  -[_UITextDocumentInterface _textInputTraits](self, "_textInputTraits");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "returnKeyType");

  return v3;
}

- (BOOL)enablesReturnKeyAutomatically
{
  void *v2;
  char v3;

  -[_UITextDocumentInterface _textInputTraits](self, "_textInputTraits");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "enablesReturnKeyAutomatically");

  return v3;
}

- (BOOL)isSecureTextEntry
{
  return 0;
}

- (NSString)textContentType
{
  void *v2;
  void *v3;

  -[_UITextDocumentInterface _textInputTraits](self, "_textInputTraits");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textContentType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (int64_t)smartQuotesType
{
  void *v2;
  int64_t v3;

  -[_UITextDocumentInterface _textInputTraits](self, "_textInputTraits");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "smartQuotesEnabled"))
    v3 = 2;
  else
    v3 = 1;

  return v3;
}

- (int64_t)smartDashesType
{
  void *v2;
  int64_t v3;

  -[_UITextDocumentInterface _textInputTraits](self, "_textInputTraits");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "smartDashesEnabled"))
    v3 = 2;
  else
    v3 = 1;

  return v3;
}

- (int64_t)smartInsertDeleteType
{
  void *v2;
  int64_t v3;

  -[_UITextDocumentInterface _textInputTraits](self, "_textInputTraits");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "smartInsertDeleteEnabled"))
    v3 = 2;
  else
    v3 = 1;

  return v3;
}

- (BOOL)hasText
{
  void *v2;
  char v3;

  -[_UITextDocumentInterface _documentState](self, "_documentState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "documentIsEmpty") ^ 1;

  return v3;
}

- (void)insertText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[_UITextDocumentInterface _willPerformOutputOperation](self, "_willPerformOutputOperation");
  -[_UITextDocumentInterface _documentState](self, "_documentState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "documentStateAfterInsertingText:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITextDocumentInterface _controllerState](self, "_controllerState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDocumentState:", v6);

  -[_UITextDocumentInterface _controllerOutput](self, "_controllerOutput");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "insertText:", v4);

  -[_UITextDocumentInterface _didPerformOutputOperation](self, "_didPerformOutputOperation");
}

- (void)deleteBackward
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[_UITextDocumentInterface _willPerformOutputOperation](self, "_willPerformOutputOperation");
  -[_UITextDocumentInterface _documentState](self, "_documentState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "documentStateAfterDeletingBackward");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITextDocumentInterface _controllerState](self, "_controllerState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDocumentState:", v4);

  -[_UITextDocumentInterface _controllerOutput](self, "_controllerOutput");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deleteBackward");

  -[_UITextDocumentInterface _didPerformOutputOperation](self, "_didPerformOutputOperation");
}

- (void)setMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  -[_UITextDocumentInterface _willPerformOutputOperation](self, "_willPerformOutputOperation");
  -[_UITextDocumentInterface _documentState](self, "_documentState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "documentStateAfterSettingMarkedText:selectedRange:", v7, location, length);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITextDocumentInterface _controllerState](self, "_controllerState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDocumentState:", v9);

  -[_UITextDocumentInterface _controllerOutput](self, "_controllerOutput");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSetMarkedText:", 1);

  -[_UITextDocumentInterface _controllerOutput](self, "_controllerOutput");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setMarkedText:", v7);

  -[_UITextDocumentInterface _controllerOutput](self, "_controllerOutput");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setSelectedRange:", location, length);

  -[_UITextDocumentInterface _didPerformOutputOperation](self, "_didPerformOutputOperation");
}

- (void)unmarkText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[_UITextDocumentInterface _willPerformOutputOperation](self, "_willPerformOutputOperation");
  -[_UITextDocumentInterface _controllerState](self, "_controllerState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "documentState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "documentStateAfterUnmarkingText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITextDocumentInterface _controllerState](self, "_controllerState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDocumentState:", v5);

  -[_UITextDocumentInterface _controllerOutput](self, "_controllerOutput");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUnmarkText:", 1);

  -[_UITextDocumentInterface _didPerformOutputOperation](self, "_didPerformOutputOperation");
}

- (NSString)documentContextBeforeInput
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[_UITextDocumentInterface _documentState](self, "_documentState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contextBeforeInput");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    -[_UITextDocumentInterface _documentState](self, "_documentState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contextBeforeInput");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return (NSString *)v6;
}

- (NSString)documentContextAfterInput
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[_UITextDocumentInterface _documentState](self, "_documentState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contextAfterInput");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    -[_UITextDocumentInterface _documentState](self, "_documentState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contextAfterInput");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return (NSString *)v6;
}

- (UITextInputMode)documentInputMode
{
  void *v2;
  void *v3;

  -[_UITextDocumentInterface _controllerState](self, "_controllerState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "documentInputMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITextInputMode *)v3;
}

- (NSString)selectedText
{
  void *v2;
  void *v3;

  -[_UITextDocumentInterface _documentState](self, "_documentState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)markedText
{
  void *v2;
  void *v3;

  -[_UITextDocumentInterface _documentState](self, "_documentState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "markedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSUUID)documentIdentifier
{
  void *v2;
  void *v3;

  -[_UITextDocumentInterface _controllerState](self, "_controllerState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "documentIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (BOOL)needsInputModeSwitchKey
{
  void *v2;
  char v3;

  -[_UITextDocumentInterface _controllerState](self, "_controllerState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "needsInputModeSwitchKey");

  return v3;
}

- (void)adjustTextPositionByCharacterOffset:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[_UITextDocumentInterface _willPerformOutputOperation](self, "_willPerformOutputOperation");
  if (a3)
  {
    -[_UITextDocumentInterface _documentState](self, "_documentState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "documentStateAfterCursorAdjustment:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextDocumentInterface _controllerState](self, "_controllerState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDocumentState:", v6);

    -[_UITextDocumentInterface _controllerOutput](self, "_controllerOutput");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "adjustTextPositionByCharacterOffset:", a3);

  }
  -[_UITextDocumentInterface _didPerformOutputOperation](self, "_didPerformOutputOperation");
}

- (void)_handleInputViewControllerState:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_UITextDocumentInterface _delegate](self, "_delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_willResetDocumentState");

  -[_UITextDocumentInterface setControllerState:](self, "setControllerState:", v4);
  -[_UITextDocumentInterface _delegate](self, "_delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_didResetDocumentState");

}

- (void)_didPerformOutputOperation
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54___UITextDocumentInterface__didPerformOutputOperation__block_invoke;
  block[3] = &unk_1E16B1B28;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)_setPrimaryLanguage:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[_UITextDocumentInterface _willPerformOutputOperation](self, "_willPerformOutputOperation");
  -[_UITextDocumentInterface _controllerOutput](self, "_controllerOutput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPrimaryLanguage:", v4);

  -[_UITextDocumentInterface _didPerformOutputOperation](self, "_didPerformOutputOperation");
}

- (void)_setShouldDismiss
{
  void *v3;

  -[_UITextDocumentInterface _willPerformOutputOperation](self, "_willPerformOutputOperation");
  -[_UITextDocumentInterface _controllerOutput](self, "_controllerOutput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShouldDismiss:", 1);

  -[_UITextDocumentInterface _didPerformOutputOperation](self, "_didPerformOutputOperation");
}

- (void)_setProceedShouldReturnIfPossibleForASP
{
  void *v3;

  -[_UITextDocumentInterface _willPerformOutputOperation](self, "_willPerformOutputOperation");
  -[_UITextDocumentInterface _controllerOutput](self, "_controllerOutput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProceedShouldReturn:", 1);

  -[_UITextDocumentInterface _didPerformOutputOperation](self, "_didPerformOutputOperation");
}

- (void)_setShouldAdvanceInputMode
{
  void *v3;

  -[_UITextDocumentInterface _willPerformOutputOperation](self, "_willPerformOutputOperation");
  -[_UITextDocumentInterface _controllerOutput](self, "_controllerOutput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShouldAdvanceInputMode:", 1);

  -[_UITextDocumentInterface _didPerformOutputOperation](self, "_didPerformOutputOperation");
}

- (void)_setHasDictation:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  -[_UITextDocumentInterface _willPerformOutputOperation](self, "_willPerformOutputOperation");
  -[_UITextDocumentInterface _controllerOutput](self, "_controllerOutput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHasDictation:", v3);

  -[_UITextDocumentInterface _didPerformOutputOperation](self, "_didPerformOutputOperation");
}

- (void)_setInputModeList:(int64_t)a3 touchBegan:(double)a4 fromLocation:(CGPoint)a5 updatePoint:(CGPoint)a6
{
  double y;
  double x;
  double v8;
  double v9;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  y = a6.y;
  x = a6.x;
  v8 = a5.y;
  v9 = a5.x;
  -[_UITextDocumentInterface _willPerformOutputOperation](self, "_willPerformOutputOperation");
  -[_UITextDocumentInterface _controllerOutput](self, "_controllerOutput");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setInputModeListTouchPhase:", a3);

  -[_UITextDocumentInterface _controllerOutput](self, "_controllerOutput");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setInputModeListTouchBegan:", a4);

  -[_UITextDocumentInterface _controllerOutput](self, "_controllerOutput");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setInputModeListFromLocation:", v9, v8);

  -[_UITextDocumentInterface _controllerOutput](self, "_controllerOutput");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setInputModeListUpdatePoint:", x, y);

  -[_UITextDocumentInterface _didPerformOutputOperation](self, "_didPerformOutputOperation");
}

- (_UITextDocumentInterfaceDelegate)_delegate
{
  return (_UITextDocumentInterfaceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setControllerState:(id)a3
{
  objc_storeStrong((id *)&self->_controllerState, a3);
}

- (void)setControllerOutput:(id)a3
{
  objc_storeStrong((id *)&self->_controllerOutput, a3);
}

- (TIKeyboardOutput)_keyboardOutput
{
  return self->_keyboardOutput;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardOutput, 0);
  objc_storeStrong((id *)&self->_controllerOutput, 0);
  objc_storeStrong((id *)&self->_controllerState, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
