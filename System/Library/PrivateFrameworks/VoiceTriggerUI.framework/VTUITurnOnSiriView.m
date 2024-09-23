@implementation VTUITurnOnSiriView

- (VTUITurnOnSiriView)initWithFrame:(CGRect)a3
{
  VTUITurnOnSiriView *v3;
  VTUITurnOnSiriView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VTUITurnOnSiriView;
  v3 = -[VTUIEnrollmentBaseView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[VTUITurnOnSiriView _setupTurnOnSiriUI](v3, "_setupTurnOnSiriUI");
    -[VTUITurnOnSiriView _setupContent](v4, "_setupContent");
  }
  return v4;
}

- (void)_setupTurnOnSiriUI
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSArray *v7;
  NSArray *siriLanguages;
  unint64_t v9;
  NSArray *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *continueButtons;
  UIButton *v19;
  UIButton *continueButton;
  void *v21;
  void *v22;
  UIButton *v23;
  void *v24;
  UIButton *v25;
  void *v26;
  void *v27;
  UIButton *v28;
  uint64_t v29;
  UIButton *laterButton;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  void *v47;
  unint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  double v52;
  void *v53;
  void *v54;
  double v55;
  void *v56;
  uint64_t v57;
  void *v58;
  NSArray *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t i;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  double v76;
  void *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  double v89;
  void *v90;
  void *v91;
  void *v92;
  double v93;
  NSArray *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t j;
  void *v99;
  void *v100;
  double v101;
  void *v102;
  void *v103;
  double v104;
  void *v105;
  uint64_t v106;
  uint64_t v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  char v116;
  _BYTE v117[128];
  _BYTE v118[128];
  uint64_t v119;

  v119 = *MEMORY[0x24BDAC8D0];
  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsFloatingWithReducedWidth:", 1);
  v116 = 0;
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allSiriLanguageCodesForSystemLanguageCode:isGoodFit:", v6, &v116);
  v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
  siriLanguages = self->_siriLanguages;
  self->_siriLanguages = v7;

  v9 = 0x255A9C000uLL;
  if (-[NSArray count](self->_siriLanguages, "count") < 2)
  {
    +[VTUIButton _vtuiButtonWithPrimaryStyle](VTUIButton, "_vtuiButtonWithPrimaryStyle");
    v19 = (UIButton *)objc_claimAutoreleasedReturnValue();
    continueButton = self->_continueButton;
    self->_continueButton = v19;

    -[UIButton titleLabel](self->_continueButton, "titleLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "turnOnSiriContinueButtonFont");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setFont:", v22);

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_continueButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v23 = self->_continueButton;
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitleColor:forState:](v23, "setTitleColor:forState:", v24, 0);

    v25 = self->_continueButton;
    objc_msgSend(MEMORY[0x24BEBD4B8], "lightGrayColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitleColor:forState:](v25, "setTitleColor:forState:", v26, 1);

    -[UIButton layer](self->_continueButton, "layer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setCornerRadius:", 10.0);

    -[UIButton setClipsToBounds:](self->_continueButton, "setClipsToBounds:", 1);
    -[VTUITurnOnSiriView footerView](self, "footerView");
    continueButtons = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(continueButtons, "addSubview:", self->_continueButton);
  }
  else
  {
    v10 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    if (-[NSArray count](self->_siriLanguages, "count"))
    {
      v11 = 0;
      do
      {
        +[VTUIButton _vtuiButtonWithPrimaryStyle](VTUIButton, "_vtuiButtonWithPrimaryStyle");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setTag:", v11);
        objc_msgSend(v12, "titleLabel");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "turnOnSiriContinueButtonFont");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setFont:", v14);

        objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setTitleColor:forState:", v15, 0);

        objc_msgSend(v12, "layer");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setCornerRadius:", 10.0);

        objc_msgSend(v12, "setClipsToBounds:", 1);
        -[VTUITurnOnSiriView footerView](self, "footerView");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addSubview:", v12);

        -[NSArray addObject:](v10, "addObject:", v12);
        ++v11;
      }
      while (-[NSArray count](self->_siriLanguages, "count") > v11);
    }
    continueButtons = self->_continueButtons;
    self->_continueButtons = v10;
    v9 = 0x255A9C000;
  }

  +[VTUIButton _vtuiButtonWithSecondaryStyle](VTUIButton, "_vtuiButtonWithSecondaryStyle");
  v28 = (UIButton *)objc_claimAutoreleasedReturnValue();
  v29 = 536;
  laterButton = self->_laterButton;
  self->_laterButton = v28;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_laterButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[VTUITurnOnSiriView footerView](self, "footerView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addSubview:", self->_laterButton);

  v32 = *(int *)(v9 + 1172);
  v33 = *(uint64_t *)((char *)&self->super.super.super.super.isa + v32);
  if (v33)
  {
    v34 = (void *)MEMORY[0x24BDD1628];
    -[VTUITurnOnSiriView footerView](self, "footerView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "continueButtonOffset");
    objc_msgSend(v34, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v33, 3, 0, v35, 3, 1.0, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTUITurnOnSiriView addConstraint:](self, "addConstraint:", v37);

    v38 = (void *)MEMORY[0x24BDD1628];
    -[UIButton titleLabel](self->_laterButton, "titleLabel");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = *(uint64_t *)((char *)&self->super.super.super.super.isa + v32);
    objc_msgSend(v3, "bottomOfContinueToNotNowFirstBaseline");
    objc_msgSend(v38, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v39, 12, 0, v40, 4, 1.0, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTUITurnOnSiriView addConstraint:](self, "addConstraint:", v42);
  }
  else
  {
    if (-[NSArray count](self->_continueButtons, "count") < 2)
      goto LABEL_15;
    v43 = (void *)MEMORY[0x24BDD1628];
    -[NSArray firstObject](self->_continueButtons, "firstObject");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTUITurnOnSiriView footerView](self, "footerView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "continueButtonOffset");
    objc_msgSend(v43, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v44, 3, 0, v45, 3, 1.0, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTUITurnOnSiriView addConstraint:](self, "addConstraint:", v47);

    if (-[NSArray count](self->_continueButtons, "count") >= 2)
    {
      v48 = 1;
      do
      {
        v49 = (void *)MEMORY[0x24BDD1628];
        -[NSArray objectAtIndex:](self->_continueButtons, "objectAtIndex:", v48);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray objectAtIndex:](self->_continueButtons, "objectAtIndex:", v48 - 1);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "continueButtonPaddingTop");
        objc_msgSend(v49, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v50, 3, 0, v51, 4, 1.0, v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        -[VTUITurnOnSiriView addConstraint:](self, "addConstraint:", v53);

        ++v48;
      }
      while (-[NSArray count](self->_continueButtons, "count") > v48);
    }
    v54 = (void *)MEMORY[0x24BDD1628];
    -[UIButton titleLabel](self->_laterButton, "titleLabel");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray lastObject](self->_continueButtons, "lastObject");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bottomOfContinueToNotNowFirstBaseline");
    objc_msgSend(v54, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v39, 12, 0, v42, 4, 1.0, v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTUITurnOnSiriView addConstraint:](self, "addConstraint:", v56);

  }
