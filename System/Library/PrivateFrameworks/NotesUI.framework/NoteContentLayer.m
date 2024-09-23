@implementation NoteContentLayer

- (NoteContentLayer)initWithFrame:(CGRect)a3 forPreview:(BOOL)a4
{
  NoteContentLayer *v5;
  NoteContentLayer *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NoteContentLayer;
  v5 = -[NoteContentLayer initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_forPreview = a4;
    -[NoteContentLayer setPreservesSuperviewLayoutMargins:](v5, "setPreservesSuperviewLayoutMargins:", 1);
    -[NoteContentLayer createLayout](v6, "createLayout");
    -[NoteContentLayer noteHTMLEditorView](v6, "noteHTMLEditorView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "webView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scrollView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ic_addObserver:forKeyPath:context:", v6, CFSTR("contentSize"), compoundliteral);

    -[NoteContentLayer updateContentInsets](v6, "updateContentInsets");
  }
  return v6;
}

- (NoteContentLayer)initWithFrame:(CGRect)a3
{
  return -[NoteContentLayer initWithFrame:forPreview:](self, "initWithFrame:forPreview:", objc_msgSend(MEMORY[0x1E0DC3470], "shouldMakeUIForDefaultPNG"), a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  -[NoteContentLayer noteHTMLEditorView](self, "noteHTMLEditorView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "webView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ic_removeObserver:forKeyPath:context:", self, CFSTR("contentSize"), compoundliteral);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:", self);

  -[NoteHTMLEditorView webView](self->_noteHTMLEditorView, "webView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scrollView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDelegate:", 0);

  -[NoteHTMLEditorView setDelegate:](self->_noteHTMLEditorView, "setDelegate:", 0);
  -[NoteHTMLEditorView setActionDelegate:](self->_noteHTMLEditorView, "setActionDelegate:", 0);
  -[NoteHTMLEditorView setLayoutDelegate:](self->_noteHTMLEditorView, "setLayoutDelegate:", 0);
  v9.receiver = self;
  v9.super_class = (Class)NoteContentLayer;
  -[NoteContentLayer dealloc](&v9, sel_dealloc);
}

- (void)createLayout
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
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
  double v25;
  NSLayoutConstraint *v26;
  NSLayoutConstraint *backgroundHeightConstraint;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  _QWORD v61[2];
  _QWORD v62[6];

  v62[4] = *MEMORY[0x1E0C80C00];
  -[NoteContentLayer noteHTMLEditorView](self, "noteHTMLEditorView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[NoteContentLayer noteHTMLEditorView](self, "noteHTMLEditorView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NoteContentLayer addSubview:](self, "addSubview:", v5);

    -[NoteContentLayer noteHTMLEditorView](self, "noteHTMLEditorView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ic_addConstraintsToFillSuperview");

  }
  v7 = -[NoteContentLayer isForPreview](self, "isForPreview");
  v8 = 0x1E0DC3000;
  if (!v7)
  {
    -[NoteContentLayer noteHTMLEditorView](self, "noteHTMLEditorView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "webView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "scrollView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NoteContentLayer backgroundView](self, "backgroundView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "insertSubview:atIndex:", v12, 0);

    -[NoteContentLayer noteHTMLEditorView](self, "noteHTMLEditorView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "webView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "scrollView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NoteContentLayer dateLabel](self, "dateLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSubview:", v16);

    -[NoteContentLayer backgroundView](self, "backgroundView");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "leadingAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[NoteContentLayer noteHTMLEditorView](self, "noteHTMLEditorView");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "webView");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "scrollView");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "leadingAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToAnchor:", v49);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v62[0] = v48;
    -[NoteContentLayer backgroundView](self, "backgroundView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "topAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[NoteContentLayer noteHTMLEditorView](self, "noteHTMLEditorView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "webView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "scrollView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "topAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToAnchor:", v42);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v62[1] = v41;
    -[NoteContentLayer backgroundView](self, "backgroundView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "widthAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NoteContentLayer noteHTMLEditorView](self, "noteHTMLEditorView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "webView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "scrollView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "widthAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v62[2] = v22;
    -[NoteContentLayer backgroundView](self, "backgroundView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "heightAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NoteContentLayer bounds](self, "bounds");
    objc_msgSend(v24, "constraintEqualToConstant:", v25 + v25);
    v26 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    backgroundHeightConstraint = self->_backgroundHeightConstraint;
    self->_backgroundHeightConstraint = v26;

    v62[3] = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 4);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[NoteContentLayer addConstraints:](self, "addConstraints:", v28);

    if (objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision"))
      v29 = 12.0;
    else
      v29 = 0.0;
    -[NoteContentLayer dateLabel](self, "dateLabel");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "centerXAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[NoteContentLayer noteHTMLEditorView](self, "noteHTMLEditorView");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "webView");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "scrollView");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "centerXAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "constraintEqualToAnchor:", v50);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v61[0] = v30;
    -[NoteContentLayer dateLabel](self, "dateLabel");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "firstBaselineAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[NoteContentLayer noteHTMLEditorView](self, "noteHTMLEditorView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "webView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "scrollView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "topAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:constant:", v36, v29);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v61[1] = v37;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 2);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[NoteContentLayer addConstraints:](self, "addConstraints:", v38);

    v8 = 0x1E0DC3000uLL;
  }
  if (objc_msgSend(*(id *)(v8 + 1800), "ic_isVision"))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "ic_noteEditorBackgroundColor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[NoteContentLayer setBackgroundColor:](self, "setBackgroundColor:", v39);

  }
}

