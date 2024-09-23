@implementation SCLDailySchedule

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[SCLDailySchedule initWithSchedule:]([SCLMutableDailySchedule alloc], "initWithSchedule:", self);
}

- (SCLDailySchedule)init
{
  SCLDailySchedule *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *dayMap;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SCLDailySchedule;
  v2 = -[SCLDailySchedule init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    dayMap = v2->_dayMap;
    v2->_dayMap = v3;

  }
  return v2;
}

- (SCLDailySchedule)initWithSchedule:(id)a3
{
  id v4;
  SCLDailySchedule *v5;
  void *v6;
  uint64_t v7;
  NSMutableDictionary *dayMap;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SCLDailySchedule;
  v5 = -[SCLDailySchedule init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "dayMap");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "mutableCopy");
    dayMap = v5->_dayMap;
    v5->_dayMap = (NSMutableDictionary *)v7;

  }
  return v5;
}

- (SCLDailySchedule)initWithCoder:(id)a3
{
  id v4;
  SCLDailySchedule *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSMutableDictionary *dayMap;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SCLDailySchedule;
  v5 = -[SCLSchedule initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("dayMap"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "mutableCopy");
    dayMap = v5->_dayMap;
    v5->_dayMap = (NSMutableDictionary *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_dayMap, CFSTR("dayMap"));
}

- (id)scheduleForDay:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[SCLDailySchedule dayMap](self, "dayMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)startTimeForDay:(int64_t)a3
{
  void *v3;
  void *v4;

  -[SCLDailySchedule scheduleForDay:](self, "scheduleForDay:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)endTimeForDay:(int64_t)a3
{
  void *v3;
  void *v4;

  -[SCLDailySchedule scheduleForDay:](self, "scheduleForDay:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[SCLDailySchedule dayMap](self, "dayMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  SCLDailySchedule *v4;
  SCLDailySchedule *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (SCLDailySchedule *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[SCLDailySchedule dayMap](self, "dayMap");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCLDailySchedule dayMap](v5, "dayMap");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqual:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  id v15;
  id v16;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p>\n"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "weekdaySymbols");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __36__SCLDailySchedule_debugDescription__block_invoke;
  v14[3] = &unk_24E29C188;
  v14[4] = self;
  v15 = v8;
  v9 = v6;
  v16 = v9;
  v10 = v8;
  SCLEnumerateDaysInRepeatSchedule(127, (uint64_t)v14);
  v11 = v16;
  v12 = v9;

  return v12;
}

void __36__SCLDailySchedule_debugDescription__block_invoke(id *a1, uint64_t a2)
{
  void *v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  id v8;

  if (objc_msgSend(a1[4], "isScheduledForDay:", a2))
  {
    objc_msgSend(a1[4], "startTimeForDay:", a2);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "endTimeForDay:", a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = a2 - 1;
    if (v6 < objc_msgSend(a1[5], "count"))
    {
      objc_msgSend(a1[5], "objectAtIndexedSubscript:", v6);
      v7 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v7;
    }
    objc_msgSend(a1[6], "appendFormat:", CFSTR("%@: %@ - %@\n"), v5, v8, v4);

  }
}

- (id)recurrences
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  id v9;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __31__SCLDailySchedule_recurrences__block_invoke;
  v8[3] = &unk_24E29B6B8;
  v8[4] = self;
  v4 = v3;
  v9 = v4;
  SCLEnumerateDaysInRepeatSchedule(127, (uint64_t)v8);
  v5 = v9;
  v6 = v4;

  return v6;
}

void __31__SCLDailySchedule_recurrences__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "scheduleForDay:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = *(void **)(a1 + 40);
    v6 = v3;
    objc_msgSend(v3, "recurrences");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v5);

    v3 = v6;
  }

}

- (NSMutableDictionary)dayMap
{
  return self->_dayMap;
}

- (void)setDayMap:(id)a3
{
  objc_storeStrong((id *)&self->_dayMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dayMap, 0);
}

@end
