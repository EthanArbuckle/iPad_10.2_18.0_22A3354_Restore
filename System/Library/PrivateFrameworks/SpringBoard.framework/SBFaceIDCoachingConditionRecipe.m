@implementation SBFaceIDCoachingConditionRecipe

- (id)title
{
  return CFSTR("Face ID Coaching");
}

- (void)handleVolumeIncrease
{
  uint64_t v3;

  if (!-[SBFaceIDCoachingConditionRecipe _overrideCoachingConditionEnabled](self, "_overrideCoachingConditionEnabled"))
    -[SBFaceIDCoachingConditionRecipe _setOverrideCoachingConditionEnabled:](self, "_setOverrideCoachingConditionEnabled:", 1);
  if ((unint64_t)(handleVolumeIncrease_coachingEvent + 1) <= 0x16)
    v3 = handleVolumeIncrease_coachingEvent + 1;
  else
    v3 = 16;
  handleVolumeIncrease_coachingEvent = v3;
  -[SBFaceIDCoachingConditionRecipe _setOverrideCoachingEvent:](self, "_setOverrideCoachingEvent:");
}

- (void)handleVolumeDecrease
{
  -[SBFaceIDCoachingConditionRecipe _setOverrideCoachingConditionEnabled:](self, "_setOverrideCoachingConditionEnabled:", -[SBFaceIDCoachingConditionRecipe _overrideCoachingConditionEnabled](self, "_overrideCoachingConditionEnabled") ^ 1);
}

- (void)_setOverrideCoachingConditionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D1BBD8], "rootSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pearlSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOverrideCoachingConditionEnabled:", v3);

}

- (BOOL)_overrideCoachingConditionEnabled
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0D1BBD8], "rootSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pearlSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "overrideCoachingConditionEnabled");

  return v4;
}

- (void)_setOverrideCoachingEvent:(unint64_t)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D1BBD8], "rootSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pearlSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOverrideCoachingBiometricEvent:", a3);

}

@end
