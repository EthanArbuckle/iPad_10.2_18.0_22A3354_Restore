@implementation UIKBUndoControl

- (UIKBUndoControl)initWithType:(int64_t)a3 andStyling:(id)a4
{
  id v7;
  UIKBUndoControl *v8;
  UIKBUndoControl *v9;
  void *v10;
  UIView *v11;
  UIView *springCoverView;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSLayoutConstraint *coverConstraintLeftAnchor;
  void *v18;
  void *v19;
  uint64_t v20;
  NSLayoutConstraint *coverConstraintRightAnchor;
  void *v22;
  void *v23;
  uint64_t v24;
  NSLayoutConstraint *coverConstraintTopAnchor;
  void *v26;
  void *v27;
  uint64_t v28;
  NSLayoutConstraint *coverConstraintBottomAnchor;
  UIKBUndoControl *v30;
  objc_super v32;

  v7 = a4;
  v32.receiver = self;
  v32.super_class = (Class)UIKBUndoControl;
  v8 = -[UIView init](&v32, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_style, a4);
    +[UIColor clearColor](UIColor, "clearColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v9, "setBackgroundColor:", v10);

    v11 = objc_alloc_init(UIView);
    springCoverView = v9->_springCoverView;
    v9->_springCoverView = v11;

    -[UIView setUserInteractionEnabled:](v9->_springCoverView, "setUserInteractionEnabled:", 0);
    objc_msgSend(v7, "HUDbackgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v9->_springCoverView, "setBackgroundColor:", v13);

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v9->_springCoverView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v9, "addSubview:", v9->_springCoverView);
    -[UIView leftAnchor](v9->_springCoverView, "leftAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leftAnchor](v9, "leftAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, 0.0);
    v16 = objc_claimAutoreleasedReturnValue();
    coverConstraintLeftAnchor = v9->_coverConstraintLeftAnchor;
    v9->_coverConstraintLeftAnchor = (NSLayoutConstraint *)v16;

    -[NSLayoutConstraint setActive:](v9->_coverConstraintLeftAnchor, "setActive:", 1);
    -[UIView rightAnchor](v9->_springCoverView, "rightAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView rightAnchor](v9, "rightAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19, 0.0);
    v20 = objc_claimAutoreleasedReturnValue();
    coverConstraintRightAnchor = v9->_coverConstraintRightAnchor;
    v9->_coverConstraintRightAnchor = (NSLayoutConstraint *)v20;

    -[NSLayoutConstraint setActive:](v9->_coverConstraintRightAnchor, "setActive:", 1);
    -[UIView topAnchor](v9->_springCoverView, "topAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](v9, "topAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:constant:", v23, 0.0);
    v24 = objc_claimAutoreleasedReturnValue();
    coverConstraintTopAnchor = v9->_coverConstraintTopAnchor;
    v9->_coverConstraintTopAnchor = (NSLayoutConstraint *)v24;

    -[NSLayoutConstraint setActive:](v9->_coverConstraintTopAnchor, "setActive:", 1);
    -[UIView bottomAnchor](v9->_springCoverView, "bottomAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v9, "bottomAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:constant:", v27, 0.0);
    v28 = objc_claimAutoreleasedReturnValue();
    coverConstraintBottomAnchor = v9->_coverConstraintBottomAnchor;
    v9->_coverConstraintBottomAnchor = (NSLayoutConstraint *)v28;

    -[NSLayoutConstraint setActive:](v9->_coverConstraintBottomAnchor, "setActive:", 1);
    -[UIKBUndoControl layoutControlForType:andStyling:](v9, "layoutControlForType:andStyling:", a3, v7);
    -[UIView _setDisableDictationTouchCancellation:](v9, "_setDisableDictationTouchCancellation:", 1);
    v30 = v9;
  }

  return v9;
}

- (void)layoutSubviews
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIKBUndoControl;
  -[UIView layoutSubviews](&v8, sel_layoutSubviews);
  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "userInterfaceStyle") == 1)
    v4 = 2;
  else
    v4 = 1;

  -[UIKBUndoControl style](self, "style");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAppearance:", v4);

  -[UIView traitOverrides](self, "traitOverrides");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNSIntegerValue:forTrait:", v4, v7);

}

