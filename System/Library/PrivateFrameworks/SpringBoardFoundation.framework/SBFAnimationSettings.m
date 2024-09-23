@implementation SBFAnimationSettings

- (id)BSAnimationSettings
{
  BSAnimationSettings *exportedSettings;
  unint64_t v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  void *v20;
  _QWORD *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double speed;
  void *v39;
  BOOL IsEqualToRange;
  unint64_t frameRate;
  void *v42;
  int v43;
  void *v44;
  BSAnimationSettings *v45;
  BSAnimationSettings *v46;
  CAFrameRateRange v48;

  exportedSettings = self->_exportedSettings;
  if (!exportedSettings)
  {
    v4 = -[SBFAnimationSettings curve](self, "curve");
    if (v4 != 393216)
    {
      switch(__ROR8__(v4, 16))
      {
        case 0:
          v20 = (void *)MEMORY[0x1E0CD27D0];
          v21 = (_QWORD *)MEMORY[0x1E0CD3048];
          goto LABEL_10;
        case 1:
          v20 = (void *)MEMORY[0x1E0CD27D0];
          v21 = (_QWORD *)MEMORY[0x1E0CD3040];
          goto LABEL_10;
        case 2:
          v20 = (void *)MEMORY[0x1E0CD27D0];
          v21 = (_QWORD *)MEMORY[0x1E0CD3050];
          goto LABEL_10;
        case 3:
          v20 = (void *)MEMORY[0x1E0CD27D0];
          v21 = (_QWORD *)MEMORY[0x1E0CD3058];
LABEL_10:
          objc_msgSend(v20, "functionWithName:", *v21);
          v19 = objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        default:
          v22 = 0;
          goto LABEL_12;
      }
    }
    -[SBFAnimationSettings controlPoint1Settings](self, "controlPoint1Settings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pointValue");
    v7 = v6;
    v9 = v8;

    -[SBFAnimationSettings controlPoint2Settings](self, "controlPoint2Settings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pointValue");
    v12 = v11;
    v14 = v13;

    *(float *)&v15 = v7;
    *(float *)&v16 = v9;
    *(float *)&v17 = v12;
    *(float *)&v18 = v14;
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v15, v16, v17, v18);
    v19 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v22 = (void *)v19;
LABEL_12:
    if (-[SBFAnimationSettings animationType](self, "animationType") == 1)
    {
      v23 = (void *)MEMORY[0x1E0D017D8];
      -[SBFAnimationSettings mass](self, "mass");
      v25 = v24;
      -[SBFAnimationSettings stiffness](self, "stiffness");
      v27 = v26;
      -[SBFAnimationSettings damping](self, "damping");
      v29 = v28;
      -[SBFAnimationSettings epsilon](self, "epsilon");
      v31 = v30;
      -[SBFAnimationSettings delay](self, "delay");
      objc_msgSend(v23, "settingsWithMass:stiffness:damping:epsilon:delay:timingFunction:", v22, v25, v27, v29, v31, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBFAnimationSettings initialVelocity](self, "initialVelocity");
      objc_msgSend(v33, "setInitialVelocity:");
    }
    else
    {
      v34 = (void *)MEMORY[0x1E0D017B0];
      -[SBFAnimationSettings duration](self, "duration");
      v36 = v35;
      -[SBFAnimationSettings delay](self, "delay");
      objc_msgSend(v34, "settingsWithDuration:delay:timingFunction:", v22, v36, v37);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
    }
    speed = self->_speed;
    *(float *)&speed = speed;
    objc_msgSend(v33, "setSpeed:", speed);
    -[SBFAnimationSettings preferredFrameRateRange](self, "preferredFrameRateRange");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "frameRateRange");
    IsEqualToRange = CAFrameRateRangeIsEqualToRange(v48, *MEMORY[0x1E0CD23C0]);

    if (IsEqualToRange)
    {
      frameRate = self->_frameRate;
      if (frameRate)
        objc_msgSend(v33, "setFrameInterval:", 1.0 / (double)frameRate);
    }
    else
    {
      -[PTFrameRateRangeSettings frameRateRange](self->_preferredFrameRateRange, "frameRateRange");
      objc_msgSend(v33, "setPreferredFrameRateRange:");
    }
    -[SBFAnimationSettings preferredFrameRateRange](self, "preferredFrameRateRange");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "highFrameRateReason");

    if (v43)
    {
      -[SBFAnimationSettings preferredFrameRateRange](self, "preferredFrameRateRange");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setHighFrameRateReason:", objc_msgSend(v44, "highFrameRateReason"));

    }
    v45 = (BSAnimationSettings *)objc_msgSend(v33, "copy");
    v46 = self->_exportedSettings;
    self->_exportedSettings = v45;

    exportedSettings = self->_exportedSettings;
  }
  return exportedSettings;
}

