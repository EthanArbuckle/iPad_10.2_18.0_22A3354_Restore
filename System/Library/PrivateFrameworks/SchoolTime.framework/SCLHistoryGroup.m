@implementation SCLHistoryGroup

+ (id)historyGroupsByPrioritizingSchedule:(id)a3 forDate:(id)a4 inCalendar:(id)a5 items:(id)a6
{
  id v9;
  id v10;
  id v11;
  objc_class *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  SCLRecurrenceSchedule *v33;
  void *v34;
  SCLRecurrenceSchedule *v35;
  SCLHistoryGroup *v36;
  id v37;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  _QWORD v43[4];
  id v44;
  _QWORD v45[4];
  id v46;
  id v47;
  id v48;
  id v49;
  _QWORD v50[5];

  v50[3] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (objc_class *)MEMORY[0x24BDBCEB8];
  v13 = a6;
  v14 = objc_alloc_init(v12);
  objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x24BDAC760];
  v45[0] = MEMORY[0x24BDAC760];
  v45[1] = 3221225472;
  v45[2] = __80__SCLHistoryGroup_historyGroupsByPrioritizingSchedule_forDate_inCalendar_items___block_invoke;
  v45[3] = &unk_24E29B708;
  v18 = v16;
  v46 = v18;
  v42 = v15;
  v47 = v42;
  v19 = v9;
  v48 = v19;
  v20 = v14;
  v49 = v20;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v45);

  objc_msgSend(v20, "enumerateObjectsUsingBlock:", &__block_literal_global_1);
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("referenceDate"), 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)MEMORY[0x24BDD17C0];
  v43[0] = v17;
  v23 = v10;
  v43[1] = 3221225472;
  v43[2] = __80__SCLHistoryGroup_historyGroupsByPrioritizingSchedule_forDate_inCalendar_items___block_invoke_5;
  v43[3] = &unk_24E29B7B0;
  v24 = v18;
  v44 = v24;
  objc_msgSend(v22, "sortDescriptorWithKey:ascending:comparator:", 0, 1, v43);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:comparator:", 0, 1, &__block_literal_global_39);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = v21;
  v50[1] = v25;
  v50[2] = v26;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v50, 3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sortUsingDescriptors:", v27);

  v28 = objc_msgSend(v11, "component:fromDate:", 512, v23);
  if (objc_msgSend(v19, "isScheduledForDay:", v28))
  {
    objc_msgSend(v20, "firstObject");
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = v11;
    v31 = (void *)v29;
    v41 = v30;
    objc_msgSend(v30, "startOfDayForDate:", v23);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "referenceDate");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v31
      || !objc_msgSend(v24, "containsObject:", v31)
      || (objc_msgSend(v41, "isDate:inSameDayAsDate:", v32, v40) & 1) == 0)
    {
      v39 = v23;
      v33 = [SCLRecurrenceSchedule alloc];
      objc_msgSend(v19, "recurrencesForDay:", v28);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = -[SCLRecurrenceSchedule initWithRecurrences:](v33, "initWithRecurrences:", v34);

      v36 = -[SCLHistoryGroup initWithEffectiveSchedule:calendar:referenceDate:]([SCLHistoryGroup alloc], "initWithEffectiveSchedule:calendar:referenceDate:", v35, v41, v32);
      objc_msgSend(v20, "insertObject:atIndex:", v36, 0);

      v23 = v39;
    }

    v11 = v41;
  }
  v37 = v20;

  return v37;
}

