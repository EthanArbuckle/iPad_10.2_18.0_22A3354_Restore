@implementation SBUISystemApertureAnimationParameters

- (SBUISystemApertureAnimationParameters)initWithFluidBehaviorSettings:(id)a3 tracking:(BOOL)a4 retargeted:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v9;
  SBUISystemApertureAnimationParameters *v10;
  uint64_t v11;
  NSNumber *tracking;
  uint64_t v13;
  NSNumber *retargeted;
  id v15;
  void *v16;
  uint64_t v17;
  BSSettings *BSSettingsRepresentation;
  objc_super v20;

  v5 = a5;
  v6 = a4;
  v9 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SBUISystemApertureAnimationParameters;
  v10 = -[SBUISystemApertureAnimationParameters init](&v20, sel_init);
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
    v11 = objc_claimAutoreleasedReturnValue();
    tracking = v10->_tracking;
    v10->_tracking = (NSNumber *)v11;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
    v13 = objc_claimAutoreleasedReturnValue();
    retargeted = v10->_retargeted;
    v10->_retargeted = (NSNumber *)v13;

    objc_storeStrong((id *)&v10->_fluidBehaviorSettings, a3);
    v15 = objc_alloc_init(MEMORY[0x1E0D017D0]);
    objc_msgSend(v15, "setObject:forSetting:", v10->_tracking, 19873);
    objc_msgSend(v15, "setObject:forSetting:", v10->_retargeted, 19874);
    objc_msgSend(v9, "archiveDictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forSetting:", v16, 19875);

    v17 = objc_msgSend(v15, "copy");
    BSSettingsRepresentation = v10->_BSSettingsRepresentation;
    v10->_BSSettingsRepresentation = (BSSettings *)v17;

  }
  return v10;
}

- (SBUISystemApertureAnimationParameters)initWithBSSettingsRepresentation:(id)a3
{
  id v4;
  SBUISystemApertureAnimationParameters *v5;
  uint64_t v6;
  BSSettings *BSSettingsRepresentation;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBUISystemApertureAnimationParameters;
  v5 = -[SBUISystemApertureAnimationParameters init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    BSSettingsRepresentation = v5->_BSSettingsRepresentation;
    v5->_BSSettingsRepresentation = (BSSettings *)v6;

  }
  return v5;
}

- (BOOL)isAnimated
{
  return -[SBUISystemApertureAnimationParameters _animationBehavior](self, "_animationBehavior") != 0;
}

- (BOOL)_hasSpringParameters
{
  void *v2;
  BOOL v3;

  -[SBUISystemApertureAnimationParameters fluidBehaviorSettings](self, "fluidBehaviorSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)tracking
{
  NSNumber *tracking;
  NSNumber *v4;
  NSNumber *v5;

  tracking = self->_tracking;
  if (!tracking)
  {
    -[BSSettings objectForSetting:](self->_BSSettingsRepresentation, "objectForSetting:", 19873);
    v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v5 = self->_tracking;
    self->_tracking = v4;

    tracking = self->_tracking;
  }
  return -[NSNumber BOOLValue](tracking, "BOOLValue");
}

- (BOOL)isRetargeted
{
  NSNumber *retargeted;
  NSNumber *v4;
  NSNumber *v5;

  retargeted = self->_retargeted;
  if (!retargeted)
  {
    -[BSSettings objectForSetting:](self->_BSSettingsRepresentation, "objectForSetting:", 19874);
    v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v5 = self->_retargeted;
    self->_retargeted = v4;

    retargeted = self->_retargeted;
  }
  return -[NSNumber BOOLValue](retargeted, "BOOLValue");
}

- (SBFFluidBehaviorSettings)fluidBehaviorSettings
{
  SBFFluidBehaviorSettings *fluidBehaviorSettings;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  SBFFluidBehaviorSettings *v9;
  SBFFluidBehaviorSettings *v10;

  fluidBehaviorSettings = self->_fluidBehaviorSettings;
  if (!fluidBehaviorSettings)
  {
    -[BSSettings objectForSetting:](self->_BSSettingsRepresentation, "objectForSetting:", 19875);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_class();
    v6 = v4;
    if (v5)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v7 = v6;
      else
        v7 = 0;
    }
    else
    {
      v7 = 0;
    }
    v8 = v7;

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0DA9E08], "settingsFromArchiveDictionary:", v8);
      v9 = (SBFFluidBehaviorSettings *)objc_claimAutoreleasedReturnValue();
      v10 = self->_fluidBehaviorSettings;
      self->_fluidBehaviorSettings = v9;

    }
    fluidBehaviorSettings = self->_fluidBehaviorSettings;
  }
  return fluidBehaviorSettings;
}

- (int64_t)_animationBehavior
{
  if (-[SBUISystemApertureAnimationParameters _hasSpringParameters](self, "_hasSpringParameters"))
    return 2;
  else
    return -[SBUISystemApertureAnimationParameters isRetargeted](self, "isRetargeted");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  char v10;

  v4 = a3;
  v5 = objc_opt_class();
  v6 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  if (v8)
    v9 = (void *)v8[3];
  else
    v9 = 0;
  v10 = objc_msgSend(v9, "isEqual:", self->_BSSettingsRepresentation);

  return v10;
}

+ (BOOL)areParams:(id)a3 equivalentTo:(id)a4
{
  id v5;
  id v6;
  char v7;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "isAnimated") & 1) != 0 || objc_msgSend(v6, "isAnimated"))
    v7 = objc_msgSend(v5, "isEqual:", v6);
  else
    v7 = 1;

  return v7;
}

- (BSSettings)BSSettingsRepresentation
{
  return self->_BSSettingsRepresentation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fluidBehaviorSettings, 0);
  objc_storeStrong((id *)&self->_BSSettingsRepresentation, 0);
  objc_storeStrong((id *)&self->_retargeted, 0);
  objc_storeStrong((id *)&self->_tracking, 0);
}

@end
