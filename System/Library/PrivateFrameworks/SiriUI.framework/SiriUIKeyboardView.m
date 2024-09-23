@implementation SiriUIKeyboardView

+ (id)_textFieldFont
{
  return (id)objc_msgSend(MEMORY[0x24BDF6A70], "siriui_typedTextInputFont");
}

+ (double)_textFieldHeight
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(a1, "_textFieldFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 36.0);
  UIRoundToViewScale();
  v4 = v3;

  return v4;
}

+ (double)_keyboardAccessoryViewHeight
{
  double v2;

  objc_msgSend(a1, "_textFieldHeight");
  return v2 + 20.0;
}

+ (id)inputAccessoryViewBackgroundColor
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 0.25);
}

- (SiriUIKeyboardView)initWithDelegate:(id)a3
{
  id v4;
  SiriUIKeyboardView *v5;
  SiriUIKeyboardView *v6;

  v4 = a3;
  v5 = -[SiriUIKeyboardView init](self, "init");
  v6 = v5;
  if (v5)
    -[SiriUIKeyboardView setDelegate:](v5, "setDelegate:", v4);

  return v6;
}

- (SiriUIKeyboardView)init
{
  self->_verticalCompensation = 0.0;
  -[SiriUIKeyboardView _defaultFrame](self, "_defaultFrame");
  return -[SiriUIKeyboardView initWithFrame:inputViewStyle:](self, "initWithFrame:inputViewStyle:", 1);
}

- (SiriUIKeyboardView)initWithFrame:(CGRect)a3 inputViewStyle:(int64_t)a4
{
  SiriUIKeyboardView *v4;
  SiriUIKeyboardView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  SiriUIHelpButton *helpButton;
  uint64_t v12;
  UITextField *textField;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SiriUIKeyboardView;
  v4 = -[UIInputView initWithFrame:inputViewStyle:](&v16, sel_initWithFrame_inputViewStyle_, 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4)
  {
    v6 = *MEMORY[0x24BDBF090];
    v7 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v8 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v9 = *(double *)(MEMORY[0x24BDBF090] + 24);
    -[SiriUIKeyboardView _createHelpButton:](v4, "_createHelpButton:", *MEMORY[0x24BDBF090], v7, v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    helpButton = v5->_helpButton;
    v5->_helpButton = (SiriUIHelpButton *)v10;

    -[SiriUIKeyboardView _createTextFieldWithFrame:](v5, "_createTextFieldWithFrame:", v6, v7, v8, v9);
    v12 = objc_claimAutoreleasedReturnValue();
    textField = v5->_textField;
    v5->_textField = (UITextField *)v12;

    -[UITextField setInputAccessoryView:](v5->_textField, "setInputAccessoryView:", v5);
    -[SiriUIKeyboardView _configureReportBugButton](v5, "_configureReportBugButton");
    -[SiriUIKeyboardView setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SiriUIKeyboardView addSubview:](v5, "addSubview:", v5->_helpButton);
    -[SiriUIKeyboardView addSubview:](v5, "addSubview:", v5->_textField);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v5, sel__keyboardWillShow_, *MEMORY[0x24BDF7B80], 0);
    objc_msgSend(v14, "addObserver:selector:name:object:", v5, sel__keyboardWillHide_, *MEMORY[0x24BDF7B78], 0);

  }
  return v5;
}

- (CGRect)_defaultFrame
{
  CGFloat Width;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect v8;
  CGRect result;

  -[SiriUIKeyboardView bounds](self, "bounds");
  Width = CGRectGetWidth(v8);
  objc_msgSend((id)objc_opt_class(), "_keyboardAccessoryViewHeight");
  v4 = v3;
  v5 = 0.0;
  v6 = 0.0;
  v7 = Width;
  result.size.height = v4;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (void)safeAreaInsetsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SiriUIKeyboardView;
  -[SiriUIKeyboardView safeAreaInsetsDidChange](&v3, sel_safeAreaInsetsDidChange);
  -[SiriUIKeyboardView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (UIEdgeInsets)safeAreaInsets
{
  double v3;
  double v4;
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
  double v15;
  double v16;
  objc_super v17;
  UIEdgeInsets result;

  v17.receiver = self;
  v17.super_class = (Class)SiriUIKeyboardView;
  -[SiriUIKeyboardView safeAreaInsets](&v17, sel_safeAreaInsets);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (v7 > 0.0)
  {
    -[SiriUIKeyboardView superview](self, "superview");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "safeAreaInsets");
    v8 = v12;

  }
  v13 = v4;
  v14 = v6;
  v15 = v8;
  v16 = v10;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  v2 = *MEMORY[0x24BDF7FB8];
  -[SiriUIKeyboardView safeAreaInsets](self, "safeAreaInsets");
  v4 = v3;
  objc_msgSend((id)objc_opt_class(), "_keyboardAccessoryViewHeight");
  v6 = v4 + v5;
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scale");
  v8 = ceil(v2);
  v9 = ceil(v6);
  if (v10 < 2.0)
  {
    v6 = v9;
    v2 = v8;
  }

  v11 = v2;
  v12 = v6;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)setText:(id)a3
{
  -[UITextField setText:](self->_textField, "setText:", a3);
}

- (BOOL)becomeFirstResponder
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SiriUIKeyboardView;
  -[SiriUIKeyboardView becomeFirstResponder](&v4, sel_becomeFirstResponder);
  return -[UITextField becomeFirstResponder](self->_textField, "becomeFirstResponder");
}