- (void)updateContentInsets
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  id v18;

  -[NoteContentLayer noteHTMLEditorView](self, "noteHTMLEditorView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "webView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentInset");
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[NoteContentLayer dateLabel](self, "dateLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "font");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lineHeight");
  v15 = v14;

  if (objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision"))
    v15 = v15 + 12.0;
  -[NoteContentLayer noteHTMLEditorView](self, "noteHTMLEditorView");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "webView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "scrollView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setContentInset:", v15, v7, v9, v11);

}

- (void)updateObscuredInsets
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
  id v12;

  -[NoteContentLayer safeAreaInsets](self, "safeAreaInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[NoteContentLayer noteHTMLEditorView](self, "noteHTMLEditorView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "webView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_setObscuredInsets:", v4, v6, v8, v10);

}

- (NoteHTMLEditorView)noteHTMLEditorView
{
  NoteHTMLEditorView *noteHTMLEditorView;
  NoteHTMLEditorView *v4;
  NoteHTMLEditorView *v5;
  void *v6;
  void *v7;

  noteHTMLEditorView = self->_noteHTMLEditorView;
  if (!noteHTMLEditorView)
  {
    v4 = objc_alloc_init(NoteHTMLEditorView);
    v5 = self->_noteHTMLEditorView;
    self->_noteHTMLEditorView = v4;

    -[NoteHTMLEditorView setTranslatesAutoresizingMaskIntoConstraints:](self->_noteHTMLEditorView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[NoteHTMLEditorView setEditable:](self->_noteHTMLEditorView, "setEditable:", 0);
    -[NoteHTMLEditorView setDelegate:](self->_noteHTMLEditorView, "setDelegate:", self);
    -[NoteHTMLEditorView setActionDelegate:](self->_noteHTMLEditorView, "setActionDelegate:", self);
    -[NoteHTMLEditorView setLayoutDelegate:](self->_noteHTMLEditorView, "setLayoutDelegate:", self);
    -[NoteHTMLEditorView webView](self->_noteHTMLEditorView, "webView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scrollView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAlwaysBounceVertical:", 1);

    noteHTMLEditorView = self->_noteHTMLEditorView;
  }
  return noteHTMLEditorView;
}

- (ICTextBackgroundView)backgroundView
{
  ICTextBackgroundView *backgroundView;
  ICTextBackgroundView *v4;
  ICTextBackgroundView *v5;

  backgroundView = self->_backgroundView;
  if (!backgroundView)
  {
    v4 = objc_alloc_init(ICTextBackgroundView);
    v5 = self->_backgroundView;
    self->_backgroundView = v4;

    -[ICTextBackgroundView setTranslatesAutoresizingMaskIntoConstraints:](self->_backgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[ICTextBackgroundView setBackgroundColor:](self->_backgroundView, "setBackgroundColor:", 0);
    backgroundView = self->_backgroundView;
  }
  return backgroundView;
}

- (UILabel)dateLabel
{
  UILabel *dateLabel;
  UILabel *v4;
  UILabel *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  dateLabel = self->_dateLabel;
  if (!dateLabel)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    v5 = self->_dateLabel;
    self->_dateLabel = v4;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_dateLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[NoteContentLayer timestampDate](self, "timestampDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "userFriendlyStringWithTime");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_dateLabel, "setText:", v7);

    objc_msgSend(MEMORY[0x1E0DC3658], "ic_noteEditorSecondaryLabelColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_dateLabel, "setTextColor:", v8);

    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_dateLabel, "setFont:", v9);

    -[UILabel setAdjustsFontSizeToFitWidth:](self->_dateLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel _accessibilitySetIsSpeakThisElement:](self->_dateLabel, "_accessibilitySetIsSpeakThisElement:", 0);
    dateLabel = self->_dateLabel;
  }
  return dateLabel;
}

- (void)setTimestampDate:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_storeStrong((id *)&self->_timestampDate, a3);
  -[NoteContentLayer timestampDate](self, "timestampDate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userFriendlyStringWithTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NoteContentLayer dateLabel](self, "dateLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (void)setContent:(id)a3 isPlainText:(BOOL)a4 attachments:(id)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a4;
  v11 = a5;
  v8 = a3;
  -[NoteContentLayer noteHTMLEditorView](self, "noteHTMLEditorView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
    objc_msgSend(v9, "setText:", v8);
  else
    objc_msgSend(v9, "setHtmlString:attachments:", v8, v11);

}

- (BOOL)isEditable
{
  void *v2;
  char v3;

  -[NoteContentLayer noteHTMLEditorView](self, "noteHTMLEditorView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEditable");

  return v3;
}

- (void)setEditable:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[NoteContentLayer noteHTMLEditorView](self, "noteHTMLEditorView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEditable:", v3);

}

- (id)contentAsPlainText:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  __CFString *v7;

  v3 = a3;
  if (-[NoteContentLayer contentContainsValuableContent](self, "contentContainsValuableContent"))
  {
    -[NoteContentLayer noteHTMLEditorView](self, "noteHTMLEditorView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3)
      objc_msgSend(v5, "text");
    else
      objc_msgSend(v5, "htmlString");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = &stru_1E5C2F8C0;
  }
  return v7;
}

- (NSString)title
{
  void *v2;
  void *v3;

  -[NoteContentLayer noteHTMLEditorView](self, "noteHTMLEditorView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)contentContainsValuableContent
{
  void *v3;
  void *v4;
  char v5;
  void *v6;

  -[NoteContentLayer noteHTMLEditorView](self, "noteHTMLEditorView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    v5 = 1;
  }
  else
  {
    -[NoteContentLayer noteHTMLEditorView](self, "noteHTMLEditorView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "hasAttachments");

  }
  return v5;
}

- (void)flashScrollIndicators
{
  void *v2;
  void *v3;
  id v4;

  -[NoteContentLayer noteHTMLEditorView](self, "noteHTMLEditorView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "webView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "flashScrollIndicators");

}

- (void)setScrollIndicatorInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  void *v7;
  void *v8;
  id v9;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  -[NoteContentLayer noteHTMLEditorView](self, "noteHTMLEditorView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "webView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scrollView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setScrollIndicatorInsets:", top, left, bottom, right);

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  objc_super v11;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[NoteContentLayer delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "noteContentLayer:willHitTestWithEvent:", self, v7);

  v11.receiver = self;
  v11.super_class = (Class)NoteContentLayer;
  -[NoteContentLayer hitTest:withEvent:](&v11, sel_hitTest_withEvent_, v7, x, y);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)canBecomeFirstResponder
{
  void *v2;
  char v3;

  -[NoteContentLayer noteHTMLEditorView](self, "noteHTMLEditorView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canBecomeFirstResponder");

  return v3;
}

- (BOOL)canResignFirstResponder
{
  void *v2;
  char v3;

  -[NoteContentLayer noteHTMLEditorView](self, "noteHTMLEditorView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canResignFirstResponder");

  return v3;
}

- (BOOL)becomeFirstResponder
{
  void *v2;
  char v3;

  -[NoteContentLayer noteHTMLEditorView](self, "noteHTMLEditorView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "becomeFirstResponder");

  return v3;
}

- (BOOL)resignFirstResponder
{
  void *v2;
  char v3;

  -[NoteContentLayer noteHTMLEditorView](self, "noteHTMLEditorView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "resignFirstResponder");

  return v3;
}

- (BOOL)isFirstResponder
{
  void *v2;
  char v3;

  -[NoteContentLayer noteHTMLEditorView](self, "noteHTMLEditorView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFirstResponder");

  return v3;
}

- (CGPoint)contentOffset
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  -[NoteContentLayer noteHTMLEditorView](self, "noteHTMLEditorView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "webView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentOffset");
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (void)setContentOffset:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  y = a3.y;
  x = a3.x;
  -[NoteContentLayer noteHTMLEditorView](self, "noteHTMLEditorView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "webView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scrollView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layoutIfNeeded");

  -[NoteContentLayer noteHTMLEditorView](self, "noteHTMLEditorView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "webView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scrollView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setContentOffset:", x, y);

}

- (void)getRectForSelectionWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[NoteContentLayer noteHTMLEditorView](self, "noteHTMLEditorView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__NoteContentLayer_getRectForSelectionWithCompletion___block_invoke;
  v7[3] = &unk_1E5C1F8F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "getRectForSelectionWithCompletion:", v7);

}

void __54__NoteContentLayer_getRectForSelectionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  v5 = *(id *)(a1 + 40);
  v4 = v3;
  performBlockOnMainThread();

}

uint64_t __54__NoteContentLayer_getRectForSelectionWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t result;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "noteHTMLEditorView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "convertRect:fromView:", v3, *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, double, double, double, double))(result + 16))(result, *(_QWORD *)(a1 + 40), v5, v7, v9, v11);
  return result;
}

- (CGRect)rectForDOMNode:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)replaceSelectionWithAttachmentPresentation:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NoteContentLayer noteHTMLEditorView](self, "noteHTMLEditorView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "replaceSelectionWithAttachmentPresentation:", v4);

}

- (id)webArchive
{
  void *v2;
  void *v3;

  -[NoteContentLayer noteHTMLEditorView](self, "noteHTMLEditorView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "webArchive");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)copyNoteHTMLToPasteboard
{
  id v2;

  -[NoteContentLayer noteHTMLEditorView](self, "noteHTMLEditorView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "copyNoteHTMLToPasteboard");

}

- (id)viewPrintFormatter
{
  void *v2;
  void *v3;

  -[NoteContentLayer noteHTMLEditorView](self, "noteHTMLEditorView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewPrintFormatter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setSelectionToStart
{
  id v2;

  -[NoteContentLayer noteHTMLEditorView](self, "noteHTMLEditorView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSelectionToStart");

}

- (void)scrollToTopAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  -[NoteContentLayer noteHTMLEditorView](self, "noteHTMLEditorView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "webView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scrollRectToVisible:animated:", v3, 0.0, 0.0, 1.0, 1.0);

}

- (void)scrollSelectionToVisible:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[NoteContentLayer noteHTMLEditorView](self, "noteHTMLEditorView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scrollSelectionToVisible:", v3);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  char v13;
  void *v14;
  void *v15;
  id v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  objc_super v31;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((-[NoteContentLayer ic_didAddObserverForContext:inScope:](self, "ic_didAddObserverForContext:inScope:", a6, "/Library/Caches/com.apple.xbs/Sources/MobileNotesSupport/Ironcade/SharedUI/iOS/EmbeddedMobileNotes/NoteContentLayer.m") & 1) != 0)
  {
    v13 = -[NoteContentLayer ic_shouldIgnoreObserveValue:ofObject:forKeyPath:](self, "ic_shouldIgnoreObserveValue:ofObject:forKeyPath:", v12, v11, v10);

    if (a6 == compoundliteral && (v13 & 1) == 0)
    {
      -[NoteContentLayer noteHTMLEditorView](self, "noteHTMLEditorView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "webView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "scrollView");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      if (v16 == v11)
      {
        v17 = objc_msgSend(v10, "isEqualToString:", CFSTR("contentSize"));

        if (v17)
        {
          -[NoteContentLayer noteHTMLEditorView](self, "noteHTMLEditorView");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "webView");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "scrollView");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "contentSize");
          v22 = v21;

          -[NoteContentLayer noteHTMLEditorView](self, "noteHTMLEditorView");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "webView");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "scrollView");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "bounds");
          v27 = v26;

          if (v22 < v27)
            v22 = v27;
          -[NoteContentLayer bounds](self, "bounds");
          v29 = v22 + v28;
          -[NoteContentLayer backgroundHeightConstraint](self, "backgroundHeightConstraint");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setConstant:", v29);

        }
      }
      else
      {

      }
    }
  }
  else
  {
    v31.receiver = self;
    v31.super_class = (Class)NoteContentLayer;
    -[NoteContentLayer observeValueForKeyPath:ofObject:change:context:](&v31, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);

  }
}

- (void)registerForTraitChanges
{
  id v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0DC3E88], "ic_traitsAffectingSize");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (id)-[NoteContentLayer registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v4, sel_updateContentInsets);

}