- (void)updateUndoControlStyle
{
  UIControlState v3;
  id v4;
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  id v14;

  v3 = -[UIControl state](self, "state");
  switch(v3)
  {
    case 2uLL:
      WeakRetained = objc_loadWeakRetained((id *)&self->_securePasteButtonSlotView);
      objc_msgSend(WeakRetained, "setAlpha:", 0.0);

      -[UIKBUndoStyling buttonGlyphColorDisabled](self->_style, "buttonGlyphColorDisabled");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](self->_label, "setTextColor:", v7);
      -[UIView setTintColor:](self->_icon, "setTintColor:", v7);

      -[UIView setAlpha:](self->_springCoverView, "setAlpha:", 1.0);
      return;
    case 1uLL:
      v8 = objc_loadWeakRetained((id *)&self->_securePasteButtonSlotView);

      if (v8)
      {
        v9 = objc_loadWeakRetained((id *)&self->_securePasteButtonSlotView);
        objc_msgSend(v9, "setAlpha:", 1.0);

        +[UIColor clearColor](UIColor, "clearColor");
      }
      else
      {
        -[UIKBUndoStyling buttonGlyphColorPressed](self->_style, "buttonGlyphColorPressed");
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](self->_label, "setTextColor:", v13);
      -[UIView setTintColor:](self->_icon, "setTintColor:", v13);

      -[UIKBUndoControl springCoverView](self, "springCoverView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v11;
      v12 = 0.0;
      goto LABEL_14;
    case 0uLL:
      v4 = objc_loadWeakRetained((id *)&self->_securePasteButtonSlotView);

      if (v4)
      {
        v5 = objc_loadWeakRetained((id *)&self->_securePasteButtonSlotView);
        objc_msgSend(v5, "setAlpha:", 0.8);

        +[UIColor clearColor](UIColor, "clearColor");
      }
      else
      {
        -[UIKBUndoStyling buttonGlyphColorEnabled](self->_style, "buttonGlyphColorEnabled");
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](self->_label, "setTextColor:", v10);
      -[UIView setTintColor:](self->_icon, "setTintColor:", v10);

      -[UIKBUndoControl springCoverView](self, "springCoverView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v11;
      v12 = 1.0;
LABEL_14:
      objc_msgSend(v11, "setAlpha:", v12);

      break;
  }
}

- (void)updateCoverWithTavelProcess:(double)a3 isRTL:(BOOL)a4
{
  _BOOL4 v4;
  double v7;
  void *v8;
  CGFloat v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  v4 = a4;
  if (-[UIKBUndoControl type](self, "type") == 1)
  {
    if (v4)
    {
LABEL_3:
      -[UIView bounds](self, "bounds");
      v7 = CGRectGetWidth(v15) * a3;
      -[UIKBUndoControl coverConstraintLeftAnchor](self, "coverConstraintLeftAnchor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:
      v14 = v8;
      objc_msgSend(v8, "setConstant:", v7);

      goto LABEL_15;
    }
    goto LABEL_6;
  }
  if (-[UIKBUndoControl type](self, "type") == 2)
  {
    if (!v4)
      goto LABEL_3;
LABEL_6:
    -[UIView bounds](self, "bounds");
    v7 = -(a3 * CGRectGetWidth(v16));
LABEL_13:
    -[UIKBUndoControl coverConstraintRightAnchor](self, "coverConstraintRightAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  if (-[UIKBUndoControl type](self, "type") == 4 || -[UIKBUndoControl type](self, "type") == 3)
  {
    -[UIView bounds](self, "bounds");
    v9 = CGRectGetWidth(v17) * a3 * 0.5;
    -[UIKBUndoControl coverConstraintLeftAnchor](self, "coverConstraintLeftAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setConstant:", v9);

    -[UIView bounds](self, "bounds");
    v7 = -(a3 * CGRectGetWidth(v18)) * 0.5;
    goto LABEL_13;
  }
  if (-[UIKBUndoControl type](self, "type") == 5 || -[UIKBUndoControl type](self, "type") == 6)
  {
    v11 = 1.0 - a3;
    -[UIView bounds](self, "bounds");
    v12 = (1.0 - a3) * CGRectGetWidth(v19) * 0.5;
    -[UIKBUndoControl coverConstraintLeftAnchor](self, "coverConstraintLeftAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setConstant:", v12);

    -[UIView bounds](self, "bounds");
    v7 = v11 * CGRectGetWidth(v20) * -0.5;
    goto LABEL_13;
  }
LABEL_15:
  -[UIView layoutIfNeeded](self, "layoutIfNeeded");
}

- (id)controlLabelImageNameByType:(int64_t)a3 isRTL:(BOOL)a4
{
  id result;
  __CFString *v5;
  const __CFString *v6;

  switch(a3)
  {
    case 1:
      v5 = CFSTR("arrow.uturn.backward");
      v6 = CFSTR("arrow.uturn.forward");
      goto LABEL_6;
    case 2:
      v5 = CFSTR("arrow.uturn.forward");
      v6 = CFSTR("arrow.uturn.backward");
LABEL_6:
      if (a4)
        v5 = (__CFString *)v6;
      result = v5;
      break;
    case 3:
      result = CFSTR("scissors");
      break;
    case 4:
      result = CFSTR("doc.on.doc");
      break;
    case 5:
    case 6:
      result = CFSTR("doc.on.clipboard");
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (id)controlImageByType:(int64_t)a3
{
  void *v3;
  void *v4;

  if ((unint64_t)(a3 - 1) > 5)
  {
    v4 = 0;
  }
  else
  {
    +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", off_1E16D9308[a3 - 1]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "imageWithRenderingMode:", 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

+ (id)controlLableTextByType:(int64_t)a3 style:(id)a4 available:(BOOL)a5
{
  id v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;

  v7 = a4;
  v8 = v7;
  switch(a3)
  {
    case 1:
      if (a5)
      {
        v9 = CFSTR("UNDO_BUTTON_TITLE_LABEL_IN_HUD");
        v10 = CFSTR("Undo");
        goto LABEL_21;
      }
      v9 = CFSTR("Nothing to Undo");
      goto LABEL_20;
    case 2:
      if (a5)
      {
        v9 = CFSTR("REDO_BUTTON_TITLE_LABEL_IN_HUD");
        v10 = CFSTR("Redo");
      }
      else
      {
        v9 = CFSTR("Nothing to Redo");
LABEL_20:
        v10 = v9;
      }
LABEL_21:
      _UILocalizedStringInSystemLanguage(v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:

      return v11;
    case 3:
      if (a5)
        v9 = CFSTR("Cut");
      else
        v9 = CFSTR("Nothing to Cut");
      goto LABEL_20;
    case 4:
      if (a5)
        v9 = CFSTR("Copy");
      else
        v9 = CFSTR("Nothing to Copy");
      goto LABEL_20;
    case 5:
      if (a5)
        v9 = CFSTR("Paste");
      else
        v9 = CFSTR("Nothing to Paste");
      goto LABEL_20;
    case 6:
      if ((objc_msgSend(v7, "tooSmallForInstructionalText") & 1) != 0)
      {
        v9 = CFSTR("PASTE_ALLOW_BUTTON_WITHOUT_EXPLANATION_TEXT");
        v10 = CFSTR("Allow Paste");
      }
      else
      {
        v9 = CFSTR("PASTE_ALLOW_BUTTON_TEXT");
        v10 = CFSTR("Allow");
      }
      goto LABEL_21;
    default:
      v11 = 0;
      goto LABEL_22;
  }
}

- (void)layoutControlForType:(int64_t)a3 andStyling:(id)a4
{
  void *v6;
  UIImageView *v7;
  UIImageView *icon;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  UIImageView *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  UILabel *v22;
  UILabel *label;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  UILabel *v35;
  UILabel *v36;
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
  double v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;

  v59 = a4;
  -[UIKBUndoControl controlImageByType:](self, "controlImageByType:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[UIImageView initWithImage:]([UIImageView alloc], "initWithImage:", v6);
  icon = self->_icon;
  self->_icon = v7;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_icon, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIImageView setContentMode:](self->_icon, "setContentMode:", 1);
  objc_msgSend(v59, "undoInteractiveControlLabelFont");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIImageSymbolConfiguration configurationWithFont:](UIImageSymbolConfiguration, "configurationWithFont:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setPreferredSymbolConfiguration:](self->_icon, "setPreferredSymbolConfiguration:", v10);

  if (-[UIKBUndoStyling isRTL](self->_style, "isRTL"))
    v11 = 4;
  else
    v11 = 3;
  -[UIImageView setSemanticContentAttribute:](self->_icon, "setSemanticContentAttribute:", v11);
  -[UIView addSubview:](self, "addSubview:", self->_icon);
  if ((unint64_t)(a3 - 3) <= 3)
  {
    v12 = objc_msgSend(v59, "cutCopyPasteIconOnly");
    v13 = self->_icon;
    if (!v12)
    {
      -[UIView removeFromSuperview](v13, "removeFromSuperview");
      v22 = objc_alloc_init(UILabel);
      label = self->_label;
      self->_label = v22;

      -[UIView addSubview:](self, "addSubview:", self->_label);
      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UILabel setTextAlignment:](self->_label, "setTextAlignment:", 1);
      objc_msgSend((id)objc_opt_class(), "controlLableTextByType:style:available:", a3, self->_style, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setText:](self->_label, "setText:", v24);

      objc_msgSend(v59, "undoInteractiveControlLabelFont");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](self->_label, "setFont:", v25);

      -[UIView leadingAnchor](self->_label, "leadingAnchor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView leadingAnchor](self, "leadingAnchor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "constraintEqualToAnchor:constant:", v27, 16.0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setActive:", 1);

      -[UIView trailingAnchor](self, "trailingAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView trailingAnchor](self->_label, "trailingAnchor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "constraintEqualToAnchor:constant:", v30, 16.0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setActive:", 1);

      v21 = self->_label;
      goto LABEL_11;
    }
    -[UIView leadingAnchor](v13, "leadingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](self, "leadingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, 16.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setActive:", 1);

    -[UIView trailingAnchor](self, "trailingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self->_icon, "trailingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:constant:", v18, 16.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
    v20 = v19;
    objc_msgSend(v19, "setActive:", 1);

    v21 = self->_icon;
LABEL_11:
    objc_msgSend(v21, "centerYAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerYAnchor](self, "centerYAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  if (objc_msgSend(v59, "undoRedoIconOnly"))
  {
    -[UIView centerXAnchor](self->_icon, "centerXAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerXAnchor](self, "centerXAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v35 = objc_alloc_init(UILabel);
  v36 = self->_label;
  self->_label = v35;

  -[UIView addSubview:](self, "addSubview:", self->_label);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend((id)objc_opt_class(), "controlLableTextByType:style:available:", a3, self->_style, 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_label, "setText:", v37);

  -[UIKBUndoStyling undoInteractiveControlLabelFont](self->_style, "undoInteractiveControlLabelFont");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_label, "setFont:", v38);

  -[UIView firstBaselineAnchor](self->_icon, "firstBaselineAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView firstBaselineAnchor](self->_label, "firstBaselineAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setActive:", 1);

  -[UIView centerYAnchor](self->_label, "centerYAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerYAnchor](self, "centerYAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setActive:", 1);

  if (a3 == 1)
  {
    -[UIView leadingAnchor](self->_icon, "leadingAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](self, "leadingAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToAnchor:constant:", v46, 21.0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setActive:", 1);

    -[UIView leadingAnchor](self->_label, "leadingAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self->_icon, "trailingAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToAnchor:constant:", v49, 4.0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setActive:", 1);

    -[UIView trailingAnchor](self, "trailingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self->_label, "trailingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 22.0;
  }
  else
  {
    -[UIView leadingAnchor](self->_label, "leadingAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](self, "leadingAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintEqualToAnchor:constant:", v53, 22.0);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setActive:", 1);

    -[UIView leadingAnchor](self->_icon, "leadingAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self->_label, "trailingAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "constraintEqualToAnchor:constant:", v56, 4.0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setActive:", 1);

    -[UIView trailingAnchor](self, "trailingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self->_icon, "trailingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 21.0;
  }
  objc_msgSend(v32, "constraintEqualToAnchor:constant:", v33, v51);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:
  v58 = v34;
  objc_msgSend(v34, "setActive:", 1);

}

- (void)configureSecurePasteButtonInRootView:(id)a3
{
  id v4;
  id WeakRetained;
  _UISlotView *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, void *, void *);
  void *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id location;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_securePasteButtonSlotView);

  if (WeakRetained)
  {
    v6 = (_UISlotView *)objc_loadWeakRetained((id *)&self->_securePasteButtonSlotView);
  }
  else
  {
    v6 = objc_alloc_init(_UISlotView);
    objc_storeWeak((id *)&self->_securePasteButtonSlotView, v6);
  }
  v7 = -[UIKBUndoStyling cutCopyPasteIconOnly](self->_style, "cutCopyPasteIconOnly");
  v8 = (void *)MEMORY[0x1E0D6C0D8];
  -[UIKBUndoStyling cutControlMinWidth](self->_style, "cutControlMinWidth");
  if (v7)
    objc_msgSend(v8, "undoInteractionHUDIconPasteButtonTagWithMinWidth:");
  else
    objc_msgSend(v8, "undoInteractionHUDTextPasteButtonTagWithMinWidth:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v10 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __56__UIKBUndoControl_configureSecurePasteButtonInRootView___block_invoke;
  v19[3] = &unk_1E16B59B0;
  v11 = v9;
  v20 = v11;
  -[_UISlotView _setSlotStyleResolver:](v6, "_setSlotStyleResolver:", v19);
  v13 = v10;
  v14 = 3221225472;
  v15 = __56__UIKBUndoControl_configureSecurePasteButtonInRootView___block_invoke_2;
  v16 = &unk_1E16B5A28;
  v12 = v11;
  v17 = v12;
  objc_copyWeak(&v18, &location);
  -[_UISlotView _setSlotAnyContentProvider:](v6, "_setSlotAnyContentProvider:", &v13);
  -[_UISlotView _overlayView:centerInView:](v6, "_overlayView:centerInView:", v4, self, v13, v14, v15, v16);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&location);
}

uint64_t __56__UIKBUndoControl_configureSecurePasteButtonInRootView___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "resolvedStyleForStyle:", a2);
}

void __56__UIKBUndoControl_configureSecurePasteButtonInRootView___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  id v16[2];

  v7 = a3;
  v8 = a4;
  dispatch_get_global_queue(33, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__UIKBUndoControl_configureSecurePasteButtonInRootView___block_invoke_3;
  block[3] = &unk_1E16B5A00;
  v16[1] = a2;
  v13 = v7;
  v14 = *(id *)(a1 + 32);
  v15 = v8;
  v10 = v8;
  v11 = v7;
  objc_copyWeak(v16, (id *)(a1 + 40));
  dispatch_async(v9, block);

  objc_destroyWeak(v16);
}

void __56__UIKBUndoControl_configureSecurePasteButtonInRootView___block_invoke_3(uint64_t a1)
{
  void *v2;
  _QWORD block[4];
  id v4;
  id v5;
  id v6;

  +[_UIConcretePasteboard _remoteContentForLayerContextWithId:slotStyle:pasteButtonTag:](_UIConcretePasteboard, "_remoteContentForLayerContextWithId:slotStyle:pasteButtonTag:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__UIKBUndoControl_configureSecurePasteButtonInRootView___block_invoke_4;
    block[3] = &unk_1E16B59D8;
    v5 = *(id *)(a1 + 48);
    v4 = v2;
    objc_copyWeak(&v6, (id *)(a1 + 56));
    dispatch_async(MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(&v6);

  }
}

void __56__UIKBUndoControl_configureSecurePasteButtonInRootView___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "updateUndoControlStyle");

  }
}

- (unsigned)_secureName
{
  return (self->_type == 5) << 16;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint v11;
  CGRect v12;

  y = a3.y;
  x = a3.x;
  -[UIView bounds](self, "bounds", a4);
  v12.origin.x = v6 + -20.0;
  v12.size.width = v7 + 40.0;
  v12.origin.y = v8 + -20.0;
  v12.size.height = v9 + 40.0;
  v11.x = x;
  v11.y = y;
  return CGRectContainsPoint(v12, v11);
}

- (id)viewForFirstBaselineLayout
{
  return self->_label;
}

- (id)viewForLastBaselineLayout
{
  return self->_label;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (UIKBUndoStyling)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
  objc_storeStrong((id *)&self->_style, a3);
}

- (UIView)springCoverView
{
  return self->_springCoverView;
}

- (void)setSpringCoverView:(id)a3
{
  objc_storeStrong((id *)&self->_springCoverView, a3);
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (UIImageView)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (_UISlotView)securePasteButtonSlotView
{
  return (_UISlotView *)objc_loadWeakRetained((id *)&self->_securePasteButtonSlotView);
}

- (void)setSecurePasteButtonSlotView:(id)a3
{
  objc_storeWeak((id *)&self->_securePasteButtonSlotView, a3);
}

- (NSLayoutConstraint)coverConstraintLeftAnchor
{
  return self->_coverConstraintLeftAnchor;
}

- (void)setCoverConstraintLeftAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_coverConstraintLeftAnchor, a3);
}

- (NSLayoutConstraint)coverConstraintRightAnchor
{
  return self->_coverConstraintRightAnchor;
}

- (void)setCoverConstraintRightAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_coverConstraintRightAnchor, a3);
}

- (NSLayoutConstraint)coverConstraintTopAnchor
{
  return self->_coverConstraintTopAnchor;
}

- (void)setCoverConstraintTopAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_coverConstraintTopAnchor, a3);
}

- (NSLayoutConstraint)coverConstraintBottomAnchor
{
  return self->_coverConstraintBottomAnchor;
}

- (void)setCoverConstraintBottomAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_coverConstraintBottomAnchor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coverConstraintBottomAnchor, 0);
  objc_storeStrong((id *)&self->_coverConstraintTopAnchor, 0);
  objc_storeStrong((id *)&self->_coverConstraintRightAnchor, 0);
  objc_storeStrong((id *)&self->_coverConstraintLeftAnchor, 0);
  objc_destroyWeak((id *)&self->_securePasteButtonSlotView);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_springCoverView, 0);
  objc_storeStrong((id *)&self->_style, 0);
}

@end
