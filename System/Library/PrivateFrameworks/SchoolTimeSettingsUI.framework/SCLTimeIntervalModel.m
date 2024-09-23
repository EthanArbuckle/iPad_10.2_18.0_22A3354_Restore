@implementation SCLTimeIntervalModel

+ (SCLTimeInterval)defaultTimeInterval
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE841F8]), "initWithHour:minute:", 8, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE841F8]), "initWithHour:minute:", 15, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE84218]), "initWithStartTime:endTime:", v2, v3);

  return (SCLTimeInterval *)v4;
}

- (SCLTimeIntervalModel)init
{
  return -[SCLTimeIntervalModel initWithTimeIntervals:](self, "initWithTimeIntervals:", MEMORY[0x24BDBD1A8]);
}

- (SCLTimeIntervalModel)initWithTimeIntervals:(id)a3
{
  id v4;
  SCLTimeIntervalModel *v5;
  SCLTimeIntervalModel *v6;
  uint64_t v7;
  NSCalendar *calendar;
  NSCalendar *v9;
  void *v10;
  NSCalendar *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSDateInterval *canonicalDateInterval;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SCLTimeIntervalModel;
  v5 = -[SCLTimeIntervalModel init](&v18, sel_init);
  v6 = v5;
  if (v5)
  {
    -[SCLTimeIntervalModel setTimeIntervals:](v5, "setTimeIntervals:", v4);
    objc_msgSend(MEMORY[0x24BDBCE48], "calendarWithIdentifier:", *MEMORY[0x24BDBCA18]);
    v7 = objc_claimAutoreleasedReturnValue();
    calendar = v6->_calendar;
    v6->_calendar = (NSCalendar *)v7;

    v9 = v6->_calendar;
    objc_msgSend(MEMORY[0x24BDBCF38], "defaultTimeZone");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCalendar setTimeZone:](v9, "setTimeZone:", v10);

    v11 = v6->_calendar;
    objc_msgSend(MEMORY[0x24BDBCEA0], "autoupdatingCurrentLocale");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCalendar setLocale:](v11, "setLocale:", v12);

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE841F8]), "initWithHour:minute:", 0, 0);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE84218]), "initWithStartTime:endTime:", v13, v13);
    -[SCLTimeIntervalModel canonicalDateIntervalForTimeInterval:](v6, "canonicalDateIntervalForTimeInterval:", v14);
    v15 = objc_claimAutoreleasedReturnValue();
    canonicalDateInterval = v6->_canonicalDateInterval;
    v6->_canonicalDateInterval = (NSDateInterval *)v15;

    -[SCLTimeIntervalModel _recalculateCanAppend](v6, "_recalculateCanAppend");
  }

  return v6;
}

- (void)setTimeIntervals:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *timeIntervals;
  id v6;

  objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (NSMutableArray *)objc_msgSend(v6, "mutableCopy");
  timeIntervals = self->_timeIntervals;
  self->_timeIntervals = v4;

}

uint64_t __41__SCLTimeIntervalModel_setTimeIntervals___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "startTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (NSArray)timeIntervals
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_timeIntervals, "copy");
}

- (NSArray)constraintIntervals
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t, uint64_t);
  void *v24;
  id v25;
  id v26;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[SCLTimeIntervalModel timeIntervals](self, "timeIntervals");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") == 1)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE841F8]), "initWithHour:minute:", 0, 0);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE84218]), "initWithStartTime:endTime:", v5, v5);
    objc_msgSend(v3, "addObject:", v6);
LABEL_5:

    goto LABEL_6;
  }
  if ((unint64_t)objc_msgSend(v4, "count") >= 2)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE841F8]), "initWithHour:minute:", 0, 0);
    v7 = objc_msgSend(v4, "count");
    v8 = objc_alloc(MEMORY[0x24BE84218]);
    objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "startTime");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v8, "initWithStartTime:endTime:", v5, v10);
    objc_msgSend(v3, "addObject:", v11);

    v12 = objc_msgSend(v4, "count");
    objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", 1, v12 - 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = MEMORY[0x24BDAC760];
    v22 = 3221225472;
    v23 = __43__SCLTimeIntervalModel_constraintIntervals__block_invoke;
    v24 = &unk_24E712060;
    v14 = v4;
    v25 = v14;
    v15 = v3;
    v26 = v15;
    objc_msgSend(v14, "enumerateObjectsAtIndexes:options:usingBlock:", v13, 0, &v21);

    v16 = objc_alloc(MEMORY[0x24BE84218]);
    objc_msgSend(v14, "objectAtIndexedSubscript:", v7 - 2, v21, v22, v23, v24);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "endTime");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v16, "initWithStartTime:endTime:", v18, v5);
    objc_msgSend(v15, "addObject:", v19);

    v6 = v25;
    goto LABEL_5;
  }
LABEL_6:

  return (NSArray *)v3;
}

void __43__SCLTimeIntervalModel_constraintIntervals__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3 - 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endTime");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3 + 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(void **)(a1 + 40);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE84218]), "initWithStartTime:endTime:", v10, v7);
  objc_msgSend(v8, "addObject:", v9);

}

