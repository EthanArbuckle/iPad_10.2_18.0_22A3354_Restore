@implementation WFTagField

- (WFTagField)initWithFrame:(CGRect)a3
{
  return -[WFTagField initWithFrame:showsAddButton:](self, "initWithFrame:showsAddButton:", 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (WFTagField)initWithFrame:(CGRect)a3 showsAddButton:(BOOL)a4
{
  _BOOL4 v4;
  WFTagField *v5;
  WFTagTextView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  WFTagField *v13;
  objc_super v15;

  v4 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WFTagField;
  v5 = -[WFTagField initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    v6 = objc_alloc_init(WFTagTextView);
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTagTextView setFont:](v6, "setFont:", v7);

    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTagTextView setBackgroundColor:](v6, "setBackgroundColor:", v8);

    -[WFTagField setTextView:](v5, "setTextView:", v6);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC5190]), "initWithTextView:", v6);
    objc_msgSend(v9, "setTextViewDelegate:", v5);
    -[WFTagField addSubview:](v5, "addSubview:", v9);
    -[WFTagField setScrollView:](v5, "setScrollView:", v9);
    if (v4)
    {
      objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      WFLocalizedString(CFSTR("Add Tag"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setAccessibilityLabel:", v11);

      objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("plus.circle"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setImage:forState:", v12, 0);

      objc_msgSend(v10, "addTarget:action:forControlEvents:", v5, sel_selectTag, 64);
      -[WFTagField addSubview:](v5, "addSubview:", v10);
      -[WFTagField setPlusButton:](v5, "setPlusButton:", v10);

    }
    -[WFTagField updateEditableState](v5, "updateEditableState");
    v13 = v5;

  }
  return v5;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)WFTagField;
  -[WFTagField layoutSubviews](&v17, sel_layoutSubviews);
  -[WFTagField bounds](self, "bounds");
  v4 = v3;
  -[WFTagField plusButton](self, "plusButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 35.0;
  if (!v5)
    v6 = 0.0;
  v7 = v4 - v6;
  -[WFTagField bounds](self, "bounds");
  v9 = v8;
  -[WFTagField scrollView](self, "scrollView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFrame:", 0.0, 0.0, v7, v9);

  -[WFTagField scrollView](self, "scrollView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v13 = v12 + 5.0;
  -[WFTagField bounds](self, "bounds");
  v15 = v14;
  -[WFTagField plusButton](self, "plusButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFrame:", v13, 0.0, 30.0, v15);

}

- (void)setTags:(id)a3
{
  id v4;
  NSString *v5;
  NSString *tags;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v4 = a3;
  v5 = (NSString *)objc_msgSend(v4, "copy");
  tags = self->_tags;
  self->_tags = v5;

  -[WFTagField textView](self, "textView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "typingAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  WFAttributedTextFromSerializedTagString(v4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFTagField textView](self, "textView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAttributedText:", v9);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x24BEBE988];
  -[WFTagField textView](self, "textView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "postNotificationName:object:", v12, v13);

  -[WFTagField textView](self, "textView");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "updateTextAttachments");

}

- (NSString)placeholder
{
  void *v2;
  void *v3;

  -[WFTagField textView](self, "textView");
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
  -[WFTagField textView](self, "textView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPlaceholder:", v4);

}

- (int64_t)keyboardType
{
  void *v2;
  int64_t v3;

  -[WFTagField textView](self, "textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "keyboardType");

  return v3;
}

- (void)setKeyboardType:(int64_t)a3
{
  id v4;

  -[WFTagField textView](self, "textView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setKeyboardType:", a3);

}

- (int64_t)keyboardAppearance
{
  void *v2;
  int64_t v3;

  -[WFTagField textView](self, "textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "keyboardAppearance");

  return v3;
}

- (void)setKeyboardAppearance:(int64_t)a3
{
  id v4;

  -[WFTagField textView](self, "textView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setKeyboardAppearance:", a3);

}

- (int64_t)textAlignment
{
  void *v2;
  int64_t v3;

  -[WFTagField textView](self, "textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "textAlignment");

  return v3;
}

- (void)setTextAlignment:(int64_t)a3
{
  id v4;

  -[WFTagField textView](self, "textView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextAlignment:", a3);

}

- (void)setAllowsTextEntry:(BOOL)a3
{
  self->_allowsTextEntry = a3;
  -[WFTagField updateEditableState](self, "updateEditableState");
}

- (void)setEditable:(BOOL)a3
{
  self->_editable = a3;
  -[WFTagField updateEditableState](self, "updateEditableState");
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

  if (-[WFTagField isEditable](self, "isEditable"))
  {
    if (-[WFTagField allowsTextEntry](self, "allowsTextEntry"))
    {
      v3 = 1;
    }
    else
    {
      -[WFTagField tags](self, "tags");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v4, "length") != 0;

    }
  }
  else
  {
    v3 = 0;
  }
  -[WFTagField textView](self, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEditable:", v3);

  -[WFTagField textView](self, "textView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSelectable:", v3);

  v7 = -[WFTagField isEditable](self, "isEditable");
  -[WFTagField plusButton](self, "plusButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnabled:", v7);

  -[WFTagField scrollView](self, "scrollView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setUserInteractionEnabled:", v3);

}

- (BOOL)tokenizeFreeTextFromRange:(_NSRange)a3
{
  NSUInteger location;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  BOOL v17;
  WFTagTextAttachment *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v29[5];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;

  location = a3.location;
  -[WFTagField textView](self, "textView", a3.location, a3.length);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributedText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  v30 = 0;
  v31 = &v30;
  v32 = 0x3010000000;
  v34 = 0;
  v35 = 0;
  v33 = &unk_226909C59;
  -[WFTagField textView](self, "textView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "attributedText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x24BEBB318];
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __40__WFTagField_tokenizeFreeTextFromRange___block_invoke;
  v29[3] = &unk_24EE25588;
  v29[4] = &v30;
  objc_msgSend(v9, "enumerateAttribute:inRange:options:usingBlock:", v10, 0, v7, 0, v29);

  if (location <= v31[5] + v31[4])
  {
    v17 = 0;
  }
  else
  {
    -[WFTagField textView](self, "textView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "attributedText");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");

    v14 = v31[5] + v31[4];
    v16 = v7 - v14;
    v15 = v7 == v14;
    v17 = v7 != v14;
    if (!v15)
    {
      v18 = -[WFValueTextAttachment initWithData:ofType:]([WFTagTextAttachment alloc], "initWithData:ofType:", 0, 0);
      objc_msgSend(v13, "attributedSubstringFromRange:", v14, v16);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "string");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFValueTextAttachment setStringValue:](v18, "setStringValue:", v20);

      objc_msgSend(MEMORY[0x24BDD1458], "attributedStringWithAttachment:", v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "replaceCharactersInRange:withAttributedString:", v14, v16, v21);

      -[WFTagField textView](self, "textView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "typingAttributes");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addAttributes:range:", v23, 0, objc_msgSend(v13, "length"));

      -[WFTagField textView](self, "textView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setAttributedText:", v13);

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFTagField textView](self, "textView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "postNotificationName:object:", *MEMORY[0x24BEBE988], v26);

      -[WFTagField textView](self, "textView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "updateTextAttachments");

      -[WFTagField updateTags](self, "updateTags");
    }

  }
  _Block_object_dispose(&v30, 8);
  return v17;
}

- (void)textViewDidEndEditing:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id v6;

  -[WFTagField textView](self, "textView", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v6, "selectedRange");
  -[WFTagField tokenizeFreeTextFromRange:](self, "tokenizeFreeTextFromRange:", v4, v5);

}

- (void)textViewDidChangeSelection:(id)a3
{
  void *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  id v21;

  v21 = a3;
  -[WFTagField textView](self, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateTextAttachments");

  v5 = -[WFTagField selectedRange](self, "selectedRange");
  v6 = objc_msgSend(v21, "selectedRange");
  -[WFTagField setSelectedRange:](self, "setSelectedRange:", v6, v7);
  v8 = -[WFTagField selectedRange](self, "selectedRange");
  objc_msgSend(v21, "selectedTextRange");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 >= v5)
    objc_msgSend(v9, "end");
  else
    objc_msgSend(v9, "start");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "caretRectForPosition:", v11);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[WFTagField scrollView](self, "scrollView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "scrollRectToVisible:animated:", 0, v13, v15, v17, v19);

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
  void *v24;
  uint64_t v25;
  _QWORD v26[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[5];

  length = a4.length;
  location = a4.location;
  v9 = a3;
  v10 = a5;
  objc_msgSend(MEMORY[0x24BDD14A8], "newlineCharacterSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "rangeOfCharacterFromSet:options:", v11, 0);

  if (v12 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (!-[WFTagField tokenizeFreeTextFromRange:](self, "tokenizeFreeTextFromRange:", location, length))
      objc_msgSend(v9, "resignFirstResponder");
    goto LABEL_10;
  }
  objc_msgSend(v9, "selectedRange");
  v13 = (uint64_t *)MEMORY[0x24BEBB318];
  v14 = MEMORY[0x24BDAC760];
  if (v15 || objc_msgSend(v10, "length"))
    goto LABEL_4;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  LOBYTE(v30) = 0;
  objc_msgSend(v9, "attributedText");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = *v13;
  v33[0] = v14;
  v33[1] = 3221225472;
  v33[2] = __63__WFTagField_textView_shouldChangeTextInRange_replacementText___block_invoke;
  v33[3] = &unk_24EE25588;
  v33[4] = &v27;
  objc_msgSend(v24, "enumerateAttribute:inRange:options:usingBlock:", v25, location, length, 0, v33);

  if (*((_BYTE *)v28 + 24))
  {
    objc_msgSend(v9, "setSelectedRange:", location, length);
    _Block_object_dispose(&v27, 8);
LABEL_10:
    v22 = 0;
    goto LABEL_13;
  }
  _Block_object_dispose(&v27, 8);
LABEL_4:
  -[WFTagField textView](self, "textView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "attributedText");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "length");

  v27 = 0;
  v28 = &v27;
  v29 = 0x3010000000;
  v31 = 0;
  v32 = 0;
  v30 = &unk_226909C59;
  -[WFTagField textView](self, "textView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "attributedText");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = *v13;
  v26[0] = v14;
  v26[1] = 3221225472;
  v26[2] = __63__WFTagField_textView_shouldChangeTextInRange_replacementText___block_invoke_2;
  v26[3] = &unk_24EE25588;
  v26[4] = &v27;
  objc_msgSend(v20, "enumerateAttribute:inRange:options:usingBlock:", v21, 0, v18, 0, v26);

  v22 = !objc_msgSend(v10, "length")
     || -[WFTagField allowsTextEntry](self, "allowsTextEntry") && location >= v28[5] + v28[4];
  _Block_object_dispose(&v27, 8);
LABEL_13:

  return v22;
}

- (void)textViewDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  objc_msgSend(v4, "attributedText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  v10 = 0;
  v11 = &v10;
  v12 = 0x3010000000;
  v14 = 0;
  v15 = 0;
  v13 = &unk_226909C59;
  objc_msgSend(v4, "attributedText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BEBB318];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __32__WFTagField_textViewDidChange___block_invoke;
  v9[3] = &unk_24EE25588;
  v9[4] = &v10;
  objc_msgSend(v7, "enumerateAttribute:inRange:options:usingBlock:", v8, 0, v6, 0, v9);

  if (v6 == v11[5] + v11[4])
    -[WFTagField updateTags](self, "updateTags");
  _Block_object_dispose(&v10, 8);

}

- (id)containingViewController
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[WFTagField delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[WFTagField delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewControllerContainingTagField:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)selectTag
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  WFTagPickerViewController *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  WFTagPickerViewController *v15;

  -[WFTagField textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "selectedRange");
  -[WFTagField tokenizeFreeTextFromRange:](self, "tokenizeFreeTextFromRange:", v4, v5);

  -[WFTagField textView](self, "textView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resignFirstResponder");

  v7 = [WFTagPickerViewController alloc];
  -[WFTagField fieldTitle](self, "fieldTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTagField suggestedTags](self, "suggestedTags");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[WFTagPickerViewController initWithTitle:tags:](v7, "initWithTitle:tags:", v8, v9);

  -[WFTagPickerViewController setDelegate:](v15, "setDelegate:", self);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v15);
  objc_msgSend(v10, "setModalPresentationStyle:", 7);
  -[WFTagField containingViewController](self, "containingViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "presentViewController:animated:completion:", v10, 1, 0);

  objc_msgSend(v10, "popoverPresentationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPermittedArrowDirections:", 3);
  -[WFTagField plusButton](self, "plusButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSourceView:", v13);

  -[WFTagField plusButton](self, "plusButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  objc_msgSend(v12, "setSourceRect:");

}

- (void)insertTag:(id)a3
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
  WFTagTextAttachment *v22;

  v4 = a3;
  v22 = -[WFValueTextAttachment initWithData:ofType:]([WFTagTextAttachment alloc], "initWithData:ofType:", 0, 0);
  -[WFValueTextAttachment setStringValue:](v22, "setStringValue:", v4);

  -[WFTagField textView](self, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1458], "attributedStringWithAttachment:", v22);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "insertAttributedString:atIndex:", v7, -[WFTagField selectedRange](self, "selectedRange"));

  -[WFTagField textView](self, "textView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textStorage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTagField textView](self, "textView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "typingAttributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAttributes:range:", v11, -[WFTagField selectedRange](self, "selectedRange"), 1);

  v12 = -[WFTagField selectedRange](self, "selectedRange") + 1;
  -[WFTagField textView](self, "textView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setSelectedRange:", v12, 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *MEMORY[0x24BEBE988];
  -[WFTagField textView](self, "textView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "postNotificationName:object:", v15, v16);

  -[WFTagField scrollView](self, "scrollView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTagField textView](self, "textView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTagField textView](self, "textView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "selectedTextRange");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "end");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "caretRectForPosition:", v21);
  objc_msgSend(v17, "scrollRectToVisible:animated:", 0);

  -[WFTagField updateTags](self, "updateTags");
}

- (void)updateTags
{
  void *v3;
  void *v4;
  void *v5;
  void (**updateBlock)(id, id);
  id v7;

  -[WFTagField textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributedText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WFSerializedTagStringFromAttributedText(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTagField setTags:](self, "setTags:", v5);

  -[WFTagField updateEditableState](self, "updateEditableState");
  updateBlock = (void (**)(id, id))self->_updateBlock;
  if (updateBlock)
  {
    -[WFTagField tags](self, "tags");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    updateBlock[2](updateBlock, v7);

  }
}

- (void)tagPicker:(id)a3 didSelectTags:(id)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(a3, "presentingViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, 0);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        -[WFTagField insertTag:](self, "insertTag:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++), (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void)tagPickerDidCancel:(id)a3
{
  id v3;

  objc_msgSend(a3, "presentingViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (NSString)tags
{
  return self->_tags;
}

- (NSString)fieldTitle
{
  return self->_fieldTitle;
}

- (void)setFieldTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (WFTagFieldDelegate)delegate
{
  return (WFTagFieldDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)suggestedTags
{
  return self->_suggestedTags;
}

- (void)setSuggestedTags:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 472);
}

- (WFTagTextView)textView
{
  return (WFTagTextView *)objc_loadWeakRetained((id *)&self->_textView);
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

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_plusButton);
  objc_destroyWeak((id *)&self->_scrollView);
  objc_destroyWeak((id *)&self->_textView);
  objc_storeStrong(&self->_updateBlock, 0);
  objc_storeStrong((id *)&self->_suggestedTags, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_fieldTitle, 0);
  objc_storeStrong((id *)&self->_tags, 0);
}

uint64_t __32__WFTagField_textViewDidChange___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
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

uint64_t __63__WFTagField_textView_shouldChangeTextInRange_replacementText___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2 != 0;
  *a5 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

uint64_t __63__WFTagField_textView_shouldChangeTextInRange_replacementText___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
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

uint64_t __40__WFTagField_tokenizeFreeTextFromRange___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
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

@end
