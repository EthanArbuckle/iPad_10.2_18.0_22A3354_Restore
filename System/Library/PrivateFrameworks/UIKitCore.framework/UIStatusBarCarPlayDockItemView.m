@implementation UIStatusBarCarPlayDockItemView

- (UIStatusBarCarPlayDockItemView)initWithFrame:(CGRect)a3
{
  UIStatusBarCarPlayDockItemView *v3;
  UIStatusBarCarPlayDockAppItemButton *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  UIStatusBarCarPlayDockAppItemButton *itemOneButton;
  UIStatusBarCarPlayDockAppItemButton *v11;
  UIStatusBarCarPlayDockAppItemButton *itemTwoButton;
  UIStatusBarCarPlayDockAppItemButton *v13;
  UIStatusBarCarPlayDockAppItemButton *itemThreeButton;
  UILabel *v15;
  UILabel *inCallDurationLabel;
  void *v17;
  void *v18;
  uint64_t v19;
  NSLayoutConstraint *inCallLabelSpacingConstraint;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v26;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v26.receiver = self;
  v26.super_class = (Class)UIStatusBarCarPlayDockItemView;
  v3 = -[UIView initWithFrame:](&v26, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [UIStatusBarCarPlayDockAppItemButton alloc];
    v5 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v9 = -[UIStatusBarCarPlayDockAppItemButton initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], v6, v7, v8);
    itemOneButton = v3->_itemOneButton;
    v3->_itemOneButton = (UIStatusBarCarPlayDockAppItemButton *)v9;

    -[UIView addSubview:](v3, "addSubview:", v3->_itemOneButton);
    v11 = -[UIStatusBarCarPlayDockAppItemButton initWithFrame:]([UIStatusBarCarPlayDockAppItemButton alloc], "initWithFrame:", v5, v6, v7, v8);
    itemTwoButton = v3->_itemTwoButton;
    v3->_itemTwoButton = v11;

    -[UIView addSubview:](v3, "addSubview:", v3->_itemTwoButton);
    v13 = -[UIStatusBarCarPlayDockAppItemButton initWithFrame:]([UIStatusBarCarPlayDockAppItemButton alloc], "initWithFrame:", v5, v6, v7, v8);
    itemThreeButton = v3->_itemThreeButton;
    v3->_itemThreeButton = v13;

    -[UIView addSubview:](v3, "addSubview:", v3->_itemThreeButton);
    v15 = -[UILabel initWithFrame:]([UILabel alloc], "initWithFrame:", v5, v6, v7, v8);
    inCallDurationLabel = v3->_inCallDurationLabel;
    v3->_inCallDurationLabel = v15;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_inCallDurationLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v3, "addSubview:", v3->_inCallDurationLabel);
    -[UIView setHidden:](v3->_inCallDurationLabel, "setHidden:", 1);
    -[UIView firstBaselineAnchor](v3->_inCallDurationLabel, "firstBaselineAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v3->_itemThreeButton, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:constant:", v18, 5.5);
    v19 = objc_claimAutoreleasedReturnValue();
    inCallLabelSpacingConstraint = v3->_inCallLabelSpacingConstraint;
    v3->_inCallLabelSpacingConstraint = (NSLayoutConstraint *)v19;

    v27[0] = v3->_inCallLabelSpacingConstraint;
    -[UIView centerXAnchor](v3->_inCallDurationLabel, "centerXAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerXAnchor](v3, "centerXAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v24);
  }
  return v3;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  int v15;
  int v16;
  double v17;
  double v18;
  objc_super v19;

  y = a3.y;
  v19.receiver = self;
  v19.super_class = (Class)UIStatusBarCarPlayDockItemView;
  -[UIView hitTest:withEvent:](&v19, sel_hitTest_withEvent_, a4, a3.x);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStatusBarCarPlayDockItemView itemOneButton](self, "itemOneButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 != v7)
    goto LABEL_2;
  v8 = objc_msgSend(v6, "isActive");

  if (v8)
  {
    -[UIStatusBarCarPlayDockItemView itemTwoButton](self, "itemTwoButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "origin");
    if (_UIInternalPreferencesRevisionOnce != -1)
    {
      v17 = v10;
      dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_4_20);
      v10 = v17;
    }
    v11 = 15.0;
    if (_UIInternalPreferencesRevisionVar >= 1)
    {
      v15 = _UIInternalPreference_CarPlayDockSecondItemHitTestExtension;
      if (_UIInternalPreferencesRevisionVar != _UIInternalPreference_CarPlayDockSecondItemHitTestExtension)
      {
        v16 = _UIInternalPreferencesRevisionVar;
        v18 = v10;
        while (v16 >= v15)
        {
          _UIInternalPreferenceSync(v16, &_UIInternalPreference_CarPlayDockSecondItemHitTestExtension, (uint64_t)CFSTR("CarPlayDockSecondItemHitTestExtension"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
          v15 = _UIInternalPreference_CarPlayDockSecondItemHitTestExtension;
          if (v16 == _UIInternalPreference_CarPlayDockSecondItemHitTestExtension)
          {
            v10 = v18;
            v11 = 15.0;
            goto LABEL_7;
          }
        }
        v11 = *(double *)&qword_1EDDA8298;
        v10 = v18;
      }
    }
LABEL_7:
    v12 = v10 - v11;

    if (y > v12)
    {
      -[UIStatusBarCarPlayDockItemView itemTwoButton](self, "itemTwoButton");
      v13 = objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v6 = (void *)v13;
LABEL_2:

    }
  }
  return v6;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  id v11;

  -[UIView bounds](self, "bounds");
  v4 = v3;
  UIRoundToViewScale(self);
  v6 = v5;
  v7 = v5 + 38.0;
  v8 = v5 + 38.0 + 38.0;
  -[UIStatusBarCarPlayDockItemView itemOneButton](self, "itemOneButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFrame:", 0.0, v6, v4, 38.0);

  -[UIStatusBarCarPlayDockItemView itemTwoButton](self, "itemTwoButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFrame:", 0.0, v7, v4, 38.0);

  -[UIStatusBarCarPlayDockItemView itemThreeButton](self, "itemThreeButton");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", 0.0, v8, v4, 38.0);

}

- (BOOL)allowsUserInteraction
{
  return 1;
}

- (double)_neededSizeWithCallTimer
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;

  -[UIStatusBarCarPlayDockItemView inCallDurationLabel](self, "inCallDurationLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  -[UIStatusBarCarPlayDockItemView inCallDurationLabel](self, "inCallDurationLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_firstBaselineOffsetFromTop");
  v8 = v5 + v7 + 8.0;

  return v8;
}

- (double)_neededSizeWithoutCallTimer
{
  return (double)-[UIStatusBarCarPlayDockItemView _numberOfEnabledItems](self, "_numberOfEnabledItems") * 38.0 + 3.5;
}

- (double)neededSizeForImageSet:(id)a3
{
  double result;

  if (-[UIStatusBarCarPlayDockItemView isShowingCallTimer](self, "isShowingCallTimer", a3))
    -[UIStatusBarCarPlayDockItemView _neededSizeWithCallTimer](self, "_neededSizeWithCallTimer");
  else
    -[UIStatusBarCarPlayDockItemView _neededSizeWithoutCallTimer](self, "_neededSizeWithoutCallTimer");
  return result;
}

- (void)updateForNewStyle:(id)a3
{
  id v4;
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
  void *v27;
  void *v28;
  id v29;

  v4 = a3;
  objc_msgSend(v4, "untintedImageNamed:", CFSTR("AppIcon_Highlight_Sliced"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageWithRenderingMode:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIColor externalSystemTealColor](UIColor, "externalSystemTealColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_flatImageWithColor:", v7);
  v29 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v29, "resizableImageWithCapInsets:", 12.0, 12.0, 12.0, 12.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStatusBarCarPlayDockItemView itemOneButton](self, "itemOneButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "iconHighlightImageView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setImage:", v8);

  -[UIStatusBarCarPlayDockItemView itemTwoButton](self, "itemTwoButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "iconHighlightImageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setImage:", v8);

  -[UIStatusBarCarPlayDockItemView itemThreeButton](self, "itemThreeButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "iconHighlightImageView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setImage:", v8);

  objc_msgSend(v4, "untintedImageNamed:", CFSTR("Dock_Badge"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIColor redColor](UIColor, "redColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_flatImageWithColor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIStatusBarCarPlayDockItemView itemOneButton](self, "itemOneButton");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "badgeView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setImage:", v17);

  -[UIStatusBarCarPlayDockItemView itemTwoButton](self, "itemTwoButton");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "badgeView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setImage:", v17);

  -[UIStatusBarCarPlayDockItemView itemThreeButton](self, "itemThreeButton");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "badgeView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setImage:", v17);

  objc_msgSend(v4, "textFontForStyle:", 4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIStatusBarCarPlayDockItemView inCallDurationLabel](self, "inCallDurationLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setFont:", v24);

  +[UIColor whiteColor](UIColor, "whiteColor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStatusBarCarPlayDockItemView inCallDurationLabel](self, "inCallDurationLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setTextColor:", v26);

  -[UIStatusBarCarPlayDockItemView inCallDurationLabel](self, "inCallDurationLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setTextAlignment:", 1);

}

- (BOOL)animatesDataChange
{
  return 1;
}

- (BOOL)updateForNewData:(id)a3 actions:(int)a4
{
  uint64_t v4;
  id v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  id v45;
  id v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  id v51;
  void *v52;
  id v53;
  unsigned int v54;
  unsigned int v55;
  unsigned int v56;
  void *v57;
  void *v58;
  void *v59;
  char v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  objc_super v66;
  _QWORD v67[4];
  id v68;
  id v69;
  id v70;
  UIStatusBarCarPlayDockItemView *v71;
  _QWORD *v72;
  _QWORD *v73;
  _QWORD *v74;
  _QWORD *v75;
  _QWORD v76[4];
  id v77;
  id v78;
  id v79;
  id v80;
  _QWORD *v81;
  _QWORD *v82;
  _QWORD *v83;
  _QWORD *v84;
  _QWORD *v85;
  _QWORD v86[4];
  id v87;
  id v88;
  UIStatusBarCarPlayDockItemView *v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  _QWORD *v102;
  _QWORD *v103;
  _QWORD *v104;
  _QWORD *v105;
  _QWORD *v106;
  _QWORD *v107;
  char v108;
  char v109;
  char v110;
  _QWORD v111[5];
  id v112;
  _QWORD v113[5];
  id v114;
  _QWORD v115[5];
  id v116;
  _QWORD v117[5];
  id v118;
  _QWORD v119[5];
  id v120;
  _QWORD v121[5];
  id v122;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  if ((v4 & 0x100) != 0)
  {
    -[UIStatusBarItemView foregroundView](self, "foregroundView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "statusBar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dockDataProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
LABEL_28:

      v7 = 1;
      goto LABEL_29;
    }
    objc_msgSend(v10, "bundleIdentifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "activeBundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStatusBarCarPlayDockItemView currentBundleIdentifiers](self, "currentBundleIdentifiers");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v11, "count");
    if (v14)
    {
      v15 = v14;
      objc_msgSend(v11, "firstObject");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v16;
      if (v15 == 1)
      {
        v18 = 0;
        v19 = 0;
      }
      else
      {
        v20 = v16;
        objc_msgSend(v11, "objectAtIndex:", 1);
        v21 = objc_claimAutoreleasedReturnValue();
        if (v15 < 3)
        {
          v18 = 0;
        }
        else
        {
          objc_msgSend(v11, "objectAtIndex:", 2);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v17 = (void *)v20;
        v19 = (void *)v21;
      }
    }
    else
    {
      v18 = 0;
      v19 = 0;
      v17 = 0;
    }
    v62 = v17;
    v55 = objc_msgSend(v10, "shouldDisplayBadgeForBundleIdentifier:", v17);
    v56 = objc_msgSend(v10, "shouldDisplayBadgeForBundleIdentifier:", v19);
    v22 = objc_msgSend(v10, "shouldDisplayBadgeForBundleIdentifier:", v18);
    -[UIStatusBarCarPlayDockItemView itemOneButton](self, "itemOneButton");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStatusBarCarPlayDockItemView itemTwoButton](self, "itemTwoButton");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStatusBarCarPlayDockItemView itemThreeButton](self, "itemThreeButton");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = (void *)v13;
    v54 = v22;
    if (objc_msgSend(v11, "isEqualToArray:", v13))
    {
      -[UIStatusBarCarPlayDockItemView currentActiveBundleIdentifier](self, "currentActiveBundleIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if ((v12 == 0) != (v23 != 0))
      {
        -[UIStatusBarCarPlayDockItemView currentActiveBundleIdentifier](self, "currentActiveBundleIdentifier");
        v25 = objc_claimAutoreleasedReturnValue();
        if (!v25)
        {

LABEL_31:
          objc_msgSend(v65, "setHasBadge:", v55);
          objc_msgSend(v65, "setBadgeHidden:animated:", objc_msgSend(v65, "shouldShowBadge") ^ 1, 1);
          objc_msgSend(v64, "setHasBadge:", v56);
          objc_msgSend(v64, "setBadgeHidden:animated:", objc_msgSend(v64, "shouldShowBadge") ^ 1, 1);
          objc_msgSend(v63, "setHasBadge:", v22);
          objc_msgSend(v63, "setBadgeHidden:animated:", objc_msgSend(v63, "shouldShowBadge") ^ 1, 1);
          v42 = v59;
LABEL_27:
          objc_msgSend(v10, "callDuration");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIStatusBarCarPlayDockItemView _updateInCallDurationIfNecessary:](self, "_updateInCallDurationIfNecessary:", v43);

          goto LABEL_28;
        }
        v26 = (void *)v25;
        -[UIStatusBarCarPlayDockItemView currentActiveBundleIdentifier](self, "currentActiveBundleIdentifier");
        v27 = v18;
        v28 = v19;
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = objc_msgSend(v29, "isEqualToString:", v12);

        v19 = v28;
        v18 = v27;
        v22 = v54;

        if ((v60 & 1) != 0)
          goto LABEL_31;
      }
      else
      {

      }
    }
    -[UIView traitCollection](self, "traitCollection");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dockImageForBundleIdentifier:format:traitCollection:", v62, 9, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIView traitCollection](self, "traitCollection");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = v19;
    objc_msgSend(v10, "dockImageForBundleIdentifier:format:traitCollection:", v19, 9, v32);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIView traitCollection](self, "traitCollection");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dockImageForBundleIdentifier:format:traitCollection:", v18, 9, v33);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v65, "setUserInteractionEnabled:", 0);
    objc_msgSend(v64, "setUserInteractionEnabled:", 0);
    objc_msgSend(v63, "setUserInteractionEnabled:", 0);
    v121[0] = 0;
    v121[1] = v121;
    v121[2] = 0x3032000000;
    v121[3] = __Block_byref_object_copy__171;
    v121[4] = __Block_byref_object_dispose__171;
    if (v62)
    {
      -[UIStatusBarCarPlayDockItemView _toItemViewForBundleIdentifier:](self, "_toItemViewForBundleIdentifier:", v62);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v34 = 0;
    }
    v122 = v34;
    if (v19)
    {
      -[UIStatusBarCarPlayDockItemView _toItemViewForBundleIdentifier:](self, "_toItemViewForBundleIdentifier:");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v35 = 0;
    }
    v57 = v18;
    v58 = v12;
    if (v18)
    {
      -[UIStatusBarCarPlayDockItemView _toItemViewForBundleIdentifier:](self, "_toItemViewForBundleIdentifier:", v18);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v119[0] = 0;
    v119[1] = v119;
    v119[2] = 0x3032000000;
    v119[3] = __Block_byref_object_copy__171;
    v119[4] = __Block_byref_object_dispose__171;
    v120 = 0;
    v117[0] = 0;
    v117[1] = v117;
    v117[2] = 0x3032000000;
    v117[3] = __Block_byref_object_copy__171;
    v117[4] = __Block_byref_object_dispose__171;
    v118 = 0;
    v115[0] = 0;
    v115[1] = v115;
    v115[2] = 0x3032000000;
    v115[3] = __Block_byref_object_copy__171;
    v115[4] = __Block_byref_object_dispose__171;
    v116 = 0;
    v113[0] = 0;
    v113[1] = v113;
    v113[2] = 0x3032000000;
    v113[3] = __Block_byref_object_copy__171;
    v113[4] = __Block_byref_object_dispose__171;
    v114 = 0;
    v111[0] = 0;
    v111[1] = v111;
    v111[2] = 0x3032000000;
    v111[3] = __Block_byref_object_copy__171;
    v111[4] = __Block_byref_object_dispose__171;
    v112 = 0;
    v36 = MEMORY[0x1E0C809B0];
    v86[0] = MEMORY[0x1E0C809B0];
    v86[1] = 3221225472;
    v86[2] = __59__UIStatusBarCarPlayDockItemView_updateForNewData_actions___block_invoke;
    v86[3] = &unk_1E16DFD08;
    v102 = v121;
    v87 = v59;
    v47 = v11;
    v48 = v11;
    v88 = v48;
    v89 = self;
    v103 = v111;
    v104 = v117;
    v90 = v62;
    v105 = v115;
    v91 = v61;
    v46 = v35;
    v92 = v46;
    v106 = v113;
    v93 = v57;
    v45 = v18;
    v94 = v45;
    v49 = v31;
    v95 = v49;
    v37 = v65;
    v96 = v37;
    v38 = v64;
    v97 = v38;
    v39 = v63;
    v98 = v39;
    v107 = v119;
    v40 = v58;
    v99 = v40;
    v53 = v52;
    v100 = v53;
    v51 = v50;
    v101 = v51;
    v108 = v55;
    v109 = v56;
    v110 = v54;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v86);
    v76[0] = v36;
    v76[1] = 3221225472;
    v76[2] = __59__UIStatusBarCarPlayDockItemView_updateForNewData_actions___block_invoke_3;
    v76[3] = &unk_1E16DFD30;
    v81 = v117;
    v82 = v115;
    v83 = v113;
    v41 = v40;
    v77 = v41;
    v84 = v111;
    v78 = v37;
    v79 = v38;
    v80 = v39;
    v85 = v119;
    v67[0] = v36;
    v67[1] = 3221225472;
    v67[2] = __59__UIStatusBarCarPlayDockItemView_updateForNewData_actions___block_invoke_4;
    v67[3] = &unk_1E16DFD58;
    v68 = v78;
    v69 = v79;
    v70 = v80;
    v71 = self;
    v72 = v117;
    v73 = v111;
    v74 = v115;
    v75 = v113;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v76, v67, 0.4);
    -[UIStatusBarCarPlayDockItemView setCurrentBundleIdentifiers:](self, "setCurrentBundleIdentifiers:", v48);
    -[UIStatusBarCarPlayDockItemView setCurrentActiveBundleIdentifier:](self, "setCurrentActiveBundleIdentifier:", v41);

    _Block_object_dispose(v111, 8);
    _Block_object_dispose(v113, 8);

    _Block_object_dispose(v115, 8);
    _Block_object_dispose(v117, 8);

    _Block_object_dispose(v119, 8);
    _Block_object_dispose(v121, 8);

    v11 = v47;
    v12 = v58;
    v42 = v59;
    v19 = v61;
    v18 = v57;
    goto LABEL_27;
  }
  v66.receiver = self;
  v66.super_class = (Class)UIStatusBarCarPlayDockItemView;
  v7 = -[UIStatusBarItemView updateForNewData:actions:](&v66, sel_updateForNewData_actions_, v6, v4);
LABEL_29:

  return v7;
}

void __59__UIStatusBarCarPlayDockItemView_updateForNewData_actions___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  void *v34;
  void *v35;
  double v36;
  void *v37;
  void *v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  _QWORD v45[4];
  id v46;
  uint64_t v47;
  __int128 v48;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 152) + 8) + 40))
  {
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __59__UIStatusBarCarPlayDockItemView_updateForNewData_actions___block_invoke_2;
    v45[3] = &unk_1E16DFCE0;
    v2 = *(void **)(a1 + 32);
    v3 = *(id *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 48);
    v46 = v3;
    v47 = v4;
    v48 = *(_OWORD *)(a1 + 152);
    objc_msgSend(v2, "enumerateObjectsUsingBlock:", v45);

  }
  v5 = *(_QWORD *)(a1 + 56);
  if (v5)
    v6 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 152) + 8) + 40), "copy");
  else
    v6 = 0;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 168) + 8) + 40), v6);
  if (v5)

  v7 = *(_QWORD *)(a1 + 64);
  if (v7)
    v8 = (void *)objc_msgSend(*(id *)(a1 + 72), "copy");
  else
    v8 = 0;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 176) + 8) + 40), v8);
  if (v7)

  v9 = *(_QWORD *)(a1 + 80);
  if (v9)
    v10 = (void *)objc_msgSend(*(id *)(a1 + 88), "copy");
  else
    v10 = 0;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 184) + 8) + 40), v10);
  if (v9)

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 160) + 8) + 40))
  {
    v11 = *(_QWORD *)(a1 + 96);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 168) + 8) + 40), "iconImageView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setImage:", v11);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 168) + 8) + 40), "setUserInteractionEnabled:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 176) + 8) + 40), "setUserInteractionEnabled:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 184) + 8) + 40), "setUserInteractionEnabled:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 160) + 8) + 40), "setUserInteractionEnabled:", 0);
  objc_msgSend(*(id *)(a1 + 48), "addSubview:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 184) + 8) + 40));
  objc_msgSend(*(id *)(a1 + 48), "addSubview:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 176) + 8) + 40));
  objc_msgSend(*(id *)(a1 + 48), "addSubview:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 168) + 8) + 40));
  objc_msgSend(*(id *)(a1 + 48), "addSubview:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 160) + 8) + 40));
  v13 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 168) + 8) + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 152) + 8) + 40), "frame");
  objc_msgSend(v13, "setFrame:");
  v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 176) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 72), "frame");
  objc_msgSend(v14, "setFrame:");
  v15 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 184) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 88), "frame");
  objc_msgSend(v15, "setFrame:");
  objc_msgSend(*(id *)(a1 + 104), "setHidden:", 1);
  objc_msgSend(*(id *)(a1 + 112), "setHidden:", 1);
  objc_msgSend(*(id *)(a1 + 120), "setHidden:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 168) + 8) + 40), "setShowsTouchWhenHighlighted:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 176) + 8) + 40), "setShowsTouchWhenHighlighted:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 184) + 8) + 40), "setShowsTouchWhenHighlighted:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 168) + 8) + 40), "layoutIfNeeded");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 176) + 8) + 40), "layoutIfNeeded");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 184) + 8) + 40), "layoutIfNeeded");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 160) + 8) + 40), "layoutIfNeeded");
  if (objc_msgSend(*(id *)(a1 + 104), "isFocused")
    && (objc_msgSend(*(id *)(a1 + 104), "isActive") & 1) == 0
    || objc_msgSend(*(id *)(a1 + 112), "isFocused"))
  {
    v16 = *(_QWORD *)(a1 + 176);
  }
  else
  {
    if (!objc_msgSend(*(id *)(a1 + 120), "isFocused"))
      goto LABEL_27;
    v16 = *(_QWORD *)(a1 + 184);
  }
  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 192) + 8);
  v18 = *(id *)(*(_QWORD *)(v16 + 8) + 40);
  v19 = *(void **)(v17 + 40);
  *(_QWORD *)(v17 + 40) = v18;

