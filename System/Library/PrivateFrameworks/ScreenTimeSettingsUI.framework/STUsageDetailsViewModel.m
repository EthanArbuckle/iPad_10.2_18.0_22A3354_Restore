@implementation STUsageDetailsViewModel

- (STUsageDetailsViewModel)init
{
  STUsageDetailsViewModel *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STUsageDetailsViewModel;
  result = -[STUsageDetailsViewModel init](&v3, sel_init);
  result->_selectedWeek = 0;
  result->_selectedDay = 0x7FFFFFFFFFFFFFFFLL;
  return result;
}

- (void)setSelectedWeek:(unint64_t)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSString *selectedItemDisplayName;
  int v15;
  NSString *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  unint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[STUsageDetailsViewModel weekUsageReports](self, "weekUsageReports");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && objc_msgSend(v5, "count") <= a3)
  {
    +[STUILog usage](STUILog, "usage");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      selectedItemDisplayName = self->_selectedItemDisplayName;
      v15 = 138543874;
      v16 = selectedItemDisplayName;
      v17 = 2048;
      v18 = objc_msgSend(v6, "count");
      v19 = 2048;
      v20 = a3;
      _os_log_fault_impl(&dword_219AB4000, v7, OS_LOG_TYPE_FAULT, "STUsageDetailsViewModel: selectedWeek out of range, will reset for device: %{public}@, week usage report count: %lu, selectedWeek: %lus", (uint8_t *)&v15, 0x20u);
    }

    a3 = 0;
  }
  v8 = -[STUsageDetailsViewModel selectedDay](self, "selectedDay");
  v9 = v8;
  if (!a3 && v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[STUsageDetailsViewModel dayUsageReportByWeekdays](self, "dayUsageReportByWeekdays");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
      v9 = -[STUsageDetailsViewModel _mostRecentAvailableWeekday](self, "_mostRecentAvailableWeekday");
  }
  -[STUsageDetailsViewModel setSelectedWeek:selectedDay:](self, "setSelectedWeek:selectedDay:", a3, v9);

}

- (void)setSelectedDay:(unint64_t)a3
{
  -[STUsageDetailsViewModel setSelectedWeek:selectedDay:](self, "setSelectedWeek:selectedDay:", -[STUsageDetailsViewModel selectedWeek](self, "selectedWeek"), a3);
}

- (void)selectToday
{
  -[STUsageDetailsViewModel setSelectedWeek:selectedDay:](self, "setSelectedWeek:selectedDay:", 0, -[STUsageDetailsViewModel _mostRecentAvailableWeekday](self, "_mostRecentAvailableWeekday"));
}

- (unint64_t)_mostRecentAvailableWeekday
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;

  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  v5 = objc_msgSend(v3, "component:fromDate:", 512, v4);
  -[STUsageDetailsViewModel dayUsageReportByWeekdays](self, "dayUsageReportByWeekdays");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend(v3, "dateByAddingUnit:value:toDate:options:", 16, -1, v4, 512);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v3, "component:fromDate:", 512, v10);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
        goto LABEL_5;
    }
  }
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_5:
    +[STUILog usage](STUILog, "usage");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[STUsageDetailsViewModel _mostRecentAvailableWeekday].cold.1();

    v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (void)setSelectedWeek:(unint64_t)a3 selectedDay:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[7];

  self->_selectedWeek = a3;
  self->_selectedDay = a4;
  -[STUsageDetailsViewModel weekUsageReports](self, "weekUsageReports");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v10, "objectAtIndexedSubscript:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[STUsageDetailsViewModel setSelectedWeekUsageReport:](self, "setSelectedWeekUsageReport:", v7);

  }
  -[STUsageDetailsViewModel dayUsageReportByWeekdays](self, "dayUsageReportByWeekdays", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (a4 == 0x7FFFFFFFFFFFFFFFLL || !v8)
  {
    -[STUsageDetailsViewModel setSelectedDayUsageReport:](self, "setSelectedDayUsageReport:", 0);
  }
  else
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __55__STUsageDetailsViewModel_setSelectedWeek_selectedDay___block_invoke;
    v12[3] = &unk_24DB88178;
    v12[4] = self;
    v12[5] = a3;
    v12[6] = a4;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v12);
  }

}

void __55__STUsageDetailsViewModel_setSelectedWeek_selectedDay___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;

  if (*(_QWORD *)(a1 + 40) == a3)
  {
    v4 = (void *)MEMORY[0x24BDD16E0];
    v5 = *(_QWORD *)(a1 + 48);
    v6 = a2;
    objc_msgSend(v4, "numberWithUnsignedInteger:", v5);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "setSelectedDayUsageReport:", v7);
  }
}