- (id)keyCommands
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  -[NoteContentLayer noteHTMLEditorView](self, "noteHTMLEditorView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEditing");

  if (v4)
  {
    if (keyCommands_predicate != -1)
      dispatch_once(&keyCommands_predicate, &__block_literal_global_28);
    v5 = (void *)keyCommands_keyCommands;
    v9.receiver = self;
    v9.super_class = (Class)NoteContentLayer;
    -[NoteContentLayer keyCommands](&v9, sel_keyCommands);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v7;
}

void __31__NoteContentLayer_keyCommands__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0DC3930];
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Bold"), CFSTR("Bold"), 0, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:", CFSTR("b"), 0x100000, sel_toggleBoldface_, v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0DC3930];
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Italics"), CFSTR("Italics"), 0, 1, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:", CFSTR("i"), 0x100000, sel_toggleItalics_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v5;
  v6 = (void *)MEMORY[0x1E0DC3930];
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Underline"), CFSTR("Underline"), 0, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:", CFSTR("u"), 0x100000, sel_toggleUnderline_, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 3);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)keyCommands_keyCommands;
  keyCommands_keyCommands = v9;

}

- (BOOL)noteHTMLEditorView:(id)a3 canAddAttachmentItemProviders:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  id v17;
  unint64_t v18;
  void *v19;
  _BOOL4 v20;
  BOOL v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t i;
  uint64_t v28;
  id v29;
  void *v30;
  _BOOL4 v31;
  void *v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v5 = a4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v45;
    v36 = *MEMORY[0x1E0CEC518];
    v37 = *MEMORY[0x1E0CEC610];
    v34 = *MEMORY[0x1E0CEC5C8];
    v9 = 0x1E0CEC000uLL;