void __80__SCLHistoryGroup_historyGroupsByPrioritizingSchedule_forDate_inCalendar_items___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  SCLHistoryGroupKey *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  SCLRecurrenceSchedule *v16;
  void *v17;
  SCLRecurrenceSchedule *v18;
  SCLHistoryGroup *v19;
  void *v20;
  SCLHistoryGroup *v21;
  id v22;
  SCLTimeInterval *v23;
  void *v24;
  void *v25;
  SCLTimeInterval *v26;
  SCLScheduleRecurrence *v27;
  SCLRecurrenceSchedule *v28;
  void *v29;
  SCLRecurrenceSchedule *v30;
  SCLHistoryGroup *v31;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  SCLHistoryGroupKey *v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  uint64_t *v40;
  _QWORD v41[4];
  id v42;
  uint64_t *v43;
  uint64_t v44;
  id *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  _QWORD v50[3];

  v50[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v44 = 0;
  v45 = (id *)&v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy_;
  v48 = __Block_byref_object_dispose_;
  v49 = 0;
  v4 = a1[4];
  v41[0] = MEMORY[0x24BDAC760];
  v41[1] = 3221225472;
  v41[2] = __80__SCLHistoryGroup_historyGroupsByPrioritizingSchedule_forDate_inCalendar_items___block_invoke_24;
  v41[3] = &unk_24E29B6E0;
  v5 = v3;
  v42 = v5;
  v43 = &v44;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v41);
  v6 = v45[5];
  if (!v6)
  {
    objc_msgSend(v5, "unlockedInterval");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "startDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "calendar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "startOfDayForDate:", v8);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = [SCLHistoryGroupKey alloc];
    objc_msgSend(v5, "calendar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = -[SCLHistoryGroupKey initWithCalendar:referenceDate:](v10, "initWithCalendar:referenceDate:", v11, v37);

    objc_msgSend(a1[5], "objectForKey:", v36);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      v12 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
      objc_msgSend(a1[5], "setObject:forKey:", v12, v36);
    }
    objc_msgSend(v5, "calendar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "component:fromDate:", 512, v8);

    objc_msgSend(a1[6], "recurrencesForDay:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "count"))
    {
      v16 = [SCLRecurrenceSchedule alloc];
      objc_msgSend(a1[6], "recurrencesForDay:", v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[SCLRecurrenceSchedule initWithRecurrences:](v16, "initWithRecurrences:", v17);

      v19 = [SCLHistoryGroup alloc];
      objc_msgSend(v5, "calendar");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[SCLHistoryGroup initWithEffectiveSchedule:calendar:referenceDate:](v19, "initWithEffectiveSchedule:calendar:referenceDate:", v18, v20, v37);

      if (-[SCLHistoryGroup canContainUnlockHistoryItem:](v21, "canContainUnlockHistoryItem:", v5))
      {
        objc_storeStrong(v45 + 5, v21);
        objc_msgSend(a1[4], "addObject:", v45[5]);
        objc_msgSend(v12, "addObject:", v45[5]);
        objc_msgSend(a1[7], "addObject:", v45[5]);
      }

    }
    if (!v45[5])
    {
      v38[0] = MEMORY[0x24BDAC760];
      v38[1] = 3221225472;
      v38[2] = __80__SCLHistoryGroup_historyGroupsByPrioritizingSchedule_forDate_inCalendar_items___block_invoke_2;
      v38[3] = &unk_24E29B6E0;
      v22 = v5;
      v39 = v22;
      v40 = &v44;
      objc_msgSend(v12, "enumerateObjectsUsingBlock:", v38);

      if (!v45[5])
      {
        v23 = [SCLTimeInterval alloc];
        objc_msgSend(v22, "scheduleStartTime");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "scheduleEndTime");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = -[SCLTimeInterval initWithStartTime:endTime:](v23, "initWithStartTime:endTime:", v24, v25);

        v27 = -[SCLScheduleRecurrence initWithTimeInterval:day:]([SCLScheduleRecurrence alloc], "initWithTimeInterval:day:", v26, v14);
        v28 = [SCLRecurrenceSchedule alloc];
        v50[0] = v27;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v50, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = -[SCLRecurrenceSchedule initWithRecurrences:](v28, "initWithRecurrences:", v29);

        v31 = [SCLHistoryGroup alloc];
        objc_msgSend(v22, "calendar");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = -[SCLHistoryGroup initWithEffectiveSchedule:calendar:referenceDate:](v31, "initWithEffectiveSchedule:calendar:referenceDate:", v30, v32, v37);
        v34 = v45[5];
        v45[5] = (id)v33;

        objc_msgSend(v12, "addObject:", v45[5]);
        objc_msgSend(a1[7], "addObject:", v45[5]);

      }
    }

    v6 = v45[5];
  }
  objc_msgSend(v6, "items");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "addObject:", v5);

  _Block_object_dispose(&v44, 8);
}

