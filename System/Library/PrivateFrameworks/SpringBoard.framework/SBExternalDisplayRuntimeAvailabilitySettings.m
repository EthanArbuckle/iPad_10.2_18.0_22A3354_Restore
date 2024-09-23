@implementation SBExternalDisplayRuntimeAvailabilitySettings

+ (BOOL)ignoresKey:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("extendedDisplayRequirements"));
}

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBExternalDisplayRuntimeAvailabilitySettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[SBExternalDisplayRuntimeAvailabilitySettings setRequirePointer:](self, "setRequirePointer:", 1);
  -[SBExternalDisplayRuntimeAvailabilitySettings setRequireHardwareKeyboard:](self, "setRequireHardwareKeyboard:", 1);
}

- (int64_t)extendedDisplayRequirements
{
  SBBitmaskUnionIf();
  return SBBitmaskUnionIf();
}

uint64_t __75__SBExternalDisplayRuntimeAvailabilitySettings_extendedDisplayRequirements__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "requirePointer");
}

uint64_t __75__SBExternalDisplayRuntimeAvailabilitySettings_extendedDisplayRequirements__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "requireHardwareKeyboard");
}

+ (id)settingsControllerModule
{
  return (id)objc_msgSend(a1, "_moduleWithSectionTitle:", CFSTR("Extended Display Requirements"));
}

+ (id)_moduleWithSectionTitle:(id)a3
{
  void *v3;
  id v4;
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
  _QWORD v16[2];
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3880];
  v4 = a3;
  objc_msgSend(v3, "predicateWithValue:", SBFIsChamoisExternalDisplayControllerAvailable());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Pointer"), CFSTR("requirePointer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "condition:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Hardware Keyboard"), CFSTR("requireHardwareKeyboard"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "condition:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0D83070];
  v16[0] = v7;
  v16[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sectionWithRows:title:", v11, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "moduleWithTitle:contents:", 0, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BOOL)requirePointer
{
  return *(&self->super.__isObservingChildren + 1);
}

- (void)setRequirePointer:(BOOL)a3
{
  *(&self->super.__isObservingChildren + 1) = a3;
}

- (BOOL)requireHardwareKeyboard
{
  return *(&self->super.__isObservingChildren + 2);
}

- (void)setRequireHardwareKeyboard:(BOOL)a3
{
  *(&self->super.__isObservingChildren + 2) = a3;
}

@end