LABEL_3:
    v10 = 0;
    v35 = v7;
    while (1)
    {
      if (*(_QWORD *)v45 != v8)
        objc_enumerationMutation(v5);
      v11 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v10);
      v43 = 0;
      -[NoteContentLayer chosenUTI:andChosenMIMEType:forItemProvider:](self, "chosenUTI:andChosenMIMEType:forItemProvider:", &v43, 0, v11);
      v12 = v43;
      if (!v12)
        break;
      objc_msgSend(*(id *)(v9 + 1016), "typeWithIdentifier:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v13, "conformsToType:", v36) & 1) != 0
        || -[NoteContentLayer shouldRenderAsAttachment:](self, "shouldRenderAsAttachment:", v11))
      {

        goto LABEL_20;
      }
      objc_msgSend(*(id *)(v9 + 1016), "typeWithIdentifier:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v14, "conformsToType:", v37) & 1) != 0)
      {

      }
      else
      {
        v15 = v8;
        v16 = v9;
        v17 = v5;
        v18 = v16;
        objc_msgSend(*(id *)(v16 + 1016), "typeWithIdentifier:", v12);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v19, "conformsToType:", v34))
          v20 = -[NoteContentLayer allowsAttachments](self, "allowsAttachments");
        else
          v20 = 0;

        v5 = v17;
        v9 = v18;
        v8 = v15;
        v7 = v35;
        if (!v20)
          goto LABEL_20;
      }

      if (v7 == ++v10)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_17;
      }
    }
    -[NoteContentLayer shouldRenderAsAttachment:](self, "shouldRenderAsAttachment:", v11);