LABEL_27:
  if (*(_QWORD *)(a1 + 128))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 192) + 8) + 40), "iconHighlightImageView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setAlpha:", 0.0);

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 192) + 8) + 40), "iconHighlightImageView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setHidden:", 0);

  }
  objc_msgSend(*(id *)(a1 + 104), "setBundleIdentifier:", *(_QWORD *)(a1 + 56));
  v22 = *(_QWORD *)(a1 + 96);
  objc_msgSend(*(id *)(a1 + 104), "iconImageView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setImage:", v22);

  objc_msgSend(*(id *)(a1 + 112), "setBundleIdentifier:", *(_QWORD *)(a1 + 64));
  v24 = *(_QWORD *)(a1 + 136);
  objc_msgSend(*(id *)(a1 + 112), "iconImageView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setImage:", v24);

  objc_msgSend(*(id *)(a1 + 120), "setBundleIdentifier:", *(_QWORD *)(a1 + 80));
  v26 = *(_QWORD *)(a1 + 144);
  objc_msgSend(*(id *)(a1 + 120), "iconImageView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setImage:", v26);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 168) + 8) + 40), "badgeView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setHidden:", 0);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 176) + 8) + 40), "badgeView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setHidden:", 0);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 184) + 8) + 40), "badgeView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setHidden:", 0);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 168) + 8) + 40), "badgeView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 152) + 8) + 40), "badgeView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v32, "isHidden"))
    v33 = 0.0;
  else
    v33 = 1.0;
  objc_msgSend(v31, "setAlpha:", v33);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 176) + 8) + 40), "badgeView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 72), "badgeView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v35, "isHidden"))
    v36 = 0.0;
  else
    v36 = 1.0;
  objc_msgSend(v34, "setAlpha:", v36);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 184) + 8) + 40), "badgeView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 88), "badgeView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v38, "isHidden"))
    v39 = 0.0;
  else
    v39 = 1.0;
  objc_msgSend(v37, "setAlpha:", v39);

  v40 = *(void **)(a1 + 104);
  objc_msgSend(v40, "bundleIdentifier");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setActive:", objc_msgSend(v41, "isEqualToString:", *(_QWORD *)(a1 + 128)));

  objc_msgSend(*(id *)(a1 + 104), "setEnabled:", objc_msgSend(*(id *)(a1 + 104), "isActive") ^ 1);
  objc_msgSend(*(id *)(a1 + 104), "setHasBadge:", *(unsigned __int8 *)(a1 + 200));
  objc_msgSend(*(id *)(a1 + 112), "setHasBadge:", *(unsigned __int8 *)(a1 + 201));
  objc_msgSend(*(id *)(a1 + 120), "setHasBadge:", *(unsigned __int8 *)(a1 + 202));
  objc_msgSend(*(id *)(a1 + 104), "badgeView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setHidden:", objc_msgSend(*(id *)(a1 + 104), "shouldShowBadge") ^ 1);

  objc_msgSend(*(id *)(a1 + 112), "badgeView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setHidden:", objc_msgSend(*(id *)(a1 + 112), "shouldShowBadge") ^ 1);

  objc_msgSend(*(id *)(a1 + 120), "badgeView");
  v44 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setHidden:", objc_msgSend(*(id *)(a1 + 120), "shouldShowBadge") ^ 1);

}

