@implementation VTUIEnrollmentLanguageOptionsView

- (VTUIEnrollmentLanguageOptionsView)initWithFrame:(CGRect)a3
{
  VTUIEnrollmentLanguageOptionsView *v3;
  VTUIEnrollmentLanguageOptionsView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VTUIEnrollmentLanguageOptionsView;
  v3 = -[VTUIEnrollmentBaseView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[VTUIEnrollmentLanguageOptionsView _setupContent](v3, "_setupContent");
  return v4;
}

- (void)_setupContent
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "enrollmentMode");

  if (v4 == 4)
    v5 = 0;
  else
    v5 = CFSTR("TEXT_TITLE_LANGUAGE_OPTIONS");
  if (v4 == 4)
    v6 = 0;
  else
    v6 = CFSTR("ASSISTANT_LANGUAGE_OPTIONS_DESCRIPTION");
  +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uiLocalizedStringForKey:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIEnrollmentBaseView setTitle:](self, "setTitle:", v8);

  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "VTUIDeviceSpecificString:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIEnrollmentBaseView setSubtitle:](self, "setSubtitle:", v9);

}

- (id)languageSelectionOfContinueButton:(id)a3
{
  return -[NSArray objectAtIndex:](self->_continueButtonsLanguages, "objectAtIndex:", objc_msgSend(a3, "tag"));
}

- (void)setContinueButtonLanguages:(id)a3
{
  objc_storeStrong((id *)&self->_continueButtonsLanguages, a3);
  -[VTUIEnrollmentLanguageOptionsView _addContinueButtonsToFooter](self, "_addContinueButtonsToFooter");
}

- (void)_addContinueButtonsToFooter
{
  VTUIEnrollmentLanguageOptionsView *v2;
  void *v3;
  NSMutableArray *v4;
  NSMutableArray *continueButtons;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  VTUIEnrollmentLanguageOptionsView *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
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
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  unint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
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
  _QWORD v59[4];

  v2 = self;
  v59[3] = *MEMORY[0x24BDAC8D0];
  -[VTUIEnrollmentLanguageOptionsView footerView](self, "footerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    continueButtons = v2->_continueButtons;
    v2->_continueButtons = v4;

    if (-[NSArray count](v2->_continueButtonsLanguages, "count"))
    {
      v6 = 0;
      do
      {
        +[VTUIButton _vtuiButtonWithPrimaryStyle](VTUIButton, "_vtuiButtonWithPrimaryStyle");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        objc_msgSend(v7, "setTag:", v6);
        -[NSArray objectAtIndexedSubscript:](v2->_continueButtonsLanguages, "objectAtIndexedSubscript:", v6);
        v8 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "languageCode");
        v10 = objc_claimAutoreleasedReturnValue();

        v11 = v2;
        if (!v10)
        {
          objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "localeIdentifier");
          v10 = objc_claimAutoreleasedReturnValue();

        }
        v55 = (void *)v10;
        objc_msgSend(MEMORY[0x24BE09200], "sharedInstance");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "localizedCompactNameForSiriLanguage:inDisplayLanguage:", v8, v10);
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)v14;
        if (v14)
          v16 = (void *)v14;
        else
          v16 = (void *)v8;
        v17 = v16;

        v18 = (void *)MEMORY[0x24BDD17C8];
        v54 = (void *)v8;
        +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "uiLocalizedStringForKey:", CFSTR("BUTTON_LANG_OPTION"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "uiLocalizedStringForKey:", v17);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v18, "stringWithFormat:", v20, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setTitle:forState:", v23, 0);

        -[UIView addSubview:](v11->_footerView, "addSubview:", v7);
        v52 = (void *)MEMORY[0x24BDD1628];
        objc_msgSend(v7, "centerXAnchor");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView centerXAnchor](v11->_footerView, "centerXAnchor");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "constraintEqualToAnchor:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v59[0] = v25;
        objc_msgSend(v7, "widthAnchor");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "footerButtonMaximumWidth");
        objc_msgSend(v26, "constraintEqualToConstant:");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v59[1] = v27;
        objc_msgSend(v7, "heightAnchor");
        v2 = v11;
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "primaryButtonHeight");
        objc_msgSend(v28, "constraintEqualToConstant:");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v59[2] = v29;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v59, 3);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "activateConstraints:", v30);

        -[NSMutableArray addObject:](v2->_continueButtons, "addObject:", v7);
        ++v6;
      }
      while (-[NSArray count](v2->_continueButtonsLanguages, "count") > v6);
    }
    v31 = (void *)MEMORY[0x24BDD1628];
    -[NSMutableArray firstObject](v2->_continueButtons, "firstObject");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "topAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](v2->_footerView, "topAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "continueButtonOffset");
    objc_msgSend(v33, "constraintEqualToAnchor:constant:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v35;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v58, 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "activateConstraints:", v36);

    -[NSMutableArray firstObject](v2->_continueButtons, "firstObject");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)-[NSMutableArray count](v2->_continueButtons, "count") < 2)
    {
      v39 = v37;
    }
    else
    {
      v38 = 1;
      do
      {
        -[NSMutableArray objectAtIndexedSubscript:](v2->_continueButtons, "objectAtIndexedSubscript:", v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = (void *)MEMORY[0x24BDD1628];
        objc_msgSend(v39, "topAnchor");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "bottomAnchor");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v42, 1.0);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = v43;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v57, 1);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "activateConstraints:", v44);

        if (v38 == -[NSMutableArray count](v2->_continueButtons, "count") - 1)
        {
          v45 = (void *)MEMORY[0x24BDD1628];
          objc_msgSend(v39, "bottomAnchor");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIView bottomAnchor](v2->_footerView, "bottomAnchor");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "continueButtonOffset");
          objc_msgSend(v46, "constraintEqualToAnchor:constant:", v47, -v48);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = v49;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v56, 1);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "activateConstraints:", v50);

        }
        ++v38;
        v37 = v39;
      }
      while (-[NSMutableArray count](v2->_continueButtons, "count") > v38);
    }

  }
}

- (BOOL)showPrivacyTextView
{
  void *v2;
  char v3;

  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isBuddyOrFollowUp");

  return v3;
}

- (id)footerView
{
  void *v3;
  UIView *footerView;
  UIView *v5;
  UIView *v6;

  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isBuddyOrFollowUp"))
  {
    footerView = self->_footerView;

    if (!footerView)
    {
      v5 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
      v6 = self->_footerView;
      self->_footerView = v5;

      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_footerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    }
  }
  else
  {

  }
  return self->_footerView;
}

- (NSMutableArray)continueButtons
{
  return self->_continueButtons;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_continueButtons, 0);
  objc_storeStrong((id *)&self->_continueButtonsLanguages, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
}

@end
