@implementation VoiceVolumeControlView

- (VoiceVolumeControlView)initWithDelegate:(id)a3
{
  id v4;
  VoiceVolumeControlView *v5;
  VoiceVolumeControlView *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VoiceVolumeControlView;
  v5 = -[VoiceVolumeControlView initWithFrame:](&v11, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v6 = v5;
  if (v5)
  {
    v7 = (objc_class *)objc_opt_class(v5);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[VoiceVolumeControlView setAccessibilityIdentifier:](v6, "setAccessibilityIdentifier:", v9);

    objc_storeWeak((id *)&v6->_delegate, v4);
    -[VoiceVolumeControlView _setup](v6, "_setup");
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  GEOConfigRemoveDelegateListenerForKey(MapsConfig_PreferencesUniqueEntityDidUpdate, off_1014B5518, self);
  v3.receiver = self;
  v3.super_class = (Class)VoiceVolumeControlView;
  -[VoiceVolumeControlView dealloc](&v3, "dealloc");
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView arrangedSubviews](self->_labelStackView, "arrangedSubviews"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "font"));
  objc_msgSend(v5, "lineHeight");
  v7 = v6;

  v8 = ceil(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[VoiceVolumeControlView traitCollection](self, "traitCollection"));
  -[VoiceVolumeControlView _buttonLabelVerticalMarginForTrait:](self, "_buttonLabelVerticalMarginForTrait:", v9);
  v11 = v10;

  v12 = v8 + v11 + 88.0;
  v13 = 324.0;
  result.height = v12;
  result.width = v13;
  return result;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VoiceVolumeControlView;
  -[VoiceVolumeControlView layoutSubviews](&v3, "layoutSubviews");
  -[UIView layoutSubviews](self->_buttonStackViewContainer, "layoutSubviews");
  -[VoiceVolumeControlView _addShadows](self, "_addShadows");
}

