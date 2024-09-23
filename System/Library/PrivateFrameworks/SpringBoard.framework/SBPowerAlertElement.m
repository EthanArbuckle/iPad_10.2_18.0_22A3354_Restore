@implementation SBPowerAlertElement

- (SBPowerAlertElement)initWithIdentifier:(id)a3 style:(unint64_t)a4 batteryPercentage:(double)a5 lowPowerModeEnabled:(BOOL)a6 action:(id)a7
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  double v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  SBPowerAlertElement *v30;
  void *v31;
  SBPowerAlertElement *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  SBPowerAlertElement *v42;
  SBPowerAlertElement *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v53;
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
  id obj;
  id v74;
  id v75;
  void *v76;
  objc_super v77;
  CGAffineTransform v78;
  _QWORD v79[10];

  v79[8] = *MEMORY[0x1E0C80C00];
  v75 = a3;
  v74 = a7;
  v11 = objc_alloc_init(MEMORY[0x1E0DAC6A8]);
  v12 = objc_alloc_init(MEMORY[0x1E0CEA700]);
  v53 = a4;
  -[SBPowerAlertElement _leadingTextForStyle:](self, "_leadingTextForStyle:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v13);

  objc_msgSend(v12, "text");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAccessibilityLabel:", v14);

  objc_msgSend(MEMORY[0x1E0CEA5E8], "sbui_systemAperturePreferredFontForTextStyle:", 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFont:", v15);

  obj = v12;
  v76 = v11;
  v72 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAC6B0]), "initWithView:", v12);
  objc_msgSend(v11, "setLeadingContentViewProvider:");
  v16 = objc_alloc(MEMORY[0x1E0CEABB0]);
  -[SBPowerAlertElement _trailingViewWidth](self, "_trailingViewWidth");
  v18 = (void *)objc_msgSend(v16, "initWithFrame:", 0.0, 0.0, v17, 37.333);
  v19 = objc_alloc_init(MEMORY[0x1E0CEA700]);
  objc_msgSend(v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v18, "addSubview:", v19);
  v20 = objc_alloc(MEMORY[0x1E0D01910]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v20, "initWithPackageName:inBundle:", CFSTR("Battery-D73"), v21);

  objc_msgSend(v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
  {
    CGAffineTransformMakeScale(&v78, -1.0, 1.0);
    objc_msgSend(v22, "setTransform:", &v78);
  }
  objc_msgSend(v18, "addSubview:", v22);
  v59 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v19, "centerYAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "centerYAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "constraintEqualToAnchor:", v67);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v79[0] = v66;
  v71 = v19;
  objc_msgSend(v19, "trailingAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "leadingAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "constraintEqualToAnchor:constant:", v64, -2.0);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v79[1] = v63;
  objc_msgSend(v22, "centerYAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "centerYAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "constraintEqualToAnchor:", v61);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v79[2] = v60;
  objc_msgSend(v22, "trailingAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "trailingAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "constraintEqualToAnchor:", v57);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v79[3] = v56;
  objc_msgSend(v22, "widthAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "constraintEqualToConstant:", 42.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v79[4] = v23;
  v70 = v22;
  objc_msgSend(v22, "heightAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToConstant:", 21.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v79[5] = v25;
  objc_msgSend(v18, "widthAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBPowerAlertElement _trailingViewWidth](self, "_trailingViewWidth");
  objc_msgSend(v26, "constraintEqualToConstant:");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v79[6] = v27;
  objc_msgSend(v18, "heightAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToConstant:", 37.333);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v79[7] = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 8);
  v30 = self;
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "activateConstraints:", v31);

  v32 = v30;
  v33 = v18;

  v34 = v76;
  v69 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAC6B0]), "initWithView:", v18);
  objc_msgSend(v76, "setTrailingContentViewProvider:");
  v35 = objc_alloc(MEMORY[0x1E0D01910]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_msgSend(v35, "initWithPackageName:inBundle:", CFSTR("Battery-Minimal-D73"), v36);

  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAC6B0]), "initWithView:", v37);
  objc_msgSend(v76, "setMinimalContentViewProvider:", v38);
  v39 = v74;
  if (v74)
  {
    v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAC690]), "initWithDefaultTextActionConfigurationWithAction:", v74);
    objc_msgSend(v76, "setActionContentViewProvider:", v40);

  }
  v77.receiver = v32;
  v77.super_class = (Class)SBPowerAlertElement;
  v41 = v75;
  v42 = -[SBSystemApertureProvidedContentElement initWithIdentifier:contentProvider:](&v77, sel_initWithIdentifier_contentProvider_, v75, v76);
  v43 = v42;
  v44 = obj;
  v45 = v70;
  v46 = v71;
  if (v42)
  {
    v42->_style = v53;
    v42->_batteryPercentage = a5;
    v42->_lowPowerModeEnabled = a6;
    objc_storeStrong((id *)&v42->_leadingLabel, obj);
    objc_storeStrong((id *)&v43->_trailingBatteryLabel, v71);
    objc_storeStrong((id *)&v43->_trailingBatteryIconPackageView, v70);
    objc_storeStrong((id *)&v43->_minimalBatteryIconPackageView, v37);
    -[SBSystemApertureProvidedContentElement setMinimumSupportedLayoutMode:](v43, "setMinimumSupportedLayoutMode:", -1);
    objc_msgSend(v76, "actionContentViewProvider");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v38;
    v49 = v33;
    if (v47)
      v50 = 3;
    else
      v50 = 2;

    v51 = v50;
    v33 = v49;
    v38 = v48;
    v39 = v74;
    v44 = obj;
    v41 = v75;
    v46 = v71;
    v45 = v70;
    v34 = v76;
    -[SBSystemApertureProvidedContentElement setMaximumSupportedLayoutMode:](v43, "setMaximumSupportedLayoutMode:", v51);
    -[SBSystemApertureProvidedContentElement setPreferredLayoutMode:](v43, "setPreferredLayoutMode:", 2);
    -[SBPowerAlertElement _updateBatteryContent](v43, "_updateBatteryContent");
  }

  return v43;
}

