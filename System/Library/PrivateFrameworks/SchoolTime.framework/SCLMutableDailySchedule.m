@implementation SCLMutableDailySchedule

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[SCLDailySchedule initWithSchedule:]([SCLDailySchedule alloc], "initWithSchedule:", self);
}

- (void)removeScheduleForDay:(int64_t)a3
{
  void *v4;
  id v5;

  -[SCLDailySchedule dayMap](self, "dayMap");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v4);

}

- (void)setStartTime:(id)a3 endTime:(id)a4 forDay:(int64_t)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  SCLMutableSimpleSchedule *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v8 = a4;
  if ((unint64_t)(a5 - 8) > 0xFFFFFFFFFFFFFFF8)
  {
    v11 = objc_alloc_init(SCLMutableSimpleSchedule);
    -[SCLMutableSimpleSchedule setStartTime:](v11, "setStartTime:", v15);
    -[SCLMutableSimpleSchedule setEndTime:](v11, "setEndTime:", v8);
    -[SCLMutableSimpleSchedule setRepeatSchedule:](v11, "setRepeatSchedule:", SCLRepeatScheduleForDay(a5));
    -[SCLDailySchedule dayMap](self, "dayMap");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)-[SCLMutableSimpleSchedule copy](v11, "copy");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v13, v14);

  }
  else
  {
    v9 = (void *)MEMORY[0x24BDBCE88];
    v10 = *MEMORY[0x24BDBCB78];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a5);
    v11 = (SCLMutableSimpleSchedule *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise:format:", v10, CFSTR("Day %@ must be between 1 and 7"), v11);
  }

}

@end
