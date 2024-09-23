@implementation STAlarmModification

- (id)_initWithAddedFrequency:(int64_t)a3 alarmId:(id)a4 enabled:(id)a5 hour:(id)a6 label:(id)a7 minute:(id)a8 removedFrequency:(int64_t)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  STAlarmModification *v19;
  STAlarmModification *v20;
  void *v22;
  id v25;
  objc_super v26;

  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v25 = a8;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STAlarmModification.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("alarmId"));

  }
  v26.receiver = self;
  v26.super_class = (Class)STAlarmModification;
  v19 = -[STAlarmModification init](&v26, sel_init);
  v20 = v19;
  if (v19)
  {
    v19->_addedFrequency = a3;
    objc_storeStrong((id *)&v19->_alarmId, a4);
    objc_storeStrong((id *)&v20->_enabled, a5);
    objc_storeStrong((id *)&v20->_hour, a6);
    objc_storeStrong((id *)&v20->_label, a7);
    objc_storeStrong((id *)&v20->_minute, a8);
    v20->_removedFrequency = a9;
  }

  return v20;
}

- (int64_t)addedFrequency
{
  return self->_addedFrequency;
}

- (id)alarmId
{
  return self->_alarmId;
}

- (id)enabled
{
  return self->_enabled;
}

- (id)hour
{
  return self->_hour;
}

- (id)label
{
  return self->_label;
}

- (id)minute
{
  return self->_minute;
}

- (int64_t)removedFrequency
{
  return self->_removedFrequency;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STAlarmModification;
  v4 = a3;
  -[STSiriModelObject encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_addedFrequency, CFSTR("_addedFrequency"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_alarmId, CFSTR("_alarmId"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_enabled, CFSTR("_enabled"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_hour, CFSTR("_hour"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_label, CFSTR("_label"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_minute, CFSTR("_minute"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_removedFrequency, CFSTR("_removedFrequency"));

}

- (STAlarmModification)initWithCoder:(id)a3
{
  id v4;
  STAlarmModification *v5;
  uint64_t v6;
  NSURL *alarmId;
  uint64_t v8;
  NSNumber *enabled;
  uint64_t v10;
  NSNumber *hour;
  uint64_t v12;
  NSString *label;
  uint64_t v14;
  NSNumber *minute;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)STAlarmModification;
  v5 = -[STSiriModelObject initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_addedFrequency = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_addedFrequency"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_alarmId"));
    v6 = objc_claimAutoreleasedReturnValue();
    alarmId = v5->_alarmId;
    v5->_alarmId = (NSURL *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_enabled"));
    v8 = objc_claimAutoreleasedReturnValue();
    enabled = v5->_enabled;
    v5->_enabled = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_hour"));
    v10 = objc_claimAutoreleasedReturnValue();
    hour = v5->_hour;
    v5->_hour = (NSNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_label"));
    v12 = objc_claimAutoreleasedReturnValue();
    label = v5->_label;
    v5->_label = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_minute"));
    v14 = objc_claimAutoreleasedReturnValue();
    minute = v5->_minute;
    v5->_minute = (NSNumber *)v14;

    v5->_removedFrequency = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_removedFrequency"));
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minute, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_hour, 0);
  objc_storeStrong((id *)&self->_enabled, 0);
  objc_storeStrong((id *)&self->_alarmId, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