void __59__UIStatusBarCarPlayDockItemView_updateForNewData_actions___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "_toItemViewForBundleIdentifier:", v14);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    v9 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "copy");
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    v12 = *(_QWORD *)(a1 + 48);
    v13 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    objc_msgSend(*(id *)(*(_QWORD *)(v12 + 8) + 40), "frame");
    objc_msgSend(v13, "setFrame:");
    *a4 = 1;
  }

}

void __59__UIStatusBarCarPlayDockItemView_updateForNewData_actions___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "iconHighlightImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "iconHighlightImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "iconHighlightImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setActive:", *(_QWORD *)(a1 + 32) != 0);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setActive:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "setActive:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "setActive:", *(_QWORD *)(a1 + 32) != 0);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "badgeView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 40), "shouldShowBadge"))
    v6 = 1.0;
  else
    v6 = 0.0;
  objc_msgSend(v5, "setAlpha:", v6);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "badgeView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 48), "shouldShowBadge"))
    v8 = 1.0;
  else
    v8 = 0.0;
  objc_msgSend(v7, "setAlpha:", v8);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "badgeView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 56), "shouldShowBadge"))
    v10 = 1.0;
  else
    v10 = 0.0;
  objc_msgSend(v9, "setAlpha:", v10);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "layoutIfNeeded");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "layoutIfNeeded");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "layoutIfNeeded");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "layoutIfNeeded");
  v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 40), "frame");
  objc_msgSend(v11, "setFrame:");
  v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 48), "frame");
  objc_msgSend(v12, "setFrame:");
  v13 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 56), "frame");
  objc_msgSend(v13, "setFrame:");
  v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 40), "frame");
  objc_msgSend(v14, "setFrame:");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "setAlpha:", 0.0);
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "iconHighlightImageView");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAlpha:", 1.0);

  }
}

