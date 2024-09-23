@implementation _UIDatePickerCalendarDaySet

- (_UIDatePickerCalendarDaySet)initWithCalendar:(id)a3
{
  id v5;
  _UIDatePickerCalendarDaySet *v6;
  _UIDatePickerCalendarDaySet *v7;
  uint64_t v8;
  NSMutableDictionary *loadedDays;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UIDatePickerCalendarDaySet;
  v6 = -[_UIDatePickerCalendarDaySet init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_calendar, a3);
    v8 = objc_opt_new();
    loadedDays = v7->_loadedDays;
    v7->_loadedDays = (NSMutableDictionary *)v8;

  }
  return v7;
}

- (id)_createDaysForMonth:(id)a3
{
  id v5;
  NSCalendar *v6;
  void *v7;
  BOOL v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v23;
  void *v24;
  SEL v25;
  _UIDatePickerCalendarDaySet *v26;
  id v27;
  double v28;

  v5 = a3;
  v6 = self->_calendar;
  objc_msgSend(v5, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v28 = 0.0;
  v8 = -[NSCalendar rangeOfUnit:startDate:interval:forDate:](v6, "rangeOfUnit:startDate:interval:forDate:", 8, &v27, &v28, v7);
  v9 = v27;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDatePickerCalendarDaySet.m"), 54, CFSTR("Unable to find calendar range for date %@"), v7);

  }
  v25 = a2;
  v26 = self;
  objc_msgSend(v9, "dateByAddingTimeInterval:", v28);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_opt_new();
  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "setDay:", 0);
  v13 = v9;
  v14 = v13;
  if (v13)
  {
    v15 = v13;
    do
    {
      if (objc_msgSend(v15, "compare:", v10) != -1)
        break;
      objc_msgSend(v5, "dayWithDate:assignedMonth:", v15, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v16);
      objc_msgSend(v12, "setDay:", objc_msgSend(v12, "day") + 1);
      -[NSCalendar dateByAddingComponents:toDate:options:](v6, "dateByAddingComponents:toDate:options:", v12, v14, 0);
      v17 = objc_claimAutoreleasedReturnValue();

      v15 = (void *)v17;
    }
    while (v17);

  }
  v18 = objc_msgSend(v11, "count");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");

  if (v18 != v20)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", v25, v26, CFSTR("_UIDatePickerCalendarDaySet.m"), 71, CFSTR("Invalid date calculation. Duplicate days found in days for month %@."), v5);

  }
  v21 = (void *)objc_msgSend(v11, "copy");

  return v21;
}

