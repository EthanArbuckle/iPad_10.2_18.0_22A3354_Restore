@implementation SCLUnlockHistoryItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SCLUnlockHistoryItem)initWithInterval:(id)a3 calendar:(id)a4 timeZone:(id)a5
{
  id v8;
  id v9;
  id v10;
  SCLScheduleTime *v11;
  SCLUnlockHistoryItem *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[SCLScheduleTime initWithHour:minute:]([SCLScheduleTime alloc], "initWithHour:minute:", 0, 0);
  v12 = -[SCLUnlockHistoryItem initWithInterval:calendar:timeZone:startTime:endTime:](self, "initWithInterval:calendar:timeZone:startTime:endTime:", v10, v9, v8, v11, v11);

  return v12;
}

- (SCLUnlockHistoryItem)initWithInterval:(id)a3 calendar:(id)a4 timeZone:(id)a5 startTime:(id)a6 endTime:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  SCLUnlockHistoryItem *v17;
  uint64_t v18;
  NSDateInterval *unlockedInterval;
  uint64_t v20;
  NSCalendar *calendar;
  uint64_t v22;
  NSTimeZone *timeZone;
  uint64_t v24;
  SCLScheduleTime *scheduleStartTime;
  uint64_t v26;
  SCLScheduleTime *scheduleEndTime;
  objc_super v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)SCLUnlockHistoryItem;
  v17 = -[SCLUnlockHistoryItem init](&v29, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    unlockedInterval = v17->_unlockedInterval;
    v17->_unlockedInterval = (NSDateInterval *)v18;

    v20 = objc_msgSend(v13, "copy");
    calendar = v17->_calendar;
    v17->_calendar = (NSCalendar *)v20;

    v22 = objc_msgSend(v14, "copy");
    timeZone = v17->_timeZone;
    v17->_timeZone = (NSTimeZone *)v22;

    v24 = objc_msgSend(v15, "copy");
    scheduleStartTime = v17->_scheduleStartTime;
    v17->_scheduleStartTime = (SCLScheduleTime *)v24;

    v26 = objc_msgSend(v16, "copy");
    scheduleEndTime = v17->_scheduleEndTime;
    v17->_scheduleEndTime = (SCLScheduleTime *)v26;

    -[SCLUnlockHistoryItem _loadEffectiveRecurrence](v17, "_loadEffectiveRecurrence");
  }

  return v17;
}

