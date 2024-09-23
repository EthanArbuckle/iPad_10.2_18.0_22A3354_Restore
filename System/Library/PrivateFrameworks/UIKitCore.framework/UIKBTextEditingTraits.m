@implementation UIKBTextEditingTraits

+ (UIKBTextEditingTraits)traitsWithResponder:(id)a3 keyMaskFlags:(unint64_t)a4
{
  id v5;
  UIKBTextEditingTraits *v6;
  id v7;
  UIKBTextEditingTraits *v8;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  v6 = [UIKBTextEditingTraits alloc];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__UIKBTextEditingTraits_traitsWithResponder_keyMaskFlags___block_invoke;
  v10[3] = &unk_1E16D7178;
  v11 = v5;
  v7 = v5;
  v8 = -[UIKBTextEditingTraits initWithResponder:canRespondBlock:keyMaskFlags:sender:](v6, "initWithResponder:canRespondBlock:keyMaskFlags:sender:", v7, v10, a4, 0);

  return v8;
}

- (UIKBTextEditingTraits)initWithResponder:(id)a3 canRespondBlock:(id)a4 keyMaskFlags:(unint64_t)a5 sender:(id)a6
{
  char v7;
  id v10;
  uint64_t (**v11)(id, char *, _QWORD);
  id v12;
  UIKBTextEditingTraits *v13;
  UIKBTextEditingTraits *v14;
  UIKBTextEditingTraits *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v27;

  v7 = a5;
  v10 = a3;
  v11 = (uint64_t (**)(id, char *, _QWORD))a4;
  v12 = a6;
  v27.receiver = self;
  v27.super_class = (Class)UIKBTextEditingTraits;
  v13 = -[UIKBTextEditingTraits init](&v27, sel_init);
  v14 = v13;
  v15 = 0;
  if (v10 && v13)
  {
    objc_storeWeak((id *)&v13->_firstResponder, v10);
    if ((v7 & 4) != 0
      && +[UIResponder conformsToProtocol:](UIResponder, "conformsToProtocol:", &unk_1EDE22B80))
    {
      v16 = v10;
      if ((objc_opt_respondsToSelector() & 1) == 0)
        goto LABEL_9;
      objc_msgSend(v16, "selectedTextRange");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "start");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
        goto LABEL_9;
      objc_msgSend(v16, "selectedTextRange");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "start");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "textStylingAtPosition:inDirection:", v20, objc_msgSend(v16, "selectionAffinity"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        v14->_supportStyling = 1;
        objc_msgSend(v21, "objectForKey:", *(_QWORD *)off_1E1678D90);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "fontDescriptor");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v14->_isBold = (objc_msgSend(v23, "symbolicTraits") & 2) != 0;

        objc_msgSend(v22, "fontDescriptor");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v14->_isItalicized = objc_msgSend(v24, "symbolicTraits") & 1;

        objc_msgSend(v21, "objectForKey:", *(_QWORD *)off_1E1679240);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v14->_isUnderlined = objc_msgSend(v25, "BOOLValue");

        v14->_canToggleBoldface = v11[2](v11, sel_toggleBoldface_, 0);
        v14->_canToggleItalics = v11[2](v11, sel_toggleItalics_, 0);
        v14->_canToggleUnderline = v11[2](v11, sel_toggleUnderline_, 0);

      }
      else
      {
LABEL_9:
        *(_WORD *)&v14->_isBold = 0;
        v14->_isUnderlined = 0;
        *(_DWORD *)&v14->_canToggleBoldface = 0;
      }

    }
    if ((v7 & 2) != 0)
    {
      v14->_canCut = ((uint64_t (**)(id, char *, id))v11)[2](v11, sel_cut_, v12);
      v14->_canCopy = ((uint64_t (**)(id, char *, id))v11)[2](v11, sel_copy_, v12);
      v14->_canPaste = ((uint64_t (**)(id, char *, id))v11)[2](v11, sel_paste_, v12);
    }
    v14->_canMoveCursorLeft = v7 & 1;
    v14->_canMoveCursorRight = v7 & 1;
    v15 = v14;
  }

  return v15;
}

uint64_t __58__UIKBTextEditingTraits_traitsWithResponder_keyMaskFlags___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "canPerformAction:withSender:", a2, a3);
}

+ (id)traitsForEditingInteractionWithFirstResponder:(id)a3 canRespondBlock:(id)a4 keyMaskFlags:(unint64_t)a5
{
  id v7;
  id v8;
  UIKBTextEditingTraits *v9;

  v7 = a4;
  v8 = a3;
  v9 = -[UIKBTextEditingTraits initWithResponder:canRespondBlock:keyMaskFlags:sender:]([UIKBTextEditingTraits alloc], "initWithResponder:canRespondBlock:keyMaskFlags:sender:", v8, v7, a5, CFSTR("UIEditingInteraction"));

  return v9;
}

- (BOOL)canToggleBoldface
{
  return self->_canToggleBoldface;
}

- (BOOL)canToggleItalics
{
  return self->_canToggleItalics;
}

- (BOOL)canToggleUnderline
{
  return self->_canToggleUnderline;
}

- (BOOL)supportStyling
{
  return self->_supportStyling;
}

- (BOOL)canCut
{
  return self->_canCut;
}

- (void)setCanCut:(BOOL)a3
{
  self->_canCut = a3;
}

- (BOOL)canCopy
{
  return self->_canCopy;
}

- (BOOL)canPaste
{
  return self->_canPaste;
}

- (BOOL)canMoveCursorLeft
{
  return self->_canMoveCursorLeft;
}

- (BOOL)canMoveCursorRight
{
  return self->_canMoveCursorRight;
}

- (UIResponder)firstResponder
{
  return (UIResponder *)objc_loadWeakRetained((id *)&self->_firstResponder);
}

- (BOOL)isBold
{
  return self->_isBold;
}

- (BOOL)isItalicized
{
  return self->_isItalicized;
}

- (BOOL)isUnderlined
{
  return self->_isUnderlined;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_firstResponder);
}

@end
