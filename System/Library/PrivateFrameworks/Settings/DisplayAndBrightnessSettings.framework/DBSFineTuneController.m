@implementation DBSFineTuneController

- (DBSFineTuneController)init
{
  DBSFineTuneController *v2;
  NSNumberFormatter *v3;
  NSNumberFormatter *xyNumberFormatter;
  NSNumberFormatter *v5;
  NSNumberFormatter *luminanceNumberFormatter;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DBSFineTuneController;
  v2 = -[DBSFineTuneController init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x24BDD16F0]);
    xyNumberFormatter = v2->_xyNumberFormatter;
    v2->_xyNumberFormatter = v3;

    -[NSNumberFormatter setNumberStyle:](v2->_xyNumberFormatter, "setNumberStyle:", 1);
    v5 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x24BDD16F0]);
    luminanceNumberFormatter = v2->_luminanceNumberFormatter;
    v2->_luminanceNumberFormatter = v5;

    -[NSNumberFormatter setNumberStyle:](v2->_luminanceNumberFormatter, "setNumberStyle:", 1);
    -[NSNumberFormatter setRoundingMode:](v2->_luminanceNumberFormatter, "setRoundingMode:", 2);
  }
  return v2;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)DBSFineTuneController;
  -[DBSFineTuneController viewDidLoad](&v10, sel_viewDidLoad);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_userDidTapCancel_);
  -[DBSFineTuneController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLeftBarButtonItem:", v3);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_userDidTapDone_);
  -[DBSFineTuneController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRightBarButtonItem:", v5);

  -[DBSFineTuneController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rightBarButtonItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnabled:", 0);

  DBS_LocalizedStringForDisplays(CFSTR("FINE_TUNE"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSFineTuneController setTitle:](self, "setTitle:", v9);

}

- (id)specifiers
{
  void *v3;
  void *v4;
  PSSpecifier *v5;
  PSSpecifier *restoreDefaultsSpecifier;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  const char *v14;
  void *v15;
  void *v16;
  void *v17;
  PSSpecifier *v18;
  PSSpecifier *measuredWhitePointXSpecifier;
  PSSpecifier *v20;
  PSSpecifier *measuredWhitePointYSpecifier;
  PSSpecifier *v22;
  PSSpecifier *measuredLuminanceSpecifier;
  PSSpecifier *v24;
  PSSpecifier *targetWhitePointXSpecifier;
  PSSpecifier *v26;
  PSSpecifier *targetWhitePointYSpecifier;
  PSSpecifier *v28;
  PSSpecifier *targetLuminanceSpecifier;
  PSSpecifier *v30;
  PSSpecifier *introductionSpecifier;
  PSSpecifier *v32;
  PSSpecifier *fineTuneTargetGroupSpecifier;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  PSSpecifier *v39;
  objc_class *v40;
  void *v41;
  PSSpecifier *v42;
  void *v43;
  PSSpecifier *v44;
  void *v45;
  void *v46;
  void *v48;
  uint64_t v49;
  NSRange v50;

  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]);
  if (!v3)
  {
    v49 = (int)*MEMORY[0x24BE756E0];
    -[DBSFineTuneController loadSpecifiersFromPlistName:target:](self, "loadSpecifiersFromPlistName:target:", CFSTR("FineTune"), self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "specifierForID:", CFSTR("RESTORE_DEFAULTS"));
    v5 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    restoreDefaultsSpecifier = self->_restoreDefaultsSpecifier;
    self->_restoreDefaultsSpecifier = v5;

    objc_msgSend(MEMORY[0x24BDE5660], "mainDisplay");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentPreset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "userAdjustment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "xDelta");
    v48 = v9;
    if (v10 == 0.0 && (objc_msgSend(v9, "yDelta"), v11 == 0.0) && (objc_msgSend(v9, "luminanceScale"), v12 == 1.0))
    {
      -[PSSpecifier setObject:forKeyedSubscript:](self->_restoreDefaultsSpecifier, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);
    }
    else
    {
      objc_msgSend(v4, "specifierForID:", CFSTR("RESTORE_DEFAULTS_GROUP"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = NSSelectorFromString(CFSTR("timestamp"));
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v15 = (void *)MEMORY[0x24BDBCE60];
        objc_msgSend(v9, v14);
        objc_msgSend(v15, "dateWithTimeIntervalSince1970:");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1500], "localizedStringFromDate:dateStyle:timeStyle:", v16, 3, 3);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v17, *MEMORY[0x24BE75A68]);

      }
    }
    objc_msgSend(v4, "specifierForID:", CFSTR("MEASURED_WHITE_POINT_X"));
    v18 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    measuredWhitePointXSpecifier = self->_measuredWhitePointXSpecifier;
    self->_measuredWhitePointXSpecifier = v18;

    objc_msgSend(v4, "specifierForID:", CFSTR("MEASURED_WHITE_POINT_Y"));
    v20 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    measuredWhitePointYSpecifier = self->_measuredWhitePointYSpecifier;
    self->_measuredWhitePointYSpecifier = v20;

    objc_msgSend(v4, "specifierForID:", CFSTR("MEASURED_LUMINANCE"));
    v22 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    measuredLuminanceSpecifier = self->_measuredLuminanceSpecifier;
    self->_measuredLuminanceSpecifier = v22;

    objc_msgSend(v4, "specifierForID:", CFSTR("TARGET_WHITE_POINT_X"));
    v24 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    targetWhitePointXSpecifier = self->_targetWhitePointXSpecifier;
    self->_targetWhitePointXSpecifier = v24;

    objc_msgSend(v4, "specifierForID:", CFSTR("TARGET_WHITE_POINT_Y"));
    v26 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    targetWhitePointYSpecifier = self->_targetWhitePointYSpecifier;
    self->_targetWhitePointYSpecifier = v26;

    objc_msgSend(v4, "specifierForID:", CFSTR("TARGET_LUMINANCE"));
    v28 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    targetLuminanceSpecifier = self->_targetLuminanceSpecifier;
    self->_targetLuminanceSpecifier = v28;

    objc_msgSend(v4, "specifierForID:", CFSTR("INTRODUCTION"));
    v30 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    introductionSpecifier = self->_introductionSpecifier;
    self->_introductionSpecifier = v30;

    objc_msgSend(v4, "specifierForID:", CFSTR("TARGET_GROUP"));
    v32 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    fineTuneTargetGroupSpecifier = self->_fineTuneTargetGroupSpecifier;
    self->_fineTuneTargetGroupSpecifier = v32;

    v34 = *MEMORY[0x24BE759B0];
    -[PSSpecifier setObject:forKeyedSubscript:](self->_measuredWhitePointXSpecifier, "setObject:forKeyedSubscript:", &unk_24F02FBA8, *MEMORY[0x24BE759B0]);
    v35 = *MEMORY[0x24BE759A8];
    -[PSSpecifier setObject:forKeyedSubscript:](self->_measuredWhitePointXSpecifier, "setObject:forKeyedSubscript:", &unk_24F02FBB8, *MEMORY[0x24BE759A8]);
    -[PSSpecifier setObject:forKeyedSubscript:](self->_measuredWhitePointYSpecifier, "setObject:forKeyedSubscript:", &unk_24F02FBC8, v34);
    -[PSSpecifier setObject:forKeyedSubscript:](self->_measuredWhitePointYSpecifier, "setObject:forKeyedSubscript:", &unk_24F02FBD8, v35);
    -[PSSpecifier setObject:forKeyedSubscript:](self->_measuredLuminanceSpecifier, "setObject:forKeyedSubscript:", &unk_24F02FBE8, v34);
    -[PSSpecifier setObject:forKeyedSubscript:](self->_measuredLuminanceSpecifier, "setObject:forKeyedSubscript:", &unk_24F02FBF8, v35);
    -[PSSpecifier setObject:forKeyedSubscript:](self->_targetWhitePointXSpecifier, "setObject:forKeyedSubscript:", &unk_24F02FBA8, v34);
    -[PSSpecifier setObject:forKeyedSubscript:](self->_targetWhitePointXSpecifier, "setObject:forKeyedSubscript:", &unk_24F02FBB8, v35);
    -[PSSpecifier setObject:forKeyedSubscript:](self->_targetWhitePointYSpecifier, "setObject:forKeyedSubscript:", &unk_24F02FBC8, v34);
    -[PSSpecifier setObject:forKeyedSubscript:](self->_targetWhitePointYSpecifier, "setObject:forKeyedSubscript:", &unk_24F02FBD8, v35);
    -[PSSpecifier setObject:forKeyedSubscript:](self->_targetLuminanceSpecifier, "setObject:forKeyedSubscript:", &unk_24F02FBE8, v34);
    -[PSSpecifier setObject:forKeyedSubscript:](self->_targetLuminanceSpecifier, "setObject:forKeyedSubscript:", &unk_24F02FBF8, v35);
    DBS_LocalizedStringForFineTune(CFSTR("INTRO_MAIN_TEXT"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    DBS_LocalizedStringForFineTune(CFSTR("INTRO_LINK_TEXT"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@\n%@"), v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = self->_introductionSpecifier;
    v40 = (objc_class *)objc_opt_class();
    NSStringFromClass(v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpecifier setProperty:forKey:](v39, "setProperty:forKey:", v41, *MEMORY[0x24BE75A30]);

    -[PSSpecifier setProperty:forKey:](self->_introductionSpecifier, "setProperty:forKey:", v38, *MEMORY[0x24BE75A58]);
    v42 = self->_introductionSpecifier;
    v50.location = objc_msgSend(v38, "rangeOfString:", v37);
    NSStringFromRange(v50);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpecifier setProperty:forKey:](v42, "setProperty:forKey:", v43, *MEMORY[0x24BE75A40]);

    v44 = self->_introductionSpecifier;
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", self);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpecifier setProperty:forKey:](v44, "setProperty:forKey:", v45, *MEMORY[0x24BE75A50]);

    -[PSSpecifier setProperty:forKey:](self->_introductionSpecifier, "setProperty:forKey:", CFSTR("openFineTuneHelpLink"), *MEMORY[0x24BE75A38]);
    v46 = *(Class *)((char *)&self->super.super.super.super.super.isa + v49);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v49) = (Class)v4;

    v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + v49);
  }
  return v3;
}

