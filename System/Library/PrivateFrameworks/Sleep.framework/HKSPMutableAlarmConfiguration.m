@implementation HKSPMutableAlarmConfiguration

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  HKSPChangeSet *changeSet;
  HKSPChange *v10;
  void *v11;
  void *v12;
  HKSPChange *v13;
  id v14;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "allProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HKSPAlarmEnabled"));
  v14 = (id)objc_claimAutoreleasedReturnValue();

  -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  if ((_DWORD)v8 != v3
    || -[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPAlarmEnabled")))
  {
    changeSet = self->_changeSet;
    v10 = [HKSPChange alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HKSPChange initWithProperty:changedValue:originalValue:](v10, "initWithProperty:changedValue:originalValue:", v14, v11, v12);
    -[HKSPChangeSet addChange:](changeSet, "addChange:", v13);

  }
}

- (BOOL)isEnabled
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  objc_msgSend((id)objc_opt_class(), "allProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HKSPAlarmEnabled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPAlarmEnabled")))
  {
    -[HKSPChangeSet changedValueForPropertyIdentifier:](self->_changeSet, "changedValueForPropertyIdentifier:", CFSTR("HKSPAlarmEnabled"));
  }
  else
  {
    -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  return v7;
}

- (void)setAllowsSnooze:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  HKSPChangeSet *changeSet;
  HKSPChange *v10;
  void *v11;
  void *v12;
  HKSPChange *v13;
  id v14;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "allProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HKSPAlarmAllowsSnooze"));
  v14 = (id)objc_claimAutoreleasedReturnValue();

  -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  if ((_DWORD)v8 != v3
    || -[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPAlarmAllowsSnooze")))
  {
    changeSet = self->_changeSet;
    v10 = [HKSPChange alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HKSPChange initWithProperty:changedValue:originalValue:](v10, "initWithProperty:changedValue:originalValue:", v14, v11, v12);
    -[HKSPChangeSet addChange:](changeSet, "addChange:", v13);

  }
}

- (BOOL)allowsSnooze
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  objc_msgSend((id)objc_opt_class(), "allProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HKSPAlarmAllowsSnooze"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPAlarmAllowsSnooze")))
  {
    -[HKSPChangeSet changedValueForPropertyIdentifier:](self->_changeSet, "changedValueForPropertyIdentifier:", CFSTR("HKSPAlarmAllowsSnooze"));
  }
  else
  {
    -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  return v7;
}

- (void)setBreaksThroughSilentModeOptions:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  HKSPChangeSet *changeSet;
  HKSPChange *v10;
  void *v11;
  void *v12;
  HKSPChange *v13;
  id v14;

  objc_msgSend((id)objc_opt_class(), "allProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HKSPAlarmSilentModeOptions"));
  v14 = (id)objc_claimAutoreleasedReturnValue();

  -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  if (v8 != a3
    || -[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPAlarmSilentModeOptions")))
  {
    changeSet = self->_changeSet;
    v10 = [HKSPChange alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HKSPChange initWithProperty:changedValue:originalValue:](v10, "initWithProperty:changedValue:originalValue:", v14, v11, v12);
    -[HKSPChangeSet addChange:](changeSet, "addChange:", v13);

  }
}

- (unint64_t)breaksThroughSilentModeOptions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  objc_msgSend((id)objc_opt_class(), "allProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HKSPAlarmSilentModeOptions"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPAlarmSilentModeOptions")))
  {
    -[HKSPChangeSet changedValueForPropertyIdentifier:](self->_changeSet, "changedValueForPropertyIdentifier:", CFSTR("HKSPAlarmSilentModeOptions"));
  }
  else
  {
    -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  return v7;
}

- (void)setToneIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  HKSPChangeSet *changeSet;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend((id)objc_opt_class(), "allProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HKSPAlarmToneIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!NAEqualObjects()
    || -[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPAlarmToneIdentifier")))
  {
    objc_msgSend(v6, "isRelationshipProperty");
    v8 = (objc_class *)objc_opt_class();
    changeSet = self->_changeSet;
    v10 = (void *)objc_msgSend([v8 alloc], "initWithProperty:changedValue:originalValue:", v6, v11, v7);
    -[HKSPChangeSet addChange:](changeSet, "addChange:", v10);

  }
}

- (NSString)toneIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend((id)objc_opt_class(), "allProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HKSPAlarmToneIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPAlarmToneIdentifier")))
  {
    -[HKSPChangeSet changedValueForPropertyIdentifier:](self->_changeSet, "changedValueForPropertyIdentifier:", CFSTR("HKSPAlarmToneIdentifier"));
  }
  else
  {
    -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)setVibrationIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  HKSPChangeSet *changeSet;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend((id)objc_opt_class(), "allProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HKSPAlarmVibrationIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!NAEqualObjects()
    || -[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPAlarmVibrationIdentifier")))
  {
    objc_msgSend(v6, "isRelationshipProperty");
    v8 = (objc_class *)objc_opt_class();
    changeSet = self->_changeSet;
    v10 = (void *)objc_msgSend([v8 alloc], "initWithProperty:changedValue:originalValue:", v6, v11, v7);
    -[HKSPChangeSet addChange:](changeSet, "addChange:", v10);

  }
}

- (NSString)vibrationIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend((id)objc_opt_class(), "allProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HKSPAlarmVibrationIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPAlarmVibrationIdentifier")))
  {
    -[HKSPChangeSet changedValueForPropertyIdentifier:](self->_changeSet, "changedValueForPropertyIdentifier:", CFSTR("HKSPAlarmVibrationIdentifier"));
  }
  else
  {
    -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)setSoundVolume:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  HKSPChangeSet *changeSet;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend((id)objc_opt_class(), "allProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HKSPAlarmSoundVolume"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!NAEqualObjects()
    || -[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPAlarmSoundVolume")))
  {
    objc_msgSend(v6, "isRelationshipProperty");
    v8 = (objc_class *)objc_opt_class();
    changeSet = self->_changeSet;
    v10 = (void *)objc_msgSend([v8 alloc], "initWithProperty:changedValue:originalValue:", v6, v11, v7);
    -[HKSPChangeSet addChange:](changeSet, "addChange:", v10);

  }
}

- (NSNumber)soundVolume
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend((id)objc_opt_class(), "allProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HKSPAlarmSoundVolume"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPAlarmSoundVolume")))
  {
    -[HKSPChangeSet changedValueForPropertyIdentifier:](self->_changeSet, "changedValueForPropertyIdentifier:", CFSTR("HKSPAlarmSoundVolume"));
  }
  else
  {
    -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v6;
}

- (HKSPMutableAlarmConfiguration)init
{
  HKSPMutableAlarmConfiguration *v2;
  HKSPAlarmConfiguration *v3;
  HKSPObject *originalObject;
  HKSPChangeSet *v5;
  HKSPChangeSet *changeSet;
  HKSPMutableAlarmConfiguration *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HKSPMutableAlarmConfiguration;
  v2 = -[HKSPAlarmConfiguration init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(HKSPAlarmConfiguration);
    originalObject = v2->_originalObject;
    v2->_originalObject = (HKSPObject *)v3;

    v5 = objc_alloc_init(HKSPChangeSet);
    changeSet = v2->_changeSet;
    v2->_changeSet = v5;

    v7 = v2;
  }

  return v2;
}

- (id)initFromObject:(id)a3
{
  id v5;
  HKSPMutableAlarmConfiguration *v6;
  uint64_t v7;
  HKSPObject *originalObject;
  HKSPChangeSet *v9;
  HKSPChangeSet *changeSet;
  HKSPMutableAlarmConfiguration *v11;
  void *v13;
  objc_super v14;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKSPAlarmConfiguration.m"), 194, CFSTR("object must be a subclass"));

  }
  v14.receiver = self;
  v14.super_class = (Class)HKSPMutableAlarmConfiguration;
  v6 = -[HKSPAlarmConfiguration init](&v14, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copyWithZone:", 0);
    originalObject = v6->_originalObject;
    v6->_originalObject = (HKSPObject *)v7;

    v9 = objc_alloc_init(HKSPChangeSet);
    changeSet = v6->_changeSet;
    v6->_changeSet = v9;

    v11 = v6;
  }

  return v6;
}

- (HKSPMutableAlarmConfiguration)initWithCoder:(id)a3
{
  id v4;
  HKSPMutableAlarmConfiguration *v5;
  uint64_t v6;
  HKSPObject *originalObject;
  uint64_t v8;
  HKSPChangeSet *changeSet;
  HKSPMutableAlarmConfiguration *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKSPMutableAlarmConfiguration;
  v5 = -[HKSPAlarmConfiguration init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HKSPOriginalObject"));
    v6 = objc_claimAutoreleasedReturnValue();
    originalObject = v5->_originalObject;
    v5->_originalObject = (HKSPObject *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HKSPChangeSet"));
    v8 = objc_claimAutoreleasedReturnValue();
    changeSet = v5->_changeSet;
    v5->_changeSet = (HKSPChangeSet *)v8;

    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  HKSPObject *originalObject;
  id v5;

  originalObject = self->_originalObject;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", originalObject, CFSTR("HKSPOriginalObject"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_changeSet, CFSTR("HKSPChangeSet"));

}

- (HKSPMutableAlarmConfiguration)initWithTemplateAlarmConfiguration:(id)a3
{
  id v4;
  HKSPMutableAlarmConfiguration *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = -[HKSPMutableAlarmConfiguration init](self, "init");
  if (v5)
  {
    -[HKSPMutableAlarmConfiguration setEnabled:](v5, "setEnabled:", objc_msgSend(v4, "isEnabled"));
    -[HKSPMutableAlarmConfiguration setAllowsSnooze:](v5, "setAllowsSnooze:", objc_msgSend(v4, "allowsSnooze"));
    -[HKSPMutableAlarmConfiguration setBreaksThroughSilentModeOptions:](v5, "setBreaksThroughSilentModeOptions:", objc_msgSend(v4, "breaksThroughSilentModeOptions"));
    objc_msgSend(v4, "toneIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSPMutableAlarmConfiguration setToneIdentifier:](v5, "setToneIdentifier:", v6);

    objc_msgSend(v4, "vibrationIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSPMutableAlarmConfiguration setVibrationIdentifier:](v5, "setVibrationIdentifier:", v7);

    objc_msgSend(v4, "soundVolume");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSPMutableAlarmConfiguration setSoundVolume:](v5, "setSoundVolume:", v8);

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[HKSPAlarmConfiguration initFromObject:]([HKSPAlarmConfiguration alloc], "initFromObject:", self);
}

- (id)mutableCopy
{
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = objc_alloc_init((Class)objc_opt_class());
  -[HKSPMutableAlarmConfiguration originalObject](self, "originalObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "copyWithZone:", 0);
  v6 = (void *)v3[7];
  v3[7] = v5;

  -[HKSPMutableAlarmConfiguration changeSet](self, "changeSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deepCopy");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v3[8];
  v3[8] = v8;

  return v3;
}

- (void)freeze
{
  HKSPObject *v3;
  HKSPObject *originalObject;

  v3 = -[HKSPAlarmConfiguration initFromObject:]([HKSPAlarmConfiguration alloc], "initFromObject:", self);
  originalObject = self->_originalObject;
  self->_originalObject = v3;

  -[HKSPMutableAlarmConfiguration revert](self, "revert");
}

- (void)revert
{
  -[HKSPChangeSet removeAllChanges](self->_changeSet, "removeAllChanges");
}

- (void)setBreaksThroughSilentMode:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  unint64_t v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isAppleWatch"))
    v6 = 1;
  else
    v6 = 2;

  if (v3)
    v7 = -[HKSPMutableAlarmConfiguration breaksThroughSilentModeOptions](self, "breaksThroughSilentModeOptions") | v6;
  else
    v7 = -[HKSPMutableAlarmConfiguration breaksThroughSilentModeOptions](self, "breaksThroughSilentModeOptions") & ~v6;
  -[HKSPMutableAlarmConfiguration setBreaksThroughSilentModeOptions:](self, "setBreaksThroughSilentModeOptions:", v7);
}

- (HKSPObject)originalObject
{
  return self->_originalObject;
}

- (HKSPChangeSet)changeSet
{
  return self->_changeSet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeSet, 0);
  objc_storeStrong((id *)&self->_originalObject, 0);
}

@end