void __80__SCLHistoryGroup_historyGroupsByPrioritizingSchedule_forDate_inCalendar_items___block_invoke_24(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "canContainUnlockHistoryItem:", *(_QWORD *)(a1 + 32)))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }

}

void __80__SCLHistoryGroup_historyGroupsByPrioritizingSchedule_forDate_inCalendar_items___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "canContainUnlockHistoryItem:", *(_QWORD *)(a1 + 32)))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }

}

void __80__SCLHistoryGroup_historyGroupsByPrioritizingSchedule_forDate_inCalendar_items___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "items");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortUsingComparator:", &__block_literal_global_34);

}

uint64_t __80__SCLHistoryGroup_historyGroupsByPrioritizingSchedule_forDate_inCalendar_items___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "unlockedInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unlockedInterval");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "compare:", v8);

  return v9;
}

uint64_t __80__SCLHistoryGroup_historyGroupsByPrioritizingSchedule_forDate_inCalendar_items___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  int v8;
  uint64_t v9;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v7 = a3;
  LODWORD(v6) = objc_msgSend(v6, "containsObject:", v5);
  v8 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v7);

  if ((_DWORD)v6 == v8)
  {
    v9 = 0;
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v5))
  {
    v9 = -1;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

uint64_t __80__SCLHistoryGroup_historyGroupsByPrioritizingSchedule_forDate_inCalendar_items___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  objc_msgSend(a2, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "firstObject");
  v8 = objc_claimAutoreleasedReturnValue();

  if (v6 | v8)
    v9 = -1;
  else
    v9 = 0;
  if (v6)
    v10 = 1;
  else
    v10 = v9;
  if (v6 && v8)
  {
    objc_msgSend((id)v6, "unlockedInterval");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "startDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v8, "unlockedInterval");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "startDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v12, "compare:", v14);

  }
  return v10;
}

- (SCLHistoryGroup)initWithEffectiveSchedule:(id)a3 calendar:(id)a4 referenceDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  SCLHistoryGroup *v11;
  SCLHistoryGroup *v12;
  uint64_t v13;
  SCLSchedule *effectiveSchedule;
  uint64_t v15;
  NSMutableArray *items;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SCLHistoryGroup;
  v11 = -[SCLHistoryGroup init](&v18, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_calendar, a4);
    objc_storeStrong((id *)&v12->_referenceDate, a5);
    v13 = objc_msgSend(v8, "copy");
    effectiveSchedule = v12->_effectiveSchedule;
    v12->_effectiveSchedule = (SCLSchedule *)v13;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v15 = objc_claimAutoreleasedReturnValue();
    items = v12->_items;
    v12->_items = (NSMutableArray *)v15;

  }
  return v12;
}

- (BOOL)canContainUnlockHistoryItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v4 = a3;
  objc_msgSend(v4, "unlockedInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SCLHistoryGroup calendar](self, "calendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLHistoryGroup referenceDate](self, "referenceDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isDate:inSameDayAsDate:", v6, v8);

  if (v9)
  {
    -[SCLHistoryGroup effectiveSchedule](self, "effectiveSchedule");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "recurrences");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "effectiveRecurrence");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "containsObject:", v12);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (NSDate)referenceDate
{
  return self->_referenceDate;
}

- (SCLSchedule)effectiveSchedule
{
  return self->_effectiveSchedule;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (NSMutableArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_effectiveSchedule, 0);
  objc_storeStrong((id *)&self->_referenceDate, 0);
}

@end