- (void)userDidTapCancel:(id)a3
{
  id v3;

  -[DBSFineTuneController navigationController](self, "navigationController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)userDidTapDone:(id)a3
{
  CADisplayPreset *currentPreset;
  void *v5;
  id v6;

  currentPreset = self->_currentPreset;
  objc_msgSend(MEMORY[0x24BDE5660], "mainDisplay", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCurrentPreset:", currentPreset);

  -[DBSFineTuneController navigationController](self, "navigationController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)updateTargetLuminanceValidationRange
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  float64x2_t v30;
  double WhitepointShiftLuminanceLoss;
  double v33;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  PSSpecifier *targetLuminanceSpecifier;
  double v46;
  double v47;
  double v48;
  double v49;
  id v50;

  objc_msgSend(MEMORY[0x24BDE5660], "mainDisplay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentPreset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userAdjustmentCommand");
  v50 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v50, "minXDelta");
  v6 = v5;
  objc_msgSend(v50, "userAdjustment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "xDelta");
  v9 = v6 - v8;

  objc_msgSend(v50, "maxXDelta");
  v11 = v10;
  objc_msgSend(v50, "userAdjustment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "xDelta");
  v14 = v11 - v13;

  objc_msgSend(v50, "minYDelta");
  v49 = v15;
  objc_msgSend(v50, "userAdjustment");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "yDelta");
  v18 = v17;

  objc_msgSend(v50, "maxYDelta");
  v20 = v19;
  objc_msgSend(v50, "userAdjustment");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "yDelta");
  v23 = v22;

  -[NSNumber doubleValue](self->_targetWhitePointX, "doubleValue");
  v25 = v24;
  -[NSNumber doubleValue](self->_measuredWhitePointX, "doubleValue");
  v27 = v25 - v26;
  -[NSNumber doubleValue](self->_targetWhitePointY, "doubleValue");
  v29 = v28;
  -[NSNumber doubleValue](self->_measuredWhitePointY, "doubleValue");
  WhitepointShiftLuminanceLoss = 1.0;
  if (v9 + -0.000001 < v27 && v14 + 0.000001 > v27)
  {
    v33 = v29 - v30.f64[0];
    if (v49 - v18 + -0.000001 < v29 - v30.f64[0] && v20 - v23 + 0.000001 > v33)
    {
      v30.f64[0] = v27;
      WhitepointShiftLuminanceLoss = GetWhitepointShiftLuminanceLoss(v30, v33);
    }
  }
  objc_msgSend(v50, "minLuminanceScale");
  v36 = v35;
  objc_msgSend(v50, "userAdjustment");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "luminanceScale");
  v39 = v38;

  objc_msgSend(v50, "maxLuminanceScale");
  v41 = v40;
  objc_msgSend(v50, "userAdjustment");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "luminanceScale");
  v44 = v43;

  if (numberInSpecifierValidationRange(self->_measuredLuminance, self->_measuredLuminanceSpecifier))
  {
    -[NSNumber doubleValue](self->_measuredLuminance, "doubleValue");
    targetLuminanceSpecifier = self->_targetLuminanceSpecifier;
    v47 = WhitepointShiftLuminanceLoss * v41 / v44 * v46;
    v48 = WhitepointShiftLuminanceLoss * v36 / v39 * v46;
  }
  else
  {
    targetLuminanceSpecifier = self->_targetLuminanceSpecifier;
    v48 = 40.0;
    v47 = 1200.0;
  }
  updateSpecifierValidationRange(targetLuminanceSpecifier, v48, v47);
  -[DBSFineTuneController reloadSpecifier:](self, "reloadSpecifier:", self->_targetLuminanceSpecifier);

}

- (void)updateValidationRanges
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  PSSpecifier *targetWhitePointXSpecifier;
  double v26;
  double v27;
  double v28;
  PSSpecifier *targetWhitePointYSpecifier;
  double v30;
  double v31;
  double v32;
  id v33;

  objc_msgSend(MEMORY[0x24BDE5660], "mainDisplay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentPreset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userAdjustmentCommand");
  v33 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v33, "minXDelta");
  v6 = v5;
  objc_msgSend(v33, "userAdjustment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "xDelta");
  v9 = v8;

  objc_msgSend(v33, "maxXDelta");
  v11 = v10;
  objc_msgSend(v33, "userAdjustment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "xDelta");
  v14 = v13;

  objc_msgSend(v33, "minYDelta");
  v16 = v15;
  objc_msgSend(v33, "userAdjustment");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "yDelta");
  v19 = v18;

  objc_msgSend(v33, "maxYDelta");
  v21 = v20;
  objc_msgSend(v33, "userAdjustment");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "yDelta");
  v24 = v23;

  if (numberInSpecifierValidationRange(self->_measuredWhitePointX, self->_measuredWhitePointXSpecifier))
  {
    -[NSNumber doubleValue](self->_measuredWhitePointX, "doubleValue");
    targetWhitePointXSpecifier = self->_targetWhitePointXSpecifier;
    v27 = v11 - v14 + v26;
    v28 = v6 - v9 + v26;
  }
  else
  {
    targetWhitePointXSpecifier = self->_targetWhitePointXSpecifier;
    v28 = 0.269;
    v27 = 0.376;
  }
  updateSpecifierValidationRange(targetWhitePointXSpecifier, v28, v27);
  -[DBSFineTuneController reloadSpecifier:](self, "reloadSpecifier:", self->_targetWhitePointXSpecifier);
  if (numberInSpecifierValidationRange(self->_measuredWhitePointY, self->_measuredWhitePointYSpecifier))
  {
    -[NSNumber doubleValue](self->_measuredWhitePointY, "doubleValue");
    targetWhitePointYSpecifier = self->_targetWhitePointYSpecifier;
    v31 = v21 - v24 + v30;
    v32 = v16 - v19 + v30;
  }
  else
  {
    targetWhitePointYSpecifier = self->_targetWhitePointYSpecifier;
    v32 = 0.284;
    v31 = 0.389;
  }
  updateSpecifierValidationRange(targetWhitePointYSpecifier, v32, v31);
  -[DBSFineTuneController reloadSpecifier:](self, "reloadSpecifier:", self->_targetWhitePointYSpecifier);
  -[DBSFineTuneController updateTargetLuminanceValidationRange](self, "updateTargetLuminanceValidationRange");

}

