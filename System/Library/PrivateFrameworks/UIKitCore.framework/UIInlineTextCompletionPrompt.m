@implementation UIInlineTextCompletionPrompt

- (UIInlineTextCompletionPrompt)initWithFrame:(CGRect)a3
{
  UIInlineTextCompletionPrompt *v3;
  NSMutableArray *v4;
  NSMutableArray *typedTextViews;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIInlineTextCompletionPrompt;
  v3 = -[UIView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    typedTextViews = v3->_typedTextViews;
    v3->_typedTextViews = v4;

    -[UIView setOpaque:](v3, "setOpaque:", 0);
    -[UIView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 1);
    -[UIView setClipsToBounds:](v3, "setClipsToBounds:", 0);
  }
  return v3;
}

- (int)textEffectsVisibilityLevelInKeyboardWindow
{
  return 12;
}

- (int)textEffectsVisibilityLevel
{
  void *v2;
  int v3;

  -[UIView superview](self, "superview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "textEffectsVisibilityLevel");

  if (v3 <= 8)
    return 8;
  else
    return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[UIInlineTextCompletionPrompt removePromptSubviews](self, "removePromptSubviews");
  v3.receiver = self;
  v3.super_class = (Class)UIInlineTextCompletionPrompt;
  -[UIView dealloc](&v3, sel_dealloc);
}

- (void)removePromptSubviews
{
  UIView *textCompletionView;

  -[NSMutableArray makeObjectsPerformSelector:](self->_typedTextViews, "makeObjectsPerformSelector:", sel_removeFromSuperview);
  -[NSMutableArray removeAllObjects](self->_typedTextViews, "removeAllObjects");
  -[UIView removeFromSuperview](self->_textCompletionView, "removeFromSuperview");
  textCompletionView = self->_textCompletionView;
  self->_textCompletionView = 0;

}

- (void)setTextCompletion:(id)a3 inRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  double x;
  _BOOL8 v10;
  id v11;
  TIKeyboardCandidate *v12;
  TIKeyboardCandidate *textCompletionCandidate;
  void *v14;
  NSString *v15;
  NSString *textCompletion;
  void *v17;
  NSString *v18;
  NSString *typedText;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  double v49;
  char v50;
  double v51;
  char v52;
  double v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  NSObject *v58;
  void *v59;
  double v60;
  double v61;
  CGFloat v62;
  double v63;
  double v64;
  CGFloat v65;
  double v66;
  double v67;
  NSString *v68;
  NSString *v69;
  NSString *v70;
  void *v71;
  NSString *v72;
  id v73;
  CGFloat v74;
  double v75;
  double v76;
  CGFloat v77;
  UITextCompletionView *v78;
  double MinX;
  double v80;
  UITextCompletionView *v81;
  double v82;
  double MinY;
  UITextCompletionView *v84;
  UIView *v85;
  double v86;
  NSObject *v87;
  UITextCompletionView *v88;
  UITextCompletionView *v89;
  NSObject *v90;
  UITextCompletionView *v91;
  UIView *textCompletionView;
  void *v93;
  void *v94;
  double v95;
  CGFloat v96;
  double v97;
  CGFloat v98;
  double v99;
  CGFloat v100;
  double v101;
  CGFloat v102;
  void *v103;
  void *v104;
  CGFloat v105;
  CGFloat v106;
  CGFloat v107;
  CGFloat v108;
  _BOOL4 v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  NSRect aRect;
  uint64_t (*v117)(uint64_t);
  void *v118;
  UITextCompletionView *v119;
  uint8_t buf[4];
  void *v121;
  __int16 v122;
  void *v123;
  __int16 v124;
  void *v125;
  __int16 v126;
  void *v127;
  uint64_t v128;
  CGRect v129;
  CGRect v130;
  CGRect v131;
  CGRect v132;
  CGRect v133;
  CGRect v134;
  CGRect v135;
  CGRect v136;
  CGRect v137;
  CGRect v138;
  CGRect v139;
  NSRect v140;
  NSRect v141;
  NSRect v142;
  NSRect v143;
  NSRect v144;
  NSRect v145;
  CGRect v146;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v128 = *MEMORY[0x1E0C80C00];
  v10 = a3 == 0;
  v11 = a3;
  v12 = (TIKeyboardCandidate *)objc_msgSend(v11, "copy");
  textCompletionCandidate = self->_textCompletionCandidate;
  self->_textCompletionCandidate = v12;

  objc_msgSend(v11, "candidate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (NSString *)objc_msgSend(v14, "copy");
  textCompletion = self->_textCompletion;
  self->_textCompletion = v15;

  objc_msgSend(v11, "input");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (NSString *)objc_msgSend(v17, "copy");
  typedText = self->_typedText;
  self->_typedText = v18;

  -[UIInlineTextCompletionPrompt removePromptSubviews](self, "removePromptSubviews");
  -[UIView setHidden:](self, "setHidden:", v10);
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "inputOverlayContainer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3)
  {
    -[UIView superview](self, "superview");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
      objc_msgSend(v21, "addSubview:", self);
    v23 = v21;
    +[UIKeyboard currentDocumentState](UIKeyboard, "currentDocumentState");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "clientFrameInWindow");
    v26 = v25;
    v28 = v27;
    v30 = v29;
    v32 = v31;
    v33 = v23;
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "inputDelegate");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v35, "textInputView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33 && v36)
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "textInputView");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "convertRectToAutocorrectRect:delegateView:container:", v38, v33, v26, v28, v30, v32);
      v26 = v39;
      v28 = v40;
      v30 = v41;
      v32 = v42;

    }
    v129.origin.x = v26;
    v129.origin.y = v28;
    v129.size.width = v30;
    v129.size.height = v32;
    if (CGRectIsNull(v129))
    {
      objc_msgSend(v33, "window");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "frame");
      v26 = v44;
      v28 = v45;
      v30 = v46;
      v32 = v47;

    }
    aRect.origin.y = y;
    if (+[UIKeyboard isInputSystemUI](UIKeyboard, "isInputSystemUI"))
    {
      +[UIKeyboard keyboardApplicationIdentifier](UIKeyboard, "keyboardApplicationIdentifier");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v48 = 0;
    }
    v49 = width;
    v50 = objc_msgSend(v48, "isEqualToString:", CFSTR("com.apple.mobilemail"));
    v51 = 20.0;
    if ((v50 & 1) == 0)
    {
      v52 = objc_msgSend(v48, "isEqualToString:", CFSTR("com.apple.MobileSMS"));
      v51 = 6.0;
      if ((v52 & 1) == 0)
      {
        if (objc_msgSend(v48, "isEqualToString:", CFSTR("com.apple.mobilenotes")))
          v51 = 54.0;
        else
          v51 = 0.0;
      }
    }
    v53 = height;
    v130.origin.x = v26;
    v130.origin.y = v28;
    v130.size.width = v30;
    v130.size.height = v32;
    v131 = CGRectInset(v130, v51, 0.0);
    v54 = v131.origin.x;
    v55 = v131.origin.y;
    v56 = v131.size.width;
    v57 = v131.size.height;

    _UIKBInlineTextCompletionLog();
    v58 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
    {
      v140.origin.x = v54;
      v140.origin.y = v55;
      v140.size.width = v56;
      v140.size.height = v57;
      NSStringFromRect(v140);
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v121 = v110;
      _os_log_debug_impl(&dword_185066000, v58, OS_LOG_TYPE_DEBUG, "Computed inlineTextOverlayFrame=%@", buf, 0xCu);

    }
    aRect.origin.x = v57;

    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "scale");
    v61 = v60;

    v62 = floor(x * v61) / v61;
    v63 = floor(aRect.origin.y * v61) / v61;
    v64 = v49 * v61;
    v65 = v62;
    v66 = floor(v64) / v61;
    v67 = floor(v53 * v61) / v61;
    -[UIView setFrame:](self, "setFrame:", v62, v63, v66, v67);
    if (-[NSString length](self->_typedText, "length")
      && -[NSString hasPrefix:](self->_textCompletion, "hasPrefix:", self->_typedText))
    {
      -[NSString substringFromIndex:](self->_textCompletion, "substringFromIndex:", -[NSString length](self->_typedText, "length"));
      v68 = (NSString *)objc_claimAutoreleasedReturnValue();
      v69 = self->_textCompletion;
      self->_textCompletion = v68;

    }
    v70 = self->_textCompletion;
    _documentTextFont();
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = v70;
    v73 = v71;
    if (v72 && -[NSString length](v72, "length"))
    {
      v74 = v55;
      -[NSString _legacy_sizeWithFont:forWidth:lineBreakMode:](v72, "_legacy_sizeWithFont:forWidth:lineBreakMode:", v73, 2, 3.40282347e38);
      v76 = ceil(v75);
    }
    else
    {
      v74 = v55;
      objc_msgSend(CFSTR(" "), "_legacy_sizeWithFont:forWidth:lineBreakMode:", v73, 2, 3.40282347e38);
      v76 = 0.0;
    }

    v132.origin.x = v65;
    v132.origin.y = v63;
    v132.size.width = v66;
    v132.size.height = v67;
    aRect.origin.y = v76;
    v77 = v76 + CGRectGetMaxX(v132);
    v133.origin.x = v54;
    v133.origin.y = v74;
    v133.size.width = v56;
    v133.size.height = aRect.origin.x;
    if (v77 <= CGRectGetMaxX(v133))
    {
      _UIKBInlineTextCompletionLog();
      v90 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG))
      {
        v145.origin.y = 0.0;
        v145.origin.x = v66;
        v145.size.width = aRect.origin.y;
        v145.size.height = v67;
        NSStringFromRect(v145);
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v121 = v114;
        _os_log_debug_impl(&dword_185066000, v90, OS_LOG_TYPE_DEBUG, "  correctionRect=%@", buf, 0xCu);

      }
      v91 = -[UITextCompletionView initWithFrame:string:type:edgeType:]([UITextCompletionView alloc], "initWithFrame:string:type:edgeType:", self->_textCompletion, 8, 3, v66, 0.0, aRect.origin.y, v67);
      textCompletionView = self->_textCompletionView;
      self->_textCompletionView = &v91->super;

      -[UIView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 1);
      -[UIView addSubview:](self, "addSubview:", self->_textCompletionView);
    }
    else
    {
      v78 = -[UITextCompletionView initWithFrame:string:type:edgeType:]([UITextCompletionView alloc], "initWithFrame:string:type:edgeType:", 0, 9, 0, 0.0, -1.0, v66 + 2.0, v67 + 2.0);
      -[UIView addSubview:](self, "addSubview:", v78);
      -[NSMutableArray addObject:](self->_typedTextViews, "addObject:", v78);
      v134.origin.x = v54;
      v134.origin.y = v74;
      v134.size.width = v56;
      v134.size.height = aRect.origin.x;
      MinX = CGRectGetMinX(v134);
      v135.origin.y = v63;
      v135.origin.x = v65;
      v135.size.width = v66;
      v135.size.height = v67;
      v80 = MinX - CGRectGetMinX(v135);
      v81 = -[UITextCompletionView initWithFrame:string:type:edgeType:]([UITextCompletionView alloc], "initWithFrame:string:type:edgeType:", self->_typedText, 2, 0, v80, v67, v66, v67);
      -[UIView addSubview:](self, "addSubview:", v81);
      -[NSMutableArray addObject:](self->_typedTextViews, "addObject:", v81);
      v136.origin.x = v80;
      v136.origin.y = v67;
      v136.size.width = v66;
      v136.size.height = v67;
      v82 = CGRectGetMaxX(v136) + -1.0;
      v137.origin.x = v80;
      v137.origin.y = v67;
      v137.size.width = v66;
      v137.size.height = v67;
      MinY = CGRectGetMinY(v137);
      v84 = -[UITextCompletionView initWithFrame:string:type:edgeType:]([UITextCompletionView alloc], "initWithFrame:string:type:edgeType:", self->_textCompletion, 8, 3, v82, MinY, aRect.origin.y, v67);
      v85 = self->_textCompletionView;
      self->_textCompletionView = &v84->super;

      -[UIView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 1);
      -[UIView addSubview:](self, "addSubview:", self->_textCompletionView);
      v138.origin.x = v80;
      v138.origin.y = v67;
      v138.size.width = v66;
      v138.size.height = v67;
      v86 = CGRectGetMaxX(v138) + -3.0;
      _UIKBInlineTextCompletionLog();
      v87 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v87, OS_LOG_TYPE_DEBUG))
      {
        v141.origin.x = 0.0;
        v141.origin.y = -1.0;
        v141.size.height = v67 + 2.0;
        v141.size.width = v66 + 2.0;
        NSStringFromRect(v141);
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        v142.origin.x = v80;
        v142.origin.y = v67;
        v142.size.width = v66;
        v142.size.height = v67;
        NSStringFromRect(v142);
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        v143.origin.x = v82;
        v143.origin.y = MinY;
        v143.size.width = aRect.origin.y;
        v143.size.height = v67;
        NSStringFromRect(v143);
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        v144.size.width = 3.5;
        v144.origin.x = v86;
        v144.origin.y = v67;
        v144.size.height = v67 + 3.5;
        NSStringFromRect(v144);
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v121 = v115;
        v122 = 2112;
        v123 = v111;
        v124 = 2112;
        v125 = v112;
        v126 = 2112;
        v127 = v113;
        _os_log_debug_impl(&dword_185066000, v87, OS_LOG_TYPE_DEBUG, "  Will overflow trailing marging!\n    typedTextConcealingRect=%@\n    typedTextOnNextLineRect=%@\n    correctionOnNextLineRect=%@\n    fakeCaretRect=%@", buf, 0x2Au);

      }
      v88 = -[UITextCompletionView initWithFrame:string:type:edgeType:]([UITextCompletionView alloc], "initWithFrame:string:type:edgeType:", 0, 10, 0, v86, v67, 3.5, v67 + 3.5);
      -[UIView addSubview:](self, "addSubview:", v88);
      -[NSMutableArray addObject:](self->_typedTextViews, "addObject:", v88);
      *(_QWORD *)&aRect.size.width = MEMORY[0x1E0C809B0];
      *(_QWORD *)&aRect.size.height = 3221225472;
      v117 = __57__UIInlineTextCompletionPrompt_setTextCompletion_inRect___block_invoke;
      v118 = &unk_1E16B1B28;
      v119 = v88;
      v89 = v88;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 24, &aRect.size, 0, 0.5, 0.5);

    }
    -[UIView window](self, "window");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v93, "_isTextEffectsWindow") & 1) != 0)
    {
      +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "_inputViewRectToAvoid");
      v96 = v95;
      v98 = v97;
      v100 = v99;
      v102 = v101;
      -[UIView window](self, "window");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView superview](self, "superview");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView frame](self, "frame");
      objc_msgSend(v104, "convertRect:toView:", 0);
      objc_msgSend(v103, "convertRect:toWindow:", 0);
      v146.origin.x = v105;
      v146.origin.y = v106;
      v146.size.width = v107;
      v146.size.height = v108;
      v139.origin.x = v96;
      v139.origin.y = v98;
      v139.size.width = v100;
      v139.size.height = v102;
      v109 = CGRectContainsRect(v139, v146);

      if (v109)
        -[UIView setHidden:](self, "setHidden:", 1);
    }
    else
    {

    }
  }

}