LABEL_20:

    if (-[NoteContentLayer allowsAttachments](self, "allowsAttachments"))
    {
      v21 = 1;
      goto LABEL_37;
    }
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v22 = v5;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    if (v23)
    {
      v24 = v23;
      v25 = v9;
      v26 = *(_QWORD *)v40;
      while (2)
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v40 != v26)
            objc_enumerationMutation(v22);
          v28 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
          v38 = 0;
          -[NoteContentLayer chosenUTI:andChosenMIMEType:forItemProvider:](self, "chosenUTI:andChosenMIMEType:forItemProvider:", &v38, 0, v28);
          v29 = v38;
          if (!v29)
            goto LABEL_34;
          objc_msgSend(*(id *)(v25 + 1016), "typeWithIdentifier:", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v30, "conformsToType:", v37) & 1) == 0)
          {

LABEL_34:
            -[NoteContentLayer delegate](self, "delegate");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "showAttachmentsUnsupportedAlertForNoteContentLayer:", self);

            goto LABEL_35;
          }
          v31 = -[NoteContentLayer shouldRenderAsAttachment:](self, "shouldRenderAsAttachment:", v28);

          if (v31)
            goto LABEL_34;

        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
        v21 = 1;
        if (v24)
          continue;
        break;
      }
    }
    else
    {
LABEL_35:
      v21 = 1;
    }
  }
  else
  {
LABEL_17:
    v21 = 0;
  }

LABEL_37:
  return v21;
}

- (void)noteHTMLEditorView:(id)a3 addAttachmentItemProviders:(id)a4
{
  -[NoteContentLayer processAttachmentItemProviders:](self, "processAttachmentItemProviders:", a4);
}

- (id)noteHTMLEditorView:(id)a3 createAttachmentPresentationWithFileWrapper:(id)a4 mimeType:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a5;
  v8 = a4;
  -[NoteContentLayer delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "regularFileContents");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferredFilename");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "noteContentLayer:createAttachmentPresentationWithData:mimeType:filename:", self, v10, v7, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)noteHTMLEditorView:(id)a3 didAddAttachmentForMimeType:(id)a4 filename:(id)a5 data:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  -[NoteContentLayer delegate](self, "delegate");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "noteContentLayer:didAddAttachmentForMimeType:filename:data:", self, v11, v10, v9);

}

- (BOOL)noteHTMLEditorViewShouldBeginEditing:(id)a3 isUserInitiated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  char v8;

  v4 = a4;
  -[NoteContentLayer setNeedsLayout](self, "setNeedsLayout", a3);
  -[NoteContentLayer delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[NoteContentLayer delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "noteContentLayerShouldBeginEditing:isUserInitiated:", self, v4);

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (void)noteHTMLEditorViewDidChange:(id)a3
{
  id v4;

  -[NoteContentLayer delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "noteContentLayerContentDidChange:updatedTitle:fromDrop:", self, 1, 0);

}

- (void)noteHTMLEditorViewWillChange:(id)a3
{
  id v4;

  -[NoteContentLayer delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "noteContentLayerContentWillChange:", self);

}

- (void)noteHTMLEditorViewDidBeginEditing:(id)a3
{
  id v4;

  -[NoteContentLayer delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "noteContentLayer:setEditing:animated:", self, 1, 1);

}

- (void)noteHTMLEditorViewDidEndEditing:(id)a3
{
  void *v4;

  -[NoteContentLayer delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "noteContentLayer:setEditing:animated:", self, 0, 1);

  -[NoteContentLayer setNeedsLayout](self, "setNeedsLayout");
}

- (void)noteHTMLEditorView:(id)a3 openURL:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[NoteContentLayer delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "noteContentLayer:openURL:", self, v5);

}

