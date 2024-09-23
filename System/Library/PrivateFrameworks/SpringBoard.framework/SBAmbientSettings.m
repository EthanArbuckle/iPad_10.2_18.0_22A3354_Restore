@implementation SBAmbientSettings

- (void)setDefaultValues
{
  int v3;
  int64_t idleTimerWarnMode;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBAmbientSettings;
  -[PTSettings setDefaultValues](&v5, sel_setDefaultValues);
  v3 = MGGetBoolAnswer();
  self->_enableSuppression = v3;
  if (v3)
  {
    self->_idleTimerDuration = 14;
    idleTimerWarnMode = 1;
    self->_idleTimerWarnMode = 1;
    self->_suppressedIdleTimerDuration = 7;
  }
  else
  {
    self->_idleTimerDuration = 7;
    self->_idleTimerWarnMode = 1;
    self->_suppressedIdleTimerDuration = self->_idleTimerDuration;
    idleTimerWarnMode = self->_idleTimerWarnMode;
  }
  self->_suppressedIdleTimerWarnMode = idleTimerWarnMode;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  void *v31;
  _QWORD v32[2];
  void *v33;
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[5];
  _QWORD v38[7];

  v38[5] = *MEMORY[0x1E0C80C00];
  v37[0] = &unk_1E91D0DB8;
  v37[1] = &unk_1E91D0DD0;
  v38[0] = CFSTR("Locked");
  v38[1] = CFSTR("Ambient Extended");
  v37[2] = &unk_1E91D0DE8;
  v37[3] = &unk_1E91D0E00;
  v38[2] = CFSTR("Deep Interaction");
  v38[3] = CFSTR("Unlocked");
  v37[4] = &unk_1E91D0E18;
  v38[4] = CFSTR("Forever");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = &unk_1E91D0E30;
  v35[1] = &unk_1E91D0DB8;
  v36[0] = CFSTR("Warn");
  v36[1] = CFSTR("Disabled");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBAmbientChoiceRow rowWithTitle:valueKeyPath:](SBAmbientChoiceRow, "rowWithTitle:valueKeyPath:", CFSTR("Duration"), CFSTR("idleTimerDuration"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setPossibleChoicesFromDictionary:order:", v2, &unk_1E91CE848);
  +[SBAmbientChoiceRow rowWithTitle:valueKeyPath:](SBAmbientChoiceRow, "rowWithTitle:valueKeyPath:", CFSTR("Warning"), CFSTR("idleTimerWarnMode"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setPossibleChoicesFromDictionary:order:", v3, &unk_1E91CE860);
  v4 = (void *)MEMORY[0x1E0D83070];
  v34[0] = v29;
  v34[1] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionWithRows:title:", v5, CFSTR("Idle Timer Behavior"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Enable Suppression"), CFSTR("enableSuppression"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0D83070];
  v33 = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", objc_msgSend(MEMORY[0x1E0CA56D8], "isAvailable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionWithRows:title:condition:", v7, CFSTR("Suppression"), v8);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  +[SBAmbientChoiceRow rowWithTitle:valueKeyPath:](SBAmbientChoiceRow, "rowWithTitle:valueKeyPath:", CFSTR("Duration"), CFSTR("suppressedIdleTimerDuration"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPossibleChoicesFromDictionary:order:", v2, &unk_1E91CE878);
  +[SBAmbientChoiceRow rowWithTitle:valueKeyPath:](SBAmbientChoiceRow, "rowWithTitle:valueKeyPath:", CFSTR("Warning"), CFSTR("suppressedIdleTimerWarnMode"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPossibleChoicesFromDictionary:order:", v3, &unk_1E91CE890);
  v11 = (void *)MEMORY[0x1E0D83070];
  v32[0] = v9;
  v32[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("enableSuppression == YES"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sectionWithRows:title:condition:", v12, CFSTR("Idle Timer Behavior During Suppression"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0D83008];
  objc_msgSend(MEMORY[0x1E0D83088], "actionWithSettingsKeyPath:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "rowWithTitle:action:", CFSTR("Restore Defaults"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0D83070];
  v31 = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sectionWithRows:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)MEMORY[0x1E0D83070];
  v30[0] = v26;
  v30[1] = v25;
  v30[2] = v14;
  v30[3] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "moduleWithTitle:contents:", CFSTR("Domino"), v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (int64_t)idleTimerDuration
{
  return self->_idleTimerDuration;
}

- (void)setIdleTimerDuration:(int64_t)a3
{
  self->_idleTimerDuration = a3;
}

- (int64_t)idleTimerWarnMode
{
  return self->_idleTimerWarnMode;
}

- (void)setIdleTimerWarnMode:(int64_t)a3
{
  self->_idleTimerWarnMode = a3;
}

- (BOOL)enableSuppression
{
  return self->_enableSuppression;
}

- (void)setEnableSuppression:(BOOL)a3
{
  self->_enableSuppression = a3;
}

- (int64_t)suppressedIdleTimerDuration
{
  return self->_suppressedIdleTimerDuration;
}

- (void)setSuppressedIdleTimerDuration:(int64_t)a3
{
  self->_suppressedIdleTimerDuration = a3;
}

- (int64_t)suppressedIdleTimerWarnMode
{
  return self->_suppressedIdleTimerWarnMode;
}

- (void)setSuppressedIdleTimerWarnMode:(int64_t)a3
{
  self->_suppressedIdleTimerWarnMode = a3;
}

@end
