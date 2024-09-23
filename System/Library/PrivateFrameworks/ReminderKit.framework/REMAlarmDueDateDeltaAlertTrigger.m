@implementation REMAlarmDueDateDeltaAlertTrigger

- (REMAlarmDueDateDeltaAlertTrigger)initWithObjectID:(id)a3 dueDateDelta:(id)a4 acknowledgedDate:(id)a5
{
  id v9;
  id v10;
  REMAlarmDueDateDeltaAlertTrigger *v11;
  REMAlarmDueDateDeltaAlertTrigger *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)REMAlarmDueDateDeltaAlertTrigger;
  v11 = -[REMAlarmTrigger initWithObjectID:](&v14, sel_initWithObjectID_, a3);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_dueDateDelta, a4);
    objc_storeStrong((id *)&v12->_acknowledgedDate, a5);
  }

  return v12;
}

- (REMAlarmDueDateDeltaAlertTrigger)initWithDueDateDelta:(id)a3 acknowledgedDate:(id)a4
{
  id v7;
  id v8;
  REMAlarmDueDateDeltaAlertTrigger *v9;
  REMAlarmDueDateDeltaAlertTrigger *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)REMAlarmDueDateDeltaAlertTrigger;
  v9 = -[REMAlarmTrigger init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dueDateDelta, a3);
    objc_storeStrong((id *)&v10->_acknowledgedDate, a4);
  }

  return v10;
}

- (REMAlarmDueDateDeltaAlertTrigger)initWithCoder:(id)a3
{
  id v4;
  REMAlarmDueDateDeltaAlertTrigger *v5;
  REMDueDateDeltaInterval *v6;
  REMDueDateDeltaInterval *dueDateDelta;
  REMDueDateDeltaInterval *v8;
  uint64_t v9;
  NSDate *acknowledgedDate;
  REMAlarmDueDateDeltaAlertTrigger *v11;
  NSObject *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)REMAlarmDueDateDeltaAlertTrigger;
  v5 = -[REMAlarmTrigger initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (!v5)
    goto LABEL_4;
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("dueDateDelta"));
  v6 = (REMDueDateDeltaInterval *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    dueDateDelta = v5->_dueDateDelta;
    v5->_dueDateDelta = v6;
    v8 = v6;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("acknowledgedDate"));
    v9 = objc_claimAutoreleasedReturnValue();
    acknowledgedDate = v5->_acknowledgedDate;
    v5->_acknowledgedDate = (NSDate *)v9;

LABEL_4:
    v11 = v5;
    goto LABEL_8;
  }
  v12 = os_log_create("com.apple.reminderkit", "default");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    -[REMAlarmDueDateDeltaAlertTrigger initWithCoder:].cold.1(v12);

  v11 = 0;
LABEL_8:

  return v11;
}

- (id)_deepCopy
{
  REMAlarmDueDateDeltaAlertTrigger *v3;
  void *v4;
  void *v5;
  REMAlarmDueDateDeltaAlertTrigger *v6;

  v3 = [REMAlarmDueDateDeltaAlertTrigger alloc];
  -[REMAlarmDueDateDeltaAlertTrigger dueDateDelta](self, "dueDateDelta");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMAlarmDueDateDeltaAlertTrigger acknowledgedDate](self, "acknowledgedDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[REMAlarmDueDateDeltaAlertTrigger initWithDueDateDelta:acknowledgedDate:](v3, "initWithDueDateDelta:acknowledgedDate:", v4, v5);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  REMAlarmDueDateDeltaAlertTrigger *v4;
  REMAlarmDueDateDeltaAlertTrigger *v5;
  REMAlarmDueDateDeltaAlertTrigger *v6;
  void *v7;
  void *v8;
  char v9;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = (REMAlarmDueDateDeltaAlertTrigger *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (-[REMAlarmDueDateDeltaAlertTrigger dueDateDelta](v6, "dueDateDelta"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          -[REMAlarmDueDateDeltaAlertTrigger dueDateDelta](self, "dueDateDelta"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v8,
          v7,
          v7 == v8))
    {
      -[REMAlarmDueDateDeltaAlertTrigger acknowledgedDate](v6, "acknowledgedDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMAlarmDueDateDeltaAlertTrigger acknowledgedDate](self, "acknowledgedDate");
      v12 = objc_claimAutoreleasedReturnValue();
      if (v11 == (void *)v12)
      {
        v9 = 1;
        v13 = v11;
      }
      else
      {
        v13 = (void *)v12;
        -[REMAlarmDueDateDeltaAlertTrigger acknowledgedDate](v6, "acknowledgedDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMAlarmDueDateDeltaAlertTrigger acknowledgedDate](self, "acknowledgedDate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v14, "isEqual:", v15);

      }
    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (BOOL)isTemporal
{
  return 1;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  unint64_t v5;

  -[REMAlarmDueDateDeltaAlertTrigger dueDateDelta](self, "dueDateDelta");
  v3 = objc_claimAutoreleasedReturnValue();
  -[REMAlarmDueDateDeltaAlertTrigger acknowledgedDate](self, "acknowledgedDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)REMAlarmDueDateDeltaAlertTrigger;
  -[REMAlarmDueDateDeltaAlertTrigger description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMAlarmDueDateDeltaAlertTrigger dueDateDelta](self, "dueDateDelta");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMAlarmDueDateDeltaAlertTrigger acknowledgedDate](self, "acknowledgedDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ {dueDateDelta = %@; acknowledgedDate = %@;}"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)REMAlarmDueDateDeltaAlertTrigger;
  v4 = a3;
  -[REMAlarmTrigger encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[REMAlarmDueDateDeltaAlertTrigger dueDateDelta](self, "dueDateDelta", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("dueDateDelta"));

  -[REMAlarmDueDateDeltaAlertTrigger acknowledgedDate](self, "acknowledgedDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("acknowledgedDate"));

}

- (REMDueDateDeltaInterval)dueDateDelta
{
  return self->_dueDateDelta;
}

- (NSDate)acknowledgedDate
{
  return self->_acknowledgedDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acknowledgedDate, 0);
  objc_storeStrong((id *)&self->_dueDateDelta, 0);
}

- (void)initWithCoder:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B4A39000, log, OS_LOG_TYPE_ERROR, "-[REMAlarmDueDateDeltaAlertTrigger initWithCoder:] failed decoding dueDateDelta", v1, 2u);
}

@end
