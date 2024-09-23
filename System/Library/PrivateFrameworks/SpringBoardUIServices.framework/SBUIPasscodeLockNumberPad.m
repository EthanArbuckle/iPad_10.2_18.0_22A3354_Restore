@implementation SBUIPasscodeLockNumberPad

- (NSArray)buttons
{
  return -[TPNumberPad buttons](self->_numberPad, "buttons");
}

+ (id)_buttonForCharacter:(int64_t)a3 withLightStyle:(BOOL)a4
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  if (a3 != 13)
    return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initForCharacter:", a3);
  v4 = -[SBEmptyButtonView initForCharacter:]([SBEmptyButtonView alloc], "initForCharacter:", 13);
  v5 = *MEMORY[0x1E0C9D648];
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  +[SBPasscodeNumberPadButton defaultSize](SBPasscodeNumberPadButton, "defaultSize");
  objc_msgSend(v4, "setFrame:", v5, v6, v7, v8);
  return v4;
}

- (SBUIPasscodeLockNumberPad)initWithDefaultSizeAndLightStyle:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  void *v6;
  uint64_t i;
  void *v8;
  SBNumberPadWithDelegate *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  SBUIPasscodeLockNumberPad *v17;
  SBUIPasscodeLockNumberPad *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  SBUIButton *cancelButton;
  SBUIButton *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  SBUIButton *backspaceButton;
  SBUIButton *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  SBUIButton *emergencyCallButton;
  SBUIButton *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t j;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  void *v51;
  void *v52;
  double v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  NSArray *auxiliaryButtonConstrainingConstraints;
  NSArray *v64;
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
  double v77;
  double v78;
  void *v79;
  void *v80;
  uint64_t v81;
  NSLayoutConstraint *emergencyButtonConstraintCenterX;
  double v83;
  void *v84;
  void *v85;
  double v86;
  uint64_t v87;
  NSLayoutConstraint *cancelButtonConstraintCenterX;
  double v89;
  void *v90;
  void *v91;
  uint64_t v92;
  NSLayoutConstraint *backspaceButtonConstraintCenterX;
  double v94;
  void *v95;
  double Height;
  void *v97;
  _BOOL8 v98;
  void *v99;
  void *v100;
  id v101;
  double v102;
  double v103;
  double v104;
  double v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  SBNumberPadWithDelegate *v111;
  id v112;
  id obj;
  uint64_t v114;
  BOOL v115;
  void *v116;
  SBUIPasscodeLockNumberPad *v117;
  _BOOL4 v118;
  void *v119;
  id *p_numberPad;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  objc_super v125;
  _QWORD v126[3];
  _QWORD v127[3];
  _BYTE v128[128];
  uint64_t v129;
  CGRect v130;
  CGRect v131;

  v3 = a3;
  v129 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = (void *)MEMORY[0x1A85A15D0]();
  for (i = 0; i != 12; ++i)
  {
    objc_msgSend((id)objc_opt_class(), "_buttonForCharacter:withLightStyle:", SBNumberPadCharacters[i], v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v8);

  }
  objc_autoreleasePoolPop(v6);
  v9 = -[TPNumberPad initWithButtons:]([SBNumberPadWithDelegate alloc], "initWithButtons:", v5);
  -[SBNumberPadWithDelegate bounds](v9, "bounds");
  v11 = v10;
  v13 = v12;
  objc_msgSend(MEMORY[0x1E0DA9E68], "pinNumberPadBottomPaddingHeight");
  v15 = SBUIFloatFloorForMainScreenScale(v14);
  objc_msgSend(MEMORY[0x1E0DA9E68], "pinNumberPadWidth");
  v125.receiver = self;
  v125.super_class = (Class)SBUIPasscodeLockNumberPad;
  v17 = -[SBUIPasscodeLockNumberPad initWithFrame:](&v125, sel_initWithFrame_, 0.0, 0.0, v16, v13 + v15);
  v18 = v17;
  if (v17)
  {
    v112 = v5;
    v115 = v3;
    v17->_useLightStyle = v3;
    -[SBUIPasscodeLockNumberPad bounds](v17, "bounds");
    v20 = SBUIFloatFloorForMainScreenScale((v19 - v11) * 0.5);
    v111 = v9;
    objc_storeStrong((id *)&v18->_numberPad, v9);
    -[SBNumberPadWithDelegate setFrame:](v18->_numberPad, "setFrame:", v20, 0.0, v11, v13);
    p_numberPad = (id *)&v18->_numberPad;
    -[SBUIPasscodeLockNumberPad addSubview:](v18, "addSubview:", v18->_numberPad);
    -[SBUIPasscodeLockNumberPad _fontForAncillaryButton](v18, "_fontForAncillaryButton");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "pointSize");
    if (v21 <= 7.0)
      v22 = 1.0;
    else
      v22 = 7.0 / v21;
    +[SBUIButton buttonWithType:](SBUIButton, "buttonWithType:", 1);
    v23 = objc_claimAutoreleasedReturnValue();
    cancelButton = v18->_cancelButton;
    v18->_cancelButton = (SBUIButton *)v23;

    v25 = v18->_cancelButton;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("PASSCODE_CANCEL"), &stru_1E4C40DE8, CFSTR("SpringBoardUIServices"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIButton setTitle:forState:](v25, "setTitle:forState:", v27, 0);

    -[SBUIButton addTarget:action:forControlEvents:](v18->_cancelButton, "addTarget:action:forControlEvents:", v18, sel__cancelButtonHit, 64);
    +[SBUIButton buttonWithType:](SBUIButton, "buttonWithType:", 1);
    v28 = objc_claimAutoreleasedReturnValue();
    backspaceButton = v18->_backspaceButton;
    v18->_backspaceButton = (SBUIButton *)v28;

    v30 = v18->_backspaceButton;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("PASSCODE_BACKSPACE"), &stru_1E4C40DE8, CFSTR("SpringBoardUIServices"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIButton setTitle:forState:](v30, "setTitle:forState:", v32, 0);

    -[SBUIButton addTarget:action:forControlEvents:](v18->_backspaceButton, "addTarget:action:forControlEvents:", v18, sel__backspaceButtonHit, 64);
    +[SBUIButton buttonWithType:](SBUIButton, "buttonWithType:", 1);
    v33 = objc_claimAutoreleasedReturnValue();
    emergencyCallButton = v18->_emergencyCallButton;
    v18->_emergencyCallButton = (SBUIButton *)v33;

    v35 = v18->_emergencyCallButton;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("PASSCODE_EMERGENCY"), &stru_1E4C40DE8, CFSTR("SpringBoardUIServices"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIButton setTitle:forState:](v35, "setTitle:forState:", v37, 0);

    -[SBUIButton addTarget:action:forControlEvents:](v18->_emergencyCallButton, "addTarget:action:forControlEvents:", v18, sel__emergencyCallButtonHit, 64);
    v123 = 0u;
    v124 = 0u;
    v121 = 0u;
    v122 = 0u;
    v127[0] = v18->_cancelButton;
    v127[1] = v18->_backspaceButton;
    v127[2] = v18->_emergencyCallButton;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v127, 3);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v121, v128, 16);
    if (v38)
    {
      v39 = v38;
      v117 = v18;
      v40 = 0;
      v114 = *(_QWORD *)v122;
      do
      {
        for (j = 0; j != v39; ++j)
        {
          if (*(_QWORD *)v122 != v114)
            objc_enumerationMutation(obj);
          v42 = *(void **)(*((_QWORD *)&v121 + 1) + 8 * j);
          objc_msgSend(v42, "setUserInteractionEnabled:", 1);
          objc_msgSend(v42, "setClipsToBounds:", 1);
          objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "setBackgroundColor:", v43);

          if (v115)
            objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
          else
            objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "setTitleColor:forState:", v44, 0);

          objc_msgSend(v42, "setPointerInteractionEnabled:", 1);
          objc_msgSend(v42, "titleLabel");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "setFont:", v119);
          objc_msgSend(v45, "setLineBreakMode:", 5);
          objc_msgSend(v45, "setAdjustsFontSizeToFitWidth:", 1);
          objc_msgSend(v45, "setMinimumScaleFactor:", v22);
          -[SBUIPasscodeLockNumberPad addSubview:](v117, "addSubview:", v42);
          objc_msgSend(v42, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
          objc_msgSend(v42, "setContentHorizontalAlignment:", 0);
          LODWORD(v46) = 1144750080;
          objc_msgSend(v42, "setContentCompressionResistancePriority:forAxis:", 0, v46);
          objc_msgSend(v42, "heightAnchor");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*p_numberPad, "heightAnchor");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "constraintEqualToAnchor:multiplier:", v48, 0.25);
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          LODWORD(v50) = 1144750080;
          objc_msgSend(v49, "setPriority:", v50);
          objc_msgSend(v49, "setActive:", 1);
          objc_msgSend(v42, "widthAnchor");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*p_numberPad, "widthAnchor");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "constraintEqualToAnchor:multiplier:", v52, 0.333333333);
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          LODWORD(v53) = 1144750080;
          objc_msgSend(v40, "setPriority:", v53);
          objc_msgSend(v40, "setActive:", 1);

        }
        v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v121, v128, 16);
      }
      while (v39);

      v18 = v117;
    }

    v118 = -[SBUIPasscodeLockNumberPad _holdsAuxiliaryButtonsWithinPadBounds](v18, "_holdsAuxiliaryButtonsWithinPadBounds");
    objc_msgSend(*p_numberPad, "rightAnchor");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIButton rightAnchor](v18->_cancelButton, "rightAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "constraintGreaterThanOrEqualToAnchor:", v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v126[0] = v55;
    objc_msgSend(*p_numberPad, "rightAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIButton rightAnchor](v18->_backspaceButton, "rightAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintGreaterThanOrEqualToAnchor:", v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v126[1] = v58;
    -[SBUIButton leftAnchor](v18->_emergencyCallButton, "leftAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*p_numberPad, "leftAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "constraintGreaterThanOrEqualToAnchor:", v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v126[2] = v61;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v126, 3);
    v62 = objc_claimAutoreleasedReturnValue();
    auxiliaryButtonConstrainingConstraints = v18->_auxiliaryButtonConstrainingConstraints;
    v18->_auxiliaryButtonConstrainingConstraints = (NSArray *)v62;

    v64 = v18->_auxiliaryButtonConstrainingConstraints;
    if (v118)
      objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v64);
    else
      objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", v64);
    v65 = (void *)MEMORY[0x1E0CB3718];
    _NSDictionaryOfVariableBindings(CFSTR("_cancelButton, _emergencyCallButton"), v18->_cancelButton, v18->_emergencyCallButton, 0);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("[_emergencyCallButton]-(>=10)-[_cancelButton]"), 0x10000, 0, v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "activateConstraints:", v67);

    v68 = (void *)MEMORY[0x1E0CB3718];
    _NSDictionaryOfVariableBindings(CFSTR("_backspaceButton, _emergencyCallButton"), v18->_backspaceButton, v18->_emergencyCallButton, 0);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("[_emergencyCallButton]-(>=10)-[_backspaceButton]"), 0x10000, 0, v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "activateConstraints:", v70);

    -[SBUIButton firstBaselineAnchor](v18->_cancelButton, "firstBaselineAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIButton firstBaselineAnchor](v18->_emergencyCallButton, "firstBaselineAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "constraintEqualToAnchor:", v72);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "setActive:", 1);

    -[SBUIButton firstBaselineAnchor](v18->_backspaceButton, "firstBaselineAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIButton firstBaselineAnchor](v18->_emergencyCallButton, "firstBaselineAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "constraintEqualToAnchor:", v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "setActive:", 1);

    -[SBUIPasscodeLockNumberPad _auxiliaryButtonCenteringOffset](v18, "_auxiliaryButtonCenteringOffset");
    v78 = v77;
    -[SBUIButton centerXAnchor](v18->_emergencyCallButton, "centerXAnchor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*p_numberPad, "leftAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "constraintEqualToAnchor:constant:", v80, v78);
    v81 = objc_claimAutoreleasedReturnValue();
    emergencyButtonConstraintCenterX = v18->_emergencyButtonConstraintCenterX;
    v18->_emergencyButtonConstraintCenterX = (NSLayoutConstraint *)v81;

    LODWORD(v83) = 1144750080;
    -[NSLayoutConstraint setPriority:](v18->_emergencyButtonConstraintCenterX, "setPriority:", v83);
    -[NSLayoutConstraint setActive:](v18->_emergencyButtonConstraintCenterX, "setActive:", 1);
    -[SBUIButton centerXAnchor](v18->_cancelButton, "centerXAnchor");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*p_numberPad, "rightAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = -v78;
    objc_msgSend(v84, "constraintEqualToAnchor:constant:", v85, v86);
    v87 = objc_claimAutoreleasedReturnValue();
    cancelButtonConstraintCenterX = v18->_cancelButtonConstraintCenterX;
    v18->_cancelButtonConstraintCenterX = (NSLayoutConstraint *)v87;

    LODWORD(v89) = 1144750080;
    -[NSLayoutConstraint setPriority:](v18->_cancelButtonConstraintCenterX, "setPriority:", v89);
    -[NSLayoutConstraint setActive:](v18->_cancelButtonConstraintCenterX, "setActive:", 1);
    -[SBUIButton centerXAnchor](v18->_backspaceButton, "centerXAnchor");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*p_numberPad, "rightAnchor");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "constraintEqualToAnchor:constant:", v91, v86);
    v92 = objc_claimAutoreleasedReturnValue();
    backspaceButtonConstraintCenterX = v18->_backspaceButtonConstraintCenterX;
    v18->_backspaceButtonConstraintCenterX = (NSLayoutConstraint *)v92;

    LODWORD(v94) = 1144750080;
    -[NSLayoutConstraint setPriority:](v18->_backspaceButtonConstraintCenterX, "setPriority:", v94);
    -[NSLayoutConstraint setActive:](v18->_backspaceButtonConstraintCenterX, "setActive:", 1);
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "bounds");
    Height = CGRectGetHeight(v130);
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "bounds");
    v98 = Height >= CGRectGetWidth(v131);

    objc_msgSend(*p_numberPad, "buttons");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "objectAtIndex:", 9);
    v100 = (void *)objc_claimAutoreleasedReturnValue();

    v101 = *p_numberPad;
    objc_msgSend(v100, "frame");
    objc_msgSend(v101, "convertRect:toView:", v18);
    UIRectGetCenter();
    v103 = v102;
    objc_msgSend(MEMORY[0x1E0DA9E68], "pinNumberPadAncillaryButtonOffset:", v98);
    v105 = v103 + v104;
    -[SBUIButton centerYAnchor](v18->_cancelButton, "centerYAnchor");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*p_numberPad, "topAnchor");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "constraintEqualToAnchor:constant:", v107, v105);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "setActive:", 1);

    -[SBUIPasscodeLockNumberPad setAncillaryButtonOffset:](v18, "setAncillaryButtonOffset:", v105);
    v18->_showsCancelButton = 1;
    v18->_showsBackspaceButton = 0;
    v18->_showsEmergencyCallButton = 1;
    -[SBUIPasscodeLockNumberPad _configureAdditionalButtons](v18, "_configureAdditionalButtons");
    v109 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA860]), "initWithDelegate:", v18);
    -[SBUIPasscodeLockNumberPad addInteraction:](v18, "addInteraction:", v109);
    v9 = v111;
    -[SBNumberPadWithDelegate setDelegate:](v111, "setDelegate:", v18);
    -[SBNumberPadWithDelegate setMultipleTouchEnabled:](v111, "setMultipleTouchEnabled:", 0);
    -[SBNumberPadWithDelegate addTarget:action:forControlEvents:](v111, "addTarget:action:forControlEvents:", v18, sel__numberPadTouchDown_forEvent_, 1);
    -[SBNumberPadWithDelegate addTarget:action:forControlEvents:](v111, "addTarget:action:forControlEvents:", v18, sel__numberPadTouchUp_forEvent_, 192);
    -[SBNumberPadWithDelegate addTarget:action:forControlEvents:](v111, "addTarget:action:forControlEvents:", v18, sel__numberPadTouchCancelled_forEvent_, 256);
    -[SBNumberPadWithDelegate addTarget:action:forControlEvents:](v111, "addTarget:action:forControlEvents:", v18, sel__numberPadTouchDrag_forEvent_, 12);

    v5 = v112;
  }

  return v18;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setShowsCancelButton:(BOOL)a3
{
  if (self->_showsCancelButton != a3)
  {
    self->_showsCancelButton = a3;
    -[SBUIPasscodeLockNumberPad _configureAdditionalButtons](self, "_configureAdditionalButtons");
  }
}