LABEL_15:
  v57 = *(uint64_t *)((char *)&self->super.super.super.super.isa + v32);
  if (v57)
  {
    v58 = (void *)MEMORY[0x24BDD1628];
    -[VTUITurnOnSiriView footerView](self, "footerView");
    v59 = (NSArray *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v57, 9, 0, v59, 9, 1.0, 0.0);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTUITurnOnSiriView addConstraint:](self, "addConstraint:", v60);

  }
  else
  {
    v114 = 0u;
    v115 = 0u;
    v112 = 0u;
    v113 = 0u;
    v59 = self->_continueButtons;
    v61 = -[NSArray countByEnumeratingWithState:objects:count:](v59, "countByEnumeratingWithState:objects:count:", &v112, v118, 16);
    if (v61)
    {
      v62 = v61;
      v106 = 536;
      v107 = v32;
      v63 = *(_QWORD *)v113;
      do
      {
        for (i = 0; i != v62; ++i)
        {
          if (*(_QWORD *)v113 != v63)
            objc_enumerationMutation(v59);
          v65 = *(_QWORD *)(*((_QWORD *)&v112 + 1) + 8 * i);
          v66 = (void *)MEMORY[0x24BDD1628];
          -[VTUITurnOnSiriView footerView](self, "footerView", v106, v107);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v65, 9, 0, v67, 9, 1.0, 0.0);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          -[VTUITurnOnSiriView addConstraint:](self, "addConstraint:", v68);

        }
        v62 = -[NSArray countByEnumeratingWithState:objects:count:](v59, "countByEnumeratingWithState:objects:count:", &v112, v118, 16);
      }
      while (v62);
      v29 = v106;
      v32 = v107;
    }
  }

  v69 = (void *)MEMORY[0x24BDD1628];
  v70 = *(uint64_t *)((char *)&self->super.super.super.super.isa + v29);
  -[VTUITurnOnSiriView footerView](self, "footerView");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v70, 9, 0, v71, 9, 1.0, 0.0);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUITurnOnSiriView addConstraint:](self, "addConstraint:", v72);

  v73 = (void *)MEMORY[0x24BDD1628];
  v74 = *(uint64_t *)((char *)&self->super.super.super.super.isa + v29);
  -[VTUITurnOnSiriView footerView](self, "footerView");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "skipButtonBaselineBottomMarginPortrait");
  objc_msgSend(v73, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v74, 4, 0, v75, 4, 1.0, -v76);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUITurnOnSiriView addConstraint:](self, "addConstraint:", v77);

  v78 = *(uint64_t *)((char *)&self->super.super.super.super.isa + v32);
  if (v78)
  {
    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", *(Class *)((char *)&self->super.super.super.super.isa + v29), 7, 0, v78, 7, 1.0, 0.0);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTUITurnOnSiriView addConstraint:](self, "addConstraint:", v79);
  }
  else
  {
    -[NSArray firstObject](self->_continueButtons, "firstObject");
    v80 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v80)
      goto LABEL_30;
    v81 = (void *)MEMORY[0x24BDD1628];
    v82 = *(uint64_t *)((char *)&self->super.super.super.super.isa + v29);
    -[NSArray firstObject](self->_continueButtons, "firstObject");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v82, 7, 0, v79, 7, 1.0, 0.0);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTUITurnOnSiriView addConstraint:](self, "addConstraint:", v83);

  }
