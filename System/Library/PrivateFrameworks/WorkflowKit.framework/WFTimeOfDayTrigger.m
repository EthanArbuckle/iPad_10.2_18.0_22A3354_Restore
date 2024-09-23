@implementation WFTimeOfDayTrigger

- (WFTimeOfDayTrigger)init
{
  WFTimeOfDayTrigger *v2;
  WFTimeOfDayTrigger *v3;
  NSArray *daysOfWeek;
  void *v5;
  void *v6;
  uint64_t v7;
  NSDateComponents *time;
  WFTimeOfDayTrigger *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WFTimeOfDayTrigger;
  v2 = -[WFTrigger init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_event = 2;
    v2->_timeOffset = 7;
    v2->_mode = 0;
    daysOfWeek = v2->_daysOfWeek;
    v2->_daysOfWeek = (NSArray *)&unk_1E7B8DC28;

    v5 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "components:fromDate:", 96, v5);
    v7 = objc_claimAutoreleasedReturnValue();
    time = v3->_time;
    v3->_time = (NSDateComponents *)v7;

    v9 = v3;
  }

  return v3;
}

- (BOOL)hasValidConfiguration
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  BOOL v8;

  -[WFTimeOfDayTrigger time](self, "time");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = 1;
  else
    v4 = -[WFTimeOfDayTrigger event](self, "event") != 2;

  if (-[WFTimeOfDayTrigger mode](self, "mode") == 1)
  {
    -[WFTimeOfDayTrigger dayOfMonth](self, "dayOfMonth");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      v6 = v4;
    else
      v6 = 0;
    if (v6)
    {
      -[WFTimeOfDayTrigger dayOfMonth](self, "dayOfMonth");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "integerValue") > 0;

    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    -[WFTimeOfDayTrigger daysOfWeek](self, "daysOfWeek");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
      v8 = v4;
    else
      v8 = 0;
  }

  return v8;
}

