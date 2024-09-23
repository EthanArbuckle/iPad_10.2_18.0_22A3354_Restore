@implementation SCKPMessageCardSectionView

- (SCKPMessageCardSectionView)initWithMessageCardSection:(id)a3 delegate:(id)a4
{
  id v6;
  SCKPMessageCardSectionView *v7;
  SCKPMessageCardSectionView *v8;
  int v9;
  void *v10;
  _BOOL4 v11;
  UITextView *v12;
  UITextView *textView;
  void *v14;
  UITextView *v15;
  void *v16;
  UITextView *v17;
  void *v18;
  UITextView *v19;
  void *v20;
  void *v21;
  SCKPAudioMessageView *v22;
  void *v23;
  uint64_t v24;
  SCKPAudioMessageView *audioMessageView;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  UIVisualEffectView *messageBackgroundView;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  char v36;
  UIButton *v37;
  UIButton *sendButton;
  UIButton *v39;
  void *v40;
  void *v41;
  UIButton *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  SCKPMessageCardSectionAttachmentView *v49;
  SCKPMessageCardSectionAttachmentView *attachmentView;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v57;
  objc_class *v58;
  id v59;
  uint64_t v60;
  CKTextBalloonView *sentBalloonView;
  CKTextBalloonView *v62;
  id v63;
  uint64_t v64;
  void *v65;
  const __CFString *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  id obj;
  objc_super v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  _QWORD v80[2];
  _QWORD v81[2];
  _BYTE buf[24];
  void *v83;
  uint64_t *v84;
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  obj = a4;
  v73.receiver = self;
  v73.super_class = (Class)SCKPMessageCardSectionView;
  v7 = -[SCKPMessageCardSectionView init](&v73, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_delegate, obj);
    v9 = objc_msgSend(v6, "messageStatus");
    v8->_messageStatus = v9;
    if (v9 == 2
      && (objc_msgSend(v6, "audioMessageURL"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = v10 == 0,
          v10,
          v11))
    {
      v74 = 0;
      v75 = &v74;
      v76 = 0x2050000000;
      v57 = (void *)getCKTextBalloonViewClass_softClass;
      v77 = getCKTextBalloonViewClass_softClass;
      if (!getCKTextBalloonViewClass_softClass)
      {
        *(_QWORD *)buf = MEMORY[0x24BDAC760];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __getCKTextBalloonViewClass_block_invoke;
        v83 = &unk_24E048F90;
        v84 = &v74;
        __getCKTextBalloonViewClass_block_invoke((uint64_t)buf);
        v57 = (void *)v75[3];
      }
      v58 = objc_retainAutorelease(v57);
      _Block_object_dispose(&v74, 8);
      v59 = [v58 alloc];
      v60 = objc_msgSend(v59, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
      sentBalloonView = v8->_sentBalloonView;
      v8->_sentBalloonView = (CKTextBalloonView *)v60;

      -[CKTextBalloonView setCanUseOpaqueMask:](v8->_sentBalloonView, "setCanUseOpaqueMask:", 0);
      -[CKTextBalloonView setOrientation:](v8->_sentBalloonView, "setOrientation:", 1);
      v62 = v8->_sentBalloonView;
      v63 = objc_alloc(MEMORY[0x24BDD1458]);
      objc_msgSend(v6, "messageText");
      v64 = objc_claimAutoreleasedReturnValue();
      v65 = (void *)v64;
      if (v64)
        v66 = (const __CFString *)v64;
      else
        v66 = &stru_24E049468;
      v80[0] = *MEMORY[0x24BEBB360];
      objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v81[0] = v67;
      v80[1] = *MEMORY[0x24BEBB368];
      objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v81[1] = v68;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v81, v80, 2);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = (void *)objc_msgSend(v63, "initWithString:attributes:", v66, v69);
      -[CKTextBalloonView setAttributedText:](v62, "setAttributedText:", v70);

    }
    else
    {
      v12 = (UITextView *)objc_alloc_init(MEMORY[0x24BDF6EF8]);
      textView = v8->_textView;
      v8->_textView = v12;

      -[UITextView layer](v8->_textView, "layer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setCornerRadius:", 8.0);

      v15 = v8->_textView;
      v71 = *MEMORY[0x24BDF77B0];
      objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextView setFont:](v15, "setFont:", v16);

      v17 = v8->_textView;
      objc_msgSend(v6, "messageText");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextView setText:](v17, "setText:", v18);

      v19 = v8->_textView;
      objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextView setBackgroundColor:](v19, "setBackgroundColor:", v20);

      -[UITextView setTextContainerInset:](v8->_textView, "setTextContainerInset:", 8.0, 4.0, 8.0, 4.0);
      -[UITextView setDelegate:](v8->_textView, "setDelegate:", v8);
    }
    objc_msgSend(v6, "audioMessageURL");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      v22 = [SCKPAudioMessageView alloc];
      objc_msgSend(v6, "audioMessageURL");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[SCKPAudioMessageView initWithAudioMessageURL:delegate:](v22, "initWithAudioMessageURL:delegate:", v23, v8);
      audioMessageView = v8->_audioMessageView;
      v8->_audioMessageView = (SCKPAudioMessageView *)v24;

      -[SCKPMessageCardSectionView addSubview:](v8, "addSubview:", v8->_audioMessageView);
      -[UITextView setHidden:](v8->_textView, "setHidden:", 1);
    }
    else if (v8->_messageStatus != 2)
    {
      v26 = (void *)MEMORY[0x24BDF6F88];
      objc_msgSend(MEMORY[0x24BDF6878], "effectWithStyle:", 18);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "effectForBlurEffect:style:", v27, 6);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v29 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6FC8]), "initWithEffect:", v28);
      messageBackgroundView = v8->_messageBackgroundView;
      v8->_messageBackgroundView = (UIVisualEffectView *)v29;

      -[UIVisualEffectView contentView](v8->_messageBackgroundView, "contentView");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 0.8);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setBackgroundColor:", v32);

      -[UIVisualEffectView contentView](v8->_messageBackgroundView, "contentView");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "layer");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setCornerRadius:", 8.0);

      -[SCKPMessageCardSectionView addSubview:](v8, "addSubview:", v8->_messageBackgroundView);
    }
    v35 = _os_feature_enabled_impl();
    if (v8->_messageStatus == 2)
      v36 = 1;
    else
      v36 = v35;
    if ((v36 & 1) == 0)
    {
      v37 = (UIButton *)objc_alloc_init(MEMORY[0x24BDF6880]);
      sendButton = v8->_sendButton;
      v8->_sendButton = v37;

      v39 = v8->_sendButton;
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "assistantUILocalizedStringForKey:table:", CFSTR("SCKP_MESSAGE_SEND"), 0);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton setTitle:forState:](v39, "setTitle:forState:", v41, 0);

      v42 = v8->_sendButton;
      objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.176470588, 0.490196078, 0.964705882, 1.0);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton setTitleColor:forState:](v42, "setTitleColor:forState:", v43, 0);

      -[UIButton titleLabel](v8->_sendButton, "titleLabel");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BDF77E8]);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setFont:", v45);

      -[UIButton titleLabel](v8->_sendButton, "titleLabel");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setAdjustsFontSizeToFitWidth:", 1);

      -[UIButton addTarget:action:forControlEvents:](v8->_sendButton, "addTarget:action:forControlEvents:", v8, sel__sendButtonPressed_, 64);
      -[SCKPMessageCardSectionView addSubview:](v8, "addSubview:", v8->_sendButton);
    }
    -[SCKPMessageCardSectionView addSubview:](v8, "addSubview:", v8->_sentBalloonView);
    -[SCKPMessageCardSectionView addSubview:](v8, "addSubview:", v8->_textView);
    -[CKTextBalloonView setColor:](v8->_sentBalloonView, "setColor:", objc_msgSend(v6, "messageServiceType") == 1);
    -[CKTextBalloonView prepareForDisplayIfNeeded](v8->_sentBalloonView, "prepareForDisplayIfNeeded");
    objc_msgSend(v6, "messageAttachment");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (v47)
    {
      v48 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "-[SCKPMessageCardSectionView initWithMessageCardSection:delegate:]";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v47;
        _os_log_impl(&dword_21C485000, v48, OS_LOG_TYPE_DEFAULT, "%s #messages: Attempting to build attachment view with attachment:%@", buf, 0x16u);
      }
      v49 = -[SCKPMessageCardSectionAttachmentView initWithAttachment:]([SCKPMessageCardSectionAttachmentView alloc], "initWithAttachment:", v47);
      attachmentView = v8->_attachmentView;
      v8->_attachmentView = v49;

      -[SCKPMessageCardSectionAttachmentView setDelegate:](v8->_attachmentView, "setDelegate:", v8);
      if (v8->_messageStatus == 2)
        -[SCKPMessageCardSectionAttachmentView setAlignmentStyle:](v8->_attachmentView, "setAlignmentStyle:", 1);
      -[SCKPMessageCardSectionView addSubview:](v8, "addSubview:", v8->_attachmentView);
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "assistantUILocalizedStringForKey:table:", CFSTR("SCKP_ATTACHMENT_PLACEHOLDER_TEXT"), 0);
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      v78 = *MEMORY[0x24BEBB360];
      objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", v71);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = v53;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1);
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", v52, v54);
      -[UITextView setAttributedPlaceholder:](v8->_textView, "setAttributedPlaceholder:", v55);

    }
  }

  return v8;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  SCKPMessageCardSectionAttachmentView *attachmentView;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id *p_sentBalloonView;
  double v25;
  double v26;
  void *v27;
  uint64_t v28;
  UIButton *sendButton;
  double v30;
  double v31;
  double v32;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)SCKPMessageCardSectionView;
  -[SCKPMessageCardSectionView layoutSubviews](&v33, sel_layoutSubviews);
  -[SCKPMessageCardSectionView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v9 = v3;
  v10 = v4;
  attachmentView = self->_attachmentView;
  if (attachmentView)
  {
    -[SCKPMessageCardSectionAttachmentView sizeThatFits:](attachmentView, "sizeThatFits:", v3 + -24.0, v4);
    v13 = v12;
    v14 = 12.0;
    v16 = v15 + 12.0;
    if (self->_messageStatus == 2)
      v14 = v9 + -12.0 - v13;
    -[SCKPMessageCardSectionAttachmentView setFrame:](self->_attachmentView, "setFrame:", v14, 12.0);
  }
  else
  {
    v16 = 0.0;
  }
  if (self->_messageStatus == 2)
  {
    v17 = v6 + 12.0;
    v18 = v9 + -24.0;
    v19 = v10 - (v16 + 12.0 + 12.0);
    v32 = v8 + v16 + 12.0;
    -[SCKPAudioMessageView setFrame:](self->_audioMessageView, "setFrame:", v6 + 12.0);
    v20 = *MEMORY[0x24BDBF090];
    v21 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v23 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v22 = *(double *)(MEMORY[0x24BDBF090] + 24);
    -[UIVisualEffectView setFrame:](self->_messageBackgroundView, "setFrame:", *MEMORY[0x24BDBF090], v21, v23, v22);
    p_sentBalloonView = (id *)&self->_sentBalloonView;
    -[CKTextBalloonView sizeThatFits:textAlignmentInsets:](self->_sentBalloonView, "sizeThatFits:textAlignmentInsets:", 0, v18, v19);
    v26 = v25;
    -[CKTextBalloonView attributedText](self->_sentBalloonView, "attributedText");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "length");

    if (v28)
    {
      v23 = v26 + 4.0;
      v20 = v17 + v18 - (v26 + 4.0);
      v21 = v32;
      v22 = v19;
    }
  }
  else
  {
    v22 = v10 - v16 + -24.0;
    sendButton = self->_sendButton;
    if (sendButton)
    {
      -[UIButton sizeThatFits:](sendButton, "sizeThatFits:", v9, v10);
      sendButton = self->_sendButton;
    }
    else
    {
      v30 = *MEMORY[0x24BDBF148];
    }
    if (v30 >= v9 * 0.5)
      v31 = v9 * 0.5;
    else
      v31 = v30;
    v21 = v8 + 12.0 + v16;
    -[UIButton setFrame:](sendButton, "setFrame:", v6 + v9 - (v31 + 12.0), v21, v31, v22);
    v23 = v9 - (v31 + 36.0);
    v20 = v6 + 12.0;
    -[UITextView setFrame:](self->_textView, "setFrame:", v20, v21, v23, v22);
    -[SCKPAudioMessageView setFrame:](self->_audioMessageView, "setFrame:", v20, v21, v23, v22);
    p_sentBalloonView = (id *)&self->_messageBackgroundView;
  }
  objc_msgSend(*p_sentBalloonView, "setFrame:", v20, v21, v23, v22);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *audioMessageView;
  double v13;
  double v14;
  double v15;
  CKTextBalloonView *sentBalloonView;
  double v17;
  void *v18;
  uint64_t v19;
  double v20;
  SCKPMessageCardSectionAttachmentView *attachmentView;
  double v22;
  double v23;
  double v24;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[UIButton sizeThatFits:](self->_sendButton, "sizeThatFits:");
  if (v6 >= width * 0.5)
    v6 = width * 0.5;
  v7 = v6 + 36.0;
  v8 = width - (v6 + 36.0);
  v9 = height + -24.0;
  v10 = *MEMORY[0x24BDBF148];
  v11 = *(double *)(MEMORY[0x24BDBF148] + 8);
  audioMessageView = self->_audioMessageView;
  if (audioMessageView
    || (audioMessageView = self->_textView) != 0
    || (audioMessageView = self->_sentBalloonView,
        v13 = *(double *)(MEMORY[0x24BDBF148] + 8),
        v14 = *MEMORY[0x24BDBF148],
        audioMessageView))
  {
    objc_msgSend(audioMessageView, "sizeThatFits:", v8, v9);
    v14 = v15;
    v13 = v9;
  }
  sentBalloonView = self->_sentBalloonView;
  v17 = 24.0;
  if (sentBalloonView && !self->_sendButton)
  {
    -[CKTextBalloonView attributedText](sentBalloonView, "attributedText", 24.0, v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "length");

    if (!v19)
      v13 = v11;
    v17 = 24.0;
    if (!v19)
    {
      v17 = 12.0;
      v14 = v10;
    }
  }
  v20 = v13 + v17;
  attachmentView = self->_attachmentView;
  if (attachmentView)
  {
    -[SCKPMessageCardSectionAttachmentView sizeThatFits:](attachmentView, "sizeThatFits:", width, height);
    v20 = v20 + v22 + 12.0;
  }
  v23 = v7 + v14;
  v24 = v20;
  result.height = v24;
  result.width = v23;
  return result;
}