+ (BOOL)ignoresKey:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("calculatedDuration")) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("speed"));

  return v4;
}

- (SBFAnimationSettings)initWithDefaultValues
{
  SBFAnimationSettings *v2;
  SBFAnimationSettings *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBFAnimationSettings;
  v2 = -[PTSettings initWithDefaultValues](&v5, sel_initWithDefaultValues);
  v3 = v2;
  if (v2)
    -[PTSettings addKeyPathObserver:](v2, "addKeyPathObserver:", v2);
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[PTSettings removeKeyPathObserver:](self, "removeKeyPathObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)SBFAnimationSettings;
  -[PTSettings dealloc](&v3, sel_dealloc);
}

- (void)setDefaultValues
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBFAnimationSettings;
  -[PTSettings setDefaultValues](&v4, sel_setDefaultValues);
  -[SBFAnimationSettings setAnimationType:](self, "setAnimationType:", 0);
  -[SBFAnimationSettings setCurve:](self, "setCurve:", 0);
  -[SBFAnimationSettings setDuration:](self, "setDuration:", 0.3);
  -[SBFAnimationSettings setDelay:](self, "setDelay:", 0.0);
  -[SBFAnimationSettings setMass:](self, "setMass:", 1.0);
  -[SBFAnimationSettings setStiffness:](self, "setStiffness:", 1000.0);
  -[SBFAnimationSettings setDamping:](self, "setDamping:", 500.0);
  -[SBFAnimationSettings setInitialVelocity:](self, "setInitialVelocity:", 0.0);
  -[SBFAnimationSettings setSpeed:](self, "setSpeed:", 1.0);
  -[SBFAnimationSettings setFrameRate:](self, "setFrameRate:", 0);
  -[SBFAnimationSettings preferredFrameRateRange](self, "preferredFrameRateRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDefaultValues");

}

- (void)settings:(id)a3 changedValueForKeyPath:(id)a4
{
  id v6;
  id v7;
  BSAnimationSettings *exportedSettings;
  objc_super v9;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("calculatedDuration")) & 1) == 0)
  {
    exportedSettings = self->_exportedSettings;
    self->_exportedSettings = 0;

    -[PTSettings invalidateValueForKey:](self, "invalidateValueForKey:", CFSTR("calculatedDuration"));
  }
  v9.receiver = self;
  v9.super_class = (Class)SBFAnimationSettings;
  -[PTSettings settings:changedValueForKeyPath:](&v9, sel_settings_changedValueForKeyPath_, v6, v7);

}

- (void)setSpeed:(double)a3
{
  BSAnimationSettings *exportedSettings;

  if (self->_speed != a3)
  {
    self->_speed = a3;
    exportedSettings = self->_exportedSettings;
    self->_exportedSettings = 0;

  }
}

- (void)setFrameRateRange:(CAFrameRateRange)a3 highFrameRateReason:(unsigned int)a4
{
  uint64_t v4;
  float preferred;
  float maximum;
  float minimum;
  double v8;
  double v9;
  double v10;
  id v11;

  v4 = *(_QWORD *)&a4;
  preferred = a3.preferred;
  maximum = a3.maximum;
  minimum = a3.minimum;
  -[SBFAnimationSettings preferredFrameRateRange](self, "preferredFrameRateRange");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v8 = minimum;
  *(float *)&v9 = maximum;
  *(float *)&v10 = preferred;
  objc_msgSend(v11, "setFrameRateRange:highFrameRateReason:", v4, v8, v9, v10);

}

