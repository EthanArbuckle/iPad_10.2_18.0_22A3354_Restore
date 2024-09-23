@implementation _UICalendarViewDataSourceController

- (_UICalendarViewDataSourceController)initWithCalendar:(id)a3 dataSource:(id)a4
{
  id v7;
  id v8;
  _UICalendarViewDataSourceController *v9;
  _UICalendarViewDataSourceController *v10;
  _UIDatePickerCalendarMonthSet *v11;
  _UIDatePickerCalendarMonthSet *loadedMonthSet;
  _UIDatePickerCalendarDaySet *v13;
  _UIDatePickerCalendarDaySet *loadedDaySet;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_UICalendarViewDataSourceController;
  v9 = -[_UICalendarViewDataSourceController init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_calendar, a3);
    objc_storeStrong((id *)&v10->_dataSource, a4);
    v11 = -[_UIDatePickerCalendarMonthSet initWithCalendar:rangeLength:]([_UIDatePickerCalendarMonthSet alloc], "initWithCalendar:rangeLength:", v7, 7);
    loadedMonthSet = v10->_loadedMonthSet;
    v10->_loadedMonthSet = v11;

    v13 = -[_UIDatePickerCalendarDaySet initWithCalendar:]([_UIDatePickerCalendarDaySet alloc], "initWithCalendar:", v7);
    loadedDaySet = v10->_loadedDaySet;
    v10->_loadedDaySet = v13;

  }
  return v10;
}

- (void)_reloadDataSourceWithScrollPosition:(id)a3
{
  _UIDatePickerCalendarDaySet *loadedDaySet;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[_UIDatePickerCalendarMonthSet reloadWithMonthsAroundMonth:](self->_loadedMonthSet, "reloadWithMonthsAroundMonth:", a3);
  loadedDaySet = self->_loadedDaySet;
  -[_UIDatePickerCalendarMonthSet loadedMonths](self->_loadedMonthSet, "loadedMonths");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerCalendarDaySet cleanupDaysKeepingDaysForMonths:](loadedDaySet, "cleanupDaysKeepingDaysForMonths:", v5);

  v6 = (void *)objc_opt_new();
  -[_UIDatePickerCalendarMonthSet loadedMonths](self->_loadedMonthSet, "loadedMonths");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendSectionsWithIdentifiers:", v7);

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[_UIDatePickerCalendarMonthSet loadedMonths](self->_loadedMonthSet, "loadedMonths", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[_UIDatePickerCalendarDaySet daysForMonth:includingOverlapDays:](self->_loadedDaySet, "daysForMonth:includingOverlapDays:", v13, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v14, v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  -[UICollectionViewDiffableDataSource applySnapshotUsingReloadData:](self->_dataSource, "applySnapshotUsingReloadData:", v6);
}

- (int64_t)cleanupDataSourceWithScrollPositionIfNecessary:(id)a3
{
  _UIDatePickerCalendarMonthSet *loadedMonthSet;
  id v6;
  uint64_t v7;
  unint64_t v8;
  void *v10;

  loadedMonthSet = self->_loadedMonthSet;
  v6 = a3;
  v7 = -[_UIDatePickerCalendarMonthSet indexOfMonth:](loadedMonthSet, "indexOfMonth:", v6);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICalendarViewDataSourceController.m"), 69, CFSTR("Cleaning up the data source around a month that is not loaded."));

  }
  -[_UICalendarViewDataSourceController _reloadDataSourceWithScrollPosition:](self, "_reloadDataSourceWithScrollPosition:", v6);
  v8 = -[_UIDatePickerCalendarMonthSet indexOfMonth:](self->_loadedMonthSet, "indexOfMonth:", v6);

  return v8 - v7;
}

- (int64_t)prepareDataSourceWithScrollPositionIfNecessary:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  int64_t v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v21 = 0;
  v22 = 0;
  -[_UIDatePickerCalendarMonthSet insertMonthsAroundMonth:loadedIndexRange:](self->_loadedMonthSet, "insertMonthsAroundMonth:loadedIndexRange:", a3, &v21);
  if (!v22)
    return 0;
  -[UICollectionViewDiffableDataSource snapshot](self->_dataSource, "snapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerCalendarMonthSet loadedMonths](self->_loadedMonthSet, "loadedMonths");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subarrayWithRange:", v21, v22);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", v21 - 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "insertSectionsWithIdentifiers:afterSectionWithIdentifier:", v6, v7);
  }
  else
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", v22);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "insertSectionsWithIdentifiers:beforeSectionWithIdentifier:", v6, v7);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
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
        -[_UIDatePickerCalendarDaySet daysForMonth:includingOverlapDays:](self->_loadedDaySet, "daysForMonth:includingOverlapDays:", v14, 1, (_QWORD)v17);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v15, v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v11);
  }

  -[UICollectionViewDiffableDataSource applySnapshotUsingReloadData:](self->_dataSource, "applySnapshotUsingReloadData:", v4);
  if (v21)
    v8 = 0;
  else
    v8 = v22;

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadedDaySet, 0);
  objc_storeStrong((id *)&self->_loadedMonthSet, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
}

- (id)_loadedMonths
{
  return -[_UIDatePickerCalendarMonthSet loadedMonths](self->_loadedMonthSet, "loadedMonths");
}

- (id)_loadedDays
{
  return -[_UIDatePickerCalendarDaySet loadedDays](self->_loadedDaySet, "loadedDays");
}

@end