- (id)displayedText
{
  return -[UITextView text](self->_textView, "text");
}

- (void)textViewDidBeginEditing:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "messageCardSectionViewBeganEditing:", self);

}

- (void)textViewDidEndEditing:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "messageCardSectionViewFinishedEditing:", self);

}

- (void)_sendButtonPressed:(id)a3
{
  id WeakRetained;

  -[UIButton setEnabled:](self->_sendButton, "setEnabled:", 0);
  -[UITextView resignFirstResponder](self->_textView, "resignFirstResponder");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "messageCardSectionSendButtonTapped:", self);

}

- (void)audioMessagePlayButtonTapped:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "messageCardSectionPlayButtonTapped:", self);

}

- (void)setMessageContents:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  -[UITextView setText:](self->_textView, "setText:", a3);
  -[UITextView text](self->_textView, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    -[UITextView text](self->_textView, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length") - 1;

    -[UITextView scrollRangeToVisible:](self->_textView, "scrollRangeToVisible:", v7, 1);
  }
}

- (void)dismissKeyboard
{
  -[UITextView resignFirstResponder](self->_textView, "resignFirstResponder");
}

- (BOOL)keyboardIsVisible
{
  return -[UITextView isFirstResponder](self->_textView, "isFirstResponder");
}

- (int64_t)playButtonState
{
  return -[SCKPAudioMessageView playButtonState](self->_audioMessageView, "playButtonState");
}

- (void)setPlayButtonState:(int64_t)a3
{
  -[SCKPAudioMessageView setPlayButtonState:](self->_audioMessageView, "setPlayButtonState:", a3);
}

- (void)userDidTapAttachmentView:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "messageCardSectionAttachmentTapped:", self);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageBackgroundView, 0);
  objc_storeStrong((id *)&self->_audioMessageView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_attachmentView, 0);
  objc_storeStrong((id *)&self->_sendButton, 0);
  objc_storeStrong((id *)&self->_sentBalloonView, 0);
  objc_storeStrong((id *)&self->_textView, 0);
}

@end
