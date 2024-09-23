@implementation VSTwoFactorDigitView

- (VSTwoFactorDigitView)initWithDigitCount:(unint64_t)a3
{
  VSTwoFactorDigitView *v4;
  VSTwoFactorDigitView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VSTwoFactorDigitView;
  v4 = -[VSTwoFactorDigitView init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_digitCount = a3;
    v4->_keyboardType = 4;
    v4->_returnKeyType = 11;
    objc_storeStrong((id *)&v4->_textContentType, (id)*MEMORY[0x24BDF7ED0]);
    -[VSTwoFactorDigitView setupDigitViews](v5, "setupDigitViews");
    -[VSTwoFactorDigitView addTarget:action:forControlEvents:](v5, "addTarget:action:forControlEvents:", v5, sel_onTouchUpInside_, 64);
  }
  return v5;
}

- (void)setCodeText:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  __CFString *v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  VSTwoFactorDigitView *v23;
  void *v24;
  __int16 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v24 = v4;
  if (v4)
  {
    v5 = v4;
    v6 = -[VSTwoFactorDigitView digitCount](self, "digitCount");
    v7 = objc_msgSend(v5, "length");
    if (v6 >= v7)
      v6 = v7;
    objc_msgSend(v5, "substringToIndex:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The [codeText substringToIndex:index] parameter must not be nil."));
    objc_msgSend(v5, "substringToIndex:", v6);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = &stru_24FE1B848;
  }
  v10 = -[__CFString length](v9, "length");
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v23 = self;
  -[VSTwoFactorDigitView digits](self, "digits");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v27 != v15)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        if (-[__CFString length](v9, "length"))
        {
          v18 = &stru_24FE1B848;
          if (v14 + i < v10)
          {
            v25 = 0;
            v25 = -[__CFString characterAtIndex:](v9, "characterAtIndex:");
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &v25, 1);
            v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          v18 = &stru_24FE1B848;
        }
        objc_msgSend(v17, "label");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setText:", v18);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      v14 += i;
    }
    while (v13);
  }

  objc_storeStrong((id *)&v23->_codeText, v9);
  v23->_hasText = v10 != 0;
  -[VSTwoFactorDigitView delegate](v23, "delegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v21 = (void *)-[__CFString copy](v9, "copy");
    objc_msgSend(v20, "twoFactorDigitView:textDidChange:", v23, v21);

  }
  v22 = -[__CFString length](v9, "length");
  if (v22 == -[VSTwoFactorDigitView digitCount](v23, "digitCount"))
    -[VSTwoFactorDigitView resignFirstResponder](v23, "resignFirstResponder");

}

- (BOOL)canBecomeFirstResponder
{
  NSObject *v2;
  uint8_t v4[16];

  VSDefaultLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2303C5000, v2, OS_LOG_TYPE_DEFAULT, "Will become first responder.", v4, 2u);
  }

  return 1;
}

- (void)setupDigitViews
{
  id v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  VSDigitView *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v4 = -[VSTwoFactorDigitView digitCount](self, "digitCount");
  v5 = v4;
  if (v4)
  {
    v6 = v4;
    do
    {
      v7 = objc_alloc_init(VSDigitView);
      -[VSDigitView setTranslatesAutoresizingMaskIntoConstraints:](v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v3, "addObject:", v7);
      -[VSTwoFactorDigitView addSubview:](self, "addSubview:", v7);

      --v6;
    }
    while (v6);
  }
  -[VSTwoFactorDigitView setDigits:](self, "setDigits:", v3);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v8 = v3;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v9)
  {
    v10 = v9;
    v27 = v5;
    v11 = 0;
    v12 = *(_QWORD *)v29;
    do
    {
      v13 = 0;
      v14 = v11;
      do
      {
        if (*(_QWORD *)v29 != v12)
          objc_enumerationMutation(v8);
        v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v13);
        objc_msgSend(v15, "topAnchor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSTwoFactorDigitView topAnchor](self, "topAnchor");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "constraintEqualToAnchor:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setActive:", 1);

        objc_msgSend(v15, "bottomAnchor");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSTwoFactorDigitView bottomAnchor](self, "bottomAnchor");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "constraintEqualToAnchor:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setActive:", 1);

        objc_msgSend(v15, "leftAnchor");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          objc_msgSend(v14, "rightAnchor");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "constraintEqualToAnchor:constant:", v23, 10.0);
        }
        else
        {
          -[VSTwoFactorDigitView leftAnchor](self, "leftAnchor");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "constraintEqualToAnchor:", v23);
        }
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setActive:", 1);

        v11 = v15;
        ++v13;
        v14 = v11;
      }
      while (v10 != v13);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v10);

    v5 = v27;
  }

  -[VSTwoFactorDigitView widthAnchor](self, "widthAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToConstant:", (double)v5 * 50.0 + -10.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setActive:", 1);

}

- (void)deleteBackward
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  VSDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[VSTwoFactorDigitView deleteBackward]";
    _os_log_impl(&dword_2303C5000, v3, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v6, 0xCu);
  }

  -[VSTwoFactorDigitView codeText](self, "codeText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(v4, "substringToIndex:", objc_msgSend(v4, "length") - 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSTwoFactorDigitView setCodeText:](self, "setCodeText:", v5);

  }
}

