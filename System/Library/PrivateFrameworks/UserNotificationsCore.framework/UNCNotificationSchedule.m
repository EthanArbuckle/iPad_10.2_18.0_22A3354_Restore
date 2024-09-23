@implementation UNCNotificationSchedule

- (id)_dateFormatter
{
  if (_dateFormatter___once_1 != -1)
    dispatch_once(&_dateFormatter___once_1, &__block_literal_global_20);
  return (id)_dateFormatter___dateFormatter_1;
}

uint64_t __41__UNCNotificationSchedule__dateFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v1 = (void *)_dateFormatter___dateFormatter_1;
  _dateFormatter___dateFormatter_1 = (uint64_t)v0;

  return objc_msgSend((id)_dateFormatter___dateFormatter_1, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss'.'SSS Z"));
}

- (UNCNotificationSchedule)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  UNCNotificationSchedule *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UNCNotificationSchedule;
  v5 = -[UNCNotificationSchedule init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("PreviousTriggerDate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCNotificationSchedule setPreviousTriggerDate:](v5, "setPreviousTriggerDate:", v6);

  }
  return v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNCNotificationSchedule previousTriggerDate](self, "previousTriggerDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v4, CFSTR("PreviousTriggerDate"));

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNCNotificationSchedule _dateFormatter](self, "_dateFormatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNCNotificationSchedule previousTriggerDate](self, "previousTriggerDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("PreviousTriggerDate"));

  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  char v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (v4 && (v5 = objc_opt_class(), v5 == objc_opt_class()))
  {
    -[UNCNotificationSchedule previousTriggerDate](self, "previousTriggerDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "previousTriggerDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = UNEqualObjects();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x24BE0BE28], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNCNotificationSchedule previousTriggerDate](self, "previousTriggerDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:", v4);

  v6 = objc_msgSend(v3, "hash");
  return v6;
}

- (NSDate)previousTriggerDate
{
  return self->_previousTriggerDate;
}

- (void)setPreviousTriggerDate:(id)a3
{
  objc_storeStrong((id *)&self->_previousTriggerDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousTriggerDate, 0);
}

@end