- (id)noteHTMLEditorView:(id)a3 fileURLForAttachmentWithContentID:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[NoteContentLayer attachmentPresentationDelegate](self, "attachmentPresentationDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "noteContentLayer:fileURLForAttachmentWithContentID:", self, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)noteHTMLEditorView:(id)a3 attachmentPresentationForContentID:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[NoteContentLayer attachmentPresentationDelegate](self, "attachmentPresentationDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "noteContentLayer:attachmentPresentationForContentID:", self, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isNoteManagedForNoteHTMLEditorView:(id)a3
{
  NoteContentLayer *v3;
  void *v4;

  v3 = self;
  -[NoteContentLayer delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "isNoteManagedForNoteContentLayer:", v3);

  return (char)v3;
}

- (void)noteHTMLEditorView:(id)a3 didInvokeFormattingCalloutOption:(int64_t)a4
{
  id v6;

  -[NoteContentLayer delegate](self, "delegate", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "noteContentLayer:didInvokeFormattingCalloutOption:", self, a4);

}

- (void)noteHTMLEditorView:(id)a3 didInvokeStyleFormattingOption:(int64_t)a4
{
  id v6;

  -[NoteContentLayer delegate](self, "delegate", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "noteContentLayer:didInvokeStyleFormattingOption:", self, a4);

}

- (id)noteHTMLEditorView:(id)a3 updateAttachments:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[NoteContentLayer delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "noteContentLayer:updateAttachments:", self, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  void *v9;
  void *v10;
  char v11;

  length = a4.length;
  location = a4.location;
  v8 = a5;
  -[NoteContentLayer setUpdatedTitleRange:](self, "setUpdatedTitleRange:", location <= *MEMORY[0x1E0D629C0]);
  if (-[NoteContentLayer tracksMaximumContentLength](self, "tracksMaximumContentLength")
    && objc_msgSend(v8, "length") > length)
  {
    objc_msgSend(v8, "substringFromIndex:", length);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NoteContentLayer delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "noteContentLayer:acceptStringIncreasingContentLength:", self, v9);

  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (BOOL)canInsertImagesInNoteHTMLEditorView:(id)a3
{
  NoteContentLayer *v3;
  void *v4;

  v3 = self;
  -[NoteContentLayer delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "canInsertImagesInNoteContentLayer:", v3);

  return (char)v3;
}

- (void)insertImageInNoteHTMLEditorView:(id)a3
{
  id v4;

  -[NoteContentLayer delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "insertImageInNoteContentLayer:", self);

}

- (void)noteHTMLEditorViewNeedsContentReload:(id)a3
{
  ICTextBackgroundView *backgroundView;
  UILabel *dateLabel;
  void *v6;
  id v7;

  backgroundView = self->_backgroundView;
  self->_backgroundView = 0;

  dateLabel = self->_dateLabel;
  self->_dateLabel = 0;

  -[NoteContentLayer createLayout](self, "createLayout");
  -[NoteContentLayer noteHTMLEditorView](self, "noteHTMLEditorView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNeedsDisplay");

  -[NoteContentLayer setNeedsLayout](self, "setNeedsLayout");
  -[NoteContentLayer delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "noteContentLayerNeedsContentReload:", self);

}

- (BOOL)noteHTMLEditorView:(id)a3 acceptContentsFromPasteboard:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  -[NoteContentLayer delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v6, "noteContentLayer:acceptContentsFromPasteboard:", self, v5);

  return (char)self;
}

- (id)readerDelegateInNoteHTMLEditorView:(id)a3
{
  void *v4;
  void *v5;

  -[NoteContentLayer delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "readerDelegateForNoteContentLayer:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)shouldRenderAsAttachment:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  char v6;
  uint64_t v7;

  v3 = (void *)*MEMORY[0x1E0CEC610];
  v4 = a3;
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "hasItemConformingToTypeIdentifier:", v5);

  v7 = objc_msgSend(v4, "preferredPresentationStyle");
  if (v7 == 2)
    return 1;
  else
    return v6 ^ 1;
}

- (void)noteHTMLEditorView:(id)a3 showShareSheetForAttachment:(id)a4 atPoint:(CGPoint)a5
{
  double y;
  double x;
  id v8;
  id v9;

  y = a5.y;
  x = a5.x;
  v8 = a4;
  -[NoteContentLayer delegate](self, "delegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "noteContentLayer:showShareSheetForAttachment:atPoint:", self, v8, x, y);

}

- (BOOL)noteHTMLEditorViewShouldPaste:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemProviders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (-[NoteContentLayer shouldRenderAsAttachment:](self, "shouldRenderAsAttachment:", v12, (_QWORD)v17))
          objc_msgSend(v6, "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v6, "count"))
  {
    if (-[NoteContentLayer allowsAttachments](self, "allowsAttachments"))
    {
      -[NoteContentLayer processAttachmentItemProviders:](self, "processAttachmentItemProviders:", v6);
      v13 = objc_msgSend(v6, "count");
      v14 = v13 != objc_msgSend(v7, "count");
    }
    else
    {
      -[NoteContentLayer delegate](self, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "showAttachmentsUnsupportedAlertForNoteContentLayer:", self);

      v14 = 0;
    }
  }
  else
  {
    v14 = 1;
  }

  return v14;
}

- (BOOL)isNoteHTMLEditorViewVisible:(id)a3
{
  NoteContentLayer *v3;
  void *v4;

  v3 = self;
  -[NoteContentLayer delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "isNoteContentLayerVisible:", v3);

  return (char)v3;
}

- (void)chosenUTI:(id *)a3 andChosenMIMEType:(id *)a4 forItemProvider:(id)a5
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id *v21;
  id *v22;
  id v23;
  void *v24;
  int v25;
  void *v26;
  id *v27;
  id *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[4];
  id v34;
  _BYTE v35[128];
  _QWORD v36[4];

  v27 = a3;
  v28 = a4;
  v36[2] = *MEMORY[0x1E0C80C00];
  v5 = a5;
  objc_msgSend((id)*MEMORY[0x1E0CEC5C8], "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v6;
  objc_msgSend((id)*MEMORY[0x1E0CEC518], "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v5, "registeredTypeIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "arrayWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __64__NoteContentLayer_chosenUTI_andChosenMIMEType_forItemProvider___block_invoke;
  v33[3] = &unk_1E5C1F940;
  v12 = v8;
  v34 = v12;
  objc_msgSend(v11, "sortUsingComparator:", v33);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v30;
LABEL_3:
    v17 = 0;
    while (1)
    {
      if (*(_QWORD *)v30 != v16)
        objc_enumerationMutation(v13);
      v18 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v17);
      objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v18, v27, v28, (_QWORD)v29);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "preferredMIMEType");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
        break;
      if (v15 == ++v17)
      {
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
        if (v15)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v23 = v18;

    v22 = v27;
    v21 = v28;
    if (v23)
      goto LABEL_13;
  }
  else
  {
LABEL_9:

    v20 = 0;
    v22 = v27;
    v21 = v28;
  }
  objc_msgSend(v13, "firstObject", v27, v28);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v12, "containsObject:", v24);

  if (v25)
  {
    objc_msgSend(v13, "firstObject");
    v23 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:
    if (v22)
      goto LABEL_14;
  }
  else
  {
    objc_msgSend(v5, "registeredTypeIdentifiers");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "firstObject");
    v23 = (id)objc_claimAutoreleasedReturnValue();

    if (v22)
LABEL_14:
      *v22 = objc_retainAutorelease(v23);
  }
  if (v21)
    *v21 = objc_retainAutorelease(v20);

}