- (id)localizedDescriptionWithConfigurationSummary
{
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

  if (-[WFTimeOfDayTrigger event](self, "event") == 2)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTimeOfDayTrigger time](self, "time");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dateFromComponents:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_opt_class(), "dateFormatter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringFromDate:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x1E0CB3940];
    WFLocalizedString(CFSTR("At %@"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringWithFormat:", v9, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[WFTimeOfDayTrigger localizedSunriseSunsetDescriptionForTriggerEvent:timeOffset:](WFTimeOfDayTrigger, "localizedSunriseSunsetDescriptionForTriggerEvent:timeOffset:", -[WFTimeOfDayTrigger event](self, "event"), -[WFTimeOfDayTrigger timeOffset](self, "timeOffset"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[WFTimeOfDayTrigger daysOfWeek](self, "daysOfWeek");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTimeOfDayTrigger dayOfMonth](self, "dayOfMonth");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFTimeOfDayTrigger localizedRecurrenceDescriptionForDaysOfWeek:dayOfMonth:mode:](WFTimeOfDayTrigger, "localizedRecurrenceDescriptionForDaysOfWeek:dayOfMonth:mode:", v11, v12, -[WFTimeOfDayTrigger mode](self, "mode"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0CB3940];
  WFLocalizedString(CFSTR("%1$@, %2$@"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringWithFormat:", v15, v10, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WFTimeOfDayTrigger;
  v4 = a3;
  -[WFTrigger encodeWithCoder:](&v11, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[WFTimeOfDayTrigger event](self, "event", v11.receiver, v11.super_class));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("timeOfDay"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[WFTimeOfDayTrigger timeOffset](self, "timeOffset"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("timeOfDayTimeConfiguration"));

  -[WFTimeOfDayTrigger time](self, "time");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("time"));

  -[WFTimeOfDayTrigger daysOfWeek](self, "daysOfWeek");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("daysOfWeek"));

  -[WFTimeOfDayTrigger dayOfMonth](self, "dayOfMonth");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("dayOfMonth"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[WFTimeOfDayTrigger mode](self, "mode"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("mode"));

}

- (WFTimeOfDayTrigger)initWithCoder:(id)a3
{
  id v4;
  WFTimeOfDayTrigger *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSDateComponents *time;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSArray *daysOfWeek;
  void *v17;
  uint64_t v18;
  NSNumber *dayOfMonth;
  WFTimeOfDayTrigger *v20;
  objc_super v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)WFTimeOfDayTrigger;
  v5 = -[WFTrigger initWithCoder:](&v22, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timeOfDay"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timeOfDayTimeConfiguration"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "integerValue");
    v9 = 2;
    if (v8 < 2)
      v9 = v8;
    v5->_event = v9;
    v5->_timeOffset = objc_msgSend(v7, "integerValue");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("time"));
    v10 = objc_claimAutoreleasedReturnValue();
    time = v5->_time;
    v5->_time = (NSDateComponents *)v10;

    v12 = (void *)MEMORY[0x1E0C99E60];
    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("daysOfWeek"));
    v15 = objc_claimAutoreleasedReturnValue();
    daysOfWeek = v5->_daysOfWeek;
    v5->_daysOfWeek = (NSArray *)v15;

    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("mode")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mode"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_mode = objc_msgSend(v17, "integerValue");

    }
    else
    {
      v5->_mode = 0;
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("dayOfMonth")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dayOfMonth"));
      v18 = objc_claimAutoreleasedReturnValue();
      dayOfMonth = v5->_dayOfMonth;
      v5->_dayOfMonth = (NSNumber *)v18;

    }
    v20 = v5;

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
  v10.super_class = (Class)WFTimeOfDayTrigger;
  v4 = -[WFTrigger copyWithZone:](&v10, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setEvent:", -[WFTimeOfDayTrigger event](self, "event"));
  objc_msgSend(v4, "setTimeOffset:", -[WFTimeOfDayTrigger timeOffset](self, "timeOffset"));
  -[WFTimeOfDayTrigger time](self, "time");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setTime:", v6);

  -[WFTimeOfDayTrigger daysOfWeek](self, "daysOfWeek");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setDaysOfWeek:", v8);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  WFTimeOfDayTrigger *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  WFTimeOfDayTrigger *v10;
  WFTimeOfDayTrigger *v11;
  WFTimeOfDayTrigger *v12;
  int v13;
  WFTimeOfDayTrigger *v14;
  WFTimeOfDayTrigger *v15;
  _BOOL4 v16;
  WFTimeOfDayTrigger *v17;
  void *v19;
  void *v20;
  WFTimeOfDayTrigger *v21;
  WFTimeOfDayTrigger *v22;
  WFTimeOfDayTrigger *v23;
  void *v24;
  void *v25;
  WFTimeOfDayTrigger *v26;

  v4 = (WFTimeOfDayTrigger *)a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (v4 == self)
      {
        LOBYTE(v13) = 1;
      }
      else
      {
        v5 = -[WFTimeOfDayTrigger event](self, "event");
        if (v5 == -[WFTimeOfDayTrigger event](v4, "event"))
        {
          v6 = -[WFTimeOfDayTrigger mode](self, "mode");
          if (v6 == -[WFTimeOfDayTrigger mode](v4, "mode"))
          {
            v7 = -[WFTimeOfDayTrigger timeOffset](self, "timeOffset");
            if (v7 == -[WFTimeOfDayTrigger timeOffset](v4, "timeOffset"))
            {
              -[WFTimeOfDayTrigger time](self, "time");
              v8 = (void *)objc_claimAutoreleasedReturnValue();
              -[WFTimeOfDayTrigger time](v4, "time");
              v9 = (void *)objc_claimAutoreleasedReturnValue();
              v10 = v8;
              v11 = v9;
              v12 = v11;
              if (v10 == v11)
              {

              }
              else
              {
                LOBYTE(v13) = 0;
                v14 = v11;
                v15 = v10;
                if (!v10 || !v11)
                  goto LABEL_33;
                v16 = -[WFTimeOfDayTrigger isEqual:](v10, "isEqual:", v11);

                if (!v16)
                {
                  LOBYTE(v13) = 0;
LABEL_34:

                  v17 = v4;
                  goto LABEL_14;
                }
              }
              -[WFTimeOfDayTrigger daysOfWeek](self, "daysOfWeek");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              -[WFTimeOfDayTrigger daysOfWeek](v4, "daysOfWeek");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = v19;
              v21 = v20;
              v14 = v21;
              if (v15 == v21)
              {

              }
              else
              {
                LOBYTE(v13) = 0;
                v22 = v21;
                v23 = v15;
                if (!v15 || !v21)
                {
LABEL_32:

LABEL_33:
                  goto LABEL_34;
                }
                v13 = -[WFTimeOfDayTrigger isEqualToArray:](v15, "isEqualToArray:", v21);

                if (!v13)
                  goto LABEL_33;
              }
              -[WFTimeOfDayTrigger dayOfMonth](self, "dayOfMonth");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              -[WFTimeOfDayTrigger dayOfMonth](v4, "dayOfMonth");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = v24;
              v26 = v25;
              v22 = v26;
              if (v23 == v26)
              {
                LOBYTE(v13) = 1;
              }
              else
              {
                LOBYTE(v13) = 0;
                if (v23 && v26)
                  LOBYTE(v13) = -[WFTimeOfDayTrigger isEqual:](v23, "isEqual:", v26);
              }

              goto LABEL_32;
            }
          }
        }
        LOBYTE(v13) = 0;
      }
      v17 = v4;
      goto LABEL_18;
    }
    v17 = 0;
    LOBYTE(v13) = 0;
    v10 = v4;
  }
  else
  {
    v10 = 0;
    v17 = 0;
    LOBYTE(v13) = 0;
  }
