@implementation RTTUIUtteranceCell

+ (double)heightForUtterance:(id)a3 andWidth:(double)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;

  v5 = a3;
  if (heightForUtterance_andWidth__onceToken != -1)
    dispatch_once(&heightForUtterance_andWidth__onceToken, &__block_literal_global_1);
  v6 = v5;
  objc_msgSend(v6, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  v9 = v6;
  if (!v8)
  {
    v10 = (void *)MEMORY[0x24BE7CB78];
    objc_msgSend(v6, "contactPath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    ttyLocString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "utteranceWithContactPath:andText:", v11, v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend((id)heightForUtterance_andWidth__SizeCell, "updateUtterance:postNotifications:", v9, 0);
  objc_msgSend((id)heightForUtterance_andWidth__SizeCell, "preferredHeightForWidth:", a4);
  v14 = v13;

  return v14;
}

void __50__RTTUIUtteranceCell_heightForUtterance_andWidth___block_invoke()
{
  RTTUIUtteranceCell *v0;
  void *v1;

  v0 = objc_alloc_init(RTTUIUtteranceCell);
  v1 = (void *)heightForUtterance_andWidth__SizeCell;
  heightForUtterance_andWidth__SizeCell = (uint64_t)v0;

}

- (void)updateUtterance:(id)a3 postNotifications:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  RTTUIUtteranceCell *v7;
  void (*v8)(RTTUIUtteranceCell *);
  _Unwind_Exception *v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void *v14;

  v4 = a4;
  v6 = a3;
  -[RTTUIUtteranceCell setUtterance:](self, "setUtterance:", v6);
  -[RTTUIUtteranceCell updateLayout](self, "updateLayout");
  if (v4)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0
      && -[RTTUIUtteranceCell _accessibilityIsRealtimeElement](self, "_accessibilityIsRealtimeElement"))
    {
      -[RTTUIUtteranceCell _accessibilitySetIsUnread:](self, "_accessibilitySetIsUnread:", 1);
      UIAccessibilityPostNotification(0x421u, 0);
    }
    v7 = self;
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v8 = (void (*)(RTTUIUtteranceCell *))get_UIAccessibilitySetAssociatedElementContextForNextNotificationSymbolLoc_ptr;
    v14 = get_UIAccessibilitySetAssociatedElementContextForNextNotificationSymbolLoc_ptr;
    if (!get_UIAccessibilitySetAssociatedElementContextForNextNotificationSymbolLoc_ptr)
    {
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __get_UIAccessibilitySetAssociatedElementContextForNextNotificationSymbolLoc_block_invoke;
      v10[3] = &unk_24D657DD0;
      v10[4] = &v11;
      __get_UIAccessibilitySetAssociatedElementContextForNextNotificationSymbolLoc_block_invoke((uint64_t)v10);
      v8 = (void (*)(RTTUIUtteranceCell *))v12[3];
    }
    _Block_object_dispose(&v11, 8);
    if (!v8)
    {
      v9 = (_Unwind_Exception *)-[RTTUIConversationControllerCoordinator registerForCallUpdates:].cold.1();
      _Block_object_dispose(&v11, 8);
      _Unwind_Resume(v9);
    }
    v8(v7);

    UIAccessibilityPostNotification(0x3EDu, 0);
  }

}

- (void)updateUtterance:(id)a3
{
  -[RTTUIUtteranceCell updateUtterance:postNotifications:](self, "updateUtterance:postNotifications:", a3, 1);
}

