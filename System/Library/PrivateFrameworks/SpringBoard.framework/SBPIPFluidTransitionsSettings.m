@implementation SBPIPFluidTransitionsSettings

- (void)setDefaultValues
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBPIPFluidTransitionsSettings;
  -[PTSettings setDefaultValues](&v5, sel_setDefaultValues);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9E08]), "initWithDefaultValues");
  objc_msgSend(v3, "setName:", CFSTR("Source clipping behavior"));
  objc_msgSend(v3, "setBehaviorType:", 2);
  objc_msgSend(v3, "setRetargetImpulse:", 0.0);
  objc_msgSend(v3, "setTrackingRetargetImpulse:", 0.0);
  objc_msgSend(v3, "setDampingRatio:", 1.0);
  objc_msgSend(v3, "setResponse:", 0.336);
  objc_msgSend(v3, "setTrackingDampingRatio:", 1.0);
  objc_msgSend(v3, "setTrackingResponse:", 0.08);
  -[SBPIPFluidTransitionsSettings setSourceClippingFluidBehavior:](self, "setSourceClippingFluidBehavior:", v3);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9E08]), "initWithDefaultValues");
  objc_msgSend(v4, "setName:", CFSTR("Target clipping Behavior"));
  objc_msgSend(v4, "setBehaviorType:", 2);
  objc_msgSend(v4, "setRetargetImpulse:", 0.0);
  objc_msgSend(v4, "setTrackingRetargetImpulse:", 0.0);
  objc_msgSend(v4, "setDampingRatio:", 1.0);
  objc_msgSend(v4, "setResponse:", 0.35);
  objc_msgSend(v4, "setTrackingDampingRatio:", 1.0);
  objc_msgSend(v4, "setTrackingResponse:", 0.08);
  -[SBPIPFluidTransitionsSettings setTargetClippingFluidBehavior:](self, "setTargetClippingFluidBehavior:", v4);

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
  _QWORD v18[3];
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0DA9E08], "_moduleWithSectionTitle:", CFSTR("Source Clipping Behavior"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "submoduleWithModule:childSettingsKeyPath:", v3, CFSTR("sourceClippingFluidBehavior"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0DA9E08], "_moduleWithSectionTitle:", CFSTR("Target Clipping Behavior"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "submoduleWithModule:childSettingsKeyPath:", v6, CFSTR("targetClippingFluidBehavior"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0D83008];
  objc_msgSend(MEMORY[0x1E0D83088], "actionWithSettingsKeyPath:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rowWithTitle:action:", CFSTR("Restore Defaults"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0D83070];
  v19[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sectionWithRows:title:", v12, CFSTR("Restore Default Values"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0D83070];
  v18[0] = v13;
  v18[1] = v4;
  v18[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "moduleWithTitle:contents:", CFSTR("AutoPIP and Fluid Restore"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (SBFFluidBehaviorSettings)sourceClippingFluidBehavior
{
  return self->_sourceClippingFluidBehavior;
}

- (void)setSourceClippingFluidBehavior:(id)a3
{
  objc_storeStrong((id *)&self->_sourceClippingFluidBehavior, a3);
}

- (SBFFluidBehaviorSettings)targetClippingFluidBehavior
{
  return self->_targetClippingFluidBehavior;
}

- (void)setTargetClippingFluidBehavior:(id)a3
{
  objc_storeStrong((id *)&self->_targetClippingFluidBehavior, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetClippingFluidBehavior, 0);
  objc_storeStrong((id *)&self->_sourceClippingFluidBehavior, 0);
}

@end