- (double)calculatedDuration
{
  void *v2;
  double v3;
  double v4;

  -[SBFAnimationSettings BSAnimationSettings](self, "BSAnimationSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "duration");
  v4 = v3;

  return v4;
}

+ (id)settingsControllerModule
{
  return (id)objc_msgSend(a1, "_moduleWithSectionTitle:", CFSTR("Animation"));
}

+ (id)_moduleWithSectionTitle:(id)a3
{
  return (id)objc_msgSend(a1, "_moduleWithSectionTitle:delay:frameRate:", a3, 1, 1);
}

+ (id)_moduleWithSectionTitle:(id)a3 delay:(BOOL)a4 frameRate:(BOOL)a5
{
  _BOOL4 v5;
  id v6;
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  _BOOL4 v55;
  _QWORD v56[2];

  v55 = a5;
  v5 = a4;
  v56[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("animationType == %d"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("animationType == %d"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("curve == %d"), 393216);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83020], "rowWithTitle:valueKeyPath:", CFSTR("Animation"), CFSTR("animationType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "possibleValues:titles:", &unk_1E203B3F0, &unk_1E203B408);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v12);

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Duration"), CFSTR("duration"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "between:and:", 0.0, 10.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "condition:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v15);

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Delay"), CFSTR("delay"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "between:and:", -1.0, 10.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v17);

  }
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Mass"), CFSTR("mass"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "between:and:", 0.0, 10000.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "condition:", v7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v20);

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Stiffness"), CFSTR("stiffness"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "between:and:", 0.0, 1000000.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "precision:", 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "condition:", v7);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v24);

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Damping"), CFSTR("damping"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "between:and:", 0.0, 1000000.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "precision:", 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "condition:", v7);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v28);

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Epsilon"), CFSTR("epsilon"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "between:and:", 0.0, 0.5);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "precision:", 4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "condition:", v7);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v32);

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Initial Velocity"), CFSTR("initialVelocity"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "between:and:", 0.0, 10000.0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "precision:", 2);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "condition:", v7);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v36);

  +[SBReadonlyRow rowWithTitle:valueKeyPath:](SBReadonlyRow, "rowWithTitle:valueKeyPath:", CFSTR("Calculated Duration"), CFSTR("calculatedDuration"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "condition:", v7);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "valueFormatter:", &__block_literal_global_27);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v39);

  objc_msgSend(MEMORY[0x1E0D83020], "rowWithTitle:valueKeyPath:", CFSTR("Curve"), CFSTR("curve"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "possibleValues:titles:", &unk_1E203B438, &unk_1E203B420);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v41);

  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Control Point 1"), CFSTR("controlPoint1Settings"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "condition:", v9);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v43);

  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Control Point 2"), CFSTR("controlPoint2Settings"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "condition:", v9);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v45);

  if (v55)
  {
    objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Frame Rate Range"), CFSTR("preferredFrameRateRange"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v46);

    objc_msgSend(MEMORY[0x1E0D83020], "rowWithTitle:valueKeyPath:", CFSTR("Frame Rate (Deprecated)"), CFSTR("frameRate"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "possibleValues:titles:", &unk_1E203B480, &unk_1E203B450);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "possibleShortTitles:", &unk_1E203B468);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v49);

  }
  v50 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D83070], "sectionWithRows:title:", v10, v6);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = v51;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 1);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "moduleWithTitle:contents:", 0, v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  return v53;
}

uint64_t __64__SBFAnimationSettings__moduleWithSectionTitle_delay_frameRate___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a2, "doubleValue");
  return objc_msgSend(v2, "stringWithFormat:", CFSTR("%g"), v3);
}

- (int64_t)animationType
{
  return self->_animationType;
}

- (void)setAnimationType:(int64_t)a3
{
  self->_animationType = a3;
}

- (double)delay
{
  return self->_delay;
}

- (void)setDelay:(double)a3
{
  self->_delay = a3;
}

- (unint64_t)frameRate
{
  return self->_frameRate;
}

- (void)setFrameRate:(unint64_t)a3
{
  self->_frameRate = a3;
}

- (unint64_t)curve
{
  return self->_curve;
}

- (void)setCurve:(unint64_t)a3
{
  self->_curve = a3;
}

- (PTPointSettings)controlPoint1Settings
{
  return self->_controlPoint1Settings;
}

- (void)setControlPoint1Settings:(id)a3
{
  objc_storeStrong((id *)&self->_controlPoint1Settings, a3);
}

- (PTPointSettings)controlPoint2Settings
{
  return self->_controlPoint2Settings;
}

- (void)setControlPoint2Settings:(id)a3
{
  objc_storeStrong((id *)&self->_controlPoint2Settings, a3);
}

- (PTFrameRateRangeSettings)preferredFrameRateRange
{
  return self->_preferredFrameRateRange;
}

- (void)setPreferredFrameRateRange:(id)a3
{
  objc_storeStrong((id *)&self->_preferredFrameRateRange, a3);
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (double)mass
{
  return self->_mass;
}

- (void)setMass:(double)a3
{
  self->_mass = a3;
}

- (double)stiffness
{
  return self->_stiffness;
}

- (void)setStiffness:(double)a3
{
  self->_stiffness = a3;
}

- (double)damping
{
  return self->_damping;
}

- (void)setDamping:(double)a3
{
  self->_damping = a3;
}

- (double)epsilon
{
  return self->_epsilon;
}

- (void)setEpsilon:(double)a3
{
  self->_epsilon = a3;
}

- (double)initialVelocity
{
  return self->_initialVelocity;
}

- (void)setInitialVelocity:(double)a3
{
  self->_initialVelocity = a3;
}

- (double)speed
{
  return self->_speed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredFrameRateRange, 0);
  objc_storeStrong((id *)&self->_controlPoint2Settings, 0);
  objc_storeStrong((id *)&self->_controlPoint1Settings, 0);
  objc_storeStrong((id *)&self->_exportedSettings, 0);
}

@end