LABEL_30:
  v84 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v29), "titleLabel");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v85, 7, 0, *(Class *)((char *)&self->super.super.super.super.isa + v29), 7, 1.0, 0.0);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUITurnOnSiriView addConstraint:](self, "addConstraint:", v86);

  v87 = *(Class *)((char *)&self->super.super.super.super.isa + v32);
  if (v87)
  {
    v88 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v3, "turnOnSiriContinueButtonWidth");
    objc_msgSend(v88, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v87, 7, 0, 0, 0, 1.0, v89);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "addConstraint:", v90);

    v91 = *(Class *)((char *)&self->super.super.super.super.isa + v32);
    v92 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v3, "turnOnSiriContinueButtonHeight");
    objc_msgSend(v92, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v91, 8, 0, 0, 0, 1.0, v93);
    v94 = (NSArray *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "addConstraint:", v94);
  }
  else
  {
    v110 = 0u;
    v111 = 0u;
    v108 = 0u;
    v109 = 0u;
    v94 = self->_continueButtons;
    v95 = -[NSArray countByEnumeratingWithState:objects:count:](v94, "countByEnumeratingWithState:objects:count:", &v108, v117, 16);
    if (v95)
    {
      v96 = v95;
      v97 = *(_QWORD *)v109;
      do
      {
        for (j = 0; j != v96; ++j)
        {
          if (*(_QWORD *)v109 != v97)
            objc_enumerationMutation(v94);
          v99 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * j);
          v100 = (void *)MEMORY[0x24BDD1628];
          objc_msgSend(v3, "turnOnSiriContinueButtonWidth");
          objc_msgSend(v100, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v99, 7, 0, 0, 0, 1.0, v101);
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v99, "addConstraint:", v102);

          v103 = (void *)MEMORY[0x24BDD1628];
          objc_msgSend(v3, "turnOnSiriContinueButtonHeight");
          objc_msgSend(v103, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v99, 8, 0, 0, 0, 1.0, v104);
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v99, "addConstraint:", v105);

        }
        v96 = -[NSArray countByEnumeratingWithState:objects:count:](v94, "countByEnumeratingWithState:objects:count:", &v108, v117, 16);
      }
      while (v96);
    }
  }

}

- (id)languageSelectionOfContinueButton:(id)a3
{
  return -[NSArray objectAtIndex:](self->_siriLanguages, "objectAtIndex:", objc_msgSend(a3, "tag"));
}

