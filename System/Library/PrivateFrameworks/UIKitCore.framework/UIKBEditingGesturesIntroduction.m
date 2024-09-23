@implementation UIKBEditingGesturesIntroduction

+ (BOOL)shouldShowEditingIntroduction
{
  void *v2;
  void *v3;
  char v4;
  int v5;
  void *v6;

  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferencesActions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "oneTimeActionCompleted:", *MEMORY[0x1E0DBE2A0]);

  if ((v4 & 1) != 0)
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    +[UIKeyboard keyboardBundleIdentifier](UIKeyboard, "keyboardBundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.purplebuddy")) ^ 1;

  }
  return v5;
}

- (void)updateConstraints
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  double v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIKBEditingGesturesIntroduction;
  -[UIView updateConstraints](&v8, sel_updateConstraints);
  +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "interfaceOrientation") - 3;

  -[UIKBEditingGesturesIntroduction topPaddingConstraint](self, "topPaddingConstraint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = 0.0;
  if (v4 < 2)
    v7 = 20.0;
  objc_msgSend(v5, "setConstant:", v7);

}

- (void)extraButtonTapAction
{
  id v2;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissEditingIntroductionView");

}

- (id)buttonTitle
{
  __CFString *v2;

  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v2 = CFSTR("Continue");
  else
    v2 = CFSTR("OK");
  _UILocalizedStringInSystemLanguage(v2, v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)textTitleDescriptions
{
  unint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v2 = UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL;
  _UILocalizedStringInSystemLanguage(CFSTR("Undo"), CFSTR("Undo"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v2 == 1)
  {
    v10[0] = v3;
    _UILocalizedStringInSystemLanguage(CFSTR("Undo and Redo"), CFSTR("Undo and Redo"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[1] = v5;
    _UILocalizedStringInSystemLanguage(CFSTR("Copy and Paste"), CFSTR("Copy and Paste"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)textBodyDescriptions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v7;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    _UILocalizedStringInSystemLanguage(CFSTR("EDIT_GESTURES_DOUBLE_TAP_UNDO"), CFSTR("Double-tap with three fingers.\n"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v2;
    _UILocalizedStringInSystemLanguage(CFSTR("EDIT_GESTURES_SWIPE_UNDO_REDO"), CFSTR("Swipe left with three fingers to undo and swipe right to redo."));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8[1] = v3;
    _UILocalizedStringInSystemLanguage(CFSTR("EDIT_GESTURES_PINCH_CP"), CFSTR("Pinch and spread with three fingers to copy and paste a selection."));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _UILocalizedStringInSystemLanguage(CFSTR("EDIT_GESTURES_DOUBLE_TAP_UNDO_PHONE"), CFSTR("Double-tap with three fingers."));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)textBodyFont
{
  uint64_t SafeDeviceIdiom;
  const UIFontTextStyle *v3;

  SafeDeviceIdiom = UIKeyboardGetSafeDeviceIdiom();
  v3 = &UIFontTextStyleBody;
  if ((SafeDeviceIdiom & 0xFFFFFFFFFFFFFFFBLL) != 1)
    v3 = &UIFontTextStyleFootnote;
  return (id)objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", *v3);
}

- (double)pagingInterval
{
  return 5.0;
}

- (id)mediaContents
{
  int64_t v3;
  uint64_t SafeDeviceIdiom;
  uint64_t v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v15;
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v3 = -[UIKBTutorialModalDisplay appearance](self, "appearance");
  SafeDeviceIdiom = UIKeyboardGetSafeDeviceIdiom();
  v5 = *MEMORY[0x1E0CD3078];
  if ((SafeDeviceIdiom & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    if (v3 == 1)
      v6 = CFSTR("DoubleTapUndoDark");
    else
      v6 = CFSTR("DoubleTapUndo");
    if (v3 == 1)
      v7 = CFSTR("SwipeUndoRedoDark");
    else
      v7 = CFSTR("SwipeUndoRedo");
    if (v3 == 1)
      v8 = CFSTR("PinchCPDark");
    else
      v8 = CFSTR("PinchCP");
    -[UIKBEditingGesturesIntroduction animatedTutorialViewNamed:ofType:needsFrame:](self, "animatedTutorialViewNamed:ofType:needsFrame:", v6, *MEMORY[0x1E0CD3078], 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v9;
    -[UIKBEditingGesturesIntroduction animatedTutorialViewNamed:ofType:needsFrame:](self, "animatedTutorialViewNamed:ofType:needsFrame:", v7, v5, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v10;
    -[UIKBEditingGesturesIntroduction animatedTutorialViewNamed:ofType:needsFrame:](self, "animatedTutorialViewNamed:ofType:needsFrame:", v8, v5, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[2] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v3 == 1)
      v13 = CFSTR("DoubleTapUndoPhoneDark");
    else
      v13 = CFSTR("DoubleTapUndoPhone");
    -[UIKBEditingGesturesIntroduction animatedTutorialViewNamed:ofType:needsFrame:](self, "animatedTutorialViewNamed:ofType:needsFrame:", v13, *MEMORY[0x1E0CD3078], 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (id)animatedTutorialViewNamed:(id)a3 ofType:(id)a4 needsFrame:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  UIView *v18;
  UILayoutGuide *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  UIView *v32;
  void *v33;
  UIVisualEffectView *v34;
  void *v35;
  uint64_t v36;
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
  UITutorialAnimatedView *v49;
  UITutorialFramingView *v50;
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
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  _BOOL4 v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v94;
  void *v95;
  id v96;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  -[UIKBTutorialModalDisplay appearance](self, "appearance");
  if ((id)*MEMORY[0x1E0CD3078] == v8)
    v10 = CFSTR("ca");
  else
    v10 = CFSTR("caml");
  v11 = (void *)MEMORY[0x1E0CB34D0];
  _UIKitResourceBundlePath(CFSTR("Artwork.bundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bundleWithPath:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "URLForResource:withExtension:", v9, v10);
  v14 = objc_claimAutoreleasedReturnValue();

  v96 = 0;
  v94 = (void *)v14;
  objc_msgSend(MEMORY[0x1E0CD27F8], "packageWithContentsOfURL:type:options:error:", v14, v8, 0, &v96);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v96;
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "description");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Error %@"), v17);

  }
  v18 = objc_alloc_init(UIView);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v19 = objc_alloc_init(UILayoutGuide);
  -[UIView addLayoutGuide:](v18, "addLayoutGuide:", v19);
  -[UILayoutGuide topAnchor](v19, "topAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](v18, "topAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setActive:", 1);

  -[UIKBEditingGesturesIntroduction topPaddingConstraint](self, "topPaddingConstraint");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
  {
    -[UILayoutGuide heightAnchor](v19, "heightAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToConstant:", 0.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBEditingGesturesIntroduction setTopPaddingConstraint:](self, "setTopPaddingConstraint:", v25);

  }
  +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "interfaceOrientation") - 3;

  -[UIKBEditingGesturesIntroduction topPaddingConstraint](self, "topPaddingConstraint");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  v30 = 0.0;
  if (v27 < 2)
    v30 = 20.0;
  objc_msgSend(v28, "setConstant:", v30);

  -[UIKBEditingGesturesIntroduction topPaddingConstraint](self, "topPaddingConstraint");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setActive:", 1);

  v32 = objc_alloc_init(UIView);
  if (v5)
  {
    +[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 1200);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = [UIVisualEffectView alloc];
    +[UIVibrancyEffect effectForBlurEffect:style:](UIVibrancyEffect, "effectForBlurEffect:style:", v33, 5);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = -[UIVisualEffectView initWithEffect:](v34, "initWithEffect:", v35);

    v32 = (UIView *)v36;
  }
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v32, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](v18, "addSubview:", v32);
  -[UIView leadingAnchor](v32, "leadingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](v18, "leadingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setActive:", 1);

  -[UIView trailingAnchor](v32, "trailingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](v18, "trailingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setActive:", 1);

  -[UIView topAnchor](v32, "topAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide bottomAnchor](v19, "bottomAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setActive:", 1);

  -[UIView bottomAnchor](v32, "bottomAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](v18, "bottomAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setActive:", 1);

  v49 = -[UITutorialAnimatedView initWithKeyboardAppearance:]([UITutorialAnimatedView alloc], "initWithKeyboardAppearance:", -[UIKBTutorialModalDisplay appearance](self, "appearance"));
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v49, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView setContentMode:](v49, "setContentMode:", 1);
  -[UIView setClipsToBounds:](v49, "setClipsToBounds:", 1);
  -[UITutorialAnimatedView setPackage:](v49, "setPackage:", v95);
  if (v5)
  {
    -[UIView addSubview:](v18, "addSubview:", v49);
    v50 = objc_alloc_init(UITutorialFramingView);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v50, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView contentView](v32, "contentView");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "addSubview:", v50);

    -[UIView topAnchor](v50, "topAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](v32, "topAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintEqualToAnchor:", v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setActive:", 1);

    -[UIView bottomAnchor](v50, "bottomAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v32, "bottomAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "constraintEqualToAnchor:", v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setActive:", 1);

    -[UIView leadingAnchor](v50, "leadingAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v32, "leadingAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "constraintEqualToAnchor:", v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setActive:", 1);

    -[UIView trailingAnchor](v50, "trailingAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v32, "trailingAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "constraintEqualToAnchor:", v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setActive:", 1);

    -[UIView heightAnchor](v50, "heightAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "constraintEqualToConstant:", 159.0);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setActive:", 1);

    -[UIView topAnchor](v49, "topAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](v50, "topAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "constraintEqualToAnchor:constant:", v67, 5.0);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "setActive:", 1);

    -[UIView bottomAnchor](v50, "bottomAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v49, "bottomAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "constraintEqualToAnchor:constant:", v70, 5.0);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "setActive:", 1);

    -[UIView leadingAnchor](v49, "leadingAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v50, "leadingAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "constraintEqualToAnchor:constant:", v73, 5.0);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "setActive:", 1);

    -[UIView trailingAnchor](v50, "trailingAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v49, "trailingAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "constraintEqualToAnchor:constant:", v76, 5.0);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "setActive:", 1);

  }
  else
  {
    -[UIView addSubview:](v32, "addSubview:", v49);
    v78 = (UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1;
    -[UIView widthAnchor](v32, "widthAnchor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView heightAnchor](v32, "heightAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "constraintEqualToAnchor:multiplier:", v80, dbl_186679290[v78]);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "setActive:", 1);

    -[UIView heightAnchor](v32, "heightAnchor");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "constraintEqualToConstant:", 169.0);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "setActive:", 1);

    -[UIView topAnchor](v49, "topAnchor");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](v32, "topAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "constraintEqualToAnchor:constant:", v85, 5.0);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "setActive:", 1);

    -[UIView bottomAnchor](v32, "bottomAnchor");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v49, "bottomAnchor");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "constraintEqualToAnchor:constant:", v88, 5.0);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "setActive:", 1);

    -[UIView leadingAnchor](v49, "leadingAnchor");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v32, "leadingAnchor");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "constraintEqualToAnchor:constant:", v91, 5.0);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "setActive:", 1);

    -[UIView trailingAnchor](v32, "trailingAnchor");
    v50 = (UITutorialFramingView *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v49, "trailingAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITutorialFramingView constraintEqualToAnchor:constant:](v50, "constraintEqualToAnchor:constant:", v75, 5.0);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "setActive:", 1);
  }

  return v18;
}

- (BOOL)presentsFullScreen
{
  return 0;
}

- (NSLayoutConstraint)topPaddingConstraint
{
  return self->_topPaddingConstraint;
}

- (void)setTopPaddingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_topPaddingConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topPaddingConstraint, 0);
}

@end
