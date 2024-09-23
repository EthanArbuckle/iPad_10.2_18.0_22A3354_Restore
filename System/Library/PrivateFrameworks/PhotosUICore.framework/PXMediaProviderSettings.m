@implementation PXMediaProviderSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXMediaProviderSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[PXMediaProviderSettings setWantsSimulation:](self, "setWantsSimulation:", 0);
  -[PXMediaProviderSettings setSimulateError:](self, "setSimulateError:", 1);
  -[PXMediaProviderSettings setSimulatedDelay:](self, "setSimulatedDelay:", 3.0);
}

- (void)setWantsSimulation:(BOOL)a3
{
  self->_wantsSimulation = a3;
}

- (void)setSimulatedDelay:(double)a3
{
  self->_simulatedDelay = a3;
}

- (void)setSimulateError:(BOOL)a3
{
  self->_simulateError = a3;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
}

- (BOOL)wantsSimulation
{
  return self->_wantsSimulation;
}

- (BOOL)simulateError
{
  return self->_simulateError;
}

- (double)simulatedDelay
{
  return self->_simulatedDelay;
}

+ (PXMediaProviderSettings)sharedInstance
{
  if (sharedInstance_onceToken_101847 != -1)
    dispatch_once(&sharedInstance_onceToken_101847, &__block_literal_global_101848);
  return (PXMediaProviderSettings *)(id)sharedInstance_sharedInstance_101849;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[2];
  void *v27;
  _QWORD v28[4];

  v28[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83078];
  v19 = (void *)MEMORY[0x1E0D83078];
  v3 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_wantsSimulation);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rowWithTitle:valueKeyPath:", CFSTR("Simulation"), v25);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:", v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v22;
  v4 = (void *)MEMORY[0x1E0D83078];
  v5 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_simulateError);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rowWithTitle:valueKeyPath:", CFSTR("Error"), v21);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v20;
  v6 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_simulatedDelay);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rowWithTitle:valueKeyPath:", CFSTR("Delay"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "minValue:maxValue:", 0.0, 10.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB3880];
  NSStringFromSelector(sel_wantsSimulation);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "predicateWithFormat:", CFSTR("%K != 0"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionWithRows:title:condition:", v10, CFSTR("Simulation"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v14;
  objc_msgSend(MEMORY[0x1E0D83078], "px_restoreDefaultsSection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "moduleWithTitle:contents:", CFSTR("Media Provider"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

void __41__PXMediaProviderSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaProviderSettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_101849;
  sharedInstance_sharedInstance_101849 = v0;

}

@end