- (void)setShowsBackspaceButton:(BOOL)a3
{
  if (self->_showsBackspaceButton != a3)
  {
    self->_showsBackspaceButton = a3;
    -[SBUIPasscodeLockNumberPad _configureAdditionalButtons](self, "_configureAdditionalButtons");
  }
}

- (void)setShowsEmergencyCallButton:(BOOL)a3
{
  if (self->_showsEmergencyCallButton != a3)
  {
    self->_showsEmergencyCallButton = a3;
    -[SBUIPasscodeLockNumberPad _configureAdditionalButtons](self, "_configureAdditionalButtons");
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  SBUIButton *backspaceButton;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _QWORD v22[3];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SBUIPasscodeLockNumberPad;
  -[SBUIPasscodeLockNumberPad traitCollectionDidChange:](&v21, sel_traitCollectionDidChange_, v4);
  if (v4)
  {
    -[SBUIPasscodeLockNumberPad traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSizeCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      backspaceButton = self->_backspaceButton;
      v22[0] = self->_cancelButton;
      v22[1] = backspaceButton;
      v22[2] = self->_emergencyCallButton;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 3, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
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
            objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14), "titleLabel");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[SBUIPasscodeLockNumberPad _fontForAncillaryButton](self, "_fontForAncillaryButton");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setFont:", v16);

            ++v14;
          }
          while (v12 != v14);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
        }
        while (v12);
      }

      -[SBUIPasscodeLockNumberPad setNeedsLayout](self, "setNeedsLayout");
    }
  }

}