- (void)setSendProgressIndex:(unint64_t)a3
{
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _DWORD v18[2];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  AXLogRTT();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v18[0] = 67109120;
    v18[1] = a3;
    _os_log_impl(&dword_216E9C000, v5, OS_LOG_TYPE_INFO, "Set progress index: %d", (uint8_t *)v18, 8u);
  }

  v6 = objc_alloc(MEMORY[0x24BDD1688]);
  -[UITextView attributedText](self->_textView, "attributedText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithAttributedString:", v7);

  objc_msgSend(v8, "beginEditing");
  -[RTTUIUtteranceCell delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentCall");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = +[RTTUIUtilities ttyShouldBeRealtimeForCall:](RTTUIUtilities, "ttyShouldBeRealtimeForCall:", v10);

  if ((_DWORD)v7)
    v11 = objc_msgSend(v8, "length");
  else
    v11 = a3 + 1;
  v12 = objc_msgSend(v8, "length");
  v13 = *MEMORY[0x24BDF6600];
  -[RTTUIUtteranceCell utteranceTextColor](self, "utteranceTextColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v11 >= v12)
  {
    objc_msgSend(v8, "addAttribute:value:range:", v13, v14, 0, objc_msgSend(v8, "length"));
  }
  else
  {
    objc_msgSend(v14, "colorWithAlphaComponent:", 0.5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addAttribute:value:range:", v13, v16, v11, objc_msgSend(v8, "length") - v11);

    -[RTTUIUtteranceCell utteranceTextColor](self, "utteranceTextColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "colorWithAlphaComponent:", 1.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addAttribute:value:range:", v13, v17, 0, v11);

  }
  objc_msgSend(v8, "endEditing");
  -[UITextView setAttributedText:](self->_textView, "setAttributedText:", v8);
  -[RTTUIUtteranceCell adjustTextViewSize](self, "adjustTextViewSize");

}

- (void)dealloc
{
  objc_super v3;

  -[RTTUIUtteranceCell setUtterance:](self, "setUtterance:", 0);
  v3.receiver = self;
  v3.super_class = (Class)RTTUIUtteranceCell;
  -[RTTUIUtteranceCell dealloc](&v3, sel_dealloc);
}

- (id)utteranceTextColor
{
  int IsRTTNotificationContentExtension;
  void *v4;
  int v5;
  void *v6;

  IsRTTNotificationContentExtension = Soft_AXProcessIsRTTNotificationContentExtension();
  -[RTTUIUtteranceCell delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isCurrentCallConnected");

  if (!v5 || IsRTTNotificationContentExtension)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (_NSRange)selectedTextRange
{
  NSUInteger v2;
  NSUInteger v3;
  _NSRange result;

  v2 = -[UITextView selectedRange](self->_textView, "selectedRange");
  result.length = v3;
  result.location = v2;
  return result;
}

- (double)preferredHeightForWidth:(double)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  +[RTTUIUtilities sharedUtilityProvider](RTTUIUtilities, "sharedUtilityProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bubbleInsetForMe:", 1);
  v7 = v6;
  v9 = v8;

  -[UITextView sizeThatFits:](self->_textView, "sizeThatFits:", a3, 1.79769313e308);
  return v10 - v7 - v9;
}

- (void)adjustTextViewSize
{
  void *v3;
  uint64_t v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double Width;
  double v26;
  double v27;
  void *v28;
  uint64_t v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void (**v49)(void);
  _QWORD v50[9];
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;

  -[RTTUIUtteranceCell utterance](self, "utterance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isMe");

  -[RTTUIUtteranceCell bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = (double *)MEMORY[0x24BDBEFB0];
  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTUIUtteranceCell utterance](self, "utterance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isTranscription");

  if (v16)
  {
    objc_msgSend(v14, "fontDescriptor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "fontDescriptorWithSymbolicTraits:", 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (void *)MEMORY[0x24BDF6A70];
    objc_msgSend(v14, "pointSize");
    objc_msgSend(v19, "fontWithDescriptor:size:", v18);
    v20 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v20;
  }
  v22 = *v13;
  v21 = v13[1];
  -[UITextView setFont:](self->_textView, "setFont:", v14);
  v51.origin.x = v6;
  v51.origin.y = v8;
  v51.size.width = v10;
  v51.size.height = v12;
  -[UITextView sizeThatFits:](self->_textView, "sizeThatFits:", CGRectGetWidth(v51), 1.79769313e308);
  v24 = fmax(v23, 20.0);
  v52.origin.x = v6;
  v52.origin.y = v8;
  v52.size.width = v10;
  v52.size.height = v12;
  Width = CGRectGetWidth(v52);
  v53.origin.x = v6;
  v53.origin.y = v8;
  v53.size.width = v10;
  v53.size.height = v12;
  -[UITextView sizeThatFits:](self->_textView, "sizeThatFits:", CGRectGetWidth(v53), v24);
  v27 = fmax(v26, 130.0);
  if (Width >= v27)
    Width = v27;
  +[RTTUIUtilities sharedUtilityProvider](RTTUIUtilities, "sharedUtilityProvider");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "textAlignmentForMe:", v4);

  if (v29 == 2)
  {
    v54.origin.x = v6;
    v54.origin.y = v8;
    v54.size.width = v10;
    v54.size.height = v12;
    v30 = CGRectGetWidth(v54);
    v55.origin.x = v22;
    v55.origin.y = v21;
    v55.size.width = Width;
    v55.size.height = v24;
    v22 = v30 - CGRectGetWidth(v55);
  }
  -[UITextView setFrame:](self->_textView, "setFrame:", v22, v21, Width, v24);
  +[RTTUIUtilities sharedUtilityProvider](RTTUIUtilities, "sharedUtilityProvider");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "textInsetForMe:", v4);
  v33 = v22 + v32;
  v35 = v21 + v34;
  v37 = Width - (v32 + v36);
  v39 = v24 - (v34 + v38);

  +[RTTUIUtilities sharedUtilityProvider](RTTUIUtilities, "sharedUtilityProvider");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "bubbleInsetForMe:", v4);
  v42 = v33 + v41;
  v44 = v35 + v43;
  v46 = v37 - (v41 + v45);
  v48 = v39 - (v43 + v47);

  v50[0] = MEMORY[0x24BDAC760];
  v50[1] = 3221225472;
  v50[2] = __40__RTTUIUtteranceCell_adjustTextViewSize__block_invoke;
  v50[3] = &unk_24D657CA0;
  v50[4] = self;
  *(double *)&v50[5] = v42;
  *(double *)&v50[6] = v44;
  *(double *)&v50[7] = v46;
  *(double *)&v50[8] = v48;
  v49 = (void (**)(void))MEMORY[0x219A04408](v50);
  v49[2]();

}

void __40__RTTUIUtteranceCell_adjustTextViewSize__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "backgroundView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));

}

