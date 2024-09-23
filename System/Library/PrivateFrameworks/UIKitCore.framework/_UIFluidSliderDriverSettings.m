@implementation _UIFluidSliderDriverSettings

- (void)setDefaultValues
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIFluidSliderDriverSettings;
  -[PTSettings setDefaultValues](&v7, sel_setDefaultValues);
  -[_UIFluidSliderDriverSettings update](self, "update");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDampingRatio:", 1.0);

  -[_UIFluidSliderDriverSettings update](self, "update");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setResponse:", 0.4);

  -[_UIFluidSliderDriverSettings acceleratedUpdate](self, "acceleratedUpdate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDampingRatio:", 1.0);

  -[_UIFluidSliderDriverSettings acceleratedUpdate](self, "acceleratedUpdate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setResponse:", 0.3);

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
  _QWORD v10[2];
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Update"), CFSTR("update"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Accelerated Update"), CFSTR("acceleratedUpdate"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:title:", v5, CFSTR("Animations"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "moduleWithTitle:contents:", &stru_1E16EDF20, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (_UISpringAnimationPrototypeSettings)update
{
  return self->_update;
}

- (void)setUpdate:(id)a3
{
  objc_storeStrong((id *)&self->_update, a3);
}

- (_UISpringAnimationPrototypeSettings)acceleratedUpdate
{
  return self->_acceleratedUpdate;
}

- (void)setAcceleratedUpdate:(id)a3
{
  objc_storeStrong((id *)&self->_acceleratedUpdate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acceleratedUpdate, 0);
  objc_storeStrong((id *)&self->_update, 0);
}

@end
