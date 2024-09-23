@implementation SCLScheduleFormatterItem

- (SCLScheduleFormatterItem)initWithCalendar:(id)a3 timeIntervals:(id)a4
{
  id v7;
  id v8;
  SCLScheduleFormatterItem *v9;
  SCLScheduleFormatterItem *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SCLScheduleFormatterItem;
  v9 = -[SCLScheduleFormatterItem init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_calendar, a3);
    objc_storeStrong((id *)&v10->_timeIntervals, a4);
    v10->_days = 0;
  }

  return v10;
}

- (void)addDay:(int64_t)a3
{
  self->_days |= SCLRepeatScheduleForDay(a3);
}

- (int64_t)days
{
  return self->_days;
}

- (int64_t)earliestWeekdayInCalendar
{
  void *v3;
  int64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 1;
  -[SCLScheduleFormatterItem calendar](self, "calendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __53__SCLScheduleFormatterItem_earliestWeekdayInCalendar__block_invoke;
  v6[3] = &unk_24E29B868;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "SCL_enumerateWeekdaysUsingBlock:", v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

BOOL __53__SCLScheduleFormatterItem_earliestWeekdayInCalendar__block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  _BOOL8 result;

  result = SCLRepeatScheduleContainsDay(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), a2);
  if (result)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
    *a3 = 1;
  }
  return result;
}

- (id)dayRanges
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[SCLScheduleFormatterItem calendar](self, "calendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __37__SCLScheduleFormatterItem_dayRanges__block_invoke;
  v12[3] = &unk_24E29B818;
  v12[4] = self;
  v6 = v4;
  v13 = v6;
  v7 = v3;
  v14 = v7;
  objc_msgSend(v5, "SCL_enumerateWeekdaysUsingBlock:", v12);

  if (objc_msgSend(v6, "count"))
  {
    v8 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v7, "addObject:", v8);

  }
  v9 = v14;
  v10 = v7;

  return v10;
}

void __37__SCLScheduleFormatterItem_dayRanges__block_invoke(uint64_t a1, uint64_t a2)
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = SCLRepeatScheduleContainsDay(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), a2);
  v5 = *(void **)(a1 + 40);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a2);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v8);

  }
  else if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v6 = *(void **)(a1 + 48);
    v7 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
    objc_msgSend(v6, "addObject:", v7);

    objc_msgSend(*(id *)(a1 + 40), "removeAllObjects");
  }
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (NSArray)timeIntervals
{
  return self->_timeIntervals;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeIntervals, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
}

@end