- (void)layoutSubviews
{
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  RTTUIStaticTextView *v7;
  void *v8;
  UITextView *v9;
  UITextView *textView;
  UITextView *v11;
  void *v12;
  UITextView *v13;
  void *v14;
  void *v15;
  void *v16;
  UITextView *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char IsRTTNotificationContentExtension;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  UITextView *v33;
  void *v34;
  void *v35;
  __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  objc_super v42;

  v42.receiver = self;
  v42.super_class = (Class)RTTUIUtteranceCell;
  -[RTTUIUtteranceCell layoutSubviews](&v42, sel_layoutSubviews);
  -[RTTUIUtteranceCell utterance](self, "utterance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isMe");

  -[RTTUIUtteranceCell delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isCurrentCallConnected");

  if (!self->_textView)
  {
    v7 = [RTTUIStaticTextView alloc];
    -[RTTUIUtteranceCell textLabel](self, "textLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "frame");
    v9 = -[RTTUIStaticTextView initWithFrame:textContainer:](v7, "initWithFrame:textContainer:", 0);
    textView = self->_textView;
    self->_textView = v9;

    v11 = self->_textView;
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setBackgroundColor:](v11, "setBackgroundColor:", v12);

    v13 = self->_textView;
    objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 20.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setFont:](v13, "setFont:", v14);

    -[UITextView setDelegate:](self->_textView, "setDelegate:", self);
    -[UITextView textContainer](self->_textView, "textContainer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setLineBreakMode:", 0);

    -[UITextView textContainer](self->_textView, "textContainer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setMaximumNumberOfLines:", 0);

    -[UITextView setDataDetectorTypes:](self->_textView, "setDataDetectorTypes:", -1);
    -[UITextView setEditable:](self->_textView, "setEditable:", 0);
    -[UITextView setSelectable:](self->_textView, "setSelectable:", 1);
    -[UITextView setScrollEnabled:](self->_textView, "setScrollEnabled:", 0);
    v17 = self->_textView;
    -[RTTUIUtteranceCell utteranceTextColor](self, "utteranceTextColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setTextColor:](v17, "setTextColor:", v18);

    -[RTTUIUtteranceCell contentView](self, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addSubview:", self->_textView);

  }
  -[RTTUIUtteranceCell backgroundView](self, "backgroundView");
  v20 = objc_claimAutoreleasedReturnValue();
  if (!v20
    || (v21 = (void *)v20,
        -[RTTUIUtteranceCell backgroundView](self, "backgroundView"),
        v22 = (void *)objc_claimAutoreleasedReturnValue(),
        v23 = objc_msgSend(v22, "tag") == 1,
        v22,
        v21,
        (_DWORD)v4 != v23))
  {
    +[RTTUIUtilities sharedUtilityProvider](RTTUIUtilities, "sharedUtilityProvider");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "bubbleFillForMe:", v4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", v25);
    objc_msgSend(v26, "setTag:", v4);
    -[RTTUIUtteranceCell setBackgroundView:](self, "setBackgroundView:", v26);
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTTUIUtteranceCell setBackgroundColor:](self, "setBackgroundColor:", v27);

  }
  IsRTTNotificationContentExtension = Soft_AXProcessIsRTTNotificationContentExtension();
  if (v6 && (IsRTTNotificationContentExtension & 1) == 0)
  {
    v29 = (void *)MEMORY[0x24BDBCED8];
    -[UITextView linkTextAttributes](self->_textView, "linkTextAttributes");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "dictionaryWithDictionary:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setValue:forKey:", v32, *MEMORY[0x24BDF6600]);

    objc_msgSend(v31, "setValue:forKey:", &unk_24D65DB58, *MEMORY[0x24BDF66D8]);
    -[UITextView setLinkTextAttributes:](self->_textView, "setLinkTextAttributes:", v31);

  }
  v33 = self->_textView;
  +[RTTUIUtilities sharedUtilityProvider](RTTUIUtilities, "sharedUtilityProvider");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "textInsetForMe:", v4);
  -[UITextView setTextContainerInset:](v33, "setTextContainerInset:");

  -[RTTUIUtteranceCell utterance](self, "utterance");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "text");
  v36 = (__CFString *)objc_claimAutoreleasedReturnValue();

  -[RTTUIUtteranceCell utterance](self, "utterance");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "text");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "stringByTrimmingCharactersInSet:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "length");

  if (!v41)
  {

    v36 = &stru_24D658230;
  }
  -[UITextView setText:](self->_textView, "setText:", v36);
  -[RTTUIUtteranceCell adjustTextViewSize](self, "adjustTextViewSize");

}

