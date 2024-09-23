@implementation PUMedusaSettings

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_46915 != -1)
    dispatch_once(&sharedInstance_onceToken_46915, &__block_literal_global_46916);
  return (id)sharedInstance_sharedInstance_46917;
}

+ (id)settingsControllerModule
{
  void *v3;
  void *v4;
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
  double v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
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
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[5];
  _QWORD v40[5];
  _QWORD v41[5];
  _QWORD v42[3];
  _QWORD v43[4];
  _QWORD v44[4];
  _QWORD v45[3];

  v45[1] = *MEMORY[0x1E0C80C00];
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __44__PUMedusaSettings_settingsControllerModule__block_invoke;
  v41[3] = &__block_descriptor_40_e40_B24__0__PTRow_8__PTUIModuleController_16l;
  v41[4] = a1;
  objc_msgSend(MEMORY[0x1E0D830A0], "actionWithHandler:", v41);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83010], "rowWithTitle:action:", CFSTR("Cancel Test"), v38);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sectionWithRows:", v5);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Increment/Decrement by"), CFSTR("_testIncrement"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "between:and:", 0.0, 100.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setPrecision:", 1);
  v36 = v7;
  objc_msgSend(v7, "setValueValidatator:", &__block_literal_global_14);
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Increment Interval"), CFSTR("_testInterval"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "between:and:", 0.0, 5.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setPrecision:", 2);
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Start Delay"), CFSTR("_testStartDelay"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "possibleValues:titles:", &unk_1E59BA0F0, &unk_1E59BA108);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __44__PUMedusaSettings_settingsControllerModule__block_invoke_38;
  v40[3] = &__block_descriptor_40_e40_B24__0__PTRow_8__PTUIModuleController_16l;
  v40[4] = a1;
  objc_msgSend(MEMORY[0x1E0D830A0], "actionWithHandler:", v40);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0D83078];
  v44[0] = v7;
  v44[1] = v9;
  v44[2] = v35;
  objc_msgSend(MEMORY[0x1E0D83010], "rowWithTitle:action:", CFSTR("Size Test"), v34);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v44[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sectionWithRows:title:", v13, CFSTR("Dynamic"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Enter Width"), CFSTR("_desiredWidth"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bounds");
  objc_msgSend(v14, "between:and:", 320.0, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setPrecision:", 1);
  objc_msgSend(v17, "setValueValidatator:", &__block_literal_global_51_46876);
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Slide Width"), CFSTR("_desiredWidth"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bounds");
  objc_msgSend(v18, "minValue:maxValue:", 320.0, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "setValueValidatator:", &__block_literal_global_55);
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Delay"), CFSTR("_widthDelay"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "possibleValues:titles:", &unk_1E59BA120, &unk_1E59BA138);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __44__PUMedusaSettings_settingsControllerModule__block_invoke_5;
  v39[3] = &__block_descriptor_40_e40_B24__0__PTRow_8__PTUIModuleController_16l;
  v39[4] = a1;
  objc_msgSend(MEMORY[0x1E0D830A0], "actionWithHandler:", v39);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)MEMORY[0x1E0D83078];
  v43[0] = v21;
  v43[1] = v17;
  v43[2] = v23;
  objc_msgSend(MEMORY[0x1E0D83010], "rowWithTitle:action:", CFSTR("Set Width"), v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v43[3] = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "sectionWithRows:title:", v27, CFSTR("Specific"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = (void *)MEMORY[0x1E0D83078];
  v42[0] = v37;
  v42[1] = v33;
  v42[2] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 3);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "moduleWithTitle:contents:", CFSTR("Medusa"), v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

+ (void)runSizeTest
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double height;
  double Width;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  id v20;
  CGRect v21;
  CGRect v22;

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", a1, sel_runSizeTest, 0);
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windows");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v20 = (id)objc_claimAutoreleasedReturnValue();

  v5 = _isShrinking;
  objc_msgSend(a1, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_testIncrement");
  if (v5)
    v8 = -v7;
  else
    v8 = v7;

  objc_msgSend(v20, "bounds");
  v10 = v8 + v9;
  objc_msgSend(v20, "bounds");
  height = v21.size.height;
  v21.origin.x = 0.0;
  v21.origin.y = 0.0;
  v21.size.width = v10;
  if (CGRectGetWidth(v21) < 320.0)
  {
    _isShrinking = 0;
    v10 = 320.0;
LABEL_8:
    objc_msgSend(v20, "_adjustSizeClassesAndResizeWindowToFrame:", 0.0, 0.0, v10, height);
    objc_msgSend(a1, "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_testInterval");
    objc_msgSend(a1, "performSelector:withObject:afterDelay:", sel_runSizeTest, 0);

    goto LABEL_9;
  }
  v22.origin.x = 0.0;
  v22.origin.y = 0.0;
  v22.size.width = v10;
  v22.size.height = height;
  Width = CGRectGetWidth(v22);
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  v15 = v14;

  if (Width <= v15)
    goto LABEL_8;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bounds");
  v18 = v17;

  _isShrinking = 1;
  objc_msgSend(v20, "_adjustSizeClassesAndResizeWindowToFrame:", 0.0, 0.0, v18, height);
LABEL_9:

}

uint64_t __44__PUMedusaSettings_settingsControllerModule__block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", *(_QWORD *)(a1 + 32), sel_runSizeTest, 0);
  return 1;
}