- (void)setVisible:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  __int128 *v12;
  __int128 *v13;
  _BOOL4 v14;
  uint64_t v15;
  uint64_t v16;
  double *v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  __int128 v40;
  SBUIButton *cancelButton;
  SBUIButton *emergencyCallButton;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t j;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  __int128 *v53;
  uint64_t k;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  SBUIButton *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t m;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  SBUIPasscodeLockNumberPad *v81;
  unint64_t v82;
  id v83;
  unint64_t v84;
  id v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  _BOOL4 v89;
  id obj;
  id obja;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  CGAffineTransform v96;
  CATransform3D v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  CATransform3D v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  _QWORD v119[2];
  _BYTE v120[128];
  _QWORD v121[2];
  _BYTE v122[128];
  _QWORD v123[2];
  _BYTE v124[128];
  _QWORD v125[2];
  _BYTE v126[128];
  uint64_t v127;
  CAFrameRateRange v128;
  CAFrameRateRange v129;

  v127 = *MEMORY[0x1E0C80C00];
  if (self->_visible != a3)
  {
    v4 = a4;
    self->_visible = a3;
    v89 = a4;
    v81 = self;
    if (a3)
    {
      -[TPNumberPad buttons](self->_numberPad, "buttons");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v85 = v5;
      v7 = objc_msgSend(v5, "count");
      if ((unint64_t)(v7 + 2) >= 3)
      {
        v8 = 0;
        if ((v7 + 2) / 3uLL <= 1)
          v9 = 1;
        else
          v9 = (v7 + 2) / 3uLL;
        v82 = v9;
        do
        {
          objc_msgSend(v85, "subarrayWithRange:", v8, 3, v81);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "insertObject:atIndex:", v10, 0);

          v8 += 3;
          --v9;
        }
        while (v9);
        v11 = 0;
        v86 = *MEMORY[0x1E0CD2950];
        v12 = (__int128 *)MEMORY[0x1E0CD2610];
        v13 = (__int128 *)MEMORY[0x1E0C9BAA8];
        v14 = v89;
        v83 = v6;
        v15 = *MEMORY[0x1E0CD2B50];
        do
        {
          v16 = 3;
          if (v11 < 3)
            v16 = v11;
          v17 = (double *)((char *)&setVisible_animated__rowParametersIn + 24 * v16);
          v18 = *v17;
          v19 = v17[1];
          v20 = v17[2];
          v84 = v11;
          objc_msgSend(v6, "objectAtIndexedSubscript:");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v115 = 0u;
          v116 = 0u;
          v117 = 0u;
          v118 = 0u;
          obj = v21;
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v115, v126, 16);
          if (v22)
          {
            v23 = v22;
            v24 = *(_QWORD *)v116;
            v87 = *(_QWORD *)v116;
            do
            {
              for (i = 0; i != v23; ++i)
              {
                if (*(_QWORD *)v116 != v24)
                  objc_enumerationMutation(obj);
                v26 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * i);
                if (v14)
                {
                  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("transform"));
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("opacity"));
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v27, "setMass:", 1.0);
                  objc_msgSend(v27, "setBeginTime:", v20);
                  objc_msgSend(v27, "setBeginTimeMode:", v86);
                  objc_msgSend(v27, "setStiffness:", v18);
                  objc_msgSend(v27, "setDamping:", v19);
                  objc_msgSend(v27, "setDuration:", 2.0);
                  objc_msgSend(v27, "setFillMode:", v15);
                  v29 = (void *)MEMORY[0x1E0CB3B18];
                  CATransform3DMakeScale(&v114, 0.0, 0.0, 1.0);
                  objc_msgSend(v29, "valueWithCATransform3D:", &v114);
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v27, "setFromValue:", v30);

                  v31 = v12[5];
                  v110 = v12[4];
                  v111 = v31;
                  v32 = v12[7];
                  v112 = v12[6];
                  v113 = v32;
                  v33 = v12[1];
                  v106 = *v12;
                  v107 = v33;
                  v34 = v12[3];
                  v108 = v12[2];
                  v109 = v34;
                  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v106);
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v27, "setToValue:", v35);

                  objc_msgSend(v28, "setMass:", 1.0);
                  objc_msgSend(v28, "setBeginTime:", v20);
                  objc_msgSend(v28, "setBeginTimeMode:", v86);
                  objc_msgSend(v28, "setStiffness:", v18);
                  objc_msgSend(v28, "setDamping:", v19);
                  objc_msgSend(v28, "setDuration:", 2.0);
                  objc_msgSend(v28, "setFillMode:", v15);
                  objc_msgSend(v28, "setFromValue:", &unk_1E4C7AD50);
                  objc_msgSend(v28, "setToValue:", &unk_1E4C7AD60);
                  objc_msgSend(MEMORY[0x1E0CD2700], "animation");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v36, "setDuration:", 2.0);
                  v125[0] = v27;
                  v125[1] = v28;
                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v125, 2);
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v36, "setAnimations:", v37);

                  objc_msgSend(v36, "setFillMode:", v15);
                  v128 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
                  objc_msgSend(v36, "setPreferredFrameRateRange:", *(double *)&v128.minimum, *(double *)&v128.maximum, *(double *)&v128.preferred);
                  objc_msgSend(v36, "setHighFrameRateReason:", 1114125);
                  objc_msgSend(v26, "layer");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v38, "removeAnimationForKey:", CFSTR("numberPadButton"));

                  objc_msgSend(v26, "layer");
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v39, "addAnimation:forKey:", v36, CFSTR("numberPadButton"));

                  v14 = v89;
                  v13 = (__int128 *)MEMORY[0x1E0C9BAA8];
                  v24 = v87;

                }
                v40 = v13[1];
                v106 = *v13;
                v107 = v40;
                v108 = v13[2];
                objc_msgSend(v26, "setTransform:", &v106);
                objc_msgSend(v26, "setAlpha:", 1.0);
              }
              v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v126, 16);
            }
            while (v23);
          }

          v6 = v83;
          v11 = v84 + 1;
        }
        while (v84 + 1 != v82);
      }
      cancelButton = v81->_cancelButton;
      emergencyCallButton = v81->_emergencyCallButton;
      v104 = 0u;
      v105 = 0u;
      v102 = 0u;
      v103 = 0u;
      v123[0] = cancelButton;
      v123[1] = emergencyCallButton;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v123, 2, v81);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v102, v124, 16);
      if (v44)
      {
        v45 = v44;
        v46 = *(_QWORD *)v103;
        do
        {
          for (j = 0; j != v45; ++j)
          {
            if (*(_QWORD *)v103 != v46)
              objc_enumerationMutation(v43);
            objc_msgSend(*(id *)(*((_QWORD *)&v102 + 1) + 8 * j), "layer");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "removeAnimationForKey:", CFSTR("sideButtonsOpacity"));

          }
          v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v102, v124, 16);
        }
        while (v45);
      }

    }
    else
    {
      v100 = 0u;
      v101 = 0u;
      v98 = 0u;
      v99 = 0u;
      -[TPNumberPad buttons](self->_numberPad, "buttons");
      obja = (id)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v98, v122, 16);
      if (v49)
      {
        v50 = v49;
        v51 = *(_QWORD *)v99;
        v52 = *MEMORY[0x1E0CD2B50];
        v53 = (__int128 *)MEMORY[0x1E0CD2610];
        v88 = *(_QWORD *)v99;
        do
        {
          for (k = 0; k != v50; ++k)
          {
            if (*(_QWORD *)v99 != v51)
              objc_enumerationMutation(obja);
            v55 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * k);
            if (v4)
            {
              objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("transform"));
              v56 = v50;
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("opacity"));
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v57, "setMass:", 1.0);
              objc_msgSend(v57, "setStiffness:", 341.02);
              objc_msgSend(v57, "setDamping:", 36.93);
              objc_msgSend(v57, "setDuration:", 2.0);
              objc_msgSend(v57, "setFillMode:", v52);
              v59 = v53[5];
              v110 = v53[4];
              v111 = v59;
              v60 = v53[7];
              v112 = v53[6];
              v113 = v60;
              v61 = v53[1];
              v106 = *v53;
              v107 = v61;
              v62 = v53[3];
              v108 = v53[2];
              v109 = v62;
              objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v106);
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v57, "setFromValue:", v63);

              v64 = (void *)MEMORY[0x1E0CB3B18];
              CATransform3DMakeScale(&v97, 0.0, 0.0, 1.0);
              objc_msgSend(v64, "valueWithCATransform3D:", &v97);
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v57, "setToValue:", v65);

              objc_msgSend(v58, "setMass:", 1.0);
              objc_msgSend(v58, "setStiffness:", 341.02);
              objc_msgSend(v58, "setDamping:", 36.93);
              objc_msgSend(v58, "setDuration:", 2.0);
              objc_msgSend(v58, "setFillMode:", v52);
              objc_msgSend(v58, "setFromValue:", &unk_1E4C7AD60);
              objc_msgSend(v58, "setToValue:", &unk_1E4C7AD50);
              objc_msgSend(MEMORY[0x1E0CD2700], "animation");
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v66, "setDuration:", 2.0);
              v121[0] = v57;
              v121[1] = v58;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v121, 2);
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v66, "setAnimations:", v67);

              objc_msgSend(v66, "setFillMode:", v52);
              v129 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
              objc_msgSend(v66, "setPreferredFrameRateRange:", *(double *)&v129.minimum, *(double *)&v129.maximum, *(double *)&v129.preferred);
              objc_msgSend(v66, "setHighFrameRateReason:", 1114125);
              objc_msgSend(v55, "layer");
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v68, "removeAnimationForKey:", CFSTR("numberPadButton"));

              objc_msgSend(v55, "layer");
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v69, "addAnimation:forKey:", v66, CFSTR("numberPadButton"));

              v4 = v89;
              v50 = v56;
              v51 = v88;
            }
            CGAffineTransformMakeScale(&v96, 0.0, 0.0);
            objc_msgSend(v55, "setTransform:", &v96);
            objc_msgSend(v55, "setAlpha:", 0.0);
          }
          v50 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v98, v122, 16);
        }
        while (v50);
      }

      v94 = 0u;
      v95 = 0u;
      v92 = 0u;
      v93 = 0u;
      v70 = v81->_emergencyCallButton;
      v119[0] = v81->_cancelButton;
      v119[1] = v70;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v119, 2);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v92, v120, 16);
      if (!v72)
        goto LABEL_47;
      v73 = v72;
      v85 = v71;
      v74 = *(_QWORD *)v93;
      v75 = *MEMORY[0x1E0CD2B50];
      do
      {
        for (m = 0; m != v73; ++m)
        {
          if (*(_QWORD *)v93 != v74)
            objc_enumerationMutation(v85);
          v77 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * m);
          objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("opacity"), v81);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "setMass:", 1.0);
          objc_msgSend(v78, "setStiffness:", 1393.0);
          objc_msgSend(v78, "setDamping:", 74.0);
          objc_msgSend(v78, "setDuration:", 2.0);
          objc_msgSend(v78, "setFillMode:", v75);
          objc_msgSend(v78, "setFromValue:", &unk_1E4C7AD60);
          objc_msgSend(v78, "setToValue:", &unk_1E4C7AD50);
          objc_msgSend(v77, "layer");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "removeAnimationForKey:", CFSTR("sideButtonsOpacity"));

          objc_msgSend(v77, "layer");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "addAnimation:forKey:", v78, CFSTR("sideButtonsOpacity"));

        }
        v73 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v92, v120, 16);
      }
      while (v73);
    }
    v71 = v85;
