@implementation SBPIPStashVisualSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBPIPStashVisualSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[SBPIPStashVisualSettings setUserInterfaceStyle:](self, "setUserInterfaceStyle:", 2);
  -[SBPIPStashVisualSettings setStartBlurTransition:](self, "setStartBlurTransition:", 0.9);
  -[SBPIPStashVisualSettings setCompleteBlurTransition:](self, "setCompleteBlurTransition:", 1.0);
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
  _QWORD v18[5];
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83020], "rowWithTitle:valueKeyPath:", CFSTR("Override Interface Style"), CFSTR("userInterfaceStyle"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "possibleValues:titles:", &unk_1E91CF3E8, &unk_1E91CF400);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Light Mode Material"), CFSTR("lightModeMaterialSettings"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Dark Mode Material"), CFSTR("darkModeMaterialSettings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Start Blur Transition"), CFSTR("startBlurTransition"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueStringFormatter:", &__block_literal_global_376);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueValidator:", &__block_literal_global_212);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Complete Blur Transition"), CFSTR("completeBlurTransition"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "valueStringFormatter:", &__block_literal_global_376);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "valueValidator:", &__block_literal_global_218);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0D83070];
  v18[0] = v3;
  v18[1] = v4;
  v18[2] = v5;
  v18[3] = v8;
  v18[4] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sectionWithRows:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "moduleWithTitle:contents:", CFSTR("Stash Visual Settings"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

uint64_t __52__SBPIPStashVisualSettings_settingsControllerModule__block_invoke(uint64_t a1, void *a2)
{
  double v2;

  objc_msgSend(a2, "doubleValue");
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu%% through stashing"), (unint64_t)(v2 * 100.0));
}

uint64_t __52__SBPIPStashVisualSettings_settingsControllerModule__block_invoke_2(uint64_t a1, void *a2, void *a3)
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

uint64_t __52__SBPIPStashVisualSettings_settingsControllerModule__block_invoke_3(uint64_t a1, void *a2, void *a3)
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

- (id)materialSettingsForUserInterfaceStyle:(int64_t)a3
{
  if ((unint64_t)a3 <= 2)
    a2 = (SEL)*(id *)((char *)&self->super.super.isa + *off_1E8EBFE18[a3]);
  return (id)(id)a2;
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (void)setUserInterfaceStyle:(int64_t)a3
{
  self->_userInterfaceStyle = a3;
}

- (double)startBlurTransition
{
  return self->_startBlurTransition;
}

- (void)setStartBlurTransition:(double)a3
{
  self->_startBlurTransition = a3;
}

- (double)completeBlurTransition
{
  return self->_completeBlurTransition;
}

- (void)setCompleteBlurTransition:(double)a3
{
  self->_completeBlurTransition = a3;
}

- (SBPIPStashMaterialSettings)lightModeMaterialSettings
{
  return self->_lightModeMaterialSettings;
}

- (void)setLightModeMaterialSettings:(id)a3
{
  objc_storeStrong((id *)&self->_lightModeMaterialSettings, a3);
}

- (SBPIPStashMaterialSettings)darkModeMaterialSettings
{
  return self->_darkModeMaterialSettings;
}

- (void)setDarkModeMaterialSettings:(id)a3
{
  objc_storeStrong((id *)&self->_darkModeMaterialSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_darkModeMaterialSettings, 0);
  objc_storeStrong((id *)&self->_lightModeMaterialSettings, 0);
}

@end