uint64_t __57__UIInlineTextCompletionPrompt_setTextCompletion_inRect___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

- (BOOL)pointInside:(CGPoint)a3 forEvent:(__GSEvent *)a4
{
  return -[UIView pointInside:forEvent:](self->_textCompletionView, "pointInside:forEvent:", a4, a3.x, a3.y);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  UIInlineTextCompletionPrompt *v6;
  UIView *textCompletionView;
  id v8;

  y = a3.y;
  x = a3.x;
  v6 = self;
  textCompletionView = self->_textCompletionView;
  v8 = a4;
  -[UIView convertPoint:fromView:](textCompletionView, "convertPoint:fromView:", v6, x, y);
  LOBYTE(v6) = -[UIView pointInside:withEvent:](textCompletionView, "pointInside:withEvent:", v8);

  return (char)v6;
}

- (void)accept
{
  void *v3;
  void *v4;
  id v5;

  -[UIInlineTextCompletionPrompt textCompletionCandidate](self, "textCompletionCandidate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIInlineTextCompletionPrompt delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[UIInlineTextCompletionPrompt textCompletionCandidate](self, "textCompletionCandidate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "acceptTextCompletion:", v4);

  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  self->_touchDown = 1;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  UIView *textCompletionView;
  id v6;
  _BOOL4 v7;

  textCompletionView = self->_textCompletionView;
  v6 = a4;
  -[UIView origin](textCompletionView, "origin");
  v7 = -[UIInlineTextCompletionPrompt pointInside:withEvent:](self, "pointInside:withEvent:", v6);

  if (self->_touchDown && v7)
    -[UIInlineTextCompletionPrompt accept](self, "accept");
  self->_touchDown = 0;
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  self->_touchDown = 0;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if (objc_msgSend(v4, "_isGestureType:", 0)
    && objc_msgSend(v4, "numberOfTouchesRequired") == 1
    && objc_msgSend(v4, "numberOfTapsRequired") == 1
    || objc_msgSend(v4, "_isGestureType:", 1) && objc_msgSend(v4, "numberOfTouchesRequired") == 1)
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIInlineTextCompletionPrompt;
    v5 = -[UIView gestureRecognizerShouldBegin:](&v7, sel_gestureRecognizerShouldBegin_, v4);
  }

  return v5;
}

- (UITextCompletionAcceptanceDelegate)delegate
{
  return (UITextCompletionAcceptanceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (TIKeyboardCandidate)textCompletionCandidate
{
  return self->_textCompletionCandidate;
}

- (NSString)textCompletion
{
  return self->_textCompletion;
}

- (NSString)typedText
{
  return self->_typedText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typedText, 0);
  objc_storeStrong((id *)&self->_textCompletion, 0);
  objc_storeStrong((id *)&self->_textCompletionCandidate, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_typedTextViews, 0);
  objc_storeStrong((id *)&self->_textCompletionView, 0);
}

@end
