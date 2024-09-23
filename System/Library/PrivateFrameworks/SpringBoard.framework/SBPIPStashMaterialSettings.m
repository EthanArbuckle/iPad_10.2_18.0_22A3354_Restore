@implementation SBPIPStashMaterialSettings

- (void)setDefaultValues
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBPIPStashMaterialSettings;
  -[PTSettings setDefaultValues](&v4, sel_setDefaultValues);
  -[SBPIPStashMaterialSettings setChevronCompositingFilter:](self, "setChevronCompositingFilter:", *MEMORY[0x1E0CD2EA0]);
  objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBPIPStashMaterialSettings setChevronTintColor:](self, "setChevronTintColor:", v3);

  -[SBPIPStashMaterialSettings setDarkTintAlpha:](self, "setDarkTintAlpha:", 0.55);
  -[SBPIPStashMaterialSettings setLightTintAlpha:](self, "setLightTintAlpha:", 0.15);
}

+ (id)settingsControllerModule
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
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
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[7];
  void *v31;
  _QWORD v32[4];
  _QWORD v33[5];

  v33[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83020], "rowWithTitle:valueKeyPath:", CFSTR("Interface Style"), CFSTR("userInterfaceStyle"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "possibleValues:titles:", &unk_1E91CF418, &unk_1E91CF430);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83020], "rowWithTitle:valueKeyPath:", CFSTR("Chevron Filter"), CFSTR("chevronCompositingFilter"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0CD2EA0];
  v33[0] = v4;
  v33[1] = v5;
  v33[2] = *MEMORY[0x1E0CD2E98];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "possibleValues:titles:", v6, &unk_1E91CF448);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83020], "rowWithTitle:valueKeyPath:", CFSTR("Chevron Tint"), CFSTR("chevronTintColor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v8;
  objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v9;
  objc_msgSend(MEMORY[0x1E0CEA478], "tertiaryLabelColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v10;
  objc_msgSend(MEMORY[0x1E0CEA478], "quaternaryLabelColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v32[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "possibleValues:titles:", v12, &unk_1E91CF460);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Dark Tint Alpha"), CFSTR("darkTintAlpha"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Light Tint Alpha"), CFSTR("lightTintAlpha"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Start Blur Transition"), CFSTR("startBlurTransition"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "valueStringFormatter:", &__block_literal_global_301);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "valueValidator:", &__block_literal_global_302_0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Complete Blur Transition"), CFSTR("completeBlurTransition"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "valueStringFormatter:", &__block_literal_global_301);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "valueValidator:", &__block_literal_global_303);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x1E0D83070];
  v30[0] = v29;
  v30[1] = v28;
  v30[2] = v27;
  v30[3] = v26;
  v30[4] = v13;
  v30[5] = v16;
  v30[6] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 7);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sectionWithRows:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "moduleWithTitle:contents:", CFSTR("Stash Visual Settings"), v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

uint64_t __54__SBPIPStashMaterialSettings_settingsControllerModule__block_invoke(uint64_t a1, void *a2)
{
  double v2;

  objc_msgSend(a2, "doubleValue");
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu%% through stashing"), (unint64_t)(v2 * 100.0));
}

uint64_t __54__SBPIPStashMaterialSettings_settingsControllerModule__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v4 = a3;
  objc_msgSend(a2, "doubleValue");
  v6 = v5;
  objc_msgSend(v4, "completeBlurTransition");
  v8 = v7;

  v9 = v8 + -0.01;
  if (v6 < v8 + -0.01)
    v9 = v6;
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
}

uint64_t __54__SBPIPStashMaterialSettings_settingsControllerModule__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v4 = a3;
  objc_msgSend(a2, "doubleValue");
  v6 = v5;
  objc_msgSend(v4, "startBlurTransition");
  v8 = v7;

  v9 = v8 + 0.01;
  if (v6 >= v8 + 0.01)
    v9 = v6;
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
}

+ (BOOL)ignoresKey:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("darkTintColor")) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("lightTintColor"));

  return v4;
}

- (UIColor)darkTintColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, self->_darkTintAlpha);
}

- (UIColor)lightTintColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, self->_lightTintAlpha);
}

- (NSString)chevronCompositingFilter
{
  return self->_chevronCompositingFilter;
}

- (void)setChevronCompositingFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (UIColor)chevronTintColor
{
  return self->_chevronTintColor;
}

- (void)setChevronTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_chevronTintColor, a3);
}

- (double)darkTintAlpha
{
  return self->_darkTintAlpha;
}

- (void)setDarkTintAlpha:(double)a3
{
  self->_darkTintAlpha = a3;
}

- (double)lightTintAlpha
{
  return self->_lightTintAlpha;
}

- (void)setLightTintAlpha:(double)a3
{
  self->_lightTintAlpha = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chevronTintColor, 0);
  objc_storeStrong((id *)&self->_chevronCompositingFilter, 0);
}

@end
