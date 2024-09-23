@implementation MapsSubtitleHeaderView

- (MapsSubtitleHeaderView)initWithTitle:(id)a3 subtitle:(id)a4 leadingButton:(id)a5 trailingButtons:(id)a6 delegate:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  MapsSubtitleHeaderView *v17;
  MapsSubtitleHeaderView *v18;
  CardButton **p_leadingButton;
  id *p_trailingButtons;
  UIView *v21;
  id v22;
  UILabel *v23;
  double v24;
  void *v25;
  UILabel *v26;
  double v27;
  void *v28;
  void *v29;
  UILabel *v30;
  UIStackView *v31;
  UIStackView *trailingButtonsStackView;
  double v33;
  void *v34;
  id v35;
  id v36;
  uint64_t v37;
  void *i;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  double v44;
  double v45;
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
  double v57;
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
  double v69;
  double v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  double v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  double v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  id v91;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  id v115;
  id v116;
  id v117;
  id v118;
  void *v119;
  void *v120;
  UILabel *v121;
  id *v122;
  void *v123;
  UIView *v124;
  id v125;
  id v126;
  CardButton *v127;
  void *v128;
  void *v129;
  id v130;
  void *v131;
  UILabel *v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  objc_super v137;
  uint64_t v138;
  _QWORD v139[4];
  _QWORD v140[4];
  _QWORD v141[5];
  _QWORD v142[6];
  _QWORD v143[7];
  _BYTE v144[128];

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v137.receiver = self;
  v137.super_class = (Class)MapsSubtitleHeaderView;
  v17 = -[MapsSubtitleHeaderView initWithFrame:](&v137, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v18 = v17;
  if (v17)
  {
    v117 = v14;
    p_leadingButton = &v17->_leadingButton;
    objc_storeStrong((id *)&v17->_leadingButton, a5);
    p_trailingButtons = (id *)&v18->_trailingButtons;
    objc_storeStrong((id *)&v18->_trailingButtons, a6);
    objc_storeWeak((id *)&v18->_delegate, v16);
    v122 = (id *)&v18->_leadingButton;
    v127 = *p_leadingButton;
    v130 = objc_msgSend(v15, "count");
    v21 = objc_opt_new(UIView);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v22 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", v18, "_pressedHeaderView");
    -[UIView addGestureRecognizer:](v21, "addGestureRecognizer:", v22);

    v124 = v21;
    -[MapsSubtitleHeaderView addSubview:](v18, "addSubview:", v21);
    v23 = objc_opt_new(UILabel);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v24) = 1148846080;
    -[UILabel setContentHuggingPriority:forAxis:](v23, "setContentHuggingPriority:forAxis:", 1, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _preferredFontForTextStyle:weight:](UIFont, "_preferredFontForTextStyle:weight:", UIFontTextStyleBody, UIFontWeightSemibold));
    -[UILabel setFont:](v23, "setFont:", v25);

    -[UILabel setText:](v23, "setText:", v12);
    v132 = v23;
    -[MapsSubtitleHeaderView addSubview:](v18, "addSubview:", v23);
    if (v13)
    {
      v26 = objc_opt_new(UILabel);
      -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v26, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      LODWORD(v27) = 1148846080;
      -[UILabel setContentHuggingPriority:forAxis:](v26, "setContentHuggingPriority:forAxis:", 1, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _preferredFontForTextStyle:weight:](UIFont, "_preferredFontForTextStyle:weight:", UIFontTextStyleFootnote, UIFontWeightMedium));
      -[UILabel setFont:](v26, "setFont:", v28);

      v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
      -[UILabel setTextColor:](v26, "setTextColor:", v29);

      -[UILabel setText:](v26, "setText:", v13);
      -[MapsSubtitleHeaderView addSubview:](v18, "addSubview:", v26);
      v30 = v26;
    }
    else
    {
      v30 = 0;
    }
    v121 = v30;
    objc_storeStrong((id *)&v18->_subtitleLabel, v30);
    -[MapsSubtitleHeaderView _userInterfaceStyleDidChange](v18, "_userInterfaceStyleDidChange");
    if (v127)
    {
      objc_msgSend(*v122, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(*v122, "addTarget:action:forControlEvents:", v18, "_pressedLeadingButton:", 64);
      -[MapsSubtitleHeaderView addSubview:](v18, "addSubview:", *v122);
    }
    v118 = v12;
    v125 = v13;
    v115 = v16;
    v116 = v15;
    if (v130)
    {
      v31 = (UIStackView *)objc_alloc_init((Class)UIStackView);
      trailingButtonsStackView = v18->_trailingButtonsStackView;
      v18->_trailingButtonsStackView = v31;

      -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v18->_trailingButtonsStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIStackView setAxis:](v18->_trailingButtonsStackView, "setAxis:", 0);
      LODWORD(v33) = 1148846080;
      -[UIStackView setContentHuggingPriority:forAxis:](v18->_trailingButtonsStackView, "setContentHuggingPriority:forAxis:", 0, v33);
      -[MapsSubtitleHeaderView addSubview:](v18, "addSubview:", v18->_trailingButtonsStackView);
      v135 = 0u;
      v136 = 0u;
      v133 = 0u;
      v134 = 0u;
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_trailingButtons, "reverseObjectEnumerator"));
      v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v133, v144, 16);
      if (v35)
      {
        v36 = v35;
        v37 = *(_QWORD *)v134;
        do
        {
          for (i = 0; i != v36; i = (char *)i + 1)
          {
            if (*(_QWORD *)v134 != v37)
              objc_enumerationMutation(v34);
            v39 = *(void **)(*((_QWORD *)&v133 + 1) + 8 * (_QWORD)i);
            objc_msgSend(v39, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
            objc_msgSend(v39, "addTarget:action:forControlEvents:", v18, "_pressedTrailingButton:", 64);
            -[UIStackView addArrangedSubview:](v18->_trailingButtonsStackView, "addArrangedSubview:", v39);
          }
          v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v133, v144, 16);
        }
        while (v36);
      }

    }
    if (v127)
      v40 = objc_claimAutoreleasedReturnValue(objc_msgSend(*v122, "trailingAnchor"));
    else
      v40 = objc_claimAutoreleasedReturnValue(-[MapsSubtitleHeaderView leadingAnchor](v18, "leadingAnchor"));
    v41 = (void *)v40;
    if (v130)
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_trailingButtons, "lastObject"));
      v43 = objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "leadingAnchor"));

      v44 = 0.0;
    }
    else
    {
      v43 = objc_claimAutoreleasedReturnValue(-[MapsSubtitleHeaderView trailingAnchor](v18, "trailingAnchor"));
      v44 = -16.0;
    }
    v119 = (void *)v43;
    v111 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v132, "leadingAnchor"));
    v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "constraintGreaterThanOrEqualToAnchor:constant:", v41, 16.0));
    v143[0] = v107;
    v104 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v132, "trailingAnchor"));
    v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "constraintLessThanOrEqualToAnchor:constant:", v43, v44));
    v143[1] = v102;
    v100 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerXAnchor](v132, "centerXAnchor"));
    v98 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSubtitleHeaderView centerXAnchor](v18, "centerXAnchor"));
    LODWORD(v45) = 1132134400;
    v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "constraintEqualToAnchor:constant:priority:", v98, 0.0, v45));
    v143[2] = v96;
    v94 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v124, "leadingAnchor"));
    v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "constraintEqualToAnchor:", v41));
    v143[3] = v93;
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v124, "trailingAnchor"));
    v120 = v41;
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:", v43));
    v143[4] = v47;
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v124, "topAnchor"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSubtitleHeaderView topAnchor](v18, "topAnchor"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToAnchor:", v49));
    v143[5] = v50;
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v124, "bottomAnchor"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSubtitleHeaderView bottomAnchor](v18, "bottomAnchor"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToAnchor:", v52));
    v143[6] = v53;
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v143, 7));
    v126 = objc_msgSend(v54, "mutableCopy");

    if (v125)
    {
      v95 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v132, "topAnchor"));
      v112 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSubtitleHeaderView topAnchor](v18, "topAnchor"));
      v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "constraintEqualToAnchor:constant:", 16.0));
      v142[0] = v108;
      v105 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v121, "leadingAnchor"));
      v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "constraintGreaterThanOrEqualToAnchor:constant:", v120, 16.0));
      v142[1] = v103;
      v101 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v121, "trailingAnchor"));
      v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "constraintLessThanOrEqualToAnchor:constant:", v119, -16.0));
      v142[2] = v99;
      v55 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerXAnchor](v121, "centerXAnchor"));
      v56 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSubtitleHeaderView centerXAnchor](v18, "centerXAnchor"));
      LODWORD(v57) = 1132134400;
      v97 = v55;
      v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "constraintEqualToAnchor:constant:priority:", v56, 0.0, v57));
      v142[3] = v58;
      v59 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v121, "topAnchor"));
      v60 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v132, "bottomAnchor"));
      v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "constraintEqualToAnchor:", v60));
      v142[4] = v61;
      v62 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v121, "bottomAnchor"));
      v63 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSubtitleHeaderView bottomAnchor](v18, "bottomAnchor"));
      v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "constraintEqualToAnchor:constant:", v63, -12.0));
      v142[5] = v64;
      v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v142, 6));
      objc_msgSend(v126, "addObjectsFromArray:", v65);

      v66 = v95;
    }
    else
    {
      v66 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerYAnchor](v132, "centerYAnchor"));
      v112 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSubtitleHeaderView centerYAnchor](v18, "centerYAnchor"));
      v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "constraintEqualToAnchor:"));
      v141[0] = v108;
      v67 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v132, "topAnchor"));
      v103 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSubtitleHeaderView topAnchor](v18, "topAnchor"));
      v105 = v67;
      v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "constraintGreaterThanOrEqualToAnchor:constant:", v103, 16.0));
      v141[1] = v101;
      v68 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v132, "bottomAnchor"));
      v97 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSubtitleHeaderView bottomAnchor](v18, "bottomAnchor"));
      v99 = v68;
      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "constraintLessThanOrEqualToAnchor:constant:", v97, -12.0));
      v141[2] = v56;
      v58 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v132, "topAnchor"));
      v59 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSubtitleHeaderView topAnchor](v18, "topAnchor"));
      LODWORD(v69) = 1132134400;
      v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "constraintEqualToAnchor:constant:priority:", v59, 16.0, v69));
      v141[3] = v60;
      v61 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v132, "bottomAnchor"));
      v62 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSubtitleHeaderView bottomAnchor](v18, "bottomAnchor"));
      LODWORD(v70) = 1132134400;
      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "constraintEqualToAnchor:constant:priority:", v62, -12.0, v70));
      v141[4] = v63;
      v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v141, 5));
      objc_msgSend(v126, "addObjectsFromArray:", v64);
    }

    if (v127)
    {
      v128 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v122, "leadingAnchor"));
      v113 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSubtitleHeaderView leadingAnchor](v18, "leadingAnchor"));
      v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "constraintEqualToAnchor:", v113));
      v140[0] = v109;
      v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v122, "topAnchor"));
      v71 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSubtitleHeaderView topAnchor](v18, "topAnchor"));
      v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "constraintEqualToAnchor:", v71));
      v140[1] = v72;
      v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v122, "bottomAnchor"));
      v74 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSubtitleHeaderView bottomAnchor](v18, "bottomAnchor"));
      LODWORD(v75) = 1132134400;
      v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "constraintEqualToAnchor:constant:priority:", v74, 0.0, v75));
      v140[2] = v76;
      v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v122, "bottomAnchor"));
      v78 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSubtitleHeaderView bottomAnchor](v18, "bottomAnchor"));
      v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "constraintLessThanOrEqualToAnchor:constant:", v78, 0.0));
      v140[3] = v79;
      v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v140, 4));
      objc_msgSend(v126, "addObjectsFromArray:", v80);

    }
    if (v130)
    {
      v131 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView trailingAnchor](v18->_trailingButtonsStackView, "trailingAnchor"));
      v129 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSubtitleHeaderView trailingAnchor](v18, "trailingAnchor"));
      v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "constraintEqualToAnchor:", v129));
      v139[0] = v123;
      v114 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](v18->_trailingButtonsStackView, "topAnchor"));
      v110 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSubtitleHeaderView topAnchor](v18, "topAnchor"));
      v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v114, "constraintEqualToAnchor:", v110));
      v139[1] = v81;
      v82 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](v18->_trailingButtonsStackView, "bottomAnchor"));
      v83 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSubtitleHeaderView bottomAnchor](v18, "bottomAnchor"));
      LODWORD(v84) = 1132134400;
      v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "constraintEqualToAnchor:constant:priority:", v83, 0.0, v84));
      v139[2] = v85;
      v86 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](v18->_trailingButtonsStackView, "bottomAnchor"));
      v87 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSubtitleHeaderView bottomAnchor](v18, "bottomAnchor"));
      v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "constraintLessThanOrEqualToAnchor:constant:", v87, 0.0));
      v139[3] = v88;
      v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v139, 4));
      objc_msgSend(v126, "addObjectsFromArray:", v89);

    }
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v126);
    v138 = objc_opt_class(UITraitUserInterfaceStyle);
    v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v138, 1));
    v91 = -[MapsSubtitleHeaderView registerForTraitChanges:withTarget:action:](v18, "registerForTraitChanges:withTarget:action:", v90, v18, "_userInterfaceStyleDidChange");

    v14 = v117;
    v12 = v118;
    v13 = v125;
    v16 = v115;
    v15 = v116;
  }

  return v18;
}

