@implementation SBSystemAperturePulseSettings

- (void)setDefaultValues
{
  void *v3;
  id v4;

  -[SBSystemAperturePulseSettings setExpandDelay:](self, "setExpandDelay:", 0.0);
  -[SBSystemAperturePulseSettings setExpandScale:](self, "setExpandScale:", 1.0);
  -[SBSystemAperturePulseSettings setExpandDuration:](self, "setExpandDuration:", 0.0);
  -[SBSystemAperturePulseSettings expandBehaviorSettings](self, "expandBehaviorSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDefaultValues");

  -[SBSystemAperturePulseSettings contractBehaviorSettings](self, "contractBehaviorSettings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDefaultValues");

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
  void *v21;
  void *v22;
  _QWORD v23[2];
  void *v24;
  _QWORD v25[5];

  v25[4] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Expand Duration"), CFSTR("expandDuration"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "between:and:", 0.0, 1.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "precision:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v3;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Expand Scale"), CFSTR("expandScale"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "between:and:", 0.1, 2.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "precision:", 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v6;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Expand Delay"), CFSTR("expandDelay"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "between:and:", 0.1, 2.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "precision:", 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v9;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Expand Behavior Settings"), CFSTR("expandBehaviorSettings"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:title:", v11, CFSTR("Expand Settings"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Contract Behavior Settings"), CFSTR("contractBehaviorSettings"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sectionWithRows:title:", v15, CFSTR("Contract Settings"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x1E0D83070];
  v23[0] = v12;
  v23[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "moduleWithTitle:contents:", CFSTR("Pulse Settings"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (double)expandScale
{
  return self->_expandScale;
}

- (void)setExpandScale:(double)a3
{
  self->_expandScale = a3;
}

- (double)expandDuration
{
  return self->_expandDuration;
}

- (void)setExpandDuration:(double)a3
{
  self->_expandDuration = a3;
}

- (double)expandDelay
{
  return self->_expandDelay;
}

- (void)setExpandDelay:(double)a3
{
  self->_expandDelay = a3;
}

- (SBFFluidBehaviorSettings)expandBehaviorSettings
{
  return self->_expandBehaviorSettings;
}

- (void)setExpandBehaviorSettings:(id)a3
{
  objc_storeStrong((id *)&self->_expandBehaviorSettings, a3);
}

- (SBFFluidBehaviorSettings)contractBehaviorSettings
{
  return self->_contractBehaviorSettings;
}

- (void)setContractBehaviorSettings:(id)a3
{
  objc_storeStrong((id *)&self->_contractBehaviorSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contractBehaviorSettings, 0);
  objc_storeStrong((id *)&self->_expandBehaviorSettings, 0);
}

@end