- (void)insertText:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[VSTwoFactorDigitView codeText](self, "codeText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "alphanumericCharacterSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "invertedSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[VSTwoFactorDigitView codeText](self, "codeText");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v10, "componentsSeparatedByCharactersInSet:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "componentsJoinedByString:", &stru_24FE1B848);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The [[[[self codeText] copy] componentsSeparatedByCharactersInSet:removalCharacters] componentsJoinedByString:@\"\"] parameter must not be nil."));
    -[VSTwoFactorDigitView codeText](self, "codeText");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(v14, "componentsSeparatedByCharactersInSet:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "componentsJoinedByString:", &stru_24FE1B848);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = &stru_24FE1B848;
  }
  -[__CFString stringByAppendingString:](v16, "stringByAppendingString:", v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[VSTwoFactorDigitView autocapitalizationType](self, "autocapitalizationType"))
  {
    objc_msgSend(v17, "uppercaseString");
    v18 = objc_claimAutoreleasedReturnValue();

    v17 = (void *)v18;
  }
  VSDefaultLogObject();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 138412290;
    v21 = v17;
    _os_log_impl(&dword_2303C5000, v19, OS_LOG_TYPE_DEFAULT, "Will set updated text to: %@", (uint8_t *)&v20, 0xCu);
  }

  -[VSTwoFactorDigitView setCodeText:](self, "setCodeText:", v17);
}

- (UITextRange)selectedTextRange
{
  return 0;
}

- (id)textInRange:(id)a3
{
  return 0;
}

- (UITextRange)markedTextRange
{
  return 0;
}

- (UITextPosition)beginningOfDocument
{
  return (UITextPosition *)objc_alloc_init(MEMORY[0x24BDF6ED8]);
}

- (UITextPosition)endOfDocument
{
  return (UITextPosition *)objc_alloc_init(MEMORY[0x24BDF6ED8]);
}

- (id)textRangeFromPosition:(id)a3 toPosition:(id)a4
{
  return 0;
}

- (id)positionFromPosition:(id)a3 offset:(int64_t)a4
{
  return 0;
}

- (id)positionFromPosition:(id)a3 inDirection:(int64_t)a4 offset:(int64_t)a5
{
  return 0;
}

- (int64_t)comparePosition:(id)a3 toPosition:(id)a4
{
  return 0;
}

- (int64_t)offsetFromPosition:(id)a3 toPosition:(id)a4
{
  return 0;
}

- (id)positionWithinRange:(id)a3 farthestInDirection:(int64_t)a4
{
  return 0;
}

- (id)characterRangeByExtendingPosition:(id)a3 inDirection:(int64_t)a4
{
  return 0;
}

- (int64_t)baseWritingDirectionForPosition:(id)a3 inDirection:(int64_t)a4
{
  return -1;
}

- (CGRect)firstRectForRange:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = *MEMORY[0x24BDBF090];
  v4 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v5 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v6 = *(double *)(MEMORY[0x24BDBF090] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)caretRectForPosition:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = *MEMORY[0x24BDBF090];
  v4 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v5 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v6 = *(double *)(MEMORY[0x24BDBF090] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)selectionRectsForRange:(id)a3
{
  return (id)MEMORY[0x24BDBD1A8];
}

- (id)closestPositionToPoint:(CGPoint)a3
{
  return 0;
}

- (id)closestPositionToPoint:(CGPoint)a3 withinRange:(id)a4
{
  return 0;
}

- (id)characterRangeAtPoint:(CGPoint)a3
{
  return 0;
}

- (BOOL)hasText
{
  return self->_hasText;
}

- (int64_t)keyboardType
{
  return self->_keyboardType;
}

- (void)setKeyboardType:(int64_t)a3
{
  self->_keyboardType = a3;
}

- (int64_t)autocapitalizationType
{
  return self->_autocapitalizationType;
}

- (void)setAutocapitalizationType:(int64_t)a3
{
  self->_autocapitalizationType = a3;
}

- (int64_t)returnKeyType
{
  return self->_returnKeyType;
}

- (void)setReturnKeyType:(int64_t)a3
{
  self->_returnKeyType = a3;
}

- (NSString)textContentType
{
  return self->_textContentType;
}

- (void)setTextContentType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 496);
}

- (UITextInputDelegate)inputDelegate
{
  return (UITextInputDelegate *)objc_loadWeakRetained((id *)&self->_inputDelegate);
}

- (void)setInputDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_inputDelegate, a3);
}

- (UITextInputTokenizer)tokenizer
{
  return self->_tokenizer;
}

- (NSDictionary)markedTextStyle
{
  return self->_markedTextStyle;
}

- (void)setMarkedTextStyle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 520);
}

- (VSTwoFactorDigitViewDelegate)delegate
{
  return (VSTwoFactorDigitViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)digitCount
{
  return self->_digitCount;
}

- (NSString)codeText
{
  return self->_codeText;
}

- (NSArray)digits
{
  return self->_digits;
}

- (void)setDigits:(id)a3
{
  objc_storeStrong((id *)&self->_digits, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_digits, 0);
  objc_storeStrong((id *)&self->_codeText, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_markedTextStyle, 0);
  objc_storeStrong((id *)&self->_tokenizer, 0);
  objc_destroyWeak((id *)&self->_inputDelegate);
  objc_storeStrong((id *)&self->_textContentType, 0);
}

@end
