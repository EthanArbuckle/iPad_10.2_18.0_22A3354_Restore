@implementation _UIInputViewControllerState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)stateForKeyboardState:(id)a3
{
  id v3;
  _UIInputViewControllerState *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = objc_alloc_init(_UIInputViewControllerState);
  objc_msgSend(v3, "documentState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIInputViewControllerState setDocumentState:](v4, "setDocumentState:", v5);

  objc_msgSend(v3, "textInputTraits");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIInputViewControllerState setTextInputTraits:](v4, "setTextInputTraits:", v6);

  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "documentInputMode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIInputViewControllerState setDocumentInputMode:](v4, "setDocumentInputMode:", v8);

  objc_msgSend(v3, "documentIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIInputViewControllerState setDocumentIdentifier:](v4, "setDocumentIdentifier:", v9);
  -[_UIInputViewControllerState setNeedsInputModeSwitchKey:](v4, "setNeedsInputModeSwitchKey:", UIInputViewControllerRequiresInputModeSwitchKey());
  return v4;
}

- (void)createDocumentStateIfNecessary
{
  void *v3;
  void *v4;

  -[_UIInputViewControllerState documentState](self, "documentState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBDB78]), "initWithContextBefore:markedText:selectedText:contextAfter:selectedRangeInMarkedText:", &stru_1E16EDF20, 0, &stru_1E16EDF20, &stru_1E16EDF20, 0x7FFFFFFFFFFFFFFFLL, 0);
    -[_UIInputViewControllerState setDocumentState:](self, "setDocumentState:", v4);

    -[_UIInputViewControllerState setNeedsInputModeSwitchKey:](self, "setNeedsInputModeSwitchKey:", UIInputViewControllerRequiresInputModeSwitchKey());
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  _UIInputViewControllerState *v4;
  uint64_t v5;
  TIDocumentState *documentState;
  uint64_t v7;
  TITextInputTraits *textInputTraits;
  uint64_t v9;
  UITextInputMode *documentInputMode;
  uint64_t v11;
  NSUUID *documentIdentifier;

  v4 = objc_alloc_init(_UIInputViewControllerState);
  if (v4)
  {
    v5 = -[TIDocumentState copy](self->_documentState, "copy");
    documentState = v4->_documentState;
    v4->_documentState = (TIDocumentState *)v5;

    v7 = -[TITextInputTraits copy](self->_textInputTraits, "copy");
    textInputTraits = v4->_textInputTraits;
    v4->_textInputTraits = (TITextInputTraits *)v7;

    v9 = -[UITextInputMode copy](self->_documentInputMode, "copy");
    documentInputMode = v4->_documentInputMode;
    v4->_documentInputMode = (UITextInputMode *)v9;

    v11 = -[NSUUID copy](self->_documentIdentifier, "copy");
    documentIdentifier = v4->_documentIdentifier;
    v4->_documentIdentifier = (NSUUID *)v11;

    v4->_needsInputModeSwitchKey = self->_needsInputModeSwitchKey;
  }
  return v4;
}

- (_UIInputViewControllerState)initWithCoder:(id)a3
{
  id v4;
  _UIInputViewControllerState *v5;
  uint64_t v6;
  TIDocumentState *documentState;
  uint64_t v8;
  TITextInputTraits *textInputTraits;
  uint64_t v10;
  UITextInputMode *documentInputMode;
  uint64_t v12;
  NSUUID *documentIdentifier;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_UIInputViewControllerState;
  v5 = -[_UIInputViewControllerState init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("documentState"));
    v6 = objc_claimAutoreleasedReturnValue();
    documentState = v5->_documentState;
    v5->_documentState = (TIDocumentState *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("textInputTraits"));
    v8 = objc_claimAutoreleasedReturnValue();
    textInputTraits = v5->_textInputTraits;
    v5->_textInputTraits = (TITextInputTraits *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("documentInputMode"));
    v10 = objc_claimAutoreleasedReturnValue();
    documentInputMode = v5->_documentInputMode;
    v5->_documentInputMode = (UITextInputMode *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("documentIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    documentIdentifier = v5->_documentIdentifier;
    v5->_documentIdentifier = (NSUUID *)v12;

    v5->_needsInputModeSwitchKey = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("needsInputModeSwitchKey"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  TIDocumentState *documentState;
  TITextInputTraits *textInputTraits;
  UITextInputMode *documentInputMode;
  NSUUID *documentIdentifier;
  id v9;

  v4 = a3;
  documentState = self->_documentState;
  v9 = v4;
  if (documentState)
  {
    objc_msgSend(v4, "encodeObject:forKey:", documentState, CFSTR("documentState"));
    v4 = v9;
  }
  textInputTraits = self->_textInputTraits;
  if (textInputTraits)
  {
    objc_msgSend(v9, "encodeObject:forKey:", textInputTraits, CFSTR("textInputTraits"));
    v4 = v9;
  }
  documentInputMode = self->_documentInputMode;
  if (documentInputMode)
  {
    objc_msgSend(v9, "encodeObject:forKey:", documentInputMode, CFSTR("documentInputMode"));
    v4 = v9;
  }
  documentIdentifier = self->_documentIdentifier;
  if (documentIdentifier)
  {
    objc_msgSend(v9, "encodeObject:forKey:", documentIdentifier, CFSTR("documentIdentifier"));
    v4 = v9;
  }
  if (self->_needsInputModeSwitchKey)
  {
    objc_msgSend(v9, "encodeBool:forKey:", 1, CFSTR("needsInputModeSwitchKey"));
    v4 = v9;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  _BOOL4 v18;
  int v19;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    -[_UIInputViewControllerState documentState](self, "documentState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "documentState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

    if (!v8)
      goto LABEL_8;
    -[_UIInputViewControllerState textInputTraits](self, "textInputTraits");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "textInputTraits");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_8;
    -[_UIInputViewControllerState documentInputMode](self, "documentInputMode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "documentInputMode");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqual:", v13);

    if (!v14)
      goto LABEL_8;
    -[_UIInputViewControllerState documentIdentifier](self, "documentIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "documentIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (v17)
    {
      v18 = -[_UIInputViewControllerState needsInputModeSwitchKey](self, "needsInputModeSwitchKey");
      v19 = v18 ^ objc_msgSend(v5, "needsInputModeSwitchKey") ^ 1;
    }
    else
    {
LABEL_8:
      LOBYTE(v19) = 0;
    }

  }
  else
  {
    LOBYTE(v19) = 0;
  }

  return v19;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  const __CFString *v9;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@: %p"), objc_opt_class(), self);
  -[_UIInputViewControllerState documentState](self, "documentState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; documentState = %@"), v4);

  -[_UIInputViewControllerState textInputTraits](self, "textInputTraits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; textInputTraits = %@"), v5);

  -[_UIInputViewControllerState documentInputMode](self, "documentInputMode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; documentInputMode = %@"), v6);

  -[_UIInputViewControllerState documentIdentifier](self, "documentIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; documentIdentifier = %@"), v7);

  v8 = -[_UIInputViewControllerState needsInputModeSwitchKey](self, "needsInputModeSwitchKey");
  v9 = CFSTR("NO");
  if (v8)
    v9 = CFSTR("YES");
  objc_msgSend(v3, "appendFormat:", CFSTR("; needsInputModeSwitchKey = %@"), v9);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (TIDocumentState)documentState
{
  return self->_documentState;
}

- (void)setDocumentState:(id)a3
{
  objc_storeStrong((id *)&self->_documentState, a3);
}

- (TITextInputTraits)textInputTraits
{
  return self->_textInputTraits;
}

- (void)setTextInputTraits:(id)a3
{
  objc_storeStrong((id *)&self->_textInputTraits, a3);
}

- (UITextInputMode)documentInputMode
{
  return self->_documentInputMode;
}

- (void)setDocumentInputMode:(id)a3
{
  objc_storeStrong((id *)&self->_documentInputMode, a3);
}

- (NSUUID)documentIdentifier
{
  return self->_documentIdentifier;
}

- (void)setDocumentIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)needsInputModeSwitchKey
{
  return self->_needsInputModeSwitchKey;
}

- (void)setNeedsInputModeSwitchKey:(BOOL)a3
{
  self->_needsInputModeSwitchKey = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentIdentifier, 0);
  objc_storeStrong((id *)&self->_documentInputMode, 0);
  objc_storeStrong((id *)&self->_textInputTraits, 0);
  objc_storeStrong((id *)&self->_documentState, 0);
}

@end
