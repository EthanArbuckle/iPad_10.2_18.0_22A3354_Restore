@implementation SBSystemHapticsPreferencesMetric

- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4
{
  void *v6;
  void *v7;
  uint64_t v8;

  if (a3 == 11)
  {
    +[SBDefaults externalDefaults](SBDefaults, "externalDefaults", 11, a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "soundDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "systemHapticsEnabled");
    -[PETGoalConversionEventTracker trackGoalOpportunityEventWithConversion:propertyValues:](self->_switchTracker, "trackGoalOpportunityEventWithConversion:propertyValues:", v8, MEMORY[0x1E0C9AA60]);

  }
  return a3 == 11;
}

- (SBSystemHapticsPreferencesMetric)init
{
  SBSystemHapticsPreferencesMetric *v2;
  id v3;
  uint64_t v4;
  PETGoalConversionEventTracker *switchTracker;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBSystemHapticsPreferencesMetric;
  v2 = -[SBSystemHapticsPreferencesMetric init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0D80F30]);
    v4 = objc_msgSend(v3, "initWithFeatureId:opportunityEvent:conversionEvent:registerProperties:", CFSTR("SpringBoard"), CFSTR("systemHapticsAvailable"), CFSTR("systemHapticsEnabled"), MEMORY[0x1E0C9AA60]);
    switchTracker = v2->_switchTracker;
    v2->_switchTracker = (PETGoalConversionEventTracker *)v4;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_switchTracker, 0);
}

@end
