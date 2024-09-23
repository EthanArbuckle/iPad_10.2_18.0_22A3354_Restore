@implementation DBSDisplayZoomOptionView

- (DBSDisplayZoomOptionView)initWithFrame:(CGRect)a3 displayZoomOption:(unint64_t)a4
{
  DBSDisplayZoomOptionView *v5;
  DBSDisplayZoomOptionView *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DBSDisplayZoomOptionView;
  v5 = -[DBSDisplayZoomOptionView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_displayZoomOption = a4;
    -[DBSDisplayZoomOptionView _configureView](v5, "_configureView");
  }
  return v6;
}

- (void)_configureView
{
  void *v2;
  DBSDeviceDisplayZoomAnimationView *v4;
  DBSDeviceDisplayZoomAnimationView *packageView;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  UILabel *v14;
  UILabel *optionNameLabel;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __CFString *v24;
  void *v25;
  void *v26;
  DBSCheckmarkView *v27;
  DBSCheckmarkView *checkmarkView;
  void *v29;
  void *v30;
  UIImpactFeedbackGenerator *v31;
  UIImpactFeedbackGenerator *feedbackGenerator;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  int v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  int v51;
  double v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;

  v4 = -[DBSDeviceDisplayZoomAnimationView initWithDisplayZoomOption:]([DBSDeviceDisplayZoomAnimationView alloc], "initWithDisplayZoomOption:", -[DBSDisplayZoomOptionView displayZoomOption](self, "displayZoomOption"));
  packageView = self->__packageView;
  self->__packageView = v4;

  -[DBSDisplayZoomOptionView _packageView](self, "_packageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[DBSDisplayZoomOptionView _packageView](self, "_packageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContentMode:", 1);

  -[DBSDisplayZoomOptionView _packageView](self, "_packageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDisplayZoomOptionView addSubview:](self, "addSubview:", v8);

  v9 = objc_alloc(MEMORY[0x24BEBD708]);
  v10 = *MEMORY[0x24BDBF090];
  v11 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v12 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v13 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v14 = (UILabel *)objc_msgSend(v9, "initWithFrame:", *MEMORY[0x24BDBF090], v11, v12, v13);
  optionNameLabel = self->_optionNameLabel;
  self->_optionNameLabel = v14;

  -[DBSDisplayZoomOptionView optionNameLabel](self, "optionNameLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDisplayZoomOptionView optionNameLabel](self, "optionNameLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFont:", v17);

  objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDisplayZoomOptionView optionNameLabel](self, "optionNameLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTextColor:", v19);

  -[DBSDisplayZoomOptionView optionNameLabel](self, "optionNameLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setAdjustsFontForContentSizeCategory:", 1);

  -[DBSDisplayZoomOptionView optionNameLabel](self, "optionNameLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setAdjustsFontSizeToFitWidth:", 1);

  -[DBSDisplayZoomOptionView optionNameLabel](self, "optionNameLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDisplayZoomOptionView addSubview:](self, "addSubview:", v23);

  switch(-[DBSDisplayZoomOptionView displayZoomOption](self, "displayZoomOption"))
  {
    case 0uLL:
      v24 = CFSTR("STANDARD");
      goto LABEL_6;
    case 1uLL:
      v24 = CFSTR("ZOOMED");
      goto LABEL_6;
    case 2uLL:
      v24 = CFSTR("DENSE");
      goto LABEL_6;
    case 3uLL:
      v24 = CFSTR("DENSER");
LABEL_6:
      DBS_LocalizedStringForMagnify(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[DBSDisplayZoomOptionView optionNameLabel](self, "optionNameLabel");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setText:", v25);

      break;
    default:
      break;
  }
  v27 = -[DBSCheckmarkView initWithFrame:]([DBSCheckmarkView alloc], "initWithFrame:", v10, v11, v12, v13);
  checkmarkView = self->__checkmarkView;
  self->__checkmarkView = v27;

  -[DBSDisplayZoomOptionView _checkmarkView](self, "_checkmarkView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[DBSDisplayZoomOptionView _checkmarkView](self, "_checkmarkView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDisplayZoomOptionView addSubview:](self, "addSubview:", v30);

  v31 = (UIImpactFeedbackGenerator *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD670]), "initWithStyle:", 0);
  feedbackGenerator = self->__feedbackGenerator;
  self->__feedbackGenerator = v31;

  v82 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEBD740]), "initWithTarget:action:", self, sel__userDidTapOnView_);
  objc_msgSend(v82, "setMinimumPressDuration:", 0.0);
  objc_msgSend(v82, "setCancelPastAllowableMovement:", 1);
  objc_msgSend(v82, "setDelegate:", self);
  -[DBSDisplayZoomOptionView addGestureRecognizer:](self, "addGestureRecognizer:", v82);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDisplayZoomOptionView _packageView](self, "_packageView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "topAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDisplayZoomOptionView topAnchor](self, "topAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addObject:", v37);

  -[DBSDisplayZoomOptionView optionNameLabel](self, "optionNameLabel");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "topAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDisplayZoomOptionView _packageView](self, "_packageView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "bottomAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = DBSReverseZoomEnabled();
  if (v42)
  {
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v2, "sf_isiPad");
    v44 = 20.0;
    if (v43)
      v44 = 12.0;
  }
  else
  {
    v44 = 20.0;
  }
  objc_msgSend(v39, "constraintEqualToAnchor:constant:", v41, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addObject:", v45);

  if (v42)
  -[DBSDisplayZoomOptionView _checkmarkView](self, "_checkmarkView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "topAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDisplayZoomOptionView optionNameLabel](self, "optionNameLabel");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "bottomAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = DBSReverseZoomEnabled();
  if (v50)
  {
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v2, "sf_isiPad");
    v52 = 8.0;
    if (v51)
      v52 = 6.0;
  }
  else
  {
    v52 = 8.0;
  }
  objc_msgSend(v47, "constraintEqualToAnchor:constant:", v49, v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addObject:", v53);

  if (v50)
  -[DBSDisplayZoomOptionView _checkmarkView](self, "_checkmarkView");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "bottomAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDisplayZoomOptionView bottomAnchor](self, "bottomAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "constraintEqualToAnchor:", v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addObject:", v57);

  -[DBSDisplayZoomOptionView _packageView](self, "_packageView");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "leadingAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDisplayZoomOptionView leadingAnchor](self, "leadingAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "constraintEqualToAnchor:", v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addObject:", v61);

  -[DBSDisplayZoomOptionView _packageView](self, "_packageView");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "trailingAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDisplayZoomOptionView trailingAnchor](self, "trailingAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "constraintEqualToAnchor:", v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addObject:", v65);

  -[DBSDisplayZoomOptionView optionNameLabel](self, "optionNameLabel");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "centerXAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDisplayZoomOptionView centerXAnchor](self, "centerXAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "constraintEqualToAnchor:", v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addObject:", v69);

  -[DBSDisplayZoomOptionView optionNameLabel](self, "optionNameLabel");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "leadingAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDisplayZoomOptionView leadingAnchor](self, "leadingAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:multiplier:", v72, 1.0);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addObject:", v73);

  -[DBSDisplayZoomOptionView trailingAnchor](self, "trailingAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDisplayZoomOptionView optionNameLabel](self, "optionNameLabel");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "trailingAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:multiplier:", v76, 1.0);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addObject:", v77);

  -[DBSDisplayZoomOptionView _checkmarkView](self, "_checkmarkView");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "centerXAnchor");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDisplayZoomOptionView centerXAnchor](self, "centerXAnchor");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "constraintEqualToAnchor:", v80);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addObject:", v81);

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v33);
}