- (SCLUnlockHistoryItem)initWithCoder:(id)a3
{
  id v4;
  SCLUnlockHistoryItem *v5;
  uint64_t v6;
  NSDateInterval *unlockedInterval;
  void *v8;
  uint64_t v9;
  NSCalendar *calendar;
  void *v11;
  uint64_t v12;
  NSTimeZone *timeZone;
  uint64_t v14;
  SCLScheduleTime *scheduleStartTime;
  SCLScheduleTime *v16;
  SCLScheduleTime *v17;
  uint64_t v18;
  SCLScheduleTime *scheduleEndTime;
  SCLScheduleTime *v20;
  SCLScheduleTime *v21;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SCLUnlockHistoryItem;
  v5 = -[SCLUnlockHistoryItem init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("interval"));
    v6 = objc_claimAutoreleasedReturnValue();
    unlockedInterval = v5->_unlockedInterval;
    v5->_unlockedInterval = (NSDateInterval *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("calendarIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(MEMORY[0x24BDBCE48], "calendarWithIdentifier:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
      calendar = v5->_calendar;
      v5->_calendar = (NSCalendar *)v9;

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timeZoneName"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneWithName:", v11);
      v12 = objc_claimAutoreleasedReturnValue();
      timeZone = v5->_timeZone;
      v5->_timeZone = (NSTimeZone *)v12;

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startTime"));
    v14 = objc_claimAutoreleasedReturnValue();
    scheduleStartTime = v5->_scheduleStartTime;
    v5->_scheduleStartTime = (SCLScheduleTime *)v14;

    if (!v5->_scheduleStartTime)
    {
      v16 = -[SCLScheduleTime initWithHour:minute:]([SCLScheduleTime alloc], "initWithHour:minute:", 0, 0);
      v17 = v5->_scheduleStartTime;
      v5->_scheduleStartTime = v16;

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endTime"));
    v18 = objc_claimAutoreleasedReturnValue();
    scheduleEndTime = v5->_scheduleEndTime;
    v5->_scheduleEndTime = (SCLScheduleTime *)v18;

    if (!v5->_scheduleEndTime)
    {
      v20 = -[SCLScheduleTime initWithHour:minute:]([SCLScheduleTime alloc], "initWithHour:minute:", 0, 0);
      v21 = v5->_scheduleEndTime;
      v5->_scheduleEndTime = v20;

    }
    -[SCLUnlockHistoryItem _loadEffectiveRecurrence](v5, "_loadEffectiveRecurrence");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDateInterval *unlockedInterval;
  void *v5;
  void *v6;
  id v7;

  unlockedInterval = self->_unlockedInterval;
  v7 = a3;
  objc_msgSend(v7, "encodeObject:forKey:", unlockedInterval, CFSTR("interval"));
  -[NSCalendar calendarIdentifier](self->_calendar, "calendarIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("calendarIdentifier"));

  -[NSTimeZone name](self->_timeZone, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("timeZoneName"));

  objc_msgSend(v7, "encodeObject:forKey:", self->_scheduleStartTime, CFSTR("startTime"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_scheduleEndTime, CFSTR("endTime"));

}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v3 = -[NSDateInterval hash](self->_unlockedInterval, "hash");
  -[NSCalendar calendarIdentifier](self->_calendar, "calendarIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;
  -[NSTimeZone name](self->_timeZone, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  v8 = v5 ^ v7 ^ -[SCLScheduleTime hash](self->_scheduleStartTime, "hash");
  v9 = v8 ^ -[SCLScheduleTime hash](self->_scheduleEndTime, "hash");

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  char v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "unlockedInterval");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCLUnlockHistoryItem unlockedInterval](self, "unlockedInterval");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7))
    {
      objc_msgSend(v5, "calendar");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "calendarIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCLUnlockHistoryItem calendar](self, "calendar");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "calendarIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqual:", v11))
      {
        v24 = v8;
        objc_msgSend(v5, "timeZone");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "name");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SCLUnlockHistoryItem timeZone](self, "timeZone");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "name");
        v25 = v12;
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "isEqual:"))
        {
          objc_msgSend(v5, "scheduleStartTime");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[SCLUnlockHistoryItem scheduleStartTime](self, "scheduleStartTime");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v14;
          v15 = objc_msgSend(v14, "isEqual:");
          v16 = v13;
          v8 = v24;
          if (v15)
          {
            objc_msgSend(v5, "scheduleEndTime");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[SCLUnlockHistoryItem scheduleEndTime](self, "scheduleEndTime");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v20, "isEqual:", v19);

          }
          else
          {
            v17 = 0;
          }

        }
        else
        {
          v17 = 0;
          v16 = v13;
          v8 = v24;
        }

      }
      else
      {
        v17 = 0;
      }

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)_loadEffectiveRecurrence
{
  SCLTimeInterval *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  SCLScheduleRecurrence *v10;
  SCLScheduleRecurrence *effectiveRecurrence;
  SCLTimeInterval *v12;

  v3 = [SCLTimeInterval alloc];
  -[SCLUnlockHistoryItem scheduleStartTime](self, "scheduleStartTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLUnlockHistoryItem scheduleEndTime](self, "scheduleEndTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SCLTimeInterval initWithStartTime:endTime:](v3, "initWithStartTime:endTime:", v4, v5);

  -[SCLUnlockHistoryItem calendar](self, "calendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLUnlockHistoryItem unlockedInterval](self, "unlockedInterval");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "component:fromDate:", 512, v8);

  v10 = -[SCLScheduleRecurrence initWithTimeInterval:day:]([SCLScheduleRecurrence alloc], "initWithTimeInterval:day:", v12, v9);
  effectiveRecurrence = self->_effectiveRecurrence;
  self->_effectiveRecurrence = v10;

}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLUnlockHistoryItem unlockedInterval](self, "unlockedInterval");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("interval"));

  -[SCLUnlockHistoryItem calendar](self, "calendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "calendarIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "appendObject:withName:", v7, CFSTR("calendar"));

  -[SCLUnlockHistoryItem timeZone](self, "timeZone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v3, "appendObject:withName:", v10, CFSTR("timezone"));

  -[SCLUnlockHistoryItem scheduleStartTime](self, "scheduleStartTime");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v3, "appendObject:withName:", v12, CFSTR("scheduleStartTime"));

  -[SCLUnlockHistoryItem scheduleEndTime](self, "scheduleEndTime");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v3, "appendObject:withName:", v14, CFSTR("scheduleEndTime"));

  objc_msgSend(v3, "build");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (NSDateInterval)unlockedInterval
{
  return self->_unlockedInterval;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (SCLScheduleTime)scheduleStartTime
{
  return self->_scheduleStartTime;
}

- (SCLScheduleTime)scheduleEndTime
{
  return self->_scheduleEndTime;
}

- (SCLScheduleRecurrence)effectiveRecurrence
{
  return self->_effectiveRecurrence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectiveRecurrence, 0);
  objc_storeStrong((id *)&self->_scheduleEndTime, 0);
  objc_storeStrong((id *)&self->_scheduleStartTime, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_unlockedInterval, 0);
}

@end
