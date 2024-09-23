@implementation WFAlarmTrigger

- (WFAlarmTrigger)init
{
  WFAlarmTrigger *v2;
  WFAlarmTrigger *v3;
  NSArray *alarmIDs;
  NSArray *v5;
  NSArray *cachedAlarmDescriptions;
  WFAlarmTrigger *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WFAlarmTrigger;
  v2 = -[WFTrigger init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_alarmType = 0;
    alarmIDs = v2->_alarmIDs;
    v5 = (NSArray *)MEMORY[0x1E0C9AA60];
    v2->_alarmIDs = (NSArray *)MEMORY[0x1E0C9AA60];

    cachedAlarmDescriptions = v3->_cachedAlarmDescriptions;
    v3->_cachedAlarmDescriptions = v5;

    v3->_alarmState = 2;
    v7 = v3;
  }

  return v3;
}

- (BOOL)hasValidConfiguration
{
  void *v3;
  uint64_t v4;
  BOOL result;

  result = (-[WFAlarmTrigger alarmType](self, "alarmType") != 1
         || (-[WFAlarmTrigger alarmIDs](self, "alarmIDs"),
             v3 = (void *)objc_claimAutoreleasedReturnValue(),
             v4 = objc_msgSend(v3, "count"),
             v3,
             v4))
        && (-[WFAlarmTrigger alarmState](self, "alarmState") == 1
         || -[WFAlarmTrigger alarmState](self, "alarmState") == 2
         || !-[WFAlarmTrigger alarmState](self, "alarmState"));
  return result;
}

- (id)localizedDescriptionWithConfigurationSummary
{
  void *v2;
  int64_t v4;
  int64_t v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  int64_t v9;
  void *v10;
  __CFString *v11;
  int64_t v12;
  int64_t v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v17;

  v4 = -[WFAlarmTrigger alarmType](self, "alarmType");
  if (v4 != 2)
  {
    if (v4 != 1)
    {
      if (!v4)
      {
        v5 = -[WFAlarmTrigger alarmState](self, "alarmState");
        switch(v5)
        {
          case 2:
            v6 = CFSTR("When any alarm is stopped");
            goto LABEL_25;
          case 1:
            v6 = CFSTR("When any alarm is snoozed");
            goto LABEL_25;
          case 0:
            v6 = CFSTR("When any alarm goes off");
LABEL_25:
            WFLocalizedString(v6);
            v2 = (void *)objc_claimAutoreleasedReturnValue();
            return v2;
        }
      }
      return v2;
    }
    -[WFAlarmTrigger alarmIDs](self, "alarmIDs");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v2, "count");

    if (v7 != 1)
    {
      v13 = -[WFAlarmTrigger alarmState](self, "alarmState");
      if (v13 == 2)
      {
        v14 = (void *)MEMORY[0x1E0CB3940];
        v15 = CFSTR("When any of %lu alarms is stopped");
      }
      else if (v13 == 1)
      {
        v14 = (void *)MEMORY[0x1E0CB3940];
        v15 = CFSTR("When any of %lu alarms is snoozed");
      }
      else
      {
        if (v13)
          return v2;
        v14 = (void *)MEMORY[0x1E0CB3940];
        v15 = CFSTR("When any of %lu alarms go off");
      }
      WFLocalizedPluralString(v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringWithFormat:", v17, v7);
      v2 = (void *)objc_claimAutoreleasedReturnValue();

      return v2;
    }
    -[WFAlarmTrigger cachedAlarmDescriptions](self, "cachedAlarmDescriptions");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = -[WFAlarmTrigger alarmState](self, "alarmState");
    if (v9 == 2)
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      v11 = CFSTR("When my %@ alarm is stopped");
    }
    else if (v9 == 1)
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      v11 = CFSTR("When my %@ alarm is snoozed");
    }
    else
    {
      if (v9)
      {
LABEL_29:

        return v2;
      }
      v10 = (void *)MEMORY[0x1E0CB3940];
      v11 = CFSTR("When my %@ alarm goes off");
    }
    WFLocalizedString(v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringWithFormat:", v16, v8);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_29;
  }
  v12 = -[WFAlarmTrigger alarmState](self, "alarmState");
  switch(v12)
  {
    case 2:
      v6 = CFSTR("When my wake-up alarm is stopped");
      goto LABEL_25;
    case 1:
      v6 = CFSTR("When my wake-up alarm is snoozed");
      goto LABEL_25;
    case 0:
      v6 = CFSTR("When my wake-up alarm goes off");
      goto LABEL_25;
  }
  return v2;
}