LABEL_14:

LABEL_18:
  return v13;
}

- (id)suggestedActions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  +[WFActionRegistry sharedRegistry](WFActionRegistry, "sharedRegistry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = CFSTR("ShowWhenRun");
  v12[0] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createActionWithIdentifier:serializedParameters:", CFSTR("is.workflow.actions.sendmessage"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[WFActionRegistry sharedRegistry](WFActionRegistry, "sharedRegistry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createActionsWithIdentifiers:serializedParameterArray:", &unk_1E7B8DC40, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v10 = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v6);
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v8;
  }

  return v6;
}

- (unint64_t)event
{
  return self->_event;
}

- (void)setEvent:(unint64_t)a3
{
  self->_event = a3;
}

- (unint64_t)timeOffset
{
  return self->_timeOffset;
}

- (void)setTimeOffset:(unint64_t)a3
{
  self->_timeOffset = a3;
}

- (NSDateComponents)time
{
  return self->_time;
}

- (void)setTime:(id)a3
{
  objc_storeStrong((id *)&self->_time, a3);
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (NSArray)daysOfWeek
{
  return self->_daysOfWeek;
}

- (void)setDaysOfWeek:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)dayOfMonth
{
  return self->_dayOfMonth;
}

- (void)setDayOfMonth:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dayOfMonth, 0);
  objc_storeStrong((id *)&self->_daysOfWeek, 0);
  objc_storeStrong((id *)&self->_time, 0);
}

+ (id)localizedDisplayName
{
  return WFLocalizedString(CFSTR("Time of Day"));
}

+ (id)localizedDisplayExplanation
{
  return WFLocalizedString(CFSTR("Ex. “At 8:00 AM, weekdays”"));
}

+ (id)displayGlyphName
{
  return CFSTR("clock.fill");
}

+ (int64_t)triggerBacking
{
  return 1;
}

+ (BOOL)isAllowedToRunAutomatically
{
  return 1;
}

