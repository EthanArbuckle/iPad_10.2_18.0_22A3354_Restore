@implementation UIPasscodeField

+ (double)defaultHeight
{
  void *v2;
  double v3;
  double v4;

  _UIImageWithName(CFSTR("UIPasscodeFieldBackground.png"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "size");
  v4 = v3;

  return v4;
}

+ (Class)textFieldClass
{
  return (Class)objc_opt_class();
}

- (UIPasscodeField)initWithFrame:(CGRect)a3
{
  UIPasscodeField *v3;
  NSMutableString *v4;
  NSMutableString *value;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIPasscodeField;
  v3 = -[UIView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
    value = v3->_value;
    v3->_value = v4;

    v3->_centerHorizontally = 1;
    v3->_keyboardType = 11;
    -[UIView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
  }
  return v3;
}

- (void)setKeyboardType:(int64_t)a3
{
  -[UIPasscodeField setKeyboardType:appearance:](self, "setKeyboardType:appearance:", a3, 0);
}

- (void)setKeyboardType:(int64_t)a3 appearance:(int64_t)a4
{
  -[UIPasscodeField setKeyboardType:appearance:emptyContentReturnKeyType:](self, "setKeyboardType:appearance:emptyContentReturnKeyType:", a3, a4, 0);
}

- (void)setKeyboardType:(int64_t)a3 appearance:(int64_t)a4 emptyContentReturnKeyType:(int)a5
{
  self->_keyboardType = a3;
  self->_keyboardAppearance = a4;
  self->_emptyContentReturnKeyType = a5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("UITextFieldTextDidChangeNotification"), 0);

  v4.receiver = self;
  v4.super_class = (Class)UIPasscodeField;
  -[UIView dealloc](&v4, sel_dealloc);
}

- (void)_updateFields
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  uint64_t v8;
  void *v9;
  int v10;
  UIButton *okButton;
  uint64_t v12;
  int v13;

  v3 = -[NSMutableArray count](self->_entryFields, "count");
  v13 = -[NSMutableString length](self->_value, "length");
  if (v3 >= 1)
  {
    v4 = 0;
    v12 = (v3 - 1);
    v5 = v3;
    do
    {
      -[NSMutableArray objectAtIndex:](self->_entryFields, "objectAtIndex:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = &stru_1E16EDF20;
      if (v4 < v13)
      {
        if (!_updateFields___bullet)
        {
          v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%C"), 10625);
          v9 = (void *)_updateFields___bullet;
          _updateFields___bullet = v8;

        }
        if (v4 != v12 || v13 - (_DWORD)v4 == 1)
        {
          v7 = (__CFString *)(id)_updateFields___bullet;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB37A0], "string");
          v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v10 = v13;
          do
          {
            -[__CFString appendString:](v7, "appendString:", _updateFields___bullet);
            --v10;
          }
          while (v10);
        }
      }
      objc_msgSend(v6, "setText:", v7);

      ++v4;
    }
    while (v4 != v5);
  }
  okButton = self->_okButton;
  if (okButton)
    -[UIButton setEnabled:](okButton, "setEnabled:", v13 > 0);
}

- (BOOL)showsOKButton
{
  return self->_okButton != 0;
}