- (BOOL)resignFirstResponder
{
  char v3;
  objc_super v5;

  v3 = -[UITextField resignFirstResponder](self->_textField, "resignFirstResponder");
  v5.receiver = self;
  v5.super_class = (Class)SiriUIKeyboardView;
  -[SiriUIKeyboardView resignFirstResponder](&v5, sel_resignFirstResponder);
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  _BOOL4 v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat x;
  CGFloat v32;
  CGFloat v33;
  SiriUIAudioRoutePickerButton *audioRoutePickerButton;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  char v40;
  double v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  double MaxX;
  CGFloat v49;
  double v50;
  SiriUIContentButton *reportBugButton;
  double v52;
  CGFloat v53;
  CGFloat v54;
  double v55;
  CGFloat v56;
  double v57;
  CGFloat v58;
  CGFloat v59;
  double v60;
  CGFloat v61;
  double v62;
  double v63;
  double v64;
  double v65;
  CGFloat v66;
  CGFloat v67;
  double v68;
  double v69;
  double MinX;
  double v71;
  double v72;
  double v73;
  double v74;
  CGFloat v75;
  CGFloat y;
  CGFloat v77;
  CGFloat width;
  double v79;
  CGFloat rect;
  CGFloat rect_8a;
  double rect_8;
  double rect_16;
  double rect_16a;
  CGFloat rect_24;
  CGFloat v86;
  double v87;
  double v88;
  CGFloat v89;
  CGFloat v90;
  CGFloat v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  CGFloat v97;
  double v98;
  CGRect v99;
  __objc2_class *v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;
  CGRect v120;
  CGRect v121;

  *(_QWORD *)&v99.size.height = self;
  v100 = SiriUIKeyboardView;
  -[CGFloat layoutSubviews]((objc_super *)&v99.size.height, sel_layoutSubviews);
  -[SiriUIKeyboardView frame](self, "frame");
  v4 = v3;
  v92 = v5;
  v7 = v6;
  v9 = v8;
  -[SiriUIKeyboardView safeAreaInsets](self, "safeAreaInsets");
  v11 = v10;
  v13 = v12;
  objc_msgSend(MEMORY[0x24BDF6A80], "metricsForTextStyle:", *MEMORY[0x24BDF77B0]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "scaledValueForValue:", 10.0);
  v16 = v15;

  -[UITextField layer](self->_textField, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setCornerRadius:", v16);

  v18 = SiriUIIsCompactWidth();
  v19 = 25.0;
  if (v18)
    v19 = 15.0;
  if (v19 < v11)
    v19 = v11;
  v87 = v19;
  -[SiriUIHelpButton frame](self->_helpButton, "frame");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v90 = v7;
  v91 = v4;
  v101.origin.x = v4;
  v28 = v92;
  v101.origin.y = v92;
  v101.size.width = v7;
  v89 = v9;
  v101.size.height = v9;
  v93 = v13;
  v29 = CGRectGetHeight(v101) - v13;
  v102.origin.x = v21;
  v102.origin.y = v23;
  rect_24 = v27;
  v86 = v25;
  v102.size.width = v25;
  v102.size.height = v27;
  v30 = v29 - CGRectGetHeight(v102);
  rect_16 = self->_verticalCompensation;
  x = *MEMORY[0x24BDBF090];
  v32 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v33 = *(double *)(MEMORY[0x24BDBF090] + 16);
  audioRoutePickerButton = self->_audioRoutePickerButton;
  v35 = floor(v30 * 0.5);
  v36 = v33;
  v37 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v38 = v32;
  v39 = *MEMORY[0x24BDBF090];
  v99.size.width = v37;
  if (audioRoutePickerButton)
  {
    v96 = v35;
    v40 = -[SiriUIAudioRoutePickerButton isHidden](audioRoutePickerButton, "isHidden");
    v35 = v96;
    v36 = v33;
    v38 = v32;
    v39 = x;
    if ((v40 & 1) == 0)
    {
      -[SiriUIAudioRoutePickerButton frame](self->_audioRoutePickerButton, "frame", v96);
      rect = v41;
      rect_8a = v42;
      v43 = v42;
      v45 = v44;
      v47 = v46;
      v103.origin.y = v92;
      v103.origin.x = v91;
      v103.size.width = v90;
      v103.size.height = v89;
      v99.origin.x = x;
      MaxX = CGRectGetMaxX(v103);
      v104.origin.x = rect;
      v104.origin.y = v43;
      v104.size.width = v45;
      v104.size.height = v47;
      v39 = MaxX - CGRectGetWidth(v104) - v87;
      v105.origin.x = v91;
      v105.origin.y = v92;
      v105.size.width = v90;
      v105.size.height = v89;
      v49 = CGRectGetHeight(v105) - v93;
      v106.origin.x = v39;
      v106.origin.y = rect_8a;
      v36 = v45;
      v106.size.width = v45;
      v37 = v47;
      v106.size.height = v47;
      v28 = v92;
      v38 = self->_verticalCompensation + v92 + floor((v49 - CGRectGetHeight(v106)) * 0.5);
      v35 = v96;
      x = v99.origin.x;
    }
  }
  v50 = v28 + v35;
  reportBugButton = self->_reportBugButton;
  if (reportBugButton)
  {
    rect_8 = v28 + v35;
    -[SiriUIContentButton frame](reportBugButton, "frame");
    v53 = v52;
    v99.size.width = v54;
    v56 = v55;
    v97 = v39;
    v58 = v57;
    v107.size.width = v90;
    v107.origin.x = v91;
    v107.origin.y = v28;
    v107.size.height = v89;
    v59 = CGRectGetHeight(v107) - v93;
    v108.origin.x = v53;
    v108.origin.y = v99.size.width;
    v94 = v56;
    v108.size.width = v56;
    v99.size.width = v58;
    v108.size.height = v58;
    v39 = v97;
    v60 = floor((v59 - CGRectGetHeight(v108)) * 0.5);
    v61 = v28;
    v62 = self->_verticalCompensation + v28 + v60;
    v109.origin.x = v97;
    v63 = v38;
    v109.origin.y = v38;
    v109.size.width = v36;
    v109.size.height = v37;
    v99.origin.y = v62;
    if (CGRectIsEmpty(v109))
    {
      v110.size.width = v90;
      v110.origin.x = v91;
      v110.origin.y = v61;
      v110.size.height = v89;
      v33 = v94;
      v64 = v87;
      v99.origin.x = CGRectGetMaxX(v110) - v94 - v87;
    }
    else
    {
      v111.origin.x = v97;
      v111.origin.y = v38;
      v111.size.width = v36;
      v111.size.height = v37;
      v66 = CGRectGetMinX(v111) - v87;
      v112.origin.x = v53;
      v67 = v62;
      v64 = v87;
      v112.origin.y = v67;
      v112.size.width = v94;
      v112.size.height = v99.size.width;
      v99.origin.x = v66 - CGRectGetWidth(v112);
      v33 = v94;
    }
    v38 = v63;
    v50 = rect_8;
    v65 = rect_16;
  }
  else
  {
    v99.origin.x = x;
    v99.origin.y = v32;
    v64 = v87;
    v65 = rect_16;
  }
  v68 = v65 + v50;
  objc_msgSend((id)objc_opt_class(), "_textFieldHeight");
  rect_16a = v69;
  v113.origin.x = v39;
  v113.origin.y = v38;
  v113.size.width = v36;
  v113.size.height = v37;
  v95 = v33;
  v98 = v39;
  v88 = v38;
  if (CGRectIsEmpty(v113))
  {
    v114.origin.x = v99.origin.x;
    v114.origin.y = v99.origin.y;
    v114.size.width = v33;
    v114.size.height = v99.size.width;
    if (CGRectIsEmpty(v114))
    {
      v115.origin.x = v91;
      v115.origin.y = v92;
      v115.size.height = v89;
      v115.size.width = v90;
      MinX = CGRectGetMaxX(v115);
LABEL_26:
      v79 = MinX;
      v120.origin.x = v64;
      v120.origin.y = v68;
      v74 = rect_24;
      v73 = v86;
      v120.size.width = v86;
      v120.size.height = rect_24;
      v71 = v79 - CGRectGetMaxX(v120) + v64 * -2.0;
      v72 = rect_16a;
      goto LABEL_27;
    }
  }
  v116.origin.x = v39;
  v116.origin.y = v38;
  v116.size.width = v36;
  v116.size.height = v37;
  if (!CGRectIsEmpty(v116))
  {
    v117.origin.x = v99.origin.x;
    v117.origin.y = v99.origin.y;
    v117.size.width = v33;
    v117.size.height = v99.size.width;
    if (!CGRectIsEmpty(v117))
    {
      v75 = v99.origin.x;
      y = v99.origin.y;
      v77 = v33;
      width = v99.size.width;
      goto LABEL_25;
    }
  }
  v118.origin.x = v39;
  v118.origin.y = v38;
  v118.size.width = v36;
  v118.size.height = v37;
  if (!CGRectIsEmpty(v118))
  {
    v75 = v39;
    y = v38;
    v77 = v36;
    width = v37;
LABEL_25:
    MinX = CGRectGetMinX(*(CGRect *)&v75);
    goto LABEL_26;
  }
  v119.origin.x = v99.origin.x;
  v119.origin.y = v99.origin.y;
  v119.size.width = v33;
  v119.size.height = v99.size.width;
  if (!CGRectIsEmpty(v119))
  {
    v75 = v99.origin.x;
    y = v99.origin.y;
    v77 = v33;
    width = v99.size.width;
    goto LABEL_25;
  }
  v71 = *MEMORY[0x24BDBF148];
  v72 = *(double *)(MEMORY[0x24BDBF148] + 8);
  v74 = rect_24;
  v73 = v86;
LABEL_27:
  v121.origin.x = v64;
  v121.origin.y = v68;
  v121.size.width = v73;
  v121.size.height = v74;
  -[UITextField setFrame:](self->_textField, "setFrame:", v64 + CGRectGetMaxX(v121), self->_verticalCompensation + 10.0, v71, v72);
  -[SiriUIHelpButton setFrame:](self->_helpButton, "setFrame:", v64, v68, v73, v74);
  -[SiriUIContentButton setFrame:](self->_reportBugButton, "setFrame:", v99.origin.x, v99.origin.y, v95, v99.size.width);
  -[SiriUIAudioRoutePickerButton setFrame:](self->_audioRoutePickerButton, "setFrame:", v98, v88, v36, v37);
}

+ (double)_paddingBetweenKeyboardAndInputAccessoryViewWhenMinimized:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  uint64_t v5;
  double result;
  double v7;
  double v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  result = 10.0;
  v7 = 5.0;
  if (!v3)
    v7 = 10.0;
  v8 = floor(v7);
  if (v5 == 1)
    return v8;
  return result;
}