- (void)_setup
{
  id WeakRetained;
  NSMutableArray *v4;
  id v5;
  double y;
  double width;
  double height;
  UIView *v9;
  UIView *buttonStackViewContainer;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  UIView *v16;
  UIView *selectionBadge;
  void *v18;
  void *v19;
  NSMutableArray *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *i;
  void *v25;
  UIStackView *v26;
  UIStackView *buttonStackView;
  void *j;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSMutableArray *v39;
  id v40;
  id v41;
  uint64_t v42;
  void *k;
  void *v44;
  UIStackView *v45;
  UIStackView *labelStackView;
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
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
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
  NSMutableArray *v91;
  void *v92;
  NSArray *obj;
  id obja;
  uint64_t v95;
  void *v96;
  NSMutableArray *v97;
  void *v98;
  VoiceVolumeControlView *v99;
  id v100;
  void *v101;
  void *v102;
  NSMutableArray *v103;
  _QWORD v104[4];
  NSMutableArray *v105;
  VoiceVolumeControlView *v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  _QWORD v119[16];
  _BYTE v120[128];
  _QWORD v121[3];
  _BYTE v122[128];
  _BYTE v123[128];

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  self->_currentSelection = (int64_t)objc_msgSend(WeakRetained, "currentSelectionForAudioControlView:", self);

  v4 = objc_opt_new(NSMutableArray);
  v5 = objc_alloc((Class)UIView);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v9 = (UIView *)objc_msgSend(v5, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  buttonStackViewContainer = self->_buttonStackViewContainer;
  self->_buttonStackViewContainer = v9;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_buttonStackViewContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView setAccessibilityLabel:](self->_buttonStackViewContainer, "setAccessibilityLabel:", CFSTR("buttonStackViewContainer"));
  -[UIView setClipsToBounds:](self->_buttonStackViewContainer, "setClipsToBounds:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_buttonStackViewContainer, "layer"));
  objc_msgSend(v11, "setCornerRadius:", 44.0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiarySystemFillColor](UIColor, "tertiarySystemFillColor"));
  -[UIView setBackgroundColor:](self->_buttonStackViewContainer, "setBackgroundColor:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](self->_buttonStackViewContainer, "widthAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToConstant:", 324.0));

  LODWORD(v15) = 1144750080;
  objc_msgSend(v14, "setPriority:", v15);
  v97 = v4;
  v92 = v14;
  -[NSMutableArray addObject:](v4, "addObject:", v14);
  -[VoiceVolumeControlView addSubview:](self, "addSubview:", self->_buttonStackViewContainer);
  v16 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  selectionBadge = self->_selectionBadge;
  self->_selectionBadge = v16;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_selectionBadge, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_selectionBadge, "layer"));
  objc_msgSend(v18, "setCornerRadius:", 40.0);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
  -[UIView setBackgroundColor:](self->_selectionBadge, "setBackgroundColor:", v19);

  -[UIView addSubview:](self->_buttonStackViewContainer, "addSubview:", self->_selectionBadge);
  v20 = objc_opt_new(NSMutableArray);
  v115 = 0u;
  v116 = 0u;
  v117 = 0u;
  v118 = 0u;
  v21 = objc_msgSend(&off_101273098, "countByEnumeratingWithState:objects:count:", &v115, v123, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v116;
    do
    {
      for (i = 0; i != v22; i = (char *)i + 1)
      {
        if (*(_QWORD *)v116 != v23)
          objc_enumerationMutation(&off_101273098);
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[VoiceVolumeControlView _buttonForVolumeOption:](self, "_buttonForVolumeOption:", objc_msgSend(*(id *)(*((_QWORD *)&v115 + 1) + 8 * (_QWORD)i), "integerValue")));
        -[NSMutableArray addObject:](v20, "addObject:", v25);

      }
      v22 = objc_msgSend(&off_101273098, "countByEnumeratingWithState:objects:count:", &v115, v123, 16);
    }
    while (v22);
  }
  v91 = v20;
  objc_storeStrong((id *)&self->_buttons, v20);
  v26 = (UIStackView *)objc_msgSend(objc_alloc((Class)UIStackView), "initWithArrangedSubviews:", self->_buttons);
  buttonStackView = self->_buttonStackView;
  self->_buttonStackView = v26;

  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_buttonStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView setAlignment:](self->_buttonStackView, "setAlignment:", 3);
  -[UIStackView setAxis:](self->_buttonStackView, "setAxis:", 0);
  -[UIStackView setDistribution:](self->_buttonStackView, "setDistribution:", 3);
  v99 = self;
  -[UIView addSubview:](self->_buttonStackViewContainer, "addSubview:", self->_buttonStackView);
  v113 = 0u;
  v114 = 0u;
  v111 = 0u;
  v112 = 0u;
  obj = self->_buttons;
  v100 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v111, v122, 16);
  if (v100)
  {
    v95 = *(_QWORD *)v112;
    do
    {
      for (j = 0; j != v100; j = (char *)j + 1)
      {
        if (*(_QWORD *)v112 != v95)
          objc_enumerationMutation(obj);
        v29 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * (_QWORD)j);
        objc_msgSend(v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "widthAnchor"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "heightAnchor"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "constraintEqualToAnchor:", v30));
        v121[0] = v31;
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "topAnchor"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](v99->_buttonStackView, "topAnchor"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v33));
        v121[1] = v34;
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "bottomAnchor"));
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](v99->_buttonStackView, "bottomAnchor"));
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:", v36));
        v121[2] = v37;
        v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v121, 3));
        -[NSMutableArray addObjectsFromArray:](v97, "addObjectsFromArray:", v38);

      }
      v100 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v111, v122, 16);
    }
    while (v100);
  }

  v39 = objc_opt_new(NSMutableArray);
  v107 = 0u;
  v108 = 0u;
  v109 = 0u;
  v110 = 0u;
  v40 = objc_msgSend(&off_101273098, "countByEnumeratingWithState:objects:count:", &v107, v120, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v108;
    do
    {
      for (k = 0; k != v41; k = (char *)k + 1)
      {
        if (*(_QWORD *)v108 != v42)
          objc_enumerationMutation(&off_101273098);
        v44 = (void *)objc_claimAutoreleasedReturnValue(-[VoiceVolumeControlView _labelForVolumeOption:](v99, "_labelForVolumeOption:", objc_msgSend(*(id *)(*((_QWORD *)&v107 + 1) + 8 * (_QWORD)k), "integerValue")));
        -[NSMutableArray addObject:](v39, "addObject:", v44);

      }
      v41 = objc_msgSend(&off_101273098, "countByEnumeratingWithState:objects:count:", &v107, v120, 16);
    }
    while (v41);
  }
  v45 = (UIStackView *)objc_msgSend(objc_alloc((Class)UIStackView), "initWithArrangedSubviews:", v39);
  labelStackView = v99->_labelStackView;
  v99->_labelStackView = v45;

  -[UIStackView setSpacing:](v99->_labelStackView, "setSpacing:", 10.0);
  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v99->_labelStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView setAlignment:](v99->_labelStackView, "setAlignment:", 5);
  -[UIStackView setAxis:](v99->_labelStackView, "setAxis:", 0);
  -[UIStackView setDistribution:](v99->_labelStackView, "setDistribution:", 3);
  -[VoiceVolumeControlView addSubview:](v99, "addSubview:", v99->_labelStackView);
  v104[0] = _NSConcreteStackBlock;
  v104[1] = 3221225472;
  v104[2] = sub_1003554A0;
  v104[3] = &unk_1011B2900;
  v105 = v97;
  v106 = v99;
  v103 = v97;
  -[NSMutableArray enumerateObjectsUsingBlock:](v39, "enumerateObjectsUsingBlock:", v104);
  v101 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v99->_buttonStackViewContainer, "topAnchor"));
  v98 = (void *)objc_claimAutoreleasedReturnValue(-[VoiceVolumeControlView topAnchor](v99, "topAnchor"));
  v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "constraintEqualToAnchor:", v98));
  v119[0] = v96;
  obja = (id)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](v99->_buttonStackViewContainer, "heightAnchor"));
  v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obja, "constraintEqualToConstant:", 88.0));
  v119[1] = v89;
  v88 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leftAnchor](v99->_buttonStackViewContainer, "leftAnchor"));
  v87 = (void *)objc_claimAutoreleasedReturnValue(-[VoiceVolumeControlView leftAnchor](v99, "leftAnchor"));
  v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "constraintEqualToAnchor:", v87));
  v119[2] = v86;
  v85 = (void *)objc_claimAutoreleasedReturnValue(-[UIView rightAnchor](v99->_buttonStackViewContainer, "rightAnchor"));
  v84 = (void *)objc_claimAutoreleasedReturnValue(-[VoiceVolumeControlView rightAnchor](v99, "rightAnchor"));
  v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "constraintEqualToAnchor:", v84));
  v119[3] = v83;
  v82 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v99->_selectionBadge, "topAnchor"));
  v81 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v99->_buttonStackViewContainer, "topAnchor"));
  v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "constraintEqualToAnchor:constant:", v81, 4.0));
  v119[4] = v80;
  v79 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v99->_selectionBadge, "bottomAnchor"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v99->_buttonStackViewContainer, "bottomAnchor"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "constraintEqualToAnchor:constant:", v78, -4.0));
  v119[5] = v77;
  v76 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](v99->_selectionBadge, "widthAnchor"));
  v90 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](v99->_selectionBadge, "heightAnchor"));
  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "constraintEqualToAnchor:", v90));
  v119[6] = v75;
  v74 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](v99->_buttonStackView, "topAnchor"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v99->_buttonStackViewContainer, "topAnchor"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "constraintEqualToAnchor:constant:", v73, 4.0));
  v119[7] = v72;
  v71 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](v99->_buttonStackView, "bottomAnchor"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v99->_buttonStackViewContainer, "bottomAnchor"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "constraintEqualToAnchor:constant:", v70, -4.0));
  v119[8] = v69;
  v68 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leftAnchor](v99->_buttonStackView, "leftAnchor"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leftAnchor](v99->_buttonStackViewContainer, "leftAnchor"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "constraintEqualToAnchor:constant:", v67, 4.0));
  v119[9] = v66;
  v65 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView rightAnchor](v99->_buttonStackView, "rightAnchor"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[UIView rightAnchor](v99->_buttonStackViewContainer, "rightAnchor"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "constraintEqualToAnchor:constant:", v64, -4.0));
  v119[10] = v63;
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](v99->_labelStackView, "topAnchor"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v99->_buttonStackViewContainer, "bottomAnchor"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "constraintLessThanOrEqualToAnchor:constant:", v61, 10.0));
  v119[11] = v60;
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](v99->_labelStackView, "topAnchor"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v99->_buttonStackViewContainer, "bottomAnchor"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "constraintGreaterThanOrEqualToAnchor:constant:", v58, 8.0));
  v119[12] = v57;
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leftAnchor](v99->_labelStackView, "leftAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leftAnchor](v99->_buttonStackView, "leftAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "constraintEqualToAnchor:", v47));
  v119[13] = v48;
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView rightAnchor](v99->_labelStackView, "rightAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView rightAnchor](v99->_buttonStackView, "rightAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToAnchor:", v50));
  v119[14] = v51;
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[VoiceVolumeControlView topAnchor](v99, "topAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v99->_buttonStackViewContainer, "topAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:", v53));
  v119[15] = v54;
  v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v119, 16));
  -[NSMutableArray addObjectsFromArray:](v103, "addObjectsFromArray:", v55);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v103);
  -[VoiceVolumeControlView _updateContent](v99, "_updateContent");
  _GEOConfigAddDelegateListenerForKey(MapsConfig_PreferencesUniqueEntityDidUpdate, off_1014B5518, &_dispatch_main_q, v99);

}

