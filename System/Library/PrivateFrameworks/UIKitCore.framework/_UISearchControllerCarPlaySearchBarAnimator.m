@implementation _UISearchControllerCarPlaySearchBarAnimator

- (void)animateTransition:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  __int128 v50;
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
  UIView *v63;
  UIView *v64;
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
  double v78;
  double v79;
  double v80;
  double v81;
  void *v82;
  void *v83;
  double MaxY;
  void *v85;
  double v86;
  double v87;
  UIView *v88;
  uint64_t v89;
  id v90;
  void (**v91)(_QWORD);
  id v92;
  void (**v93)(void *, uint64_t);
  double v94;
  void *v95;
  void *v96;
  double v97;
  double v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  uint64_t v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  uint64_t v113;
  UIView *v114;
  void *v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  void *v122;
  UIView *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  uint64_t v139;
  id v140;
  void (**v141)(_QWORD);
  id v142;
  void (**v143)(void *, uint64_t);
  double v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  UIView *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  id v170;
  void *v171;
  void *v172;
  void *v173;
  void *v175;
  void *v176;
  _QWORD v177[4];
  id v178;
  _QWORD aBlock[4];
  id v180;
  id v181;
  _QWORD v182[4];
  id v183;
  id v184;
  _QWORD v185[4];
  id v186;
  _OWORD v187[3];
  _QWORD v188[4];
  _QWORD v189[6];
  CGRect v190;
  CGRect v191;
  CGRect v192;

  v189[4] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "viewControllerForKey:", CFSTR("UITransitionContextFromViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewControllerForKey:", CFSTR("UITransitionContextToViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
    v7 = v5;
  else
    v7 = v4;
  v8 = v7;
  objc_msgSend(v8, "presentingViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "transitionCoordinator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "_searchPresentationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "searchBar");
  v12 = objc_claimAutoreleasedReturnValue();
  v176 = (void *)v12;
  if ((isKindOfClass & 1) != 0)
  {
    v13 = (void *)v12;
    objc_msgSend(v5, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAutoresizingMask:", 26);

    objc_msgSend(v5, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "finalFrameForViewController:", v5);
    objc_msgSend(v15, "setFrame:");
    objc_msgSend(v3, "containerView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSubview:", v15);

    if (objc_msgSend(v5, "obscuresBackgroundDuringPresentation"))
    {
      objc_msgSend(v11, "backgroundObscuringView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "finalFrameForViewController:", v5);
      objc_msgSend(v17, "setFrame:");

    }
    if (v13)
    {
      objc_msgSend(v5, "searchBar");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "_setDisableFocus:", 1);

      if (objc_msgSend(v5, "automaticallyShowsCancelButton"))
        objc_msgSend(v13, "setShowsCancelButton:animated:", 1, objc_msgSend(v3, "isAnimated"));
    }
    objc_msgSend(v5, "_systemInputViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v175 = v19;
    v171 = v4;
    v172 = v3;
    v169 = v10;
    v170 = v8;
    v168 = v11;
    v173 = v15;
    if (objc_msgSend(v19, "supportsTouchInput"))
    {
      objc_msgSend(v5, "searchBar");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "searchField");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "frame");
      v23 = v22;
      v25 = v24;
      v27 = v26;
      v29 = v28;

      objc_msgSend(v15, "bounds");
      v31 = v30;
      v33 = v32;
      v35 = v34;
      v37 = v36;
      objc_msgSend(v15, "_screen");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "scale");
      UIRectCenteredXInRectScale(v23, v25, v27, v29, v31, v33, v35, v37, v39);
      v41 = v40;
      v43 = v42;
      v45 = v44;
      v47 = v46;

      objc_msgSend(v11, "searchBarContainerView");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setFrame:", v41, v43, v45, v47);

      objc_msgSend(v19, "view");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      v187[0] = *MEMORY[0x1E0C9BAA8];
      v187[1] = v50;
      v187[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      objc_msgSend(v49, "setTransform:", v187);

      objc_msgSend(v19, "view");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "layoutIfNeeded");

      objc_msgSend(v19, "alignmentConstraintForAxis:", 1);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v52)
      {
        v53 = (void *)MEMORY[0x1E0D156E0];
        objc_msgSend(v19, "view");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "view");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "superview");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v54, 4, 0, v56, 4, 1.0, 0.0);
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = v175;
        objc_msgSend(v52, "setActive:", 1);
        objc_msgSend(v175, "setAlignmentConstraint:forAxis:", v52, 1);
      }
      v167 = v52;
      objc_msgSend(v19, "alignmentConstraintForAxis:", 0);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v57)
      {
        v58 = (void *)MEMORY[0x1E0D156E0];
        objc_msgSend(v19, "view");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "view");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "superview");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "safeAreaLayoutGuide");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v59, 9, 0, v62, 9, 1.0, 0.0);
        v57 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = v175;
        objc_msgSend(v57, "setActive:", 1);
        objc_msgSend(v175, "setAlignmentConstraint:forAxis:", v57, 0);
      }
      v166 = v57;
      v63 = [UIView alloc];
      v64 = -[UIView initWithFrame:](v63, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v64, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      +[UIColor tableBackgroundColor](UIColor, "tableBackgroundColor");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v64, "setBackgroundColor:", v65);

      objc_msgSend(v5, "set_systemInputMarginView:", v64);
      v150 = (void *)MEMORY[0x1E0D156E0];
      -[UIView leftAnchor](v64, "leftAnchor");
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "safeAreaLayoutGuide");
      v164 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v164, "leftAnchor");
      v160 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v162, "constraintEqualToAnchor:", v160);
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      v189[0] = v158;
      -[UIView rightAnchor](v64, "rightAnchor");
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "safeAreaLayoutGuide");
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v156, "rightAnchor");
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v154, "constraintEqualToAnchor:", v152);
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      v189[1] = v148;
      -[UIView topAnchor](v64, "topAnchor");
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "view");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "topAnchor");
      v67 = v19;
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v146, "constraintEqualToAnchor:", v68);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v189[2] = v69;
      -[UIView bottomAnchor](v64, "bottomAnchor");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "view");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "bottomAnchor");
      v72 = v5;
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "constraintEqualToAnchor:", v73);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v189[3] = v74;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v189, 4);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v150, "activateConstraints:", v75);

      v5 = v72;
      objc_msgSend(v72, "_resultsControllerViewContainer");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "superview");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "bounds");
      v79 = v78;
      v81 = v80;

      v4 = v171;
      objc_msgSend(v171, "navigationController");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "navigationBar");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "frame");
      MaxY = CGRectGetMaxY(v190);

      objc_msgSend(v72, "view");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "frame");
      v87 = v86 - MaxY;

      objc_msgSend(v72, "_resultsControllerViewContainer");
      v88 = (UIView *)objc_claimAutoreleasedReturnValue();
      -[UIView setFrame:](v88, "setFrame:", v79, MaxY, v81, v87);
    }
    else
    {
      objc_msgSend(v4, "navigationController");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "navigationBar");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "frame");
      v97 = CGRectGetMaxY(v191);

      v98 = v97 + 1.0;
      objc_msgSend(v19, "alignmentConstraintForAxis:", 1);
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v99)
      {
        v100 = (void *)MEMORY[0x1E0D156E0];
        objc_msgSend(v19, "view");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "view");
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "superview");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v101, 3, 0, v103, 3, 1.0, v98);
        v99 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = v175;
        objc_msgSend(v99, "setActive:", 1);
        objc_msgSend(v175, "setAlignmentConstraint:forAxis:", v99, 1);
      }
      v167 = v99;
      objc_msgSend(v19, "alignmentConstraintForAxis:", 0);
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v104)
      {
        v105 = (void *)MEMORY[0x1E0D156E0];
        objc_msgSend(v19, "view");
        v106 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "view");
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v107, "superview");
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v108, "safeAreaLayoutGuide");
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        v110 = v105;
        v111 = (void *)v106;
        objc_msgSend(v110, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v106, 9, 0, v109, 9, 1.0, 0.0);
        v104 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = v175;
        objc_msgSend(v104, "setActive:", 1);
        objc_msgSend(v175, "setAlignmentConstraint:forAxis:", v104, 0);
      }
      v166 = v104;
      objc_msgSend(v19, "view");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v112, "layoutIfNeeded");

      objc_msgSend(v5, "_resultsControllerViewContainer");
      v113 = objc_claimAutoreleasedReturnValue();
      if (v113)
      {
        v114 = (UIView *)v113;
        objc_msgSend(v19, "view");
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v115, "frame");
        v116 = v98 + CGRectGetHeight(v192);

        -[UIView frameOrigin](v114, "frameOrigin");
        v118 = v117;
        -[UIView size](v114, "size");
        v120 = v119;
        -[UIView size](v114, "size");
        v163 = v114;
        -[UIView setFrame:](v114, "setFrame:", v118, v116, v120, v121 - v116);
      }
      else
      {
        objc_msgSend(v4, "view");
        v163 = (UIView *)objc_claimAutoreleasedReturnValue();
        -[UIView setFrameOrigin:](v163, "setFrameOrigin:", 0.0, 132.0);
      }
      v123 = [UIView alloc];
      v88 = -[UIView initWithFrame:](v123, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v88, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      +[UIColor tableBackgroundColor](UIColor, "tableBackgroundColor");
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v88, "setBackgroundColor:", v124);

      objc_msgSend(v5, "set_systemInputMarginView:", v88);
      v147 = (void *)MEMORY[0x1E0D156E0];
      -[UIView leftAnchor](v88, "leftAnchor");
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "safeAreaLayoutGuide");
      v161 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v161, "leftAnchor");
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v159, "constraintEqualToAnchor:", v157);
      v155 = (void *)objc_claimAutoreleasedReturnValue();
      v188[0] = v155;
      -[UIView rightAnchor](v88, "rightAnchor");
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "safeAreaLayoutGuide");
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v153, "rightAnchor");
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v151, "constraintEqualToAnchor:", v149);
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      v188[1] = v145;
      -[UIView topAnchor](v88, "topAnchor");
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "view");
      v126 = v19;
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v127, "topAnchor");
      v165 = v5;
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v125, "constraintEqualToAnchor:", v128);
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      v188[2] = v129;
      -[UIView bottomAnchor](v88, "bottomAnchor");
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v126, "view");
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v131, "bottomAnchor");
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v130, "constraintEqualToAnchor:", v132);
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      v188[3] = v133;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v188, 4);
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v147, "activateConstraints:", v134);

      v5 = v165;
      v4 = v171;
      v64 = v163;
    }

    objc_msgSend(v175, "view");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v135, "superview");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v175, "view");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "bringSubviewToFront:", v137);

    objc_msgSend(v5, "_resultsControllerViewContainer");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v138, "setAlpha:", 0.0);

    v139 = MEMORY[0x1E0C809B0];
    v185[0] = MEMORY[0x1E0C809B0];
    v185[1] = 3221225472;
    v185[2] = __65___UISearchControllerCarPlaySearchBarAnimator_animateTransition___block_invoke;
    v185[3] = &unk_1E16B1B28;
    v140 = v5;
    v186 = v140;
    v141 = (void (**)(_QWORD))_Block_copy(v185);
    v182[0] = v139;
    v182[1] = 3221225472;
    v182[2] = __65___UISearchControllerCarPlaySearchBarAnimator_animateTransition___block_invoke_2;
    v182[3] = &unk_1E16B2218;
    v183 = v140;
    v3 = v172;
    v142 = v172;
    v184 = v142;
    v143 = (void (**)(void *, uint64_t))_Block_copy(v182);
    v10 = v169;
    v8 = v170;
    if (objc_msgSend(v142, "isAnimated"))
    {
      -[_UISearchControllerAnimator transitionDuration:](self, "transitionDuration:", v142);
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", objc_msgSend(v169, "completionCurve"), v141, v143, v144, 0.0);
    }
    else
    {
      v141[2](v141);
      v143[2](v143, 1);
    }
    v11 = v168;
    v122 = v173;

  }
  else
  {
    v89 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __65___UISearchControllerCarPlaySearchBarAnimator_animateTransition___block_invoke_3;
    aBlock[3] = &unk_1E16B1B50;
    v180 = v4;
    v90 = v3;
    v181 = v90;
    v91 = (void (**)(_QWORD))_Block_copy(aBlock);
    v177[0] = v89;
    v177[1] = 3221225472;
    v177[2] = __65___UISearchControllerCarPlaySearchBarAnimator_animateTransition___block_invoke_4;
    v177[3] = &unk_1E16B3FD8;
    v92 = v90;
    v178 = v92;
    v93 = (void (**)(void *, uint64_t))_Block_copy(v177);
    if (objc_msgSend(v92, "isAnimated"))
    {
      -[_UISearchControllerAnimator transitionDuration:](self, "transitionDuration:", v92);
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", objc_msgSend(v10, "completionCurve"), v91, v93, v94, 0.0);
    }
    else
    {
      v91[2](v91);
      v93[2](v93, 1);
    }

    v122 = v180;
  }

}