- (id)_createHelpButton:(CGRect)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;

  +[SiriUIHelpButton buttonWithHelpImageMask](SiriUIHelpButton, "buttonWithHelpImageMask", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 0.0);
  objc_msgSend(v4, "_setTouchInsets:", -0.5, -0.5, -0.5, -0.5);
  objc_msgSend(v4, "setEmphasized:", 1);
  objc_msgSend(v4, "imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentMode:", 4);

  objc_msgSend(v4, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHitTestsAsOpaque:", 1);

  objc_msgSend(v4, "sizeToFit");
  objc_msgSend(v4, "frame");
  v8 = v7;
  v10 = v9;
  objc_msgSend(v4, "imageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "size");
  v13 = v12 + 0.0;
  objc_msgSend((id)objc_opt_class(), "_keyboardAccessoryViewHeight");
  v15 = v14;

  objc_msgSend(v4, "setFrame:", v8, v10, v13, v15);
  objc_msgSend(v4, "addTarget:action:forControlEvents:", self, sel__helpButtonTapped_, 64);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BA0]), "initWithTarget:action:", self, sel__helpButtonLongPressed_);
  objc_msgSend(v4, "addGestureRecognizer:", v16);

  return v4;
}

- (void)_helpButtonTapped:(id)a3
{
  id v4;

  -[SiriUIKeyboardView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyboardViewDidReceiveHelpButtonAction:", self);

}

- (void)_helpButtonLongPressed:(id)a3
{
  id v4;

  if (objc_msgSend(a3, "state") == 3)
  {
    -[UITextField resignFirstResponder](self->_textField, "resignFirstResponder");
    -[SiriUIKeyboardView delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "keyboardViewDidReceiveHelpButtonAction:", self);

  }
}

- (id)_createTextFieldWithFrame:(CGRect)a3
{
  SiriUITextField *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  uint64_t v17;

  v4 = -[SiriUITextField initWithFrame:]([SiriUITextField alloc], "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[SiriUITextField setDelegate:](v4, "setDelegate:", self);
  -[SiriUITextField setDelegate:](v4, "setDelegate:", self);
  -[SiriUITextField setKeyboardType:](v4, "setKeyboardType:", 0);
  -[SiriUITextField setKeyboardAppearance:](v4, "setKeyboardAppearance:", 1);
  -[SiriUITextField setReturnKeyType:](v4, "setReturnKeyType:", 9);
  -[SiriUITextField setEnablesReturnKeyAutomatically:](v4, "setEnablesReturnKeyAutomatically:", 1);
  -[SiriUITextField setEnablesReturnKeyOnNonWhiteSpaceContent:](v4, "setEnablesReturnKeyOnNonWhiteSpaceContent:", 1);
  objc_msgSend(MEMORY[0x24BDF6950], "siriui_lightTextColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUITextField setTextColor:](v4, "setTextColor:", v5);

  objc_msgSend((id)objc_opt_class(), "inputAccessoryViewBackgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUITextField setBackgroundColor:](v4, "setBackgroundColor:", v6);

  objc_msgSend(MEMORY[0x24BDF6950], "siriui_lightInsertionPointColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUITextField setInsertionPointColor:](v4, "setInsertionPointColor:", v7);

  objc_msgSend((id)objc_opt_class(), "_textFieldFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUITextField setFont:](v4, "setFont:", v8);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.SiriUI"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "siriUILocalizedStringForKey:value:table:", CFSTR("SIRI_TEXTINPUT_PLACEHOLDER"), CFSTR("Type to Siri"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUITextField setPlaceholder:](v4, "setPlaceholder:", v10);
  -[SiriUITextField _placeholderLabel](v4, "_placeholderLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUITextField textColor](v4, "textColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "colorWithAlphaComponent:", 0.45);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTextColor:", v13);

  -[SiriUITextField font](v4, "font");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFont:", v14);

  objc_msgSend(v11, "setAdjustsFontSizeToFitWidth:", 1);
  objc_msgSend(v11, "setBaselineAdjustment:", 1);
  objc_msgSend(v11, "setMinimumScaleFactor:", 0.01);
  LODWORD(v15) = 1132068864;
  -[SiriUITextField setContentHuggingPriority:forAxis:](v4, "setContentHuggingPriority:forAxis:", 0, v15);
  LODWORD(v16) = 1132068864;
  -[SiriUITextField setContentCompressionResistancePriority:forAxis:](v4, "setContentCompressionResistancePriority:forAxis:", 0, v16);
  -[SiriUIKeyboardView setClipsToBounds:](self, "setClipsToBounds:", 0);
  if (SiriLanguageIsRTL())
    v17 = 2;
  else
    v17 = 0;
  -[SiriUITextField setTextAlignment:](v4, "setTextAlignment:", v17);
  -[SiriUITextField setAutocorrectionType:](v4, "setAutocorrectionType:", 0);
  -[SiriUITextField setSpellCheckingType:](v4, "setSpellCheckingType:", 0);
  -[SiriUITextField setAutocapitalizationType:](v4, "setAutocapitalizationType:", 2);

  return v4;
}

- (void)_configureAudioRoutePickerForAccessibility
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;

  -[SiriUIAudioRoutePickerButton setIsAccessibilityElement:](self->_audioRoutePickerButton, "setIsAccessibilityElement:", 1);
  v3 = *MEMORY[0x24BDBF090];
  v4 = *(double *)(MEMORY[0x24BDBF090] + 8);
  -[SiriUIAudioRoutePickerButton sizeThatFits:](self->_audioRoutePickerButton, "sizeThatFits:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
  v6 = v5 + 0.0;
  objc_msgSend((id)objc_opt_class(), "_keyboardAccessoryViewHeight");
  -[SiriUIAudioRoutePickerButton setFrame:](self->_audioRoutePickerButton, "setFrame:", v3, v4, v6, v7);
  -[SiriUIAudioRoutePickerButton imageView](self->_audioRoutePickerButton, "imageView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setContentMode:", 4);

}

- (void)setShowAudioRoutePicker:(BOOL)a3
{
  SiriUIAudioRoutePickerButton *v5;
  SiriUIAudioRoutePickerButton *v6;
  SiriUIAudioRoutePickerButton *audioRoutePickerButton;
  SiriUIAudioRoutePickerButton *v8;
  SiriUIAudioRoutePickerButton *v9;
  void *v10;
  uint64_t v11;
  SiriUIAudioRoutePickerButton *v12;
  _QWORD v13[4];
  SiriUIAudioRoutePickerButton *v14;
  SiriUIKeyboardView *v15;
  BOOL v16;
  _QWORD v17[4];
  SiriUIAudioRoutePickerButton *v18;
  BOOL v19;

  if (a3 && !self->_audioRoutePickerButton)
  {
    v5 = [SiriUIAudioRoutePickerButton alloc];
    v6 = -[SiriUIAudioRoutePickerButton initWithFrame:](v5, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    audioRoutePickerButton = self->_audioRoutePickerButton;
    self->_audioRoutePickerButton = v6;

    -[SiriUIAudioRoutePickerButton addTarget:action:forControlEvents:](self->_audioRoutePickerButton, "addTarget:action:forControlEvents:", self, sel__audioRouteButtonTapped_, 64);
    -[SiriUIAudioRoutePickerButton setAlpha:](self->_audioRoutePickerButton, "setAlpha:", 0.0);
    -[SiriUIAudioRoutePickerButton _setTouchInsets:](self->_audioRoutePickerButton, "_setTouchInsets:", -0.5, -0.5, -0.5, -0.5);
    -[SiriUIKeyboardView addSubview:](self, "addSubview:", self->_audioRoutePickerButton);
    -[SiriUIKeyboardView _configureAudioRoutePickerForAccessibility](self, "_configureAudioRoutePickerForAccessibility");
    -[SiriUIKeyboardView setNeedsLayout](self, "setNeedsLayout");
  }
  v8 = self->_audioRoutePickerButton;
  if (v8)
  {
    v9 = v8;
    v10 = (void *)MEMORY[0x24BDF6F90];
    v11 = MEMORY[0x24BDAC760];
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __46__SiriUIKeyboardView_setShowAudioRoutePicker___block_invoke;
    v17[3] = &unk_24D7D9638;
    v18 = v9;
    v19 = a3;
    v13[0] = v11;
    v13[1] = 3221225472;
    v13[2] = __46__SiriUIKeyboardView_setShowAudioRoutePicker___block_invoke_2;
    v13[3] = &unk_24D7D9660;
    v16 = a3;
    v14 = v18;
    v15 = self;
    v12 = v18;
    objc_msgSend(v10, "animateWithDuration:animations:completion:", v17, v13, 0.2);

  }
}

uint64_t __46__SiriUIKeyboardView_setShowAudioRoutePicker___block_invoke(uint64_t a1, double a2)
{
  LOBYTE(a2) = *(_BYTE *)(a1 + 40);
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", (double)*(unint64_t *)&a2);
}

uint64_t __46__SiriUIKeyboardView_setShowAudioRoutePicker___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  if (!*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
    v2 = *(_QWORD *)(a1 + 40);
    v3 = *(void **)(v2 + 640);
    if (v3 == *(void **)(a1 + 32))
    {
      *(_QWORD *)(v2 + 640) = 0;

    }
  }
  return objc_msgSend(*(id *)(a1 + 40), "setNeedsLayout");
}

- (void)setAudioRoutePickerBluetoothOn:(BOOL)a3
{
  -[SiriUIAudioRoutePickerButton setBluetoothOn:](self->_audioRoutePickerButton, "setBluetoothOn:", a3);
}

- (void)_audioRouteButtonTapped:(id)a3
{
  id v4;

  -[SiriUIKeyboardView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyboardViewDidReceiveAudioRouteAction:", self);

}

- (void)_reportBugButtonTapped
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "keyboardViewDidReceiveReportBugAction:", self);

}

- (void)_reportBugButtonLongPressed
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "keyboardViewDidReceiveBugButtonLongPress:", self);

}

- (BOOL)_showsReportBugButton
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "debugButtonIsEnabled"))
    v3 = AFIsInternalInstall();
  else
    v3 = 0;

  return v3;
}