- (void)_updateContent
{
  NSArray *buttons;
  _QWORD v3[5];

  buttons = self->_buttons;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1003556B4;
  v3[3] = &unk_1011B2928;
  v3[4] = self;
  -[NSArray enumerateObjectsUsingBlock:](buttons, "enumerateObjectsUsingBlock:", v3);
}

- (id)_imageForVolumeOption:(int64_t)a3
{
  if (qword_1014D21A8 != -1)
    dispatch_once(&qword_1014D21A8, &stru_1011B2948);
  if ((unint64_t)a3 <= 2)
    self = (VoiceVolumeControlView *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", off_1011B2988[a3], qword_1014D21B0));
  return self;
}

- (id)_labelForVolumeOption:(int64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  UILabel *v7;
  double v8;
  void *v9;
  void *v10;

  if (a3 == 2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    v5 = CFSTR("Louder volume [Nav Tray]");
  }
  else if (a3 == 1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    v5 = CFSTR("Normal volume [Nav Tray]");
  }
  else
  {
    if (a3)
    {
      v6 = 0;
      goto LABEL_9;
    }
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    v5 = CFSTR("Softer volume [Nav Tray]");
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, CFSTR("localized string not found"), 0));

LABEL_9:
  v7 = objc_opt_new(UILabel);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setTextAlignment:](v7, "setTextAlignment:", 1);
  LODWORD(v8) = 1148846080;
  -[UILabel setContentHuggingPriority:forAxis:](v7, "setContentHuggingPriority:forAxis:", 1, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleSubheadline));
  -[UILabel setFont:](v7, "setFont:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[UILabel setTextColor:](v7, "setTextColor:", v10);

  -[UILabel setText:](v7, "setText:", v6);
  return v7;
}