+ (id)dateFormatter
{
  if (dateFormatter_onceToken != -1)
    dispatch_once(&dateFormatter_onceToken, &__block_literal_global_65215);
  return (id)dateFormatter_dateFormatter;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)localizedSunriseSunsetDescriptionForTriggerEvent:(unint64_t)a3 timeOffset:(unint64_t)a4
{
  __CFString **v4;

  if (a3 == 1)
  {
    if (a4 <= 0xE)
    {
      v4 = off_1E7AF9918;
      goto LABEL_7;
    }
    return &stru_1E7AFA810;
  }
  if (a3)
    return &stru_1E7AFA810;
  if (a4 < 0xF)
  {
    v4 = off_1E7AF98A0;
LABEL_7:
    WFLocalizedString(v4[a4]);
    a1 = (id)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

+ (id)localizedRecurrenceDescriptionForDaysOfWeek:(id)a3 dayOfMonth:(id)a4 mode:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  __CFString *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  __CFString *v18;
  NSObject *v19;
  void *v20;
  int v21;
  NSObject *v22;
  void *v23;
  int v24;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  unint64_t v37;
  __int16 v38;
  id v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (a5 == 1)
  {
    if (v8)
    {
      v10 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
      objc_msgSend(v10, "setNumberStyle:", WFLocalizedNumberFormatStyle());
      objc_msgSend(v10, "stringFromNumber:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0CB3940];
      WFLocalizedString(CFSTR("monthly on the %@"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", v16, v11);
      v17 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    getWFTriggersLogObject();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v35 = "+[WFTimeOfDayTrigger localizedRecurrenceDescriptionForDaysOfWeek:dayOfMonth:mode:]";
      v36 = 2112;
      v37 = 0;
      _os_log_impl(&dword_1C15B3000, v22, OS_LOG_TYPE_ERROR, "%s Invalid day of month: %@", buf, 0x16u);
    }

  }
  else
  {
    if (!a5)
    {
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "wf_weekdays");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqualToSet:", v12);

      if (v13)
      {
        v14 = CFSTR("daily");
LABEL_20:
        WFLocalizedString(v14);
        v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_21;
      }
      objc_msgSend(v10, "wf_weekendDays");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v11, "isEqualToSet:", v20);

      if (v21)
      {
        v14 = CFSTR("weekends");
        goto LABEL_20;
      }
      objc_msgSend(v10, "wf_workweekDays");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v11, "isEqualToSet:", v23);

      if (v24)
      {
        v14 = CFSTR("weekdays");
        goto LABEL_20;
      }
      if (objc_msgSend(v7, "count") != 1)
      {
        objc_msgSend(v7, "sortedArrayUsingSelector:", sel_compare_);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v32[0] = MEMORY[0x1E0C809B0];
        v32[1] = 3221225472;
        v32[2] = __82__WFTimeOfDayTrigger_localizedRecurrenceDescriptionForDaysOfWeek_dayOfMonth_mode___block_invoke;
        v32[3] = &unk_1E7AF9878;
        v33 = v10;
        objc_msgSend(v16, "if_compactMap:", v32);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3738], "localizedStringByJoiningStrings:", v29);
        v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

        goto LABEL_8;
      }
      objc_msgSend(v7, "firstObject");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "integerValue");

      objc_msgSend(v10, "standaloneWeekdaySymbols");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v28;
      if (v27 < 1 || v27 - 1 >= (unint64_t)objc_msgSend(v28, "count"))
      {
        getWFTriggersLogObject();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v7, "firstObject");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v35 = "+[WFTimeOfDayTrigger localizedRecurrenceDescriptionForDaysOfWeek:dayOfMonth:mode:]";
          v36 = 2112;
          v37 = (unint64_t)v31;
          _os_log_impl(&dword_1C15B3000, v30, OS_LOG_TYPE_ERROR, "%s Invalid day index: %@", buf, 0x16u);

        }
        v18 = &stru_1E7AFA810;
        goto LABEL_8;
      }
      objc_msgSend(v16, "objectAtIndexedSubscript:", v27 - 1);
      v17 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v18 = (__CFString *)v17;
LABEL_8:

LABEL_21:
      goto LABEL_22;
    }
    getWFTriggersLogObject();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v35 = "+[WFTimeOfDayTrigger localizedRecurrenceDescriptionForDaysOfWeek:dayOfMonth:mode:]";
      v36 = 2048;
      v37 = a5;
      v38 = 2112;
      v39 = v7;
      v40 = 2112;
      v41 = v9;
      _os_log_impl(&dword_1C15B3000, v19, OS_LOG_TYPE_ERROR, "%s Invalid mode %lu with days of week %@ day of month %@", buf, 0x2Au);
    }

  }
  v18 = &stru_1E7AFA810;
LABEL_22:

  return v18;
}

id __82__WFTimeOfDayTrigger_localizedRecurrenceDescriptionForDaysOfWeek_dayOfMonth_mode___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  BOOL v7;
  unint64_t v8;
  void *v9;
  NSObject *v10;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "integerValue");
  objc_msgSend(*(id *)(a1 + 32), "shortStandaloneWeekdaySymbols");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = v4 < 1;
  v8 = v4 - 1;
  if (v7 || v8 >= objc_msgSend(v5, "count"))
  {
    getWFTriggersLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = 136315394;
      v13 = "+[WFTimeOfDayTrigger localizedRecurrenceDescriptionForDaysOfWeek:dayOfMonth:mode:]_block_invoke";
      v14 = 2112;
      v15 = v3;
      _os_log_impl(&dword_1C15B3000, v10, OS_LOG_TYPE_ERROR, "%s Invalid day index: %@", (uint8_t *)&v12, 0x16u);
    }

    v9 = 0;
  }
  else
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

uint64_t __35__WFTimeOfDayTrigger_dateFormatter__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)dateFormatter_dateFormatter;
  dateFormatter_dateFormatter = v0;

  objc_msgSend((id)dateFormatter_dateFormatter, "setTimeStyle:", 1);
  return objc_msgSend((id)dateFormatter_dateFormatter, "setDateStyle:", 0);
}

@end
