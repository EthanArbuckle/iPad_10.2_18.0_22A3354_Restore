@implementation _UIPointerHoverEffectSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIPointerHoverEffectSettings;
  -[_UIPointerEffectSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[_UIPointerEffectSettings setSlipFactorX:](self, "setSlipFactorX:", 1.0);
  -[_UIPointerEffectSettings setSlipFactorY:](self, "setSlipFactorY:", 1.0);
  -[_UIPointerEffectSettings setScaleUpPoints:](self, "setScaleUpPoints:", 6.0);
}

+ (id)settingsControllerModule
{
  void *v2;
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
  void *v28;
  void *v29;
  _QWORD v30[3];
  void *v31;
  _QWORD v32[3];
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Default Corner Radius"), CFSTR("defaultPointerCornerRadius"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "between:and:", 0.0, 2.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "precision:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:title:", v6, CFSTR("Effect Appearance"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Scale Up Points"), CFSTR("scaleUpPoints"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "between:and:", 0.0, 20.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "precision:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v9;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Scale Animation Response"), CFSTR("scaleUpAnimationResponse"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "between:and:", 0.0, 1.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "precision:", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v12;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Scale Animation Damping Ratio"), CFSTR("scaleUpAnimationDampingRatio"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "between:and:", 0.0, 1.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "precision:", 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sectionWithRows:title:", v16, CFSTR("Effect Scale Up Animation"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "actionWithSettingsKeyPath:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "rowWithTitle:action:", CFSTR("Restore Defaults"), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)MEMORY[0x1E0D83078];
  v31 = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "sectionWithRows:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (void *)MEMORY[0x1E0D83078];
  v30[0] = v29;
  v30[1] = v17;
  v30[2] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "moduleWithTitle:contents:", 0, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

@end
