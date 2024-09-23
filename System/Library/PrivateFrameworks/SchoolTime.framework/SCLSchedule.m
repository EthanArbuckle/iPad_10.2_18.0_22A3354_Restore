@implementation SCLSchedule

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SCLSchedule)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SCLSchedule;
  return -[SCLSchedule init](&v4, sel_init, a3);
}

- (id)startTimeForDay:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SCLSchedule recurrencesForDay:](self, "recurrencesForDay:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)endTimeForDay:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SCLSchedule recurrencesForDay:](self, "recurrencesForDay:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCA98];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("%@ should be implemented by a concrete subclass of %@"), v5, objc_opt_class());

  return self;
}

- (BOOL)isEmpty
{
  void *v2;
  BOOL v3;

  -[SCLSchedule recurrences](self, "recurrences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") == 0;

  return v3;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[SCLSchedule recurrences](self, "recurrences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  char v4;

  if (a3 == self)
    return 1;
  v3 = a3;
  v4 = objc_msgSend(v3, "isMemberOfClass:", objc_opt_class());

  return v4;
}

- (int64_t)scheduledDays
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[SCLSchedule recurrences](self, "recurrences", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 |= SCLRepeatScheduleForDay(objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "day"));
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isScheduledForDay:(int64_t)a3
{
  return SCLRepeatScheduleContainsDay(-[SCLSchedule scheduledDays](self, "scheduledDays"), a3);
}

- (BOOL)isValid
{
  SCLScheduleAttributes *v2;
  BOOL v3;

  v2 = -[SCLScheduleAttributes initWithSchedule:]([SCLScheduleAttributes alloc], "initWithSchedule:", self);
  v3 = -[SCLScheduleAttributes isValid](v2, "isValid");

  return v3;
}

- (id)recurrencesForDay:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __33__SCLSchedule_recurrencesForDay___block_invoke;
  v8[3] = &__block_descriptor_40_e48_B24__0__SCLScheduleRecurrence_8__NSDictionary_16l;
  v8[4] = a3;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLSchedule recurrences](self, "recurrences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filteredArrayUsingPredicate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

BOOL __33__SCLSchedule_recurrencesForDay___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "day") == *(_QWORD *)(a1 + 32);
}

- (NSArray)recurrences
{
  return (NSArray *)MEMORY[0x24BDBD1A8];
}

- (NSArray)uniformTimeIntervals
{
  int64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void *v12;
  SCLSchedule *v13;
  id v14;

  v3 = -[SCLSchedule scheduledDays](self, "scheduledDays");
  if (!v3)
    return (NSArray *)MEMORY[0x24BDBD1A8];
  v4 = v3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __48__SCLSchedule_Convenience__uniformTimeIntervals__block_invoke;
  v12 = &unk_24E29B6B8;
  v13 = self;
  v6 = v5;
  v14 = v6;
  SCLEnumerateDaysInRepeatSchedule(v4, (uint64_t)&v9);
  if (objc_msgSend(v6, "count", v9, v10, v11, v12, v13) == 1)
  {
    objc_msgSend(v6, "anyObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return (NSArray *)v7;
}

void __48__SCLSchedule_Convenience__uniformTimeIntervals__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "timeIntervalsForDay:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

- (id)timeIntervalsForDay:(int64_t)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[SCLSchedule recurrencesForDay:](self, "recurrencesForDay:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "timeInterval");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

@end