uint64_t __59__UIStatusBarCarPlayDockItemView_updateForNewData_actions___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHidden:", v3 == 0);

  v4 = *(void **)(a1 + 40);
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v5 == 0);

  v6 = *(void **)(a1 + 48);
  objc_msgSend(v6, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", v7 == 0);

  objc_msgSend(*(id *)(a1 + 32), "setUserInteractionEnabled:", 1);
  objc_msgSend(*(id *)(a1 + 40), "setUserInteractionEnabled:", 1);
  objc_msgSend(*(id *)(a1 + 48), "setUserInteractionEnabled:", 1);
  if (objc_msgSend(*(id *)(a1 + 32), "isFocused"))
  {
    objc_msgSend(*(id *)(a1 + 56), "setPreferredItemViewToFocus:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 56), "setNeedsFocusUpdate");
    objc_msgSend(*(id *)(a1 + 56), "updateFocusIfNeeded");
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "removeFromSuperview");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "removeFromSuperview");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "removeFromSuperview");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "removeFromSuperview");
  return objc_msgSend(*(id *)(a1 + 56), "updateContentsAndWidth");
}

- (id)_toItemViewForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__171;
  v16 = __Block_byref_object_dispose__171;
  v17 = 0;
  -[UIView subviews](self, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__UIStatusBarCarPlayDockItemView__toItemViewForBundleIdentifier___block_invoke;
  v9[3] = &unk_1E16DFD80;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __65__UIStatusBarCarPlayDockItemView__toItemViewForBundleIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

    if (v8)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
      *a4 = 1;
    }
  }

}