- (BOOL)isProvidedViewConcentric:(id)a3 inLayoutMode:(int64_t)a4
{
  id v5;
  id v6;

  v5 = a3;
  -[SBPowerAlertElement leadingLabel](self, "leadingLabel");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  return v6 != v5;
}

- (NSDirectionalEdgeInsets)preferredEdgeOutsetsForLayoutMode:(int64_t)a3 suggestedOutsets:(NSDirectionalEdgeInsets)a4 maximumOutsets:(NSDirectionalEdgeInsets)a5
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;
  NSDirectionalEdgeInsets result;

  v11.receiver = self;
  v11.super_class = (Class)SBPowerAlertElement;
  -[SBSystemApertureProvidedContentElement preferredEdgeOutsetsForLayoutMode:suggestedOutsets:maximumOutsets:](&v11, sel_preferredEdgeOutsetsForLayoutMode_suggestedOutsets_maximumOutsets_, a4.top, a4.leading, a4.bottom, a4.trailing, a5.top, a5.leading, a5.bottom, a5.trailing);
  if (v7 >= v9)
    v10 = v9;
  else
    v10 = v7;
  if (a3 == 2)
  {
    v7 = v10;
    v9 = v10;
  }
  result.trailing = v9;
  result.bottom = v8;
  result.leading = v7;
  result.top = v6;
  return result;
}

- (UIColor)keyColor
{
  return self->_keyColor;
}

- (double)preferredAlertingDuration:(double)result
{
  if (self->_style == 1 && result < 5.0)
    return 5.0;
  return result;
}

- (BOOL)shouldSuppressElementWhileProximityReaderPresent
{
  return 0;
}

- (void)setBatteryPercentage:(double)a3
{
  if (self->_batteryPercentage != a3)
  {
    self->_batteryPercentage = a3;
    -[SBPowerAlertElement _updateBatteryContent](self, "_updateBatteryContent");
  }
}

