@implementation SBAttentionAwarenessSettings

- (BOOL)shouldUseAttentionSensor
{
  return self->_allowsAttentionAwareAutoLock && self->_supportsAttentionSensor && self->_shouldUseAttentionSensor;
}

+ (BOOL)attentionSensorSupported
{
  return ((unint64_t)objc_msgSend(MEMORY[0x1E0CFEC08], "supportedEvents") >> 7) & 1;
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
  _QWORD v20[5];

  v20[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Enable Attention Sensor(s)"), CFSTR("shouldUseAttentionSensor"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Sample Interval"), CFSTR("sampleInterval"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "between:and:", 0.0, 300.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "precision:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Dim Interval"), CFSTR("dimInterval"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "between:and:", 0.0, 300.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "precision:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Sleep Interval"), CFSTR("sleepInterval"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "between:and:", 0.0, 300.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "precision:", 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0D83070];
  v20[0] = v2;
  v20[1] = v5;
  v20[2] = v8;
  v20[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sectionWithRows:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0D83070];
  v19 = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "moduleWithTitle:contents:", CFSTR("Attention Awareness"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterObserver:", self);

  objc_msgSend(MEMORY[0x1E0CFEC08], "cancelNotification:", self->_attentionAwarenessToken);
  v4.receiver = self;
  v4.super_class = (Class)SBAttentionAwarenessSettings;
  -[PTSettings dealloc](&v4, sel_dealloc);
}

- (void)setShouldUseAttentionSensor:(BOOL)a3
{
  self->_shouldUseAttentionSensor = a3;
}

- (void)setDefaultValues
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  self->_supportsAttentionSensor = objc_msgSend((id)objc_opt_class(), "attentionSensorSupported");
  self->_shouldUseAttentionSensor = 1;
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAttentionAwarenessSettings profileConnectionDidReceiveEffectiveSettingsChangedNotification:userInfo:](self, "profileConnectionDidReceiveEffectiveSettingsChangedNotification:userInfo:", v3, 0);

  if (!self->_isObservingDataSources)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __48__SBAttentionAwarenessSettings_setDefaultValues__block_invoke;
    v5[3] = &unk_1E8E9DED8;
    v5[4] = self;
    self->_attentionAwarenessToken = (AWNotification_s *)objc_msgSend(MEMORY[0x1E0CFEC08], "notifySupportedEventsChangedWithQueue:block:", MEMORY[0x1E0C80D38], v5);
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "registerObserver:", self);

    self->_isObservingDataSources = 1;
  }
  -[SBAttentionAwarenessSettings setSampleInterval:](self, "setSampleInterval:", 4.0);
  -[SBAttentionAwarenessSettings setDimInterval:](self, "setDimInterval:", 20.0);
  -[SBAttentionAwarenessSettings setSleepInterval:](self, "setSleepInterval:", 30.0);
}

uint64_t __48__SBAttentionAwarenessSettings_setDefaultValues__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_opt_class(), "attentionSensorSupported");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 49) = result;
  return result;
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  self->_allowsAttentionAwareAutoLock = objc_msgSend(a3, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D46F50], a4) != 2;
}

- (double)sampleInterval
{
  return self->_sampleInterval;
}

- (void)setSampleInterval:(double)a3
{
  self->_sampleInterval = a3;
}

- (double)dimInterval
{
  return self->_dimInterval;
}

- (void)setDimInterval:(double)a3
{
  self->_dimInterval = a3;
}

- (double)sleepInterval
{
  return self->_sleepInterval;
}

- (void)setSleepInterval:(double)a3
{
  self->_sleepInterval = a3;
}

@end