- (id)_cardButtonForUnderlyingButton:(id)a3
{
  id v4;
  id v5;
  NSArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  CardButton *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CardButton underlyingButton](self->_leadingButton, "underlyingButton"));

  if (v5 == v4)
  {
    v13 = self->_leadingButton;
  }
  else
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = self->_trailingButtons;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
          v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "underlyingButton", (_QWORD)v15));

          if (v12 == v4)
          {
            v13 = v11;

            goto LABEL_13;
          }
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v8)
          continue;
        break;
      }
    }

    v13 = 0;
  }
LABEL_13:

  return v13;
}

- (void)_pressedHeaderView
{
  MapsSubtitleHeaderViewDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector(WeakRetained, "headerViewTapped:");

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v6, "headerViewTapped:", self);

  }
}

- (void)_pressedLeadingButton:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector(WeakRetained, "leadingButtonTapped:");

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSubtitleHeaderView _cardButtonForUnderlyingButton:](self, "_cardButtonForUnderlyingButton:", v8));
    objc_msgSend(v6, "leadingButtonTapped:", v7);

  }
}

- (void)_pressedTrailingButton:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector(WeakRetained, "trailingButtonTapped:");

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSubtitleHeaderView _cardButtonForUnderlyingButton:](self, "_cardButtonForUnderlyingButton:", v8));
    objc_msgSend(v6, "trailingButtonTapped:", v7);

  }
}

- (void)_userInterfaceStyleDidChange
{
  void *v3;
  _BOOL8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSubtitleHeaderView traitCollection](self, "traitCollection"));
  v4 = objc_msgSend(v3, "userInterfaceStyle") != (id)2;

  -[UILabel _setDrawsAsBackdropOverlayWithBlendMode:](self->_subtitleLabel, "_setDrawsAsBackdropOverlayWithBlendMode:", v4);
}

- (CardButton)leadingButton
{
  return self->_leadingButton;
}

- (NSArray)trailingButtons
{
  return self->_trailingButtons;
}

- (MapsSubtitleHeaderViewDelegate)delegate
{
  return (MapsSubtitleHeaderViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (UIStackView)trailingButtonsStackView
{
  return self->_trailingButtonsStackView;
}

- (void)setTrailingButtonsStackView:(id)a3
{
  objc_storeStrong((id *)&self->_trailingButtonsStackView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingButtonsStackView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_trailingButtons, 0);
  objc_storeStrong((id *)&self->_leadingButton, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
}

@end