- (void)_setupContent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  UIButton *continueButton;
  void *v12;
  void *v13;
  UIButton *laterButton;
  void *v15;
  void *v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSArray *obj;
  uint64_t v37;
  VTUITurnOnSiriView *v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uiLocalizedStringForKey:", CFSTR("TEXT_TITLE_CONS"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIEnrollmentBaseView setTitle:](self, "setTitle:", v5);

  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "VTUIDeviceSpecificString:", CFSTR("ASSISTANT_DESCRIPTION_SHORT"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIEnrollmentBaseView setSubtitle:](self, "setSubtitle:", v7);

  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v3;
  if (objc_msgSend(v3, "supportsSideButtonActivation"))
    v9 = CFSTR("ASSISTANT_TRIGGER_INSTRUCTION_SIDE_BUTTON");
  else
    v9 = CFSTR("ASSISTANT_TRIGGER_INSTRUCTION_HOME_BUTTON");
  objc_msgSend(v8, "VTUIDeviceSpecificString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIEnrollmentBaseView setInstructionText:](self, "setInstructionText:", v10);

  continueButton = self->_continueButton;
  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "VTUIDeviceSpecificString:", CFSTR("BUTTON_TURN_ON_SIRI"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTitle:forState:](continueButton, "setTitle:forState:", v13, 0);

  laterButton = self->_laterButton;
  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "VTUIDeviceSpecificString:", CFSTR("BUTTON_CONS_NOT_NOW"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTitle:forState:](laterButton, "setTitle:forState:", v16, 0);

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v38 = self;
  obj = self->_continueButtons;
  v39 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v39)
  {
    v37 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v39; ++i)
      {
        if (*(_QWORD *)v41 != v37)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        -[NSArray objectAtIndex:](v38->_siriLanguages, "objectAtIndex:", objc_msgSend(v18, "tag"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "languageCode");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v21)
        {
          objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "localeIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(MEMORY[0x24BE09200], "sharedInstance");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "localizedCompactNameForSiriLanguage:inDisplayLanguage:", v19, v21);
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = (void *)v24;
        if (v24)
          v26 = (void *)v24;
        else
          v26 = v19;
        v27 = v26;

        v28 = (void *)MEMORY[0x24BDD17C8];
        +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "uiLocalizedStringForKey:", CFSTR("BUTTON_LANG_OPTION"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "uiLocalizedStringForKey:", v27);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v28, "stringWithFormat:", v30, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setTitle:forState:", v33, 0);

      }
      v39 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v39);
  }

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUITurnOnSiriView setBackgroundColor:](v38, "setBackgroundColor:", v34);

}

- (void)layoutSubviews
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)VTUITurnOnSiriView;
  -[VTUIEnrollmentBaseView layoutSubviews](&v2, sel_layoutSubviews);
}

- (BOOL)showPrivacyTextView
{
  return 1;
}

- (id)footerView
{
  UIView *footerView;
  UIView *v4;
  UIView *v5;

  footerView = self->_footerView;
  if (!footerView)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    v5 = self->_footerView;
    self->_footerView = v4;

    footerView = self->_footerView;
  }
  return footerView;
}

- (void)prepareForLastTimeShown
{
  UIButton *laterButton;
  void *v3;
  id v4;

  laterButton = self->_laterButton;
  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "VTUIDeviceSpecificString:", CFSTR("BUTTON_CONS_LATER"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTitle:forState:](laterButton, "setTitle:forState:", v3, 0);

}

- (double)imageOffsetFromTop
{
  void *v2;
  double v3;
  double v4;

  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "turnOnSiriImageOffsetFromTop");
  v4 = v3;

  return v4;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_stateViewDelegate);
  objc_msgSend(WeakRetained, "aboutSelectedInTurnOnSiriView:", self);

  return 0;
}

- (VTUITurnOnSiriViewDelegate)stateViewDelegate
{
  return (VTUITurnOnSiriViewDelegate *)objc_loadWeakRetained((id *)&self->_stateViewDelegate);
}

- (void)setStateViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_stateViewDelegate, a3);
}

- (UIButton)laterButton
{
  return self->_laterButton;
}

- (UIButton)continueButton
{
  return self->_continueButton;
}

- (NSArray)continueButtons
{
  return self->_continueButtons;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_continueButtons, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_laterButton, 0);
  objc_destroyWeak((id *)&self->_stateViewDelegate);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_siriLanguages, 0);
}

@end