- (void)_updateBatteryContent
{
  double v3;
  double v4;
  void *v5;
  unint64_t v6;
  _BOOL4 v7;
  int v8;
  void *v9;
  const __CFString *v10;
  int v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  const __CFString *v52;
  _QWORD v53[2];

  v53[1] = *MEMORY[0x1E0C80C00];
  -[SBPowerAlertElement batteryPercentage](self, "batteryPercentage");
  v4 = v3;
  -[SBPowerAlertElement trailingBatteryIconPackageView](self, "trailingBatteryIconPackageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBPowerAlertElement _updateBatteryIconFillAreaForPackageView:withBatteryPercentage:](self, "_updateBatteryIconFillAreaForPackageView:withBatteryPercentage:", v5, v4);
  -[SBPowerAlertElement minimalBatteryIconPackageView](self, "minimalBatteryIconPackageView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBPowerAlertElement _updateBatteryIconFillAreaForPackageView:withBatteryPercentage:](self, "_updateBatteryIconFillAreaForPackageView:withBatteryPercentage:", v4);
  v6 = -[SBPowerAlertElement style](self, "style");
  v7 = -[SBPowerAlertElement isLowPowerModeEnabled](self, "isLowPowerModeEnabled");
  objc_msgSend(MEMORY[0x1E0CEA9E8], "lowBatteryLevel");
  v8 = BSFloatLessThanOrEqualToFloat();
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.992156863, 0.811764706, 0.345098039, 1.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = CFSTR("yellow");
  }
  else
  {
    if (v6)
      v11 = 0;
    else
      v11 = v8;
    if (v11 == 1)
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.988235294, 0.145098039, 0.231372549, 1.0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("red");
    }
    else
    {
      if (v6 == 1)
        v12 = v8;
      else
        v12 = 0;
      if (v12 == 1)
      {
        objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.988235294, 0.145098039, 0.231372549, 1.0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = CFSTR("red-low");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.333333333, 1.0, 0.670588235, 1.0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = CFSTR("green");
      }
    }
  }
  v44 = v5;
  objc_msgSend(v5, "setState:animated:", v10, 1);
  -[SBPowerAlertElement _updateMinimalViewToState:withDelay:](self, "_updateMinimalViewToState:withDelay:", v10, v6 == 0);
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_keyColor, v9);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = CFSTR("SBSystemApertureNotificationUserInfoElementKey");
    v53[0] = self;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, &v52, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "postNotificationName:object:userInfo:", CFSTR("SBSystemApertureElementKeyColorDidInvalidateNotification"), 0, v14);

  }
  -[SBPowerAlertElement trailingBatteryLabel](self, "trailingBatteryLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTextColor:", v9);
  v16 = (void *)SBApp;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "formattedPercentStringForNumber:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_alloc(MEMORY[0x1E0CB3778]);
  v50 = *MEMORY[0x1E0CEA098];
  v20 = v50;
  objc_msgSend(MEMORY[0x1E0CEA5E8], "sbui_systemAperturePreferredFontForTextStyle:", 5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v19, "initWithString:attributes:", v18, v22);

  v24 = objc_alloc(MEMORY[0x1E0CB3498]);
  v48 = v20;
  objc_msgSend(MEMORY[0x1E0CEA5E8], "sbui_systemAperturePreferredFontForTextStyle:", 6);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v25;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v24, "initWithString:attributes:", CFSTR("%"), v26);

  v28 = objc_msgSend(v18, "rangeOfString:", CFSTR("%"));
  if (v28 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v30 = v28;
    objc_msgSend(v23, "replaceCharactersInRange:withAttributedString:", v28, v29, v27);
    v31 = objc_alloc(MEMORY[0x1E0CB3498]);
    v46 = v20;
    objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", 2.0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v32;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)objc_msgSend(v31, "initWithString:attributes:", CFSTR(" "), v33);

    objc_msgSend(v23, "insertAttributedString:atIndex:", v34, v30);
  }
  objc_msgSend(v15, "setAttributedText:", v23);
  objc_msgSend(v23, "accessibilityLabel");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAccessibilityLabel:", v35);

  objc_msgSend(v45, "publishedObjectWithName:", CFSTR("battery percentage"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_opt_class();
  v38 = v36;
  if (v37)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v39 = v38;
    else
      v39 = 0;
  }
  else
  {
    v39 = 0;
  }
  v40 = v39;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", round(v4 * 100.0));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)SBApp, "formattedDecimalStringForNumber:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setString:", v42);
  objc_msgSend(MEMORY[0x1E0CEA5E8], "sbui_systemAperturePreferredFontForTextStyle:", 5);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setFont:", v43);

}