- (void)_configureReportBugButton
{
  _QWORD v3[4];
  id v4;
  id location;

  if (!self->_reportBugButton)
  {
    if (-[SiriUIKeyboardView _showsReportBugButton](self, "_showsReportBugButton"))
    {
      objc_initWeak(&location, self);
      v3[0] = MEMORY[0x24BDAC760];
      v3[1] = 3221225472;
      v3[2] = __47__SiriUIKeyboardView__configureReportBugButton__block_invoke;
      v3[3] = &unk_24D7D9688;
      objc_copyWeak(&v4, &location);
      -[SiriUIKeyboardView _loadReportBugButtonTemplateImageInBackgroundWithCompletion:](self, "_loadReportBugButtonTemplateImageInBackgroundWithCompletion:", v3);
      objc_destroyWeak(&v4);
      objc_destroyWeak(&location);
    }
  }
}

void __47__SiriUIKeyboardView__configureReportBugButton__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __47__SiriUIKeyboardView__configureReportBugButton__block_invoke_2;
  v5[3] = &unk_24D7D93A0;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

  objc_destroyWeak(&v7);
}

void __47__SiriUIKeyboardView__configureReportBugButton__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_createReportBugButtonWithTemplateImage:", *(_QWORD *)(a1 + 32));

}

- (void)_configureReportButtonForAccessibility
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  id v10;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.SiriUI"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "siriUILocalizedStringForKey:value:table:", CFSTR("SIRI_TEXTINPUT_REPORTBUGBUTTON_TITLE"), CFSTR("Report"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUIContentButton setAccessibilityLabel:](self->_reportBugButton, "setAccessibilityLabel:", v3);
  -[SiriUIContentButton setIsAccessibilityElement:](self->_reportBugButton, "setIsAccessibilityElement:", 1);
  v4 = *MEMORY[0x24BDBF090];
  v5 = *(double *)(MEMORY[0x24BDBF090] + 8);
  -[SiriUIContentButton sizeThatFits:](self->_reportBugButton, "sizeThatFits:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
  v7 = v6 + 0.0;
  objc_msgSend((id)objc_opt_class(), "_keyboardAccessoryViewHeight");
  -[SiriUIContentButton setFrame:](self->_reportBugButton, "setFrame:", v4, v5, v7, v8);
  -[SiriUIContentButton imageView](self->_reportBugButton, "imageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setContentMode:", 4);

}