- (id)_partialDaysForMonth:(id)a3 atBeginningOfMonth:(BOOL)a4 count:(unint64_t)a5
{
  id v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;

  v8 = a3;
  -[_UIDatePickerCalendarDaySet daysForMonth:includingOverlapDays:](self, "daysForMonth:includingOverlapDays:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");
  if (a4)
  {
    if (v10 < a5)
    {
      do
      {
        v11 = v9;
        v12 = v8;
        objc_msgSend(v8, "nextMonth");
        v8 = (id)objc_claimAutoreleasedReturnValue();

        -[_UIDatePickerCalendarDaySet daysForMonth:includingOverlapDays:](self, "daysForMonth:includingOverlapDays:", v8, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "arrayByAddingObjectsFromArray:", v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

      }
      while (objc_msgSend(v9, "count") < a5);
    }
    v14 = 0;
  }
  else
  {
    if (v10 >= a5)
    {
      v17 = v9;
      v15 = (uint64_t)v8;
    }
    else
    {
      do
      {
        objc_msgSend(v8, "previousMonth");
        v15 = objc_claimAutoreleasedReturnValue();

        -[_UIDatePickerCalendarDaySet daysForMonth:includingOverlapDays:](self, "daysForMonth:includingOverlapDays:", v15, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "arrayByAddingObjectsFromArray:", v9);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v8 = (id)v15;
        v9 = v17;
      }
      while (objc_msgSend(v17, "count") < a5);
    }
    v14 = objc_msgSend(v17, "count") - a5;
    v9 = v17;
    v8 = (id)v15;
  }
  objc_msgSend(v9, "subarrayWithRange:", v14, a5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)daysForMonth:(id)a3 includingOverlapDays:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSCalendar *calendar;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  unint64_t v35;
  void *v36;
  void *v37;
  unint64_t v38;
  void *v40;
  void *v41;
  void *v42;
  SEL v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  double v49;
  id v50;

  v4 = a4;
  v7 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_loadedDays, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (!v4)
      goto LABEL_18;
  }
  else
  {
    -[_UIDatePickerCalendarDaySet _createDaysForMonth:](self, "_createDaysForMonth:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_loadedDays, "setObject:forKeyedSubscript:", v8, v7);
    if (!v4)
      goto LABEL_18;
  }
  objc_msgSend(v8, "firstObject");
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v9, "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  calendar = self->_calendar;
  v50 = 0;
  LOBYTE(v9) = -[NSCalendar rangeOfUnit:startDate:interval:forDate:](calendar, "rangeOfUnit:startDate:interval:forDate:", 4096, &v50, 0, v10);
  v12 = v50;
  if ((v9 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDatePickerCalendarDaySet.m"), 139, CFSTR("Unable to find the beginning of the week for date %@."), v10);

  }
  v47 = v10;
  v13 = _UIDatePickerNumberOfDaysBetweenDates(self->_calendar, (uint64_t)v12, v10);
  if (v13 < 1)
  {
    v16 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v14 = v13;
    objc_msgSend(v7, "previousMonth");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDatePickerCalendarDaySet _partialDaysForMonth:atBeginningOfMonth:count:](self, "_partialDaysForMonth:atBeginningOfMonth:count:", v15, 0, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v8, "lastObject");
  v17 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v17, "date");
  v18 = objc_claimAutoreleasedReturnValue();

  v48 = 0;
  v49 = 0.0;
  LOBYTE(v17) = -[NSCalendar rangeOfUnit:startDate:interval:forDate:](self->_calendar, "rangeOfUnit:startDate:interval:forDate:", 4096, &v48, &v49, v18);
  v19 = v48;
  if ((v17 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDatePickerCalendarDaySet.m"), 147, CFSTR("Unable to find the beginning of the week for date %@."), v18);

  }
  objc_msgSend(v19, "dateByAddingTimeInterval:", v49 + -1.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (void *)v18;
  v21 = _UIDatePickerNumberOfDaysBetweenDates(self->_calendar, v18, v20);
  v43 = a2;
  v44 = v19;
  v46 = v12;
  if (v21 < 1)
  {
    v24 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v22 = v21;
    objc_msgSend(v7, "nextMonth");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDatePickerCalendarDaySet _partialDaysForMonth:atBeginningOfMonth:count:](self, "_partialDaysForMonth:atBeginningOfMonth:count:", v23, 1, v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

  }
  _daysAssignedToMonth(v16, v7);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  _daysAssignedToMonth(v24, v7);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  _joinedArrayFromArrays((uint64_t)v26, v27, v28, v29, v30, v31, v32, v33, (uint64_t)v25);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = objc_msgSend(v34, "count");
  -[NSCalendar weekdaySymbols](self->_calendar, "weekdaySymbols");
  v36 = v16;
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v35 % objc_msgSend(v37, "count");

  if (v38)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", v43, self, CFSTR("_UIDatePickerCalendarDaySet.m"), 156, CFSTR("Invalid calculation: number of calculated days is not dividable by the number of days in a week."));

  }
  v8 = v34;
LABEL_18:

  return v8;
}

- (void)cleanupDaysKeepingDaysForMonths:(id)a3
{
  id v4;
  NSMutableDictionary *loadedDays;
  id v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  NSMutableDictionary *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  loadedDays = self->_loadedDays;
  v6 = v4;
  v7 = loadedDays;
  v8 = (NSMutableDictionary *)objc_opt_new();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](v7, "objectForKey:", v14, (_QWORD)v17);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
          -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v15, v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  v16 = self->_loadedDays;
  self->_loadedDays = v8;

}

- (id)loadedDays
{
  return (id)-[NSMutableDictionary copy](self->_loadedDays, "copy");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadedDays, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
}

@end