- (void)_updateBatteryIconFillAreaForPackageView:(id)a3 withBatteryPercentage:(double)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;

  objc_msgSend(a3, "publishedObjectWithName:", CFSTR("Fill"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();
  v17 = v6;
  if (v7)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v17;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  objc_msgSend(v9, "bounds");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[SBPowerAlertElement _batteryFillWidthForBatteryPercentage:](self, "_batteryFillWidthForBatteryPercentage:", a4);
  objc_msgSend(v9, "setBounds:", v11, v13, v16, v15);

}

- (id)_leadingTextForStyle:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;

  if (a3 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("LOW_BATT_TITLE_COMPACT");
    goto LABEL_5;
  }
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("CHARGING_COMPACT");
LABEL_5:
    objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1E8EC7EC0, CFSTR("SpringBoard"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (double)_batteryFillWidthForBatteryPercentage:(double)a3
{
  int IsOne;
  double result;

  IsOne = BSFloatIsOne();
  result = a3 * 81.0 + 9.0;
  if (IsOne)
    return 105.0;
  return result;
}

- (double)_trailingViewWidth
{
  unint64_t v2;
  NSObject *v4;

  v2 = SBHScreenTypeForCurrentDevice() - 21;
  if (v2 < 8)
    return dbl_1D0E89098[v2];
  SBLogStatusBarish();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    -[SBPowerAlertElement _trailingViewWidth].cold.1(v4);

  return 0.0;
}

- (void)_updateMinimalViewToState:(id)a3 withDelay:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  dispatch_time_t v10;
  _QWORD v11[5];
  id v12;

  v4 = a4;
  v6 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__SBPowerAlertElement__updateMinimalViewToState_withDelay___block_invoke;
  v11[3] = &unk_1E8E9E820;
  v11[4] = self;
  v12 = v6;
  v7 = v6;
  v8 = MEMORY[0x1D17E5550](v11);
  v9 = (void *)v8;
  if (v4)
  {
    v10 = dispatch_time(0, 500000000);
    dispatch_after(v10, MEMORY[0x1E0C80D38], v9);
  }
  else
  {
    (*(void (**)(uint64_t))(v8 + 16))(v8);
  }

}

void __59__SBPowerAlertElement__updateMinimalViewToState_withDelay___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "minimalBatteryIconPackageView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setState:animated:", *(_QWORD *)(a1 + 40), 1);

}

- (double)batteryPercentage
{
  return self->_batteryPercentage;
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (BOOL)isLowPowerModeEnabled
{
  return self->_lowPowerModeEnabled;
}

- (void)setLowPowerModeEnabled:(BOOL)a3
{
  self->_lowPowerModeEnabled = a3;
}

- (UILabel)leadingLabel
{
  return self->_leadingLabel;
}

- (void)setLeadingLabel:(id)a3
{
  objc_storeStrong((id *)&self->_leadingLabel, a3);
}

- (UILabel)trailingBatteryLabel
{
  return self->_trailingBatteryLabel;
}

- (void)setTrailingBatteryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_trailingBatteryLabel, a3);
}

- (BSUICAPackageView)trailingBatteryIconPackageView
{
  return self->_trailingBatteryIconPackageView;
}

- (void)setTrailingBatteryIconPackageView:(id)a3
{
  objc_storeStrong((id *)&self->_trailingBatteryIconPackageView, a3);
}

- (BSUICAPackageView)minimalBatteryIconPackageView
{
  return self->_minimalBatteryIconPackageView;
}

- (void)setMinimalBatteryIconPackageView:(id)a3
{
  objc_storeStrong((id *)&self->_minimalBatteryIconPackageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minimalBatteryIconPackageView, 0);
  objc_storeStrong((id *)&self->_trailingBatteryIconPackageView, 0);
  objc_storeStrong((id *)&self->_trailingBatteryLabel, 0);
  objc_storeStrong((id *)&self->_leadingLabel, 0);
  objc_storeStrong((id *)&self->_keyColor, 0);
}

- (void)_trailingViewWidth
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1D0540000, log, OS_LOG_TYPE_FAULT, "Unexpected screen type displaying power alert element", v1, 2u);
}

@end