- (void)_createReportBugButtonWithTemplateImage:(id)a3
{
  SiriUIContentButton *v4;
  SiriUIContentButton *reportBugButton;
  id v6;

  if (!self->_reportBugButton)
  {
    +[SiriUIContentButton buttonWithImageTemplate:style:](SiriUIContentButton, "buttonWithImageTemplate:style:", a3, 0);
    v4 = (SiriUIContentButton *)objc_claimAutoreleasedReturnValue();
    reportBugButton = self->_reportBugButton;
    self->_reportBugButton = v4;

    -[SiriUIContentButton _setTouchInsets:](self->_reportBugButton, "_setTouchInsets:", -0.5, -0.5, -0.5, -0.5);
    -[SiriUIContentButton setAlpha:](self->_reportBugButton, "setAlpha:", 1.0);
    -[SiriUIContentButton addTarget:action:forControlEvents:](self->_reportBugButton, "addTarget:action:forControlEvents:", self, sel__reportBugButtonTapped, 64);
    v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BA0]), "initWithTarget:action:", self, sel__reportBugButtonLongPressed);
    -[SiriUIContentButton addGestureRecognizer:](self->_reportBugButton, "addGestureRecognizer:", v6);
    -[SiriUIKeyboardView addSubview:](self, "addSubview:", self->_reportBugButton);
    -[SiriUIKeyboardView _configureReportButtonForAccessibility](self, "_configureReportButtonForAccessibility");
    -[SiriUIContentButton setHidden:](self->_reportBugButton, "setHidden:", 0);
    -[SiriUIKeyboardView setNeedsLayout](self, "setNeedsLayout");

  }
}