- (void)setWeekReportUsageItems:(id)a3 weekStartDate:(id)a4 lastUpdatedDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  STUsageReport *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[STUsageDetailsViewModel setRawUsageItems:](self, "setRawUsageItems:", v10);
  -[STUsageDetailsViewModel setLastUpdatedDate:](self, "setLastUpdatedDate:", v8);
  v11 = -[STUsageReport initWithReportType:startDate:lastUpdatedDate:firstPickup:usageItems:]([STUsageReport alloc], "initWithReportType:startDate:lastUpdatedDate:firstPickup:usageItems:", 0, v9, v8, 0, v10);

  -[STUsageDetailsViewModel setSelectedWeekUsageReport:](self, "setSelectedWeekUsageReport:", v11);
  v13[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUsageDetailsViewModel setWeekUsageReports:](self, "setWeekUsageReports:", v12);

}

+ (id)keyPathsForValuesAffectingSelectedUsageReport
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", CFSTR("selectedWeekUsageReport"), CFSTR("selectedDayUsageReport"), 0);
}

- (STUsageReport)selectedUsageReport
{
  void *v3;
  void *v4;
  id v5;

  -[STUsageDetailsViewModel selectedDayUsageReport](self, "selectedDayUsageReport");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[STUsageDetailsViewModel selectedDay](self, "selectedDay") == 0x7FFFFFFFFFFFFFFFLL || v3)
  {
    if (v3)
    {
      v5 = v3;
    }
    else
    {
      -[STUsageDetailsViewModel selectedWeekUsageReport](self, "selectedWeekUsageReport");
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    v4 = v5;
  }
  else
  {
    v4 = 0;
  }

  return (STUsageReport *)v4;
}

+ (id)keyPathsForValuesAffectingHasUsageData
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", CFSTR("weekUsageReports"), CFSTR("selectedWeekUsageReport"), 0);
}

- (BOOL)hasUsageData
{
  void *v3;
  double v4;
  void *v5;
  BOOL v6;
  void *v7;
  BOOL v8;
  void *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  BOOL v15;

  -[STUsageDetailsViewModel selectedWeekUsageReport](self, "selectedWeekUsageReport");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  objc_msgSend(v3, "totalScreenTime");
  if (v4 > 0.0)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(v3, "appAndWebUsages");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      v6 = 1;
    }
    else
    {
      objc_msgSend(v3, "categoryUsages");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v7, "count") != 0;

    }
  }
  v15 = v6;
  if (*((_BYTE *)v13 + 24))
  {
    v8 = 1;
  }
  else
  {
    -[STUsageDetailsViewModel weekUsageReports](self, "weekUsageReports");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __39__STUsageDetailsViewModel_hasUsageData__block_invoke;
    v11[3] = &unk_24DB881A0;
    v11[4] = &v12;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v11);

    v8 = *((_BYTE *)v13 + 24) != 0;
  }
  _Block_object_dispose(&v12, 8);

  return v8;
}

void __39__STUsageDetailsViewModel_hasUsageData__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  double v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  objc_msgSend(v14, "totalScreenTime");
  if (v6 > 0.0)
  {
    v10 = *(_QWORD *)(a1 + 32);
    v8 = a1 + 32;
    *(_BYTE *)(*(_QWORD *)(v10 + 8) + 24) = 1;
  }
  else
  {
    objc_msgSend(v14, "appAndWebUsages");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v8 = a1 + 32;
      *(_BYTE *)(*(_QWORD *)(v9 + 8) + 24) = 1;
    }
    else
    {
      objc_msgSend(v14, "categoryUsages");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count") != 0;
      v13 = *(_QWORD *)(a1 + 32);
      v8 = a1 + 32;
      *(_BYTE *)(*(_QWORD *)(v13 + 8) + 24) = v12;

    }
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)v8 + 8) + 24))
    *a4 = 1;

}

+ (void)_enumerateWeeklyReportStartDatesWithReferenceDate:(id)a3 ascending:(BOOL)a4 block:(id)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;

  v5 = a4;
  v7 = a5;
  v8 = (void *)MEMORY[0x24BDBCE48];
  v9 = a3;
  objc_msgSend(v8, "currentCalendar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "firstWeekday");
  objc_msgSend(v10, "startOfDayForDate:", v9);
  v19 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "component:fromDate:", 512, v19) == v11)
  {
    v12 = v19;
  }
  else
  {
    objc_msgSend(v10, "nextDateAfterDate:matchingUnit:value:options:", v19, 512, v11, 260);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD15E0]), "initWithIndexesInRange:", 0, 4);
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  if (v5)
    v15 = 2;
  else
    v15 = 0;
  v20[2] = __93__STUsageDetailsViewModel__enumerateWeeklyReportStartDatesWithReferenceDate_ascending_block___block_invoke;
  v20[3] = &unk_24DB881C8;
  v21 = v10;
  v22 = v13;
  v23 = v7;
  v16 = v7;
  v17 = v13;
  v18 = v10;
  objc_msgSend(v14, "enumerateIndexesWithOptions:usingBlock:", v15, v20);

}