- (void)_updateInCallDurationIfNecessary:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[4];
  id v16;
  UIStatusBarCarPlayDockItemView *v17;
  _QWORD v18[5];
  id v19;
  id v20;

  v4 = a3;
  -[UIStatusBarCarPlayDockItemView inCallDurationLabel](self, "inCallDurationLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[UIStatusBarCarPlayDockItemView isShowingCallTimer](self, "isShowingCallTimer");
  if (!v4)
  {
    if (!v6)
      goto LABEL_8;
    -[UIStatusBarCarPlayDockItemView setShowingCallTimer:](self, "setShowingCallTimer:", 0);
    v7 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __67__UIStatusBarCarPlayDockItemView__updateInCallDurationIfNecessary___block_invoke_3;
    v13[3] = &unk_1E16B1B50;
    v13[4] = self;
    v14 = v5;
    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __67__UIStatusBarCarPlayDockItemView__updateInCallDurationIfNecessary___block_invoke_4;
    v11[3] = &unk_1E16B3FD8;
    v12 = v14;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v13, v11, 0.4);

    v8 = v14;
LABEL_7:

    goto LABEL_8;
  }
  if (!v6)
  {
    v9 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __67__UIStatusBarCarPlayDockItemView__updateInCallDurationIfNecessary___block_invoke;
    v18[3] = &unk_1E16B47A8;
    v18[4] = self;
    v10 = v5;
    v19 = v10;
    v20 = v4;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v18);
    -[UIStatusBarCarPlayDockItemView setShowingCallTimer:](self, "setShowingCallTimer:", 1);
    v15[0] = v9;
    v15[1] = 3221225472;
    v15[2] = __67__UIStatusBarCarPlayDockItemView__updateInCallDurationIfNecessary___block_invoke_2;
    v15[3] = &unk_1E16B1B50;
    v16 = v10;
    v17 = self;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v15, 0.4);

    v8 = v19;
    goto LABEL_7;
  }
  objc_msgSend(v5, "setText:", v4);
  objc_msgSend(v5, "sizeToFit");