- (void)_loadReportBugButtonTemplateImageInBackgroundWithCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  dispatch_get_global_queue(9, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __82__SiriUIKeyboardView__loadReportBugButtonTemplateImageInBackgroundWithCompletion___block_invoke;
  block[3] = &unk_24D7D96B0;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, block);

}

void __82__SiriUIKeyboardView__loadReportBugButtonTemplateImageInBackgroundWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/AppleInternal/Library/Assistant/UIPlugins/Debug.siriUIBundle"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v7 = v2;
    objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("radarBug"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "imageWithRenderingMode:", 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = *(_QWORD *)(a1 + 32);
    if (v5)
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v4);

    goto LABEL_7;
  }
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    v7 = 0;
    (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, 0);
LABEL_7:
    v2 = v7;
  }

}

- (void)_undoTextFieldEdit:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[SiriUIKeyboardView undoManager](self, "undoManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isUndoRegistrationEnabled");

  if (v5)
  {
    -[SiriUIKeyboardView undoManager](self, "undoManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField text](self->_textField, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "registerUndoWithTarget:selector:object:", self, sel__undoTextFieldEdit_, v7);

    -[UITextField setText:](self->_textField, "setText:", v8);
  }

}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[SiriUIKeyboardView undoManager](self, "undoManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isUndoRegistrationEnabled");

  if (v6)
  {
    -[SiriUIKeyboardView undoManager](self, "undoManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "registerUndoWithTarget:selector:object:", self, sel__undoTextFieldEdit_, v8);

  }
  return 1;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  void *v5;

  if (!a4.location && a4.length == 1)
  {
    objc_msgSend(MEMORY[0x24BE090C8], "sharedAnalytics", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "logEventWithType:machAbsoluteTime:context:", 1446, mach_absolute_time(), 0);

  }
  return 1;
}