void __93__STUsageDetailsViewModel__enumerateWeeklyReportStartDatesWithReferenceDate_ascending_block___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "dateByAddingUnit:value:toDate:options:", 0x2000, -a2, *(_QWORD *)(a1 + 40), 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

+ (void)_enumerateDayReportStartDatesWithStartOfWeek:(id)a3 ascending:(BOOL)a4 block:(id)a5
{
  _BOOL4 v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  uint64_t v22;

  v6 = a4;
  v7 = a3;
  v8 = a5;
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "firstWeekday");
  v11 = objc_msgSend(v9, "maximumRangeOfUnit:", 512);
  v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD15E0]), "initWithIndexesInRange:", v11, v12);
  v18[0] = MEMORY[0x24BDAC760];
  if (v6)
    v13 = 0;
  else
    v13 = 2;
  v18[1] = 3221225472;
  v18[2] = __88__STUsageDetailsViewModel__enumerateDayReportStartDatesWithStartOfWeek_ascending_block___block_invoke;
  v18[3] = &unk_24DB881F0;
  v19 = v7;
  v20 = v9;
  v21 = v8;
  v22 = v10;
  v14 = v8;
  v15 = v9;
  v16 = v7;
  objc_msgSend(v17, "enumerateIndexesWithOptions:usingBlock:", v13, v18);

}

void __88__STUsageDetailsViewModel__enumerateDayReportStartDatesWithStartOfWeek_ascending_block___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;
  id v4;

  if (*(_QWORD *)(a1 + 56) == a2)
  {
    v3 = *(id *)(a1 + 32);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "nextDateAfterDate:matchingUnit:value:options:", *(_QWORD *)(a1 + 32), 512, a2, 256);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (unint64_t)selectedWeek
{
  return self->_selectedWeek;
}

- (STUsageReport)selectedWeekUsageReport
{
  return (STUsageReport *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSelectedWeekUsageReport:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSArray)weekUsageReports
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setWeekUsageReports:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (unint64_t)selectedDay
{
  return self->_selectedDay;
}

- (STUsageReport)selectedDayUsageReport
{
  return (STUsageReport *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSelectedDayUsageReport:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSArray)dayUsageReportByWeekdays
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDayUsageReportByWeekdays:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (BOOL)isLocalDevice
{
  return self->_localDevice;
}

- (void)setLocalDevice:(BOOL)a3
{
  self->_localDevice = a3;
}

- (NSString)selectedItemDisplayName
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSelectedItemDisplayName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (NSString)selectedCoreDuetIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSelectedCoreDuetIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (NSDate)lastUpdatedDate
{
  return (NSDate *)objc_getProperty(self, a2, 80, 1);
}

- (void)setLastUpdatedDate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (BOOL)hasDeviceActivityData
{
  return self->_hasDeviceActivityData;
}

- (void)setHasDeviceActivityData:(BOOL)a3
{
  self->_hasDeviceActivityData = a3;
}

- (BOOL)hasAggregateUsageData
{
  return self->_hasAggregateUsageData;
}

- (void)setHasAggregateUsageData:(BOOL)a3
{
  self->_hasAggregateUsageData = a3;
}

- (NSArray)rawUsageItems
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)setRawUsageItems:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawUsageItems, 0);
  objc_storeStrong((id *)&self->_lastUpdatedDate, 0);
  objc_storeStrong((id *)&self->_selectedCoreDuetIdentifier, 0);
  objc_storeStrong((id *)&self->_selectedItemDisplayName, 0);
  objc_storeStrong((id *)&self->_dayUsageReportByWeekdays, 0);
  objc_storeStrong((id *)&self->_selectedDayUsageReport, 0);
  objc_storeStrong((id *)&self->_weekUsageReports, 0);
  objc_storeStrong((id *)&self->_selectedWeekUsageReport, 0);
}

- (void)_mostRecentAvailableWeekday
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_219AB4000, v0, v1, "Usage data has been loaded with no daily reports for today or yesterday: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