- (id)_buttonForVolumeOption:(int64_t)a3
{
  UIButton *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v5 = objc_opt_new(UIButton);
  -[UIButton setTag:](v5, "setTag:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VoiceVolumeControlView _accessibilityIdenfifierPrefixForVolumeOption:](self, "_accessibilityIdenfifierPrefixForVolumeOption:", a3));
  -[UIButton setAccessibilityIdentifier:](v5, "setAccessibilityIdentifier:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[VoiceVolumeControlView _accessibilityTextForVolumeOption:](self, "_accessibilityTextForVolumeOption:", a3));
  -[UIButton setAccessibilityLabel:](v5, "setAccessibilityLabel:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VoiceVolumeControlView _imageForVolumeOption:](self, "_imageForVolumeOption:", a3));
  -[UIButton setImage:forState:](v5, "setImage:forState:", v8, 0);

  -[UIButton addTarget:action:forControlEvents:](v5, "addTarget:action:forControlEvents:", self, "buttonTapped:", 64);
  v9 = objc_msgSend(objc_alloc((Class)UISwipeGestureRecognizer), "initWithTarget:action:", self, "buttonSwiped:");
  objc_msgSend(v9, "setDirection:", 2);
  objc_msgSend(v9, "setNumberOfTouchesRequired:", 1);
  -[UIButton addGestureRecognizer:](v5, "addGestureRecognizer:", v9);
  v10 = objc_msgSend(objc_alloc((Class)UISwipeGestureRecognizer), "initWithTarget:action:", self, "buttonSwiped:");

  objc_msgSend(v10, "setDirection:", 1);
  objc_msgSend(v10, "setNumberOfTouchesRequired:", 1);
  -[UIButton addGestureRecognizer:](v5, "addGestureRecognizer:", v10);

  return v5;
}

- (void)buttonTapped:(id)a3
{
  void *v4;

  self->_currentSelection = (int64_t)objc_msgSend(a3, "tag");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VoiceVolumeControlView delegate](self, "delegate"));
  objc_msgSend(v4, "audioControlView:didSelectAudioType:", self, self->_currentSelection);

  -[VoiceVolumeControlView _animateContentUpdate](self, "_animateContentUpdate");
}

- (void)buttonSwiped:(id)a3
{
  void *v4;
  id v5;
  int64_t currentSelection;
  id v7;
  void *v8;
  id v9;
  unint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "view"));
  v5 = objc_msgSend(v4, "tag");
  currentSelection = self->_currentSelection;

  if (v5 == (id)currentSelection)
  {
    v7 = objc_msgSend(v12, "direction");
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "view"));
    v9 = objc_msgSend(v8, "tag");
    if (v7 == (id)2)
      v10 = (unint64_t)v9 - 1;
    else
      v10 = (unint64_t)v9 + 1;

    if (v10 <= 2)
    {
      self->_currentSelection = v10;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[VoiceVolumeControlView delegate](self, "delegate"));
      objc_msgSend(v11, "audioControlView:didSelectAudioType:", self, self->_currentSelection);

      -[VoiceVolumeControlView _animateContentUpdate](self, "_animateContentUpdate");
    }
  }

}