LABEL_47:

  }
}

- (void)_numberPadTouchDown:(id)a3 forEvent:(id)a4
{
  SBNumberPadWithDelegate *numberPad;
  id v6;
  void *v7;
  SBNumberPadWithDelegate *v8;
  void *v9;
  void *v10;
  id v11;

  numberPad = self->_numberPad;
  v6 = a4;
  objc_msgSend(v6, "touchesForView:", numberPad);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "anyObject");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v8 = self->_numberPad;
  objc_msgSend(v11, "locationInView:", v8);
  -[SBNumberPadWithDelegate buttonForPoint:forEvent:](v8, "buttonForPoint:forEvent:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[SBUIPasscodeLockNumberPad setDownButton:](self, "setDownButton:", v9);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v9, "setHighlighted:", 1);
    -[SBUIPasscodeLockNumberPad delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v10, "passcodeLockNumberPad:keyDown:", self, v9);

  }
  -[SBUIPasscodeLockNumberPad _setSnapshotsDisabled:](self, "_setSnapshotsDisabled:", 1);

}

- (void)_numberPadTouchUp:(id)a3 forEvent:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  SBNumberPadWithDelegate *numberPad;
  _BOOL4 v9;
  void *v10;
  id v11;

  v5 = a4;
  if (self->_downButton)
  {
    v11 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SBUIPasscodeNumberPadButton setHighlighted:](self->_downButton, "setHighlighted:", 0);
    objc_msgSend(v11, "touchesForView:", self->_numberPad);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "anyObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    numberPad = self->_numberPad;
    objc_msgSend(v7, "locationInView:", numberPad);
    v9 = -[SBNumberPadWithDelegate touchAtPoint:isCloseToButton:](numberPad, "touchAtPoint:isCloseToButton:", self->_downButton);
    -[SBUIPasscodeLockNumberPad delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v10, "passcodeLockNumberPad:keyUp:", self, self->_downButton);
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v10, "passcodeLockNumberPad:keyCancelled:", self, self->_downButton);
    }
    -[SBUIPasscodeLockNumberPad setDownButton:](self, "setDownButton:", 0);

    v5 = v11;
  }

}