uint64_t __44__PUMedusaSettings_settingsControllerModule__block_invoke_38(uint64_t a1)
{
  void *v2;
  double v3;
  dispatch_time_t v4;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_testStartDelay");
  v4 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__PUMedusaSettings_settingsControllerModule__block_invoke_2_39;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_after(v4, MEMORY[0x1E0C80D38], block);

  return 1;
}

uint64_t __44__PUMedusaSettings_settingsControllerModule__block_invoke_5(uint64_t a1)
{
  void *v2;
  double v3;
  dispatch_time_t v4;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_widthDelay");
  v4 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__PUMedusaSettings_settingsControllerModule__block_invoke_6;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_after(v4, MEMORY[0x1E0C80D38], block);

  return 1;
}

void __44__PUMedusaSettings_settingsControllerModule__block_invoke_6(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "windows");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_desiredWidth");
  v6 = v5;
  objc_msgSend(v9, "bounds");
  v8 = v7;

  objc_msgSend(v9, "_adjustSizeClassesAndResizeWindowToFrame:", 0.0, 0.0, v6, v8);
}

uint64_t __44__PUMedusaSettings_settingsControllerModule__block_invoke_4(uint64_t a1, void *a2)
{
  float v2;
  float v3;

  objc_msgSend(a2, "floatValue");
  v3 = v2;
  if (PUMainScreenScale_onceToken != -1)
    dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_32103);
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", round(*(double *)&PUMainScreenScale_screenScale * v3) / *(double *)&PUMainScreenScale_screenScale);
}

uint64_t __44__PUMedusaSettings_settingsControllerModule__block_invoke_3(uint64_t a1, void *a2)
{
  float v2;
  float v3;

  objc_msgSend(a2, "floatValue");
  v3 = v2;
  if (PUMainScreenScale_onceToken != -1)
    dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_32103);
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", round(*(double *)&PUMainScreenScale_screenScale * v3) / *(double *)&PUMainScreenScale_screenScale);
}

void __44__PUMedusaSettings_settingsControllerModule__block_invoke_2_39(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "windows");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  objc_msgSend(v9, "bounds");
  v8 = v7;

  objc_msgSend(v9, "_adjustSizeClassesAndResizeWindowToFrame:", 0.0, 0.0, v6, v8);
  _isShrinking = 1;
  objc_msgSend(*(id *)(a1 + 32), "runSizeTest");

}

uint64_t __44__PUMedusaSettings_settingsControllerModule__block_invoke_2(uint64_t a1, void *a2)
{
  float v2;
  float v3;

  objc_msgSend(a2, "floatValue");
  v3 = v2;
  if (PUMainScreenScale_onceToken != -1)
    dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_32103);
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", round(*(double *)&PUMainScreenScale_screenScale * v3) / *(double *)&PUMainScreenScale_screenScale);
}

void __34__PUMedusaSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PURootSettings sharedInstance](PURootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "medusaSettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_46917;
  sharedInstance_sharedInstance_46917 = v0;

}

- (id)parentSettings
{
  return +[PURootSettings sharedInstance](PURootSettings, "sharedInstance");
}

- (double)_desiredWidth
{
  return self->__desiredWidth;
}

- (void)set_desiredWidth:(double)a3
{
  self->__desiredWidth = a3;
}

- (double)_widthDelay
{
  return self->__widthDelay;
}

- (void)set_widthDelay:(double)a3
{
  self->__widthDelay = a3;
}

- (double)_testStartDelay
{
  return self->__testStartDelay;
}

- (void)set_testStartDelay:(double)a3
{
  self->__testStartDelay = a3;
}

- (double)_testInterval
{
  return self->__testInterval;
}

- (void)set_testInterval:(double)a3
{
  self->__testInterval = a3;
}

- (double)_testIncrement
{
  return self->__testIncrement;
}

- (void)set_testIncrement:(double)a3
{
  self->__testIncrement = a3;
}

@end
