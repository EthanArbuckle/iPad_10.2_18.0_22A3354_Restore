@implementation DBSDeviceAppearanceOptionView

- (DBSDeviceAppearanceOptionView)initWithFrame:(CGRect)a3 appearanceOption:(unint64_t)a4
{
  DBSDeviceAppearanceOptionView *v5;
  DBSDeviceAppearanceOptionView *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DBSDeviceAppearanceOptionView;
  v5 = -[DBSDeviceAppearanceOptionView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_appearanceOption = a4;
    v5->_highlight = 0;
    -[DBSDeviceAppearanceOptionView _configureView](v5, "_configureView");
  }
  return v6;
}

- (void)_configureView
{
  void *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  CTFontRef v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  DBSCheckmarkView *v33;
  void *v34;
  __CFString *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
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
  double v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  _QWORD v80[4];

  v80[3] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD670]), "initWithStyle:", 0);
  -[DBSDeviceAppearanceOptionView set_feedbackGenerator:](self, "set_feedbackGenerator:", v3);

  v4 = objc_alloc(MEMORY[0x24BEBD668]);
  v5 = *MEMORY[0x24BDBF090];
  v6 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v7 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v8 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v9 = (void *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], v6, v7, v8);
  -[DBSDeviceAppearanceOptionView set_previewImageView:](self, "set_previewImageView:", v9);

  -[DBSDeviceAppearanceOptionView _previewImageView](self, "_previewImageView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v11 = -[DBSDeviceAppearanceOptionView appearanceOption](self, "appearanceOption");
  v12 = (void *)MEMORY[0x24BEBD640];
  DBS_BundleForDisplayAndBrightnessSettingsFramework();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    v14 = CFSTR("AppearanceDark");
  else
    v14 = CFSTR("AppearanceLight");
  objc_msgSend(v12, "imageNamed:inBundle:compatibleWithTraitCollection:", v14, v13, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDeviceAppearanceOptionView _previewImageView](self, "_previewImageView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setImage:", v15);

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", v5, v6, v7, v8);
  -[DBSDeviceAppearanceOptionView set_label:](self, "set_label:", v17);

  -[DBSDeviceAppearanceOptionView _label](self, "_label");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[DBSDeviceAppearanceOptionView _label](self, "_label");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAdjustsFontForContentSizeCategory:", 1);

  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDeviceAppearanceOptionView _label](self, "_label");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFont:", v20);

  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", v5, v6, v7, v8);
  -[DBSDeviceAppearanceOptionView set_timeLabel:](self, "set_timeLabel:", v22);

  -[DBSDeviceAppearanceOptionView _timeLabel](self, "_timeLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v24 = CTFontCreateWithNameAndOptions(CFSTR(".SFSoftTime-Semibold"), 15.0, 0, 0x20000uLL);
  -[DBSDeviceAppearanceOptionView _timeLabel](self, "_timeLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setFont:", v24);

  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDeviceAppearanceOptionView _timeLabel](self, "_timeLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setTextColor:", v26);

  DBSLockScreenTimeString();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDeviceAppearanceOptionView _timeLabel](self, "_timeLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setText:", v28);

  -[DBSDeviceAppearanceOptionView _timeLabel](self, "_timeLabel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setTextAlignment:", 1);

  -[DBSDeviceAppearanceOptionView _previewImageView](self, "_previewImageView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDeviceAppearanceOptionView _timeLabel](self, "_timeLabel");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addSubview:", v32);

  v33 = -[DBSCheckmarkView initWithFrame:]([DBSCheckmarkView alloc], "initWithFrame:", v5, v6, v7, v8);
  -[DBSDeviceAppearanceOptionView set_checkmarkView:](self, "set_checkmarkView:", v33);

  -[DBSDeviceAppearanceOptionView _checkmarkView](self, "_checkmarkView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  if (-[DBSDeviceAppearanceOptionView appearanceOption](self, "appearanceOption"))
    v35 = CFSTR("DARK");
  else
    v35 = CFSTR("LIGHT");
  DBS_LocalizedStringForDisplays(v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDeviceAppearanceOptionView _label](self, "_label");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setText:", v36);

  -[DBSDeviceAppearanceOptionView traitCollection](self, "traitCollection");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDeviceAppearanceOptionView _updateViewForCurrentInterfaceStyle:](self, "_updateViewForCurrentInterfaceStyle:", objc_msgSend(v38, "userInterfaceStyle"));

  v39 = objc_alloc(MEMORY[0x24BEBD978]);
  -[DBSDeviceAppearanceOptionView _previewImageView](self, "_previewImageView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDeviceAppearanceOptionView _label](self, "_label", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v80[1] = v41;
  -[DBSDeviceAppearanceOptionView _checkmarkView](self, "_checkmarkView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v80[2] = v42;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v80, 3);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)objc_msgSend(v39, "initWithArrangedSubviews:", v43);
  -[DBSDeviceAppearanceOptionView set_stackView:](self, "set_stackView:", v44);

  -[DBSDeviceAppearanceOptionView _stackView](self, "_stackView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[DBSDeviceAppearanceOptionView _stackView](self, "_stackView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setAxis:", 1);

  -[DBSDeviceAppearanceOptionView _stackView](self, "_stackView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setAlignment:", 3);

  -[DBSDeviceAppearanceOptionView _stackView](self, "_stackView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setSpacing:", 1.17549435e-38);

  -[DBSDeviceAppearanceOptionView _stackView](self, "_stackView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDeviceAppearanceOptionView addSubview:](self, "addSubview:", v49);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDeviceAppearanceOptionView _stackView](self, "_stackView");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "leadingAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDeviceAppearanceOptionView leadingAnchor](self, "leadingAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "constraintEqualToAnchor:", v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "addObject:", v54);

  -[DBSDeviceAppearanceOptionView _stackView](self, "_stackView");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "trailingAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDeviceAppearanceOptionView trailingAnchor](self, "trailingAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "constraintEqualToAnchor:", v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "addObject:", v58);

  -[DBSDeviceAppearanceOptionView _timeLabel](self, "_timeLabel");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "centerXAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDeviceAppearanceOptionView _previewImageView](self, "_previewImageView");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "centerXAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "constraintEqualToAnchor:", v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "addObject:", v63);

  -[DBSDeviceAppearanceOptionView _stackView](self, "_stackView");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "topAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDeviceAppearanceOptionView topAnchor](self, "topAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "constraintEqualToAnchor:", v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "addObject:", v67);

  -[DBSDeviceAppearanceOptionView _stackView](self, "_stackView");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "bottomAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDeviceAppearanceOptionView bottomAnchor](self, "bottomAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "constraintEqualToAnchor:", v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "addObject:", v71);

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v72, "sf_isiPad"))
    v73 = 11.0;
  else
    v73 = 15.0;

  -[DBSDeviceAppearanceOptionView _timeLabel](self, "_timeLabel");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "topAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDeviceAppearanceOptionView _previewImageView](self, "_previewImageView");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "topAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "constraintEqualToAnchor:constant:", v77, v73);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "addObject:", v78);

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v50);
  v79 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD740]), "initWithTarget:action:", self, sel__userDidTapOnView_);
  objc_msgSend(v79, "setMinimumPressDuration:", 0.0);
  objc_msgSend(v79, "setCancelPastAllowableMovement:", 1);
  objc_msgSend(v79, "setDelegate:", self);
  -[DBSDeviceAppearanceOptionView addGestureRecognizer:](self, "addGestureRecognizer:", v79);

}