- (void)_numberPadTouchCancelled:(id)a3 forEvent:(id)a4
{
  id v5;

  if (self->_downButton)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SBUIPasscodeNumberPadButton setHighlighted:](self->_downButton, "setHighlighted:", 0);
    -[SBUIPasscodeLockNumberPad delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v5, "passcodeLockNumberPad:keyCancelled:", self, self->_downButton);
    -[SBUIPasscodeLockNumberPad setDownButton:](self, "setDownButton:", 0);

  }
}

- (void)_numberPadTouchDrag:(id)a3 forEvent:(id)a4
{
  void *v5;
  SBNumberPadWithDelegate *numberPad;
  uint64_t v7;
  id v8;

  if (self->_downButton)
  {
    objc_msgSend(a4, "touchesForView:", self->_numberPad);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "anyObject");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    numberPad = self->_numberPad;
    objc_msgSend(v8, "locationInView:", numberPad);
    v7 = -[SBNumberPadWithDelegate touchAtPoint:isCloseToButton:](numberPad, "touchAtPoint:isCloseToButton:", self->_downButton);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SBUIPasscodeNumberPadButton setHighlighted:](self->_downButton, "setHighlighted:", v7);

  }
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;

  v7 = a5;
  objc_msgSend(a4, "location");
  -[SBNumberPadWithDelegate buttonForPoint:forEvent:](self->_numberPad, "buttonForPoint:forEvent:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = (void *)MEMORY[0x1E0CEA870];
    objc_msgSend(v8, "frame");
    objc_msgSend(v10, "regionWithRect:identifier:", v9);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = v7;
  }
  v12 = v11;

  return v12;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  void *v4;
  __objc2_class **v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  char v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  objc_msgSend(a4, "identifier", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = off_1E4C3CCB8;
  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0
    || (v5 = &off_1E4C3CCE0,
        objc_opt_self(),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_opt_isKindOfClass(),
        v8,
        (v9 & 1) != 0))
  {
    -[__objc2_class _numberPadButtonOuterCircleDiameter](*v5, "_numberPadButtonOuterCircleDiameter");
  }
  v10 = objc_opt_class();
  v11 = v4;
  if (v10)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
  }
  else
  {
    v12 = 0;
  }
  v13 = v12;

  if (v13 && (BSFloatIsOne() & 1) == 0)
  {
    objc_msgSend(v13, "bounds");
    UIRectCenteredRect();
    objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithOvalInRect:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA878], "shapeWithPath:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA98]), "initWithView:", v13);
    objc_msgSend(MEMORY[0x1E0CEA868], "effectWithPreview:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA880], "styleWithEffect:shape:", v18, v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA880], "systemPointerStyle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v14, "set_suppressesMirroring:", 1);

  return v14;
}