LABEL_8:

}

uint64_t __67__UIStatusBarCarPlayDockItemView__updateInCallDurationIfNecessary___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D156E0];
  objc_msgSend(*(id *)(a1 + 32), "inCallLabelSpacingConstraint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deactivateConstraints:", v4);

  objc_msgSend(*(id *)(a1 + 32), "itemThreeButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v5, "itemHasBundleIdentifier");

  objc_msgSend(*(id *)(a1 + 40), "firstBaselineAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 8;
  if ((_DWORD)v3)
    v7 = 9;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + OBJC_IVAR___UIStatusBarCarPlayDockAppItemButton__iconImageView[v7]), "bottomAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:constant:", v8, 5.5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setInCallLabelSpacingConstraint:", v9);

  v10 = (void *)MEMORY[0x1E0D156E0];
  objc_msgSend(*(id *)(a1 + 32), "inCallLabelSpacingConstraint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "activateConstraints:", v12);

  objc_msgSend(*(id *)(a1 + 40), "setText:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "sizeToFit");
  objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(a1 + 40), "setHidden:", 0);
}

void __67__UIStatusBarCarPlayDockItemView__updateInCallDurationIfNecessary___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(a1 + 40), "layoutManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 40);
  objc_msgSend(v2, "updateContentsAndWidth");
  objc_msgSend(v3, "itemView:sizeChangedBy:", v2);

}