- (void)_userDidTapOnView:(id)a3
{
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;
  id v8;

  v4 = objc_msgSend(a3, "state");
  -[DBSDisplayZoomOptionView setHighlight:](self, "setHighlight:", (unint64_t)(v4 - 1) < 2);
  if (!-[DBSDisplayZoomOptionView isSelected](self, "isSelected"))
  {
    if (v4 == 3)
    {
      -[DBSDisplayZoomOptionView delegate](self, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_opt_respondsToSelector();

      if ((v6 & 1) == 0)
        return;
      -[DBSDisplayZoomOptionView delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "userDidTapOnDisplayZoomOptionView:", self);

      -[DBSDisplayZoomOptionView _feedbackGenerator](self, "_feedbackGenerator");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "impactOccurred");
    }
    else
    {
      if (v4 != 1)
        return;
      -[DBSDisplayZoomOptionView _feedbackGenerator](self, "_feedbackGenerator");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "prepare");
    }

  }
}

- (void)setHighlight:(BOOL)a3
{
  double v3;

  if (self->_highlight != a3)
  {
    self->_highlight = a3;
    v3 = 1.0;
    if (a3)
      v3 = 0.5;
    -[DBSDisplayZoomOptionView setAlpha:](self, "setAlpha:", v3);
  }
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_selected != a3)
  {
    v3 = a3;
    self->_selected = a3;
    -[DBSDisplayZoomOptionView _checkmarkView](self, "_checkmarkView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSelected:", v3);

  }
}

- (void)startAnimation
{
  id v2;

  -[DBSDisplayZoomOptionView _packageView](self, "_packageView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startAnimation");

}

- (void)stopAnimation
{
  id v2;

  -[DBSDisplayZoomOptionView _packageView](self, "_packageView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopAnimation");

}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  char isKindOfClass;

  v6 = a4;
  v7 = a3;
  -[DBSDisplayZoomOptionView gestureRecognizers](self, "gestureRecognizers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v7);

  if (v9)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (unint64_t)displayZoomOption
{
  return self->_displayZoomOption;
}

- (DBSDisplayZoomOptionViewDelegate)delegate
{
  return (DBSDisplayZoomOptionViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (UILabel)optionNameLabel
{
  return self->_optionNameLabel;
}

- (void)setOptionNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_optionNameLabel, a3);
}

- (DBSCheckmarkView)_checkmarkView
{
  return self->__checkmarkView;
}

- (void)set_checkmarkView:(id)a3
{
  objc_storeStrong((id *)&self->__checkmarkView, a3);
}

- (DBSDeviceDisplayZoomAnimationView)_packageView
{
  return self->__packageView;
}

- (void)set_packageView:(id)a3
{
  objc_storeStrong((id *)&self->__packageView, a3);
}

- (UIImpactFeedbackGenerator)_feedbackGenerator
{
  return self->__feedbackGenerator;
}

- (void)set_feedbackGenerator:(id)a3
{
  objc_storeStrong((id *)&self->__feedbackGenerator, a3);
}

- (BOOL)highlighted
{
  return self->_highlight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__feedbackGenerator, 0);
  objc_storeStrong((id *)&self->__packageView, 0);
  objc_storeStrong((id *)&self->__checkmarkView, 0);
  objc_storeStrong((id *)&self->_optionNameLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