+ (CGSize)_inputButtonCircleSize
{
  double v2;
  double v3;
  CGSize result;

  +[SBPasscodeNumberPadButton _numberPadButtonOuterCircleDiameter](SBPasscodeNumberPadButton, "_numberPadButtonOuterCircleDiameter");
  v3 = v2;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (UIEdgeInsets)_inputButtonCircleSpacing
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  +[SBPasscodeNumberPadButton paddingOutsideRing](SBPasscodeNumberPadButton, "paddingOutsideRing");
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (double)_distanceToTopOfFirstButton
{
  double result;

  +[SBPasscodeNumberPadButton paddingOutsideRing](SBPasscodeNumberPadButton, "paddingOutsideRing");
  return result;
}

- (void)setReduceTransparencyButtonColor:(id)a3
{
  UIColor *v5;
  UIColor **p_reduceTransparencyButtonColor;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = (UIColor *)a3;
  p_reduceTransparencyButtonColor = &self->_reduceTransparencyButtonColor;
  if (self->_reduceTransparencyButtonColor != v5)
  {
    objc_storeStrong((id *)&self->_reduceTransparencyButtonColor, a3);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[TPNumberPad buttons](self->_numberPad, "buttons", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v12, "setReduceTransparencyButtonColor:", *p_reduceTransparencyButtonColor);
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }

  }
}

