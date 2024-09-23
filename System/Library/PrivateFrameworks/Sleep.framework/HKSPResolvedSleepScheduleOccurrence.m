@implementation HKSPResolvedSleepScheduleOccurrence

- (HKSPResolvedSleepScheduleOccurrence)initWithOccurrence:(id)a3 wakeUpEvent:(id)a4 bedtimeEvent:(id)a5 windDownEvent:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HKSPResolvedSleepScheduleOccurrence *v15;
  HKSPResolvedSleepScheduleOccurrence *v16;
  HKSPResolvedSleepScheduleOccurrence *v17;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)HKSPResolvedSleepScheduleOccurrence;
  v15 = -[HKSPResolvedSleepScheduleOccurrence init](&v19, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_occurrence, a3);
    objc_storeStrong((id *)&v16->_wakeUpEvent, a4);
    objc_storeStrong((id *)&v16->_bedtimeEvent, a5);
    objc_storeStrong((id *)&v16->_windDownEvent, a6);
    v17 = v16;
  }

  return v16;
}

- (id)occurrenceByAdjustingEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  HKSPResolvedSleepScheduleOccurrence *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  HKSPResolvedSleepScheduleOccurrence *v20;

  v4 = a3;
  v20 = [HKSPResolvedSleepScheduleOccurrence alloc];
  -[HKSPResolvedSleepScheduleOccurrence occurrence](self, "occurrence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("HKSPSleepEventIdentifierWakeUp"));
  v8 = v4;
  if ((v7 & 1) == 0)
  {
    -[HKSPResolvedSleepScheduleOccurrence wakeUpEvent](self, "wakeUpEvent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("HKSPSleepEventIdentifierBedtime"));
  v11 = v4;
  if ((v10 & 1) == 0)
  {
    -[HKSPResolvedSleepScheduleOccurrence bedtimeEvent](self, "bedtimeEvent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("HKSPSleepEventIdentifierWindDown")))
  {
    v13 = -[HKSPResolvedSleepScheduleOccurrence initWithOccurrence:wakeUpEvent:bedtimeEvent:windDownEvent:](v20, "initWithOccurrence:wakeUpEvent:bedtimeEvent:windDownEvent:", v5, v8, v11, v4);
  }
  else
  {
    -[HKSPResolvedSleepScheduleOccurrence windDownEvent](self, "windDownEvent");
    v19 = v9;
    v14 = v7;
    v15 = v6;
    v16 = v5;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HKSPResolvedSleepScheduleOccurrence initWithOccurrence:wakeUpEvent:bedtimeEvent:windDownEvent:](v20, "initWithOccurrence:wakeUpEvent:bedtimeEvent:windDownEvent:", v16, v8, v11, v17);

    v5 = v16;
    v6 = v15;
    v7 = v14;
    v9 = v19;
  }

  if ((v10 & 1) == 0)
  if ((v7 & 1) == 0)

  return v13;
}

- (id)occurrenceByRemovingEventWithIdentifier:(id)a3
{
  id v5;
  HKSPResolvedSleepScheduleOccurrence *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  HKSPResolvedSleepScheduleOccurrence *v11;
  void *v12;
  void *v14;

  v5 = a3;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("HKSPSleepEventIdentifierWakeUp")))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKSPResolvedSleepScheduleOccurrence.m"), 58, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("![eventIdentifier isEqualToString:HKSPSleepEventIdentifierWakeUp]"));

  }
  v6 = [HKSPResolvedSleepScheduleOccurrence alloc];
  -[HKSPResolvedSleepScheduleOccurrence occurrence](self, "occurrence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSPResolvedSleepScheduleOccurrence wakeUpEvent](self, "wakeUpEvent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "isEqualToString:", CFSTR("HKSPSleepEventIdentifierBedtime"));
  if ((v9 & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    -[HKSPResolvedSleepScheduleOccurrence bedtimeEvent](self, "bedtimeEvent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("HKSPSleepEventIdentifierWindDown")))
  {
    v11 = -[HKSPResolvedSleepScheduleOccurrence initWithOccurrence:wakeUpEvent:bedtimeEvent:windDownEvent:](v6, "initWithOccurrence:wakeUpEvent:bedtimeEvent:windDownEvent:", v7, v8, v10, 0);
    if ((v9 & 1) != 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  -[HKSPResolvedSleepScheduleOccurrence windDownEvent](self, "windDownEvent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HKSPResolvedSleepScheduleOccurrence initWithOccurrence:wakeUpEvent:bedtimeEvent:windDownEvent:](v6, "initWithOccurrence:wakeUpEvent:bedtimeEvent:windDownEvent:", v7, v8, v10, v12);

  if ((v9 & 1) == 0)
LABEL_10:

LABEL_11:
  return v11;
}

- (NSDateInterval)scheduledInterval
{
  void *v2;
  id v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v4 = objc_alloc(MEMORY[0x1E0CB3588]);
  -[HKSPSleepEvent dueDate](self->_windDownEvent, "dueDate");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
  {
    v7 = 0;
    v8 = (void *)v5;
  }
  else
  {
    -[HKSPSleepEvent dueDate](self->_bedtimeEvent, "dueDate");
    v9 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)v9;
    if (v9)
    {
      v7 = 0;
      v8 = (void *)v9;
    }
    else
    {
      -[HKSPSleepEvent dueDate](self->_wakeUpEvent, "dueDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 1;
    }
  }
  -[HKSPSleepEvent dueDate](self->_wakeUpEvent, "dueDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v4, "initWithStartDate:endDate:", v8, v10);

  if (v7)
  if (!v6)

  return (NSDateInterval *)v11;
}

- (NSDateInterval)bedtimeInterval
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  -[HKSPSleepEvent dueDate](self->_bedtimeEvent, "dueDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3588]);
    -[HKSPSleepEvent dueDate](self->_bedtimeEvent, "dueDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSPSleepEvent dueDate](self->_wakeUpEvent, "dueDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v4, "initWithStartDate:endDate:", v5, v6);

  }
  else
  {
    v7 = 0;
  }

  return (NSDateInterval *)v7;
}

- (NSDateInterval)windDownInterval
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  if (self->_windDownEvent && self->_bedtimeEvent)
  {
    v3 = objc_alloc(MEMORY[0x1E0CB3588]);
    -[HKSPSleepEvent dueDate](self->_windDownEvent, "dueDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSPSleepEvent dueDate](self->_bedtimeEvent, "dueDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v3, "initWithStartDate:endDate:", v4, v5);

  }
  else
  {
    v6 = 0;
  }
  return (NSDateInterval *)v6;
}

- (id)generateOverrideOccurrenceForCurrentDate:(id)a3 gregorianCalendar:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  int v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  const char *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  HKSPLogForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v32 = 138543618;
    v33 = (id)objc_opt_class();
    v34 = 2114;
    v35 = v6;
    v9 = v33;
    _os_log_impl(&dword_1A4F0E000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] generating override occurrence for current date %{public}@", (uint8_t *)&v32, 0x16u);

  }
  -[HKSPResolvedSleepScheduleOccurrence scheduledInterval](self, "scheduledInterval");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containsDate:", v6);

  HKSPLogForCategory(0);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      v14 = (void *)objc_opt_class();
      v32 = 138543362;
      v33 = v14;
      v15 = v14;
      _os_log_impl(&dword_1A4F0E000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] current date is inside this occurrence's interval, generating override for this occurrence", (uint8_t *)&v32, 0xCu);

    }
    -[HKSPResolvedSleepScheduleOccurrence wakeUpEvent](self, "wakeUpEvent");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "type");

    if (!v17)
    {
      -[HKSPResolvedSleepScheduleOccurrence wakeUpEvent](self, "wakeUpEvent");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "dueDate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      -[HKSPResolvedSleepScheduleOccurrence occurrence](self, "occurrence");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "bedtimeDateForWakeUpDate:gregorianCalendar:", v23, v7);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "components:fromDate:", 124, v23);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "components:fromDate:", 124, v24);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKSPResolvedSleepScheduleOccurrence occurrence](self, "occurrence");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "overrideOccurrenceWithWakeUpComponents:bedtimeComponents:", v29, v30);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_13;
    }
    HKSPLogForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (void *)objc_opt_class();
      v32 = 138543362;
      v33 = v18;
      v19 = v18;
      v20 = "[%{public}@] this occurrence is snoozed, generating overide from template";
LABEL_11:
      _os_log_impl(&dword_1A4F0E000, v12, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v32, 0xCu);

    }
  }
  else if (v13)
  {
    v21 = (void *)objc_opt_class();
    v32 = 138543362;
    v33 = v21;
    v19 = v21;
    v20 = "[%{public}@] date is outside this occurrence's interval, generating override from template";
    goto LABEL_11;
  }

  -[HKSPResolvedSleepScheduleOccurrence scheduledInterval](self, "scheduledInterval");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "startDate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKSPResolvedSleepScheduleOccurrence occurrence](self, "occurrence");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "overrideOccurrenceTemplateForCurrentDate:gregorianCalendar:", v23, v7);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

  return v25;
}