- (void)addOrRemoveTargetFooter
{
  NSNumber *targetWhitePointX;
  _BOOL4 v4;
  NSNumber *targetWhitePointY;
  _BOOL4 v6;
  NSNumber *targetLuminance;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  PSSpecifier *fineTuneTargetGroupSpecifier;
  objc_class *v13;
  void *v14;
  PSSpecifier *v15;
  void *v16;
  PSSpecifier *v17;
  void *v18;
  void *v19;
  id v20;
  NSRange v21;

  targetWhitePointX = self->_targetWhitePointX;
  if (targetWhitePointX)
    v4 = !numberInSpecifierValidationRange(targetWhitePointX, self->_targetWhitePointXSpecifier);
  else
    v4 = 0;
  targetWhitePointY = self->_targetWhitePointY;
  if (targetWhitePointY)
    v6 = !numberInSpecifierValidationRange(targetWhitePointY, self->_targetWhitePointYSpecifier);
  else
    v6 = 0;
  targetLuminance = self->_targetLuminance;
  if (targetLuminance)
    v8 = !numberInSpecifierValidationRange(targetLuminance, self->_targetLuminanceSpecifier);
  else
    v8 = 0;
  if (v4 || v6 || v8)
  {
    DBS_LocalizedStringForFineTune(CFSTR("TARGET_OUTOFRANGE_MAIN_TEXT"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    DBS_LocalizedStringForFineTune(CFSTR("TARGET_LEARNMORE_TEXT"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    fineTuneTargetGroupSpecifier = self->_fineTuneTargetGroupSpecifier;
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpecifier setProperty:forKey:](fineTuneTargetGroupSpecifier, "setProperty:forKey:", v14, *MEMORY[0x24BE75A30]);

    -[PSSpecifier setProperty:forKey:](self->_fineTuneTargetGroupSpecifier, "setProperty:forKey:", v11, *MEMORY[0x24BE75A58]);
    v15 = self->_fineTuneTargetGroupSpecifier;
    v21.location = objc_msgSend(v11, "rangeOfString:", v10);
    NSStringFromRange(v21);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpecifier setProperty:forKey:](v15, "setProperty:forKey:", v16, *MEMORY[0x24BE75A40]);

    v17 = self->_fineTuneTargetGroupSpecifier;
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", self);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpecifier setProperty:forKey:](v17, "setProperty:forKey:", v18, *MEMORY[0x24BE75A50]);

    -[PSSpecifier setProperty:forKey:](self->_fineTuneTargetGroupSpecifier, "setProperty:forKey:", CFSTR("openTargetOutOfRangeHelpLink"), *MEMORY[0x24BE75A38]);
  }
  else
  {
    -[PSSpecifier removePropertyForKey:](self->_fineTuneTargetGroupSpecifier, "removePropertyForKey:", *MEMORY[0x24BE75A30]);
    -[PSSpecifier removePropertyForKey:](self->_fineTuneTargetGroupSpecifier, "removePropertyForKey:", *MEMORY[0x24BE75A58]);
    -[PSSpecifier removePropertyForKey:](self->_fineTuneTargetGroupSpecifier, "removePropertyForKey:", *MEMORY[0x24BE75A40]);
    -[PSSpecifier removePropertyForKey:](self->_fineTuneTargetGroupSpecifier, "removePropertyForKey:", *MEMORY[0x24BE75A50]);
    -[PSSpecifier removePropertyForKey:](self->_fineTuneTargetGroupSpecifier, "removePropertyForKey:", *MEMORY[0x24BE75A38]);
  }
  -[DBSFineTuneController table](self, "table");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "_reloadSectionHeaderFooters:withRowAnimation:", v19, 5);

}

- (void)validateUserAdjustment
{
  void *v3;
  CADisplayPreset *v4;
  CADisplayPreset *currentPreset;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;

  -[DBSFineTuneController addOrRemoveTargetFooter](self, "addOrRemoveTargetFooter");
  if (numberInSpecifierValidationRange(self->_measuredWhitePointX, self->_measuredWhitePointXSpecifier)
    && numberInSpecifierValidationRange(self->_measuredWhitePointY, self->_measuredWhitePointYSpecifier)
    && numberInSpecifierValidationRange(self->_measuredLuminance, self->_measuredLuminanceSpecifier)
    && numberInSpecifierValidationRange(self->_targetWhitePointX, self->_targetWhitePointXSpecifier)
    && numberInSpecifierValidationRange(self->_targetWhitePointY, self->_targetWhitePointYSpecifier)
    && numberInSpecifierValidationRange(self->_targetLuminance, self->_targetLuminanceSpecifier))
  {
    objc_msgSend(MEMORY[0x24BDE5660], "mainDisplay");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "currentPreset");
    v4 = (CADisplayPreset *)objc_claimAutoreleasedReturnValue();
    currentPreset = self->_currentPreset;
    self->_currentPreset = v4;

    -[CADisplayPreset userAdjustmentCommand](self->_currentPreset, "userAdjustmentCommand");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    if (!v23)
      goto LABEL_12;
    -[NSNumber doubleValue](self->_targetWhitePointX, "doubleValue");
    v8 = v7;
    -[NSNumber doubleValue](self->_measuredWhitePointX, "doubleValue");
    v10 = v8 - v9;
    -[NSNumber doubleValue](self->_targetWhitePointY, "doubleValue");
    v12 = v11;
    -[NSNumber doubleValue](self->_measuredWhitePointY, "doubleValue");
    v14 = v12 - v13;
    -[NSNumber doubleValue](self->_targetLuminance, "doubleValue");
    v16 = v15;
    -[NSNumber doubleValue](self->_measuredLuminance, "doubleValue");
    v18 = objc_msgSend(v23, "transformWhitePointByXDelta:yDelta:luminanceScale:", v10, v14, v16 / v17);
    v6 = v23;
    if ((v18 & 1) != 0)
    {
      -[CADisplayPreset applyUserAdjustmentCommand:](self->_currentPreset, "applyUserAdjustmentCommand:", v23);
      -[DBSFineTuneController navigationItem](self, "navigationItem");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "rightBarButtonItem");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      v22 = 1;
    }
    else
    {
LABEL_12:
      -[DBSFineTuneController navigationItem](self, "navigationItem", v6);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "rightBarButtonItem");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      v22 = 0;
    }
    objc_msgSend(v20, "setEnabled:", v22);

  }
  else
  {
    -[DBSFineTuneController navigationItem](self, "navigationItem");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "rightBarButtonItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setEnabled:", 0);
  }

}