- (id)localizedPastTenseDescription
{
  void *v2;
  int64_t v4;
  int64_t v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  int64_t v9;
  void *v10;
  __CFString *v11;
  int64_t v12;
  int64_t v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v17;

  v4 = -[WFAlarmTrigger alarmType](self, "alarmType");
  if (v4 != 2)
  {
    if (v4 != 1)
    {
      if (!v4)
      {
        v5 = -[WFAlarmTrigger alarmState](self, "alarmState");
        switch(v5)
        {
          case 2:
            v6 = CFSTR("Any alarm stopped");
            goto LABEL_25;
          case 1:
            v6 = CFSTR("Any alarm snoozed");
            goto LABEL_25;
          case 0:
            v6 = CFSTR("Any alarm went off");
LABEL_25:
            WFLocalizedString(v6);
            v2 = (void *)objc_claimAutoreleasedReturnValue();
            return v2;
        }
      }
      return v2;
    }
    -[WFAlarmTrigger alarmIDs](self, "alarmIDs");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v2, "count");

    if (v7 != 1)
    {
      v13 = -[WFAlarmTrigger alarmState](self, "alarmState");
      if (v13 == 2)
      {
        v14 = (void *)MEMORY[0x1E0CB3940];
        v15 = CFSTR("Any of %lu alarms stopped");
      }
      else if (v13 == 1)
      {
        v14 = (void *)MEMORY[0x1E0CB3940];
        v15 = CFSTR("Any of %lu alarms snoozed");
      }
      else
      {
        if (v13)
          return v2;
        v14 = (void *)MEMORY[0x1E0CB3940];
        v15 = CFSTR("Any of %lu alarms went off");
      }
      WFLocalizedPluralString(v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringWithFormat:", v17, v7);
      v2 = (void *)objc_claimAutoreleasedReturnValue();

      return v2;
    }
    -[WFAlarmTrigger cachedAlarmDescriptions](self, "cachedAlarmDescriptions");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = -[WFAlarmTrigger alarmState](self, "alarmState");
    if (v9 == 2)
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      v11 = CFSTR("My %@ alarm stopped");
    }
    else if (v9 == 1)
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      v11 = CFSTR("My %@ alarm snoozed");
    }
    else
    {
      if (v9)
      {
LABEL_29:

        return v2;
      }
      v10 = (void *)MEMORY[0x1E0CB3940];
      v11 = CFSTR("My %@ went off");
    }
    WFLocalizedString(v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringWithFormat:", v16, v8);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_29;
  }
  v12 = -[WFAlarmTrigger alarmState](self, "alarmState");
  switch(v12)
  {
    case 2:
      v6 = CFSTR("My wake-up alarm stopped");
      goto LABEL_25;
    case 1:
      v6 = CFSTR("My wake-up alarm snoozed");
      goto LABEL_25;
    case 0:
      v6 = CFSTR("My wake-up alarm went off");
      goto LABEL_25;
  }
  return v2;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WFAlarmTrigger;
  v4 = a3;
  -[WFTrigger encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[WFAlarmTrigger alarmType](self, "alarmType", v9.receiver, v9.super_class));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("alarmType"));

  -[WFAlarmTrigger alarmIDs](self, "alarmIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("alarmIDs"));

  -[WFAlarmTrigger cachedAlarmDescriptions](self, "cachedAlarmDescriptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("cachedAlarmDescriptions"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[WFAlarmTrigger alarmState](self, "alarmState"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("alarmState"));

}

- (WFAlarmTrigger)initWithCoder:(id)a3
{
  id v4;
  WFAlarmTrigger *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  WFAlarmTrigger *v29;
  objc_super v31;
  uint8_t buf[4];
  const char *v33;
  _QWORD v34[2];
  _QWORD v35[3];

  v35[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)WFAlarmTrigger;
  v5 = -[WFTrigger initWithCoder:](&v31, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("alarmType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      -[WFAlarmTrigger setAlarmType:](v5, "setAlarmType:", objc_msgSend(v6, "integerValue"));
      v8 = (void *)MEMORY[0x1E0C99E60];
      v35[0] = objc_opt_class();
      v35[1] = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setWithArray:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("alarmIDs"));
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v11;
      v13 = MEMORY[0x1E0C9AA60];
      if (v11)
        v14 = v11;
      else
        v14 = MEMORY[0x1E0C9AA60];
      -[WFAlarmTrigger setAlarmIDs:](v5, "setAlarmIDs:", v14);

      v15 = (void *)MEMORY[0x1E0C99E60];
      v34[0] = objc_opt_class();
      v34[1] = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setWithArray:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("cachedAlarmDescriptions"));
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)v18;
      if (v18)
        v20 = v18;
      else
        v20 = v13;
      -[WFAlarmTrigger setCachedAlarmDescriptions:](v5, "setCachedAlarmDescriptions:", v20);

      if (-[WFAlarmTrigger alarmType](v5, "alarmType") == 1)
      {
        -[WFAlarmTrigger alarmIDs](v5, "alarmIDs");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "count");

        if (!v22)
        {
          getWFTriggersLogObject();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            v33 = "-[WFAlarmTrigger initWithCoder:]";
            _os_log_impl(&dword_1C15B3000, v23, OS_LOG_TYPE_ERROR, "%s alarm type existing, but no alarmIDs", buf, 0xCu);
          }

          -[WFAlarmTrigger setAlarmType:](v5, "setAlarmType:", 0);
        }
      }
    }
    else
    {
      -[WFAlarmTrigger setAlarmType:](v5, "setAlarmType:", 0);
      -[WFAlarmTrigger setAlarmIDs:](v5, "setAlarmIDs:", MEMORY[0x1E0C9AA60]);
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("alarmState"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v24)
      v26 = objc_msgSend(v24, "integerValue");
    else
      v26 = 2;
    -[WFAlarmTrigger setAlarmState:](v5, "setAlarmState:", v26);
    objc_msgSend(MEMORY[0x1E0DC7AC8], "currentDevice");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v27, "idiom") == 1)
    {
      v28 = -[WFAlarmTrigger alarmType](v5, "alarmType");

      if (v28 == 2)
        -[WFAlarmTrigger setAlarmType:](v5, "setAlarmType:", 1);
    }
    else
    {

    }
    v29 = v5;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WFAlarmTrigger;
  v4 = -[WFTrigger copyWithZone:](&v10, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setAlarmType:", -[WFAlarmTrigger alarmType](self, "alarmType"));
  -[WFAlarmTrigger alarmIDs](self, "alarmIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setAlarmIDs:", v6);

  -[WFAlarmTrigger cachedAlarmDescriptions](self, "cachedAlarmDescriptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setCachedAlarmDescriptions:", v8);

  objc_msgSend(v4, "setAlarmState:", -[WFAlarmTrigger alarmState](self, "alarmState"));
  return v4;
}