- (void)_updateViewForCurrentInterfaceStyle:(int64_t)a3
{
  unint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v5 = -[DBSDeviceAppearanceOptionView appearanceOption](self, "appearanceOption");
  -[DBSDeviceAppearanceOptionView _checkmarkView](self, "_checkmarkView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  v7 = 1;
  if (v5 == 1)
    v7 = 2;
  objc_msgSend(v6, "setSelected:", v7 == a3);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;

  -[DBSDeviceAppearanceOptionView traitCollection](self, "traitCollection", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[DBSDeviceAppearanceOptionView _updateViewForCurrentInterfaceStyle:](self, "_updateViewForCurrentInterfaceStyle:", objc_msgSend(v4, "userInterfaceStyle"));

}

- (void)_userDidTapOnView:(id)a3
{
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v4 = objc_msgSend(a3, "state");
  -[DBSDeviceAppearanceOptionView setHighlight:](self, "setHighlight:", (unint64_t)(v4 - 1) < 2);
  -[DBSDeviceAppearanceOptionView _checkmarkView](self, "_checkmarkView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isSelected");

  if ((v6 & 1) == 0)
  {
    if (v4 == 3)
    {
      -[DBSDeviceAppearanceOptionView delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_opt_respondsToSelector();

      if ((v8 & 1) == 0)
        return;
      -[DBSDeviceAppearanceOptionView delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "userDidTapOnAppearanceOptionView:", self);

      -[DBSDeviceAppearanceOptionView _feedbackGenerator](self, "_feedbackGenerator");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "impactOccurred");
    }
    else
    {
      if (v4 != 1)
        return;
      -[DBSDeviceAppearanceOptionView _feedbackGenerator](self, "_feedbackGenerator");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "prepare");
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
    -[DBSDeviceAppearanceOptionView setAlpha:](self, "setAlpha:", v3);
  }
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
  -[DBSDeviceAppearanceOptionView gestureRecognizers](self, "gestureRecognizers");
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

- (DBSDeviceAppearanceOptionViewDelegate)delegate
{
  return (DBSDeviceAppearanceOptionViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)appearanceOption
{
  return self->_appearanceOption;
}

- (UIStackView)_stackView
{
  return self->__stackView;
}

- (void)set_stackView:(id)a3
{
  objc_storeStrong((id *)&self->__stackView, a3);
}

- (UIImageView)_previewImageView
{
  return self->__previewImageView;
}

- (void)set_previewImageView:(id)a3
{
  objc_storeStrong((id *)&self->__previewImageView, a3);
}

- (UILabel)_timeLabel
{
  return self->__timeLabel;
}

- (void)set_timeLabel:(id)a3
{
  objc_storeStrong((id *)&self->__timeLabel, a3);
}

- (UILabel)_label
{
  return self->__label;
}

- (void)set_label:(id)a3
{
  objc_storeStrong((id *)&self->__label, a3);
}

- (DBSCheckmarkView)_checkmarkView
{
  return self->__checkmarkView;
}

- (void)set_checkmarkView:(id)a3
{
  objc_storeStrong((id *)&self->__checkmarkView, a3);
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
  objc_storeStrong((id *)&self->__checkmarkView, 0);
  objc_storeStrong((id *)&self->__label, 0);
  objc_storeStrong((id *)&self->__timeLabel, 0);
  objc_storeStrong((id *)&self->__previewImageView, 0);
  objc_storeStrong((id *)&self->__stackView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