- (void)_setSnapshotsDisabled:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (self->_snapshotsDisabled != a3)
  {
    self->_snapshotsDisabled = a3;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[TPNumberPad buttons](self->_numberPad, "buttons", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(v9, "layer");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "disableUpdateMask");

          v12 = v11 & 0xFFFFFFFD | (2 * self->_snapshotsDisabled);
          objc_msgSend(v9, "layer");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setDisableUpdateMask:", v12);

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v6);
    }

  }
}

- (id)_fontForAncillaryButton
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", SBUIScaledFontSizeWithMaxSizeCategory((void *)*MEMORY[0x1E0CEB3E0], 16.0));
}

- (void)_configureAdditionalButtons
{
  SBUIButton *cancelButton;
  _BOOL8 v4;

  cancelButton = self->_cancelButton;
  v4 = !self->_showsCancelButton || self->_showsBackspaceButton;
  -[SBUIButton setHidden:](cancelButton, "setHidden:", v4);
  -[SBUIButton setHidden:](self->_backspaceButton, "setHidden:", !self->_showsBackspaceButton);
  -[SBUIButton setHidden:](self->_emergencyCallButton, "setHidden:", !self->_showsEmergencyCallButton);
  -[SBUIButton setExclusiveTouch:](self->_emergencyCallButton, "setExclusiveTouch:", 1);
  -[SBUIPasscodeLockNumberPad _updateAuxiliaryButtonConstraints](self, "_updateAuxiliaryButtonConstraints");
}

