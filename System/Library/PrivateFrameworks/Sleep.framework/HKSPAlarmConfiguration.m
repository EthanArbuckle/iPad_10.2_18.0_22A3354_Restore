@implementation HKSPAlarmConfiguration

- (HKSPAlarmConfiguration)init
{
  HKSPAlarmConfiguration *v2;
  HKSPAlarmConfiguration *v3;
  uint64_t v4;
  NSNumber *soundVolume;
  HKSPAlarmConfiguration *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HKSPAlarmConfiguration;
  v2 = -[HKSPAlarmConfiguration init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_enabled = 257;
    *(_OWORD *)&v2->_version = xmmword_1A4F67090;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", COERCE_DOUBLE((unint64_t)COERCE_UNSIGNED_INT(1.0)));
    v4 = objc_claimAutoreleasedReturnValue();
    soundVolume = v3->_soundVolume;
    v3->_soundVolume = (NSNumber *)v4;

    v6 = v3;
  }

  return v3;
}

- (id)initFromObject:(id)a3
{
  id v4;
  id v5;
  HKSPAlarmConfiguration *v6;
  HKSPAlarmConfiguration *v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[HKSPAlarmConfiguration init](self, "init");
    HKSPCopyFromObject(v5, v6);

    self = v6;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (HKSPAlarmConfiguration)initWithCoder:(id)a3
{
  id v4;
  HKSPAlarmConfiguration *v5;
  HKSPAlarmConfiguration *v6;
  HKSPAlarmConfiguration *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKSPAlarmConfiguration;
  v5 = -[HKSPAlarmConfiguration init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    HKSPDecodeObjectWithCoder(v5, v4);
    if (-[HKSPAlarmConfiguration _needsMigrationForCoder:](v6, "_needsMigrationForCoder:", v4))
      -[HKSPAlarmConfiguration _migrateForCoder:](v6, "_migrateForCoder:", v4);
    v7 = v6;
  }

  return v6;
}

- (BOOL)_needsMigrationForCoder:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = (objc_msgSend(v3, "hksp_serializationOptions") & 1) != 0
    && (unint64_t)objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("HKSPAlarmVersion")) < 3;

  return v4;
}

- (void)_migrateForCoder:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  if (self->_version <= 3)
  {
    HKSPLogForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1A4F0E000, v4, OS_LOG_TYPE_DEFAULT, "Migrating silent mode", v5, 2u);
    }

    self->_breaksThroughSilentModeOptions = 2;
  }
  self->_version = 3;
}

- (void)encodeWithCoder:(id)a3
{
  HKSPEncodeObjectWithCoder(self, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutableCopy
{
  return -[HKSPMutableAlarmConfiguration initFromObject:]([HKSPMutableAlarmConfiguration alloc], "initFromObject:", self);
}

- (BOOL)isEqual:(id)a3
{
  return HKSPObjectsAreEqual(self, a3);
}

- (BOOL)isEquivalentTo:(id)a3
{
  return HKSPObjectsAreEquivalentWithTransformer(self, a3, &__block_literal_global_286);
}

- (NSString)description
{
  return (NSString *)-[HKSPAlarmConfiguration descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (BOOL)breaksThroughSilentMode
{
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isAppleWatch"))
    v4 = 1;
  else
    v4 = 2;

  return (-[HKSPAlarmConfiguration breaksThroughSilentModeOptions](self, "breaksThroughSilentModeOptions") & v4) != 0;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[HKSPAlarmConfiguration succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:", -[HKSPAlarmConfiguration isEnabled](self, "isEnabled"), CFSTR("enabled"));
  v5 = (id)objc_msgSend(v3, "appendBool:withName:", -[HKSPAlarmConfiguration allowsSnooze](self, "allowsSnooze"), CFSTR("allowsSnooze"));
  v6 = (id)objc_msgSend(v3, "appendBool:withName:", -[HKSPAlarmConfiguration breaksThroughSilentMode](self, "breaksThroughSilentMode"), CFSTR("breaksThroughSilentMode"));
  -[HKSPAlarmConfiguration toneIdentifier](self, "toneIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "appendObject:withName:", v7, CFSTR("toneIdentifier"));

  -[HKSPAlarmConfiguration vibrationIdentifier](self, "vibrationIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v3, "appendObject:withName:", v9, CFSTR("vibrationIdentifier"));

  -[HKSPAlarmConfiguration soundVolume](self, "soundVolume");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v3, "appendObject:withName:", v11, CFSTR("soundVolume"));

  return v3;
}

- (unint64_t)playOptions
{
  return 3;
}

- (unint64_t)version
{
  return self->_version;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)allowsSnooze
{
  return self->_allowsSnooze;
}

- (unint64_t)breaksThroughSilentModeOptions
{
  return self->_breaksThroughSilentModeOptions;
}

- (NSString)toneIdentifier
{
  return self->_toneIdentifier;
}

- (NSString)vibrationIdentifier
{
  return self->_vibrationIdentifier;
}

- (NSNumber)soundVolume
{
  return self->_soundVolume;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_soundVolume, 0);
  objc_storeStrong((id *)&self->_vibrationIdentifier, 0);
  objc_storeStrong((id *)&self->_toneIdentifier, 0);
}

@end