- (void)didFocusSearchBarForController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double MinY;
  void *v9;
  double MaxY;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  _QWORD v16[4];
  id v17;
  CGRect v18;
  CGRect v19;

  v4 = a3;
  objc_msgSend(v4, "_systemInputViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "becomeFirstResponder");

  if (objc_msgSend(v5, "supportsTouchInput"))
  {
    objc_msgSend(v5, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frame");
    MinY = CGRectGetMinY(v18);
    objc_msgSend(v4, "_resultsControllerViewContainer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "frame");
    MaxY = CGRectGetMaxY(v19);

    if (MinY >= MaxY)
    {
      objc_msgSend(v5, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "superview");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "layoutIfNeeded");

      objc_msgSend(v5, "alignmentConstraintForAxis:", 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setConstant:", 0.0);
      -[_UISearchControllerAnimator transitionDuration:](self, "transitionDuration:", 0);
      v15 = v14;
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __78___UISearchControllerCarPlaySearchBarAnimator_didFocusSearchBarForController___block_invoke;
      v16[3] = &unk_1E16B1B28;
      v17 = v5;
      +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v16, 0, v15);

    }
  }

}

- (void)didUnfocusSearchBarForController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 IsIdentity;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  CGAffineTransform v19;

  v4 = a3;
  objc_msgSend(v4, "_systemInputViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "supportsTouchInput"))
  {
    objc_msgSend(v5, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      objc_msgSend(v6, "transform");
    else
      memset(&v19, 0, sizeof(v19));
    IsIdentity = CGAffineTransformIsIdentity(&v19);

    if (IsIdentity)
    {
      objc_msgSend(v5, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "superview");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "layoutIfNeeded");

      objc_msgSend(v5, "alignmentConstraintForAxis:", 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "frame");
      objc_msgSend(v11, "setConstant:", v13);

      -[_UISearchControllerAnimator transitionDuration:](self, "transitionDuration:", 0);
      v15 = v14;
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __80___UISearchControllerCarPlaySearchBarAnimator_didUnfocusSearchBarForController___block_invoke;
      v17[3] = &unk_1E16B1B28;
      v18 = v5;
      +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v17, 0, v15);

    }
  }
  objc_msgSend(v4, "searchBar");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "resignFirstResponder");

}

@end
