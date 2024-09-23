@implementation REMMigrationResult

- (REMMigrationResult)initWithState:(id)a3 IsObserver:(BOOL)a4 timeElapsed:(double)a5 listsMigrated:(unint64_t)a6 remindersMigrated:(unint64_t)a7 log:(id)a8
{
  id v15;
  id v16;
  REMMigrationResult *v17;
  REMMigrationResult *v18;
  objc_super v20;

  v15 = a3;
  v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)REMMigrationResult;
  v17 = -[REMMigrationResult init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_state, a3);
    v18->_isObserver = a4;
    v18->_timeElapsed = a5;
    v18->_listsMigrated = a6;
    v18->_remindersMigrated = a7;
    objc_storeStrong((id *)&v18->_log, a8);
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[REMMigrationResult state](self, "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("state"));

  objc_msgSend(v4, "encodeBool:forKey:", -[REMMigrationResult isObserver](self, "isObserver"), CFSTR("isObserver"));
  -[REMMigrationResult timeElapsed](self, "timeElapsed");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("timeElapsed"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[REMMigrationResult listsMigrated](self, "listsMigrated"), CFSTR("listsMigrated"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[REMMigrationResult remindersMigrated](self, "remindersMigrated"), CFSTR("remindersMigrated"));
  -[REMMigrationResult log](self, "log");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("log"));

}

- (REMMigrationResult)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  REMMigrationResult *v12;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("state"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isObserver"));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timeElapsed"));
  v8 = v7;
  v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("listsMigrated"));
  v10 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("remindersMigrated"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("log"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[REMMigrationResult initWithState:IsObserver:timeElapsed:listsMigrated:remindersMigrated:log:](self, "initWithState:IsObserver:timeElapsed:listsMigrated:remindersMigrated:log:", v5, v6, v9, v10, v11, v8);
  return v12;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p ("), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[REMMigrationResult state](self, "state");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("state: %@, "), v7);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[REMMigrationResult isObserver](self, "isObserver"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("isObserver: %@, "), v8);

  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[REMMigrationResult timeElapsed](self, "timeElapsed");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("timeElapsed: %@, "), v10);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[REMMigrationResult listsMigrated](self, "listsMigrated"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("listsMigrated: %@, "), v11);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[REMMigrationResult remindersMigrated](self, "remindersMigrated"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("remindersMigrated: %@, "), v12);

  -[REMMigrationResult log](self, "log");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("log: %@)>"), v13);

  return v6;
}

- (NSString)state
{
  return self->_state;
}

- (BOOL)isObserver
{
  return self->_isObserver;
}

- (double)timeElapsed
{
  return self->_timeElapsed;
}

- (unint64_t)listsMigrated
{
  return self->_listsMigrated;
}

- (unint64_t)remindersMigrated
{
  return self->_remindersMigrated;
}

- (NSString)log
{
  return self->_log;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_state, 0);
}

@end