- (id)getMeasuredWhitePointX:(id)a3
{
  return -[NSNumberFormatter stringFromNumber:](self->_xyNumberFormatter, "stringFromNumber:", self->_measuredWhitePointX);
}

- (void)setMeasuredWhitePointX:(id)a3 forSpecifier:(id)a4
{
  NSNumber *v5;
  NSNumber *measuredWhitePointX;

  -[NSNumberFormatter numberFromString:](self->_xyNumberFormatter, "numberFromString:", a3, a4);
  v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  measuredWhitePointX = self->_measuredWhitePointX;
  self->_measuredWhitePointX = v5;

  -[DBSFineTuneController updateValidationRanges](self, "updateValidationRanges");
  -[DBSFineTuneController validateUserAdjustment](self, "validateUserAdjustment");
}

- (id)getMeasuredWhitePointY:(id)a3
{
  return -[NSNumberFormatter stringFromNumber:](self->_xyNumberFormatter, "stringFromNumber:", self->_measuredWhitePointY);
}

- (void)setMeasuredWhitePointY:(id)a3 forSpecifier:(id)a4
{
  NSNumber *v5;
  NSNumber *measuredWhitePointY;

  -[NSNumberFormatter numberFromString:](self->_xyNumberFormatter, "numberFromString:", a3, a4);
  v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  measuredWhitePointY = self->_measuredWhitePointY;
  self->_measuredWhitePointY = v5;

  -[DBSFineTuneController updateValidationRanges](self, "updateValidationRanges");
  -[DBSFineTuneController validateUserAdjustment](self, "validateUserAdjustment");
}