uint64_t __67__UIStatusBarCarPlayDockItemView__updateInCallDurationIfNecessary___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "layoutManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "updateContentsAndWidth");
  objc_msgSend(v2, "itemView:sizeChangedBy:", v3);

  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
}

uint64_t __67__UIStatusBarCarPlayDockItemView__updateInCallDurationIfNecessary___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setHidden:", 1);
}

- (double)extraLeftPadding
{
  return 0.0;
}

- (double)extraRightPadding
{
  return -8.0;
}

- (unint64_t)_numberOfEnabledItems
{
  void *v3;
  unsigned int v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;

  -[UIStatusBarCarPlayDockItemView itemOneButton](self, "itemOneButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "itemHasBundleIdentifier");

  -[UIStatusBarCarPlayDockItemView itemTwoButton](self, "itemTwoButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "itemHasBundleIdentifier") + (unint64_t)v4;

  -[UIStatusBarCarPlayDockItemView itemThreeButton](self, "itemThreeButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 + objc_msgSend(v7, "itemHasBundleIdentifier");

  return v8;
}

- (id)preferredFocusEnvironments
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[UIStatusBarCarPlayDockItemView preferredItemViewToFocus](self, "preferredItemViewToFocus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UIStatusBarCarPlayDockItemView preferredItemViewToFocus](self, "preferredItemViewToFocus");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIStatusBarCarPlayDockItemView;
    -[UIView preferredFocusEnvironments](&v7, sel_preferredFocusEnvironments);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (UILabel)inCallDurationLabel
{
  return self->_inCallDurationLabel;
}

- (void)setInCallDurationLabel:(id)a3
{
  objc_storeStrong((id *)&self->_inCallDurationLabel, a3);
}

- (UIStatusBarCarPlayDockAppItemButton)itemOneButton
{
  return self->_itemOneButton;
}

- (void)setItemOneButton:(id)a3
{
  objc_storeStrong((id *)&self->_itemOneButton, a3);
}

- (UIStatusBarCarPlayDockAppItemButton)itemTwoButton
{
  return self->_itemTwoButton;
}

- (void)setItemTwoButton:(id)a3
{
  objc_storeStrong((id *)&self->_itemTwoButton, a3);
}

- (UIStatusBarCarPlayDockAppItemButton)itemThreeButton
{
  return self->_itemThreeButton;
}

- (void)setItemThreeButton:(id)a3
{
  objc_storeStrong((id *)&self->_itemThreeButton, a3);
}

- (NSLayoutConstraint)inCallLabelSpacingConstraint
{
  return self->_inCallLabelSpacingConstraint;
}

- (void)setInCallLabelSpacingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_inCallLabelSpacingConstraint, a3);
}

- (NSLayoutConstraint)itemOneTopConstraint
{
  return self->_itemOneTopConstraint;
}

- (void)setItemOneTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_itemOneTopConstraint, a3);
}

- (NSArray)currentBundleIdentifiers
{
  return self->_currentBundleIdentifiers;
}

- (void)setCurrentBundleIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 560);
}

- (NSString)currentActiveBundleIdentifier
{
  return self->_currentActiveBundleIdentifier;
}

- (void)setCurrentActiveBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 568);
}

- (UIView)preferredItemViewToFocus
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_preferredItemViewToFocus);
}

- (void)setPreferredItemViewToFocus:(id)a3
{
  objc_storeWeak((id *)&self->_preferredItemViewToFocus, a3);
}

- (BOOL)isShowingCallTimer
{
  return self->_showingCallTimer;
}

- (void)setShowingCallTimer:(BOOL)a3
{
  self->_showingCallTimer = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_preferredItemViewToFocus);
  objc_storeStrong((id *)&self->_currentActiveBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_currentBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_itemOneTopConstraint, 0);
  objc_storeStrong((id *)&self->_inCallLabelSpacingConstraint, 0);
  objc_storeStrong((id *)&self->_itemThreeButton, 0);
  objc_storeStrong((id *)&self->_itemTwoButton, 0);
  objc_storeStrong((id *)&self->_itemOneButton, 0);
  objc_storeStrong((id *)&self->_inCallDurationLabel, 0);
}

@end
