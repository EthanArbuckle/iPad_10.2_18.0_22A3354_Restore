@implementation WFContactField

- (WFContactField)initWithFrame:(CGRect)a3
{
  WFContactField *v3;
  WFContactTextView *v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *entries;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  WFContactField *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)WFContactField;
  v3 = -[WFContactField initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(WFContactTextView);
    -[WFContactField typingAttributes](v3, "typingAttributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContactTextView setTypingAttributes:](v4, "setTypingAttributes:", v5);

    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContactTextView setBackgroundColor:](v4, "setBackgroundColor:", v6);

    -[WFContactTextView setAutocapitalizationType:](v4, "setAutocapitalizationType:", -[WFContactField autocapitalizationType](v3, "autocapitalizationType"));
    -[WFContactTextView textContainer](v4, "textContainer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLineFragmentPadding:", 0.0);

    entries = v3->_entries;
    v3->_entries = (NSArray *)MEMORY[0x24BDBD1A8];

    -[WFContactField setTextView:](v3, "setTextView:", v4);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC5190]), "initWithTextView:", v4);
    objc_msgSend(v9, "setTextViewDelegate:", v3);
    -[WFContactField addSubview:](v3, "addSubview:", v9);
    -[WFContactField setScrollView:](v3, "setScrollView:", v9);
    objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    WFLocalizedString(CFSTR("Add Contact"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAccessibilityLabel:", v11);

    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("plus.circle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setImage:forState:", v12, 0);

    objc_msgSend(v10, "addTarget:action:forControlEvents:", v3, sel_selectContact, 64);
    -[WFContactField addSubview:](v3, "addSubview:", v10);
    -[WFContactField setPlusButton:](v3, "setPlusButton:", v10);
    -[WFContactField updateEditableState](v3, "updateEditableState");
    v13 = v3;

  }
  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  int v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)WFContactField;
  -[WFContactField layoutSubviews](&v16, sel_layoutSubviews);
  objc_msgSend(MEMORY[0x24BE193A0], "sharedContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldReverseLayoutDirection");

  v5 = 0.0;
  if (v4)
    v6 = 35.0;
  else
    v6 = 0.0;
  -[WFContactField bounds](self, "bounds");
  v8 = v7 + -35.0;
  -[WFContactField bounds](self, "bounds");
  v10 = v9;
  -[WFContactField scrollView](self, "scrollView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v6, 0.0, v8, v10);

  if ((v4 & 1) == 0)
  {
    -[WFContactField scrollView](self, "scrollView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    v5 = v12 + 5.0;
  }
  -[WFContactField bounds](self, "bounds");
  v14 = v13;
  -[WFContactField plusButton](self, "plusButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFrame:", v5, 0.0, 30.0, v14);

  if ((v4 & 1) == 0)
}

- (void)setEntries:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  NSArray *entries;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v4 = objc_msgSend(a3, "copy");
  v5 = (void *)v4;
  if (v4)
    v6 = (void *)v4;
  else
    v6 = (void *)MEMORY[0x24BDBD1A8];
  objc_storeStrong((id *)&self->_entries, v6);

  entries = self->_entries;
  -[WFContactField textView](self, "textView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "typingAttributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  WFAttributedStringFromContactEntries(entries, v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContactField textView](self, "textView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAttributedText:", v10);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x24BEBE988];
  -[WFContactField textView](self, "textView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "postNotificationName:object:", v13, v14);

  -[WFContactField textView](self, "textView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "updateTextAttachments");

  -[WFContactField updateEditableState](self, "updateEditableState");
}

- (NSString)placeholder
{
  void *v2;
  void *v3;

  -[WFContactField textView](self, "textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "placeholder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setPlaceholder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFContactField textView](self, "textView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPlaceholder:", v4);

}

- (int64_t)keyboardType
{
  void *v2;
  int64_t v3;

  -[WFContactField textView](self, "textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "keyboardType");

  return v3;
}

- (void)setKeyboardType:(int64_t)a3
{
  id v4;

  -[WFContactField textView](self, "textView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setKeyboardType:", a3);

}

- (int64_t)keyboardAppearance
{
  void *v2;
  int64_t v3;

  -[WFContactField textView](self, "textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "keyboardAppearance");

  return v3;
}

- (void)setKeyboardAppearance:(int64_t)a3
{
  id v4;

  -[WFContactField textView](self, "textView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setKeyboardAppearance:", a3);

}

- (int64_t)textAlignment
{
  void *v2;
  int64_t v3;

  -[WFContactField textView](self, "textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "textAlignment");

  return v3;
}

- (void)setTextAlignment:(int64_t)a3
{
  id v4;

  -[WFContactField textView](self, "textView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextAlignment:", a3);

}

- (NSString)textContentType
{
  void *v2;
  void *v3;

  -[WFContactField textView](self, "textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textContentType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setTextContentType:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFContactField textView](self, "textView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextContentType:", v4);

}

- (NSSet)supportedPersonProperties
{
  void *v2;
  void *v3;

  -[WFContactField textView](self, "textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportedPersonProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (void)setSupportedPersonProperties:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFContactField textView](self, "textView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSupportedPersonProperties:", v4);

}

- (void)setAllowsTextEntry:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;

  v3 = a3;
  self->_allowsTextEntry = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  objc_msgSend(WeakRetained, "setAllowsTextEntry:", v3);

  -[WFContactField updateEditableState](self, "updateEditableState");
}

- (void)setEditable:(BOOL)a3
{
  self->_editable = a3;
  -[WFContactField updateEditableState](self, "updateEditableState");
}

- (void)updateEditableState
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  id v9;

  if (-[WFContactField isEditable](self, "isEditable"))
  {
    if (-[WFContactField allowsTextEntry](self, "allowsTextEntry"))
    {
      v3 = 1;
    }
    else
    {
      -[WFContactField entries](self, "entries");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v4, "count") != 0;

    }
  }
  else
  {
    v3 = 0;
  }
  -[WFContactField textView](self, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEditable:", v3);

  -[WFContactField textView](self, "textView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSelectable:", v3);

  v7 = -[WFContactField isEditable](self, "isEditable");
  -[WFContactField plusButton](self, "plusButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnabled:", v7);

  -[WFContactField scrollView](self, "scrollView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setUserInteractionEnabled:", v3);

}

- (void)updateContactsFromTextField:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  NSArray *v8;
  NSArray *entries;
  void (**updateBlock)(id, NSArray *);
  id v11;

  v3 = a3;
  -[WFContactField textView](self, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributedText");
  v6 = objc_claimAutoreleasedReturnValue();
  WFContactEntriesFromAttributedString((void *)v6);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[WFContactField entries](self, "entries");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v11, "isEqualToArray:", v7);

  if ((v6 & 1) == 0)
  {
    if (v3)
    {
      v8 = (NSArray *)objc_msgSend(v11, "copy");
      entries = self->_entries;
      self->_entries = v8;

    }
    else
    {
      -[WFContactField setEntries:](self, "setEntries:", v11);
    }
    updateBlock = (void (**)(id, NSArray *))self->_updateBlock;
    if (updateBlock)
      updateBlock[2](updateBlock, self->_entries);
  }
  -[WFContactField updateEditableState](self, "updateEditableState");

}

- (id)containingViewController
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[WFContactField delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[WFContactField delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewControllerContainingContactField:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)selectContact
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  void (**v7)(_QWORD);
  id v8;

  -[WFContactField textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "selectedRange");
  v8 = 0;
  v6 = -[WFContactField tokenizeFreeTextFromRange:freeTextModificationBlock:](self, "tokenizeFreeTextFromRange:freeTextModificationBlock:", v4, v5, &v8);
  v7 = (void (**)(_QWORD))v8;

  if (v7)
    v7[2](v7);
  if (v6 != 2)
    -[WFContactField showContactPicker](self, "showContactPicker");

}

- (void)showContactPicker
{
  WFContactPickerCoordinator *v3;
  WFContactPickerCoordinator *contactPicker;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  WFContactPickerCoordinator *v11;
  _QWORD v12[4];
  id v13;
  id location;

  v3 = (WFContactPickerCoordinator *)objc_opt_new();
  contactPicker = self->_contactPicker;
  self->_contactPicker = v3;

  -[WFContactField supportedPersonProperties](self, "supportedPersonProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContactPickerCoordinator setSupportedPersonProperties:](self->_contactPicker, "setSupportedPersonProperties:", v5);

  -[WFContactField containingViewController](self, "containingViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContactPickerCoordinator setPresentingViewController:](self->_contactPicker, "setPresentingViewController:", v6);

  v7 = (void *)MEMORY[0x24BEC5148];
  -[WFContactField plusButton](self, "plusButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContactField plusButton](self, "plusButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  objc_msgSend(v7, "sourceWithView:rect:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContactPickerCoordinator setPresentationSource:](self->_contactPicker, "setPresentationSource:", v10);

  objc_initWeak(&location, self);
  v11 = self->_contactPicker;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __35__WFContactField_showContactPicker__block_invoke;
  v12[3] = &unk_24EE25C48;
  objc_copyWeak(&v13, &location);
  -[WFContactPickerCoordinator presentContactPickerWithCompletionHandler:](v11, "presentContactPickerWithCompletionHandler:", v12);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)insertContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  WFContactTextAttachment *v22;

  v4 = a3;
  v22 = -[WFValueTextAttachment initWithData:ofType:]([WFContactTextAttachment alloc], "initWithData:ofType:", 0, 0);
  -[WFContactTextAttachment setValue:](v22, "setValue:", v4);

  -[WFContactField textView](self, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1458], "attributedStringWithAttachment:", v22);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "insertAttributedString:atIndex:", v7, -[WFContactField selectedRange](self, "selectedRange"));

  -[WFContactField textView](self, "textView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textStorage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContactField textView](self, "textView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "typingAttributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAttributes:range:", v11, -[WFContactField selectedRange](self, "selectedRange"), 1);

  v12 = -[WFContactField selectedRange](self, "selectedRange") + 1;
  -[WFContactField textView](self, "textView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setSelectedRange:", v12, 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *MEMORY[0x24BEBE988];
  -[WFContactField textView](self, "textView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "postNotificationName:object:", v15, v16);

  -[WFContactField scrollView](self, "scrollView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContactField textView](self, "textView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContactField textView](self, "textView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "selectedTextRange");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "end");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "caretRectForPosition:", v21);
  objc_msgSend(v17, "scrollRectToVisible:animated:", 0);

  -[WFContactField updateContactsFromTextField:](self, "updateContactsFromTextField:", 0);
}

- (int64_t)tokenizeFreeTextFromRange:(_NSRange)a3 freeTextModificationBlock:(id *)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id *v26;
  _QWORD v28[9];
  _QWORD v29[9];
  _QWORD v30[5];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;

  -[WFContactField textView](self, "textView", a3.location, a3.length);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attributedText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  v31 = 0;
  v32 = &v31;
  v33 = 0x3010000000;
  v35 = 0;
  v36 = 0;
  v34 = &unk_226909C59;
  -[WFContactField textView](self, "textView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "attributedText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x24BEBB318];
  v12 = MEMORY[0x24BDAC760];
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __70__WFContactField_tokenizeFreeTextFromRange_freeTextModificationBlock___block_invoke;
  v30[3] = &unk_24EE25588;
  v30[4] = &v31;
  objc_msgSend(v10, "enumerateAttribute:inRange:options:usingBlock:", v11, 0, v8, 0, v30);

  -[WFContactField textView](self, "textView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "attributedText");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "mutableCopy");

  v17 = v32[4];
  v16 = v32[5];
  v18 = v16 + v17;
  v19 = v8 - (v16 + v17);
  if (v8 != v16 + v17)
  {
    objc_msgSend(v15, "attributedSubstringFromRange:", v16 + v17, v8 - (v16 + v17));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "string");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFContactField supportedPersonProperties](self, "supportedPersonProperties");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if ((-[WFContactField allowsTextEntry](self, "allowsTextEntry")
       || (objc_msgSend(MEMORY[0x24BEBD538], "currentDevice"),
           v24 = (void *)objc_claimAutoreleasedReturnValue(),
           v25 = objc_msgSend(v24, "userInterfaceIdiom"),
           v24,
           v25 == 1))
      && !-[WFContactField text:containsMatchesForProperties:](self, "text:containsMatchesForProperties:", v22, v23))
    {
      if (!a4)
      {
        v20 = 2;
        goto LABEL_13;
      }
      v29[0] = v12;
      v29[1] = 3221225472;
      v29[2] = __70__WFContactField_tokenizeFreeTextFromRange_freeTextModificationBlock___block_invoke_2;
      v29[3] = &unk_24EE255B0;
      v29[4] = self;
      v29[5] = v22;
      v29[6] = v15;
      v29[7] = v18;
      v29[8] = v19;
      v26 = (id *)v29;
      v20 = 2;
    }
    else
    {
      if (!a4)
      {
        v20 = 1;
        goto LABEL_13;
      }
      v28[0] = v12;
      v28[1] = 3221225472;
      v28[2] = __70__WFContactField_tokenizeFreeTextFromRange_freeTextModificationBlock___block_invoke_3;
      v28[3] = &unk_24EE255B0;
      v28[4] = self;
      v28[5] = v15;
      v28[7] = v18;
      v28[8] = v19;
      v28[6] = v22;
      v26 = (id *)v28;
      v20 = 1;
    }
    *a4 = _Block_copy(v26);

LABEL_13:
    goto LABEL_14;
  }
  v20 = 0;
LABEL_14:

  _Block_object_dispose(&v31, 8);
  return v20;
}

- (void)deleteFreeText:(id)a3 replacementRange:(_NSRange)a4 newValue:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  length = a4.length;
  location = a4.location;
  v8 = a3;
  objc_msgSend(v8, "deleteCharactersInRange:", location, length);
  -[WFContactField textView](self, "textView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAttributedText:", v8);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x24BEBE988];
  -[WFContactField textView](self, "textView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "postNotificationName:object:", v11, v12);

  -[WFContactField textView](self, "textView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "updateTextAttachments");

  -[WFContactField updateContactsFromTextField:](self, "updateContactsFromTextField:", 0);
}

- (void)tokenizeFreeText:(id)a3 replacementRange:(_NSRange)a4 newValue:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  WFContactTextAttachment *v19;

  length = a4.length;
  location = a4.location;
  v9 = a5;
  v10 = a3;
  v19 = -[WFValueTextAttachment initWithData:ofType:]([WFContactTextAttachment alloc], "initWithData:ofType:", 0, 0);
  -[WFValueTextAttachment setStringValue:](v19, "setStringValue:", v9);

  objc_msgSend(MEMORY[0x24BDD1458], "attributedStringWithAttachment:", v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "replaceCharactersInRange:withAttributedString:", location, length, v11);

  -[WFContactField textView](self, "textView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "typingAttributes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addAttributes:range:", v13, 0, objc_msgSend(v10, "length"));

  -[WFContactField textView](self, "textView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAttributedText:", v10);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *MEMORY[0x24BEBE988];
  -[WFContactField textView](self, "textView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "postNotificationName:object:", v16, v17);

  -[WFContactField textView](self, "textView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "updateTextAttachments");

  -[WFContactField updateContactsFromTextField:](self, "updateContactsFromTextField:", 0);
}

- (void)presentContactSelectionActionSheetForText:(id)a3 attributedText:(id)a4 replacementRange:(_NSRange)a5
{
  NSUInteger length;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  __CFString *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  WFContactField *v30;
  NSUInteger v31;
  NSUInteger v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  NSUInteger v58;
  WFContactField *v59;
  NSUInteger location;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id obj;
  void *v66;
  id v67;
  _QWORD v68[5];
  id v69;
  id v70;
  NSUInteger v71;
  NSUInteger v72;
  _QWORD v73[5];
  id v74;
  id v75;
  NSUInteger v76;
  NSUInteger v77;
  _QWORD v78[5];
  id v79;
  id v80;
  void *v81;
  NSUInteger v82;
  NSUInteger v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _QWORD v88[5];
  id v89;
  _BYTE v90[128];
  uint64_t v91;

  length = a5.length;
  location = a5.location;
  v91 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v67 = a4;
  -[WFContactField supportedPersonProperties](self, "supportedPersonProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE193D0], "requiredKeysToFetch");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBAE90], "descriptorForRequiredKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "arrayByAddingObject:", v11);
  v12 = objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "contactsWithName:keysToFetch:", v8, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x24BDAC760];
  v88[0] = MEMORY[0x24BDAC760];
  v88[1] = 3221225472;
  v88[2] = __92__WFContactField_presentContactSelectionActionSheetForText_attributedText_replacementRange___block_invoke;
  v88[3] = &unk_24EE255D8;
  v88[4] = self;
  v16 = v9;
  v89 = v16;
  objc_msgSend(v14, "if_objectsPassingTest:", v88);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v64 = (void *)v12;
  if (objc_msgSend(v16, "containsObject:", &unk_24EE469E0)
    && (objc_msgSend(v16, "containsObject:", &unk_24EE469F8) & 1) != 0)
  {
    v18 = CFSTR("a phone number or email address");
LABEL_8:
    WFLocalizedString(v18);
    v19 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if ((objc_msgSend(v16, "containsObject:", &unk_24EE469E0) & 1) != 0)
  {
    v18 = CFSTR("an email address");
    goto LABEL_8;
  }
  if (objc_msgSend(v16, "containsObject:", &unk_24EE469F8))
  {
    v18 = CFSTR("a phone number");
    goto LABEL_8;
  }
  v19 = 0;
LABEL_9:
  objc_msgSend(MEMORY[0x24BE19370], "alertWithPreferredStyle:", 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)MEMORY[0x24BEC5148];
  -[WFContactField plusButton](self, "plusButton");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "sourceWithView:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setPresentationSource:", v23);

  v24 = (void *)MEMORY[0x24BDD17C8];
  WFLocalizedString(CFSTR("“%1$@” doesn’t look like %2$@. Did you mean to add a contact?"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = (void *)v19;
  objc_msgSend(v24, "localizedStringWithFormat:", v25, v8, v19);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setMessage:", v26);

  v27 = 0x24BE19000uLL;
  objc_msgSend(MEMORY[0x24BE19378], "cancelButtonWithHandler:", 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addButton:", v28);

  v62 = v17;
  v63 = v16;
  v58 = length;
  v59 = self;
  if (objc_msgSend(v17, "count"))
  {
    v66 = v20;
    v29 = v8;
    v30 = self;
    v31 = location;
    v32 = length;
    v86 = 0u;
    v87 = 0u;
    v84 = 0u;
    v85 = 0u;
    obj = v17;
    v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v90, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v85;
      do
      {
        for (i = 0; i != v34; ++i)
        {
          if (*(_QWORD *)v85 != v35)
            objc_enumerationMutation(obj);
          v37 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * i);
          v38 = (void *)MEMORY[0x24BE19600];
          objc_msgSend(v37, "formattedName");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v78[0] = MEMORY[0x24BDAC760];
          v78[1] = 3221225472;
          v78[2] = __92__WFContactField_presentContactSelectionActionSheetForText_attributedText_replacementRange___block_invoke_161;
          v78[3] = &unk_24EE25600;
          v78[4] = v30;
          v79 = v67;
          v82 = location;
          v83 = v32;
          v80 = v29;
          v81 = v37;
          objc_msgSend(v38, "buttonWithTitle:style:handler:", v39, 0, v78);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "addButton:", v40);

        }
        v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v90, 16);
      }
      while (v34);
    }

    v8 = v29;
    v42 = v66;
    v41 = v67;
    v43 = MEMORY[0x24BDAC760];
    v27 = 0x24BE19000;
  }
  else
  {
    v44 = (void *)MEMORY[0x24BE19378];
    WFLocalizedString(CFSTR("Search Contacts"));
    v45 = objc_claimAutoreleasedReturnValue();
    v46 = v15;
    v47 = (void *)v45;
    v73[0] = v46;
    v73[1] = 3221225472;
    v73[2] = __92__WFContactField_presentContactSelectionActionSheetForText_attributedText_replacementRange___block_invoke_2;
    v73[3] = &unk_24EE255B0;
    v73[4] = self;
    v41 = v67;
    v74 = v67;
    v31 = location;
    v76 = location;
    v77 = length;
    v75 = v8;
    objc_msgSend(v44, "buttonWithTitle:style:handler:", v47, 0, v73);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addButton:", v48);

    v43 = MEMORY[0x24BDAC760];
    v42 = v20;
  }
  v49 = *(void **)(v27 + 888);
  v50 = (void *)MEMORY[0x24BDD17C8];
  WFLocalizedString(CFSTR("Use “%@” Anyway"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "localizedStringWithFormat:", v51, v8);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v68[0] = v43;
  v68[1] = 3221225472;
  v68[2] = __92__WFContactField_presentContactSelectionActionSheetForText_attributedText_replacementRange___block_invoke_3;
  v68[3] = &unk_24EE255B0;
  v68[4] = v59;
  v69 = v41;
  v71 = v31;
  v72 = v58;
  v70 = v8;
  v53 = v8;
  v54 = v41;
  objc_msgSend(v49, "buttonWithTitle:style:handler:", v52, 0, v68);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "addButton:", v55);

  -[WFContactField containingViewController](v59, "containingViewController");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  WFUserInterfaceFromViewController();
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "presentAlert:", v42);

}

- (void)chooseMultivalueIndexIfNecessaryForContact:(id)a3 sender:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  WFContactPickerCoordinator *v10;
  WFContactPickerCoordinator *contactPicker;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  WFContactPickerCoordinator *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id location;

  v6 = a3;
  v7 = a4;
  -[WFContactField supportedPersonProperties](self, "supportedPersonProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[WFContactField numberOfValuesForProperties:inContact:](self, "numberOfValuesForProperties:inContact:", v8, v6);

  if (v9 > 1)
  {
    v10 = (WFContactPickerCoordinator *)objc_opt_new();
    contactPicker = self->_contactPicker;
    self->_contactPicker = v10;

    -[WFContactField supportedPersonProperties](self, "supportedPersonProperties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContactPickerCoordinator setSupportedPersonProperties:](self->_contactPicker, "setSupportedPersonProperties:", v12);

    -[WFContactField containingViewController](self, "containingViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContactPickerCoordinator setPresentingViewController:](self->_contactPicker, "setPresentingViewController:", v13);

    v14 = (void *)MEMORY[0x24BEC5148];
    -[WFContactField plusButton](self, "plusButton");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContactField plusButton](self, "plusButton");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bounds");
    objc_msgSend(v14, "sourceWithView:rect:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContactPickerCoordinator setPresentationSource:](self->_contactPicker, "setPresentationSource:", v17);

    objc_initWeak(&location, self);
    v18 = self->_contactPicker;
    objc_msgSend(v6, "contact");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __68__WFContactField_chooseMultivalueIndexIfNecessaryForContact_sender___block_invoke;
    v20[3] = &unk_24EE25C48;
    objc_copyWeak(&v21, &location);
    -[WFContactPickerCoordinator presentHandlePickerForContact:completionHandler:](v18, "presentHandlePickerForContact:completionHandler:", v19, v20);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  else
  {
    -[WFContactField insertContact:](self, "insertContact:", v6);
  }

}

- (BOOL)text:(id)a3 containsMatchesForProperty:(int)a4
{
  id v5;
  char v6;
  BOOL v7;

  v5 = a3;
  switch(a4)
  {
    case 3:
      v6 = objc_msgSend(MEMORY[0x24BE195B0], "stringContainsPhoneNumbers:", v5);
      break;
    case 22:
      v6 = objc_msgSend(MEMORY[0x24BE19660], "stringContainsURLs:", v5);
      break;
    case 4:
      v6 = objc_msgSend(MEMORY[0x24BE194E8], "stringContainsEmailAddresses:", v5);
      break;
    default:
      v7 = 0;
      goto LABEL_9;
  }
  v7 = v6;
LABEL_9:

  return v7;
}

- (BOOL)text:(id)a3 containsMatchesForProperties:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = a4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        if (-[WFContactField text:containsMatchesForProperty:](self, "text:containsMatchesForProperty:", v6, objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "intValue", (_QWORD)v14)))
        {
          v12 = 1;
          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v9)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (unint64_t)numberOfValuesForProperties:(id)a3 inContact:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v5);
        objc_msgSend(v6, "valueForPropertyID:", objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "intValue"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v13 = objc_msgSend(v12, "count");
        else
          v13 = v12 != 0;
        v9 += v13;

      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)textViewDidEndEditing:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  void (**v8)(_QWORD);
  void *v9;
  void *v10;
  void *v11;
  id v12;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  -[WFContactField textView](self, "textView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "selectedRange");
  v12 = 0;
  v7 = -[WFContactField tokenizeFreeTextFromRange:freeTextModificationBlock:](self, "tokenizeFreeTextFromRange:freeTextModificationBlock:", v5, v6, &v12);
  v8 = (void (**)(_QWORD))v12;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = CFSTR("WFContactFieldTokenizationResultNotificationTokenizationResultKey");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("WFContactFieldTokenizationResultNotification"), self, v11);

  if (v8)
    v8[2](v8);

}

- (void)textViewDidChangeSelection:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a3;
  -[WFContactField textView](self, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateTextAttachments");

  v6 = objc_msgSend(v4, "selectedRange");
  v8 = v7;

  -[WFContactField setSelectedRange:](self, "setSelectedRange:", v6, v8);
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  BOOL v22;
  int64_t v23;
  id v24;
  void *v25;
  void *v27;
  uint64_t v28;
  _QWORD v29[5];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[5];
  id v37;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  v10 = a5;
  objc_msgSend(MEMORY[0x24BDD14A8], "newlineCharacterSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "rangeOfCharacterFromSet:options:", v11, 0);

  if (v12 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v37 = 0;
    v23 = -[WFContactField tokenizeFreeTextFromRange:freeTextModificationBlock:](self, "tokenizeFreeTextFromRange:freeTextModificationBlock:", location, length, &v37);
    v24 = v37;
    v25 = v24;
    if (v23 == 1)
    {
      if (v24)
        (*((void (**)(id))v24 + 2))(v24);
    }
    else
    {
      objc_msgSend(v9, "resignFirstResponder");
    }

    goto LABEL_13;
  }
  objc_msgSend(v9, "selectedRange");
  v13 = (uint64_t *)MEMORY[0x24BEBB318];
  v14 = MEMORY[0x24BDAC760];
  if (v15 || objc_msgSend(v10, "length"))
    goto LABEL_4;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  LOBYTE(v33) = 0;
  objc_msgSend(v9, "attributedText");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = *v13;
  v36[0] = v14;
  v36[1] = 3221225472;
  v36[2] = __67__WFContactField_textView_shouldChangeTextInRange_replacementText___block_invoke;
  v36[3] = &unk_24EE25588;
  v36[4] = &v30;
  objc_msgSend(v27, "enumerateAttribute:inRange:options:usingBlock:", v28, location, length, 0, v36);

  if (*((_BYTE *)v31 + 24))
  {
    objc_msgSend(v9, "setSelectedRange:", location, length);
    _Block_object_dispose(&v30, 8);
LABEL_13:
    v22 = 0;
    goto LABEL_16;
  }
  _Block_object_dispose(&v30, 8);
LABEL_4:
  -[WFContactField textView](self, "textView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "attributedText");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "length");

  v30 = 0;
  v31 = &v30;
  v32 = 0x3010000000;
  v34 = 0;
  v35 = 0;
  v33 = &unk_226909C59;
  -[WFContactField textView](self, "textView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "attributedText");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = *v13;
  v29[0] = v14;
  v29[1] = 3221225472;
  v29[2] = __67__WFContactField_textView_shouldChangeTextInRange_replacementText___block_invoke_2;
  v29[3] = &unk_24EE25588;
  v29[4] = &v30;
  objc_msgSend(v20, "enumerateAttribute:inRange:options:usingBlock:", v21, 0, v18, 0, v29);

  v22 = !objc_msgSend(v10, "length")
     || -[WFContactField allowsTextEntry](self, "allowsTextEntry") && location >= v31[5] + v31[4];
  _Block_object_dispose(&v30, 8);
LABEL_16:

  return v22;
}

- (void)textViewDidChange:(id)a3
{
  -[WFContactField updateContactsFromTextField:](self, "updateContactsFromTextField:", 1);
}

- (id)typingAttributes
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v7[0] = *MEMORY[0x24BEBB360];
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  v7[1] = *MEMORY[0x24BEBB368];
  -[WFContactField tintColor](self, "tintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)tintColorDidChange
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFContactField;
  -[WFContactField tintColorDidChange](&v5, sel_tintColorDidChange);
  -[WFContactField typingAttributes](self, "typingAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContactField textView](self, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTypingAttributes:", v3);

}

- (WFContactFieldDelegate)delegate
{
  return (WFContactFieldDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)entries
{
  return self->_entries;
}

- (int64_t)autocorrectionType
{
  return self->_autocorrectionType;
}

- (void)setAutocorrectionType:(int64_t)a3
{
  self->_autocorrectionType = a3;
}

- (int64_t)autocapitalizationType
{
  return self->_autocapitalizationType;
}

- (void)setAutocapitalizationType:(int64_t)a3
{
  self->_autocapitalizationType = a3;
}

- (BOOL)allowsTextEntry
{
  return self->_allowsTextEntry;
}

- (BOOL)isEditable
{
  return self->_editable;
}

- (id)updateBlock
{
  return self->_updateBlock;
}

- (void)setUpdateBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 456);
}

- (WFContactTextView)textView
{
  return (WFContactTextView *)objc_loadWeakRetained((id *)&self->_textView);
}

- (void)setTextView:(id)a3
{
  objc_storeWeak((id *)&self->_textView, a3);
}

- (WFTextScrollView)scrollView
{
  return (WFTextScrollView *)objc_loadWeakRetained((id *)&self->_scrollView);
}

- (void)setScrollView:(id)a3
{
  objc_storeWeak((id *)&self->_scrollView, a3);
}

- (UIButton)plusButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_plusButton);
}

- (void)setPlusButton:(id)a3
{
  objc_storeWeak((id *)&self->_plusButton, a3);
}

- (_NSRange)selectedRange
{
  _NSRange *p_selectedRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_selectedRange = &self->_selectedRange;
  location = self->_selectedRange.location;
  length = p_selectedRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setSelectedRange:(_NSRange)a3
{
  self->_selectedRange = a3;
}

- (BOOL)shouldEndEditing
{
  return self->_shouldEndEditing;
}

- (void)setShouldEndEditing:(BOOL)a3
{
  self->_shouldEndEditing = a3;
}

- (WFContactPickerCoordinator)contactPicker
{
  return self->_contactPicker;
}

- (void)setContactPicker:(id)a3
{
  objc_storeStrong((id *)&self->_contactPicker, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactPicker, 0);
  objc_destroyWeak((id *)&self->_plusButton);
  objc_destroyWeak((id *)&self->_scrollView);
  objc_destroyWeak((id *)&self->_textView);
  objc_storeStrong(&self->_updateBlock, 0);
  objc_storeStrong((id *)&self->_entries, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __67__WFContactField_textView_shouldChangeTextInRange_replacementText___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2 != 0;
  *a5 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

uint64_t __67__WFContactField_textView_shouldChangeTextInRange_replacementText___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  if (a2)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
    if ((unint64_t)(a3 + a4) > *(_QWORD *)(v4 + 40) + *(_QWORD *)(v4 + 32))
    {
      *(_QWORD *)(v4 + 32) = a3;
      *(_QWORD *)(v4 + 40) = a4;
    }
  }
  return result;
}

void __68__WFContactField_chooseMultivalueIndexIfNecessaryForContact_sender___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v4)
    objc_msgSend(WeakRetained, "insertContact:", v4);
  objc_msgSend(WeakRetained, "setContactPicker:", 0);

}

BOOL __92__WFContactField_presentContactSelectionActionSheetForText_attributedText_replacementRange___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "numberOfValuesForProperties:inContact:", *(_QWORD *)(a1 + 40), a2) != 0;
}

void __92__WFContactField_presentContactSelectionActionSheetForText_attributedText_replacementRange___block_invoke_161(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "deleteFreeText:replacementRange:newValue:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 48));
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v2, "plusButton");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chooseMultivalueIndexIfNecessaryForContact:sender:", v3, v4);

}

uint64_t __92__WFContactField_presentContactSelectionActionSheetForText_attributedText_replacementRange___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "showContactPicker");
  return objc_msgSend(*(id *)(a1 + 32), "deleteFreeText:replacementRange:newValue:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48));
}

uint64_t __92__WFContactField_presentContactSelectionActionSheetForText_attributedText_replacementRange___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "tokenizeFreeText:replacementRange:newValue:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48));
}

uint64_t __70__WFContactField_tokenizeFreeTextFromRange_freeTextModificationBlock___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  if (a2)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
    if ((unint64_t)(a3 + a4) > *(_QWORD *)(v4 + 40) + *(_QWORD *)(v4 + 32))
    {
      *(_QWORD *)(v4 + 32) = a3;
      *(_QWORD *)(v4 + 40) = a4;
    }
  }
  return result;
}

uint64_t __70__WFContactField_tokenizeFreeTextFromRange_freeTextModificationBlock___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentContactSelectionActionSheetForText:attributedText:replacementRange:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

uint64_t __70__WFContactField_tokenizeFreeTextFromRange_freeTextModificationBlock___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "tokenizeFreeText:replacementRange:newValue:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48));
}

void __35__WFContactField_showContactPicker__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v4)
    objc_msgSend(WeakRetained, "insertContact:", v4);
  objc_msgSend(WeakRetained, "setContactPicker:", 0);

}

@end