uint64_t __64__NoteContentLayer_chosenUTI_andChosenMIMEType_forItemProvider___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = *(void **)(a1 + 32);
  v7 = a3;
  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "indexOfObject:", a2));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", v7);

  objc_msgSend(v9, "numberWithUnsignedInteger:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "compare:", v11);

  return v12;
}

- (void)processAttachmentItemProviders:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  NoteContentLayer *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  id location;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_initWeak(&location, self);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v27;
    v8 = *MEMORY[0x1E0D63D58];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v27 != v7)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v10, "registeredTypeIdentifiers");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "containsObject:", v8);

        if (!v12
          || !-[NoteContentLayer processMapAttachmentItemProvider:](self, "processMapAttachmentItemProvider:", v10))
        {
          v24 = 0;
          v25 = 0;
          -[NoteContentLayer chosenUTI:andChosenMIMEType:forItemProvider:](self, "chosenUTI:andChosenMIMEType:forItemProvider:", &v25, &v24, v10);
          v13 = v25;
          v14 = v24;
          v18[0] = MEMORY[0x1E0C809B0];
          v18[1] = 3221225472;
          v18[2] = __51__NoteContentLayer_processAttachmentItemProviders___block_invoke;
          v18[3] = &unk_1E5C1F990;
          objc_copyWeak(&v23, &location);
          v15 = v13;
          v19 = v15;
          v20 = self;
          v21 = v10;
          v16 = v14;
          v22 = v16;
          v17 = (id)objc_msgSend(v10, "loadDataRepresentationForTypeIdentifier:completionHandler:", v15, v18);

          objc_destroyWeak(&v23);
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v6);
  }

  objc_destroyWeak(&location);
}

void __51__NoteContentLayer_processAttachmentItemProviders___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  _QWORD v9[4];
  NSObject *v10;
  __int128 v11;
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (v6)
  {
    v8 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __51__NoteContentLayer_processAttachmentItemProviders___block_invoke_cold_1(a1, (uint64_t)v6, v8);
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __51__NoteContentLayer_processAttachmentItemProviders___block_invoke_58;
    v9[3] = &unk_1E5C1F968;
    v10 = *(id *)(a1 + 32);
    v11 = *(_OWORD *)(a1 + 40);
    v12 = v5;
    v13 = WeakRetained;
    v14 = *(id *)(a1 + 56);
    dispatch_async(MEMORY[0x1E0C80D38], v9);

    v8 = v10;
  }

}

void __51__NoteContentLayer_processAttachmentItemProviders___block_invoke_58(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0CEC518]) & 1) != 0)
    {
      v3 = objc_msgSend(*(id *)(a1 + 40), "shouldRenderAsAttachment:", *(_QWORD *)(a1 + 48));

      if ((v3 & 1) == 0)
      {
        v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", *(_QWORD *)(a1 + 56), 4);
        objc_msgSend(*(id *)(a1 + 40), "noteHTMLEditorView");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "insertHTMLString:", v8);
        goto LABEL_11;
      }
    }
    else
    {

    }
  }
  if (!objc_msgSend(*(id *)(a1 + 40), "allowsAttachments"))
    return;
  objc_msgSend(*(id *)(a1 + 48), "suggestedName");
  v5 = objc_claimAutoreleasedReturnValue();
  v8 = (id)v5;
  if (*(_QWORD *)(a1 + 32))
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "preferredFilenameExtension");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", CFSTR("untitled.%@"), v7);
      v8 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  objc_msgSend(*(id *)(a1 + 64), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "noteContentLayer:didAddAttachmentForMimeType:filename:data:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72), v8, *(_QWORD *)(a1 + 56));
LABEL_11:

}