- (id)suggestedActions
{
  void *v2;
  void *v3;

  +[WFActionRegistry sharedRegistry](WFActionRegistry, "sharedRegistry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createActionsWithIdentifiers:serializedParameterArray:", &unk_1E7B8DA90, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)alarmType
{
  return self->_alarmType;
}

- (void)setAlarmType:(int64_t)a3
{
  self->_alarmType = a3;
}

- (NSArray)alarmIDs
{
  return self->_alarmIDs;
}

- (void)setAlarmIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)cachedAlarmDescriptions
{
  return self->_cachedAlarmDescriptions;
}

- (void)setCachedAlarmDescriptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)alarmState
{
  return self->_alarmState;
}

- (void)setAlarmState:(int64_t)a3
{
  self->_alarmState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedAlarmDescriptions, 0);
  objc_storeStrong((id *)&self->_alarmIDs, 0);
}

+ (BOOL)isAllowedToRunAutomatically
{
  return 1;
}

+ (id)localizedDisplayName
{
  return WFLocalizedString(CFSTR("Alarm"));
}

+ (id)localizedDisplayExplanation
{
  return WFLocalizedString(CFSTR("Ex. “When my alarm is stopped”"));
}

+ (id)displayGlyphName
{
  return CFSTR("clock.fill");
}

+ (int64_t)triggerBacking
{
  return 2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