- (id)getMeasuredLuminance:(id)a3
{
  return -[NSNumberFormatter stringFromNumber:](self->_luminanceNumberFormatter, "stringFromNumber:", self->_measuredLuminance);
}

- (void)setMeasuredLuminance:(id)a3 forSpecifier:(id)a4
{
  NSNumber *v5;
  NSNumber *measuredLuminance;

  -[NSNumberFormatter numberFromString:](self->_luminanceNumberFormatter, "numberFromString:", a3, a4);
  v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  measuredLuminance = self->_measuredLuminance;
  self->_measuredLuminance = v5;

  -[DBSFineTuneController updateValidationRanges](self, "updateValidationRanges");
  -[DBSFineTuneController validateUserAdjustment](self, "validateUserAdjustment");
}

- (id)getTargetWhitePointX:(id)a3
{
  return -[NSNumberFormatter stringFromNumber:](self->_xyNumberFormatter, "stringFromNumber:", self->_targetWhitePointX);
}

- (void)setTargetWhitePointX:(id)a3 forSpecifier:(id)a4
{
  NSNumber *v5;
  NSNumber *targetWhitePointX;

  -[NSNumberFormatter numberFromString:](self->_xyNumberFormatter, "numberFromString:", a3, a4);
  v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  targetWhitePointX = self->_targetWhitePointX;
  self->_targetWhitePointX = v5;

  -[DBSFineTuneController updateTargetLuminanceValidationRange](self, "updateTargetLuminanceValidationRange");
  -[DBSFineTuneController validateUserAdjustment](self, "validateUserAdjustment");
}