- (void)_animateContentUpdate
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100355CCC;
  v2[3] = &unk_1011AC860;
  v2[4] = self;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v2, 0.25);
}

- (id)_accessibilityIdenfifierPrefixForVolumeOption:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("VolumeSoft");
  if (a3 == 1)
    v3 = CFSTR("VolumeNormal");
  if (a3 == 2)
    return CFSTR("VolumeLoud");
  else
    return (id)v3;
}

- (id)_accessibilityTextForVolumeOption:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;

  switch(a3)
  {
    case 2:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("[Audio] Loud volume");
      goto LABEL_7;
    case 1:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("[Audio] Normal volume");
      goto LABEL_7;
    case 0:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("[Audio] Soft volume");
LABEL_7:
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, CFSTR("localized string not found"), 0));

      break;
  }
  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)VoiceVolumeControlView;
  -[VoiceVolumeControlView traitCollectionDidChange:](&v21, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VoiceVolumeControlView traitCollection](self, "traitCollection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "preferredContentSizeCategory"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));
  v8 = sub_1002A8950(v6, v7);

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[VoiceVolumeControlView _effectiveTraitCollection](self, "_effectiveTraitCollection"));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView arrangedSubviews](self->_labelStackView, "arrangedSubviews", 0));
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:compatibleWithTraitCollection:](UIFont, "preferredFontForTextStyle:compatibleWithTraitCollection:", UIFontTextStyleSubheadline, v9));
          objc_msgSend(v15, "setFont:", v16);

          v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v12);
    }

  }
}