- (BOOL)processMapAttachmentItemProvider:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  id *v15;
  id v16;
  BOOL v17;
  _QWORD block[7];
  _QWORD v20[4];
  NSObject *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  _QWORD v29[4];
  NSObject *v30;
  uint64_t *v31;
  uint64_t v32;
  id *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v4 = a3;
  v32 = 0;
  v33 = (id *)&v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__24;
  v36 = __Block_byref_object_dispose__24;
  v37 = 0;
  v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  v6 = objc_opt_class();
  v7 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __53__NoteContentLayer_processMapAttachmentItemProvider___block_invoke;
  v29[3] = &unk_1E5C1F9B8;
  v31 = &v32;
  v8 = v5;
  v30 = v8;
  v9 = (id)objc_msgSend(v4, "loadObjectOfClass:completionHandler:", v6, v29);
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__24;
  v27 = __Block_byref_object_dispose__24;
  v28 = 0;
  dispatch_group_enter(v8);
  v10 = objc_opt_class();
  v20[0] = v7;
  v20[1] = 3221225472;
  v20[2] = __53__NoteContentLayer_processMapAttachmentItemProvider___block_invoke_2;
  v20[3] = &unk_1E5C1F9B8;
  v22 = &v23;
  v11 = v8;
  v21 = v11;
  v12 = (id)objc_msgSend(v4, "loadObjectOfClass:completionHandler:", v10, v20);
  dispatch_group_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend((id)v24[5], "absoluteString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13 || !objc_msgSend(v13, "length"))
  {
    v17 = 0;
    goto LABEL_9;
  }
  v15 = v33;
  v16 = v33[5];
  if (!v16)
    goto LABEL_6;
  if (!objc_msgSend(v16, "length"))
  {
    v15 = v33;
LABEL_6:
    objc_storeStrong(v15 + 5, v14);
  }
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __53__NoteContentLayer_processMapAttachmentItemProvider___block_invoke_3;
  block[3] = &unk_1E5C1F9E0;
  block[4] = self;
  block[5] = &v23;
  block[6] = &v32;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  v17 = 1;
LABEL_9:

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v32, 8);

  return v17;
}

void __53__NoteContentLayer_processMapAttachmentItemProvider___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __53__NoteContentLayer_processMapAttachmentItemProvider___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __53__NoteContentLayer_processMapAttachmentItemProvider___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "noteHTMLEditorView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "insertLinkWithURL:title:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

}

- (NoteContentLayerDelegate)delegate
{
  return (NoteContentLayerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NoteContentLayerAttachmentPresentationDelegate)attachmentPresentationDelegate
{
  return (NoteContentLayerAttachmentPresentationDelegate *)objc_loadWeakRetained((id *)&self->_attachmentPresentationDelegate);
}

- (void)setAttachmentPresentationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_attachmentPresentationDelegate, a3);
}

- (NSDate)timestampDate
{
  return self->_timestampDate;
}

- (BOOL)tracksMaximumContentLength
{
  return self->_tracksMaximumContentLength;
}

- (void)setTracksMaximumContentLength:(BOOL)a3
{
  self->_tracksMaximumContentLength = a3;
}

- (void)setNoteHTMLEditorView:(id)a3
{
  objc_storeStrong((id *)&self->_noteHTMLEditorView, a3);
}

- (BOOL)allowsAttachments
{
  return self->_allowsAttachments;
}

- (void)setAllowsAttachments:(BOOL)a3
{
  self->_allowsAttachments = a3;
}

- (BOOL)isForPreview
{
  return self->_forPreview;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (NSLayoutConstraint)backgroundHeightConstraint
{
  return self->_backgroundHeightConstraint;
}

- (void)setBackgroundHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundHeightConstraint, a3);
}

- (void)setDateLabel:(id)a3
{
  objc_storeStrong((id *)&self->_dateLabel, a3);
}

- (BOOL)updatedTitleRange
{
  return self->_updatedTitleRange;
}

- (void)setUpdatedTitleRange:(BOOL)a3
{
  self->_updatedTitleRange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateLabel, 0);
  objc_storeStrong((id *)&self->_backgroundHeightConstraint, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_noteHTMLEditorView, 0);
  objc_storeStrong((id *)&self->_timestampDate, 0);
  objc_destroyWeak((id *)&self->_attachmentPresentationDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

void __51__NoteContentLayer_processAttachmentItemProviders___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_1AC7A1000, log, OS_LOG_TYPE_ERROR, "Error loading data for pasted attachment (%@) : uti %@", (uint8_t *)&v4, 0x16u);
}

@end