- (id)getTargetWhitePointY:(id)a3
{
  return -[NSNumberFormatter stringFromNumber:](self->_xyNumberFormatter, "stringFromNumber:", self->_targetWhitePointY);
}

- (void)setTargetWhitePointY:(id)a3 forSpecifier:(id)a4
{
  NSNumber *v5;
  NSNumber *targetWhitePointY;

  -[NSNumberFormatter numberFromString:](self->_xyNumberFormatter, "numberFromString:", a3, a4);
  v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  targetWhitePointY = self->_targetWhitePointY;
  self->_targetWhitePointY = v5;

  -[DBSFineTuneController updateTargetLuminanceValidationRange](self, "updateTargetLuminanceValidationRange");
  -[DBSFineTuneController validateUserAdjustment](self, "validateUserAdjustment");
}

- (id)getTargetLuminance:(id)a3
{
  return -[NSNumberFormatter stringFromNumber:](self->_luminanceNumberFormatter, "stringFromNumber:", self->_targetLuminance);
}

- (void)setTargetLuminance:(id)a3 forSpecifier:(id)a4
{
  NSNumber *v5;
  NSNumber *targetLuminance;

  -[NSNumberFormatter numberFromString:](self->_luminanceNumberFormatter, "numberFromString:", a3, a4);
  v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  targetLuminance = self->_targetLuminance;
  self->_targetLuminance = v5;

  -[DBSFineTuneController validateUserAdjustment](self, "validateUserAdjustment");
}

