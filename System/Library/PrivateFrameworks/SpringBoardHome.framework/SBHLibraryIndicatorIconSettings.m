@implementation SBHLibraryIndicatorIconSettings

- (void)setDefaultValues
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBHLibraryIndicatorIconSettings;
  -[PTSettings setDefaultValues](&v6, sel_setDefaultValues);
  -[SBHLibraryIndicatorIconSettings setPod1Scale:](self, "setPod1Scale:", 0.93);
  -[SBHLibraryIndicatorIconSettings setPod2Scale:](self, "setPod2Scale:", 0.9075);
  -[SBHLibraryIndicatorIconSettings setPod3Scale:](self, "setPod3Scale:", 0.87);
  -[SBHLibraryIndicatorIconSettings pod1AnimationSettings](self, "pod1AnimationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDefaultValues");
  objc_msgSend(v3, "setBehaviorType:", 1);
  objc_msgSend(v3, "setDampingRatio:", 0.4);
  objc_msgSend(v3, "setResponse:", 0.5);
  -[SBHLibraryIndicatorIconSettings pod2AnimationSettings](self, "pod2AnimationSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDefaultValues");
  objc_msgSend(v4, "setBehaviorType:", 1);
  objc_msgSend(v4, "setDampingRatio:", 0.6);
  objc_msgSend(v4, "setResponse:", 0.4);
  -[SBHLibraryIndicatorIconSettings pod3AnimationSettings](self, "pod3AnimationSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDefaultValues");
  objc_msgSend(v5, "setBehaviorType:", 1);
  objc_msgSend(v5, "setDampingRatio:", 0.8);
  objc_msgSend(v5, "setResponse:", 0.3);

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
  _QWORD v33[4];

  v33[3] = *MEMORY[0x1E0C80C00];
  v28 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Pod 1 Scale"), CFSTR("pod1Scale"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "between:and:", 0.0, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "precision:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v4;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Pod 2 Scale"), CFSTR("pod2Scale"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "between:and:", 0.0, 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "precision:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v7;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Pod 3 Scale"), CFSTR("pod3Scale"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "between:and:", 0.0, 1.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "precision:", 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "sectionWithRows:title:", v11, CFSTR("Pod Scale Settings"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Pod 1 Animation Settings"), CFSTR("pod1AnimationSettings"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v13;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Pod 2 Animation Settings"), CFSTR("pod2AnimationSettings"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v14;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Pod 3 Animation Settings"), CFSTR("pod3AnimationSettings"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sectionWithRows:title:", v16, CFSTR("Pod Scale Animation Settings"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0D83078];
  v19 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "action");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "rowWithTitle:action:", CFSTR("Restore Defaults"), v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sectionWithRows:", v22);
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

- (double)pod1Scale
{
  return self->_pod1Scale;
}

- (void)setPod1Scale:(double)a3
{
  self->_pod1Scale = a3;
}

- (double)pod2Scale
{
  return self->_pod2Scale;
}

- (void)setPod2Scale:(double)a3
{
  self->_pod2Scale = a3;
}

- (double)pod3Scale
{
  return self->_pod3Scale;
}

- (void)setPod3Scale:(double)a3
{
  self->_pod3Scale = a3;
}

- (SBFFluidBehaviorSettings)pod1AnimationSettings
{
  return self->_pod1AnimationSettings;
}

- (void)setPod1AnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_pod1AnimationSettings, a3);
}

- (SBFFluidBehaviorSettings)pod2AnimationSettings
{
  return self->_pod2AnimationSettings;
}

- (void)setPod2AnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_pod2AnimationSettings, a3);
}

- (SBFFluidBehaviorSettings)pod3AnimationSettings
{
  return self->_pod3AnimationSettings;
}

- (void)setPod3AnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_pod3AnimationSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pod3AnimationSettings, 0);
  objc_storeStrong((id *)&self->_pod2AnimationSettings, 0);
  objc_storeStrong((id *)&self->_pod1AnimationSettings, 0);
}

@end