- (id)canonicalDateIntervalForTimeInterval:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v4 = a3;
  objc_msgSend(v4, "startTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCalendar dateWithEra:year:month:day:hour:minute:second:nanosecond:](self->_calendar, "dateWithEra:year:month:day:hour:minute:second:nanosecond:", 1, 2019, 1, 1, objc_msgSend(v5, "hour"), objc_msgSend(v5, "minute"), 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqual:", v6) & 1) != 0 || (objc_msgSend(v4, "crossesDayBoundary") & 1) != 0)
    goto LABEL_3;
  objc_msgSend(v4, "endTime");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "hour"))
  {

LABEL_7:
    v8 = 1;
    goto LABEL_8;
  }
  objc_msgSend(v4, "endTime");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "minute");

  if (v11)
    goto LABEL_7;
LABEL_3:
  v8 = 2;
LABEL_8:
  -[NSCalendar dateWithEra:year:month:day:hour:minute:second:nanosecond:](self->_calendar, "dateWithEra:year:month:day:hour:minute:second:nanosecond:", 1, 2019, 1, v8, objc_msgSend(v6, "hour"), objc_msgSend(v6, "minute"), 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v7, v12);

  return v13;
}

- (id)scheduleTimeWithDate:(id)a3
{
  id v3;
  uint64_t v5;
  uint64_t v6;

  v5 = 0;
  v6 = 0;
  -[NSCalendar getHour:minute:second:nanosecond:fromDate:](self->_calendar, "getHour:minute:second:nanosecond:fromDate:", &v6, &v5, 0, 0, a3);
  v3 = objc_alloc(MEMORY[0x24BE841F8]);
  return (id)objc_msgSend(v3, "initWithHour:minute:", v6, v5);
}

- (id)nextProposedTimeInterval
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;

  -[NSMutableArray lastObject](self->_timeIntervals, "lastObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    if ((objc_msgSend(v2, "crossesDayBoundary") & 1) != 0)
    {
      v4 = 0;
    }
    else
    {
      objc_msgSend(v3, "endTime");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "hour");

      if ((unint64_t)(v6 + 1) > 0x17)
      {
        objc_msgSend(v3, "endTime");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_alloc(MEMORY[0x24BE841F8]);
        v9 = 0;
      }
      else
      {
        v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE841F8]), "initWithHour:minute:", v6 + 1, 0);
        v8 = objc_alloc(MEMORY[0x24BE841F8]);
        if ((unint64_t)(v6 + 2) >= 0x18)
          v9 = v6 - 22;
        else
          v9 = v6 + 2;
      }
      v10 = (void *)objc_msgSend(v8, "initWithHour:minute:", v9, 0);
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE84218]), "initWithStartTime:endTime:", v7, v10);

    }
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "defaultTimeInterval");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (BOOL)canRemoveTimeIntervals
{
  return (unint64_t)-[NSMutableArray count](self->_timeIntervals, "count") > 1;
}

- (void)removeTimeIntervalAtIndex:(unint64_t)a3
{
  if (-[SCLTimeIntervalModel canRemoveTimeIntervals](self, "canRemoveTimeIntervals"))
  {
    -[NSMutableArray removeObjectAtIndex:](self->_timeIntervals, "removeObjectAtIndex:", a3);
    -[SCLTimeIntervalModel _recalculateCanAppend](self, "_recalculateCanAppend");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Cannot remove the last time interval from the interval mode."));
  }
}

- (void)appendTimeInterval:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  -[NSMutableArray lastObject](self->_timeIntervals, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4
    && (objc_msgSend(v4, "endTime"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v9, "startTime"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v6, "compare:", v7),
        v7,
        v6,
        v8 == 1))
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Cannot append %@ because it starts before the end time of %@"), v9, v5);
  }
  else
  {
    -[NSMutableArray addObject:](self->_timeIntervals, "addObject:", v9);
    -[SCLTimeIntervalModel _recalculateCanAppend](self, "_recalculateCanAppend");
  }

}

- (void)replaceTimeIntervalAtIndex:(unint64_t)a3 withTimeInterval:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v13 = a4;
  if (!a3)
  {
LABEL_5:
    if (a3 + 2 < -[NSMutableArray count](self->_timeIntervals, "count"))
    {
      -[NSMutableArray objectAtIndex:](self->_timeIntervals, "objectAtIndex:", a3 + 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "endTime");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "startTime");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "compare:", v11);

      if (v12 == 1)
      {
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Cannot append %@ because it ends after the start time time of %@"), v13, v6);
        goto LABEL_8;
      }

    }
    -[NSMutableArray replaceObjectAtIndex:withObject:](self->_timeIntervals, "replaceObjectAtIndex:withObject:", a3, v13);
    -[SCLTimeIntervalModel _recalculateCanAppend](self, "_recalculateCanAppend");
    goto LABEL_11;
  }
  -[NSMutableArray objectAtIndex:](self->_timeIntervals, "objectAtIndex:", a3 - 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "startTime");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "compare:", v8);

  if (v9 != 1)
  {

    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Cannot append %@ because it starts before the end time of %@"), v13, v6);
LABEL_8:

LABEL_11:
}

- (void)_recalculateCanAppend
{
  void *v3;
  void *v4;
  int v5;
  id v6;

  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE841F8]), "initWithHour:minute:", 0, 0);
  -[NSMutableArray lastObject](self->_timeIntervals, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", v6);

  -[SCLTimeIntervalModel setCanAppendTimeInterval:](self, "setCanAppendTimeInterval:", v5 ^ 1u);
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (NSDateInterval)canonicalDateInterval
{
  return self->_canonicalDateInterval;
}

- (BOOL)canAppendTimeInterval
{
  return self->_canAppendTimeInterval;
}

- (void)setCanAppendTimeInterval:(BOOL)a3
{
  self->_canAppendTimeInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_canonicalDateInterval, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_timeIntervals, 0);
}

@end