- (id)_maximumContentSizeCategory
{
  return UIContentSizeCategoryAccessibilityLarge;
}

- (id)_effectiveTraitCollection
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VoiceVolumeControlView traitCollection](self, "traitCollection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VoiceVolumeControlView _maximumContentSizeCategory](self, "_maximumContentSizeCategory"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_maps_traitCollectionByClampingContentSizeCategoryWithMinimumContentSizeCategory:maximumContentSizeCategory:", 0, v4));

  return v5;
}

- (double)_buttonLabelVerticalMarginForTrait:(id)a3
{
  NSString *v3;
  double v4;

  v3 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "preferredContentSizeCategory"));
  if (UIContentSizeCategoryCompareToCategory(v3, UIContentSizeCategoryMedium) == NSOrderedDescending)
    v4 = 10.0;
  else
    v4 = 8.0;

  return v4;
}

- (void)_addShadows
{
  UIImageView *v3;
  UIImageView *shadowImageView;
  double v5;
  double v6;
  void *v7;
  double v8;
  CGFloat v9;
  id v10;
  void *v11;
  UIImageView *v12;
  UIImageView *shadowImageView2;
  id v14;
  void *v15;
  id v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  if (!self->_shadowImageView)
  {
    v3 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    shadowImageView = self->_shadowImageView;
    self->_shadowImageView = v3;

    -[UIView addSubview:](self->_selectionBadge, "addSubview:", self->_shadowImageView);
  }
  -[UIView frame](self->_selectionBadge, "frame");
  v6 = v5 * 0.5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[VoiceVolumeControlView traitCollection](self, "traitCollection"));
  objc_msgSend(v7, "displayScale");
  v9 = v8;

  v16 = (id)objc_claimAutoreleasedReturnValue(+[UIColor systemBlackColor](UIColor, "systemBlackColor"));
  v10 = sub_10035622C(v16, v6, 8.0, 0.119999997, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  -[UIImageView setImage:](self->_shadowImageView, "setImage:", v11);
  if (self->_shadowImageView)
  {
    -[UIView bounds](self->_selectionBadge, "bounds");
    v18 = CGRectInset(v17, -8.0, -8.0);
    -[UIImageView setFrame:](self->_shadowImageView, "setFrame:", v18.origin.x, v18.origin.y, v18.size.width, v18.size.height);
  }
  if (!self->_shadowImageView2)
  {
    v12 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    shadowImageView2 = self->_shadowImageView2;
    self->_shadowImageView2 = v12;

    -[UIView addSubview:](self->_selectionBadge, "addSubview:", self->_shadowImageView2);
  }
  v14 = sub_10035622C(v16, v6, 1.0, 0.0399999991, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  -[UIImageView setImage:](self->_shadowImageView2, "setImage:", v15);
  if (self->_shadowImageView2)
  {
    -[UIView bounds](self->_selectionBadge, "bounds");
    v20 = CGRectInset(v19, -1.0, -1.0);
    -[UIImageView setFrame:](self->_shadowImageView2, "setFrame:", v20.origin.x, v20.origin.y, v20.size.width, v20.size.height);
  }

}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  if (a3.var0 == (_DWORD)MapsConfig_PreferencesUniqueEntityDidUpdate && a3.var1 == off_1014B5518)
  {
    self->_currentSelection = GEOConfigGetInteger(NavigationConfig_SpokenGuidanceVolumeUserChoice[0], NavigationConfig_SpokenGuidanceVolumeUserChoice[1]);
    -[VoiceVolumeControlView _animateContentUpdate](self, "_animateContentUpdate");
  }
}

- (VoiceVolumeControlViewDelegate)delegate
{
  return (VoiceVolumeControlViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_shadowImageView2, 0);
  objc_storeStrong((id *)&self->_shadowImageView, 0);
  objc_storeStrong((id *)&self->_selectionBadgeXContraint, 0);
  objc_storeStrong((id *)&self->_selectionBadge, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_labelStackView, 0);
  objc_storeStrong((id *)&self->_buttonStackView, 0);
  objc_storeStrong((id *)&self->_buttonStackViewContainer, 0);
}

@end