- (void)restoreDefaults:(id)a3
{
  void *v4;
  CADisplayPreset *v5;
  CADisplayPreset *currentPreset;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  CADisplayPreset *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  objc_msgSend(MEMORY[0x24BDE5660], "mainDisplay", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentPreset");
  v5 = (CADisplayPreset *)objc_claimAutoreleasedReturnValue();
  currentPreset = self->_currentPreset;
  self->_currentPreset = v5;

  -[CADisplayPreset userAdjustmentCommand](self->_currentPreset, "userAdjustmentCommand");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v7;
  if (!v7)
    goto LABEL_4;
  objc_msgSend(v7, "userAdjustment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "xDelta");
  v10 = -v9;

  objc_msgSend(v21, "userAdjustment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "yDelta");
  v13 = -v12;

  objc_msgSend(v21, "userAdjustment");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "luminanceScale");
  v16 = 1.0 / v15;

  if ((objc_msgSend(v21, "transformWhitePointByXDelta:yDelta:luminanceScale:", v10, v13, v16) & 1) != 0)
  {
    -[CADisplayPreset applyUserAdjustmentCommand:](self->_currentPreset, "applyUserAdjustmentCommand:", v21);
    v17 = self->_currentPreset;
    objc_msgSend(MEMORY[0x24BDE5660], "mainDisplay");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setCurrentPreset:", v17);

    -[PSSpecifier setObject:forKeyedSubscript:](self->_restoreDefaultsSpecifier, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);
    -[DBSFineTuneController reloadSpecifier:](self, "reloadSpecifier:", self->_restoreDefaultsSpecifier);
    -[DBSFineTuneController navigationController](self, "navigationController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dismissViewControllerAnimated:completion:", 1, 0);
  }
  else
  {
LABEL_4:
    -[DBSFineTuneController navigationItem](self, "navigationItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "rightBarButtonItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setEnabled:", 0);

  }
}

- (void)openFineTuneHelpLink
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("https://support.apple.com/HT213349?cid=mc-ols-ipad-article_ht213349-ipados_ui-10022023#calibrate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openURL:withCompletionHandler:", v2, &__block_literal_global_2);

}

void __45__DBSFineTuneController_openFineTuneHelpLink__block_invoke(uint64_t a1, char a2)
{
  NSObject *v2;
  uint8_t v3[16];

  if ((a2 & 1) == 0)
  {
    DBSLogForCategory(0);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_227A37000, v2, OS_LOG_TYPE_DEFAULT, "Failed to open Fine-Tune support url.", v3, 2u);
    }

  }
}