- (HKSPResolvedSleepScheduleOccurrence)initWithCoder:(id)a3
{
  id v4;
  HKSPResolvedSleepScheduleOccurrence *v5;
  uint64_t v6;
  HKSPSleepScheduleOccurrence *occurrence;
  uint64_t v8;
  HKSPSleepEvent *wakeUpEvent;
  uint64_t v10;
  HKSPSleepEvent *bedtimeEvent;
  uint64_t v12;
  HKSPSleepEvent *windDownEvent;
  HKSPResolvedSleepScheduleOccurrence *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HKSPResolvedSleepScheduleOccurrence;
  v5 = -[HKSPResolvedSleepScheduleOccurrence init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("occurrence"));
    v6 = objc_claimAutoreleasedReturnValue();
    occurrence = v5->_occurrence;
    v5->_occurrence = (HKSPSleepScheduleOccurrence *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("wakeUpEvent"));
    v8 = objc_claimAutoreleasedReturnValue();
    wakeUpEvent = v5->_wakeUpEvent;
    v5->_wakeUpEvent = (HKSPSleepEvent *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bedtimeEvent"));
    v10 = objc_claimAutoreleasedReturnValue();
    bedtimeEvent = v5->_bedtimeEvent;
    v5->_bedtimeEvent = (HKSPSleepEvent *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("windDownEvent"));
    v12 = objc_claimAutoreleasedReturnValue();
    windDownEvent = v5->_windDownEvent;
    v5->_windDownEvent = (HKSPSleepEvent *)v12;

    v14 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  HKSPSleepScheduleOccurrence *occurrence;
  id v5;

  occurrence = self->_occurrence;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", occurrence, CFSTR("occurrence"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_wakeUpEvent, CFSTR("wakeUpEvent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bedtimeEvent, CFSTR("bedtimeEvent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_windDownEvent, CFSTR("windDownEvent"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)compare:(id)a3
{
  HKSPSleepEvent *wakeUpEvent;
  void *v4;
  int64_t v5;

  wakeUpEvent = self->_wakeUpEvent;
  objc_msgSend(a3, "wakeUpEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HKSPSleepEvent compare:](wakeUpEvent, "compare:", v4);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  HKSPResolvedSleepScheduleOccurrence *v4;
  HKSPResolvedSleepScheduleOccurrence *v5;
  void *v6;
  HKSPSleepScheduleOccurrence *occurrence;
  uint64_t v8;
  HKSPResolvedSleepScheduleOccurrence *v9;
  id v10;
  HKSPSleepEvent *wakeUpEvent;
  HKSPResolvedSleepScheduleOccurrence *v12;
  id v13;
  HKSPSleepEvent *bedtimeEvent;
  HKSPResolvedSleepScheduleOccurrence *v15;
  id v16;
  HKSPSleepEvent *windDownEvent;
  HKSPResolvedSleepScheduleOccurrence *v18;
  id v19;
  char v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t);
  void *v25;
  HKSPResolvedSleepScheduleOccurrence *v26;
  _QWORD v27[4];
  HKSPResolvedSleepScheduleOccurrence *v28;
  _QWORD v29[4];
  HKSPResolvedSleepScheduleOccurrence *v30;
  _QWORD v31[4];
  HKSPResolvedSleepScheduleOccurrence *v32;

  v4 = (HKSPResolvedSleepScheduleOccurrence *)a3;
  if (self == v4)
  {
    v20 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v5, objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      occurrence = self->_occurrence;
      v8 = MEMORY[0x1E0C809B0];
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __47__HKSPResolvedSleepScheduleOccurrence_isEqual___block_invoke;
      v31[3] = &unk_1E4E3C7B0;
      v9 = v5;
      v32 = v9;
      v10 = (id)objc_msgSend(v6, "appendObject:counterpart:", occurrence, v31);
      wakeUpEvent = self->_wakeUpEvent;
      v29[0] = v8;
      v29[1] = 3221225472;
      v29[2] = __47__HKSPResolvedSleepScheduleOccurrence_isEqual___block_invoke_2;
      v29[3] = &unk_1E4E3C7D8;
      v12 = v9;
      v30 = v12;
      v13 = (id)objc_msgSend(v6, "appendObject:counterpart:", wakeUpEvent, v29);
      bedtimeEvent = self->_bedtimeEvent;
      v27[0] = v8;
      v27[1] = 3221225472;
      v27[2] = __47__HKSPResolvedSleepScheduleOccurrence_isEqual___block_invoke_3;
      v27[3] = &unk_1E4E3C7D8;
      v15 = v12;
      v28 = v15;
      v16 = (id)objc_msgSend(v6, "appendObject:counterpart:", bedtimeEvent, v27);
      windDownEvent = self->_windDownEvent;
      v22 = v8;
      v23 = 3221225472;
      v24 = __47__HKSPResolvedSleepScheduleOccurrence_isEqual___block_invoke_4;
      v25 = &unk_1E4E3C7D8;
      v26 = v15;
      v18 = v15;
      v19 = (id)objc_msgSend(v6, "appendObject:counterpart:", windDownEvent, &v22);
      v20 = objc_msgSend(v6, "isEqual", v22, v23, v24, v25);

    }
    else
    {
      v20 = 0;
    }
  }

  return v20;
}

uint64_t __47__HKSPResolvedSleepScheduleOccurrence_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "occurrence");
}