- (void)setShowsOKButton:(BOOL)a3
{
  UIButton *okButton;
  void *v5;
  void *v6;
  UIButton *v7;
  UIButton *v8;
  UIButton *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  UIButton *v18;
  void *v19;
  UIButton *v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGFloat v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  UIButton *v40;
  CGRect v41;
  CGRect v42;

  if (a3)
  {
    okButton = self->_okButton;
    if (!okButton)
    {
      _UINSLocalizedStringWithDefaultValue(CFSTR("OK"), CFSTR("OK"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = [UIButton alloc];
      v8 = -[UIButton initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      v9 = self->_okButton;
      self->_okButton = v8;

      -[UIButton setTitle:forState:](self->_okButton, "setTitle:forState:", v5, 0);
      _UIImageWithName(CFSTR("UIPasscodeFieldButton.png"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "size");
      objc_msgSend(v10, "stretchableImageWithLeftCapWidth:topCapHeight:", vcvtmd_s64_f64(v11 * 0.5), 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton setBackgroundImage:forState:](self->_okButton, "setBackgroundImage:forState:", v12, 0);
      _UIImageWithName(CFSTR("UIPasscodeFieldButtonPressed.png"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "size");
      objc_msgSend(v13, "stretchableImageWithLeftCapWidth:topCapHeight:", vcvtmd_s64_f64(v14 * 0.5), 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton setBackgroundImage:forState:](self->_okButton, "setBackgroundImage:forState:", v15, 1);
      -[UIButton titleLabel](self->_okButton, "titleLabel");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(off_1E167A828, "boldSystemFontOfSize:", 20.0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setFont:", v17);

      v18 = self->_okButton;
      +[UIColor blackColor](UIColor, "blackColor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton setTitleShadowColor:forState:](v18, "setTitleShadowColor:forState:", v19, 0);

      -[UIButton setTitleColor:forState:](self->_okButton, "setTitleColor:forState:", v6, 2);
      -[UIControl addTarget:action:forControlEvents:](self->_okButton, "addTarget:action:forControlEvents:", self, sel_okButtonClicked_, 64);
      -[UIView sizeToFit](self->_okButton, "sizeToFit");
      v20 = self->_okButton;
      -[UIView bounds](v20, "bounds");
      -[UIButton contentRectForBounds:](v20, "contentRectForBounds:");
      -[UIButton titleRectForContentRect:](v20, "titleRectForContentRect:");
      v22 = v21;
      v24 = v23;
      v26 = v25;
      v28 = v27;
      -[UIView frame](self->_okButton, "frame");
      v30 = v29;
      v32 = v31;
      v41.origin.x = v22;
      v41.origin.y = v24;
      v41.size.width = v26;
      v41.size.height = v28;
      v33 = CGRectGetWidth(v41) + 24.0;
      v42.origin.x = v22;
      v42.origin.y = v24;
      v42.size.width = v26;
      v42.size.height = v28;
      -[UIButton setFrame:](self->_okButton, "setFrame:", v30, v32, v33, CGRectGetHeight(v42) + 16.0);

      okButton = self->_okButton;
    }
    -[UIView frame](okButton, "frame");
    v35 = v34;
    v37 = v36;
    -[UIView bounds](self, "bounds");
    -[UIButton setFrame:](self->_okButton, "setFrame:", v38 - v35 + -7.0, floor((v39 - v37) * 0.5), v35, v37);
    -[UIPasscodeField setNumberOfEntryFields:opaqueBackground:](self, "setNumberOfEntryFields:opaqueBackground:", -[NSMutableArray count](self->_entryFields, "count"), self->_opaqueBackground);
    -[UIView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 1);
    -[UIView addSubview:](self, "addSubview:", self->_okButton);
    -[UIPasscodeField _updateFields](self, "_updateFields");
  }
  else
  {
    -[UIView setUserInteractionEnabled:](self, "setUserInteractionEnabled:");
    -[UIView removeFromSuperview](self->_okButton, "removeFromSuperview");
    v40 = self->_okButton;
    self->_okButton = 0;

  }
}

- (void)setTextCentersHorizontally:(BOOL)a3
{
  if (self->_centerHorizontally != a3)
  {
    self->_centerHorizontally = a3;
    -[UIPasscodeField setNumberOfEntryFields:opaqueBackground:](self, "setNumberOfEntryFields:opaqueBackground:", -[NSMutableArray count](self->_entryFields, "count"), self->_opaqueBackground);
  }
}

- (id)stringValue
{
  return (id)-[NSMutableString copy](self->_value, "copy");
}

- (void)setStringValue:(id)a3
{
  int v4;
  NSMutableString *value;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  const __CFString *v9;
  __CFString *v10;

  v10 = (__CFString *)a3;
  v4 = -[NSMutableArray count](self->_entryFields, "count");
  value = self->_value;
  if (v4 < 2)
  {
    if (v10)
      v9 = v10;
    else
      v9 = &stru_1E16EDF20;
    -[NSMutableString setString:](value, "setString:", v9);
  }
  else
  {
    v6 = -[__CFString length](v10, "length");
    if (v6 >= v4)
      v7 = v4;
    else
      v7 = v6;
    -[__CFString substringToIndex:](v10, "substringToIndex:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableString setString:](value, "setString:", v8);

  }
  -[UIPasscodeField _updateFields](self, "_updateFields");

}

- (void)appendString:(id)a3
{
  int v4;
  NSMutableString *value;
  int v6;
  NSMutableString *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  v4 = -[NSMutableArray count](self->_entryFields, "count");
  value = self->_value;
  if (v4 < 2)
  {
    -[NSMutableString appendString:](value, "appendString:", v11);
  }
  else
  {
    v6 = v4 - -[NSMutableString length](value, "length");
    if (v6 >= 1)
    {
      v7 = self->_value;
      v8 = objc_msgSend(v11, "length");
      if (v8 >= v6)
        v9 = v6;
      else
        v9 = v8;
      objc_msgSend(v11, "substringToIndex:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableString appendString:](v7, "appendString:", v10);

    }
  }
  -[UIPasscodeField _updateFields](self, "_updateFields");

}

- (void)deleteLastCharacter
{
  int v3;

  v3 = -[NSMutableString length](self->_value, "length");
  if (v3 >= 1)
  {
    -[NSMutableString deleteCharactersInRange:](self->_value, "deleteCharactersInRange:", (v3 - 1), 1);
    -[UIPasscodeField _updateFields](self, "_updateFields");
  }
}

- (int)numberOfEntryFields
{
  return -[NSMutableArray count](self->_entryFields, "count");
}

- (void)setNumberOfEntryFields:(int)a3 opaqueBackground:(BOOL)a4
{
  __CFString *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UIButton *okButton;
  double v14;
  double v15;
  double v16;
  NSMutableArray *v17;
  NSMutableArray *entryFields;
  NSMutableArray *v19;
  NSMutableArray *entryBackgrounds;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  int v26;
  UIButton *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;

  if (a4)
    v7 = CFSTR("UIPasscodeFieldBackground_Opaque.png");
  else
    v7 = CFSTR("UIPasscodeFieldBackground.png");
  _UIImageWithName(v7);
  v32 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "size");
  objc_msgSend(v32, "stretchableImageWithLeftCapWidth:topCapHeight:", vcvtmd_s64_f64(v8 * 0.5), 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "size");
  v10 = v9;
  -[UIView bounds](self, "bounds");
  v12 = v11;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  self->_opaqueBackground = a4;
  okButton = self->_okButton;
  if (okButton)
  {
    -[UIView frame](okButton, "frame");
    v15 = v12 - v14 + 0.0;
  }
  else
  {
    v15 = 0.0;
  }
  v16 = -0.5;
  if (a3 == 1)
  {
    if (self->_centerHorizontally)
    {
      v16 = -0.5;
    }
    else
    {
      v15 = v15 + -10.0;
      v16 = 4.5;
    }
  }
  if (self->_entryFields)
  {
    objc_msgSend(v35, "removeObserver:name:object:", self, CFSTR("UITextFieldTextDidChangeNotification"), 0);
    -[NSMutableArray makeObjectsPerformSelector:](self->_entryFields, "makeObjectsPerformSelector:", sel_removeFromSuperview);
    -[NSMutableArray removeAllObjects](self->_entryFields, "removeAllObjects");
    -[NSMutableArray removeAllObjects](self->_entryBackgrounds, "removeAllObjects");
  }
  else
  {
    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    entryFields = self->_entryFields;
    self->_entryFields = v17;

    v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    entryBackgrounds = self->_entryBackgrounds;
    self->_entryBackgrounds = v19;

  }
  v21 = 72.0;
  if (a3 == 1)
    v21 = 31.0;
  objc_msgSend(off_1E167A828, "fontWithFamilyName:traits:size:", CFSTR("Helvetica"), 0, v21);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 >= 1)
  {
    v22 = floor((v12 + (double)(a3 - 1) * -10.0) / (double)a3);
    if (a3 == 1)
      v23 = 3.0;
    else
      v23 = 5.0;
    v24 = v22 - v15;
    v25 = 0.0;
    v26 = a3;
    do
    {
      v27 = -[UIButton initWithFrame:]([UIButton alloc], "initWithFrame:", v25, 0.0, v22, v10);
      v28 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "textFieldClass")), "initWithFrame:", v16, v23, v24, v10 + -8.0);
      -[UIButton setAutosizesToFit:](v27, "setAutosizesToFit:", 0);
      -[UIButton setBackgroundImage:forState:](v27, "setBackgroundImage:forState:", v34, 0);
      -[UIButton setAdjustsImageWhenDisabled:](v27, "setAdjustsImageWhenDisabled:", 0);
      -[UIButton setEnabled:](v27, "setEnabled:", 0);
      -[UIView addSubview:](self, "addSubview:", v27);
      -[UIView addSubview:](v27, "addSubview:", v28);
      objc_msgSend(v28, "setUndoEnabled:", 0);
      +[UIColor blackColor](UIColor, "blackColor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setTextColor:", v29);

      objc_msgSend(v28, "setTextCentersVertically:", 1);
      objc_msgSend(v28, "setTextCentersHorizontally:", self->_centerHorizontally);
      objc_msgSend(v28, "setFont:", v33);
      objc_msgSend(v28, "setDelegate:", self);
      -[NSMutableArray addObject:](self->_entryFields, "addObject:", v28);
      -[NSMutableArray addObject:](self->_entryBackgrounds, "addObject:", v27);
      objc_msgSend(v28, "textInputTraits");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v30;
      if (a3 != 1)
        objc_msgSend(v30, "setInsertionPointColor:", 0);
      objc_msgSend(v31, "setKeyboardType:", self->_keyboardType);
      objc_msgSend(v31, "setKeyboardAppearance:", self->_keyboardAppearance);
      objc_msgSend(v31, "setEmptyContentReturnKeyType:", self->_emptyContentReturnKeyType);
      objc_msgSend(v31, "setAutocorrectionType:", 1);
      objc_msgSend(v31, "setTextLoupeVisibility:", 1);
      objc_msgSend(v31, "setShortcutConversionType:", 1);
      objc_msgSend(v31, "setLearnsCorrections:", 0);
      if (a3 == 1)
        objc_msgSend(v28, "setSecureTextEntry:", 1);
      objc_msgSend(v35, "addObserver:selector:name:object:", self, sel__textDidChange, CFSTR("UITextFieldTextDidChangeNotification"), v28);
      v25 = v22 + 10.0 + v25;

      --v26;
    }
    while (v26);
  }

}

- (void)setNumberOfEntryFields:(int)a3
{
  -[UIPasscodeField setNumberOfEntryFields:opaqueBackground:](self, "setNumberOfEntryFields:opaqueBackground:", *(_QWORD *)&a3, 1);
}

- (BOOL)canBecomeFirstResponder
{
  return -[NSMutableArray count](self->_entryFields, "count") == 1;
}

- (BOOL)becomeFirstResponder
{
  void *v3;
  char v4;

  if (-[NSMutableArray count](self->_entryFields, "count") != 1)
    return 0;
  -[NSMutableArray objectAtIndex:](self->_entryFields, "objectAtIndex:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "becomeFirstResponder");

  return v4;
}

- (BOOL)isFirstResponder
{
  void *v3;
  char v4;
  objc_super v6;

  if (-[NSMutableArray count](self->_entryFields, "count") == 1)
  {
    -[NSMutableArray objectAtIndex:](self->_entryFields, "objectAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isFirstResponder");

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UIPasscodeField;
    return -[UIView isFirstResponder](&v6, sel_isFirstResponder);
  }
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_delegate, a3);
}

- (void)_textDidChange
{
  NSMutableString *value;
  void *v4;
  void *v5;
  UIButton *okButton;
  id WeakRetained;

  if (-[NSMutableArray count](self->_entryFields, "count") == 1)
  {
    WeakRetained = objc_loadWeakRetained(&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      value = self->_value;
      -[NSMutableArray objectAtIndex:](self->_entryFields, "objectAtIndex:", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "text");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableString setString:](value, "setString:", v5);

      okButton = self->_okButton;
      if (okButton)
        -[UIButton setEnabled:](okButton, "setEnabled:", -[NSMutableString length](self->_value, "length") != 0);
      objc_msgSend(WeakRetained, "passcodeFieldTextDidChange:", self);
    }

  }
}

- (BOOL)textField:(id)a3 shouldInsertText:(id)a4 replacingRange:(_NSRange)a5
{
  id v6;
  id WeakRetained;
  char v8;

  v6 = a4;
  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v8 = objc_msgSend(WeakRetained, "passcodeField:shouldInsertText:", self, v6);
  else
    v8 = 1;

  return v8;
}

- (BOOL)textFieldShouldStartEditing:(id)a3
{
  return 1;
}

- (void)textFieldDidResignFirstResponder:(id)a3
{
  if (-[NSMutableArray count](self->_entryFields, "count", a3) == 1)
    -[UIPasscodeField _updateFields](self, "_updateFields");
}

- (void)okButtonClicked:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "passcodeFieldDidAcceptEntry:", self);

}

- (id)hitTest:(CGPoint)a3 forEvent:(__GSEvent *)a4
{
  UIPasscodeField *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIPasscodeField;
  -[UIView hitTest:forEvent:](&v7, sel_hitTest_forEvent_, a4, a3.x, a3.y);
  v5 = (UIPasscodeField *)objc_claimAutoreleasedReturnValue();
  if (v5 == self)
  {
    if (self->_okButton)
      return self;

    v5 = 0;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_delegate);
  objc_storeStrong((id *)&self->_okButton, 0);
  objc_storeStrong((id *)&self->_entryBackgrounds, 0);
  objc_storeStrong((id *)&self->_entryFields, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

@end