- (void)textViewDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[RTTUIUtteranceCell adjustTextViewSize](self, "adjustTextViewSize");
  -[RTTUIUtteranceCell utterance](self, "utterance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "updateText:", v6);
  -[RTTUIUtteranceCell delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[RTTUIUtteranceCell delegate](self, "delegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "utteranceCellDidUpdateContent:", self);

  }
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  __CFString *v12;
  uint64_t v13;

  v3 = (void *)MEMORY[0x24BDBACA0];
  -[RTTUIUtteranceCell utterance](self, "utterance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contactForPhoneNumber:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "isKeyAvailable:", CFSTR("givenName")))
  {
    objc_msgSend(v6, "givenName");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = &stru_24D658230;
  }
  if (!-[__CFString length](v7, "length") && objc_msgSend(v6, "isKeyAvailable:", CFSTR("emailAddresses")))
  {
    objc_msgSend(v6, "emailAddresses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "label");
    v10 = objc_claimAutoreleasedReturnValue();

    v7 = (__CFString *)v10;
  }
  if (!-[__CFString length](v7, "length"))
  {
    if ((objc_msgSend(v6, "ttyIsMe") & 1) != 0)
    {
      ttyLocString();
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[RTTUIUtteranceCell utterance](self, "utterance");
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[__CFString contactPath](v12, "contactPath");
      v11 = objc_claimAutoreleasedReturnValue();

      v7 = v12;
    }

    v7 = (__CFString *)v11;
  }
  if (!-[__CFString length](v7, "length"))
  {
    ttyLocString();
    v13 = objc_claimAutoreleasedReturnValue();

    v7 = (__CFString *)v13;
  }

  return v7;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[RTTUIUtteranceCell utterance](self, "utterance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_accessibilityHandleATFocused:(BOOL)a3 assistiveTech:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RTTUIUtteranceCell;
  -[RTTUIUtteranceCell _accessibilityHandleATFocused:assistiveTech:](&v5, sel__accessibilityHandleATFocused_assistiveTech_, a3, a4);
  -[RTTUIUtteranceCell _accessibilitySetIsUnread:](self, "_accessibilitySetIsUnread:", 0);
}

- (BOOL)_accessibilityRealtimeCompleted
{
  void *v2;
  char v3;

  -[RTTUIUtteranceCell utterance](self, "utterance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isComplete");

  return v3;
}

- (RTTUtterance)utterance
{
  return self->_utterance;
}

- (void)setUtterance:(id)a3
{
  objc_storeStrong((id *)&self->_utterance, a3);
}

- (BOOL)isEditingUtterance
{
  return self->_editingUtterance;
}

- (void)setEditingUtterance:(BOOL)a3
{
  self->_editingUtterance = a3;
}

- (RTTUIUtteranceCellDelegate)delegate
{
  return (RTTUIUtteranceCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)_accessibilityIsUnread
{
  return self->_accessibilityIsUnread;
}

- (void)_accessibilitySetIsUnread:(BOOL)a3
{
  self->_accessibilityIsUnread = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_utterance, 0);
  objc_storeStrong((id *)&self->_bubbleLayer, 0);
  objc_storeStrong((id *)&self->_textView, 0);
}

@end