- (void)openTargetOutOfRangeHelpLink
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("https://support.apple.com/ht213349?cid=mc-ols-ipad-article_ht213349-ipados_ui-10022023#range-limits"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openURL:withCompletionHandler:", v2, &__block_literal_global_67);

}

void __53__DBSFineTuneController_openTargetOutOfRangeHelpLink__block_invoke(uint64_t a1, char a2)
{
  NSObject *v2;
  uint8_t v3[16];

  if ((a2 & 1) == 0)
  {
    DBSLogForCategory(0);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_227A37000, v2, OS_LOG_TYPE_DEFAULT, "Failed to open Fine-Tune support url.", v3, 2u);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fineTuneTargetGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_introductionSpecifier, 0);
  objc_storeStrong((id *)&self->_restoreDefaultsSpecifier, 0);
  objc_storeStrong((id *)&self->_targetLuminanceSpecifier, 0);
  objc_storeStrong((id *)&self->_targetWhitePointYSpecifier, 0);
  objc_storeStrong((id *)&self->_targetWhitePointXSpecifier, 0);
  objc_storeStrong((id *)&self->_measuredLuminanceSpecifier, 0);
  objc_storeStrong((id *)&self->_measuredWhitePointYSpecifier, 0);
  objc_storeStrong((id *)&self->_measuredWhitePointXSpecifier, 0);
  objc_storeStrong((id *)&self->_currentPreset, 0);
  objc_storeStrong((id *)&self->_targetLuminance, 0);
  objc_storeStrong((id *)&self->_targetWhitePointY, 0);
  objc_storeStrong((id *)&self->_targetWhitePointX, 0);
  objc_storeStrong((id *)&self->_measuredLuminance, 0);
  objc_storeStrong((id *)&self->_measuredWhitePointY, 0);
  objc_storeStrong((id *)&self->_measuredWhitePointX, 0);
  objc_storeStrong((id *)&self->_luminanceNumberFormatter, 0);
  objc_storeStrong((id *)&self->_xyNumberFormatter, 0);
}

@end