- (BOOL)textFieldShouldClear:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BE090C8];
  v4 = a3;
  objc_msgSend(v3, "sharedAnalytics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = mach_absolute_time();
  v10 = CFSTR("text");
  objc_msgSend(v4, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logEventWithType:machAbsoluteTime:context:", 1448, v6, v8);

  return 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BE090C8];
  v5 = a3;
  objc_msgSend(v4, "sharedAnalytics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = mach_absolute_time();
  v13 = CFSTR("text");
  objc_msgSend(v5, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "logEventWithType:machAbsoluteTime:context:", 1447, v7, v9);

  -[SiriUIKeyboardView delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "keyboardView:didReceiveText:", self, v11);
  return 1;
}

- (void)_keyboardWillShow:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  double v10;

  -[SiriUIKeyboardView _visibleHeightFromNotification:](self, "_visibleHeightFromNotification:", a3);
  v5 = v4;
  objc_msgSend((id)objc_opt_class(), "_keyboardAccessoryViewHeight");
  if (v5 > v6)
  {
    objc_msgSend((id)objc_opt_class(), "_paddingBetweenKeyboardAndInputAccessoryViewWhenMinimized:", 0);
    self->_interKeyboardAccessoryViewPadding = v7;
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "userInterfaceIdiom");
    v10 = 0.0;
    if (v9 == 1)
      v10 = floor(self->_interKeyboardAccessoryViewPadding * 0.5);
    self->_verticalCompensation = v10;

    -[SiriUIKeyboardView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_keyboardWillHide:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;

  -[SiriUIKeyboardView _visibleHeightFromNotification:](self, "_visibleHeightFromNotification:", a3);
  v5 = v4;
  objc_msgSend((id)objc_opt_class(), "_keyboardAccessoryViewHeight");
  if (v5 == v6)
  {
    objc_msgSend((id)objc_opt_class(), "_paddingBetweenKeyboardAndInputAccessoryViewWhenMinimized:", 1);
    self->_interKeyboardAccessoryViewPadding = floor(v7);
    self->_verticalCompensation = 0.0;
    -[SiriUIKeyboardView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (double)_visibleHeightFromNotification:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  double MaxY;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  objc_msgSend(a3, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BDF7A20]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "CGRectValue");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  MaxY = CGRectGetMaxY(v16);

  v17.origin.x = v6;
  v17.origin.y = v8;
  v17.size.width = v10;
  v17.size.height = v12;
  if (CGRectGetHeight(v17) == 0.0
    || (v18.origin.x = v6, v18.origin.y = v8, v18.size.width = v10, v18.size.height = v12, CGRectGetMaxY(v18) >= MaxY))
  {
    v20.origin.x = v6;
    v20.origin.y = v8;
    v20.size.width = v10;
    v20.size.height = v12;
    return MaxY - CGRectGetMinY(v20);
  }
  else
  {
    v19.origin.x = v6;
    v19.origin.y = v8;
    v19.size.width = v10;
    v19.size.height = v12;
    return CGRectGetHeight(v19);
  }
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF7B80], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BDF7B78], 0);

  v5.receiver = self;
  v5.super_class = (Class)SiriUIKeyboardView;
  -[SiriUIKeyboardView dealloc](&v5, sel_dealloc);
}

- (UITextField)textField
{
  return self->_textField;
}

- (void)setTextField:(id)a3
{
  objc_storeStrong((id *)&self->_textField, a3);
}

- (SiriUIKeyboardViewDelegate)delegate
{
  return (SiriUIKeyboardViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_textField, 0);
  objc_storeStrong((id *)&self->_originalInstalledLanguageIdentifiers, 0);
  objc_storeStrong((id *)&self->_reportBugButton, 0);
  objc_storeStrong((id *)&self->_audioRoutePickerButton, 0);
  objc_storeStrong((id *)&self->_helpButton, 0);
}

@end
