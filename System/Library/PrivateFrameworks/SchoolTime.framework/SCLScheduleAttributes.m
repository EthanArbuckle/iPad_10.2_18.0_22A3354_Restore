@implementation SCLScheduleAttributes

- (SCLScheduleAttributes)initWithSchedule:(id)a3
{
  return -[SCLScheduleAttributes initWithSchedule:options:](self, "initWithSchedule:options:", a3, 3);
}

- (SCLScheduleAttributes)initWithSchedule:(id)a3 options:(unint64_t)a4
{
  id v6;
  SCLScheduleAttributes *v7;
  uint64_t v8;
  SCLSchedule *schedule;
  void *v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SCLScheduleAttributes;
  v7 = -[SCLScheduleAttributes init](&v12, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    schedule = v7->_schedule;
    v7->_schedule = (SCLSchedule *)v8;

    v7->_validationOptions = a4;
    objc_msgSend(v6, "recurrences");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCLScheduleAttributes _prepareWithRecurrences:](v7, "_prepareWithRecurrences:", v10);

  }
  return v7;
}

- (void)_prepareWithRecurrences:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  NSError *v15;
  NSError *validationError;
  char v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t i;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[4];
  id v34;
  SCLScheduleAttributes *v35;
  id v36;
  id v37;
  id v38;
  uint64_t *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v45 = 0;
  v46 = &v45;
  v47 = 0x2020000000;
  v48 = 0;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 0;
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __49__SCLScheduleAttributes__prepareWithRecurrences___block_invoke;
  v33[3] = &unk_24E29C200;
  v39 = &v41;
  v8 = v7;
  v34 = v8;
  v35 = self;
  v40 = &v45;
  v9 = v6;
  v36 = v9;
  v10 = v4;
  v37 = v10;
  v11 = v5;
  v38 = v11;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v33);
  self->_scheduledDays = v42[3];
  v12 = v46[3];
  self->_valid = v12 == 0;
  if (v12)
  {
    v13 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v13, "setObject:forKeyedSubscript:", CFSTR("Recurrence validation failed."), *MEMORY[0x24BDD0FC8]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v46[3]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("FailedValidations"));

    if (objc_msgSend(v11, "count"))
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v11, CFSTR("OverlappingRecurrences"));
    if (objc_msgSend(v9, "count"))
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v9, CFSTR("CrossDayBoundaryRecurrences"));
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.schooltime"), 3, v13);
    v15 = (NSError *)objc_claimAutoreleasedReturnValue();
    validationError = self->_validationError;
    self->_validationError = v15;

  }
  else
  {
    v17 = objc_msgSend(v8, "count") != 0;
    objc_msgSend(v8, "objectEnumerator");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "nextObject");
    v13 = (id)objc_claimAutoreleasedReturnValue();

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    objc_msgSend(v8, "objectEnumerator");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v49, 16);
    v25 = v11;
    v26 = v9;
    v27 = v8;
    v28 = v10;
    if (v20)
    {
      v21 = *(_QWORD *)v30;
      v22 = 1;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v30 != v21)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          v22 &= objc_msgSend(v24, "isEqual:", v13, v25, v26, v27, v28);
          v17 &= (unint64_t)objc_msgSend(v24, "count") < 2;
        }
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v49, 16);
      }
      while (v20);
    }
    else
    {
      LOBYTE(v22) = 1;
    }

    v8 = v27;
    v10 = v28;
    v11 = v25;
    v9 = v26;
    self->_hasUniformIntervals = v22;
    self->_hasSingleIntervalPerDay = v17;
  }

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v45, 8);

}

void __49__SCLScheduleAttributes__prepareWithRecurrences___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;

  v11 = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) |= SCLRepeatScheduleForDay(objc_msgSend(v11, "day"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v11, "day"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v4, v3);
  }
  objc_msgSend(v11, "timeInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  if ((*(_BYTE *)(*(_QWORD *)(a1 + 40) + 24) & 2) != 0)
  {
    objc_msgSend(v11, "timeInterval");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "crossesDayBoundary");

    if (v7)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) |= 2uLL;
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v11);
    }
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 40) + 24) & 1) != 0)
  {
    v8 = *(void **)(a1 + 56);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __49__SCLScheduleAttributes__prepareWithRecurrences___block_invoke_2;
    v12[3] = &unk_24E29C1D8;
    v9 = v11;
    v10 = *(_QWORD *)(a1 + 80);
    v13 = v9;
    v15 = v10;
    v14 = *(id *)(a1 + 64);
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v12);

  }
}

void __49__SCLScheduleAttributes__prepareWithRecurrences___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  int v5;
  id v6;

  v3 = a2;
  v4 = *(id *)(a1 + 32);
  if (v4 != v3)
  {
    v6 = v3;
    v5 = objc_msgSend(v4, "intersectsRecurrence:", v3);
    v3 = v6;
    if (v5)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) |= 1uLL;
      objc_msgSend(*(id *)(a1 + 40), "addObject:", *(_QWORD *)(a1 + 32));
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
      v3 = v6;
    }
  }

}

- (SCLSchedule)schedule
{
  return self->_schedule;
}

- (unint64_t)validationOptions
{
  return self->_validationOptions;
}

- (BOOL)isValid
{
  return self->_valid;
}

- (NSError)validationError
{
  return self->_validationError;
}

- (int64_t)scheduledDays
{
  return self->_scheduledDays;
}

- (BOOL)hasUniformIntervals
{
  return self->_hasUniformIntervals;
}

- (BOOL)hasSingleIntervalPerDay
{
  return self->_hasSingleIntervalPerDay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validationError, 0);
  objc_storeStrong((id *)&self->_schedule, 0);
}

@end