- (void)_cancelButtonHit
{
  id v3;

  -[SBUIPasscodeLockNumberPad delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "passcodeLockNumberPadCancelButtonHit:", self);

}

- (void)_backspaceButtonHit
{
  id v3;

  -[SBUIPasscodeLockNumberPad delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "passcodeLockNumberPadBackspaceButtonHit:", self);

}

- (void)_emergencyCallButtonHit
{
  id v3;

  -[SBUIPasscodeLockNumberPad delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "passcodeLockNumberPadEmergencyCallButtonHit:", self);

}

- (BOOL)_holdsAuxiliaryButtonsWithinPadBounds
{
  unint64_t v2;
  void *v3;
  uint64_t v4;

  v2 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "activeInterfaceOrientation") - 5;
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  return (v4 & 0xFFFFFFFFFFFFFFFBLL) == 1 || v2 < 0xFFFFFFFFFFFFFFFELL;
}

- (double)_auxiliaryButtonCenteringOffset
{
  _BOOL4 v3;
  double Width;
  double v5;
  CGRect v7;

  v3 = -[SBUIPasscodeLockNumberPad _holdsAuxiliaryButtonsWithinPadBounds](self, "_holdsAuxiliaryButtonsWithinPadBounds");
  -[SBNumberPadWithDelegate frame](self->_numberPad, "frame");
  Width = CGRectGetWidth(v7);
  v5 = -24.0;
  if (v3)
    v5 = -6.0;
  return Width / v5;
}

- (void)_updateAuxiliaryButtonConstraints
{
  double v3;
  double v4;
  double v5;
  _BOOL8 v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[SBUIPasscodeLockNumberPad _auxiliaryButtonCenteringOffset](self, "_auxiliaryButtonCenteringOffset");
  v4 = v3;
  -[NSLayoutConstraint setConstant:](self->_emergencyButtonConstraintCenterX, "setConstant:");
  v5 = -v4;
  -[NSLayoutConstraint setConstant:](self->_cancelButtonConstraintCenterX, "setConstant:", v5);
  -[NSLayoutConstraint setConstant:](self->_backspaceButtonConstraintCenterX, "setConstant:", v5);
  v6 = -[SBUIPasscodeLockNumberPad _holdsAuxiliaryButtonsWithinPadBounds](self, "_holdsAuxiliaryButtonsWithinPadBounds");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = self->_auxiliaryButtonConstrainingConstraints;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "setActive:", v6, (_QWORD)v12);
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (SBUIPasscodeLockNumberPadDelegate)delegate
{
  return (SBUIPasscodeLockNumberPadDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)showsBackspaceButton
{
  return self->_showsBackspaceButton;
}

- (BOOL)showsEmergencyCallButton
{
  return self->_showsEmergencyCallButton;
}

- (BOOL)showsCancelButton
{
  return self->_showsCancelButton;
}

- (double)ancillaryButtonOffset
{
  return self->_ancillaryButtonOffset;
}

- (void)setAncillaryButtonOffset:(double)a3
{
  self->_ancillaryButtonOffset = a3;
}

- (SBUIPasscodeNumberPadButton)downButton
{
  return self->_downButton;
}

- (void)setDownButton:(id)a3
{
  objc_storeStrong((id *)&self->_downButton, a3);
}

- (SBUIButton)emergencyCallButton
{
  return self->_emergencyCallButton;
}

- (SBUIButton)backspaceButton
{
  return self->_backspaceButton;
}

- (SBUIButton)cancelButton
{
  return self->_cancelButton;
}

- (UIColor)reduceTransparencyButtonColor
{
  return self->_reduceTransparencyButtonColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reduceTransparencyButtonColor, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_backspaceButton, 0);
  objc_storeStrong((id *)&self->_emergencyCallButton, 0);
  objc_storeStrong((id *)&self->_downButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_auxiliaryButtonConstrainingConstraints, 0);
  objc_storeStrong((id *)&self->_backspaceButtonConstraintCenterX, 0);
  objc_storeStrong((id *)&self->_cancelButtonConstraintCenterX, 0);
  objc_storeStrong((id *)&self->_emergencyButtonConstraintCenterX, 0);
  objc_storeStrong((id *)&self->_customBackgroundColor, 0);
  objc_storeStrong((id *)&self->_numberPad, 0);
}

@end