uint64_t __47__HKSPResolvedSleepScheduleOccurrence_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "wakeUpEvent");
}

uint64_t __47__HKSPResolvedSleepScheduleOccurrence_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "bedtimeEvent");
}

uint64_t __47__HKSPResolvedSleepScheduleOccurrence_isEqual___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "windDownEvent");
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  unint64_t v8;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:", self->_occurrence);
  v5 = (id)objc_msgSend(v3, "appendObject:", self->_wakeUpEvent);
  v6 = (id)objc_msgSend(v3, "appendObject:", self->_bedtimeEvent);
  v7 = (id)objc_msgSend(v3, "appendObject:", self->_windDownEvent);
  v8 = objc_msgSend(v3, "hash");

  return v8;
}

- (NSString)description
{
  return (NSString *)-[HKSPResolvedSleepScheduleOccurrence descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[HKSPResolvedSleepScheduleOccurrence succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_occurrence, CFSTR("occurrence"));
  -[HKSPSleepEvent dueDate](self->_bedtimeEvent, "dueDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hkspDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("bedtime"));

  -[HKSPSleepEvent dueDate](self->_wakeUpEvent, "dueDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hkspDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v3, "appendObject:withName:", v9, CFSTR("wakeup"));

  -[HKSPSleepEvent dueDate](self->_windDownEvent, "dueDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hkspDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v3, "appendObject:withName:", v12, CFSTR("winddown"));

  return v3;
}

- (HKSPSleepScheduleOccurrence)occurrence
{
  return self->_occurrence;
}

- (HKSPSleepEvent)wakeUpEvent
{
  return self->_wakeUpEvent;
}

- (HKSPSleepEvent)bedtimeEvent
{
  return self->_bedtimeEvent;
}

- (HKSPSleepEvent)windDownEvent
{
  return self->_windDownEvent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windDownEvent, 0);
  objc_storeStrong((id *)&self->_bedtimeEvent, 0);
  objc_storeStrong((id *)&self->_wakeUpEvent, 0);
  objc_storeStrong((id *)&self->_occurrence, 0);
}

@end
